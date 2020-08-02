#include "kernel/types.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
    int p[2], c[2];
    pipe(p);
    pipe(c);
    char buf[128];

    if(fork() == 0){
        //child logic
        read(p[0], buf, 1);
        printf("%d: received ping\n", getpid());
        write(c[1], "hello from child", 1);
    }else{
        //parent logic
        write(p[1], "hello from parent", 1);
        read(c[0], buf, 1);
        printf("%d: received pong\n", getpid());
    }

    exit();
}