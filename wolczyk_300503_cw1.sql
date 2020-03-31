CREATE DATABASE database_1;
CREATE SCHEMA firma;

CREATE TABLE firma.pracownicy(
id_pracownika INT PRIMARY KEY NOT NULL,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100),
telefon VARCHAR(12));

CREATE TABLE firma.godziny(
id_godziny INT PRIMARY KEY NOT NULL,
data DATE,
liczba_godzin INT,
id_pracownika INT NOT NULL);

CREATE TABLE firma.pensje(
id_pensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(30),
kwota MONEY NOT NULL,
id_premii INT);

CREATE TABLE firma.premie(
id_premii INT PRIMARY KEY NOT NULL,
rodzaj VARCHAR(100),
kwota MONEY NOT NULL);

ALTER TABLE firma.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES firma.pracownicy(id_pracownika);

ALTER TABLE firma.pensje
ADD FOREIGN KEY (id_premii)
REFERENCES firma.premie(id_premii);

INSERT INTO firma.pracownicy VALUES(1,'Jan','Nowak','Kraków ul. Rynek 1','+48667006123');
INSERT INTO firma.pracownicy VALUES(2,'Jan','Wolski','Kraków ul. Rynek 1','+48652489633');
INSERT INTO firma.pracownicy VALUES(3,'Anna','Wolska','Kraków ul. Rynek 1','+48963636589');
INSERT INTO firma.pracownicy VALUES(4,'Tomasz','Nowy','Kraków ul. Rynek 15','+48585869635');
INSERT INTO firma.pracownicy VALUES(5,'Piotr','Stary','Kraków ul. Rynek 17','+48752569856');
INSERT INTO firma.pracownicy VALUES(6,'Anita','Kartka','Kraków ul. Letnia 1','+48752452585');
INSERT INTO firma.pracownicy VALUES(7,'Roman','Kartka','Kraków ul. Rybia 1','+48963999852');
INSERT INTO firma.pracownicy VALUES(8,'Jan','Pieczeń','Kraków ul. Rybia 4','+48523005609');
INSERT INTO firma.pracownicy VALUES(9,'Stefan','Piec','Kraków ul. Jasna 155','+48990063589');
INSERT INTO firma.pracownicy VALUES(10,'Karolina','Piec','Kraków ul. Ciemna 151B','+48752365985');

INSERT INTO firma.godziny VALUES(1,'2021-09-13',8,1);
INSERT INTO firma.godziny VALUES(2,'2021-09-13',8,2);
INSERT INTO firma.godziny VALUES(3,'2021-09-13',4,3);
INSERT INTO firma.godziny VALUES(4,'2021-09-13',8,4);
INSERT INTO firma.godziny VALUES(5,'2021-09-13',11,5);
INSERT INTO firma.godziny VALUES(6,'2021-09-13',10,6);
INSERT INTO firma.godziny VALUES(7,'2021-09-13',5,7);
INSERT INTO firma.godziny VALUES(8,'2021-09-13',8,8);
INSERT INTO firma.godziny VALUES(9,'2021-09-13',8,9);
INSERT INTO firma.godziny VALUES(10,'2021-09-13',10,10);

INSERT INTO firma.premie VALUES(1,'Brak',0.00);
INSERT INTO firma.premie VALUES(2,'Premia za Staż',100.00);
INSERT INTO firma.premie VALUES(3,'Premia za wieloletność',120.00);
INSERT INTO firma.premie VALUES(4,'Praca w weekendy',50.00);
INSERT INTO firma.premie VALUES(5,'Praca w święta',150.00);
INSERT INTO firma.premie VALUES(6,'Comiesięczna premia',30.00);
INSERT INTO firma.premie VALUES(7,'Praca w godzinach nocnych',99.99);
INSERT INTO firma.premie VALUES(8,'Dodatkowa godzina pracy',87.50);
INSERT INTO firma.premie VALUES(9,'Praca w weekendy i święta',320.00);
INSERT INTO firma.premie VALUES(10,'Awans',1000.00);

INSERT INTO firma.pensje VALUES(1,'Kierownik',10000.00,NULL);
INSERT INTO firma.pensje VALUES(2,'Web Designer',7000.00,1);
INSERT INTO firma.pensje VALUES(3,'Software Developer',85000.00,10);
INSERT INTO firma.pensje VALUES(4,'Junior Software Developer',6000.00,2);
INSERT INTO firma.pensje VALUES(5,'Server Admin',5000.00,9);
INSERT INTO firma.pensje VALUES(6,'Graphic Designer',7000.00,10);
INSERT INTO firma.pensje VALUES(7,'Junior Graphic Designer',4500.00,2);
INSERT INTO firma.pensje VALUES(8,'Sekretarka',3200.00,8);
INSERT INTO firma.pensje VALUES(9,'Księgowy',3500.00,5);
INSERT INTO firma.pensje VALUES(10,'Sprzątaczka',2800.00,4);

--wyswietlenie wybranej tabeli
--SELECT * FROM firma.pracownicy;
--SELECT * FROM firma.godziny;
--SELECT * FROM firma.pensje;
--SELECT * FROM firma.premie;