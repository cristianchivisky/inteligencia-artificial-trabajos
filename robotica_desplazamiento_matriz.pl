% Definimos la matriz de costos como una lista de listas
matriz_costos([
    [11.2, 10.2, 9.2, 8.2, null, 6.8, 5.8, 4.8, 3.8, 3.4, 3.0],
    [10.8, 9.8, 8.8, 7.8, 6.8, 5.8, 4.8, 4.4, null, 2.4, 2.0],
    [11.2, 10.2, null, null, 6.4, 5.4, 4.4, 3.4, null, 1.4, 1.0],
    [10.8, 9.8, 8.8, 7.8, 6.8, null, 4.0, 3.0, 2.0, 1.0, 0.0],
    [11.2, 10.2, 9.2, 8.2, 7.8, null, 4.4, 3.4, 2.4, 1.4, 1.0]
]).

% Obtiene el costo desde la matriz de costos
obtener_costo(X, Y, Costo) :-
    matriz_costos(Matriz),
    nth0(X, Matriz, Fila),
    nth0(Y, Fila, Costo).

% Define movimiento valido y obtiene el costo asociado
movimiento(X, Y, X1, Y1) :-
    (X1 is X + 1, X1 =< 4, Y1 is Y;
     X1 is X - 1, X1 >= 0, Y1 is Y;
     X1 is X, Y1 is Y + 1, Y1 =< 10;
     X1 is X, Y1 is Y - 1, Y1 >= 0;
     X1 is X + 1, X1 =< 4, Y1 is Y + 1, Y1 =< 10;
     X1 is X + 1, X1 =< 4, Y1 is Y - 1, Y1 >= 0;
     X1 is X - 1, X1 >= 0, Y1 is Y + 1, Y1 =< 10;
     X1 is X - 1, X1 >= 0, Y1 is Y - 1, Y1 >= 0),
    obtener_costo(X1, Y1, Costo),
    Costo \= null.

% Encuentra el siguiente movimiento con el costo minimo
mejor_movimiento(X, Y, XMejor, YMejor) :-
    findall((Costo, X1, Y1), (
        movimiento(X, Y, X1, Y1),
        obtener_costo(X1, Y1, Costo),
        Costo >= 0
    ), Movimientos),
    sort(1, @=<, Movimientos, [(_, XMejor, YMejor)|_]).  % Ordena por costo minimo

% Busca el camino mas corto usando backtracking
buscar_camino(X, Y, [(X, Y)]) :-
    obtener_costo(X, Y, 0.0).  % Condicion de parada: llegar al destino
buscar_camino(X, Y, [(X, Y)|Camino]) :-
    mejor_movimiento(X, Y, X1, Y1),
    buscar_camino(X1, Y1, Camino).

% Iniciar busqueda desde el punto (0,0)
encontrar_camino(Camino) :-
    buscar_camino(0, 0, Camino),
    write_term(Camino, [quoted(false), portray(true), max_depth(1000)]),
    nl.

% Muestra el mapa de costos
mostrar_mapa :-
    matriz_costos(Matriz),
    forall(nth0(X, Matriz, Fila),
           (forall(nth0(Y, Fila, Costo),
                   (Costo \= null -> format('~4f ', [Costo]) ; write('null  '))),
            nl)).
