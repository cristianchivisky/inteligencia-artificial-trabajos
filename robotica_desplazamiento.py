import heapq

# Datos de costos representados en una matriz
costos = [
    [11.2, 10.2,  9.2,  8.2,  None, 6.8,  5.8,  4.8,  3.8,  3.4,  3.0],
    [10.8,  9.8,  8.8,  7.8,  6.8,  5.8,  4.8,  4.4,  None, 2.4,  2.0],
    [11.2, 10.2,  None, None, 6.4,  5.4,  4.4,  3.4,  None, 1.4,  1.0],
    [10.8,  9.8,  8.8,  7.8,  6.8, None, 4.0,  3.0,  2.0,  1.0,  0.0],
    [11.2, 10.2,  9.2,  8.2,  7.8, None, 4.4,  3.4,  2.4,  1.4,  1.0]
]

# Verifica si la posicion está dentro de los limites de la matriz
def es_valido(x, y):
    return 0 <= x < len(costos) and 0 <= y < len(costos[0]) and costos[x][y] is not None

# Obtiene los vecinos validos de una posicion
def obtener_vecinos(x, y):
    vecinos = [
        (x + 1, y),     # Abajo
        (x - 1, y),     # Arriba
        (x, y + 1),     # Derecha
        (x, y - 1),     # Izquierda
        (x + 1, y + 1), # Abajo-Derecha
        (x + 1, y - 1), # Abajo-Izquierda
        (x - 1, y + 1), # Arriba-Derecha
        (x - 1, y - 1)  # Arriba-Izquierda
    ]
    return [(nx, ny) for nx, ny in vecinos if es_valido(nx, ny)]

# Encuentra el mejor movimiento basado en el costo minimo
def mejor_movimiento(x, y):
    vecinos = obtener_vecinos(x, y)
    if vecinos:
        return min(vecinos, key=lambda pos: costos[pos[0]][pos[1]])
    return None

# Backtracking para encontrar el camino optimo hacia el objetivo (0)
def buscar_camino(x, y, camino):
    camino.append((x, y))

    # Condición de parada
    if costos[x][y] == 0.0:
        return True

    # Encontrar el mejor movimiento basado en el costo decreciente
    siguiente = mejor_movimiento(x, y)
    if siguiente:
        sx, sy = siguiente
        if costos[sx][sy] <= costos[x][y]:  # El costo debe ser decreciente
            if buscar_camino(sx, sy, camino):
                return True

    # Backtracking si no se encontro un camino valido
    camino.pop()
    return False

# Función principal para iniciar la busqueda desde (0, 0)
def encontrar_camino():
    camino = []
    if buscar_camino(0, 0, camino):
        return camino
    return None

# Mostrar el mapa
def mostrar_mapa():
    for fila in costos:
        print(" ".join(f"{costo:6.2f}" if costo is not None else " null " for costo in fila))

# Ejecucion del programa
if __name__ == "__main__":
    mostrar_mapa()
    print("\nBuscando el camino optimo desde (0, 0)...\n")
    camino = encontrar_camino()

    if camino:
        print("Camino encontrado:", camino)
    else:
        print("No se encontro un camino valido.")


