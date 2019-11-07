#include "pagingtestlib.h"

int main() {
    setup();
    test_allocation_no_fork(900 * 1024 * 1024, "900MB", "4MB", 899 * 1024 * 1024, 1 * 1024 * 1024, 450 * 1024 * 1024, 1 * 1024 * 1024, 0);
    shutdown();
}
