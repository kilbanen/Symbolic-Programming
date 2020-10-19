pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 1

incr(null, X) :- X = f1(null).
incr(X,Y) :- X = f1(W), Y = f0(Z), incr(W,Z), pterm(Z), pterm(W).
incr(X,Y) :- X = f0(Z), Y = f1(Z), pterm(Z).

% Problem 2

legal(f0(null)).
legal(P) :- legal(X), incr(X,P).

incrR(X,Y) :- legal(X), incr(X,Y).
