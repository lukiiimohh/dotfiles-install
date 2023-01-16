#!/bin/bash

# Parseamos los argumentos de la línea de comandos
while getopts ":f:" opt; do
  case $opt in
    f) file="$OPTARG"
    ;;
    \?) echo "Opción inválida: -$OPTARG" >&2
    exit 1
    ;;
  esac
done

# Comprobamos que el archivo especificado en el flag -f existe
if [ ! -f "$file" ]; then
    echo "Error: el archivo especificado no existe"
    echo "Ejecución correcta: bash script.sh -f /ruta/al/archivo"
    exit 1
fi

# Comprobamos que se ha especificado el flag -f
if [ -z "$file" ]; then
    echo "Error: no se ha especificado la ruta del archivo a analizar"
    echo "Ejecución correcta: bash script.sh -f /ruta/al/archivo"
    exit 1
fi

# Inicializamos un contador
counter=1

# Abrimos el archivo y leemos las líneas
while read -r line; do
  line=$(basename "$line" | tr -d '\r')
  r=$(curl -s "https://gtfobins.github.io/gtfobins/$line/")
  if [ "$?" -eq 0 ] && echo "$r" | grep -q "GTFOBins"; then
    # Imprimimos la numeración y el resultado
    printf "%s. %s es una vía potencial para escalar privilegios: https://gtfobins.github.io/gtfobins/%s/\n" "$counter" "${line^}" "$line"
    # Incrementamos el contador
    ((counter++))
  fi
done < "$file"
