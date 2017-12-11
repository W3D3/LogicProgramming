%
% N-queens in ASP.
%
% http://en.wikipedia.org/wiki/Eight_queens_puzzle
%
% author: Christoph Wedenig

% domain input
#const n=4.
row(1..n).
col(1..n).

n{queen(X,Y) : row(X), col(Y)}n. % there are exactly n queens who all are made of row and col

:- queen(X,Y), queen(X,Y2), Y != Y2. % no 2 different queens in the same row
:- queen(X,Y), queen(X2,Y), X != X2. % no 2 different queens in the same col

:- queen(X,Y), queen(X2,Y2), (X,Y) != (X2,Y2), X-Y == X2-Y2. % forbid 2 queens in the same right diagonal (down right \)
:- queen(X,Y), queen(X2,Y2), (X,Y) != (X2,Y2), X+Y == X2+Y2. % forbid 2 queens in the same left diagonal (down left /)

#show queen/2. %show only queens
