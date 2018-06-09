--Oppgave 5a

--Skriv ut serietittel, produksjonsår og antall episoder for de yngste TV-
--seriene i filmdatabasen (dvs. de med størst verdi i attributtetfirstprod-year

SELECT s.maintitle, s.firstprodyear, count(e.episodeid) as nrEpisodes
FROM Episode e RIGHT OUTER JOIN Series s ON e.seriesid = s.seriesid
WHERE s.firstprodyear = (	SELECT	max(firstprodyear)
				FROM	Series)
GROUP BY s.maintitle, s.firstprodyear;

-- Oppgave 5b

--Lag en liste over alle deltakelsestyper og hvor mange personer som pro-
--sentvis faller inn under hver deltakelsestype. Listen skal være sortert
--etter fallende prosentpoeng. Ta med ett siffer etter desimaltegnet. 

SELECT fp.parttype, (round((CAST(count(fp.parttype)as numeric)/ i.totalPersons * 100 ), 1))as PersonsInParts
FROM filmparticipation fp, (	SELECT count(fp.parttype)as totalPersons 
				FROM 	filmparticipation fp) i
GROUP BY fp.parttype, i.totalPersons
ORDER BY PersonsInParts DESC;

--Oppgave 5c
--	Finn for- og etternavn på alle mannlige regissører som har laget mer enn 50 filmer med kvinnelige skuespillere

/**CREATE VIEW filmerMedMannligeRegissører as 
SELECT		distinct fp.filmid, p.personid as regissor 
From		Person p
INNER JOIN	Filmparticipation fp
ON		p.personid = fp.personid
WHERE 		gender = 'M'
		and parttype = 'director';

CREATE VIEW filmerMedKvinneligeSkuespillere as 
SELECT		distinct p.personid as skuespiller, fp.filmid
FROM		Person p
NATURAL JOIN 	Filmparticipation fp
WHERE		parttype = 'cast' 
and		gender = 'F';


SELECT 		*
FROM		filmerMedMannligeRegissører f
INNER JOIN	filmerMedKvinneligeSkuespillere fm
ON		fm.filmid = f.filmid 
WHERE		f.filmid NOT IN( 		SELECT 		f1.filmid
						FROM		filmerMedMannligeRegissører f1
						INNER JOIN	filmerMedKvinneligeSkuespillere fm1
						ON		fm1.filmid = f1.filmid 
						WHERE		f1.regissor = f.regissor 
								and f1.filmid NOT IN (	SELECT		fm.filmid
											FROM		filmerMedKvinneligeSkuespillere fm2
											WHERE		fm1.skuespiller = fm2.skuespiller
													and f.regissor = f1.regissor));  **/

SELECT		p.firstname, p.lastname
From		Person p
INNER JOIN	Filmparticipation fp
ON		p.personid = fp.personid
WHERE 		gender = 'M'
		and parttype = 'director'
		and fp.filmid IN ( 	SELECT		fp1.filmid
					FROM		Person p
					NATURAL JOIN 	Filmparticipation fp1
					WHERE		parttype = 'cast' 
					and		gender = 'F')
GROUP BY	p.firstname, p.lastname
HAVING 		count(p.personid) > 50;


-- Får ut 25, men det skal være mindre enn 10 stykker.

/***

OPPGAVE 5A:

    maintitle            | firstprodyear | nrepisodes 
--------------------------------+---------------+------------
 Chez Maupassant                |          2007 |          1
 Tropiques amers                |          2007 |          0
 Mystère                        |          2007 |          0
 Wilkommen bei...               |          2007 |          0
 1 contre 100                   |          2007 |          0
 Confidences                    |          2007 |          0
 Clan Pasquier, Le              |          2007 |          0
 K11 Journey, The               |          2007 |          0
 Nos enfants chéris - la série  |          2007 |          0
 Camarades, Les                 |          2007 |          0
 Zoom Europa                    |          2007 |          0
 Hénaut président               |          2007 |          0
 Soaperette                     |          2007 |          0
 Dame d'Izieu, La               |          2007 |          0
 Greco                          |          2007 |          0
 J'ai une question à vous poser |          2007 |          0
 War and Peace                  |          2007 |          0
 Un flic                        |          2007 |          0
 Oubliées, Les                  |          2007 |          0
 Lance de la destinée, La       |          2007 |          0
 Valérian et Laureline          |          2007 |          0
 Légende des trois clés, La     |          2007 |          0
(22 rows)

     parttype     | personsinparts 
------------------+----------------
 cast             |           70.6
 writer           |            8.9
 director         |            6.8
 producer         |            5.7
 composer         |            3.4
 editor           |            3.3
 costume designer |            1.5
(7 rows)



  firstname  |    lastname     
-------------+-----------------
 Léonce      | Perret
 Alain       | Payet
 René        | Leprince
 André       | Berthomieu
 Claude      | Chabrol
 Marcel      | L'Herbier
 Jesus       | Franco
 Albert      | Capellani
 René        | Hervil
 Georges     | Monca
             | Christian-Jaque
 Jean-Luc    | Godard
 Jean        | Durand
 Julien      | Duvivier
 Pierre      | Sabbagh
 Jean-Pierre | Mocky
 Jean        | Boyer
 Gaston      | Roudès
 Henri       | Pouctal
 André       | Hugon
 Gilles      | Grangier
 Yves-André  | Hubert
 Romeo       | Bosetti
 Edouard     | Molinaro
 Georges     | Denola
(25 rows)



**/
