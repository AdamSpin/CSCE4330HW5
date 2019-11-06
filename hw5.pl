solveBoard(Y) :- solve([Y], Moves), myDisplay([Y], Moves).

solve([1], Moves1) :- board([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves1), !.
solve([2], Moves2) :- board([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves2), !.
solve([3], Moves3) :- board([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves3), !.
solve([4], Moves4) :- board([4], [1,2,3,5,6,7,8,9,10,11,12,13,14,15], [], Moves4), !.
solve([5], Moves5) :- board([5], [1,2,3,4,6,7,8,9,10,11,12,13,14,15], [], Moves5), !.
%Solution for 1: [move(4, 2, 1), move(6, 5, 4), move(1, 3, 6), move(7, 4, 2), move(10, 6, 3), move(12, 8, 5), move(13, 9, 6), move(3, 6, 10), move(2, 5, 9), move(15, 10, 6), move(6, 9, 13), move(14, 13, 12), move(11, 12, 13)]


%LegalMoves
move(F,2,T) :- member([F,T], [[1,4],[4,1]]).
move(F,3,T) :- member([F,T], [[1,6],[6,1]]).
move(F,4,T) :- member([F,T], [[2,7],[7,2]]).
move(F,5,T) :- member([F,T], [[2,9],[9,2]]).
move(F,5,T) :- member([F,T], [[3,8],[8,3]]).
move(F,6,T) :- member([F,T], [[3,10],[10,3]]).
move(F,5,T) :- member([F,T], [[4,6],[6,4]]).
move(F,7,T) :- member([F,T], [[4,11],[11,4]]).
move(F,8,T) :- member([F,T], [[4,13],[13,4]]).
move(F,8,T) :- member([F,T], [[5,12],[12,5]]).
move(F,9,T) :- member([F,T], [[5,14],[14,5]]).
move(F,9,T) :- member([F,T], [[6,13],[13,6]]).
move(F,10,T) :- member([F,T], [[6,15],[15,6]]).
move(F,8,T) :- member([F,T], [[9,7],[7,9]]).
move(F,9,T) :- member([F,T], [[10,8],[8,10]]).
move(F,12,T) :- member([F,T], [[11,13],[13,11]]).
move(F,13,T) :- member([F,T], [[12,14],[14,12]]).
move(F,14,T) :- member([F,T], [[13,15],[15,13]]).

board(_, [_], List, Moves):-
  reverse(List, Moves).

board(Free, Occupied, List, Moves) :-
  select(From, Occupied, Oc1),
  select(Over, Oc1, Oc2),
  select(To, Free, F1),
  move(From, Over, To),
  board([From, Over | F1], [To | Oc2], [move(From,Over,To) | List], Moves), !.


getPeg(Free, X, Y) :- member(X, Free) -> Y = 'O' ; Y = 'X'.

myDisplay(Free, []):-
	getPeg(Free, 1, I1),
	getPeg(Free, 2, I2),
	getPeg(Free, 3, I3),
	getPeg(Free, 4, I4),
	getPeg(Free, 5, I5),
	getPeg(Free, 6, I6),
	getPeg(Free, 7, I7),
	getPeg(Free, 8, I8),
	getPeg(Free, 9, I9),
	getPeg(Free, 10, I10),
	getPeg(Free, 11, I11),
	getPeg(Free, 12, I12),
	getPeg(Free, 13, I13),
	getPeg(Free, 14, I14),
	getPeg(Free, 15, I15),
	format('    ~w     ~n', [I1]),
	format('   ~w ~w   ~n', [I2,I3]),
	format('  ~w ~w ~w ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w ~n~n', [I11,I12,I13,I14,I15]),
	writeln(complete).

myDisplay(Free, [move(From,Over,To) | Rest]):-
	getPeg(Free, 1, I1),
	getPeg(Free, 2, I2),
	getPeg(Free, 3, I3),
	getPeg(Free, 4, I4),
	getPeg(Free, 5, I5),
	getPeg(Free, 6, I6),
	getPeg(Free, 7, I7),
	getPeg(Free, 8, I8),
	getPeg(Free, 9, I9),
	getPeg(Free, 10, I10),
	getPeg(Free, 11, I11),
	getPeg(Free, 12, I12),
	getPeg(Free, 13, I13),
	getPeg(Free, 14, I14),
	getPeg(Free, 15, I15),
	format('    ~w     ~n', [I1]),
	format('   ~w ~w   ~n', [I2,I3]),
	format('  ~w ~w ~w ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w ~n~n', [I11,I12,I13,I14,I15]),
	select(To, Free, New),
	myDisplay([From,Over | New], Rest).
