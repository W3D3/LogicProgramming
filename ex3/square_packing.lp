% 1  2  3  4
% 5  6  7  8
% 9 10 11 12
%13 14 15 16

r(2).

row(1..L) :- r(L). % generate R parts
%square(1..L) :- s(L). % generate S parts
%tetris(1..L) :- t(L). % generate T parts
%lpart(1..L) :- l(L). % generate L parts

nottaken(1..16). %create 16 empty cells

% every product must be in exactly 1 package
%1{piece(Y) : row(X)}1.
%piece(1) | piece(2) | piece(3) | piece(4) :- row(_).
%:- piece(X), piece(Y), X != Y. %cant have more than 1 piece at the same place
%not nottaken(X) :- cell(X).

cell(1..4) :- row(_), nottaken(1..4).
cell(5..8) :- row(_), nottaken(5..8).
cell(9..12) :- row(_), nottaken(9..12).
cell(13..16) :- row(_), nottaken(13..16).
%cell(5..8,1)  :- piece(2).
%cell(9..12,1)  :- piece(3).
%cell(13..16,1) :- piece(4).

%:- coord(X,Y,Z), X > 0, X < 5, Y > 0, Y < 5, Z == 0.
:- not cell(1).
:- not cell(5).
%#show cell/1.
