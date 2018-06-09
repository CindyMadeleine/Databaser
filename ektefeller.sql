-- finn ved hjelp av en SQL-spørring navn og adresse til alle personer som
-- ved en vielse i perioden 2000–2010 skiftet etternavn til et navn som er
-- forskjellig fra ektefellens.

CREATE VIEW NavnBytteUliktEktefelle(fnr, dato) as 
SELECT fnr1, dato
FROM Ekteskap e
INNER JOIN Navnskifte ns
ON e.fnr1 = ns.fnr and e.dato = ns.dato
WHERE etternavn != etternavn2
UNION ALL
SELECT fnr2, dato
FROM Ekteskap e
INNER JOIN Navnskifte ns
ON e.fnr2 = ns.fnr and e.dato = ns.dato
WHERE ns.etternavn != e.etternavn1;

SELECT p.fornavn, p.etternavn, p.adresse
FROM Person p
NATURAL JOIN NavnBytteUliktEktefelle nbue
WHERE Year(e.dato) >= '2000'
	and Year(e.dato) <= '2010';

--Finn ved hjelp av en SQL-spørring navn og adresse til alle personer som
--ved en vielse har byttet navn med ektefellen. (Ektefeller med samme
--navn skal ikke være med.


CREATE VIEW NavnBytteMedEktefelle(fnr, dato) as
SELECT fnr1, dato
FROM Ekteskap e
INNER JOIN Navnskifte ns
ON e.dato = ns.dato and ns.fnr = e.fnr2
WHERE ns.etternavn = e.etternavn1;
UNION ALL
SELECT fnr2, dato
FROM Ekteskap e
INNER JOIN Navnskifte ns
ON e.dato = ns.dato and ns.fnr = e.fnr1
WHERE ns.etternavn = e.etternavn2;

SELECT p.fornavn, p.etternavn, p.adresse
FROM Person p
NATURAL JOIN NavnBytteMedEktefelle nbe;
