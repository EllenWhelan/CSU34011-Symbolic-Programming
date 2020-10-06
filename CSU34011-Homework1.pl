/*given facts and rules*/ 
numeral(0). /*base*/
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X). /*ex2*/
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(X-Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).
add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).


/*Question 1 and bits of 2*/
add2(s(X),p(Y),Z) :- add2(X,Y,Z).
add2(p(X),s(Y),Z) :- add2(X,Y,Z).
add2(M,N+P,Q) :- add(N,P,A),add2(M,A,Q).
add2(M+N,P,Q) :- add(M,N,A),add2(A,P,Q). 
add2(M+N,P+Q,R) :- add(M,N,A),add(P,Q,B),add2(A,B,R).


/*question2*/

add2(s(X+Y),Z,s(Q)) :- add2(X+Y,Z,Q).
add2(X,s(Y+Z),s(Q)) :- add2(X,Y+Z,Q).
add2(s(p(X)),Y,Z) :- add2(X,Y,Z).
add2(X,s(p(Y)),Z) :- add2(X,Y,Z).
add2(s(X+Y),s(M+N),s(s(P))) :- add2(X+Y,M+N,P).
add2(p(s(X)),Y,Z) :- add2(X,Y,Z).
add2(X, p(s(Y)),Z) :- add2(X,Y,Z).


/*questoin4 revisiosn*/
add2(X, Y, Z) :- add(X, Y, Z).
add2(X-Z,Y,M) :- subtract(X,Z,A),add2(A,Y,M).
add2(X,Y-Z,M) :- subtract(Y,Z,A),add2(X,A,M).
add2(X-Y,P-Q,M) :- subtract(X,Y,A),subtract(P,Q,B),add2(A,B,M).

add2(-X,Y,Z) :- add2(P,Y,Z),minus(X,P).
add2(X,-Y,Z) :- add2(X,A,Z), minus(Y,A).

/*question3*/
minus(0,0). /*base*/
minus(s(p(X)),Y) :- minus(X,Y).
minus(s(X),p(Y)) :- minus(X,Y).
minus(p(s(X)),Y) :- minus(X,Y).
minus(p(X),s(Y)) :- minus(X,Y).

/*question 5 and 6*/
subtract(-X,Y,Z) :- minus(X,P),subtract(P,Y,Z).
subtract(X,Y,Z)  :- minus(Y,P),add2(Y,P,Z). /*broke come back fix thsi*/


