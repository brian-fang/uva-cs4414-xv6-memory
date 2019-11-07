#include "pagingtestlib.h"

int main(void) {
    setup();
    printf(1,"TEST:EXPECTCOUNT:8\n");
    char *p = sbrk(500 * 1024 * 1024);
    p[250 * 1024 * 1024] = 'A';
    int pid = fork();
    if (pid == 0) {
        for (int i = 0; i < 7; ++i) {
            test_copy_on_write(100 * 1024 * 1024, "100MB", 12);
        }
        exit();
    } else {
        wait();
        printf(1, PASS_MSG "\n");
        shutdown();
    }
}
