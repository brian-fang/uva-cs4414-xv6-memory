#include "pagingtestlib.h"

int main() {
    setup();
    test_allocation_no_fork(4096, "4K", "1K", 512, 1024, 1024+512,512, 1);
    shutdown();
}
