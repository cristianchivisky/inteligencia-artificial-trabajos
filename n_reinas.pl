% 1 . Generar un tablero de dimension n.
% 2. Generar una permutacion sobre ese tablero.
% 3. Comprobar si ese tablero cumple la condicion de que todas las reinas colocadas no se amenacen entre si.

nreinas(N,Sol):- generarTablero(N,Tablero),
permutar(Tablero,Sol),
buenTablero(Sol).

% genera un tablero de la forma [N,N-1,N-2,….,1].
generarTablero(0,[]).
generarTablero(X,[X|R]):-
XMenos1 is X - 1,
XMenos1 >= 0,
generarTablero(XMenos1,R).

% verifica que LY=[X|Z] que sea permutación de X: comparando cada
% elemento con la cabera de alguna permutacion de la cola
% Entrega cada permutación de X
permutar([],[]).
permutar(X,[C|Z]) :- seleccionar(X,C,R), permutar(R,Z).

% selecciona sucesivamente el primer valor X de la lista L=[X|R]
seleccionar([X|R],X,R).
seleccionar([C|R],X,[C|Y]) :- seleccionar(R,X,Y).

% buenTablero(+X). se verifica si en el tablero X, ninguna reina amenaza a otra.
% NOTA 1: amenazar = ser amenazado
% NOTA 2: posicion V[i] = fila, i=columna
% verifica la cabeza y luego recursivamente el resto
buenTablero([]).
buenTablero([C|R]):- not(amenaza(C,R)),
buenTablero(R).

% amenaza(X,Prof,L)
% verifica que la reina en fila X en columna n amenaza alguna de las
% que están en las columnas 0..n-1, listadas en Y
%
% -igual fila: entre X y algun elemento en L (x=L[j])
% -igual columna: imposible porque sería estar esa posicion n ocupada
% -igual diagonal: prueba C, C+diag, C-diag por cada elemento existente
amenaza(X,Prof,[C|_]):- X is C+Prof;
X is C-Prof;
X = C.
amenaza(X,Prof,[_|R]):- ProfMas1 is Prof + 1,
amenaza(X,ProfMas1,R).
amenaza(_,[]):- fail.
amenaza(X,Y):- amenaza(X,1,Y).

% Ejemplo de uso:
% nreinas(8, Sol).
