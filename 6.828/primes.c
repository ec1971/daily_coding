#include "kernel/types.h"
#include "user/user.h"

//one issue I had earlier is i didn't know how to make sure that how to 
//read/write to the designated pipe while at the same time make it resuable
//turned out I just need to redirect read to 0 and write to 1
void cull(int p){
    int n;
    while (read(0, &n, sizeof(n))) {
        if (n % p != 0) {
            write(1, &n, sizeof(n));
        }
    }
}

//redirecting pd[k] to k
void redirect(int k, int pd[2]){
    close(k);
    dup(pd[k]);
    close(pd[0]);
    close(pd[1]);
}
//filtering process
void process(){
    //read the first number from pipe (redirect to 0)
    //the first number is guaranteed to be prime
    int p;
    int pd[2];
    if(read(0, &p, sizeof(p))){
        //here stdout is unaffected
        printf("prime %d\n", p);
        pipe(pd);
        if(fork()){
            redirect(0, pd);
            process();
        }else{
            redirect(1, pd);
            cull(p);
        }
    }
}
int
main(int argc, char *argv[])
{
    int pd[2];
    pipe(pd);

    //this has to be done by parent otherwise program gets blocked; but why?
    if(fork()){
        redirect(0, pd);
        process();
    }else{
        redirect(1, pd);
        //initial input
        for(int i = 2; i < 36; i++){
            write(1, &i, sizeof(i));
        }
    }

    exit();
}