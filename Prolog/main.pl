wstaw_do_drzewa(nil, Element, drzewo(Element, nil, nil)).
wstaw_do_drzewa(drzewo(Korzen, Lewe, Prawe), Element, drzewo(Korzen, NoweLewe, Prawe)) :-
    Element =< Korzen,
    wstaw_do_drzewa(Lewe, Element, NoweLewe).
wstaw_do_drzewa(drzewo(Korzen, Lewe, Prawe), Element, drzewo(Korzen, Lewe, NowePrawe)) :-
    Element > Korzen,
    wstaw_do_drzewa(Prawe, Element, NowePrawe).

buduj_drzewo([], nil).
buduj_drzewo([Glowa|Ogon], Drzewo) :-
    buduj_drzewo(Ogon, Poddrzewo),
    wstaw_do_drzewa(Poddrzewo, Glowa, Drzewo).

przejscie_infiksowe(nil, []).
przejscie_infiksowe(drzewo(Korzen, Lewe, Prawe), Posortowane) :-
    przejscie_infiksowe(Lewe, PosortowaneLewe),
    przejscie_infiksowe(Prawe, PosortowanePrawe),
    sklej(PosortowaneLewe, [Korzen|PosortowanePrawe], Posortowane).

sklej([], Lista, Lista).
sklej([Glowa|Ogon], Lista, [Glowa|Skllejona]) :-
    sklej(Ogon, Lista, Skllejona).

odwroc_liste([], []).
odwroc_liste([Glowa|Ogon], Odwrocona) :-
    odwroc_liste(Ogon, OdwroconyOgon),
    sklej(OdwroconyOgon, [Glowa], Odwrocona).

sortuj(Lista, Posortowana) :-
    buduj_drzewo(Lista, Drzewo),
    przejscie_infiksowe(Drzewo, PosortowanaRosnaco),
    odwroc_liste(PosortowanaRosnaco, Posortowana).

czy_graficzny(Lista, Odp) :-
    sortuj(Lista, Posortowana),          
    (havel_hakimi(Posortowana) -> Odp = tak ; Odp = nie).

havel_hakimi([]) :- !.                    
havel_hakimi([0|Reszta]) :-              
    wszystkie_zera(Reszta), !.
havel_hakimi([N|Reszta]) :-
    dlugosc(Reszta, Dlugosc),
    N =< Dlugosc,                       
    odejmij_pierwsze(N, Reszta, NowaLista), 
    \+ zawiera_ujemne(NowaLista),        
    sortuj(NowaLista, Posortowana),      
    havel_hakimi(Posortowana).          

wszystkie_zera([]).
wszystkie_zera([0|Reszta]) :-
    wszystkie_zera(Reszta).

zawiera_ujemne([H|_]) :-
    H < 0, !.                            
zawiera_ujemne([_|T]) :-
    zawiera_ujemne(T).

odejmij_pierwsze(_, [], []).              
odejmij_pierwsze(0, Lista, Lista).        
odejmij_pierwsze(N, [H|T], [HNowe|Reszta]) :-
    N > 0,
    HNowe is H - 1,                        
    N1 is N - 1,                           
    odejmij_pierwsze(N1, T, Reszta).

dlugosc([], 0).
dlugosc([_|T], N) :-
    dlugosc(T, N1),
    N is N1 + 1.

czy_spojny(Lista, Odp) :-
    czy_graficzny(Lista, Graficzny),
    Graficzny = tak,                
    suma(Lista, Suma),
    dlugosc(Lista, N),
    LiczbaKrawedzi is Suma // 2,  
    LiczbaKrawedzi =< N - 1,      
    Suma >= 2 * (N - 1),            
    czy_istnieje_wiekszy_od_zera(Lista),
    Odp = tak, !.                  
czy_spojny(_, nie).

suma([], 0).
suma([H|T], Suma) :-
    suma(T, SumaT),
    Suma is H + SumaT.

czy_istnieje_wiekszy_od_zera([H|_]) :-
    H > 0, !.
czy_istnieje_wiekszy_od_zera([_|T]) :-
    czy_istnieje_wiekszy_od_zera(T).