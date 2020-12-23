-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 08 déc. 2020 à 20:48
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `idadmin` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mot_de_passe` varchar(45) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`idadmin`, `nom`, `prenom`, `email`, `mot_de_passe`) VALUES
(1, 'lalij', 'mariaa', 'marial@gmail.com', '23E');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `idadresse` int NOT NULL,
  `numero` int NOT NULL,
  `rue` varchar(45) NOT NULL,
  `code_postal` varchar(45) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `client_idclient` int NOT NULL,
  PRIMARY KEY (`idadresse`),
  KEY `fk_adresse_client1_idx` (`client_idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idadresse`, `numero`, `rue`, `code_postal`, `ville`, `client_idclient`) VALUES
(1, 20, 'avenue quincy', '77380', 'combs la ville', 1),
(2, 1, 'rue de la republique', '99763', 'paris', 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idcategorie` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `admin_idadmin` int NOT NULL,
  PRIMARY KEY (`idcategorie`),
  KEY `fk_categorie_admin1_idx` (`admin_idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idcategorie`, `type`, `admin_idadmin`) VALUES
(1, 'plat', 1),
(2, 'dessert', 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idclient` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mot_de_passe` varchar(45) NOT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idclient`, `nom`, `prenom`, `telephone`, `email`, `mot_de_passe`) VALUES
(1, 'mouhajir', 'youness', '9735543266', 'youness@gmail.com', 'ART'),
(2, 'petit', 'jenny', '987654325', 'jenny@gmail.com', 'hdh4');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idcommande` int NOT NULL,
  `date_creation` timestamp NOT NULL,
  `date_livraison` timestamp NOT NULL,
  `statut_commande` tinyint NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `Livreur_idLivreur` int DEFAULT NULL,
  `client_idclient` int NOT NULL,
  `adresse_idadresse` int NOT NULL,
  `Facture` tinyint NOT NULL,
  PRIMARY KEY (`idcommande`),
  KEY `fk_commande_Livreur1_idx` (`Livreur_idLivreur`),
  KEY `fk_commande_client1_idx` (`client_idclient`),
  KEY `fk_commande_adresse1_idx` (`adresse_idadresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcommande`, `date_creation`, `date_livraison`, `statut_commande`, `prix`, `Livreur_idLivreur`, `client_idclient`, `adresse_idadresse`, `Facture`) VALUES
(1, '2020-12-08 20:45:51', '2020-12-08 21:45:51', 0, '34', 1, 1, 1, 0),
(2, '2020-12-08 20:45:51', '2020-12-08 21:45:51', 1, '70', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `commande_idcommande` int NOT NULL,
  `produit_idproduit` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`commande_idcommande`,`produit_idproduit`),
  KEY `fk_commande_has_produit_produit1_idx` (`produit_idproduit`),
  KEY `fk_commande_has_produit_commande_idx` (`commande_idcommande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_idcommande`, `produit_idproduit`, `quantite`) VALUES
(1, 2, 4),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `idLivreur` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mot_de_passe` varchar(45) NOT NULL,
  `statut_livreur` tinyint NOT NULL,
  PRIMARY KEY (`idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`idLivreur`, `nom`, `prenom`, `email`, `mot_de_passe`, `statut_livreur`) VALUES
(1, 'BERNARD ', 'jerome', 'jerome@gmail.com', 'NSBD', 0),
(2, 'MARTIN ', 'lucie', 'lucie@gmail.com', 'hdg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idproduit` int NOT NULL,
  `titre` varchar(45) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `description` varchar(100) NOT NULL,
  `categorie_idcategorie` int NOT NULL,
  `admin_idadmin` int NOT NULL,
  PRIMARY KEY (`idproduit`),
  KEY `fk_produit_categorie1_idx` (`categorie_idcategorie`),
  KEY `fk_produit_admin1_idx` (`admin_idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idproduit`, `titre`, `prix`, `description`, `categorie_idcategorie`, `admin_idadmin`) VALUES
(1, 'gratin', '12', 'orem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour', 1, 1),
(2, 'creme brulée', '6', 'orem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sac_livreur`
--

DROP TABLE IF EXISTS `sac_livreur`;
CREATE TABLE IF NOT EXISTS `sac_livreur` (
  `Livreur_idLivreur` int NOT NULL,
  `produit_idproduit` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`Livreur_idLivreur`,`produit_idproduit`),
  KEY `fk_Livreur_has_produit_produit1_idx` (`produit_idproduit`),
  KEY `fk_Livreur_has_produit_Livreur1_idx` (`Livreur_idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sac_livreur`
--

INSERT INTO `sac_livreur` (`Livreur_idLivreur`, `produit_idproduit`, `quantite`) VALUES
(2, 1, 3),
(2, 2, 9);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_client1` FOREIGN KEY (`client_idclient`) REFERENCES `client` (`idclient`);

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `fk_categorie_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_adresse1` FOREIGN KEY (`adresse_idadresse`) REFERENCES `adresse` (`idadresse`),
  ADD CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_idclient`) REFERENCES `client` (`idclient`),
  ADD CONSTRAINT `fk_commande_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_commande_has_produit_commande` FOREIGN KEY (`commande_idcommande`) REFERENCES `commande` (`idcommande`),
  ADD CONSTRAINT `fk_commande_has_produit_produit1` FOREIGN KEY (`produit_idproduit`) REFERENCES `produit` (`idproduit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`),
  ADD CONSTRAINT `fk_produit_categorie1` FOREIGN KEY (`categorie_idcategorie`) REFERENCES `categorie` (`idcategorie`);

--
-- Contraintes pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD CONSTRAINT `fk_Livreur_has_produit_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`),
  ADD CONSTRAINT `fk_Livreur_has_produit_produit1` FOREIGN KEY (`produit_idproduit`) REFERENCES `produit` (`idproduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
