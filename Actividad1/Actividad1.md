# Investigación sobre Conceptos de Sistemas Operativos

## Tipos de Kernel

En los sistemas operativos, el kernel es un componente crucial que sirve como puente entre el hardware del sistema y sus procesos de software. Existen varios tipos de kernels, cada uno con características distintas:

### Monolithic Kernels
Los kernels monolíticos incorporan tanto los servicios del usuario como los del kernel en un mismo espacio de memoria. Esto conlleva un aumento en el tamaño del kernel y del sistema operativo, pero facilita una ejecución más rápida de los procesos. Sin embargo, son menos flexibles y un fallo en un servicio puede provocar el fallo de todo el sistema.

### Microkernels
Los microkernels separan los servicios del usuario y del kernel en espacios distintos. Esto reduce el tamaño del kernel, aunque puede disminuir la velocidad de ejecución. Son más seguros y flexibles, ya que permiten añadir nuevos servicios fácilmente y permanecen inafectados si un servicio dentro del espacio de direcciones falla.

### Hybrid Kernels
Los kernels híbridos combinan características de los kernels monolíticos y microkernels. Buscan utilizar la velocidad de los monolíticos y la modularidad de los microkernels. Algunos servicios se ejecutan en el espacio del kernel para reducir la sobrecarga de rendimiento, pero aún así, ejecutan código del kernel como servidores en el espacio del usuario.

## User vs Kernel Mode

En cuanto a la operación de los sistemas, se distinguen principalmente dos modos: Kernel Mode y User Mode:

### Kernel Mode
En este modo, el software tiene acceso completo y sin restricciones al sistema y sus recursos. El kernel del sistema operativo y los controladores del kernel operan en este modo altamente privilegiado.

### User Mode
Las aplicaciones de usuario, como procesadores de texto o juegos, se ejecutan en este modo. Estas aplicaciones no pueden acceder directamente a los recursos del sistema y deben realizar llamadas al sistema al kernel para acceder a dichos recursos.

## Interrupciones vs Traps

Las interrupciones y traps son mecanismos importantes en los sistemas operativos, pero difieren en sus propósitos y comportamientos:

- **Interrupciones**: Generalmente generadas por hardware, sirven para señalar eventos como la finalización de una operación de E/S.
- **Traps**: Son excepciones generadas por el software cuando ocurre una condición de error o una solicitud específica de servicio del sistema operativo.

Ambos mecanismos son fundamentales para la gestión eficiente y segura de los recursos y procesos dentro de un sistema operativo.

---
