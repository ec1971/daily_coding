#include "kernel/types.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
  int duration;
  if(argc < 2){
      printf("too few arguments\n");
      exit();
  }
  duration = atoi(argv[1]);
  printf("(nothing happens for a little while)\n");
  sleep(duration);
  exit();
}