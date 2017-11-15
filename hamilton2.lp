% example for hamilton path
% https://puu.sh/ymunA/6bbd5b4d0d.png
% author: wedenigc

node(a).
node(b).
node(c).
node(d).
node(e).

edge(a, b).
edge(b, e).
edge(b, c).
edge(b, d).
edge(c, d).
edge(d, e).

init(A) | not init(A) :- node(A).
:- init(A), init(B), A != B .% es darf nur 1 startknoten geben

edge(X, Y) :- edge(Y, X). %ungerichteter graph
ham(X, Y) | not ham(X, Y) :- edge(X, Y). %ist drin oder nicht (raten)

:- ham(A, B), ham(A, C), B != C. % beide Edges können nicht im Hamilton graph sein wenn sie an der selben node starten und an 2 orte gehen
:- ham(A, B), ham(C, B), A != C. % das gleiche, nur am ende
:- node(X), not reached(X). % fail if node not reached
%:- init(Y), ham(X, Y).

reached(X) :- init(X).
reached(Y) :- reached(X), ham(X, Y).

#show ham/2.
#show init/1.
