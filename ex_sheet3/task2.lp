#include "task2.input.lp".

%(a) the number of a house with minimum number of residents on a street
minHouseStreet(S,N) :- #min{C : house(_,_,C)}=X,house(S,N,X).

%(b) total number of residents taken part in the census
residents(S) :- #sum{Z : house(_,_,Z)} = S.

%(c) total number of houses with less than 30 residents on a street
under30residents(S,N) :- #count{Z : house(S,_,Z), Z < 30} = N, street(S).

%(d) number of residents of all houses located on one street
streetResidents(S,X) :- #sum{N : house(S,_,N)} = X, street(S).
