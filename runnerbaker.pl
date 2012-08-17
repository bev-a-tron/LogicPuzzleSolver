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

constraint13( [Set1, Set2, Set3, Set4, Set5] ) :-
	Set1 = [charlotte, _, _, _],
	Set2 = [sierra, _, _, _],
	Set3 = [_, huber, _, _],
	Set4 = [_, _, chocolate_chip, _],
	Set5 = [_, _, _, 185].

solution2( X ) :-
	constraint13( X ),
	%member( Constrained1, X ),
	%constraint1( Constrained1 ),
	all_Nth_members( X, 1, ListOfFirstNames),
	permutation( ListOfFirstNames, [ charlotte, deandre, rodney, samuel, sierra ] ),
	all_Nth_members( X, 2, ListOfLastNames),
	permutation( ListOfLastNames, [ chase, huber, larson, summers, velez ] ),
	all_Nth_members( X, 3, ListOfCookies),
	permutation( ListOfCookies, [ almond, black_and_white, chocolate_chip, gingerbread, oatmeal_raisin ] ),
	all_Nth_members( X, 4, ListOfTimes),
	permutation( ListOfTimes, [ 179, 185, 188, 194, 199 ] ).


constraint1( [deandre, _, _, 194] ).
constraint2( [rodney, _, Cookie, _] ) :-
	Cookie \= oatmeal_raisin.
constraint3( [_, chase, _, Time] ) :-
	Time \= 188.
constraint4( [_, chase, Cookie, _] ) :-
	Cookie \= oatmeal_raisin.
constraint5( [samuel, Last, _, _] ) :-
	Last \= velez.
constraint6( [charlotte, Last, _, _] ) :-
	Last \= velez.
constraint7( [_, chase, _, Time1], [_, _, oatmeal_raisin, Time2]) :-
	Time1 < Time2.
constraint8( [_, huber, _, Time1], [_, _, black_and_white, Time2]) :-
	Time2 < Time1.
constraint9( [_, velez, _, Time] ) :-
	Time = 199.
constraint10( [_, summers, _, Time1], [_, chase, _, Time2]) :-
	Time1 < Time2.
constraint11( [deandre, _, almond, _] ).
constraint11( [deandre, _, oatmeal_raisin, _] ).
constraint12( [rodney, _, chocolate_chip, _] ).

solution3( X ) :-
	constraint13( X ),
	member( Constrained1, X ),
	constraint1( Constrained1 ),
	member( Constrained2, X ),
	constraint1( Constrained2 ),
	member( Constrained3, X ),
	constraint1( Constrained3 ),
	%X = [ [charlotte,_,_,_], [deandre,_,_,_], [rodney,_,_,_], [samuel,_,_,_], [sierra,_,_,_] ],
	all_Nth_members( X, 1, ListOfFirstNames),
	permutation( ListOfFirstNames, [ charlotte, deandre, rodney, samuel, sierra ] ),
	all_Nth_members( X, 2, ListOfLastNames),
	permutation( ListOfLastNames, [ chase, huber, larson, summers, velez ] ),
	all_Nth_members( X, 3, ListOfCookies),
	permutation( ListOfCookies, [ almond, black_and_white, chocolate_chip, gingerbread, oatmeal_raisin ] ),
	all_Nth_members( X, 4, ListOfTimes),
	permutation( ListOfTimes, [ 179, 185, 188, 194, 199 ] ).

solution( X ) :-
	X = [ A, B, C, D, M ],
%	X = [ [charlotte,_,_,_], [deandre,_,_,_], [rodney,_,_,_], [samuel,_,_,_], [sierra,_,_,_] ],
	one_set( A ),
	one_set( B ),
	one_set( C ),
	one_set( D ),
	one_set( M ),
	constraint13( X ),
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
	member( Constrained2, X ),
	constraint2( Constrained2 ),
	member( Constrained3, X ),
	constraint3( Constrained3 ),
	member( Constrained4, X ),
	constraint4( Constrained4 ),
	member( Constrained5, X ),
	constraint5( Constrained5 ),
	member( Constrained6, X ),
	constraint6( Constrained6 ),
	member( Constrained7A, X ),
	member( Constrained7B, X ),
	constraint7( Constrained7A, Constrained7B ),
	member( Constrained8A, X ),
	member( Constrained8B, X ),
	constraint8( Constrained8A, Constrained8B ),
	member( Constrained9, X ),
	constraint9( Constrained9 ),
	member( Constrained10A, X ),
	member( Constrained10B, X ),
	constraint10( Constrained10A, Constrained10B ),
	member( Constrained11, X ),
	constraint11( Constrained11 ),
	member( Constrained12, X ),
	constraint12( Constrained12 ).
%	X = [ [charlotte,_,_,_], [deandre,_,_,_], [rodney,_,_,_], [samuel,_,_,_], [sierra,_,_,_] ],
