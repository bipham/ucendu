-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 04, 2017 lúc 03:19 CH
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ucendu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_18_104758_create_reading_lessons_table', 1),
(4, '2017_07_21_050703_create_user_activations_table', 1),
(5, '2017_07_21_051550_create_reading_categories_table', 1),
(6, '2017_07_21_051733_create_reading_type_questions_table', 1),
(7, '2017_07_21_051901_create_reading_category_lessons_table', 1),
(8, '2017_07_21_084509_create_reading_quizzs_table', 1),
(12, '2017_07_21_091751_create_reading_results_table', 1),
(13, '2017_07_21_084604_create_reading_questions_table', 2),
(14, '2017_07_21_084651_create_reading_type_question_of_quizzes_table', 2),
(17, '2017_07_21_084822_create_reading_question_and_answers_table', 3),
(18, '2017_08_02_152014_create_reading_manager_lessons_table', 4),
(19, '2017_08_02_152021_create_reading_comment_notifications_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_categories`
--

CREATE TABLE `reading_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `level_cate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_categories`
--

INSERT INTO `reading_categories` (`id`, `name`, `status`, `parent_id`, `level_cate`, `created_at`, `updated_at`) VALUES
(1, 'Sports', 1, 0, 0, '2017-07-21 21:31:05', '2017-07-21 21:31:05'),
(2, 'Education', 1, 0, 0, '2017-07-24 03:39:36', '2017-07-24 03:39:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_category_lessons`
--

CREATE TABLE `reading_category_lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `cate_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_category_lessons`
--

INSERT INTO `reading_category_lessons` (`id`, `lesson_id`, `cate_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2017-07-21 23:34:34', '2017-07-21 23:34:34'),
(2, 2, 1, 1, '2017-07-21 23:37:49', '2017-07-21 23:37:49'),
(3, 3, 1, 1, '2017-07-21 23:40:22', '2017-07-21 23:40:22'),
(4, 4, 1, 1, '2017-07-21 23:55:19', '2017-07-21 23:55:19'),
(5, 5, 1, 1, '2017-07-21 23:57:16', '2017-07-21 23:57:16'),
(6, 6, 1, 1, '2017-07-21 23:58:28', '2017-07-21 23:58:28'),
(7, 7, 1, 1, '2017-07-21 23:59:45', '2017-07-21 23:59:45'),
(8, 8, 1, 1, '2017-07-22 00:12:29', '2017-07-22 00:12:29'),
(9, 9, 1, 1, '2017-07-24 03:32:52', '2017-07-24 03:32:52'),
(10, 10, 1, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(11, 11, 1, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(12, 12, 1, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(13, 13, 2, 1, '2017-07-24 03:41:58', '2017-07-24 03:41:58'),
(14, 14, 2, 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(15, 15, 2, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(16, 16, 1, 1, '2017-07-28 04:23:24', '2017-07-28 04:23:24'),
(17, 17, 2, 1, '2017-07-28 04:32:13', '2017-07-28 04:32:13'),
(18, 18, 2, 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46'),
(19, 19, 2, 1, '2017-07-28 05:25:13', '2017-07-28 05:25:13'),
(20, 20, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_comment_notifications`
--

CREATE TABLE `reading_comment_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type_noti` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_comment_notifications`
--

INSERT INTO `reading_comment_notifications` (`id`, `question_id`, `user_id`, `type_noti`, `read`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 43, 2, 'userCommentNotification', 0, NULL, '2017-08-02 17:44:22', '2017-08-02 17:44:22'),
(2, 43, 2, 'userCommentNotification', 0, NULL, '2017-08-02 17:51:43', '2017-08-02 17:51:43'),
(3, 43, 2, 'userCommentNotification', 0, NULL, '2017-08-02 17:55:58', '2017-08-02 17:55:58'),
(4, 43, 2, 'userCommentNotification', 0, NULL, '2017-08-02 17:56:51', '2017-08-02 17:56:51'),
(5, 43, 2, 'userCommentNotification', 0, NULL, '2017-08-02 17:58:01', '2017-08-02 17:58:01'),
(6, 43, 2, 'userCommentNotification', 0, NULL, '2017-08-02 17:58:44', '2017-08-02 17:58:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_lessons`
--

CREATE TABLE `reading_lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_lesson` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_highlight` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_feature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_lessons`
--

INSERT INTO `reading_lessons` (`id`, `title`, `content_lesson`, `content_highlight`, `image_feature`, `status`, `created_at`, `updated_at`) VALUES
(10, 'dsae', '<p>Content Post is here!</p>\n', '<p><span class=\"answer-highlight highlight-1 hidden-highlight\" data-timestamp=\"1500892355618\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"8\" id=\"hl-answer-8\">Co</span>nt<span class=\"answer-highlight highlight-2 hidden-highlight\" data-timestamp=\"1500892357538\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"9\" id=\"hl-answer-9\">e</span>nt P<span class=\"answer-highlight highlight-3 hidden-highlight\" data-timestamp=\"1500892359338\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"10\" id=\"hl-answer-10\">os</span>t i<span class=\"answer-highlight highlight-4 hidden-highlight\" data-timestamp=\"1500892362106\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"11\" id=\"hl-answer-11\">s</span> h<span class=\"answer-highlight highlight-5 hidden-highlight\" data-timestamp=\"1500892364650\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"13\" id=\"hl-answer-13\">e</span>r<span class=\"answer-highlight highlight-6 hidden-highlight\" data-timestamp=\"1500892366746\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"12\" id=\"hl-answer-12\">e!</span></p>\n', 'ielts banner-1488639811.jpg', 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(11, 'dsad', '<p>Content Post is here!</p>\n', '<p>Content Post is here!</p>\n', 'ielts banner-1488639811.jpg', 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(12, 'dsad', '<p>Content Post is here!</p>\n', '<p>Content Post is here!</p>\n', 'ielts banner-1488639811.jpg', 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(14, 'tessst', '<p>Content Post is here!</p>\n', '<p>Content Post is here!</p>\n', '19398820_1426172534129041_1021977243_n.png', 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(15, 'Luffy', '<p>Content Post is here!</p>\n', '<p>C<span class=\"answer-highlight highlight-1 highlighting\" data-timestamp=\"1501215652815\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"30\" id=\"hl-answer-30\">o</span>n<span class=\"answer-highlight highlight-2 hidden-highlight\" data-timestamp=\"1501215655006\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"31\" id=\"hl-answer-31\">te</span>n<span class=\"answer-highlight highlight-3 hidden-highlight\" data-timestamp=\"1501215656951\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"32\" id=\"hl-answer-32\">t Po</span>st<span class=\"answer-highlight highlight-4 hidden-highlight\" data-timestamp=\"1501215660935\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"33\" id=\"hl-answer-33\"> is</span> <span class=\"answer-highlight highlight-5 hidden-highlight\" data-timestamp=\"1501215662694\" style=\"background-color: rgb(255, 255, 123);\" data-highlighted=\"true\" data-qnumber=\"34\" id=\"hl-answer-34\">here!</span></p>\n', 'anh-luffy-chibi-3.jpg', 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(17, 'ade wd', '<p>Content Post is here!</p>\n', '<p>Content Post is here!</p>\n', 'anh-luffy-chibi-3.jpg', 1, '2017-07-28 04:32:13', '2017-07-28 04:32:13'),
(18, 'a', '<p>Content Post is here!</p>\n', '<p>Content Post is here!</p>\n', 'anh-luffy-chibi-3.jpg', 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_manager_lessons`
--

CREATE TABLE `reading_manager_lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_questions`
--

CREATE TABLE `reading_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `question_id_custom` int(10) UNSIGNED NOT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_question_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_questions`
--

INSERT INTO `reading_questions` (`id`, `quiz_id`, `question_id_custom`, `answer`, `keyword`, `type_question_id`, `status`, `created_at`, `updated_at`) VALUES
(8, 10, 8, 'A', 'sdf', 1, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(9, 10, 9, 'V', 'dsad', 4, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(10, 10, 10, '3a', 'ad', 1, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(11, 11, 11, 'A', '', 1, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(12, 11, 12, 'B', 'sd', 2, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(13, 11, 13, 'C', 'asd', 3, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(14, 11, 14, 'D', 'd', 1, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(15, 12, 11, 'A', '', 1, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(16, 12, 12, 'B', 'sd', 2, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(17, 12, 13, 'C', 'asd', 3, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(18, 12, 14, 'D', 'd', 1, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(19, 12, 15, 'D', '', 2, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(20, 12, 16, 'ca', 'a', 2, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(31, 14, 27, 'asd', 'sd', 1, 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(32, 14, 28, 'fd', 'asfd', 1, 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(33, 14, 29, 'fd', ' dfd', 1, 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(34, 15, 30, 'A', 'test', 1, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(35, 15, 31, 'B', 'sad asd', 2, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(36, 15, 32, 'C', 'dsad dsf rt ', 4, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(37, 15, 33, 'D', 'gdaf rt tggfh', 5, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(38, 15, 34, 'D', 'dasd sdsdf dsf', 2, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(43, 18, 39, 'A', 'asd', 1, 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46'),
(44, 18, 40, 'V', 'dsad', 1, 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46'),
(45, 18, 41, 'C', 'asdsd', 1, 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_question_and_answers`
--

CREATE TABLE `reading_question_and_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reply_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `content_cmt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_question_and_answers`
--

INSERT INTO `reading_question_and_answers` (`id`, `question_id`, `user_id`, `reply_id`, `content_cmt`, `status`, `private`, `created_at`, `updated_at`) VALUES
(4, 43, 2, 0, 'dsad', 1, 0, '2017-08-02 11:28:36', '2017-08-02 11:28:36'),
(5, 43, 2, 0, 'ad', 1, 0, '2017-08-02 11:29:27', '2017-08-02 11:29:27'),
(6, 44, 2, 0, 'dsad]', 1, 0, '2017-08-02 11:31:27', '2017-08-02 11:31:27'),
(7, 43, 2, 0, 'ahihi', 1, 0, '2017-08-02 11:33:05', '2017-08-02 11:33:05'),
(8, 43, 2, 0, 'asdsad', 1, 0, '2017-08-02 11:33:19', '2017-08-02 11:33:19'),
(9, 44, 2, 0, 'dsad', 1, 0, '2017-08-02 11:34:31', '2017-08-02 11:34:31'),
(10, 44, 2, 6, 'hoho', 1, 0, '2017-08-02 11:34:41', '2017-08-02 11:34:41'),
(11, 44, 2, 0, 'asd', 1, 0, '2017-08-02 11:34:42', '2017-08-02 11:34:42'),
(12, 43, 10, 0, 'dasdsd', 1, 0, '2017-08-02 11:38:15', '2017-08-02 11:38:15'),
(13, 43, 10, 0, 'asd', 1, 0, '2017-08-02 11:38:18', '2017-08-02 11:38:18'),
(14, 43, 10, 13, 'dasd', 1, 0, '2017-08-02 11:38:21', '2017-08-02 11:38:21'),
(15, 43, 10, 0, 'dasd', 1, 1, '2017-08-02 11:40:16', '2017-08-02 11:40:16'),
(16, 43, 2, 12, 'zdfdsf', 1, 1, '2017-08-02 11:40:25', '2017-08-02 11:40:25'),
(17, 43, 2, 12, 'dasd', 1, 1, '2017-08-02 08:42:36', '2017-08-02 08:42:36'),
(18, 43, 2, 0, 'hello', 1, 1, '2017-08-02 08:42:40', '2017-08-02 08:42:40'),
(19, 43, 2, 0, 'dsad', 1, 1, '2017-08-02 16:19:36', '2017-08-02 16:19:36'),
(20, 43, 2, 0, 'hello 123', 1, 1, '2017-08-02 16:20:00', '2017-08-02 16:20:00'),
(25, 43, 2, 0, 'hello', 1, 1, '2017-08-02 16:52:10', '2017-08-02 16:52:10'),
(26, 43, 2, 0, 'dsa', 1, 1, '2017-08-02 16:52:57', '2017-08-02 16:52:57'),
(27, 43, 2, 18, 'dsad', 1, 1, '2017-08-02 16:53:37', '2017-08-02 16:53:37'),
(28, 43, 2, 18, 'dsa', 1, 1, '2017-08-02 16:54:20', '2017-08-02 16:54:20'),
(29, 43, 2, 18, 'dsad', 1, 1, '2017-08-02 16:55:14', '2017-08-02 16:55:14'),
(30, 43, 2, 18, 'dsad', 1, 1, '2017-08-02 16:56:55', '2017-08-02 16:56:55'),
(31, 45, 2, 0, 'df', 1, 1, '2017-08-02 16:59:41', '2017-08-02 16:59:41'),
(32, 43, 2, 18, 'alo', 1, 1, '2017-08-02 17:06:01', '2017-08-02 17:06:01'),
(33, 43, 2, 18, 'dsa', 1, 1, '2017-08-02 17:06:43', '2017-08-02 17:06:43'),
(34, 43, 2, 18, 'dsa', 1, 1, '2017-08-02 17:07:23', '2017-08-02 17:07:23'),
(35, 43, 2, 18, 'dsa', 1, 1, '2017-08-02 17:07:41', '2017-08-02 17:07:41'),
(36, 43, 2, 18, 'dsad', 1, 1, '2017-08-02 17:11:03', '2017-08-02 17:11:03'),
(37, 43, 2, 18, 'c', 1, 1, '2017-08-02 17:13:10', '2017-08-02 17:13:10'),
(38, 43, 2, 18, '4', 1, 1, '2017-08-02 17:13:39', '2017-08-02 17:13:39'),
(39, 43, 2, 18, 'd', 1, 1, '2017-08-02 17:13:57', '2017-08-02 17:13:57'),
(40, 43, 2, 18, 'dsa', 1, 1, '2017-08-02 17:37:25', '2017-08-02 17:37:25'),
(41, 44, 2, 6, 'dsad', 1, 1, '2017-08-02 17:37:59', '2017-08-02 17:37:59'),
(42, 43, 2, 18, 'fdsf', 1, 1, '2017-08-02 17:38:45', '2017-08-02 17:38:45'),
(43, 43, 2, 18, '', 1, 1, '2017-08-02 17:38:45', '2017-08-02 17:38:45'),
(44, 45, 2, 31, 'e', 1, 1, '2017-08-02 17:39:07', '2017-08-02 17:39:07'),
(45, 45, 2, 31, 'fds', 1, 1, '2017-08-02 17:39:44', '2017-08-02 17:39:44'),
(46, 45, 10, 0, 'ahihi', 1, 1, '2017-08-02 17:40:56', '2017-08-02 17:40:56'),
(47, 45, 2, 0, 'dsa', 1, 1, '2017-08-02 17:41:21', '2017-08-02 17:41:21'),
(48, 45, 2, 0, 'dsa', 1, 1, '2017-08-02 17:42:38', '2017-08-02 17:42:38'),
(49, 45, 2, 0, 'd', 1, 1, '2017-08-02 17:43:59', '2017-08-02 17:43:59'),
(50, 43, 2, 18, 'dsad', 1, 1, '2017-08-02 17:44:22', '2017-08-02 17:44:22'),
(51, 43, 10, 8, '2', 1, 1, '2017-08-02 17:51:43', '2017-08-02 17:51:43'),
(52, 43, 10, 7, 'hello', 1, 1, '2017-08-02 17:55:58', '2017-08-02 17:55:58'),
(53, 43, 10, 4, 'dsad', 1, 1, '2017-08-02 17:56:51', '2017-08-02 17:56:51'),
(54, 43, 10, 4, 'dsa', 1, 1, '2017-08-02 17:58:01', '2017-08-02 17:58:01'),
(55, 43, 10, 4, 'dsad', 1, 1, '2017-08-02 17:58:44', '2017-08-02 17:58:44'),
(56, 36, 10, 0, 'helo Heo', 1, 1, '2017-08-03 15:58:24', '2017-08-03 15:58:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_quizzs`
--

CREATE TABLE `reading_quizzs` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `content_quiz` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_answer_quiz` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_questions` int(11) NOT NULL,
  `type_lesson` tinyint(4) NOT NULL DEFAULT '1',
  `limit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_quizzs`
--

INSERT INTO `reading_quizzs` (`id`, `lesson_id`, `content_quiz`, `content_answer_quiz`, `total_questions`, `type_lesson`, `limit_time`, `status`, `created_at`, `updated_at`) VALUES
(10, 10, '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"8\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" />Content Post is here!</p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"9\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"11\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"10\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>6</strong></span> <input class=\"question-quiz question-input question-6 last-option\" data-qnumber=\"12\" name=\"question-6\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"13\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" /></p>\n', '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"8\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\">Content Post is here!</p><div class=\"explain-area\"><span><strong>Answer 1: A</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"8\" onclick=\"scrollToHighlight(1)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"8\" data-toggle=\"collapse\" href=\"#keywordArea-8\" aria-expanded=\"false\" aria-controls=\"keywordArea-8\" onclick=\"showKeywords(8)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"8\" data-toggle=\"collapse\" href=\"#commentArea-8\" aria-expanded=\"false\" aria-controls=\"commentArea-8\" onclick=\"showComments(8)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-8\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-8\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"9\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 2: V</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"9\" onclick=\"scrollToHighlight(2)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"9\" data-toggle=\"collapse\" href=\"#keywordArea-9\" aria-expanded=\"false\" aria-controls=\"keywordArea-9\" onclick=\"showKeywords(9)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"9\" data-toggle=\"collapse\" href=\"#commentArea-9\" aria-expanded=\"false\" aria-controls=\"commentArea-9\" onclick=\"showComments(9)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-9\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-9\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"11\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 4: ád</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"11\" onclick=\"scrollToHighlight(4)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"11\" data-toggle=\"collapse\" href=\"#keywordArea-11\" aria-expanded=\"false\" aria-controls=\"keywordArea-11\" onclick=\"showKeywords(11)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"11\" data-toggle=\"collapse\" href=\"#commentArea-11\" aria-expanded=\"false\" aria-controls=\"commentArea-11\" onclick=\"showComments(11)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-11\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-11\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"10\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 3: 3a</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"10\" onclick=\"scrollToHighlight(3)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"10\" data-toggle=\"collapse\" href=\"#keywordArea-10\" aria-expanded=\"false\" aria-controls=\"keywordArea-10\" onclick=\"showKeywords(10)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"10\" data-toggle=\"collapse\" href=\"#commentArea-10\" aria-expanded=\"false\" aria-controls=\"commentArea-10\" onclick=\"showComments(10)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-10\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-10\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>6</strong></span> <input class=\"question-quiz question-input question-6 last-option\" data-qnumber=\"12\" name=\"question-6\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 6: df</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"12\" onclick=\"scrollToHighlight(6)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"12\" data-toggle=\"collapse\" href=\"#keywordArea-12\" aria-expanded=\"false\" aria-controls=\"keywordArea-12\" onclick=\"showKeywords(12)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"12\" data-toggle=\"collapse\" href=\"#commentArea-12\" aria-expanded=\"false\" aria-controls=\"commentArea-12\" onclick=\"showComments(12)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-12\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-12\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"13\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 5: dsa</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"13\" onclick=\"scrollToHighlight(5)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"13\" data-toggle=\"collapse\" href=\"#keywordArea-13\" aria-expanded=\"false\" aria-controls=\"keywordArea-13\" onclick=\"showKeywords(13)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"13\" data-toggle=\"collapse\" href=\"#commentArea-13\" aria-expanded=\"false\" aria-controls=\"commentArea-13\" onclick=\"showComments(13)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-13\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-13\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n', 6, 2, 0, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(11, 11, '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"11\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"12\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /><br />\n<span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"13\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"14\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"15\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>6</strong></span> <input class=\"question-quiz question-input question-6 last-option\" data-qnumber=\"16\" name=\"question-6\" onclick=\"bitest(this)\" type=\"text\" />Content Post is here!</p>\n', '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"11\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 1: A</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"11\" onclick=\"scrollToHighlight(1)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"11\" data-toggle=\"collapse\" href=\"#keywordArea-11\" aria-expanded=\"false\" aria-controls=\"keywordArea-11\" onclick=\"showKeywords(11)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"11\" data-toggle=\"collapse\" href=\"#commentArea-11\" aria-expanded=\"false\" aria-controls=\"commentArea-11\" onclick=\"showComments(11)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-11\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-11\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"12\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"><br>\n<span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"13\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 3: C</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"13\" onclick=\"scrollToHighlight(3)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"13\" data-toggle=\"collapse\" href=\"#keywordArea-13\" aria-expanded=\"false\" aria-controls=\"keywordArea-13\" onclick=\"showKeywords(13)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"13\" data-toggle=\"collapse\" href=\"#commentArea-13\" aria-expanded=\"false\" aria-controls=\"commentArea-13\" onclick=\"showComments(13)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-13\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-13\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div><div class=\"explain-area\"><span><strong>Answer 2: B</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"12\" onclick=\"scrollToHighlight(2)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"12\" data-toggle=\"collapse\" href=\"#keywordArea-12\" aria-expanded=\"false\" aria-controls=\"keywordArea-12\" onclick=\"showKeywords(12)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"12\" data-toggle=\"collapse\" href=\"#commentArea-12\" aria-expanded=\"false\" aria-controls=\"commentArea-12\" onclick=\"showComments(12)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-12\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-12\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"14\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 4: D</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"14\" onclick=\"scrollToHighlight(4)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"14\" data-toggle=\"collapse\" href=\"#keywordArea-14\" aria-expanded=\"false\" aria-controls=\"keywordArea-14\" onclick=\"showKeywords(14)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"14\" data-toggle=\"collapse\" href=\"#commentArea-14\" aria-expanded=\"false\" aria-controls=\"commentArea-14\" onclick=\"showComments(14)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-14\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-14\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"15\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 5: D</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"15\" onclick=\"scrollToHighlight(5)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"15\" data-toggle=\"collapse\" href=\"#keywordArea-15\" aria-expanded=\"false\" aria-controls=\"keywordArea-15\" onclick=\"showKeywords(15)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"15\" data-toggle=\"collapse\" href=\"#commentArea-15\" aria-expanded=\"false\" aria-controls=\"commentArea-15\" onclick=\"showComments(15)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-15\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-15\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>6</strong></span> <input class=\"question-quiz question-input question-6 last-option\" data-qnumber=\"16\" name=\"question-6\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\">Content Post is here!</p><div class=\"explain-area\"><span><strong>Answer 6: ca</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"16\" onclick=\"scrollToHighlight(6)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"16\" data-toggle=\"collapse\" href=\"#keywordArea-16\" aria-expanded=\"false\" aria-controls=\"keywordArea-16\" onclick=\"showKeywords(16)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"16\" data-toggle=\"collapse\" href=\"#commentArea-16\" aria-expanded=\"false\" aria-controls=\"commentArea-16\" onclick=\"showComments(16)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-16\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-16\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n', 6, 2, 0, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(12, 12, '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"11\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"12\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /><br />\n<span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"13\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"14\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"15\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>6</strong></span> <input class=\"question-quiz question-input question-6 last-option\" data-qnumber=\"16\" name=\"question-6\" onclick=\"bitest(this)\" type=\"text\" />Content Post is here!</p>\n', '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"11\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 1: A</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"11\" onclick=\"scrollToHighlight(1)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"11\" data-toggle=\"collapse\" href=\"#keywordArea-11\" aria-expanded=\"false\" aria-controls=\"keywordArea-11\" onclick=\"showKeywords(11)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"11\" data-toggle=\"collapse\" href=\"#commentArea-11\" aria-expanded=\"false\" aria-controls=\"commentArea-11\" onclick=\"showComments(11)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-11\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-11\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"12\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"><br>\n<span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"13\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 3: C</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"13\" onclick=\"scrollToHighlight(3)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"13\" data-toggle=\"collapse\" href=\"#keywordArea-13\" aria-expanded=\"false\" aria-controls=\"keywordArea-13\" onclick=\"showKeywords(13)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"13\" data-toggle=\"collapse\" href=\"#commentArea-13\" aria-expanded=\"false\" aria-controls=\"commentArea-13\" onclick=\"showComments(13)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-13\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-13\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div><div class=\"explain-area\"><span><strong>Answer 2: B</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"12\" onclick=\"scrollToHighlight(2)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"12\" data-toggle=\"collapse\" href=\"#keywordArea-12\" aria-expanded=\"false\" aria-controls=\"keywordArea-12\" onclick=\"showKeywords(12)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"12\" data-toggle=\"collapse\" href=\"#commentArea-12\" aria-expanded=\"false\" aria-controls=\"commentArea-12\" onclick=\"showComments(12)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-12\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-12\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"14\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 4: D</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"14\" onclick=\"scrollToHighlight(4)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"14\" data-toggle=\"collapse\" href=\"#keywordArea-14\" aria-expanded=\"false\" aria-controls=\"keywordArea-14\" onclick=\"showKeywords(14)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"14\" data-toggle=\"collapse\" href=\"#commentArea-14\" aria-expanded=\"false\" aria-controls=\"commentArea-14\" onclick=\"showComments(14)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-14\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-14\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"15\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 5: D</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"15\" onclick=\"scrollToHighlight(5)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"15\" data-toggle=\"collapse\" href=\"#keywordArea-15\" aria-expanded=\"false\" aria-controls=\"keywordArea-15\" onclick=\"showKeywords(15)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"15\" data-toggle=\"collapse\" href=\"#commentArea-15\" aria-expanded=\"false\" aria-controls=\"commentArea-15\" onclick=\"showComments(15)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-15\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-15\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>6</strong></span> <input class=\"question-quiz question-input question-6 last-option\" data-qnumber=\"16\" name=\"question-6\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\">Content Post is here!</p><div class=\"explain-area\"><span><strong>Answer 6: ca</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"16\" onclick=\"scrollToHighlight(6)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"16\" data-toggle=\"collapse\" href=\"#keywordArea-16\" aria-expanded=\"false\" aria-controls=\"keywordArea-16\" onclick=\"showKeywords(16)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"16\" data-toggle=\"collapse\" href=\"#commentArea-16\" aria-expanded=\"false\" aria-controls=\"commentArea-16\" onclick=\"showComments(16)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-16\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-16\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n', 6, 2, 0, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(14, 14, '<p>Content Post is here!<span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"27\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"28\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"29\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p>&nbsp;</p>\n', '<p>Content Post is here!<span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"27\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 1: asd</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"27\" onclick=\"scrollToHighlight(1)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"27\" data-toggle=\"collapse\" href=\"#keywordArea-27\" aria-expanded=\"false\" aria-controls=\"keywordArea-27\" onclick=\"showKeywords(27)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"27\" data-toggle=\"collapse\" href=\"#commentArea-27\" aria-expanded=\"false\" aria-controls=\"commentArea-27\" onclick=\"showComments(27)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-27\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-27\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"28\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 2: fd</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"28\" onclick=\"scrollToHighlight(2)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"28\" data-toggle=\"collapse\" href=\"#keywordArea-28\" aria-expanded=\"false\" aria-controls=\"keywordArea-28\" onclick=\"showKeywords(28)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"28\" data-toggle=\"collapse\" href=\"#commentArea-28\" aria-expanded=\"false\" aria-controls=\"commentArea-28\" onclick=\"showComments(28)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-28\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-28\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"29\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 3: fd</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"29\" onclick=\"scrollToHighlight(3)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"29\" data-toggle=\"collapse\" href=\"#keywordArea-29\" aria-expanded=\"false\" aria-controls=\"keywordArea-29\" onclick=\"showKeywords(29)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"29\" data-toggle=\"collapse\" href=\"#commentArea-29\" aria-expanded=\"false\" aria-controls=\"commentArea-29\" onclick=\"showComments(29)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-29\"> <div class=\"card card-block keywords-area\">ea proident.</div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-29\"> <div class=\"card card-block comments-area\">ea proident.</div></div></div>\n\n<p>&nbsp;</p>\n', 3, 1, 3600, 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(15, 15, '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"30\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"31\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"32\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"33\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"34\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" />Content Post is here!</p>\n', '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"30\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 1: A</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"30\" onclick=\"scrollToHighlight(1)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"30\" data-toggle=\"collapse\" href=\"#keywordArea-30\" aria-expanded=\"true\" aria-controls=\"keywordArea-30\" onclick=\"showKeywords(30)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"30\" data-toggle=\"collapse\" href=\"#commentArea-30\" aria-expanded=\"true\" aria-controls=\"commentArea-30\" onclick=\"showComments(30)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collage-keywords collapse-custom collapse show\" id=\"keywordArea-30\" aria-expanded=\"true\"> <div class=\"card card-header keywords-area-title\"></div><div class=\"card card-block keywords-area\"></div></div><div class=\"collage-comments collapse-custom collapse show\" id=\"commentArea-30\" aria-expanded=\"true\"> <div class=\"card card-block comments-area-title\"></div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"31\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 2: B</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"31\" onclick=\"scrollToHighlight(2)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"31\" data-toggle=\"collapse\" href=\"#keywordArea-31\" aria-expanded=\"false\" aria-controls=\"keywordArea-31\" onclick=\"showKeywords(31)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"31\" data-toggle=\"collapse\" href=\"#commentArea-31\" aria-expanded=\"false\" aria-controls=\"commentArea-31\" onclick=\"showComments(31)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-31\"> <div class=\"card card-header keywords-area-title\"></div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-31\"> <div class=\"card card-block comments-area-title\"></div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"32\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 3: C</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"32\" onclick=\"scrollToHighlight(3)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"32\" data-toggle=\"collapse\" href=\"#keywordArea-32\" aria-expanded=\"false\" aria-controls=\"keywordArea-32\" onclick=\"showKeywords(32)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"32\" data-toggle=\"collapse\" href=\"#commentArea-32\" aria-expanded=\"false\" aria-controls=\"commentArea-32\" onclick=\"showComments(32)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-32\"> <div class=\"card card-header keywords-area-title\"></div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-32\"> <div class=\"card card-block comments-area-title\"></div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>4</strong></span> <input class=\"question-quiz question-input question-4 last-option\" data-qnumber=\"33\" name=\"question-4\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 4: D</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"33\" onclick=\"scrollToHighlight(4)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"33\" data-toggle=\"collapse\" href=\"#keywordArea-33\" aria-expanded=\"false\" aria-controls=\"keywordArea-33\" onclick=\"showKeywords(33)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"33\" data-toggle=\"collapse\" href=\"#commentArea-33\" aria-expanded=\"false\" aria-controls=\"commentArea-33\" onclick=\"showComments(33)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-33\"> <div class=\"card card-header keywords-area-title\"></div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-33\"> <div class=\"card card-block comments-area-title\"></div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>5</strong></span> <input class=\"question-quiz question-input question-5 last-option\" data-qnumber=\"34\" name=\"question-5\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\">Content Post is here!</p><div class=\"explain-area\"><span><strong>Answer 5: D</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"34\" onclick=\"scrollToHighlight(5)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"34\" data-toggle=\"collapse\" href=\"#keywordArea-34\" aria-expanded=\"false\" aria-controls=\"keywordArea-34\" onclick=\"showKeywords(34)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"34\" data-toggle=\"collapse\" href=\"#commentArea-34\" aria-expanded=\"false\" aria-controls=\"commentArea-34\" onclick=\"showComments(34)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-34\"> <div class=\"card card-header keywords-area-title\"></div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-34\"> <div class=\"card card-block comments-area-title\"></div><div class=\"card card-block comments-area\"></div></div></div>\n', 5, 2, 60, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(17, 17, '<p>Content Post is here!</p>\n\n<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"36\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"37\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"38\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n', '<p>Content Post is here!</p>\n\n<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"36\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\"></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"37\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\"></p>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"38\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\"></p>\n', 3, 3, 0, 1, '2017-07-28 04:32:13', '2017-07-28 04:32:13'),
(18, 18, '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"39\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"40\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"41\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" /></p>\n\n<p>Content Post is here!</p>\n', '<p><span class=\"label-input key-label\"><strong>1</strong></span> <input class=\"question-quiz question-input question-1 last-option\" data-qnumber=\"39\" name=\"question-1\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 1: A</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"39\" onclick=\"scrollToHighlight(1)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"39\" data-toggle=\"collapse\" href=\"#keywordArea-39\" aria-expanded=\"false\" aria-controls=\"keywordArea-39\" onclick=\"showKeywords(39)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"39\" data-toggle=\"collapse\" href=\"#commentArea-39\" aria-expanded=\"false\" aria-controls=\"commentArea-39\" onclick=\"showComments(39)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-39\"> <div class=\"card card-header keywords-area-title\">KEYWORDS:</div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-39\"> <div class=\"card card-block comments-area-title\">QUESTION &amp; ANSWER:</div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>2</strong></span> <input class=\"question-quiz question-input question-2 last-option\" data-qnumber=\"40\" name=\"question-2\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 2: V</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"40\" onclick=\"scrollToHighlight(2)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"40\" data-toggle=\"collapse\" href=\"#keywordArea-40\" aria-expanded=\"false\" aria-controls=\"keywordArea-40\" onclick=\"showKeywords(40)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"40\" data-toggle=\"collapse\" href=\"#commentArea-40\" aria-expanded=\"false\" aria-controls=\"commentArea-40\" onclick=\"showComments(40)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-40\"> <div class=\"card card-header keywords-area-title\">KEYWORDS:</div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-40\"> <div class=\"card card-block comments-area-title\">QUESTION &amp; ANSWER:</div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p><span class=\"label-input key-label\"><strong>3</strong></span> <input class=\"question-quiz question-input question-3 last-option\" data-qnumber=\"41\" name=\"question-3\" onclick=\"bitest(this)\" type=\"text\" disabled=\"disabled\"></p><div class=\"explain-area\"><span><strong>Answer 3: C</strong></span><a class=\"btn btn-xs btn-primary btn-locate-highlight\" data-qnumber=\"41\" onclick=\"scrollToHighlight(3)\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i>&nbsp;Locate</a><a class=\"btn btn-xs btn-info btn-show-keywords\" data-qnumber=\"41\" data-toggle=\"collapse\" href=\"#keywordArea-41\" aria-expanded=\"false\" aria-controls=\"keywordArea-41\" onclick=\"showKeywords(41)\"><i class=\"fa fa-key\" aria-hidden=\"true\"></i>&nbsp;Keywords</a><a class=\"btn btn-xs btn-warning btn-show-comments\" data-qnumber=\"41\" data-toggle=\"collapse\" href=\"#commentArea-41\" aria-expanded=\"false\" aria-controls=\"commentArea-41\" onclick=\"showComments(41)\"><i class=\"fa fa-question\" aria-hidden=\"true\"></i>&nbsp;Comments</a><div class=\"collapse collage-keywords collapse-custom\" id=\"keywordArea-41\"> <div class=\"card card-header keywords-area-title\">KEYWORDS:</div><div class=\"card card-block keywords-area\"></div></div><div class=\"collapse collage-comments collapse-custom\" id=\"commentArea-41\"> <div class=\"card card-block comments-area-title\">QUESTION &amp; ANSWER:</div><div class=\"card card-block comments-area\"></div></div></div>\n\n<p>Content Post is here!</p>\n', 3, 1, 0, 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_results`
--

CREATE TABLE `reading_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `list_answered` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_type_questions`
--

CREATE TABLE `reading_type_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_type_questions`
--

INSERT INTO `reading_type_questions` (`id`, `name`, `introduction`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Matching Headings', 'introduction', 1, NULL, NULL),
(2, 'Matching Information', 'introduction', 1, NULL, NULL),
(3, 'Multiple Choice', 'introduction', 1, NULL, NULL),
(4, 'Plan, map, diagram labelling', 'introduction', 1, NULL, NULL),
(5, 'Sentence Completion', 'introduction', 1, NULL, NULL),
(6, 'Summary, form completion', 'introduction', 1, NULL, NULL),
(7, 'TRUE-FALSE-NOT GIVEN', 'introduction', 1, NULL, NULL),
(8, 'YES-NO-NOT GIVEN', 'introduction', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reading_type_question_of_quizzes`
--

CREATE TABLE `reading_type_question_of_quizzes` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `type_question_id` int(10) UNSIGNED NOT NULL,
  `total_questions` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reading_type_question_of_quizzes`
--

INSERT INTO `reading_type_question_of_quizzes` (`id`, `quiz_id`, `type_question_id`, `total_questions`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 1, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(2, 10, 4, 1, 1, '2017-07-24 03:34:16', '2017-07-24 03:34:16'),
(3, 11, 1, 1, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(4, 11, 2, 3, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(5, 11, 3, 2, 1, '2017-07-24 03:35:25', '2017-07-24 03:35:25'),
(6, 12, 1, 2, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(7, 12, 2, 3, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(8, 12, 3, 1, 1, '2017-07-24 03:38:17', '2017-07-24 03:38:17'),
(14, 14, 1, 3, 1, '2017-07-24 04:15:08', '2017-07-24 04:15:08'),
(15, 15, 1, 1, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(16, 15, 2, 2, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(17, 15, 4, 1, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(18, 15, 5, 1, 1, '2017-07-28 04:21:14', '2017-07-28 04:21:14'),
(20, 17, 1, 3, 1, '2017-07-28 04:32:13', '2017-07-28 04:32:13'),
(21, 18, 4, 3, 1, '2017-07-28 05:17:46', '2017-07-28 05:17:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `level`, `fullname`, `address`, `city`, `district`, `phone`, `dob`, `avatar`, `activated`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'test1', 'test1@gmail.com', '$2y$10$sKS/8W0nBF/BjFYbILz9Mefde/dYPyxUe52d/MbPEkihIKMZcfChi', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', 0, 1, 'B4tbhUxPRIuFieBYhZqLV2GwlBYgpdVQUOrrkQRA', '2017-07-27 02:59:39', '2017-07-27 02:59:39'),
(9, '51000103', 'test2@gmail.com', '$2y$10$/uOEUhNjgVE1Nhu1Y9slluTMuHtXYtUSpvFeab2dFlT/evsyXszZe', 0, NULL, NULL, NULL, NULL, NULL, NULL, '51000103.jpg', 0, 1, 'B4tbhUxPRIuFieBYhZqLV2GwlBYgpdVQUOrrkQRA', '2017-07-27 03:24:02', '2017-07-27 03:24:02'),
(10, 'ljnkxjnk1412', 'test3@gmail.com', '$2y$10$hKHUNmcy7oraCMLm7Prrp.E2pTV863hbRzKhR0ZMzhtSB3hIpuTti', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ljnkxjnk1412.jpg', 0, 1, 'B4tbhUxPRIuFieBYhZqLV2GwlBYgpdVQUOrrkQRA', '2017-07-27 03:30:39', '2017-07-27 03:30:39'),
(11, 'kyobmt1412', 'test4@gmail.com', '$2y$10$r32bs9fyJk0BAS3fC31bt.Gm746FT2L0okAgVnaE9ZLAs7U0LuPIW', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'kyobmt1412.jpg', 0, 1, 'B4tbhUxPRIuFieBYhZqLV2GwlBYgpdVQUOrrkQRA', '2017-07-27 03:30:53', '2017-07-27 03:30:53'),
(12, 'bipham', 'test7@gmail.com', '$2y$10$cKvjy1rcnSKw/S43iGSbc.5EFQ/8ND3WJqXE8uG0x68msWk3J.2fi', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'default.jpg', 0, 1, 'vJpZvMvV8ACqrmCvrrm7WxkELKVa9FlXBTmL5Ewb', '2017-07-29 07:12:42', '2017-07-29 07:12:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_activations`
--

CREATE TABLE `user_activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `reading_categories`
--
ALTER TABLE `reading_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reading_categories_name_unique` (`name`);

--
-- Chỉ mục cho bảng `reading_category_lessons`
--
ALTER TABLE `reading_category_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reading_comment_notifications`
--
ALTER TABLE `reading_comment_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_comment_notifications_question_id_foreign` (`question_id`),
  ADD KEY `reading_comment_notifications_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `reading_lessons`
--
ALTER TABLE `reading_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reading_manager_lessons`
--
ALTER TABLE `reading_manager_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_manager_lessons_user_id_foreign` (`user_id`),
  ADD KEY `reading_manager_lessons_lesson_id_foreign` (`lesson_id`);

--
-- Chỉ mục cho bảng `reading_questions`
--
ALTER TABLE `reading_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_questions_quiz_id_foreign` (`quiz_id`),
  ADD KEY `reading_questions_type_question_id_foreign` (`type_question_id`);

--
-- Chỉ mục cho bảng `reading_question_and_answers`
--
ALTER TABLE `reading_question_and_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_question_and_answers_question_id_foreign` (`question_id`),
  ADD KEY `reading_question_and_answers_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `reading_quizzs`
--
ALTER TABLE `reading_quizzs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_quizzs_lesson_id_foreign` (`lesson_id`);

--
-- Chỉ mục cho bảng `reading_results`
--
ALTER TABLE `reading_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_results_user_id_foreign` (`user_id`),
  ADD KEY `reading_results_quiz_id_foreign` (`quiz_id`);

--
-- Chỉ mục cho bảng `reading_type_questions`
--
ALTER TABLE `reading_type_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reading_type_questions_name_unique` (`name`);

--
-- Chỉ mục cho bảng `reading_type_question_of_quizzes`
--
ALTER TABLE `reading_type_question_of_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_type_question_of_quizzes_quiz_id_foreign` (`quiz_id`),
  ADD KEY `reading_type_question_of_quizzes_type_question_id_foreign` (`type_question_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_activations`
--
ALTER TABLE `user_activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activations_token_index` (`token`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT cho bảng `reading_categories`
--
ALTER TABLE `reading_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `reading_category_lessons`
--
ALTER TABLE `reading_category_lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT cho bảng `reading_comment_notifications`
--
ALTER TABLE `reading_comment_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `reading_lessons`
--
ALTER TABLE `reading_lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT cho bảng `reading_manager_lessons`
--
ALTER TABLE `reading_manager_lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `reading_questions`
--
ALTER TABLE `reading_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT cho bảng `reading_question_and_answers`
--
ALTER TABLE `reading_question_and_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT cho bảng `reading_quizzs`
--
ALTER TABLE `reading_quizzs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT cho bảng `reading_results`
--
ALTER TABLE `reading_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `reading_type_questions`
--
ALTER TABLE `reading_type_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `reading_type_question_of_quizzes`
--
ALTER TABLE `reading_type_question_of_quizzes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT cho bảng `user_activations`
--
ALTER TABLE `user_activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `reading_comment_notifications`
--
ALTER TABLE `reading_comment_notifications`
  ADD CONSTRAINT `reading_comment_notifications_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `reading_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reading_comment_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reading_manager_lessons`
--
ALTER TABLE `reading_manager_lessons`
  ADD CONSTRAINT `reading_manager_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `reading_lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reading_manager_lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reading_questions`
--
ALTER TABLE `reading_questions`
  ADD CONSTRAINT `reading_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `reading_quizzs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reading_questions_type_question_id_foreign` FOREIGN KEY (`type_question_id`) REFERENCES `reading_type_questions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reading_question_and_answers`
--
ALTER TABLE `reading_question_and_answers`
  ADD CONSTRAINT `reading_question_and_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `reading_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reading_question_and_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reading_quizzs`
--
ALTER TABLE `reading_quizzs`
  ADD CONSTRAINT `reading_quizzs_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `reading_lessons` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reading_results`
--
ALTER TABLE `reading_results`
  ADD CONSTRAINT `reading_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `reading_quizzs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reading_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reading_type_question_of_quizzes`
--
ALTER TABLE `reading_type_question_of_quizzes`
  ADD CONSTRAINT `reading_type_question_of_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `reading_quizzs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reading_type_question_of_quizzes_type_question_id_foreign` FOREIGN KEY (`type_question_id`) REFERENCES `reading_type_questions` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
