#!/bin/bash

# Crear los named pipes si no existen
if [[ ! -p mypipe1 ]]; then
    mkfifo mypipe1
fi

if [[ ! -p mypipe2 ]]; then
    mkfifo mypipe2
fi

# Función para limpiar los pipes al salir
cleanup() {
    echo "Limpiando..."
    rm mypipe1 mypipe2
    exit
}

# Atrapar la señal de salida para ejecutar la limpieza
trap cleanup EXIT

# Chat
chat() {
    local pipe_in=$1
    local pipe_out=$2
    local name=$3

    # Leer el input del usuario y escribir en el pipe_out
    while true; do
        read input
        echo "$name: $input" > $pipe_out
    done &
    
    # Leer el pipe_in y mostrar los mensajes en pantalla
    while read line; do
        echo $line
    done < $pipe_in
}

# Comenzar el chat
# El primer argumento para chat es el pipe de entrada, el segundo es el pipe de salida, y el tercero es el nombre del usuario
if [[ $1 == 'usuario1' ]]; then
    chat mypipe1 mypipe2 "Usuario 1"
elif [[ $1 == 'usuario2' ]]; then
    chat mypipe2 mypipe1 "Usuario 2"
else
    echo "Por favor, inicia el script con 'usuario1' o 'usuario2' como argumento."
fi
