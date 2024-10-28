
def generar_tablero(n):
    return list(range(n, 0, -1))

def permutar(tablero):
    def backtrack(tablero, index, n, soluciones):
        if index == n:
            soluciones.append(tablero[:]) 
            return
        for i in range(index, n):
            tablero[index], tablero[i] = tablero[i], tablero[index] 
            if index == 0 or buen_tablero(tablero[:index + 1]): 
                backtrack(tablero, index + 1, n, soluciones)
            tablero[index], tablero[i] = tablero[i], tablero[index] 

    soluciones = []
    backtrack(tablero, 0, len(tablero), soluciones)  
    return soluciones

def buen_tablero(tablero):
    for i in range(len(tablero)):
        for j in range(i + 1, len(tablero)):
            if abs(i - j) == abs(tablero[i] - tablero[j]) or tablero[i] == tablero[j]:
                return False
    return True

def k_reinas(n):
    soluciones = []
    tablero = generar_tablero(n)
    for perm in permutar(tablero):
        if buen_tablero(perm):
            soluciones.append(perm)
    return soluciones

print(k_reinas(9))