project(a). project(b). project(c).
person(p1). person(p2). person(p3).
person(p4). person(p5). person(p6).
knows(p1,p2). knows(p3,p2).
knows(p5,p6). knows(p4,p6).

knows(X,Y) :- knows(Y,X).

-member(X,Y) | member(X,Y) :- person(X), project(Y).
