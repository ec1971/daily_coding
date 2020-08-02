#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

//misunderstood the question. should have kept the original argvs
int
main(int argc, char *argv[])
{
    if(argc < 3){
        printf("need at least three arguments\n");
        exit();
    }
    if(fork()==0){
        argv++;
        exec(argv[0], argv);
    }
    wait();
    char c;
    int i = 0;
    char buf[512];
    char *args[32];
    while(read(0, &c, 1)>0){
        if (c != '\n')
        {
            buf[i++] = c;
            continue;
        }
        if (c == '\n')
        {
            buf[i] = '\0';
            i = 0;
            args[0] = argv[1];
            args[1] = buf;
            args[2] = 0;
            if (fork() == 0)
            {
                exec(args[0], args);
                exit();
            }
            else
            {
                wait();
            }
            buf[i] = '\0';
        }
    }

    exit();
}
