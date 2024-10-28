% Definir la distancia entre ciudades
distancia(colon, ubajay, 56).
distancia(colon, villaguay, 110).
distancia(colon, rosario_del_tala, 118).
distancia(colon, villa_elisa, 32).
distancia(colon, nogoya, 186).
distancia(colon, la_paz, 278).
distancia(colon, victoria, 233).

distancia(ubajay, villaguay, 95).
distancia(ubajay, rosario_del_tala, 160).
distancia(ubajay, villa_elisa, 62).
distancia(ubajay, nogoya, 226).
distancia(ubajay, la_paz, 249).
distancia(ubajay, victoria, 271).

distancia(villaguay, rosario_del_tala, 103).
distancia(villaguay, villa_elisa, 71).
distancia(villaguay, nogoya, 134).
distancia(villaguay, la_paz, 168).
distancia(villaguay, victoria, 177).

distancia(rosario_del_tala, villa_elisa, 102).
distancia(rosario_del_tala, nogoya, 69).
distancia(rosario_del_tala, la_paz, 229).
distancia(rosario_del_tala, victoria, 111).

distancia(villa_elisa, nogoya, 208).
distancia(villa_elisa, la_paz, 232).
distancia(villa_elisa, victoria, 252).

distancia(nogoya, la_paz, 251).
distancia(nogoya, victoria, 47).

distancia(la_paz, victoria, 295).

% Como las distancias son simetricas, agrega las distancias inversas
distancia(X, Y, D) :- distancia(Y, X, D).

% Calcula la distancia de una ruta dada, incluyendo el viaje desde y hacia Colón
distancia_ruta([Primera | Resto], DistanciaTotal) :-
    % Distancia desde Colón a la primera ciudad
    distancia(colon, Primera, DistanciaInicio),
    % Distancia desde la última ciudad de la ruta a Colón
    last(Resto, Ultima),
    distancia(Ultima, colon, DistanciaFin),
    % Calcular la distancia del resto de la ruta
    distancia_ruta_aux([Primera | Resto], DistanciaResto),
    % Sumar todas las distancias
    DistanciaTotal is DistanciaInicio + DistanciaResto + DistanciaFin.

% Calcula la distancia de la ruta excluyendo el viaje desde y hacia Colón
distancia_ruta_aux([_], 0).
distancia_ruta_aux([Ciudad1, Ciudad2 | Resto], Distancia) :-
    distancia(Ciudad1, Ciudad2, D),
    distancia_ruta_aux([Ciudad2 | Resto], DistanciaResto),
    Distancia is D + DistanciaResto.


% Encuentra todas las permutaciones de las ciudades
permutacion([], []).
permutacion(Lista, [Cabeza | Perm]) :-
    select(Cabeza, Lista, Resto),
    permutacion(Resto, Perm).

% Encuentra la ruta mas corta comenzando y terminando en Colon
ruta_mas_corta(Ruta, DistanciaMinima) :-
    findall(R, (permutacion([ubajay, villaguay, rosario_del_tala, villa_elisa, nogoya, la_paz, victoria], R), append([colon], R, RutaTemp), append(RutaTemp, [colon], Ruta)), Rutas),
    maplist(distancia_ruta, Rutas, Distancias),
    min_list(Distancias, DistanciaMinima),
    nth1(Indice, Distancias, DistanciaMinima),
    nth1(Indice, Rutas, Ruta). 



% Uso: ruta_mas_corta(Ruta, DistanciaMinima). 
