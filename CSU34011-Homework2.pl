% Question 1: 
% 1.  Write a DCG that accepts strings of the form
% u2v where u and v are strings over the alphabet{0,1}such 
% that the number of 0’s in u is twice the numberof 1’s in v. 
% For example,
% ?- s([0,1,0,1,2,0,0,1,0],L).
% L = [];
% L = [0];
% no 

s --> [2].
s--> u(Zeroes), [2], v(Ones),{Zeros is 2*Ones}.
u(0) -->[].
u(Zeroes)--> [0], u(NZ), {Zeroes is NZ+1}.
u(Zeroes) --> [1], u(Zeroes).

v(0) --> [].
v(Ones) --> [1], v(NO), {Ones is NO+1}.
v(Ones) --> [0], v(Ones).

% Question 2
%   Exercise 6.6 in Learn Prolog Now describes a street with(∗)  
%   three neighbouring houses that all have a different colour, 
%   namely red,blue,  and  green.   People  of  different  nationalities  
%   live  in  the  differenthouses and they all have a different pet.
%   Leaving out all the other constraints mentioned in that exercise, 
%   write a DCGthat outputs strings
%   [Col1,Nat1,Pet1, Col2,Nat2,Pet2, Col3,Nat3,Pet3]satisyfing (∗),
%    where the nationalities are english, spanish, japanese and the pets are 
%    jaguar, snail, zebra.  
%    For example,| 
%    ?- s([red,english,snail, blue,japanese,jaguar, green,spanish,Z],[]).
%    Z = zebra;
%    no

s--> house(Col1,Nat1,Pet1),house(Col2,Nat2,Pet2),house(Col3,Nat3,Pet3),
    {Col1 \== Col2, Col2 \==Col3, Col1\==Col3,
      Nat1\==Nat2, Nat1\==Nat3, Nat2\==Nat3,
      Pet1\==Pet2, Pet2\==Pet3, Pet1\==Pet3}.
    
    
house(Col,Nat,Pet)--> col(Col), nat(Nat), pet( Pet).
col('red') --> [red].
col('blue')--> [blue].
col('green')-->[green].

nat('english') --> [english].
nat('spanish')-->[spanish].
nat('japanese')-->[japanese].

pet('jaguar')-->[jaguar].
pet('snail')-->[snail].
pet('zebra')-->[zebra].

%Question 3
% Write a DCG that given a non-negative integerSum, accepts lists of 
% integers≥1 that add up to Sum. 
%  For example,| ?- s(3,L,[]).
%  L = [3];
%  L = [2,1];
%  L = [1,2];
%  L = [1,1,1];
%  no
%  It may be useful to write a predicate
%  mkList(+Num,?List)that returns a list
%  Listof integers fromNum down to 1. 
%   For example,| 
%   ?- mkList(3,L).
%   L = [3,2,1];
%   no

mkList(0,[]).
mkList(H, [H|T]) :- H>0, NH is H-1, mkList(NH,T).

s(0) --> [].
s(N) --> {mkList(N, List),member(Item,List), NN is N-Item}, 
    [Item], s(NN).
