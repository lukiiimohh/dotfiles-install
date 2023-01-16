import argparse
import os
import requests

# Parseamos los argumentos de la línea de comandos
parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-f', '--file', required=False, help='Ruta del archivo a analizar')
args = parser.parse_args()

# Comprobamos que se ha especificado el flag -f o --file
if not args.file:
    print("Error: no se ha especificado la ruta del archivo a analizar")
    print("Ejecución correcta: python script.py -f /ruta/al/archivo")
    exit(1)

# Comprobamos que el archivo existe
if not os.path.exists(args.file):
    print("Error: el archivo especificado no existe")
    print("Ejecución correcta: python script.py -f /ruta/al/archivo")
    exit(1)

# Comprobamos que el archivo es un archivo y no un directorio
if not os.path.isfile(args.file):
    print("Error: el archivo especificado no es un archivo")
    print("Ejecución correcta: python script.py -f /ruta/al/archivo")
    exit(1)

# Abrimos el archivo y leemos las líneas
with open(args.file, 'r') as f:
    lines = f.readlines()

# Inicializamos un contador
counter = 1

# Iteramos sobre cada línea y hacemos una consulta a GTFOBins
for line in lines:
    line = os.path.basename(line.strip())
    r = requests.get(f'https://gtfobins.github.io/gtfobins/{line}/')
    if r.status_code == 200:
        # Imprimimos la numeración y el resultado
        print(f'{counter}. {line.capitalize()} es una vía potencial para escalar privilegios: https://gtfobins.github.io/gtfobins/{line}/')
        # Incrementamos el contador
        counter += 1
