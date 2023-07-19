-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2023 pada 10.00
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel8ecommercedb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `product_attribute_id`, `value`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 1, 'Merah', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10'),
(8, 1, 'Kuning', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10'),
(9, 1, 'Hitam', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10'),
(10, 1, 'Biru', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10'),
(11, 2, '42', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10'),
(12, 2, '30', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10'),
(13, 2, '50', 46, '2022-12-02 20:24:10', '2022-12-02 20:24:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'suscipit porro', 'suscipit-porro', '2022-10-21 21:22:31', '2022-10-21 21:22:31'),
(2, 'cumque harum', 'cumque-harum', '2022-10-21 21:22:31', '2022-10-21 21:22:31'),
(3, 'voluptas porro', 'voluptas-porro', '2022-10-21 21:22:31', '2022-10-21 21:22:31'),
(4, 'aut adipisci', 'aut-adipisci', '2022-10-21 21:22:31', '2022-10-21 21:22:31'),
(5, 'omnis quia', 'omnis-quia', '2022-10-21 21:22:31', '2022-10-21 21:22:31'),
(6, 'aspernatur quia', 'aspernatur-quia', '2022-10-21 21:22:31', '2022-10-21 21:22:31'),
(7, 'explicabo qui', 'explicabo-qui', '2022-10-21 21:22:56', '2022-10-21 21:22:56'),
(8, 'incidunt qui', 'incidunt-qui', '2022-10-21 21:22:56', '2022-10-21 21:22:56'),
(9, 'nobis eum', 'nobis-eum', '2022-10-21 21:22:56', '2022-10-21 21:22:56'),
(10, 'dignissimos unde', 'dignissimos-unde', '2022-10-21 21:22:56', '2022-10-21 21:22:56'),
(11, 'vel voluptatem', 'vel-voluptatem', '2022-10-21 21:22:56', '2022-10-21 21:22:56'),
(12, 'sed totam', 'sed-totam', '2022-10-21 21:22:56', '2022-10-21 21:22:56'),
(13, 'amet perferendis', 'amet-perferendis', '2022-10-21 21:27:02', '2022-10-21 21:27:02'),
(14, 'distinctio rerum', 'distinctio-rerum', '2022-10-21 21:27:02', '2022-10-21 21:27:02'),
(15, 'cum incidunt', 'cum-incidunt', '2022-10-21 21:27:03', '2022-10-21 21:27:03'),
(16, 'quis id', 'quis-id', '2022-10-21 21:27:03', '2022-10-21 21:27:03'),
(17, 'culpa blanditiis', 'culpa-blanditiis', '2022-10-21 21:27:03', '2022-10-21 21:27:03'),
(18, 'voluptatem et', 'voluptatem-et', '2022-10-21 21:27:03', '2022-10-21 21:27:03'),
(19, 'Elektronik', 'elektronik', '2022-11-15 03:10:34', '2022-11-15 03:10:34'),
(20, 'Contoh', 'contoh', '2023-06-19 07:38:29', '2023-06-19 07:38:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'ubaed unpam', 'ubaedasam@gmail.com', '085250708308', 'test pesan dari ubaed', '2022-11-12 21:35:59', '2022-11-12 21:35:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT '2022-11-04'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(1, 'OFF1000', 'fixed', '100.00', '1000.00', '2022-11-03 04:39:03', '2022-11-04 02:45:02', '2022-11-07'),
(2, 'OFF20P', 'percent', '50.00', '1200.00', '2022-11-04 01:20:40', '2022-11-04 01:20:40', '2022-11-04'),
(3, 'OFF30P', 'percent', '30.00', '1300.00', '2022-11-04 02:27:59', '2022-11-04 02:34:12', '2022-11-06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,2,3,5,7', 8, '2022-10-30 17:00:00', '2022-10-31 02:46:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Hot Product', 'Start From', '1000', 'http://127.0.0.1:8000/shop', '1670127043_jpg', '1', '2022-12-03 21:10:43', '2022-12-03 21:10:43'),
(4, 'Product Diskon', 'Barang murah', '3000', 'http://127.0.0.1:8000/shop', '1670127184_jpg', '1', '2022-12-03 21:13:04', '2022-12-03 21:13:04'),
(5, 'Barang Branded', 'Murah, Berkualitas', '5000', 'http://127.0.0.1:8000/shop', '1670127362_jpg', '1', '2022-12-03 21:16:02', '2022-12-03 21:16:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_10_21_115410_create_sessions_table', 1),
(7, '2022_10_22_034902_create_categories_table', 2),
(8, '2022_10_22_035100_create_products_table', 2),
(9, '2022_10_23_030223_create_shoppingcart_table', 3),
(10, '2022_10_25_080845_create_home_sliders_table', 3),
(11, '2022_10_31_080537_create_home_categories_table', 4),
(12, '2022_10_31_133019_create_sales_table', 5),
(13, '2022_11_03_103741_create_coupons_table', 6),
(14, '2022_11_04_085241_add_expiry_date_to_coupons_table', 7),
(15, '2022_11_04_090131_add_expiry_date_to_coupons_table', 8),
(16, '2022_11_04_094629_create_orders_table', 9),
(17, '2022_11_04_094657_create_order_items_table', 9),
(18, '2022_11_04_094725_create_shippings_table', 9),
(19, '2022_11_04_094811_create_transactions_table', 9),
(20, '2022_11_10_084243_add_delivered_canceled_date_to_order_table', 10),
(21, '2022_11_10_091938_create_reviews_table', 11),
(22, '2022_11_10_093304_add_rstatus_to_order_items_table', 12),
(23, '2022_11_10_104549_create_reviews_table', 13),
(24, '2022_11_13_034759_create_contacts_table', 13),
(25, '2022_11_13_044628_create_settings_table', 14),
(26, '2022_11_14_091106_create_shoppingcart_table', 15),
(27, '2022_11_15_095204_create_subcategories_table', 16),
(28, '2022_12_02_013210_add_subcategory_id_to_products_table', 17),
(29, '2022_12_02_034156_create_profiles_table', 18),
(30, '2022_12_03_005313_create_product_attributes_table', 19),
(31, '2022_12_03_014608_create_attribute_values_table', 20),
(32, '2022_12_03_051555_add_options_to_order_items_table', 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(1, 1, '489.00', '0.00', '102.69', '591.69', 'ubaed', 'SAM', '1234567890', 'ubaedsam_UniversitasPamulang@gmail.com', 'LINE1', 'line 2', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 1, '2022-11-04 21:13:38', '2022-11-04 21:13:38', NULL, NULL),
(2, 1, '489.00', '0.00', '102.69', '591.69', 'ubaed', 'SAM', '1234567890', 'ubaedsam_UniversitasPamulang@gmail.com', 'LINE1', 'line 2', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 1, '2022-11-04 21:14:04', '2022-11-04 21:14:04', NULL, NULL),
(3, 1, '489.00', '0.00', '102.69', '591.69', 'ubaed', 'SAM', '1234567890', 'ubaedasam@gmail.com', 'LINE1', 'LINE1', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 1, '2022-11-04 21:22:10', '2022-11-04 21:22:10', NULL, NULL),
(4, 1, '489.00', '0.00', '102.69', '591.69', 'ubaed', 'SAM', '1234567890', 'ubaedsam.universitaspamulang@gmail.com', 'LINE1', 'LINE2', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 1, '2022-11-04 21:30:29', '2022-11-04 21:30:29', NULL, NULL),
(5, 1, '238.00', '0.00', '49.98', '287.98', 'ubaed', 'SAM', '085250708302', 'ubaedsam.universitaspamulang@gmail.com', 'LINE1 card', 'LINE2 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-09 19:56:35', '2022-11-09 19:56:35', NULL, NULL),
(6, 1, '238.00', '0.00', '49.98', '287.98', 'ubaed', 'SAM', '085250708309', 'ubaedasam@gmail.com', 'LINE1 card', 'LINE2 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-09 20:02:22', '2022-11-09 20:02:22', NULL, NULL),
(7, 1, '238.00', '0.00', '49.98', '287.98', 'ubaed', 'SAM', '085250708301', 'ubaedsam.universitaspamulang@gmail.com', 'LINE1 card', 'LINE2 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'delivered', 0, '2022-11-09 20:05:20', '2022-11-10 02:08:11', '2022-11-10', NULL),
(8, 2, '452.00', '0.00', '94.92', '546.92', 'setia', 'hardja', '085250708302', 'user@gmail.com', 'LINE1 card', 'LINE2 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'delivered', 0, '2022-11-10 01:37:59', '2022-11-10 02:52:50', '2022-11-10', '2022-11-10'),
(9, 1, '1257.00', '0.00', '263.97', '1520.97', 'ubaed', 'SAM', '085250708308', 'ubaedasam@gmail.com', 'LINE1 card', 'LINE2 card baru', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'delivered', 0, '2022-11-13 21:18:13', '2022-11-13 21:18:56', '2022-11-14', NULL),
(10, 1, '185.00', '0.00', '38.85', '223.85', 'ubaed baru', 'SAM', '085250708308', 'ubaedasam@gmail.com', 'LINE1 baru', 'LINE2 baru', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-14 01:33:04', '2022-11-14 01:33:04', NULL, NULL),
(11, 1, '436.00', '0.00', '91.56', '527.56', 'ubaed baru', 'SAM', '085250708308', 'ubaedasam@gmail.com', 'LINE1 baru', 'LINE2 baru', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-14 01:37:52', '2022-11-14 01:37:52', NULL, NULL),
(12, 1, '324.00', '0.00', '68.04', '392.04', 'ubaed baru', 'SAM', '085250708308', 'ubaedasam@gmail.com', 'LINE1 card', 'LINE1 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-14 01:55:12', '2022-11-14 01:55:12', NULL, NULL),
(13, 1, '324.00', '0.00', '68.04', '392.04', 'ubaed baru', 'SAM', '085250708308', 'ubaedasam@gmail.com', 'LINE1 card', 'LINE1 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-14 01:55:21', '2022-11-14 01:55:21', NULL, NULL),
(14, 1, '324.00', '0.00', '68.04', '392.04', 'ubaed baru', 'SAM', '085250708308', 'ubaedasam@gmail.com', 'LINE1 baru', 'LINE1 card', 'kabupaten tangerang', 'banten', 'indonesia', '15730', 'ordered', 0, '2022-11-14 01:57:00', '2022-11-14 01:57:00', NULL, NULL),
(15, 1, '452.00', '0.00', '94.92', '546.92', 'jaka', 'sam', '085250708308', 'ubaedasam@gmail.com', 'LINE1', 'ihhhj', 'kabupaten tangerang', 'banten', 'indonesia', '15639', 'ordered', 0, '2022-11-14 02:34:07', '2022-11-14 02:34:07', NULL, NULL),
(16, 4, '238.00', '0.00', '49.98', '287.98', 'jaka', 'sam', '085250708302', 'jaka@gmail.com', 'LINE1 card', 'LINE1 card', 'kabupaten tangerang', 'banten', 'indonesia', '1716161', 'delivered', 0, '2022-11-17 21:37:39', '2022-11-17 21:41:34', '2022-11-18', NULL),
(17, 4, '48.00', '0.00', '10.08', '58.08', 'jaka', 'sam', '085250708308', 'jaka@gmail.com', 'LINE1 card', 'LINE1 card', 'kabupaten tangerang', 'banten', 'indonesia', '87298', 'canceled', 0, '2022-11-17 21:52:35', '2022-12-01 06:10:04', NULL, '2022-12-01'),
(18, 4, '600.00', '0.00', '126.00', '726.00', 'untuk jaka', 'SAM', '085250708302', 'jaka@gmail.com', 'LINE1 baru jaka', 'LINE1 baru jaka 2', 'kabupaten tangerang', 'banten', 'indonesia', '2242', 'ordered', 0, '2022-12-02 22:30:39', '2022-12-02 22:30:39', NULL, NULL),
(19, 4, '200.00', '0.00', '42.00', '242.00', 'untuk jaka baru', 'sam', '085250708302', 'jaka@gmail.com', 'LINE1 baru jaka', 'LINE 2 baru jaka', 'kabupaten tangerang', 'banten', 'indonesia', '776261', 'ordered', 0, '2022-12-02 22:40:58', '2022-12-02 22:40:58', NULL, NULL),
(20, 1, '48.00', '0.00', '10.08', '58.08', 'Ubaed', 'Contoh', '085250708308', 'ubaedasam@gmail.com', 'LINE1 baru ubaed', 'LINE 2 baru ubaed', 'kabupaten tangerang', 'banten', 'indonesia', '156622', 'ordered', 0, '2022-12-03 21:30:00', '2022-12-03 21:30:00', NULL, NULL),
(21, 1, '200.00', '0.00', '42.00', '242.00', 'ubaed baru', 'Contoh', '085250708308', 'ubaedasam@gmail.com', 'LINE1 baru ubaed ya', 'LINE2 baru ubaed ya', 'kabupaten tangerang', 'banten', 'indonesia', '887122', 'ordered', 0, '2022-12-03 21:33:20', '2022-12-03 21:33:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`, `options`) VALUES
(1, 2, 3, '238.00', 1, '2022-11-04 21:22:10', '2022-11-04 21:22:10', 0, NULL),
(2, 6, 3, '251.00', 1, '2022-11-04 21:22:10', '2022-11-04 21:22:10', 0, NULL),
(3, 2, 4, '238.00', 1, '2022-11-04 21:30:29', '2022-11-04 21:30:29', 0, NULL),
(4, 6, 4, '251.00', 1, '2022-11-04 21:30:29', '2022-11-04 21:30:29', 0, NULL),
(5, 2, 5, '238.00', 1, '2022-11-09 19:56:35', '2022-11-09 19:56:35', 0, NULL),
(6, 2, 6, '238.00', 1, '2022-11-09 20:02:22', '2022-11-09 20:02:22', 0, NULL),
(7, 2, 7, '238.00', 1, '2022-11-09 20:05:20', '2022-11-09 20:05:20', 0, NULL),
(8, 4, 8, '452.00', 1, '2022-11-10 01:37:59', '2022-11-10 03:49:35', 1, NULL),
(9, 7, 9, '419.00', 3, '2022-11-13 21:18:14', '2022-11-13 21:18:14', 0, NULL),
(10, 8, 10, '185.00', 1, '2022-11-14 01:33:05', '2022-11-14 01:33:05', 0, NULL),
(11, 5, 11, '436.00', 1, '2022-11-14 01:37:52', '2022-11-14 01:37:52', 0, NULL),
(12, 12, 12, '324.00', 1, '2022-11-14 01:55:12', '2022-11-14 01:55:12', 0, NULL),
(13, 12, 13, '324.00', 1, '2022-11-14 01:55:21', '2022-11-14 01:55:21', 0, NULL),
(14, 12, 14, '324.00', 1, '2022-11-14 01:57:00', '2022-11-14 01:57:00', 0, NULL),
(15, 4, 15, '452.00', 1, '2022-11-14 02:34:08', '2022-11-14 02:34:08', 0, NULL),
(16, 2, 16, '238.00', 1, '2022-11-17 21:37:39', '2022-12-02 03:39:56', 1, NULL),
(17, 10, 17, '48.00', 1, '2022-11-17 21:52:35', '2022-11-17 21:52:35', 0, NULL),
(18, 46, 18, '200.00', 3, '2022-12-02 22:30:39', '2022-12-02 22:30:39', 0, 'N;'),
(19, 46, 19, '200.00', 1, '2022-12-02 22:40:58', '2022-12-02 22:40:58', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:2:{s:5:\"Warna\";s:4:\"Biru\";s:6:\"Ukuran\";s:2:\"50\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(20, 10, 20, '48.00', 1, '2022-12-03 21:30:01', '2022-12-03 21:30:01', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(21, 46, 21, '200.00', 1, '2022-12-03 21:33:20', '2022-12-03 21:33:20', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:2:{s:5:\"Warna\";s:5:\"Hitam\";s:6:\"Ukuran\";s:2:\"50\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` bigint(20) UNSIGNED NOT NULL DEFAULT '10',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(1, 'soluta accusamus quibusdam explicabo', 'soluta-accusamus-quibusdam-explicabo', 'Necessitatibus veniam sint id et esse ad voluptates. Minima mollitia inventore ratione in eum assumenda.', 'Eius qui itaque molestiae qui animi animi et. Facere ipsa veniam id consequuntur dolor dolore velit. Enim et quaerat optio odio dicta ex quo. Quaerat possimus asperiores eos. Aut nam pariatur occaecati numquam ad vel aut. Minus provident officia deleniti est modi architecto. Accusamus eius magnam voluptatem corrupti laudantium. Nostrum quibusdam enim et expedita delectus dicta. Qui sapiente sed quidem voluptate aliquid. Eum rem aspernatur ut voluptas occaecati quaerat non maiores.', '447.00', '400.00', 'DIGI260', 'instock', 0, 116, 'digital_7.jpg', ',16684118630.jpg,16684118631.jpg', 16, '2022-10-21 21:22:32', '2022-12-01 20:11:02', 4),
(2, 'qui consequuntur fugit officia', 'qui-consequuntur-fugit-officia', 'Dolor et veritatis veniam quibusdam aperiam. Suscipit iure velit omnis nisi neque. Qui at sint non aut modi nesciunt.', 'Voluptas corporis earum provident libero quidem. Molestiae consequatur eveniet aut iste. Quia odio mollitia nulla dolor voluptatem sequi. Quibusdam quia et explicabo minus. Ducimus pariatur assumenda eum. Qui saepe neque nemo quis voluptatem. In ea molestias non. Quas animi tenetur sunt at aperiam deserunt. Provident autem placeat qui tempora blanditiis beatae inventore quia. Sunt atque fuga dolores doloribus nesciunt non officiis amet.', '238.00', '200.00', 'DIGI394', 'instock', 0, 180, 'digital_15.jpg', NULL, 2, '2022-10-21 21:22:32', '2022-10-31 06:06:14', 5),
(3, 'suscipit id deleniti enim', 'suscipit-id-deleniti-enim', 'Illum et molestiae eveniet inventore vero nihil eum. Inventore dolorem enim adipisci sed unde dolorem rerum sed. Totam et cumque vero molestias et ducimus.', 'Sit consequatur aut quia est expedita possimus placeat. Laudantium quidem eius debitis ut et temporibus tenetur. Minima maiores dignissimos omnis similique. Quae hic officiis dolores culpa neque. Cumque est similique aut sit suscipit rem enim sunt. A itaque maiores voluptatibus. Aut aliquid vel molestiae sed sunt. Necessitatibus sit possimus porro laudantium repellat velit excepturi id.', '99.00', '73.00', 'DIGI136', 'instock', 0, 152, 'digital_18.jpg', NULL, 4, '2022-10-21 21:22:32', '2022-10-31 06:07:13', NULL),
(4, 'in dolores aliquam reprehenderit', 'in-dolores-aliquam-reprehenderit', 'Repellendus et dolorum tempore eveniet. Ea dicta natus fugit ad rerum aut. Illum corrupti facilis quo recusandae rerum soluta doloribus. Labore quod veniam omnis soluta officiis id velit ut.', 'Aut aut debitis aut perferendis. Sed iusto cum debitis molestias molestias iste. Soluta eveniet et eligendi nisi provident aut animi nobis. Ut pariatur provident neque adipisci. Qui consequatur in consectetur nobis et. Temporibus qui voluptatem occaecati voluptatem enim architecto dolorem. Et odit dolorum non. Molestiae voluptatem nisi sapiente quod. Et aliquam sunt dolorum mollitia neque ullam. Laborum natus quibusdam iusto. Est unde est quia dolorem veritatis ea atque.', '452.00', '375.00', 'DIGI285', 'instock', 0, 199, 'digital_18.jpg', NULL, 1, '2022-10-21 21:22:57', '2022-10-31 06:08:22', NULL),
(5, 'error quia placeat quia', 'error-quia-placeat-quia', 'Deleniti enim sed impedit iure. Quia architecto dolorum sequi natus recusandae nobis. Sed dignissimos in possimus aut dicta voluptas consequatur.', 'Voluptas voluptas enim ipsa enim impedit totam ea. Ut itaque ut tenetur debitis. Omnis nisi explicabo porro. Ut quam doloribus aspernatur necessitatibus iusto sed. Placeat nihil facere voluptates laborum accusantium fugiat. Vitae explicabo porro ut quod quis. Voluptatem tempore sint numquam voluptate nobis aperiam aut. Officiis ea iure est. Recusandae minima repellendus sunt at.', '436.00', '410.00', 'DIGI352', 'instock', 0, 134, 'digital_4.jpg', NULL, 5, '2022-10-21 21:22:57', '2022-10-31 06:09:08', NULL),
(6, 'nobis fuga voluptas cupiditate', 'nobis-fuga-voluptas-cupiditate', 'Non iusto dicta ea asperiores officiis quod numquam. Tenetur ut nulla aut hic saepe aut eius. Aut reprehenderit iusto et quae.', 'Voluptatem non facere nihil. Dolor quas fugit veritatis eius. Expedita adipisci deleniti quos velit dolorem fugiat. Qui debitis numquam illum cupiditate fuga sunt. Veniam quisquam commodi quod atque. Eos soluta velit facere quaerat aut. Qui non nulla quisquam saepe. Illo corporis eos voluptas voluptatem suscipit exercitationem doloribus. Neque excepturi labore nulla. Maxime officiis optio occaecati nostrum minus facilis. Aperiam rerum eligendi et accusantium omnis sint id.', '251.00', '220.00', 'DIGI110', 'instock', 0, 111, 'digital_6.jpg', NULL, 3, '2022-10-21 21:22:57', '2022-10-31 06:10:42', NULL),
(7, 'eaque et eius nemo', 'eaque-et-eius-nemo', 'Id distinctio consequatur tenetur voluptas minus atque. Nam laudantium et est. Unde tenetur consequatur totam facilis facere.', 'Enim sed est eaque non quas ut. Aut laboriosam perspiciatis eum. Facere voluptatum ad vel. Dolor maxime voluptates quia repellat. Doloribus inventore architecto unde voluptas voluptas est debitis et. Amet at itaque aut sint blanditiis. Sint distinctio nam qui ratione eveniet alias excepturi. Dolor consequatur at minima nulla aut et accusantium. Eum id qui dolor id et minima laborum consequatur. Dolorum ut recusandae non in. Praesentium cum non consequatur nihil.', '419.00', '300.00', 'DIGI192', 'instock', 0, 176, 'digital_17.jpg', NULL, 2, '2022-10-21 21:22:57', '2022-10-31 06:11:31', NULL),
(8, 'quia sed delectus voluptas', 'quia-sed-delectus-voluptas', 'Repellendus natus numquam eum a tempora illo eius. Amet consequatur a id velit velit. Itaque incidunt id explicabo alias commodi explicabo.', 'Veniam minima magni nulla ullam suscipit et et non. Saepe cupiditate pariatur voluptatem ipsum. Est maiores id nostrum sed. Aut nesciunt itaque quae aut ut eum. Aut esse sapiente ut commodi qui. Sapiente suscipit quod quasi et et veritatis. Cum quo corporis deleniti. Voluptate repudiandae quae autem maxime pariatur. Aut voluptatem molestias quis ipsa aut et sed. In voluptates quis error eum.', '185.00', '150.00', 'DIGI361', 'instock', 0, 106, 'digital_12.jpg', NULL, 2, '2022-10-21 21:22:57', '2022-10-31 06:12:12', NULL),
(10, 'in voluptatem ut voluptas', 'in-voluptatem-ut-voluptas', 'Commodi est qui molestiae id. Voluptas et modi non voluptas tempora voluptatem ratione. In officiis et et magni minus consectetur. Voluptate maiores dignissimos et ad saepe.', 'Aliquid et accusantium quod porro sit. Veritatis enim sequi consequatur molestias. Incidunt voluptatem aut nihil dolor tempora hic quis. Enim nam qui quos repellendus velit. Vel ut consequatur et unde. Suscipit sint occaecati possimus consequatur nesciunt. Velit in et architecto enim autem aut est corrupti. Aut qui architecto consequatur velit. Est hic officiis est est sint laborum.', '48.00', NULL, 'DIGI472', 'instock', 0, 196, 'digital_20.jpg', NULL, 4, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(11, 'laudantium eum ex velit', 'laudantium-eum-ex-velit', 'Id ut porro eos velit inventore. Enim ex ad ut aut animi. Quae deserunt laborum nam natus aut nemo ut. Inventore labore accusamus odit dolorem.', 'Quo voluptatem et autem velit. Ut aut modi quis qui vitae qui. Veritatis fuga quia consectetur modi dolorem. Vel asperiores id neque voluptatibus consequatur ut repudiandae. Consequatur aperiam est quia ducimus ut eligendi fugit. Facilis autem atque quibusdam cum voluptatem perspiciatis et perspiciatis. Occaecati eius aut perferendis quaerat. Nobis quia autem aut rem.', '490.00', NULL, 'DIGI180', 'instock', 0, 120, 'digital_8.jpg', NULL, 1, '2022-10-21 21:22:57', '2022-10-23 21:06:17', NULL),
(12, 'cum ut sint culpa', 'cum-ut-sint-culpa', 'Consequuntur totam quos minus aut sint aut. Aut dolorum consequatur voluptatibus possimus maiores commodi. Optio magnam ratione animi omnis. Molestiae a ut et error ut nobis sit.', 'Assumenda facilis aut doloremque rerum qui eius aliquam. Hic magnam tempore accusamus sed architecto est repudiandae. Delectus ad quo hic maiores consequatur molestiae voluptas voluptas. Possimus accusamus quam id et et vero. Voluptatem dolores eaque occaecati eveniet sequi vitae. Maiores nostrum quibusdam tempora minima nam. Numquam quisquam doloribus cupiditate voluptatem quas. Consectetur porro ipsum sint culpa aut iusto sequi.', '324.00', NULL, 'DIGI368', 'instock', 0, 192, 'digital_10.jpg', NULL, 2, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(13, 'quia perspiciatis illum eaque', 'quia-perspiciatis-illum-eaque', 'Aut eos non in fuga voluptas. Facilis quisquam quia voluptates aliquam. Ratione tempore est vel.', 'Facilis et qui perferendis maxime voluptatem inventore. Accusamus magni a aut voluptatem sit. Quia est neque placeat nemo quia. Enim ut maxime et id non ut odio. Iste quo veritatis dolorem harum. Autem tempora consequuntur placeat velit nam et aut. Repudiandae id iusto sint excepturi ut.', '262.00', NULL, 'DIGI371', 'instock', 0, 164, 'digital_5.jpg', NULL, 5, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(14, 'et aspernatur eaque ratione', 'et-aspernatur-eaque-ratione', 'Eaque distinctio error eum. Repellat reiciendis voluptatem facilis error.', 'Beatae veniam ab ut eius. Ut quo repellendus dolor eos sit quisquam est in. Minus porro ab optio eveniet ducimus molestiae. Excepturi expedita blanditiis eum molestiae. Voluptatem ut eaque repudiandae ea aut non. Laudantium enim vitae quisquam cupiditate unde quia et autem. Rerum id consequatur alias pariatur. Et ipsa fugit eius quos maiores quia. Eos voluptatem earum doloribus recusandae a earum. Doloremque dolore nisi deleniti aut ipsum laborum. Officiis praesentium aut voluptatem beatae.', '369.00', NULL, 'DIGI397', 'instock', 0, 141, 'digital_16.jpg', NULL, 5, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(15, 'officia explicabo qui eius', 'officia-explicabo-qui-eius', 'Natus iste voluptas pariatur ut necessitatibus molestiae. Blanditiis illo voluptas nihil dolor. Laudantium nihil voluptatem dolores voluptas qui accusantium odio.', 'Eveniet corrupti consequatur consequatur autem. Vel est eius velit et suscipit quod corporis. Natus fugiat quo magnam iste voluptate at harum. Rerum dicta sequi omnis autem natus voluptatum veritatis. Eius rerum non fugiat consequatur consectetur. Temporibus explicabo natus voluptatem dolorem. Sit quia ea cumque atque maxime. Dolor rerum laborum aspernatur distinctio. Omnis quisquam quae iure perspiciatis mollitia dolorum fugit.', '149.00', NULL, 'DIGI191', 'instock', 0, 111, 'digital_21.jpg', NULL, 4, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(16, 'quia nostrum doloremque sunt', 'quia-nostrum-doloremque-sunt', 'Culpa repudiandae quia quis quisquam. Expedita facere necessitatibus enim aut eos qui quidem hic. Voluptatibus et ut perspiciatis nostrum. Qui consequatur et provident.', 'Quia sint illum sunt nobis dicta neque. Sunt similique et vel incidunt. Repellendus aut quia quasi quo autem et fugiat. Quibusdam accusantium similique unde dolor et ipsam. Iusto quod aspernatur quasi sint. Officia molestias qui beatae minima. Odio maxime libero tenetur laborum voluptas saepe animi officiis. Non fugit et enim molestiae deserunt.', '315.00', NULL, 'DIGI355', 'instock', 0, 135, 'digital_15.jpg', NULL, 5, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(17, 'qui vel animi eum', 'qui-vel-animi-eum', 'Aut reprehenderit consequatur architecto. Autem aliquam vero eum sapiente aut. Voluptatibus aut est illo temporibus ab porro error. Facere vel quia quis quas est dolores quis.', 'Rem architecto dolores libero facere ratione ut. Itaque qui dignissimos accusamus accusamus. A sed sed excepturi unde magni sit nisi culpa. Provident neque quis eum quo aut et rerum. Excepturi molestiae quis ut quo ut. Tempore ut architecto doloremque nulla aliquid.', '279.00', NULL, 'DIGI249', 'instock', 0, 142, 'digital_14.jpg', NULL, 1, '2022-10-21 21:22:57', '2022-10-21 21:22:57', NULL),
(18, 'temporibus delectus quas mollitia', 'temporibus-delectus-quas-mollitia', 'Rerum non rerum fugit officia et quo. Nesciunt maiores aut ut. Velit quo numquam recusandae libero reprehenderit quidem cupiditate. Expedita fugiat corporis voluptatem expedita.', 'Quam porro incidunt voluptatem nobis est. Ullam qui officia repudiandae explicabo et et. Ea iste ut enim aut culpa. Voluptas ut accusantium nemo aliquam similique neque omnis. Repellendus explicabo et non vel expedita aut. Est similique qui non aut. Nihil voluptatum culpa amet tenetur assumenda animi. Unde laudantium in molestiae eaque.', '256.00', NULL, 'DIGI103', 'instock', 0, 128, 'digital_9.jpg', NULL, 3, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(19, 'est voluptas aut aliquam', 'est-voluptas-aut-aliquam', 'Nesciunt ratione omnis et. Aliquam iusto non cupiditate modi aspernatur qui quae molestiae. Et in est est consequatur.', 'Et soluta qui ullam cumque illum. Rem aliquid velit qui magni cupiditate quia rerum sapiente. Quas quia praesentium sequi consequatur. Non ullam officiis cum iure ad ipsa. Nam exercitationem repellat voluptas autem id minus. Aut voluptates eius laudantium qui suscipit. Iure dolore libero mollitia hic qui aspernatur molestias. Asperiores iste sint accusantium iure. Nostrum id ducimus tempore. Eaque nihil nam doloremque sint non est aliquid. Excepturi voluptatem et accusantium facilis fuga.', '17.00', NULL, 'DIGI495', 'instock', 0, 115, 'digital_7.jpg', NULL, 2, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(20, 'perferendis labore id sint', 'perferendis-labore-id-sint', 'Saepe incidunt dolore sed neque. Natus consequuntur sit non rerum sed corrupti aliquid dolores. Quas vel non saepe deserunt eligendi.', 'In omnis dolorum ducimus dolore at officiis. Cumque aut tenetur quo dolores delectus repudiandae. Suscipit facere laboriosam adipisci nihil id ut ipsum. Odit explicabo voluptate quia velit error ut et. Reiciendis earum atque beatae aut. Dignissimos totam nisi possimus. Dolores debitis asperiores reprehenderit in quos provident aut. Porro ad placeat consequatur voluptatum. Delectus facere aliquam vel qui.', '207.00', NULL, 'DIGI370', 'instock', 0, 150, 'digital_15.jpg', NULL, 4, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(21, 'distinctio aut sapiente animi', 'distinctio-aut-sapiente-animi', 'Ex voluptatem aut ab at dignissimos adipisci. Qui est dolorem assumenda omnis eum. Eos explicabo vel fuga neque. Sapiente reiciendis officiis id culpa alias reiciendis.', 'Ut quas minus tempore numquam omnis quae ut rerum. Incidunt expedita modi minima voluptatem autem. Voluptatum omnis mollitia cupiditate aliquam veritatis dignissimos omnis eum. Aperiam et delectus quod est quam et voluptatibus. At aliquid aut laboriosam. Quia adipisci molestiae porro itaque illum ducimus vero. Quia quo qui occaecati provident.', '486.00', NULL, 'DIGI303', 'instock', 0, 190, 'digital_2.jpg', NULL, 3, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(22, 'quasi quis cum fugit', 'quasi-quis-cum-fugit', 'Error cupiditate ratione eos ut quis similique. Tenetur rerum non aut non.', 'Sint adipisci consequatur autem nisi cumque aut. Voluptas dolorem qui ut quas. Id et deleniti itaque reprehenderit perferendis ut laudantium optio. Ut iste impedit in quos omnis. Omnis corrupti est sed et doloribus. Consequatur autem rerum quia et sequi omnis. Ex facilis recusandae non doloribus quia aperiam aperiam. Aliquid ratione molestias ducimus impedit ut.', '422.00', NULL, 'DIGI435', 'instock', 0, 157, 'digital_18.jpg', NULL, 5, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(23, 'repellat mollitia ut voluptatibus', 'repellat-mollitia-ut-voluptatibus', 'Quae quae iste sunt assumenda sed repudiandae et illum. Recusandae ea quod necessitatibus labore. Temporibus consectetur velit aspernatur animi.', 'Consectetur est et voluptatem odio nihil adipisci quae. Corporis eos voluptatem et ipsam minima. Eos quo illum nam quas doloremque. Suscipit unde omnis fugiat. Molestiae ab corporis ducimus illo ad. Temporibus rem molestias quia qui est itaque. Quidem laborum officiis omnis enim et delectus. Facere eos totam quidem temporibus suscipit. Sunt id sed doloribus aut et aspernatur doloribus labore. Maxime deleniti quis unde aut cumque. Labore ea nobis sed reiciendis non corrupti.', '232.00', NULL, 'DIGI399', 'instock', 0, 191, 'digital_13.jpg', NULL, 2, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(24, 'veniam sit ipsam sint', 'veniam-sit-ipsam-sint', 'Voluptas beatae unde assumenda maxime. Nostrum quia omnis officiis atque omnis. Animi quod minus asperiores sunt ipsam nesciunt.', 'Voluptas porro esse ab amet cum non nesciunt. Voluptas nostrum libero quod voluptatem maxime corrupti dolor. Aut molestias saepe tenetur illum autem adipisci. Voluptas dicta dolor debitis. Provident enim eum explicabo enim molestiae nesciunt voluptas. Accusantium sed asperiores fuga. Et molestiae qui non aut nulla.', '360.00', NULL, 'DIGI436', 'instock', 0, 162, 'digital_14.jpg', NULL, 1, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(25, 'culpa fugit in aut', 'culpa-fugit-in-aut', 'Nihil perspiciatis dolore eaque in sint nobis esse. Distinctio ratione officia excepturi optio quibusdam nemo. Eos magnam nulla ut molestias est est reprehenderit aut.', 'Commodi consequatur sed odio fugiat ut et occaecati. Et quas quo earum molestiae corrupti ratione optio. Ducimus totam voluptatem voluptates dolor laborum. Nostrum excepturi est atque dolores aspernatur. Iusto harum voluptatem est pariatur molestiae illo. Tempora qui error similique et.', '356.00', NULL, 'DIGI341', 'instock', 0, 117, 'digital_3.jpg', NULL, 1, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(26, 'consequatur tempore sunt perferendis', 'consequatur-tempore-sunt-perferendis', 'Omnis asperiores molestiae eos aliquid velit. Perferendis quo et itaque. Eveniet omnis iusto nostrum quia harum iste aut.', 'Aut iure sapiente quam omnis natus iste amet. Cupiditate eos illo sit saepe quia expedita. Modi ea tenetur occaecati laudantium. Sed magni veritatis aut tenetur natus. Amet voluptates aut quia adipisci esse sed error. Commodi est velit laudantium iusto quia. Doloremque quos eaque porro eius. Perspiciatis architecto exercitationem nisi quos voluptates maiores nesciunt. Aspernatur tenetur est voluptatem in veniam qui. Atque quos quisquam libero adipisci ab laborum.', '65.00', NULL, 'DIGI348', 'instock', 0, 164, 'digital_20.jpg', NULL, 5, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(27, 'deleniti quia accusantium vero', 'deleniti-quia-accusantium-vero', 'Harum libero doloribus perspiciatis iure possimus aut. Sint incidunt omnis odio doloremque eos quo. Consequuntur occaecati omnis non similique.', 'Et qui temporibus sed suscipit ullam. Veritatis dolores cupiditate odio quos iusto a. Qui veniam deserunt atque molestiae dolore. Incidunt fugit deleniti repellendus consectetur aut et reiciendis. Error voluptas aut dolorum nisi tenetur quod molestiae. Et eveniet dolorem sint deleniti. Quis dolorem distinctio repellendus. Laboriosam dolor odio vel repellat corporis dolorem. Qui minima quo nesciunt repellendus quia pariatur.', '484.00', NULL, 'DIGI131', 'instock', 0, 193, 'digital_21.jpg', NULL, 5, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(28, 'dolores magni nihil minima', 'dolores-magni-nihil-minima', 'Quis harum impedit est. Ut adipisci eaque ea illo sed provident. Doloribus voluptates a itaque sunt quas doloremque iusto. Nulla autem eum dolores sit.', 'Sunt veritatis ipsum voluptatem est omnis dolor. Est explicabo totam nihil quaerat est. Quis error est eos facilis ad aperiam enim. Sint id id aliquid expedita fugit sit. Iusto dolore ut in sit error est excepturi. Ullam facilis eos dignissimos nesciunt. Laboriosam qui autem et vitae dolore aperiam. Aut enim animi est adipisci ut voluptatum aperiam. Quos quia beatae ab in rerum id. Voluptas esse porro sint facilis recusandae rerum vel. Cumque rerum libero et nesciunt odio quia fugit.', '384.00', NULL, 'DIGI475', 'instock', 0, 197, 'digital_8.jpg', NULL, 5, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(29, 'sequi delectus sit ut', 'sequi-delectus-sit-ut', 'Eaque quod vitae et. Dignissimos quas eum et mollitia veritatis non modi. Id aperiam soluta est dolores suscipit.', 'Est eveniet voluptas consequatur. Non quo eos iure ab nostrum nemo. Totam corrupti accusantium atque saepe nam est reiciendis ipsa. Et beatae facilis hic nisi sunt impedit aut et. Doloribus non dolorem et voluptatem. Quisquam nam et eius enim libero ipsa. Cumque ut magnam a ad. Quia error nemo pariatur sit sit inventore. Perferendis repudiandae voluptatibus molestiae qui. Qui nihil deleniti cumque ipsa ipsam. Sed in id laboriosam expedita.', '242.00', NULL, 'DIGI306', 'instock', 0, 125, 'digital_10.jpg', NULL, 3, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(30, 'sed et nemo iure', 'sed-et-nemo-iure', 'At architecto velit exercitationem sunt repellat enim architecto reprehenderit. Voluptas ad accusamus ut quas voluptas repellat. Quo quis reiciendis nam ea non doloribus.', 'Aut animi est necessitatibus. Est autem sit quam aut est beatae sed molestiae. Minima ut magni excepturi ab consequuntur. Accusantium similique aut non et minima. Perspiciatis optio voluptas dolore qui. Laborum quae non non illo. Ducimus totam molestiae reiciendis exercitationem dolores esse. Illo sed incidunt tempore. Sint explicabo et enim nihil laudantium excepturi mollitia.', '278.00', NULL, 'DIGI204', 'instock', 0, 199, 'digital_19.jpg', NULL, 4, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(31, 'eos accusamus odit et', 'eos-accusamus-odit-et', 'In excepturi eos sit. Aliquam consequatur quisquam dicta dolor. Temporibus rerum impedit ad iusto. Eum natus accusamus harum magni.', 'Voluptas commodi doloremque modi dignissimos in omnis qui. Aut aut asperiores nihil ut. Consequatur itaque quo amet quia et aut. Sed necessitatibus minus non adipisci magni accusantium quasi. Aut et velit reprehenderit odio enim mollitia. Ea asperiores dolorem iusto aut. Ipsam repudiandae est non dolorem ut autem ullam minus. Excepturi rerum dolorum et tempore. Et harum provident aliquid id veniam quam at. Amet odit molestias ut repellendus esse velit.', '317.00', NULL, 'DIGI272', 'instock', 0, 191, 'digital_22.jpg', NULL, 2, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(32, 'debitis ratione magni consectetur', 'debitis-ratione-magni-consectetur', 'Ex earum inventore accusantium voluptatem veniam. Cumque provident est maxime. Est consectetur non enim voluptatum voluptatem ut consequuntur.', 'Vitae asperiores velit facilis hic animi. Assumenda quia est nesciunt officia pariatur voluptatem sed. Iusto repellendus vel quis consequatur. Quasi ut et expedita dolorem laudantium. Et officia totam rem officiis labore enim dolorem. Sit impedit asperiores quo amet dolor impedit. Debitis similique dolorum quis vel eaque voluptas. Et quidem ab iusto pariatur minus.', '229.00', NULL, 'DIGI382', 'instock', 0, 175, 'digital_5.jpg', NULL, 3, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(33, 'veniam nostrum unde voluptatibus', 'veniam-nostrum-unde-voluptatibus', 'Reiciendis ut et itaque et delectus. Ut animi explicabo fugit natus vitae eos. Laboriosam suscipit nemo quo laudantium voluptatem quod.', 'Repellendus mollitia quia aut sit tempore quo ipsa. Ducimus quia qui nobis sed sed quod est. Quas alias vel placeat doloremque. Et numquam vitae saepe sequi rem corporis assumenda. Esse amet est ut et repellendus. Vitae quis sed et est ex quas. Esse quae optio velit impedit possimus ea eius. Qui fugiat ea deleniti et. Iure maxime nesciunt voluptatem est facilis. Ut et aut distinctio eos inventore cum ipsam. Nemo provident cum non sunt.', '164.00', NULL, 'DIGI258', 'instock', 0, 126, 'digital_6.jpg', NULL, 1, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(34, 'eveniet minima magni voluptatem', 'eveniet-minima-magni-voluptatem', 'Vel impedit enim facere itaque dicta. Id rerum fugit sunt ut quasi voluptatem. Rerum autem id placeat officia earum totam a reprehenderit.', 'Tenetur architecto earum modi natus iure blanditiis velit. Facilis voluptas et et suscipit doloribus modi. Sit eos beatae earum consequatur esse ex dignissimos neque. Qui laboriosam sunt porro et neque eius incidunt ut. Omnis minus eius nemo dolorum consectetur. Quibusdam quam fugiat nisi nihil labore accusantium voluptate. Eveniet vitae est vero incidunt.', '439.00', NULL, 'DIGI362', 'instock', 0, 121, 'digital_11.jpg', NULL, 3, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(35, 'harum autem et non', 'harum-autem-et-non', 'Assumenda non odit ipsa rem. Excepturi veniam culpa totam quas. Optio optio neque totam atque rerum aperiam alias.', 'Unde ea qui ut esse nobis et est. Quia dignissimos a in ex rem aspernatur. Delectus consectetur et voluptates pariatur consequatur. Aut corrupti doloremque commodi dolorum doloremque veniam qui voluptatem. Consequuntur accusantium ipsam ipsum et. Omnis nobis ut veniam sint quia. Vel temporibus quis quae ex magnam qui. Adipisci voluptatem qui necessitatibus sunt dolores pariatur aut. Voluptas eaque ut dolore. Eveniet quae molestiae doloremque voluptatem itaque ratione recusandae.', '233.00', NULL, 'DIGI397', 'instock', 0, 139, 'digital_17.jpg', NULL, 2, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(36, 'fugit nisi voluptatem fugiat', 'fugit-nisi-voluptatem-fugiat', 'Dolores tempora possimus laudantium alias placeat. Pariatur praesentium voluptatem sint id voluptatem est. Ut cupiditate culpa quae corrupti dicta in itaque ducimus.', 'Quasi consequuntur et nulla ea voluptatem voluptatem tempora. Rerum libero est doloremque. Nulla ut minima perferendis. Porro sed eaque commodi ad saepe nihil consequatur nostrum. Placeat rerum nulla saepe dignissimos. Est est eius hic quia autem quisquam itaque autem. A temporibus aperiam et ut asperiores. Et ullam autem cupiditate id provident autem quaerat. Labore non qui ab autem soluta. Ad et ipsum neque occaecati magnam neque.', '418.00', NULL, 'DIGI187', 'instock', 0, 168, 'digital_16.jpg', NULL, 3, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(37, 'iusto doloribus est error', 'iusto-doloribus-est-error', 'Qui ad ut voluptatem vitae omnis ipsa. Veniam sequi consequatur sit maxime alias possimus qui id. Animi tempora rem aliquam laborum nihil aperiam.', 'Modi reprehenderit expedita id. Delectus quisquam commodi asperiores perferendis iusto saepe quaerat. Sit expedita amet porro dolor soluta. Enim esse quibusdam aperiam sed adipisci cum. Ex nesciunt quo ab voluptatem distinctio. Ab placeat quae exercitationem suscipit iste qui soluta. Laborum similique dignissimos earum ex dolorum ut omnis. Qui nihil voluptatem eum et.', '367.00', NULL, 'DIGI257', 'instock', 0, 197, 'digital_4.jpg', NULL, 2, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(38, 'et quis corporis ut', 'et-quis-corporis-ut', 'Quidem quia accusantium veniam voluptatem voluptatum. Perspiciatis amet magnam dolorem et quia culpa unde. Sunt magnam est enim vel facere nisi quo. Ipsa et sunt sunt.', 'Quos voluptatum odit velit cumque doloremque. Qui aliquid qui nam. Earum cum voluptatem molestiae sed quod praesentium sint eum. Ea et ducimus aut similique expedita. Voluptatum ipsum necessitatibus saepe ratione nam odio eveniet. Ut vel voluptatum rerum. Et tempore eveniet libero commodi sit debitis. Commodi ratione minima tempore quasi a temporibus. Doloremque possimus occaecati dolores quia et. Non quas architecto ipsum molestiae. Non ut odit minus qui quae iusto debitis.', '116.00', NULL, 'DIGI322', 'instock', 0, 114, 'digital_1.jpg', NULL, 5, '2022-10-21 21:27:03', '2022-10-21 21:27:03', NULL),
(41, 'barang baru', 'barang-baru', 'dasd', 'sdsds', '100.00', NULL, 'DIGI7662', 'instock', 0, 12, '1666584855_png', NULL, 15, '2022-10-23 21:10:53', '2022-10-23 21:14:15', NULL),
(43, 'Foto product baru', 'foto-product-baru', '<p>ini foto ya</p>', '<p>ini foto ya</p>', '2000.00', '210.00', 'DIGI98772', 'instock', 0, 23, '1668336047_jpg', ',16683360470_jpg,16683360471_jpg', 11, '2022-11-13 03:40:48', '2022-11-13 03:40:48', NULL),
(44, 'Product TV', 'product-tv', '<p>kaddkbdsdbakd</p>', '<p>adadadsdsd</p>', '200.00', '100.00', 'DIGI09992', 'instock', 0, 20, '1669948598_jpg', NULL, 16, '2022-12-01 19:36:38', '2022-12-01 19:36:38', 5),
(45, 'Rumah baru', 'rumah-baru', '<p>rumah descriptis</p>', '<p>rumah descriptis</p>', '70000.00', '7666.00', 'DUAG7712', 'instock', 0, 2, '1669949628_jpg', ',16699496280_jpg', 16, '2022-12-01 19:53:48', '2022-12-01 19:53:48', 4),
(46, 'Bingkat Foto Attribute', 'bingkat-foto-attribute', '<p>Attribute 1</p>', '<p>Attributre 2</p>', '200.00', '150.00', 'UHHA766', 'instock', 0, 20, '1670035108_jpg', ',16700351080_jpg', 16, '2022-12-02 19:38:28', '2022-12-02 19:38:28', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Warna', '2022-12-02 18:27:40', '2022-12-02 18:38:47'),
(2, 'Ukuran', '2022-12-02 18:28:52', '2022-12-02 18:37:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 4, '1669973462.jpg', '0827773332', 'Line 1 Jaka', 'Line 2 Jaka', 'Kabupaten Tangerang', 'Banten', 'Indonesia', '15730', '2022-12-01 21:12:58', '2022-12-02 02:31:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
(1, 4, 'Product ini bagus banget', 16, '2022-12-02 03:39:56', '2022-12-02 03:39:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-11-04 04:06:05', 1, NULL, '2022-10-31 21:18:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2EDd1bGzOmODQrhFen7SFbscZ0ROKu7EXb0YWGEb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXJLVWROdGdLVzhSSEg4Q1QzVGRIMmx6b0l3ejB5RmZwQ1ZicVo0ayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1687204264),
('9IXzFGtaCdEMbwO4HtodOmxB4lpsOcwUnc4iQGbx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOVNSaFpXUVJaRUQ4Ym5LSjA3RDhVcE5KR2hYd3ZFZ004SXBON1hDWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1682208275),
('9qCA4OncP2LxPgmS5yt1mbzpxsBbMczbkCKAG5OK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzNudnNHY0c4VFJIS2t4TjZrQVkxSWpsazdPbDBFdnE2WVlRM1VDNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG9wIjt9fQ==', 1683809964),
('f2JpdTUfPMVsyjMlB8h3ugFPUTk6SA6n9VBPliDW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGZ0eVhqeURucjFGWHRQWDJBbW9DYWd5dnA5WHZXNUhETFVsQzRGciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG9wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1688299965),
('FrWty6amRDTvefmHwsqZJtqsAR7SQon1y7e9kjKQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFFxVVFHQ1Y3bDlPc3lHN2pad3pvVVpianhmQzVXcmlVS1RVb0lzUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1687419483),
('YlXfIRkzvw2EbPKR9mgfTcZguNkp8CLhaPqJLu4l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2U1UGdBNkJZd1NKR0I5dHBGcUU3SWFiRXd2bVpyb3ZmOE1CZkw2NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1687418869),
('yoNwuBQi6wgelP3UsP14ZFXr1euEWWl9XDLhbty3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWDVSaEFyQnE2amVnNjBFUEJES1NUcjRkV2d1YTNJaTA2U3dMOFd3YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG9wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo0OiJjYXJ0IjthOjE6e3M6ODoid2lzaGxpc3QiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX19', 1682208854),
('YUc3gv4vsdWq8lb9yNCT57B44LHURxcmzeG6y8RK', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSlZWcE1FbXlCelhMdDhrZEd2Y3JDSnhMNHNvQzFKdWsxRXBEV20yRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jYXRlZ29yeS9lZGl0L2NvbnRvaC9zdWItY29udG9oMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJjYXJ0IjthOjI6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MTp7czozMjoiZWM1NjhlYWY4NWZiZWQwNWMzOTY4MWMyODhiMzc0N2IiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiJlYzU2OGVhZjg1ZmJlZDA1YzM5NjgxYzI4OGIzNzQ3YiI7czoyOiJpZCI7aTo0NjtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czoyMjoiQmluZ2thdCBGb3RvIEF0dHJpYnV0ZSI7czo1OiJwcmljZSI7ZDoyMDA7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czo1OiJXYXJuYSI7czo1OiJIaXRhbSI7czo2OiJVa3VyYW4iO3M6MjoiNTAiO31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NDk6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBhc3NvY2lhdGVkTW9kZWwiO3M6MTg6IkFwcFxNb2RlbHNcUHJvZHVjdCI7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAHRheFJhdGUiO2k6MjE7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGlzU2F2ZWQiO2I6MDt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo4OiJ3aXNobGlzdCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MTp7czozMjoiYTc3NWJhYzljZmY3ZGVjMmI5ODRlMDIzYjk1MjA2YWEiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiJhNzc1YmFjOWNmZjdkZWMyYjk4NGUwMjNiOTUyMDZhYSI7czoyOiJpZCI7aTozO3M6MzoicXR5IjtpOjE7czo0OiJuYW1lIjtzOjI1OiJzdXNjaXBpdCBpZCBkZWxlbml0aSBlbmltIjtzOjU6InByaWNlIjtkOjk5O3M6Nzoib3B0aW9ucyI7TzozOToiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NDk6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBhc3NvY2lhdGVkTW9kZWwiO3M6MTg6IkFwcFxNb2RlbHNcUHJvZHVjdCI7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAHRheFJhdGUiO2k6MjE7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGlzU2F2ZWQiO2I6MDt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fX0=', 1687185626);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twiter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twiter`, `facebook`, `pinterest`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'ubaedasam@gmail.com', '081380925626', '081380925626', 'Taman adiyasa', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1311.511275642887!2d106.423866!3d-6.327321!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e420f439005ddeb%3A0x3dfc472eb96d4aa0!2sAiko%20Cafe!5e1!3m2!1sen!2sid!4v1668334325144!5m2!1sen!2sid', '#', '#', '#', '#', '#', '2022-11-13 02:52:40', '2022-11-13 03:19:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 4, 'ubaed', 'SAM', '1234567890', 'ubaedsam_UniversitasPamulang@gmail.com', 'Test LINE1', 'Test line 2', 'kabupaten tangerang', 'banten', 'indonesia', '15730', '2022-11-04 21:30:29', '2022-11-04 21:30:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('jaka@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-12-02 22:43:22', NULL),
('jaka@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-12-02 22:37:00', NULL),
('ubaedasam@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"ec568eaf85fbed05c39681c288b3747b\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"ec568eaf85fbed05c39681c288b3747b\";s:2:\"id\";i:46;s:3:\"qty\";i:1;s:4:\"name\";s:22:\"Bingkat Foto Attribute\";s:5:\"price\";d:200;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:2:{s:5:\"Warna\";s:5:\"Hitam\";s:6:\"Ukuran\";s:2:\"50\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-12-03 21:32:01', NULL),
('ubaedasam@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"a775bac9cff7dec2b984e023b95206aa\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"a775bac9cff7dec2b984e023b95206aa\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:25:\"suscipit id deleniti enim\";s:5:\"price\";d:99;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-12-03 21:30:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `slug`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Dekstop', 'dekstop', 19, '2022-11-15 03:10:59', '2022-11-15 03:50:11'),
(3, 'Jam', 'jam', 19, '2022-11-15 04:02:26', '2022-11-15 04:02:26'),
(4, 'Camera', 'camera', 16, '2022-12-01 19:11:32', '2022-12-01 19:11:32'),
(5, 'Television', 'television', 16, '2022-12-01 19:12:15', '2022-12-01 19:12:15'),
(6, 'sub-contoh', 'sub-contoh', 20, '2023-06-19 07:39:15', '2023-06-19 07:39:15'),
(7, 'sub-contoh2', 'sub-contoh2', 20, '2023-06-19 07:39:25', '2023-06-19 07:39:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'cod', 'pending', '2022-11-04 21:30:29', '2022-11-04 21:30:29'),
(2, 1, 7, 'card', 'approved', '2022-11-09 20:05:24', '2022-11-09 20:05:24'),
(3, 2, 8, 'cod', 'pending', '2022-11-10 01:37:59', '2022-11-10 01:37:59'),
(4, 1, 9, 'cod', 'pending', '2022-11-13 21:18:14', '2022-11-13 21:18:14'),
(5, 1, 10, 'cod', 'pending', '2022-11-14 01:33:05', '2022-11-14 01:33:05'),
(6, 1, 11, 'cod', 'pending', '2022-11-14 01:37:52', '2022-11-14 01:37:52'),
(7, 1, 12, 'cod', 'pending', '2022-11-14 01:55:12', '2022-11-14 01:55:12'),
(8, 1, 13, 'cod', 'pending', '2022-11-14 01:55:21', '2022-11-14 01:55:21'),
(9, 1, 14, 'cod', 'pending', '2022-11-14 01:57:00', '2022-11-14 01:57:00'),
(10, 1, 15, 'cod', 'pending', '2022-11-14 02:34:08', '2022-11-14 02:34:08'),
(11, 4, 16, 'cod', 'pending', '2022-11-17 21:37:40', '2022-11-17 21:37:40'),
(12, 4, 17, 'cod', 'pending', '2022-11-17 21:52:35', '2022-11-17 21:52:35'),
(13, 4, 18, 'cod', 'pending', '2022-12-02 22:30:39', '2022-12-02 22:30:39'),
(14, 4, 19, 'cod', 'pending', '2022-12-02 22:40:58', '2022-12-02 22:40:58'),
(15, 1, 20, 'cod', 'pending', '2022-12-03 21:30:01', '2022-12-03 21:30:01'),
(16, 1, 21, 'cod', 'pending', '2022-12-03 21:33:20', '2022-12-03 21:33:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Costumer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'ubaed', 'ubaedasam@gmail.com', NULL, '$2y$10$zaO.qZ1Pc2nOCQRUM9fl5uQK4j7ePCKgEPUvSyfsCOy/mDNsq3/y6', NULL, NULL, NULL, 'j6VgdM0ix5faHGayBzhkxulGarD08UGRqwpuZgudmDjuEMlIp4jKydAAH5Gu', NULL, NULL, 'ADM', '2022-10-21 06:03:06', '2023-06-19 07:34:15'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$15YrxE5y7bVvyhYHGkTy8euPs5c4xBz5JeCjmD1O.CmluB4iDEkJu', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-10-21 06:04:54', '2022-11-12 20:30:05'),
(3, 'User2', 'user2@gmail.com', NULL, '$2y$10$ff04e.4fLgSwTOJpfXYLROyRNhR4XtX6UDgtwVGpqSWBsILZAZSOK', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-10-21 20:46:26', '2022-10-21 20:46:26'),
(4, 'jaka', 'jaka@gmail.com', NULL, '$2y$10$Uccyu9Uv7BIJdW0rRRaBK./Cjmg/9v9paqh9BUTHr9fzmk8r5Gpo2', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-11-17 21:35:16', '2022-11-17 21:35:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `attribute_values_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `home_sliders`
--
ALTER TABLE `home_sliders`
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
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indeks untuk tabel `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indeks untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
-- AUTO_INCREMENT untuk tabel `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
