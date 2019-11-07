#include "pagingtestlib.h"

int main(void) {
    setup();
    test_copy_on_write_less_forks(4096, "4096", 1);
    shutdown();
}
