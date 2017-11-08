% A suite of wine bottles and their kinds
wineBottle("a").
wineBottle("b").
wineBottle("c").
wineBottle("d").
wineBottle("e").
isA("a","whiteWine").  isA("a","sweetWine").
isA("b","whiteWine").  isA("b","dryWine").
isA("c","whiteWine").  isA("c","dryWine").
isA("d","redWine").    isA("d","dryWine").
isA("e","redWine").
isA("e","sweetWine").
% Persons and their preferences
person("axel").
person("gibbi").
person("roman").
preferredWine("axel","whiteWine").
preferredWine("gibbi","redWine").
preferredWine("roman","dryWine").
% Available bottles a person likes
compliantBottle(X,Z) :- preferredWine(X,Y), isA(Z,Y).
