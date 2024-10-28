persona('terach', 'h').
persona('abraham', 'h').
persona('nachor', 'h').
persona('haran', 'h').
persona('isaac', 'h').
persona('lot', 'h').
persona('sarah', 'm').
persona('milcah', 'm').
persona('yiscah', 'm').

es_mujer(Nombre) :- persona(Nombre, X), X == 'm'.
es_hombre(Nombre) :- persona(Nombre, X), X == 'h'.

es_padre('terach', 'abraham').
es_padre ('terach', 'nachor').
es_padre ('terach', 'haran').
es_padre ('abrahan', 'isaac')
es_padre ('haran', 'lot').
es_padre ('haran', 'milcah').
es_padre ('haran', 'yiscah').
es_padre('sarah', 'isaac').

es_hijo(Nombre1,Nombre2):-es_padre(Nombre2,Nombre1),es_hombre(Nombre1).

es_hija(Nombre1,Nombre2):- es_padre(Nombre2,Nombre1),es_mujer(Nombre1).


% Ejemplos de uso:
% es_mujer(‘sarah’).
% es_padre(haran, lot), es_hombre(lot).
% es_padre(abraham,lot), es_hombre(lot).
% es_padre(abraham,X), es_hombre(c)
% es_padre(haran, X), es_mujer(X).
% es_hijo(lot, haran).
% es_hija(X, haran).
