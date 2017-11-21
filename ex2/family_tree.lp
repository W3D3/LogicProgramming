father(X,Y) :- parent(X,Y), sex(X,male). mother(X,Y) :- parent(X,Y), sex(X,female).

brother(X,Y) :- parent(X,Y), parent(X,Z), Y!=Z, sex(X, male).

grandfather(X,Y) :- father(X,Z), parent(Z,Y).

successor(S,X) :- parent(X,S).

successor(S,X) :- parent(X,Y), successor(S,Y).

relative(X,Y) :- parent(X,Y;Y,X).

relative(X,Y) :- relative(X,Z), relative(Z,Y), X!=Y.
