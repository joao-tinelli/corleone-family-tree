%----------------------------------------------
% The Corleone Family Tree
%----------------------------------------------

% Parent(X,Y) -: indicates that X is the parent of Y

parent(signora, vito).
parent(antonio, vito).
parent(vito, michael).
parent(vito, sonny).
parent(vito, connie).
parent(vito, fredo).
parent(vito, tom).
parent(carmella, michael).
parent(carmella, sonny).
parent(carmella, connie).
parent(carmella, fredo).
parent(carmella, tom).
parent(michael, anthony).
parent(michael, mary).
parent(sonny, vincent).
parent(sonny, santino_jr).
parent(sonny, francessa).
parent(sonny, frank).
parent(connie, victor).
parent(connie, michael_francis).
parent(tom, theresa).
parent(tom, frank_).
parent(tom, andrew).

%----------------------------------------------
% Adds gender to everyone

male(antonio).
male(vito).
male(michael).
male(sonny).
male(fredo).
male(tom).
male(carlo).
male(anthony).
male(vincent).
male(santino_jr).
male(frank).
male(victor).
male(michael_francis).
male(frank_).
male(andrew).
female(signora).
female(carmella).
female(connie).
female(kay).
female(apollonia).
female(lucy).
female(sandra).
female(deanna).
female(theresa).
female(mary).
female(francessa).

%----------------------------------------------
% Defines child relationship

child(X, Y) :-
    parent(Y,X).

daughter(X, Y) :-
    parent(Y,X),
    female(X).

son(X, Y) :-
    parent(Y, X),
    male(X).

children(X, Children) :-
	setof(Y, parent(X,Y), Children),
	!.

children(X, none) :-
	not(setof(Y, parent(X,Y), _)). % If no children, returns none

%----------------------------------------------
% Defines parents relationship

mother(X, Y) :-
    parent(X, Y),
    female(X).

father(X, Y) :-
    parent(X, Y),
    male(X).

parents(X, Parents) :-
	setof(Y, parent(Y, X), Parents),
	!.

parents(X, unknown) :-
	not(setof(Y, parent(Y, X), _)).

%----------------------------------------------
% Defines siblings relationship

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

list_siblings(X, Siblings) :-
	setof(Y, sibling(X,Y), Siblings), % Creates list of all siblings, excluding duplicates.
	!.

list_siblings(_, none). % If no siblings, returns none

siblings(X, Y) :-
	list_siblings(X, Siblings),
	member(Y, Siblings). % Checks if the queried sibling is a member of the list of siblings for that person.

brother(X, Y) :-
    male(X),
    siblings(X, Y).

sister(X, Y) :-
    female(X),
    siblings(X, Y).

%----------------------------------------------
% Defines others relationship

cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B).

uncle(X, Y) :-
    male(X),
    parent(A, Y),
    sibling(A, X).

aunt(X, Y) :-
    female(X),
    parent(A, Y),
    sibling(A, X).

grandfather(X, Y) :-
    male(X),
    parent(Z, Y),
    parent(X, Z).

grandmother(X, Y) :-
    female(X),
    parent(Z, Y),
    parent(X, Z).

ancestor(X, Y) :- % Base case
    parent(X, Y).

ancestor(X, Y) :- % Recursive case
    parent(X, Z),
    ancestor(Z, Y).

%----------------------------------------------
% Defines ancestors and descendants

ancestors(X, Ancestor_of) :-
	findall(A, ancestor(X, A), Ancestor_of). % Returns a list of all results for ancestor(X, Y).

descendant(X, Y) :-
	ancestor(Y, X).

descendants(X, Descendant_of) :-
	findall(D, descendant(X, D), Descendant_of). % Returns a list of all results for descendant(X, Y).

%----------------------------------------------
% Finds relationship between

relationship(X, Y) :-
    father(X, Y),
    format("~w is the father of ~w", [X, Y]), nl.

relationship(X, Y) :-
    mother(X, Y),
    format("~w is the mother of ~w", [X, Y]), nl.

relationship(X, Y) :-
    son(X, Y),
    format("~w is the son of ~w", [X, Y]), nl.

relationship(X, Y) :-
    daughter(X, Y),
    format("~w is the daughter of ~w", [X, Y]), nl.

relationship(X, Y) :-
    brother(X, Y),
    format("~w is the brother of ~w", [X, Y]), nl.

relationship(X, Y) :-
    sister(X, Y),
    format("~w is the sister of ~w", [X, Y]), nl.

relationship(X, Y) :-
    uncle(X, Y),
    format("~w is the uncle of ~w", [X, Y]), nl.

relationship(X, Y) :-
    aunt(X, Y),
    format("~w is the aunt of ~w", [X, Y]), nl.

relationship(X, Y) :-
    grandfather(X, Y),
    format("~w is the grandfather of ~w", [X, Y]), nl.

relationship(X, Y) :-
    grandmother(X, Y),
    format("~w is the grandmother of ~w", [X, Y]), nl.

relationship(X, Y) :-
    cousin(X, Y),
    format("~w is the cousin of ~w", [X, Y]), nl.
