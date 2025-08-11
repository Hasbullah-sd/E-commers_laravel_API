-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2025 pada 03.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paradiso`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1752759961),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1752759961;', 1752759961),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1752838378),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1752838378;', 1752838378);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'GAME', 'game', '2025-07-17 02:26:14', '2025-07-17 02:26:14'),
(2, 'ARTIKEL', 'artikel', '2025-07-17 02:29:26', '2025-07-17 02:29:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `games`
--

INSERT INTO `games` (`id`, `name`, `slug`, `image`, `is_active`, `created_at`, `updated_at`, `category_id`, `type_id`) VALUES
(14, 'Mobile Legends: Bang Bang', 'mlbb', 'game-logos/mlbb.jpeg', 1, '2025-07-17 03:06:55', '2025-07-17 03:06:55', 1, 1),
(15, 'PUBG Mobile', 'pubgm', 'game-logos/pubgm.jpeg', 1, '2025-07-17 03:07:51', '2025-07-17 03:07:51', 1, 3),
(16, 'Free Fire', 'epep', 'game-logos/epep.webp', 1, '2025-07-17 03:09:07', '2025-07-17 03:09:07', 1, 1),
(17, 'Whiteout Survival', 'wos', 'game-logos/wos.jpg', 1, '2025-07-17 03:10:59', '2025-07-17 03:10:59', 1, 4),
(18, 'Genshin Impact', 'gi', 'game-logos/gi.jpeg', 1, '2025-07-17 03:12:17', '2025-07-17 03:12:17', 1, 2),
(19, 'Call of Duty: Mobile', 'codm', 'game-logos/codm.jpeg', 1, '2025-07-17 03:13:23', '2025-07-17 03:13:23', 1, 3),
(20, 'Honor of Kings', 'hok', 'game-logos/hok.jpeg', 1, '2025-07-17 03:14:32', '2025-07-17 03:14:32', 1, 3),
(21, 'Arena of Valor', 'aov', 'game-logos/aov.jpg', 1, '2025-07-17 03:16:58', '2025-07-17 03:16:58', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `heroes`
--

CREATE TABLE `heroes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `heroable_type` varchar(255) DEFAULT NULL,
  `heroable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `heroes`
--

INSERT INTO `heroes` (`id`, `category_id`, `heroable_type`, `heroable_id`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(2, 1, 'App\\Models\\Game', 18, NULL, 'hero-images/01K0C3HFGJ0M1DKPEHCMGPEYFQ.jpg', '2025-07-17 04:15:10', '2025-07-17 06:31:16'),
(5, 1, 'App\\Models\\Game', 15, NULL, 'hero-images/01K0C999D6EDNSM53TGKDV95V4.jpg', '2025-07-17 06:30:51', '2025-07-17 06:30:51'),
(6, 1, 'App\\Models\\Game', 14, NULL, 'hero-images/01K0CA3AN8W0GEYBE8NAW0CWJ3.jpg', '2025-07-17 06:45:04', '2025-07-17 06:45:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_09_043402_create_games_table', 1),
(5, '2025_07_09_044345_create_topup_packages_table', 1),
(6, '2025_07_09_064705_create_orders_table', 1),
(7, '2025_07_09_075359_create_payment_methods_table', 1),
(8, '2025_07_09_101047_create_admin_logs_table', 1),
(9, '2025_07_10_120428_create_heroes_table', 1),
(10, '2025_07_10_170655_create_heroes_table', 2),
(11, '2025_07_10_185901_add_role_to_users_table', 3),
(12, '2025_07_10_202731_create_chats_table', 4),
(13, '2025_07_10_202828_create_chat_participants_table', 4),
(14, '2025_07_10_202901_create_chat_messages_table', 4),
(15, '2025_07_12_030532_create_chat_threads_table', 5),
(16, '2025_07_12_030556_create_chat_participants_table', 5),
(17, '2025_07_12_030614_create_chat_messages_table', 5),
(18, '2025_07_12_192918_add_admin_request_status_to_users_table', 6),
(19, '2025_07_17_084743_create_categories_table', 7),
(20, '2025_07_17_084806_create_types_table', 7),
(21, '2025_07_17_084858_add_category_id_and_type_id_to_games_table', 8),
(22, '2025_07_17_110531_create_heroes_table', 9),
(23, '2025_07_17_170108_add_requested_profile_to_users_table', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `topup_package_id` bigint(20) UNSIGNED NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `server` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `proof_file` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `callback_id` varchar(255) DEFAULT NULL,
  `status` enum('pending','waiting_payment','processing','completed','failed') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `status_updated_at` timestamp NULL DEFAULT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `admin_action_by` bigint(20) UNSIGNED DEFAULT NULL,
  `auto_check_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_name`, `contact`, `game_id`, `topup_package_id`, `player_id`, `server`, `payment_method`, `proof_file`, `payment_id`, `callback_id`, `status`, `notes`, `status_updated_at`, `invoice_number`, `user_agent`, `ip_address`, `admin_action_by`, `auto_check_status`, `created_at`, `updated_at`) VALUES
(5, NULL, NULL, 'abc@gmail.com', 15, 15, '23234', '2342', 'BRI', NULL, NULL, NULL, 'completed', NULL, '2025-07-17 11:47:07', 'ORD-20250717-MMXE3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '127.0.0.1', NULL, 0, '2025-07-17 11:47:07', '2025-07-17 11:47:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('bank','e-wallet','qris','manual','gateway') NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `type`, `account_number`, `account_name`, `logo`, `is_active`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'BRI', 'bank', '646501036914534', 'Farhan Muslim', NULL, 1, NULL, '2025-07-10 10:40:24', '2025-07-10 10:40:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gdHAvUzsxaAkvDcbWGlXUp7bfYMKVZeVMTM3z32N', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo2OntzOjM6InVybCI7YTowOnt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlcnVzZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiR0RKalY1N2RDTlhjcENvbXlEU0pjNHlNczlKb2tFVFJtMXBEc3hMQyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJFpzS0w2TkN2MG1hYlV2VTVwWUZhemVjOHdWSVVEdVNvU0E1UVhuYm4xSjJBdi90aC81N0FxIjt9', 1752837815),
('j4Be81u9R0eJEqIqHxhfvoLtfCzID1nh8JmxRqbl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRTdFZHU2R0loTnFRWDc4dmtpQmNiR1JZcWhzckxsbHhBRzA3c2xNMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nb2QvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRORmVjSmJCYVFsM05vUlNYZ2lsWk5lRzF5SnVpS2YvZEF1RnRRT3JZd3BEOWttclFGWjY5MiI7fQ==', 1752838349),
('nW7eyHLdR0RF6wHkAtUzmw5IY8B6rMmO2g4bu2KE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT0pyc3B3VHlRZGZZMXB6MXFmQVlVNktlMTdIc3ZFTTdOTFh2aXRudyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nb2QvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjI1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZ29kIjt9fQ==', 1752836764);

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup_packages`
--

CREATE TABLE `topup_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `topup_packages`
--

INSERT INTO `topup_packages` (`id`, `game_id`, `name`, `price`, `duration`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(15, 15, '60 UC', 14400.00, '1-5 Menit', NULL, 1, '2025-07-17 07:49:53', '2025-07-17 07:49:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `types`
--

INSERT INTO `types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'MOBA', 'moba', '2025-07-17 02:28:49', '2025-07-17 02:28:49'),
(2, 'RPG', 'rpg', '2025-07-17 02:28:55', '2025-07-17 02:28:55'),
(3, 'FPS', 'fps', '2025-07-17 02:29:10', '2025-07-17 02:29:10'),
(4, 'Strategi', 'strategi', '2025-07-17 03:10:30', '2025-07-17 03:10:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `admin_request_status` enum('pending','approved','rejected') DEFAULT NULL,
  `admin_requested_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `requested_name` varchar(255) DEFAULT NULL,
  `requested_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `admin_request_status`, `admin_requested_at`, `remember_token`, `created_at`, `updated_at`, `requested_name`, `requested_email`) VALUES
(1, 'Yoohans', 'farhansalim052@gmail.com', NULL, '$2y$12$ZsKL6NCv0mabUvU5pYFazec8wVIUDuSoSA5QXnbn1J2Av/th/57Aq', 'admin', NULL, NULL, 'hchQzKk3FQXWdFenWqPfnDsqNVRR7u0ecUYmeQSmUUtEzOUNtQb4JYklJ9x4', '2025-07-10 05:17:14', '2025-07-10 12:08:08', NULL, NULL),
(2, 'Muslim', 'muslim@gmail.com', NULL, '$2y$12$bs0ibfqsXtRJTihB8sKMwuJFPC3IRNVxKKOitTbd5Idc1w9Ty5XM.', 'co-admin', NULL, NULL, 'SaeAIwyU2QOJMJKfBRcgCnvR8bBiQkJCEnmipnqM4VY6uRUb4fR0JE78uw9M', '2025-07-10 12:31:42', '2025-07-10 12:47:37', NULL, NULL),
(3, 'fm', 'fm@gmail.com', NULL, '$2y$12$aVdXgH.oeloLMpg/wE1dbermDbYWUwBcPQjWrXdOEoQOdvS5eyiq6', 'user', NULL, NULL, NULL, '2025-07-12 02:34:29', '2025-07-12 02:34:29', NULL, NULL),
(4, 'abc', 'abc@gmail.com', NULL, '$2y$12$NFecJbBaQl3NoRSXgilZNeG1yJuiKf/dAuFtQOrYwpD9kmrQFZ692', 'user', 'rejected', '2025-07-17 09:06:07', NULL, '2025-07-12 03:03:57', '2025-07-17 11:03:20', 'abc', 'abc@gmail.com'),
(5, 'satu', 'satu@gmail.com', NULL, '$2y$12$m.zIdOAkM8/Qirw2CNGxou4OMU6DqvmpYcuTogGIO7JpcfCUzJ9xW', 'user', NULL, '2025-07-17 09:28:53', NULL, '2025-07-17 09:28:27', '2025-07-17 11:01:20', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_logs_admin_id_foreign` (`admin_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `games_slug_unique` (`slug`),
  ADD KEY `games_category_id_foreign` (`category_id`),
  ADD KEY `games_type_id_foreign` (`type_id`);

--
-- Indeks untuk tabel `heroes`
--
ALTER TABLE `heroes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `heroes_category_id_foreign` (`category_id`),
  ADD KEY `heroes_heroable_type_heroable_id_index` (`heroable_type`,`heroable_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_invoice_number_unique` (`invoice_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_game_id_foreign` (`game_id`),
  ADD KEY `orders_topup_package_id_foreign` (`topup_package_id`),
  ADD KEY `orders_admin_action_by_foreign` (`admin_action_by`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `topup_packages`
--
ALTER TABLE `topup_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topup_packages_game_id_foreign` (`game_id`);

--
-- Indeks untuk tabel `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `heroes`
--
ALTER TABLE `heroes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `topup_packages`
--
ALTER TABLE `topup_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `admin_logs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `games_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `heroes`
--
ALTER TABLE `heroes`
  ADD CONSTRAINT `heroes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_admin_action_by_foreign` FOREIGN KEY (`admin_action_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_topup_package_id_foreign` FOREIGN KEY (`topup_package_id`) REFERENCES `topup_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `topup_packages`
--
ALTER TABLE `topup_packages`
  ADD CONSTRAINT `topup_packages_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
