% double-20.dl (20 indicators, 28 sensors)
iucap(2). % interunit capacity, mit wieviel units ist unit maximal verbunden
ucap(2). % unit capacity, 2 indikatoren und 2 sensoren maximal

indicator2sensor(1,1).
indicator2sensor(1,2).
indicator2sensor(2,1).
indicator2sensor(2,3).
indicator2sensor(2,4).
indicator2sensor(3,3).
indicator2sensor(3,5).
indicator2sensor(3,6).
indicator2sensor(4,5).
indicator2sensor(4,7).
indicator2sensor(4,8).
indicator2sensor(5,7).
indicator2sensor(5,9).
indicator2sensor(5,10).
indicator2sensor(6,9).
indicator2sensor(6,11).
indicator2sensor(6,12).
indicator2sensor(7,11).
indicator2sensor(7,13).
indicator2sensor(7,14).
indicator2sensor(8,13).
indicator2sensor(8,15).
indicator2sensor(8,16).
indicator2sensor(9,15).
indicator2sensor(9,17).
indicator2sensor(9,18).
indicator2sensor(10,17).
indicator2sensor(10,19).
indicator2sensor(11,2).
indicator2sensor(11,20).
indicator2sensor(12,4).
indicator2sensor(12,20).
indicator2sensor(12,21).
indicator2sensor(13,6).
indicator2sensor(13,21).
indicator2sensor(13,22).
indicator2sensor(14,8).
indicator2sensor(14,22).
indicator2sensor(14,23).
indicator2sensor(15,10).
indicator2sensor(15,23).
indicator2sensor(15,24).
indicator2sensor(16,12).
indicator2sensor(16,24).
indicator2sensor(16,25).
indicator2sensor(17,14).
indicator2sensor(17,25).
indicator2sensor(17,26).
indicator2sensor(18,16).
indicator2sensor(18,26).
indicator2sensor(18,27).
indicator2sensor(19,18).
indicator2sensor(19,27).
indicator2sensor(19,28).
indicator2sensor(20,19).
indicator2sensor(20,28).

unit(1..14).
indicator(I), sensor(S) :- indicator2sensor(I,S).

1{sensor2unit(S, U) : unit(U)}1 :- sensor(S).
1{indicator2unit(I, U) : unit(U)}1 :- indicator(I).

% Unit caps
:- #count{ S : sensor2unit(S, U), unit(U) } > X, ucap(X).
%:- #count{ I, indicator2unit(I, U) : unit(U)} > X, ucap(X).

#show sensor2unit/2.