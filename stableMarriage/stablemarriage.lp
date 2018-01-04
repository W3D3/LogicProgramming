% assuming everyone assigns scores
woman(W) :- womanAssignsScore(W,_,_).
man(M) :- manAssignsScore(M,_,_).

% GUESSING PART
% there is a match for every man, where he matches with a woman
1 { match(M, W) : woman(W) } 1 :- man(M).

% PRUNING WRONG SOLUTIONS
% every man/woman can only be in one match
:- match(M, W), match(M, W2), W2 != W.
:- match(M, W), match(M2, W), M != M2.

% stable property
:- match(M, W), match(M2, W2), manAssignsScore(M, W, MSCORE), manAssignsScore(M, W2, MSCORE_NEW), womanAssignsScore(W2, M, WSCORE_NEW), womanAssignsScore(W2, M2, WSCORE), WSCORE_NEW > WSCORE, MSCORE_NEW > MSCORE, M <> M2, W <> W2.

#show match/2.
