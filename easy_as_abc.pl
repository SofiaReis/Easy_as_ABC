% ***************************************************************************
% *                              EASY_AS_ABC                                *
% ***************************************************************************
% * Realizado por:                                                          *
% *            Maria Marques  - ei12104@fe.up.pt                            *
% *            Sofia Reis - ei12041@fe.up.pt                        MIEIC14 *
% ***************************************************************************
:-use_module(library(clpfd)).
:-use_module(library(lists)).

% Generates a dinamic board
gentab([],_).
gentab([H|T],S):-
        length(H, S),
        S1 #= S - 1,
        domain(H,0,S1),
        all_different(H),
        gentab(T,S).

% Constraints
clueM([],[]).
clueM([[H1,H2|_]|T],[Ch|Ct]):-
        Ch #= 0 #\/ Ch #= H1 #\/ (H1 #= 0 #/\ Ch #= H2),
        clueM(T,Ct).

solve(L1,L2,L3,L4,Vars):-
        conv(L1,NL1),
        reverse(NL1,RNL1),
        conv(L2,NL2),
        reverse(NL2,RNL2),
        conv(L3,NL3),
        reverse(NL3,RNL3),
        conv(L4,NL4),
        reverse(NL4,RNL4),
        solution(RNL1,RNL2,RNL3,RNL4,Vars).

% Solution
solution(NL1,NL2,NL3,NL4,Vars):-
        length(NL1, S),
        length(Vars, S),
        gentab(Vars,S),
        transpose(Vars, TVars),
        gentab(TVars,S),
        clueM(Vars,NL1),
        clueM(TVars,NL2),
        reverse(TVars,RTVars),
        transpose(RTVars,TRTVars),
        clueM(TRTVars,NL3),reverse(Vars, RVars),
        transpose(RVars, TRVars),
        clueM(TRVars,NL4),
        append(Vars,L),
        reset_timer,
        labeling([ff],L),
        print_time,
        fd_statistics,
        print_end(NL1,NL2,NL3,NL4,Vars).

reset_timer :- statistics(walltime,_).  
print_time :-
        statistics(walltime,[_,T]),
        TS is ((T//10)*10)/1000,
        nl, write('Time: '), write(TS), write('s'), nl, nl.

% print final board
print_end(L1,L2,L3,L4,Vars):-
        nl,
        write(' '),print_clue(L2),nl,
        print_tab(0,Vars,L1,L3),
        write(' '),print_clue(L4).

print_clue([]).
print_clue([H|L]) :-
        write(' '),
        convert(H,A),write(A),
        print_clue(L).
        
print_line([]).
print_line([H|L]) :-
        write('|'),
        convert(H,A),write(A),
        print_line(L).

print_tab(_,[],[],[]).
print_tab(N,[H|L],[L1|R1],[L3|R3]) :-
        convert(L1,A), write(A),
        print_line(H), write('|'), 
        convert(L3,B), write(B),
        nl,
        N2 is N+1,
        print_tab(N2,L,R1,R3).

conv([],_).
conv([L|T],NL):-
        convert(A,L),
        append(NewNL,[A],NL),
        conv(T,NewNL).

convert(0,' ').
convert(1,'A').
convert(2,'B').
convert(3,'C').
convert(4,'D').
convert(5,'E').
convert(6,'F').
convert(7,'G').
convert(8,'H').
convert(9,'I').
convert(10,'J').
convert(11,'K').
convert(12,'L').
convert(13,'M').
convert(14,'N').
convert(15,'O').
convert(16,'P').
convert(17,'Q').
convert(18,'R').
convert(19,'S').
convert(20,'T').
convert(21,'U').
convert(22,'V').
convert(23,'W').
convert(24,'X').
convert(25,'Y').
convert(26,'Z').