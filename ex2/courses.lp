course(llp).
course(ke).
course(algoDat).

% ∀X(course(X) ∨ seminar(X) → exam(X))

exam(X) :- course(X).
exam(X) :- seminar(X).

% ∀X(student(X) → [∃Y course(Y ) ∧ visits(X, Y )])

visits(X,llp) | visits(X,ke)| visits(X,algoDat) :- student(X).
