CREATE TABLE IF NOT EXISTS `wielkosc` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwa` text NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `menu` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwa` text NOT NULL,
    `cena` int NOT NULL,
    `id_wielkosc` int NOT NULL,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`id_wielkosc`) REFERENCES `wielkosc`(`ID`)
);

CREATE TABLE IF NOT EXISTS `stanowiska` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwa` text NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `pracownicy` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `czas_pracy` int NOT NULL,
    `stawka_za_godzine` int NOT NULL,
    `imie` text NOT NULL,
    `nazwisko` text NOT NULL,
    `email` text NOT NULL,
    `id_stanowisko` int NOT NULL,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowiska`(`ID`)
);

CREATE TABLE IF NOT EXISTS `rodzaj_zamowienia` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwa` text NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `metoda_platnosc` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwa` text NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `dodatki` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwa_dodatkow` text NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `klient` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `nazwisko` text NOT NULL,
    `imie` text NOT NULL,
    `adres` text NOT NULL,
    `nr_tel` int NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `dostawy` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `id_klient` int NOT NULL,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`id_klient`) REFERENCES `klient`(`ID`)
);

CREATE TABLE IF NOT EXISTS `zamowienia` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `id_klient` int NOT NULL,
    `id_menu` int NOT NULL,
    `id_rodzaj_zamowienia` int NOT NULL,
    `id_metoda_platnosci` int NOT NULL,
    `id_pracownicy` int NOT NULL,
    `data_zamowienia` date NOT NULL,
    `id_dostawy` int NOT NULL,
    `id_dodatki` int NOT NULL,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`id_klient`) REFERENCES `klient`(`ID`),
    FOREIGN KEY (`id_menu`) REFERENCES `menu`(`ID`),
    FOREIGN KEY (`id_rodzaj_zamowienia`) REFERENCES `rodzaj_zamowienia`(`ID`),
    FOREIGN KEY (`id_metoda_platnosci`) REFERENCES `metoda_platnosc`(`ID`),
    FOREIGN KEY (`id_pracownicy`) REFERENCES `pracownicy`(`ID`),
    FOREIGN KEY (`id_dostawy`) REFERENCES `dostawy`(`ID`),
    FOREIGN KEY (`id_dodatki`) REFERENCES `dodatki`(`ID`)
);

-- Wstawianie danych

-- Tabela "wielkosc"
INSERT INTO `wielkosc` (`nazwa`) VALUES 
('mala'),
('duza');

-- Tabela "menu"
INSERT INTO `menu` (`nazwa`, `cena`, `id_wielkosc`) VALUES
('Margherita', 35, 2),  -- duza
('Pepperoni', 40, 2),   -- duza
('Capricciosa', 40, 2); -- duza

-- Tabela "dodatki"
INSERT INTO `dodatki` (`nazwa_dodatkow`) VALUES
('ser'),
('szynka'),
('pieczarki'),
('kurczak'),
('salami');

-- Tabela "klient"
INSERT INTO `klient` (`imie`, `nazwisko`, `nr_tel`, `adres`) VALUES
('bartek', 'kowalski', 111222333, 'mala 8'),
('hubert', 'nowak', 444555666, 'srednia 85'),
('dawid', 'pniewski', 777888999, 'duza 12');

-- Tabela "stanowiska"
INSERT INTO `stanowiska` (`nazwa`) VALUES
('kasjer'),
('kucharz'),
('kelner');

-- Tabela "rodzaj_zamowienia"
INSERT INTO `rodzaj_zamowienia` (`nazwa`) VALUES
('Zamówienie na miejscu'),
('Zamówienie na wynos'),
('Zamówienie z dostawą do domu');

-- Tabela "metoda_platnosc"
INSERT INTO `metoda_platnosc` (`nazwa`) VALUES
('Gotówka'),
('Karta płatnicza'),
('Blik');

-- Tabela "dostawy"
INSERT INTO `dostawy` (`id_klient`) VALUES
(1),
(2),
(3);

-- Tabela "pracownicy"
INSERT INTO `pracownicy` (`czas_pracy`, `stawka_za_godzine`, `imie`, `nazwisko`, `email`, `id_stanowisko`) VALUES
(4, 5, 'filip', 'switek', 'filipswitek123@gmail.com', 2),
(4, 5, 'hubert', 'pasek', 'hubertpasek456@gmail.com', 2),
(4, 5, 'bartosz', 'nowacki', 'bartosznowacki789@gmail.com', 3);

-- Tabela "zamowienia"
INSERT INTO `zamowienia` (`id_klient`, `id_menu`, `id_rodzaj_zamowienia`, `id_metoda_platnosci`, `id_pracownicy`, `data_zamowienia`, `id_dostawy`, `id_dodatki`) VALUES
(1, 1, 1, 1, 1, '2024-12-10', 1, 1),
(2, 2, 2, 2, 2, '2024-12-11', 2, 2),
(3, 3, 3, 3, 3, '2024-12-12', 3, 3);

SELECT * FROM `klient`;

SELECT * FROM `menu`;

SELECT p.`imie`, p.`nazwisko`, s.`nazwa` AS stanowisko
FROM `pracownicy` p
JOIN `stanowiska` s ON p.`id_stanowisko` = s.`ID`;

SELECT z.`ID` AS zamowienie_id, k.`imie` AS klient_imie, k.`nazwisko` AS klient_nazwisko, m.`nazwa` AS menu_nazwa, r.`nazwa` AS rodzaj_zamowienia, mp.`nazwa` AS metoda_platnosci, p.`imie` AS pracownik_imie, d.`id_klient` AS dostawa_id, d.`nazwa_dodatkow`
FROM `zamowienia` z
JOIN `klient` k ON z.`id_klient` = k.`ID`
JOIN `menu` m ON z.`id_menu` = m.`ID`
JOIN `rodzaj_zamowienia` r ON z.`id_rodzaj_zamowienia` = r.`ID`
JOIN `metoda_platnosc` mp ON z.`id_metoda_platnosci` = mp.`ID`
JOIN `pracownicy` p ON z.`id_pracownicy` = p.`ID`
JOIN `dostawy` d ON z.`id_dostawy` = d.`ID`
JOIN `dodatki` d2 ON z.`id_dodatki` = d2.`ID`;

SELECT * 
FROM `zamowienia`
WHERE `id_klient` = 1;  

SELECT m.`nazwa`, m.`cena`, w.`nazwa` AS wielkosc
FROM `menu` m
JOIN `wielkosc` w ON m.`id_wielkosc` = w.`ID`;

SELECT * FROM `dodatki`;

SELECT * FROM `metoda_platnosc`;

SELECT * FROM `rodzaj_zamowienia`;

SELECT p.`imie`, p.`nazwisko`, p.`czas_pracy`, p.`stawka_za_godzine`
FROM `pracownicy` p;


