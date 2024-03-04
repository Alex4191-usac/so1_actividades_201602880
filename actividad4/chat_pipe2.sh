#!/bin/bash

ruta_comunicacion="/tmp/chat_pipe12"

[ ! -p "$ruta_comunicacion" ] && mkfifo "$ruta_comunicacion"
echo "Chat 2 iniciado. Escribe 'exit' para finalizar."
while true; do
    read -p "Participante 2: " mensaje
    echo "$mensaje" > "$ruta_comunicacion"
    [ "$mensaje" = "exit" ] && break
    read -r mensaje < "$ruta_comunicacion"
    echo "Participante 1: $mensaje"
done


