CREATE TABLE IF NOT EXISTS `menu` (
	`ID` int NOT NULL,
	`nazwa` text NOT NULL,
	`cena` int NOT NULL,
	`id_wielkosc` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `pracownicy` (
	`ID` int NOT NULL,
	`czas_pracy` int NOT NULL,
	`stawka_za_godzine` int NOT NULL,
	`imie` text NOT NULL,
	`nazwisko` text NOT NULL,
	`email` text NOT NULL,
	`id_stanowisko` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `stanowiska` (
	`ID` int NOT NULL,
	`nazwa` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `zamowienia` (
	`ID` int NOT NULL,
	`id_klient` int NOT NULL,
	`id_menu` int NOT NULL,
	`id_rodzaj_zamowienia` int NOT NULL,
	`id_rodzaj_platnosci` int NOT NULL,
	`id_pracownicy` int NOT NULL,
	`data_zamowienia` date NOT NULL,
	`id_dostawy` int NOT NULL,
	`id_dodatki` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `klient` (
	`ID` int NOT NULL,
	`nazwisko` text NOT NULL,
	`imie` text NOT NULL,
	`adres` text NOT NULL,
	`nr_tel` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `rodzaj_zamowienia` (
	`ID` int NOT NULL,
	`nazwa` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `dodatki` (
	`ID` int NOT NULL,
	`nazwa_dodatkow` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `rodzaj_platnosc` (
	`ID` int NOT NULL,
	`nazwa` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `dostawy` (
	`ID` int NOT NULL,
	`id_klient` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `wielkosc` (
	`ID` int NOT NULL,
	`nazwa` text NOT NULL
);

ALTER TABLE `menu` ADD CONSTRAINT `menu_fk3` FOREIGN KEY (`id_wielkosc`) REFERENCES `wielkosc`(`ID`);
ALTER TABLE `pracownicy` ADD CONSTRAINT `pracownicy_fk6` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowiska`(`ID`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk1` FOREIGN KEY (`id_klient`) REFERENCES `klient`(`ID`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk2` FOREIGN KEY (`id_menu`) REFERENCES `menu`(`ID`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk3` FOREIGN KEY (`id_rodzaj_zamowienia`) REFERENCES `rodzaj_zamowienia`(`ID`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk4` FOREIGN KEY (`id_rodzaj_platnosci`) REFERENCES `rodzaj_platnosc`(`ID`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk5` FOREIGN KEY (`id_pracownicy`) REFERENCES `pracownicy`(`ID`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk7` FOREIGN KEY (`id_dostawy`) REFERENCES `dostawy`(`ID`);


ALTER TABLE `dodatki` ADD CONSTRAINT `dodatki_fk0` FOREIGN KEY (`ID`) REFERENCES `zamowienia`(`id_dodatki`);

INSERT INTO Klient(Imie) VALUES ('Bartek');
INSERT INTO Klient(Imie) VALUES ('Hubert');
INSERT INTO Klient(Imie) VALUES ('Dawid');

INSERT INTO Klient(Nazwisko) VALUES ('Kowalski');
INSERT INTO Klient(Nazwisko) VALUES ('Nowak');
INSERT INTO Klient(Nazwisko) VALUES ('Pniewski');

INSERT INTO Klient(Numer_telefonu) VALUES (111222333);
INSERT INTO Klient(Numer_telefonu) VALUES (444555666);
INSERT INTO Klient(Numer_telefonu) VALUES (777888999);

INSERT INTO Klient(Adres) VALUES (`mala 8`);
INSERT INTO Klient(Adres) VALUES (`srednia 85`);
INSERT INTO Klient(Adres) VALUES (`duza 12`);


INSERT INTO dodatki(nazwa_dodatkow) VALUES (`ser`);
INSERT INTO dodatki(nazwa_dodatkow) VALUES (`szynka`);
INSERT INTO dodatki(nazwa_dodatkow) VALUES (`pieczarki`);
INSERT INTO dodatki(nazwa_dodatkow) VALUES (`kurczak`);
INSERT INTO dodatki(nazwa_dodatkow) VALUES (`salami`);

INSERT INTO menu() VALUES (`salami`);

