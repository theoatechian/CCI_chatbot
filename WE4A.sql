-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 29 mars 2025 à 10:14
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `WE4A`
--

-- --------------------------------------------------------

--
-- Structure de la table `Devoir`
--

CREATE TABLE `Devoir` (
  `id_devoir` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `consigne` text DEFAULT NULL,
  `date_limite` date DEFAULT NULL,
  `id_uv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Inscription`
--

CREATE TABLE `Inscription` (
  `id_utilisateur` int(11) NOT NULL,
  `id_uv` int(11) NOT NULL,
  `date_inscription` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Inscription`
--

INSERT INTO `Inscription` (`id_utilisateur`, `id_uv`, `date_inscription`) VALUES
(1, 1, '2025-02-17'),
(1, 2, '2025-02-17'),
(1, 3, '2025-02-17'),
(1, 4, '2025-02-17'),
(2, 1, '2025-02-17'),
(2, 2, '2025-02-17'),
(2, 3, '2025-02-17'),
(2, 4, '2025-02-17'),
(3, 1, '2025-02-17'),
(3, 2, '2025-02-17'),
(3, 3, '2025-02-17'),
(3, 4, '2025-02-17'),
(4, 1, '2025-02-17'),
(4, 2, '2025-02-17'),
(4, 3, '2025-02-17'),
(4, 4, '2025-02-17');

-- --------------------------------------------------------

--
-- Structure de la table `Note`
--

CREATE TABLE `Note` (
  `id_note` int(11) NOT NULL,
  `valeur` float DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `id_soumission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Ressource`
--

CREATE TABLE `Ressource` (
  `id_ressource` int(11) NOT NULL,
  `titre` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url_fichier` varchar(255) DEFAULT NULL,
  `id_uv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Role`
--

CREATE TABLE `Role` (
  `id_role` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Role`
--

INSERT INTO `Role` (`id_role`, `nom`) VALUES
(1, 'Etudiants'),
(2, 'Professeurs'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `Soumission`
--

CREATE TABLE `Soumission` (
  `id_soumission` int(11) NOT NULL,
  `fichier` varchar(255) DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_devoir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`id_utilisateur`, `nom`, `prenom`, `email`, `mot_de_passe`, `id_role`) VALUES
(1, 'Tran', 'Kevin', 'kevin.tran@utbm.fr', '1234', 1),
(2, 'Voisin', 'Florent', 'florent.voisin@utbm.fr', '1234', 1),
(3, 'Atechian', 'Theo', 'theo.atechian@utbm.fr', '1234', 1),
(4, 'YADAV RANGEL DE AGUIAR', 'Patrick', 'patrick.yadav-rangel-de-aguiar@utbm.fr', '1234', 1),
(5, 'Brunoud', 'Alexandre', 'alexandre.brunoud@utbm.fr', '1234', 2),
(6, 'Lombard', 'Alexandre', 'alexandre.lombard@utbm.fr', '1234', 2),
(7, 'Litzler', 'Antoine', 'antoine.litzler@utbm.fr', '1234', 2),
(8, 'Benkirane', 'Fatima Ez Zahra', 'fatima.benkirane@utbm.fr', '1234', 2),
(9, 'admin', 'admin', 'admin@utbm.fr', '1234', 3);

-- --------------------------------------------------------

--
-- Structure de la table `UV`
--

CREATE TABLE `UV` (
  `id_uv` int(11) NOT NULL,
  `nom_uv` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `UV`
--

INSERT INTO `UV` (`id_uv`, `nom_uv`, `description`) VALUES
(1, 'WE4A/B', 'Technologie et programmation web'),
(2, 'SI40', 'Système d\'information'),
(3, 'ID01', 'CrunchTime'),
(4, 'ST40/ST50', 'Départ en stage');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Devoir`
--
ALTER TABLE `Devoir`
  ADD PRIMARY KEY (`id_devoir`),
  ADD KEY `id_uv` (`id_uv`);

--
-- Index pour la table `Inscription`
--
ALTER TABLE `Inscription`
  ADD PRIMARY KEY (`id_utilisateur`,`id_uv`),
  ADD KEY `id_uv` (`id_uv`);

--
-- Index pour la table `Note`
--
ALTER TABLE `Note`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `id_soumission` (`id_soumission`);

--
-- Index pour la table `Ressource`
--
ALTER TABLE `Ressource`
  ADD PRIMARY KEY (`id_ressource`),
  ADD KEY `id_uv` (`id_uv`);

--
-- Index pour la table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `Soumission`
--
ALTER TABLE `Soumission`
  ADD PRIMARY KEY (`id_soumission`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_devoir` (`id_devoir`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `UV`
--
ALTER TABLE `UV`
  ADD PRIMARY KEY (`id_uv`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Devoir`
--
ALTER TABLE `Devoir`
  MODIFY `id_devoir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Note`
--
ALTER TABLE `Note`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Ressource`
--
ALTER TABLE `Ressource`
  MODIFY `id_ressource` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Role`
--
ALTER TABLE `Role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Soumission`
--
ALTER TABLE `Soumission`
  MODIFY `id_soumission` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `UV`
--
ALTER TABLE `UV`
  MODIFY `id_uv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Devoir`
--
ALTER TABLE `Devoir`
  ADD CONSTRAINT `devoir_ibfk_1` FOREIGN KEY (`id_uv`) REFERENCES `UV` (`id_uv`);

--
-- Contraintes pour la table `Inscription`
--
ALTER TABLE `Inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`id_uv`) REFERENCES `UV` (`id_uv`);

--
-- Contraintes pour la table `Note`
--
ALTER TABLE `Note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_soumission`) REFERENCES `Soumission` (`id_soumission`);

--
-- Contraintes pour la table `Ressource`
--
ALTER TABLE `Ressource`
  ADD CONSTRAINT `ressource_ibfk_1` FOREIGN KEY (`id_uv`) REFERENCES `UV` (`id_uv`);

--
-- Contraintes pour la table `Soumission`
--
ALTER TABLE `Soumission`
  ADD CONSTRAINT `soumission_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `soumission_ibfk_2` FOREIGN KEY (`id_devoir`) REFERENCES `Devoir` (`id_devoir`);

--
-- Contraintes pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `Role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
