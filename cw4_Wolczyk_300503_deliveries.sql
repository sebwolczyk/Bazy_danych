CREATE SCHEMA deliveries;

CREATE TABLE deliveries.produkt(
	ID_produktu VARCHAR(5) NOT NULL PRIMARY KEY,
	Nazwa VARCHAR(50) NOT NULL,
	Cena_netto MONEY,
	Cena_brutto MONEY);

CREATE TABLE deliveries.kod_pocztowy(
	Kod_Pocztowy VARCHAR(6) NOT NULL PRIMARY KEY,
	Miasto VARCHAR(50) NOT NULL);

CREATE TABLE deliveries.dostawca(
	ID_Dostawcy VARCHAR(20) NOT NULL PRIMARY KEY,
	Nazwa VARCHAR(50) NOT NULL,
	Kod_Pocztowy VARCHAR(6),
	Ulica VARCHAR(50),
	Numer VARCHAR(10),
	FOREIGN KEY (Kod_Pocztowy) REFERENCES deliveries.kod_pocztowy(Kod_Pocztowy));

CREATE TABLE deliveries.dostawa(
	ID_Dostawy SMALLINT NOT NULL PRIMARY KEY,
	ID_Produktu VARCHAR(5) NOT NULL,
	ID_Dostawcy VARCHAR(20) NOT NULL,
	FOREIGN KEY (ID_Produktu) REFERENCES deliveries.produkt(ID_Produktu),
	FOREIGN KEY (ID_Dostawcy) REFERENCES deliveries.dostawca(ID_Dostawcy));

INSERT INTO deliveries.produkt VALUES('P132','Makaron Nitki',130.00,150.00);
INSERT INTO deliveries.produkt VALUES('P436','Keczup Pikantny',200.00,220.00);
INSERT INTO deliveries.produkt VALUES('P723','Sos Pomidorowy',89.00,110.00);

INSERT INTO deliveries.kod_pocztowy VALUES('31-435','Kraków');
INSERT INTO deliveries.kod_pocztowy VALUES('04-242','Lublin');
INSERT INTO deliveries.kod_pocztowy VALUES('31-342','Kraków');
INSERT INTO deliveries.kod_pocztowy VALUES('30-243','Tarnów');
INSERT INTO deliveries.kod_pocztowy VALUES('35-434','Nowy Targ');

INSERT INTO deliveries.dostawca VALUES('MakPol','Makarony Polskie','31-435','Turystyczna','40');
INSERT INTO deliveries.dostawca VALUES('LubMak','Lubelski Makaron','04-242','Piłsudskiego','332a');
INSERT INTO deliveries.dostawca VALUES('PolPrze','Polskie Przetwory','31-342','Wojska Polskiego','44a');
INSERT INTO deliveries.dostawca VALUES('PrzePom','Przetwory Pomidorowe','30-243','Rolnicza','22/4');
INSERT INTO deliveries.dostawca VALUES('MałSma','Małopolskie Smaki','35-434','Mickiewicza','223/77');

INSERT INTO deliveries.dostawa VALUES(1,'P132','MakPol');
INSERT INTO deliveries.dostawa VALUES(2,'P132','LubMak');
INSERT INTO deliveries.dostawa VALUES(3,'P436','PolPrze');
INSERT INTO deliveries.dostawa VALUES(4,'P436','PrzePom');
INSERT INTO deliveries.dostawa VALUES(5,'P723','PolPrze');
INSERT INTO deliveries.dostawa VALUES(6,'P723','MałSma');

--SELECT * FROM deliveries.produkt;
--SELECT * FROM deliveries.kod_pocztowy;
--SELECT * FROM deliveries.dostawca;
--SELECT * FROM deliveries.dostawa;