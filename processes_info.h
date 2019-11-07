#include "param.h"

struct processes_info {
    int num_processes;
    int pids[NPROC];       
    int ticks[NPROC];       // ticks = number of times process has been scheduled
    int tickets[NPROC];     // tickets = number of tickets set by settickets()
};
