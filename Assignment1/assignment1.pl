pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 1

incr(null,f1(null)). 
incr(X,Y) :- X = f1(W), Y = f0(Z), incr(W,Z), pterm(Z), pterm(W).
incr(X,Y) :- X = f0(Z), Y = f1(Z), pterm(Z).

% Problem 2

legal(f0(null)).
legal(P) :- incr(X,P), legal(X).

incrR(X,Y) :- incr(X,Y), legal(X).

% Problem 3

add(f0(null),P,P).
add(P1,P2,P3) :- incrR(P0,P1), incrR(P2,P2succ), add(P0,P2succ,P3).

% Problem 4

mult(f1(null),P,P).
mult(f0(null),P,f0(null)).
mult(P1,P2,P3) :- incrR(X,P1), mult(X,P2,Y), add(P2,Y,P3).
