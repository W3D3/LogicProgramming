% ham(A, B)
% nham(A, B)
% kante ist drin oder nicht drin

% https://web.stanford.edu/class/cs227/Lectures/lec11.pdf

node(a).
node(b).
node(c).
%node(d).

edge(a, b).
edge(b, c).

init(a).

edge(X, Y) :- edge(Y, X).
ham(X, Y) | not ham(X, Y) :- edge(X, Y). %ist drin oder nicht (raten)

:- ham(A, B), ham(A, C), B != C. % beide Edges können nicht im Hamilton graph sein wenn sie an der selben node starten und an 2 orte gehen
:- ham(A, B), ham(C, B), A != C. % das gleiche, nur am ende
:- node(X), not reached(X). %fail if node not reached

reached(X) :- init(X).
reached(Y) :- reached(X), ham(X, Y).
