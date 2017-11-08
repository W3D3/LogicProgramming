node(a).
node(b).
node(c).
node(d).
node(e).
node(f).

edge(a,b).
edge(a,c).
edge(a,f).
edge(b,d).
edge(c,d).
edge(d,e).
edge(d,f).
edge(e,f).

% jede node hat eine der 3 farben
color(X, rot) | color(X, blau) | color(X, gelb)  :- node(X).

% alernative form für "jede node hat eine der 3 farben"
%color(N, rot) :- node(N), not color(N, gelb), not color(N, blau).
%color(N, gelb) :- node(N), not color(N, rot), not color(N, blau).
%color(N, blau) :- node(N), not color(N, rot), not color(N, gelb).

% verbundene nodes dürfen nicht die gleiche farbe haben
:- color(X1, C), color(X2, C), edge(X1,X2).
