-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2018 at 06:09 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `rama_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `dataupload`
--

CREATE TABLE `dataupload` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `seminar_id` int(10) UNSIGNED NOT NULL,
  `kode_kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dataupload`
--

INSERT INTO `dataupload` (`id`, `user_id`, `seminar_id`, `kode_kelas`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '05TPLE008', '2018-05-19 18:46:25', '2018-05-19 18:46:25'),
(2, 1, 2, '07TPLE008', '2018-05-20 05:47:19', '2018-05-20 05:47:19'),
(5, 2, 1, '06TPLE008', '2018-05-20 07:17:54', '2018-05-20 07:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_10_030058_create_peserta_table', 1),
(4, '2018_05_10_030259_create_seminar_table', 1),
(5, '2018_05_10_030839_create_pembayaran_table', 1),
(6, '2018_05_10_031426_create_dataupload_table', 1),
(7, '2018_05_10_032024_create_roles_table', 1),
(8, '2018_05_10_033337_add_foreignkey_rolesonusers_table', 1),
(9, '2018_05_10_035023_add_foreignkey_pembayaranseminar_table', 1),
(10, '2018_05_12_174047_add_foreignkey_dataupload_peserta', 1),
(11, '2018_05_12_174245_add_column_kehadiran_peserta', 1),
(12, '2018_05_12_192002_add_column_seminar_slug', 1),
(13, '2018_05_19_181600_add_field_kodekelas_on_dataupload', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_bukti_pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seminar_id` int(10) UNSIGNED NOT NULL,
  `dataupload_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `status_pembayaran`, `kode_pembayaran`, `kode_kelas`, `url_bukti_pembayaran`, `created_at`, `updated_at`, `seminar_id`, `dataupload_id`) VALUES
(2, '2', '809890890', '05TPLE008', 'storage/uploads/zijP6p59Ox0XlpmPacsC6rZ6RIHQh5SEYD1LDSCy.jpeg', '2018-05-19 21:39:41', '2018-05-19 21:39:41', 1, 1),
(3, '2', '809890890', '05TPLE008', 'storage/uploads/hZBkHyvaQD5xqLJ7phPqxhUrI28KuAeifbs10OhU.jpeg', '2018-05-20 05:58:29', '2018-05-20 05:58:29', 2, 2),
(4, '1', '809890890', '06TPLE008', 'storage/uploads/TRACuDQc7sTDLHsvhi4q0FYHwMOnzvVKgITQnTEU.png', '2018-10-12 17:53:26', '2018-10-12 17:53:26', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_peserta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim_peserta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas_peserta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp_peserta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kehadiran_peserta` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataupload_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id`, `nama_peserta`, `nim_peserta`, `kelas_peserta`, `telp_peserta`, `created_at`, `updated_at`, `kehadiran_peserta`, `dataupload_id`) VALUES
(1, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(2, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(3, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(4, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(5, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(6, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(7, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(8, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(9, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(10, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(11, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(12, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(13, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(14, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(15, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(16, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(17, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(18, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(19, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(20, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(21, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(22, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(23, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(24, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(25, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(26, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(27, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(28, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(29, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(30, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(31, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '1', 1),
(32, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-19 18:46:25', '2018-05-19 18:46:25', '0', 1),
(33, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(34, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(35, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(36, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(37, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(38, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(39, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(40, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(41, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(42, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(43, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(44, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(45, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(46, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(47, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(48, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(49, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(50, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(51, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(52, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(53, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(54, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(55, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(56, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(57, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(58, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(59, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(60, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(61, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(62, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(63, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '1', 2),
(64, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 05:47:19', '2018-05-20 05:47:19', '0', 2),
(129, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(130, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(131, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(132, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(133, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(134, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(135, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(136, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(137, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(138, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(139, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(140, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(141, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(142, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(143, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(144, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(145, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(146, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(147, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(148, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(149, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(150, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(151, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(152, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(153, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(154, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(155, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(156, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(157, 'Adjie Guntoro', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(158, 'Muhammad Rifai', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5),
(159, 'Adjie Guntoro 1', '17012345678', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '1', 5),
(160, 'Muhammad Rifai 2', '17012382832', '02TPLE01', '083813360377', '2018-05-20 07:17:54', '2018-05-20 07:17:54', '0', 5);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'kelas', '2018-05-19 18:44:27', '2018-05-19 18:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

CREATE TABLE `seminar` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seminar_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quota_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_seminar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar`
--

INSERT INTO `seminar` (`id`, `tema_seminar`, `seminar_slug`, `tanggal_seminar`, `deskripsi_seminar`, `quota_seminar`, `harga_seminar`, `lokasi_seminar`, `poster_seminar`, `created_at`, `updated_at`) VALUES
(1, 'Menjadi Programmer Profesional', 'seminar-pertama-slug', '05/05/2018', 'Lorem ipsum si dolor amet', '1000', '100000', 'Gedung Viktor', 'bukatalks.jpg', '2018-05-19 18:42:29', '2018-05-19 18:42:29'),
(2, 'Apple Developer Academy with JKT iOS ', 'seminar-kedua-slug', '05/05/2018', 'Lorem ipsum si dolor amet', '1000', '100000', 'Gedung Viktor', 'appleacademy.jpg', '2018-05-19 18:42:29', '2018-05-19 18:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, '05TPLE008', 'kelas@mail.com', '12345', NULL, '2018-05-19 18:44:52', '2018-05-19 18:44:52', 1),
(2, '06TPLE008', 'kelas@mail.com', '12345', NULL, '2018-05-19 18:44:52', '2018-05-19 18:44:52', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dataupload`
--
ALTER TABLE `dataupload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dataupload_user_id_foreign` (`user_id`),
  ADD KEY `dataupload_seminar_id_foreign` (`seminar_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayaran_seminar_id_foreign` (`seminar_id`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peserta_dataupload_id_foreign` (`dataupload_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seminar`
--
ALTER TABLE `seminar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `users_role_foreign` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dataupload`
--
ALTER TABLE `dataupload`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seminar`
--
ALTER TABLE `seminar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dataupload`
--
ALTER TABLE `dataupload`
  ADD CONSTRAINT `dataupload_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminar` (`id`),
  ADD CONSTRAINT `dataupload_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminar` (`id`);

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_dataupload_id_foreign` FOREIGN KEY (`dataupload_id`) REFERENCES `dataupload` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

