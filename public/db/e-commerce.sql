-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 27, 2023 at 08:22 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `created_at`, `updated_at`) VALUES
(1, 'dimas', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_address_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'kp. leuwuengkolot', NULL, NULL),
(2, 1, 'kp. dukuh', NULL, NULL),
(3, 1, 'kp. jambu lama', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_26_132408_create_products_table', 1),
(6, '2023_09_26_132541_create_customers_table', 1),
(7, '2023_09_26_132754_create_customer_addresses_table', 1),
(8, '2023_09_26_132947_create_payment_methods_table', 1),
(9, '2023_09_26_133111_create_transactions_table', 1),
(10, '2023_09_26_133412_create_transaction_payment_methods_table', 1),
(11, '2023_09_26_133442_create_transaction_products_table', 1),
(12, '2023_09_27_053340_add_field_to_product', 1),
(13, '2023_09_27_053459_add_field_to_transaction_product', 1),
(14, '2023_09_27_053648_add_field_to_transaction', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BCA', 1, NULL, NULL),
(2, 'MANDIRI', 1, NULL, NULL),
(3, 'DANA', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `created_at`, `updated_at`, `quantity`) VALUES
(1, 'Baju Gaun', 12000, NULL, NULL, 10),
(2, 'Baju Gojo', 30000, NULL, NULL, 5),
(3, 'Celana Naruto', 40000, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `customer_address_id` int NOT NULL,
  `totalPrice` double NOT NULL,
  `total_quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_customer_id_foreign` (`customer_id`),
  KEY `transaction_customer_address_id_foreign` (`customer_address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `customer_id`, `customer_address_id`, `totalPrice`, `total_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 900000, 0, '2023-09-27 01:16:49', '2023-09-27 01:16:49'),
(2, 1, 1, 900000, 0, '2023-09-27 01:17:38', '2023-09-27 01:17:38'),
(3, 1, 1, 900000, 0, '2023-09-27 01:20:25', '2023-09-27 01:20:25'),
(4, 1, 1, 60000, 0, '2023-09-27 01:20:35', '2023-09-27 01:20:35'),
(5, 1, 1, 900000, 0, '2023-09-27 01:20:40', '2023-09-27 01:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payment_method`
--

DROP TABLE IF EXISTS `transaction_payment_method`;
CREATE TABLE IF NOT EXISTS `transaction_payment_method` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payment_method_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_payment_method_payment_method_id_foreign` (`payment_method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payment_method`
--

INSERT INTO `transaction_payment_method` (`id`, `transaction_id`, `payment_method_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2023-09-27 01:17:38', '2023-09-27 01:17:38'),
(2, 2, 2, '2023-09-27 01:17:38', '2023-09-27 01:17:38'),
(3, 3, 3, '2023-09-27 01:20:25', '2023-09-27 01:20:25'),
(4, 3, 2, '2023-09-27 01:20:25', '2023-09-27 01:20:25'),
(5, 4, 3, '2023-09-27 01:20:35', '2023-09-27 01:20:35'),
(6, 4, 2, '2023-09-27 01:20:35', '2023-09-27 01:20:35'),
(7, 5, 2, '2023-09-27 01:20:40', '2023-09-27 01:20:40'),
(8, 5, 3, '2023-09-27 01:20:40', '2023-09-27 01:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_product`
--

DROP TABLE IF EXISTS `transaction_product`;
CREATE TABLE IF NOT EXISTS `transaction_product` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `totalPrice` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_product_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_product_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_product`
--

INSERT INTO `transaction_product` (`id`, `transaction_id`, `product_id`, `quantity`, `totalPrice`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 5, 12000, '2023-09-27 01:17:38', '2023-09-27 01:17:38'),
(2, 2, 2, 20, 30000, '2023-09-27 01:17:38', '2023-09-27 01:17:38'),
(3, 2, 3, 6, 40000, '2023-09-27 01:17:38', '2023-09-27 01:17:38'),
(4, 3, 1, 5, 12000, '2023-09-27 01:20:25', '2023-09-27 01:20:25'),
(5, 3, 2, 20, 30000, '2023-09-27 01:20:25', '2023-09-27 01:20:25'),
(6, 3, 3, 6, 40000, '2023-09-27 01:20:25', '2023-09-27 01:20:25'),
(7, 4, 1, 5, 12000, '2023-09-27 01:20:35', '2023-09-27 01:20:35'),
(8, 5, 1, 5, 12000, '2023-09-27 01:20:40', '2023-09-27 01:20:40'),
(9, 5, 2, 20, 30000, '2023-09-27 01:20:40', '2023-09-27 01:20:40'),
(10, 5, 3, 6, 40000, '2023-09-27 01:20:40', '2023-09-27 01:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
