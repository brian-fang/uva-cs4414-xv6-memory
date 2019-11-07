#include "types.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
    int pid;
    if ( 0 /*argc > 1 */) {
        pid = atoi(argv[1]);
    } else {
        pid = getpid();

    
       	//printf(1, "Old program break: %p\n", sbrk(atoi(argv[1])));

       	//printf(1, "New program break: %p\n", sbrk(0));

        // int fd = open("timewithticket", O_RDWR);


        // sbrk(5000000);

        sbrk(5000000);

        /*

        char * buf = sbrk(0)-4096*4;

        *buf = 'L';

        int i;
        if((i = read(fd, buf, 10000)) == 10000) 
            printf(1, "read good\n");
        else 
            printf(1, "ruh roh, read only %d bytes\n", i);

        printf(1, "I'm still OK! \n");
        */


        int parent = fork();


        char* buf = malloc(2>>5);


        if(parent) {
            *buf = 5;
            printf(1, "hello from parent\n", pid);
            wait();
        } else {
            printf(1, "hello from child %d\n", getpid());
        }


        // *((char*)i+5) = 'H';







        // *((char*)0x10AAA) = 'R';


        // *buf = 'L';

        // *((char*)0x8000000) = 'R';
        // char *c = sbrk(0)-1;

        // *c = 'X';


        // char *buf = malloc(8192);
        // for(int i = 0; i < 8192; i += 3500) buf[i] = 'R';






        // free(ptr);

    }  


    // dumppagetable(pid);
    exit();
}
