Object subclass: #Wielokat
    instanceVariableNames: 'wierzcholki nazwa'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'
!

!Wielokat methodsFor: 'initialize-release'!
	initialize: liczbaWierzcholkow name: nowaNazwa
		"konstruktor obiektu - wielokata"
		nazwa := nowaNazwa.
		wierzcholki := Array new: liczbaWierzcholkow.
		wierzcholki at: 1 put: 0@0.
	! 
!

!Wielokat methodsFor: 'accessing'!
	nazwa
		"podaje nazwe wielokata"
		^nazwa
	!

	nazwa: nowa_nazwa
		"ustawia nowa nazwe wielokata"
		nazwa := nowa_nazwa
	! 
!

!Wielokat methodsFor: 'actions'! 
    drukuj
        "Wyświetla dane o wielokącie."
        Transcript
            cr;
            show: 'Dana jest figura: ', nazwa;
            cr.
 
        wierzcholki keysAndValuesDo: [:index :wierzcholek |
            Transcript
                show: 'Wierzchołek ', index asString, ': ', wierzcholek x asString, ' @ ', wierzcholek y asString;
                cr.
        ].
        Transcript
            show: 'Pole: ', self pole asString;
            cr.
    !
!

Wielokat subclass: #Kwadrat
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!Kwadrat methodsFor: 'arithmetic'!
	+ figura
		"dodaj 2 figury w sensie pola"
		| p |
		p := self pole + figura pole.
		^(Kwadrat new) initialize: p sqrt
	! 
	= figura
		"sprawdz czy figura jest przystajaca do tej"
		^(figura isKindOf: Kwadrat) and: [(self pole = figura pole)]
	!
!

!Kwadrat methodsFor: 'actions'!
	pole
		"licz pole kwadratu"
		^(wierzcholki at: 2) x * (wierzcholki at: 2) x
	! 
!

!Kwadrat methodsFor: 'modifiers'!
    skaluj: skala
        "skaluje boki wielokata zgodnie ze skala"
        | bok |
        Transcript cr; show: 'Przeskaluje boki figury: ', nazwa, ' o liczbe ', skala asString.
        bok := (wierzcholki at: 2) x.
        ^(Kwadrat new) initialize: bok * skala
    !
!

!Kwadrat methodsFor: 'initialize-release'!
	initialize: bok
		"tworz kwadrat o podanym boku"
		super initialize: 4 name: 'Kwadrat'.
		wierzcholki at: 2 put: bok@0.
		wierzcholki at: 3 put: bok@bok.
		wierzcholki at: 4 put: 0@bok.
	! 
!
	
Wielokat subclass: #TrojkatRownoboczny
    instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'
!

!TrojkatRownoboczny methodsFor: 'arithmetic'!
	+ figura
		"dodaj 2 figury w sensie pola"
		| p |
		p := self pole + figura pole.
		^(TrojkatRownoboczny new) initialize: (4 * p / (3 sqrt)) sqrt
	! 
	= figura
		"sprawdz czy figura jest przystajaca do tej"
		^(figura isKindOf: TrojkatRownoboczny) and: [(self pole = figura pole)]
	!
!
	
!TrojkatRownoboczny methodsFor: 'actions'!
	pole
        "licz pole trojkata rownobocznego"
        ^((wierzcholki at: 2) x * (wierzcholki at: 2) x) * (3 sqrt) / 4
    !
!

!TrojkatRownoboczny methodsFor: 'modifiers'!
    skaluj: skala
        "skaluje boki wielokata zgodnie ze skala"
        | bok |
        Transcript cr; show: 'Przeskaluje boki figury: ', nazwa, ' o liczbe ', skala asString.
        bok := (wierzcholki at: 2) x.
        ^(TrojkatRownoboczny new) initialize: bok * skala
    !
!

!TrojkatRownoboczny methodsFor: 'initialize-release'!
    initialize: bok
        "tworz szesciokat foremny o podanym boku"
        super initialize: 3 name: 'TrojkatRownoboczny'.
        wierzcholki at: 2 put: bok@0.
        wierzcholki at: 3 put: (bok / 2) @ (bok * (3 sqrt) / 2).
    !
!

"Testy"

kwadrat := (Kwadrat new) initialize: 3.
trojkat := (TrojkatRownoboczny new) initialize: 6.
kwadrat1 := (Kwadrat new) initialize: 10.5.
trojkat1 := (TrojkatRownoboczny new) initialize: 5.3.
kwadratKopia := (Kwadrat new) initialize: 3.
trojkatKopia := (TrojkatRownoboczny new) initialize: 5.3.

Transcript show: 'Dane sa wielokaty:'; cr.
kwadrat drukuj.
trojkat drukuj.

Transcript cr; show: 'trojkat+kwadrat'.
test1 := trojkat + kwadrat.
test1 drukuj.

Transcript cr; show: 'trojkat+trojkat'.
test2 := trojkat + trojkat.
test2 drukuj.

Transcript cr; show: 'Czy kwadrat1 i kwadrat są przystające? '; show: (kwadrat1 = kwadrat) printString.
Transcript cr; show: 'Czy trojkat i trojkat1 są przystające? '; show: (trojkat = trojkat1) printString.
Transcript cr; show: 'Czy trojkat i kwadrat1 są przystające? '; show: (trojkat = kwadrat1) printString.
Transcript cr; show: 'Czy kwadrat i kwadratKopia są przystające? '; show: (kwadrat = kwadratKopia) printString.
Transcript cr; show: 'Czy trojkat1 i trojkatKopia są przystające? '; show: (trojkat1 = trojkatKopia) printString.
Transcript cr.

kwadrat2 := kwadrat skaluj: 2.
kwadrat2 drukuj.
trojkat2 := trojkat skaluj: 3.5.
trojkat2 drukuj.