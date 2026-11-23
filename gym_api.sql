-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лис 23 2026 р., 14:17
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `gym_api`
--

-- --------------------------------------------------------

--
-- Структура таблиці `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL,
  `time_slot_id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `duration_minutes` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed') NOT NULL DEFAULT 'confirmed',
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `trainer_id`, `time_slot_id`, `booking_date`, `start_time`, `end_time`, `duration_minutes`, `price`, `status`, `cancelled_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2026-11-16', '08:00:00', '09:00:00', 60, 200.00, 'completed', NULL, '2026-11-23 11:04:42', '2026-11-23 11:04:42'),
(2, 2, 1, 1, '2026-11-09', '10:00:00', '11:00:00', 60, 200.00, 'completed', NULL, '2026-11-23 11:04:42', '2026-11-23 11:04:42'),
(3, 3, 2, 6, '2026-11-18', '07:00:00', '08:00:00', 60, 200.00, 'completed', NULL, '2026-11-23 11:04:42', '2026-11-23 11:04:42');

-- --------------------------------------------------------

--
-- Структура таблиці `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `max_capacity` int(10) UNSIGNED NOT NULL,
  `current_people` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `gyms`
--

INSERT INTO `gyms` (`id`, `name`, `city`, `address`, `max_capacity`, `current_people`, `created_at`, `updated_at`) VALUES
(1, 'FitLife Kyiv Central', 'Kyiv', 'Khreshchatyk St, 22', 100, 45, '2026-11-23 11:04:35', '2026-11-23 11:04:35'),
(2, 'PowerZone Lviv', 'Lviv', 'Svobody Ave, 7', 80, 20, '2026-11-23 11:04:35', '2026-11-23 11:04:35'),
(3, 'Harmony Studio Odesa', 'Odesa', 'Derybasivska St, 15', 60, 5, '2026-11-23 11:04:35', '2026-11-23 11:04:35');

-- --------------------------------------------------------

--
-- Структура таблиці `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_01_01_000001_create_users_table', 1),
(2, '2024_01_01_000002_create_gyms_table', 1),
(3, '2024_01_01_000003_create_trainers_table', 1),
(4, '2024_01_01_000004_create_time_slots_table', 1),
(5, '2024_01_01_000005_create_onboarding_answers_table', 1),
(6, '2024_01_01_000006_create_subscriptions_table', 1),
(7, '2024_01_01_000007_create_bookings_table', 1),
(8, '2024_01_01_000008_create_reviews_table', 1),
(9, '2024_01_01_000009_create_visit_history_table', 1),
(10, '2024_01_01_000010_create_notifications_table', 1),
(11, '2026_03_20_163220_create_personal_access_tokens_table', 1),
(12, '2026_03_20_170203_create_sessions_table', 1),
(13, '2026_03_20_170210_create_cache_table', 1),
(14, '2026_03_20_170217_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `type` enum('booking_reminder','balance_low','booking_cancelled','general') NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `onboarding_answers`
--

CREATE TABLE `onboarding_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `goal` enum('weight_loss','muscle_gain','crossfit','yoga','pilates','rehabilitation') NOT NULL,
  `experience` enum('beginner','intermediate','advanced') NOT NULL,
  `frequency_per_week` tinyint(3) UNSIGNED NOT NULL,
  `trainer_style` enum('strict','friendly','motivational','calm') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `onboarding_answers`
--

INSERT INTO `onboarding_answers` (`id`, `user_id`, `goal`, `experience`, `frequency_per_week`, `trainer_style`, `created_at`, `updated_at`) VALUES
(1, 1, 'weight_loss', 'beginner', 3, 'motivational', '2026-11-23 11:04:39', '2026-11-23 11:04:39'),
(2, 2, 'muscle_gain', 'intermediate', 4, 'strict', '2026-11-23 11:04:41', '2026-11-23 11:04:41'),
(3, 3, 'yoga', 'beginner', 2, 'calm', '2026-11-23 11:04:41', '2026-11-23 11:04:41');

-- --------------------------------------------------------

--
-- Структура таблиці `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `trainer_id`, `booking_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, 'Amazing trainer! Oleksiy really pushed me and I can already see results after just a few sessions.', '2026-11-23 11:04:42', '2026-11-23 11:04:42'),
(2, 2, 1, 2, 4, 'Very professional and knowledgeable. The workout was intense but well structured.', '2026-11-23 11:04:42', '2026-11-23 11:04:42'),
(3, 3, 2, 3, 5, 'Nadiia is incredibly patient and skilled. My flexibility improved so much already!', '2026-11-23 11:04:42', '2026-11-23 11:04:42');

-- --------------------------------------------------------

--
-- Структура таблиці `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sessions_total` int(10) UNSIGNED NOT NULL,
  `sessions_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `starts_at` date NOT NULL,
  `expires_at` date NOT NULL,
  `status` enum('active','expired','cancelled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `plan_name`, `price`, `sessions_total`, `sessions_used`, `starts_at`, `expires_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Standard', 900.00, 16, 3, '2026-11-01', '2026-11-30', 'active', '2026-11-23 11:04:41', '2026-11-23 11:04:41'),
(2, 2, 'Basic', 500.00, 8, 8, '2026-10-01', '2026-10-31', 'expired', '2026-11-23 11:04:41', '2026-11-23 11:04:41');

-- --------------------------------------------------------

--
-- Структура таблиці `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL,
  `day_of_week` tinyint(4) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `max_participants` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `time_slots`
--

INSERT INTO `time_slots` (`id`, `trainer_id`, `day_of_week`, `start_time`, `end_time`, `max_participants`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '08:00:00', '09:00:00', 1, 1, '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(2, 1, 1, '10:00:00', '11:00:00', 1, 1, '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(3, 1, 3, '08:00:00', '09:00:00', 1, 1, '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(4, 1, 3, '17:00:00', '18:00:00', 1, 1, '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(5, 1, 5, '09:00:00', '10:00:00', 1, 1, '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(6, 2, 2, '07:00:00', '08:00:00', 1, 1, '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(7, 2, 2, '18:00:00', '19:00:00', 1, 1, '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(8, 2, 4, '07:00:00', '08:00:00', 1, 1, '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(9, 2, 6, '10:00:00', '11:00:00', 1, 1, '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(10, 3, 1, '06:00:00', '07:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(11, 3, 3, '06:00:00', '07:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(12, 3, 5, '06:00:00', '07:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(13, 3, 6, '09:00:00', '10:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(14, 4, 2, '09:00:00', '10:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(15, 4, 4, '09:00:00', '10:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(16, 4, 4, '15:00:00', '16:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(17, 5, 1, '07:00:00', '08:00:00', 1, 1, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(18, 5, 2, '07:00:00', '08:00:00', 1, 1, '2026-11-23 11:04:39', '2026-11-23 11:04:39'),
(19, 5, 5, '17:00:00', '18:00:00', 1, 1, '2026-11-23 11:04:39', '2026-11-23 11:04:39'),
(20, 5, 7, '10:00:00', '11:00:00', 1, 1, '2026-11-23 11:04:39', '2026-11-23 11:04:39');

-- --------------------------------------------------------

--
-- Структура таблиці `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) NOT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `max_clients` int(10) UNSIGNED NOT NULL DEFAULT 20,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `trainers`
--

INSERT INTO `trainers` (`id`, `gym_id`, `name`, `description`, `photo`, `specialization`, `rating`, `max_clients`, `created_at`, `updated_at`) VALUES
(1, 1, 'Oleksiy Marchenko', 'Certified strength & conditioning coach with 8 years of experience. Specializes in body transformation and powerlifting.', 'https://i.pravatar.cc/300?img=11', 'Strength & Conditioning', 4.50, 15, '2026-11-23 11:04:35', '2026-11-23 11:04:42'),
(2, 1, 'Nadiia Kovalenko', 'Yoga and Pilates instructor. Helps clients find balance, flexibility, and inner peace. 6 years of practice.', 'https://i.pravatar.cc/300?img=23', 'Yoga & Pilates', 5.00, 10, '2026-11-23 11:04:37', '2026-11-23 11:04:42'),
(3, 2, 'Dmytro Savchenko', 'CrossFit Level 2 trainer and competitive athlete. Pushes clients to their limits safely and effectively.', 'https://i.pravatar.cc/300?img=33', 'CrossFit', 4.70, 20, '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(4, 2, 'Iryna Bondarenko', 'Rehabilitation specialist and certified physiotherapist. Works with post-injury recovery and chronic pain management.', 'https://i.pravatar.cc/300?img=47', 'Rehabilitation', 4.90, 8, '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(5, 3, 'Vasyl Petrenko', 'Weight loss and nutrition coach. Combines cardio, HIIT, and diet planning for maximum fat burning results.', 'https://i.pravatar.cc/300?img=55', 'Weight Loss & Nutrition', 4.60, 12, '2026-11-23 11:04:38', '2026-11-23 11:04:38');

-- --------------------------------------------------------

--
-- Структура таблиці `trainer_skills`
--

CREATE TABLE `trainer_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL,
  `skill` enum('weight_loss','muscle_gain','crossfit','yoga','pilates','rehabilitation') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `trainer_skills`
--

INSERT INTO `trainer_skills` (`id`, `trainer_id`, `skill`, `created_at`, `updated_at`) VALUES
(1, 1, 'weight_loss', '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(2, 1, 'muscle_gain', '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(3, 1, 'crossfit', '2026-11-23 11:04:36', '2026-11-23 11:04:36'),
(4, 2, 'yoga', '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(5, 2, 'pilates', '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(6, 2, 'rehabilitation', '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(7, 3, 'crossfit', '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(8, 3, 'weight_loss', '2026-11-23 11:04:37', '2026-11-23 11:04:37'),
(9, 3, 'muscle_gain', '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(10, 4, 'rehabilitation', '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(11, 4, 'yoga', '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(12, 4, 'pilates', '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(13, 5, 'weight_loss', '2026-11-23 11:04:38', '2026-11-23 11:04:38'),
(14, 5, 'crossfit', '2026-11-23 11:04:38', '2026-11-23 11:04:38');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `onboarding_completed` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `balance`, `onboarding_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo User', 'demo@gym.com', '$2y$12$6DAriYgyu0xzkKP3PTy.qucdFZ3ezbEqC.rfpaZWnhMiDJa6mlBlG', 1000.00, 1, NULL, '2026-11-23 11:04:39', '2026-11-23 11:04:39'),
(2, 'Andrii Kovalchuk', 'andrii@gym.com', '$2y$12$vm0ouMWgzz01eP.d242rnOhpcFJzFv1Iqmjw/cmnT0TWkuJ0qbiUy', 500.00, 1, NULL, '2026-11-23 11:04:41', '2026-11-23 11:04:41'),
(3, 'Olha Sydorenko', 'olha@gym.com', '$2y$12$CsQCWRf7vJwYlnWONsi80.utgfmB/ztDZ6cDrifFn0LZXu44W5Wfa', 200.00, 1, NULL, '2026-11-23 11:04:41', '2026-11-23 11:04:41'),
(4, 'Mykola Hrytsenko', 'mykola@gym.com', '$2y$12$wZ88PAHjoNZy8euAz8XI2uQ5qUK7Th/fmWsEYQdMmKd7KcwSgVw0m', 0.00, 0, NULL, '2026-11-23 11:04:41', '2026-11-23 11:04:41');

-- --------------------------------------------------------

--
-- Структура таблиці `visit_history`
--

CREATE TABLE `visit_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED DEFAULT NULL,
  `checked_in_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `checked_out_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_trainer_id_foreign` (`trainer_id`),
  ADD KEY `bookings_time_slot_id_foreign` (`time_slot_id`);

--
-- Індекси таблиці `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Індекси таблиці `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Індекси таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Індекси таблиці `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Індекси таблиці `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Індекси таблиці `onboarding_answers`
--
ALTER TABLE `onboarding_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onboarding_answers_user_id_foreign` (`user_id`);

--
-- Індекси таблиці `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Індекси таблиці `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_user_id_booking_id_unique` (`user_id`,`booking_id`),
  ADD KEY `reviews_trainer_id_foreign` (`trainer_id`),
  ADD KEY `reviews_booking_id_foreign` (`booking_id`);

--
-- Індекси таблиці `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Індекси таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`);

--
-- Індекси таблиці `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_slots_trainer_id_foreign` (`trainer_id`);

--
-- Індекси таблиці `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainers_gym_id_foreign` (`gym_id`);

--
-- Індекси таблиці `trainer_skills`
--
ALTER TABLE `trainer_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trainer_skills_trainer_id_skill_unique` (`trainer_id`,`skill`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Індекси таблиці `visit_history`
--
ALTER TABLE `visit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_history_user_id_foreign` (`user_id`),
  ADD KEY `visit_history_gym_id_foreign` (`gym_id`),
  ADD KEY `visit_history_booking_id_foreign` (`booking_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `gyms`
--
ALTER TABLE `gyms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `onboarding_answers`
--
ALTER TABLE `onboarding_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблиці `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `trainer_skills`
--
ALTER TABLE `trainer_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `visit_history`
--
ALTER TABLE `visit_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_time_slot_id_foreign` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `onboarding_answers`
--
ALTER TABLE `onboarding_answers`
  ADD CONSTRAINT `onboarding_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `time_slots`
--
ALTER TABLE `time_slots`
  ADD CONSTRAINT `time_slots_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `trainers`
--
ALTER TABLE `trainers`
  ADD CONSTRAINT `trainers_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `trainer_skills`
--
ALTER TABLE `trainer_skills`
  ADD CONSTRAINT `trainer_skills_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `visit_history`
--
ALTER TABLE `visit_history`
  ADD CONSTRAINT `visit_history_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `visit_history_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visit_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
