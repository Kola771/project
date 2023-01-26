-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 26 jan. 2023 à 17:08
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
('books-attente', 'La Longue Attente', 'book-image-63d298e657b8c0.21834815.jpg', 'Une si longue attente...', 'En attente', 1, '2023-01-26 02:14:46'),
('books-InPeace', 'J&#039;aime La Paix, Je Suis La Paix❤', 'book-image-63d118b5d52883.33878427.jpg', 'J&#039;aime la paix....je suis la paix', 'En ligne', 1, '2023-01-19 07:17:38'),
('books-LNuit', 'La Nuit Ne Porte Pas Souvent Conseil', 'book-image-63c8fa327704a2.57683356.jpg', 'La nuit ne porte pas souvent conseil', 'Retirer', 1, '2023-01-19 07:07:14'),
('books-LRose', 'La Rosée De La Nuit', 'book-image-63c7f9765a91f0.69642685.jpg', 'Lorem..', 'En ligne', 1, '2023-01-18 00:31:07'),
('books-name', 'Un Nom Sur La Liste', 'book-image-63c802c803fc13.52386163.jpg', 'La liste noire❤❤😍', 'En ligne', 1, '2023-01-18 01:31:35'),
('books-story', 'Love Story', 'book-image-63c8fc240ca926.39271778.jpg', 'Deux jeunes tourtereaux...', 'Retirer', 1, '2023-01-19 07:15:32'),
('books-VBS', 'La Vérité Blesse Seulement Si Tu La Crois', 'book-image-63c7fea904add9.57247628.jpg', 'Parfois on souffre inutilement pour pleins de raisons mais souvent c&#039;est de notre faute!!', 'En ligne', 1, '2023-01-18 01:10:23'),
('comics-angel', 'Angelo La Débrouille', 'book-image-63c801c5f24ed2.45382553.jpg', 'Un petit intello qui a toujours un plan pour s&#039;en sortir de n&#039;importe quelle situation avec ses potes...', 'En ligne', 1, '2023-01-18 01:27:17'),
('comics-impoli', 'Monsieur L&#039;impoli', 'book-image-63d2993035afb6.62204809.jpg', 'Il était une fois..', 'En ligne', 1, '2023-01-26 02:16:00'),
('comics-LL', 'Lucky Luke', 'book-image-63c7ff3ef0a428.67962839.jpg', 'L&#039;homme sui tire plus vite que son ombre...✨', 'En ligne', 1, '2023-01-18 01:16:30'),
('mangas-Exi', 'Existence', 'book-image-63c7f9a229ca23.98212456.jpg', 'Lorem..', 'En ligne', 1, '2023-01-18 00:29:09'),
('mangas-JNK', 'Jujutsu No Kaisen', 'book-image-63c7fcfb290e19.49085009.jpg', 'Un jeune homme a bouffé le doigt du roi des fléaux (Ryomen Sukuna) et a acquis sa puissance mais en contre-partie il abrite en lui ce fléau.', 'En ligne', 1, '2023-01-18 01:03:21'),
('mangas-mer', 'Mercenary', 'book-image-63c8fb5b46a1e1.66180762.jpg', 'Un jeune homme ayant perdu ses parents dans un accident perdant aussi la mémoire au même moment et qui fût mener une vie de mercenaire pendant un temps...', 'En attente', 1, '2023-01-19 07:12:11'),
('mangas-MHA', 'My Hero Academia', 'book-image-63cbbd8fb752e5.75667214.jpg', 'Un jeune garçon qui rêvait d&#039;être un héros mais qui est né sans pouvoir..<br />\r\nMais plus tard il fût faire la rencontre d&#039;un héros qui exauça son voeu', 'En ligne', 1, '2023-01-21 09:24:37'),
('mangas-PFTO', 'Player From Today Onward', 'book-image-63c8fa8adf67a2.06123427.jpg', 'Un jeune homme venant du futur en fuyant une mort douleureuse et un monde en voie de destruction...', 'En attente', 1, '2023-01-19 07:08:42'),
('mangas-reson', 'Résonnance', 'book-image-63d298b9be9446.70075490.jpg', 'Il était une fois...', 'En attente', 1, '2023-01-26 02:14:01'),
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
(1, 1, 'Le commencement 1', 'mangas-image-63cbc12af3cdc9.45021237.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(2, 1, 'Le commencement 1', 'mangas-image-63cbc12b02cbd8.87373926.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(3, 1, 'Le commencement 1', 'mangas-image-63cbc12b04c743.54852392.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(4, 1, 'Le commencement 1', 'mangas-image-63cbc12b076182.97467959.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(5, 1, 'Le commencement 1', 'mangas-image-63cbc12b0e9b10.55558593.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(6, 1, 'Le commencement 1', 'mangas-image-63cbc12b162689.41024588.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(7, 1, 'Le commencement 1', 'mangas-image-63cbc12b1d7f73.41133365.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(8, 1, 'Le commencement 1', 'mangas-image-63cbc12b253a40.24592003.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(9, 1, 'Le commencement 1', 'mangas-image-63cbc12b2dac67.41220412.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(10, 1, 'Le commencement 1', 'mangas-image-63cbc12b354a67.47469568.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(11, 1, 'Le commencement 1', 'mangas-image-63cbc12b38ee79.35505819.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(12, 1, 'Le commencement 1', 'mangas-image-63cbc12b4093f2.29944353.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(13, 1, 'Le commencement 1', 'mangas-image-63cbc12b43f494.16486900.jpg', 'Où tout commença...', 'mangas-MHA', '2023-01-21 09:40:42'),
(14, 2, 'Le commencement 2', 'mangas-image-63cbc1e2661d19.33807822.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(15, 2, 'Le commencement 2', 'mangas-image-63cbc1e268c848.02725069.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(16, 2, 'Le commencement 2', 'mangas-image-63cbc1e26aab63.20391556.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(17, 2, 'Le commencement 2', 'mangas-image-63cbc1e26d1fa4.16129728.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(18, 2, 'Le commencement 2', 'mangas-image-63cbc1e26f2909.39580225.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(19, 2, 'Le commencement 2', 'mangas-image-63cbc1e2717797.94833642.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(20, 2, 'Le commencement 2', 'mangas-image-63cbc1e2737323.06871574.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(21, 2, 'Le commencement 2', 'mangas-image-63cbc1e2755964.06746697.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(22, 2, 'Le commencement 2', 'mangas-image-63cbc1e2771ab0.01131614.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(23, 2, 'Le commencement 2', 'mangas-image-63cbc1e278c3d7.38697292.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(24, 2, 'Le commencement 2', 'mangas-image-63cbc1e27a65a1.21216336.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(25, 2, 'Le commencement 2', 'mangas-image-63cbc1e27c7d86.15742087.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(26, 2, 'Le commencement 2', 'mangas-image-63cbc1e27e5538.11389950.jpg', 'All might', 'mangas-MHA', '2023-01-21 09:43:46'),
(29, 1, 'Les amoureux', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet dignissimos veritatis ipsum odit ex omnis perferendis assumenda consectetur? Ab itaque corporis earum officiis hic inventore vitae, eaque fuga error alias. Consectetur incidunt, sint ipsum eaque adipisci consequuntur. Quaerat sapiente nesciunt recusandae ducimus, earum non dolor aliquam unde expedita reprehenderit, voluptates perferendis similique dolorum obcaecati! <br />\r\n<br />\r\nError quae aliquam architecto nemo adipisci nulla velit earum doloribus commodi, harum consectetur esse itaque, enim distinctio saepe. Quasi, repellendus? Voluptate facere qui temporibus at officiis iure quo error eos rem eaque, impedit quam odit magni officia voluptas minima placeat, saepe eum. Fuga beatae delectus eligendi veniam eum totam, suscipit eaque neque molestias ex doloribus atque, ut maxime dolore ab iste perferendis molestiae voluptatibus vel quia dignissimos assumenda similique? Cumque illum dolore consequuntur rerum ratione. <br />\r\n<br />\r\nVero cumque ipsa officiis explicabo, adipisci voluptate hic ex nesciunt cupiditate facere vitae excepturi, at aut sequi pariatur, iure officia minus alias veritatis! Odit ducimus rerum voluptatum quo nobis corrupti. Esse qui vitae neque debitis. Tempore, itaque? Eos ipsum illo sapiente consequatur? Laudantium ipsum rem repellat fugiat ad iure possimus! Architecto dolor itaque officia, neque similique molestiae dolorum velit voluptatibus suscipit laborum temporibus minus eaque blanditiis quaerat cumque sed a enim voluptatem nulla. Reprehenderit error dolorum sit nam perspiciatis perferendis nobis vero nemo numquam vel. Quis fugit sunt consequatur ut reiciendis nam numquam exercitationem optio dolorem enim omnis commodi quam, soluta ab saepe repudiandae maiores nobis asperiores. Doloremque, ipsa perspiciatis assumenda, hic corrupti fugiat voluptatum odio placeat aut, reiciendis consectetur exercitationem autem itaque adipisci ducimus voluptates vero ea libero distinctio quae eius facere laboriosam maiores cumque! Saepe sequi tempora eaque deserunt dolorem similique possimus, incidunt aut cupiditate expedita placeat tenetur commodi laboriosam rerum laudantium delectus itaque soluta temporibus. Modi deleniti adipisci accusantium saepe magni cum voluptate consectetur reprehenderit libero iste aperiam debitis porro ipsa quod obcaecati magnam aut vel autem nostrum ducimus, aliquam dolorem dolorum. Eaque asperiores nulla sed molestiae et eligendi debitis ad tenetur minima molestias aliquid id odit omnis ipsam culpa saepe dicta obcaecati consectetur veritatis, perferendis provident eveniet deserunt, excepturi ratione. Quisquam voluptatum laudantium, officia delectus facere hic, repudiandae adipisci fugiat a minima minus, ex quis eveniet aut id porro. Aperiam eligendi at molestias sit consequatur magni cumque, neque perferendis dicta itaque dolorum facere quae labore velit! Ab iste, possimus rerum hic labore non aspernatur, autem quasi fugiat dolorem provident! Sunt natus culpa cum porro <br />\r\n<br />\r\nmollitia aliquam quaerat a explicabo laboriosam? Esse voluptatem nam quibusdam inventore porro autem amet aliquam animi labore, aspernatur saepe sapiente excepturi tempore ipsum nihil nostrum. Rerum fugit voluptatem fugiat nam dolore recusandae impedit, nemo eligendi et? Facere voluptatem illum eveniet voluptate facilis corporis labore cumque! Exercitationem nam, omnis veniam laudantium consequuntur itaque dignissimos libero aliquam facilis non minus. Consectetur corporis sit expedita saepe quasi qui unde nisi libero, cupiditate accusamus vero, <br />\r\n<br />\r\nexercitationem veritatis possimus? Nulla porro deserunt dicta perferendis, repellendus quia vel! Nulla consectetur, obcaecati officia possimus totam recusandae consequuntur debitis eius soluta eaque doloremque magnam, architecto porro, error sed delectus asperiores eos.', 'books-InPeace', '2023-01-21 09:47:41'),
(30, 2, 'Les amoureux 1', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. <br />\r\nAmet dignissimos veritatis ipsum odit ex omnis perferendis assumenda consectetur? Ab itaque corporis earum officiis hic inventore vitae, eaque fuga error alias. <br />\r\n<br />\r\nConsectetur incidunt, sint ipsum eaque adipisci consequuntur. Quaerat sapiente nesciunt recusandae ducimus, earum non dolor aliquam unde expedita reprehenderit, voluptates perferendis similique dolorum obcaecati! Error quae aliquam architecto nemo adipisci nulla velit earum doloribus commodi, harum consectetur esse itaque, enim distinctio saepe. Quasi, repellendus? Voluptate facere qui temporibus at officiis iure quo error eos rem eaque, impedit quam odit magni officia voluptas minima placeat, saepe eum. <br />\r\n<br />\r\nFuga beatae delectus eligendi veniam eum totam, suscipit eaque neque molestias ex doloribus atque, ut maxime dolore ab iste perferendis molestiae voluptatibus vel quia dignissimos assumenda similique? Cumque illum dolore consequuntur rerum ratione. Vero cumque ipsa officiis explicabo, adipisci voluptate hic ex nesciunt cupiditate facere vitae excepturi, at aut sequi pariatur, iure officia minus alias veritatis! Odit ducimus rerum voluptatum quo nobis corrupti. Esse qui vitae neque debitis. Tempore, itaque? Eos ipsum illo sapiente consequatur? Laudantium ipsum rem repellat fugiat ad iure possimus! Architecto dolor itaque officia, neque similique molestiae dolorum velit voluptatibus suscipit laborum temporibus minus eaque blanditiis quaerat cumque sed a enim voluptatem nulla. Reprehenderit error dolorum sit nam perspiciatis perferendis nobis vero nemo numquam vel. Quis fugit sunt consequatur ut reiciendis nam numquam exercitationem optio dolorem enim omnis commodi quam, soluta ab saepe repudiandae maiores nobis asperiores. Doloremque, ipsa perspiciatis assumenda, hic corrupti fugiat voluptatum odio placeat aut, reiciendis consectetur exercitationem autem itaque adipisci ducimus voluptates vero ea libero distinctio quae eius facere laboriosam maiores cumque! Saepe sequi tempora eaque deserunt dolorem similique possimus, incidunt aut cupiditate expedita placeat tenetur commodi laboriosam rerum laudantium delectus itaque soluta temporibus. Modi deleniti adipisci accusantium saepe magni cum voluptate consectetur reprehenderit libero iste aperiam debitis porro ipsa quod obcaecati magnam aut vel autem nostrum ducimus, aliquam dolorem dolorum. Eaque asperiores nulla sed molestiae et eligendi debitis ad tenetur minima molestias aliquid id odit omnis ipsam culpa saepe dicta obcaecati consectetur veritatis, perferendis provident eveniet deserunt, excepturi ratione. Quisquam voluptatum laudantium, officia delectus facere hic, repudiandae adipisci fugiat a minima minus, ex quis eveniet aut id porro. Aperiam eligendi at molestias sit consequatur magni cumque, neque perferendis dicta itaque dolorum facere quae labore velit! <br />\r\n<br />\r\nAb iste, possimus rerum hic labore non aspernatur, autem quasi fugiat dolorem provident! Sunt natus culpa cum porro mollitia aliquam quaerat a explicabo laboriosam? Esse voluptatem nam quibusdam inventore porro autem amet aliquam animi labore, aspernatur saepe sapiente excepturi tempore ipsum nihil nostrum. Rerum fugit voluptatem fugiat nam dolore recusandae impedit, nemo eligendi et? <br />\r\n<br />\r\nFacere voluptatem illum eveniet voluptate facilis corporis labore cumque! Exercitationem nam, omnis veniam laudantium consequuntur itaque dignissimos libero aliquam facilis non minus. Consectetur corporis sit expedita saepe quasi qui unde nisi libero, cupiditate accusamus vero, exercitationem veritatis possimus? Nulla porro deserunt dicta perferendis, repellendus quia vel! Nulla consectetur, obcaecati officia possimus totam recusandae consequuntur debitis eius soluta eaque doloremque magnam, architecto porro, error sed delectus asperiores eos.', 'books-InPeace', '2023-01-21 09:48:12'),
(31, 1, 'Le petit intello 1', 'comics-image-63cbc31e68cb27.42827781.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(32, 1, 'Le petit intello 1', 'comics-image-63cbc31e6b2d67.74439272.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(33, 1, 'Le petit intello 1', 'comics-image-63cbc31e6d21c7.00375884.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(34, 1, 'Le petit intello 1', 'comics-image-63cbc31e72dfb2.26596937.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(35, 1, 'Le petit intello 1', 'comics-image-63cbc31e752e83.11507316.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(36, 1, 'Le petit intello 1', 'comics-image-63cbc31e774105.09693742.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(37, 1, 'Le petit intello 1', 'comics-image-63cbc31e794368.49026405.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(38, 1, 'Le petit intello 1', 'comics-image-63cbc31e7b0ea1.19049086.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(39, 1, 'Le petit intello 1', 'comics-image-63cbc31e7d16d7.72420773.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(40, 1, 'Le petit intello 1', 'comics-image-63cbc31e7ee362.75938155.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(41, 1, 'Le petit intello 1', 'comics-image-63cbc31e80fee1.20417066.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(42, 1, 'Le petit intello 1', 'comics-image-63cbc31e82fd16.91955605.jpg', 'Le petit intello...', 'comics-angel', '2023-01-21 09:49:02'),
(43, 2, 'Le petit intello 2', 'comics-image-63cbc3a34b21d7.16238115.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(44, 2, 'Le petit intello 2', 'comics-image-63cbc3a34d7b98.17918859.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(45, 2, 'Le petit intello 2', 'comics-image-63cbc3a3500052.11291368.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(46, 2, 'Le petit intello 2', 'comics-image-63cbc3a35251e7.10759997.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(47, 2, 'Le petit intello 2', 'comics-image-63cbc3a354d927.65485599.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(48, 2, 'Le petit intello 2', 'comics-image-63cbc3a356e200.84239023.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(49, 2, 'Le petit intello 2', 'comics-image-63cbc3a358c3a8.47978557.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(50, 2, 'Le petit intello 2', 'comics-image-63cbc3a35a8c95.60381041.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(51, 2, 'Le petit intello 2', 'comics-image-63cbc3a35cca14.77142229.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(52, 2, 'Le petit intello 2', 'comics-image-63cbc3a35ed5c8.05383818.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(53, 2, 'Le petit intello 2', 'comics-image-63cbc3a360d929.90940740.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(54, 2, 'Le petit intello 2', 'comics-image-63cbc3a362a444.89017632.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(55, 2, 'Le petit intello 2', 'comics-image-63cbc3a3649914.55635146.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(56, 2, 'Le petit intello 2', 'comics-image-63cbc3a3663d04.94930952.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(57, 2, 'Le petit intello 2', 'comics-image-63cbc3a36817d0.16945597.jpg', 'Le petit génie', 'comics-angel', '2023-01-21 09:51:15'),
(58, 1, 'Le retour', 'mangas-image-63cbc3eb50eae6.78325799.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(59, 1, 'Le retour', 'mangas-image-63cbc3eb532bc2.62952398.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(60, 1, 'Le retour', 'mangas-image-63cbc3eb551035.62815128.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(61, 1, 'Le retour', 'mangas-image-63cbc3eb570358.06145663.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(62, 1, 'Le retour', 'mangas-image-63cbc3eb591db8.44186265.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(63, 1, 'Le retour', 'mangas-image-63cbc3eb5b45c8.54157835.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(64, 1, 'Le retour', 'mangas-image-63cbc3eb5d4053.81029290.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(65, 1, 'Le retour', 'mangas-image-63cbc3eb5f6ed8.81882864.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(66, 1, 'Le retour', 'mangas-image-63cbc3eb615420.13525091.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(67, 1, 'Le retour', 'mangas-image-63cbc3eb639d38.17267876.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(68, 1, 'Le retour', 'mangas-image-63cbc3eb65cbd3.29808560.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(69, 1, 'Le retour', 'mangas-image-63cbc3eb684470.20692582.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(70, 1, 'Le retour', 'mangas-image-63cbc3eb6a79d4.01389994.jpg', 'Le retour du boss', 'mangas-WDD', '2023-01-21 09:52:27'),
(71, 1, 'Le retour du jeune homme', 'mangas-image-63cbc4180c20e0.91425136.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(72, 1, 'Le retour du jeune homme', 'mangas-image-63cbc4180eec64.05003259.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(73, 1, 'Le retour du jeune homme', 'mangas-image-63cbc41810a6d4.96894579.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(74, 1, 'Le retour du jeune homme', 'mangas-image-63cbc41812db30.10371816.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(75, 1, 'Le retour du jeune homme', 'mangas-image-63cbc41814bd69.29432091.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(76, 1, 'Le retour du jeune homme', 'mangas-image-63cbc418177b76.86451225.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(77, 1, 'Le retour du jeune homme', 'mangas-image-63cbc4181932a1.86407832.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(78, 1, 'Le retour du jeune homme', 'mangas-image-63cbc4181b6a40.13847020.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(79, 1, 'Le retour du jeune homme', 'mangas-image-63cbc4181d1406.90703857.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(80, 1, 'Le retour du jeune homme', 'mangas-image-63cbc4181f8ae1.08207478.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(81, 1, 'Le retour du jeune homme', 'mangas-image-63cbc418215f87.84903544.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(82, 1, 'Le retour du jeune homme', 'mangas-image-63cbc41823b0c9.99188450.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(83, 1, 'Le retour du jeune homme', 'mangas-image-63cbc41825b9d6.41459471.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(84, 1, 'Le retour du jeune homme', 'mangas-image-63cbc41827d097.28966794.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(85, 1, 'Le retour du jeune homme', 'mangas-image-63cbc418298bd9.69447054.jpg', 'Le petit mercenaire', 'mangas-mer', '2023-01-21 09:53:12'),
(86, 1, 'Plus vite que son ombre', 'comics-image-63cbc4500843f1.14596066.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(87, 1, 'Plus vite que son ombre', 'comics-image-63cbc4500b2678.81780250.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(88, 1, 'Plus vite que son ombre', 'comics-image-63cbc4500d0309.54884197.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(89, 1, 'Plus vite que son ombre', 'comics-image-63cbc4500ec368.36408837.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(90, 1, 'Plus vite que son ombre', 'comics-image-63cbc45014e206.28033918.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(91, 1, 'Plus vite que son ombre', 'comics-image-63cbc45016c2a2.85641544.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(92, 1, 'Plus vite que son ombre', 'comics-image-63cbc4501c9b92.09491388.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(93, 1, 'Plus vite que son ombre', 'comics-image-63cbc4501f0c06.52460491.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(94, 1, 'Plus vite que son ombre', 'comics-image-63cbc450243531.45845952.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(95, 1, 'Plus vite que son ombre', 'comics-image-63cbc4502c1346.48792421.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(96, 1, 'Plus vite que son ombre', 'comics-image-63cbc45033b071.57924164.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(97, 1, 'Plus vite que son ombre', 'comics-image-63cbc4503ae4b6.97002341.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(98, 1, 'Plus vite que son ombre', 'comics-image-63cbc4504257d1.28518218.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(99, 1, 'Plus vite que son ombre', 'comics-image-63cbc4504a49f6.84184090.jpg', '...', 'comics-LL', '2023-01-21 09:54:08'),
(100, 1, 'La rose de la nuit', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet dignissimos veritatis ipsum odit ex omnis perferendis assumenda consectetur? <br />\r\n<br />\r\nAb itaque corporis earum officiis hic inventore vitae, eaque fuga error alias. Consectetur incidunt, sint ipsum eaque adipisci consequuntur. Quaerat sapiente nesciunt recusandae ducimus, earum non dolor aliquam unde expedita reprehenderit, voluptates perferendis similique dolorum obcaecati! Error quae aliquam architecto nemo adipisci nulla velit earum doloribus commodi, harum consectetur esse itaque, enim distinctio saepe. Quasi, repellendus? Voluptate facere qui temporibus at officiis iure quo error eos rem eaque, impedit quam odit magni officia voluptas minima placeat, saepe eum. Fuga beatae delectus eligendi veniam eum totam, suscipit eaque neque molestias ex doloribus atque, ut maxime dolore ab iste perferendis molestiae voluptatibus vel quia dignissimos assumenda similique? Cumque illum dolore consequuntur rerum ratione. Vero cumque ipsa officiis explicabo, adipisci voluptate hic ex nesciunt cupiditate facere vitae excepturi, at aut sequi pariatur, iure officia minus alias veritatis! Odit ducimus rerum voluptatum quo nobis corrupti. Esse qui vitae neque debitis. Tempore, itaque? Eos ipsum illo sapiente consequatur? Laudantium ipsum rem repellat fugiat ad iure possimus! Architecto dolor itaque officia, neque similique molestiae dolorum velit voluptatibus suscipit laborum temporibus minus eaque blanditiis quaerat cumque sed a enim voluptatem nulla. Reprehenderit error dolorum sit nam perspiciatis perferendis nobis vero nemo numquam vel. Quis fugit sunt consequatur ut reiciendis nam numquam exercitationem optio dolorem enim omnis commodi quam, soluta ab saepe repudiandae maiores nobis asperiores. Doloremque, ipsa perspiciatis assumenda, hic corrupti fugiat voluptatum odio placeat aut, reiciendis consectetur exercitationem autem itaque adipisci ducimus voluptates vero ea libero distinctio quae eius facere laboriosam maiores cumque! Saepe sequi tempora eaque deserunt dolorem similique possimus, incidunt aut cupiditate expedita placeat tenetur commodi laboriosam rerum laudantium delectus itaque soluta temporibus. Modi deleniti adipisci accusantium saepe magni cum voluptate consectetur reprehenderit libero iste aperiam debitis porro ipsa quod obcaecati magnam aut vel autem nostrum ducimus, aliquam dolorem dolorum. Eaque asperiores nulla sed molestiae et eligendi debitis ad tenetur minima molestias aliquid id odit omnis ipsam culpa saepe dicta obcaecati consectetur veritatis, perferendis provident eveniet deserunt, excepturi ratione. Quisquam voluptatum laudantium, officia delectus facere hic, repudiandae adipisci fugiat a minima minus, ex quis eveniet aut id porro. Aperiam eligendi at molestias sit consequatur magni cumque, neque perferendis dicta itaque dolorum facere quae labore velit! Ab iste, possimus rerum hic labore non aspernatur, autem quasi fugiat dolorem provident! Sunt natus culpa cum porro mollitia aliquam quaerat a explicabo laboriosam? Esse voluptatem nam quibusdam inventore porro autem amet aliquam animi labore, aspernatur saepe sapiente excepturi tempore ipsum nihil nostrum. Rerum fugit voluptatem fugiat nam dolore recusandae impedit, nemo eligendi et? <br />\r\n<br />\r\nFacere voluptatem illum eveniet voluptate facilis corporis labore cumque! Exercitationem nam, omnis veniam laudantium consequuntur itaque dignissimos libero aliquam facilis non minus. Consectetur corporis sit expedita saepe quasi qui unde nisi libero, cupiditate accusamus vero, exercitationem veritatis possimus? Nulla porro deserunt dicta perferendis, repellendus quia vel! Nulla consectetur, obcaecati officia possimus totam recusandae consequuntur debitis eius soluta eaque doloremque magnam, architecto porro, error sed delectus asperiores eos.', 'books-LRose', '2023-01-21 09:54:39'),
(101, 2, 'Les épines de la rose', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet dignissimos veritatis ipsum odit ex omnis perferendis assumenda consectetur? Ab itaque corporis earum officiis hic inventore vitae, eaque fuga error alias. Consectetur incidunt, sint ipsum eaque adipisci consequuntur. Quaerat sapiente nesciunt recusandae ducimus, earum non dolor aliquam unde expedita reprehenderit, voluptates perferendis similique dolorum obcaecati! Error quae aliquam architecto nemo adipisci nulla velit earum doloribus commodi, harum consectetur esse itaque, enim distinctio saepe. Quasi, repellendus? Voluptate facere qui temporibus at officiis iure quo error eos rem eaque, impedit quam odit magni officia voluptas minima placeat, saepe eum. Fuga beatae delectus eligendi veniam eum totam, suscipit eaque neque molestias ex doloribus atque, ut maxime dolore ab iste perferendis molestiae voluptatibus vel quia dignissimos assumenda similique? Cumque illum dolore consequuntur rerum ratione. Vero cumque ipsa officiis explicabo, adipisci voluptate hic ex nesciunt cupiditate facere vitae excepturi, at aut sequi pariatur, iure officia minus alias veritatis! Odit ducimus rerum voluptatum quo nobis corrupti. Esse qui vitae neque debitis. Tempore, itaque? Eos ipsum illo sapiente consequatur? Laudantium ipsum rem repellat fugiat ad iure possimus! <br />\r\n<br />\r\nArchitecto dolor itaque officia, neque similique molestiae dolorum velit voluptatibus suscipit laborum temporibus minus eaque blanditiis quaerat cumque sed a enim voluptatem nulla. Reprehenderit error dolorum sit nam perspiciatis perferendis nobis vero nemo numquam vel. Quis fugit sunt consequatur ut reiciendis nam numquam exercitationem optio dolorem enim omnis commodi quam, soluta ab saepe repudiandae maiores nobis asperiores. Doloremque, ipsa perspiciatis assumenda, hic corrupti fugiat voluptatum odio placeat aut, reiciendis consectetur exercitationem autem itaque adipisci ducimus voluptates vero ea libero distinctio quae eius facere laboriosam maiores cumque! Saepe sequi tempora eaque deserunt dolorem similique possimus, incidunt aut cupiditate expedita placeat tenetur commodi laboriosam rerum laudantium delectus itaque soluta temporibus. Modi deleniti adipisci accusantium saepe magni cum voluptate consectetur reprehenderit libero iste aperiam debitis porro ipsa quod obcaecati magnam aut vel autem nostrum ducimus, aliquam dolorem dolorum. Eaque asperiores nulla sed molestiae et eligendi debitis ad tenetur minima molestias aliquid id odit omnis ipsam culpa saepe dicta obcaecati consectetur veritatis, perferendis provident eveniet deserunt, excepturi ratione. Quisquam voluptatum laudantium, officia delectus facere hic, repudiandae adipisci fugiat a minima minus, ex quis eveniet aut id porro. Aperiam eligendi at molestias sit consequatur magni cumque, neque perferendis dicta itaque dolorum facere quae labore velit! Ab iste, possimus rerum hic labore non aspernatur, autem quasi fugiat dolorem provident! <br />\r\n<br />\r\nSunt natus culpa cum porro mollitia aliquam quaerat a explicabo laboriosam? Esse voluptatem nam quibusdam inventore porro autem amet aliquam animi labore, aspernatur saepe sapiente excepturi tempore ipsum nihil nostrum. Rerum fugit voluptatem fugiat nam dolore recusandae impedit, nemo eligendi et? Facere voluptatem illum eveniet voluptate facilis corporis labore cumque! Exercitationem nam, omnis veniam laudantium consequuntur itaque dignissimos libero aliquam facilis non minus. Consectetur corporis sit expedita saepe quasi qui unde nisi libero, cupiditate accusamus vero, exercitationem veritatis possimus? Nulla porro deserunt dicta perferendis, repellendus quia vel! Nulla consectetur, obcaecati officia possimus totam recusandae consequuntur debitis eius soluta eaque doloremque magnam, architecto porro, error sed delectus asperiores eos.', 'books-LRose', '2023-01-21 09:55:06'),
(102, 1, 'Shoot !! balle à la tête', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet dignissimos veritatis ipsum odit ex omnis perferendis assumenda consectetur? Ab itaque corporis earum officiis hic inventore vitae, eaque fuga error alias. Consectetur incidunt, sint ipsum eaque adipisci consequuntur. <br />\r\n<br />\r\nQuaerat sapiente nesciunt recusandae ducimus, earum non dolor aliquam unde expedita reprehenderit, voluptates perferendis similique dolorum obcaecati! Error quae aliquam architecto nemo adipisci nulla velit earum doloribus commodi, harum consectetur esse itaque, enim distinctio saepe. Quasi, repellendus? Voluptate facere qui temporibus at officiis iure quo error eos rem eaque, impedit quam odit magni officia voluptas minima placeat, saepe eum. Fuga beatae delectus eligendi veniam eum totam, suscipit eaque neque molestias ex doloribus atque, ut maxime dolore ab iste perferendis molestiae voluptatibus vel quia dignissimos assumenda similique? Cumque illum dolore consequuntur rerum ratione. Vero cumque ipsa officiis explicabo, adipisci voluptate hic ex nesciunt cupiditate facere vitae excepturi, at aut sequi pariatur, iure officia minus alias veritatis! Odit ducimus rerum voluptatum quo nobis corrupti. Esse qui vitae neque debitis. Tempore, itaque? Eos ipsum illo sapiente consequatur? Laudantium ipsum rem repellat fugiat ad iure possimus! Architecto dolor itaque officia, neque similique molestiae dolorum velit voluptatibus suscipit laborum temporibus minus eaque blanditiis quaerat cumque sed a enim voluptatem nulla. Reprehenderit error dolorum sit nam perspiciatis perferendis nobis vero nemo numquam vel. <br />\r\n<br />\r\nQuis fugit sunt consequatur ut reiciendis nam numquam exercitationem optio dolorem enim omnis commodi quam, soluta ab saepe repudiandae maiores nobis asperiores. Doloremque, ipsa perspiciatis assumenda, hic corrupti fugiat voluptatum odio placeat aut, reiciendis consectetur exercitationem autem itaque adipisci ducimus voluptates vero ea libero distinctio quae eius facere laboriosam maiores cumque! Saepe sequi tempora eaque deserunt dolorem similique possimus, incidunt aut cupiditate expedita placeat tenetur commodi laboriosam rerum laudantium delectus itaque soluta temporibus. Modi deleniti adipisci accusantium saepe magni cum voluptate consectetur reprehenderit libero iste aperiam debitis porro ipsa quod obcaecati magnam aut vel autem nostrum ducimus, aliquam dolorem dolorum. Eaque asperiores nulla sed molestiae et eligendi debitis ad tenetur minima molestias aliquid id odit omnis ipsam culpa saepe dicta obcaecati consectetur veritatis, perferendis provident eveniet deserunt, excepturi ratione. Quisquam voluptatum laudantium, officia delectus facere hic, repudiandae adipisci fugiat a minima minus, ex quis eveniet aut id porro. Aperiam eligendi at molestias sit consequatur magni cumque, neque perferendis dicta itaque dolorum facere quae labore velit! Ab iste, possimus rerum hic labore non aspernatur, autem quasi fugiat dolorem provident! Sunt natus culpa cum porro mollitia aliquam quaerat a explicabo laboriosam? Esse voluptatem nam quibusdam inventore porro autem amet aliquam animi labore, aspernatur saepe sapiente excepturi tempore ipsum nihil nostrum. <br />\r\n<br />\r\nRerum fugit voluptatem fugiat nam dolore recusandae impedit, nemo eligendi et? Facere voluptatem illum eveniet voluptate facilis corporis labore cumque! Exercitationem nam, omnis veniam laudantium consequuntur itaque dignissimos libero aliquam facilis non minus. Consectetur corporis sit expedita saepe quasi qui unde nisi libero, cupiditate accusamus vero, exercitationem veritatis possimus? Nulla porro deserunt dicta perferendis, repellendus quia vel! Nulla consectetur, obcaecati officia possimus totam recusandae consequuntur debitis eius soluta eaque doloremque magnam, architecto porro, error sed delectus asperiores eos.', 'books-name', '2023-01-21 09:56:03'),
(103, 1, 'Yuji Idatori', 'mangas-image-63cbc537b5e516.37972361.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(104, 1, 'Yuji Idatori', 'mangas-image-63cbc537bb0867.03985665.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(105, 1, 'Yuji Idatori', 'mangas-image-63cbc537bd19c0.55466678.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(106, 1, 'Yuji Idatori', 'mangas-image-63cbc537bf04c1.76231305.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(107, 1, 'Yuji Idatori', 'mangas-image-63cbc537c64fa7.67023081.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(108, 1, 'Yuji Idatori', 'mangas-image-63cbc537c83237.68796456.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(109, 1, 'Yuji Idatori', 'mangas-image-63cbc537ca2989.21875230.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(110, 1, 'Yuji Idatori', 'mangas-image-63cbc537d1d8c6.00899736.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(111, 1, 'Yuji Idatori', 'mangas-image-63cbc537d9afa5.91454016.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(112, 1, 'Yuji Idatori', 'mangas-image-63cbc537e16cb8.41830731.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(113, 1, 'Yuji Idatori', 'mangas-image-63cbc537e98358.78419412.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(114, 1, 'Yuji Idatori', 'mangas-image-63cbc537f08316.80969930.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(115, 1, 'Yuji Idatori', 'mangas-image-63cbc53803c876.97381310.jpg', '...', 'mangas-JNK', '2023-01-21 09:57:59'),
(116, 1, 'Le nouveau', 'mangas-image-63cbc56c353357.11248411.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(117, 1, 'Le nouveau', 'mangas-image-63cbc56c379df0.72099197.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(118, 1, 'Le nouveau', 'mangas-image-63cbc56c3993d7.18154189.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(119, 1, 'Le nouveau', 'mangas-image-63cbc56c3bc9f9.10430224.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(120, 1, 'Le nouveau', 'mangas-image-63cbc56c3d77f2.25559109.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(121, 1, 'Le nouveau', 'mangas-image-63cbc56c3ff772.46855755.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(122, 1, 'Le nouveau', 'mangas-image-63cbc56c41ff53.86950505.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(123, 1, 'Le nouveau', 'mangas-image-63cbc56c442357.50300015.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(124, 1, 'Le nouveau', 'mangas-image-63cbc56c45bd12.62568775.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(125, 1, 'Le nouveau', 'mangas-image-63cbc56c47b968.54463688.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(126, 1, 'Le nouveau', 'mangas-image-63cbc56c4e1cf8.75963398.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(127, 1, 'Le nouveau', 'mangas-image-63cbc56c505ad9.03499624.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(128, 1, 'Le nouveau', 'mangas-image-63cbc56c524300.65245103.jpg', 'Le petit nouveau', 'mangas-PFTO', '2023-01-21 09:58:52'),
(130, 1, 'Episode 1', 'comics-image-63ce848a79a7c8.08559714.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(131, 1, 'Episode 1', 'comics-image-63ce848a7c4e58.56112228.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(132, 1, 'Episode 1', 'comics-image-63ce848a7e5023.75430028.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(133, 1, 'Episode 1', 'comics-image-63ce848a806063.74312650.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(134, 1, 'Episode 1', 'comics-image-63ce848a85d561.66202734.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(135, 1, 'Episode 1', 'comics-image-63ce848a881dd8.99397967.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(136, 1, 'Episode 1', 'comics-image-63ce848a89d1b2.68931988.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(137, 1, 'Episode 1', 'comics-image-63ce848a8cae20.35278945.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(138, 1, 'Episode 1', 'comics-image-63ce848a919bb3.98814845.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(139, 1, 'Episode 1', 'comics-image-63ce848a992251.45972294.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(140, 1, 'Episode 1', 'comics-image-63ce848aa0c6d8.20389114.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(141, 1, 'Episode 1', 'comics-image-63ce848aa846c6.64348762.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(142, 1, 'Episode 1', 'comics-image-63ce848aaf4b66.60156746.jpg', 'Là où tout commença', 'comics-BD', '2023-01-23 11:58:50'),
(143, 2, 'Sukuna', 'mangas-image-63ce85027e35c5.01439931.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(144, 2, 'Sukuna', 'mangas-image-63ce850280bf24.60817053.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(145, 2, 'Sukuna', 'mangas-image-63ce850282cab9.86745017.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(146, 2, 'Sukuna', 'mangas-image-63ce8502848395.13238300.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(147, 2, 'Sukuna', 'mangas-image-63ce85028677b3.61105668.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(148, 2, 'Sukuna', 'mangas-image-63ce8502889790.97186062.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(149, 2, 'Sukuna', 'mangas-image-63ce85028a9004.20507537.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(150, 2, 'Sukuna', 'mangas-image-63ce85028c8ba9.95220761.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(151, 2, 'Sukuna', 'mangas-image-63ce85028e26a2.94743410.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(152, 2, 'Sukuna', 'mangas-image-63ce85028feb08.18857868.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(153, 2, 'Sukuna', 'mangas-image-63ce8502919060.33963308.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(154, 2, 'Sukuna', 'mangas-image-63ce8502934bf0.28526719.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(155, 2, 'Sukuna', 'mangas-image-63ce8502952891.28782416.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(156, 2, 'Sukuna', 'mangas-image-63ce8502970ff2.29867888.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(157, 2, 'Sukuna', 'mangas-image-63ce8502990599.49638294.jpg', 'Le roi des fléaux', 'mangas-JNK', '2023-01-23 00:00:50'),
(158, 2, 'Rétro', 'mangas-image-63ce854bdf57f4.02257775.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(159, 2, 'Rétro', 'mangas-image-63ce854be21526.26576482.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(160, 2, 'Rétro', 'mangas-image-63ce854be3c651.65197031.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(161, 2, 'Rétro', 'mangas-image-63ce854be59d28.00165370.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(162, 2, 'Rétro', 'mangas-image-63ce854be73510.72935533.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(163, 2, 'Rétro', 'mangas-image-63ce854be995e6.30877247.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(164, 2, 'Rétro', 'mangas-image-63ce854beb6d82.87845216.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(165, 2, 'Rétro', 'mangas-image-63ce854bedb3a7.33988891.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(166, 2, 'Rétro', 'mangas-image-63ce854bef88e6.87878981.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(167, 2, 'Rétro', 'mangas-image-63ce854bf19ad2.99590106.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(168, 2, 'Rétro', 'mangas-image-63ce854bf35876.15584173.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(169, 2, 'Rétro', 'mangas-image-63ce854c010123.95671224.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(170, 2, 'Rétro', 'mangas-image-63ce854c02fc90.69705370.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(171, 2, 'Rétro', 'mangas-image-63ce854c04f4f0.58582867.jpg', 'Il fut un temps...', 'mangas-WDD', '2023-01-23 00:02:03'),
(172, 1, 'Au début', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni aliquam corporis ut quo neque commodi, earum animi? Impedit accusamus hic amet magni reiciendis numquam dolore architecto voluptatem rem, ipsum, accusantium sequi voluptates aliquam nemo minima? Ipsum fugiat eligendi expedita esse quo inventore officia. Obcaecati hic amet voluptatum. Neque aliquam sunt eveniet natus possimus, quibusdam asperiores provident nobis mollitia beatae quos recusandae. Unde, nisi? Ipsa sit aut ex ratione dolores! Vitae, eos illum? Corporis repudiandae explicabo architecto odit? Nobis optio vero mollitia atque recusandae alias nam itaque rem deserunt, molestias perferendis aperiam ipsum. Debitis ratione, nobis quibusdam ut a doloribus sint culpa. Deserunt vitae adipisci dicta laboriosam veritatis fugit esse, excepturi vero nobis temporibus praesentium aut accusantium maxime provident ut quos minus nam, nesciunt sunt officiis dignissimos aliquam quam. Reiciendis, deserunt sequi dolores, asperiores rerum soluta error eius minima aliquam neque perspiciatis repudiandae omnis aspernatur. Accusantium perferendis illo quaerat illum necessitatibus velit suscipit possimus corporis. Obcaecati ducimus voluptate rerum explicabo natus laudantium nihil nisi unde nemo rem alias harum, consequatur laborum. Dolores explicabo ipsam ab neque cupiditate ad dolorum atque rem totam, nostrum quod deserunt animi aperiam quasi doloremque dolor, ea vero architecto cum praesentium. Blanditiis, amet enim sequi, eaque recusandae sit minus laboriosam temporibus veniam cum ea! Reiciendis sapiente quidem ab, minus quibusdam repellendus recusandae porro eos iste minima atque nobis adipisci voluptates ut illum beatae sequi facilis delectus blanditiis dolor. Praesentium incidunt odit voluptates nostrum eaque sapiente officia eos amet quod reiciendis, sed dolorem doloribus sunt illo assumenda, molestias eius, modi ad! Magnam dolorem doloremque distinctio nam aperiam consectetur quia rerum error ex deleniti dicta, <br />\r\n<br />\r\n<br />\r\nfugit quaerat maxime corporis voluptatum voluptate et pariatur illo ipsam beatae reprehenderit quos! Animi doloribus distinctio harum fugiat nemo aperiam exercitationem reprehenderit sapiente itaque delectus repellendus ad quibusdam hic vel, eveniet praesentium, minima quisquam enim adipisci? Sint dolorum perferendis est deleniti quisquam optio, expedita, odio quam inventore voluptatem in minus animi impedit dicta illum nisi ullam hic illo ducimus ut culpa voluptas placeat quos? Iste quos, tempora unde provident, quis autem aliquid earum officiis animi perferendis nemo quaerat doloremque at aut, saepe voluptates nam omnis id deserunt nisi totam nihil fuga. Pariatur quod voluptatum maxime fuga, iusto, sint veniam id ad officiis illum, expedita dolor obcaecati ipsam repudiandae sequi dolore excepturi quidem cum praesentium! Corporis voluptates autem fugiat ullam dolore nulla sunt iure. Ducimus perspiciatis rem, vitae quaerat dolorem doloribus ut dolorum quae mollitia et inventore doloremque rerum sequi dicta expedita, omnis, totam iure excepturi eos corporis voluptate est minus? <br />\r\n<br />\r\nRatione nemo non, eaque quasi maxime vitae explicabo quas reiciendis veniam fuga, placeat fugiat quia laboriosam, officia inventore error nobis nulla excepturi ipsam unde cumque neque ab temporibus! Earum, exercitationem nam magnam, quo hic quasi deserunt recusandae ipsam nisi dolorem natus laudantium tempore doloremque. Perferendis nam hic nulla atque aut illum, dolor modi nihil praesentium iure architecto amet neque tempore harum quidem sapiente vero est cum qui vitae sequi? Aliquam obcaecati veniam voluptates deserunt deleniti necessitatibus quod quas? Vero reiciendis iure sint molestiae aliquid.', 'books-VBS', '2023-01-23 02:05:52'),
(173, 3, 'Les amoureux 2', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni aliquam corporis ut quo neque commodi, earum animi? Impedit accusamus hic amet magni reiciendis numquam dolore architecto voluptatem rem, ipsum, accusantium sequi voluptates aliquam nemo minima? Ipsum fugiat eligendi expedita esse quo inventore officia. Obcaecati hic amet voluptatum. Neque aliquam sunt eveniet natus possimus, quibusdam asperiores provident nobis mollitia beatae quos recusandae. Unde, nisi? Ipsa sit aut ex ratione dolores! Vitae, eos illum? Corporis repudiandae explicabo architecto odit? Nobis optio vero mollitia atque recusandae alias nam itaque rem deserunt, molestias perferendis aperiam ipsum. Debitis ratione, nobis quibusdam ut a doloribus sint culpa. Deserunt vitae adipisci dicta laboriosam veritatis fugit esse, excepturi vero nobis temporibus praesentium aut accusantium maxime provident ut quos minus nam, nesciunt sunt officiis dignissimos aliquam quam. Reiciendis, deserunt sequi dolores, asperiores rerum soluta error eius minima aliquam neque perspiciatis repudiandae omnis aspernatur. Accusantium perferendis illo quaerat illum necessitatibus velit suscipit possimus corporis. Obcaecati ducimus voluptate rerum explicabo natus laudantium nihil nisi unde nemo rem alias harum, consequatur laborum. Dolores explicabo ipsam ab neque cupiditate ad dolorum atque rem totam, nostrum quod deserunt animi aperiam quasi doloremque dolor, ea vero architecto cum praesentium. Blanditiis, amet enim sequi, eaque recusandae sit minus laboriosam temporibus veniam cum ea! Reiciendis sapiente quidem ab, minus quibusdam repellendus recusandae porro eos iste minima atque nobis adipisci voluptates ut illum beatae sequi facilis delectus blanditiis dolor. Praesentium incidunt odit voluptates nostrum eaque sapiente officia eos amet quod reiciendis, sed dolorem doloribus sunt illo assumenda, molestias eius, modi ad! Magnam dolorem doloremque distinctio nam aperiam consectetur quia rerum error ex deleniti dicta, fugit quaerat maxime corporis voluptatum voluptate et pariatur illo ipsam beatae reprehenderit quos! Animi doloribus distinctio harum fugiat nemo aperiam exercitationem reprehenderit sapiente itaque delectus repellendus ad quibusdam hic vel, eveniet praesentium, minima quisquam enim adipisci? Sint dolorum perferendis est deleniti quisquam optio, expedita, odio quam inventore voluptatem in minus animi impedit dicta illum nisi ullam hic illo ducimus ut culpa voluptas placeat quos? Iste quos, tempora unde provident, quis autem aliquid earum officiis animi perferendis nemo quaerat doloremque at aut, saepe voluptates nam omnis id deserunt nisi totam nihil fuga. Pariatur quod voluptatum maxime fuga, iusto, sint veniam id ad officiis illum, expedita dolor obcaecati ipsam repudiandae sequi dolore excepturi quidem cum praesentium! Corporis voluptates autem fugiat ullam dolore nulla sunt iure. Ducimus perspiciatis rem, vitae quaerat dolorem doloribus ut dolorum quae mollitia et inventore doloremque rerum sequi dicta expedita, omnis, totam iure excepturi eos corporis voluptate est minus? <br />\r\n<br />\r\nRatione nemo non, eaque quasi maxime vitae explicabo quas reiciendis veniam fuga, placeat fugiat quia laboriosam, officia inventore error nobis nulla excepturi ipsam unde cumque neque ab temporibus! <br />\r\n<br />\r\nEarum, exercitationem nam magnam, quo hic quasi deserunt recusandae ipsam nisi dolorem natus laudantium tempore doloremque. Perferendis nam hic nulla atque aut illum, dolor modi nihil praesentium iure architecto amet neque tempore harum quidem sapiente vero est cum qui vitae sequi? Aliquam obcaecati veniam voluptates deserunt deleniti necessitatibus quod quas? Vero reiciendis iure sint molestiae aliquid.', 'books-InPeace', '2023-01-23 02:07:22');

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
(1, '👌...cool les chapitres!!', 1, 'mangas-Exi', '2023-01-18 00:29:56'),
(4, 'J&#039;ai hâte de lire les chapitres!!!😎😎', 2, 'books-VBS', '2023-01-18 02:44:58'),
(10, 'Super cette oeuvre', 1, 'comics-angel', '2023-01-18 06:54:22'),
(11, 'Le petit est trop intelligent', 1, 'comics-angel', '2023-01-18 06:54:40'),
(16, 'Bonjour !!!<br />\r\nLa suite svp !!', 13, 'books-VBS', '2023-01-19 09:58:04'),
(17, 'Ah l&#039;amour!!!<br />\r\n🤦‍♂️❤❤', 13, 'books-InPeace', '2023-01-19 09:58:48'),
(18, 'La suite😍😍✨', 13, 'books-name', '2023-01-19 10:00:59'),
(19, 'ça doit être vraiment interessant!!!', 11, 'books-VBS', '2023-01-19 10:02:45'),
(20, 'Gojo Satoru !!!', 11, 'mangas-JNK', '2023-01-19 10:10:15'),
(21, 'Le plus fort de tous les exorcites du manga😍✨', 12, 'mangas-JNK', '2023-01-19 10:11:17'),
(22, 'N&#039;ayez pas inquiétudes chers lecteurs', 1, 'books-VBS', '2023-01-19 10:46:18'),
(23, 'Ils sont très comiques 😂😂', 1, 'books-InPeace', '2023-01-19 00:12:26'),
(24, 'Vous devez impérativement suivre ce livre!!', 1, 'books-InPeace', '2023-01-19 00:13:16'),
(25, '😂😂😂', 12, 'books-InPeace', '2023-01-19 01:42:53'),
(26, 'La tête de la meuf😂😂🤣', 12, 'books-InPeace', '2023-01-19 01:43:22'),
(27, 'Pas souvent...', 1, 'books-LNuit', '2023-01-21 09:31:14'),
(30, 'Super ce livre😜😜', 1, 'books-VBS', '2023-01-23 01:57:16'),
(33, 'Gojooooo!!!!', 16, 'mangas-JNK', '2023-01-23 03:06:22'),
(35, 'Les chapitres suivant @administrator!!', 1, 'books-LRose', '2023-01-26 00:29:20'),
(37, '@administrator les chapitres!!😥', 10, 'comics-impoli', '2023-01-26 02:22:51'),
(38, '@amour002 come here😍😎', 10, 'mangas-JNK', '2023-01-26 03:26:10'),
(39, 'super @thelo007', 10, 'mangas-JNK', '2023-01-26 03:28:14');

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
(1, 'books-InPeace', 2),
(2, 'mangas-JNK', 2),
(7, 'books-VBS', 1);

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
(1, 'Koladé Moussè', 'ABOUDOU', 'Asdepic002', 'kola444@gmail.com', '$2y$10$hbmIKVztus4Q/ofCV8mHlOBpYSdoBddRDicbVlsGv2dfoG5XX1.hq', 'img-63cffa5948c3e0.03703329.jpg', 'asdepic001', '0', '2023-01-18 00:12:55'),
(2, 'Amour Nassara', 'DAHOU', 'Amour022', 'dahou@gmail.com', '$2y$10$.Zvib3vmPJz..tN6tOfwwuzZ81oFJWfD6hd9FgLi2k/SflVaFvIjG', 'img-63c82bd4e5da16.54698824.jpg', 'amournassara', '1', '2023-01-18 00:16:02'),
(10, 'Mathéos', 'DODJINOU', 'Defunkt002', 'math@gmail.com', '$2y$10$L5/vN0TIoyTFikO7.ZzG3OkZE1dCghxT57otDpxSAMwZYQEqgwUJq', 'img-63c91daa0c5154.91875243.jpg', 'defunkt002', '1', '2023-01-19 09:30:00'),
(11, 'Donald', 'AHOSSI', 'Mojombo11', 'ahossi@gmail.com', '$2y$10$FP7EHsCXr5g7hNPTZdRfneoCJNs4L90uqdSNzQScSDzbPrntiI3mK', 'img-63c92328a71371.97298227.jpg', 'monjombo11', '1', '2023-01-19 09:40:02'),
(12, 'Eric', 'BANKOLE', 'Devman001', 'bank@gmail.com', '$2y$10$UPn3EZo9lyyphrTURtO3.e0eM34.fGKqwa4pGpUL6GOseLn.5/qCS', 'account.jpg', 'devdocman001', '1', '2023-01-19 09:41:57'),
(13, 'Marcos', 'MEDENOU', 'Marcos199', 'marcos@gmail.com', '$2y$10$HlhxGm4ftZda5IBJmh9sWu2aRroLPeXJSjoQpOV5XBG73GZC7m6/S', 'img-63c922d5228a29.96926336.jpg', 'marcos1999', '1', '2023-01-19 09:49:15'),
(16, 'Thelo Brunice', 'PADONOU', 'Thelo007', 'brunice@gmail.com', '$2y$10$2whEifq/DJ5BvLDff/xmH.g5sclqFmOf47I.GrGiMlKj78tKaC0wu', 'img-63ceb0a2223f44.81973974.jpg', 'thelo007brun', '1', '2023-01-23 03:05:29');

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
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
