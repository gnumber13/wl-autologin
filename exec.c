#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main () {
    execl("main.sh", "main.sh", NULL);
    //execlp("echo", "echo", "hello", NULL);
}
