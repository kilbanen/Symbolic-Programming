%Question 1
s --> [2].
s --> [0],s,[0].
s --> [1],s,[1].

%Question 2
nbd --> h(Col1,Nat1,Pet1),h(Col2,Nat2,Pet2),h(Col3,Nat3,Pet3), {Col1 \= Col2, Col1 \= Col3, Col2 \= Col3, Nat1 \= Nat2, Nat1 \= Nat3, Nat2 \= Nat3, Pet1 \= Pet2, Pet1 \= Pet3, Pet2 \= Pet3}.

h(Col,Nat,Pet) --> [h(Col,Nat,Pet)], {col(Col), nat(Nat), pet(Pet)}.

col(red).
col(blue).
col(green).
nat(english).
nat(spanish).
nat(japanese).
pet(jaguar).
pet(snail).
pet(zebra).

%Question 3
q0 --> [0],q0.
q0 --> [1],q0.
q0 --> [1],q1.
q1 --> [0],q2.
q1 --> [1],q2.
q2 --> [0],q3.
q2 --> [1],q3.
q3 --> [].

l3(String, Numeral) :- len(String, Numeral), q0(String, []).

len([],0).
len([H|T], succ(X)) :- len(T,X).

numeral(0).
numeral(succ(X)) :- numeral(X).
