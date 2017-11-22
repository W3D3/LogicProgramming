%hamilton cycle mit weight
in(X,Y) | out(X,Y) :- edge(X,Y,Z). % edge ist im graph oder nicht
edge(1,2,1). edge(1,3,2). edge(2,3,1). edge(1,4,3). %fakten
r(X) :- in(X,_). % erreicht wenn edge drin ist die bei node X anfängt
r(X) :- in(_,X).% erreicht wenn edge drin ist die bei node X aufhört
:~ in(X,Y), edge(X,Y,Z). [Z@1,X,Y] % optimizing, penalty for Z (weight of edge)
:- edge(X,_,_), not r(X). %es müssen alle nodes die mit edges verbunden sind erreicht werden
:- edge(_,X,_), not r(X). %es müssen alle nodes die mit edges verbunden sind erreicht werden (2ter teil)
