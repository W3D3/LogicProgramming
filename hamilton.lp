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

ham(X, Y) | nham(X, Y) :- edge(X, Y). %ist drin oder nicht (raten)

:- ham(A, B), ham(A, C), B != C.
:- ham(A, B), ham(C, B), A != C.
:- node(X), not reached(X). %fail if not reached

reached(X) :- init(X).
reached(Y) :- reached(X), ham(X, Y).
