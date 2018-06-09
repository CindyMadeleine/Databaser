WITH Recursive PeopleToPeople(pf, ps, person, selskap) as (
	SELECT	s1.person, s2.person, array[s1.person], array[s2.selskap]
	FROM	Selskapsinfo s1, Selskapsinfo s2
	WHERE	s1.person = 'Olav Thorsen'
		and s1.selskap = s2.selskap
		and s1.person <> s2.person
UNION ALL

SELECT 	p.pf, s2.person, p.person || s2.person, p.selskap || s2.selskap
FROM	PeopleToPeople p, Selskapsinfo s1, Selskapsinfo s2
WHERE 	p.ps != 'Celina Monsen'
	and p.ps = s1.person
	and s1.selskap = s2.selskap
	and s1.person != s2.person
	and s2.selskap <> all(p.selskap)
	and s2.person <> all(p.selskap)
	
)

SELECT min(array_length(p.person,1)) as nrPersons
FROM PeopleToPeople p
WHERE 'Celina Monsen' = p.ps;


--	RESULTAT
--	 nrpersons 
--	-----------
--	         2
--	(1 row)

