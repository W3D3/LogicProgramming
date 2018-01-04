% (Almost perfect? :) ) Solution by
% Bachmann Christof
% Tscheinig Andreas
% Wedenig Christoph

% important: set amount of units to MAX(count(sensor), count(indicator)) / 2.
unit(1..10).

iucap(3). % inter-unit capacity, number of connections a unit can have to other units
ucap(3). % a maximum of 2 indicators / 2 sensors can be connected to one unit

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

% generate sensors and indicators
sensor(S) :- indicator2sensor(I,S).
indicator(I) :- indicator2sensor(I,S).

% connect sensor S/indicator I with exactly one unit
%1{sensor2unit(S, U) : unit(U)}1 :- sensor(S).
%1{indicator2unit(I, U) : unit(U)}1 :- indicator(I).

sensor2unit(S, 1) | sensor2unit(S, 2) | sensor2unit(S, 3) | sensor2unit(S, 4) | sensor2unit(S, 5) | sensor2unit(S, 6) | sensor2unit(S, 7) | sensor2unit(S, 8) | sensor2unit(S, 9) | sensor2unit(S, 10) :- sensor(S).
indicator2unit(I, 1) | indicator2unit(I, 2) | indicator2unit(I, 3) | indicator2unit(I, 4) | indicator2unit(I, 5) | indicator2unit(I, 6) | indicator2unit(I, 7) | indicator2unit(I, 8) | indicator2unit(I, 9) | indicator2unit(I, 10) :- indicator(I).

% limit count of sensors/indicators per unit
:- #count{ S : sensor2unit(S, U) } > X, ucap(X), unit(U).
:- #count{ I : indicator2unit(I, U)} > X, ucap(X), unit(U).

% limit count of sensors/indicators per unit to 3
%:- sensor2unit(S1, U), sensor2unit(S2, U), sensor2unit(S3, U), sensor2unit(S4, U), S1 != S2, S1 != S3, S1 != S4, S2 != S3, S2 != S4, S3 != S4.
%:- indicator2unit(I1, U), indicator2unit(I2, U), indicator2unit(I3, U), indicator2unit(I4, U), I1 != I2, I1 != I3, I1 != I4, I2 != I3, I2 != I4, I3 != I4.

%INTERUNIT PART
% connect every unit with itself
%unit2unit(U,U) :- unit(U), unit(U).
% connect unit with all other units
%{ unit2unit(U1, U2) : unit(U1) }  :- unit(U2).

unit2unit(U,U) | unit2unit(U,U), unit2unit(U, U1) | unit2unit(U,U), unit2unit(U, U1), unit2unit(U, U2) | unit2unit(U,U), unit2unit(U, U1), unit2unit(U, U2), unit2unit(U, U3) :- unit(U),unit(U1),unit(U2),unit(U3), U != U1, U != U2, U != U3, U1 != U2, U2 != U3, U1 != U3.

% mirror unit connections
unit2unit(U1,U2) :- unit2unit(U2, U1).

% limit connected units by iucap (+1 for connection with itself)
%:- #count{ U2 : unit2unit(U, U2) } > (X + 1), iucap(X), unit(U).

% indicator2sensor only valid if sensor is on the same unit than indicator or on connected unit
valid(I, S) :- indicator2sensor(I, S), indicator2unit(I,U), unit2unit(U, U2), sensor2unit(S, U2).

% failed if there is no valid connection for indicator2sensor
:- indicator2sensor(I,S), not valid(I, S).

#show sensor2unit/2.
#show indicator2unit/2.
#show unit2unit/2.
