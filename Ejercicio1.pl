% Angel, Boris, Cesar y Diego salieron a tomarse un trago y se
% sentaron en la barra de un restaurante.

% Angel se sento un puesto a la derecha del que bebio tequila.
% Los que bebieron vino y cerveza no se sentaron a la par.
% El que bebio champaña estaba en uno de los extremos de la barra.
% Diego y quien bebio vino se sentaron en asientos contiguos.
% Cesar se sento inmediatamente a la derecha de Angel.
% Boris no bebio cerveza.

% Indique las ubicaciones en que se sentaron los cuatro amigos y
% las bebidas que tomo cada uno.

%      Bebida1   Bebida2   Bebida3   Bebida4
%      --------------------------------------
%      --------------------------------------
%      Amigo1    Amigo2    Amigo3    Amigo4

que_bebieron(Barra):-
	=(Barra, [[_, _, _], [_, _, _],[_, _, _],[_, _, _]]),

	puesto([PosAngel, angel, _], Barra),
	puesto([PosTequila, _, tequila], Barra),
	succ(PosTequila, PosAngel),

	puesto([PosVino, _, vino], Barra),
	puesto([PosCerveza, _, cerveza], Barra),
	(not(succ(PosCerveza, PosVino)) , not(succ(PosVino, PosCerveza))),

	(puesto([1, _, champana], Barra); puesto([4, _, champana], Barra)),

	puesto([PosDiego, diego, _], Barra),
	(succ(PosVino, PosDiego) ; succ(PosDiego, PosVino)),

	puesto([PosCesar, cesar, _], Barra),
	succ(PosAngel, PosCesar),

	puesto([PosBoris, boris, _], Barra),
	=\=(PosBoris, PosCerveza),!.

puesto([1, A, B], [[1, A, B], [_, _, _],[_, _, _],[_, _, _]]).
puesto([2, A, B], [[_, _, _], [2, A, B],[_, _, _],[_, _, _]]).
puesto([3, A, B], [[_, _, _], [_, _, _],[3, A, B],[_, _, _]]).
puesto([4, A, B], [[_, _, _], [_, _, _],[_, _, _],[4, A, B]]).
