#include "task5.input.lp".
%(a) Project teams should consist only of people who know each other
%    either directly or indirectly (via a friend).

% we know also the friends of our friends
knows(X,Z) :- knows(X,Y), knows(Y,Z), X!=Z.
% member of the same team have to know each other
:- not knows(X,Y), member(X,P), member (Y,P), X!=Y.

% (b) The team of project b should not contain team members of project c.
:- member(P, b), member(P, c).

% (c) Each project team should contain at least 1 member. (do not use aggregates)

:- not member(P, X), project(X).

% (d) At least 3 persons are required for the project b.

:- #count{ P : member(P, b) } < 3 .

% (e) Projects b and a should share at least 2 members.

:- #count{ P : member(P, b), member(P, a) } < 2 .
