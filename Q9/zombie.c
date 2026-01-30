#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    pid_t pid;
    int i;

    for (i = 0; i < 3; i++) {
        pid = fork();
        if (pid < 0) {
            perror("Fork failed");
            exit(1);
        } else if (pid == 0) {
            // Child process
            printf("Child PID: %d started\n", getpid());
            sleep(2); // Simulate some work
            printf("Child PID: %d exiting\n", getpid());
            exit(0);
        }
    }

    // Parent waits for all children to prevent zombies
    int status;
    pid_t wpid;
    while ((wpid = wait(&status)) > 0) {
        printf("Parent cleaned up child PID: %d\n", wpid);
    }

    printf("Parent exiting\n");
    return 0;
}
