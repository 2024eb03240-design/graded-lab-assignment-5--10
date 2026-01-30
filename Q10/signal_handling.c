#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

void handle_sigterm(int sig) {
    printf("Parent received SIGTERM (signal %d). Exiting gracefully.\n", sig);
    exit(0);
}

void handle_sigint(int sig) {
    printf("Parent received SIGINT (signal %d). Ignoring and continuing.\n", sig);
}

int main() {
    signal(SIGTERM, handle_sigterm);
    signal(SIGINT, handle_sigint);

    pid_t child1 = fork();
    if (child1 == 0) {
        sleep(5);
        kill(getppid(), SIGTERM);  // Send SIGTERM to parent
        exit(0);
    }

    pid_t child2 = fork();
    if (child2 == 0) {
        sleep(10);
        kill(getppid(), SIGINT);  // Send SIGINT to parent
        exit(0);
    }

    printf("Parent PID: %d running. Waiting for signals...\n", getpid());

    // Infinite loop to wait for signals
    while(1) {
        pause();  // Wait for signal
    }

    return 0;
}
