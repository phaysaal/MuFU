%HES

G x =v x<=0 \/ DDivsix x \/ Even x.
Even x =μ   x=0 \/ (x>0 /\ Odd (x-1)).
Odd x =μ  Even (x-1).
DDivsix x =v x<>0 /\ DDivsix (x+6) /\ DDivsix (x-6).

/*
Div6 x -> Even x

Nat x -> Int x

(x>=0 \/ DDivsix (x+6)) /\ 
*/