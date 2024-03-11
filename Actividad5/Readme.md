## Preguntas y Respuestas sobre Creación de Procesos y Hilos

### a) ¿Cuántos procesos únicos son creados?

El código muestra la creación de procesos con dos llamadas a `fork()`. En la llamada a `fork()` dentro del bloque `if`, se creará un proceso hijo solo si el proceso original (proceso padre) ha creado con éxito un proceso hijo. Aquí está la descomposición de los procesos creados:

1. El proceso original (llamémoslo A).
2. A llama a `fork()` por primera vez, creando un proceso hijo (llamémoslo B).
3. B (el proceso hijo) entra en el bloque `if` y llama a `fork()` de nuevo, creando otro proceso hijo (llamémoslo C).
4. A continúa su ejecución después del bloque `if` y llama a `fork()` una segunda vez, creando otro proceso hijo (llamémoslo D).

Entonces, en total, se crean 3 nuevos procesos (B, C, D) además del proceso original (A), lo que hace un total de 4 procesos únicos.

### b) ¿Cuántos hilos únicos son creados?

Basándonos en la función `thread_create()` que se llama una vez dentro del proceso hijo, se crearía un único hilo adicional dentro de ese proceso hijo específico (B). No hay suficiente información para determinar cuántos hilos se crean en total porque el cuerpo de la función `thread_create()` no se muestra. Pero basándonos en la llamada única visible en el código, habría un hilo adicional en uno de los procesos hijos.
