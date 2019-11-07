#include "pagingtestlib.h"

int main(void) {
    setup();
    test_copy_on_write_less_forks_alt(4096, "4096", 5, 0);
    shutdown();
}
