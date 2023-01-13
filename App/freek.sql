-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 13 jan. 2023 à 20:16
-- Version du serveur : 5.7.33
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `freek`
--

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

CREATE TABLE `books` (
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_status` enum('En ligne','En attente','Retirer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `book_image`, `book_description`, `book_status`, `created_at`) VALUES
('mangas-Exi', 'Existence', 'book-image-63c140cc711404.62233725.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis delectus iste sint ducimus necessitatibus deserunt rerum sapiente dolor suscipit ad,<br />\r\ncumque dolorem pariatur voluptatum quas nobis temporibus <br />\r\nlibero dolore consequuntur?', 'En ligne', '2023-01-13 16:47:31'),
('mangas-PFTO', 'Player From Today Onward', 'book-image-63c141443d76a5.79108854.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis delectus iste sint ducimus <br />\r\n<br />\r\nnecessitatibus deserunt rerum sapiente dolor suscipit ad, <br />\r\n<br />\r\ncumque dolorem pariatur voluptatum quas nobis temporibus libero dolore consequuntur?', 'Retirer', '2023-01-13 19:11:27'),
('mangas-rai', 'Reincarnation', 'book-image-63c14177bb2a65.65573137.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis delectus iste sint ducimus <br />\r\nnecessitatibus deserunt rerum sapiente dolor suscipit ad, <br />\r\ncumque dolorem pariatur voluptatum quas nobis temporibus libero dolore consequuntur?', 'En ligne', '2023-01-13 19:11:29'),
('mangas-WDD', 'White Dragon Duke: Pendragon', 'book-image-63c13ceb28b1e2.04535772.jpg', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquam, dolores at excepturi omnis incidunt temporibus sequi eligendi ratione ullam eum,<br />\r\n<br />\r\nsit ipsa impedit obcaecati saepe magnam cupiditate delectus cumque dolorum.', 'En ligne', '2023-01-13 16:53:41');

-- --------------------------------------------------------

--
-- Structure de la table `chapters`
--

CREATE TABLE `chapters` (
  `chapter_id` int(11) NOT NULL,
  `chapter_number` int(11) NOT NULL,
  `chapter_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_comment`, `user_id`, `book_id`, `created_at`) VALUES
(5, 'Bienvenu(e) chers lecteurs!!!<br />\r\nJ&#039;espère que ce manhua vous l&#039;aimeriez car elle regorge beaucoup de retranchement.', 2, 'mangas-Exi', '2023-01-13 09:41:10'),
(6, 'Super ce mangas !!!<br />\r\n<br />\r\nLisez-le les gars !!!', 2, 'mangas-rai', '2023-01-13 10:34:08'),
(7, 'J&#039;ai vraiment aimé le scénario...', 4, 'mangas-rai', '2023-01-13 10:37:04'),
(8, 'Ah... encore ce manga !!!', 4, 'mangas-PFTO', '2023-01-13 10:42:54'),
(10, 'Laisser un commentaire. <br />\r\n<br />\r\nJe te dis QUE TU ES UN GARS BON !!!', 4, 'mangas-WDD', '2023-01-13 05:21:29'),
(11, 'C&#039;est trop ouf !!!', 3, 'mangas-WDD', '2023-01-13 05:42:23');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_wordkey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_firstname`, `user_lastname`, `user_username`, `user_email`, `user_password`, `user_image`, `user_wordkey`, `user_role`, `created_at`) VALUES
(2, 'Koladé Moussè', 'ABOUDOU', 'AsdePic444', 'kola444@gmail.com', '$2y$10$D7.SUQgqerryoYRuCmOvsurT.QHbnUn7KQvtoh3dwdFfOyPbGHiQW', 'img-63c1219dbf29e3.37811370.jpg', 'asdepic444', '0', '2023-01-13 11:44:07'),
(3, 'Nassara Amour', 'DAHOU', 'Dahounassara021', 'NassAmour@gmail.com', '$2y$10$bqLYT0c.tpCpZMESSmGVR.Xmn3uVMg6hG5fN0NBw2CqOfFzfIzDFm', 'img-63c123aa8c4674.36008937.jpg', 'aaaaaaaaaaaa', '1', '2023-01-13 09:26:02'),
(4, 'Donald', 'AHOSSI', 'Doni-yen001', 'ahossi@gmail.com', '$2y$10$wQgxhXFQ9iPbr7nZiNYowevVWvMfVi9t9BVSTouarHSH3mw/Mquau', 'img-63c14238458801.29282201.jpg', 'donidoniyen', '1', '2023-01-13 11:36:24');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_name` (`book_name`);

--
-- Index pour la table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_username` (`user_username`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_wordkey` (`user_wordkey`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
