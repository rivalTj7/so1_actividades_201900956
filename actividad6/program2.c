#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        perror("fork failed");
        exit(1);
    }

    if (pid == 0) {
        printf("Proceso hijo - PID %d\n", getpid());
        exit(0);
    } else {
        printf("Proceso padre - PID %d\n", getpid());

        printf("Proceso zombie\n", pid);
        sleep(60);

        wait(NULL);
        printf("Proceso zombie - PID %d a sido absorvido por el proceso padre\n", pid);
    }

    return 0;
}
