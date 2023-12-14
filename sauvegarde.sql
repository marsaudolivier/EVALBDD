-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 déc. 2023 à 10:49
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eval-bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE IF NOT EXISTS `cinema` (
  `Id_cinema` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `Id_complexes` int NOT NULL,
  PRIMARY KEY (`Id_cinema`),
  KEY `Id_complexes` (`Id_complexes`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cinema`
--

INSERT INTO `cinema` (`Id_cinema`, `nom`, `adresse`, `Id_complexes`) VALUES
(1, 'Cinéma de la ville de Cholet', 'Cholet', 1),
(2, 'Cinéma de la ville de Paris', 'Paris', 2),
(3, 'Cinéma de la ville de Nantes', 'Nantes', 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Id_client` int NOT NULL AUTO_INCREMENT,
  `numéro` int DEFAULT NULL,
  `Id_tarif` int NOT NULL,
  PRIMARY KEY (`Id_client`),
  UNIQUE KEY `numéro` (`numéro`),
  KEY `Id_tarif` (`Id_tarif`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_client`, `numéro`, `Id_tarif`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `complexes`
--

DROP TABLE IF EXISTS `complexes`;
CREATE TABLE IF NOT EXISTS `complexes` (
  `Id_complexes` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_complexes`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `complexes`
--

INSERT INTO `complexes` (`Id_complexes`, `nom`) VALUES
(1, 'gaumont'),
(2, 'pathe'),
(3, 'ugc'),
(4, 'cgr'),
(5, 'mk2'),
(6, 'kinepolis');

-- --------------------------------------------------------

--
-- Structure de la table `couter`
--

DROP TABLE IF EXISTS `couter`;
CREATE TABLE IF NOT EXISTS `couter` (
  `Id_tarif` int DEFAULT NULL,
  `Id_sceance` int DEFAULT NULL,
  KEY `Id_tarif` (`Id_tarif`),
  KEY `Id_sceance` (`Id_sceance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `couter`
--

INSERT INTO `couter` (`Id_tarif`, `Id_sceance`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(2, 6),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `diffuser`
--

DROP TABLE IF EXISTS `diffuser`;
CREATE TABLE IF NOT EXISTS `diffuser` (
  `Id_film` int DEFAULT NULL,
  `Id_salle` int DEFAULT NULL,
  KEY `Id_film` (`Id_film`),
  KEY `Id_salle` (`Id_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `diffuser`
--

INSERT INTO `diffuser` (`Id_film`, `Id_salle`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `employer`
--

DROP TABLE IF EXISTS `employer`;
CREATE TABLE IF NOT EXISTS `employer` (
  `Id_employer` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `Id_role` int NOT NULL,
  `Id_complexes` int NOT NULL,
  PRIMARY KEY (`Id_employer`),
  KEY `Id_role` (`Id_role`),
  KEY `Id_complexes` (`Id_complexes`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `employer`
--

INSERT INTO `employer` (`Id_employer`, `nom`, `prenom`, `Id_role`, `Id_complexes`) VALUES
(1, 'Dupont', 'Jean', 1, 1),
(2, 'Dupont', 'Jean', 2, 2),
(3, 'Dupont', 'Jean', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `Id_film` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `synopsie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_film`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`Id_film`, `titre`, `duree`, `synopsie`) VALUES
(1, 'Le seigneur des anneaux', '00:00:03', 'Un film de Peter Jackson'),
(2, 'Le seigneur des anneaux 2', '00:00:03', 'Un film de Peter Jackson'),
(3, 'Le seigneur des anneaux 3', '00:00:03', 'Un film de Peter Jackson');

-- --------------------------------------------------------

--
-- Structure de la table `prix`
--

DROP TABLE IF EXISTS `prix`;
CREATE TABLE IF NOT EXISTS `prix` (
  `Id_tarif` int NOT NULL AUTO_INCREMENT,
  `prix` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`Id_tarif`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prix`
--

INSERT INTO `prix` (`Id_tarif`, `prix`) VALUES
(1, '5.90'),
(2, '7.60'),
(3, '9.20');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Id_role` int NOT NULL AUTO_INCREMENT,
  `fonction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`Id_role`, `fonction`) VALUES
(1, 'Directeur général'),
(2, 'Directeur cinéma');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `Id_salle` int NOT NULL AUTO_INCREMENT,
  `places` int DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `Id_cinema` int NOT NULL,
  PRIMARY KEY (`Id_salle`),
  KEY `Id_cinema` (`Id_cinema`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`Id_salle`, `places`, `nom`, `Id_cinema`) VALUES
(1, 100, 'Salle 1', 1),
(2, 200, 'Salle 2', 1),
(3, 300, 'Salle 3', 2),
(4, 400, 'Salle 4', 2),
(5, 500, 'Salle 5', 3),
(6, 600, 'Salle 6', 3);

-- --------------------------------------------------------

--
-- Structure de la table `sceance`
--

DROP TABLE IF EXISTS `sceance`;
CREATE TABLE IF NOT EXISTS `sceance` (
  `Id_sceance` int NOT NULL AUTO_INCREMENT,
  `début` time DEFAULT NULL,
  `fin` varchar(50) DEFAULT NULL,
  `Id_salle` int NOT NULL,
  PRIMARY KEY (`Id_sceance`),
  KEY `Id_salle` (`Id_salle`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sceance`
--

INSERT INTO `sceance` (`Id_sceance`, `début`, `fin`, `Id_salle`) VALUES
(1, '14:00:00', '16:00', 1),
(2, '16:00:00', '18:00', 1),
(3, '18:00:00', '20:00', 2),
(4, '20:00:00', '22:00', 2),
(5, '22:00:00', '00:00', 3),
(6, '00:00:00', '02:00', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
