% This will solve the logic puzzle.
	

first(charlotte).
first(deandre).
first(rodney).
first(samuel).
first(sierra).

last(chase).
last(huber).
last(larson).
last(summers).
last(velez).

cookie(almond).
cookie(black_and_white).
cookie(chocolate_chip).
cookie(gingerbread).
cookie(oatmeal_raisin).

time(179).
time(185).
time(188).
time(194).
time(199).

solution( X ) :-
	X = [ A, B, C, D, M ],
	X = [ [charlotte,_,_,_], [deandre,_,_,_], [rodney,_,_,_], [samuel,_,_,_], [sierra,_,_,_] ],
	one_set( A ),
	one_set( B ),
	one_set( C ),
	one_set( D ),
	one_set( M ),
	member( Constrained1, X ),
	constraint1( Constrained1 ),
	member( Constrained2, X ),
	constraint2( Constrained2 ),
	member( Constrained3, X ),
	constraint3( Constrained3 ),
	all_Nth_members( X, 2, Last),
	permutation( Last, [ chase, huber, larson, summers, velez ] ),
	all_Nth_members( X, 3, Cookies),
	permutation( Cookies, [ almond, black_and_white, chocolate_chip, gingerbread, oatmeal_raisin ] ),
	all_Nth_members( X, 4, Time),
	permutation( Time, [ 179, 185, 188, 194, 199 ] ).


all_Nth_members( [], _, [] ).
all_Nth_members( [H|Rest], N, [This|RestFiltered] ) :-
        nth1( N, H, This ),
        all_Nth_members( Rest, N, RestFiltered ).

constraint1( [A, _, _, D] ) :-
	one_set( [A, _, _, D] ),
	A = deandre,
	D = 194.

one_set( [A, B, C, D] ) :-
	first(A),
	last(B),
	cookie(C),
	time(D).
