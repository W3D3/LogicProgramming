package(1..5).
product(matches; gas; fireworks; iron; magnet; vase; cominer).

not_together(matches, fireworks; matches, gas).
not_together(iron, vase).
not_together(iron, cominer).
not_together(cominer, magnet).

% every product must be in exactly 1 package
1{in(Pr,Pkg) : package(Pkg)}1 :- product(Pr).

% cannot be not allowed
:- in(Pr1,Pkg), in(Pr2,Pkg), not_together(Pr1, Pr2).

% there cannot exist a package that is filled when the previous is empty
% means we will fill starting from package 1
:- in(_,Pkg), Pkg>1, not in(_,Pkg-1).

% optimizing: minimal num of packages
:~ in(_,Pkg). [1@1,Pkg]
