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
parent(michael, kay).
parent(michael, apollonia).
parent(michael, anthony).
parent(michael, mary).
parent(sonny, lucy).
parent(sonny, sandra).
parent(sonny, vincent).
parent(sonny, santino_jr).
parent(sonny, francessa).
parent(sonny, frank).
parent(connie, carlo).
parent(connie, victor).
parent(connie, michael_francis).
parent(fredo, deanna).
parent(tom, theresa).
parent(tom, frank_).
parent(tom, andrew).

%----------------------------------------------
% Add gender to everyone

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
% Define child relationship

child(X,Y) :-
    parent(Y,X).

daughter(X,Y) :-
    parent(Y,X),
    female(X).

son(X,Y) :-
    parent(Y,X),
    male(X).

children(X, Children) :-
	setof(Y, parent(X,Y), Children),
	!.

children(X, Children) :-
	not(setof(Y, parent(X,Y), Children)),		% If not in the list, children is unknown.
	Children = none.							% '=' assigns parents to string 'unknown'















































