/*En un estanque hay siete piedras que sobresalen del
agua. Hay tres ranas verdes subidas, cada una, sobre las tres
piedras del extremo izquierdo y tres ranas cafes subidas sobre las
tres piedras del extremo derecho.
Si cada piedra solo puede ser ocupada por una
rana a la vez, ¿cómo deben hacer las seis las ranas para trasladarse, las verdes
hacia la derecha y las café hacia ala izquierda?*/

/*Restricciones:

* Cada rana puede avanzar dando un salto sencillo o un salto doble.
El salto sencillo consiste en saltar hacia la piedra que
tiene adelante, si está vacía. El salto doble consiste en saltar hacia la segunda piedra
que tiene adelante, si está vacía.

* Las ranas verdes solo pueden avanzar hacia la derecha sin retroceder
* Las ranas cafes solo pueden avanzar a la izquierda sin retroceder.

* Cualquier rana puede avanzar a la siguiente piedra si esta desocupada o
saltar sobre otra rana si la segunda piedra adelante de su posicion esta desocupada.

% v representa una rana de color verde.
% c representa una rana de color cafe.
% d representa la piedra disponible.

*/

juego_ranas(Estado_Inicial):-
	Estado_Inicial = [v,v,v,d,c,c,c],
	juego_ranas1(Estado_Inicial, [Estado_Inicial]).

juego_ranas1([c,c,c,d,v,v,v], Estados_Juego):-
	write('FIN DEL JUEGO. Las ranas llegaron a su destino.'), nl,
	write(Estados_Juego),nl,nl.

juego_ranas1(Estado_Actual, Estados_Juego):-
	buscar_piedra_desocupada(Estado_Actual, Estados_Juego).

buscar_piedra_desocupada(Estado_Actual, Estados_Juego):-
	mover_rana_verde(Estado_Actual, Nuevo_Estado),
	guardar_Estado(Estados_Juego, Estados_Juego2, Nuevo_Estado),
	juego_ranas1(Nuevo_Estado, Estados_Juego2).

buscar_piedra_desocupada(Estado_Actual, Estados_Juego):-
	mover_rana_cafe(Estado_Actual, Nuevo_Estado),
	guardar_Estado(Estados_Juego, Estados_Juego2, Nuevo_Estado),
	juego_ranas1(Nuevo_Estado, Estados_Juego2).

guardar_Estado(Estados_Juego, Estados_Juego2, Nuevo_Estado):-
	revisar(Estados_Juego, Nuevo_Estado),
	=(Estados_Juego2, [Nuevo_Estado|Estados_Juego]).

revisar([], _).
revisar([EstadoAnt|EstadosAnt], Nuevo_Estado):-
	Nuevo_Estado \== EstadoAnt,
	revisar(EstadosAnt, Nuevo_Estado).

%Las ranas verdes pueden saltar hacia la siguiente piedra de
%la derecha, segun las siguientes posibilidades:
mover_rana_verde([v,d,A,B,C,D,E], [d,v,A,B,C,D,E]).
mover_rana_verde([A,v,d,B,C,D,E], [A,d,v,B,C,D,E]).
mover_rana_verde([A,B,v,d,C,D,E], [A,B,d,v,C,D,E]).
mover_rana_verde([A,B,C,v,d,D,E], [A,B,C,d,v,D,E]).
mover_rana_verde([A,B,C,D,v,d,E], [A,B,C,D,d,v,E]).
mover_rana_verde([A,B,C,D,E,v,d], [A,B,C,D,E,d,v]).

%Las ranas verdes pueden saltar dos posiciones a la derecha,
%segun las siguientes posibilidades:
mover_rana_verde([v,A,d,B,C,D,E], [d,A,v,B,C,D,E]).
mover_rana_verde([A,v,B,d,C,D,E], [A,d,B,v,C,D,E]).
mover_rana_verde([A,B,v,C,d,D,E], [A,B,d,C,v,D,E]).
mover_rana_verde([A,B,C,v,D,d,E], [A,B,C,d,D,v,E]).
mover_rana_verde([A,B,C,D,v,E,d], [A,B,C,D,d,E,v]).

%Las ranas cafe pueden saltar hacia la siguiente piedra de
%la izquierda, segun las siguientes posibilidades:
mover_rana_cafe([A,B,C,D,E,d,c], [A,B,C,D,E,c,d]).
mover_rana_cafe([A,B,C,D,d,c,E], [A,B,C,D,c,d,E]).
mover_rana_cafe([A,B,C,d,c,D,E], [A,B,C,c,d,D,E]).
mover_rana_cafe([A,B,d,c,C,D,E], [A,B,c,d,C,D,E]).
mover_rana_cafe([A,d,c,B,C,D,E], [A,c,d,B,C,D,E]).
mover_rana_cafe([d,c,A,B,C,D,E], [c,d,A,B,C,D,E]).

%Las ranas cafe pueden saltar dos posiciones a la izquierda,
%segun las siguientes posibilidades:
mover_rana_cafe([A,B,C,D,d,E,c], [A,B,C,D,c,E,d]).
mover_rana_cafe([A,B,C,d,D,c,E], [A,B,C,c,D,d,E]).
mover_rana_cafe([A,B,d,C,c,D,E], [A,B,c,C,d,D,E]).
mover_rana_cafe([A,d,B,c,C,D,E], [A,c,B,d,C,D,E]).
mover_rana_cafe([d,A,c,B,C,D,E], [c,A,d,B,C,D,E]).
