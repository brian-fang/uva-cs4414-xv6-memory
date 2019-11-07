#include "types.h"
#include "fcntl.h"
#include "stat.h"
#include "user.h"

#define PASS_MSG "TEST:PASS:"
#define FAIL_MSG "TEST:FAIL:"

#define MAX_CHILDREN 16

void test_simple_crash_no_fork(void (*test_func)(), const char *no_crash_message) {
    test_func();
    printf(1, "%s\n", no_crash_message);
}
      
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
    int fds[2];
    pipe(fds);
    int pid = fork();
    if (pid == 0) {
        /* child process */
        close(1);
        dup(fds[1]);
        test_func();
        write(1, "X", 1);
        exit();
    } else {
        char text[1] = {'Q'};
        close(fds[1]);
        int size = read(fds[0], text, 1);
        wait();
        close(fds[0]);
        if (size == 1) {
            printf(1, "%s\n", no_crash_message);
            return 0;
        } else {
            printf(1, "%s\n", crash_message);
            return 1;
        }
    }
}

static unsigned out_of_bounds_offset = 1;
void test_out_of_bounds_internal() {
    volatile char *end_of_heap = sbrk(0);
    (void) end_of_heap[out_of_bounds_offset];
}

int test_out_of_bounds_fork(int offset, const char *crash_message, const char *no_crash_message) {
    out_of_bounds_offset = offset;
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
}

void test_out_of_bounds_no_fork(int offset, const char *no_crash_message) {
    out_of_bounds_offset = offset;
    test_simple_crash_no_fork(test_out_of_bounds_internal, no_crash_message);
}

int test_allocation_no_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
    char *old_end_of_heap = sbrk(size);
    char *new_end_of_heap = sbrk(0);
    if (old_end_of_heap == (char*) -1) {
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
        return 0;
    } else if (new_end_of_heap - old_end_of_heap != size) {
        printf(1, FAIL_MSG "HEAP_SIZE\n");
        return 0;
    } else {
        int failed = 0;
        char *place_one = &old_end_of_heap[offset1];
        char *place_two = &old_end_of_heap[offset2];
        int i;
        for (i = 0; i < count1; ++i) {
            if (check_zero && place_one[i] != '\0') {
                failed = 1;
            }
            place_one[i] = 'A';
        }
        for (i = 0; i < count2; ++i) {
            if (check_zero && place_two[i] != '\0') {
                failed = 1;
            }
            place_two[i] = 'B';
        }
        for (i = 0; i < count1; ++i) {
            if (place_one[i] != 'A')
                failed = 1;
        } 
        for (i = 0; i < count2; ++i) {
            if (place_two[i] != 'B')
                failed = 1;
        }
        if (failed) {
            printf(1, FAIL_MSG "HEAP_VALUES\n");
            return 0;
        } else {
            printf(1, PASS_MSG "\n");
            return 1;
        }
    }
}

int test_allocation_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2) {
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
    int fds[2];
    pipe(fds);
    int pid = fork();
    if (pid == 0) {
        /* child process */
        char *old_end_of_heap = sbrk(size);
        char *new_end_of_heap = sbrk(0);
        if (old_end_of_heap == (char*) -1) {
            write(fds[1], "NA", 2);
        } else if (new_end_of_heap - old_end_of_heap != size) {
            write(fds[1], "NS", 2);
        } else {
            int failed = 0;
            char failed_text[2] = "NR";
            char *place_one = &old_end_of_heap[offset1];
            char *place_two = &old_end_of_heap[offset2];
            int i;
            for (i = 0; i < count1; ++i) {
                if (place_one[i] != 0) {
                    failed_text[1] = 'I';
                    failed = 1;
                }
                place_one[i] = 'A';
            }
            for (i = 0; i < count2; ++i) {
                if (place_two[i] != 0) {
                    failed_text[1] = 'I';
                    failed = 1;
                }
                place_two[i] = 'B';
            }
            for (i = 0; i < count1; ++i) {
                if (place_one[i] != 'A')
                    failed = 1;
            } 
            for (i = 0; i < count2; ++i) {
                if (place_two[i] != 'B')
                    failed = 1;
            }
            write(fds[1], failed ? failed_text : "YY", 2);
        }
        exit();
    } else if (pid > 0) {
        char text[10];
        close(fds[1]);
        int size = read(fds[0], text, 10);
        wait();
        close(fds[0]);
        if (size == 2 && text[0] == 'N') {
            if (text[1] == 'A') {
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
            } else if (text[1] == 'I') {
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
            } else if (text[1] == 'R') {
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
            } else if (text[1] == 'S') {
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
            } else {
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
            }
            return 0;
        } else if (size == 0) {
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
            return 0;
        } else if (size >= 1 && text[0] == 'Y') {
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
            return 1;
        } else {
            printf(1, FAIL_MSG "unknown error\n");
            return 0;
        }
    } else {
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
        return 0;
    }
}

void wait_forever() {
  while (1) { sleep(1000); }
}

void test_copy_on_write_main_child(int result_fd, int size, const char *describe_size, int forks) {
  char *old_end_of_heap = sbrk(size);
  char *new_end_of_heap = sbrk(0);
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
      *p = 'A';
  }
  int children[MAX_CHILDREN] = {0};
  if (forks > MAX_CHILDREN) {
    printf(2, "unsupported number of children in test_copy_on_write\n");
  }
  int failed = 0;
  char failed_code = ' ';
  for (int i = 0; i < forks; ++i) {
    int child_fds[2];
    if (pipe(child_fds) < 0) {
      printf(2, "pipe failed!\n");
    }
    children[i] = fork();
    if (children[i] == -1) {
      printf(2, "fork failed\n");
      failed = 1;
      failed_code = 'f';
      break;
    } else if (children[i] == 0) {
      int found_wrong_memory = 0;
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
        if (*p != 'A') {
          found_wrong_memory = 1;
        }
      }
      int place_one = size / 2;
      old_end_of_heap[place_one] = 'B' + i;
      int place_two = 4096 * i;
      if (place_two >= size) {
          place_two = size - 1;
      }
      old_end_of_heap[place_two] = 'C';
      int place_three = 4096 * (i - 1);
      if (place_three >= size || place_three < 0) {
          place_three = size - 2;
      }
      int place_four = 4096 * (i + 1);
      if (place_four >= size) {
          place_four = size - 3;
      }
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
          old_end_of_heap[place_four] != 'A') {
          found_wrong_memory = 1;
      }
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
      wait_forever();
    } else {
      char buffer[1] = {'X'};
      read(child_fds[0], buffer, 1);
      if (buffer[0] != '+') {
        failed = 1;
        failed_code = 'c';
      }
      close(child_fds[0]); close(child_fds[1]);
    }
  }
  for (int i = 0; i < forks; ++i) {
    kill(children[i]);
    wait();
  }
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
    if (*p != 'A') {
      failed = 1;
      failed_code = 'p';
    }
  }
  if (failed) {
    char buffer[2] = {'N', ' '};
    buffer[1] = failed_code;
    write(result_fd, buffer, 2);
  } else {
    write(result_fd, "YY", 2);
  }
}

void test_copy_on_write_main_child_alt(int result_fd, int size, const char *describe_size, int forks, int early_term) {
  char *old_end_of_heap = sbrk(size);
  char *new_end_of_heap = sbrk(0);
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
      *p = 'A';
  }
  int children[MAX_CHILDREN] = {0};
  int child_fds[MAX_CHILDREN][2];
  if (forks > MAX_CHILDREN) {
    printf(2, "unsupported number of children in test_copy_on_write\n");
  }
  int failed = 0;
  char failed_code = ' ';
  for (int i = 0; i < forks; ++i) {
    sleep(1);
    if (pipe(child_fds[i]) < 0) {
        printf(2, "pipe failed!\n");
    }
    children[i] = fork();
    if (children[i] == -1) {
      close(child_fds[i][1]);
      printf(2, "fork failed\n");
      failed = 1;
      failed_code = 'f';
      break;
    } else if (children[i] == 0) {
      close(child_fds[i][0]);
      int found_wrong_memory = 0;
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
        if (*p != 'A') {
          found_wrong_memory = 1;
        }
      }
      int place_one = size / 2;
      old_end_of_heap[place_one] = 'B' + i;
      int place_two = 4096 * i;
      if (place_two >= size) {
          place_two = size - 1;
      }
      old_end_of_heap[place_two] = 'C' + i;
      int place_three = 4096 * (i - 1);
      if (place_three >= size || place_three < 0) {
          place_three = size - 2;
      }
      int place_four = 4096 * (i + 1);
      if (place_four >= size || place_four < 0) {
          place_four = size - 3;
      }
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
          old_end_of_heap[place_four] != 'A') {
          found_wrong_memory = 1;
      }
      sleep(5);
      if (old_end_of_heap[place_three] != 'A' || 
          old_end_of_heap[place_four] != 'A' ||
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
          found_wrong_memory = 1;
      }
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
      if (early_term) {
          exit();
      } else {
          wait_forever();
      }
    }
  }
  for (int i = 0; i < forks; ++i) {
    if (children[i] != -1) {
      char buffer[1] = {'X'};
      read(child_fds[i][0], buffer, 1);
      if (buffer[0] == 'X') {
        failed = 1;
        failed_code = 'P';
      } else if (buffer[0] != '+') {
        failed = 1;
        failed_code = 'c';
      }
      close(child_fds[i][0]);
    }
  }
  for (int i = 0; i < forks; ++i) {
    kill(children[i]);
    wait();
  }
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
    if (*p != 'A') {
      failed = 1;
      failed_code = 'p';
    }
  }
  if (failed) {
    char buffer[2] = {'N', ' '};
    buffer[1] = failed_code;
    write(result_fd, buffer, 2);
  } else {
    write(result_fd, "YY", 2);
  }
}

int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
  int fds[2];
  pipe(fds);
  test_copy_on_write_main_child(fds[1], size, describe_size, forks);
  char text[2] = {'X', 'X'};
  read(fds[0], text, 2);
  close(fds[0]); close(fds[1]);
  if (text[0] == 'X') {
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    return 0;
  } else if (text[0] == 'N') {
    switch (text[1]) {
    case 'f':
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
      break;
    case 'p':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
      break;
    case 'P':
      printf(1, FAIL_MSG "copy on write test failed --- pipe read problem\n");
      break;
    case 'c':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
      break;
    default:
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
      break;
    }
    return 0;
  } else {
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
           "fork %d children; read+write small parts in each child\n",
           describe_size, forks);
    return 1;
  }
}

int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
  int fds[2];
  pipe(fds);
  test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
  char text[2] = {'X', 'X'};
  read(fds[0], text, 2);
  close(fds[0]); close(fds[1]);
  if (text[0] == 'X') {
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    return 0;
  } else if (text[0] == 'N') {
    switch (text[1]) {
    case 'f':
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
      break;
    case 'p':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
      break;
    case 'c':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
      break;
    default:
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
      break;
    }
    return 0;
  } else {
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
           "fork %d children; read+write small parts in each child\n",
           describe_size, forks);
    return 1;
  }
}

int _test_copy_on_write(int size,  const char *describe_size, int forks, int use_alt, int early_term, int pre_alloc, const char* describe_prealloc) {
  int fds[2];
  pipe(fds);
  int pid = fork();
  if (pid == 0) {
    if (pre_alloc > 0) {
      sbrk(pre_alloc);
    }
    if (use_alt) {
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    } else {
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    }
    exit();
  } else if (pid > 0) {
    printf(1, "running copy on write test: ");
    if (pre_alloc > 0) {
      printf(1, "allocate but do not use %s; ", describe_prealloc);
    }
    printf(1, "allocate and use %s; fork %d children; read+write small parts in each child",
        describe_size, forks);
    if (use_alt) {
      printf(1, " [and try to keep children running in parallel]");
    }
    printf(1, "\n");
    char text[10] = {'X', 'X'};
    close(fds[1]);
    read(fds[0], text, 10);
    wait();
    close(fds[0]);
    if (text[0] == 'X') {
      printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
      return 0;
    } else if (text[0] == 'N') {
      switch (text[1]) {
      case 'f':
        printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
        break;
      case 'p':
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
        break;
      case 'c':
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
        break;
      default:
        printf(1, FAIL_MSG "copy on write test failed --- unknown reason\n");
        break;
      }
      return 0;
    } else {
      printf(1, PASS_MSG "copy on write test passed\n");
      return 1;
    }
  } else if (pid == -1) {
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
  }
  return 0;
}

int test_copy_on_write(int size, const char *describe_size, int forks) {
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
}

int test_copy_on_write_alloc_unused(int unused_size, const char *describe_unused_size, int size, const char *describe_size, int forks) {
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
}

int test_copy_on_write_alt(int size, const char *describe_size, int forks) {
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
}

int test_read_into_alloc_no_fork(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    printf(1, "testing read(), writing %d bytes to a location %s into a %s allocation\n",
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
        buffer[i] = 'X';
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
        write(fd, buffer, sizeof buffer);
    }
    close(fd);
    fd = open("tempfile", O_RDONLY);
    if (fd == -1) {
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    sbrk(size);
    char *loc = heap + offset;
    int count = read(fd, loc, read_count);
    int failed_value = 0;
    failed_value = loc[-1] != '\0';
    for (int i = 0; i < read_count; ++i) {
        if (loc[i] != 'X') {
            failed_value = 1;
        }
    }
    if (loc[read_count] != '\0') {
        failed_value = 1;
    }
    close(fd);
    unlink("tempfile");
    sbrk(-size);
    if (count != read_count) {
        printf(1, FAIL_MSG "wrong return value from read()\n");
        return 0;
    } else if (failed_value) {
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
        return 0;
    } else {
        printf(1, PASS_MSG "\n");
        return 1;
    }
}

int test_read_into_alloc(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    int pipe_fds[2];
    pipe(pipe_fds);
    int pid = fork();
    if (pid == 0) {
        close(pipe_fds[0]);
        char result_str[1] = {'N'};
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
        wait();
        return result_str[0] == 'Y';
    }
}

int test_read_into_cow_less_forks(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    printf(1, "testing read(), writing %d bytes to a location %s into a %s copy-on-write allocation\n",
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
        buffer[i] = 'X';
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
        write(fd, buffer, sizeof buffer);
    }
    close(fd);
    fd = open("tempfile", O_RDONLY);
    if (fd == -1) {
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    sbrk(size);
    for (int i = 0; i < size; ++i) {
        heap[i] = 'Y';
    }
    char *loc = heap + offset;
    int pipe_fds[2];
    pipe(pipe_fds);
    int pid = fork();
    if (pid == 0) {
        close(pipe_fds[0]);
        int count = read(fd, loc, read_count);
        int failed_value = 0;
        failed_value = loc[-1] != 'Y';
        for (int i = 0; i < read_count; ++i) {
            if (loc[i] != 'X') {
                failed_value = 1;
            }
        }
        if (loc[read_count] != 'Y') {
            failed_value = 1;
        }
        close(fd);
        unlink("tempfile");
        if (count != read_count) {
            printf(1, FAIL_MSG "wrong return value from read()\n");
            write(pipe_fds[1], "N", 1);
        } else if (failed_value) {
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
            write(pipe_fds[1], "N", 1);
        } else {
            printf(1, PASS_MSG "correct value read into copy-on-write allocation\n");
            write(pipe_fds[1], "Y", 1);
        }
        close(pipe_fds[1]);
        exit();
    } else {
        close(pipe_fds[1]);
        char result_buf[1] = {'N'};
        read(pipe_fds[0], result_buf, 1);
        close(pipe_fds[0]);
        wait();
        printf(1, "testing correct value for heap in parent after read() in child\n");
        int found_wrong = 0;
        for (int i = 0; i < size; ++i) {
            if (heap[i] != 'Y') {
                found_wrong = 1;
            }
        }
        if (found_wrong) { 
            printf(1, FAIL_MSG "wrong value in parent after read() in child\n");
        } else {
            printf(1, PASS_MSG "correct value in parent after read into copy-on-write allocation\n");
        }
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    }
}

int test_read_into_cow(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    int pipe_fds[2];
    pipe(pipe_fds);
    int pid = fork();
    if (pid == 0) {
        close(pipe_fds[0]);
        char result_str[1] = {'N'};
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
        wait();
        return result_str[0] == 'Y';
    }
}


int
main(int argc, char *argv[])
{
    int passed = 0;
    passed += test_out_of_bounds_fork(1, 
        PASS_MSG "reading immediately after heap end crashes",
        FAIL_MSG "reading immediately after heap end does NOT crash");
    passed += test_out_of_bounds_fork(1024 * 1024 * 1024 * 2U, 
        PASS_MSG "reading 2GB after heap end crashes",
        FAIL_MSG "reading 2GB after heap end does NOT crash");
    passed += test_allocation_fork(32 * 1024, "32KB", "two 4KB", 4 * 1024,  4096, 16 * 1024, 4096); 
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 8KB", 0, 8192, 256 * 1024 * 1024, 8192); 
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 32KB", 128 * 1024 * 1024, 32 * 1024, 384 * 1024 * 1024, 32 * 1024); 
    passed += test_copy_on_write(32 * 1024, "32KB", 2); 
    passed += test_copy_on_write_alt(32 * 1024, "32KB", 2); 
    passed += test_copy_on_write_alloc_unused(4 * 1024, "4KB", 32 * 1024, "32KB", 2); 
    passed += test_copy_on_write_alloc_unused(512 * 1024 * 1024, "512MB", 32 * 1024, "32KB", 2); 
    passed += test_copy_on_write(64 * 1024 * 1024, "64MB", 7); 
    passed += test_copy_on_write_alt(64 * 1024 * 1024, "64MB", 4); 
    printf(1, "running repeated copy-on-write tests to make sure "
              "memory is eventually reclaimed\n");
    for (int i = 0; i < 10; ++i) {
        passed += test_copy_on_write(100 * 1024 * 1024, "100MB", 2); 
    }
    passed += test_read_into_alloc(
        4096 * 16, 4096 * 8, 128, "128KB", "32KB"
    );
    passed += test_read_into_cow(
        4096 * 16, 4096 * 8, 128, "128KB", "32KB"
    );
    printf(1, "passed %d tests of 23\n", passed);
    exit();
}
