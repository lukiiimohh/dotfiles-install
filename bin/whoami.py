import time

# Cadena a imprimir y borrar
string = "\n I'm luk, CTF Player and Arch Linux User."

# Acumulador de string
accumulator = ""

# Imprimir letra a letra en azul
for i in range(len(string)):
    # Imprimir letra en azul y acumularla
    print(f"\033[34m{string[i]}\033[0m", end="", flush=True)
    accumulator += string[i]
    time.sleep(0.1)

# Hacer una pausa de 1.5 segundos
time.sleep(1.5)

# Borrar string acumulado progresivamente
length = 0
while True:
    # Borrar una posición hacia atrás y mover el cursor a la izquierda
    print("\b \b", end="", flush=True)
    length += 1
    time.sleep(0.1)
    if length == len(accumulator):
        break
