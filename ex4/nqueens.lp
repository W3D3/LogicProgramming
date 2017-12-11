% domain init
#const n=4.
square(1..n,1..n).

% guessing
queen(X,Y) | not queen(X,Y) :- square(X,Y).

% TEST
:- queen(X1,Y1), queen(X1,Y2), Y1 != Y2. % no row hosts 2 queens
:- queen(X1,Y1), queen(X2,Y1), X1 != X2. % no co
:- queen(X1,Y1), queen(X2,Y2), X1 < X2, X2-X1 == |Y2-Y1|.

:- not n #count{ queen(X,Y) }.

%#show queen/2.
