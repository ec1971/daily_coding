#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"

int endsWith(char *str, const char *suffix)
{
    if (!str || !suffix)
        return 0;
    int lenstr = strlen(str);
    int lensuffix = strlen(suffix);
    if (lensuffix >  lenstr)
        return 0;
    return strcmp(str + lenstr - lensuffix, suffix) == 0;
}
void findFile(char *path, char *fname){
    
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st;

    if((fd = open(path, 0)) < 0){ 
        fprintf(2, "ls: cannot open %s\n", path);
        return;
    }

    if(fstat(fd, &st) < 0){
        fprintf(2, "ls: cannot stat %s\n", path);
        close(fd);
        return;
    }

    switch(st.type){
        case T_FILE:
            if(endsWith(path, fname)){
                printf("%s\n", path);
            }
            break;

        case T_DIR:
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
                break;
            }
            strcpy(buf, path);
            p = buf+strlen(buf);
            *p++ = '/';
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
                if(de.inum == 0)
                    continue;
                if(strcmp(de.name, ".") == 0 || strcmp(de.name, "..") == 0)
                    continue;
                memmove(p, de.name, DIRSIZ);
                p[DIRSIZ] = 0;
                findFile(buf, fname);
            }
            break;
        }
  close(fd); 
}


int
main(int argc, char *argv[])
{
  if(argc < 3){
    printf("invalid usage: please provide a path and a target\n");
    exit();
  }
  char *path = argv[1];
  char *fname = argv[2];
  findFile(path, fname);
  exit();
}
