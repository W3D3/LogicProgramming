in(X,Y) | out(X,Y) :- edge(X,Y,Z).
edge(1,2,1). edge(1,3,2). edge(2,3,1). edge(1,4,3). r(X) :- in(X,_).
r(X) :- in(_,X).
:~ in(X,Y), edge(X,Y,Z). [Z@1,X,Y]
:- edge(X,_,_), not r(X).
:- edge(_,X,_), not r(X).
