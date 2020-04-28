CREATE SCHEMA dentists;

CREATE TABLE dentists.pracownik(
	ID_pracownika VARCHAR(5) NOT NULL PRIMARY KEY,
	Imię VARCHAR(30) NOT NULL,
	Nazwisko VARCHAR(50) NOT NULL);

CREATE TABLE dentists.pacjent(
	ID_pacjenta VARCHAR(5) NOT NULL PRIMARY KEY,
	Imię VARCHAR(30) NOT NULL,
	Nazwisko VARCHAR(50) NOT NULL);

CREATE TABLE dentists.zabieg(
	ID_zabiegu VARCHAR(5) NOT NULL PRIMARY KEY,
	Nazwa VARCHAR(50));

CREATE TABLE dentists.wizyta(
	ID_wizyty SMALLINT NOT NULL PRIMARY KEY,
	ID_pacjenta VARCHAR(5),
	ID_pracownika VARCHAR(5),
	ID_zabiegu VARCHAR(5),
	Data DATE,
	Godzina TIME,
	FOREIGN KEY (ID_pacjenta) REFERENCES dentists.pacjent(ID_pacjenta),
	FOREIGN KEY (ID_pracownika) REFERENCES dentists.pracownik(ID_pracownika),
	FOREIGN KEY (ID_zabiegu) REFERENCES dentists.zabieg(ID_zabiegu));
	
INSERT INTO dentists.pracownik VALUES('S1011','Maria','Nowak');
INSERT INTO dentists.pracownik VALUES('S1024','Jan','Kowalski');
INSERT INTO dentists.pracownik VALUES('S1034','Marek','Potocki');
INSERT INTO dentists.pracownik VALUES('S1045','Anna','Jabłońska');
	
INSERT INTO dentists.pacjent VALUES('P100','Anna','Jeleń');
INSERT INTO dentists.pacjent VALUES('P105','Jarosław','Nicpoń');
INSERT INTO dentists.pacjent VALUES('P108','Joanna','Nosek');
INSERT INTO dentists.pacjent VALUES('P120','Anna','Kałuża');
INSERT INTO dentists.pacjent VALUES('P123','Olga','Nowacka');
INSERT INTO dentists.pacjent VALUES('P130','Jerzy','Lis');
	
INSERT INTO dentists.zabieg VALUES('Z496','Lakowanie');
INSERT INTO dentists.zabieg VALUES('Z500','Borowanie');
INSERT INTO dentists.zabieg VALUES('Z503','Usuwanie kamienia');
	
INSERT INTO dentists.wizyta VALUES(1,'P100','S1011','Z500','2020-03-12','10:00');
INSERT INTO dentists.wizyta VALUES(2,'P105','S1011','Z496','2020-03-12','13:00');
INSERT INTO dentists.wizyta VALUES(3,'P123','S1034','Z503','2020-03-12','15:00');
INSERT INTO dentists.wizyta VALUES(4,'P108','S1011','Z500','2020-03-14','10:00');
INSERT INTO dentists.wizyta VALUES(5,'P108','S1024','Z503','2020-03-16','17:00');
INSERT INTO dentists.wizyta VALUES(6,'P120','S1045','Z500','2020-03-18','09:00');
INSERT INTO dentists.wizyta VALUES(7,'P130','S1034','Z496','2020-03-20','08:00');
	
--SELECT * FROM dentists.pracownik;
--SELECT * FROM dentists.pacjent;
--SELECT * FROM dentists.zabieg;
--SELECT * FROM dentists.wizyta;