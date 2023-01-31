-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 31 jan. 2023 à 15:11
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
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `book_image`, `book_description`, `book_status`, `user_id`, `created_at`) VALUES
('books-historia', 'Histoire Sur Les Formateurs De HF', 'book-image-63d8e1270ee3e3.74302054.jpg', 'Tiburce K. <br />\r\nJosué T.<br />\r\n<br />\r\nInédits....❤❤❤', 'En ligne', 1, '2023-01-31 08:36:39'),
('books-InPeace', 'J&#039;aime La Paix, Je Suis La Paix❤', 'book-image-63d778c7f1ea57.36452677.jpg', 'J&#039;aime la paix....je suis la paix.<br />\r\nCette oeuvre parle d&#039;histoire d&#039;amour qui sort du commun😂❤..<br />\r\n<br />\r\nUne pure merveille je vous le dis.', 'En ligne', 1, '2023-01-19 07:17:38'),
('books-list', 'Un Nom Sur La Liste', 'book-image-63d8dbe5075704.72354383.jpg', 'La liste noire😎❤✔', 'En ligne', 1, '2023-01-31 08:14:13'),
('books-once', 'Once Up Time', 'book-image-63d7dca2077326.49722471.jpg', 'Il était une fois...', 'En ligne', 1, '2023-01-30 02:05:06'),
('books-story', 'Love Story', 'book-image-63d77b78d92e15.36942988.jpg', 'Deux jeunes tourtereaux qui se font des coups bas😂😂', 'En ligne', 1, '2023-01-19 07:15:32'),
('books-VBS', 'La Vérité Blesse Seulement Si Tu La Crois', 'book-image-63d8dba91f0ae1.16744453.jpg', 'Parfois on souffre inutilement pour pleins de raisons mais souvent c&#039;est de notre faute!!', 'En attente', 1, '2023-01-18 01:10:23'),
('comics-fives', 'Les Aventures Des Fives', 'book-image-63d7d07dbbaf00.90582549.jpg', 'Les aventures des futures élites du codage', 'En ligne', 1, '2023-01-30 01:13:17'),
('comics-hfive', 'Highfive University', 'book-image-63d7d0de8df661.28619111.jpg', 'Histoire sur HF', 'En ligne', 1, '2023-01-30 01:14:54'),
('comics-hsport', 'Highfive Sport', 'book-image-63d7d31e36dd94.80635859.jpg', 'Le sport dans la vie des étudiants d&#039;Highfive', 'En ligne', 1, '2023-01-30 01:24:30'),
('comics-impoli', 'Monsieur L&#039;impoli', 'book-image-63d77723b45293.24576452.jpg', 'Un jeune homme vivant dans son coin, ne dérangeant personne mais représenté par une personne très impolie et insociable.', 'En ligne', 1, '2023-01-26 02:16:00'),
('comics-warr', 'The Warriors', 'book-image-63d8d93a6ea0d3.48836785.jpg', 'Les warriors🤞🤞', 'En ligne', 1, '2023-01-31 08:02:50'),
('mangas-bleach', 'Bleach', 'book-image-63d8fd44a25cc2.42386607.jpg', 'Les shinigamis😎...<br />\r\nIchigo est un humain qui est devenu un shinigami provisoire lors d&#039;une attaque...', 'En ligne', 1, '2023-01-31 10:36:36'),
('mangas-eeo', 'L&#039;ennemi De Mon Ennemi Est Une Opportunité', 'book-image-63d92d07031680.04655073.jpg', 'L&#039;ennemi de mon ennemi est une opportunité..', 'En ligne', 1, '2023-01-31 08:03:44'),
('mangas-Exi', 'Existence', 'book-image-63d77d3904e6f5.07385922.jpg', 'Un être ayant vécu plusieurs vies animales et qui finalement vit une vie humaine en ayant force de toutes les vies qu&#039;il avait vécu...', 'En ligne', 1, '2023-01-18 00:29:09'),
('mangas-JNK', 'Jujutsu No Kaisen', 'book-image-63c7fcfb290e19.49085009.jpg', 'Un jeune homme a bouffé le doigt du roi des fléaux (Ryomen Sukuna) et a acquis sa puissance mais en contre-partie il abrite en lui ce fléau.', 'En ligne', 1, '2023-01-18 01:03:21'),
('mangas-KNY', 'Demons Slayers', 'book-image-63d8decfda6056.81329141.jpg', 'Un démon tua sa famille pendant qu&#039;il était parti travailler...', 'En ligne', 1, '2023-01-31 08:26:39'),
('mangas-MHA', 'My Hero Academia', 'book-image-63cbbd8fb752e5.75667214.jpg', 'Un jeune garçon qui rêvait d&#039;être un héros mais qui est né sans pouvoir..<br />\r\nMais plus tard il fût faire la rencontre d&#039;un héros qui exauça son voeu', 'En ligne', 1, '2023-01-21 09:24:37'),
('mangas-reson', 'Résonnance', 'book-image-63d77b51cbbc53.64740926.jpg', 'La raison du plus fort est toujours la meilleure dit-on!!!<br />\r\nAlors quand les plus forts se réunissent qu&#039;est-ce qui se passe ?', 'En attente', 1, '2023-01-26 02:14:01'),
('mangas-WDD', 'White Dragon Duke: Pendragon', 'book-image-63c803ee363cf5.71137814.jpg', 'Deux êtres qui meurent le même jour, au même endroit.<br />\r\nL&#039;un des deux ayants un pouvoir de réincarnation, a pu se réincarner mais à un défaut près.<br />\r\nIl s&#039;est réincarné dans le corps de l&#039;autre qui est mort.', 'Retirer', 1, '2023-01-18 01:36:30');

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
(1, 1, 'Le retour 1', 'mangas-image-63d7c815ef90a3.94357519.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(2, 1, 'Le retour 1', 'mangas-image-63d7c816000209.94060145.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(3, 1, 'Le retour 1', 'mangas-image-63d7c81602ac05.37784947.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(4, 1, 'Le retour 1', 'mangas-image-63d7c81605e919.94526811.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(5, 1, 'Le retour 1', 'mangas-image-63d7c816088a55.18775594.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(6, 1, 'Le retour 1', 'mangas-image-63d7c8160d4833.03182821.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(7, 1, 'Le retour 1', 'mangas-image-63d7c8160fec93.35968825.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(8, 1, 'Le retour 1', 'mangas-image-63d7c816123d33.14717321.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(9, 1, 'Le retour 1', 'mangas-image-63d7c816148d70.03526738.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(10, 1, 'Le retour 1', 'mangas-image-63d7c816166731.23357398.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(11, 1, 'Le retour 1', 'mangas-image-63d7c8161bd0c6.01614551.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(12, 1, 'Le retour 1', 'mangas-image-63d7c8161e2165.64628872.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(13, 1, 'Le retour 1', 'mangas-image-63d7c81620a4d5.34299384.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(14, 1, 'Le retour 1', 'mangas-image-63d7c81627a1e2.78988682.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(15, 1, 'Le retour 1', 'mangas-image-63d7c8162f9026.69453536.jpg', 'Le début de tout...', 'mangas-Exi', '2023-01-30 00:37:25'),
(16, 1, 'Le petit garçon', 'mangas-image-63d7c8523e86f5.88118361.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(17, 1, 'Le petit garçon', 'mangas-image-63d7c85240beb8.28256664.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(18, 1, 'Le petit garçon', 'mangas-image-63d7c85242fb82.46810230.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(19, 1, 'Le petit garçon', 'mangas-image-63d7c852452a15.59212756.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(20, 1, 'Le petit garçon', 'mangas-image-63d7c85247cfa0.12715661.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(21, 1, 'Le petit garçon', 'mangas-image-63d7c8524a48e2.93724563.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(22, 1, 'Le petit garçon', 'mangas-image-63d7c8524c8309.48389442.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(23, 1, 'Le petit garçon', 'mangas-image-63d7c8524efde4.32255261.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(24, 1, 'Le petit garçon', 'mangas-image-63d7c8525112a1.41395823.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(25, 1, 'Le petit garçon', 'mangas-image-63d7c852532887.23955054.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(26, 1, 'Le petit garçon', 'mangas-image-63d7c852554542.93433109.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(27, 1, 'Le petit garçon', 'mangas-image-63d7c85257bcc2.33263501.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(28, 1, 'Le petit garçon', 'mangas-image-63d7c85259d1a6.30421735.jpg', 'Le petit garçon sans pouvoir', 'mangas-MHA', '2023-01-30 00:38:26'),
(29, 1, 'Yuji Idatori', 'mangas-image-63d7c874d2dc51.20515761.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(30, 1, 'Yuji Idatori', 'mangas-image-63d7c874d5c1b3.52169922.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(31, 1, 'Yuji Idatori', 'mangas-image-63d7c874d81a06.57151794.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(32, 1, 'Yuji Idatori', 'mangas-image-63d7c874da8849.22464607.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(33, 1, 'Yuji Idatori', 'mangas-image-63d7c874e24a85.49438427.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(34, 1, 'Yuji Idatori', 'mangas-image-63d7c874e9d417.47553872.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(35, 1, 'Yuji Idatori', 'mangas-image-63d7c874ec46c8.44340118.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(36, 1, 'Yuji Idatori', 'mangas-image-63d7c874ee4b47.51776173.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(37, 1, 'Yuji Idatori', 'mangas-image-63d7c874f08aa9.93575553.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(38, 1, 'Yuji Idatori', 'mangas-image-63d7c874f25df6.50812315.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(39, 1, 'Yuji Idatori', 'mangas-image-63d7c8750069e7.47493525.jpg', 'Yuji Idatori', 'mangas-JNK', '2023-01-30 00:39:00'),
(40, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b3f01499.71824116.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(41, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b3f2d5f4.49289783.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(42, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b400a8d7.00701811.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(43, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4027e02.23054281.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(44, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4047015.92411561.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(45, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4067f96.26923236.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(46, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4087877.60186284.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(47, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b40b4745.71140376.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(48, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b40d4801.62503983.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(49, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b40f02a2.59495751.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(50, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4113179.84482409.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(51, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4132ea4.78835020.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(52, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4153d23.66365090.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(53, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b4172834.32091481.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(54, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b41e1048.62623780.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(55, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b41fc653.90015362.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(56, 2, 'Ryomen Sukuna', 'mangas-image-63d7c8b421d399.54943515.jpg', 'Le roi des Fléaux', 'mangas-JNK', '2023-01-30 00:40:03'),
(85, 1, 'L&#039;amour 0', NULL, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero esse totam nisi ducimus corporis porro itaque ab quia dolorem doloremque. Hic quod similique quis temporibus aperiam architecto, ab sunt totam quas odio quo numquam vel itaque, blanditiis ea repellendus inventore officiis reprehenderit voluptate officia dignissimos molestias pariatur deserunt quidem? <br />\r\n<br />\r\nMagni maiores illum iusto dolorum excepturi debitis eum dolores fugit? Magni aliquid iste sint esse vitae nulla, culpa rem ad atque voluptas! Pariatur dolore itaque est ipsa aut optio dolor iusto consequatur hic reiciendis sequi voluptas molestiae commodi iste sit, culpa in, ab voluptatibus. Aliquid pariatur ea architecto, debitis facilis necessitatibus dolorem natus autem doloremque amet laboriosam voluptatum recusandae obcaecati unde labore alias nihil quam deleniti sequi harum adipisci eligendi deserunt consequatur nisi? Corporis magnam impedit autem suscipit aliquid? <br />\r\n<br />\r\nDolores commodi recusandae dolore tempora repellendus cum possimus cumque blanditiis eveniet inventore earum, molestias nam odio quisquam non, minima deleniti architecto esse perferendis autem laudantium. Numquam molestias tempore itaque alias aliquid fuga pariatur cum aspernatur? Veritatis sint voluptatum enim, exercitationem asperiores iure magnam laudantium aliquid inventore possimus illum soluta labore a maxime expedita corrupti, totam minus modi aperiam distinctio voluptates minima! Ad eius fuga possimus sunt iste, sed consectetur accusantium maxime voluptas modi ab distinctio facilis at odio atque quasi autem excepturi in, sint voluptate corporis? Repellendus, error optio! Officia culpa voluptas fuga porro quisquam, saepe tempora, itaque delectus voluptatem laudantium reprehenderit. Asperiores est, fugiat magnam sunt cupiditate laborum natus suscipit voluptates nostrum dignissimos voluptatum accusantium pariatur tempore, earum magni facilis non! Exercitationem voluptates esse, repellendus neque, aliquam rerum quis reprehenderit ullam dignissimos facilis iure ipsam ut voluptatum enim cumque, sunt necessitatibus illum fugiat quaerat est. Quas molestias quidem minima labore accusamus provident pariatur possimus, veritatis recusandae vitae illo dolorem dolorum porro consequatur rerum voluptates non! Ducimus quidem tempora quam rem odio officia eius cumque laborum in, asperiores perferendis? Dolor, autem. Cupiditate sed atque inventore voluptates deleniti exercitationem incidunt itaque ad culpa in debitis porro fugit aperiam nemo voluptatum, repudiandae sit natus quae alias? Aliquid rerum architecto corporis explicabo amet alias vel tempore, cupiditate voluptates? <br />\r\n<br />\r\nAccusamus, quia esse animi quasi exercitationem quos similique reiciendis perspiciatis quis laborum. Sapiente, totam? Molestias officia, voluptas repudiandae sint rerum consequatur culpa debitis soluta! Ut suscipit quo, nobis quibusdam esse similique, alias magni animi asperiores aliquam quod necessitatibus nulla tempore eos doloribus fugiat sit consectetur. Fuga placeat, reprehenderit mollitia asperiores provident accusantium optio eum laboriosam ab ipsa.', 'books-InPeace', '2023-01-30 00:44:19'),
(87, 2, 'L&#039;amour 1', NULL, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero esse totam nisi ducimus corporis porro itaque ab quia dolorem doloremque. Hic quod similique quis temporibus aperiam architecto, ab sunt totam quas odio quo numquam vel itaque, blanditiis ea repellendus inventore officiis reprehenderit voluptate officia dignissimos molestias pariatur deserunt quidem? <br />\r\n<br />\r\nMagni maiores illum iusto dolorum excepturi debitis eum dolores fugit? Magni aliquid iste sint esse vitae nulla, culpa rem ad atque voluptas! Pariatur dolore itaque est ipsa aut optio dolor iusto consequatur hic reiciendis sequi voluptas molestiae commodi iste sit, culpa in, ab voluptatibus. Aliquid pariatur ea architecto, debitis facilis necessitatibus dolorem natus autem doloremque amet laboriosam voluptatum recusandae obcaecati unde labore alias nihil quam deleniti sequi harum adipisci eligendi deserunt consequatur nisi? Corporis magnam impedit autem suscipit aliquid? Dolores commodi recusandae dolore tempora repellendus cum possimus cumque blanditiis eveniet inventore earum, molestias nam odio quisquam non, minima deleniti architecto esse perferendis autem laudantium. Numquam molestias tempore itaque alias aliquid fuga pariatur cum aspernatur? Veritatis sint voluptatum enim, exercitationem asperiores iure magnam laudantium aliquid inventore possimus illum soluta labore a maxime expedita corrupti, totam minus modi aperiam distinctio voluptates minima! Ad eius fuga possimus sunt iste, sed consectetur accusantium maxime voluptas modi ab distinctio facilis at odio atque quasi autem excepturi in, sint voluptate corporis? Repellendus, error optio! Officia culpa voluptas fuga porro quisquam, saepe tempora, itaque delectus voluptatem laudantium reprehenderit. Asperiores est, fugiat magnam sunt cupiditate laborum natus suscipit voluptates nostrum dignissimos voluptatum accusantium pariatur tempore, earum magni facilis non! Exercitationem voluptates esse, repellendus neque, aliquam rerum quis reprehenderit ullam dignissimos facilis iure ipsam ut voluptatum enim cumque, sunt necessitatibus illum fugiat quaerat est. Quas molestias quidem minima labore accusamus provident pariatur possimus, veritatis recusandae vitae illo dolorem dolorum porro consequatur rerum voluptates non! Ducimus quidem tempora quam rem odio officia eius cumque laborum in, asperiores perferendis? Dolor, autem. <br />\r\n<br />\r\nCupiditate sed atque inventore voluptates deleniti exercitationem incidunt itaque ad culpa in debitis porro fugit aperiam nemo voluptatum, repudiandae sit natus quae alias? Aliquid rerum architecto corporis explicabo amet alias vel tempore, cupiditate voluptates? Accusamus, quia esse animi quasi exercitationem quos similique reiciendis perspiciatis quis laborum. Sapiente, totam? Molestias officia, voluptas repudiandae sint rerum consequatur culpa debitis soluta! Ut suscipit quo, nobis quibusdam esse similique, alias magni animi asperiores aliquam quod necessitatibus nulla tempore eos doloribus fugiat sit consectetur. Fuga placeat, reprehenderit mollitia asperiores provident accusantium optio eum laboriosam ab ipsa.', 'books-InPeace', '2023-01-30 00:49:42'),
(91, 1, 'Sport 0', 'comics-image-63d7d437a971c7.62833661.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(92, 1, 'Sport 0', 'comics-image-63d7d437ac88b3.88150287.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(93, 1, 'Sport 0', 'comics-image-63d7d437af86e8.10551067.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(94, 1, 'Sport 0', 'comics-image-63d7d437b20795.13154885.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(95, 1, 'Sport 0', 'comics-image-63d7d437b44367.64180721.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(96, 1, 'Sport 0', 'comics-image-63d7d437b5f562.59190873.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(97, 1, 'Sport 0', 'comics-image-63d7d437b7de61.38554683.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(98, 1, 'Sport 0', 'comics-image-63d7d437ba2c72.83609298.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(99, 1, 'Sport 0', 'comics-image-63d7d437bc76c6.13656709.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(100, 1, 'Sport 0', 'comics-image-63d7d437be6239.47644894.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(101, 1, 'Sport 0', 'comics-image-63d7d437c0aa67.10680324.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(102, 1, 'Sport 0', 'comics-image-63d7d437c2eae5.18586397.jpg', 'Le trip &amp;&amp; le body attack', 'comics-hsport', '2023-01-30 01:29:11'),
(103, 1, 'HF 0', 'comics-image-63d7d496254265.49880296.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(104, 1, 'HF 0', 'comics-image-63d7d49628b714.03368956.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(105, 1, 'HF 0', 'comics-image-63d7d4962b45d1.65241520.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(106, 1, 'HF 0', 'comics-image-63d7d4962e1449.26258121.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(107, 1, 'HF 0', 'comics-image-63d7d496307802.38977200.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(108, 1, 'HF 0', 'comics-image-63d7d496332430.63506703.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(109, 1, 'HF 0', 'comics-image-63d7d49635de22.72114721.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(110, 1, 'HF 0', 'comics-image-63d7d496380b06.71849736.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(111, 1, 'HF 0', 'comics-image-63d7d4963ab713.98725452.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(112, 1, 'HF 0', 'comics-image-63d7d4963cf0d0.09165115.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(113, 1, 'HF 0', 'comics-image-63d7d4963f85b1.33966303.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(114, 1, 'HF 0', 'comics-image-63d7d49641e457.65246440.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(115, 1, 'HF 0', 'comics-image-63d7d496445346.26884994.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(116, 1, 'HF 0', 'comics-image-63d7d496475d57.79509261.jpg', 'Highfive Zéro', 'comics-hfive', '2023-01-30 01:30:46'),
(117, 1, 'Nos premières aventures', 'comics-image-63d7d51127cbe1.66227436.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(118, 1, 'Nos premières aventures', 'comics-image-63d7d5112c5059.61111098.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(119, 1, 'Nos premières aventures', 'comics-image-63d7d5112ecb89.34846662.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(120, 1, 'Nos premières aventures', 'comics-image-63d7d51130f911.72215870.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(121, 1, 'Nos premières aventures', 'comics-image-63d7d51132f8c4.55183870.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(122, 1, 'Nos premières aventures', 'comics-image-63d7d51134d220.22323392.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(123, 1, 'Nos premières aventures', 'comics-image-63d7d5113701e9.49492343.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(124, 1, 'Nos premières aventures', 'comics-image-63d7d511398102.94448894.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(125, 1, 'Nos premières aventures', 'comics-image-63d7d5113b8e89.73419114.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(126, 1, 'Nos premières aventures', 'comics-image-63d7d5113df3f9.63311945.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(127, 1, 'Nos premières aventures', 'comics-image-63d7d511407092.07278309.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(128, 1, 'Nos premières aventures', 'comics-image-63d7d51142a922.51623449.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(129, 1, 'Nos premières aventures', 'comics-image-63d7d511451a72.51078699.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(130, 1, 'Nos premières aventures', 'comics-image-63d7d5114760f9.79524738.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(131, 1, 'Nos premières aventures', 'comics-image-63d7d511496500.06729802.jpg', 'Oh là là !!! <br />\r\nTrop d&#039;émotions', 'comics-fives', '2023-01-30 01:32:49'),
(132, 1, 'Les amoureux 1', NULL, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero esse totam nisi ducimus corporis porro itaque ab quia dolorem doloremque. Hic quod similique quis temporibus aperiam architecto, ab sunt totam quas odio quo numquam vel itaque, blanditiis ea repellendus inventore officiis reprehenderit voluptate officia dignissimos molestias pariatur deserunt quidem? Magni maiores illum iusto dolorum excepturi debitis eum dolores fugit? Magni aliquid iste sint esse vitae nulla, culpa rem ad atque voluptas! Pariatur dolore itaque est ipsa aut optio dolor iusto consequatur hic reiciendis sequi voluptas molestiae commodi iste sit, culpa in, ab voluptatibus. Aliquid pariatur ea architecto, debitis facilis necessitatibus dolorem natus autem doloremque amet laboriosam voluptatum recusandae obcaecati unde labore alias nihil quam deleniti sequi harum adipisci eligendi deserunt consequatur nisi? Corporis magnam impedit autem suscipit aliquid? Dolores commodi recusandae dolore tempora repellendus cum possimus cumque blanditiis eveniet inventore earum, molestias nam odio quisquam non, minima deleniti architecto esse perferendis autem laudantium. <br />\r\n<br />\r\nNumquam molestias tempore itaque alias aliquid fuga pariatur cum aspernatur? Veritatis sint voluptatum enim, exercitationem asperiores iure magnam laudantium aliquid inventore possimus illum soluta labore a maxime expedita corrupti, totam minus modi aperiam distinctio voluptates minima! Ad eius fuga possimus sunt iste, sed consectetur accusantium maxime voluptas modi ab distinctio facilis at odio atque quasi autem excepturi in, sint voluptate corporis? Repellendus, error optio! Officia culpa voluptas fuga porro quisquam, saepe tempora, itaque delectus voluptatem laudantium reprehenderit. Asperiores est, fugiat magnam sunt cupiditate laborum natus suscipit voluptates nostrum dignissimos voluptatum accusantium pariatur tempore, earum magni facilis non! Exercitationem voluptates esse, repellendus neque, aliquam rerum quis reprehenderit ullam dignissimos facilis iure ipsam ut voluptatum enim cumque, sunt necessitatibus illum fugiat quaerat est. Quas molestias quidem minima labore accusamus provident pariatur possimus, veritatis recusandae vitae illo dolorem dolorum porro consequatur rerum voluptates non! <br />\r\n<br />\r\nDucimus quidem tempora quam rem odio officia eius cumque laborum in, asperiores perferendis? Dolor, autem. Cupiditate sed atque inventore voluptates deleniti exercitationem incidunt itaque ad culpa in debitis porro fugit aperiam nemo voluptatum, repudiandae sit natus quae alias? Aliquid rerum architecto corporis explicabo amet alias vel tempore, cupiditate voluptates? Accusamus, quia esse animi quasi exercitationem quos similique reiciendis perspiciatis quis laborum. Sapiente, totam? Molestias officia, voluptas repudiandae sint rerum consequatur culpa debitis soluta! Ut suscipit quo, nobis quibusdam esse similique, alias magni animi asperiores aliquam quod necessitatibus nulla tempore eos doloribus fugiat sit consectetur. Fuga placeat, reprehenderit mollitia asperiores provident accusantium optio eum laboriosam ab ipsa.', 'books-story', '2023-01-30 01:35:58'),
(134, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb8656cf1.48992219.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(135, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb86b1fb6.59011164.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(136, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb86cf516.72859397.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(137, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb8732872.39444522.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(138, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb874f833.32442786.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(139, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb87750b7.50736201.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(140, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb879c2e0.02245166.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(141, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb87bcf42.76705774.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(142, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb87de9d8.47390418.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(143, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb8800d40.68908503.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(144, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb8821876.55394099.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(145, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb8840445.51565149.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(146, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb88635b9.95803232.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(147, 1, 'L&#039;impoli 0', 'comics-image-63d7dbb888b594.06398927.jpg', 'Le jeune impoli', 'comics-impoli', '2023-01-30 02:01:12'),
(151, 1, 'Il était une fois', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore suscipit totam saepe ipsam ut officiis inventore nobis veritatis ex numquam eos nesciunt nemo atque magni, consequatur modi at quia sapiente ea incidunt accusamus pariatur? Dolorum similique architecto velit et atque quibusdam, porro, fuga, sapiente perspiciatis tempora tempore deserunt nam. Sed repellendus maxime id. Provident consectetur quibusdam placeat cupiditate nemo ad incidunt iusto necessitatibus facilis, quasi quo quia labore earum exercitationem vero iure repudiandae quaerat error suscipit assumenda, perspiciatis ex autem corrupti? Expedita ex illo officia nulla adipisci veniam fugit atque rem exercitationem dolores sint omnis voluptates a magnam voluptate ducimus esse, itaque laudantium corporis quis necessitatibus doloribus aliquid dignissimos excepturi! <br />\r\n<br />\r\nOptio totam dolorum quae repellat ipsam velit, at exercitationem vero sapiente cum harum debitis, perferendis modi molestiae error similique. Asperiores ex voluptate illum maiores ducimus. Eius tempore dolore atque temporibus saepe blanditiis voluptas aut repellat, laboriosam vero nesciunt quas adipisci iste maxime autem consectetur ipsa debitis sed fuga obcaecati eveniet dignissimos doloremque odit deleniti. At architecto molestiae quos reiciendis in ipsam ea necessitatibus deleniti corrupti nihil repudiandae, ipsa sint vitae omnis aperiam error perspiciatis dignissimos nisi ullam rerum blanditiis. Harum repellat ab unde reprehenderit repudiandae dicta, vero vel quam nulla eos iure, illo est! Vel deserunt quam dolorum veritatis accusantium, repellendus odio architecto ipsum pariatur, dolore ut mollitia error amet, at illum repudiandae debitis quos tenetur ad praesentium doloremque aperiam temporibus quo facere? Iure nulla ipsum quasi, nobis, placeat tempore optio odio, veniam dolorem distinctio libero asperiores perspiciatis consectetur autem exercitationem quae temporibus debitis tenetur dolorum totam. Officia vel culpa in quasi atque suscipit nam deserunt quis magnam iste veniam porro expedita delectus, quam corporis ex est velit reprehenderit quo esse qui mollitia! Officia optio sunt unde! Repellendus voluptates esse quasi distinctio sint. Nisi porro reprehenderit maiores deleniti doloremque excepturi illum ipsum magnam, nesciunt facere cumque necessitatibus ut nostrum! Vel illum deleniti libero quam doloribus. Consequatur culpa quaerat iure optio amet ducimus explicabo quam eligendi, eaque, ad error aliquam enim, omnis unde aperiam impedit ex? <br />\r\n<br />\r\nLibero dolorem itaque alias cum consectetur nam eos suscipit aspernatur quae architecto atque excepturi perferendis unde laborum veritatis delectus nesciunt natus ut eligendi consequuntur vel, pariatur harum, temporibus iure. Alias perspiciatis nemo sit totam quam nulla. Illum tenetur nisi iste architecto alias, at dolorem praesentium debitis, cum aliquam a, voluptatum dignissimos neque quos eveniet. Eius exercitationem nisi dignissimos quo debitis qui ipsa perferendis nostrum aliquid laboriosam, labore dicta enim aut. Nulla officiis voluptatem expedita rerum dolorem possimus adipisci enim maiores veritatis, impedit quaerat non dolorum doloremque nemo nostrum inventore temporibus. Repellendus non maxime magnam, in fuga odio quidem ex dolor officia expedita assumenda nisi quos sit recusandae reprehenderit esse accusamus veniam unde dolorem officiis? Possimus, assumenda! Dolor, porro nesciunt ut praesentium, rem, expedita consectetur minima unde repellendus autem cumque sint nihil eveniet dolorem. Nostrum animi saepe similique soluta ad numquam asperiores eum error! Ratione commodi voluptatum sapiente necessitatibus exercitationem velit fugit natus possimus nemo, porro recusandae dignissimos, ipsam alias quidem. Facilis quod asperiores odio delectus.', 'books-once', '2023-01-31 08:05:57'),
(152, 2, 'Il était une fois 1', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore suscipit totam saepe ipsam ut officiis inventore nobis veritatis ex numquam eos nesciunt nemo atque magni, consequatur modi at quia sapiente ea incidunt accusamus pariatur? Dolorum similique architecto velit et atque quibusdam, porro, fuga, sapiente perspiciatis tempora tempore deserunt nam. Sed repellendus maxime id. <br />\r\n<br />\r\nProvident consectetur quibusdam placeat cupiditate nemo ad incidunt iusto necessitatibus facilis, quasi quo quia labore earum exercitationem vero iure repudiandae quaerat error suscipit assumenda, perspiciatis ex autem corrupti? Expedita ex illo officia nulla adipisci veniam fugit atque rem exercitationem dolores sint omnis voluptates a magnam voluptate ducimus esse, itaque laudantium corporis quis necessitatibus doloribus aliquid dignissimos excepturi! Optio totam dolorum quae repellat ipsam velit, at exercitationem vero sapiente cum harum debitis, perferendis modi molestiae error similique. Asperiores ex voluptate illum maiores ducimus. Eius tempore dolore atque temporibus saepe blanditiis voluptas aut repellat, laboriosam vero nesciunt quas adipisci iste maxime autem consectetur ipsa debitis sed fuga obcaecati eveniet dignissimos doloremque odit deleniti. At architecto molestiae quos reiciendis in ipsam ea necessitatibus deleniti corrupti nihil repudiandae, ipsa sint vitae omnis aperiam error perspiciatis dignissimos nisi ullam rerum blanditiis. Harum repellat ab unde reprehenderit repudiandae dicta, vero vel quam nulla eos iure, illo est! <br />\r\n<br />\r\nVel deserunt quam dolorum veritatis accusantium, repellendus odio architecto ipsum pariatur, dolore ut mollitia error amet, at illum repudiandae debitis quos tenetur ad praesentium doloremque aperiam temporibus quo facere? Iure nulla ipsum quasi, nobis, placeat tempore optio odio, veniam dolorem distinctio libero asperiores perspiciatis consectetur autem exercitationem quae temporibus debitis tenetur dolorum totam. Officia vel culpa in quasi atque suscipit nam deserunt quis magnam iste veniam porro expedita delectus, quam corporis ex est velit reprehenderit quo esse qui mollitia! Officia optio sunt unde! Repellendus voluptates esse quasi distinctio sint. Nisi porro reprehenderit maiores deleniti doloremque excepturi illum ipsum magnam, nesciunt facere cumque necessitatibus ut nostrum! Vel illum deleniti libero quam doloribus. Consequatur culpa quaerat iure optio amet ducimus explicabo quam eligendi, eaque, ad error aliquam enim, omnis unde aperiam impedit ex? Libero dolorem itaque alias cum consectetur nam eos suscipit aspernatur quae architecto atque excepturi perferendis unde laborum veritatis delectus nesciunt natus ut eligendi consequuntur vel, pariatur harum, temporibus iure. Alias perspiciatis nemo sit totam quam nulla. <br />\r\n<br />\r\nIllum tenetur nisi iste architecto alias, at dolorem praesentium debitis, cum aliquam a, voluptatum dignissimos neque quos eveniet. Eius exercitationem nisi dignissimos quo debitis qui ipsa perferendis nostrum aliquid laboriosam, labore dicta enim aut. Nulla officiis voluptatem expedita rerum dolorem possimus adipisci enim maiores veritatis, impedit quaerat non dolorum doloremque nemo nostrum inventore temporibus. Repellendus non maxime magnam, in fuga odio quidem ex dolor officia expedita assumenda nisi quos sit recusandae reprehenderit esse accusamus veniam unde dolorem officiis? Possimus, assumenda! Dolor, porro nesciunt ut praesentium, rem, expedita consectetur minima unde repellendus autem cumque sint nihil eveniet dolorem. Nostrum animi saepe similique soluta ad numquam asperiores eum error! Ratione commodi voluptatum sapiente necessitatibus exercitationem velit fugit natus possimus nemo, porro recusandae dignissimos, ipsam alias quidem. Facilis quod asperiores odio delectus.', 'books-once', '2023-01-31 08:06:23'),
(153, 3, 'L&#039;amour 2', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore suscipit totam saepe ipsam ut officiis inventore nobis veritatis ex numquam eos nesciunt nemo atque magni, consequatur modi at quia sapiente ea incidunt accusamus pariatur? Dolorum similique architecto velit et atque quibusdam, porro, fuga, sapiente perspiciatis tempora tempore deserunt nam. Sed repellendus maxime id. Provident consectetur quibusdam placeat cupiditate nemo ad incidunt iusto necessitatibus facilis, quasi quo quia labore earum exercitationem vero iure repudiandae quaerat error suscipit assumenda, perspiciatis ex autem corrupti? Expedita ex illo officia nulla adipisci veniam fugit atque rem exercitationem dolores sint omnis voluptates a magnam voluptate ducimus esse, itaque laudantium corporis quis necessitatibus doloribus aliquid dignissimos excepturi! <br />\r\n<br />\r\nOptio totam dolorum quae repellat ipsam velit, at exercitationem vero sapiente cum harum debitis, perferendis modi molestiae error similique. Asperiores ex voluptate illum maiores ducimus. Eius tempore dolore atque temporibus saepe blanditiis voluptas aut repellat, laboriosam vero nesciunt quas adipisci iste maxime autem consectetur ipsa debitis sed fuga obcaecati eveniet dignissimos doloremque odit deleniti. At architecto molestiae quos reiciendis in ipsam ea necessitatibus deleniti corrupti nihil repudiandae, ipsa sint vitae omnis aperiam error perspiciatis dignissimos nisi ullam rerum blanditiis. Harum repellat ab unde reprehenderit repudiandae dicta, vero vel quam nulla eos iure, illo est! Vel deserunt quam dolorum veritatis accusantium, repellendus odio architecto ipsum pariatur, dolore ut mollitia error amet, at illum repudiandae debitis quos tenetur ad praesentium doloremque aperiam temporibus quo facere? Iure nulla ipsum quasi, nobis, placeat tempore optio odio, veniam dolorem distinctio libero asperiores perspiciatis consectetur autem exercitationem quae temporibus debitis tenetur dolorum totam. Officia vel culpa in quasi atque suscipit nam deserunt quis magnam iste veniam porro expedita delectus, quam corporis ex est velit reprehenderit quo esse qui mollitia! Officia optio sunt unde! Repellendus voluptates esse quasi distinctio sint. Nisi porro reprehenderit maiores deleniti doloremque excepturi illum ipsum magnam, nesciunt facere cumque necessitatibus ut nostrum! Vel illum deleniti libero quam doloribus. Consequatur culpa quaerat iure optio amet ducimus explicabo quam eligendi, eaque, ad error aliquam enim, omnis unde aperiam impedit ex? Libero dolorem itaque alias cum consectetur nam eos suscipit aspernatur quae architecto atque excepturi perferendis unde laborum veritatis delectus nesciunt natus ut eligendi consequuntur vel, pariatur harum, temporibus iure. Alias perspiciatis nemo sit totam quam nulla. <br />\r\n<br />\r\nIllum tenetur nisi iste architecto alias, at dolorem praesentium debitis, cum aliquam a, voluptatum dignissimos neque quos eveniet. Eius exercitationem nisi dignissimos quo debitis qui ipsa perferendis nostrum aliquid laboriosam, labore dicta enim aut. Nulla officiis voluptatem expedita rerum dolorem possimus adipisci enim maiores veritatis, impedit quaerat non dolorum doloremque nemo nostrum inventore temporibus. Repellendus non maxime magnam, in fuga odio quidem ex dolor officia expedita assumenda nisi quos sit recusandae reprehenderit esse accusamus veniam unde dolorem officiis? Possimus, assumenda! Dolor, porro nesciunt ut praesentium, rem, expedita consectetur minima unde repellendus autem cumque sint nihil eveniet dolorem. Nostrum animi saepe similique soluta ad numquam asperiores eum error! Ratione commodi voluptatum sapiente necessitatibus exercitationem velit fugit natus possimus nemo, porro recusandae dignissimos, ipsam alias quidem. Facilis quod asperiores odio delectus.', 'books-InPeace', '2023-01-31 08:07:12'),
(154, 1, 'L&#039;opportunité', 'mangas-image-63d8daae173160.39608363.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(155, 1, 'L&#039;opportunité', 'mangas-image-63d8daae1c5661.80248398.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(156, 1, 'L&#039;opportunité', 'mangas-image-63d8daae1e9c94.17046165.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(157, 1, 'L&#039;opportunité', 'mangas-image-63d8daae209700.26954571.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(158, 1, 'L&#039;opportunité', 'mangas-image-63d8daae22f612.23718276.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(159, 1, 'L&#039;opportunité', 'mangas-image-63d8daae278bd5.53389150.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(160, 1, 'L&#039;opportunité', 'mangas-image-63d8daae298d38.97138679.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(161, 1, 'L&#039;opportunité', 'mangas-image-63d8daae2b6157.41239312.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(162, 1, 'L&#039;opportunité', 'mangas-image-63d8daae32db18.18632458.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(163, 1, 'L&#039;opportunité', 'mangas-image-63d8daae3a95a4.41517649.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(164, 1, 'L&#039;opportunité', 'mangas-image-63d8daae4235b7.76391429.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(165, 1, 'L&#039;opportunité', 'mangas-image-63d8daae49c7a4.51631864.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(166, 1, 'L&#039;opportunité', 'mangas-image-63d8daae514526.51006582.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(167, 1, 'L&#039;opportunité', 'mangas-image-63d8daae5363a3.41558292.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(168, 1, 'L&#039;opportunité', 'mangas-image-63d8daae58ad78.59600975.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(169, 1, 'L&#039;opportunité', 'mangas-image-63d8daae5ab9d1.61029152.jpg', 'Ce sont les intérêts qui guident le monde👍👌.', 'mangas-eeo', '2023-01-31 08:09:02'),
(171, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d2854a0.00400051.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(172, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d2aaee1.08971899.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(173, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d2ca752.80652189.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(174, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d2e55d4.06786911.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(175, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d32a5b4.59516058.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(176, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d368094.69130470.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(177, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d3e6ce6.41128094.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(178, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d406fd0.02451456.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(179, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d4270b8.56205451.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(180, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d49a242.84805698.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(181, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d519684.43914379.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(182, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d5934f2.15948345.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(183, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d60fb20.41010655.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(184, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d6362a1.80207102.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(185, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d6880f4.29177542.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(186, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d6ae8e1.26345604.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(187, 2, 'L&#039;impoli 1', 'comics-image-63d8de5d6ccdf2.85631020.jpg', 'Le petit impoli', 'comics-impoli', '2023-01-31 08:24:45'),
(188, 2, 'Le retour 2', 'mangas-image-63d8df3edf2683.69172663.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(189, 2, 'Le retour 2', 'mangas-image-63d8df3ee1eb97.67365848.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(190, 2, 'Le retour 2', 'mangas-image-63d8df3ee3aa86.18822072.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(191, 2, 'Le retour 2', 'mangas-image-63d8df3ee57230.37099376.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(192, 2, 'Le retour 2', 'mangas-image-63d8df3ee76d11.61727058.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(193, 2, 'Le retour 2', 'mangas-image-63d8df3ee972b5.62038540.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(194, 2, 'Le retour 2', 'mangas-image-63d8df3eeb3b58.12691580.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(195, 2, 'Le retour 2', 'mangas-image-63d8df3eed6919.32796334.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(196, 2, 'Le retour 2', 'mangas-image-63d8df3eef20f7.30460070.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(197, 2, 'Le retour 2', 'mangas-image-63d8df3ef12c09.06671352.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(198, 2, 'Le retour 2', 'mangas-image-63d8df3ef2f861.69994305.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(199, 2, 'Le retour 2', 'mangas-image-63d8df3f00e852.11374667.jpg', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(200, 2, 'Le retour 2', 'mangas-image-63d8df3f02d255.04818198.png', '...', 'mangas-Exi', '2023-01-31 08:28:30'),
(201, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe487659.16473093.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(202, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe4c53b7.86801824.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(203, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe4ef435.73738627.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(204, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe5135d9.38630103.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(205, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe538706.15895630.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(206, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe556ef0.77879309.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(207, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe57b8e5.02556821.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(208, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe5e3486.37503914.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(209, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe606834.85412891.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(210, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe627ce1.78995115.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(211, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe64dfa1.16486785.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(212, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe674d09.86190353.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(213, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe6d3369.54462200.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(214, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe6fb0d8.43209403.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(215, 2, 'L&#039;opportunité 1', 'mangas-image-63d92cbe721666.99538646.jpg', 'Les opportunités sont à saisir...', 'mangas-eeo', '2023-01-31 01:59:10'),
(216, 2, 'Midoriya', 'mangas-image-63d92eded2fb70.28338979.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(217, 2, 'Midoriya', 'mangas-image-63d92eded5bfa7.15675652.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(218, 2, 'Midoriya', 'mangas-image-63d92eded88ca7.74702527.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(219, 2, 'Midoriya', 'mangas-image-63d92ededaa223.64259980.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(220, 2, 'Midoriya', 'mangas-image-63d92ededc58b6.44897545.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(221, 2, 'Midoriya', 'mangas-image-63d92edede4536.47492469.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(222, 2, 'Midoriya', 'mangas-image-63d92edee030e8.15405170.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(223, 2, 'Midoriya', 'mangas-image-63d92edee27ad9.94614175.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(224, 2, 'Midoriya', 'mangas-image-63d92edee49a39.05178247.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(225, 2, 'Midoriya', 'mangas-image-63d92edee6f7b8.17843353.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(226, 2, 'Midoriya', 'mangas-image-63d92edee8fbd9.05135596.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(227, 2, 'Midoriya', 'mangas-image-63d92edeeb1be9.80462261.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(228, 2, 'Midoriya', 'mangas-image-63d92edeecbf26.00346759.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(229, 2, 'Midoriya', 'mangas-image-63d92edeef1b73.43683773.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(230, 2, 'Midoriya', 'mangas-image-63d92edef15765.28860324.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(231, 2, 'Midoriya', 'mangas-image-63d92edef3a3d2.54444688.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14'),
(232, 2, 'Midoriya', 'mangas-image-63d92edf05c992.41081748.jpg', 'Deku', 'mangas-MHA', '2023-01-31 02:08:14');

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
(3, '@tous venez suivre ce livre', 23, 'books-InPeace', '2023-01-30 01:08:12'),
(6, '@tous venez suivre ce livre!!', 1, 'books-list', '2023-01-31 08:14:55'),
(8, 'Oh la la!!!<br />\r\n@thelo007..', 23, 'books-once', '2023-01-31 10:41:43'),
(11, '@administrator les chapitres svp!!!', 26, 'comics-warr', '2023-01-31 13:28:07'),
(12, '@thelo007<br />\r\n@defunkt002', 26, 'comics-warr', '2023-01-31 00:27:36'),
(14, 'Ouuuiiiii monsieur😂<br />\r\n@marcos199', 20, 'books-once', '2023-01-31 00:34:09'),
(15, 'Il était une fois😊😊', 1, 'books-once', '2023-01-31 02:03:53');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`like_id`, `book_id`, `user_id`) VALUES
(3, 'books-VBS', 19),
(4, 'comics-impoli', 19),
(5, 'books-InPeace', 19),
(9, 'books-story', 19),
(13, 'comics-hfive', 1),
(15, 'books-list', 1),
(16, 'books-once', 23),
(19, 'comics-fives', 26),
(20, 'books-InPeace', 26),
(21, 'mangas-Exi', 26),
(22, 'books-once', 20),
(23, 'mangas-MHA', 1),
(24, 'books-story', 1);

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
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_firstname`, `user_lastname`, `user_username`, `user_email`, `user_password`, `user_image`, `user_wordkey`, `user_role`, `created_at`) VALUES
(1, 'Koladé Moussè', 'ABOUDOU', 'Asdepic002', 'kola771@gmail.com', '$2y$10$ag2cdAAkSXZM9f09ObZ7SeWdjYuewWRba31BYLMpC/kouHkraE4vK', 'img-63d7cc41ac9414.43107966.jpg', '$2y$10$JX4kxmFKTJBVI6bOsy2r6utrnjQ0ko5heK/HikWMp3GrujFE6eU1C', '0', '2023-01-30 00:30:51'),
(19, 'Mathéos', 'DODJINOU', 'Defunkt002', 'math@gmail.com', '$2y$10$8OZ5LMByoraAmbJ5h2460O5T7XinCuCHcMeTinUVxCLOMaRiEeayC', 'account.jpg', '$2y$10$WWsqMkXyCPj1H4uTeP23QeBQ.7GNZfGDXlCAWbmudL4ygbH8Jl3Ou', '1', '2023-01-30 00:27:03'),
(20, 'Thelo Brunice', 'PADONOU', 'Thelo007', 'brunicepdn@gmail.com', '$2y$10$4ssJBgefl7ErE1ZOaF3oHuYySi01FvMcaMIhnnodHMz7rtrdltHpa', 'account.jpg', '$2y$10$eFI6Vnf7MM7Qo3Fiw/VRGOioImTYTK.Mh1qfBphyrQygYl9.N/AfS', '1', '2023-01-30 00:28:07'),
(23, 'Melchior', 'BANKOLE', 'Devman001', 'bank@gmail.com', '$2y$10$Uc5GX8RjI3FVg2b5ICIM.e032HcVvHN2XghNerseV.lk/XY26b5B.', 'img-63d7ce6b57d1d5.71508735.jpg', '$2y$10$EF5.qSmfzkdqUdv1kY6r4u0JlF0Df8dGcEXSQEsFL8czjkhT0cPbS', '1', '2023-01-30 01:02:28'),
(24, 'Tiburce', 'KOUAGOU', 'Tiburcekouagou25', 'tibuurcekouagou@gmail.com', '$2y$10$Ij6CfwDeLDO2h4zesqcF1Oop5WN/pqlpAGe6i/q13UQdmRXVcYOka', 'img-63d8fbf4d10117.73577447.jpg', '$2y$10$YiEYT8JOdWhbQc8G1s2SvuJ2nnIDSrkMnaxbD47NL/nuj95WBpSbO', '1', '2023-01-31 10:29:50'),
(26, 'Marcos', 'MEDENOU', 'Marcos199', 'marcos@gmail.com', '$2y$10$Ho/ExQ1JOZEPjv2XmY.tO.urPcnMvYj3gjL3L3/UoxhcwGVKTLR7y', 'img-63d916e5c49355.30234800.jpg', '$2y$10$7AiN5jfqoqktmBF41rZISOWgNg0WI2u.hrY18nb.ESGthdQKnFHFu', '1', '2023-01-31 00:24:50');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_name` (`book_name`),
  ADD KEY `user_id` (`user_id`);

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
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
