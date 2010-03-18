/*
NOTE: ALL tests, including the 3 extra tests, run in a 
reasonable amount of time (<2 seconds on my machine).

When retrieving columns and grids, the puzzle is equated to the following:
[[AA1, AB1, AC1, AD2, AE2, AF2, AG3, AH3, AI3],
 [BA1, BB1, BC1, BD2, BE2, BF2, BG3, BH3, BI3],
 [CA1, CB1, CC1, CD2, CE2, CF2, CG3, CH3, CI3],
 [DA4, DB4, DC4, DD5, DE5, DF5, DG6, DH6, DI6],
 [EA4, EB4, EC4, ED5, EE5, EF5, EG6, EH6, EI6],
 [FA4, FB4, FC4, FD5, FE5, FF5, FG6, FH6, FI6],
 [GA7, GB7, GC7, GD8, GE8, GF8, GG9, GH9, GI9],
 [HA7, HB7, HC7, HD8, HE8, HF8, HG9, HH9, HI9],
 [IA7, IB7, IC7, ID8, IE8, IF8, IG9, IH9, II9]]

Where the first character represents the row (A-I)
the second character represents the column (A-I)
and the digit represents the subgrid (1-9)
*/

/* This runs all the simple tests. If it 
works correctly, you should see three identical 
and completed suduko tables, and finally the 
word No (as test0c will fail.) */
test :-
	test0, nl,
	test0a, nl,
	test0b, nl,
	test0c, nl.

testHardest :-
	L = [
			 [8,5,_,_,_,2,4,_,_],
			 [7,2,_,_,_,_,_,_,9],
			 [_,_,4,_,_,_,_,_,_],
			 [_,_,_,1,_,7,_,_,2],
			 [3,_,5,_,_,_,9,_,_],
			 [_,4,_,_,_,_,_,_,_],
			 [_,_,_,_,8,_,_,7,_],
			 [_,1,7,_,_,_,_,_,_],
			 [_,_,_,_,3,6,_,4,_]],
		sudoku(L),
		printsudoku(L).
		
/* This is a completly solved solution. */
test0 :-
	L = [
             [9,6,3,1,7,4,2,5,8],
             [1,7,8,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,9,6],
             [4,9,6,8,5,2,3,1,7],
             [7,3,5,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) which 
should be found very quickly. */
test0a :-
	L = [
             [9,_,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
			 [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) and 
may take a few seconds to find. */
test0b :-
	L = [
             [9,_,3,1,7,4,2,5,_],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,_,9,_,3,1],
             [_,2,1,4,3,_,5,_,6],
             [4,9,_,8,_,2,3,1,_],
             [_,3,_,9,6,_,8,2,_],
             [5,8,9,7,1,3,4,6,2],
             [_,1,7,2,_,6,_,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This one obviously has no solution (column 2 has 
two nines in it.) and it may take a few seconds 
to deduce this. */
test0c :-
	L = [
             [_,9,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
			 [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* Here is an extra test for you to try. It would be
nice if your program can solve this puzzle, but it's
not a requirement. */

test0d :-
	L = [
             [9,_,3,1,_,4,2,5,_],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,_,9,_,3,1],
             [_,2,1,4,3,_,5,_,6],
             [4,9,_,8,_,2,3,1,_],
             [_,3,_,9,6,_,8,2,_],
             [5,8,9,7,1,3,4,6,2],
             [_,1,7,2,_,6,_,8,5],
             [6,4,2,5,_,8,1,7,3]],
        sudoku(L),
        printsudoku(L).


/* The next 3 tests are supposed to be progressively 
harder to solve. Our first attempt at a solver did not 
find a solution in a reasonable length of time for 
any of these, so if you manage to write a solver 
that does them in a reasonable length of time, 
expect to recieve top or possibly bonus marks. (BUT 
YOU MUST TELL US THIS IN YOUR FILE OR WE WON'T RUN 
THESE TESTS.) */
test1 :-
	L = [
             [_,6,_,1,_,4,_,5,_],
             [_,_,8,3,_,5,6,_,_],
             [2,_,_,_,_,_,_,_,1],
             [8,_,_,4,_,7,_,_,6],
			 [_,_,6,_,_,_,3,_,_],
             [7,_,_,9,_,1,_,_,4],
             [5,_,_,_,_,_,_,_,2],
             [_,_,7,2,_,6,9,_,_],
             [_,4,_,5,_,8,_,7,_]],
        sudoku(L),
        printsudoku(L).

test2 :-
	L = [
             [_,_,4,_,_,3,_,7,_],
             [_,8,_,_,7,_,_,_,_],
             [_,7,_,_,_,8,2,_,5],
             [4,_,_,_,_,_,3,1,_],
			 [9,_,_,_,_,_,_,_,8],
             [_,1,5,_,_,_,_,_,4],
             [1,_,6,9,_,_,_,3,_],
             [_,_,_,_,2,_,_,6,_],
             [_,2,_,4,_,_,5,_,_]],
        sudoku(L),
        printsudoku(L).

test3 :-
	L = [
             [_,4,3,_,8,_,2,5,_],
			 [6,_,_,_,_,_,_,_,_],
             [_,_,_,_,_,1,_,9,4],
             [9,_,_,_,_,4,_,7,_],
             [_,_,_,6,_,8,_,_,_],
             [_,1,_,2,_,_,_,_,3],
             [8,2,_,5,_,_,_,_,_],
             [_,_,_,_,_,_,_,_,5],
             [_,3,4,_,9,_,7,1,_]],
        sudoku(L),
        printsudoku(L).


% print suduko table
printsudoku([]).
printsudoku([H|T]) :-
	write(H),nl,
	printsudoku(T).


% Expects a list of lists 9 by 9 grid.
sudoku(L) :-
[R1,R2,R3,R4,R5,R6,R7,R8,R9] = L,

%obtains all 9 columns where C1 is the first column,
%C2 is the second, etc.
getColumns(L,C1,C2,C3,C4,C5,C6,C7,C8,C9),

%C is a list of all columns and is used to check
%column constraints (every column should have vals
%from 1-9 with no duplicates)
C = [C1,C2,C3,C4,C5,C6,C7,C8,C9],

%obtains all 9 subgrids(3x3 grid) where G1 is the first
%subgrid, G2 is the second, etc.
getSubgrids(L,G1,G2,G3,G4,G5,G6,G7,G8,G9),

%G is a list of all subgrids and is used to check 
%grid constraints(every subgrid has vals 1-9
%with no duplicates)
G = [G1,G2,G3,G4,G5,G6,G7,G8,G9],

%validate rows against row, column, and subgrid constraints
%the first digit is the row number
%the second digit is the first column number
%the third digit is the leftmost subgrid that the row under tests is in
noDups(R1,L,C,G,1,1,1), noDups(R2,L,C,G,2,1,1), noDups(R3,L,C,G,3,1,1),
noDups(R4,L,C,G,4,1,4), noDups(R5,L,C,G,5,1,4), noDups(R6,L,C,G,6,1,4),
noDups(R7,L,C,G,7,1,7), noDups(R8,L,C,G,8,1,7), noDups(R9,L,C,G,9,1,7).

%returns each column C1-9 where C1 is the leftmost column
getColumns(
[[AA1, AB1, AC1, AD2, AE2, AF2, AG3, AH3, AI3],
 [BA1, BB1, BC1, BD2, BE2, BF2, BG3, BH3, BI3],
 [CA1, CB1, CC1, CD2, CE2, CF2, CG3, CH3, CI3],
 [DA4, DB4, DC4, DD5, DE5, DF5, DG6, DH6, DI6],
 [EA4, EB4, EC4, ED5, EE5, EF5, EG6, EH6, EI6],
 [FA4, FB4, FC4, FD5, FE5, FF5, FG6, FH6, FI6],
 [GA7, GB7, GC7, GD8, GE8, GF8, GG9, GH9, GI9],
 [HA7, HB7, HC7, HD8, HE8, HF8, HG9, HH9, HI9],
 [IA7, IB7, IC7, ID8, IE8, IF8, IG9, IH9, II9]],
 %c1
 [AA1,BA1,CA1,DA4,EA4,FA4,GA7,HA7,IA7],
 %c2
 [AB1,BB1,CB1,DB4,EB4,FB4,GB7,HB7,IB7],
 %c3
 [AC1,BC1,CC1,DC4,EC4,FC4,GC7,HC7,IC7],
 %c4
 [AD2,BD2,CD2,DD5,ED5,FD5,GD8,HD8,ID8],
 %c5
 [AE2,BE2,CE2,DE5,EE5,FE5,GE8,HE8,IE8],
 %c6
 [AF2,BF2,CF2,DF5,EF5,FF5,GF8,HF8,IF8],
 %c7
 [AG3,BG3,CG3,DG6,EG6,FG6,GG9,HG9,IG9],
 %c8
 [AH3,BH3,CH3,DH6,EH6,FH6,GH9,HH9,IH9],
 %c9
 [AI3,BI3,CI3,DI6,EI6,FI6,GI9,HI9,II9]
).

/*
returns each subgrid where grids are ordered as follows:
G1 G2 G3
G4 G5 G6
G7 G8 G9
each subgrid is reduced to a single row where each element is 
ordered as follows:
1 2 3
4 5 6
7 8 9
*/
getSubgrids(
[[AA1, AB1, AC1, AD2, AE2, AF2, AG3, AH3, AI3],
 [BA1, BB1, BC1, BD2, BE2, BF2, BG3, BH3, BI3],
 [CA1, CB1, CC1, CD2, CE2, CF2, CG3, CH3, CI3],
 [DA4, DB4, DC4, DD5, DE5, DF5, DG6, DH6, DI6],
 [EA4, EB4, EC4, ED5, EE5, EF5, EG6, EH6, EI6],
 [FA4, FB4, FC4, FD5, FE5, FF5, FG6, FH6, FI6],
 [GA7, GB7, GC7, GD8, GE8, GF8, GG9, GH9, GI9],
 [HA7, HB7, HC7, HD8, HE8, HF8, HG9, HH9, HI9],
 [IA7, IB7, IC7, ID8, IE8, IF8, IG9, IH9, II9]],
 %g1
 [AA1,AB1,AC1,BA1,BB1,BC1,CA1,CB1,CC1],
 %g2
 [AD2,AE2,AF2,BD2,BE2,BF2,CD2,CE2,CF2],
 %g3
 [AG3,AH3,AI3,BG3,BH3,BI3,CG3,CH3,CI3],
 %g4
 [DA4,DB4,DC4,EA4,EB4,EC4,FA4,FB4,FC4],
 %g5
 [DD5,DE5,DF5,ED5,EE5,EF5,FD5,FE5,FF5],
 %g6
 [DG6,DH6,DI6,EG6,EH6,EI6,FG6,FH6,FI6],
 %g7
 [GA7,GB7,GC7,HA7,HB7,HC7,IA7,IB7,IC7],
 %g8
 [GD8,GE8,GF8,HD8,HE8,HF8,ID8,IE8,IF8],
 %g9
 [GG9,GH9,GI9,HG9,HH9,HI9,IG9,IH9,II9]
).

/*
The main constraint-checking function.
The first list is the row that we are examining
The second list is a list of all rows
The third list is a list of all columns
The fourth list is a list of all subgrids
RowNum is the row number we are currently examining (1-based)
ColNum is the column number we are currently examining (1-based)
GridNum is the subgrid number we are currently examining (1-based)
*/
noDups([],L,C,G,RowNum,ColNum,GridNum).

/*
called if X is already initialized with a number from 1-9,
we update the position, verify that X is within 1-9,
and make sure that X only occurs once in the row
*/
noDups([X|Xs],L,C,G,RowNum,ColNum,GridNum) :- 
	nonvar(X),
	updatePosition(RowNum,ColNum,GridNum,NRow,NCol,NGrid),
	member(X, [1,2,3,4,5,6,7,8,9]), 
	getNonVars(Xs,Z),
	not(member(X,Z)),
	noDups(Xs,L,C,G,NRow,NCol,NGrid).

/*
called if X is a variable,
we update the position as usual, and get all possible numbers X can be
given our row, column, and subgrid constraints,
we then initialize X to be the first element of this list (for the first pass)
and subsequent elements if we need to backtrack
*/	
noDups([X|Xs],L,C,G,RowNum,ColNum,GridNum) :- 
	var(X),
	updatePosition(RowNum, ColNum,GridNum, NRow, NCol,NGrid),
	getPossibleValues(L,C,G,RowNum,ColNum,GridNum,Poss),
	member(X, Poss),
	noDups(Xs,L,C,G,NRow,NCol,NGrid).

/*
increments the column position value and grid position value, as necessary
since we run no_dups on rows, the column number is always incremented,
and the grid number is incremented once the new column enters a new subgrid.
These values are used so we can obtain the correct columns and grids when
running the constraints.
*/
updatePosition(RowNum, ColNum, GridNum, RowNum, NewColNum, NewGridNum) :-
		NewColNum is ColNum + 1, ((NewColNum =:= 4, NewGridNum is GridNum + 1);
								 (NewColNum =:= 7, NewGridNum is GridNum + 1);
								 (NewColNum \=4, NewColNum \= 7, NewGridNum is GridNum)).

/*
determines the possible values for the unset value which is in
the row at RowNum, the column at ColNum, and the subgrid at GridNum
we reduce the number of possible values by removing all values in the
row, column, and grid. By doing so, the entire solver runs waaaay quicker
since less backtracking is necessary.
*/								 
getPossibleValues(L,C,G,RowNum,ColNum,GridNum,Z) :-
	getElem(L,RowNum, Row),
	setDiff([1,2,3,4,5,6,7,8,9], Row, I1),
	getElem(C, ColNum, Col),
	setDiff(I1, Col, I2),
	getElem(G, GridNum, Grid),
	setDiff(I2, Grid, Z).
	
/*
gets the element(with all unset variables removed) specified by RowNum in the list
*/
getElem([H|T],1,Row) :- getNonVars(H,Row).
getElem([H|T], RowNum,Row) :- NewRowNum is RowNum - 1, getElem(T, NewRowNum,Row).

/*
takes the set difference between the first list and second list
*/
setDiff([X|Xs], Ys, [X|Zs]) :- not(member(X, Ys)), setDiff(Xs, Ys, Zs).
setDiff([X|Xs], Ys, Zs) :- member(X, Ys), setDiff(Xs,Ys,Zs).
setDiff([], Ys, []).  

/*
gets all initialized elements in the first list
*/
getNonVars([],[]).
getNonVars([X|Xs], Ys) :- var(X), getNonVars(Xs,Ys).
getNonVars([X|Xs], [X|Ys]) :- nonvar(X), getNonVars(Xs,Ys).