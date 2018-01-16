#include "task6.input.lp".
% This program implements a procedural−like approach to finding of connectedcomponents.
% compute transitive closure
edge(X,Z) :- edge(X,Y), edge(Y,Z).
% find the starting nodes of every component
% select the lexicographically first node and set it as a starting node of the first

start(1,S) :- #min{N: node(N)} = S.
% find all nodes for which there is no edge connecting it to any of existing start nodes.
next(P,N) :- start(I,P), node(N), P<N, not edge(P,N), not
edge(M,N) : start(I1,M), I1<=I.
% the next component starts with the lexicographically smallest next node
start(I+1,N) :- start(I,P), N=#min{V : next(P,V)}, N > P.%, N!=#sup.
% generate components according to start nodes
% component(I,N) :- start(I,N).
% component(I,N) :- component(I,N1), edge(N1,N).
#show next/2.
%#show component/2.
