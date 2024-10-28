% Representacion de casillas con su costo: costo (X, Y, Costo).
costo(0, 0, 11.2).
costo(0, 1, 10.2).
costo(0, 2, 9.2).
costo(0, 3, 8.2).
costo(0, 5, 6.8).
costo(0, 6, 5.8).
costo(0, 7, 4.8).
costo(0, 8, 3.8).
costo(0, 9, 3.4).
costo(0, 10, 3.0).

costo(1, 0, 10.8).
costo(1, 1, 9.8).
costo(1, 2, 8.8).
costo(1, 3, 7.8).
costo(1, 4, 6.8).
costo(1, 5, 5.8).
costo(1, 6, 4.8).
costo(1, 7, 4.4).
costo(1, 9, 2.4).
costo(1, 10, 2.0).

costo(2, 0, 11.2).
costo(2, 1, 10.2).
costo(2, 4, 6.4).
costo(2, 5, 5.4).
costo(2, 6, 4.4).
costo(2, 7, 3.4).
costo(2, 9, 1.4).
costo(2, 10, 1.0).

costo(3, 0, 10.8).
costo(3, 1, 9.8).
costo(3, 2, 8.8).
costo(3, 3, 7.8).
costo(3, 4, 6.8).
costo(3, 6, 4.0).
costo(3, 7, 3.0).
costo(3, 8, 2.0).
costo(3, 9, 1.0).
costo(3, 10, 0.0). % Objetivo

costo(4, 0, 11.2).
costo(4, 1, 10.2).
costo(4, 2, 9.2).
costo(4, 3, 8.2).
costo(4, 4, 7.8).
costo(4, 6, 4.4).
costo(4, 7, 3.4).
costo(4, 8, 2.4).
costo(4, 9, 1.4).
costo(4, 10, 1.0).

% Define movimiento valido y costo asociado
movimiento(X, Y, X1, Y1) :-
    (X1 is X + 1, X1 =< 4, Y1 is Y;
     X1 is X - 1, X1 >= 0, Y1 is Y;
     X1 is X, Y1 is Y + 1, Y1 =< 10;
     X1 is X, Y1 is Y - 1, Y1 >= 0;
     X1 is X + 1, X1 =< 4, Y1 is Y + 1, Y1 =< 10;
     X1 is X + 1, X1 =< 4, Y1 is Y - 1, Y1 >= 0;
     X1 is X - 1, X1 >= 0, Y1 is Y + 1, Y1 =< 10;
     X1 is X - 1, X1 >= 0, Y1 is Y - 1, Y1 >= 0),
    costo(X1, Y1, _).

% Encuentra el siguiente movimiento con el costo minimo
mejor_movimiento(X, Y, XMejor, YMejor) :-
    findall((Costo, X1, Y1), (
        movimiento(X, Y, X1, Y1),
        costo(X1, Y1, Costo),
        Costo >= 0
    ), Movimientos),
    sort(1, @=<, Movimientos, [(_, XMejor, YMejor)|_]).

% Busca el camino mas corto usando backtracking
buscar_camino(X, Y, [(X, Y)]) :-
    costo(X, Y, 0.0).  % Condición de parada: llegar al destino
buscar_camino(X, Y, [(X, Y)|Camino]) :-
    write('Visitando: '), write((X, Y)), nl,
    mejor_movimiento(X, Y, X1, Y1),
    buscar_camino(X1, Y1, Camino).

% Inicia la busqueda desde el punto (0,0)
encontrar_camino(Camino) :-
    buscar_camino(0, 0, Camino),
    write_term(Camino, [quoted(false), portray(true), max_depth(1000)]),
    nl.

% muestra el worldmap
mostrar_mapa :-
    forall(between(0, 4, X),
           (forall(between(0, 10, Y),
                   (costo(X, Y, Costo) ->
                       format('~4f ', [Costo]);
                       write('null  '))),
           nl)).

