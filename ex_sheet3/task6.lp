#include "task6.input.lp".

edge(X,Z) :- edge(X,Y), edge(Y,Z).

% component/2

start(1,S) :- #min{N: node(N)} = S.

%start(C+1, N) :- start(C, U), not edge(N, U).

next(P,N) :- start(I,P), node(N), P < N, not edge(P,N),
             not edge(M,N) : start(I1,M), I1 <= I.

start(I+1,N) :- start(I,P), N=#min{V : next(P,V)}, N > P, N != #sup.

component(C, N) :- start(C, N).
component(C, X) :- component(C, N), edge(N, X).



#show component/2.
