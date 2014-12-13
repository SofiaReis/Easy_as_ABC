% ***************************************************************************
% *                                                                         *
% *                             Neutron                                     *
% *                                                                         *
% ***************************************************************************
% * Realizado por:                                                          *
% *            Maria Marques  - ei12104@fe.up.pt                            *
% *            Sofia Reis - ei12041@fe.up.pt                        MIEIC14 *
% ***************************************************************************
% *                              Bibliotecas                                *                      
% ***************************************************************************
:-use_module(library(clpfd)).
:-use_module(library(lists)).

% ***************************************************************************
% *                            Implementação                                *                      
% ***************************************************************************

gentab([],_).
gentab([H|T],S):-
        length(H, S),
        S1 #= S - 1,
        domain(H,0,S1),
        all_different(H),
        gentab(T,S).

clueM([],[]).
clueM([[H1,H2|_]|T],[Ch|Ct]):-
        Ch #= 0 #\/ Ch #= H1 #\/ (H1 #= 0 #/\ Ch #= H2),
        clueM(T,Ct).

solve(L1,L2,L3,L4,Vars):-
        length(L1, S),
        length(Vars, S),
        gentab(Vars,S),
        transpose(Vars, TVars),
        gentab(TVars,S),
        clueM(Vars,L1),
        clueM(TVars,L2),
        reverse(TVars,RTVars),
        transpose(RTVars,TRTVars),
        clueM(TRTVars,L3),reverse(Vars, RVars),
        transpose(RVars, TRVars),
        clueM(TRVars,L4),
        append(Vars,L),
        labeling([],L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

escreve(0):-write('   ').
escreve(1):-write(' A ').
escreve(2):-write(' B ').
escreve(3):-write(' C ').
escreve(4):-write(' D ').
escreve(5):-write(' E ').
escreve(6):-write(' F ').
escreve(7):-write(' G ').
escreve(8):-write(' H ').
escreve(9):-write(' I ').
escreve(10):-write(' J ').
escreve(11):-write(' K ').
escreve(12):-write(' L ').
escreve(13):-write(' M ').
escreve(14):-write(' N ').
escreve(15):-write(' O ').
escreve(16):-write(' P ').
escreve(17):-write(' Q ').
escreve(18):-write(' R ').
escreve(19):-write(' S ').
escreve(20):-write(' T ').
escreve(21):-write(' U ').
escreve(22):-write(' V ').
escreve(23):-write(' W ').
escreve(24):-write(' X ').
escreve(25):-write(' Y ').
escreve(26):-write(' Z ').