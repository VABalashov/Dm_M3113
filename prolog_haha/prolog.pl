edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).
edge(b, f).
edge(e, g).
edge(f, g).


dfs(Start, Goal, Path) :-
    dfs_visit(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).


dfs_visit(Goal, Goal, PathAcc, PathAcc).

dfs_visit(Current, Goal, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    dfs_visit(Next, Goal, [Next | Visited], Path).


:- begin_tests(dfs).

test(simple_path) :-
    dfs(a, e, P),
    assertion(P == [a, b, d, e]).

test(alternative_path, [true]) :-
    dfs(a, g, P),
    member(P, [[a,b,d,e,g], [a,b,f,g]]).

test(no_path, [fail]) :-
    dfs(c, a, _).

:- end_tests(dfs).

%l-------
