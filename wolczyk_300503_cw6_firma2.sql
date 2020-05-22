--a)
--+48 juz istnialo w numerach telefonu stad uzycie substring celem dodania nawiasów w odpowiednich miejscach
UPDATE ksiegowosc.pracownicy SET telefon = '(' || SUBSTRING(telefon,1,3) || ')' || SUBSTRING(telefon,5,9)

--b)
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(20);
--dodanie jeszcze odstepu miedzy (+48) a resztą numeru, celem przejrzystosci
--sam odstep istnial juz wczesniej, ale stracilem go w punkcie a)
UPDATE ksiegowosc.pracownicy
SET telefon = SUBSTRING(telefon,1,5) || ' ' || SUBSTRING(telefon,6,3) || '-' || SUBSTRING(telefon,9,3) || '-' || SUBSTRING(telefon,12,3);

--c)
SELECT id_pracownika, UPPER(imie) AS IMIE, UPPER(nazwisko) AS NAZWISKO, UPPER(adres) AS ADRES, telefon FROM ksiegowosc.pracownicy
WHERE LENGTH(nazwisko) = (SELECT MAX(LENGTH(nazwisko)) FROM ksiegowosc.pracownicy);

--d)
SELECT (ksiegowosc.pracownicy.*), MD5(kwota::VARCHAR(20)) AS pensja 
FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
AND ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji;

--e)
SELECT imie, nazwisko, pensja.kwota AS pensja, premia.kwota AS premia FROM ksiegowosc.wynagrodzenie 
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
LEFT JOIN ksiegowosc.premia ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii;

--f)
--Dodatkowe uzycie substring celem dodania kropek pomiedzy rokiem, miesiacem a dniem,
--poniewaz date jest w formacie (yyyy-mm-dd).
--Niektorzy pracownicy pracowali mniej niz 160 godzin
--CASE WHEN sprawdza to, i jesli ktos pracowal mniej niz 160 godzin to wyswietla 0 nadgodzin
--bez CASE WHEN wyswietlaloby ujemne wartosci w nadgodzinach.
SELECT CONCAT('Pracownik ', ksiegowosc.pracownicy.imie,' ', ksiegowosc.pracownicy.nazwisko,
', w dniu ', SUBSTRING(ksiegowosc.wynagrodzenie.data::VARCHAR(20),1,4), '.', 
SUBSTRING(ksiegowosc.wynagrodzenie.data::VARCHAR(20),6,2), '.', SUBSTRING(ksiegowosc.wynagrodzenie.data::VARCHAR(20),9,2),
' otrzymał pensję całkowitą na kwotę ', (ksiegowosc.pensja.kwota + ksiegowosc.premia.kwota),
', gdzie wynagrodzenie zasadnicze wynosiło: ', ksiegowosc.pensja.kwota,
', premia: ', ksiegowosc.premia.kwota,
', nadgodziny: ', CASE WHEN ksiegowosc.godziny.liczba_godzin > 160 THEN liczba_godzin-160 ELSE 0 END )
AS raport
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.premia, ksiegowosc.godziny
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
AND ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji;
