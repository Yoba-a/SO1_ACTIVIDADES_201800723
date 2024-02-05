#!/bin/bash

export GITHUB_USER=Yoba-a

GITHUB_USER = ${GITHUB_USER}


#Creamos la carpeta del log para la fecha actual
FOLDER_LOG=$(date +%F)
mkdir -p /tmp/${FOLDER_LOG}

# Consultar el api de github para obtener la informacion del usuario
RESPONSE=$(curl -s "https://api.github.com/users/${GITHUB_USER}")


#VALIDAR SI LA VARIABLE RESPONSE NO ESTA VACIA
if [ -z "${RESPONSE}" ]; then
    echo "No se pudo obtener la informacion del usuario ${GITHUB_USER}"
    exit 1
fi

#Extraer la informacion del usuario
USER_LOGIN=$(echo ${RESPONSE} | jq -r '.login')
USER_ID=$(echo ${RESPONSE} | jq -r '.id')
CREATED_AT=$(echo ${RESPONSE} | jq -r '.created_at')

#IMPRIMIR EL MENSAJE EN CONSOLA
echo "Hola ${USER_LOGIN}. User ID: ${USER_ID}. Cuenta fue creada el: ${CREATED_AT}."

# Escribir el mensaje en el archivo de log
echo "Hola ${USER_LOGIN}. User ID: ${USER_ID}. Cuenta fue creada el: ${CREATED_AT}." >> "/tmp/${FOLDER_LOG}/saludos.log"