#include "types.h"
#include "mmu.h"
#include "param.h"
#include "proc.h"
#include "user.h"
#include "processes_info.h"

#define MAX_CHILDREN 32

typedef void (*function_type)(void);

struct test_case {
    const char *name;
    int total_tests;
    int errors;
    int num_children;
    int tickets[MAX_CHILDREN];
    int expect_ticks_unscaled[MAX_CHILDREN];
    int actual_ticks[MAX_CHILDREN];
    int total_actual_ticks;
    function_type functions[MAX_CHILDREN];
};

void yield_forever();
void run_forever();
void iowait_forever();
void exit_fast();

struct test_case tests[] = {
    {
        .name = "one process",
        .num_children = 1,
        .tickets[0] = 1000,
        .expect_ticks_unscaled[0] = 1,
        .functions[0] = yield_forever
    },
    {
        .name = "two processes, unequal ratio",
        .num_children = 2,
        .tickets[0] = 1000,
        .tickets[1] = 2000,
        .expect_ticks_unscaled[0] = 1,
        .expect_ticks_unscaled[1] = 2,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
    },
    {
        .name = "two processes, unequal ratio, small ticket count",
        .num_children = 2,
        .tickets[0] = 1,
        .tickets[1] = 2,
        .expect_ticks_unscaled[0] = 1,
        .expect_ticks_unscaled[1] = 2,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
    },
    {
        .name = "two processes, equal",
        .num_children = 2,
        .tickets[0] = 1000,
        .tickets[1] = 1000,
        .expect_ticks_unscaled[0] = 1,
        .expect_ticks_unscaled[1] = 1,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
    },
    {
        .name = "two processes, equal, small ticket count",
        .num_children = 2,
        .tickets[0] = 1,
        .tickets[1] = 1,
        .expect_ticks_unscaled[0] = 1,
        .expect_ticks_unscaled[1] = 1,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
    },
    {
        .name = "three processes, unequal",
        .num_children = 3,
        .tickets[0] = 500,
        .tickets[1] = 1000,
        .tickets[2] = 1750,
        .expect_ticks_unscaled[0] =  50,
        .expect_ticks_unscaled[1] = 100,
        .expect_ticks_unscaled[2] = 175,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
        .functions[2] = yield_forever,
    },
    {
        .name = "three processes, unequal, small ticket count",
        .num_children = 3,
        .tickets[0] = 2,
        .tickets[1] = 3,
        .tickets[2] = 4,
        .expect_ticks_unscaled[0] = 2,
        .expect_ticks_unscaled[1] = 3,
        .expect_ticks_unscaled[2] = 4,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
        .functions[2] = yield_forever,
    },
    {
        .name = "three processes, but one io-wait",
        .num_children = 3,
        .tickets[0] = 500,
        .tickets[1] = 1000,
        .tickets[2] = 1750,
        .expect_ticks_unscaled[0] =  50,
        .expect_ticks_unscaled[1] = 100,
        .expect_ticks_unscaled[2] =   0,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
        .functions[2] = iowait_forever,
    },
    {
        .name = "three processes, but one exits",
        .num_children = 3,
        .tickets[0] = 500,
        .tickets[1] = 1000,
        .tickets[2] = 1750,
        .expect_ticks_unscaled[0] =  50,
        .expect_ticks_unscaled[1] = 100,
        .expect_ticks_unscaled[2] =   0,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
        .functions[2] = exit_fast,
    },
    {
        .name = "seven procceses",
        .num_children = 7,
        .tickets[0] = 50,
        .tickets[1] = 60,
        .tickets[2] = 70,
        .tickets[3] = 80,
        .tickets[4] = 90,
        .tickets[5] = 100,
        .tickets[6] = 110,
        .expect_ticks_unscaled[0] =  50,
        .expect_ticks_unscaled[1] =  60,
        .expect_ticks_unscaled[2] =  70,
        .expect_ticks_unscaled[3] =  80,
        .expect_ticks_unscaled[4] =  90,
        .expect_ticks_unscaled[5] = 100,
        .expect_ticks_unscaled[6] = 110,
        .functions[0] = yield_forever,
        .functions[1] = yield_forever,
        .functions[2] = yield_forever,
        .functions[3] = yield_forever,
        .functions[4] = yield_forever,
        .functions[5] = yield_forever,
        .functions[6] = yield_forever,
    },
    {
        .name = "two processes, not all yielding",
        .num_children = 2,
        .tickets[0] = 50,
        .tickets[1] = 200,
        .expect_ticks_unscaled[0] =  50,
        .expect_ticks_unscaled[1] =  200,
        .functions[0] = yield_forever,
        .functions[1] = run_forever,
    },
    { .name = 0, }
};


#define LARGE_TICKET_COUNT 100000
#define NOT_AS_LARGE_TICKET_COUNT 10000
#define MAX_YIELDS_FOR_SETUP 100
#define WARMUP_TIME 5
#define SLEEP_TIME 50

__attribute__((noreturn))
void yield_forever() {
    while (1) {
        yield();
    }
}

__attribute__((noreturn))
void run_forever() {
    while (1) {
        __asm__("");
    }
}

__attribute__((noreturn))
void iowait_forever() {
    int fds[2];
    pipe(fds);
    while (1) {
        char temp[1];
        read(fds[0], temp, 0);
    }
}

__attribute__((noreturn))
void exit_fast() {
    exit();
}


int spawn(int tickets, function_type function) {
    int pid = fork();
    if (pid == 0) {
        settickets(tickets);
        yield();
        (*function)();
        exit();
    } else if (pid != -1) {
        return pid;
    } else {
        printf(2, "error in fork\n");
        return -1;
    }
}

int find_index_of_pid(int *list, int list_size, int pid) {
    for (int i = 0; i < list_size; ++i) {
        if (list[i] == pid)
            return i;
    }
    return -1;
}

void wait_for_ticket_counts(int num_children, int *pids, int *tickets) {
    /* temporarily lower our share to give other processes more of a chance to run
     * their settickets() call */
    settickets(NOT_AS_LARGE_TICKET_COUNT);
    for (int yield_count = 0; yield_count < MAX_YIELDS_FOR_SETUP; ++yield_count) {
        yield();
        int done = 1;
        struct processes_info info;
        getprocessesinfo(&info);
        for (int i = 0; i < num_children; ++i) {
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
            if (info.tickets[index] != tickets[i]) done = 0;
        }
        if (done)
            break;
    }
    settickets(LARGE_TICKET_COUNT);
}

void check(struct test_case* test, int passed_p, const char *description) {
    test->total_tests++;
    if (!passed_p) {
        test->errors++;
        printf(1, "*** TEST FAILURE: for scenario '%s': %s\n", test->name, description);
    }
}

void execute_and_get_info(
        struct test_case* test, int *pids,
        struct processes_info *before,
        struct processes_info *after) {
    settickets(LARGE_TICKET_COUNT);
    for (int i = 0; i < test->num_children; ++i) {
        pids[i] = spawn(test->tickets[i], test->functions[i]);
    }
    wait_for_ticket_counts(test->num_children, pids, test->tickets);
    before->num_processes = after->num_processes = -1;
    sleep(WARMUP_TIME);
    getprocessesinfo(before);
    sleep(SLEEP_TIME);
    getprocessesinfo(after);
    for (int i = 0; i < test->num_children; ++i) {
        kill(pids[i]);
    }
    for (int i = 0; i < test->num_children; ++i) {
        wait();
    }
}

void count_ticks(
        struct test_case *test, int *pids,
        struct processes_info *before,
        struct processes_info *after) {
    test->total_actual_ticks = 0;
    for (int i = 0; i < test->num_children; ++i) {
        int before_index = find_index_of_pid(before->pids, before->num_processes, pids[i]);
        int after_index = find_index_of_pid(after->pids, after->num_processes, pids[i]);
        check(test,
              before_index >= 0 && after_index >= 0,
              "subprocess's pid appeared in getprocessesinfo output");
        if (before_index >= 0 && after_index >= 0) {
            check(test,
                  test->tickets[i] == before->tickets[before_index] &&
                  test->tickets[i] == after->tickets[after_index],
                  "subprocess assigned correct number of tickets");
            test->actual_ticks[i] = after->ticks[after_index] - before->ticks[before_index];
            test->total_actual_ticks += test->actual_ticks[i];
        } else {
            test->actual_ticks[i] = -99999; // obviously bogus count that will fail checks later
        }
    }
}

void dump_test_timings(struct test_case *test) {
    printf(1, "-----------------------------------------\n");
    printf(1, "%s expected ticks ratios and observations\n", test->name);
    printf(1, "#\texpect\tobserve\t(description)\n");
    for (int i = 0; i < test->num_children; ++i) {
        const char *assigned_function = "(unknown)";
        if (test->functions[i] == yield_forever) {
            assigned_function = "yield_forever";
        } else if (test->functions[i] == run_forever) {
            assigned_function = "run_forever";
        } else if (test->functions[i] == iowait_forever) {
            assigned_function = "iowait_forever";
        } else if (test->functions[i] == exit_fast) {
            assigned_function = "exit_fast";
        }
        printf(1, "%d\t%d\t%d\t(assigned %d tickets; running %s)\n",
            i,
            test->expect_ticks_unscaled[i],
            test->actual_ticks[i],
            test->tickets[i],
            assigned_function);
    }
    printf(1, "\nNOTE: the 'expect' values above represent the expected\n"
              "      ratio of ticks between the processes. So, to compare\n"
              "      them to the observations by hand, multiply each expected\n"
              "      value by (sum of observed)/(sum of expected)\n");
    printf(1, "-----------------------------------------\n");
}

/* The comapre_ticks() code tries to do a Chi-squared test.
   
   Since we can't use floating point in xv6, calculations are done in fixed point.
*/
#define FIXED_POINT_BASE (1<<10)
#define FIXED_POINT_COUNT 10

/* chi-squared thresholds for a p-value of 0.001,
   for 1, 2, ..., 10 degrees of freedom
 */
const long long chi_squared_thresholds[] = {
    FIXED_POINT_BASE / 100 * 1083,
    FIXED_POINT_BASE / 100 * 1382,
    FIXED_POINT_BASE / 100 * 1627,
    FIXED_POINT_BASE / 100 * 1847,
    FIXED_POINT_BASE / 100 * 2052,
    FIXED_POINT_BASE / 100 * 2246,
    FIXED_POINT_BASE / 100 * 2432,
    FIXED_POINT_BASE / 100 * 2612,
    FIXED_POINT_BASE / 100 * 2788,
    FIXED_POINT_BASE / 100 * 2959,
};

int compare_ticks_chi_squared(struct test_case *test) {
    if (test->num_children < 2) {
        return 1;
    }
    long long expect_ticks_total = 0;
    for (int i = 0; i < test->num_children; ++i) {
        expect_ticks_total += test->expect_ticks_unscaled[i];
    }
    /*
       compute the expected number of ticks for each child given the total number
       (in fixed point, so the rounding isn't so extreme.

       then, use this to compute the chi-squared test statistic:
        
        sum( (observed - expected)^2 / expected )
    
       then compare this to our table of thresholds on the chi-squared distribution for
       the appropriate degree of freedom

       as a special case, we simply ignore columns for which we expect 0 items, except
       that other columns are computed based on the portion of the actual total number of
       ticks.

       a better solution would be to use a statistical test that can handle this case,
       like Fisher's exact test.
    */
    long long delta = 0;
    int skipped = 0;
    for (int i = 0; i < test->num_children; ++i) {
        long long scaled_expected = (test->expect_ticks_unscaled[i] << FIXED_POINT_COUNT) / expect_ticks_total
                             * test->total_actual_ticks;
#ifdef DEBUG
        printf(1, "scaled %d to %d for ratio %d:%d\n",
            test->expect_ticks_unscaled[i],
            (int)(scaled_expected >> FIXED_POINT_COUNT),
            (int) expect_ticks_total,
            test->total_actual_ticks);
#endif
        if (scaled_expected == 0) {
            ++skipped;
            continue;
        }
        long long cur_delta = scaled_expected - (test->actual_ticks[i] << FIXED_POINT_COUNT);
#ifdef DEBUG
        printf(1, "raw delta is is %x/%x\n", (int) cur_delta, (int) (cur_delta >> 32));
        printf(1, "raw delta rounded is is %x\n", (int) (cur_delta >> FIXED_POINT_COUNT));
#endif
        cur_delta *= cur_delta;
#ifdef DEBUG
        if (cur_delta <= 0LL) {
            printf(1, "delta is negative???\n");
        }
#endif
        // cur_delta >>= FIXED_POINT_COUNT; // skipped because cancelled out by future shift back
#ifdef DEBUG
        printf(1, "delta before division [raw]     %x/%x\n", (int) cur_delta, (int) (cur_delta >> 32));
        printf(1, "delta before division [rounded] %d\n", (int) (cur_delta >> FIXED_POINT_COUNT));
#endif
        if (scaled_expected > 0) {
            // cur_delta <<= FIXED_POINT_COUNT;
            cur_delta /= scaled_expected;
        } else {
            /* a huge number to make sure statistical test fails */
            cur_delta = FIXED_POINT_BASE * 100000LL;
        }
#ifdef DEBUG
        printf(1, "cur_delta = %x/%x\n", (int) cur_delta, (int) (cur_delta >> 32));
#endif
        delta += cur_delta;
    }
#ifdef DEBUG
    printf(1, "%s test statistic %d (rounded)\n", test->name, (int) ((delta + FIXED_POINT_BASE / 2) >> FIXED_POINT_COUNT));
#endif
    int degrees_of_freedom = test->num_children - 1 - skipped;
    long long expected_value = chi_squared_thresholds[degrees_of_freedom - 1];
    int passed_threshold = delta < expected_value;
    check(test, passed_threshold,
          "distribution of ticks run passed chi-squared test "
          "for being same as expected");
    if (!passed_threshold) {
        dump_test_timings(test);
    }
    check(test, test->total_actual_ticks > 10,
          "experiment ran for a non-trivial number of ticks");
    return passed_threshold;
}

/* rather than doing a proper statistical test, make sure
   the results are within +/-20% +/- 10.

   (The extra +/- 10 is to handle cases where things run for a small
   number of ticks.)

   This hopefully will detect cases where a biased random
   number generator is in use but otherwise the implementation
   is generally okay.
 */
void compare_ticks_naive(struct test_case *test) {
    if (test->num_children < 2) {
        return;
    }
    int expect_ticks_total = 0;
    for (int i = 0; i < test->num_children; ++i) {
        expect_ticks_total += test->expect_ticks_unscaled[i];
    }
    int failed_any = 0;
    for (int i = 0; i < test->num_children; ++i) {
        long long scaled_expected = ((long long) test->expect_ticks_unscaled[i] * test->total_actual_ticks) / expect_ticks_total;
        int max_expected = scaled_expected * 11 / 10 + 10;
        int min_expected = scaled_expected * 9 / 10 - 10;
        int in_range = (test->actual_ticks[i] >= min_expected && test->actual_ticks[i] <= max_expected);
        if (!in_range) {
            failed_any = 1;
        }
    }
    check(test, !failed_any, "tick counts within +/- 10% or +/- 10 of expected");
    if (!failed_any) {
        printf(1, "*** %s failed chi-squared test, but was w/in 10% of expected\n", test->name);
        printf(1, "*** a likely cause is bias in random number generation\n");
    }
}

void run_test_case(struct test_case* test) {
    int pids[MAX_CHILDREN];
    test->total_tests = test->errors = 0;
    struct processes_info before, after;
    execute_and_get_info(test, pids, &before, &after);
    check(test, 
          before.num_processes < NPROC && after.num_processes < NPROC &&
          before.num_processes > test->num_children && after.num_processes > test->num_children,
          "getprocessesinfo returned a reasonable number of processes");
    count_ticks(test, pids, &before, &after);
    if (!compare_ticks_chi_squared(test)) {
        compare_ticks_naive(test);
    }
    printf(1, "%s: passed %d of %d\n", test->name, test->total_tests - test->errors, test->total_tests);
}

int main(int argc, char *argv[])
{
    int total_tests = 0;
    int passed_tests = 0;
    for (int i = 0; tests[i].name; ++i) {
        struct test_case *test = &tests[i];
        run_test_case(test);
        total_tests += test->total_tests;
        passed_tests += test->total_tests - test->errors;
    }
    printf(1, "overall: passed %d of %d\n", passed_tests, total_tests);
    exit();
}
