#include "task4.input.lp".

% computer has exactly 1 motherboard
1{hasMB(C,M) : motherboard(M)}1 :- computer(C).
% motherboard has as many CPUs as specified by it's socket
N{hasCPU(M,CP) : cpu(CP), compatible(M,CP)}N :- motherboard(M), socket(M,N).

% check if every pc has a motherboard
:- hasMB(C1,M), hasMB(C2,M), C1!=C2.
% and every motherboard has a CPU attached
:- hasCPU(M1,CP), hasCPU(M2,CP), M1!=M2.

#show hasMB/2.
#show hasCPU/2.
