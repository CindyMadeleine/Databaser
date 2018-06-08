--	Finn ved hjelp av en rekursiv SQL-spørring alle sykler som inneholder 3, 4 eller 5 personer,
--	og der hver person har rollen ‘daglig leder’ i ett selskap
-- 	og en av rollene ‘styreleder’, ‘nestleder’ eller ‘styremedlem’ i neste selskap i sykelen. 
-- 	Skriv for hver slik sykel ut personene og selskapene i sykelen

WITH Recursive Skattesykel(ps, personsti, selskapssti) as (
	SELECT	s1.person, array[s1.person], array[s1.selskap]
	FROM	Selskapsinfo s1, Selskapsinfo s2
	WHERE	s1.rolle = 'daglig leder'

	UNION ALL

	SELECT 	s2.person, p.personsti || s2.person, selskapssti || s2.selskap
	FROM	Skattesykel p, Selskapsinfo s1, Selskapsinfo s2
	WHERE 	s1.person = p.ps
		and s2.rolle IN ('styreleder', 'nestleder', 'styremedlem')
		and s2.selskap = s1.selskap
		and s1.rolle = 'daglig leder'
		and s1.person <> s2.person
		and s2.person <> ALL(p.personsti)
		and s2.selskap <> ALL(p.selskapssti)
		and s2.person <> p.ps
)


SELECT 	distinct s.personsti, s.selskapssti
FROM 	Skattesykel s
WHERE	cardinality(s.personsti) >= 3
	and cardinality(s.personsti) <= 5;

/**                              personsti                              |          selskapssti           
---------------------------------------------------------------------+--------------------------------
 {"Truls Lyche","Einar Aas","Nina Owe"}                              | {Braga,Prann,Throw}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Helge Nes"}                 | {Forsk,Hafn,Bonn,Sol}
 {"Truls Lyche","Tor Fjeld","Helge Nes","Kristin Aase","Halvor Bø"}  | {Prann,Braga,Sol,Kama,Grafi}
 {"Frank Vatn","Stein Hald","Rolf Numme","Anne Hol"}                 | {Hafn,Forsk,Bolk,Kata}
 {"Anne Hol","Liv Paasche","Odd Olsen"}                              | {Hiro,Landa,Chico}
 {"Truls Lyche","Tor Fjeld","Live Brog"}                             | {Prann,Braga,Sol}
 {"Frank Vatn","Stein Hald","Rolf Numme"}                            | {Hafn,Forsk,Bolk}
 {"Truls Lyche","Nina Owe","Odd Olsen"}                              | {Braga,Prann,Byde}
 {"Frank Vatn","Stein Hald","Rolf Numme","Helge Nes","Kjell Njaa"}   | {Hafn,Forsk,Bolk,Kata,Kama}
 {"Truls Lyche","Einar Aas","Helge Nes","Kristin Aase"}              | {Braga,Prann,Throw,Kama}
 {"Truls Lyche","Tor Fjeld","Live Brog","Frank Vatn","Halvor Bø"}    | {Prann,Braga,Sol,Taake,Hafn}
 {"Anne Hol","Rolf Numme","Helge Nes","Kjell Njaa"}                  | {Landa,Hiro,Kata,Kama}
 {"Anne Hol","Liv Paasche","Odd Olsen","Truls Lyche","Hilde Wang"}   | {Hiro,Landa,Chico,Vaade,Braga}
 {"Truls Lyche","Tor Fjeld","Live Brog","Frank Vatn","Hauk Storm"}   | {Prann,Braga,Sol,Taake,Hafn}
 {"Anne Hol","Tor Fjeld","Helge Nes","Kristin Aase"}                 | {Landa,Hiro,Sol,Kama}
 {"Truls Lyche","Einar Aas","Helge Nes","Kristin Aase","Halvor Bø"}  | {Braga,Prann,Throw,Kama,Grafi}
 {"Truls Lyche","Tor Fjeld","Helge Nes","Hilde Wang"}                | {Prann,Braga,Sol,Kama}
 {"Anne Hol","Liv Paasche","Rolf Numme"}                             | {Hiro,Landa,Chico}
 {"Truls Lyche","Einar Aas","Nina Owe","Odd Olsen"}                  | {Braga,Prann,Throw,Byde}
 {"Truls Lyche","Einar Aas","Helge Nes","Anette Bøle"}               | {Braga,Prann,Throw,Kama}
 {"Frank Vatn","Stein Hald","Rolf Numme","Helge Nes","Anette Bøle"}  | {Hafn,Forsk,Bolk,Kata,Kama}
 {"Anne Hol","Tor Fjeld","Live Brog","Frank Vatn","Ulv Berg"}        | {Landa,Hiro,Sol,Taake,Forsk}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Einar Dal"}                 | {Forsk,Hafn,Bonn,Sol}
 {"Frank Vatn","Stein Hald","Rolf Numme","Helge Nes","Kristin Aase"} | {Hafn,Forsk,Bolk,Kata,Kama}
 {"Frank Vatn","Hauk Storm","Tor Fjeld"}                             | {Forsk,Hafn,Bonn}
 {"Anne Hol","Liv Paasche","Ulv Berg"}                               | {Hiro,Landa,Chico}
 {"Anne Hol","Tor Fjeld","Einar Dal"}                                | {Landa,Hiro,Sol}
 {"Truls Lyche","Tor Fjeld","Live Brog","Frank Vatn","Stein Hald"}   | {Prann,Braga,Sol,Taake,Forsk}
 {"Truls Lyche","Tor Fjeld","Helge Nes","Kristin Aase","Anne Hol"}   | {Prann,Braga,Sol,Kama,Grafi}
 {"Frank Vatn","Stein Hald","Rolf Numme","Anne Hol","Tor Fjeld"}     | {Hafn,Forsk,Bolk,Kata,Hiro}
 {"Anne Hol","Liv Paasche","Rolf Numme","Helge Nes","Hilde Wang"}    | {Hiro,Landa,Chico,Kata,Kama}
 {"Frank Vatn","Stein Hald","Guro Dale"}                             | {Hafn,Forsk,Bolk}
 {"Anne Hol","Tor Fjeld","Helge Nes"}                                | {Landa,Hiro,Sol}
 {"Anne Hol","Tor Fjeld","Helge Nes","Kjell Njaa"}                   | {Landa,Hiro,Sol,Kama}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Helge Nes","Kjell Njaa"}    | {Forsk,Hafn,Bonn,Sol,Kama}
 {"Frank Vatn","Stein Hald","Rolf Numme","Anne Hol","Liv Paasche"}   | {Hafn,Forsk,Bolk,Kata,Landa}
 {"Anne Hol","Liv Paasche","Odd Olsen","Truls Lyche","Tor Fjeld"}    | {Hiro,Landa,Chico,Vaade,Braga}
 {"Truls Lyche","Tor Fjeld","Helge Nes","Anette Bøle"}               | {Prann,Braga,Sol,Kama}
 {"Anne Hol","Tor Fjeld","Live Brog","Frank Vatn","Stein Hald"}      | {Landa,Hiro,Sol,Taake,Forsk}
 {"Anne Hol","Liv Paasche","Odd Olsen","Truls Lyche"}                | {Hiro,Landa,Chico,Vaade}
 {"Truls Lyche","Tor Fjeld","Helge Nes","Kristin Aase"}              | {Prann,Braga,Sol,Kama}
 {"Anne Hol","Rolf Numme","Helge Nes","Anette Bøle"}                 | {Landa,Hiro,Kata,Kama}
 {"Truls Lyche","Tor Fjeld","Live Brog","Frank Vatn"}                | {Prann,Braga,Sol,Taake}
 {"Frank Vatn","Stein Hald","Rolf Numme","Helge Nes","Hilde Wang"}   | {Hafn,Forsk,Bolk,Kata,Kama}
 {"Anne Hol","Tor Fjeld","Helge Nes","Kristin Aase","Halvor Bø"}     | {Landa,Hiro,Sol,Kama,Grafi}
 {"Anne Hol","Tor Fjeld","Helge Nes","Anette Bøle"}                  | {Landa,Hiro,Sol,Kama}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Helge Nes","Anette Bøle"}   | {Forsk,Hafn,Bonn,Sol,Kama}
 {"Anne Hol","Tor Fjeld","Live Brog","Frank Vatn","Halvor Bø"}       | {Landa,Hiro,Sol,Taake,Hafn}
 {"Anne Hol","Liv Paasche","Rolf Numme","Helge Nes"}                 | {Hiro,Landa,Chico,Kata}
 {"Anne Hol","Rolf Numme","Helge Nes","Kristin Aase","Halvor Bø"}    | {Landa,Hiro,Kata,Kama,Grafi}
 {"Truls Lyche","Nina Owe","Kjell Njaa"}                             | {Braga,Prann,Byde}
 {"Truls Lyche","Einar Aas","Helge Nes","Kristin Aase","Anne Hol"}   | {Braga,Prann,Throw,Kama,Grafi}
 {"Truls Lyche","Einar Aas","Helge Nes"}                             | {Braga,Prann,Throw}
 {"Truls Lyche","Einar Aas","Helge Nes","Kjell Njaa"}                | {Braga,Prann,Throw,Kama}
 {"Frank Vatn","Stein Hald","Rolf Numme","Helge Nes"}                | {Hafn,Forsk,Bolk,Kata}
 {"Anne Hol","Rolf Numme","Helge Nes","Kristin Aase"}                | {Landa,Hiro,Kata,Kama}
 {"Anne Hol","Rolf Numme","Helge Nes"}                               | {Landa,Hiro,Kata}
 {"Truls Lyche","Einar Aas","Nina Owe","Kjell Njaa"}                 | {Braga,Prann,Throw,Byde}
 {"Anne Hol","Liv Paasche","Rolf Numme","Helge Nes","Kristin Aase"}  | {Hiro,Landa,Chico,Kata,Kama}
 {"Truls Lyche","Tor Fjeld","Einar Dal"}                             | {Prann,Braga,Sol}
 {"Anne Hol","Liv Paasche","Rolf Numme","Helge Nes","Anette Bøle"}   | {Hiro,Landa,Chico,Kata,Kama}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Live Brog"}                 | {Forsk,Hafn,Bonn,Sol}
 {"Anne Hol","Tor Fjeld","Live Brog"}                                | {Landa,Hiro,Sol}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Helge Nes","Kristin Aase"}  | {Forsk,Hafn,Bonn,Sol,Kama}
 {"Anne Hol","Tor Fjeld","Live Brog","Frank Vatn","Hauk Storm"}      | {Landa,Hiro,Sol,Taake,Hafn}
 {"Frank Vatn","Hauk Storm","Live Brog"}                             | {Forsk,Hafn,Bonn}
 {"Truls Lyche","Tor Fjeld","Helge Nes"}                             | {Prann,Braga,Sol}
 {"Anne Hol","Tor Fjeld","Live Brog","Frank Vatn"}                   | {Landa,Hiro,Sol,Taake}
 {"Truls Lyche","Tor Fjeld","Helge Nes","Kjell Njaa"}                | {Prann,Braga,Sol,Kama}
 {"Anne Hol","Liv Paasche","Odd Olsen","Truls Lyche","Einar Aas"}    | {Hiro,Landa,Chico,Vaade,Prann}
 {"Truls Lyche","Einar Aas","Ulv Berg"}                              | {Braga,Prann,Throw}
 {"Anne Hol","Rolf Numme","Helge Nes","Hilde Wang"}                  | {Landa,Hiro,Kata,Kama}
 {"Truls Lyche","Einar Aas","Helge Nes","Hilde Wang"}                | {Braga,Prann,Throw,Kama}
 {"Anne Hol","Liv Paasche","Odd Olsen","Truls Lyche","Nina Owe"}     | {Hiro,Landa,Chico,Vaade,Prann}
 {"Frank Vatn","Hauk Storm","Tor Fjeld","Helge Nes","Hilde Wang"}    | {Forsk,Hafn,Bonn,Sol,Kama}
 {"Anne Hol","Tor Fjeld","Helge Nes","Hilde Wang"}                   | {Landa,Hiro,Sol,Kama}
 {"Truls Lyche","Tor Fjeld","Live Brog","Frank Vatn","Ulv Berg"}     | {Prann,Braga,Sol,Taake,Forsk}
 {"Anne Hol","Liv Paasche","Rolf Numme","Helge Nes","Kjell Njaa"}    | {Hiro,Landa,Chico,Kata,Kama}
(78 rows)
**/
