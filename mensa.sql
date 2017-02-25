-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Jan 2017 um 13:01
-- Server Version: 5.6.14
-- PHP-Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `mensa`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auth`
--

CREATE TABLE IF NOT EXISTS `auth` (
  `id` int(6) NOT NULL,
  `auth_key` varchar(64) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bewertungen`
--

CREATE TABLE IF NOT EXISTS `bewertungen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL,
  `speiseId` int(11) NOT NULL,
  `action` enum('like','dislike') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userIdSpeiseId` (`userId`,`speiseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `diaetermine`
--

CREATE TABLE IF NOT EXISTS `diaetermine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `speise` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=190 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `diaetspeisen`
--

CREATE TABLE IF NOT EXISTS `diaetspeisen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `art` enum('Vorspeise','Leichte-Vollkost','Dessert','Gemüseteller','Vegetarisch','Vollkost','Beilagen') NOT NULL,
  `beachte` varchar(255) DEFAULT NULL,
  `kcal` varchar(6) DEFAULT NULL,
  `eiweisse` varchar(6) DEFAULT NULL,
  `fette` varchar(6) DEFAULT NULL,
  `kohlenhydrate` varchar(6) DEFAULT NULL,
  `beschreibung` text,
  `preis` varchar(6) NOT NULL,
  `zusatzstoffe` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `speisen`
--

CREATE TABLE IF NOT EXISTS `speisen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `art` enum('Vorspeise','Leichte-Vollkost','Dessert','Gemüseteller','Vegetarisch','Vollkost','Beilagen') NOT NULL,
  `beachte` varchar(255) DEFAULT NULL,
  `kcal` varchar(6) DEFAULT NULL,
  `eiweisse` varchar(6) DEFAULT NULL,
  `fette` varchar(6) DEFAULT NULL,
  `kohlenhydrate` varchar(6) DEFAULT NULL,
  `beschreibung` text,
  `preis` varchar(6) NOT NULL,
  `zusatzstoffe` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `termine`
--

CREATE TABLE IF NOT EXISTS `termine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `speise` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=222 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zusatzstoffe`
--

CREATE TABLE IF NOT EXISTS `zusatzstoffe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nummer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `zusatzstoffe`
--

INSERT INTO `zusatzstoffe` (`id`, `name`, `nummer`) VALUES
(1, 'Koffein', 2),
(2, 'Nitrate', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zusatzstoffelink`
--

CREATE TABLE IF NOT EXISTS `zusatzstoffelink` (
  `speise` int(11) NOT NULL DEFAULT '0',
  `zusatzstoff` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`speise`,`zusatzstoff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `zusatzstoffelink`
--

INSERT INTO `zusatzstoffelink` (`speise`, `zusatzstoff`) VALUES
(1, 2),
(2, 1),
(2, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
