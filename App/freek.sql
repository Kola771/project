-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 30 jan. 2023 à 15:07
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
('books-attente', 'La Longue Attente', 'book-image-63d777f8ba5cf0.20995297.jpg', 'Une mère qui vivait dans la misère autrefois et était obligée d&#039;abandonner son enfant, refait surface après 20 longues années😊...<br />\r\n<br />\r\nNB: Elle est toujours dans sa galère😂😂', 'En ligne', 1, '2023-01-26 02:14:46'),
('books-InPeace', 'J&#039;aime La Paix, Je Suis La Paix❤', 'book-image-63d778c7f1ea57.36452677.jpg', 'J&#039;aime la paix....je suis la paix.<br />\r\nCette oeuvre parle d&#039;histoire d&#039;amour qui sort du commun😂❤..<br />\r\n<br />\r\nUne pure merveille je vous le dis.', 'En ligne', 1, '2023-01-19 07:17:38'),
('books-LNuit', 'La Nuit Ne Porte Pas Souvent Conseil', 'book-image-63d77be0eaee85.19438584.jpg', 'La nuit ne porte pas souvent conseil. C&#039;est un fait pas une hypothèse..', 'En ligne', 1, '2023-01-19 07:07:14'),
('books-LRose', 'La Rosée De La Nuit', 'book-image-63d77d841dadd8.82637831.jpg', 'Pleins de choses se passent dans la nuit dont il vaut mieux ne pas en savoir les contours...', 'En ligne', 1, '2023-01-18 00:31:07'),
('books-name', 'Un Nom Sur La Liste', 'book-image-63d77c53754469.36840977.jpg', 'La liste noire❤❤😍..<br />\r\nUne femme prête à tuer tous ceux qui lui avait fait du mal dans le temps...', 'En attente', 1, '2023-01-18 01:31:35'),
('books-once', 'Once Up Time', 'book-image-63d7dca2077326.49722471.jpg', 'Il était une fois...', 'En ligne', 1, '2023-01-30 02:05:06'),
('books-story', 'Love Story', 'book-image-63d77b78d92e15.36942988.jpg', 'Deux jeunes tourtereaux qui se font des coups bas😂😂', 'En ligne', 1, '2023-01-19 07:15:32'),
('books-VBS', 'La Vérité Blesse Seulement Si Tu La Crois', 'book-image-63c7fea904add9.57247628.jpg', 'Parfois on souffre inutilement pour pleins de raisons mais souvent c&#039;est de notre faute!!', 'En ligne', 1, '2023-01-18 01:10:23'),
('comics-angel', 'Angelo La Débrouille', 'book-image-63c801c5f24ed2.45382553.jpg', 'Un petit intello qui a toujours un plan pour s&#039;en sortir de n&#039;importe quelle situation avec ses potes...', 'En ligne', 1, '2023-01-18 01:27:17'),
('comics-fives', 'Les Aventures Des Fives', 'book-image-63d7d07dbbaf00.90582549.jpg', 'Les aventures des futures élites du codage', 'En ligne', 1, '2023-01-30 01:13:17'),
('comics-hfive', 'Highfive University', 'book-image-63d7d0de8df661.28619111.jpg', 'Histoire sur HF', 'En ligne', 1, '2023-01-30 01:14:54'),
('comics-hsport', 'Highfive Sport', 'book-image-63d7d31e36dd94.80635859.jpg', 'Le sport dans la vie des étudiants d&#039;Highfive', 'En ligne', 1, '2023-01-30 01:24:30'),
('comics-impoli', 'Monsieur L&#039;impoli', 'book-image-63d77723b45293.24576452.jpg', 'Un jeune homme vivant dans son coin, ne dérangeant personne mais représenté par une personne très impolie et insociable.', 'En ligne', 1, '2023-01-26 02:16:00'),
('comics-LL', 'Lucky Luke', 'book-image-63c7ff3ef0a428.67962839.jpg', 'L&#039;homme sui tire plus vite que son ombre...✨', 'En ligne', 1, '2023-01-18 01:16:30'),
('mangas-Exi', 'Existence', 'book-image-63d77d3904e6f5.07385922.jpg', 'Un être ayant vécu plusieurs vies animales et qui finalement vit une vie humaine en ayant force de toutes les vies qu&#039;il avait vécu...', 'En ligne', 1, '2023-01-18 00:29:09'),
('mangas-JNK', 'Jujutsu No Kaisen', 'book-image-63c7fcfb290e19.49085009.jpg', 'Un jeune homme a bouffé le doigt du roi des fléaux (Ryomen Sukuna) et a acquis sa puissance mais en contre-partie il abrite en lui ce fléau.', 'En ligne', 1, '2023-01-18 01:03:21'),
('mangas-mer', 'Mercenary', 'book-image-63c8fb5b46a1e1.66180762.jpg', 'Un jeune homme ayant perdu ses parents dans un accident perdant aussi la mémoire au même moment et qui fût mener une vie de mercenaire pendant un temps...', 'En attente', 1, '2023-01-19 07:12:11'),
('mangas-MHA', 'My Hero Academia', 'book-image-63cbbd8fb752e5.75667214.jpg', 'Un jeune garçon qui rêvait d&#039;être un héros mais qui est né sans pouvoir..<br />\r\nMais plus tard il fût faire la rencontre d&#039;un héros qui exauça son voeu', 'En ligne', 1, '2023-01-21 09:24:37'),
('mangas-PFTO', 'Player From Today Onward', 'book-image-63c8fa8adf67a2.06123427.jpg', 'Un jeune homme venant du futur en fuyant une mort douleureuse et un monde en voie de destruction...', 'En attente', 1, '2023-01-19 07:08:42'),
('mangas-reson', 'Résonnance', 'book-image-63d77b51cbbc53.64740926.jpg', 'La raison du plus fort est toujours la meilleure dit-on!!!<br />\r\nAlors quand les plus forts se réunissent qu&#039;est-ce qui se passe ?', 'En attente', 1, '2023-01-26 02:14:01'),
('mangas-WDD', 'White Dragon Duke: Pendragon', 'book-image-63c803ee363cf5.71137814.jpg', 'Deux êtres qui meurent le même jour, au même endroit.<br />\r\nL&#039;un des deux ayants un pouvoir de réincarnation, a pu se réincarner mais à un défaut près.<br />\r\nIl s&#039;est réincarné dans le corps de l&#039;autre qui est mort.', 'En ligne', 1, '2023-01-18 01:36:30');

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
(57, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ebc6ab9.26272672.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(58, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ebf2a61.32014439.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(59, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ec1aeb6.72310627.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(60, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ec423a7.18006657.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(61, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ec65c67.97290261.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(62, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ecbe5a1.36994957.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(63, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ecdc2d3.39170002.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(64, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ecf83b3.91339256.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(65, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ed1d5e7.55800306.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(66, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ed43d25.58363260.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(67, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ed62177.05033117.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(68, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ed7e328.39139435.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(69, 1, 'Plus vite que son ombre', 'comics-image-63d7c91ed9e998.92671115.jpg', 'Plus vite que son ombre', 'comics-LL', '2023-01-30 00:41:50'),
(83, 1, 'La rosée de la nuit 0', NULL, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero esse totam nisi ducimus corporis porro itaque ab quia dolorem doloremque. Hic quod similique quis temporibus aperiam architecto, ab sunt totam quas odio quo numquam vel itaque, blanditiis ea repellendus inventore officiis reprehenderit voluptate officia dignissimos molestias pariatur deserunt quidem? <br />\r\n<br />\r\nMagni maiores illum iusto dolorum excepturi debitis eum dolores fugit? Magni aliquid iste sint esse vitae nulla, culpa rem ad atque voluptas! Pariatur dolore itaque est ipsa aut optio dolor iusto consequatur hic reiciendis sequi voluptas molestiae commodi iste sit, culpa in, ab voluptatibus. Aliquid pariatur ea architecto, debitis facilis necessitatibus dolorem natus autem doloremque amet laboriosam voluptatum recusandae obcaecati unde labore alias nihil quam deleniti sequi harum adipisci eligendi deserunt consequatur nisi? Corporis magnam impedit autem suscipit aliquid? Dolores commodi recusandae dolore tempora repellendus cum possimus cumque blanditiis eveniet inventore earum, molestias nam odio quisquam non, minima deleniti architecto esse perferendis autem laudantium. Numquam molestias tempore itaque alias aliquid fuga pariatur cum aspernatur? Veritatis sint voluptatum enim, exercitationem asperiores iure magnam laudantium aliquid inventore possimus illum soluta labore a maxime expedita corrupti, totam minus modi aperiam distinctio voluptates minima! Ad eius fuga possimus sunt iste, sed consectetur accusantium maxime voluptas modi ab distinctio facilis at odio atque quasi autem excepturi in, sint voluptate corporis? Repellendus, error optio! Officia culpa voluptas fuga porro quisquam, saepe tempora, itaque delectus voluptatem laudantium reprehenderit. Asperiores est, fugiat magnam sunt cupiditate laborum natus suscipit voluptates nostrum dignissimos voluptatum accusantium pariatur tempore, earum magni facilis non! <br />\r\n<br />\r\nExercitationem voluptates esse, repellendus neque, aliquam rerum quis reprehenderit ullam dignissimos facilis iure ipsam ut voluptatum enim cumque, sunt necessitatibus illum fugiat quaerat est. Quas molestias quidem minima labore accusamus provident pariatur possimus, veritatis recusandae vitae illo dolorem dolorum porro consequatur rerum voluptates non! Ducimus quidem tempora quam rem odio officia eius cumque laborum in, asperiores perferendis? Dolor, autem. Cupiditate sed atque inventore voluptates deleniti exercitationem incidunt itaque ad culpa in debitis porro fugit aperiam nemo voluptatum, repudiandae sit natus quae alias? <br />\r\n<br />\r\nAliquid rerum architecto corporis explicabo amet alias vel tempore, cupiditate voluptates? Accusamus, quia esse animi quasi exercitationem quos similique reiciendis perspiciatis quis laborum. Sapiente, totam? Molestias officia, voluptas repudiandae sint rerum consequatur culpa debitis soluta! Ut suscipit quo, nobis quibusdam esse similique, alias magni animi asperiores aliquam quod necessitatibus nulla tempore eos doloribus fugiat sit consectetur. Fuga placeat, reprehenderit mollitia asperiores provident accusantium optio eum laboriosam ab ipsa.', 'books-LRose', '2023-01-30 00:43:27'),
(84, 1, 'La liste noire', NULL, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero esse totam nisi ducimus corporis porro itaque ab quia dolorem doloremque. Hic quod similique quis temporibus aperiam architecto, ab sunt totam quas odio quo numquam vel itaque, blanditiis ea repellendus inventore officiis reprehenderit voluptate officia dignissimos molestias pariatur deserunt quidem? <br />\r\n<br />\r\nMagni maiores illum iusto dolorum excepturi debitis eum dolores fugit? Magni aliquid iste sint esse vitae nulla, culpa rem ad atque voluptas! Pariatur dolore itaque est ipsa aut optio dolor iusto consequatur hic reiciendis sequi voluptas molestiae commodi iste sit, culpa in, ab voluptatibus. Aliquid pariatur ea architecto, debitis facilis necessitatibus dolorem natus autem doloremque amet laboriosam voluptatum recusandae obcaecati unde labore alias nihil quam deleniti sequi harum adipisci eligendi deserunt consequatur nisi? Corporis magnam impedit autem suscipit aliquid? Dolores commodi recusandae dolore tempora repellendus cum possimus cumque blanditiis eveniet inventore earum, molestias nam odio quisquam non, minima deleniti architecto esse perferendis autem laudantium. Numquam molestias tempore itaque alias aliquid fuga pariatur cum aspernatur? Veritatis sint voluptatum enim, exercitationem asperiores iure magnam laudantium aliquid inventore possimus illum soluta labore a maxime expedita corrupti, totam minus modi aperiam distinctio voluptates minima! Ad eius fuga possimus sunt iste, sed consectetur accusantium maxime voluptas modi ab distinctio facilis at odio atque quasi autem excepturi in, sint voluptate corporis? Repellendus, error optio! Officia culpa voluptas fuga porro quisquam, saepe tempora, itaque delectus voluptatem laudantium reprehenderit. Asperiores est, fugiat magnam sunt cupiditate laborum natus suscipit voluptates nostrum dignissimos voluptatum accusantium pariatur tempore, earum magni facilis non! <br />\r\nExercitationem voluptates esse, repellendus neque, aliquam rerum quis reprehenderit ullam dignissimos facilis iure ipsam ut voluptatum enim cumque, sunt necessitatibus illum fugiat quaerat est. Quas molestias quidem minima labore accusamus provident pariatur possimus, veritatis recusandae vitae illo dolorem dolorum porro consequatur rerum voluptates non! Ducimus quidem tempora quam rem odio officia eius cumque laborum in, asperiores perferendis? Dolor, autem. Cupiditate sed atque inventore voluptates deleniti exercitationem incidunt itaque ad culpa in debitis porro fugit aperiam nemo voluptatum, repudiandae sit natus quae alias? <br />\r\n<br />\r\nAliquid rerum architecto corporis explicabo amet alias vel tempore, cupiditate voluptates? Accusamus, quia esse animi quasi exercitationem quos similique reiciendis perspiciatis quis laborum. Sapiente, totam? Molestias officia, voluptas repudiandae sint rerum consequatur culpa debitis soluta! Ut suscipit quo, nobis quibusdam esse similique, alias magni animi asperiores aliquam quod necessitatibus nulla tempore eos doloribus fugiat sit consectetur. Fuga placeat, reprehenderit mollitia asperiores provident accusantium optio eum laboriosam ab ipsa.', 'books-name', '2023-01-30 00:43:53'),
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
(133, 1, 'La nuit 1', NULL, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero esse totam nisi ducimus corporis porro itaque ab quia dolorem doloremque. Hic quod similique quis temporibus aperiam architecto, ab sunt totam quas odio quo numquam vel itaque, blanditiis ea repellendus inventore officiis reprehenderit voluptate officia dignissimos molestias pariatur deserunt quidem? Magni maiores illum iusto dolorum excepturi debitis eum dolores fugit? Magni aliquid iste sint esse vitae nulla, culpa rem ad atque voluptas! Pariatur dolore itaque est ipsa aut optio dolor iusto consequatur hic reiciendis sequi voluptas molestiae commodi iste sit, culpa in, ab voluptatibus. Aliquid pariatur ea architecto, debitis facilis necessitatibus dolorem natus autem doloremque amet laboriosam voluptatum recusandae obcaecati unde labore alias nihil quam deleniti sequi harum adipisci eligendi deserunt consequatur nisi? <br />\r\n<br />\r\nCorporis magnam impedit autem suscipit aliquid? Dolores commodi recusandae dolore tempora repellendus cum possimus cumque blanditiis eveniet inventore earum, molestias nam odio quisquam non, minima deleniti architecto esse perferendis autem laudantium. Numquam molestias tempore itaque alias aliquid fuga pariatur cum aspernatur? Veritatis sint voluptatum enim, exercitationem asperiores iure magnam laudantium aliquid inventore possimus illum soluta labore a maxime expedita corrupti, totam minus modi aperiam distinctio voluptates minima! Ad eius fuga possimus sunt iste, sed consectetur accusantium maxime voluptas modi ab distinctio facilis at odio atque quasi autem excepturi in, sint voluptate corporis? Repellendus, error optio! Officia culpa voluptas fuga porro quisquam, saepe tempora, itaque delectus voluptatem laudantium reprehenderit. Asperiores est, fugiat magnam sunt cupiditate laborum natus suscipit voluptates nostrum dignissimos voluptatum accusantium pariatur tempore, earum magni facilis non! <br />\r\n<br />\r\nExercitationem voluptates esse, repellendus neque, aliquam rerum quis reprehenderit ullam dignissimos facilis iure ipsam ut voluptatum enim cumque, sunt necessitatibus illum fugiat quaerat est. Quas molestias quidem minima labore accusamus provident pariatur possimus, veritatis recusandae vitae illo dolorem dolorum porro consequatur rerum voluptates non! Ducimus quidem tempora quam rem odio officia eius cumque laborum in, asperiores perferendis? Dolor, autem. <br />\r\n<br />\r\nCupiditate sed atque inventore voluptates deleniti exercitationem incidunt itaque ad culpa in debitis porro fugit aperiam nemo voluptatum, repudiandae sit natus quae alias? Aliquid rerum architecto corporis explicabo amet alias vel tempore, cupiditate voluptates? Accusamus, quia esse animi quasi exercitationem quos similique reiciendis perspiciatis quis laborum. Sapiente, totam? Molestias officia, voluptas repudiandae sint rerum consequatur culpa debitis soluta! <br />\r\n<br />\r\nUt suscipit quo, nobis quibusdam esse similique, alias magni animi asperiores aliquam quod necessitatibus nulla tempore eos doloribus fugiat sit consectetur. Fuga placeat, reprehenderit mollitia asperiores provident accusantium optio eum laboriosam ab ipsa.', 'books-LNuit', '2023-01-30 01:36:56'),
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
(148, 1, 'Une si longue attente', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi, sint. Totam commodi sequi, obcaecati suscipit tempore ducimus voluptatum ratione ab magni quis vel minus quos voluptas ea. Enim nemo rerum distinctio fugiat debitis? Aut et minima aperiam laborum repellendus similique iusto quisquam velit iure quasi nemo repellat illo nam debitis deleniti iste adipisci quibusdam voluptas, tempore ullam corrupti voluptate deserunt libero! Inventore, delectus alias iure deleniti distinctio magnam id odio similique? <br />\r\n<br />\r\nQuam rem adipisci, veritatis pariatur optio est sapiente facere enim aspernatur modi. Laboriosam corporis odio laborum labore praesentium recusandae, explicabo sunt sint nostrum. Eligendi dolore, reprehenderit perferendis doloremque aspernatur maiores temporibus quod laboriosam esse pariatur libero quae ratione necessitatibus officiis fugit obcaecati sint in fuga incidunt blanditiis corrupti? Distinctio porro assumenda natus tempora, eligendi, a quas libero iste possimus amet voluptatum mollitia deleniti veritatis dicta enim maiores iure non aliquid! Libero quod dicta quia odio cumque, ea consectetur ducimus aperiam quae quibusdam, voluptates perferendis, animi rem distinctio accusantium quisquam placeat necessitatibus voluptatem in corporis laboriosam explicabo obcaecati consequuntur? Quis esse quo quod labore tempore ad libero cupiditate dolor quasi, officiis exercitationem maxime aliquam. Voluptatibus, veritatis quaerat aliquid iste quas ut. Molestias quaerat maiores itaque exercitationem eum commodi tenetur temporibus possimus mollitia numquam pariatur, cumque deleniti a in ut! Doloribus nulla, autem provident dolorem aliquam suscipit deserunt perferendis animi magnam placeat nisi numquam. Sunt ea expedita laudantium. Vel earum consequuntur quidem pariatur eligendi aperiam possimus, amet similique nemo libero ducimus iusto quam, ratione autem illo nulla illum eos officiis. Et placeat, incidunt quam voluptas repellat consectetur! Dicta est minus eius voluptates officia iusto nemo ducimus pariatur quas temporibus, perferendis, adipisci expedita iure quam animi consequuntur, nulla odit numquam architecto reiciendis eveniet incidunt molestiae. Ipsa tenetur hic, nesciunt odio quo voluptatem quis quae labore doloremque maiores sequi perferendis, cumque officiis aspernatur alias repellendus quaerat voluptates sapiente aliquid nam magnam dignissimos quidem deserunt. <br />\r\n<br />\r\nCorrupti, ipsa aspernatur et dolores incidunt architecto, impedit excepturi mollitia officia aliquid minima ea nihil suscipit temporibus reiciendis fugit sint dignissimos eligendi sunt esse cupiditate! Odit, eveniet totam voluptas nostrum dolor odio fugit voluptatem voluptates laudantium perferendis cum ad ex eos. Numquam, ipsa. Molestias aliquam facere voluptates nihil optio illo nemo amet inventore distinctio at blanditiis incidunt harum ex dolorem, id cumque veniam quam nobis? Exercitationem alias ipsum enim. Consectetur molestiae facilis earum nostrum maiores alias incidunt atque, quasi quis mollitia ratione asperiores iste ducimus modi animi velit beatae voluptate cum? Nostrum blanditiis, beatae ducimus fuga iste ab quos minima accusantium consectetur incidunt. <br />\r\n<br />\r\nA delectus porro officia vitae voluptates quidem commodi at possimus illum aut optio quibusdam dolore rerum non adipisci perferendis nobis, totam animi facere eum quo. Sunt, ipsum. Ipsa omnis adipisci ab, fugiat quisquam aspernatur ad ducimus provident recusandae eaque reiciendis aliquam temporibus quod esse at, exercitationem ea quos unde eos quam voluptatem repellat accusantium in modi? Vitae, illum a dolores sit id dolorum, numquam assumenda vel quis quae libero laboriosam tempore laudantium est velit ratione consequuntur et sed, laborum temporibus expedita saepe. Cum temporibus neque vel.', 'books-attente', '2023-01-30 02:02:49'),
(149, 1, 'Il était une fois', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi, sint. Totam commodi sequi, obcaecati suscipit tempore ducimus voluptatum ratione ab magni quis vel minus quos voluptas ea. Enim nemo rerum distinctio fugiat debitis? Aut et minima aperiam laborum repellendus similique iusto quisquam velit iure quasi nemo repellat illo nam debitis deleniti iste adipisci quibusdam voluptas, tempore ullam corrupti voluptate deserunt libero! Inventore, delectus alias iure deleniti distinctio magnam id odio similique? <br />\r\n<br />\r\nQuam rem adipisci, veritatis pariatur optio est sapiente facere enim aspernatur modi. Laboriosam corporis odio laborum labore praesentium recusandae, explicabo sunt sint nostrum. Eligendi dolore, reprehenderit perferendis doloremque aspernatur maiores temporibus quod laboriosam esse pariatur libero quae ratione necessitatibus officiis fugit obcaecati sint in fuga incidunt blanditiis corrupti? Distinctio porro assumenda natus tempora, eligendi, a quas libero iste possimus amet voluptatum mollitia deleniti veritatis dicta enim maiores iure non aliquid! Libero quod dicta quia odio cumque, ea consectetur ducimus aperiam quae quibusdam, voluptates perferendis, animi rem distinctio accusantium quisquam placeat necessitatibus voluptatem in corporis laboriosam explicabo obcaecati consequuntur? Quis esse quo quod labore tempore ad libero cupiditate dolor quasi, officiis exercitationem maxime aliquam. Voluptatibus, veritatis quaerat aliquid iste quas ut. Molestias quaerat maiores itaque exercitationem eum commodi tenetur temporibus possimus mollitia numquam pariatur, cumque deleniti a in ut! Doloribus nulla, autem provident dolorem aliquam suscipit deserunt perferendis animi magnam placeat nisi numquam. Sunt ea expedita laudantium. Vel earum consequuntur quidem pariatur eligendi aperiam possimus, amet similique nemo libero ducimus iusto quam, ratione autem illo nulla illum eos officiis. Et placeat, incidunt quam voluptas repellat consectetur! Dicta est minus eius voluptates officia iusto nemo ducimus pariatur quas temporibus, perferendis, adipisci expedita iure quam animi consequuntur, nulla odit numquam architecto reiciendis eveniet incidunt molestiae. Ipsa tenetur hic, nesciunt odio quo voluptatem quis quae labore doloremque maiores sequi perferendis, cumque officiis aspernatur alias repellendus quaerat voluptates sapiente aliquid nam magnam dignissimos quidem deserunt. Corrupti, ipsa aspernatur et dolores incidunt architecto, impedit excepturi mollitia officia aliquid minima ea nihil suscipit temporibus reiciendis fugit sint dignissimos eligendi sunt esse cupiditate! Odit, eveniet totam voluptas nostrum dolor odio fugit voluptatem voluptates laudantium perferendis cum ad ex eos. Numquam, ipsa. Molestias aliquam facere voluptates nihil optio illo nemo amet inventore distinctio at blanditiis incidunt harum ex dolorem, id cumque veniam quam nobis? <br />\r\n<br />\r\nExercitationem alias ipsum enim. Consectetur molestiae facilis earum nostrum maiores alias incidunt atque, quasi quis mollitia ratione asperiores iste ducimus modi animi velit beatae voluptate cum? Nostrum blanditiis, beatae ducimus fuga iste ab quos minima accusantium consectetur incidunt. A delectus porro officia vitae voluptates quidem commodi at possimus illum aut optio quibusdam dolore rerum non adipisci perferendis nobis, totam animi facere eum quo. Sunt, ipsum. Ipsa omnis adipisci ab, fugiat quisquam aspernatur ad ducimus provident recusandae eaque reiciendis aliquam temporibus quod esse at, exercitationem ea quos unde eos quam voluptatem repellat accusantium in modi? Vitae, illum a dolores sit id dolorum, numquam assumenda vel quis quae libero laboriosam tempore laudantium est velit ratione consequuntur et sed, laborum temporibus expedita saepe. Cum temporibus neque vel.', 'books-once', '2023-01-30 02:05:46');

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
(1, '@administrator, la suite', 19, 'books-attente', '2023-01-30 00:54:19'),
(2, 'ok je viens @defunkt002', 1, 'books-attente', '2023-01-30 13:59:55'),
(3, '@tous venez suivre ce livre', 23, 'books-InPeace', '2023-01-30 01:08:12'),
(4, 'Cool @tous', 19, 'books-LRose', '2023-01-30 01:39:13');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `book_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`like_id`, `book_id`, `user_id`) VALUES
(3, 'books-VBS', 19),
(4, 'comics-impoli', 19),
(5, 'books-InPeace', 19),
(6, 'books-attente', 19),
(7, 'books-LNuit', 19),
(8, 'books-LRose', 19),
(9, 'books-story', 19),
(10, 'comics-angel', 19),
(11, 'books-LRose', 1),
(13, 'comics-hfive', 1);

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
(1, 'Koladé Moussè', 'ABOUDOU', 'Asdepic002', 'kola771@gmail.com', '$2y$10$7sriJr22W5pbiZEi4Y0RQutkBeRXbFk5yowDHJstBEYtXoQJ8KvQm', 'img-63d7cc41ac9414.43107966.jpg', '$2y$10$JX4kxmFKTJBVI6bOsy2r6utrnjQ0ko5heK/HikWMp3GrujFE6eU1C', '0', '2023-01-30 00:30:51'),
(19, 'Mathéos', 'DODJINOU', 'Defunkt002', 'math@gmail.com', '$2y$10$wvrXmTJOYkb0F1Mh6xs6DuxoTrqkKg312B.c7jsowbai8PZ791l6.', 'account.jpg', '$2y$10$WWsqMkXyCPj1H4uTeP23QeBQ.7GNZfGDXlCAWbmudL4ygbH8Jl3Ou', '1', '2023-01-30 00:27:03'),
(20, 'Thelo Brunice', 'PADONOU', 'Thelo007', 'brunicepdn@gmail.com', '$2y$10$pq.kJ60cCmM0vwKfIA8./OeDFEjgvDGWdNYz8FenZD1iu9ag8vowm', 'account.jpg', '$2y$10$eFI6Vnf7MM7Qo3Fiw/VRGOioImTYTK.Mh1qfBphyrQygYl9.N/AfS', '1', '2023-01-30 00:28:07'),
(21, 'Marcos', 'MEDENOU', 'Marcos199', 'marcos@gmail.com', '$2y$10$/hz7ULRvxo7W3QmmG/fyUObMsaC0VAsPXD5u/xTUkXp7NXxmC1Gl2', 'account.jpg', '$2y$10$DNCzXK8xk/nY0Bz/ZZ85.uXZ7nNtlqrQ9pJBRjb9dUVL8AqMy0iy.', '1', '2023-01-30 00:28:45'),
(23, 'Melchior', 'BANKOLE', 'Devman001', 'bank@gmail.com', '$2y$10$Uc5GX8RjI3FVg2b5ICIM.e032HcVvHN2XghNerseV.lk/XY26b5B.', 'img-63d7ce6b57d1d5.71508735.jpg', '$2y$10$EF5.qSmfzkdqUdv1kY6r4u0JlF0Df8dGcEXSQEsFL8czjkhT0cPbS', '1', '2023-01-30 01:02:28');

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
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
