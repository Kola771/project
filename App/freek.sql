-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : dim. 15 jan. 2023 à 14:56
-- Version du serveur : 5.7.33
-- Version de PHP : 8.1.10

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
('comics-MSm', 'Marvel Spider-man', 'book-image-63c28415243c94.25475983.jpg', 'Spiiiiiiiiiiiiiderrrrr-maaaaaaaaaaaannnn<br />\r\n<br />\r\n<br />\r\nWelcome in the game !!!', 'En ligne', '2023-01-14 09:29:41'),
('mangas-LRose', 'La Rosée De La Nuit', 'book-image-63c289b06cf0b6.32278128.jpg', 'La rosée de la nuit....', 'En ligne', '2023-01-14 09:53:36'),
('mangas-PFTO', 'Player From The Onward', 'book-image-63c274d58a82a9.59757632.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis delectus iste sint ducimus <br />\r\n<br />\r\nnecessitatibus deserunt rerum sapiente dolor suscipit ad, <br />\r\n<br />\r\ncumque dolorem pariatur voluptatum quas nobis temporibus libero dolore consequuntur?', 'En ligne', '2023-01-15 10:01:29'),
('mangas-rai', 'Reincarnation', 'book-image-63c274f510f564.45313468.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis delectus iste sint ducimus <br />\r\nnecessitatibus deserunt rerum sapiente dolor suscipit ad, <br />\r\ncumque dolorem pariatur voluptatum quas nobis temporibus libero dolore consequuntur?', 'En ligne', '2023-01-14 09:25:11'),
('mangas-WDD', 'White Dragon Duke: Pendragon', 'book-image-63c27515b6d647.07002992.jpg', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquam, dolores at excepturi omnis incidunt temporibus sequi eligendi ratione ullam eum,<br />\r\n<br />\r\nsit ipsa impedit obcaecati saepe magnam cupiditate delectus cumque dolorum.', 'En ligne', '2023-01-14 09:25:41');

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chapters`
--

INSERT INTO `chapters` (`chapter_id`, `chapter_number`, `chapter_title`, `chapter_image`, `chapter_text`, `book_id`, `created_at`) VALUES
(1, 1, 'Le retour', 'mangas-image-63c408c26bb053.41977483.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(2, 1, 'Le retour', 'mangas-image-63c408c27d02b8.73356345.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(3, 1, 'Le retour', 'mangas-image-63c408c287bbd7.31943689.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(4, 1, 'Le retour', 'mangas-image-63c408c2a309f6.51211160.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(5, 1, 'Le retour', 'mangas-image-63c408c2b5e992.23135553.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(6, 1, 'Le retour', 'mangas-image-63c408c2c63e74.83580084.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(7, 1, 'Le retour', 'mangas-image-63c408c2d3c116.08957611.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(8, 1, 'Le retour', 'mangas-image-63c408c2e42715.71050149.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(9, 1, 'Le retour', 'mangas-image-63c408c30044a2.72206725.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(10, 1, 'Le retour', 'mangas-image-63c408c31331b2.16944709.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(11, 1, 'Le retour', 'mangas-image-63c408c31e3630.84202244.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(12, 1, 'Le retour', 'mangas-image-63c408c32ba731.60964364.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(13, 1, 'Le retour', 'mangas-image-63c408c336a401.47297734.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(14, 1, 'Le retour', 'mangas-image-63c408c3495d79.54991497.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(15, 1, 'Le retour', 'mangas-image-63c408c359d488.46158129.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(16, 1, 'Le retour', 'mangas-image-63c408c3674986.98005201.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(17, 1, 'Le retour', 'mangas-image-63c408c37241c5.07208727.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(18, 1, 'Le retour', 'mangas-image-63c408c37cf737.86661760.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(19, 1, 'Le retour', 'mangas-image-63c408c38a85d6.96027846.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(20, 1, 'Le retour', 'mangas-image-63c408c3983789.44008841.jpg', 'ddd', 'comics-MSm', '2023-01-15 01:08:02'),
(21, 2, 'Le retour 2', 'mangas-image-63c4091f1251c4.96116767.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(22, 2, 'Le retour 2', 'mangas-image-63c4091f27c610.65911592.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(23, 2, 'Le retour 2', 'mangas-image-63c4091f32b5d8.33241053.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(24, 2, 'Le retour 2', 'mangas-image-63c4091f42f185.69272607.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(25, 2, 'Le retour 2', 'mangas-image-63c4091f508ec8.29969485.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(26, 2, 'Le retour 2', 'mangas-image-63c4091f60cf53.79509062.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(27, 2, 'Le retour 2', 'mangas-image-63c4091f73c4e9.90994135.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(28, 2, 'Le retour 2', 'mangas-image-63c4091f817ae0.82545793.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(29, 2, 'Le retour 2', 'mangas-image-63c4091f8c4049.84417994.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(30, 2, 'Le retour 2', 'mangas-image-63c4091f99e1b6.64185655.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(31, 2, 'Le retour 2', 'mangas-image-63c4091fa4ad66.85619340.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(32, 2, 'Le retour 2', 'mangas-image-63c4091fcf0ac5.99028364.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35'),
(33, 2, 'Le retour 2', 'mangas-image-63c4091fe21079.06971128.jpg', 'ff', 'comics-MSm', '2023-01-15 01:09:35');

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
(6, 'Super ce mangas !!!<br />\r\n<br />\r\nLisez-le les gars !!!', 2, 'mangas-rai', '2023-01-13 10:34:08'),
(7, 'J&#039;ai vraiment aimé le scénario...', 4, 'mangas-rai', '2023-01-13 10:37:04'),
(8, 'Ah... encore ce manga !!!', 4, 'mangas-PFTO', '2023-01-13 10:42:54'),
(10, 'Laisser un commentaire. <br />\r\n<br />\r\nJe te dis QUE TU ES UN GARS BON !!!', 4, 'mangas-WDD', '2023-01-13 05:21:29'),
(11, 'C&#039;est trop ouf !!!', 3, 'mangas-WDD', '2023-01-13 05:42:23'),
(13, 'Cool', 2, 'mangas-LRose', '2023-01-14 02:57:34'),
(14, 'Super les chapitre !!!', 3, 'mangas-rai', '2023-01-14 09:07:10'),
(15, 'Je sens que ça sera interessant !!!', 3, 'mangas-PFTO', '2023-01-14 09:08:26');

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
(4, 'Donald', 'AHOSSI', 'Doni-yen001', 'ahossi@gmail.com', '$2y$10$wQgxhXFQ9iPbr7nZiNYowevVWvMfVi9t9BVSTouarHSH3mw/Mquau', 'img-63c14238458801.29282201.jpg', 'donidoniyen', '1', '2023-01-13 11:36:24'),
(5, 'Kok', 'KOKO', 'Kola44', 'lolo@gmail.com', '$2y$10$KhT6it/yxybyU8/ly2NBpehNyUxBLDVa0Ckm4SV5wm.MCzy1Y8XEi', 'account.jpg', 'asdepic4444', '1', '2023-01-14 09:37:43');

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
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
