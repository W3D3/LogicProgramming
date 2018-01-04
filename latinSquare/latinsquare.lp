#const n = 4.
% generate field
square(1..n,1..n).

% generate numbers
1 { num(X,Y,N) : N = 1..n } 1 :- square(X,Y).

% avoid two numbers in the same row
:- num(X,Y1,N), num(X,Y2,N), Y1 != Y2.
% avoid two numbers in the same column
:- num(X1,Y,N), num(X2,Y,N), X1 != X2.

#show num/3.
