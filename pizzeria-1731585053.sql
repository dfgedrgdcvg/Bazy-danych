CREATE TABLE IF NOT EXISTS `menu` (
	`ID` int NOT NULL,
	`nazwa` text NOT NULL,
	`cena` int NOT NULL,
	`wielkosc` text NOT NULL
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

CREATE TABLE IF NOT EXISTS `metoda_platnosc` (
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


INSERT INTO `menu` (`id`, `nazwa`, `cena`,`wielkosc`) VALUES
(1,'Margherita',35,`duza`),
(2,'Pepperoni',40,'duza'),
(3,'Capricciosa',40,'duza'),
(4,'Diavola',42,'duza'),
(5,'Marinara',40,'duza');


INSERT INTO `dodatki` (`id`,`nazwa_dodatkow`) VALUES
(1,'ser'),
(2,'szynka'),
(3,'pieczarki'),
(4,'kurczak'),
(5,'salami');


INSERT INTO `klient` (`id`,`imie`,`nazwisko`,`numer_telefonu`,`adres`) VALUES
(1,'bartek','kowalski',111222333,'mala 8'),
(2,'hubert','nowak',444555666,'srednia 85'),
(3,'dawid','pniewski',777888999,'duza 12');


INSERT INTO `pracownicy` (`id`,`czas_pracy`,`stawka_za_godzine`,`imie`,`nazwisko`,`email`) VALUES
(1,'4 godziny','5zl/godz','filip','switek','filipswitek123@gmail.com'),
(2,'4godziny','5zl/godz','hubert','pasek','gubertpasek456@gmail.com'),
(3,'4godziny','5zl/godz','bartosz','nowacki','bartosznowacki789@gmail.com');
