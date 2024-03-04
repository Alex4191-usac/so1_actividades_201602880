#!/bin/bash

ruta_comunicacion="/tmp/chat_pipe12"

[ ! -p "$ruta_comunicacion" ] && mkfifo "$ruta_comunicacion"

echo "Chat 1 iniciado. Escribe 'exit' para finalizar."

while true; do
    read -r mensaje < "$ruta_comunicacion"
    echo "Participante 2: $mensaje"
    [ "$mensaje" = "exit" ] && break
    read -p "Participante 1: " mensaje
    echo "$mensaje" > "$ruta_comunicacion"
done

