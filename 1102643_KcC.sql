-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: 94.23.36.178:3306
-- Czas wygenerowania: 14 Paź 2015, 15:25
-- Wersja serwera: 5.6.12
-- Wersja PHP: 5.4.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `1102643_KcC`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `n_topic` varchar(255) NOT NULL,
  `n_text` varchar(255) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_news__user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `news`
--

INSERT INTO `news` (`id`, `date`, `n_topic`, `n_text`, `user`) VALUES
(1, '2015-10-12 14:18:13', 'Rozpoczęcie budowy strony', 'Dziś rozpoczyna się wielkie przedsięwzięcie. Nasza firma rozpoczęła budowę strony www na któej już niebawem będzie można zapoznać się z naszą ofertą.', 1),
(2, '2015-10-13 09:37:35', 'Pierwsze kroki zostały wykonane', 'Otóż dnia dzisiejszego zostały wyznaczone cele projektu oraz rozpoczęto prace nad bazą danych. Mamy nadzieję że już wkrótce będziecie mogli państwo zapoznać sie z naszymi najciekawszymi realizacjami.', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ofertask`
--

CREATE TABLE IF NOT EXISTS `ofertask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `m_topic` varchar(255) NOT NULL,
  `m_text` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `user` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ofertask__user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `ofertask`
--

INSERT INTO `ofertask` (`id`, `m_email`, `name`, `m_topic`, `m_text`, `time`, `phone`, `user`, `state`) VALUES
(1, 'pyzio@prz.edu.pl', 'Jan Wilczek', 'Cena', 'Jestem zainteresowany ceną gięcia prętów HR54 dł 50cm na pół, zamówienie 100 sztuk', '2015-10-13 06:25:28', 654987321, 1, 0),
(2, 'jgra@onet.pl', 'Jolanta Wargas', 'Oferta', 'Wita, jestem zaintereswana zbrojeniem z drutu żebrowego 10mm, chodzi o konstrukcję balkonu 2x1m proszę o cenę', '2015-10-12 17:40:38', NULL, 1, 0),
(3, 'olok@huta.pl', 'Janusz Cieszyński', 'Oferta', 'Witam, pragnę zaoferować naszą stal wysokiej jakości w dobrych cenach. zapraszam do kontaktu J. Cieszyński', '2015-10-13 14:31:16', 753951486, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', 'admin1', 'mplast@prv.pl', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
