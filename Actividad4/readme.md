# Chat Básico con Named Pipes

Este es un chat básico que permite la comunicación entre dos usuarios en una misma máquina Unix/Linux utilizando Named Pipes.

## Requisitos

- Tener acceso a una terminal Unix/Linux.
- Tener permisos para crear archivos en el directorio donde ejecutarás el script.

## Instrucciones de Uso

1. Descarga el script `chat.sh` en tu sistema Unix/Linux.
2. Abre dos terminales.
3. En una terminal, ejecuta el script con el comando `bash chat.sh usuario1`.
4. En la otra terminal, ejecuta el script con el comando `bash chat.sh usuario2`.
5. Ahora puedes empezar a escribir mensajes en cualquiera de las terminales y deberían aparecer en la otra.

## Cómo Funciona

El script crea dos Named Pipes, `mypipe1` y `mypipe2`, que actúan como canales de comunicación para los mensajes. Cada usuario tiene un pipe de entrada y un pipe de salida. Cuando un usuario escribe un mensaje, este se escribe en su pipe de salida y se lee desde el pipe de entrada del otro usuario, permitiendo así la comunicación bidireccional.

## Limpieza

El script está diseñado para eliminar los Named Pipes creados al salir. Si el script se interrumpe inesperadamente, puedes eliminar los pipes manualmente con `rm mypipe1 mypipe2`.

## Notas Adicionales

- Este chat es extremadamente básico y no está encriptado.
- Solo está diseñado para funcionar en la misma máquina.
- Asegúrate de no tener archivos importantes con los mismos nombres de los pipes en el directorio de trabajo.
