bird(tux).
penguin(tux).
bird(tweety).
canary(tweety).

fly(X) :- bird(X), not not_fly(X).
not_fly(X) :- penguin(X).
