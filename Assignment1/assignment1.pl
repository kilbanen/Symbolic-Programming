pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 1

incr(null,f1(null)). 
incr(X,Y) :- X = f0(Z), Y = f1(Z), pterm(Z).
incr(X,Y) :- X = f1(W), Y = f0(Z), incr(W,Z), pterm(Z), pterm(W).

% Problem 2

legal(f0(null)).
legal(P) :- legal(X), incr(X,P).

incrR(X,Y) :- legal(X), incr(X,Y).

% Problem 3

add(f0(null),P,P).
 add(P1,P2,P3) :- incr(P0,P1), incr(P2,P2succ), add(P0,P2succ,P3).

% add(f1(null),f1(null),f0(f1(null)))
% add(P1,P2,P3) :- P1 = f0(X), P2 = f0(Y), add(X,Y,Z), P3 = f0(f1(Z)).

% Problem 4

mult(f0(null),P,f0(null)).
mult(P1,P2,P3) :- incr(X,P1), mult(X,P2,Y), add(P2,Y,P3).

% Problem 5

revcon(null,X,X).
revcon(X,Y,Z) :- X = f0(W), revcon(W,f0(Y),Z).
revcon(X,Y,Z) :- X = f1(W), revcon(W,f1(Y),Z).

revers(P,RevP) :- revcon(P,null,RevP).

% Problem 6

normalize(null,f0(null)).
normalize(P,Pn) :- revers(P,RevP), RevP = f1(X), P = Pn.
normalize(P,Pn) :- revers(P,RevP), RevP = f0(X), revers(X,Y), normalize(Y,Pn).

% Tests

% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).

% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).

% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).

% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).

% make a pterm T from a number N numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).

% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.

% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).
