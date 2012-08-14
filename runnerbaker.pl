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
	member( Constrained7A, X ),
	member( Constrained7B, X ),
	constraint4( Constrained7A, Constrained7B ),
	all_Nth_members( X, 2, ListOfLastNames),
	permutation( ListOfLastNames, [ chase, huber, larson, summers, velez ] ),
	all_Nth_members( X, 3, ListOfCookies),
	permutation( ListOfCookies, [ almond, black_and_white, chocolate_chip, gingerbread, oatmeal_raisin ] ),
	all_Nth_members( X, 4, ListOfTimes),
	permutation( ListOfTimes, [ 179, 185, 188, 194, 199 ] ).


all_Nth_members( [], _, [] ).
all_Nth_members( [H|Rest], N, [This|RestFiltered] ) :-
        nth1( N, H, This ),
        all_Nth_members( Rest, N, RestFiltered ).

constraint1( [First, _, _, Time] ) :-
	one_set( [First, _, _, Time] ),
	First = deandre,
	Time = 194.

constraint2( [First, _, Cookie, _] ) :-
	one_set([First, _, Cookie, _] ),
	First = rodney,
	Cookie \= oatmeal_raisin.

constraint3( [_, Last, _, Time] ) :-
	one_set([_, Last, _, Time] ),
	Last = chase,
	Time \= 188.
	
constraint4( [_, Last, Cookie, _] ) :-
	one_set( [_, Last, Cookie, _] ),
	Last = chase,
	Cookie \= oatmeal_raisin.

constraint5( [First, Last, _, _] ) :-
	one_set( [First, Last, _, _] ),
	First = samuel,
	Last \= velez.

constraint6( [First, Last, _, _] ) :-
	one_set( [First, Last, _, _] ),
	First = charlotte,
	Last \= velez.

constraint7( [_, Last, _, Time1], [_, _, Cookie, Time2]) :-
	one_set( [_, Last, _, Time1] ),
	one_set( [_, _, Cookie, Time2] ),
	Last = chase,
	Cookie = oatmeal_raisin,
	Time1 < Time2.

one_set( [A, B, C, D] ) :-
	first(A),
	last(B),
	cookie(C),
	time(D).
