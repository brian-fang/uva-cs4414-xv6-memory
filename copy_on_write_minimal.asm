
_copy_on_write_minimal:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "pagingtestlib.h"

int main(void) {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
    setup();
      11:	e8 4a 00 00 00       	call   60 <setup>
    test_copy_on_write_less_forks(4096, "4096", 1);
      16:	83 ec 04             	sub    $0x4,%esp
      19:	6a 01                	push   $0x1
      1b:	68 ea 22 00 00       	push   $0x22ea
      20:	68 00 10 00 00       	push   $0x1000
      25:	e8 c6 0e 00 00       	call   ef0 <test_copy_on_write_less_forks>
    shutdown();
      2a:	e8 ab 1d 00 00       	call   1dda <shutdown>
}
      2f:	8b 4d fc             	mov    -0x4(%ebp),%ecx
      32:	31 c0                	xor    %eax,%eax
      34:	c9                   	leave  
      35:	8d 61 fc             	lea    -0x4(%ecx),%esp
      38:	c3                   	ret    
      39:	66 90                	xchg   %ax,%ax
      3b:	66 90                	xchg   %ax,%ax
      3d:	66 90                	xchg   %ax,%ax
      3f:	90                   	nop

00000040 <test_out_of_bounds_internal>:
        }
    }
}

static unsigned out_of_bounds_offset = 1;
void test_out_of_bounds_internal() {
      40:	55                   	push   %ebp
      41:	89 e5                	mov    %esp,%ebp
      43:	83 ec 14             	sub    $0x14,%esp
    volatile char *end_of_heap = sbrk(0);
      46:	6a 00                	push   $0x0
      48:	e8 6d 1d 00 00       	call   1dba <sbrk>
    (void) end_of_heap[out_of_bounds_offset];
      4d:	03 05 64 31 00 00    	add    0x3164,%eax
}
      53:	83 c4 10             	add    $0x10,%esp
    (void) end_of_heap[out_of_bounds_offset];
      56:	0f b6 00             	movzbl (%eax),%eax
}
      59:	c9                   	leave  
      5a:	c3                   	ret    
      5b:	90                   	nop
      5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <setup>:
void setup() {
      60:	55                   	push   %ebp
      61:	89 e5                	mov    %esp,%ebp
      63:	83 ec 0c             	sub    $0xc,%esp
    mknod("console", 1, 1);
      66:	6a 01                	push   $0x1
      68:	6a 01                	push   $0x1
      6a:	68 08 22 00 00       	push   $0x2208
      6f:	e8 06 1d 00 00       	call   1d7a <mknod>
    open("console", O_RDWR);
      74:	58                   	pop    %eax
      75:	5a                   	pop    %edx
      76:	6a 02                	push   $0x2
      78:	68 08 22 00 00       	push   $0x2208
      7d:	e8 f0 1c 00 00       	call   1d72 <open>
    dup(0);
      82:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      89:	e8 1c 1d 00 00       	call   1daa <dup>
    dup(0);
      8e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      95:	e8 10 1d 00 00       	call   1daa <dup>
}
      9a:	83 c4 10             	add    $0x10,%esp
      9d:	c9                   	leave  
      9e:	c3                   	ret    
      9f:	90                   	nop

000000a0 <test_simple_crash_no_fork>:
void test_simple_crash_no_fork(void (*test_func)(), const char *no_crash_message) {
      a0:	55                   	push   %ebp
      a1:	89 e5                	mov    %esp,%ebp
      a3:	83 ec 08             	sub    $0x8,%esp
    test_func();
      a6:	ff 55 08             	call   *0x8(%ebp)
    printf(1, "%s\n", no_crash_message);
      a9:	83 ec 04             	sub    $0x4,%esp
      ac:	ff 75 0c             	pushl  0xc(%ebp)
      af:	68 10 22 00 00       	push   $0x2210
      b4:	6a 01                	push   $0x1
      b6:	e8 f5 1d 00 00       	call   1eb0 <printf>
}
      bb:	83 c4 10             	add    $0x10,%esp
      be:	c9                   	leave  
      bf:	c3                   	ret    

000000c0 <test_simple_crash>:
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
      c0:	55                   	push   %ebp
      c1:	89 e5                	mov    %esp,%ebp
      c3:	53                   	push   %ebx
    pipe(fds);
      c4:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
      c7:	83 ec 20             	sub    $0x20,%esp
    pipe(fds);
      ca:	50                   	push   %eax
      cb:	e8 72 1c 00 00       	call   1d42 <pipe>
    int pid = fork();
      d0:	e8 55 1c 00 00       	call   1d2a <fork>
    if (pid == 0) {
      d5:	83 c4 10             	add    $0x10,%esp
      d8:	85 c0                	test   %eax,%eax
      da:	74 70                	je     14c <test_simple_crash+0x8c>
        close(fds[1]);
      dc:	83 ec 0c             	sub    $0xc,%esp
      df:	ff 75 f4             	pushl  -0xc(%ebp)
      e2:	e8 73 1c 00 00       	call   1d5a <close>
        int size = read(fds[0], text, 1);
      e7:	8d 45 ef             	lea    -0x11(%ebp),%eax
      ea:	83 c4 0c             	add    $0xc,%esp
      ed:	6a 01                	push   $0x1
      ef:	50                   	push   %eax
      f0:	ff 75 f0             	pushl  -0x10(%ebp)
      f3:	e8 52 1c 00 00       	call   1d4a <read>
      f8:	89 c3                	mov    %eax,%ebx
        wait();
      fa:	e8 3b 1c 00 00       	call   1d3a <wait>
        close(fds[0]);
      ff:	58                   	pop    %eax
     100:	ff 75 f0             	pushl  -0x10(%ebp)
     103:	e8 52 1c 00 00       	call   1d5a <close>
        if (size == 1) {
     108:	83 c4 10             	add    $0x10,%esp
     10b:	83 fb 01             	cmp    $0x1,%ebx
     10e:	74 20                	je     130 <test_simple_crash+0x70>
            printf(1, "%s\n", crash_message);
     110:	83 ec 04             	sub    $0x4,%esp
     113:	ff 75 0c             	pushl  0xc(%ebp)
     116:	68 10 22 00 00       	push   $0x2210
     11b:	6a 01                	push   $0x1
     11d:	e8 8e 1d 00 00       	call   1eb0 <printf>
            return 1;
     122:	83 c4 10             	add    $0x10,%esp
     125:	b8 01 00 00 00       	mov    $0x1,%eax
}
     12a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     12d:	c9                   	leave  
     12e:	c3                   	ret    
     12f:	90                   	nop
            printf(1, "%s\n", no_crash_message);
     130:	83 ec 04             	sub    $0x4,%esp
     133:	ff 75 10             	pushl  0x10(%ebp)
     136:	68 10 22 00 00       	push   $0x2210
     13b:	6a 01                	push   $0x1
     13d:	e8 6e 1d 00 00       	call   1eb0 <printf>
            return 0;
     142:	83 c4 10             	add    $0x10,%esp
     145:	31 c0                	xor    %eax,%eax
}
     147:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     14a:	c9                   	leave  
     14b:	c3                   	ret    
        close(1);
     14c:	83 ec 0c             	sub    $0xc,%esp
     14f:	6a 01                	push   $0x1
     151:	e8 04 1c 00 00       	call   1d5a <close>
        dup(fds[1]);
     156:	5a                   	pop    %edx
     157:	ff 75 f4             	pushl  -0xc(%ebp)
     15a:	e8 4b 1c 00 00       	call   1daa <dup>
        test_func();
     15f:	ff 55 08             	call   *0x8(%ebp)
        write(1, "X", 1);
     162:	83 c4 0c             	add    $0xc,%esp
     165:	6a 01                	push   $0x1
     167:	68 14 22 00 00       	push   $0x2214
     16c:	6a 01                	push   $0x1
     16e:	e8 df 1b 00 00       	call   1d52 <write>
        exit();
     173:	e8 ba 1b 00 00       	call   1d32 <exit>
     178:	90                   	nop
     179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <test_out_of_bounds_fork>:

int test_out_of_bounds_fork(int offset, const char *crash_message, const char *no_crash_message) {
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
    out_of_bounds_offset = offset;
     183:	8b 45 08             	mov    0x8(%ebp),%eax
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     186:	c7 45 08 40 00 00 00 	movl   $0x40,0x8(%ebp)
}
     18d:	5d                   	pop    %ebp
    out_of_bounds_offset = offset;
     18e:	a3 64 31 00 00       	mov    %eax,0x3164
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     193:	e9 28 ff ff ff       	jmp    c0 <test_simple_crash>
     198:	90                   	nop
     199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <test_out_of_bounds_no_fork>:

void test_out_of_bounds_no_fork(int offset, const char *no_crash_message) {
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	83 ec 08             	sub    $0x8,%esp
    out_of_bounds_offset = offset;
     1a6:	8b 45 08             	mov    0x8(%ebp),%eax
     1a9:	a3 64 31 00 00       	mov    %eax,0x3164
    test_func();
     1ae:	e8 8d fe ff ff       	call   40 <test_out_of_bounds_internal>
    printf(1, "%s\n", no_crash_message);
     1b3:	83 ec 04             	sub    $0x4,%esp
     1b6:	ff 75 0c             	pushl  0xc(%ebp)
     1b9:	68 10 22 00 00       	push   $0x2210
     1be:	6a 01                	push   $0x1
     1c0:	e8 eb 1c 00 00       	call   1eb0 <printf>
    test_simple_crash_no_fork(test_out_of_bounds_internal, no_crash_message);
}
     1c5:	83 c4 10             	add    $0x10,%esp
     1c8:	c9                   	leave  
     1c9:	c3                   	ret    
     1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001d0 <test_allocation_no_fork>:

int test_allocation_no_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	57                   	push   %edi
     1d4:	56                   	push   %esi
     1d5:	53                   	push   %ebx
     1d6:	83 ec 28             	sub    $0x28,%esp
     1d9:	8b 75 08             	mov    0x8(%ebp),%esi
     1dc:	8b 5d 24             	mov    0x24(%ebp),%ebx
    char *old_end_of_heap = sbrk(size);
     1df:	56                   	push   %esi
     1e0:	e8 d5 1b 00 00       	call   1dba <sbrk>
     1e5:	89 c7                	mov    %eax,%edi
    char *new_end_of_heap = sbrk(0);
     1e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1ee:	e8 c7 1b 00 00       	call   1dba <sbrk>
    if (old_end_of_heap == (char*) -1) {
     1f3:	83 c4 10             	add    $0x10,%esp
     1f6:	83 ff ff             	cmp    $0xffffffff,%edi
     1f9:	0f 84 21 01 00 00    	je     320 <test_allocation_no_fork+0x150>
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
        return 0;
    } else if (new_end_of_heap - old_end_of_heap != size) {
     1ff:	29 f8                	sub    %edi,%eax
     201:	39 f0                	cmp    %esi,%eax
     203:	0f 85 d7 00 00 00    	jne    2e0 <test_allocation_no_fork+0x110>
        printf(1, FAIL_MSG "HEAP_SIZE\n");
        return 0;
    } else {
        int failed = 0;
        char *place_one = &old_end_of_heap[offset1];
     209:	8b 75 14             	mov    0x14(%ebp),%esi
        char *place_two = &old_end_of_heap[offset2];
     20c:	8b 45 1c             	mov    0x1c(%ebp),%eax
        char *place_one = &old_end_of_heap[offset1];
     20f:	01 fe                	add    %edi,%esi
        char *place_two = &old_end_of_heap[offset2];
     211:	01 f8                	add    %edi,%eax
        int i;
        for (i = 0; i < count1; ++i) {
     213:	8b 7d 18             	mov    0x18(%ebp),%edi
     216:	85 ff                	test   %edi,%edi
     218:	0f 8e 22 01 00 00    	jle    340 <test_allocation_no_fork+0x170>
     21e:	8b 7d 18             	mov    0x18(%ebp),%edi
     221:	89 f1                	mov    %esi,%ecx
        int failed = 0;
     223:	31 d2                	xor    %edx,%edx
            if (check_zero && place_one[i] != '\0') {
                failed = 1;
     225:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     228:	01 f7                	add    %esi,%edi
     22a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            if (check_zero && place_one[i] != '\0') {
     230:	85 db                	test   %ebx,%ebx
     232:	74 0b                	je     23f <test_allocation_no_fork+0x6f>
                failed = 1;
     234:	80 39 00             	cmpb   $0x0,(%ecx)
     237:	b8 01 00 00 00       	mov    $0x1,%eax
     23c:	0f 45 d0             	cmovne %eax,%edx
            }
            place_one[i] = 'A';
     23f:	c6 01 41             	movb   $0x41,(%ecx)
     242:	83 c1 01             	add    $0x1,%ecx
        for (i = 0; i < count1; ++i) {
     245:	39 cf                	cmp    %ecx,%edi
     247:	75 e7                	jne    230 <test_allocation_no_fork+0x60>
        }
        for (i = 0; i < count2; ++i) {
     249:	8b 7d 20             	mov    0x20(%ebp),%edi
     24c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     24f:	85 ff                	test   %edi,%edi
     251:	7e 2d                	jle    280 <test_allocation_no_fork+0xb0>
            if (check_zero && place_two[i] != '\0') {
                failed = 1;
     253:	89 75 e4             	mov    %esi,-0x1c(%ebp)
     256:	8b 75 20             	mov    0x20(%ebp),%esi
        int failed = 0;
     259:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     25b:	bf 01 00 00 00       	mov    $0x1,%edi
            if (check_zero && place_two[i] != '\0') {
     260:	85 db                	test   %ebx,%ebx
     262:	74 07                	je     26b <test_allocation_no_fork+0x9b>
                failed = 1;
     264:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     268:	0f 45 d7             	cmovne %edi,%edx
            }
            place_two[i] = 'B';
     26b:	c6 04 08 42          	movb   $0x42,(%eax,%ecx,1)
        for (i = 0; i < count2; ++i) {
     26f:	83 c1 01             	add    $0x1,%ecx
     272:	39 ce                	cmp    %ecx,%esi
     274:	7f ea                	jg     260 <test_allocation_no_fork+0x90>
        }
        for (i = 0; i < count1; ++i) {
     276:	8b 5d 18             	mov    0x18(%ebp),%ebx
     279:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     27c:	85 db                	test   %ebx,%ebx
     27e:	7e 25                	jle    2a5 <test_allocation_no_fork+0xd5>
            if (place_one[i] != 'A')
                failed = 1;
     280:	8b 7d 18             	mov    0x18(%ebp),%edi
                failed = 1;
     283:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     285:	bb 01 00 00 00       	mov    $0x1,%ebx
     28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     290:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     294:	0f 45 d3             	cmovne %ebx,%edx
        for (i = 0; i < count1; ++i) {
     297:	83 c1 01             	add    $0x1,%ecx
     29a:	39 cf                	cmp    %ecx,%edi
     29c:	7f f2                	jg     290 <test_allocation_no_fork+0xc0>
        } 
        for (i = 0; i < count2; ++i) {
     29e:	8b 4d 20             	mov    0x20(%ebp),%ecx
     2a1:	85 c9                	test   %ecx,%ecx
     2a3:	7e 18                	jle    2bd <test_allocation_no_fork+0xed>
     2a5:	8b 4d 20             	mov    0x20(%ebp),%ecx
            if (place_two[i] != 'B')
                failed = 1;
     2a8:	bb 01 00 00 00       	mov    $0x1,%ebx
     2ad:	01 c1                	add    %eax,%ecx
     2af:	90                   	nop
     2b0:	80 38 42             	cmpb   $0x42,(%eax)
     2b3:	0f 45 d3             	cmovne %ebx,%edx
     2b6:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     2b9:	39 c8                	cmp    %ecx,%eax
     2bb:	75 f3                	jne    2b0 <test_allocation_no_fork+0xe0>
        }
        if (failed) {
     2bd:	85 d2                	test   %edx,%edx
     2bf:	75 3f                	jne    300 <test_allocation_no_fork+0x130>
            printf(1, FAIL_MSG "HEAP_VALUES\n");
            return 0;
        } else {
            printf(1, PASS_MSG "\n");
     2c1:	83 ec 08             	sub    $0x8,%esp
     2c4:	68 58 22 00 00       	push   $0x2258
     2c9:	6a 01                	push   $0x1
     2cb:	e8 e0 1b 00 00       	call   1eb0 <printf>
            return 1;
     2d0:	83 c4 10             	add    $0x10,%esp
        }
    }
}
     2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 1;
     2d6:	b8 01 00 00 00       	mov    $0x1,%eax
}
     2db:	5b                   	pop    %ebx
     2dc:	5e                   	pop    %esi
     2dd:	5f                   	pop    %edi
     2de:	5d                   	pop    %ebp
     2df:	c3                   	ret    
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     2e0:	83 ec 08             	sub    $0x8,%esp
     2e3:	68 2c 22 00 00       	push   $0x222c
     2e8:	6a 01                	push   $0x1
     2ea:	e8 c1 1b 00 00       	call   1eb0 <printf>
        return 0;
     2ef:	83 c4 10             	add    $0x10,%esp
}
     2f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     2f5:	31 c0                	xor    %eax,%eax
}
     2f7:	5b                   	pop    %ebx
     2f8:	5e                   	pop    %esi
     2f9:	5f                   	pop    %edi
     2fa:	5d                   	pop    %ebp
     2fb:	c3                   	ret    
     2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, FAIL_MSG "HEAP_VALUES\n");
     300:	83 ec 08             	sub    $0x8,%esp
     303:	68 41 22 00 00       	push   $0x2241
     308:	6a 01                	push   $0x1
     30a:	e8 a1 1b 00 00       	call   1eb0 <printf>
            return 0;
     30f:	83 c4 10             	add    $0x10,%esp
}
     312:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 0;
     315:	31 c0                	xor    %eax,%eax
}
     317:	5b                   	pop    %ebx
     318:	5e                   	pop    %esi
     319:	5f                   	pop    %edi
     31a:	5d                   	pop    %ebp
     31b:	c3                   	ret    
     31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     320:	83 ec 08             	sub    $0x8,%esp
     323:	68 16 22 00 00       	push   $0x2216
     328:	6a 01                	push   $0x1
     32a:	e8 81 1b 00 00       	call   1eb0 <printf>
        return 0;
     32f:	83 c4 10             	add    $0x10,%esp
}
     332:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     335:	31 c0                	xor    %eax,%eax
}
     337:	5b                   	pop    %ebx
     338:	5e                   	pop    %esi
     339:	5f                   	pop    %edi
     33a:	5d                   	pop    %ebp
     33b:	c3                   	ret    
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (i = 0; i < count2; ++i) {
     340:	8b 4d 20             	mov    0x20(%ebp),%ecx
        int failed = 0;
     343:	31 d2                	xor    %edx,%edx
        for (i = 0; i < count2; ++i) {
     345:	85 c9                	test   %ecx,%ecx
     347:	0f 8f 06 ff ff ff    	jg     253 <test_allocation_no_fork+0x83>
     34d:	e9 6f ff ff ff       	jmp    2c1 <test_allocation_no_fork+0xf1>
     352:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <test_allocation_then_fork>:

void test_allocation_then_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	57                   	push   %edi
     364:	56                   	push   %esi
     365:	53                   	push   %ebx
     366:	83 ec 28             	sub    $0x28,%esp
     369:	8b 45 14             	mov    0x14(%ebp),%eax
     36c:	8b 7d 08             	mov    0x8(%ebp),%edi
     36f:	8b 5d 24             	mov    0x24(%ebp),%ebx
     372:	89 45 dc             	mov    %eax,-0x24(%ebp)
     375:	8b 45 18             	mov    0x18(%ebp),%eax
    char *old_end_of_heap = sbrk(size);
     378:	57                   	push   %edi
void test_allocation_then_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     379:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     37c:	8b 45 1c             	mov    0x1c(%ebp),%eax
     37f:	89 45 d8             	mov    %eax,-0x28(%ebp)
     382:	8b 45 20             	mov    0x20(%ebp),%eax
     385:	89 45 e0             	mov    %eax,-0x20(%ebp)
    char *old_end_of_heap = sbrk(size);
     388:	e8 2d 1a 00 00       	call   1dba <sbrk>
     38d:	89 c6                	mov    %eax,%esi
    char *new_end_of_heap = sbrk(0);
     38f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     396:	e8 1f 1a 00 00       	call   1dba <sbrk>
    if (old_end_of_heap == (char*) -1) {
     39b:	83 c4 10             	add    $0x10,%esp
     39e:	83 fe ff             	cmp    $0xffffffff,%esi
     3a1:	0f 84 a9 00 00 00    	je     450 <test_allocation_then_fork+0xf0>
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
        return;
    } else if (new_end_of_heap - old_end_of_heap != size) {
     3a7:	29 f0                	sub    %esi,%eax
     3a9:	39 f8                	cmp    %edi,%eax
     3ab:	0f 85 7f 00 00 00    	jne    430 <test_allocation_then_fork+0xd0>
        printf(1, FAIL_MSG "HEAP_SIZE\n");
        return;
    } else {
        int failed = 0;
        char *place_one = &old_end_of_heap[offset1];
     3b1:	8b 7d dc             	mov    -0x24(%ebp),%edi
        char *place_two = &old_end_of_heap[offset2];
        int i;
        for (i = 0; i < count1; ++i) {
     3b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
        char *place_one = &old_end_of_heap[offset1];
     3b7:	01 f7                	add    %esi,%edi
        char *place_two = &old_end_of_heap[offset2];
     3b9:	03 75 d8             	add    -0x28(%ebp),%esi
        for (i = 0; i < count1; ++i) {
     3bc:	85 c9                	test   %ecx,%ecx
        char *place_two = &old_end_of_heap[offset2];
     3be:	89 75 dc             	mov    %esi,-0x24(%ebp)
        for (i = 0; i < count1; ++i) {
     3c1:	0f 8e 99 00 00 00    	jle    460 <test_allocation_then_fork+0x100>
     3c7:	8d 14 39             	lea    (%ecx,%edi,1),%edx
     3ca:	89 f8                	mov    %edi,%eax
        int failed = 0;
     3cc:	31 f6                	xor    %esi,%esi
            if (check_zero && place_one[i] != '\0') {
                failed = 1;
     3ce:	b9 01 00 00 00       	mov    $0x1,%ecx
     3d3:	90                   	nop
     3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            if (check_zero && place_one[i] != '\0') {
     3d8:	85 db                	test   %ebx,%ebx
     3da:	74 06                	je     3e2 <test_allocation_then_fork+0x82>
                failed = 1;
     3dc:	80 38 00             	cmpb   $0x0,(%eax)
     3df:	0f 45 f1             	cmovne %ecx,%esi
            }
            place_one[i] = 'A';
     3e2:	c6 00 41             	movb   $0x41,(%eax)
     3e5:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count1; ++i) {
     3e8:	39 d0                	cmp    %edx,%eax
     3ea:	75 ec                	jne    3d8 <test_allocation_then_fork+0x78>
        }
        for (i = 0; i < count2; ++i) {
     3ec:	8b 55 e0             	mov    -0x20(%ebp),%edx
     3ef:	85 d2                	test   %edx,%edx
     3f1:	7e 21                	jle    414 <test_allocation_then_fork+0xb4>
     3f3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
     3f6:	89 c8                	mov    %ecx,%eax
     3f8:	01 ca                	add    %ecx,%edx
            if (check_zero && place_two[i] != '\0') {
                failed = 1;
     3fa:	b9 01 00 00 00       	mov    $0x1,%ecx
     3ff:	90                   	nop
            if (check_zero && place_two[i] != '\0') {
     400:	85 db                	test   %ebx,%ebx
     402:	74 06                	je     40a <test_allocation_then_fork+0xaa>
                failed = 1;
     404:	80 38 00             	cmpb   $0x0,(%eax)
     407:	0f 45 f1             	cmovne %ecx,%esi
            }
            place_two[i] = 'B';
     40a:	c6 00 42             	movb   $0x42,(%eax)
     40d:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     410:	39 d0                	cmp    %edx,%eax
     412:	75 ec                	jne    400 <test_allocation_then_fork+0xa0>
        }
        int pid = fork();
     414:	e8 11 19 00 00       	call   1d2a <fork>
        if (pid == 0) {
     419:	85 c0                	test   %eax,%eax
     41b:	74 47                	je     464 <test_allocation_then_fork+0x104>
            exit();
        } else {
            wait();
        }
    }
}
     41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     420:	5b                   	pop    %ebx
     421:	5e                   	pop    %esi
     422:	5f                   	pop    %edi
     423:	5d                   	pop    %ebp
            wait();
     424:	e9 11 19 00 00       	jmp    1d3a <wait>
     429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     430:	c7 45 0c 2c 22 00 00 	movl   $0x222c,0xc(%ebp)
     437:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
     43e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     441:	5b                   	pop    %ebx
     442:	5e                   	pop    %esi
     443:	5f                   	pop    %edi
     444:	5d                   	pop    %ebp
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     445:	e9 66 1a 00 00       	jmp    1eb0 <printf>
     44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     450:	c7 45 0c 16 22 00 00 	movl   $0x2216,0xc(%ebp)
     457:	eb de                	jmp    437 <test_allocation_then_fork+0xd7>
     459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        int failed = 0;
     460:	31 f6                	xor    %esi,%esi
     462:	eb 88                	jmp    3ec <test_allocation_then_fork+0x8c>
            for (i = 0; i < count1; ++i) {
     464:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     467:	85 c0                	test   %eax,%eax
     469:	7e 14                	jle    47f <test_allocation_then_fork+0x11f>
     46b:	01 f8                	add    %edi,%eax
                    failed = 1;
     46d:	ba 01 00 00 00       	mov    $0x1,%edx
     472:	80 3f 41             	cmpb   $0x41,(%edi)
     475:	0f 45 f2             	cmovne %edx,%esi
     478:	83 c7 01             	add    $0x1,%edi
            for (i = 0; i < count1; ++i) {
     47b:	39 c7                	cmp    %eax,%edi
     47d:	75 f3                	jne    472 <test_allocation_then_fork+0x112>
            for (i = 0; i < count2; ++i) {
     47f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     482:	85 c0                	test   %eax,%eax
     484:	7e 17                	jle    49d <test_allocation_then_fork+0x13d>
     486:	8b 55 dc             	mov    -0x24(%ebp),%edx
                    failed = 1;
     489:	b9 01 00 00 00       	mov    $0x1,%ecx
     48e:	01 d0                	add    %edx,%eax
     490:	80 3a 42             	cmpb   $0x42,(%edx)
     493:	0f 45 f1             	cmovne %ecx,%esi
     496:	83 c2 01             	add    $0x1,%edx
            for (i = 0; i < count2; ++i) {
     499:	39 d0                	cmp    %edx,%eax
     49b:	75 f3                	jne    490 <test_allocation_then_fork+0x130>
            if (failed) {
     49d:	85 f6                	test   %esi,%esi
     49f:	74 16                	je     4b7 <test_allocation_then_fork+0x157>
                printf(1, FAIL_MSG "HEAP_VALUES\n");
     4a1:	52                   	push   %edx
     4a2:	52                   	push   %edx
     4a3:	68 41 22 00 00       	push   $0x2241
     4a8:	6a 01                	push   $0x1
     4aa:	e8 01 1a 00 00       	call   1eb0 <printf>
     4af:	83 c4 10             	add    $0x10,%esp
            exit();
     4b2:	e8 7b 18 00 00       	call   1d32 <exit>
                printf(1, PASS_MSG "\n");
     4b7:	50                   	push   %eax
     4b8:	50                   	push   %eax
     4b9:	68 58 22 00 00       	push   $0x2258
     4be:	6a 01                	push   $0x1
     4c0:	e8 eb 19 00 00       	call   1eb0 <printf>
     4c5:	83 c4 10             	add    $0x10,%esp
     4c8:	eb e8                	jmp    4b2 <test_allocation_then_fork+0x152>
     4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <test_allocation_fork>:


int test_allocation_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2) {
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	57                   	push   %edi
     4d4:	56                   	push   %esi
     4d5:	53                   	push   %ebx
     4d6:	83 ec 2c             	sub    $0x2c,%esp
     4d9:	8b 75 0c             	mov    0xc(%ebp),%esi
     4dc:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
     4df:	57                   	push   %edi
     4e0:	56                   	push   %esi
     4e1:	68 f0 22 00 00       	push   $0x22f0
     4e6:	6a 01                	push   $0x1
     4e8:	e8 c3 19 00 00       	call   1eb0 <printf>
    int fds[2];
    pipe(fds);
     4ed:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     4f0:	89 04 24             	mov    %eax,(%esp)
     4f3:	e8 4a 18 00 00       	call   1d42 <pipe>
    int pid = fork();
     4f8:	e8 2d 18 00 00       	call   1d2a <fork>
    if (pid == 0) {
     4fd:	83 c4 10             	add    $0x10,%esp
     500:	83 f8 00             	cmp    $0x0,%eax
     503:	0f 84 99 01 00 00    	je     6a2 <test_allocation_fork+0x1d2>
                    failed = 1;
            }
            write(fds[1], failed ? failed_text : "YY", 2);
        }
        exit();
    } else if (pid > 0) {
     509:	0f 8e b9 00 00 00    	jle    5c8 <test_allocation_fork+0xf8>
        char text[10];
        close(fds[1]);
     50f:	83 ec 0c             	sub    $0xc,%esp
     512:	ff 75 d8             	pushl  -0x28(%ebp)
     515:	e8 40 18 00 00       	call   1d5a <close>
        int size = read(fds[0], text, 10);
     51a:	8d 45 de             	lea    -0x22(%ebp),%eax
     51d:	83 c4 0c             	add    $0xc,%esp
     520:	6a 0a                	push   $0xa
     522:	50                   	push   %eax
     523:	ff 75 d4             	pushl  -0x2c(%ebp)
     526:	e8 1f 18 00 00       	call   1d4a <read>
     52b:	89 c3                	mov    %eax,%ebx
        wait();
     52d:	e8 08 18 00 00       	call   1d3a <wait>
        close(fds[0]);
     532:	58                   	pop    %eax
     533:	ff 75 d4             	pushl  -0x2c(%ebp)
     536:	e8 1f 18 00 00       	call   1d5a <close>
        if (size == 2 && text[0] == 'N') {
     53b:	83 c4 10             	add    $0x10,%esp
     53e:	83 fb 02             	cmp    $0x2,%ebx
     541:	74 3d                	je     580 <test_allocation_fork+0xb0>
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
            } else {
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
            }
            return 0;
        } else if (size == 0) {
     543:	83 fb 00             	cmp    $0x0,%ebx
     546:	0f 84 a4 00 00 00    	je     5f0 <test_allocation_fork+0x120>
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
            return 0;
        } else if (size >= 1 && text[0] == 'Y') {
     54c:	7e 0c                	jle    55a <test_allocation_fork+0x8a>
     54e:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     552:	3c 59                	cmp    $0x59,%al
     554:	0f 84 b6 00 00 00    	je     610 <test_allocation_fork+0x140>
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
            return 1;
        } else {
            printf(1, FAIL_MSG "unknown error\n");
     55a:	83 ec 08             	sub    $0x8,%esp
            return 0;
     55d:	31 db                	xor    %ebx,%ebx
            printf(1, FAIL_MSG "unknown error\n");
     55f:	68 6d 22 00 00       	push   $0x226d
     564:	6a 01                	push   $0x1
     566:	e8 45 19 00 00       	call   1eb0 <printf>
            return 0;
     56b:	83 c4 10             	add    $0x10,%esp
        }
    } else {
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
        return 0;
    }
}
     56e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     571:	89 d8                	mov    %ebx,%eax
     573:	5b                   	pop    %ebx
     574:	5e                   	pop    %esi
     575:	5f                   	pop    %edi
     576:	5d                   	pop    %ebp
     577:	c3                   	ret    
     578:	90                   	nop
     579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (size == 2 && text[0] == 'N') {
     580:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     584:	3c 4e                	cmp    $0x4e,%al
     586:	75 ca                	jne    552 <test_allocation_fork+0x82>
            if (text[1] == 'A') {
     588:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
     58c:	3c 41                	cmp    $0x41,%al
     58e:	0f 84 bc 00 00 00    	je     650 <test_allocation_fork+0x180>
            } else if (text[1] == 'I') {
     594:	3c 49                	cmp    $0x49,%al
     596:	0f 84 94 00 00 00    	je     630 <test_allocation_fork+0x160>
            } else if (text[1] == 'R') {
     59c:	3c 52                	cmp    $0x52,%al
     59e:	0f 84 e6 00 00 00    	je     68a <test_allocation_fork+0x1ba>
            } else if (text[1] == 'S') {
     5a4:	3c 53                	cmp    $0x53,%al
     5a6:	0f 84 c4 00 00 00    	je     670 <test_allocation_fork+0x1a0>
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     5ac:	56                   	push   %esi
     5ad:	57                   	push   %edi
            return 0;
     5ae:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     5b0:	68 18 24 00 00       	push   $0x2418
     5b5:	6a 01                	push   $0x1
     5b7:	e8 f4 18 00 00       	call   1eb0 <printf>
     5bc:	83 c4 10             	add    $0x10,%esp
     5bf:	eb ad                	jmp    56e <test_allocation_fork+0x9e>
     5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     5c8:	83 ec 08             	sub    $0x8,%esp
        return 0;
     5cb:	31 db                	xor    %ebx,%ebx
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     5cd:	68 dc 24 00 00       	push   $0x24dc
     5d2:	6a 01                	push   $0x1
     5d4:	e8 d7 18 00 00       	call   1eb0 <printf>
        return 0;
     5d9:	83 c4 10             	add    $0x10,%esp
}
     5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5df:	89 d8                	mov    %ebx,%eax
     5e1:	5b                   	pop    %ebx
     5e2:	5e                   	pop    %esi
     5e3:	5f                   	pop    %edi
     5e4:	5d                   	pop    %ebp
     5e5:	c3                   	ret    
     5e6:	8d 76 00             	lea    0x0(%esi),%esi
     5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
     5f0:	57                   	push   %edi
     5f1:	56                   	push   %esi
     5f2:	68 54 24 00 00       	push   $0x2454
     5f7:	6a 01                	push   $0x1
     5f9:	e8 b2 18 00 00       	call   1eb0 <printf>
            return 0;
     5fe:	83 c4 10             	add    $0x10,%esp
}
     601:	8d 65 f4             	lea    -0xc(%ebp),%esp
     604:	89 d8                	mov    %ebx,%eax
     606:	5b                   	pop    %ebx
     607:	5e                   	pop    %esi
     608:	5f                   	pop    %edi
     609:	5d                   	pop    %ebp
     60a:	c3                   	ret    
     60b:	90                   	nop
     60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     610:	57                   	push   %edi
     611:	56                   	push   %esi
            return 1;
     612:	bb 01 00 00 00       	mov    $0x1,%ebx
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     617:	68 98 24 00 00       	push   $0x2498
     61c:	6a 01                	push   $0x1
     61e:	e8 8d 18 00 00       	call   1eb0 <printf>
            return 1;
     623:	83 c4 10             	add    $0x10,%esp
     626:	e9 43 ff ff ff       	jmp    56e <test_allocation_fork+0x9e>
     62b:	90                   	nop
     62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     630:	83 ec 08             	sub    $0x8,%esp
            return 0;
     633:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     635:	68 74 23 00 00       	push   $0x2374
     63a:	6a 01                	push   $0x1
     63c:	e8 6f 18 00 00       	call   1eb0 <printf>
     641:	83 c4 10             	add    $0x10,%esp
     644:	e9 25 ff ff ff       	jmp    56e <test_allocation_fork+0x9e>
     649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     650:	83 ec 04             	sub    $0x4,%esp
            return 0;
     653:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     655:	56                   	push   %esi
     656:	68 30 23 00 00       	push   $0x2330
     65b:	6a 01                	push   $0x1
     65d:	e8 4e 18 00 00       	call   1eb0 <printf>
     662:	83 c4 10             	add    $0x10,%esp
     665:	e9 04 ff ff ff       	jmp    56e <test_allocation_fork+0x9e>
     66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     670:	83 ec 04             	sub    $0x4,%esp
            return 0;
     673:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     675:	56                   	push   %esi
     676:	68 e4 23 00 00       	push   $0x23e4
     67b:	6a 01                	push   $0x1
     67d:	e8 2e 18 00 00       	call   1eb0 <printf>
     682:	83 c4 10             	add    $0x10,%esp
     685:	e9 e4 fe ff ff       	jmp    56e <test_allocation_fork+0x9e>
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     68a:	56                   	push   %esi
     68b:	57                   	push   %edi
            return 0;
     68c:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     68e:	68 a8 23 00 00       	push   $0x23a8
     693:	6a 01                	push   $0x1
     695:	e8 16 18 00 00       	call   1eb0 <printf>
     69a:	83 c4 10             	add    $0x10,%esp
     69d:	e9 cc fe ff ff       	jmp    56e <test_allocation_fork+0x9e>
        char *old_end_of_heap = sbrk(size);
     6a2:	83 ec 0c             	sub    $0xc,%esp
     6a5:	ff 75 08             	pushl  0x8(%ebp)
     6a8:	89 c3                	mov    %eax,%ebx
     6aa:	e8 0b 17 00 00       	call   1dba <sbrk>
     6af:	89 c7                	mov    %eax,%edi
        char *new_end_of_heap = sbrk(0);
     6b1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6b8:	e8 fd 16 00 00       	call   1dba <sbrk>
        if (old_end_of_heap == (char*) -1) {
     6bd:	83 c4 10             	add    $0x10,%esp
     6c0:	83 ff ff             	cmp    $0xffffffff,%edi
     6c3:	0f 84 d5 00 00 00    	je     79e <test_allocation_fork+0x2ce>
        } else if (new_end_of_heap - old_end_of_heap != size) {
     6c9:	29 f8                	sub    %edi,%eax
     6cb:	3b 45 08             	cmp    0x8(%ebp),%eax
     6ce:	74 18                	je     6e8 <test_allocation_fork+0x218>
            write(fds[1], "NS", 2);
     6d0:	53                   	push   %ebx
     6d1:	6a 02                	push   $0x2
     6d3:	68 6a 22 00 00       	push   $0x226a
     6d8:	ff 75 d8             	pushl  -0x28(%ebp)
     6db:	e8 72 16 00 00       	call   1d52 <write>
     6e0:	83 c4 10             	add    $0x10,%esp
        exit();
     6e3:	e8 4a 16 00 00       	call   1d32 <exit>
            char *place_one = &old_end_of_heap[offset1];
     6e8:	8b 75 14             	mov    0x14(%ebp),%esi
            char *place_two = &old_end_of_heap[offset2];
     6eb:	8b 55 1c             	mov    0x1c(%ebp),%edx
            char failed_text[2] = "NR";
     6ee:	66 c7 45 de 4e 52    	movw   $0x524e,-0x22(%ebp)
            char *place_one = &old_end_of_heap[offset1];
     6f4:	01 fe                	add    %edi,%esi
            char *place_two = &old_end_of_heap[offset2];
     6f6:	01 fa                	add    %edi,%edx
            for (i = 0; i < count1; ++i) {
     6f8:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     6fc:	0f 8e b4 00 00 00    	jle    7b6 <test_allocation_fork+0x2e6>
     702:	8b 7d 18             	mov    0x18(%ebp),%edi
     705:	89 f1                	mov    %esi,%ecx
            int failed = 0;
     707:	31 c0                	xor    %eax,%eax
     709:	01 f7                	add    %esi,%edi
                if (place_one[i] != 0) {
     70b:	80 39 00             	cmpb   $0x0,(%ecx)
     70e:	74 09                	je     719 <test_allocation_fork+0x249>
                    failed_text[1] = 'I';
     710:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     714:	b8 01 00 00 00       	mov    $0x1,%eax
                place_one[i] = 'A';
     719:	c6 01 41             	movb   $0x41,(%ecx)
     71c:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count1; ++i) {
     71f:	39 f9                	cmp    %edi,%ecx
     721:	75 e8                	jne    70b <test_allocation_fork+0x23b>
            for (i = 0; i < count2; ++i) {
     723:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     727:	7e 25                	jle    74e <test_allocation_fork+0x27e>
     729:	8b 7d 20             	mov    0x20(%ebp),%edi
     72c:	89 d1                	mov    %edx,%ecx
     72e:	01 d7                	add    %edx,%edi
                if (place_two[i] != 0) {
     730:	80 39 00             	cmpb   $0x0,(%ecx)
     733:	74 09                	je     73e <test_allocation_fork+0x26e>
                    failed_text[1] = 'I';
     735:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     739:	b8 01 00 00 00       	mov    $0x1,%eax
                place_two[i] = 'B';
     73e:	c6 01 42             	movb   $0x42,(%ecx)
     741:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count2; ++i) {
     744:	39 f9                	cmp    %edi,%ecx
     746:	75 e8                	jne    730 <test_allocation_fork+0x260>
            for (i = 0; i < count1; ++i) {
     748:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     74c:	7e 1c                	jle    76a <test_allocation_fork+0x29a>
                    failed = 1;
     74e:	31 c9                	xor    %ecx,%ecx
                    failed = 1;
     750:	bf 01 00 00 00       	mov    $0x1,%edi
     755:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     759:	0f 45 c7             	cmovne %edi,%eax
            for (i = 0; i < count1; ++i) {
     75c:	83 c1 01             	add    $0x1,%ecx
     75f:	39 4d 18             	cmp    %ecx,0x18(%ebp)
     762:	7f f1                	jg     755 <test_allocation_fork+0x285>
            for (i = 0; i < count2; ++i) {
     764:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     768:	7e 14                	jle    77e <test_allocation_fork+0x2ae>
                    failed = 1;
     76a:	b9 01 00 00 00       	mov    $0x1,%ecx
     76f:	80 3c 1a 42          	cmpb   $0x42,(%edx,%ebx,1)
     773:	0f 45 c1             	cmovne %ecx,%eax
            for (i = 0; i < count2; ++i) {
     776:	83 c3 01             	add    $0x1,%ebx
     779:	39 5d 20             	cmp    %ebx,0x20(%ebp)
     77c:	7f f1                	jg     76f <test_allocation_fork+0x29f>
            write(fds[1], failed ? failed_text : "YY", 2);
     77e:	85 c0                	test   %eax,%eax
     780:	8d 55 de             	lea    -0x22(%ebp),%edx
     783:	75 05                	jne    78a <test_allocation_fork+0x2ba>
     785:	ba 64 22 00 00       	mov    $0x2264,%edx
     78a:	51                   	push   %ecx
     78b:	6a 02                	push   $0x2
     78d:	52                   	push   %edx
     78e:	ff 75 d8             	pushl  -0x28(%ebp)
     791:	e8 bc 15 00 00       	call   1d52 <write>
     796:	83 c4 10             	add    $0x10,%esp
     799:	e9 45 ff ff ff       	jmp    6e3 <test_allocation_fork+0x213>
            write(fds[1], "NA", 2);
     79e:	56                   	push   %esi
     79f:	6a 02                	push   $0x2
     7a1:	68 67 22 00 00       	push   $0x2267
     7a6:	ff 75 d8             	pushl  -0x28(%ebp)
     7a9:	e8 a4 15 00 00       	call   1d52 <write>
     7ae:	83 c4 10             	add    $0x10,%esp
     7b1:	e9 2d ff ff ff       	jmp    6e3 <test_allocation_fork+0x213>
            int failed = 0;
     7b6:	31 c0                	xor    %eax,%eax
            for (i = 0; i < count2; ++i) {
     7b8:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     7bc:	0f 8f 67 ff ff ff    	jg     729 <test_allocation_fork+0x259>
     7c2:	eb c1                	jmp    785 <test_allocation_fork+0x2b5>
     7c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007d0 <wait_forever>:

void wait_forever() {
     7d0:	55                   	push   %ebp
     7d1:	89 e5                	mov    %esp,%ebp
     7d3:	83 ec 08             	sub    $0x8,%esp
     7d6:	8d 76 00             	lea    0x0(%esi),%esi
     7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while (1) { sleep(1000); }
     7e0:	83 ec 0c             	sub    $0xc,%esp
     7e3:	68 e8 03 00 00       	push   $0x3e8
     7e8:	e8 d5 15 00 00       	call   1dc2 <sleep>
     7ed:	83 c4 10             	add    $0x10,%esp
     7f0:	eb ee                	jmp    7e0 <wait_forever+0x10>
     7f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000800 <test_copy_on_write_main_child>:
}

void test_copy_on_write_main_child(int result_fd, int size, const char *describe_size, int forks) {
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	57                   	push   %edi
     804:	56                   	push   %esi
     805:	53                   	push   %ebx
     806:	83 ec 78             	sub    $0x78,%esp
  char *old_end_of_heap = sbrk(size);
     809:	ff 75 0c             	pushl  0xc(%ebp)
     80c:	e8 a9 15 00 00       	call   1dba <sbrk>
     811:	89 c7                	mov    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     813:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  char *old_end_of_heap = sbrk(size);
     81a:	89 45 94             	mov    %eax,-0x6c(%ebp)
  char *new_end_of_heap = sbrk(0);
     81d:	e8 98 15 00 00       	call   1dba <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     822:	83 c4 10             	add    $0x10,%esp
     825:	39 c7                	cmp    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     827:	89 45 90             	mov    %eax,-0x70(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     82a:	73 0e                	jae    83a <test_copy_on_write_main_child+0x3a>
     82c:	89 c2                	mov    %eax,%edx
     82e:	89 f8                	mov    %edi,%eax
      *p = 'A';
     830:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     833:	83 c0 01             	add    $0x1,%eax
     836:	39 c2                	cmp    %eax,%edx
     838:	75 f6                	jne    830 <test_copy_on_write_main_child+0x30>
  }
  int children[MAX_CHILDREN] = {0};
     83a:	31 c0                	xor    %eax,%eax
  if (forks > MAX_CHILDREN) {
     83c:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     840:	8d 7d a8             	lea    -0x58(%ebp),%edi
     843:	b9 10 00 00 00       	mov    $0x10,%ecx
     848:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     84a:	0f 8f 58 01 00 00    	jg     9a8 <test_copy_on_write_main_child+0x1a8>
    printf(2, "unsupported number of children in test_copy_on_write\n");
  }
  int failed = 0;
  char failed_code = ' ';
  for (int i = 0; i < forks; ++i) {
     850:	8b 4d 14             	mov    0x14(%ebp),%ecx
     853:	85 c9                	test   %ecx,%ecx
     855:	0f 8e 64 01 00 00    	jle    9bf <test_copy_on_write_main_child+0x1bf>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     85b:	31 db                	xor    %ebx,%ebx
     85d:	bf 20 00 00 00       	mov    $0x20,%edi
     862:	31 f6                	xor    %esi,%esi
     864:	eb 58                	jmp    8be <test_copy_on_write_main_child+0xbe>
     866:	8d 76 00             	lea    0x0(%esi),%esi
     869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (children[i] == -1) {
      printf(2, "fork failed\n");
      failed = 1;
      failed_code = 'f';
      break;
    } else if (children[i] == 0) {
     870:	85 c0                	test   %eax,%eax
     872:	0f 84 5c 01 00 00    	je     9d4 <test_copy_on_write_main_child+0x1d4>
      }
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
      wait_forever();
    } else {
      char buffer[1] = {'X'};
      read(child_fds[0], buffer, 1);
     878:	8d 45 9f             	lea    -0x61(%ebp),%eax
     87b:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     87e:	c6 45 9f 58          	movb   $0x58,-0x61(%ebp)
      read(child_fds[0], buffer, 1);
     882:	6a 01                	push   $0x1
     884:	50                   	push   %eax
     885:	ff 75 a0             	pushl  -0x60(%ebp)
     888:	e8 bd 14 00 00       	call   1d4a <read>
      if (buffer[0] != '+') {
        failed = 1;
        failed_code = 'c';
     88d:	80 7d 9f 2b          	cmpb   $0x2b,-0x61(%ebp)
      if (buffer[0] != '+') {
     891:	58                   	pop    %eax
        failed_code = 'c';
     892:	b8 63 00 00 00       	mov    $0x63,%eax
      }
      close(child_fds[0]); close(child_fds[1]);
     897:	ff 75 a0             	pushl  -0x60(%ebp)
        failed_code = 'c';
     89a:	0f 45 f8             	cmovne %eax,%edi
     89d:	b8 01 00 00 00       	mov    $0x1,%eax
     8a2:	0f 45 f0             	cmovne %eax,%esi
  for (int i = 0; i < forks; ++i) {
     8a5:	83 c3 01             	add    $0x1,%ebx
      close(child_fds[0]); close(child_fds[1]);
     8a8:	e8 ad 14 00 00       	call   1d5a <close>
     8ad:	5a                   	pop    %edx
     8ae:	ff 75 a4             	pushl  -0x5c(%ebp)
     8b1:	e8 a4 14 00 00       	call   1d5a <close>
  for (int i = 0; i < forks; ++i) {
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	39 5d 14             	cmp    %ebx,0x14(%ebp)
     8bc:	74 39                	je     8f7 <test_copy_on_write_main_child+0xf7>
    pipe(child_fds);
     8be:	8d 45 a0             	lea    -0x60(%ebp),%eax
     8c1:	83 ec 0c             	sub    $0xc,%esp
     8c4:	50                   	push   %eax
     8c5:	e8 78 14 00 00       	call   1d42 <pipe>
    children[i] = fork();
     8ca:	e8 5b 14 00 00       	call   1d2a <fork>
    if (children[i] == -1) {
     8cf:	83 c4 10             	add    $0x10,%esp
     8d2:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     8d5:	89 44 9d a8          	mov    %eax,-0x58(%ebp,%ebx,4)
    if (children[i] == -1) {
     8d9:	75 95                	jne    870 <test_copy_on_write_main_child+0x70>
      printf(2, "fork failed\n");
     8db:	83 ec 08             	sub    $0x8,%esp
      failed_code = 'f';
     8de:	bf 66 00 00 00       	mov    $0x66,%edi
      failed = 1;
     8e3:	be 01 00 00 00       	mov    $0x1,%esi
      printf(2, "fork failed\n");
     8e8:	68 8a 22 00 00       	push   $0x228a
     8ed:	6a 02                	push   $0x2
     8ef:	e8 bc 15 00 00       	call   1eb0 <printf>
      break;
     8f4:	83 c4 10             	add    $0x10,%esp
     8f7:	8b 45 14             	mov    0x14(%ebp),%eax
     8fa:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     8fd:	89 75 8c             	mov    %esi,-0x74(%ebp)
     900:	89 de                	mov    %ebx,%esi
     902:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     905:	89 c3                	mov    %eax,%ebx
     907:	89 f6                	mov    %esi,%esi
     909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }
  }
  for (int i = 0; i < forks; ++i) {
    kill(children[i]);
     910:	83 ec 0c             	sub    $0xc,%esp
     913:	ff 36                	pushl  (%esi)
     915:	83 c6 04             	add    $0x4,%esi
     918:	e8 45 14 00 00       	call   1d62 <kill>
    wait();
     91d:	e8 18 14 00 00       	call   1d3a <wait>
  for (int i = 0; i < forks; ++i) {
     922:	83 c4 10             	add    $0x10,%esp
     925:	39 f3                	cmp    %esi,%ebx
     927:	75 e7                	jne    910 <test_copy_on_write_main_child+0x110>
  }
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     929:	8b 55 90             	mov    -0x70(%ebp),%edx
     92c:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     92f:	8b 75 8c             	mov    -0x74(%ebp),%esi
     932:	73 24                	jae    958 <test_copy_on_write_main_child+0x158>
    if (*p != 'A') {
      failed = 1;
      failed_code = 'p';
     934:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
     937:	8b 5d 90             	mov    -0x70(%ebp),%ebx
     93a:	ba 70 00 00 00       	mov    $0x70,%edx
     93f:	b8 01 00 00 00       	mov    $0x1,%eax
     944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     948:	80 39 41             	cmpb   $0x41,(%ecx)
     94b:	0f 45 fa             	cmovne %edx,%edi
     94e:	0f 45 f0             	cmovne %eax,%esi
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     951:	83 c1 01             	add    $0x1,%ecx
     954:	39 cb                	cmp    %ecx,%ebx
     956:	75 f0                	jne    948 <test_copy_on_write_main_child+0x148>
    }
  }
  if (failed) {
     958:	85 f6                	test   %esi,%esi
     95a:	75 24                	jne    980 <test_copy_on_write_main_child+0x180>
    char buffer[2] = {'N', ' '};
    buffer[1] = failed_code;
    write(result_fd, buffer, 2);
  } else {
    write(result_fd, "YY", 2);
     95c:	83 ec 04             	sub    $0x4,%esp
     95f:	6a 02                	push   $0x2
     961:	68 64 22 00 00       	push   $0x2264
     966:	ff 75 08             	pushl  0x8(%ebp)
     969:	e8 e4 13 00 00       	call   1d52 <write>
     96e:	83 c4 10             	add    $0x10,%esp
  }
}
     971:	8d 65 f4             	lea    -0xc(%ebp),%esp
     974:	5b                   	pop    %ebx
     975:	5e                   	pop    %esi
     976:	5f                   	pop    %edi
     977:	5d                   	pop    %ebp
     978:	c3                   	ret    
     979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    buffer[1] = failed_code;
     980:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     982:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     985:	c6 45 a0 4e          	movb   $0x4e,-0x60(%ebp)
    buffer[1] = failed_code;
     989:	88 45 a1             	mov    %al,-0x5f(%ebp)
    write(result_fd, buffer, 2);
     98c:	8d 45 a0             	lea    -0x60(%ebp),%eax
     98f:	6a 02                	push   $0x2
     991:	50                   	push   %eax
     992:	ff 75 08             	pushl  0x8(%ebp)
     995:	e8 b8 13 00 00       	call   1d52 <write>
     99a:	83 c4 10             	add    $0x10,%esp
}
     99d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9a0:	5b                   	pop    %ebx
     9a1:	5e                   	pop    %esi
     9a2:	5f                   	pop    %edi
     9a3:	5d                   	pop    %ebp
     9a4:	c3                   	ret    
     9a5:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     9a8:	83 ec 08             	sub    $0x8,%esp
     9ab:	68 0c 25 00 00       	push   $0x250c
     9b0:	6a 02                	push   $0x2
     9b2:	e8 f9 14 00 00       	call   1eb0 <printf>
     9b7:	83 c4 10             	add    $0x10,%esp
     9ba:	e9 9c fe ff ff       	jmp    85b <test_copy_on_write_main_child+0x5b>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9bf:	31 f6                	xor    %esi,%esi
     9c1:	8b 55 90             	mov    -0x70(%ebp),%edx
     9c4:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     9c7:	bf 20 00 00 00       	mov    $0x20,%edi
     9cc:	0f 82 62 ff ff ff    	jb     934 <test_copy_on_write_main_child+0x134>
     9d2:	eb 88                	jmp    95c <test_copy_on_write_main_child+0x15c>
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9d4:	8b 55 94             	mov    -0x6c(%ebp),%edx
     9d7:	8b 4d 90             	mov    -0x70(%ebp),%ecx
     9da:	39 ca                	cmp    %ecx,%edx
     9dc:	73 13                	jae    9f1 <test_copy_on_write_main_child+0x1f1>
          found_wrong_memory = 1;
     9de:	b9 01 00 00 00       	mov    $0x1,%ecx
     9e3:	80 3a 41             	cmpb   $0x41,(%edx)
     9e6:	0f 45 c1             	cmovne %ecx,%eax
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9e9:	83 c2 01             	add    $0x1,%edx
     9ec:	39 55 90             	cmp    %edx,-0x70(%ebp)
     9ef:	75 f2                	jne    9e3 <test_copy_on_write_main_child+0x1e3>
      int place_one = size / 2;
     9f1:	8b 7d 0c             	mov    0xc(%ebp),%edi
      old_end_of_heap[place_one] = 'B' + i;
     9f4:	8b 75 94             	mov    -0x6c(%ebp),%esi
     9f7:	8d 53 42             	lea    0x42(%ebx),%edx
          place_two = size - 1;
     9fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_one = size / 2;
     9fd:	c1 ef 1f             	shr    $0x1f,%edi
     a00:	03 7d 0c             	add    0xc(%ebp),%edi
          place_two = size - 1;
     a03:	83 e9 01             	sub    $0x1,%ecx
      int place_one = size / 2;
     a06:	d1 ff                	sar    %edi
      old_end_of_heap[place_one] = 'B' + i;
     a08:	01 f7                	add    %esi,%edi
     a0a:	88 17                	mov    %dl,(%edi)
      int place_two = 4096 * i;
     a0c:	89 da                	mov    %ebx,%edx
     a0e:	c1 e2 0c             	shl    $0xc,%edx
          place_two = size - 1;
     a11:	39 55 0c             	cmp    %edx,0xc(%ebp)
     a14:	0f 4f ca             	cmovg  %edx,%ecx
      old_end_of_heap[place_two] = 'C';
     a17:	c6 04 0e 43          	movb   $0x43,(%esi,%ecx,1)
      int place_three = 4096 * (i - 1);
     a1b:	8d b2 00 f0 ff ff    	lea    -0x1000(%edx),%esi
      if (place_three >= size || place_three < 0) {
     a21:	39 75 0c             	cmp    %esi,0xc(%ebp)
     a24:	7e 66                	jle    a8c <test_copy_on_write_main_child+0x28c>
     a26:	85 f6                	test   %esi,%esi
     a28:	78 62                	js     a8c <test_copy_on_write_main_child+0x28c>
          place_four = size - 3;
     a2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_four = 4096 * (i + 1);
     a2d:	81 c2 00 10 00 00    	add    $0x1000,%edx
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a33:	89 45 90             	mov    %eax,-0x70(%ebp)
          place_four = size - 3;
     a36:	83 e9 03             	sub    $0x3,%ecx
     a39:	39 55 0c             	cmp    %edx,0xc(%ebp)
     a3c:	0f 4e d1             	cmovle %ecx,%edx
        old_end_of_heap[place_four],
     a3f:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a42:	83 ec 04             	sub    $0x4,%esp
     a45:	53                   	push   %ebx
     a46:	50                   	push   %eax
        old_end_of_heap[place_four],
     a47:	01 ca                	add    %ecx,%edx
        old_end_of_heap[place_three],
     a49:	01 ce                	add    %ecx,%esi
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a4b:	0f be 0a             	movsbl (%edx),%ecx
     a4e:	89 55 94             	mov    %edx,-0x6c(%ebp)
     a51:	51                   	push   %ecx
     a52:	0f be 0f             	movsbl (%edi),%ecx
     a55:	51                   	push   %ecx
     a56:	0f be 0e             	movsbl (%esi),%ecx
     a59:	51                   	push   %ecx
     a5a:	68 44 25 00 00       	push   $0x2544
     a5f:	6a 01                	push   $0x1
     a61:	e8 4a 14 00 00       	call   1eb0 <printf>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     a66:	83 c4 20             	add    $0x20,%esp
     a69:	80 3e 41             	cmpb   $0x41,(%esi)
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     a6c:	b9 86 22 00 00       	mov    $0x2286,%ecx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     a71:	8b 55 94             	mov    -0x6c(%ebp),%edx
     a74:	8b 45 90             	mov    -0x70(%ebp),%eax
     a77:	74 1b                	je     a94 <test_copy_on_write_main_child+0x294>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     a79:	83 ec 04             	sub    $0x4,%esp
     a7c:	6a 01                	push   $0x1
     a7e:	51                   	push   %ecx
     a7f:	ff 75 a4             	pushl  -0x5c(%ebp)
     a82:	e8 cb 12 00 00       	call   1d52 <write>
      wait_forever();
     a87:	e8 44 fd ff ff       	call   7d0 <wait_forever>
          place_three = size - 2;
     a8c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     a8f:	8d 71 fe             	lea    -0x2(%ecx),%esi
     a92:	eb 96                	jmp    a2a <test_copy_on_write_main_child+0x22a>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     a94:	0f be 37             	movsbl (%edi),%esi
     a97:	83 c3 42             	add    $0x42,%ebx
     a9a:	39 de                	cmp    %ebx,%esi
     a9c:	75 db                	jne    a79 <test_copy_on_write_main_child+0x279>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     a9e:	80 3a 41             	cmpb   $0x41,(%edx)
     aa1:	75 09                	jne    aac <test_copy_on_write_main_child+0x2ac>
     aa3:	a8 01                	test   $0x1,%al
     aa5:	b9 88 22 00 00       	mov    $0x2288,%ecx
     aaa:	74 cd                	je     a79 <test_copy_on_write_main_child+0x279>
     aac:	b9 86 22 00 00       	mov    $0x2286,%ecx
     ab1:	eb c6                	jmp    a79 <test_copy_on_write_main_child+0x279>
     ab3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ac0 <test_copy_on_write_main_child_alt>:

void test_copy_on_write_main_child_alt(int result_fd, int size, const char *describe_size, int forks, int early_term) {
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	57                   	push   %edi
     ac4:	56                   	push   %esi
     ac5:	53                   	push   %ebx
     ac6:	81 ec 08 01 00 00    	sub    $0x108,%esp
  char *old_end_of_heap = sbrk(size);
     acc:	ff 75 0c             	pushl  0xc(%ebp)
     acf:	e8 e6 12 00 00       	call   1dba <sbrk>
     ad4:	89 c6                	mov    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     ad6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     add:	e8 d8 12 00 00       	call   1dba <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     ae2:	83 c4 10             	add    $0x10,%esp
     ae5:	39 c6                	cmp    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     ae7:	89 85 10 ff ff ff    	mov    %eax,-0xf0(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     aed:	73 13                	jae    b02 <test_copy_on_write_main_child_alt+0x42>
     aef:	89 c2                	mov    %eax,%edx
     af1:	89 f0                	mov    %esi,%eax
     af3:	90                   	nop
     af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *p = 'A';
     af8:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     afb:	83 c0 01             	add    $0x1,%eax
     afe:	39 c2                	cmp    %eax,%edx
     b00:	75 f6                	jne    af8 <test_copy_on_write_main_child_alt+0x38>
  }
  int children[MAX_CHILDREN] = {0};
     b02:	31 c0                	xor    %eax,%eax
  int child_fds[MAX_CHILDREN][2];
  if (forks > MAX_CHILDREN) {
     b04:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     b08:	8d 9d 28 ff ff ff    	lea    -0xd8(%ebp),%ebx
     b0e:	b9 10 00 00 00       	mov    $0x10,%ecx
     b13:	89 df                	mov    %ebx,%edi
     b15:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     b17:	0f 8f bb 01 00 00    	jg     cd8 <test_copy_on_write_main_child_alt+0x218>
    printf(2, "unsupported number of children in test_copy_on_write\n");
  }
  int failed = 0;
  char failed_code = ' ';
  for (int i = 0; i < forks; ++i) {
     b1d:	8b 7d 14             	mov    0x14(%ebp),%edi
     b20:	85 ff                	test   %edi,%edi
     b22:	0f 8e a7 03 00 00    	jle    ecf <test_copy_on_write_main_child_alt+0x40f>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b28:	31 ff                	xor    %edi,%edi
     b2a:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
     b30:	89 fe                	mov    %edi,%esi
     b32:	8b 7d 14             	mov    0x14(%ebp),%edi
     b35:	eb 1e                	jmp    b55 <test_copy_on_write_main_child_alt+0x95>
     b37:	89 f6                	mov    %esi,%esi
     b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (children[i] == -1) {
      printf(2, "fork failed\n");
      failed = 1;
      failed_code = 'f';
      break;
    } else if (children[i] == 0) {
     b40:	85 c0                	test   %eax,%eax
     b42:	8d 56 01             	lea    0x1(%esi),%edx
     b45:	0f 84 a5 01 00 00    	je     cf0 <test_copy_on_write_main_child_alt+0x230>
  for (int i = 0; i < forks; ++i) {
     b4b:	39 fa                	cmp    %edi,%edx
     b4d:	89 d6                	mov    %edx,%esi
     b4f:	0f 84 cb 02 00 00    	je     e20 <test_copy_on_write_main_child_alt+0x360>
    sleep(1);
     b55:	83 ec 0c             	sub    $0xc,%esp
     b58:	6a 01                	push   $0x1
     b5a:	e8 63 12 00 00       	call   1dc2 <sleep>
    pipe(child_fds[i]);
     b5f:	8d 84 f5 68 ff ff ff 	lea    -0x98(%ebp,%esi,8),%eax
     b66:	89 04 24             	mov    %eax,(%esp)
     b69:	e8 d4 11 00 00       	call   1d42 <pipe>
    children[i] = fork();
     b6e:	e8 b7 11 00 00       	call   1d2a <fork>
    if (children[i] == -1) {
     b73:	83 c4 10             	add    $0x10,%esp
     b76:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     b79:	89 04 b3             	mov    %eax,(%ebx,%esi,4)
    if (children[i] == -1) {
     b7c:	75 c2                	jne    b40 <test_copy_on_write_main_child_alt+0x80>
      printf(2, "fork failed\n");
     b7e:	83 ec 08             	sub    $0x8,%esp
     b81:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
      failed_code = 'f';
     b87:	bf 66 00 00 00       	mov    $0x66,%edi
      printf(2, "fork failed\n");
     b8c:	68 8a 22 00 00       	push   $0x228a
     b91:	6a 02                	push   $0x2
     b93:	e8 18 13 00 00       	call   1eb0 <printf>
      break;
     b98:	83 c4 10             	add    $0x10,%esp
      failed = 1;
     b9b:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     ba2:	00 00 00 
      if (old_end_of_heap[place_three] != 'A' || 
          old_end_of_heap[place_four] != 'A' ||
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
          found_wrong_memory = 1;
      }
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     ba5:	31 d2                	xor    %edx,%edx
     ba7:	89 b5 0c ff ff ff    	mov    %esi,-0xf4(%ebp)
     bad:	89 d6                	mov    %edx,%esi
     baf:	eb 4a                	jmp    bfb <test_copy_on_write_main_child_alt+0x13b>
     bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if (buffer[0] == 'X') {
        failed = 1;
        failed_code = 'P';
      } else if (buffer[0] != '+') {
        failed = 1;
        failed_code = 'c';
     bb8:	3c 2b                	cmp    $0x2b,%al
     bba:	b8 01 00 00 00       	mov    $0x1,%eax
     bbf:	0f 44 85 14 ff ff ff 	cmove  -0xec(%ebp),%eax
     bc6:	b9 63 00 00 00       	mov    $0x63,%ecx
     bcb:	0f 45 f9             	cmovne %ecx,%edi
     bce:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
      }
      close(child_fds[i][0]); close(child_fds[i][1]);
     bd4:	83 ec 0c             	sub    $0xc,%esp
     bd7:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     bde:	e8 77 11 00 00       	call   1d5a <close>
     be3:	5a                   	pop    %edx
     be4:	ff b4 f5 6c ff ff ff 	pushl  -0x94(%ebp,%esi,8)
     beb:	e8 6a 11 00 00       	call   1d5a <close>
     bf0:	83 c4 10             	add    $0x10,%esp
  for (int i = 0; i < forks; ++i) {
     bf3:	83 c6 01             	add    $0x1,%esi
     bf6:	39 75 14             	cmp    %esi,0x14(%ebp)
     bf9:	74 45                	je     c40 <test_copy_on_write_main_child_alt+0x180>
    if (children[i] != -1) {
     bfb:	83 3c b3 ff          	cmpl   $0xffffffff,(%ebx,%esi,4)
     bff:	74 f2                	je     bf3 <test_copy_on_write_main_child_alt+0x133>
      read(child_fds[i][0], buffer, 1);
     c01:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     c07:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     c0a:	c6 85 26 ff ff ff 58 	movb   $0x58,-0xda(%ebp)
      read(child_fds[i][0], buffer, 1);
     c11:	6a 01                	push   $0x1
     c13:	50                   	push   %eax
     c14:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     c1b:	e8 2a 11 00 00       	call   1d4a <read>
      if (buffer[0] == 'X') {
     c20:	0f b6 85 26 ff ff ff 	movzbl -0xda(%ebp),%eax
     c27:	83 c4 10             	add    $0x10,%esp
     c2a:	3c 58                	cmp    $0x58,%al
     c2c:	75 8a                	jne    bb8 <test_copy_on_write_main_child_alt+0xf8>
        failed_code = 'P';
     c2e:	bf 50 00 00 00       	mov    $0x50,%edi
        failed = 1;
     c33:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     c3a:	00 00 00 
     c3d:	eb 95                	jmp    bd4 <test_copy_on_write_main_child_alt+0x114>
     c3f:	90                   	nop
     c40:	8b 45 14             	mov    0x14(%ebp),%eax
     c43:	89 de                	mov    %ebx,%esi
     c45:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     c48:	89 c3                	mov    %eax,%ebx
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
  }
  for (int i = 0; i < forks; ++i) {
    kill(children[i]);
     c50:	83 ec 0c             	sub    $0xc,%esp
     c53:	ff 36                	pushl  (%esi)
     c55:	83 c6 04             	add    $0x4,%esi
     c58:	e8 05 11 00 00       	call   1d62 <kill>
    wait();
     c5d:	e8 d8 10 00 00       	call   1d3a <wait>
  for (int i = 0; i < forks; ++i) {
     c62:	83 c4 10             	add    $0x10,%esp
     c65:	39 f3                	cmp    %esi,%ebx
     c67:	75 e7                	jne    c50 <test_copy_on_write_main_child_alt+0x190>
     c69:	8b b5 0c ff ff ff    	mov    -0xf4(%ebp),%esi
  }
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     c6f:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
     c75:	73 2f                	jae    ca6 <test_copy_on_write_main_child_alt+0x1e6>
    if (*p != 'A') {
      failed = 1;
      failed_code = 'p';
     c77:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     c7d:	8b 9d 10 ff ff ff    	mov    -0xf0(%ebp),%ebx
     c83:	ba 70 00 00 00       	mov    $0x70,%edx
     c88:	b8 01 00 00 00       	mov    $0x1,%eax
     c8d:	8d 76 00             	lea    0x0(%esi),%esi
     c90:	80 3e 41             	cmpb   $0x41,(%esi)
     c93:	0f 45 fa             	cmovne %edx,%edi
     c96:	0f 45 c8             	cmovne %eax,%ecx
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     c99:	83 c6 01             	add    $0x1,%esi
     c9c:	39 f3                	cmp    %esi,%ebx
     c9e:	75 f0                	jne    c90 <test_copy_on_write_main_child_alt+0x1d0>
     ca0:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
    }
  }
  if (failed) {
     ca6:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
     cac:	85 c0                	test   %eax,%eax
     cae:	0f 85 3c 01 00 00    	jne    df0 <test_copy_on_write_main_child_alt+0x330>
    char buffer[2] = {'N', ' '};
    buffer[1] = failed_code;
    write(result_fd, buffer, 2);
  } else {
    write(result_fd, "YY", 2);
     cb4:	83 ec 04             	sub    $0x4,%esp
     cb7:	6a 02                	push   $0x2
     cb9:	68 64 22 00 00       	push   $0x2264
     cbe:	ff 75 08             	pushl  0x8(%ebp)
     cc1:	e8 8c 10 00 00       	call   1d52 <write>
     cc6:	83 c4 10             	add    $0x10,%esp
  }
}
     cc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ccc:	5b                   	pop    %ebx
     ccd:	5e                   	pop    %esi
     cce:	5f                   	pop    %edi
     ccf:	5d                   	pop    %ebp
     cd0:	c3                   	ret    
     cd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     cd8:	83 ec 08             	sub    $0x8,%esp
     cdb:	68 0c 25 00 00       	push   $0x250c
     ce0:	6a 02                	push   $0x2
     ce2:	e8 c9 11 00 00       	call   1eb0 <printf>
     ce7:	83 c4 10             	add    $0x10,%esp
     cea:	e9 39 fe ff ff       	jmp    b28 <test_copy_on_write_main_child_alt+0x68>
     cef:	90                   	nop
     cf0:	89 95 0c ff ff ff    	mov    %edx,-0xf4(%ebp)
     cf6:	89 f7                	mov    %esi,%edi
     cf8:	89 c2                	mov    %eax,%edx
     cfa:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d00:	8b 85 10 ff ff ff    	mov    -0xf0(%ebp),%eax
     d06:	39 c6                	cmp    %eax,%esi
     d08:	73 1b                	jae    d25 <test_copy_on_write_main_child_alt+0x265>
     d0a:	89 f1                	mov    %esi,%ecx
          found_wrong_memory = 1;
     d0c:	bb 01 00 00 00       	mov    $0x1,%ebx
     d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d18:	80 39 41             	cmpb   $0x41,(%ecx)
     d1b:	0f 45 d3             	cmovne %ebx,%edx
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d1e:	83 c1 01             	add    $0x1,%ecx
     d21:	39 c8                	cmp    %ecx,%eax
     d23:	75 f3                	jne    d18 <test_copy_on_write_main_child_alt+0x258>
      int place_one = size / 2;
     d25:	8b 4d 0c             	mov    0xc(%ebp),%ecx
          place_two = size - 1;
     d28:	8b 45 0c             	mov    0xc(%ebp),%eax
      int place_one = size / 2;
     d2b:	c1 e9 1f             	shr    $0x1f,%ecx
     d2e:	03 4d 0c             	add    0xc(%ebp),%ecx
     d31:	d1 f9                	sar    %ecx
      old_end_of_heap[place_one] = 'B' + i;
     d33:	01 f1                	add    %esi,%ecx
     d35:	89 cb                	mov    %ecx,%ebx
     d37:	89 8d 08 ff ff ff    	mov    %ecx,-0xf8(%ebp)
     d3d:	8d 4f 42             	lea    0x42(%edi),%ecx
     d40:	88 0b                	mov    %cl,(%ebx)
      int place_two = 4096 * i;
     d42:	89 f9                	mov    %edi,%ecx
          place_two = size - 1;
     d44:	8d 58 ff             	lea    -0x1(%eax),%ebx
      int place_two = 4096 * i;
     d47:	c1 e1 0c             	shl    $0xc,%ecx
          place_two = size - 1;
     d4a:	39 c8                	cmp    %ecx,%eax
     d4c:	0f 4f d9             	cmovg  %ecx,%ebx
      int place_three = 4096 * (i - 1);
     d4f:	81 e9 00 10 00 00    	sub    $0x1000,%ecx
      old_end_of_heap[place_two] = 'C' + i;
     d55:	01 f3                	add    %esi,%ebx
      if (place_three >= size || place_three < 0) {
     d57:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
      old_end_of_heap[place_two] = 'C' + i;
     d5a:	89 d8                	mov    %ebx,%eax
     d5c:	89 9d 04 ff ff ff    	mov    %ebx,-0xfc(%ebp)
     d62:	8d 5f 43             	lea    0x43(%edi),%ebx
     d65:	88 18                	mov    %bl,(%eax)
      if (place_three >= size || place_three < 0) {
     d67:	0f 8e db 00 00 00    	jle    e48 <test_copy_on_write_main_child_alt+0x388>
     d6d:	85 c9                	test   %ecx,%ecx
     d6f:	0f 88 d3 00 00 00    	js     e48 <test_copy_on_write_main_child_alt+0x388>
      int place_four = 4096 * (i + 1);
     d75:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
     d7b:	c1 e0 0c             	shl    $0xc,%eax
     d7e:	89 c3                	mov    %eax,%ebx
          place_four = size - 3;
     d80:	8b 45 0c             	mov    0xc(%ebp),%eax
     d83:	83 e8 03             	sub    $0x3,%eax
     d86:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
     d89:	0f 4e d8             	cmovle %eax,%ebx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     d8c:	01 f1                	add    %esi,%ecx
     d8e:	80 39 41             	cmpb   $0x41,(%ecx)
     d91:	0f 84 09 01 00 00    	je     ea0 <test_copy_on_write_main_child_alt+0x3e0>
          found_wrong_memory = 1;
     d97:	ba 01 00 00 00       	mov    $0x1,%edx
      sleep(5);
     d9c:	83 ec 0c             	sub    $0xc,%esp
     d9f:	89 95 10 ff ff ff    	mov    %edx,-0xf0(%ebp)
     da5:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
     dab:	6a 05                	push   $0x5
     dad:	e8 10 10 00 00       	call   1dc2 <sleep>
      if (old_end_of_heap[place_three] != 'A' || 
     db2:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     db8:	83 c4 10             	add    $0x10,%esp
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     dbb:	b8 86 22 00 00       	mov    $0x2286,%eax
      if (old_end_of_heap[place_three] != 'A' || 
     dc0:	8b 95 10 ff ff ff    	mov    -0xf0(%ebp),%edx
     dc6:	80 39 41             	cmpb   $0x41,(%ecx)
     dc9:	0f 84 89 00 00 00    	je     e58 <test_copy_on_write_main_child_alt+0x398>
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     dcf:	83 ec 04             	sub    $0x4,%esp
     dd2:	6a 01                	push   $0x1
     dd4:	50                   	push   %eax
     dd5:	ff b4 fd 6c ff ff ff 	pushl  -0x94(%ebp,%edi,8)
     ddc:	e8 71 0f 00 00       	call   1d52 <write>
      if (early_term) {
     de1:	8b 4d 18             	mov    0x18(%ebp),%ecx
     de4:	83 c4 10             	add    $0x10,%esp
     de7:	85 c9                	test   %ecx,%ecx
     de9:	74 55                	je     e40 <test_copy_on_write_main_child_alt+0x380>
          exit();
     deb:	e8 42 0f 00 00       	call   1d32 <exit>
    buffer[1] = failed_code;
     df0:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     df2:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     df5:	c6 85 26 ff ff ff 4e 	movb   $0x4e,-0xda(%ebp)
    buffer[1] = failed_code;
     dfc:	88 85 27 ff ff ff    	mov    %al,-0xd9(%ebp)
    write(result_fd, buffer, 2);
     e02:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     e08:	6a 02                	push   $0x2
     e0a:	50                   	push   %eax
     e0b:	ff 75 08             	pushl  0x8(%ebp)
     e0e:	e8 3f 0f 00 00       	call   1d52 <write>
     e13:	83 c4 10             	add    $0x10,%esp
}
     e16:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e19:	5b                   	pop    %ebx
     e1a:	5e                   	pop    %esi
     e1b:	5f                   	pop    %edi
     e1c:	5d                   	pop    %ebp
     e1d:	c3                   	ret    
     e1e:	66 90                	xchg   %ax,%ax
     e20:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
  char failed_code = ' ';
     e26:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     e2b:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     e32:	00 00 00 
     e35:	e9 6b fd ff ff       	jmp    ba5 <test_copy_on_write_main_child_alt+0xe5>
     e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          wait_forever();
     e40:	e8 8b f9 ff ff       	call   7d0 <wait_forever>
     e45:	8d 76 00             	lea    0x0(%esi),%esi
          place_three = size - 2;
     e48:	8b 45 0c             	mov    0xc(%ebp),%eax
     e4b:	8d 48 fe             	lea    -0x2(%eax),%ecx
     e4e:	e9 22 ff ff ff       	jmp    d75 <test_copy_on_write_main_child_alt+0x2b5>
     e53:	90                   	nop
     e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (old_end_of_heap[place_three] != 'A' || 
     e58:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     e5c:	0f 85 6d ff ff ff    	jne    dcf <test_copy_on_write_main_child_alt+0x30f>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     e62:	8b 8d 04 ff ff ff    	mov    -0xfc(%ebp),%ecx
     e68:	0f be 19             	movsbl (%ecx),%ebx
     e6b:	8d 4f 43             	lea    0x43(%edi),%ecx
          old_end_of_heap[place_four] != 'A' ||
     e6e:	39 cb                	cmp    %ecx,%ebx
     e70:	0f 85 59 ff ff ff    	jne    dcf <test_copy_on_write_main_child_alt+0x30f>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     e76:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
     e7c:	0f be 08             	movsbl (%eax),%ecx
     e7f:	8d 47 42             	lea    0x42(%edi),%eax
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     e82:	39 c1                	cmp    %eax,%ecx
     e84:	75 0e                	jne    e94 <test_copy_on_write_main_child_alt+0x3d4>
     e86:	83 e2 01             	and    $0x1,%edx
     e89:	b8 88 22 00 00       	mov    $0x2288,%eax
     e8e:	0f 84 3b ff ff ff    	je     dcf <test_copy_on_write_main_child_alt+0x30f>
     e94:	b8 86 22 00 00       	mov    $0x2286,%eax
     e99:	e9 31 ff ff ff       	jmp    dcf <test_copy_on_write_main_child_alt+0x30f>
     e9e:	66 90                	xchg   %ax,%ax
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     ea0:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
     ea6:	0f be 00             	movsbl (%eax),%eax
     ea9:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
     eaf:	8d 47 42             	lea    0x42(%edi),%eax
     eb2:	39 85 14 ff ff ff    	cmp    %eax,-0xec(%ebp)
     eb8:	0f 85 d9 fe ff ff    	jne    d97 <test_copy_on_write_main_child_alt+0x2d7>
          found_wrong_memory = 1;
     ebe:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     ec2:	b8 01 00 00 00       	mov    $0x1,%eax
     ec7:	0f 45 d0             	cmovne %eax,%edx
     eca:	e9 cd fe ff ff       	jmp    d9c <test_copy_on_write_main_child_alt+0x2dc>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     ecf:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
  char failed_code = ' ';
     ed5:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     eda:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     ee1:	00 00 00 
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     ee4:	0f 82 8d fd ff ff    	jb     c77 <test_copy_on_write_main_child_alt+0x1b7>
     eea:	e9 c5 fd ff ff       	jmp    cb4 <test_copy_on_write_main_child_alt+0x1f4>
     eef:	90                   	nop

00000ef0 <test_copy_on_write_less_forks>:

int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	56                   	push   %esi
     ef4:	53                   	push   %ebx
  int fds[2];
  pipe(fds);
     ef5:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     ef8:	83 ec 1c             	sub    $0x1c,%esp
     efb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     efe:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
     f01:	50                   	push   %eax
     f02:	e8 3b 0e 00 00       	call   1d42 <pipe>
  test_copy_on_write_main_child(fds[1], size, describe_size, forks);
     f07:	56                   	push   %esi
     f08:	53                   	push   %ebx
     f09:	ff 75 08             	pushl  0x8(%ebp)
     f0c:	ff 75 f4             	pushl  -0xc(%ebp)
     f0f:	e8 ec f8 ff ff       	call   800 <test_copy_on_write_main_child>
  char text[2] = {'X', 'X'};
     f14:	b8 58 58 00 00       	mov    $0x5858,%eax
  read(fds[0], text, 2);
     f19:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
     f1c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  read(fds[0], text, 2);
     f20:	8d 45 ee             	lea    -0x12(%ebp),%eax
     f23:	6a 02                	push   $0x2
     f25:	50                   	push   %eax
     f26:	ff 75 f0             	pushl  -0x10(%ebp)
     f29:	e8 1c 0e 00 00       	call   1d4a <read>
  close(fds[0]); close(fds[1]);
     f2e:	5a                   	pop    %edx
     f2f:	ff 75 f0             	pushl  -0x10(%ebp)
     f32:	e8 23 0e 00 00       	call   1d5a <close>
     f37:	59                   	pop    %ecx
     f38:	ff 75 f4             	pushl  -0xc(%ebp)
     f3b:	e8 1a 0e 00 00       	call   1d5a <close>
  if (text[0] == 'X') {
     f40:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
     f44:	83 c4 10             	add    $0x10,%esp
     f47:	3c 58                	cmp    $0x58,%al
     f49:	74 75                	je     fc0 <test_copy_on_write_less_forks+0xd0>
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    return 0;
  } else if (text[0] == 'N') {
     f4b:	3c 4e                	cmp    $0x4e,%al
     f4d:	75 39                	jne    f88 <test_copy_on_write_less_forks+0x98>
    switch (text[1]) {
     f4f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     f53:	3c 63                	cmp    $0x63,%al
     f55:	0f 84 a5 00 00 00    	je     1000 <test_copy_on_write_less_forks+0x110>
     f5b:	0f 8e 7f 00 00 00    	jle    fe0 <test_copy_on_write_less_forks+0xf0>
     f61:	3c 66                	cmp    $0x66,%al
     f63:	74 43                	je     fa8 <test_copy_on_write_less_forks+0xb8>
     f65:	3c 70                	cmp    $0x70,%al
     f67:	0f 85 b3 00 00 00    	jne    1020 <test_copy_on_write_less_forks+0x130>
    case 'f':
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
      break;
    case 'p':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
     f6d:	83 ec 08             	sub    $0x8,%esp
     f70:	68 e4 25 00 00       	push   $0x25e4
     f75:	6a 01                	push   $0x1
     f77:	e8 34 0f 00 00       	call   1eb0 <printf>
      break;
     f7c:	83 c4 10             	add    $0x10,%esp
      break;
    default:
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
      break;
    }
    return 0;
     f7f:	31 c0                	xor    %eax,%eax
      break;
     f81:	eb 1b                	jmp    f9e <test_copy_on_write_less_forks+0xae>
     f83:	90                   	nop
     f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
     f88:	56                   	push   %esi
     f89:	53                   	push   %ebx
     f8a:	68 f0 26 00 00       	push   $0x26f0
     f8f:	6a 01                	push   $0x1
     f91:	e8 1a 0f 00 00       	call   1eb0 <printf>
           "fork %d children; read+write small parts in each child\n",
           describe_size, forks);
    return 1;
     f96:	83 c4 10             	add    $0x10,%esp
     f99:	b8 01 00 00 00       	mov    $0x1,%eax
  }
}
     f9e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     fa1:	5b                   	pop    %ebx
     fa2:	5e                   	pop    %esi
     fa3:	5d                   	pop    %ebp
     fa4:	c3                   	ret    
     fa5:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
     fa8:	83 ec 08             	sub    $0x8,%esp
     fab:	68 ac 25 00 00       	push   $0x25ac
     fb0:	6a 01                	push   $0x1
     fb2:	e8 f9 0e 00 00       	call   1eb0 <printf>
      break;
     fb7:	83 c4 10             	add    $0x10,%esp
    return 0;
     fba:	31 c0                	xor    %eax,%eax
      break;
     fbc:	eb e0                	jmp    f9e <test_copy_on_write_less_forks+0xae>
     fbe:	66 90                	xchg   %ax,%ax
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 7c 25 00 00       	push   $0x257c
     fc8:	6a 01                	push   $0x1
     fca:	e8 e1 0e 00 00       	call   1eb0 <printf>
    return 0;
     fcf:	83 c4 10             	add    $0x10,%esp
}
     fd2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
     fd5:	31 c0                	xor    %eax,%eax
}
     fd7:	5b                   	pop    %ebx
     fd8:	5e                   	pop    %esi
     fd9:	5d                   	pop    %ebp
     fda:	c3                   	ret    
     fdb:	90                   	nop
     fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch (text[1]) {
     fe0:	3c 50                	cmp    $0x50,%al
     fe2:	75 3c                	jne    1020 <test_copy_on_write_less_forks+0x130>
      printf(1, FAIL_MSG "copy on write test failed --- pipe read problem\n");
     fe4:	83 ec 08             	sub    $0x8,%esp
     fe7:	68 30 26 00 00       	push   $0x2630
     fec:	6a 01                	push   $0x1
     fee:	e8 bd 0e 00 00       	call   1eb0 <printf>
      break;
     ff3:	83 c4 10             	add    $0x10,%esp
    return 0;
     ff6:	31 c0                	xor    %eax,%eax
      break;
     ff8:	eb a4                	jmp    f9e <test_copy_on_write_less_forks+0xae>
     ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1000:	83 ec 08             	sub    $0x8,%esp
    1003:	68 6c 26 00 00       	push   $0x266c
    1008:	6a 01                	push   $0x1
    100a:	e8 a1 0e 00 00       	call   1eb0 <printf>
      break;
    100f:	83 c4 10             	add    $0x10,%esp
    return 0;
    1012:	31 c0                	xor    %eax,%eax
      break;
    1014:	eb 88                	jmp    f9e <test_copy_on_write_less_forks+0xae>
    1016:	8d 76 00             	lea    0x0(%esi),%esi
    1019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    1020:	83 ec 08             	sub    $0x8,%esp
    1023:	68 b8 26 00 00       	push   $0x26b8
    1028:	6a 01                	push   $0x1
    102a:	e8 81 0e 00 00       	call   1eb0 <printf>
      break;
    102f:	83 c4 10             	add    $0x10,%esp
    return 0;
    1032:	31 c0                	xor    %eax,%eax
      break;
    1034:	e9 65 ff ff ff       	jmp    f9e <test_copy_on_write_less_forks+0xae>
    1039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001040 <test_copy_on_write_less_forks_alt>:

int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	56                   	push   %esi
    1044:	53                   	push   %ebx
  int fds[2];
  pipe(fds);
    1045:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    1048:	83 ec 1c             	sub    $0x1c,%esp
    104b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    104e:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
    1051:	50                   	push   %eax
    1052:	e8 eb 0c 00 00       	call   1d42 <pipe>
  test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    1057:	58                   	pop    %eax
    1058:	ff 75 14             	pushl  0x14(%ebp)
    105b:	56                   	push   %esi
    105c:	53                   	push   %ebx
    105d:	ff 75 08             	pushl  0x8(%ebp)
    1060:	ff 75 f4             	pushl  -0xc(%ebp)
    1063:	e8 58 fa ff ff       	call   ac0 <test_copy_on_write_main_child_alt>
  char text[2] = {'X', 'X'};
  read(fds[0], text, 2);
    1068:	8d 45 ee             	lea    -0x12(%ebp),%eax
    106b:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
    106e:	ba 58 58 00 00       	mov    $0x5858,%edx
  read(fds[0], text, 2);
    1073:	6a 02                	push   $0x2
  char text[2] = {'X', 'X'};
    1075:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  read(fds[0], text, 2);
    1079:	50                   	push   %eax
    107a:	ff 75 f0             	pushl  -0x10(%ebp)
    107d:	e8 c8 0c 00 00       	call   1d4a <read>
  close(fds[0]); close(fds[1]);
    1082:	59                   	pop    %ecx
    1083:	ff 75 f0             	pushl  -0x10(%ebp)
    1086:	e8 cf 0c 00 00       	call   1d5a <close>
    108b:	58                   	pop    %eax
    108c:	ff 75 f4             	pushl  -0xc(%ebp)
    108f:	e8 c6 0c 00 00       	call   1d5a <close>
  if (text[0] == 'X') {
    1094:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1098:	83 c4 10             	add    $0x10,%esp
    109b:	3c 58                	cmp    $0x58,%al
    109d:	0f 84 7d 00 00 00    	je     1120 <test_copy_on_write_less_forks_alt+0xe0>
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    return 0;
  } else if (text[0] == 'N') {
    10a3:	3c 4e                	cmp    $0x4e,%al
    10a5:	75 39                	jne    10e0 <test_copy_on_write_less_forks_alt+0xa0>
    switch (text[1]) {
    10a7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    10ab:	3c 66                	cmp    $0x66,%al
    10ad:	0f 84 ad 00 00 00    	je     1160 <test_copy_on_write_less_forks_alt+0x120>
    10b3:	3c 70                	cmp    $0x70,%al
    10b5:	0f 84 85 00 00 00    	je     1140 <test_copy_on_write_less_forks_alt+0x100>
    10bb:	3c 63                	cmp    $0x63,%al
    10bd:	74 41                	je     1100 <test_copy_on_write_less_forks_alt+0xc0>
      break;
    case 'c':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
      break;
    default:
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    10bf:	83 ec 08             	sub    $0x8,%esp
    10c2:	68 b8 26 00 00       	push   $0x26b8
    10c7:	6a 01                	push   $0x1
    10c9:	e8 e2 0d 00 00       	call   1eb0 <printf>
      break;
    10ce:	83 c4 10             	add    $0x10,%esp
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
           "fork %d children; read+write small parts in each child\n",
           describe_size, forks);
    return 1;
  }
}
    10d1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    10d4:	31 c0                	xor    %eax,%eax
}
    10d6:	5b                   	pop    %ebx
    10d7:	5e                   	pop    %esi
    10d8:	5d                   	pop    %ebp
    10d9:	c3                   	ret    
    10da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
    10e0:	56                   	push   %esi
    10e1:	53                   	push   %ebx
    10e2:	68 f0 26 00 00       	push   $0x26f0
    10e7:	6a 01                	push   $0x1
    10e9:	e8 c2 0d 00 00       	call   1eb0 <printf>
    return 1;
    10ee:	83 c4 10             	add    $0x10,%esp
}
    10f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 1;
    10f4:	b8 01 00 00 00       	mov    $0x1,%eax
}
    10f9:	5b                   	pop    %ebx
    10fa:	5e                   	pop    %esi
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1100:	83 ec 08             	sub    $0x8,%esp
    1103:	68 6c 26 00 00       	push   $0x266c
    1108:	6a 01                	push   $0x1
    110a:	e8 a1 0d 00 00       	call   1eb0 <printf>
      break;
    110f:	83 c4 10             	add    $0x10,%esp
}
    1112:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1115:	31 c0                	xor    %eax,%eax
}
    1117:	5b                   	pop    %ebx
    1118:	5e                   	pop    %esi
    1119:	5d                   	pop    %ebp
    111a:	c3                   	ret    
    111b:	90                   	nop
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1120:	83 ec 08             	sub    $0x8,%esp
    1123:	68 7c 25 00 00       	push   $0x257c
    1128:	6a 01                	push   $0x1
    112a:	e8 81 0d 00 00       	call   1eb0 <printf>
    return 0;
    112f:	83 c4 10             	add    $0x10,%esp
}
    1132:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1135:	31 c0                	xor    %eax,%eax
}
    1137:	5b                   	pop    %ebx
    1138:	5e                   	pop    %esi
    1139:	5d                   	pop    %ebp
    113a:	c3                   	ret    
    113b:	90                   	nop
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    1140:	83 ec 08             	sub    $0x8,%esp
    1143:	68 e4 25 00 00       	push   $0x25e4
    1148:	6a 01                	push   $0x1
    114a:	e8 61 0d 00 00       	call   1eb0 <printf>
      break;
    114f:	83 c4 10             	add    $0x10,%esp
}
    1152:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1155:	31 c0                	xor    %eax,%eax
}
    1157:	5b                   	pop    %ebx
    1158:	5e                   	pop    %esi
    1159:	5d                   	pop    %ebp
    115a:	c3                   	ret    
    115b:	90                   	nop
    115c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1160:	83 ec 08             	sub    $0x8,%esp
    1163:	68 ac 25 00 00       	push   $0x25ac
    1168:	6a 01                	push   $0x1
    116a:	e8 41 0d 00 00       	call   1eb0 <printf>
      break;
    116f:	83 c4 10             	add    $0x10,%esp
}
    1172:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1175:	31 c0                	xor    %eax,%eax
}
    1177:	5b                   	pop    %ebx
    1178:	5e                   	pop    %esi
    1179:	5d                   	pop    %ebp
    117a:	c3                   	ret    
    117b:	90                   	nop
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001180 <_test_copy_on_write>:

int _test_copy_on_write(int size,  const char *describe_size, int forks, int use_alt, int early_term, int pre_alloc, const char* describe_prealloc) {
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	83 ec 44             	sub    $0x44,%esp
  int fds[2];
  pipe(fds);
    1186:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1189:	50                   	push   %eax
    118a:	e8 b3 0b 00 00       	call   1d42 <pipe>
  int pid = fork();
    118f:	e8 96 0b 00 00       	call   1d2a <fork>
  if (pid == 0) {
    1194:	83 c4 10             	add    $0x10,%esp
    1197:	83 f8 00             	cmp    $0x0,%eax
    119a:	0f 84 d6 01 00 00    	je     1376 <_test_copy_on_write+0x1f6>
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    } else {
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    }
    exit();
  } else if (pid > 0) {
    11a0:	7f 16                	jg     11b8 <_test_copy_on_write+0x38>
    11a2:	89 c2                	mov    %eax,%edx
      return 1;
    }
  } else if (pid == -1) {
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
  }
  return 0;
    11a4:	31 c0                	xor    %eax,%eax
  } else if (pid == -1) {
    11a6:	83 fa ff             	cmp    $0xffffffff,%edx
    11a9:	0f 84 11 01 00 00    	je     12c0 <_test_copy_on_write+0x140>
}
    11af:	c9                   	leave  
    11b0:	c3                   	ret    
    11b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "running copy on write test: ");
    11b8:	83 ec 08             	sub    $0x8,%esp
    11bb:	68 97 22 00 00       	push   $0x2297
    11c0:	6a 01                	push   $0x1
    11c2:	e8 e9 0c 00 00       	call   1eb0 <printf>
    if (pre_alloc > 0) {
    11c7:	8b 45 1c             	mov    0x1c(%ebp),%eax
    11ca:	83 c4 10             	add    $0x10,%esp
    11cd:	85 c0                	test   %eax,%eax
    11cf:	7e 15                	jle    11e6 <_test_copy_on_write+0x66>
      printf(1, "allocate but do not use %s; ", describe_prealloc);
    11d1:	83 ec 04             	sub    $0x4,%esp
    11d4:	ff 75 20             	pushl  0x20(%ebp)
    11d7:	68 b4 22 00 00       	push   $0x22b4
    11dc:	6a 01                	push   $0x1
    11de:	e8 cd 0c 00 00       	call   1eb0 <printf>
    11e3:	83 c4 10             	add    $0x10,%esp
    printf(1, "allocate and use %s; fork %d children; read+write small parts in each child",
    11e6:	ff 75 10             	pushl  0x10(%ebp)
    11e9:	ff 75 0c             	pushl  0xc(%ebp)
    11ec:	68 60 27 00 00       	push   $0x2760
    11f1:	6a 01                	push   $0x1
    11f3:	e8 b8 0c 00 00       	call   1eb0 <printf>
    if (use_alt) {
    11f8:	8b 45 14             	mov    0x14(%ebp),%eax
    11fb:	83 c4 10             	add    $0x10,%esp
    11fe:	85 c0                	test   %eax,%eax
    1200:	0f 85 da 00 00 00    	jne    12e0 <_test_copy_on_write+0x160>
    printf(1, "\n");
    1206:	83 ec 08             	sub    $0x8,%esp
    1209:	68 62 22 00 00       	push   $0x2262
    120e:	6a 01                	push   $0x1
    1210:	e8 9b 0c 00 00       	call   1eb0 <printf>
    close(fds[1]);
    1215:	5a                   	pop    %edx
    1216:	ff 75 e8             	pushl  -0x18(%ebp)
    char text[10] = {'X', 'X'};
    1219:	b8 58 58 00 00       	mov    $0x5858,%eax
    121e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1225:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    122c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    close(fds[1]);
    1230:	e8 25 0b 00 00       	call   1d5a <close>
    read(fds[0], text, 10);
    1235:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1238:	83 c4 0c             	add    $0xc,%esp
    123b:	6a 0a                	push   $0xa
    123d:	50                   	push   %eax
    123e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1241:	e8 04 0b 00 00       	call   1d4a <read>
    wait();
    1246:	e8 ef 0a 00 00       	call   1d3a <wait>
    close(fds[0]);
    124b:	59                   	pop    %ecx
    124c:	ff 75 e4             	pushl  -0x1c(%ebp)
    124f:	e8 06 0b 00 00       	call   1d5a <close>
    if (text[0] == 'X') {
    1254:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1258:	83 c4 10             	add    $0x10,%esp
    125b:	3c 58                	cmp    $0x58,%al
    125d:	0f 84 9d 00 00 00    	je     1300 <_test_copy_on_write+0x180>
    } else if (text[0] == 'N') {
    1263:	3c 4e                	cmp    $0x4e,%al
    1265:	75 39                	jne    12a0 <_test_copy_on_write+0x120>
      switch (text[1]) {
    1267:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    126b:	3c 66                	cmp    $0x66,%al
    126d:	0f 84 ad 00 00 00    	je     1320 <_test_copy_on_write+0x1a0>
    1273:	3c 70                	cmp    $0x70,%al
    1275:	0f 84 e5 00 00 00    	je     1360 <_test_copy_on_write+0x1e0>
    127b:	3c 63                	cmp    $0x63,%al
    127d:	0f 84 bd 00 00 00    	je     1340 <_test_copy_on_write+0x1c0>
        printf(1, FAIL_MSG "copy on write test failed --- unknown reason\n");
    1283:	83 ec 08             	sub    $0x8,%esp
    1286:	68 b8 26 00 00       	push   $0x26b8
    128b:	6a 01                	push   $0x1
    128d:	e8 1e 0c 00 00       	call   1eb0 <printf>
        break;
    1292:	83 c4 10             	add    $0x10,%esp
      return 0;
    1295:	31 c0                	xor    %eax,%eax
}
    1297:	c9                   	leave  
    1298:	c3                   	ret    
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, PASS_MSG "copy on write test passed\n");
    12a0:	83 ec 08             	sub    $0x8,%esp
    12a3:	68 dc 27 00 00       	push   $0x27dc
    12a8:	6a 01                	push   $0x1
    12aa:	e8 01 0c 00 00       	call   1eb0 <printf>
      return 1;
    12af:	83 c4 10             	add    $0x10,%esp
    12b2:	b8 01 00 00 00       	mov    $0x1,%eax
}
    12b7:	c9                   	leave  
    12b8:	c3                   	ret    
    12b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
    12c0:	83 ec 08             	sub    $0x8,%esp
    12c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    12c6:	68 04 28 00 00       	push   $0x2804
    12cb:	6a 01                	push   $0x1
    12cd:	e8 de 0b 00 00       	call   1eb0 <printf>
    12d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    12d5:	83 c4 10             	add    $0x10,%esp
}
    12d8:	c9                   	leave  
    12d9:	c3                   	ret    
    12da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, " [and try to keep children running in parallel]");
    12e0:	83 ec 08             	sub    $0x8,%esp
    12e3:	68 ac 27 00 00       	push   $0x27ac
    12e8:	6a 01                	push   $0x1
    12ea:	e8 c1 0b 00 00       	call   1eb0 <printf>
    12ef:	83 c4 10             	add    $0x10,%esp
    12f2:	e9 0f ff ff ff       	jmp    1206 <_test_copy_on_write+0x86>
    12f7:	89 f6                	mov    %esi,%esi
    12f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1300:	83 ec 08             	sub    $0x8,%esp
    1303:	68 7c 25 00 00       	push   $0x257c
    1308:	6a 01                	push   $0x1
    130a:	e8 a1 0b 00 00       	call   1eb0 <printf>
      return 0;
    130f:	83 c4 10             	add    $0x10,%esp
    1312:	31 c0                	xor    %eax,%eax
}
    1314:	c9                   	leave  
    1315:	c3                   	ret    
    1316:	8d 76 00             	lea    0x0(%esi),%esi
    1319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1320:	83 ec 08             	sub    $0x8,%esp
    1323:	68 ac 25 00 00       	push   $0x25ac
    1328:	6a 01                	push   $0x1
    132a:	e8 81 0b 00 00       	call   1eb0 <printf>
        break;
    132f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1332:	31 c0                	xor    %eax,%eax
}
    1334:	c9                   	leave  
    1335:	c3                   	ret    
    1336:	8d 76 00             	lea    0x0(%esi),%esi
    1339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1340:	83 ec 08             	sub    $0x8,%esp
    1343:	68 6c 26 00 00       	push   $0x266c
    1348:	6a 01                	push   $0x1
    134a:	e8 61 0b 00 00       	call   1eb0 <printf>
        break;
    134f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1352:	31 c0                	xor    %eax,%eax
}
    1354:	c9                   	leave  
    1355:	c3                   	ret    
    1356:	8d 76 00             	lea    0x0(%esi),%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    1360:	83 ec 08             	sub    $0x8,%esp
    1363:	68 e4 25 00 00       	push   $0x25e4
    1368:	6a 01                	push   $0x1
    136a:	e8 41 0b 00 00       	call   1eb0 <printf>
        break;
    136f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1372:	31 c0                	xor    %eax,%eax
}
    1374:	c9                   	leave  
    1375:	c3                   	ret    
    if (pre_alloc > 0) {
    1376:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
    137a:	7e 0e                	jle    138a <_test_copy_on_write+0x20a>
      sbrk(pre_alloc);
    137c:	83 ec 0c             	sub    $0xc,%esp
    137f:	ff 75 1c             	pushl  0x1c(%ebp)
    1382:	e8 33 0a 00 00       	call   1dba <sbrk>
    1387:	83 c4 10             	add    $0x10,%esp
    if (use_alt) {
    138a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    138e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1391:	74 1d                	je     13b0 <_test_copy_on_write+0x230>
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    1393:	83 ec 0c             	sub    $0xc,%esp
    1396:	ff 75 18             	pushl  0x18(%ebp)
    1399:	ff 75 10             	pushl  0x10(%ebp)
    139c:	ff 75 0c             	pushl  0xc(%ebp)
    139f:	ff 75 08             	pushl  0x8(%ebp)
    13a2:	50                   	push   %eax
    13a3:	e8 18 f7 ff ff       	call   ac0 <test_copy_on_write_main_child_alt>
    13a8:	83 c4 20             	add    $0x20,%esp
    exit();
    13ab:	e8 82 09 00 00       	call   1d32 <exit>
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    13b0:	ff 75 10             	pushl  0x10(%ebp)
    13b3:	ff 75 0c             	pushl  0xc(%ebp)
    13b6:	ff 75 08             	pushl  0x8(%ebp)
    13b9:	50                   	push   %eax
    13ba:	e8 41 f4 ff ff       	call   800 <test_copy_on_write_main_child>
    13bf:	83 c4 10             	add    $0x10,%esp
    13c2:	eb e7                	jmp    13ab <_test_copy_on_write+0x22b>
    13c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000013d0 <test_copy_on_write>:

int test_copy_on_write(int size, const char *describe_size, int forks) {
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
    13d6:	68 63 22 00 00       	push   $0x2263
    13db:	6a 00                	push   $0x0
    13dd:	6a 00                	push   $0x0
    13df:	6a 00                	push   $0x0
    13e1:	ff 75 10             	pushl  0x10(%ebp)
    13e4:	ff 75 0c             	pushl  0xc(%ebp)
    13e7:	ff 75 08             	pushl  0x8(%ebp)
    13ea:	e8 91 fd ff ff       	call   1180 <_test_copy_on_write>
}
    13ef:	c9                   	leave  
    13f0:	c3                   	ret    
    13f1:	eb 0d                	jmp    1400 <test_copy_on_write_alloc_unused>
    13f3:	90                   	nop
    13f4:	90                   	nop
    13f5:	90                   	nop
    13f6:	90                   	nop
    13f7:	90                   	nop
    13f8:	90                   	nop
    13f9:	90                   	nop
    13fa:	90                   	nop
    13fb:	90                   	nop
    13fc:	90                   	nop
    13fd:	90                   	nop
    13fe:	90                   	nop
    13ff:	90                   	nop

00001400 <test_copy_on_write_alloc_unused>:

int test_copy_on_write_alloc_unused(int unused_size, const char *describe_unused_size, int size, const char *describe_size, int forks) {
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
    1406:	ff 75 0c             	pushl  0xc(%ebp)
    1409:	ff 75 08             	pushl  0x8(%ebp)
    140c:	6a 00                	push   $0x0
    140e:	6a 00                	push   $0x0
    1410:	ff 75 18             	pushl  0x18(%ebp)
    1413:	ff 75 14             	pushl  0x14(%ebp)
    1416:	ff 75 10             	pushl  0x10(%ebp)
    1419:	e8 62 fd ff ff       	call   1180 <_test_copy_on_write>
}
    141e:	c9                   	leave  
    141f:	c3                   	ret    

00001420 <test_copy_on_write_alt>:

int test_copy_on_write_alt(int size, const char *describe_size, int forks) {
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
    1426:	68 63 22 00 00       	push   $0x2263
    142b:	6a 00                	push   $0x0
    142d:	6a 00                	push   $0x0
    142f:	6a 01                	push   $0x1
    1431:	ff 75 10             	pushl  0x10(%ebp)
    1434:	ff 75 0c             	pushl  0xc(%ebp)
    1437:	ff 75 08             	pushl  0x8(%ebp)
    143a:	e8 41 fd ff ff       	call   1180 <_test_copy_on_write>
}
    143f:	c9                   	leave  
    1440:	c3                   	ret    
    1441:	eb 0d                	jmp    1450 <test_read_into_alloc_no_fork>
    1443:	90                   	nop
    1444:	90                   	nop
    1445:	90                   	nop
    1446:	90                   	nop
    1447:	90                   	nop
    1448:	90                   	nop
    1449:	90                   	nop
    144a:	90                   	nop
    144b:	90                   	nop
    144c:	90                   	nop
    144d:	90                   	nop
    144e:	90                   	nop
    144f:	90                   	nop

00001450 <test_read_into_alloc_no_fork>:

int test_read_into_alloc_no_fork(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
    1454:	56                   	push   %esi
    1455:	53                   	push   %ebx
    1456:	83 ec 28             	sub    $0x28,%esp
    1459:	8b 5d 10             	mov    0x10(%ebp),%ebx
    printf(1, "testing read(), writing %d bytes to a location %s into a %s allocation\n",
    145c:	ff 75 14             	pushl  0x14(%ebp)
    145f:	ff 75 18             	pushl  0x18(%ebp)
    1462:	53                   	push   %ebx
    1463:	68 40 28 00 00       	push   $0x2840
    1468:	6a 01                	push   $0x1
    146a:	e8 41 0a 00 00       	call   1eb0 <printf>
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    146f:	83 c4 18             	add    $0x18,%esp
    1472:	68 01 02 00 00       	push   $0x201
    1477:	68 df 22 00 00       	push   $0x22df
    147c:	e8 f1 08 00 00       	call   1d72 <open>
    1481:	83 c4 10             	add    $0x10,%esp
    1484:	89 c6                	mov    %eax,%esi
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1486:	31 c0                	xor    %eax,%eax
    1488:	90                   	nop
    1489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    1490:	c6 80 00 32 00 00 58 	movb   $0x58,0x3200(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1497:	83 c0 01             	add    $0x1,%eax
    149a:	3d 80 00 00 00       	cmp    $0x80,%eax
    149f:	75 ef                	jne    1490 <test_read_into_alloc_no_fork+0x40>
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
    14a1:	85 db                	test   %ebx,%ebx
    14a3:	0f 8e 8d 01 00 00    	jle    1636 <test_read_into_alloc_no_fork+0x1e6>
    14a9:	31 ff                	xor    %edi,%edi
    14ab:	90                   	nop
    14ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        write(fd, buffer, sizeof buffer);
    14b0:	83 ec 04             	sub    $0x4,%esp
    14b3:	83 ef 80             	sub    $0xffffff80,%edi
    14b6:	68 80 00 00 00       	push   $0x80
    14bb:	68 00 32 00 00       	push   $0x3200
    14c0:	56                   	push   %esi
    14c1:	e8 8c 08 00 00       	call   1d52 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    14c6:	83 c4 10             	add    $0x10,%esp
    14c9:	39 fb                	cmp    %edi,%ebx
    14cb:	7f e3                	jg     14b0 <test_read_into_alloc_no_fork+0x60>
    }
    close(fd);
    14cd:	83 ec 0c             	sub    $0xc,%esp
    14d0:	56                   	push   %esi
    14d1:	e8 84 08 00 00       	call   1d5a <close>
    fd = open("tempfile", O_RDONLY);
    14d6:	58                   	pop    %eax
    14d7:	5a                   	pop    %edx
    14d8:	6a 00                	push   $0x0
    14da:	68 df 22 00 00       	push   $0x22df
    14df:	e8 8e 08 00 00       	call   1d72 <open>
    if (fd == -1) {
    14e4:	83 c4 10             	add    $0x10,%esp
    14e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    14ea:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    14ec:	0f 84 0a 01 00 00    	je     15fc <test_read_into_alloc_no_fork+0x1ac>
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    14f2:	83 ec 0c             	sub    $0xc,%esp
    14f5:	6a 00                	push   $0x0
    14f7:	e8 be 08 00 00       	call   1dba <sbrk>
    sbrk(size);
    14fc:	59                   	pop    %ecx
    14fd:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    1500:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1502:	e8 b3 08 00 00       	call   1dba <sbrk>
    char *loc = heap + offset;
    1507:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    150a:	83 c4 0c             	add    $0xc,%esp
    150d:	53                   	push   %ebx
    char *loc = heap + offset;
    150e:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1510:	51                   	push   %ecx
    1511:	56                   	push   %esi
    1512:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    1515:	e8 30 08 00 00       	call   1d4a <read>
    int failed_value = 0;
    failed_value = loc[-1] != '\0';
    151a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    int count = read(fd, loc, read_count);
    151d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    1520:	31 d2                	xor    %edx,%edx
    1522:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < read_count; ++i) {
        if (loc[i] != 'X') {
            failed_value = 1;
    1525:	bf 01 00 00 00       	mov    $0x1,%edi
    failed_value = loc[-1] != '\0';
    152a:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    152e:	0f 95 c2             	setne  %dl
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1531:	31 c0                	xor    %eax,%eax
    1533:	90                   	nop
    1534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            failed_value = 1;
    1538:	80 3c 01 58          	cmpb   $0x58,(%ecx,%eax,1)
    153c:	0f 45 d7             	cmovne %edi,%edx
    for (int i = 0; i < read_count; ++i) {
    153f:	83 c0 01             	add    $0x1,%eax
    1542:	39 c3                	cmp    %eax,%ebx
    1544:	7f f2                	jg     1538 <test_read_into_alloc_no_fork+0xe8>
    1546:	8b 7d 08             	mov    0x8(%ebp),%edi
    1549:	89 55 e0             	mov    %edx,-0x20(%ebp)
    154c:	f7 df                	neg    %edi
        }
    }
    if (loc[read_count] != '\0') {
    154e:	80 3c 19 00          	cmpb   $0x0,(%ecx,%ebx,1)
    1552:	75 4b                	jne    159f <test_read_into_alloc_no_fork+0x14f>
        failed_value = 1;
    }
    close(fd);
    1554:	83 ec 0c             	sub    $0xc,%esp
    1557:	56                   	push   %esi
    1558:	e8 fd 07 00 00       	call   1d5a <close>
    unlink("tempfile");
    155d:	c7 04 24 df 22 00 00 	movl   $0x22df,(%esp)
    1564:	e8 19 08 00 00       	call   1d82 <unlink>
    sbrk(-size);
    1569:	89 3c 24             	mov    %edi,(%esp)
    156c:	e8 49 08 00 00       	call   1dba <sbrk>
    if (count != read_count) {
    1571:	83 c4 10             	add    $0x10,%esp
    1574:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    1577:	8b 55 e0             	mov    -0x20(%ebp),%edx
    157a:	75 64                	jne    15e0 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong return value from read()\n");
        return 0;
    } else if (failed_value) {
    157c:	85 d2                	test   %edx,%edx
    157e:	75 44                	jne    15c4 <test_read_into_alloc_no_fork+0x174>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
        return 0;
    } else {
        printf(1, PASS_MSG "\n");
    1580:	83 ec 08             	sub    $0x8,%esp
    1583:	68 58 22 00 00       	push   $0x2258
    1588:	6a 01                	push   $0x1
    158a:	e8 21 09 00 00       	call   1eb0 <printf>
        return 1;
    158f:	83 c4 10             	add    $0x10,%esp
    }
}
    1592:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 1;
    1595:	b8 01 00 00 00       	mov    $0x1,%eax
}
    159a:	5b                   	pop    %ebx
    159b:	5e                   	pop    %esi
    159c:	5f                   	pop    %edi
    159d:	5d                   	pop    %ebp
    159e:	c3                   	ret    
    close(fd);
    159f:	83 ec 0c             	sub    $0xc,%esp
    15a2:	56                   	push   %esi
    15a3:	e8 b2 07 00 00       	call   1d5a <close>
    unlink("tempfile");
    15a8:	c7 04 24 df 22 00 00 	movl   $0x22df,(%esp)
    15af:	e8 ce 07 00 00       	call   1d82 <unlink>
    sbrk(-size);
    15b4:	89 3c 24             	mov    %edi,(%esp)
    15b7:	e8 fe 07 00 00       	call   1dba <sbrk>
    if (count != read_count) {
    15bc:	83 c4 10             	add    $0x10,%esp
    15bf:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    15c2:	75 1c                	jne    15e0 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    15c4:	83 ec 08             	sub    $0x8,%esp
    15c7:	68 b4 28 00 00       	push   $0x28b4
    15cc:	6a 01                	push   $0x1
    15ce:	e8 dd 08 00 00       	call   1eb0 <printf>
        return 0;
    15d3:	83 c4 10             	add    $0x10,%esp
}
    15d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    15d9:	31 c0                	xor    %eax,%eax
}
    15db:	5b                   	pop    %ebx
    15dc:	5e                   	pop    %esi
    15dd:	5f                   	pop    %edi
    15de:	5d                   	pop    %ebp
    15df:	c3                   	ret    
        printf(1, FAIL_MSG "wrong return value from read()\n");
    15e0:	83 ec 08             	sub    $0x8,%esp
    15e3:	68 88 28 00 00       	push   $0x2888
    15e8:	6a 01                	push   $0x1
    15ea:	e8 c1 08 00 00       	call   1eb0 <printf>
        return 0;
    15ef:	83 c4 10             	add    $0x10,%esp
}
    15f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    15f5:	31 c0                	xor    %eax,%eax
}
    15f7:	5b                   	pop    %ebx
    15f8:	5e                   	pop    %esi
    15f9:	5f                   	pop    %edi
    15fa:	5d                   	pop    %ebp
    15fb:	c3                   	ret    
        printf(2, "error opening tempfile");
    15fc:	83 ec 08             	sub    $0x8,%esp
    15ff:	68 d1 22 00 00       	push   $0x22d1
    1604:	6a 02                	push   $0x2
    1606:	e8 a5 08 00 00       	call   1eb0 <printf>
    char *heap = sbrk(0);
    160b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1612:	e8 a3 07 00 00       	call   1dba <sbrk>
    sbrk(size);
    1617:	59                   	pop    %ecx
    1618:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    161b:	89 c7                	mov    %eax,%edi
    sbrk(size);
    161d:	e8 98 07 00 00       	call   1dba <sbrk>
    char *loc = heap + offset;
    1622:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    1625:	83 c4 0c             	add    $0xc,%esp
    1628:	53                   	push   %ebx
    char *loc = heap + offset;
    1629:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    162b:	51                   	push   %ecx
    162c:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    162f:	6a ff                	push   $0xffffffff
    1631:	e9 df fe ff ff       	jmp    1515 <test_read_into_alloc_no_fork+0xc5>
    close(fd);
    1636:	83 ec 0c             	sub    $0xc,%esp
    1639:	56                   	push   %esi
    163a:	e8 1b 07 00 00       	call   1d5a <close>
    fd = open("tempfile", O_RDONLY);
    163f:	5e                   	pop    %esi
    1640:	5f                   	pop    %edi
    1641:	6a 00                	push   $0x0
    1643:	68 df 22 00 00       	push   $0x22df
    1648:	e8 25 07 00 00       	call   1d72 <open>
    if (fd == -1) {
    164d:	83 c4 10             	add    $0x10,%esp
    1650:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    1653:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    1655:	74 3f                	je     1696 <test_read_into_alloc_no_fork+0x246>
    char *heap = sbrk(0);
    1657:	83 ec 0c             	sub    $0xc,%esp
    165a:	6a 00                	push   $0x0
    165c:	e8 59 07 00 00       	call   1dba <sbrk>
    1661:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1663:	58                   	pop    %eax
    1664:	ff 75 08             	pushl  0x8(%ebp)
    1667:	e8 4e 07 00 00       	call   1dba <sbrk>
    char *loc = heap + offset;
    166c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    166f:	83 c4 0c             	add    $0xc,%esp
    1672:	53                   	push   %ebx
    char *loc = heap + offset;
    1673:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1675:	51                   	push   %ecx
    1676:	56                   	push   %esi
    1677:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    167a:	e8 cb 06 00 00       	call   1d4a <read>
    failed_value = loc[-1] != '\0';
    167f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    1682:	31 d2                	xor    %edx,%edx
    int count = read(fd, loc, read_count);
    1684:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    1687:	83 c4 10             	add    $0x10,%esp
    168a:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    168e:	0f 95 c2             	setne  %dl
    1691:	e9 b0 fe ff ff       	jmp    1546 <test_read_into_alloc_no_fork+0xf6>
        printf(2, "error opening tempfile");
    1696:	50                   	push   %eax
    1697:	50                   	push   %eax
    1698:	68 d1 22 00 00       	push   $0x22d1
    169d:	6a 02                	push   $0x2
    169f:	e8 0c 08 00 00       	call   1eb0 <printf>
    char *heap = sbrk(0);
    16a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16ab:	e8 0a 07 00 00       	call   1dba <sbrk>
    sbrk(size);
    16b0:	5a                   	pop    %edx
    16b1:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    16b4:	89 c7                	mov    %eax,%edi
    sbrk(size);
    16b6:	e8 ff 06 00 00       	call   1dba <sbrk>
    char *loc = heap + offset;
    16bb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    16be:	83 c4 0c             	add    $0xc,%esp
    16c1:	53                   	push   %ebx
    char *loc = heap + offset;
    16c2:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    16c4:	51                   	push   %ecx
    16c5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    16c8:	6a ff                	push   $0xffffffff
    16ca:	eb ae                	jmp    167a <test_read_into_alloc_no_fork+0x22a>
    16cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016d0 <test_read_into_alloc>:

int test_read_into_alloc(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    16d0:	55                   	push   %ebp
    16d1:	89 e5                	mov    %esp,%ebp
    16d3:	83 ec 24             	sub    $0x24,%esp
    int pipe_fds[2];
    pipe(pipe_fds);
    16d6:	8d 45 f0             	lea    -0x10(%ebp),%eax
    16d9:	50                   	push   %eax
    16da:	e8 63 06 00 00       	call   1d42 <pipe>
    int pid = fork();
    16df:	e8 46 06 00 00       	call   1d2a <fork>
    if (pid == 0) {
    16e4:	83 c4 10             	add    $0x10,%esp
    16e7:	85 c0                	test   %eax,%eax
    16e9:	74 33                	je     171e <test_read_into_alloc+0x4e>
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
    16eb:	83 ec 0c             	sub    $0xc,%esp
    16ee:	ff 75 f4             	pushl  -0xc(%ebp)
    16f1:	e8 64 06 00 00       	call   1d5a <close>
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
    16f6:	8d 45 ef             	lea    -0x11(%ebp),%eax
    16f9:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    16fc:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1700:	6a 01                	push   $0x1
    1702:	50                   	push   %eax
    1703:	ff 75 f0             	pushl  -0x10(%ebp)
    1706:	e8 3f 06 00 00       	call   1d4a <read>
        wait();
    170b:	e8 2a 06 00 00       	call   1d3a <wait>
        return result_str[0] == 'Y';
    1710:	83 c4 10             	add    $0x10,%esp
    1713:	31 c0                	xor    %eax,%eax
    1715:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
    }
}
    1719:	c9                   	leave  
        return result_str[0] == 'Y';
    171a:	0f 94 c0             	sete   %al
}
    171d:	c3                   	ret    
        close(pipe_fds[0]);
    171e:	83 ec 0c             	sub    $0xc,%esp
    1721:	ff 75 f0             	pushl  -0x10(%ebp)
    1724:	e8 31 06 00 00       	call   1d5a <close>
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    1729:	5a                   	pop    %edx
    172a:	ff 75 18             	pushl  0x18(%ebp)
    172d:	ff 75 14             	pushl  0x14(%ebp)
    1730:	ff 75 10             	pushl  0x10(%ebp)
    1733:	ff 75 0c             	pushl  0xc(%ebp)
    1736:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1739:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    173d:	e8 0e fd ff ff       	call   1450 <test_read_into_alloc_no_fork>
    1742:	83 c4 20             	add    $0x20,%esp
    1745:	85 c0                	test   %eax,%eax
    1747:	74 04                	je     174d <test_read_into_alloc+0x7d>
            result_str[0] = 'Y';
    1749:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    174d:	50                   	push   %eax
    174e:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1751:	6a 01                	push   $0x1
    1753:	50                   	push   %eax
    1754:	ff 75 f4             	pushl  -0xc(%ebp)
    1757:	e8 f6 05 00 00       	call   1d52 <write>
        exit();
    175c:	e8 d1 05 00 00       	call   1d32 <exit>
    1761:	eb 0d                	jmp    1770 <test_read_into_cow_less_forks>
    1763:	90                   	nop
    1764:	90                   	nop
    1765:	90                   	nop
    1766:	90                   	nop
    1767:	90                   	nop
    1768:	90                   	nop
    1769:	90                   	nop
    176a:	90                   	nop
    176b:	90                   	nop
    176c:	90                   	nop
    176d:	90                   	nop
    176e:	90                   	nop
    176f:	90                   	nop

00001770 <test_read_into_cow_less_forks>:

int test_read_into_cow_less_forks(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	57                   	push   %edi
    1774:	56                   	push   %esi
    1775:	53                   	push   %ebx
    1776:	83 ec 38             	sub    $0x38,%esp
    1779:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing read(), writing %d bytes to a location %s into a %s copy-on-write allocation\n",
    177c:	ff 75 14             	pushl  0x14(%ebp)
    177f:	ff 75 18             	pushl  0x18(%ebp)
    1782:	57                   	push   %edi
    1783:	68 e8 28 00 00       	push   $0x28e8
    1788:	6a 01                	push   $0x1
    178a:	e8 21 07 00 00       	call   1eb0 <printf>
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    178f:	83 c4 18             	add    $0x18,%esp
    1792:	68 01 02 00 00       	push   $0x201
    1797:	68 df 22 00 00       	push   $0x22df
    179c:	e8 d1 05 00 00       	call   1d72 <open>
    17a1:	83 c4 10             	add    $0x10,%esp
    17a4:	89 c3                	mov    %eax,%ebx
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
    17a6:	31 c0                	xor    %eax,%eax
    17a8:	90                   	nop
    17a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    17b0:	c6 80 80 31 00 00 58 	movb   $0x58,0x3180(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    17b7:	83 c0 01             	add    $0x1,%eax
    17ba:	3d 80 00 00 00       	cmp    $0x80,%eax
    17bf:	75 ef                	jne    17b0 <test_read_into_cow_less_forks+0x40>
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
    17c1:	85 ff                	test   %edi,%edi
    17c3:	7e 28                	jle    17ed <test_read_into_cow_less_forks+0x7d>
    17c5:	31 f6                	xor    %esi,%esi
    17c7:	89 f6                	mov    %esi,%esi
    17c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        write(fd, buffer, sizeof buffer);
    17d0:	83 ec 04             	sub    $0x4,%esp
    17d3:	83 ee 80             	sub    $0xffffff80,%esi
    17d6:	68 80 00 00 00       	push   $0x80
    17db:	68 80 31 00 00       	push   $0x3180
    17e0:	53                   	push   %ebx
    17e1:	e8 6c 05 00 00       	call   1d52 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    17e6:	83 c4 10             	add    $0x10,%esp
    17e9:	39 f7                	cmp    %esi,%edi
    17eb:	7f e3                	jg     17d0 <test_read_into_cow_less_forks+0x60>
    }
    close(fd);
    17ed:	83 ec 0c             	sub    $0xc,%esp
    17f0:	53                   	push   %ebx
    17f1:	e8 64 05 00 00       	call   1d5a <close>
    fd = open("tempfile", O_RDONLY);
    17f6:	58                   	pop    %eax
    17f7:	5a                   	pop    %edx
    17f8:	6a 00                	push   $0x0
    17fa:	68 df 22 00 00       	push   $0x22df
    17ff:	e8 6e 05 00 00       	call   1d72 <open>
    if (fd == -1) {
    1804:	83 c4 10             	add    $0x10,%esp
    1807:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    180a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    if (fd == -1) {
    180d:	0f 84 03 01 00 00    	je     1916 <test_read_into_cow_less_forks+0x1a6>
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    1813:	83 ec 0c             	sub    $0xc,%esp
    1816:	6a 00                	push   $0x0
    1818:	e8 9d 05 00 00       	call   1dba <sbrk>
    181d:	89 c3                	mov    %eax,%ebx
    sbrk(size);
    181f:	58                   	pop    %eax
    1820:	ff 75 08             	pushl  0x8(%ebp)
    1823:	e8 92 05 00 00       	call   1dba <sbrk>
    for (int i = 0; i < size; ++i) {
    1828:	8b 45 08             	mov    0x8(%ebp),%eax
    182b:	83 c4 10             	add    $0x10,%esp
    182e:	85 c0                	test   %eax,%eax
    1830:	7e 18                	jle    184a <test_read_into_cow_less_forks+0xda>
    1832:	8b 55 08             	mov    0x8(%ebp),%edx
    1835:	89 d8                	mov    %ebx,%eax
    1837:	01 da                	add    %ebx,%edx
    1839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        heap[i] = 'Y';
    1840:	c6 00 59             	movb   $0x59,(%eax)
    1843:	83 c0 01             	add    $0x1,%eax
    for (int i = 0; i < size; ++i) {
    1846:	39 c2                	cmp    %eax,%edx
    1848:	75 f6                	jne    1840 <test_read_into_cow_less_forks+0xd0>
    }
    char *loc = heap + offset;
    int pipe_fds[2];
    pipe(pipe_fds);
    184a:	8d 45 e0             	lea    -0x20(%ebp),%eax
    184d:	83 ec 0c             	sub    $0xc,%esp
    1850:	50                   	push   %eax
    1851:	e8 ec 04 00 00       	call   1d42 <pipe>
    int pid = fork();
    1856:	e8 cf 04 00 00       	call   1d2a <fork>
    if (pid == 0) {
    185b:	83 c4 10             	add    $0x10,%esp
    185e:	85 c0                	test   %eax,%eax
    1860:	0f 84 c7 00 00 00    	je     192d <test_read_into_cow_less_forks+0x1bd>
            write(pipe_fds[1], "Y", 1);
        }
        close(pipe_fds[1]);
        exit();
    } else {
        close(pipe_fds[1]);
    1866:	83 ec 0c             	sub    $0xc,%esp
    1869:	ff 75 e4             	pushl  -0x1c(%ebp)
    186c:	e8 e9 04 00 00       	call   1d5a <close>
        char result_buf[1] = {'N'};
        read(pipe_fds[0], result_buf, 1);
    1871:	8d 45 df             	lea    -0x21(%ebp),%eax
    1874:	83 c4 0c             	add    $0xc,%esp
        char result_buf[1] = {'N'};
    1877:	c6 45 df 4e          	movb   $0x4e,-0x21(%ebp)
        read(pipe_fds[0], result_buf, 1);
    187b:	6a 01                	push   $0x1
    187d:	50                   	push   %eax
    187e:	ff 75 e0             	pushl  -0x20(%ebp)
    1881:	e8 c4 04 00 00       	call   1d4a <read>
        close(pipe_fds[0]);
    1886:	58                   	pop    %eax
    1887:	ff 75 e0             	pushl  -0x20(%ebp)
    188a:	e8 cb 04 00 00       	call   1d5a <close>
        wait();
    188f:	e8 a6 04 00 00       	call   1d3a <wait>
        printf(1, "testing correct value for heap in parent after read() in child\n");
    1894:	5a                   	pop    %edx
    1895:	59                   	pop    %ecx
    1896:	68 7c 29 00 00       	push   $0x297c
    189b:	6a 01                	push   $0x1
    189d:	e8 0e 06 00 00       	call   1eb0 <printf>
        int found_wrong = 0;
        for (int i = 0; i < size; ++i) {
    18a2:	8b 75 08             	mov    0x8(%ebp),%esi
    18a5:	83 c4 10             	add    $0x10,%esp
    18a8:	85 f6                	test   %esi,%esi
    18aa:	7e 40                	jle    18ec <test_read_into_cow_less_forks+0x17c>
    18ac:	8b 75 08             	mov    0x8(%ebp),%esi
        int found_wrong = 0;
    18af:	31 c0                	xor    %eax,%eax
            if (heap[i] != 'Y') {
                found_wrong = 1;
    18b1:	ba 01 00 00 00       	mov    $0x1,%edx
    18b6:	01 de                	add    %ebx,%esi
    18b8:	90                   	nop
    18b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18c0:	80 3b 59             	cmpb   $0x59,(%ebx)
    18c3:	0f 45 c2             	cmovne %edx,%eax
    18c6:	83 c3 01             	add    $0x1,%ebx
        for (int i = 0; i < size; ++i) {
    18c9:	39 de                	cmp    %ebx,%esi
    18cb:	75 f3                	jne    18c0 <test_read_into_cow_less_forks+0x150>
    18cd:	89 c3                	mov    %eax,%ebx
    18cf:	83 f3 01             	xor    $0x1,%ebx
            }
        }
        if (found_wrong) { 
    18d2:	85 c0                	test   %eax,%eax
    18d4:	74 1b                	je     18f1 <test_read_into_cow_less_forks+0x181>
            printf(1, FAIL_MSG "wrong value in parent after read() in child\n");
    18d6:	83 ec 08             	sub    $0x8,%esp
    18d9:	31 db                	xor    %ebx,%ebx
    18db:	68 bc 29 00 00       	push   $0x29bc
    18e0:	6a 01                	push   $0x1
    18e2:	e8 c9 05 00 00       	call   1eb0 <printf>
    18e7:	83 c4 10             	add    $0x10,%esp
    18ea:	eb 17                	jmp    1903 <test_read_into_cow_less_forks+0x193>
        for (int i = 0; i < size; ++i) {
    18ec:	bb 01 00 00 00       	mov    $0x1,%ebx
        } else {
            printf(1, PASS_MSG "correct value in parent after read into copy-on-write allocation\n");
    18f1:	83 ec 08             	sub    $0x8,%esp
    18f4:	68 f4 29 00 00       	push   $0x29f4
    18f9:	6a 01                	push   $0x1
    18fb:	e8 b0 05 00 00       	call   1eb0 <printf>
    1900:	83 c4 10             	add    $0x10,%esp
        }
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    1903:	31 c0                	xor    %eax,%eax
    1905:	80 7d df 59          	cmpb   $0x59,-0x21(%ebp)
    1909:	0f 94 c0             	sete   %al
    }
}
    190c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    190f:	01 d8                	add    %ebx,%eax
}
    1911:	5b                   	pop    %ebx
    1912:	5e                   	pop    %esi
    1913:	5f                   	pop    %edi
    1914:	5d                   	pop    %ebp
    1915:	c3                   	ret    
        printf(2, "error opening tempfile");
    1916:	83 ec 08             	sub    $0x8,%esp
    1919:	68 d1 22 00 00       	push   $0x22d1
    191e:	6a 02                	push   $0x2
    1920:	e8 8b 05 00 00       	call   1eb0 <printf>
    1925:	83 c4 10             	add    $0x10,%esp
    1928:	e9 e6 fe ff ff       	jmp    1813 <test_read_into_cow_less_forks+0xa3>
    char *loc = heap + offset;
    192d:	03 5d 0c             	add    0xc(%ebp),%ebx
        close(pipe_fds[0]);
    1930:	83 ec 0c             	sub    $0xc,%esp
    1933:	ff 75 e0             	pushl  -0x20(%ebp)
    1936:	89 45 cc             	mov    %eax,-0x34(%ebp)
    1939:	e8 1c 04 00 00       	call   1d5a <close>
        int count = read(fd, loc, read_count);
    193e:	83 c4 0c             	add    $0xc,%esp
    1941:	57                   	push   %edi
    1942:	53                   	push   %ebx
    1943:	ff 75 d4             	pushl  -0x2c(%ebp)
    1946:	e8 ff 03 00 00       	call   1d4a <read>
        failed_value = loc[-1] != 'Y';
    194b:	31 c9                	xor    %ecx,%ecx
    194d:	83 c4 10             	add    $0x10,%esp
    1950:	80 7b ff 59          	cmpb   $0x59,-0x1(%ebx)
    1954:	8b 55 cc             	mov    -0x34(%ebp),%edx
        int count = read(fd, loc, read_count);
    1957:	89 45 d0             	mov    %eax,-0x30(%ebp)
                failed_value = 1;
    195a:	b8 01 00 00 00       	mov    $0x1,%eax
        failed_value = loc[-1] != 'Y';
    195f:	0f 95 c1             	setne  %cl
        for (int i = 0; i < read_count; ++i) {
    1962:	39 fa                	cmp    %edi,%edx
    1964:	7d 0c                	jge    1972 <test_read_into_cow_less_forks+0x202>
                failed_value = 1;
    1966:	80 3c 13 58          	cmpb   $0x58,(%ebx,%edx,1)
    196a:	0f 45 c8             	cmovne %eax,%ecx
        for (int i = 0; i < read_count; ++i) {
    196d:	83 c2 01             	add    $0x1,%edx
    1970:	eb f0                	jmp    1962 <test_read_into_cow_less_forks+0x1f2>
    1972:	8b 75 08             	mov    0x8(%ebp),%esi
    1975:	f7 de                	neg    %esi
        if (loc[read_count] != 'Y') {
    1977:	80 3c 3b 59          	cmpb   $0x59,(%ebx,%edi,1)
    197b:	74 5a                	je     19d7 <test_read_into_cow_less_forks+0x267>
        close(fd);
    197d:	83 ec 0c             	sub    $0xc,%esp
    1980:	ff 75 d4             	pushl  -0x2c(%ebp)
    1983:	e8 d2 03 00 00       	call   1d5a <close>
        unlink("tempfile");
    1988:	c7 04 24 df 22 00 00 	movl   $0x22df,(%esp)
    198f:	e8 ee 03 00 00       	call   1d82 <unlink>
        sbrk(-size);
    1994:	89 34 24             	mov    %esi,(%esp)
    1997:	e8 1e 04 00 00       	call   1dba <sbrk>
        if (count != read_count) {
    199c:	83 c4 10             	add    $0x10,%esp
    199f:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    19a2:	74 64                	je     1a08 <test_read_into_cow_less_forks+0x298>
            printf(1, FAIL_MSG "wrong return value from read()\n");
    19a4:	50                   	push   %eax
    19a5:	50                   	push   %eax
    19a6:	68 88 28 00 00       	push   $0x2888
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    19ab:	6a 01                	push   $0x1
    19ad:	e8 fe 04 00 00       	call   1eb0 <printf>
            write(pipe_fds[1], "N", 1);
    19b2:	83 c4 0c             	add    $0xc,%esp
    19b5:	6a 01                	push   $0x1
    19b7:	68 e8 22 00 00       	push   $0x22e8
    19bc:	ff 75 e4             	pushl  -0x1c(%ebp)
    19bf:	e8 8e 03 00 00       	call   1d52 <write>
    19c4:	83 c4 10             	add    $0x10,%esp
        close(pipe_fds[1]);
    19c7:	83 ec 0c             	sub    $0xc,%esp
    19ca:	ff 75 e4             	pushl  -0x1c(%ebp)
    19cd:	e8 88 03 00 00       	call   1d5a <close>
        exit();
    19d2:	e8 5b 03 00 00       	call   1d32 <exit>
        close(fd);
    19d7:	83 ec 0c             	sub    $0xc,%esp
    19da:	ff 75 d4             	pushl  -0x2c(%ebp)
    19dd:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    19e0:	e8 75 03 00 00       	call   1d5a <close>
        unlink("tempfile");
    19e5:	c7 04 24 df 22 00 00 	movl   $0x22df,(%esp)
    19ec:	e8 91 03 00 00       	call   1d82 <unlink>
        sbrk(-size);
    19f1:	89 34 24             	mov    %esi,(%esp)
    19f4:	e8 c1 03 00 00       	call   1dba <sbrk>
        if (count != read_count) {
    19f9:	83 c4 10             	add    $0x10,%esp
    19fc:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    19ff:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    1a02:	75 a0                	jne    19a4 <test_read_into_cow_less_forks+0x234>
        } else if (failed_value) {
    1a04:	85 c9                	test   %ecx,%ecx
    1a06:	74 09                	je     1a11 <test_read_into_cow_less_forks+0x2a1>
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1a08:	50                   	push   %eax
    1a09:	50                   	push   %eax
    1a0a:	68 b4 28 00 00       	push   $0x28b4
    1a0f:	eb 9a                	jmp    19ab <test_read_into_cow_less_forks+0x23b>
            printf(1, PASS_MSG "correct value read into copy-on-write allocation\n");
    1a11:	57                   	push   %edi
    1a12:	57                   	push   %edi
    1a13:	68 40 29 00 00       	push   $0x2940
    1a18:	6a 01                	push   $0x1
    1a1a:	e8 91 04 00 00       	call   1eb0 <printf>
            write(pipe_fds[1], "Y", 1);
    1a1f:	83 c4 0c             	add    $0xc,%esp
    1a22:	6a 01                	push   $0x1
    1a24:	68 65 22 00 00       	push   $0x2265
    1a29:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a2c:	e8 21 03 00 00       	call   1d52 <write>
    1a31:	83 c4 10             	add    $0x10,%esp
    1a34:	eb 91                	jmp    19c7 <test_read_into_cow_less_forks+0x257>
    1a36:	8d 76 00             	lea    0x0(%esi),%esi
    1a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a40 <test_read_into_cow>:

int test_read_into_cow(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1a40:	55                   	push   %ebp
    1a41:	89 e5                	mov    %esp,%ebp
    1a43:	83 ec 24             	sub    $0x24,%esp
    int pipe_fds[2];
    pipe(pipe_fds);
    1a46:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1a49:	50                   	push   %eax
    1a4a:	e8 f3 02 00 00       	call   1d42 <pipe>
    int pid = fork();
    1a4f:	e8 d6 02 00 00       	call   1d2a <fork>
    if (pid == 0) {
    1a54:	83 c4 10             	add    $0x10,%esp
    1a57:	85 c0                	test   %eax,%eax
    1a59:	74 33                	je     1a8e <test_read_into_cow+0x4e>
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
    1a5b:	83 ec 0c             	sub    $0xc,%esp
    1a5e:	ff 75 f4             	pushl  -0xc(%ebp)
    1a61:	e8 f4 02 00 00       	call   1d5a <close>
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
    1a66:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1a69:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    1a6c:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1a70:	6a 01                	push   $0x1
    1a72:	50                   	push   %eax
    1a73:	ff 75 f0             	pushl  -0x10(%ebp)
    1a76:	e8 cf 02 00 00       	call   1d4a <read>
        wait();
    1a7b:	e8 ba 02 00 00       	call   1d3a <wait>
        return result_str[0] == 'Y';
    1a80:	83 c4 10             	add    $0x10,%esp
    1a83:	31 c0                	xor    %eax,%eax
    1a85:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
    }
}
    1a89:	c9                   	leave  
        return result_str[0] == 'Y';
    1a8a:	0f 94 c0             	sete   %al
}
    1a8d:	c3                   	ret    
        close(pipe_fds[0]);
    1a8e:	83 ec 0c             	sub    $0xc,%esp
    1a91:	ff 75 f0             	pushl  -0x10(%ebp)
    1a94:	e8 c1 02 00 00       	call   1d5a <close>
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1a99:	5a                   	pop    %edx
    1a9a:	ff 75 18             	pushl  0x18(%ebp)
    1a9d:	ff 75 14             	pushl  0x14(%ebp)
    1aa0:	ff 75 10             	pushl  0x10(%ebp)
    1aa3:	ff 75 0c             	pushl  0xc(%ebp)
    1aa6:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1aa9:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1aad:	e8 be fc ff ff       	call   1770 <test_read_into_cow_less_forks>
    1ab2:	83 c4 20             	add    $0x20,%esp
    1ab5:	85 c0                	test   %eax,%eax
    1ab7:	74 04                	je     1abd <test_read_into_cow+0x7d>
            result_str[0] = 'Y';
    1ab9:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    1abd:	50                   	push   %eax
    1abe:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1ac1:	6a 01                	push   $0x1
    1ac3:	50                   	push   %eax
    1ac4:	ff 75 f4             	pushl  -0xc(%ebp)
    1ac7:	e8 86 02 00 00       	call   1d52 <write>
        exit();
    1acc:	e8 61 02 00 00       	call   1d32 <exit>
    1ad1:	66 90                	xchg   %ax,%ax
    1ad3:	66 90                	xchg   %ax,%ax
    1ad5:	66 90                	xchg   %ax,%ax
    1ad7:	66 90                	xchg   %ax,%ax
    1ad9:	66 90                	xchg   %ax,%ax
    1adb:	66 90                	xchg   %ax,%ax
    1add:	66 90                	xchg   %ax,%ax
    1adf:	90                   	nop

00001ae0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1ae0:	55                   	push   %ebp
    1ae1:	89 e5                	mov    %esp,%ebp
    1ae3:	53                   	push   %ebx
    1ae4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1aea:	89 c2                	mov    %eax,%edx
    1aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1af0:	83 c1 01             	add    $0x1,%ecx
    1af3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1af7:	83 c2 01             	add    $0x1,%edx
    1afa:	84 db                	test   %bl,%bl
    1afc:	88 5a ff             	mov    %bl,-0x1(%edx)
    1aff:	75 ef                	jne    1af0 <strcpy+0x10>
    ;
  return os;
}
    1b01:	5b                   	pop    %ebx
    1b02:	5d                   	pop    %ebp
    1b03:	c3                   	ret    
    1b04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1b10:	55                   	push   %ebp
    1b11:	89 e5                	mov    %esp,%ebp
    1b13:	53                   	push   %ebx
    1b14:	8b 55 08             	mov    0x8(%ebp),%edx
    1b17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1b1a:	0f b6 02             	movzbl (%edx),%eax
    1b1d:	0f b6 19             	movzbl (%ecx),%ebx
    1b20:	84 c0                	test   %al,%al
    1b22:	75 1c                	jne    1b40 <strcmp+0x30>
    1b24:	eb 2a                	jmp    1b50 <strcmp+0x40>
    1b26:	8d 76 00             	lea    0x0(%esi),%esi
    1b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1b30:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1b33:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1b36:	83 c1 01             	add    $0x1,%ecx
    1b39:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    1b3c:	84 c0                	test   %al,%al
    1b3e:	74 10                	je     1b50 <strcmp+0x40>
    1b40:	38 d8                	cmp    %bl,%al
    1b42:	74 ec                	je     1b30 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1b44:	29 d8                	sub    %ebx,%eax
}
    1b46:	5b                   	pop    %ebx
    1b47:	5d                   	pop    %ebp
    1b48:	c3                   	ret    
    1b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b50:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1b52:	29 d8                	sub    %ebx,%eax
}
    1b54:	5b                   	pop    %ebx
    1b55:	5d                   	pop    %ebp
    1b56:	c3                   	ret    
    1b57:	89 f6                	mov    %esi,%esi
    1b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001b60 <strlen>:

uint
strlen(char *s)
{
    1b60:	55                   	push   %ebp
    1b61:	89 e5                	mov    %esp,%ebp
    1b63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1b66:	80 39 00             	cmpb   $0x0,(%ecx)
    1b69:	74 15                	je     1b80 <strlen+0x20>
    1b6b:	31 d2                	xor    %edx,%edx
    1b6d:	8d 76 00             	lea    0x0(%esi),%esi
    1b70:	83 c2 01             	add    $0x1,%edx
    1b73:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1b77:	89 d0                	mov    %edx,%eax
    1b79:	75 f5                	jne    1b70 <strlen+0x10>
    ;
  return n;
}
    1b7b:	5d                   	pop    %ebp
    1b7c:	c3                   	ret    
    1b7d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1b80:	31 c0                	xor    %eax,%eax
}
    1b82:	5d                   	pop    %ebp
    1b83:	c3                   	ret    
    1b84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b90 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1b90:	55                   	push   %ebp
    1b91:	89 e5                	mov    %esp,%ebp
    1b93:	57                   	push   %edi
    1b94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1b97:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b9d:	89 d7                	mov    %edx,%edi
    1b9f:	fc                   	cld    
    1ba0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1ba2:	89 d0                	mov    %edx,%eax
    1ba4:	5f                   	pop    %edi
    1ba5:	5d                   	pop    %ebp
    1ba6:	c3                   	ret    
    1ba7:	89 f6                	mov    %esi,%esi
    1ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bb0 <strchr>:

char*
strchr(const char *s, char c)
{
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	53                   	push   %ebx
    1bb4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    1bba:	0f b6 10             	movzbl (%eax),%edx
    1bbd:	84 d2                	test   %dl,%dl
    1bbf:	74 1d                	je     1bde <strchr+0x2e>
    if(*s == c)
    1bc1:	38 d3                	cmp    %dl,%bl
    1bc3:	89 d9                	mov    %ebx,%ecx
    1bc5:	75 0d                	jne    1bd4 <strchr+0x24>
    1bc7:	eb 17                	jmp    1be0 <strchr+0x30>
    1bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bd0:	38 ca                	cmp    %cl,%dl
    1bd2:	74 0c                	je     1be0 <strchr+0x30>
  for(; *s; s++)
    1bd4:	83 c0 01             	add    $0x1,%eax
    1bd7:	0f b6 10             	movzbl (%eax),%edx
    1bda:	84 d2                	test   %dl,%dl
    1bdc:	75 f2                	jne    1bd0 <strchr+0x20>
      return (char*)s;
  return 0;
    1bde:	31 c0                	xor    %eax,%eax
}
    1be0:	5b                   	pop    %ebx
    1be1:	5d                   	pop    %ebp
    1be2:	c3                   	ret    
    1be3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bf0 <gets>:

char*
gets(char *buf, int max)
{
    1bf0:	55                   	push   %ebp
    1bf1:	89 e5                	mov    %esp,%ebp
    1bf3:	57                   	push   %edi
    1bf4:	56                   	push   %esi
    1bf5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1bf6:	31 f6                	xor    %esi,%esi
    1bf8:	89 f3                	mov    %esi,%ebx
{
    1bfa:	83 ec 1c             	sub    $0x1c,%esp
    1bfd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1c00:	eb 2f                	jmp    1c31 <gets+0x41>
    1c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1c08:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1c0b:	83 ec 04             	sub    $0x4,%esp
    1c0e:	6a 01                	push   $0x1
    1c10:	50                   	push   %eax
    1c11:	6a 00                	push   $0x0
    1c13:	e8 32 01 00 00       	call   1d4a <read>
    if(cc < 1)
    1c18:	83 c4 10             	add    $0x10,%esp
    1c1b:	85 c0                	test   %eax,%eax
    1c1d:	7e 1c                	jle    1c3b <gets+0x4b>
      break;
    buf[i++] = c;
    1c1f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1c23:	83 c7 01             	add    $0x1,%edi
    1c26:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1c29:	3c 0a                	cmp    $0xa,%al
    1c2b:	74 23                	je     1c50 <gets+0x60>
    1c2d:	3c 0d                	cmp    $0xd,%al
    1c2f:	74 1f                	je     1c50 <gets+0x60>
  for(i=0; i+1 < max; ){
    1c31:	83 c3 01             	add    $0x1,%ebx
    1c34:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1c37:	89 fe                	mov    %edi,%esi
    1c39:	7c cd                	jl     1c08 <gets+0x18>
    1c3b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1c40:	c6 03 00             	movb   $0x0,(%ebx)
}
    1c43:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c46:	5b                   	pop    %ebx
    1c47:	5e                   	pop    %esi
    1c48:	5f                   	pop    %edi
    1c49:	5d                   	pop    %ebp
    1c4a:	c3                   	ret    
    1c4b:	90                   	nop
    1c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c50:	8b 75 08             	mov    0x8(%ebp),%esi
    1c53:	8b 45 08             	mov    0x8(%ebp),%eax
    1c56:	01 de                	add    %ebx,%esi
    1c58:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1c5a:	c6 03 00             	movb   $0x0,(%ebx)
}
    1c5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c60:	5b                   	pop    %ebx
    1c61:	5e                   	pop    %esi
    1c62:	5f                   	pop    %edi
    1c63:	5d                   	pop    %ebp
    1c64:	c3                   	ret    
    1c65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c70 <stat>:

int
stat(char *n, struct stat *st)
{
    1c70:	55                   	push   %ebp
    1c71:	89 e5                	mov    %esp,%ebp
    1c73:	56                   	push   %esi
    1c74:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1c75:	83 ec 08             	sub    $0x8,%esp
    1c78:	6a 00                	push   $0x0
    1c7a:	ff 75 08             	pushl  0x8(%ebp)
    1c7d:	e8 f0 00 00 00       	call   1d72 <open>
  if(fd < 0)
    1c82:	83 c4 10             	add    $0x10,%esp
    1c85:	85 c0                	test   %eax,%eax
    1c87:	78 27                	js     1cb0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1c89:	83 ec 08             	sub    $0x8,%esp
    1c8c:	ff 75 0c             	pushl  0xc(%ebp)
    1c8f:	89 c3                	mov    %eax,%ebx
    1c91:	50                   	push   %eax
    1c92:	e8 f3 00 00 00       	call   1d8a <fstat>
  close(fd);
    1c97:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1c9a:	89 c6                	mov    %eax,%esi
  close(fd);
    1c9c:	e8 b9 00 00 00       	call   1d5a <close>
  return r;
    1ca1:	83 c4 10             	add    $0x10,%esp
}
    1ca4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1ca7:	89 f0                	mov    %esi,%eax
    1ca9:	5b                   	pop    %ebx
    1caa:	5e                   	pop    %esi
    1cab:	5d                   	pop    %ebp
    1cac:	c3                   	ret    
    1cad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1cb0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1cb5:	eb ed                	jmp    1ca4 <stat+0x34>
    1cb7:	89 f6                	mov    %esi,%esi
    1cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001cc0 <atoi>:

int
atoi(const char *s)
{
    1cc0:	55                   	push   %ebp
    1cc1:	89 e5                	mov    %esp,%ebp
    1cc3:	53                   	push   %ebx
    1cc4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1cc7:	0f be 11             	movsbl (%ecx),%edx
    1cca:	8d 42 d0             	lea    -0x30(%edx),%eax
    1ccd:	3c 09                	cmp    $0x9,%al
  n = 0;
    1ccf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1cd4:	77 1f                	ja     1cf5 <atoi+0x35>
    1cd6:	8d 76 00             	lea    0x0(%esi),%esi
    1cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1ce0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1ce3:	83 c1 01             	add    $0x1,%ecx
    1ce6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1cea:	0f be 11             	movsbl (%ecx),%edx
    1ced:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1cf0:	80 fb 09             	cmp    $0x9,%bl
    1cf3:	76 eb                	jbe    1ce0 <atoi+0x20>
  return n;
}
    1cf5:	5b                   	pop    %ebx
    1cf6:	5d                   	pop    %ebp
    1cf7:	c3                   	ret    
    1cf8:	90                   	nop
    1cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001d00 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1d00:	55                   	push   %ebp
    1d01:	89 e5                	mov    %esp,%ebp
    1d03:	56                   	push   %esi
    1d04:	53                   	push   %ebx
    1d05:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1d08:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1d0e:	85 db                	test   %ebx,%ebx
    1d10:	7e 14                	jle    1d26 <memmove+0x26>
    1d12:	31 d2                	xor    %edx,%edx
    1d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1d18:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1d1c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1d1f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1d22:	39 d3                	cmp    %edx,%ebx
    1d24:	75 f2                	jne    1d18 <memmove+0x18>
  return vdst;
}
    1d26:	5b                   	pop    %ebx
    1d27:	5e                   	pop    %esi
    1d28:	5d                   	pop    %ebp
    1d29:	c3                   	ret    

00001d2a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1d2a:	b8 01 00 00 00       	mov    $0x1,%eax
    1d2f:	cd 40                	int    $0x40
    1d31:	c3                   	ret    

00001d32 <exit>:
SYSCALL(exit)
    1d32:	b8 02 00 00 00       	mov    $0x2,%eax
    1d37:	cd 40                	int    $0x40
    1d39:	c3                   	ret    

00001d3a <wait>:
SYSCALL(wait)
    1d3a:	b8 03 00 00 00       	mov    $0x3,%eax
    1d3f:	cd 40                	int    $0x40
    1d41:	c3                   	ret    

00001d42 <pipe>:
SYSCALL(pipe)
    1d42:	b8 04 00 00 00       	mov    $0x4,%eax
    1d47:	cd 40                	int    $0x40
    1d49:	c3                   	ret    

00001d4a <read>:
SYSCALL(read)
    1d4a:	b8 05 00 00 00       	mov    $0x5,%eax
    1d4f:	cd 40                	int    $0x40
    1d51:	c3                   	ret    

00001d52 <write>:
SYSCALL(write)
    1d52:	b8 10 00 00 00       	mov    $0x10,%eax
    1d57:	cd 40                	int    $0x40
    1d59:	c3                   	ret    

00001d5a <close>:
SYSCALL(close)
    1d5a:	b8 15 00 00 00       	mov    $0x15,%eax
    1d5f:	cd 40                	int    $0x40
    1d61:	c3                   	ret    

00001d62 <kill>:
SYSCALL(kill)
    1d62:	b8 06 00 00 00       	mov    $0x6,%eax
    1d67:	cd 40                	int    $0x40
    1d69:	c3                   	ret    

00001d6a <exec>:
SYSCALL(exec)
    1d6a:	b8 07 00 00 00       	mov    $0x7,%eax
    1d6f:	cd 40                	int    $0x40
    1d71:	c3                   	ret    

00001d72 <open>:
SYSCALL(open)
    1d72:	b8 0f 00 00 00       	mov    $0xf,%eax
    1d77:	cd 40                	int    $0x40
    1d79:	c3                   	ret    

00001d7a <mknod>:
SYSCALL(mknod)
    1d7a:	b8 11 00 00 00       	mov    $0x11,%eax
    1d7f:	cd 40                	int    $0x40
    1d81:	c3                   	ret    

00001d82 <unlink>:
SYSCALL(unlink)
    1d82:	b8 12 00 00 00       	mov    $0x12,%eax
    1d87:	cd 40                	int    $0x40
    1d89:	c3                   	ret    

00001d8a <fstat>:
SYSCALL(fstat)
    1d8a:	b8 08 00 00 00       	mov    $0x8,%eax
    1d8f:	cd 40                	int    $0x40
    1d91:	c3                   	ret    

00001d92 <link>:
SYSCALL(link)
    1d92:	b8 13 00 00 00       	mov    $0x13,%eax
    1d97:	cd 40                	int    $0x40
    1d99:	c3                   	ret    

00001d9a <mkdir>:
SYSCALL(mkdir)
    1d9a:	b8 14 00 00 00       	mov    $0x14,%eax
    1d9f:	cd 40                	int    $0x40
    1da1:	c3                   	ret    

00001da2 <chdir>:
SYSCALL(chdir)
    1da2:	b8 09 00 00 00       	mov    $0x9,%eax
    1da7:	cd 40                	int    $0x40
    1da9:	c3                   	ret    

00001daa <dup>:
SYSCALL(dup)
    1daa:	b8 0a 00 00 00       	mov    $0xa,%eax
    1daf:	cd 40                	int    $0x40
    1db1:	c3                   	ret    

00001db2 <getpid>:
SYSCALL(getpid)
    1db2:	b8 0b 00 00 00       	mov    $0xb,%eax
    1db7:	cd 40                	int    $0x40
    1db9:	c3                   	ret    

00001dba <sbrk>:
SYSCALL(sbrk)
    1dba:	b8 0c 00 00 00       	mov    $0xc,%eax
    1dbf:	cd 40                	int    $0x40
    1dc1:	c3                   	ret    

00001dc2 <sleep>:
SYSCALL(sleep)
    1dc2:	b8 0d 00 00 00       	mov    $0xd,%eax
    1dc7:	cd 40                	int    $0x40
    1dc9:	c3                   	ret    

00001dca <uptime>:
SYSCALL(uptime)
    1dca:	b8 0e 00 00 00       	mov    $0xe,%eax
    1dcf:	cd 40                	int    $0x40
    1dd1:	c3                   	ret    

00001dd2 <yield>:
SYSCALL(yield)
    1dd2:	b8 16 00 00 00       	mov    $0x16,%eax
    1dd7:	cd 40                	int    $0x40
    1dd9:	c3                   	ret    

00001dda <shutdown>:
SYSCALL(shutdown)
    1dda:	b8 17 00 00 00       	mov    $0x17,%eax
    1ddf:	cd 40                	int    $0x40
    1de1:	c3                   	ret    

00001de2 <writecount>:
SYSCALL(writecount)
    1de2:	b8 18 00 00 00       	mov    $0x18,%eax
    1de7:	cd 40                	int    $0x40
    1de9:	c3                   	ret    

00001dea <settickets>:
SYSCALL(settickets)
    1dea:	b8 19 00 00 00       	mov    $0x19,%eax
    1def:	cd 40                	int    $0x40
    1df1:	c3                   	ret    

00001df2 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
    1df2:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1df7:	cd 40                	int    $0x40
    1df9:	c3                   	ret    

00001dfa <dumppagetable>:
    1dfa:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1dff:	cd 40                	int    $0x40
    1e01:	c3                   	ret    
    1e02:	66 90                	xchg   %ax,%ax
    1e04:	66 90                	xchg   %ax,%ax
    1e06:	66 90                	xchg   %ax,%ax
    1e08:	66 90                	xchg   %ax,%ax
    1e0a:	66 90                	xchg   %ax,%ax
    1e0c:	66 90                	xchg   %ax,%ax
    1e0e:	66 90                	xchg   %ax,%ax

00001e10 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1e10:	55                   	push   %ebp
    1e11:	89 e5                	mov    %esp,%ebp
    1e13:	57                   	push   %edi
    1e14:	56                   	push   %esi
    1e15:	53                   	push   %ebx
    1e16:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1e19:	85 d2                	test   %edx,%edx
{
    1e1b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    1e1e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1e20:	79 76                	jns    1e98 <printint+0x88>
    1e22:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1e26:	74 70                	je     1e98 <printint+0x88>
    x = -xx;
    1e28:	f7 d8                	neg    %eax
    neg = 1;
    1e2a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1e31:	31 f6                	xor    %esi,%esi
    1e33:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1e36:	eb 0a                	jmp    1e42 <printint+0x32>
    1e38:	90                   	nop
    1e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1e40:	89 fe                	mov    %edi,%esi
    1e42:	31 d2                	xor    %edx,%edx
    1e44:	8d 7e 01             	lea    0x1(%esi),%edi
    1e47:	f7 f1                	div    %ecx
    1e49:	0f b6 92 48 2a 00 00 	movzbl 0x2a48(%edx),%edx
  }while((x /= base) != 0);
    1e50:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1e52:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1e55:	75 e9                	jne    1e40 <printint+0x30>
  if(neg)
    1e57:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1e5a:	85 c0                	test   %eax,%eax
    1e5c:	74 08                	je     1e66 <printint+0x56>
    buf[i++] = '-';
    1e5e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1e63:	8d 7e 02             	lea    0x2(%esi),%edi
    1e66:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    1e6a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    1e6d:	8d 76 00             	lea    0x0(%esi),%esi
    1e70:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1e73:	83 ec 04             	sub    $0x4,%esp
    1e76:	83 ee 01             	sub    $0x1,%esi
    1e79:	6a 01                	push   $0x1
    1e7b:	53                   	push   %ebx
    1e7c:	57                   	push   %edi
    1e7d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1e80:	e8 cd fe ff ff       	call   1d52 <write>

  while(--i >= 0)
    1e85:	83 c4 10             	add    $0x10,%esp
    1e88:	39 de                	cmp    %ebx,%esi
    1e8a:	75 e4                	jne    1e70 <printint+0x60>
    putc(fd, buf[i]);
}
    1e8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e8f:	5b                   	pop    %ebx
    1e90:	5e                   	pop    %esi
    1e91:	5f                   	pop    %edi
    1e92:	5d                   	pop    %ebp
    1e93:	c3                   	ret    
    1e94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1e98:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1e9f:	eb 90                	jmp    1e31 <printint+0x21>
    1ea1:	eb 0d                	jmp    1eb0 <printf>
    1ea3:	90                   	nop
    1ea4:	90                   	nop
    1ea5:	90                   	nop
    1ea6:	90                   	nop
    1ea7:	90                   	nop
    1ea8:	90                   	nop
    1ea9:	90                   	nop
    1eaa:	90                   	nop
    1eab:	90                   	nop
    1eac:	90                   	nop
    1ead:	90                   	nop
    1eae:	90                   	nop
    1eaf:	90                   	nop

00001eb0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1eb0:	55                   	push   %ebp
    1eb1:	89 e5                	mov    %esp,%ebp
    1eb3:	57                   	push   %edi
    1eb4:	56                   	push   %esi
    1eb5:	53                   	push   %ebx
    1eb6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1eb9:	8b 75 0c             	mov    0xc(%ebp),%esi
    1ebc:	0f b6 1e             	movzbl (%esi),%ebx
    1ebf:	84 db                	test   %bl,%bl
    1ec1:	0f 84 b3 00 00 00    	je     1f7a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    1ec7:	8d 45 10             	lea    0x10(%ebp),%eax
    1eca:	83 c6 01             	add    $0x1,%esi
  state = 0;
    1ecd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    1ecf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1ed2:	eb 2f                	jmp    1f03 <printf+0x53>
    1ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1ed8:	83 f8 25             	cmp    $0x25,%eax
    1edb:	0f 84 a7 00 00 00    	je     1f88 <printf+0xd8>
  write(fd, &c, 1);
    1ee1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1ee4:	83 ec 04             	sub    $0x4,%esp
    1ee7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1eea:	6a 01                	push   $0x1
    1eec:	50                   	push   %eax
    1eed:	ff 75 08             	pushl  0x8(%ebp)
    1ef0:	e8 5d fe ff ff       	call   1d52 <write>
    1ef5:	83 c4 10             	add    $0x10,%esp
    1ef8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1efb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1eff:	84 db                	test   %bl,%bl
    1f01:	74 77                	je     1f7a <printf+0xca>
    if(state == 0){
    1f03:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    1f05:	0f be cb             	movsbl %bl,%ecx
    1f08:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1f0b:	74 cb                	je     1ed8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1f0d:	83 ff 25             	cmp    $0x25,%edi
    1f10:	75 e6                	jne    1ef8 <printf+0x48>
      if(c == 'd'){
    1f12:	83 f8 64             	cmp    $0x64,%eax
    1f15:	0f 84 05 01 00 00    	je     2020 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1f1b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1f21:	83 f9 70             	cmp    $0x70,%ecx
    1f24:	74 72                	je     1f98 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1f26:	83 f8 73             	cmp    $0x73,%eax
    1f29:	0f 84 99 00 00 00    	je     1fc8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1f2f:	83 f8 63             	cmp    $0x63,%eax
    1f32:	0f 84 08 01 00 00    	je     2040 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1f38:	83 f8 25             	cmp    $0x25,%eax
    1f3b:	0f 84 ef 00 00 00    	je     2030 <printf+0x180>
  write(fd, &c, 1);
    1f41:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1f44:	83 ec 04             	sub    $0x4,%esp
    1f47:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1f4b:	6a 01                	push   $0x1
    1f4d:	50                   	push   %eax
    1f4e:	ff 75 08             	pushl  0x8(%ebp)
    1f51:	e8 fc fd ff ff       	call   1d52 <write>
    1f56:	83 c4 0c             	add    $0xc,%esp
    1f59:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f5c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    1f5f:	6a 01                	push   $0x1
    1f61:	50                   	push   %eax
    1f62:	ff 75 08             	pushl  0x8(%ebp)
    1f65:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1f68:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1f6a:	e8 e3 fd ff ff       	call   1d52 <write>
  for(i = 0; fmt[i]; i++){
    1f6f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    1f73:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1f76:	84 db                	test   %bl,%bl
    1f78:	75 89                	jne    1f03 <printf+0x53>
    }
  }
}
    1f7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f7d:	5b                   	pop    %ebx
    1f7e:	5e                   	pop    %esi
    1f7f:	5f                   	pop    %edi
    1f80:	5d                   	pop    %ebp
    1f81:	c3                   	ret    
    1f82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    1f88:	bf 25 00 00 00       	mov    $0x25,%edi
    1f8d:	e9 66 ff ff ff       	jmp    1ef8 <printf+0x48>
    1f92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1f98:	83 ec 0c             	sub    $0xc,%esp
    1f9b:	b9 10 00 00 00       	mov    $0x10,%ecx
    1fa0:	6a 00                	push   $0x0
    1fa2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    1fa5:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa8:	8b 17                	mov    (%edi),%edx
    1faa:	e8 61 fe ff ff       	call   1e10 <printint>
        ap++;
    1faf:	89 f8                	mov    %edi,%eax
    1fb1:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1fb4:	31 ff                	xor    %edi,%edi
        ap++;
    1fb6:	83 c0 04             	add    $0x4,%eax
    1fb9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1fbc:	e9 37 ff ff ff       	jmp    1ef8 <printf+0x48>
    1fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1fc8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1fcb:	8b 08                	mov    (%eax),%ecx
        ap++;
    1fcd:	83 c0 04             	add    $0x4,%eax
    1fd0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    1fd3:	85 c9                	test   %ecx,%ecx
    1fd5:	0f 84 8e 00 00 00    	je     2069 <printf+0x1b9>
        while(*s != 0){
    1fdb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    1fde:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    1fe0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1fe2:	84 c0                	test   %al,%al
    1fe4:	0f 84 0e ff ff ff    	je     1ef8 <printf+0x48>
    1fea:	89 75 d0             	mov    %esi,-0x30(%ebp)
    1fed:	89 de                	mov    %ebx,%esi
    1fef:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1ff2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    1ff5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1ff8:	83 ec 04             	sub    $0x4,%esp
          s++;
    1ffb:	83 c6 01             	add    $0x1,%esi
    1ffe:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    2001:	6a 01                	push   $0x1
    2003:	57                   	push   %edi
    2004:	53                   	push   %ebx
    2005:	e8 48 fd ff ff       	call   1d52 <write>
        while(*s != 0){
    200a:	0f b6 06             	movzbl (%esi),%eax
    200d:	83 c4 10             	add    $0x10,%esp
    2010:	84 c0                	test   %al,%al
    2012:	75 e4                	jne    1ff8 <printf+0x148>
    2014:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    2017:	31 ff                	xor    %edi,%edi
    2019:	e9 da fe ff ff       	jmp    1ef8 <printf+0x48>
    201e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2028:	6a 01                	push   $0x1
    202a:	e9 73 ff ff ff       	jmp    1fa2 <printf+0xf2>
    202f:	90                   	nop
  write(fd, &c, 1);
    2030:	83 ec 04             	sub    $0x4,%esp
    2033:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    2036:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2039:	6a 01                	push   $0x1
    203b:	e9 21 ff ff ff       	jmp    1f61 <printf+0xb1>
        putc(fd, *ap);
    2040:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    2043:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    2046:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    2048:	6a 01                	push   $0x1
        ap++;
    204a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    204d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    2050:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2053:	50                   	push   %eax
    2054:	ff 75 08             	pushl  0x8(%ebp)
    2057:	e8 f6 fc ff ff       	call   1d52 <write>
        ap++;
    205c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    205f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    2062:	31 ff                	xor    %edi,%edi
    2064:	e9 8f fe ff ff       	jmp    1ef8 <printf+0x48>
          s = "(null)";
    2069:	bb 40 2a 00 00       	mov    $0x2a40,%ebx
        while(*s != 0){
    206e:	b8 28 00 00 00       	mov    $0x28,%eax
    2073:	e9 72 ff ff ff       	jmp    1fea <printf+0x13a>
    2078:	66 90                	xchg   %ax,%ax
    207a:	66 90                	xchg   %ax,%ax
    207c:	66 90                	xchg   %ax,%ax
    207e:	66 90                	xchg   %ax,%ax

00002080 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2080:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2081:	a1 80 32 00 00       	mov    0x3280,%eax
{
    2086:	89 e5                	mov    %esp,%ebp
    2088:	57                   	push   %edi
    2089:	56                   	push   %esi
    208a:	53                   	push   %ebx
    208b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    208e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    2091:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2098:	39 c8                	cmp    %ecx,%eax
    209a:	8b 10                	mov    (%eax),%edx
    209c:	73 32                	jae    20d0 <free+0x50>
    209e:	39 d1                	cmp    %edx,%ecx
    20a0:	72 04                	jb     20a6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    20a2:	39 d0                	cmp    %edx,%eax
    20a4:	72 32                	jb     20d8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    20a6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    20a9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    20ac:	39 fa                	cmp    %edi,%edx
    20ae:	74 30                	je     20e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    20b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    20b3:	8b 50 04             	mov    0x4(%eax),%edx
    20b6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    20b9:	39 f1                	cmp    %esi,%ecx
    20bb:	74 3a                	je     20f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    20bd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    20bf:	a3 80 32 00 00       	mov    %eax,0x3280
}
    20c4:	5b                   	pop    %ebx
    20c5:	5e                   	pop    %esi
    20c6:	5f                   	pop    %edi
    20c7:	5d                   	pop    %ebp
    20c8:	c3                   	ret    
    20c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    20d0:	39 d0                	cmp    %edx,%eax
    20d2:	72 04                	jb     20d8 <free+0x58>
    20d4:	39 d1                	cmp    %edx,%ecx
    20d6:	72 ce                	jb     20a6 <free+0x26>
{
    20d8:	89 d0                	mov    %edx,%eax
    20da:	eb bc                	jmp    2098 <free+0x18>
    20dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    20e0:	03 72 04             	add    0x4(%edx),%esi
    20e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    20e6:	8b 10                	mov    (%eax),%edx
    20e8:	8b 12                	mov    (%edx),%edx
    20ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    20ed:	8b 50 04             	mov    0x4(%eax),%edx
    20f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    20f3:	39 f1                	cmp    %esi,%ecx
    20f5:	75 c6                	jne    20bd <free+0x3d>
    p->s.size += bp->s.size;
    20f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    20fa:	a3 80 32 00 00       	mov    %eax,0x3280
    p->s.size += bp->s.size;
    20ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2102:	8b 53 f8             	mov    -0x8(%ebx),%edx
    2105:	89 10                	mov    %edx,(%eax)
}
    2107:	5b                   	pop    %ebx
    2108:	5e                   	pop    %esi
    2109:	5f                   	pop    %edi
    210a:	5d                   	pop    %ebp
    210b:	c3                   	ret    
    210c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002110 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    2110:	55                   	push   %ebp
    2111:	89 e5                	mov    %esp,%ebp
    2113:	57                   	push   %edi
    2114:	56                   	push   %esi
    2115:	53                   	push   %ebx
    2116:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2119:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    211c:	8b 15 80 32 00 00    	mov    0x3280,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2122:	8d 78 07             	lea    0x7(%eax),%edi
    2125:	c1 ef 03             	shr    $0x3,%edi
    2128:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    212b:	85 d2                	test   %edx,%edx
    212d:	0f 84 9d 00 00 00    	je     21d0 <malloc+0xc0>
    2133:	8b 02                	mov    (%edx),%eax
    2135:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    2138:	39 cf                	cmp    %ecx,%edi
    213a:	76 6c                	jbe    21a8 <malloc+0x98>
    213c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    2142:	bb 00 10 00 00       	mov    $0x1000,%ebx
    2147:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    214a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    2151:	eb 0e                	jmp    2161 <malloc+0x51>
    2153:	90                   	nop
    2154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2158:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    215a:	8b 48 04             	mov    0x4(%eax),%ecx
    215d:	39 f9                	cmp    %edi,%ecx
    215f:	73 47                	jae    21a8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    2161:	39 05 80 32 00 00    	cmp    %eax,0x3280
    2167:	89 c2                	mov    %eax,%edx
    2169:	75 ed                	jne    2158 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    216b:	83 ec 0c             	sub    $0xc,%esp
    216e:	56                   	push   %esi
    216f:	e8 46 fc ff ff       	call   1dba <sbrk>
  if(p == (char*)-1)
    2174:	83 c4 10             	add    $0x10,%esp
    2177:	83 f8 ff             	cmp    $0xffffffff,%eax
    217a:	74 1c                	je     2198 <malloc+0x88>
  hp->s.size = nu;
    217c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    217f:	83 ec 0c             	sub    $0xc,%esp
    2182:	83 c0 08             	add    $0x8,%eax
    2185:	50                   	push   %eax
    2186:	e8 f5 fe ff ff       	call   2080 <free>
  return freep;
    218b:	8b 15 80 32 00 00    	mov    0x3280,%edx
      if((p = morecore(nunits)) == 0)
    2191:	83 c4 10             	add    $0x10,%esp
    2194:	85 d2                	test   %edx,%edx
    2196:	75 c0                	jne    2158 <malloc+0x48>
        return 0;
  }
}
    2198:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    219b:	31 c0                	xor    %eax,%eax
}
    219d:	5b                   	pop    %ebx
    219e:	5e                   	pop    %esi
    219f:	5f                   	pop    %edi
    21a0:	5d                   	pop    %ebp
    21a1:	c3                   	ret    
    21a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    21a8:	39 cf                	cmp    %ecx,%edi
    21aa:	74 54                	je     2200 <malloc+0xf0>
        p->s.size -= nunits;
    21ac:	29 f9                	sub    %edi,%ecx
    21ae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    21b1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    21b4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    21b7:	89 15 80 32 00 00    	mov    %edx,0x3280
}
    21bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    21c0:	83 c0 08             	add    $0x8,%eax
}
    21c3:	5b                   	pop    %ebx
    21c4:	5e                   	pop    %esi
    21c5:	5f                   	pop    %edi
    21c6:	5d                   	pop    %ebp
    21c7:	c3                   	ret    
    21c8:	90                   	nop
    21c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    21d0:	c7 05 80 32 00 00 84 	movl   $0x3284,0x3280
    21d7:	32 00 00 
    21da:	c7 05 84 32 00 00 84 	movl   $0x3284,0x3284
    21e1:	32 00 00 
    base.s.size = 0;
    21e4:	b8 84 32 00 00       	mov    $0x3284,%eax
    21e9:	c7 05 88 32 00 00 00 	movl   $0x0,0x3288
    21f0:	00 00 00 
    21f3:	e9 44 ff ff ff       	jmp    213c <malloc+0x2c>
    21f8:	90                   	nop
    21f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    2200:	8b 08                	mov    (%eax),%ecx
    2202:	89 0a                	mov    %ecx,(%edx)
    2204:	eb b1                	jmp    21b7 <malloc+0xa7>
