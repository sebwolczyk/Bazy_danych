CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika VARCHAR(5) NOT NULL PRIMARY KEY,
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(150),
	telefon VARCHAR(15));
	
COMMENT ON TABLE ksiegowosc.pracownicy
	IS 'Baza wszystkich pracownikow firmy.';
	
COMMENT ON COLUMN ksiegowosc.pracownicy.id_pracownika
	IS 'M-Mezczyzna; K-Kobieta; plus unikalna liczba.';
	
CREATE TABLE ksiegowosc.godziny(
	id_godziny SMALLINT PRIMARY KEY NOT NULL,
	data DATE,
	liczba_godzin INT,
	id_pracownika VARCHAR(5),
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika));

COMMENT ON TABLE ksiegowosc.godziny
	IS 'Godziny przepracowane przez danego pracownika w danym miesiacu.';
	
COMMENT ON COLUMN ksiegowosc.godziny.data
	IS 'Liczba godzin przepracowanych przez pracownika rozliczania jest za miesiac, kazdego ostatniego dnia miesiaca.';
	
CREATE TABLE ksiegowosc.pensja(
	id_pensji SMALLINT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(50),
	kwota MONEY);

COMMENT ON TABLE ksiegowosc.pensja
	IS 'Baza pensji w zaleznosci od stanowiska.';

CREATE TABLE ksiegowosc.premia(
	id_premii VARCHAR(5) PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(50),
	kwota MONEY);
	
COMMENT ON TABLE ksiegowosc.premia
	IS 'Baza wszystkich premii, ktore moze przyznac firma celem podwyzszenia wynagrodzenia.';
	
COMMENT ON COLUMN ksiegowosc.premia.id_premii
	IS 'Unikalny skrot literowy od nazwy rodzaju premii.';
	
COMMENT ON COLUMN ksiegowosc.premia.rodzaj
	IS 'Rodzaj opisuje za co przyznawana jest premia.';
	
CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia INT PRIMARY KEY NOT NULL,
	data DATE,
	id_pracownika VARCHAR(5),
	id_godziny SMALLINT,
	id_pensji SMALLINT,
	id_premii VARCHAR(5),
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
	FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
	FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
	FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii));
	
COMMENT ON TABLE ksiegowosc.wynagrodzenie
	IS 'Baza wszystkich comiesiecznych wynagrodzen.';
	
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.data
	IS 'Data wyplaty wynagrodzenia,';

INSERT INTO ksiegowosc.pracownicy VALUES('M001','Jan','Nowak','ul. Rynek 1, 31-435 Kraków','+48 667006123');
INSERT INTO ksiegowosc.pracownicy VALUES('K101','Katarzyna','Noga','ul. Gołębia 32a, 31-435 Kraków','+48 652489633');
INSERT INTO ksiegowosc.pracownicy VALUES('K102','Sandra','Czarnecka','ul. Rysia 112, 30-243 Tarnów','+48 660987432');
INSERT INTO ksiegowosc.pracownicy VALUES('M003','Janusz','Kręgiel','ul. Słona 42, 31-435 Kraków','+48 696750998');
INSERT INTO ksiegowosc.pracownicy VALUES('K106','Izabela','Kręgiel','ul. Słona 42, 31-435 Kraków','+48 696789321');
INSERT INTO ksiegowosc.pracownicy VALUES('M009','Mirosław','Gołąb','ul. Ptasia 119, 04-242 Lublin','+48 535969706');
INSERT INTO ksiegowosc.pracownicy VALUES('K015','Alicja','Kot','ul. Piękna 4, 31-435 Kraków','+48 535976502');
INSERT INTO ksiegowosc.pracownicy VALUES('M021','Tomasz','Łoś','ul. Rybia 55a, 31-435 Kraków','+48 612131415');
INSERT INTO ksiegowosc.pracownicy VALUES('K040','Łucja','Tygrys','ul. Majestatyczna 9, 41-200 Katowice','+48 694523053');
INSERT INTO ksiegowosc.pracownicy VALUES('M0154','Aleksander','Wolski','ul. Jasna, 33-425 Biały Dwór','+48 698887624');

INSERT INTO ksiegowosc.godziny VALUES(1,'2021-08-31',240,'M001');
INSERT INTO ksiegowosc.godziny VALUES(2,'2021-08-31',240,'K101');
INSERT INTO ksiegowosc.godziny VALUES(3,'2021-08-31',160,'K102');
INSERT INTO ksiegowosc.godziny VALUES(4,'2021-09-30',160,'M003');
INSERT INTO ksiegowosc.godziny VALUES(5,'2021-09-30',190,'K106');
INSERT INTO ksiegowosc.godziny VALUES(6,'2021-09-30',160,'M009');
INSERT INTO ksiegowosc.godziny VALUES(7,'2021-09-30',140,'K015');
INSERT INTO ksiegowosc.godziny VALUES(8,'2021-09-30',80,'M021');
INSERT INTO ksiegowosc.godziny VALUES(9,'2021-09-30',160,'K040');
INSERT INTO ksiegowosc.godziny VALUES(10,'2021-09-30',210,'M0154');

INSERT INTO ksiegowosc.pensja VALUES(100,'Kierownik',10000);
INSERT INTO ksiegowosc.pensja VALUES(101,'Software Developer',7500);
INSERT INTO ksiegowosc.pensja VALUES(102,'Junior Developer',6000);
INSERT INTO ksiegowosc.pensja VALUES(103,'Server Admin',3000);
INSERT INTO ksiegowosc.pensja VALUES(104,'Graphic Designer',4500);
INSERT INTO ksiegowosc.pensja VALUES(105,'Public Relations Manager',3500);
INSERT INTO ksiegowosc.pensja VALUES(106,'Księgowość',2650);
INSERT INTO ksiegowosc.pensja VALUES(107,'Sekretarka',1800);
INSERT INTO ksiegowosc.pensja VALUES(108,'Ochroniarz',900);
INSERT INTO ksiegowosc.pensja VALUES(109,'Sprzątaczka',750);

INSERT INTO ksiegowosc.premia VALUES('NAD','Nadgodziny',1000);
INSERT INTO ksiegowosc.premia VALUES('WKND','Praca w weekendy',500);
INSERT INTO ksiegowosc.premia VALUES('HLDAY','Praca w święta',250);
INSERT INTO ksiegowosc.premia VALUES('NIGHT','Praca w godzinach nocnych',500);
INSERT INTO ksiegowosc.premia VALUES('MONTH','Pracownik miesiąca',500);
INSERT INTO ksiegowosc.premia VALUES('EVENT','Organizacja eventu',300);
INSERT INTO ksiegowosc.premia VALUES('ONTIM','Punktualność',100);
INSERT INTO ksiegowosc.premia VALUES('UPGR','Usprawnienie działania firmy',3000);
INSERT INTO ksiegowosc.premia VALUES('IDEA','Pomysłodawctwo',600);
INSERT INTO ksiegowosc.premia VALUES('BHVR','Sprawowanie',200);
INSERT INTO ksiegowosc.premia VALUES('BRAK','Brak premii',0);

INSERT INTO ksiegowosc.wynagrodzenie VALUES(1000,'2021-09-10','M001',1,100,'BRAK');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1001,'2021-09-10','K101',2,100,'BRAK');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1002,'2021-09-10','K102',3,105,'EVENT');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1003,'2021-10-10','M003',4,101,'MONTH');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1004,'2021-10-10','K106',5,101,'HLDAY');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1005,'2021-10-10','M009',6,103,'BRAK');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1006,'2021-10-10','K015',7,106,'UPGR');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1007,'2021-10-10','M021',8,107,'BRAK');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1008,'2021-10-10','K040',9,108,'NIGHT');
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1009,'2021-10-10','M0154',10,109,'BHVR');

--a
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b
SELECT id_pracownika, kwota FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND kwota > '1000';

--c
SELECT id_pracownika, kwota, id_premii FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = 'BRAK'
AND kwota > '2000';

--d
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';

--e
SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

--f
SELECT imie, nazwisko, liczba_godzin - 160 AS nadgodziny
FROM ksiegowosc.pracownicy, ksiegowosc.godziny
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
AND liczba_godzin > 160;

--g
SELECT imie, nazwisko, kwota
FROM ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
AND ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
AND '1500' <= kwota AND kwota <= '3000';

--h
SELECT imie, nazwisko, liczba_godzin -160 AS nadgodziny, id_premii
FROM ksiegowosc.pracownicy, ksiegowosc.godziny, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
AND ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny
AND id_premii = 'BRAK'
AND liczba_godzin > 160;

--i
SELECT pracownicy.id_pracownika, imie, nazwisko, kwota AS pensja FROM ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
ORDER BY kwota;

--j
SELECT pracownicy.id_pracownika, imie, nazwisko, pensja.kwota AS pensja, premia.kwota AS premia
FROM ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.premia, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
AND ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
ORDER BY pensja DESC, premia DESC;

--k
SELECT count(id_pracownika) AS ilość, stanowisko FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
GROUP BY stanowisko;

--l
SELECT CAST(AVG(kwota::numeric) AS DECIMAL(10,2)) AS średnia, MIN(kwota::numeric) AS minimum,MAX(kwota::numeric) AS maksimum
FROM ksiegowosc.pensja
WHERE ksiegowosc.pensja.stanowisko = 'Kierownik';

--m
SELECT SUM(pensja.kwota::numeric) + SUM(premia.kwota::numeric) AS suma
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii;

--n(f)
SELECT stanowisko, SUM(pensja.kwota::numeric) + SUM(premia.kwota::numeric) AS suma
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
GROUP BY stanowisko
ORDER BY suma DESC;

--o(g)
SELECT stanowisko, count(wynagrodzenie.id_premii) AS liczba_premii
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
AND wynagrodzenie.id_premii != 'BRAK'
GROUP BY stanowisko
ORDER BY liczba_premii DESC;

--p(h)
DELETE FROM ksiegowosc.pracownicy 
USING ksiegowosc.pensja, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.pracownicy.id_pracownika =  ksiegowosc.wynagrodzenie.id_pracownika
AND ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
AND ksiegowosc.pensja.kwota < '1200';
--nie da sie usunac pracownika z tabeli pracownicy jesli istnieja klucze obce w innych tabelach, ktore odwoluja sie do danego pracownika
--a istnieja dwa klucze obce- w tabeli godziny i wynagrodzenie
--nalezaloby najpierw usunac wpisy z tabel wynagrodzenie i godziny??

/*
DELETE FROM ksiegowosc.wynagrodzenie
USING ksiegowosc.pensja, ksiegowosc.pracownicy
WHERE ksiegowosc.pracownicy.id_pracownika =  ksiegowosc.wynagrodzenie.id_pracownika
AND ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
AND ksiegowosc.pensja.kwota < '1200';

DELETE FROM ksiegowosc.godziny
USING ksiegowosc.pensja, ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
AND ksiegowosc.pensja.kwota < '1200';
*/

--Usuwajac najpierw z tabeli wynagrodzenie nie ma potem juz odniesienia za bardzo na jakiej podstawie usuwac z tabeli godziny, a nastepnie pracownicy
--tabela wynagrodzenie wiaze ze soba pensje oraz pracownikow, po usunieciu rekordu wynagrodzenie nie wiemy juz jakie pensje otrzymywal dany pracownik
--mozemy co najwyzej usunac wynagrodzenia pracownikow z pensja <1200
