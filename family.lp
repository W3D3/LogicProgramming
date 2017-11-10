person(homer, m; marge, w; lisa, w; bart, m; maggie, w; ape, m; selma, w; patty, w; jacqueline, w; goo_goo_gai_pan, m).

wed(homer, marge).
wed(A, B) :- wed(B, A).

parent(homer, lisa; homer, bart).
parent(marge, lisa; marge, bart).
parent(ape, homer).
parent(jacqueline, marge; jacqueline, selma; jacqueline, patty).
parent(selma, goo_goo_gai_pan; patty, goo_goo_gai_pan).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X != Y.
cousin(X, Y) :- parent(Z, X), sibling(Z, O), parent(O, Y).
uncle(X, Y) :- parent(Z, Y), sibling(X, Z), not parent(X, Y), person(X, m).
aunt(X, Y) :- parent(Z, Y), sibling(X, Z), not parent(X, Y), person(X, w).

%todo schwiegermutter
% X ist schwiegermutter von Y
schwiegermutter(X, Y) :- wed(Y, Z), parent(X, Z), person(X, w).
