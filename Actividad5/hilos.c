#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>

// Esta es la función que se ejecutará en el hilo.
void *thread_function(void *arg) {
    printf("Hilo creado con éxito. ID del hilo: %ld\n", pthread_self());
    // Aquí va la lógica del hilo...
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread;

    // Crear un proceso hijo
    pid = fork();
    if (pid == -1) {
        // Error al crear el proceso hijo
        perror("fork failed");
        exit(EXIT_FAILURE);
    } else if (pid == 0) {
        // Este es el proceso hijo
        printf("Proceso hijo creado con PID: %d\n", getpid());

        // El proceso hijo crea otro proceso hijo
        pid_t child_pid = fork();
        if (child_pid == -1) {
            // Error al crear el segundo proceso hijo
            perror("fork failed");
            exit(EXIT_FAILURE);
        } else if (child_pid == 0) {
            // Este es el segundo proceso hijo
            printf("Segundo proceso hijo creado con PID: %d\n", getpid());
            exit(EXIT_SUCCESS);
        } else {
            // Este es el primer proceso hijo creando un hilo
            if (pthread_create(&thread, NULL, &thread_function, NULL) != 0) {
                perror("pthread_create failed");
                exit(EXIT_FAILURE);
            }
            // Esperar a que el hilo termine
            pthread_join(thread, NULL);
            exit(EXIT_SUCCESS);
        }
    } else {
        // Este es el proceso padre
        printf("Proceso padre con PID: %d\n", getpid());

        // El proceso padre crea otro proceso hijo
        pid = fork();
        if (pid == -1) {
            // Error al crear el tercer proceso hijo
            perror("fork failed");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {
            // Este es el tercer proceso hijo
            printf("Tercer proceso hijo creado con PID: %d\n", getpid());
            exit(EXIT_SUCCESS);
        }
        // El proceso padre espera a que todos los procesos hijo terminen
        wait(NULL);
        wait(NULL);
    }

    return EXIT_SUCCESS;
}
