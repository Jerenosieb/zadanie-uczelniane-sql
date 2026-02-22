-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 27, 2026 at 01:58 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cennik`
--

CREATE TABLE `cennik` (
  `id_ceny` int(11) NOT NULL,
  `gabaryt` enum('S','M','L','XL') NOT NULL DEFAULT 'S',
  `cena_brutto` decimal(10,2) NOT NULL,
  `id_rodzaju` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `cennik`
--

INSERT INTO `cennik` (`id_ceny`, `gabaryt`, `cena_brutto`, `id_rodzaju`) VALUES
(1, 'S', 3.90, 1),
(2, 'M', 4.50, 1),
(3, 'S', 6.80, 2),
(4, 'S', 8.50, 5),
(5, 'L', 15.00, 7),
(6, 'XL', 25.00, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ewidencja_listow`
--

CREATE TABLE `ewidencja_listow` (
  `id_listu` int(11) NOT NULL,
  `numer_nadawczy` varchar(50) DEFAULT NULL,
  `adresat_nazwa` varchar(100) NOT NULL,
  `adresat_adres` varchar(200) NOT NULL,
  `data_wplywu` date NOT NULL,
  `status_doreczenia` enum('W oddziale','W doręczeniu','Doreczono','Awizowano','Zwrot') DEFAULT 'W oddziale',
  `id_rodzaju` int(11) DEFAULT NULL,
  `id_listonosza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `ewidencja_listow`
--

INSERT INTO `ewidencja_listow` (`id_listu`, `numer_nadawczy`, `adresat_nazwa`, `adresat_adres`, `data_wplywu`, `status_doreczenia`, `id_rodzaju`, `id_listonosza`) VALUES
(1, 'PX100200PL', 'Urząd Miasta', 'Plac Kolegiacki 17', '2023-12-01', 'Doreczono', 2, 1),
(2, 'PX100201PL', 'Firma XYZ', 'ul. Św. Marcin 20', '2023-12-02', 'Doreczono', 3, 1),
(3, 'ZW005001PL', 'Adam Małysz', 'ul. Skoczna 5', '2023-12-05', 'Doreczono', 1, 2),
(4, 'SD999000PL', 'Kancelaria Prawna', 'ul. Dąbrowskiego 5', '2023-12-10', 'Doreczono', 4, 3),
(6, 'RR123457PL', 'Grażyna Biznesu', 'ul. Targowa 10', '2023-12-16', 'Doreczono', 3, 4),
(7, 'ZZ987654PL', 'Spółdzielnia Mieszkaniowa', 'os. Oświecenia 5', '2023-12-18', 'Doreczono', 1, 5),
(8, 'PP555666PL', 'Krzysztof Jarzyna', 'ul. Szczecińska 12', '2023-12-20', 'Doreczono', 4, 6),
(10, 'BB445566PL', 'Piotr Nowak', 'ul. Prosta 2', '2024-01-02', 'Doreczono', 1, 8),
(11, 'CC778899PL', 'Anna Kowalska', 'ul. Krzywa 3', '2024-01-03', 'Doreczono', 2, 9),
(12, 'DD001122PL', 'Urząd Skarbowy', 'ul. Podatkowa 1', '2024-01-03', 'Doreczono', 3, 10),
(13, 'EE334455PL', 'Bank PKO', 'Plac Wolności 1', '2024-01-04', 'Doreczono', 6, 11),
(14, 'FF667788PL', 'Szkoła Podstawowa nr 5', 'ul. Szkolna 4', '2024-01-04', 'Doreczono', 1, 12),
(15, 'GG990011PL', 'Marek Zegarek', 'ul. Czasu 12', '2024-01-05', 'Doreczono', 2, 13),
(16, 'HH223344PL', 'ZUS', 'ul. Dąbrowskiego 70', '2024-01-05', 'Awizowano', 3, 1),
(17, 'II556677PL', 'Sąd Rejonowy', 'al. Marcinkowskiego 32', '2024-01-06', 'Awizowano', 4, 2),
(18, 'JJ889900PL', 'Komisariat Policji', 'ul. Polna 1', '2024-01-07', 'Awizowano', 4, 3),
(19, 'KK112233PL', 'Restauracja PYRA', 'ul. Strzelecka 10', '2024-01-07', 'Awizowano', 5, 4),
(20, 'LL445566PL', 'Hotel Mercure', 'ul. Roosevelta 20', '2024-01-08', 'Awizowano', 6, 5),
(21, 'MM778899PL', 'Galeria Malta', 'ul. Baraniaka 8', '2024-01-08', 'Awizowano', 7, 6),
(22, 'NN001122PL', 'Stary Browar', 'ul. Półwiejska 42', '2024-01-09', 'Awizowano', 8, 7),
(23, 'OO334455PL', 'Politechnika Poznańska', 'Plac Skłodowskiej 5', '2024-01-09', 'W oddziale', 1, 8),
(24, 'PP667788PL', 'Uniwersytet UAM', 'ul. Wieniawskiego 1', '2024-01-10', 'W oddziale', 2, 9),
(25, 'QQ990011PL', 'Szpital Miejski', 'ul. Szwajcarska 3', '2024-01-10', 'W oddziale', 3, 10),
(26, 'RR223344PL', 'Apteka DOZ', 'ul. Głogowska 100', '2024-01-11', 'W oddziale', 5, 11),
(27, 'SS556677PL', 'Kwiaciarnia Róża', 'ul. Długa 5', '2024-01-11', 'W oddziale', 6, 12),
(28, 'TT889900PL', 'Sklep Żabka', 'ul. Krótka 2', '2024-01-12', 'W oddziale', 7, 13),
(29, 'UU112233PL', 'Warsztat Samochodowy', 'ul. Warsztatowa 1', '2024-01-12', 'Doreczono', 8, 1),
(30, 'VV445566PL', 'Fryzjer Męski', 'ul. Włoska 3', '2024-01-13', 'Zwrot', 1, 2),
(31, 'WW778899PL', 'Kino Muza', 'ul. Św. Marcin 30', '2024-01-13', 'Zwrot', 2, 3),
(32, 'XX001122PL', 'Teatr Nowy', 'ul. Dąbrowskiego 5', '2024-01-14', 'Zwrot', 3, 4),
(33, 'YY334455PL', 'Muzeum Narodowe', 'al. Marcinkowskiego 9', '2024-01-14', 'Zwrot', 4, 5),
(34, 'ZZ667788PL', 'Dworzec Główny', 'ul. Dworcowa 1', '2024-01-15', 'Zwrot', 5, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `listonosze`
--

CREATE TABLE `listonosze` (
  `id_listonosza` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `nr_legitymacji` varchar(20) NOT NULL,
  `id_rejonu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `listonosze`
--

INSERT INTO `listonosze` (`id_listonosza`, `imie`, `nazwisko`, `nr_legitymacji`, `id_rejonu`) VALUES
(1, 'Jan', 'Kowalski', 'L001', 1),
(2, 'Anna', 'Nowak', 'L002', 2),
(3, 'Piotr', 'Zieliński', 'L003', 1),
(4, 'Marek', 'Wiśniewski', 'L004', 3),
(5, 'Tomasz', 'Nowicki', 'L005', 4),
(6, 'Katarzyna', 'Wójcik', 'L006', 5),
(7, 'Michał', 'Kamiński', 'L007', 6),
(8, 'Agnieszka', 'Lewandowska', 'L008', 4),
(9, 'Robert', 'Zieliński', 'L009', 7),
(10, 'Monika', 'Szymańska', 'L010', 2),
(11, 'Paweł', 'Woźniak', 'L011', 3),
(12, 'Barbara', 'Dąbrowska', 'L012', 1),
(13, 'Krzysztof', 'Kozłowski', 'L013', 8),
(14, 'Anna', 'Jankowska', 'L014', 5),
(15, 'Marcin', 'Mazur', 'L015', 6),
(16, 'Ewa', 'Kwiatkowska', 'L016', 7),
(17, 'Łukasz', 'Krawczyk', 'L017', 2),
(18, 'Janusz', 'Przykładowy', 'L999', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rejony`
--

CREATE TABLE `rejony` (
  `id_rejonu` int(11) NOT NULL,
  `nazwa_rejonu` varchar(100) NOT NULL,
  `punkt_odbioru` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `rejony`
--

INSERT INTO `rejony` (`id_rejonu`, `nazwa_rejonu`, `punkt_odbioru`) VALUES
(1, 'Centrum', 'UP Poznań 1'),
(2, 'Winogrady', 'UP Poznań 12'),
(3, 'Jeżyce', 'UP Poznań 5'),
(4, 'Rataje', 'UP Poznań 10'),
(5, 'Grunwald', 'UP Poznań 15'),
(6, 'Wilda', 'UP Poznań 2'),
(7, 'Łazarz', 'UP Poznań 3'),
(8, 'Piątkowo', 'UP Poznań 20'),
(9, 'Naramowice', 'UP Poznań 21'),
(10, 'Podolany', 'UP Poznań 9');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklamacje`
--

CREATE TABLE `reklamacje` (
  `id_reklamacji` int(11) NOT NULL,
  `data_zgloszenia` date NOT NULL,
  `opis_problemu` text DEFAULT NULL,
  `status_rozpatrzenia` varchar(50) DEFAULT 'W toku',
  `id_listu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `reklamacje`
--

INSERT INTO `reklamacje` (`id_reklamacji`, `data_zgloszenia`, `opis_problemu`, `status_rozpatrzenia`, `id_listu`) VALUES
(1, '2026-01-20', 'Niedoręczenie - zwrot do nadawcy', 'Nowa', 30),
(2, '2026-01-20', 'Niedoręczenie - zwrot do nadawcy', 'Nowa', 31),
(3, '2026-01-20', 'Niedoręczenie - zwrot do nadawcy', 'Nowa', 32),
(4, '2026-01-20', 'Niedoręczenie - zwrot do nadawcy', 'Nowa', 33),
(5, '2026-01-20', 'Niedoręczenie - zwrot do nadawcy', 'Nowa', 34);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje_listow`
--

CREATE TABLE `rodzaje_listow` (
  `id_rodzaju` int(11) NOT NULL,
  `nazwa_rodzaju` varchar(100) NOT NULL,
  `wymaga_podpisu` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `rodzaje_listow`
--

INSERT INTO `rodzaje_listow` (`id_rodzaju`, `nazwa_rodzaju`, `wymaga_podpisu`) VALUES
(1, 'Zwykły', 0),
(2, 'Polecony', 1),
(3, 'Polecony z potw. odbioru', 1),
(4, 'Sądowy', 1),
(5, 'Priorytet', 0),
(6, 'Paczka MINI', 0),
(7, 'Paczka Pocztowa', 1),
(8, 'Przesyłka Pobraniowa', 1),
(9, 'Marketingowa (Ulotki)', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cennik`
--
ALTER TABLE `cennik`
  ADD PRIMARY KEY (`id_ceny`),
  ADD KEY `id_rodzaju` (`id_rodzaju`);

--
-- Indeksy dla tabeli `ewidencja_listow`
--
ALTER TABLE `ewidencja_listow`
  ADD PRIMARY KEY (`id_listu`),
  ADD KEY `id_rodzaju` (`id_rodzaju`),
  ADD KEY `id_listonosza` (`id_listonosza`);

--
-- Indeksy dla tabeli `listonosze`
--
ALTER TABLE `listonosze`
  ADD PRIMARY KEY (`id_listonosza`),
  ADD UNIQUE KEY `nr_legitymacji` (`nr_legitymacji`),
  ADD KEY `id_rejonu` (`id_rejonu`);

--
-- Indeksy dla tabeli `rejony`
--
ALTER TABLE `rejony`
  ADD PRIMARY KEY (`id_rejonu`);

--
-- Indeksy dla tabeli `reklamacje`
--
ALTER TABLE `reklamacje`
  ADD PRIMARY KEY (`id_reklamacji`),
  ADD KEY `id_listu` (`id_listu`);

--
-- Indeksy dla tabeli `rodzaje_listow`
--
ALTER TABLE `rodzaje_listow`
  ADD PRIMARY KEY (`id_rodzaju`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cennik`
--
ALTER TABLE `cennik`
  MODIFY `id_ceny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ewidencja_listow`
--
ALTER TABLE `ewidencja_listow`
  MODIFY `id_listu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `listonosze`
--
ALTER TABLE `listonosze`
  MODIFY `id_listonosza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `rejony`
--
ALTER TABLE `rejony`
  MODIFY `id_rejonu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reklamacje`
--
ALTER TABLE `reklamacje`
  MODIFY `id_reklamacji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rodzaje_listow`
--
ALTER TABLE `rodzaje_listow`
  MODIFY `id_rodzaju` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cennik`
--
ALTER TABLE `cennik`
  ADD CONSTRAINT `cennik_ibfk_1` FOREIGN KEY (`id_rodzaju`) REFERENCES `rodzaje_listow` (`id_rodzaju`);

--
-- Constraints for table `ewidencja_listow`
--
ALTER TABLE `ewidencja_listow`
  ADD CONSTRAINT `ewidencja_listow_ibfk_1` FOREIGN KEY (`id_rodzaju`) REFERENCES `rodzaje_listow` (`id_rodzaju`),
  ADD CONSTRAINT `ewidencja_listow_ibfk_2` FOREIGN KEY (`id_listonosza`) REFERENCES `listonosze` (`id_listonosza`);

--
-- Constraints for table `listonosze`
--
ALTER TABLE `listonosze`
  ADD CONSTRAINT `listonosze_ibfk_1` FOREIGN KEY (`id_rejonu`) REFERENCES `rejony` (`id_rejonu`);

--
-- Constraints for table `reklamacje`
--
ALTER TABLE `reklamacje`
  ADD CONSTRAINT `reklamacje_ibfk_1` FOREIGN KEY (`id_listu`) REFERENCES `ewidencja_listow` (`id_listu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
