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
	member( Constrained4, X ),
	constraint3( Constrained4 ),
	member( Constrained5, X ),
	constraint3( Constrained5 ),
	member( Constrained6, X ),
	constraint3( Constrained6 ),

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
	constraint12( Constrained12 ),

	member( Constrained13a, X ),
	member( Constrained13b, X ),
	member( Constrained13c, X ),
	member( Constrained13d, X ),
	member( Constrained13e, X ),
	constraint13( Constrained13a, Constrained13b, Constrained13c, Constrained13d, Constrained13e )

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


constraint13( Set1, Set2, Set3, Set4, Set5 ) :-
	Set1 \= Set2,
	Set2 \= Set3,
	Set3 \= Set4,
	Set4 \= Set5,
	Set1 = [charlotte, _, _, _],
	one_set( Set1 ),
	Set2 = [sierra, _, _, _],
	one_set( Set2 ),
	Set3 = [_, huber, _, _],
	one_set( Set3 ),
	Set4 = [_, _, chocolate_chip, _],
	one_set( Set4 ),
	Set5 = [_, _, _, 185],
	one_set( Set5 ).

%constraint13( [First, _, _, _] ),
%	one_set( [First, _, _, _] ),
%	First = charlotte.
%constraint13( [First, _, _, _] ) :-
%	one_set( [First, _, _, _] ),
%	First = sierra.
%constraint13( [_, Last, _, _] ) :-
%	one_set( [_, Last, _, _] ),
%	Last = huber.
%constraint13( [_, _, Cookie, _] ) :-
%	one_set( [_, _, Cookie, _] ),
%	Cookie = chocolate_chip.
%constraint13( [_, _, _, Time] ) :-
%	one_set( [_, _, _, Time] ),
%	Time = 185.

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

constraint8( [_, Last, _, Time1], [_, _, Cookie, Time2]) :-
	one_set( [_, Last, _, Time1] ),
	one_set( [_, _, Cookie, Time2] ),
	Last = huber,
	Cookie = black_and_white,
	Time2 < Time1.

%constraint9( [_, velez, _, 199] ) :-
%	one_set( [_, velez, _, 199] ).

constraint9( [_, Last, _, Time] ) :-
	one_set( [_, Last, _, Time] ),
	Last = velez,
	Time = 199.

%constraint9( [_, velez, _, 199] ).	

constraint10( [_, Last1, _, Time1], [_, Last2, _, Time2]) :-
	one_set( [_, Last1, _, Time1] ),
	one_set( [_, Last2, _, Time2] ),
	Last1 = summers,
	Last2 = chase,
	Time1 < Time2.

constraint11( [First, _, Cookie, _] ) :-
	one_set( [First, _, Cookie, _] ),
	First = deandre,
	Cookie = almond.

constraint11( [First, _, Cookie, _] ) :-
	one_set( [First, _, Cookie, _] ),
	First = deandre,
	Cookie = oatmeal_raisin.

constraint12( [First, _, Cookie, _] ) :-
	one_set( [First, _, Cookie, _] ),
	First = rodney,
	Cookie = chocolate_chip.


%%%%%%%%%%%%
% THIS PART SUCKS
%
*/
constraint13( [First, _, Cookie, _] ) :-
	one_set( [First, _, Cookie, _] ),
	First = charlotte,
	Cookie \= chocolate_chip.

constraint14( [First, _, Cookie, _] ) :-
	one_set( [First, _, Cookie, _] ),
	First = sierra,
	Cookie \= chocolate_chip.

constraint15( [_, Last, Cookie, _] ) :-
	one_set( [_, Last, Cookie, _] ),
	Last = huber,
	Cookie \= chocolate_chip.

constraint15( [_, _, Cookie, Time] ) :-
	one_set( [_, _, Cookie, Time] ),
	Time = 185,
	Cookie \= chocolate_chip.

constraint15( [First, Last, _, _] ) :-
	one_set( [First, Last, _, _] ),
	First = charlotte,
	Last \= huber.

constraint15( [First, Last, _, _] ) :-
	one_set( [First, Last, _, _] ),
	First = sierra,
	Last \= huber.

constraint15( [_, Last, _, Time] ) :-
	one_set( [First, Last, _, _] ),
	Time = 185,
	Last \= huber.

constraint15( [_, Last, _, Time] ) :-
	one_set( [First, Last, _, _] ),
	Time = 185,
	Last \= huber.

%
% END OF SUCKVILLE
%%%%%
*/
