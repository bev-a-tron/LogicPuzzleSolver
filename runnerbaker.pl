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


one_set( [A, B, C, D] ) :-
	first(A),
	last(B),
	cookie(C),
	time(D).

all_Nth_members( [], _, [] ).
all_Nth_members( [H|Rest], N, [This|RestFiltered] ) :-
        nth1( N, H, This ),
        all_Nth_members( Rest, N, RestFiltered ).
constraint1( [deandre, _, _, 194] ).
constraint1b( [rodney, NotChase, NotOatmealRaisin, 188], [NotRodney, chase, oatmeal_raisin, Not188 ]) :-
	NotOatmealRaisin \= oatmeal_raisin,
	NotRodney \= rodney,
	NotChase \= chase,
	Not188 \= 188.
constraint1b( [rodney, chase, NotOatmealRaisin, Not188], [NotRodney, NotChase, oatmeal_raisin, 188 ]) :-
	NotOatmealRaisin \= oatmeal_raisin,
	NotRodney \= rodney,
	NotChase \= chase,
	Not188 \= 188.
constraint2( [_, chase, NotOatmealRaisin, Time1], [_, NotChase, oatmeal_raisin, Time2] ) :-
	NotOatmealRaisin \= oatmeal_raisin,
	NotChase \= chase,
	time(Time1),
	time(Time2),
	Time1 < Time2.
constraint3( [NotSamuelOrCharlotte, velez, _, _] ) :-
	NotSamuelOrCharlotte \= samuel,
	NotSamuelOrCharlotte \= charlotte.
constraint4( [_, NotHuber, black_and_white, Time1], [_, huber, NotBlackAndWhite, Time2] ) :-
	NotHuber \= huber,
	NotBlackAndWhite \= black_and_white,
	time(Time1),
	time(Time2),
	Time1 < Time2.
constraint5( [_, velez, _, 199] ).
constraint6( [_, summers, _, Time1], [_, chase, _, Time2] ) :-
	time(Time1),
	time(Time2),
	Time1 < Time2.
constraint7( [deandre, _, almond, _] ).
constraint7( [deandre, _, oatmeal_raisin, _] ).
constraint8( [Set1, Set2, Set3, Set4, Set5] ) :-
	Set1 = [charlotte, _, _, _],
	Set2 = [sierra, _, _, _],
	Set3 = [_, huber, _, _],
	Set4 = [_, _, chocolate_chip, _],
	Set5 = [_, _, _, 185].
constraint9( [NotRodney, _, chocolate_chip, _] ) :-
	NotRodney \=  rodney.

solution3( X ) :-
	constraint8( X ),
	all_Nth_members( X, 1, ListOfFirstNames),
	permutation( ListOfFirstNames, [ charlotte, deandre, rodney, samuel, sierra ] ),
	all_Nth_members( X, 2, ListOfLastNames),
	permutation( ListOfLastNames, [ chase, huber, larson, summers, velez ] ),
	all_Nth_members( X, 3, ListOfCookies),
	permutation( ListOfCookies, [ almond, black_and_white, chocolate_chip, gingerbread, oatmeal_raisin ] ),
	all_Nth_members( X, 4, ListOfTimes),
	permutation( ListOfTimes, [ 179, 185, 188, 194, 199 ] ),
	member( Constrained1, X ),
	constraint1( Constrained1 ),
	member( Constrained1b1, X ),
	member( Constrained1b2, X ),
	constraint1b( Constrained1b1, Constrained1b2 ),
	member( Constrained2a, X ),
	member( Constrained2b, X ),
	constraint2( Constrained2a, Constrained2b ),
	member( Constrained3, X ),
	constraint3( Constrained3 ),
	member( Constrained4a, X ),
	member( Constrained4b, X ),
	constraint4( Constrained4a, Constrained4b ),
	member( Constrained5, X ),
	constraint5( Constrained5 ),
	member( Constrained6a, X ),
	member( Constrained6b, X ),
	constraint6( Constrained6a, Constrained6b ),
	member( Constrained7, X ),
	constraint7( Constrained7 ),
	member( Constrained9, X ),
	constraint9( Constrained9 ).
