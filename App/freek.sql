-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 11 jan. 2023 à 18:21
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
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `book_image`, `book_description`, `book_status`, `created_at`, `updated_at`) VALUES
('comics-ok', 'Hhh', 'book-image-63bec87f5ebcb2.05544558.jpg', 'jjjjn dfgffn gdfg', 'En ligne', '2023-11-01', NULL),
('mangas-belz', 'belzebub', 'book-image-63beb6dc1355e5.79279609.jpg', '1- Lorem 2- Lorem 3- Lorem ', 'En ligne', '2023-11-01', NULL),
('mangas-Blc', 'bleach', 'book-image-63beb675f1ac31.01086370.jpg', 'DevDocs combines multiple API documentations in a fast, organized, and searchable interface. Here&#039;s what you should know before you start: Open the Preferences to enable more docs and customize the UI. You don&#039;t have to use your mouse — see the list of keyboard shortcuts. The search supports fuzzy matching (e.g. &quot;bgcp&quot; brings up &quot;background-clip&quot;). To search a specific documentation, type its name (or an abbr.), then Tab. You can search using your browser&#039;s address bar — learn how. DevDocs works offline, on mobile, and can be installed as web app. For the latest news, follow @DevDocs. DevDocs is free and open source. And if you&#039;re new to coding, check out freeCodeCamp&#039;s open source curriculum. ', 'En ligne', '2023-11-01', NULL),
('mangas-Exi', 'Existence', 'book-image-63bc62ad6d9ef7.75524935.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nam quaerat dolorem doloribus adipisci perspiciatis non. Laborum, cum vero commodi corporis et nulla consectetur magni, ratione, dolore quod perspiciatis nihil. Maiores!', 'En ligne', '2023-09-01', NULL),
('mangas-KNY', 'Demon Slayer', 'book-image-63bec5c772e604.15723956.jpg', 'il était une fois... ', 'En ligne', '2023-11-01', NULL),
('mangas-PFTO', 'Player from today onward', 'book-image-63bc62d4d76b22.19812603.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nam quaerat dolorem doloribus adipisci perspiciatis non. Laborum, cum vero commodi corporis et nulla consectetur magni, ratione, dolore quod perspiciatis nihil. Maiores!', 'En ligne', '2023-09-01', NULL),
('mangas-WDD', 'White Dragon Duke: Pendragon', 'book-image-63bc6216e1f6f1.53441000.jpg', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nam quaerat dolorem doloribus adipisci perspiciatis non. Laborum, cum vero commodi corporis et nulla consectetur magni, ratione, dolore quod perspiciatis nihil. Maiores!', 'En ligne', '2023-09-01', NULL);

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
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_comment`, `user_id`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 'Cool ce manga !!', 11, 'mangas-Blc', '2023-11-01', NULL),
(2, 'Nul ce manga !!!', 11, 'mangas-Blc', '2023-11-01', NULL),
(3, 'Interessant ce mangas', 11, 'mangas-Blc', '2023-11-01', NULL),
(4, 'Cool comme manga !!!', 12, 'mangas-Blc', '2023-11-01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_lastname` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_wordkey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_firstname`, `user_lastname`, `user_username`, `user_email`, `user_password`, `user_image`, `user_wordkey`, `user_role`, `created_at`, `updated_at`) VALUES
(11, 'Koladé Moussè', 'ABOUDOU', 'As2Pic444', 'kola444@gmail.com', '$2y$10$BIFVnUq3YXxLmb3guI87DuyL3dGrPDMF4jCNv7i8jdCzoOL4bsupy', 'img-63bc36289b3899.64020701.jpg', 'asdePic771am', '1', '2023-06-01', '2023-09-01'),
(12, 'Amour', 'DAHOU', 'Dahounassara021', 'NassAmour@gmail.com', '$2y$10$eHBUXsjNOr4DbPLGJrMFcOuEAkBRUynsLJ5sx7ky3M5pgKZbg01DC', 'img-63bc3600a2ca63.00050143.jpg', 'Motcle@2001A', '1', '2023-07-01', '2023-09-01'),
(13, 'Hilary', 'ZOGO', 'Lary10', 'word@gmail.com', '$2y$10$4KU/munqXb5FSL5XXfxKheQZ8IKI79vZvu.dLVM2moBvh.7t9VFiK', NULL, 'jwdfjklbefjk', '1', '2023-07-01', NULL),
(14, 'Gdgtgh', 'HBDGHDGH', 'F12@50', 'hh@gmail.com', '$2y$10$IleIoLSlBNRRbwweGMf9UuFmFKcLLzHAgBHVqUEMsAI7j4mqFQqfS', NULL, 'aaaaaaaaaaaa', '1', '2023-07-01', NULL),
(15, 'Brunice', 'PADONOU', 'Thelo007', 'brunicepdn@gmail.com', '$2y$10$2LlMa1H2wEl4VGK4Ynk5Q.gawAHIHqZ/mUBnwm4YKEwV9YEn4ScG6', NULL, 'thelo007brun', '1', '2023-09-01', NULL);

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
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
