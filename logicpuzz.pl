% This will solve the logic puzzle.

%solution( X ) ;-
%	X = [[wanda, mitch, NotRoses],[NotWendy, matthew, gladioli],[wynne, NotMark, lilies],[girl4, boy4, flower4]],
	

flower(asters).
flower(gladioli).
flower(lilies).
flower(roses).
boy(matthew).
boy(mark).
boy(mike).
boy(mitch).
girl(wanda).
girl(wendy).
girl(willow).
girl(wynne).

solution( X ) :-
	X = [ A, B, C, M ],
	X = [ [wanda,_,_], [willow,_,_], [wendy,_,_], [wynne,_,_] ],
	one_set( A ),
	one_set( B ),
	one_set( C ),
	one_set( M ),
	member( Constrained1, X ),
	constraint1( Constrained1 ),
	member( Constrained2, X ),
	constraint2( Constrained2 ),
	member( Constrained3, X ),
	constraint3( Constrained3 ),
	all_Nth_members( X, 2, Boys),
	permutation( Boys, [matthew, mark, mike, mitch] ),
	all_Nth_members( X, 3, Flowers),
	permutation( Flowers, [asters, gladioli, lilies, roses] ).


all_Nth_members( [], _, [] ).
all_Nth_members( [H|Rest], N, [This|RestFiltered] ) :-
        nth1( N, H, This ),
        all_Nth_members( Rest, N, RestFiltered ).

constraint1( [A, B, C] ) :-
	one_set( [A, B, C] ),
	A = wanda,
	B = mitch,
	C \= roses.

constraint2( [A, B, C] ) :-
	one_set( [A, B, C] ),
	A \= wendy,
	B = matthew,
	C = gladioli.

constraint3( [A, B, C] ) :-
	one_set( [A, B, C] ),
	A = wynne,
	B \= mark,
	C = lilies.

%constraint4( [A, B, _, _, _] ) :-
%	one_set( [A, B, _, _, _] ),
%	A = wanda,
%	B = bob.


one_set( [A, B, C] ) :-
	girl(A),
	boy(B),
	flower(C).


/*

solution( [

% all_nth_members( [[a,b,c],[d,e,f],[g,h,i]], 2, X ).
% X = [b,e,h].

all_Nth_members( [], _, [] ).
all_Nth_members( [H|Rest], N, [This|RestFiltered] ) :-
        nth1( N, H, This ),
        all_Nth_members( Rest, N, RestFiltered ).

construct_solution( List1, List2, List3, List4 ) :-
	List1 = one_set( [wanda, mitch, C1 ] ),
	flower(C1),
	C1 \= roses,
	List2 = one_set( [wendy, boy(B2), flower(C2)] ),
	List3 = one_set( [willow, boy(B3), flower(C3)] ),
	List4 = one_set( [wynne, B4, lilies] ),
	boy(B4),
	B4 \= mark.


solution([ wanda, mitch, Y ], [wendy, A2, B2], [willow, A3, B3], [wynne, Z, lilies]) :-
	[ X, matthew, gladioli ],
	X \= wendy,
	Y \= roses,
	Z \= mark,
	flowers(B2),
	flowers(B3),
	boy(A2),
	boy(A3).
*/