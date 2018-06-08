CREATE TABLE Movie(
	regnr varchar(40) primary key,
	forlag varchar(20),
	aldersårsgrense int not null,
	overtittel varchar(40) not null,
	undertittel varchar(40)

);

CREATE TABLE Worker(
	id varchar(25) primary key,
	fødselsdato date not null,
	fornavn varchar(20) not null,
	etternavn varchar(20),
	artistnavn varchar(20),
	land varchar(20) not null,
	check(etternavn is not null or artistnavn is not null),
	unique(fornavn, etternavn, artistnavn)
	
);

CREATE TABLE Function(
	navn varchar(40) primary key
);

CREATE TABLE WorkerHasFunctionInMovie(
	ansattid varchar(25) not null references Worker(id),
	regnr varchar(40)not null references Movie(regnr),
	navn varchar(40) not null references Function(navn),
	unique(regnr, ansattid),
	unique(ansattid, regnr, navn)
);


CREATE TABLE Soundtrack(
	nr varchar(20) primary key,
	sangid int,
	språk varchar(20),
	check(sangid is not null or språk is not null)
);

CREATE TABLE Scene(
	nr varchar(25) primary key,
	regnr varchar(40) not null references Movie(regnr),
	lydspornr varchar(20) references Soundtrack(nr)
);

CREATE TABLE Picture(
	id int primary key,
	dato date not null,
	scenenr varchar(25) not null references Scene(nr),
	ansattid varchar(25) not null references Worker(id),
	handling varchar(25) not null
);


INSERT INTO Movie(regnr, aldersårsgrense, overtittel, forlag)
VALUES ('AR1', '13', 'Amazing Razë́');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel)
VALUES('AFD1', '15', 'Anne Franks dagbok');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, undertittel)
VALUES('TLOTR2', '18', 'The Lord of the rings', 'Two towers');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, undertittel, forlag)
VALUES('TBK1', '12', 'The blue kite','Lan feng zheng', 'PG');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, forlag)
VALUES('CD1', '18', 'Code geass', 'Atomic monkey');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, forlag)
VALUES('TBONTB1', '15', 'To be or not to be', 'United Artist');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, forlag)
VALUES('HP1', '6', 'Harry Potter', 'Warner Bros');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, forlag)
VALUES('TLOTR1', '6', 'the lord of the rings', 'New line Cinema');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel, forlag)
VALUES('RE1', '6', 'Reveenka', 'Ivo Caprino');

INSERT INTO Movie(regnr, aldersårsgrense, overtittel)
VALUES('B1', '6', 'Baazigar');

INSERT INTO Movie(regnr, overtittel, forlag, aldersårsgrense)
VALUES('TF1', 'The fosters', '15');

INSERT INTO Movie(regnr, overtittel, forlag, aldersårsgrense)
VALUES('TWOVP', 'The wizards of waverly place', 'Disney','alle');

INSERT INTO Movie(regnr, overtittel, aldersårsgrense)
VALUES('TKK', 'The karate kid','7');

INSERT INTO Movie(regnr, overtittel, undertittel, aldersårsgrense)
VALUES('TSP', 'The swanprincess', 'A royal family tale', '3');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES ('1', '1960-05-03', 'Lü', 'Liping', 'Kina');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUES ('2', '1974-12-27', 'Fumiko', 'Orikasa', 'Japan');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUES ('3', '1887-08-27', 'Jimmy', 'Finlayson', 'Skottland');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES ('4', '1990-04-15', 'Emma', 'Watson', 'England');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUES('5', '1960-02-10', 'Peter', 'Jackson', 'New Zealand');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES('7', '1812-01-15', 'Peter', 'Christian Asbjørnsen', 'Norge');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES('8', '1813-04-22', 'Jørgen', 'Moe', 'Norge');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUES('9', '1972-07-08', 'Shilpa','Shetty', 'India');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUES('1O', '1972-07-08', 'Hovard','Shore', 'Canada');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES('11', '1967-05-31', 'Phil','Keodan', 'USA');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES('12', '1990-02-12', 'Ellie','Freud', 'Tyskland');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES('13', '1994-08-17', 'Taisa', 'Farminga', 'Sør-Amerika');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUES('14', '1994-04-01', 'Justin', 'Bieber', 'Canada');

/*Kjente musikere*/

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUES('6', '1915-07-04', 'Edit', 'Piaf', 'Frankrike');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUE('15', '1969-12-04', 'Shawn', 'Jay-Z', 'USA');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUE('16', '1932-02-08', 'John Tower', 'Williams', 'USA');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUE('17', '1952-11-18', 'Carter', 'Burwell', 'USA');

INSERT INTO Worker(id, fødselsdato, fornavn, etternavn, land)
VALUE('18', '1932-02-08', 'Charlie', 'Clauser', 'USA');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUE('19', '1932-02-08', 'Quincy', 'Delight Jones', 'USA');

INSERT INTO Worker(id, fødselsdato, fornavn, artistnavn, land)
VALUE('20', '1843-06-15', 'Edvard', 'Grieg', 'Norge');

INSERT INTO Function
VALUES ('skuespiller');

INSERT INTO Function
VALUES ('fotograf');

INSERT INTO Function
VALUES ('musiker');

INSERT INTO Function
VALUES ('forfatter');

/*Musikere*/
INSERT INTO WorkerHasFunctionInMovie
VALUES('6', 'AFD1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('14', 'B1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('16', 'TLOTR1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('16', 'TLOTR2', 'musiker');

INSERT INTO WorkerHa;sFunctionInMovie
VALUES('20','RE1', 'musiker')

INSERT INTO WorkerHasFunctionInMovie
VALUES('17','HP1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('18', 'CD1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('19','TBONTB1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('15', 'TBK1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('18', 'TF1', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('14', 'TWOVP', 'musiker');

INSERT INTO WorkerHasFunctionInMovie
VALUES('17', 'TKK', 'musiker');


/*skuespillere*/
INSERT INTO WorkerHasFunctionInMovie
VALUES('18', 'AR1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('9', 'B1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('8', 'RE1', 'forfatter');

INSERT INTO WorkerHasFunctionInMovie
VALUES('7','RE1', 'forfatter');

INSERT INTO WorkerHasFunctionInMovie
VALUES('4','HP1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('2','CD1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('3','TBONTB1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('1','TBK1', 'skuespiller');

/*Data for å teste hvem som har mest filmer*/
INSERT INTO Movie(regnr, overtittel, undertittel, forlag)
VALUES('R1', 'RIO', 'Renato Falcão');

INSERT INTO WorkerHasFunctionInMovie
VALUES('13','R1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('13','TF1', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('13','TWOVP', 'skuespiller');

INSERT INTO WorkerHasFunctionInMovie
VALUES('14', 'TKK', 'skuespiller');


INSERT INTO WorkerHasFunctionInMovie
VALUES('14', 'TSP', 'skuespiller');

/*Siden fotografer preferer å være anonyme (Hint hint!)*/
INSERT INTO WorkerHasFunctionInMovie
VALUES('8', 'TBONTB1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('3', 'RE1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('9', 'CD1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('2', 'TBK1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('11', 'AR1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('1', 'B1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('12', 'TLOFR1', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('12', 'TLOFR2', 'fotograf');

INSERT INTO WorkerHasFunctionInMovie
VALUES('12', 'HR1', 'fotograf');

INSERT INTO Soundtrack(nr, språk)
VALUES(1, 'Engelsk');

INSERT INTO Soundtrack(nr, språk)
VALUES(2, 'Portigisisk');

INSERT INTO Soundtrack(nr, språk)
VALUES(3, 'Macedonisk');

INSERT INTO Soundtrack(nr, språk)
VALUES(4, 'Svensk');

INSERT INTO Soundtrack(nr, språk)
VALUES(5, 'Dansk');

INSERT INTO Soundtrack(nr, språk)
VALUES(6, 'Norsk');

INSERT INTO Soundtrack(nr, språk)
VALUES(7, 'Fransk');

INSERT INTO Soundtrack(nr, språk)
VALUES(8, 'Litauensk');

INSERT INTO Soundtrack(nr, språk)
VALUES(9, 'Amerikansk');

INSERT INTO Soundtrack(nr, språk)
VALUES(10, 'Japansk');

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('AR1:1', 'AR1', 1);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('AFD1:1', 'AFD1', 2);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('TLOTR2:1', 'TLOTR2', 3);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('TBK1:1', 'TBK1', 4);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('CD1:1', 'CD1', 5);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('TBONTB1:1', 'TBONTB1', 6);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('HP1:1', 'HP1', 7);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('TLOTR1:1', 'TLOTR1', 8);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('RE1:1', 'RE1', 9);

INSERT INTO Scene(nr, regnr, lydspornr)
VALUES ('B1:1', 'B1', 10);

INSERT INTO Scene(nr, regnr)
VALUES('AR1:2', 'AR1');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('1', '2015-30-15', 'AR1:1', '11', 'dialog');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('2', '1959-04-17', 'AFD1:1', '6', 'NSDAP');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('3', '1973-11-11', 'TBK1:1', '2', 'politimenn møte');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('4', '2006-10-50', 'CD1:1', '9', 'flørting');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('5', '1942-04-60', 'TBONTB1:1', '8', 'politimenn møte');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('6', '2001-11-04', 'HP1:1', '12', 'tryllestavkamp');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('7', '2011-12-19', 'TLOTR1:1', '12', 'dialog');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('8', '1962-01-01', 'RE1:1', '3', 'frieri');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('9', '1993-11-12', 'B1:1', '1', 'bli forelsket');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('10', '2015-30-15', 'AR1:2', '11', 'løping');

INSERT INTO Picture(id, dato, scenenr, ansattid, handling)
VALUES('11', '2003-12-19', 'TLOTR2:1', '12', 'dialog');

/*Velger å endre dato fra 1884 til 2015 da dette er mer realistisk*/
SELECT w.fornavn, w.etternavn, w.artistnavn
FROM Worker w, WorkerHasFunctionInMovie whim, Picture p, Movie m, Scene s
WHERE w.id = whim.ansattid and whim.navn = 'skuespiller' and m.overtittel = 'Amazing Raze' and p.dato < '2015-01-01' and p.dato > '2015-01-01'
and p.scenenr = s.nr and s.regnr = m.regnr;

SELECT forlag
FROM Movie
WHERE aldersårsgrense = 15;

SELECT DISTINCT handling
FROM Picture
WHERE handling is not null;

SELECT whfim.navn
FROM WorkerHasFunctionInMovie whfim, Worker w
WHERE whfim.ansattid = w.id and w.fødselsdato > '1990-01-01' and w.fødselsdato < '1990-12-31';

SELECT DISTINCT p.handling, m.overtittel, m.undertittel
FROM Picture p, Movie m
WHERE handling is not null;

SELECT w.fornavn, w.etternavn, w.artistnavn
FROM Worker w, WorkerHasFunctionInMovie whim
WHERE (w.land = 'USA' or w.land = 'Sør-Amerika') and whim.navn = 'komponist' and whim.ansattid = w.id;

SELECT regnr
FROM Movie 
WHERE overtittel is not null and undertittel is null;

/*Spørsmålet:hvem tok bildene av Anne Franks dagbok*/
SELECT w.fornavn, w.etternavn, w.artistnavn
FROM Worker w, Picture p, Movie m, WorkerHasFunctionInMovie whim
WHERE m.overtittel = 'Anne Franks Dagbok' and whim.regnr = m.regnr and whim.ansattid = p.ansattid;

/*Får feil på group by fornavn, etternavn og artistnavn*/
CREATE VIEW A(fornavn, etternavn, artistnavn, antallFilmer) as 
	SELECT w.fornavn, w.etternavn, w.artistnavn, count(*)
	FROM Worker w, Picture p, Scene s, Movie m, WorkerHasFunctionInMovie whim
	WHERE p.dato < '1994-01-01' and p.dato > '1994-12-31' and p.scenenr = s.nr and  m.regnr = s.regnr and w.id = whim.ansattid and whim.regnr = m.regnr and whim.navn = 'skuespiller'
	GROUP BY w.fornavn, w.etternavn, w.artistnavn;


/*Forstår ikke helt hvorfor jeg får feil på max(antallFilmer)*/
SELECT fornavn, artistnavn, etternavn
FROM A
HAVING max(antallfilmer);

