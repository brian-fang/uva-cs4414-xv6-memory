#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"


// int write(int, void*, int);

int
main(int argc, char *argv[])
{
 

  int wc = writecount();
  printf(1, "%d", wc);
  
  exit();
}
