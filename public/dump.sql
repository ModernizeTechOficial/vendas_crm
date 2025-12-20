-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 20/12/2025 às 22:51
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `salesy_product`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type_id` bigint UNSIGNED DEFAULT NULL,
  `account_industry_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_type_id_foreign` (`account_type_id`),
  KEY `accounts_account_industry_id_foreign` (`account_industry_id`),
  KEY `accounts_created_by_foreign` (`created_by`),
  KEY `accounts_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_activities`
--

DROP TABLE IF EXISTS `account_activities`;
CREATE TABLE IF NOT EXISTS `account_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_activities_user_id_foreign` (`user_id`),
  KEY `account_activities_account_id_created_at_index` (`account_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_comments`
--

DROP TABLE IF EXISTS `account_comments`;
CREATE TABLE IF NOT EXISTS `account_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_comments_account_id_foreign` (`account_id`),
  KEY `account_comments_user_id_foreign` (`user_id`),
  KEY `account_comments_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_industries`
--

DROP TABLE IF EXISTS `account_industries`;
CREATE TABLE IF NOT EXISTS `account_industries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_industries_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_types`
--

DROP TABLE IF EXISTS `account_types`;
CREATE TABLE IF NOT EXISTS `account_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_types_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('cyzor_cache_admin@demo.com|127.0.0.1:timer', 'i:1766242100;', 1766242100),
('cyzor_cache_admin@demo.com|127.0.0.1', 'i:2;', 1766242100);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('cyzor_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:8:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:6:\"module\";s:1:\"c\";s:4:\"name\";s:1:\"d\";s:10:\"guard_name\";s:1:\"e\";s:5:\"label\";s:1:\"f\";s:11:\"description\";s:1:\"r\";s:5:\"roles\";s:1:\"j\";s:10:\"created_by\";}s:11:\"permissions\";a:321:{i:0;a:7:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"dashboard\";s:1:\"c\";s:16:\"manage-dashboard\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Dashboard\";s:1:\"f\";s:18:\"Can view dashboard\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:1;a:7:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"dashboard\";s:1:\"c\";s:14:\"view-dashboard\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"View Dashboard\";s:1:\"f\";s:18:\"Can view dashboard\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:7:{s:1:\"a\";i:3;s:1:\"b\";s:8:\"calendar\";s:1:\"c\";s:15:\"manage-calendar\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Calendar\";s:1:\"f\";s:19:\"Can manage calendar\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:7:{s:1:\"a\";i:4;s:1:\"b\";s:8:\"calendar\";s:1:\"c\";s:13:\"view-calendar\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Calendar\";s:1:\"f\";s:17:\"Can view calendar\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:4;a:7:{s:1:\"a\";i:5;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:12:\"manage-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Users\";s:1:\"f\";s:16:\"Can manage users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:7:{s:1:\"a\";i:6;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:16:\"manage-any-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage All Users\";s:1:\"f\";s:16:\"Manage Any Users\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:7:{s:1:\"a\";i:7;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:16:\"manage-own-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Own Users\";s:1:\"f\";s:43:\"Manage Limited Users that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:7:{s:1:\"a\";i:8;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:10:\"view-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Users\";s:1:\"f\";s:10:\"View Users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:7:{s:1:\"a\";i:9;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:12:\"create-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Users\";s:1:\"f\";s:16:\"Can create users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:7:{s:1:\"a\";i:10;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:10:\"edit-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Users\";s:1:\"f\";s:14:\"Can edit users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:10;a:7:{s:1:\"a\";i:11;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:12:\"delete-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Users\";s:1:\"f\";s:16:\"Can delete users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:11;a:7:{s:1:\"a\";i:12;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:20:\"reset-password-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Reset Password Users\";s:1:\"f\";s:24:\"Can reset password users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:12;a:7:{s:1:\"a\";i:13;s:1:\"b\";s:5:\"users\";s:1:\"c\";s:19:\"toggle-status-users\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Change Status Users\";s:1:\"f\";s:23:\"Can change status users\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:7:{s:1:\"a\";i:14;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:12:\"manage-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Roles\";s:1:\"f\";s:16:\"Can manage roles\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:7:{s:1:\"a\";i:15;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:16:\"manage-any-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage All Roles\";s:1:\"f\";s:16:\"Manage Any Roles\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:7:{s:1:\"a\";i:16;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:16:\"manage-own-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Own Roles\";s:1:\"f\";s:43:\"Manage Limited Roles that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:7:{s:1:\"a\";i:17;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:10:\"view-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View Roles\";s:1:\"f\";s:10:\"View Roles\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:7:{s:1:\"a\";i:18;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:12:\"create-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Roles\";s:1:\"f\";s:16:\"Can create roles\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:7:{s:1:\"a\";i:19;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:10:\"edit-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Roles\";s:1:\"f\";s:14:\"Can edit roles\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:7:{s:1:\"a\";i:20;s:1:\"b\";s:5:\"roles\";s:1:\"c\";s:12:\"delete-roles\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Roles\";s:1:\"f\";s:16:\"Can delete roles\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:7:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:18:\"manage-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Manage Permissions\";s:1:\"f\";s:22:\"Can manage permissions\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:7:{s:1:\"a\";i:22;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:22:\"manage-any-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Manage All Permissions\";s:1:\"f\";s:22:\"Manage Any Permissions\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:7:{s:1:\"a\";i:23;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:22:\"manage-own-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Manage Own Permissions\";s:1:\"f\";s:49:\"Manage Limited Permissions that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:7:{s:1:\"a\";i:24;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:16:\"view-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"View Permissions\";s:1:\"f\";s:16:\"View Permissions\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:7:{s:1:\"a\";i:25;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:18:\"create-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Create Permissions\";s:1:\"f\";s:22:\"Can create permissions\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:7:{s:1:\"a\";i:26;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:16:\"edit-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Edit Permissions\";s:1:\"f\";s:20:\"Can edit permissions\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:7:{s:1:\"a\";i:27;s:1:\"b\";s:11:\"permissions\";s:1:\"c\";s:18:\"delete-permissions\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Delete Permissions\";s:1:\"f\";s:22:\"Can delete permissions\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:7:{s:1:\"a\";i:28;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:16:\"manage-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Companies\";s:1:\"f\";s:20:\"Can manage Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:7:{s:1:\"a\";i:29;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:20:\"manage-any-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage All Companies\";s:1:\"f\";s:20:\"Manage Any Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:7:{s:1:\"a\";i:30;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:20:\"manage-own-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Own Companies\";s:1:\"f\";s:47:\"Manage Limited Companies that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:7:{s:1:\"a\";i:31;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:14:\"view-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"View Companies\";s:1:\"f\";s:14:\"View Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:7:{s:1:\"a\";i:32;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:16:\"create-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Create Companies\";s:1:\"f\";s:20:\"Can create Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:7:{s:1:\"a\";i:33;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:14:\"edit-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Edit Companies\";s:1:\"f\";s:18:\"Can edit Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:7:{s:1:\"a\";i:34;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:16:\"delete-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Delete Companies\";s:1:\"f\";s:20:\"Can delete Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:7:{s:1:\"a\";i:35;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:24:\"reset-password-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:24:\"Reset Password Companies\";s:1:\"f\";s:28:\"Can reset password Companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:7:{s:1:\"a\";i:36;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:23:\"toggle-status-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Change Status Companies\";s:1:\"f\";s:27:\"Can change status companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:7:{s:1:\"a\";i:37;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:22:\"manage-plans-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Plan Companies\";s:1:\"f\";s:26:\"Can manage plans companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:7:{s:1:\"a\";i:38;s:1:\"b\";s:9:\"companies\";s:1:\"c\";s:22:\"upgrade-plan-companies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Upgrade Plan Companies\";s:1:\"f\";s:29:\"Can upgrade plan of companies\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:7:{s:1:\"a\";i:39;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:12:\"manage-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Plans\";s:1:\"f\";s:29:\"Can manage subscription plans\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:39;a:7:{s:1:\"a\";i:40;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:16:\"manage-any-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage All Plans\";s:1:\"f\";s:16:\"Manage Any Plans\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:7:{s:1:\"a\";i:41;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:16:\"manage-own-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Own Plans\";s:1:\"f\";s:43:\"Manage Limited Plans that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:7:{s:1:\"a\";i:42;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:10:\"view-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View Plans\";s:1:\"f\";s:10:\"View Plans\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:42;a:7:{s:1:\"a\";i:43;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:12:\"create-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Plans\";s:1:\"f\";s:29:\"Can create subscription plans\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:7:{s:1:\"a\";i:44;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:10:\"edit-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Plans\";s:1:\"f\";s:27:\"Can edit subscription plans\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:7:{s:1:\"a\";i:45;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:12:\"delete-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Plans\";s:1:\"f\";s:29:\"Can delete subscription plans\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:7:{s:1:\"a\";i:46;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:13:\"request-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Request Plans\";s:1:\"f\";s:30:\"Can request subscription plans\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:46;a:7:{s:1:\"a\";i:47;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:11:\"trial-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:11:\"Trial Plans\";s:1:\"f\";s:38:\"Can start trial for subscription plans\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:47;a:7:{s:1:\"a\";i:48;s:1:\"b\";s:5:\"plans\";s:1:\"c\";s:15:\"subscribe-plans\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Subscribe Plans\";s:1:\"f\";s:35:\"Can subscribe to subscription plans\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:48;a:7:{s:1:\"a\";i:49;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:14:\"manage-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Manage Coupons\";s:1:\"f\";s:31:\"Can manage subscription Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:7:{s:1:\"a\";i:50;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:18:\"manage-any-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Manage All Coupons\";s:1:\"f\";s:18:\"Manage Any Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:7:{s:1:\"a\";i:51;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:18:\"manage-own-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Manage Own Coupons\";s:1:\"f\";s:45:\"Manage Limited Coupons that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:7:{s:1:\"a\";i:52;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:12:\"view-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"View Coupons\";s:1:\"f\";s:12:\"View Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:7:{s:1:\"a\";i:53;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:14:\"create-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Create Coupons\";s:1:\"f\";s:31:\"Can create subscription Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:7:{s:1:\"a\";i:54;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:12:\"edit-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Edit Coupons\";s:1:\"f\";s:29:\"Can edit subscription Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:7:{s:1:\"a\";i:55;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:14:\"delete-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Delete Coupons\";s:1:\"f\";s:31:\"Can delete subscription Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:7:{s:1:\"a\";i:56;s:1:\"b\";s:7:\"coupons\";s:1:\"c\";s:21:\"toggle-status-coupons\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Change Status Coupons\";s:1:\"f\";s:25:\"Can change status Coupons\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:7:{s:1:\"a\";i:57;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:20:\"manage-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Plan Requests\";s:1:\"f\";s:24:\"Can manage plan requests\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:57;a:7:{s:1:\"a\";i:58;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:18:\"view-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Plan Requests\";s:1:\"f\";s:18:\"View Plan Requests\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:7:{s:1:\"a\";i:59;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:20:\"create-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Plan Requests\";s:1:\"f\";s:24:\"Can create plan requests\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:7:{s:1:\"a\";i:60;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:18:\"edit-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Plan Requests\";s:1:\"f\";s:22:\"Can edit plan requests\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:7:{s:1:\"a\";i:61;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:20:\"delete-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Plan Requests\";s:1:\"f\";s:24:\"Can delete plan requests\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:7:{s:1:\"a\";i:62;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:21:\"approve-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Approve plan requests\";s:1:\"f\";s:25:\"Can approve plan requests\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:7:{s:1:\"a\";i:63;s:1:\"b\";s:13:\"plan_requests\";s:1:\"c\";s:20:\"reject-plan-requests\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Reject plan requests\";s:1:\"f\";s:26:\"Can reject plplan requests\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:7:{s:1:\"a\";i:64;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:18:\"manage-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Manage Plan Orders\";s:1:\"f\";s:22:\"Can manage plan orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:64;a:7:{s:1:\"a\";i:65;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:16:\"view-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"View Plan Orders\";s:1:\"f\";s:16:\"View Plan Orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:65;a:7:{s:1:\"a\";i:66;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:18:\"create-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Create Plan Orders\";s:1:\"f\";s:22:\"Can create plan orders\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:7:{s:1:\"a\";i:67;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:16:\"edit-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Edit Plan Orders\";s:1:\"f\";s:20:\"Can edit plan orders\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:7:{s:1:\"a\";i:68;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:18:\"delete-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Delete Plan Orders\";s:1:\"f\";s:22:\"Can delete plan orders\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:7:{s:1:\"a\";i:69;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:19:\"approve-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Approve Plan Orders\";s:1:\"f\";s:23:\"Can approve plan orders\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:7:{s:1:\"a\";i:70;s:1:\"b\";s:11:\"plan_orders\";s:1:\"c\";s:18:\"reject-plan-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Reject Plan Orders\";s:1:\"f\";s:22:\"Can reject plan orders\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:7:{s:1:\"a\";i:71;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:15:\"manage-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Settings\";s:1:\"f\";s:23:\"Can manage All settings\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:71;a:7:{s:1:\"a\";i:72;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:22:\"manage-system-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Manage System Settings\";s:1:\"f\";s:26:\"Can manage system settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:7:{s:1:\"a\";i:73;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:21:\"manage-email-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Email Settings\";s:1:\"f\";s:25:\"Can manage email settings\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:73;a:7:{s:1:\"a\";i:74;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:21:\"manage-brand-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Brand Settings\";s:1:\"f\";s:25:\"Can manage brand settings\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:74;a:7:{s:1:\"a\";i:75;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:23:\"manage-company-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage Company Settings\";s:1:\"f\";s:27:\"Can manage Company settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:7:{s:1:\"a\";i:76;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:23:\"manage-payment-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage Payment Settings\";s:1:\"f\";s:27:\"Can manage payment settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:7:{s:1:\"a\";i:77;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:24:\"manage-currency-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:24:\"Manage Currency Settings\";s:1:\"f\";s:28:\"Can manage currency settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:7:{s:1:\"a\";i:78;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:25:\"manage-recaptcha-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:24:\"Manage ReCaptch Settings\";s:1:\"f\";s:29:\"Can manage recaptcha settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:7:{s:1:\"a\";i:79;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:23:\"manage-chatgpt-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage ChatGpt Settings\";s:1:\"f\";s:27:\"Can manage chatgpt settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:7:{s:1:\"a\";i:80;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:22:\"manage-cookie-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:28:\"Manage Cookie(GDPR) Settings\";s:1:\"f\";s:26:\"Can manage cookie settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:7:{s:1:\"a\";i:81;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:19:\"manage-seo-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Manage Seo Settings\";s:1:\"f\";s:23:\"Can manage seo settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:7:{s:1:\"a\";i:82;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:21:\"manage-cache-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Cache Settings\";s:1:\"f\";s:25:\"Can manage cache settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:7:{s:1:\"a\";i:83;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:23:\"manage-storage-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage Storage Settings\";s:1:\"f\";s:27:\"Can manage storage settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:7:{s:1:\"a\";i:84;s:1:\"b\";s:8:\"settings\";s:1:\"c\";s:23:\"manage-account-settings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage Account Settings\";s:1:\"f\";s:27:\"Can manage account settings\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:7:{s:1:\"a\";i:85;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:17:\"manage-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Manage Currencies\";s:1:\"f\";s:21:\"Can manage currencies\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:7:{s:1:\"a\";i:86;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:21:\"manage-any-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage All currencies\";s:1:\"f\";s:21:\"Manage Any currencies\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:7:{s:1:\"a\";i:87;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:21:\"manage-own-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Own currencies\";s:1:\"f\";s:48:\"Manage Limited currencies that is created by own\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:7:{s:1:\"a\";i:88;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:15:\"view-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"View Currencies\";s:1:\"f\";s:15:\"View Currencies\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:7:{s:1:\"a\";i:89;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:17:\"create-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Create Currencies\";s:1:\"f\";s:21:\"Can create currencies\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:7:{s:1:\"a\";i:90;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:15:\"edit-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Edit Currencies\";s:1:\"f\";s:19:\"Can edit currencies\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:7:{s:1:\"a\";i:91;s:1:\"b\";s:10:\"currencies\";s:1:\"c\";s:17:\"delete-currencies\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Delete Currencies\";s:1:\"f\";s:21:\"Can delete currencies\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:7:{s:1:\"a\";i:92;s:1:\"b\";s:8:\"referral\";s:1:\"c\";s:15:\"manage-referral\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Referral\";s:1:\"f\";s:27:\"Can manage referral program\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:92;a:7:{s:1:\"a\";i:93;s:1:\"b\";s:8:\"referral\";s:1:\"c\";s:21:\"manage-users-referral\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage User Referral\";s:1:\"f\";s:32:\"Can manage user referral program\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:93;a:7:{s:1:\"a\";i:94;s:1:\"b\";s:8:\"referral\";s:1:\"c\";s:23:\"manage-setting-referral\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage Referral Setting\";s:1:\"f\";s:27:\"Can manage Referral Setting\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:94;a:7:{s:1:\"a\";i:95;s:1:\"b\";s:8:\"referral\";s:1:\"c\";s:22:\"manage-payout-referral\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Manage Referral Payout\";s:1:\"f\";s:34:\"Can manage Referral Payout program\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:95;a:7:{s:1:\"a\";i:96;s:1:\"b\";s:8:\"referral\";s:1:\"c\";s:23:\"approve-payout-referral\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Referral\";s:1:\"f\";s:26:\"Can approve payout request\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:96;a:7:{s:1:\"a\";i:97;s:1:\"b\";s:8:\"referral\";s:1:\"c\";s:22:\"reject-payout-referral\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Referral\";s:1:\"f\";s:26:\"Can approve payout request\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:97;a:7:{s:1:\"a\";i:98;s:1:\"b\";s:8:\"language\";s:1:\"c\";s:15:\"manage-language\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Language\";s:1:\"f\";s:19:\"Can manage language\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:98;a:7:{s:1:\"a\";i:99;s:1:\"b\";s:8:\"language\";s:1:\"c\";s:13:\"edit-language\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Language\";s:1:\"f\";s:13:\"Edit Language\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:99;a:7:{s:1:\"a\";i:100;s:1:\"b\";s:8:\"language\";s:1:\"c\";s:13:\"view-language\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Language\";s:1:\"f\";s:13:\"View Language\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:100;a:7:{s:1:\"a\";i:101;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:12:\"manage-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Media\";s:1:\"f\";s:16:\"Can manage media\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:101;a:7:{s:1:\"a\";i:102;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:16:\"manage-any-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage All Media\";s:1:\"f\";s:16:\"Manage Any media\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:7:{s:1:\"a\";i:103;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:16:\"manage-own-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Own Media\";s:1:\"f\";s:43:\"Manage Limited media that is created by own\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:103;a:7:{s:1:\"a\";i:104;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:12:\"create-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create media\";s:1:\"f\";s:12:\"Create media\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:104;a:7:{s:1:\"a\";i:105;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:10:\"edit-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit media\";s:1:\"f\";s:10:\"Edit media\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:105;a:7:{s:1:\"a\";i:106;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:12:\"delete-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete media\";s:1:\"f\";s:12:\"Delete media\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:106;a:7:{s:1:\"a\";i:107;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:10:\"view-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View media\";s:1:\"f\";s:10:\"View media\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:107;a:7:{s:1:\"a\";i:108;s:1:\"b\";s:5:\"media\";s:1:\"c\";s:14:\"download-media\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Download media\";s:1:\"f\";s:14:\"Download media\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:108;a:7:{s:1:\"a\";i:109;s:1:\"b\";s:12:\"landing_page\";s:1:\"c\";s:19:\"manage-landing-page\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Manage Landing Page\";s:1:\"f\";s:23:\"Can manage landing page\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:7:{s:1:\"a\";i:110;s:1:\"b\";s:12:\"landing_page\";s:1:\"c\";s:17:\"view-landing-page\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"View Landing Page\";s:1:\"f\";s:17:\"View landing page\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:110;a:7:{s:1:\"a\";i:111;s:1:\"b\";s:12:\"landing_page\";s:1:\"c\";s:17:\"edit-landing-page\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Edit Landing Page\";s:1:\"f\";s:17:\"Edit landing page\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:7:{s:1:\"a\";i:112;s:1:\"b\";s:5:\"taxes\";s:1:\"c\";s:12:\"manage-taxes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Taxes\";s:1:\"f\";s:16:\"Can manage taxes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:112;a:7:{s:1:\"a\";i:113;s:1:\"b\";s:5:\"taxes\";s:1:\"c\";s:10:\"view-taxes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View Taxes\";s:1:\"f\";s:10:\"View Taxes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:113;a:7:{s:1:\"a\";i:114;s:1:\"b\";s:5:\"taxes\";s:1:\"c\";s:12:\"create-taxes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Taxes\";s:1:\"f\";s:16:\"Can create taxes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:114;a:7:{s:1:\"a\";i:115;s:1:\"b\";s:5:\"taxes\";s:1:\"c\";s:10:\"edit-taxes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Taxes\";s:1:\"f\";s:14:\"Can edit taxes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:115;a:7:{s:1:\"a\";i:116;s:1:\"b\";s:5:\"taxes\";s:1:\"c\";s:12:\"delete-taxes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Taxes\";s:1:\"f\";s:16:\"Can delete taxes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:116;a:7:{s:1:\"a\";i:117;s:1:\"b\";s:5:\"taxes\";s:1:\"c\";s:19:\"toggle-status-taxes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Toggle Status Taxes\";s:1:\"f\";s:23:\"Can toggle status taxes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:117;a:7:{s:1:\"a\";i:118;s:1:\"b\";s:6:\"brands\";s:1:\"c\";s:13:\"manage-brands\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Manage Brands\";s:1:\"f\";s:17:\"Can manage brands\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:118;a:7:{s:1:\"a\";i:119;s:1:\"b\";s:6:\"brands\";s:1:\"c\";s:11:\"view-brands\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:11:\"View Brands\";s:1:\"f\";s:11:\"View Brands\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:119;a:7:{s:1:\"a\";i:120;s:1:\"b\";s:6:\"brands\";s:1:\"c\";s:13:\"create-brands\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Create Brands\";s:1:\"f\";s:17:\"Can create brands\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:120;a:7:{s:1:\"a\";i:121;s:1:\"b\";s:6:\"brands\";s:1:\"c\";s:11:\"edit-brands\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:11:\"Edit Brands\";s:1:\"f\";s:15:\"Can edit brands\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:121;a:7:{s:1:\"a\";i:122;s:1:\"b\";s:6:\"brands\";s:1:\"c\";s:13:\"delete-brands\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Delete Brands\";s:1:\"f\";s:17:\"Can delete brands\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:122;a:7:{s:1:\"a\";i:123;s:1:\"b\";s:6:\"brands\";s:1:\"c\";s:20:\"toggle-status-brands\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Toggle Status Brands\";s:1:\"f\";s:24:\"Can toggle status brands\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:123;a:7:{s:1:\"a\";i:124;s:1:\"b\";s:10:\"categories\";s:1:\"c\";s:17:\"manage-categories\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Manage Categories\";s:1:\"f\";s:21:\"Can manage categories\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:124;a:7:{s:1:\"a\";i:125;s:1:\"b\";s:10:\"categories\";s:1:\"c\";s:15:\"view-categories\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"View Categories\";s:1:\"f\";s:15:\"View Categories\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:125;a:7:{s:1:\"a\";i:126;s:1:\"b\";s:10:\"categories\";s:1:\"c\";s:17:\"create-categories\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Create Categories\";s:1:\"f\";s:21:\"Can create categories\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:126;a:7:{s:1:\"a\";i:127;s:1:\"b\";s:10:\"categories\";s:1:\"c\";s:15:\"edit-categories\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Edit Categories\";s:1:\"f\";s:19:\"Can edit categories\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:127;a:7:{s:1:\"a\";i:128;s:1:\"b\";s:10:\"categories\";s:1:\"c\";s:17:\"delete-categories\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Delete Categories\";s:1:\"f\";s:21:\"Can delete categories\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:128;a:7:{s:1:\"a\";i:129;s:1:\"b\";s:10:\"categories\";s:1:\"c\";s:24:\"toggle-status-categories\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:24:\"Toggle Status Categories\";s:1:\"f\";s:28:\"Can toggle status categories\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:129;a:7:{s:1:\"a\";i:130;s:1:\"b\";s:8:\"products\";s:1:\"c\";s:15:\"manage-products\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Products\";s:1:\"f\";s:19:\"Can manage products\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:130;a:7:{s:1:\"a\";i:131;s:1:\"b\";s:8:\"products\";s:1:\"c\";s:13:\"view-products\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Products\";s:1:\"f\";s:13:\"View Products\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:131;a:7:{s:1:\"a\";i:132;s:1:\"b\";s:8:\"products\";s:1:\"c\";s:15:\"create-products\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Create Products\";s:1:\"f\";s:19:\"Can create products\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:132;a:7:{s:1:\"a\";i:133;s:1:\"b\";s:8:\"products\";s:1:\"c\";s:13:\"edit-products\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Products\";s:1:\"f\";s:17:\"Can edit products\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:133;a:7:{s:1:\"a\";i:134;s:1:\"b\";s:8:\"products\";s:1:\"c\";s:15:\"delete-products\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Delete Products\";s:1:\"f\";s:19:\"Can delete products\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:134;a:7:{s:1:\"a\";i:135;s:1:\"b\";s:8:\"products\";s:1:\"c\";s:22:\"toggle-status-products\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Toggle Status Products\";s:1:\"f\";s:26:\"Can toggle status products\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:135;a:7:{s:1:\"a\";i:136;s:1:\"b\";s:8:\"contacts\";s:1:\"c\";s:15:\"manage-contacts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Contacts\";s:1:\"f\";s:19:\"Can manage contacts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:136;a:7:{s:1:\"a\";i:137;s:1:\"b\";s:8:\"contacts\";s:1:\"c\";s:13:\"view-contacts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Contacts\";s:1:\"f\";s:13:\"View Contacts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:137;a:7:{s:1:\"a\";i:138;s:1:\"b\";s:8:\"contacts\";s:1:\"c\";s:15:\"create-contacts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Create Contacts\";s:1:\"f\";s:19:\"Can create contacts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:138;a:7:{s:1:\"a\";i:139;s:1:\"b\";s:8:\"contacts\";s:1:\"c\";s:13:\"edit-contacts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Contacts\";s:1:\"f\";s:17:\"Can edit contacts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:139;a:7:{s:1:\"a\";i:140;s:1:\"b\";s:8:\"contacts\";s:1:\"c\";s:15:\"delete-contacts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Delete Contacts\";s:1:\"f\";s:19:\"Can delete contacts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:140;a:7:{s:1:\"a\";i:141;s:1:\"b\";s:8:\"contacts\";s:1:\"c\";s:22:\"toggle-status-contacts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Toggle Status Contacts\";s:1:\"f\";s:26:\"Can toggle status contacts\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:141;a:7:{s:1:\"a\";i:142;s:1:\"b\";s:8:\"accounts\";s:1:\"c\";s:15:\"manage-accounts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Accounts\";s:1:\"f\";s:19:\"Can manage accounts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:142;a:7:{s:1:\"a\";i:143;s:1:\"b\";s:8:\"accounts\";s:1:\"c\";s:13:\"view-accounts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Accounts\";s:1:\"f\";s:13:\"View Accounts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:143;a:7:{s:1:\"a\";i:144;s:1:\"b\";s:8:\"accounts\";s:1:\"c\";s:15:\"create-accounts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Create Accounts\";s:1:\"f\";s:19:\"Can create accounts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:144;a:7:{s:1:\"a\";i:145;s:1:\"b\";s:8:\"accounts\";s:1:\"c\";s:13:\"edit-accounts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Accounts\";s:1:\"f\";s:17:\"Can edit accounts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:145;a:7:{s:1:\"a\";i:146;s:1:\"b\";s:8:\"accounts\";s:1:\"c\";s:15:\"delete-accounts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Delete Accounts\";s:1:\"f\";s:19:\"Can delete accounts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:146;a:7:{s:1:\"a\";i:147;s:1:\"b\";s:8:\"accounts\";s:1:\"c\";s:22:\"toggle-status-accounts\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Toggle Status Accounts\";s:1:\"f\";s:26:\"Can toggle status accounts\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:147;a:7:{s:1:\"a\";i:148;s:1:\"b\";s:13:\"account_types\";s:1:\"c\";s:20:\"manage-account-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Account Types\";s:1:\"f\";s:24:\"Can manage account types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:148;a:7:{s:1:\"a\";i:149;s:1:\"b\";s:13:\"account_types\";s:1:\"c\";s:18:\"view-account-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Account Types\";s:1:\"f\";s:18:\"View Account Types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:149;a:7:{s:1:\"a\";i:150;s:1:\"b\";s:13:\"account_types\";s:1:\"c\";s:20:\"create-account-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Account Types\";s:1:\"f\";s:24:\"Can create account types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:150;a:7:{s:1:\"a\";i:151;s:1:\"b\";s:13:\"account_types\";s:1:\"c\";s:18:\"edit-account-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Account Types\";s:1:\"f\";s:22:\"Can edit account types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:151;a:7:{s:1:\"a\";i:152;s:1:\"b\";s:13:\"account_types\";s:1:\"c\";s:20:\"delete-account-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Account Types\";s:1:\"f\";s:24:\"Can delete account types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:152;a:7:{s:1:\"a\";i:153;s:1:\"b\";s:13:\"account_types\";s:1:\"c\";s:27:\"toggle-status-account-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"Toggle Status Account Types\";s:1:\"f\";s:31:\"Can toggle status account types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:153;a:7:{s:1:\"a\";i:154;s:1:\"b\";s:18:\"account_industries\";s:1:\"c\";s:25:\"manage-account-industries\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:25:\"Manage Account Industries\";s:1:\"f\";s:29:\"Can manage account industries\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:154;a:7:{s:1:\"a\";i:155;s:1:\"b\";s:18:\"account_industries\";s:1:\"c\";s:23:\"view-account-industries\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"View Account Industries\";s:1:\"f\";s:23:\"View Account Industries\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:155;a:7:{s:1:\"a\";i:156;s:1:\"b\";s:18:\"account_industries\";s:1:\"c\";s:25:\"create-account-industries\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:25:\"Create Account Industries\";s:1:\"f\";s:29:\"Can create account industries\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:156;a:7:{s:1:\"a\";i:157;s:1:\"b\";s:18:\"account_industries\";s:1:\"c\";s:23:\"edit-account-industries\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Edit Account Industries\";s:1:\"f\";s:27:\"Can edit account industries\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:157;a:7:{s:1:\"a\";i:158;s:1:\"b\";s:18:\"account_industries\";s:1:\"c\";s:25:\"delete-account-industries\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:25:\"Delete Account Industries\";s:1:\"f\";s:29:\"Can delete account industries\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:158;a:7:{s:1:\"a\";i:159;s:1:\"b\";s:18:\"account_industries\";s:1:\"c\";s:32:\"toggle-status-account-industries\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:32:\"Toggle Status Account Industries\";s:1:\"f\";s:36:\"Can toggle status account industries\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:159;a:7:{s:1:\"a\";i:160;s:1:\"b\";s:13:\"lead_statuses\";s:1:\"c\";s:20:\"manage-lead-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Lead Statuses\";s:1:\"f\";s:24:\"Can manage lead statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:160;a:7:{s:1:\"a\";i:161;s:1:\"b\";s:13:\"lead_statuses\";s:1:\"c\";s:18:\"view-lead-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Lead Statuses\";s:1:\"f\";s:18:\"View Lead Statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:161;a:7:{s:1:\"a\";i:162;s:1:\"b\";s:13:\"lead_statuses\";s:1:\"c\";s:20:\"create-lead-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Lead Statuses\";s:1:\"f\";s:24:\"Can create lead statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:162;a:7:{s:1:\"a\";i:163;s:1:\"b\";s:13:\"lead_statuses\";s:1:\"c\";s:18:\"edit-lead-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Lead Statuses\";s:1:\"f\";s:22:\"Can edit lead statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:163;a:7:{s:1:\"a\";i:164;s:1:\"b\";s:13:\"lead_statuses\";s:1:\"c\";s:20:\"delete-lead-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Lead Statuses\";s:1:\"f\";s:24:\"Can delete lead statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:164;a:7:{s:1:\"a\";i:165;s:1:\"b\";s:13:\"lead_statuses\";s:1:\"c\";s:27:\"toggle-status-lead-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"Toggle Status Lead Statuses\";s:1:\"f\";s:31:\"Can toggle status lead statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:165;a:7:{s:1:\"a\";i:166;s:1:\"b\";s:12:\"lead_sources\";s:1:\"c\";s:19:\"manage-lead-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Manage Lead Sources\";s:1:\"f\";s:23:\"Can manage lead sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:166;a:7:{s:1:\"a\";i:167;s:1:\"b\";s:12:\"lead_sources\";s:1:\"c\";s:17:\"view-lead-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"View Lead Sources\";s:1:\"f\";s:17:\"View Lead Sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:167;a:7:{s:1:\"a\";i:168;s:1:\"b\";s:12:\"lead_sources\";s:1:\"c\";s:19:\"create-lead-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Create Lead Sources\";s:1:\"f\";s:23:\"Can create lead sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:168;a:7:{s:1:\"a\";i:169;s:1:\"b\";s:12:\"lead_sources\";s:1:\"c\";s:17:\"edit-lead-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Edit Lead Sources\";s:1:\"f\";s:21:\"Can edit lead sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:169;a:7:{s:1:\"a\";i:170;s:1:\"b\";s:12:\"lead_sources\";s:1:\"c\";s:19:\"delete-lead-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Delete Lead Sources\";s:1:\"f\";s:23:\"Can delete lead sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:170;a:7:{s:1:\"a\";i:171;s:1:\"b\";s:12:\"lead_sources\";s:1:\"c\";s:26:\"toggle-status-lead-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:26:\"Toggle Status Lead Sources\";s:1:\"f\";s:30:\"Can toggle status lead sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:171;a:7:{s:1:\"a\";i:172;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:12:\"manage-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Leads\";s:1:\"f\";s:16:\"Can manage leads\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:172;a:7:{s:1:\"a\";i:173;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:10:\"view-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View Leads\";s:1:\"f\";s:10:\"View Leads\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:173;a:7:{s:1:\"a\";i:174;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:12:\"create-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Leads\";s:1:\"f\";s:16:\"Can create leads\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:174;a:7:{s:1:\"a\";i:175;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:10:\"edit-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Leads\";s:1:\"f\";s:14:\"Can edit leads\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:175;a:7:{s:1:\"a\";i:176;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:12:\"delete-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Leads\";s:1:\"f\";s:16:\"Can delete leads\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:176;a:7:{s:1:\"a\";i:177;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:19:\"toggle-status-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Toggle Status Leads\";s:1:\"f\";s:23:\"Can toggle status leads\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:177;a:7:{s:1:\"a\";i:178;s:1:\"b\";s:5:\"leads\";s:1:\"c\";s:13:\"convert-leads\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Convert Leads\";s:1:\"f\";s:38:\"Can convert leads to accounts/contacts\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:178;a:7:{s:1:\"a\";i:179;s:1:\"b\";s:18:\"opportunity_stages\";s:1:\"c\";s:25:\"manage-opportunity-stages\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:25:\"Manage Opportunity Stages\";s:1:\"f\";s:29:\"Can manage opportunity stages\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:179;a:7:{s:1:\"a\";i:180;s:1:\"b\";s:18:\"opportunity_stages\";s:1:\"c\";s:23:\"view-opportunity-stages\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"View Opportunity Stages\";s:1:\"f\";s:23:\"View Opportunity Stages\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:180;a:7:{s:1:\"a\";i:181;s:1:\"b\";s:18:\"opportunity_stages\";s:1:\"c\";s:25:\"create-opportunity-stages\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:25:\"Create Opportunity Stages\";s:1:\"f\";s:29:\"Can create opportunity stages\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:181;a:7:{s:1:\"a\";i:182;s:1:\"b\";s:18:\"opportunity_stages\";s:1:\"c\";s:23:\"edit-opportunity-stages\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Edit Opportunity Stages\";s:1:\"f\";s:27:\"Can edit opportunity stages\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:182;a:7:{s:1:\"a\";i:183;s:1:\"b\";s:18:\"opportunity_stages\";s:1:\"c\";s:25:\"delete-opportunity-stages\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:25:\"Delete Opportunity Stages\";s:1:\"f\";s:29:\"Can delete opportunity stages\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:183;a:7:{s:1:\"a\";i:184;s:1:\"b\";s:18:\"opportunity_stages\";s:1:\"c\";s:32:\"toggle-status-opportunity-stages\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:32:\"Toggle Status Opportunity Stages\";s:1:\"f\";s:36:\"Can toggle status opportunity stages\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:184;a:7:{s:1:\"a\";i:185;s:1:\"b\";s:19:\"opportunity_sources\";s:1:\"c\";s:26:\"manage-opportunity-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:26:\"Manage Opportunity Sources\";s:1:\"f\";s:30:\"Can manage opportunity sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:185;a:7:{s:1:\"a\";i:186;s:1:\"b\";s:19:\"opportunity_sources\";s:1:\"c\";s:24:\"view-opportunity-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:24:\"View Opportunity Sources\";s:1:\"f\";s:24:\"View Opportunity Sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:186;a:7:{s:1:\"a\";i:187;s:1:\"b\";s:19:\"opportunity_sources\";s:1:\"c\";s:26:\"create-opportunity-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:26:\"Create Opportunity Sources\";s:1:\"f\";s:30:\"Can create opportunity sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:187;a:7:{s:1:\"a\";i:188;s:1:\"b\";s:19:\"opportunity_sources\";s:1:\"c\";s:24:\"edit-opportunity-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:24:\"Edit Opportunity Sources\";s:1:\"f\";s:28:\"Can edit opportunity sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:188;a:7:{s:1:\"a\";i:189;s:1:\"b\";s:19:\"opportunity_sources\";s:1:\"c\";s:26:\"delete-opportunity-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:26:\"Delete Opportunity Sources\";s:1:\"f\";s:30:\"Can delete opportunity sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:189;a:7:{s:1:\"a\";i:190;s:1:\"b\";s:19:\"opportunity_sources\";s:1:\"c\";s:33:\"toggle-status-opportunity-sources\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:33:\"Toggle Status Opportunity Sources\";s:1:\"f\";s:37:\"Can toggle status opportunity sources\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:190;a:7:{s:1:\"a\";i:191;s:1:\"b\";s:13:\"opportunities\";s:1:\"c\";s:20:\"manage-opportunities\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Opportunities\";s:1:\"f\";s:24:\"Can manage opportunities\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:191;a:7:{s:1:\"a\";i:192;s:1:\"b\";s:13:\"opportunities\";s:1:\"c\";s:18:\"view-opportunities\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Opportunities\";s:1:\"f\";s:18:\"View Opportunities\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:192;a:7:{s:1:\"a\";i:193;s:1:\"b\";s:13:\"opportunities\";s:1:\"c\";s:20:\"create-opportunities\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Opportunities\";s:1:\"f\";s:24:\"Can create opportunities\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:193;a:7:{s:1:\"a\";i:194;s:1:\"b\";s:13:\"opportunities\";s:1:\"c\";s:18:\"edit-opportunities\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Opportunities\";s:1:\"f\";s:22:\"Can edit opportunities\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:194;a:7:{s:1:\"a\";i:195;s:1:\"b\";s:13:\"opportunities\";s:1:\"c\";s:20:\"delete-opportunities\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Opportunities\";s:1:\"f\";s:24:\"Can delete opportunities\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:195;a:7:{s:1:\"a\";i:196;s:1:\"b\";s:13:\"opportunities\";s:1:\"c\";s:27:\"toggle-status-opportunities\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"Toggle Status Opportunities\";s:1:\"f\";s:31:\"Can toggle status opportunities\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:196;a:7:{s:1:\"a\";i:197;s:1:\"b\";s:14:\"campaign_types\";s:1:\"c\";s:21:\"manage-campaign-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Campaign Types\";s:1:\"f\";s:25:\"Can manage campaign types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:197;a:7:{s:1:\"a\";i:198;s:1:\"b\";s:14:\"campaign_types\";s:1:\"c\";s:19:\"view-campaign-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"View Campaign Types\";s:1:\"f\";s:19:\"View Campaign Types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:198;a:7:{s:1:\"a\";i:199;s:1:\"b\";s:14:\"campaign_types\";s:1:\"c\";s:21:\"create-campaign-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Create Campaign Types\";s:1:\"f\";s:25:\"Can create campaign types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:199;a:7:{s:1:\"a\";i:200;s:1:\"b\";s:14:\"campaign_types\";s:1:\"c\";s:19:\"edit-campaign-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Edit Campaign Types\";s:1:\"f\";s:23:\"Can edit campaign types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:200;a:7:{s:1:\"a\";i:201;s:1:\"b\";s:14:\"campaign_types\";s:1:\"c\";s:21:\"delete-campaign-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Delete Campaign Types\";s:1:\"f\";s:25:\"Can delete campaign types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:201;a:7:{s:1:\"a\";i:202;s:1:\"b\";s:14:\"campaign_types\";s:1:\"c\";s:28:\"toggle-status-campaign-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:28:\"Toggle Status Campaign Types\";s:1:\"f\";s:32:\"Can toggle status campaign types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:202;a:7:{s:1:\"a\";i:203;s:1:\"b\";s:12:\"target_lists\";s:1:\"c\";s:19:\"manage-target-lists\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Manage Target Lists\";s:1:\"f\";s:23:\"Can manage target lists\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:203;a:7:{s:1:\"a\";i:204;s:1:\"b\";s:12:\"target_lists\";s:1:\"c\";s:17:\"view-target-lists\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"View Target Lists\";s:1:\"f\";s:17:\"View Target Lists\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:204;a:7:{s:1:\"a\";i:205;s:1:\"b\";s:12:\"target_lists\";s:1:\"c\";s:19:\"create-target-lists\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Create Target Lists\";s:1:\"f\";s:23:\"Can create target lists\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:205;a:7:{s:1:\"a\";i:206;s:1:\"b\";s:12:\"target_lists\";s:1:\"c\";s:17:\"edit-target-lists\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Edit Target Lists\";s:1:\"f\";s:21:\"Can edit target lists\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:206;a:7:{s:1:\"a\";i:207;s:1:\"b\";s:12:\"target_lists\";s:1:\"c\";s:19:\"delete-target-lists\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Delete Target Lists\";s:1:\"f\";s:23:\"Can delete target lists\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:207;a:7:{s:1:\"a\";i:208;s:1:\"b\";s:12:\"target_lists\";s:1:\"c\";s:26:\"toggle-status-target-lists\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:26:\"Toggle Status Target Lists\";s:1:\"f\";s:30:\"Can toggle status target lists\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:208;a:7:{s:1:\"a\";i:209;s:1:\"b\";s:9:\"campaigns\";s:1:\"c\";s:16:\"manage-campaigns\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Campaigns\";s:1:\"f\";s:20:\"Can manage campaigns\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:209;a:7:{s:1:\"a\";i:210;s:1:\"b\";s:9:\"campaigns\";s:1:\"c\";s:14:\"view-campaigns\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"View Campaigns\";s:1:\"f\";s:14:\"View Campaigns\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:210;a:7:{s:1:\"a\";i:211;s:1:\"b\";s:9:\"campaigns\";s:1:\"c\";s:16:\"create-campaigns\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Create Campaigns\";s:1:\"f\";s:20:\"Can create campaigns\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:211;a:7:{s:1:\"a\";i:212;s:1:\"b\";s:9:\"campaigns\";s:1:\"c\";s:14:\"edit-campaigns\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Edit Campaigns\";s:1:\"f\";s:18:\"Can edit campaigns\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:212;a:7:{s:1:\"a\";i:213;s:1:\"b\";s:9:\"campaigns\";s:1:\"c\";s:16:\"delete-campaigns\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Delete Campaigns\";s:1:\"f\";s:20:\"Can delete campaigns\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:213;a:7:{s:1:\"a\";i:214;s:1:\"b\";s:9:\"campaigns\";s:1:\"c\";s:23:\"toggle-status-campaigns\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Toggle Status Campaigns\";s:1:\"f\";s:27:\"Can toggle status campaigns\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:214;a:7:{s:1:\"a\";i:215;s:1:\"b\";s:23:\"shipping_provider_types\";s:1:\"c\";s:30:\"manage-shipping-provider-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:30:\"Manage Shipping Provider Types\";s:1:\"f\";s:34:\"Can manage shipping provider types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:215;a:7:{s:1:\"a\";i:216;s:1:\"b\";s:23:\"shipping_provider_types\";s:1:\"c\";s:28:\"view-shipping-provider-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:28:\"View Shipping Provider Types\";s:1:\"f\";s:28:\"View Shipping Provider Types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:216;a:7:{s:1:\"a\";i:217;s:1:\"b\";s:23:\"shipping_provider_types\";s:1:\"c\";s:30:\"create-shipping-provider-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:30:\"Create Shipping Provider Types\";s:1:\"f\";s:34:\"Can create shipping provider types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:217;a:7:{s:1:\"a\";i:218;s:1:\"b\";s:23:\"shipping_provider_types\";s:1:\"c\";s:28:\"edit-shipping-provider-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:28:\"Edit Shipping Provider Types\";s:1:\"f\";s:32:\"Can edit shipping provider types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:218;a:7:{s:1:\"a\";i:219;s:1:\"b\";s:23:\"shipping_provider_types\";s:1:\"c\";s:30:\"delete-shipping-provider-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:30:\"Delete Shipping Provider Types\";s:1:\"f\";s:34:\"Can delete shipping provider types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:219;a:7:{s:1:\"a\";i:220;s:1:\"b\";s:23:\"shipping_provider_types\";s:1:\"c\";s:37:\"toggle-status-shipping-provider-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:37:\"Toggle Status Shipping Provider Types\";s:1:\"f\";s:41:\"Can toggle status shipping provider types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:220;a:7:{s:1:\"a\";i:221;s:1:\"b\";s:5:\"cases\";s:1:\"c\";s:12:\"manage-cases\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Cases\";s:1:\"f\";s:16:\"Can manage cases\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:221;a:7:{s:1:\"a\";i:222;s:1:\"b\";s:5:\"cases\";s:1:\"c\";s:10:\"view-cases\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View Cases\";s:1:\"f\";s:10:\"View Cases\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:222;a:7:{s:1:\"a\";i:223;s:1:\"b\";s:5:\"cases\";s:1:\"c\";s:12:\"create-cases\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Cases\";s:1:\"f\";s:16:\"Can create cases\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:223;a:7:{s:1:\"a\";i:224;s:1:\"b\";s:5:\"cases\";s:1:\"c\";s:10:\"edit-cases\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Cases\";s:1:\"f\";s:14:\"Can edit cases\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:224;a:7:{s:1:\"a\";i:225;s:1:\"b\";s:5:\"cases\";s:1:\"c\";s:12:\"delete-cases\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Cases\";s:1:\"f\";s:16:\"Can delete cases\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:225;a:7:{s:1:\"a\";i:226;s:1:\"b\";s:5:\"cases\";s:1:\"c\";s:19:\"toggle-status-cases\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Toggle Status Cases\";s:1:\"f\";s:23:\"Can toggle status cases\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:226;a:7:{s:1:\"a\";i:227;s:1:\"b\";s:6:\"quotes\";s:1:\"c\";s:13:\"manage-quotes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Manage Quotes\";s:1:\"f\";s:17:\"Can manage quotes\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:227;a:7:{s:1:\"a\";i:228;s:1:\"b\";s:6:\"quotes\";s:1:\"c\";s:11:\"view-quotes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:11:\"View Quotes\";s:1:\"f\";s:11:\"View Quotes\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:228;a:7:{s:1:\"a\";i:229;s:1:\"b\";s:6:\"quotes\";s:1:\"c\";s:13:\"create-quotes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Create Quotes\";s:1:\"f\";s:17:\"Can create quotes\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:229;a:7:{s:1:\"a\";i:230;s:1:\"b\";s:6:\"quotes\";s:1:\"c\";s:11:\"edit-quotes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:11:\"Edit Quotes\";s:1:\"f\";s:15:\"Can edit quotes\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:230;a:7:{s:1:\"a\";i:231;s:1:\"b\";s:6:\"quotes\";s:1:\"c\";s:13:\"delete-quotes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Delete Quotes\";s:1:\"f\";s:17:\"Can delete quotes\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:231;a:7:{s:1:\"a\";i:232;s:1:\"b\";s:6:\"quotes\";s:1:\"c\";s:20:\"toggle-status-quotes\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Toggle Status Quotes\";s:1:\"f\";s:24:\"Can toggle status quotes\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:232;a:7:{s:1:\"a\";i:233;s:1:\"b\";s:12:\"sales_orders\";s:1:\"c\";s:19:\"manage-sales-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Manage Sales Orders\";s:1:\"f\";s:23:\"Can manage sales orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:233;a:7:{s:1:\"a\";i:234;s:1:\"b\";s:12:\"sales_orders\";s:1:\"c\";s:17:\"view-sales-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"View Sales Orders\";s:1:\"f\";s:17:\"View Sales Orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:234;a:7:{s:1:\"a\";i:235;s:1:\"b\";s:12:\"sales_orders\";s:1:\"c\";s:19:\"create-sales-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Create Sales Orders\";s:1:\"f\";s:23:\"Can create sales orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:235;a:7:{s:1:\"a\";i:236;s:1:\"b\";s:12:\"sales_orders\";s:1:\"c\";s:17:\"edit-sales-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:17:\"Edit Sales Orders\";s:1:\"f\";s:21:\"Can edit sales orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:236;a:7:{s:1:\"a\";i:237;s:1:\"b\";s:12:\"sales_orders\";s:1:\"c\";s:19:\"delete-sales-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Delete Sales Orders\";s:1:\"f\";s:23:\"Can delete sales orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:237;a:7:{s:1:\"a\";i:238;s:1:\"b\";s:12:\"sales_orders\";s:1:\"c\";s:26:\"toggle-status-sales-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:26:\"Toggle Status Sales Orders\";s:1:\"f\";s:30:\"Can toggle status sales orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:238;a:7:{s:1:\"a\";i:239;s:1:\"b\";s:8:\"invoices\";s:1:\"c\";s:15:\"manage-invoices\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Invoices\";s:1:\"f\";s:19:\"Can manage invoices\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:239;a:7:{s:1:\"a\";i:240;s:1:\"b\";s:8:\"invoices\";s:1:\"c\";s:13:\"view-invoices\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Invoices\";s:1:\"f\";s:13:\"View Invoices\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:240;a:7:{s:1:\"a\";i:241;s:1:\"b\";s:8:\"invoices\";s:1:\"c\";s:15:\"create-invoices\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Create Invoices\";s:1:\"f\";s:19:\"Can create invoices\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:241;a:7:{s:1:\"a\";i:242;s:1:\"b\";s:8:\"invoices\";s:1:\"c\";s:13:\"edit-invoices\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Invoices\";s:1:\"f\";s:17:\"Can edit invoices\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:242;a:7:{s:1:\"a\";i:243;s:1:\"b\";s:8:\"invoices\";s:1:\"c\";s:15:\"delete-invoices\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Delete Invoices\";s:1:\"f\";s:19:\"Can delete invoices\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:243;a:7:{s:1:\"a\";i:244;s:1:\"b\";s:8:\"invoices\";s:1:\"c\";s:22:\"toggle-status-invoices\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Toggle Status Invoices\";s:1:\"f\";s:26:\"Can toggle status invoices\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:244;a:7:{s:1:\"a\";i:245;s:1:\"b\";s:15:\"delivery_orders\";s:1:\"c\";s:22:\"manage-delivery-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Manage Delivery Orders\";s:1:\"f\";s:26:\"Can manage delivery orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:245;a:7:{s:1:\"a\";i:246;s:1:\"b\";s:15:\"delivery_orders\";s:1:\"c\";s:20:\"view-delivery-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"View Delivery Orders\";s:1:\"f\";s:20:\"View Delivery Orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:246;a:7:{s:1:\"a\";i:247;s:1:\"b\";s:15:\"delivery_orders\";s:1:\"c\";s:22:\"create-delivery-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Create Delivery Orders\";s:1:\"f\";s:26:\"Can create delivery orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:247;a:7:{s:1:\"a\";i:248;s:1:\"b\";s:15:\"delivery_orders\";s:1:\"c\";s:20:\"edit-delivery-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Edit Delivery Orders\";s:1:\"f\";s:24:\"Can edit delivery orders\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:248;a:7:{s:1:\"a\";i:249;s:1:\"b\";s:15:\"delivery_orders\";s:1:\"c\";s:22:\"delete-delivery-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Delete Delivery Orders\";s:1:\"f\";s:26:\"Can delete delivery orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:249;a:7:{s:1:\"a\";i:250;s:1:\"b\";s:15:\"delivery_orders\";s:1:\"c\";s:29:\"toggle-status-delivery-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:29:\"Toggle Status Delivery Orders\";s:1:\"f\";s:33:\"Can toggle status delivery orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:250;a:7:{s:1:\"a\";i:251;s:1:\"b\";s:13:\"return_orders\";s:1:\"c\";s:20:\"manage-return-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Return Orders\";s:1:\"f\";s:24:\"Can manage return orders\";s:1:\"r\";a:1:{i:0;i:1;}}i:251;a:7:{s:1:\"a\";i:252;s:1:\"b\";s:13:\"return_orders\";s:1:\"c\";s:18:\"view-return-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Return Orders\";s:1:\"f\";s:18:\"View Return Orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:252;a:7:{s:1:\"a\";i:253;s:1:\"b\";s:13:\"return_orders\";s:1:\"c\";s:20:\"create-return-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Return Orders\";s:1:\"f\";s:24:\"Can create return orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:253;a:7:{s:1:\"a\";i:254;s:1:\"b\";s:13:\"return_orders\";s:1:\"c\";s:18:\"edit-return-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Return Orders\";s:1:\"f\";s:22:\"Can edit return orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:254;a:7:{s:1:\"a\";i:255;s:1:\"b\";s:13:\"return_orders\";s:1:\"c\";s:20:\"delete-return-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Return Orders\";s:1:\"f\";s:24:\"Can delete return orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:255;a:7:{s:1:\"a\";i:256;s:1:\"b\";s:15:\"purchase_orders\";s:1:\"c\";s:22:\"manage-purchase-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Manage Purchase Orders\";s:1:\"f\";s:26:\"Can manage purchase orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:256;a:7:{s:1:\"a\";i:257;s:1:\"b\";s:15:\"purchase_orders\";s:1:\"c\";s:20:\"view-purchase-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"View Purchase Orders\";s:1:\"f\";s:20:\"View Purchase Orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:257;a:7:{s:1:\"a\";i:258;s:1:\"b\";s:15:\"purchase_orders\";s:1:\"c\";s:22:\"create-purchase-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Create Purchase Orders\";s:1:\"f\";s:26:\"Can create purchase orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:258;a:7:{s:1:\"a\";i:259;s:1:\"b\";s:15:\"purchase_orders\";s:1:\"c\";s:20:\"edit-purchase-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Edit Purchase Orders\";s:1:\"f\";s:24:\"Can edit purchase orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:259;a:7:{s:1:\"a\";i:260;s:1:\"b\";s:15:\"purchase_orders\";s:1:\"c\";s:22:\"delete-purchase-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Delete Purchase Orders\";s:1:\"f\";s:26:\"Can delete purchase orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:260;a:7:{s:1:\"a\";i:261;s:1:\"b\";s:15:\"purchase_orders\";s:1:\"c\";s:29:\"toggle-status-purchase-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:29:\"Toggle Status Purchase Orders\";s:1:\"f\";s:33:\"Can toggle status purchase orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:261;a:7:{s:1:\"a\";i:262;s:1:\"b\";s:14:\"receipt_orders\";s:1:\"c\";s:21:\"manage-receipt-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Receipt Orders\";s:1:\"f\";s:25:\"Can manage receipt orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:262;a:7:{s:1:\"a\";i:263;s:1:\"b\";s:14:\"receipt_orders\";s:1:\"c\";s:19:\"view-receipt-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"View Receipt Orders\";s:1:\"f\";s:19:\"View Receipt Orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:263;a:7:{s:1:\"a\";i:264;s:1:\"b\";s:14:\"receipt_orders\";s:1:\"c\";s:21:\"create-receipt-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Create Receipt Orders\";s:1:\"f\";s:25:\"Can create receipt orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:264;a:7:{s:1:\"a\";i:265;s:1:\"b\";s:14:\"receipt_orders\";s:1:\"c\";s:19:\"edit-receipt-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Edit Receipt Orders\";s:1:\"f\";s:23:\"Can edit receipt orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:265;a:7:{s:1:\"a\";i:266;s:1:\"b\";s:14:\"receipt_orders\";s:1:\"c\";s:21:\"delete-receipt-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Delete Receipt Orders\";s:1:\"f\";s:25:\"Can delete receipt orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:266;a:7:{s:1:\"a\";i:267;s:1:\"b\";s:14:\"receipt_orders\";s:1:\"c\";s:28:\"toggle-status-receipt-orders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:28:\"Toggle Status Receipt Orders\";s:1:\"f\";s:32:\"Can toggle status receipt orders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:267;a:7:{s:1:\"a\";i:268;s:1:\"b\";s:8:\"projects\";s:1:\"c\";s:15:\"manage-projects\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Projects\";s:1:\"f\";s:19:\"Can manage projects\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:268;a:7:{s:1:\"a\";i:269;s:1:\"b\";s:8:\"projects\";s:1:\"c\";s:13:\"view-projects\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Projects\";s:1:\"f\";s:13:\"View Projects\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:269;a:7:{s:1:\"a\";i:270;s:1:\"b\";s:8:\"projects\";s:1:\"c\";s:15:\"create-projects\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Create Projects\";s:1:\"f\";s:19:\"Can create projects\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:270;a:7:{s:1:\"a\";i:271;s:1:\"b\";s:8:\"projects\";s:1:\"c\";s:13:\"edit-projects\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Projects\";s:1:\"f\";s:17:\"Can edit projects\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:271;a:7:{s:1:\"a\";i:272;s:1:\"b\";s:8:\"projects\";s:1:\"c\";s:15:\"delete-projects\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Delete Projects\";s:1:\"f\";s:19:\"Can delete projects\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:272;a:7:{s:1:\"a\";i:273;s:1:\"b\";s:8:\"projects\";s:1:\"c\";s:22:\"toggle-status-projects\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Toggle Status Projects\";s:1:\"f\";s:26:\"Can toggle status projects\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:273;a:7:{s:1:\"a\";i:274;s:1:\"b\";s:13:\"project_tasks\";s:1:\"c\";s:20:\"manage-project-tasks\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Project Tasks\";s:1:\"f\";s:24:\"Can manage project tasks\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:274;a:7:{s:1:\"a\";i:275;s:1:\"b\";s:13:\"project_tasks\";s:1:\"c\";s:18:\"view-project-tasks\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Project Tasks\";s:1:\"f\";s:18:\"View Project Tasks\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:275;a:7:{s:1:\"a\";i:276;s:1:\"b\";s:13:\"project_tasks\";s:1:\"c\";s:20:\"create-project-tasks\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Project Tasks\";s:1:\"f\";s:24:\"Can create project tasks\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:276;a:7:{s:1:\"a\";i:277;s:1:\"b\";s:13:\"project_tasks\";s:1:\"c\";s:18:\"edit-project-tasks\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Project Tasks\";s:1:\"f\";s:22:\"Can edit project tasks\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:277;a:7:{s:1:\"a\";i:278;s:1:\"b\";s:13:\"project_tasks\";s:1:\"c\";s:20:\"delete-project-tasks\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Project Tasks\";s:1:\"f\";s:24:\"Can delete project tasks\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:278;a:7:{s:1:\"a\";i:279;s:1:\"b\";s:13:\"project_tasks\";s:1:\"c\";s:27:\"toggle-status-project-tasks\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"Toggle Status Project Tasks\";s:1:\"f\";s:31:\"Can toggle status project tasks\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:279;a:7:{s:1:\"a\";i:280;s:1:\"b\";s:13:\"task_statuses\";s:1:\"c\";s:20:\"manage-task-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Manage Task Statuses\";s:1:\"f\";s:24:\"Can manage task statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:280;a:7:{s:1:\"a\";i:281;s:1:\"b\";s:13:\"task_statuses\";s:1:\"c\";s:18:\"view-task-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"View Task Statuses\";s:1:\"f\";s:18:\"View Task Statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:281;a:7:{s:1:\"a\";i:282;s:1:\"b\";s:13:\"task_statuses\";s:1:\"c\";s:20:\"create-task-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Create Task Statuses\";s:1:\"f\";s:24:\"Can create task statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:282;a:7:{s:1:\"a\";i:283;s:1:\"b\";s:13:\"task_statuses\";s:1:\"c\";s:18:\"edit-task-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:18:\"Edit Task Statuses\";s:1:\"f\";s:22:\"Can edit task statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:283;a:7:{s:1:\"a\";i:284;s:1:\"b\";s:13:\"task_statuses\";s:1:\"c\";s:20:\"delete-task-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:20:\"Delete Task Statuses\";s:1:\"f\";s:24:\"Can delete task statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:284;a:7:{s:1:\"a\";i:285;s:1:\"b\";s:13:\"task_statuses\";s:1:\"c\";s:27:\"toggle-status-task-statuses\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"Toggle Status Task Statuses\";s:1:\"f\";s:31:\"Can toggle status task statuses\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:285;a:7:{s:1:\"a\";i:286;s:1:\"b\";s:8:\"meetings\";s:1:\"c\";s:15:\"manage-meetings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Manage Meetings\";s:1:\"f\";s:19:\"Can manage meetings\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:286;a:7:{s:1:\"a\";i:287;s:1:\"b\";s:8:\"meetings\";s:1:\"c\";s:13:\"view-meetings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"View Meetings\";s:1:\"f\";s:13:\"View Meetings\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:287;a:7:{s:1:\"a\";i:288;s:1:\"b\";s:8:\"meetings\";s:1:\"c\";s:15:\"create-meetings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Create Meetings\";s:1:\"f\";s:19:\"Can create meetings\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:288;a:7:{s:1:\"a\";i:289;s:1:\"b\";s:8:\"meetings\";s:1:\"c\";s:13:\"edit-meetings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Edit Meetings\";s:1:\"f\";s:17:\"Can edit meetings\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:289;a:7:{s:1:\"a\";i:290;s:1:\"b\";s:8:\"meetings\";s:1:\"c\";s:15:\"delete-meetings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:15:\"Delete Meetings\";s:1:\"f\";s:19:\"Can delete meetings\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:290;a:7:{s:1:\"a\";i:291;s:1:\"b\";s:8:\"meetings\";s:1:\"c\";s:22:\"toggle-status-meetings\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:22:\"Toggle Status Meetings\";s:1:\"f\";s:26:\"Can toggle status meetings\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:291;a:7:{s:1:\"a\";i:292;s:1:\"b\";s:5:\"calls\";s:1:\"c\";s:12:\"manage-calls\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Manage Calls\";s:1:\"f\";s:16:\"Can manage calls\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:292;a:7:{s:1:\"a\";i:293;s:1:\"b\";s:5:\"calls\";s:1:\"c\";s:10:\"view-calls\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"View Calls\";s:1:\"f\";s:10:\"View Calls\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:293;a:7:{s:1:\"a\";i:294;s:1:\"b\";s:5:\"calls\";s:1:\"c\";s:12:\"create-calls\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Create Calls\";s:1:\"f\";s:16:\"Can create calls\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:294;a:7:{s:1:\"a\";i:295;s:1:\"b\";s:5:\"calls\";s:1:\"c\";s:10:\"edit-calls\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:10:\"Edit Calls\";s:1:\"f\";s:14:\"Can edit calls\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:295;a:7:{s:1:\"a\";i:296;s:1:\"b\";s:5:\"calls\";s:1:\"c\";s:12:\"delete-calls\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:12:\"Delete Calls\";s:1:\"f\";s:16:\"Can delete calls\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:296;a:7:{s:1:\"a\";i:297;s:1:\"b\";s:5:\"calls\";s:1:\"c\";s:19:\"toggle-status-calls\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Toggle Status Calls\";s:1:\"f\";s:23:\"Can toggle status calls\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:297;a:7:{s:1:\"a\";i:298;s:1:\"b\";s:16:\"document_folders\";s:1:\"c\";s:23:\"manage-document-folders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Manage Document Folders\";s:1:\"f\";s:27:\"Can manage document folders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:298;a:7:{s:1:\"a\";i:299;s:1:\"b\";s:16:\"document_folders\";s:1:\"c\";s:21:\"view-document-folders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"View Document Folders\";s:1:\"f\";s:21:\"View Document Folders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:299;a:7:{s:1:\"a\";i:300;s:1:\"b\";s:16:\"document_folders\";s:1:\"c\";s:23:\"create-document-folders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Create Document Folders\";s:1:\"f\";s:27:\"Can create document folders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:300;a:7:{s:1:\"a\";i:301;s:1:\"b\";s:16:\"document_folders\";s:1:\"c\";s:21:\"edit-document-folders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Edit Document Folders\";s:1:\"f\";s:25:\"Can edit document folders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:301;a:7:{s:1:\"a\";i:302;s:1:\"b\";s:16:\"document_folders\";s:1:\"c\";s:23:\"delete-document-folders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Delete Document Folders\";s:1:\"f\";s:27:\"Can delete document folders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:302;a:7:{s:1:\"a\";i:303;s:1:\"b\";s:16:\"document_folders\";s:1:\"c\";s:30:\"toggle-status-document-folders\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:30:\"Toggle Status Document Folders\";s:1:\"f\";s:34:\"Can toggle status document folders\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:303;a:7:{s:1:\"a\";i:304;s:1:\"b\";s:14:\"document_types\";s:1:\"c\";s:21:\"manage-document-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Manage Document Types\";s:1:\"f\";s:25:\"Can manage document types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:304;a:7:{s:1:\"a\";i:305;s:1:\"b\";s:14:\"document_types\";s:1:\"c\";s:19:\"view-document-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"View Document Types\";s:1:\"f\";s:19:\"View Document Types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:305;a:7:{s:1:\"a\";i:306;s:1:\"b\";s:14:\"document_types\";s:1:\"c\";s:21:\"create-document-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Create Document Types\";s:1:\"f\";s:25:\"Can create document types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:306;a:7:{s:1:\"a\";i:307;s:1:\"b\";s:14:\"document_types\";s:1:\"c\";s:19:\"edit-document-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:19:\"Edit Document Types\";s:1:\"f\";s:23:\"Can edit document types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:307;a:7:{s:1:\"a\";i:308;s:1:\"b\";s:14:\"document_types\";s:1:\"c\";s:21:\"delete-document-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:21:\"Delete Document Types\";s:1:\"f\";s:25:\"Can delete document types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:308;a:7:{s:1:\"a\";i:309;s:1:\"b\";s:14:\"document_types\";s:1:\"c\";s:28:\"toggle-status-document-types\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:28:\"Toggle Status Document Types\";s:1:\"f\";s:32:\"Can toggle status document types\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:309;a:7:{s:1:\"a\";i:310;s:1:\"b\";s:9:\"documents\";s:1:\"c\";s:16:\"manage-documents\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Manage Documents\";s:1:\"f\";s:20:\"Can manage documents\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:310;a:7:{s:1:\"a\";i:311;s:1:\"b\";s:9:\"documents\";s:1:\"c\";s:14:\"view-documents\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"View Documents\";s:1:\"f\";s:14:\"View Documents\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:311;a:7:{s:1:\"a\";i:312;s:1:\"b\";s:9:\"documents\";s:1:\"c\";s:16:\"create-documents\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Create Documents\";s:1:\"f\";s:20:\"Can create documents\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:312;a:7:{s:1:\"a\";i:313;s:1:\"b\";s:9:\"documents\";s:1:\"c\";s:14:\"edit-documents\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Edit Documents\";s:1:\"f\";s:18:\"Can edit documents\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:313;a:7:{s:1:\"a\";i:314;s:1:\"b\";s:9:\"documents\";s:1:\"c\";s:16:\"delete-documents\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:16:\"Delete Documents\";s:1:\"f\";s:20:\"Can delete documents\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:314;a:7:{s:1:\"a\";i:315;s:1:\"b\";s:9:\"documents\";s:1:\"c\";s:23:\"toggle-status-documents\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:23:\"Toggle Status Documents\";s:1:\"f\";s:27:\"Can toggle status documents\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:315;a:7:{s:1:\"a\";i:316;s:1:\"b\";s:7:\"reports\";s:1:\"c\";s:14:\"manage-reports\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:14:\"Manage Reports\";s:1:\"f\";s:18:\"Can manage reports\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:316;a:7:{s:1:\"a\";i:317;s:1:\"b\";s:22:\"notification_templates\";s:1:\"c\";s:29:\"manage-notification-templates\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:29:\"Manage Notification Templates\";s:1:\"f\";s:33:\"Can manage notification templates\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:317;a:7:{s:1:\"a\";i:318;s:1:\"b\";s:22:\"notification_templates\";s:1:\"c\";s:27:\"view-notification-templates\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"View Notification Templates\";s:1:\"f\";s:27:\"View Notification Templates\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:318;a:7:{s:1:\"a\";i:319;s:1:\"b\";s:22:\"notification_templates\";s:1:\"c\";s:29:\"create-notification-templates\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:29:\"Create Notification Templates\";s:1:\"f\";s:33:\"Can create notification templates\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:319;a:7:{s:1:\"a\";i:320;s:1:\"b\";s:22:\"notification_templates\";s:1:\"c\";s:27:\"edit-notification-templates\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:27:\"Edit Notification Templates\";s:1:\"f\";s:31:\"Can edit notification templates\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:320;a:7:{s:1:\"a\";i:321;s:1:\"b\";s:22:\"notification_templates\";s:1:\"c\";s:29:\"delete-notification-templates\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:29:\"Delete Notification Templates\";s:1:\"f\";s:33:\"Can delete notification templates\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}}s:5:\"roles\";a:3:{i:0;a:6:{s:1:\"a\";i:1;s:1:\"c\";s:10:\"superadmin\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:11:\"Super Admin\";s:1:\"f\";s:43:\"Super Admin has full access to all features\";s:1:\"j\";N;}i:1;a:6:{s:1:\"a\";i:2;s:1:\"c\";s:7:\"company\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:7:\"Company\";s:1:\"f\";s:38:\"Company has access to manage buissness\";s:1:\"j\";N;}i:2;a:6:{s:1:\"a\";i:3;s:1:\"c\";s:13:\"sales-manager\";s:1:\"d\";s:3:\"web\";s:1:\"e\";s:13:\"Sales Manager\";s:1:\"f\";s:51:\"Sales Manager has access to manage sales operations\";s:1:\"j\";i:2;}}}', 1766328472);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('cyzor_cache_active_storage_config_1', 'a:5:{s:4:\"disk\";s:6:\"public\";s:18:\"allowed_file_types\";s:37:\"jpg,png,webp,gif,pdf,doc,docx,txt,csv\";s:16:\"max_file_size_mb\";i:2048;s:2:\"s3\";a:6:{s:3:\"key\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:6:\"bucket\";s:0:\"\";s:6:\"region\";s:9:\"us-east-1\";s:3:\"url\";s:0:\"\";s:8:\"endpoint\";s:0:\"\";}s:6:\"wasabi\";a:6:{s:3:\"key\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:6:\"bucket\";s:0:\"\";s:6:\"region\";s:9:\"us-east-1\";s:3:\"url\";s:0:\"\";s:4:\"root\";s:0:\"\";}}', 1766271288);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `calls`
--

DROP TABLE IF EXISTS `calls`;
CREATE TABLE IF NOT EXISTS `calls` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `parent_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('planned','held','not_held') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'planned',
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calls_created_by_foreign` (`created_by`),
  KEY `calls_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `call_attendees`
--

DROP TABLE IF EXISTS `call_attendees`;
CREATE TABLE IF NOT EXISTS `call_attendees` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `call_id` bigint UNSIGNED NOT NULL,
  `attendee_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendee_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `call_attendees_call_id_foreign` (`call_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `actual_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `expected_response` int NOT NULL DEFAULT '0',
  `actual_response` int NOT NULL DEFAULT '0',
  `campaign_type_id` bigint UNSIGNED NOT NULL,
  `target_list_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_campaign_type_id_foreign` (`campaign_type_id`),
  KEY `campaigns_target_list_id_foreign` (`target_list_id`),
  KEY `campaigns_created_by_foreign` (`created_by`),
  KEY `campaigns_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `campaign_types`
--

DROP TABLE IF EXISTS `campaign_types`;
CREATE TABLE IF NOT EXISTS `campaign_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_types_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cases`
--

DROP TABLE IF EXISTS `cases`;
CREATE TABLE IF NOT EXISTS `cases` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('new','in_progress','pending','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `case_type` enum('support','bug','feature_request','complaint','inquiry') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'support',
  `account_id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cases_account_id_foreign` (`account_id`),
  KEY `cases_contact_id_foreign` (`contact_id`),
  KEY `cases_created_by_foreign` (`created_by`),
  KEY `cases_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `account_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_account_id_foreign` (`account_id`),
  KEY `contacts_created_by_foreign` (`created_by`),
  KEY `contacts_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('percentage','flat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_spend` decimal(10,2) DEFAULT NULL,
  `maximum_spend` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `use_limit_per_coupon` int DEFAULT NULL,
  `use_limit_per_user` int DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_type` enum('manual','auto') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`),
  KEY `coupons_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_code_unique` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `description`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Real', 'BRL', 'R$', NULL, 1, '2025-12-20 19:36:37', '2025-12-20 19:36:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `delivery_orders`
--

DROP TABLE IF EXISTS `delivery_orders`;
CREATE TABLE IF NOT EXISTS `delivery_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `delivery_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_order_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_provider_type_id` bigint UNSIGNED DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `delivery_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `status` enum('pending','in_transit','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `tracking_number` text COLLATE utf8mb4_unicode_ci,
  `delivery_notes` text COLLATE utf8mb4_unicode_ci,
  `total_weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_orders_delivery_number_unique` (`delivery_number`),
  KEY `delivery_orders_sales_order_id_foreign` (`sales_order_id`),
  KEY `delivery_orders_account_id_foreign` (`account_id`),
  KEY `delivery_orders_contact_id_foreign` (`contact_id`),
  KEY `delivery_orders_shipping_provider_type_id_foreign` (`shipping_provider_type_id`),
  KEY `delivery_orders_assigned_to_foreign` (`assigned_to`),
  KEY `delivery_orders_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `delivery_order_products`
--

DROP TABLE IF EXISTS `delivery_order_products`;
CREATE TABLE IF NOT EXISTS `delivery_order_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `delivery_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_order_products_delivery_order_id_foreign` (`delivery_order_id`),
  KEY `delivery_order_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `folder_id` bigint UNSIGNED DEFAULT NULL,
  `type_id` bigint UNSIGNED DEFAULT NULL,
  `opportunity_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `publish_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_account_id_foreign` (`account_id`),
  KEY `documents_folder_id_foreign` (`folder_id`),
  KEY `documents_type_id_foreign` (`type_id`),
  KEY `documents_opportunity_id_foreign` (`opportunity_id`),
  KEY `documents_created_by_foreign` (`created_by`),
  KEY `documents_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `document_folders`
--

DROP TABLE IF EXISTS `document_folders`;
CREATE TABLE IF NOT EXISTS `document_folders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_folder_id` bigint UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_folders_parent_folder_id_foreign` (`parent_folder_id`),
  KEY `document_folders_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `document_types`
--

DROP TABLE IF EXISTS `document_types`;
CREATE TABLE IF NOT EXISTS `document_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_types_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'User Created', 'Support Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(2, 'Lead Assigned', 'Sales Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(3, 'Lead Moved', 'Sales Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(4, 'Quote Created', 'Sales Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(5, 'Quote Status Changed', 'Sales Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(6, 'Task Assigned', 'Project Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(7, 'Meeting Invitation', 'Meeting Organizer', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(8, 'Case Created', 'Support Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(9, 'Opportunity Created', 'Sales Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(10, 'Opportunity Status Changed', 'Sales Team', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_template_langs`
--

DROP TABLE IF EXISTS `email_template_langs`;
CREATE TABLE IF NOT EXISTS `email_template_langs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_template_langs_parent_id_foreign` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Welcome to our platform - {user_name}', '<p>Hello {user_name},</p><p>Your account has been successfully created.</p><p><strong>Login Details:</strong></p><ul><li>Website: {app_url}</li><li>Email: {user_email}</li><li>Password: {user_password}</li><li>Account Type: {user_type}</li></ul><p>Please keep this information secure.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(2, 1, 'es', 'Bienvenido a nuestra plataforma - {user_name}', '<p>Hola {user_name},</p><p>Su cuenta ha sido creada exitosamente.</p><p><strong>Detalles de acceso:</strong></p><ul><li>Sitio web: {app_url}</li><li>Email: {user_email}</li><li>Contraseña: {user_password}</li><li>Tipo de cuenta: {user_type}</li></ul><p>Por favor mantenga esta información segura.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(3, 1, 'ar', 'مرحباً بك في منصتنا - {user_name}', '<p>مرحباً {user_name}،</p><p>تم إنشاء حسابك بنجاح.</p><p><strong>تفاصيل تسجيل الدخول:</strong></p><ul><li>الموقع: {app_url}</li><li>البريد الإلكتروني: {user_email}</li><li>كلمة المرور: {user_password}</li><li>نوع الحساب: {user_type}</li></ul><p>يرجى الاحتفاظ بهذه المعلومات آمنة.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(4, 1, 'da', 'Velkommen til vores platform - {user_name}', '<p>Hej {user_name},</p><p>Din konto er blevet oprettet med succes.</p><p><strong>Login detaljer:</strong></p><ul><li>Hjemmeside: {app_url}</li><li>Email: {user_email}</li><li>Adgangskode: {user_password}</li><li>Kontotype: {user_type}</li></ul><p>Hold venligst disse oplysninger sikre.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(5, 1, 'de', 'Willkommen auf unserer Plattform - {user_name}', '<p>Hallo {user_name},</p><p>Ihr Konto wurde erfolgreich erstellt.</p><p><strong>Anmeldedaten:</strong></p><ul><li>Website: {app_url}</li><li>E-Mail: {user_email}</li><li>Passwort: {user_password}</li><li>Kontotyp: {user_type}</li></ul><p>Bitte bewahren Sie diese Informationen sicher auf.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(6, 1, 'fr', 'Bienvenue sur notre plateforme - {user_name}', '<p>Bonjour {user_name},</p><p>Votre compte a été créé avec succès.</p><p><strong>Détails de connexion:</strong></p><ul><li>Site web: {app_url}</li><li>Email: {user_email}</li><li>Mot de passe: {user_password}</li><li>Type de compte: {user_type}</li></ul><p>Veuillez garder ces informations en sécurité.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(7, 1, 'he', 'ברוכים הבאים לפלטפורמה שלנו - {user_name}', '<p>שלום {user_name},</p><p>החשבון שלך נוצר בהצלחה.</p><p><strong>פרטי התחברות:</strong></p><ul><li>אתר: {app_url}</li><li>אימייל: {user_email}</li><li>סיסמה: {user_password}</li><li>סוג חשבון: {user_type}</li></ul><p>אנא שמרו על המידע הזה בבטחה.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(8, 1, 'it', 'Benvenuto sulla nostra piattaforma - {user_name}', '<p>Ciao {user_name},</p><p>Il tuo account è stato creato con successo.</p><p><strong>Dettagli di accesso:</strong></p><ul><li>Sito web: {app_url}</li><li>Email: {user_email}</li><li>Password: {user_password}</li><li>Tipo di account: {user_type}</li></ul><p>Si prega di mantenere queste informazioni al sicuro.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(9, 1, 'ja', 'プラットフォームへようこそ - {user_name}', '<p>こんにちは {user_name}さん、</p><p>アカウントが正常に作成されました。</p><p><strong>ログイン詳細:</strong></p><ul><li>ウェブサイト: {app_url}</li><li>メール: {user_email}</li><li>パスワード: {user_password}</li><li>アカウントタイプ: {user_type}</li></ul><p>この情報を安全に保管してください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(10, 1, 'nl', 'Welkom op ons platform - {user_name}', '<p>Hallo {user_name},</p><p>Uw account is succesvol aangemaakt.</p><p><strong>Inloggegevens:</strong></p><ul><li>Website: {app_url}</li><li>Email: {user_email}</li><li>Wachtwoord: {user_password}</li><li>Accounttype: {user_type}</li></ul><p>Houd deze informatie veilig.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(11, 1, 'pl', 'Witamy na naszej platformie - {user_name}', '<p>Witaj {user_name},</p><p>Twoje konto zostało pomyślnie utworzone.</p><p><strong>Szczegóły logowania:</strong></p><ul><li>Strona internetowa: {app_url}</li><li>Email: {user_email}</li><li>Hasło: {user_password}</li><li>Typ konta: {user_type}</li></ul><p>Prosimy o bezpieczne przechowywanie tych informacji.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(12, 1, 'pt', 'Bem-vindo à nossa plataforma - {user_name}', '<p>Olá {user_name},</p><p>A sua conta foi criada com sucesso.</p><p><strong>Detalhes de login:</strong></p><ul><li>Website: {app_url}</li><li>Email: {user_email}</li><li>Palavra-passe: {user_password}</li><li>Tipo de conta: {user_type}</li></ul><p>Por favor, mantenha esta informação segura.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(13, 1, 'pt-BR', 'Bem-vindo à nossa plataforma - {user_name}', '<p>Olá {user_name},</p><p>Sua conta foi criada com sucesso.</p><p><strong>Detalhes de login:</strong></p><ul><li>Website: {app_url}</li><li>Email: {user_email}</li><li>Senha: {user_password}</li><li>Tipo de conta: {user_type}</li></ul><p>Por favor, mantenha essas informações seguras.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(14, 1, 'ru', 'Добро пожаловать на нашу платформу - {user_name}', '<p>Привет {user_name},</p><p>Ваш аккаунт был успешно создан.</p><p><strong>Данные для входа:</strong></p><ul><li>Веб-сайт: {app_url}</li><li>Email: {user_email}</li><li>Пароль: {user_password}</li><li>Тип аккаунта: {user_type}</li></ul><p>Пожалуйста, храните эту информацию в безопасности.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(15, 1, 'tr', 'Platformumuza hoş geldiniz - {user_name}', '<p>Merhaba {user_name},</p><p>Hesabınız başarıyla oluşturuldu.</p><p><strong>Giriş Detayları:</strong></p><ul><li>Website: {app_url}</li><li>Email: {user_email}</li><li>Şifre: {user_password}</li><li>Hesap Türü: {user_type}</li></ul><p>Lütfen bu bilgileri güvenli tutun.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(16, 1, 'zh', '欢迎来到我们的平台 - {user_name}', '<p>你好 {user_name}，</p><p>您的账户已成功创建。</p><p><strong>登录详情：</strong></p><ul><li>网站：{app_url}</li><li>邮箱：{user_email}</li><li>密码：{user_password}</li><li>账户类型：{user_type}</li></ul><p>请妥善保管这些信息。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(17, 2, 'en', 'New Lead Assigned to You - {lead_name}', '<p>Hello {assigned_user_name},</p><p>A new lead has been assigned to you. Please review the details below and follow up accordingly.</p><p><strong>Lead Details:</strong></p><ul><li>Name: {lead_name}</li><li>Email: {lead_email}</li><li>Phone: {lead_phone}</li><li>Company: {lead_company}</li></ul><p>Please contact this lead as soon as possible to maximize conversion opportunities.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(18, 2, 'es', 'Nuevo Lead Asignado - {lead_name}', '<p>Hola {assigned_user_name},</p><p>Se le ha asignado un nuevo lead. Por favor revise los detalles a continuación y haga el seguimiento correspondiente.</p><p><strong>Detalles del Lead:</strong></p><ul><li>Nombre: {lead_name}</li><li>Email: {lead_email}</li><li>Teléfono: {lead_phone}</li><li>Empresa: {lead_company}</li></ul><p>Por favor contacte a este lead lo antes posible para maximizar las oportunidades de conversión.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(19, 2, 'ar', 'تم تعيين عميل محتمل جديد - {lead_name}', '<p>مرحباً {assigned_user_name}،</p><p>تم تعيين عميل محتمل جديد لك. يرجى مراجعة التفاصيل أدناه والمتابعة وفقاً لذلك.</p><p><strong>تفاصيل العميل المحتمل:</strong></p><ul><li>الاسم: {lead_name}</li><li>البريد الإلكتروني: {lead_email}</li><li>الهاتف: {lead_phone}</li><li>الشركة: {lead_company}</li></ul><p>يرجى التواصل مع هذا العميل المحتمل في أقرب وقت ممكن لتعظيم فرص التحويل.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(20, 2, 'da', 'Nyt Lead Tildelt - {lead_name}', '<p>Hej {assigned_user_name},</p><p>Et nyt lead er blevet tildelt til dig. Gennemgå venligst detaljerne nedenfor og følg op i overensstemmelse hermed.</p><p><strong>Lead Detaljer:</strong></p><ul><li>Navn: {lead_name}</li><li>Email: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Virksomhed: {lead_company}</li></ul><p>Kontakt venligst dette lead så hurtigt som muligt for at maksimere konverteringsmuligheder.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(21, 2, 'de', 'Neuer Lead zugewiesen - {lead_name}', '<p>Hallo {assigned_user_name},</p><p>Ein neuer Lead wurde Ihnen zugewiesen. Bitte überprüfen Sie die Details unten und folgen Sie entsprechend nach.</p><p><strong>Lead Details:</strong></p><ul><li>Name: {lead_name}</li><li>E-Mail: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Unternehmen: {lead_company}</li></ul><p>Bitte kontaktieren Sie diesen Lead so schnell wie möglich, um die Konvertierungsmöglichkeiten zu maximieren.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(22, 2, 'fr', 'Nouveau Lead Assigné - {lead_name}', '<p>Bonjour {assigned_user_name},</p><p>Un nouveau lead vous a été assigné. Veuillez examiner les détails ci-dessous et faire le suivi en conséquence.</p><p><strong>Détails du Lead:</strong></p><ul><li>Nom: {lead_name}</li><li>Email: {lead_email}</li><li>Téléphone: {lead_phone}</li><li>Entreprise: {lead_company}</li></ul><p>Veuillez contacter ce lead dès que possible pour maximiser les opportunités de conversion.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(23, 2, 'he', 'ליד חדש הוקצה - {lead_name}', '<p>שלום {assigned_user_name},</p><p>ליד חדש הוקצה לך. אנא עיין בפרטים להלן ועשה מעקב בהתאם.</p><p><strong>פרטי הליד:</strong></p><ul><li>שם: {lead_name}</li><li>אימייל: {lead_email}</li><li>טלפון: {lead_phone}</li><li>חברה: {lead_company}</li></ul><p>אנא צור קשר עם הליד הזה בהקדם האפשרי כדי למקסם את הזדמנויות ההמרה.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(24, 2, 'it', 'Nuovo Lead Assegnato - {lead_name}', '<p>Ciao {assigned_user_name},</p><p>Un nuovo lead ti è stato assegnato. Si prega di rivedere i dettagli qui sotto e seguire di conseguenza.</p><p><strong>Dettagli Lead:</strong></p><ul><li>Nome: {lead_name}</li><li>Email: {lead_email}</li><li>Telefono: {lead_phone}</li><li>Azienda: {lead_company}</li></ul><p>Si prega di contattare questo lead il prima possibile per massimizzare le opportunità di conversione.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(25, 2, 'ja', '新しいリードが割り当てられました - {lead_name}', '<p>こんにちは {assigned_user_name}さん、</p><p>新しいリードがあなたに割り当てられました。以下の詳細を確認し、適切にフォローアップしてください。</p><p><strong>リード詳細:</strong></p><ul><li>名前: {lead_name}</li><li>メール: {lead_email}</li><li>電話: {lead_phone}</li><li>会社: {lead_company}</li></ul><p>コンバージョンの機会を最大化するために、できるだけ早くこのリードに連絡してください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(26, 2, 'nl', 'Nieuwe Lead Toegewezen - {lead_name}', '<p>Hallo {assigned_user_name},</p><p>Een nieuwe lead is aan je toegewezen. Bekijk de details hieronder en volg dienovereenkomstig op.</p><p><strong>Lead Details:</strong></p><ul><li>Naam: {lead_name}</li><li>Email: {lead_email}</li><li>Telefoon: {lead_phone}</li><li>Bedrijf: {lead_company}</li></ul><p>Neem zo snel mogelijk contact op met deze lead om conversiekansen te maximaliseren.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(27, 2, 'pl', 'Nowy Lead Przypisany - {lead_name}', '<p>Witaj {assigned_user_name},</p><p>Nowy lead został Ci przypisany. Przejrzyj szczegóły poniżej i podejmij odpowiednie działania.</p><p><strong>Szczegóły Lead:</strong></p><ul><li>Nazwa: {lead_name}</li><li>Email: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Firma: {lead_company}</li></ul><p>Skontaktuj się z tym leadem jak najszybciej, aby zmaksymalizować możliwości konwersji.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(28, 2, 'pt', 'Novo Lead Atribuído - {lead_name}', '<p>Olá {assigned_user_name},</p><p>Um novo lead foi atribuído a si. Por favor, reveja os detalhes abaixo e faça o seguimento em conformidade.</p><p><strong>Detalhes do Lead:</strong></p><ul><li>Nome: {lead_name}</li><li>Email: {lead_email}</li><li>Telefone: {lead_phone}</li><li>Empresa: {lead_company}</li></ul><p>Por favor, contacte este lead o mais rapidamente possível para maximizar as oportunidades de conversão.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(29, 2, 'pt-BR', 'Novo Lead Atribuído - {lead_name}', '<p>Olá {assigned_user_name},</p><p>Um novo lead foi atribuído a você. Por favor, revise os detalhes abaixo e faça o acompanhamento adequadamente.</p><p><strong>Detalhes do Lead:</strong></p><ul><li>Nome: {lead_name}</li><li>Email: {lead_email}</li><li>Telefone: {lead_phone}</li><li>Empresa: {lead_company}</li></ul><p>Por favor, entre em contato com este lead o mais rápido possível para maximizar as oportunidades de conversão.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(30, 2, 'ru', 'Новый лид назначен - {lead_name}', '<p>Привет {assigned_user_name},</p><p>Вам назначен новый лид. Пожалуйста, просмотрите детали ниже и проведите соответствующие действия.</p><p><strong>Детали лида:</strong></p><ul><li>Имя: {lead_name}</li><li>Email: {lead_email}</li><li>Телефон: {lead_phone}</li><li>Компания: {lead_company}</li></ul><p>Пожалуйста, свяжитесь с этим лидом как можно скорее, чтобы максимизировать возможности конверсии.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(31, 2, 'tr', 'Yeni Müşteri Adayı Atandı - {lead_name}', '<p>Merhaba {assigned_user_name},</p><p>Size yeni bir müşteri adayı atandı. Lütfen aşağıdaki detayları inceleyin ve buna göre takip edin.</p><p><strong>Müşteri Adayı Detayları:</strong></p><ul><li>Ad: {lead_name}</li><li>Email: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Şirket: {lead_company}</li></ul><p>Dönüşüm fırsatlarını maksimize etmek için lütfen bu müşteri adayıyla mümkün olan en kısa sürede iletişime geçin.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(32, 2, 'zh', '新的潜在客户已分配 - {lead_name}', '<p>你好 {assigned_user_name}，</p><p>一个新的潜在客户已分配给您。请查看以下详细信息并相应进行跟进。</p><p><strong>潜在客户详情：</strong></p><ul><li>姓名：{lead_name}</li><li>邮箱：{lead_email}</li><li>电话：{lead_phone}</li><li>公司：{lead_company}</li></ul><p>请尽快与这个潜在客户联系，以最大化转化机会。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(33, 3, 'en', 'Lead Moved - {lead_name}', '<p>Hello {assigned_user_name},</p><p>The lead <strong>{lead_name}</strong> has been moved from <strong>{old_lead_stage}</strong> to <strong>{new_lead_stage}</strong>. Please review the details below and follow up accordingly.</p><p><strong>Lead Details:</strong></p><ul><li>Name: {lead_name}</li><li>Email: {lead_email}</li><li>Phone: {lead_phone}</li><li>Company: {lead_company}</li></ul><p>Thank you for your continued hard work and dedication.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(34, 3, 'es', 'Lead Movido - {lead_name}', '<p>Hola {assigned_user_name},</p><p>El lead <strong>{lead_name}</strong> ha sido movido de <strong>{old_lead_stage}</strong> a <strong>{new_lead_stage}</strong>. Por favor, revisa los detalles a continuación y haz el seguimiento correspondiente.</p><p><strong>Detalles del Lead:</strong></p><ul><li>Nombre: {lead_name}</li><li>Correo electrónico: {lead_email}</li><li>Teléfono: {lead_phone}</li><li>Empresa: {lead_company}</li></ul><p>Gracias por tu continuo esfuerzo y dedicación.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(35, 3, 'ar', 'تم نقل العميل المحتمل - {lead_name}', '<p>مرحباً {assigned_user_name}،</p><p>تم نقل العميل المحتمل <strong>{lead_name}</strong> من <strong>{old_lead_stage}</strong> إلى <strong>{new_lead_stage}</strong>. يرجى مراجعة التفاصيل أدناه والمتابعة وفقاً لذلك.</p><p><strong>تفاصيل العميل المحتمل:</strong></p><ul><li>الاسم: {lead_name}</li><li>البريد الإلكتروني: {lead_email}</li><li>الهاتف: {lead_phone}</li><li>الشركة: {lead_company}</li></ul><p>شكراً لك على جهدك وتفانيك المستمر.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(36, 3, 'da', 'Lead Flyttet - {lead_name}', '<p>Hej {assigned_user_name},</p><p>Lead <strong>{lead_name}</strong> er blevet flyttet fra <strong>{old_lead_stage}</strong> til <strong>{new_lead_stage}</strong>. Gennemgå venligst detaljerne nedenfor og følg op i overensstemmelse hermed.</p><p><strong>Lead Detaljer:</strong></p><ul><li>Navn: {lead_name}</li><li>Email: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Virksomhed: {lead_company}</li></ul><p>Tak for dit fortsatte hårde arbejde og dedikation.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(37, 3, 'de', 'Lead verschoben - {lead_name}', '<p>Hallo {assigned_user_name},</p><p>Der Lead <strong>{lead_name}</strong> wurde von <strong>{old_lead_stage}</strong> zu <strong>{new_lead_stage}</strong> verschoben. Bitte überprüfen Sie die Details unten und folgen Sie entsprechend nach.</p><p><strong>Lead Details:</strong></p><ul><li>Name: {lead_name}</li><li>E-Mail: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Unternehmen: {lead_company}</li></ul><p>Vielen Dank für Ihre kontinuierliche harte Arbeit und Ihr Engagement.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(38, 3, 'fr', 'Lead Déplacé - {lead_name}', '<p>Bonjour {assigned_user_name},</p><p>Le lead <strong>{lead_name}</strong> a été déplacé de <strong>{old_lead_stage}</strong> vers <strong>{new_lead_stage}</strong>. Veuillez examiner les détails ci-dessous et faire le suivi en conséquence.</p><p><strong>Détails du Lead:</strong></p><ul><li>Nom: {lead_name}</li><li>Email: {lead_email}</li><li>Téléphone: {lead_phone}</li><li>Entreprise: {lead_company}</li></ul><p>Merci pour votre travail acharné et votre dévouement continus.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(39, 3, 'he', 'ליד הועבר - {lead_name}', '<p>שלום {assigned_user_name},</p><p>הליד <strong>{lead_name}</strong> הועבר מ-<strong>{old_lead_stage}</strong> ל-<strong>{new_lead_stage}</strong>. אנא עיין בפרטים להלן ועשה מעקב בהתאם.</p><p><strong>פרטי הליד:</strong></p><ul><li>שם: {lead_name}</li><li>אימייל: {lead_email}</li><li>טלפון: {lead_phone}</li><li>חברה: {lead_company}</li></ul><p>תודה על העבודה הקשה והמסירות המתמשכת.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(40, 3, 'it', 'Lead Spostato - {lead_name}', '<p>Ciao {assigned_user_name},</p><p>Il lead <strong>{lead_name}</strong> è stato spostato da <strong>{old_lead_stage}</strong> a <strong>{new_lead_stage}</strong>. Si prega di rivedere i dettagli qui sotto e seguire di conseguenza.</p><p><strong>Dettagli Lead:</strong></p><ul><li>Nome: {lead_name}</li><li>Email: {lead_email}</li><li>Telefono: {lead_phone}</li><li>Azienda: {lead_company}</li></ul><p>Grazie per il tuo continuo duro lavoro e dedizione.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(41, 3, 'ja', 'リードが移動されました - {lead_name}', '<p>こんにちは {assigned_user_name}さん、</p><p>リード <strong>{lead_name}</strong> が <strong>{old_lead_stage}</strong> から <strong>{new_lead_stage}</strong> に移動されました。以下の詳細を確認し、適切にフォローアップしてください。</p><p><strong>リード詳細:</strong></p><ul><li>名前: {lead_name}</li><li>メール: {lead_email}</li><li>電話: {lead_phone}</li><li>会社: {lead_company}</li></ul><p>継続的な努力と献身に感謝します。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(42, 3, 'nl', 'Lead Verplaatst - {lead_name}', '<p>Hallo {assigned_user_name},</p><p>De lead <strong>{lead_name}</strong> is verplaatst van <strong>{old_lead_stage}</strong> naar <strong>{new_lead_stage}</strong>. Bekijk de details hieronder en volg dienovereenkomstig op.</p><p><strong>Lead Details:</strong></p><ul><li>Naam: {lead_name}</li><li>Email: {lead_email}</li><li>Telefoon: {lead_phone}</li><li>Bedrijf: {lead_company}</li></ul><p>Bedankt voor je voortdurende harde werk en toewijding.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(43, 3, 'pl', 'Lead Przeniesiony - {lead_name}', '<p>Witaj {assigned_user_name},</p><p>Lead <strong>{lead_name}</strong> został przeniesiony z <strong>{old_lead_stage}</strong> do <strong>{new_lead_stage}</strong>. Przejrzyj szczegóły poniżej i podejmij odpowiednie działania.</p><p><strong>Szczegóły Lead:</strong></p><ul><li>Nazwa: {lead_name}</li><li>Email: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Firma: {lead_company}</li></ul><p>Dziękuję za Twoją ciągłą ciężką pracę i zaangażowanie.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(44, 3, 'pt', 'Lead Movido - {lead_name}', '<p>Olá {assigned_user_name},</p><p>O lead <strong>{lead_name}</strong> foi movido de <strong>{old_lead_stage}</strong> para <strong>{new_lead_stage}</strong>. Por favor, reveja os detalhes abaixo e faça o seguimento em conformidade.</p><p><strong>Detalhes do Lead:</strong></p><ul><li>Nome: {lead_name}</li><li>Email: {lead_email}</li><li>Telefone: {lead_phone}</li><li>Empresa: {lead_company}</li></ul><p>Obrigado pelo seu trabalho árduo e dedicação contínuos.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(45, 3, 'pt-BR', 'Lead Movido - {lead_name}', '<p>Olá {assigned_user_name},</p><p>O lead <strong>{lead_name}</strong> foi movido de <strong>{old_lead_stage}</strong> para <strong>{new_lead_stage}</strong>. Por favor, revise os detalhes abaixo e faça o acompanhamento adequadamente.</p><p><strong>Detalhes do Lead:</strong></p><ul><li>Nome: {lead_name}</li><li>Email: {lead_email}</li><li>Telefone: {lead_phone}</li><li>Empresa: {lead_company}</li></ul><p>Obrigado pelo seu trabalho árduo e dedicação contínuos.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(46, 3, 'ru', 'Лид перемещен - {lead_name}', '<p>Привет {assigned_user_name},</p><p>Лид <strong>{lead_name}</strong> был перемещен с <strong>{old_lead_stage}</strong> на <strong>{new_lead_stage}</strong>. Пожалуйста, просмотрите детали ниже и проведите соответствующие действия.</p><p><strong>Детали лида:</strong></p><ul><li>Имя: {lead_name}</li><li>Email: {lead_email}</li><li>Телефон: {lead_phone}</li><li>Компания: {lead_company}</li></ul><p>Спасибо за вашу постоянную усердную работу и преданность.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(47, 3, 'tr', 'Müşteri Adayı Taşındı - {lead_name}', '<p>Merhaba {assigned_user_name},</p><p>Müşteri adayı <strong>{lead_name}</strong>, <strong>{old_lead_stage}</strong> aşamasından <strong>{new_lead_stage}</strong> aşamasına taşındı. Lütfen aşağıdaki detayları inceleyin ve buna göre takip edin.</p><p><strong>Müşteri Adayı Detayları:</strong></p><ul><li>Ad: {lead_name}</li><li>Email: {lead_email}</li><li>Telefon: {lead_phone}</li><li>Şirket: {lead_company}</li></ul><p>Sürekli sert çalışmanız ve bağlılığınız için teşekkür ederiz.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(48, 3, 'zh', '潜在客户已移动 - {lead_name}', '<p>你好 {assigned_user_name}，</p><p>潜在客户 <strong>{lead_name}</strong> 已从 <strong>{old_lead_stage}</strong> 移动到 <strong>{new_lead_stage}</strong>。请查看以下详细信息并相应进行跟进。</p><p><strong>潜在客户详情：</strong></p><ul><li>姓名：{lead_name}</li><li>邮箱：{lead_email}</li><li>电话：{lead_phone}</li><li>公司：{lead_company}</li></ul><p>感谢您的持续努力和奉献。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(49, 4, 'en', 'New Quote Created - {quote_name}', '<p>Hello {billing_contact_name},</p><p>A new quote has been created for you. Please review the details below.</p><p><strong>Quote Details:</strong></p><ul><li>Quote Number: {quote_number}</li><li>Quote Name: {quote_name}</li><li>Account: {account_name}</li><li>Total Amount: {quote_total}</li><li>Valid Until: {quote_valid_until}</li><li>Status: {quote_status}</li></ul><p><strong>Assigned Sales Representative:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Please contact your sales representative if you have any questions about this quote.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(50, 4, 'es', 'Nueva Cotización Creada - {quote_name}', '<p>Hola {billing_contact_name},</p><p>Se ha creado una nueva cotización para usted. Por favor revise los detalles a continuación.</p><p><strong>Detalles de la Cotización:</strong></p><ul><li>Número de Cotización: {quote_number}</li><li>Nombre de Cotización: {quote_name}</li><li>Cuenta: {account_name}</li><li>Monto Total: {quote_total}</li><li>Válida Hasta: {quote_valid_until}</li><li>Estado: {quote_status}</li></ul><p><strong>Representante de Ventas Asignado:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Por favor contacte a su representante de ventas si tiene alguna pregunta sobre esta cotización.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(51, 4, 'ar', 'تم إنشاء عرض أسعار جديد - {quote_name}', '<p>مرحباً {billing_contact_name}،</p><p>تم إنشاء عرض أسعار جديد لك. يرجى مراجعة التفاصيل أدناه.</p><p><strong>تفاصيل عرض الأسعار:</strong></p><ul><li>رقم عرض الأسعار: {quote_number}</li><li>اسم عرض الأسعار: {quote_name}</li><li>الحساب: {account_name}</li><li>المبلغ الإجمالي: {quote_total}</li><li>صالح حتى: {quote_valid_until}</li><li>الحالة: {quote_status}</li></ul><p><strong>مندوب المبيعات المعين:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>يرجى التواصل مع مندوب المبيعات إذا كان لديك أي أسئلة حول هذا العرض.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(52, 4, 'da', 'Nyt Tilbud Oprettet - {quote_name}', '<p>Hej {billing_contact_name},</p><p>Et nyt tilbud er blevet oprettet til dig. Gennemgå venligst detaljerne nedenfor.</p><p><strong>Tilbud Detaljer:</strong></p><ul><li>Tilbudsnummer: {quote_number}</li><li>Tilbudsnavn: {quote_name}</li><li>Konto: {account_name}</li><li>Samlet beløb: {quote_total}</li><li>Gyldig indtil: {quote_valid_until}</li><li>Status: {quote_status}</li></ul><p><strong>Tildelt Salgsrepræsentant:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Kontakt venligst din salgsrepræsentant, hvis du har spørgsmål om dette tilbud.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(53, 4, 'de', 'Neues Angebot erstellt - {quote_name}', '<p>Hallo {billing_contact_name},</p><p>Ein neues Angebot wurde für Sie erstellt. Bitte überprüfen Sie die Details unten.</p><p><strong>Angebot Details:</strong></p><ul><li>Angebotsnummer: {quote_number}</li><li>Angebotsname: {quote_name}</li><li>Konto: {account_name}</li><li>Gesamtbetrag: {quote_total}</li><li>Gültig bis: {quote_valid_until}</li><li>Status: {quote_status}</li></ul><p><strong>Zugewiesener Vertriebsmitarbeiter:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Bitte kontaktieren Sie Ihren Vertriebsmitarbeiter, wenn Sie Fragen zu diesem Angebot haben.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(54, 4, 'fr', 'Nouveau Devis Créé - {quote_name}', '<p>Bonjour {billing_contact_name},</p><p>Un nouveau devis a été créé pour vous. Veuillez examiner les détails ci-dessous.</p><p><strong>Détails du Devis:</strong></p><ul><li>Numéro de devis: {quote_number}</li><li>Nom du devis: {quote_name}</li><li>Compte: {account_name}</li><li>Montant total: {quote_total}</li><li>Valide jusqu\'au: {quote_valid_until}</li><li>Statut: {quote_status}</li></ul><p><strong>Représentant Commercial Assigné:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Veuillez contacter votre représentant commercial si vous avez des questions sur ce devis.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(55, 4, 'he', 'הצעת מחיר חדשה נוצרה - {quote_name}', '<p>שלום {billing_contact_name},</p><p>הצעת מחיר חדשה נוצרה עבורך. אנא עיין בפרטים להלן.</p><p><strong>פרטי הצעת המחיר:</strong></p><ul><li>מספר הצעת מחיר: {quote_number}</li><li>שם הצעת מחיר: {quote_name}</li><li>חשבון: {account_name}</li><li>סכום כולל: {quote_total}</li><li>תקף עד: {quote_valid_until}</li><li>סטטוס: {quote_status}</li></ul><p><strong>נציג מכירות מוקצה:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>אנא צור קשר עם נציג המכירות שלך אם יש לך שאלות על הצעת מחיר זו.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(56, 4, 'it', 'Nuovo Preventivo Creato - {quote_name}', '<p>Ciao {billing_contact_name},</p><p>Un nuovo preventivo è stato creato per te. Si prega di rivedere i dettagli qui sotto.</p><p><strong>Dettagli Preventivo:</strong></p><ul><li>Numero preventivo: {quote_number}</li><li>Nome preventivo: {quote_name}</li><li>Account: {account_name}</li><li>Importo totale: {quote_total}</li><li>Valido fino al: {quote_valid_until}</li><li>Stato: {quote_status}</li></ul><p><strong>Rappresentante Vendite Assegnato:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Si prega di contattare il rappresentante vendite per qualsiasi domanda su questo preventivo.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(57, 4, 'ja', '新しい見積もりが作成されました - {quote_name}', '<p>こんにちは {billing_contact_name}さん、</p><p>新しい見積もりが作成されました。以下の詳細をご確認ください。</p><p><strong>見積もり詳細:</strong></p><ul><li>見積もり番号: {quote_number}</li><li>見積もり名: {quote_name}</li><li>アカウント: {account_name}</li><li>合計金額: {quote_total}</li><li>有効期限: {quote_valid_until}</li><li>ステータス: {quote_status}</li></ul><p><strong>担当営業担当者:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>この見積もりについてご質問がございましたら、営業担当者にお問い合わせください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(58, 4, 'nl', 'Nieuwe Offerte Aangemaakt - {quote_name}', '<p>Hallo {billing_contact_name},</p><p>Een nieuwe offerte is voor je aangemaakt. Bekijk de details hieronder.</p><p><strong>Offerte Details:</strong></p><ul><li>Offertenummer: {quote_number}</li><li>Offertenaam: {quote_name}</li><li>Account: {account_name}</li><li>Totaalbedrag: {quote_total}</li><li>Geldig tot: {quote_valid_until}</li><li>Status: {quote_status}</li></ul><p><strong>Toegewezen Vertegenwoordiger:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Neem contact op met je vertegenwoordiger als je vragen hebt over deze offerte.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(59, 4, 'pl', 'Nowa Oferta Utworzona - {quote_name}', '<p>Witaj {billing_contact_name},</p><p>Nowa oferta została dla Ciebie utworzona. Przejrzyj szczegóły poniżej.</p><p><strong>Szczegóły Oferty:</strong></p><ul><li>Numer oferty: {quote_number}</li><li>Nazwa oferty: {quote_name}</li><li>Konto: {account_name}</li><li>Łączna kwota: {quote_total}</li><li>Ważna do: {quote_valid_until}</li><li>Status: {quote_status}</li></ul><p><strong>Przypisany Przedstawiciel Handlowy:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Skontaktuj się z przedstawicielem handlowym, jeśli masz pytania dotyczące tej oferty.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(60, 4, 'pt', 'Nova Cotação Criada - {quote_name}', '<p>Olá {billing_contact_name},</p><p>Uma nova cotação foi criada para si. Por favor, reveja os detalhes abaixo.</p><p><strong>Detalhes da Cotação:</strong></p><ul><li>Número da cotação: {quote_number}</li><li>Nome da cotação: {quote_name}</li><li>Conta: {account_name}</li><li>Valor total: {quote_total}</li><li>Válida até: {quote_valid_until}</li><li>Estado: {quote_status}</li></ul><p><strong>Representante de Vendas Atribuído:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Por favor, contacte o seu representante de vendas se tiver questões sobre esta cotação.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(61, 4, 'pt-BR', 'Nova Cotação Criada - {quote_name}', '<p>Olá {billing_contact_name},</p><p>Uma nova cotação foi criada para você. Por favor, revise os detalhes abaixo.</p><p><strong>Detalhes da Cotação:</strong></p><ul><li>Número da cotação: {quote_number}</li><li>Nome da cotação: {quote_name}</li><li>Conta: {account_name}</li><li>Valor total: {quote_total}</li><li>Válida até: {quote_valid_until}</li><li>Status: {quote_status}</li></ul><p><strong>Representante de Vendas Designado:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Por favor, entre em contato com seu representante de vendas se tiver dúvidas sobre esta cotação.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(62, 4, 'ru', 'Создано новое предложение - {quote_name}', '<p>Привет {billing_contact_name},</p><p>Для вас создано новое предложение. Пожалуйста, просмотрите детали ниже.</p><p><strong>Детали предложения:</strong></p><ul><li>Номер предложения: {quote_number}</li><li>Название предложения: {quote_name}</li><li>Аккаунт: {account_name}</li><li>Общая сумма: {quote_total}</li><li>Действительно до: {quote_valid_until}</li><li>Статус: {quote_status}</li></ul><p><strong>Назначенный представитель по продажам:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Пожалуйста, свяжитесь с вашим представителем по продажам, если у вас есть вопросы по этому предложению.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(63, 4, 'tr', 'Yeni Teklif Oluşturuldu - {quote_name}', '<p>Merhaba {billing_contact_name},</p><p>Sizin için yeni bir teklif oluşturuldu. Lütfen aşağıdaki detayları inceleyin.</p><p><strong>Teklif Detayları:</strong></p><ul><li>Teklif numarası: {quote_number}</li><li>Teklif adı: {quote_name}</li><li>Hesap: {account_name}</li><li>Toplam tutar: {quote_total}</li><li>Geçerlilik tarihi: {quote_valid_until}</li><li>Durum: {quote_status}</li></ul><p><strong>Atanan Satış Temsilcisi:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Bu teklifle ilgili sorularınız varsa lütfen satış temsilcinizle iletişime geçin.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(64, 4, 'zh', '新报价已创建 - {quote_name}', '<p>你好 {billing_contact_name}，</p><p>已为您创建了新的报价。请查看以下详细信息。</p><p><strong>报价详情：</strong></p><ul><li>报价编号：{quote_number}</li><li>报价名称：{quote_name}</li><li>账户：{account_name}</li><li>总金额：{quote_total}</li><li>有效期至：{quote_valid_until}</li><li>状态：{quote_status}</li></ul><p><strong>指定销售代表：</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>如果您对此报价有任何疑问，请联系您的销售代表。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(65, 5, 'en', 'Quote Status Updated - {quote_name}', '<p>Hello {billing_contact_name},</p><p>The status of your quote has been updated from <strong>{old_quote_status}</strong> to <strong>{new_quote_status}</strong>.</p><p><strong>Quote Details:</strong></p><ul><li>Quote Number: {quote_number}</li><li>Quote Name: {quote_name}</li><li>Account: {account_name}</li><li>Total Amount: {quote_total}</li><li>Valid Until: {quote_valid_until}</li><li>Current Status: {new_quote_status}</li></ul><p><strong>Assigned Sales Representative:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Please contact your sales representative if you have any questions about this status change.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(66, 5, 'es', 'Estado de Cotización Actualizado - {quote_name}', '<p>Hola {billing_contact_name},</p><p>El estado de su cotización ha sido actualizado de <strong>{old_quote_status}</strong> a <strong>{new_quote_status}</strong>.</p><p><strong>Detalles de la Cotización:</strong></p><ul><li>Número de Cotización: {quote_number}</li><li>Nombre de Cotización: {quote_name}</li><li>Cuenta: {account_name}</li><li>Monto Total: {quote_total}</li><li>Válida Hasta: {quote_valid_until}</li><li>Estado Actual: {new_quote_status}</li></ul><p><strong>Representante de Ventas Asignado:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Por favor contacte a su representante de ventas si tiene alguna pregunta sobre este cambio de estado.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(67, 5, 'ar', 'تم تحديث حالة عرض الأسعار - {quote_name}', '<p>مرحباً {billing_contact_name}،</p><p>تم تحديث حالة عرض الأسعار الخاص بك من <strong>{old_quote_status}</strong> إلى <strong>{new_quote_status}</strong>.</p><p><strong>تفاصيل عرض الأسعار:</strong></p><ul><li>رقم عرض الأسعار: {quote_number}</li><li>اسم عرض الأسعار: {quote_name}</li><li>الحساب: {account_name}</li><li>المبلغ الإجمالي: {quote_total}</li><li>صالح حتى: {quote_valid_until}</li><li>الحالة الحالية: {new_quote_status}</li></ul><p><strong>مندوب المبيعات المعين:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>يرجى التواصل مع مندوب المبيعات إذا كان لديك أي أسئلة حول هذا التغيير في الحالة.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(68, 5, 'da', 'Tilbudsstatus Opdateret - {quote_name}', '<p>Hej {billing_contact_name},</p><p>Status på dit tilbud er blevet opdateret fra <strong>{old_quote_status}</strong> til <strong>{new_quote_status}</strong>.</p><p><strong>Tilbud Detaljer:</strong></p><ul><li>Tilbudsnummer: {quote_number}</li><li>Tilbudsnavn: {quote_name}</li><li>Konto: {account_name}</li><li>Samlet beløb: {quote_total}</li><li>Gyldig indtil: {quote_valid_until}</li><li>Nuværende status: {new_quote_status}</li></ul><p><strong>Tildelt Salgsrepræsentant:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Kontakt venligst din salgsrepræsentant, hvis du har spørgsmål om denne statusændring.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(69, 5, 'de', 'Angebotsstatus Aktualisiert - {quote_name}', '<p>Hallo {billing_contact_name},</p><p>Der Status Ihres Angebots wurde von <strong>{old_quote_status}</strong> auf <strong>{new_quote_status}</strong> aktualisiert.</p><p><strong>Angebot Details:</strong></p><ul><li>Angebotsnummer: {quote_number}</li><li>Angebotsname: {quote_name}</li><li>Konto: {account_name}</li><li>Gesamtbetrag: {quote_total}</li><li>Gültig bis: {quote_valid_until}</li><li>Aktueller Status: {new_quote_status}</li></ul><p><strong>Zugewiesener Vertriebsmitarbeiter:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Bitte kontaktieren Sie Ihren Vertriebsmitarbeiter, wenn Sie Fragen zu dieser Statusänderung haben.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(70, 5, 'fr', 'Statut du Devis Mis à Jour - {quote_name}', '<p>Bonjour {billing_contact_name},</p><p>Le statut de votre devis a été mis à jour de <strong>{old_quote_status}</strong> vers <strong>{new_quote_status}</strong>.</p><p><strong>Détails du Devis:</strong></p><ul><li>Numéro de devis: {quote_number}</li><li>Nom du devis: {quote_name}</li><li>Compte: {account_name}</li><li>Montant total: {quote_total}</li><li>Valide jusqu\'au: {quote_valid_until}</li><li>Statut actuel: {new_quote_status}</li></ul><p><strong>Représentant Commercial Assigné:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Veuillez contacter votre représentant commercial si vous avez des questions sur ce changement de statut.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(71, 5, 'he', 'סטטוס הצעת המחיר עודכן - {quote_name}', '<p>שלום {billing_contact_name},</p><p>סטטוס הצעת המחיר שלך עודכן מ-<strong>{old_quote_status}</strong> ל-<strong>{new_quote_status}</strong>.</p><p><strong>פרטי הצעת המחיר:</strong></p><ul><li>מספר הצעת מחיר: {quote_number}</li><li>שם הצעת מחיר: {quote_name}</li><li>חשבון: {account_name}</li><li>סכום כולל: {quote_total}</li><li>תקף עד: {quote_valid_until}</li><li>סטטוס נוכחי: {new_quote_status}</li></ul><p><strong>נציג מכירות מוקצה:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>אנא צור קשר עם נציג המכירות שלך אם יש לך שאלות על שינוי סטטוס זה.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(72, 5, 'it', 'Stato Preventivo Aggiornato - {quote_name}', '<p>Ciao {billing_contact_name},</p><p>Lo stato del tuo preventivo è stato aggiornato da <strong>{old_quote_status}</strong> a <strong>{new_quote_status}</strong>.</p><p><strong>Dettagli Preventivo:</strong></p><ul><li>Numero preventivo: {quote_number}</li><li>Nome preventivo: {quote_name}</li><li>Account: {account_name}</li><li>Importo totale: {quote_total}</li><li>Valido fino al: {quote_valid_until}</li><li>Stato attuale: {new_quote_status}</li></ul><p><strong>Rappresentante Vendite Assegnato:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Si prega di contattare il rappresentante vendite per qualsiasi domanda su questo cambio di stato.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(73, 5, 'ja', '見積もりステータスが更新されました - {quote_name}', '<p>こんにちは {billing_contact_name}さん、</p><p>見積もりのステータスが <strong>{old_quote_status}</strong> から <strong>{new_quote_status}</strong> に更新されました。</p><p><strong>見積もり詳細:</strong></p><ul><li>見積もり番号: {quote_number}</li><li>見積もり名: {quote_name}</li><li>アカウント: {account_name}</li><li>合計金額: {quote_total}</li><li>有効期限: {quote_valid_until}</li><li>現在のステータス: {new_quote_status}</li></ul><p><strong>担当営業担当者:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>このステータス変更についてご質問がございましたら、営業担当者にお問い合わせください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(74, 5, 'nl', 'Offerte Status Bijgewerkt - {quote_name}', '<p>Hallo {billing_contact_name},</p><p>De status van je offerte is bijgewerkt van <strong>{old_quote_status}</strong> naar <strong>{new_quote_status}</strong>.</p><p><strong>Offerte Details:</strong></p><ul><li>Offertenummer: {quote_number}</li><li>Offertenaam: {quote_name}</li><li>Account: {account_name}</li><li>Totaalbedrag: {quote_total}</li><li>Geldig tot: {quote_valid_until}</li><li>Huidige status: {new_quote_status}</li></ul><p><strong>Toegewezen Vertegenwoordiger:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Neem contact op met je vertegenwoordiger als je vragen hebt over deze statuswijziging.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(75, 5, 'pl', 'Status Oferty Zaktualizowany - {quote_name}', '<p>Witaj {billing_contact_name},</p><p>Status Twojej oferty został zaktualizowany z <strong>{old_quote_status}</strong> na <strong>{new_quote_status}</strong>.</p><p><strong>Szczegóły Oferty:</strong></p><ul><li>Numer oferty: {quote_number}</li><li>Nazwa oferty: {quote_name}</li><li>Konto: {account_name}</li><li>Łączna kwota: {quote_total}</li><li>Ważna do: {quote_valid_until}</li><li>Aktualny status: {new_quote_status}</li></ul><p><strong>Przypisany Przedstawiciel Handlowy:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Skontaktuj się z przedstawicielem handlowym, jeśli masz pytania dotyczące tej zmiany statusu.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(76, 5, 'pt', 'Estado da Cotação Atualizado - {quote_name}', '<p>Olá {billing_contact_name},</p><p>O estado da sua cotação foi atualizado de <strong>{old_quote_status}</strong> para <strong>{new_quote_status}</strong>.</p><p><strong>Detalhes da Cotação:</strong></p><ul><li>Número da cotação: {quote_number}</li><li>Nome da cotação: {quote_name}</li><li>Conta: {account_name}</li><li>Valor total: {quote_total}</li><li>Válida até: {quote_valid_until}</li><li>Estado atual: {new_quote_status}</li></ul><p><strong>Representante de Vendas Atribuído:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Por favor, contacte o seu representante de vendas se tiver questões sobre esta mudança de estado.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(77, 5, 'pt-BR', 'Status da Cotação Atualizado - {quote_name}', '<p>Olá {billing_contact_name},</p><p>O status da sua cotação foi atualizado de <strong>{old_quote_status}</strong> para <strong>{new_quote_status}</strong>.</p><p><strong>Detalhes da Cotação:</strong></p><ul><li>Número da cotação: {quote_number}</li><li>Nome da cotação: {quote_name}</li><li>Conta: {account_name}</li><li>Valor total: {quote_total}</li><li>Válida até: {quote_valid_until}</li><li>Status atual: {new_quote_status}</li></ul><p><strong>Representante de Vendas Designado:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Por favor, entre em contato com seu representante de vendas se tiver dúvidas sobre esta mudança de status.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(78, 5, 'ru', 'Статус предложения обновлен - {quote_name}', '<p>Привет {billing_contact_name},</p><p>Статус вашего предложения был обновлен с <strong>{old_quote_status}</strong> на <strong>{new_quote_status}</strong>.</p><p><strong>Детали предложения:</strong></p><ul><li>Номер предложения: {quote_number}</li><li>Название предложения: {quote_name}</li><li>Аккаунт: {account_name}</li><li>Общая сумма: {quote_total}</li><li>Действительно до: {quote_valid_until}</li><li>Текущий статус: {new_quote_status}</li></ul><p><strong>Назначенный представитель по продажам:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Пожалуйста, свяжитесь с вашим представителем по продажам, если у вас есть вопросы по этому изменению статуса.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(79, 5, 'tr', 'Teklif Durumu Güncellendi - {quote_name}', '<p>Merhaba {billing_contact_name},</p><p>Teklifinizin durumu <strong>{old_quote_status}</strong> durumundan <strong>{new_quote_status}</strong> durumuna güncellendi.</p><p><strong>Teklif Detayları:</strong></p><ul><li>Teklif numarası: {quote_number}</li><li>Teklif adı: {quote_name}</li><li>Hesap: {account_name}</li><li>Toplam tutar: {quote_total}</li><li>Geçerlilik tarihi: {quote_valid_until}</li><li>Mevcut durum: {new_quote_status}</li></ul><p><strong>Atanan Satış Temsilcisi:</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>Bu durum değişikliği hakkında sorularınız varsa lütfen satış temsilcinizle iletişime geçin.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(80, 5, 'zh', '报价状态已更新 - {quote_name}', '<p>你好 {billing_contact_name}，</p><p>您的报价状态已从 <strong>{old_quote_status}</strong> 更新为 <strong>{new_quote_status}</strong>。</p><p><strong>报价详情：</strong></p><ul><li>报价编号：{quote_number}</li><li>报价名称：{quote_name}</li><li>账户：{account_name}</li><li>总金额：{quote_total}</li><li>有效期至：{quote_valid_until}</li><li>当前状态：{new_quote_status}</li></ul><p><strong>指定销售代表：</strong></p><p>{assigned_user_name} - {assigned_user_email}</p><p>如果您对此状态变更有任何疑问，请联系您的销售代表。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(81, 6, 'en', 'New Task Assigned to You - {task_title}', '<p>Hello {assigned_user_name},</p><p>A new task has been assigned to you. Please review the details below and take appropriate action.</p><p><strong>Task Details:</strong></p><ul><li>Task Title: {task_title}</li><li>Project: {project_name}</li><li>Priority: {task_priority}</li><li>Due Date: {task_due_date}</li><li>Status: {task_status}</li><li>Estimated Hours: {task_estimated_hours}</li></ul><p><strong>Description:</strong></p><p>{task_description}</p><p><strong>Assigned By:</strong></p><p>{creator_name} - {creator_email}</p><p>Please log into the system to view full task details and update progress as needed.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(82, 6, 'es', 'Nueva Tarea Asignada - {task_title}', '<p>Hola {assigned_user_name},</p><p>Se le ha asignado una nueva tarea. Por favor revise los detalles a continuación y tome las medidas apropiadas.</p><p><strong>Detalles de la Tarea:</strong></p><ul><li>Título de la Tarea: {task_title}</li><li>Proyecto: {project_name}</li><li>Prioridad: {task_priority}</li><li>Fecha de Vencimiento: {task_due_date}</li><li>Estado: {task_status}</li><li>Horas Estimadas: {task_estimated_hours}</li></ul><p><strong>Descripción:</strong></p><p>{task_description}</p><p><strong>Asignado Por:</strong></p><p>{creator_name} - {creator_email}</p><p>Por favor inicie sesión en el sistema para ver los detalles completos de la tarea y actualizar el progreso según sea necesario.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(83, 6, 'ar', 'تم تعيين مهمة جديدة لك - {task_title}', '<p>مرحباً {assigned_user_name}،</p><p>تم تعيين مهمة جديدة لك. يرجى مراجعة التفاصيل أدناه واتخاذ الإجراء المناسب.</p><p><strong>تفاصيل المهمة:</strong></p><ul><li>عنوان المهمة: {task_title}</li><li>المشروع: {project_name}</li><li>الأولوية: {task_priority}</li><li>تاريخ الاستحقاق: {task_due_date}</li><li>الحالة: {task_status}</li><li>الساعات المقدرة: {task_estimated_hours}</li></ul><p><strong>الوصف:</strong></p><p>{task_description}</p><p><strong>معين بواسطة:</strong></p><p>{creator_name} - {creator_email}</p><p>يرجى تسجيل الدخول إلى النظام لعرض تفاصيل المهمة الكاملة وتحديث التقدم حسب الحاجة.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(84, 6, 'da', 'Ny Opgave Tildelt - {task_title}', '<p>Hej {assigned_user_name},</p><p>En ny opgave er blevet tildelt til dig. Gennemgå venligst detaljerne nedenfor og tag passende handling.</p><p><strong>Opgave Detaljer:</strong></p><ul><li>Opgave Titel: {task_title}</li><li>Projekt: {project_name}</li><li>Prioritet: {task_priority}</li><li>Forfaldsdato: {task_due_date}</li><li>Status: {task_status}</li><li>Estimerede Timer: {task_estimated_hours}</li></ul><p><strong>Beskrivelse:</strong></p><p>{task_description}</p><p><strong>Tildelt Af:</strong></p><p>{creator_name} - {creator_email}</p><p>Log venligst ind i systemet for at se fulde opgavedetaljer og opdatere fremskridt efter behov.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(85, 6, 'de', 'Neue Aufgabe zugewiesen - {task_title}', '<p>Hallo {assigned_user_name},</p><p>Eine neue Aufgabe wurde Ihnen zugewiesen. Bitte überprüfen Sie die Details unten und ergreifen Sie entsprechende Maßnahmen.</p><p><strong>Aufgaben Details:</strong></p><ul><li>Aufgaben Titel: {task_title}</li><li>Projekt: {project_name}</li><li>Priorität: {task_priority}</li><li>Fälligkeitsdatum: {task_due_date}</li><li>Status: {task_status}</li><li>Geschätzte Stunden: {task_estimated_hours}</li></ul><p><strong>Beschreibung:</strong></p><p>{task_description}</p><p><strong>Zugewiesen von:</strong></p><p>{creator_name} - {creator_email}</p><p>Bitte loggen Sie sich in das System ein, um vollständige Aufgabendetails anzuzeigen und den Fortschritt bei Bedarf zu aktualisieren.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(86, 6, 'fr', 'Nouvelle Tâche Assignée - {task_title}', '<p>Bonjour {assigned_user_name},</p><p>Une nouvelle tâche vous a été assignée. Veuillez examiner les détails ci-dessous et prendre les mesures appropriées.</p><p><strong>Détails de la Tâche:</strong></p><ul><li>Titre de la Tâche: {task_title}</li><li>Projet: {project_name}</li><li>Priorité: {task_priority}</li><li>Date d\'échéance: {task_due_date}</li><li>Statut: {task_status}</li><li>Heures Estimées: {task_estimated_hours}</li></ul><p><strong>Description:</strong></p><p>{task_description}</p><p><strong>Assigné Par:</strong></p><p>{creator_name} - {creator_email}</p><p>Veuillez vous connecter au système pour voir les détails complets de la tâche et mettre à jour les progrès si nécessaire.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(87, 6, 'he', 'משימה חדשה הוקצתה - {task_title}', '<p>שלום {assigned_user_name},</p><p>משימה חדשה הוקצתה לך. אנא עיין בפרטים להלן ונקט פעולה מתאימה.</p><p><strong>פרטי המשימה:</strong></p><ul><li>כותרת המשימה: {task_title}</li><li>פרויקט: {project_name}</li><li>עדיפות: {task_priority}</li><li>תאריך יעד: {task_due_date}</li><li>סטטוס: {task_status}</li><li>שעות מוערכות: {task_estimated_hours}</li></ul><p><strong>תיאור:</strong></p><p>{task_description}</p><p><strong>הוקצה על ידי:</strong></p><p>{creator_name} - {creator_email}</p><p>אנא התחבר למערכת כדי לראות פרטי משימה מלאים ולעדכן התקדמות לפי הצורך.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(88, 6, 'it', 'Nuovo Compito Assegnato - {task_title}', '<p>Ciao {assigned_user_name},</p><p>Un nuovo compito ti è stato assegnato. Si prega di rivedere i dettagli qui sotto e prendere le azioni appropriate.</p><p><strong>Dettagli del Compito:</strong></p><ul><li>Titolo del Compito: {task_title}</li><li>Progetto: {project_name}</li><li>Priorità: {task_priority}</li><li>Data di Scadenza: {task_due_date}</li><li>Stato: {task_status}</li><li>Ore Stimate: {task_estimated_hours}</li></ul><p><strong>Descrizione:</strong></p><p>{task_description}</p><p><strong>Assegnato Da:</strong></p><p>{creator_name} - {creator_email}</p><p>Si prega di accedere al sistema per visualizzare i dettagli completi del compito e aggiornare i progressi secondo necessità.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(89, 6, 'ja', '新しいタスクが割り当てられました - {task_title}', '<p>こんにちは {assigned_user_name}さん、</p><p>新しいタスクがあなたに割り当てられました。以下の詳細を確認し、適切なアクションを取ってください。</p><p><strong>タスク詳細:</strong></p><ul><li>タスクタイトル: {task_title}</li><li>プロジェクト: {project_name}</li><li>優先度: {task_priority}</li><li>期限: {task_due_date}</li><li>ステータス: {task_status}</li><li>予想時間: {task_estimated_hours}</li></ul><p><strong>説明:</strong></p><p>{task_description}</p><p><strong>割り当て者:</strong></p><p>{creator_name} - {creator_email}</p><p>システムにログインしてタスクの詳細を確認し、必要に応じて進捗を更新してください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(90, 6, 'nl', 'Nieuwe Taak Toegewezen - {task_title}', '<p>Hallo {assigned_user_name},</p><p>Een nieuwe taak is aan je toegewezen. Bekijk de details hieronder en onderneem passende actie.</p><p><strong>Taak Details:</strong></p><ul><li>Taak Titel: {task_title}</li><li>Project: {project_name}</li><li>Prioriteit: {task_priority}</li><li>Vervaldatum: {task_due_date}</li><li>Status: {task_status}</li><li>Geschatte Uren: {task_estimated_hours}</li></ul><p><strong>Beschrijving:</strong></p><p>{task_description}</p><p><strong>Toegewezen Door:</strong></p><p>{creator_name} - {creator_email}</p><p>Log in op het systeem om volledige taakdetails te bekijken en voortgang bij te werken indien nodig.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(91, 6, 'pl', 'Nowe Zadanie Przypisane - {task_title}', '<p>Witaj {assigned_user_name},</p><p>Nowe zadanie zostało Ci przypisane. Przejrzyj szczegóły poniżej i podejmij odpowiednie działania.</p><p><strong>Szczegóły Zadania:</strong></p><ul><li>Tytuł Zadania: {task_title}</li><li>Projekt: {project_name}</li><li>Priorytet: {task_priority}</li><li>Termin: {task_due_date}</li><li>Status: {task_status}</li><li>Szacowane Godziny: {task_estimated_hours}</li></ul><p><strong>Opis:</strong></p><p>{task_description}</p><p><strong>Przypisane Przez:</strong></p><p>{creator_name} - {creator_email}</p><p>Zaloguj się do systemu, aby zobaczyć pełne szczegóły zadania i zaktualizować postęp w razie potrzeby.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(92, 6, 'pt', 'Nova Tarefa Atribuída - {task_title}', '<p>Olá {assigned_user_name},</p><p>Uma nova tarefa foi atribuída a si. Por favor, reveja os detalhes abaixo e tome a ação apropriada.</p><p><strong>Detalhes da Tarefa:</strong></p><ul><li>Título da Tarefa: {task_title}</li><li>Projeto: {project_name}</li><li>Prioridade: {task_priority}</li><li>Data de Vencimento: {task_due_date}</li><li>Estado: {task_status}</li><li>Horas Estimadas: {task_estimated_hours}</li></ul><p><strong>Descrição:</strong></p><p>{task_description}</p><p><strong>Atribuído Por:</strong></p><p>{creator_name} - {creator_email}</p><p>Por favor, faça login no sistema para ver os detalhes completos da tarefa e atualizar o progresso conforme necessário.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(93, 6, 'pt-BR', 'Nova Tarefa Atribuída - {task_title}', '<p>Olá {assigned_user_name},</p><p>Uma nova tarefa foi atribuída a você. Por favor, revise os detalhes abaixo e tome a ação apropriada.</p><p><strong>Detalhes da Tarefa:</strong></p><ul><li>Título da Tarefa: {task_title}</li><li>Projeto: {project_name}</li><li>Prioridade: {task_priority}</li><li>Data de Vencimento: {task_due_date}</li><li>Status: {task_status}</li><li>Horas Estimadas: {task_estimated_hours}</li></ul><p><strong>Descrição:</strong></p><p>{task_description}</p><p><strong>Atribuído Por:</strong></p><p>{creator_name} - {creator_email}</p><p>Por favor, faça login no sistema para ver os detalhes completos da tarefa e atualizar o progresso conforme necessário.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(94, 6, 'ru', 'Новая задача назначена - {task_title}', '<p>Привет {assigned_user_name},</p><p>Вам назначена новая задача. Пожалуйста, просмотрите детали ниже и примите соответствующие меры.</p><p><strong>Детали задачи:</strong></p><ul><li>Название задачи: {task_title}</li><li>Проект: {project_name}</li><li>Приоритет: {task_priority}</li><li>Срок выполнения: {task_due_date}</li><li>Статус: {task_status}</li><li>Оценочные часы: {task_estimated_hours}</li></ul><p><strong>Описание:</strong></p><p>{task_description}</p><p><strong>Назначено:</strong></p><p>{creator_name} - {creator_email}</p><p>Пожалуйста, войдите в систему, чтобы посмотреть полные детали задачи и обновить прогресс по мере необходимости.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(95, 6, 'tr', 'Yeni Görev Atandı - {task_title}', '<p>Merhaba {assigned_user_name},</p><p>Size yeni bir görev atandı. Lütfen aşağıdaki detayları inceleyin ve uygun eylemi gerçekleştirin.</p><p><strong>Görev Detayları:</strong></p><ul><li>Görev Başlığı: {task_title}</li><li>Proje: {project_name}</li><li>Öncelik: {task_priority}</li><li>Teslim Tarihi: {task_due_date}</li><li>Durum: {task_status}</li><li>Tahmini Saatler: {task_estimated_hours}</li></ul><p><strong>Açıklama:</strong></p><p>{task_description}</p><p><strong>Atayan:</strong></p><p>{creator_name} - {creator_email}</p><p>Görevin tam detaylarını görmek ve gerektiğinde ilerlemeyi güncellemek için lütfen sisteme giriş yapın.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(96, 6, 'zh', '新任务已分配 - {task_title}', '<p>你好 {assigned_user_name}，</p><p>一个新任务已分配给您。请查看以下详细信息并采取适当行动。</p><p><strong>任务详情：</strong></p><ul><li>任务标题：{task_title}</li><li>项目：{project_name}</li><li>优先级：{task_priority}</li><li>截止日期：{task_due_date}</li><li>状态：{task_status}</li><li>预估小时：{task_estimated_hours}</li></ul><p><strong>描述：</strong></p><p>{task_description}</p><p><strong>分配者：</strong></p><p>{creator_name} - {creator_email}</p><p>请登录系统查看完整的任务详情并根据需要更新进度。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(97, 7, 'en', 'Meeting Invitation: {meeting_title}', '<p>Hello {attendee_name},</p><p>You are invited to attend the following meeting:</p><p><strong>Meeting Details:</strong></p><ul><li>Title: {meeting_title}</li><li>Date: {meeting_date}</li><li>Time: {meeting_start_time} - {meeting_end_time}</li><li>Location: {meeting_location}</li></ul><p><strong>Description:</strong></p><p>{meeting_description}</p><p>Please confirm your attendance and add this meeting to your calendar.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(98, 7, 'es', 'Invitación a Reunión: {meeting_title}', '<p>Hola {attendee_name},</p><p>Está invitado a asistir a la siguiente reunión:</p><p><strong>Detalles de la Reunión:</strong></p><ul><li>Título: {meeting_title}</li><li>Fecha: {meeting_date}</li><li>Hora: {meeting_start_time} - {meeting_end_time}</li><li>Ubicación: {meeting_location}</li></ul><p><strong>Descripción:</strong></p><p>{meeting_description}</p><p>Por favor confirme su asistencia y agregue esta reunión a su calendario.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(99, 7, 'ar', 'دعوة لاجتماع: {meeting_title}', '<p>مرحباً {attendee_name}،</p><p>أنت مدعو لحضور الاجتماع التالي:</p><p><strong>تفاصيل الاجتماع:</strong></p><ul><li>العنوان: {meeting_title}</li><li>التاريخ: {meeting_date}</li><li>الوقت: {meeting_start_time} - {meeting_end_time}</li><li>الموقع: {meeting_location}</li></ul><p><strong>الوصف:</strong></p><p>{meeting_description}</p><p>يرجى تأكيد حضورك وإضافة هذا الاجتماع إلى تقويمك.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(100, 7, 'da', 'Mødeinvitation: {meeting_title}', '<p>Hej {attendee_name},</p><p>Du er inviteret til at deltage i følgende møde:</p><p><strong>Møde Detaljer:</strong></p><ul><li>Titel: {meeting_title}</li><li>Dato: {meeting_date}</li><li>Tid: {meeting_start_time} - {meeting_end_time}</li><li>Sted: {meeting_location}</li></ul><p><strong>Beskrivelse:</strong></p><p>{meeting_description}</p><p>Bekræft venligst din deltagelse og tilføj dette møde til din kalender.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(101, 7, 'de', 'Meeting-Einladung: {meeting_title}', '<p>Hallo {attendee_name},</p><p>Sie sind eingeladen, an folgendem Meeting teilzunehmen:</p><p><strong>Meeting Details:</strong></p><ul><li>Titel: {meeting_title}</li><li>Datum: {meeting_date}</li><li>Zeit: {meeting_start_time} - {meeting_end_time}</li><li>Ort: {meeting_location}</li></ul><p><strong>Beschreibung:</strong></p><p>{meeting_description}</p><p>Bitte bestätigen Sie Ihre Teilnahme und fügen Sie dieses Meeting zu Ihrem Kalender hinzu.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(102, 7, 'fr', 'Invitation à la Réunion: {meeting_title}', '<p>Bonjour {attendee_name},</p><p>Vous êtes invité à assister à la réunion suivante:</p><p><strong>Détails de la Réunion:</strong></p><ul><li>Titre: {meeting_title}</li><li>Date: {meeting_date}</li><li>Heure: {meeting_start_time} - {meeting_end_time}</li><li>Lieu: {meeting_location}</li></ul><p><strong>Description:</strong></p><p>{meeting_description}</p><p>Veuillez confirmer votre présence et ajouter cette réunion à votre calendrier.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(103, 7, 'he', 'הזמנה לפגישה: {meeting_title}', '<p>שלום {attendee_name},</p><p>אתה מוזמן להשתתף בפגישה הבאה:</p><p><strong>פרטי הפגישה:</strong></p><ul><li>כותרת: {meeting_title}</li><li>תאריך: {meeting_date}</li><li>שעה: {meeting_start_time} - {meeting_end_time}</li><li>מיקום: {meeting_location}</li></ul><p><strong>תיאור:</strong></p><p>{meeting_description}</p><p>אנא אשר את השתתפותך והוסף את הפגישה ליומן שלך.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(104, 7, 'it', 'Invito alla Riunione: {meeting_title}', '<p>Ciao {attendee_name},</p><p>Sei invitato a partecipare alla seguente riunione:</p><p><strong>Dettagli della Riunione:</strong></p><ul><li>Titolo: {meeting_title}</li><li>Data: {meeting_date}</li><li>Ora: {meeting_start_time} - {meeting_end_time}</li><li>Luogo: {meeting_location}</li></ul><p><strong>Descrizione:</strong></p><p>{meeting_description}</p><p>Si prega di confermare la partecipazione e aggiungere questa riunione al calendario.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(105, 7, 'ja', '会議のご招待: {meeting_title}', '<p>こんにちは {attendee_name}さん、</p><p>以下の会議にご参加いただきますようご招待いたします:</p><p><strong>会議詳細:</strong></p><ul><li>タイトル: {meeting_title}</li><li>日付: {meeting_date}</li><li>時間: {meeting_start_time} - {meeting_end_time}</li><li>場所: {meeting_location}</li></ul><p><strong>説明:</strong></p><p>{meeting_description}</p><p>参加の確認とカレンダーへの登録をお願いいたします。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(106, 7, 'nl', 'Vergaderuitnodiging: {meeting_title}', '<p>Hallo {attendee_name},</p><p>Je bent uitgenodigd voor de volgende vergadering:</p><p><strong>Vergader Details:</strong></p><ul><li>Titel: {meeting_title}</li><li>Datum: {meeting_date}</li><li>Tijd: {meeting_start_time} - {meeting_end_time}</li><li>Locatie: {meeting_location}</li></ul><p><strong>Beschrijving:</strong></p><p>{meeting_description}</p><p>Bevestig je aanwezigheid en voeg deze vergadering toe aan je agenda.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(107, 7, 'pl', 'Zaproszenie na Spotkanie: {meeting_title}', '<p>Witaj {attendee_name},</p><p>Jesteś zaproszony na następujące spotkanie:</p><p><strong>Szczegóły Spotkania:</strong></p><ul><li>Tytuł: {meeting_title}</li><li>Data: {meeting_date}</li><li>Czas: {meeting_start_time} - {meeting_end_time}</li><li>Miejsce: {meeting_location}</li></ul><p><strong>Opis:</strong></p><p>{meeting_description}</p><p>Potwierdź swoją obecność i dodaj to spotkanie do swojego kalendarza.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(108, 7, 'pt', 'Convite para Reunião: {meeting_title}', '<p>Olá {attendee_name},</p><p>Está convidado a participar na seguinte reunião:</p><p><strong>Detalhes da Reunião:</strong></p><ul><li>Título: {meeting_title}</li><li>Data: {meeting_date}</li><li>Hora: {meeting_start_time} - {meeting_end_time}</li><li>Local: {meeting_location}</li></ul><p><strong>Descrição:</strong></p><p>{meeting_description}</p><p>Por favor, confirme a sua presença e adicione esta reunião ao seu calendário.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(109, 7, 'pt-BR', 'Convite para Reunião: {meeting_title}', '<p>Olá {attendee_name},</p><p>Você está convidado a participar da seguinte reunião:</p><p><strong>Detalhes da Reunião:</strong></p><ul><li>Título: {meeting_title}</li><li>Data: {meeting_date}</li><li>Horário: {meeting_start_time} - {meeting_end_time}</li><li>Local: {meeting_location}</li></ul><p><strong>Descrição:</strong></p><p>{meeting_description}</p><p>Por favor, confirme sua presença e adicione esta reunião ao seu calendário.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(110, 7, 'ru', 'Приглашение на собрание: {meeting_title}', '<p>Привет {attendee_name},</p><p>Вы приглашены на следующее собрание:</p><p><strong>Детали собрания:</strong></p><ul><li>Название: {meeting_title}</li><li>Дата: {meeting_date}</li><li>Время: {meeting_start_time} - {meeting_end_time}</li><li>Место: {meeting_location}</li></ul><p><strong>Описание:</strong></p><p>{meeting_description}</p><p>Пожалуйста, подтвердите свое участие и добавьте это собрание в свой календарь.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(111, 7, 'tr', 'Toplantı Davetiyesi: {meeting_title}', '<p>Merhaba {attendee_name},</p><p>Aşağıdaki toplantıya davetlisiniz:</p><p><strong>Toplantı Detayları:</strong></p><ul><li>Başlık: {meeting_title}</li><li>Tarih: {meeting_date}</li><li>Saat: {meeting_start_time} - {meeting_end_time}</li><li>Yer: {meeting_location}</li></ul><p><strong>Açıklama:</strong></p><p>{meeting_description}</p><p>Lütfen katılımınızı onaylayın ve bu toplantıyı takviminize ekleyin.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(112, 7, 'zh', '会议邀请: {meeting_title}', '<p>你好 {attendee_name}，</p><p>邀请您参加以下会议:</p><p><strong>会议详情：</strong></p><ul><li>标题：{meeting_title}</li><li>日期：{meeting_date}</li><li>时间：{meeting_start_time} - {meeting_end_time}</li><li>地点：{meeting_location}</li></ul><p><strong>描述：</strong></p><p>{meeting_description}</p><p>请确认您的参会并将此会议添加到您的日历中。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(113, 8, 'en', 'New Support Case Assigned - {case_subject}', '<p>Hello {assigned_user_name},</p><p>A new support case has been assigned to you. Please review the details below and take the necessary actions.</p><p><strong>Case Details:</strong></p><ul><li>Subject: {case_subject}</li><li>Priority: {case_priority}</li><li>Status: {case_status}</li><li>Created Date: {case_created_date}</li></ul><p><strong>Description:</strong></p><p>{case_description}</p><p>Thank you for your support.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(114, 8, 'es', 'Nuevo Caso de Soporte Asignado - {case_subject}', '<p>Hola {assigned_user_name},</p><p>Se le ha asignado un nuevo caso de soporte. Por favor, revise los detalles a continuación y tome las acciones necesarias.</p><p><strong>Detalles del Caso:</strong></p><ul><li>Asunto: {case_subject}</li><li>Prioridad: {case_priority}</li><li>Estado: {case_status}</li><li>Fecha de Creación: {case_created_date}</li></ul><p><strong>Descripción:</strong></p><p>{case_description}</p><p>Gracias por su apoyo.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(115, 8, 'ar', 'تم تعيين حالة دعم جديدة - {case_subject}', '<p>مرحباً {assigned_user_name}،</p><p>تم تعيين حالة دعم جديدة لك. يرجى مراجعة التفاصيل أدناه واتخاذ الإجراءات اللازمة.</p><p><strong>تفاصيل الحالة:</strong></p><ul><li>الموضوع: {case_subject}</li><li>الأولوية: {case_priority}</li><li>الحالة: {case_status}</li><li>تاريخ الإنشاء: {case_created_date}</li></ul><p><strong>الوصف:</strong></p><p>{case_description}</p><p>شكراً لدعمك.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(116, 8, 'da', 'Ny Supportsag Tildelt - {case_subject}', '<p>Hej {assigned_user_name},</p><p>En ny supportsag er blevet tildelt dig. Gennemgå venligst detaljerne nedenfor og tag de nødvendige handlinger.</p><p><strong>Sagsdetaljer:</strong></p><ul><li>Emne: {case_subject}</li><li>Prioritet: {case_priority}</li><li>Status: {case_status}</li><li>Oprettelsesdato: {case_created_date}</li></ul><p><strong>Beskrivelse:</strong></p><p>{case_description}</p><p>Tak for din støtte.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(117, 8, 'de', 'Neuer Support-Fall zugewiesen - {case_subject}', '<p>Hallo {assigned_user_name},</p><p>Ihnen wurde ein neuer Support-Fall zugewiesen. Bitte überprüfen Sie die folgenden Details und ergreifen Sie die notwendigen Maßnahmen.</p><p><strong>Falldetails:</strong></p><ul><li>Betreff: {case_subject}</li><li>Priorität: {case_priority}</li><li>Status: {case_status}</li><li>Erstellungsdatum: {case_created_date}</li></ul><p><strong>Beschreibung:</strong></p><p>{case_description}</p><p>Vielen Dank für Ihre Unterstützung.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(118, 8, 'fr', 'Nouveau Cas de Support Assigné - {case_subject}', '<p>Bonjour {assigned_user_name},</p><p>Un nouveau cas de support vous a été assigné. Veuillez consulter les détails ci-dessous et prendre les mesures nécessaires.</p><p><strong>Détails du Cas:</strong></p><ul><li>Sujet: {case_subject}</li><li>Priorité: {case_priority}</li><li>Statut: {case_status}</li><li>Date de création: {case_created_date}</li></ul><p><strong>Description:</strong></p><p>{case_description}</p><p>Merci pour votre soutien.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(119, 8, 'he', 'הוקצתה לך פנייה חדשה - {case_subject}', '<p>שלום {assigned_user_name},</p><p>פנייה חדשה הוקצתה לך. אנא עיין בפרטים למטה ונקוט בפעולות הנדרשות.</p><p><strong>פרטי הפנייה:</strong></p><ul><li>נושא: {case_subject}</li><li>עדיפות: {case_priority}</li><li>סטטוס: {case_status}</li><li>תאריך יצירה: {case_created_date}</li></ul><p><strong>תיאור:</strong></p><p>{case_description}</p><p>תודה על התמיכה שלך.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(120, 8, 'it', 'Nuovo Caso di Supporto Assegnato - {case_subject}', '<p>Ciao {assigned_user_name},</p><p>Ti è stato assegnato un nuovo caso di supporto. Si prega di rivedere i dettagli seguenti e intraprendere le azioni necessarie.</p><p><strong>Dettagli del Caso:</strong></p><ul><li>Oggetto: {case_subject}</li><li>Priorità: {case_priority}</li><li>Stato: {case_status}</li><li>Data di creazione: {case_created_date}</li></ul><p><strong>Descrizione:</strong></p><p>{case_description}</p><p>Grazie per il tuo supporto.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(121, 8, 'ja', '新しいサポートケースが割り当てられました - {case_subject}', '<p>こんにちは {assigned_user_name}さん、</p><p>新しいサポートケースがあなたに割り当てられました。以下の詳細を確認し、必要な対応をお願いします。</p><p><strong>ケース詳細:</strong></p><ul><li>件名: {case_subject}</li><li>優先度: {case_priority}</li><li>ステータス: {case_status}</li><li>作成日: {case_created_date}</li></ul><p><strong>説明:</strong></p><p>{case_description}</p><p>ご協力ありがとうございます。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(122, 8, 'nl', 'Nieuwe Supportcase Toegewezen - {case_subject}', '<p>Hallo {assigned_user_name},</p><p>Een nieuwe supportcase is aan je toegewezen. Controleer de onderstaande details en onderneem de nodige stappen.</p><p><strong>Case Details:</strong></p><ul><li>Onderwerp: {case_subject}</li><li>Prioriteit: {case_priority}</li><li>Status: {case_status}</li><li>Aanmaakdatum: {case_created_date}</li></ul><p><strong>Beschrijving:</strong></p><p>{case_description}</p><p>Bedankt voor je inzet.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(123, 8, 'pl', 'Nowe Zgłoszenie Przypisane - {case_subject}', '<p>Witaj {assigned_user_name},</p><p>Przypisano Ci nowe zgłoszenie wsparcia. Proszę zapoznaj się ze szczegółami poniżej i podejmij odpowiednie działania.</p><p><strong>Szczegóły Zgłoszenia:</strong></p><ul><li>Temat: {case_subject}</li><li>Priorytet: {case_priority}</li><li>Status: {case_status}</li><li>Data utworzenia: {case_created_date}</li></ul><p><strong>Opis:</strong></p><p>{case_description}</p><p>Dziękujemy za Twoje wsparcie.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(124, 8, 'pt', 'Novo Caso de Suporte Atribuído - {case_subject}', '<p>Olá {assigned_user_name},</p><p>Um novo caso de suporte foi atribuído a si. Por favor, reveja os detalhes abaixo e tome as ações necessárias.</p><p><strong>Detalhes do Caso:</strong></p><ul><li>Assunto: {case_subject}</li><li>Prioridade: {case_priority}</li><li>Status: {case_status}</li><li>Data de criação: {case_created_date}</li></ul><p><strong>Descrição:</strong></p><p>{case_description}</p><p>Obrigado pelo seu apoio.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(125, 8, 'pt-BR', 'Novo Caso de Suporte Atribuído - {case_subject}', '<p>Olá {assigned_user_name},</p><p>Um novo caso de suporte foi atribuído a você. Por favor, revise os detalhes abaixo e tome as ações necessárias.</p><p><strong>Detalhes do Caso:</strong></p><ul><li>Assunto: {case_subject}</li><li>Prioridade: {case_priority}</li><li>Status: {case_status}</li><li>Data de criação: {case_created_date}</li></ul><p><strong>Descrição:</strong></p><p>{case_description}</p><p>Obrigado pelo seu apoio.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(126, 8, 'ru', 'Назначен новый случай поддержки - {case_subject}', '<p>Привет {assigned_user_name},</p><p>Вам назначен новый случай поддержки. Пожалуйста, ознакомьтесь с деталями ниже и примите необходимые меры.</p><p><strong>Детали случая:</strong></p><ul><li>Тема: {case_subject}</li><li>Приоритет: {case_priority}</li><li>Статус: {case_status}</li><li>Дата создания: {case_created_date}</li></ul><p><strong>Описание:</strong></p><p>{case_description}</p><p>Спасибо за вашу поддержку.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(127, 8, 'tr', 'Yeni Destek Vakası Atandı - {case_subject}', '<p>Merhaba {assigned_user_name},</p><p>Size yeni bir destek vakası atandı. Lütfen aşağıdaki ayrıntıları inceleyin ve gerekli adımları atın.</p><p><strong>Vaka Detayları:</strong></p><ul><li>Konu: {case_subject}</li><li>Öncelik: {case_priority}</li><li>Durum: {case_status}</li><li>Oluşturulma tarihi: {case_created_date}</li></ul><p><strong>Açıklama:</strong></p><p>{case_description}</p><p>Destekleriniz için teşekkür ederiz.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(128, 8, 'zh', '已分配新的支持案例 - {case_subject}', '<p>你好 {assigned_user_name}，</p><p>一个新的支持案例已分配给你。请查看以下详情并采取必要的措施。</p><p><strong>案例详情：</strong></p><ul><li>主题：{case_subject}</li><li>优先级：{case_priority}</li><li>状态：{case_status}</li><li>创建日期：{case_created_date}</li></ul><p><strong>描述：</strong></p><p>{case_description}</p><p>感谢你的支持。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(129, 9, 'en', 'New Opportunity Created - {opportunity_name}', '<p>Hello {assigned_user_name},</p><p>A new sales opportunity has been created and assigned to you. Please review the details below and take appropriate action.</p><p><strong>Opportunity Details:</strong></p><ul><li>Opportunity Name: {opportunity_name}</li><li>Account: {account_name}</li><li>Contact: {contact_name}</li><li>Stage: {opportunity_stage}</li><li>Amount: {opportunity_amount}</li><li>Close Date: {opportunity_close_date}</li></ul><p><strong>Description:</strong></p><p>{opportunity_description}</p><p>Please log into the system to view full opportunity details and begin working on this sales opportunity.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(130, 9, 'es', 'Nueva Oportunidad Creada - {opportunity_name}', '<p>Hola {assigned_user_name},</p><p>Se ha creado una nueva oportunidad de ventas y se le ha asignado. Por favor revise los detalles a continuación y tome las medidas apropiadas.</p><p><strong>Detalles de la Oportunidad:</strong></p><ul><li>Nombre de la Oportunidad: {opportunity_name}</li><li>Cuenta: {account_name}</li><li>Contacto: {contact_name}</li><li>Etapa: {opportunity_stage}</li><li>Monto: {opportunity_amount}</li><li>Fecha de Cierre: {opportunity_close_date}</li></ul><p><strong>Descripción:</strong></p><p>{opportunity_description}</p><p>Por favor inicie sesión en el sistema para ver los detalles completos de la oportunidad y comenzar a trabajar en esta oportunidad de ventas.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(131, 9, 'ar', 'تم إنشاء فرصة جديدة - {opportunity_name}', '<p>مرحباً {assigned_user_name}،</p><p>تم إنشاء فرصة مبيعات جديدة وتم تعيينها لك. يرجى مراجعة التفاصيل أدناه واتخاذ الإجراء المناسب.</p><p><strong>تفاصيل الفرصة:</strong></p><ul><li>اسم الفرصة: {opportunity_name}</li><li>الحساب: {account_name}</li><li>جهة الاتصال: {contact_name}</li><li>المرحلة: {opportunity_stage}</li><li>المبلغ: {opportunity_amount}</li><li>تاريخ الإغلاق: {opportunity_close_date}</li></ul><p><strong>الوصف:</strong></p><p>{opportunity_description}</p><p>يرجى تسجيل الدخول إلى النظام لعرض تفاصيل الفرصة الكاملة والبدء في العمل على فرصة المبيعات هذه.</p><p style=\"text-align: right;\">مع أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(132, 9, 'da', 'Ny Mulighed Oprettet - {opportunity_name}', '<p>Hej {assigned_user_name},</p><p>En ny salgsmulighed er blevet oprettet og tildelt til dig. Gennemgå venligst detaljerne nedenfor og tag passende handling.</p><p><strong>Muligheds Detaljer:</strong></p><ul><li>Muligheds Navn: {opportunity_name}</li><li>Konto: {account_name}</li><li>Kontakt: {contact_name}</li><li>Fase: {opportunity_stage}</li><li>Beløb: {opportunity_amount}</li><li>Lukkedato: {opportunity_close_date}</li></ul><p><strong>Beskrivelse:</strong></p><p>{opportunity_description}</p><p>Log venligst ind i systemet for at se fulde muligheds detaljer og begynde at arbejde på denne salgsmulighed.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(133, 9, 'de', 'Neue Verkaufschance Erstellt - {opportunity_name}', '<p>Hallo {assigned_user_name},</p><p>Eine neue Verkaufschance wurde erstellt und Ihnen zugewiesen. Bitte überprüfen Sie die Details unten und ergreifen Sie entsprechende Maßnahmen.</p><p><strong>Verkaufschancen Details:</strong></p><ul><li>Verkaufschancen Name: {opportunity_name}</li><li>Konto: {account_name}</li><li>Kontakt: {contact_name}</li><li>Phase: {opportunity_stage}</li><li>Betrag: {opportunity_amount}</li><li>Abschlussdatum: {opportunity_close_date}</li></ul><p><strong>Beschreibung:</strong></p><p>{opportunity_description}</p><p>Bitte loggen Sie sich in das System ein, um vollständige Verkaufschancen-Details anzuzeigen und mit der Arbeit an dieser Verkaufschance zu beginnen.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(134, 9, 'fr', 'Nouvelle Opportunité Créée - {opportunity_name}', '<p>Bonjour {assigned_user_name},</p><p>Une nouvelle opportunité de vente a été créée et vous a été assignée. Veuillez examiner les détails ci-dessous et prendre les mesures appropriées.</p><p><strong>Détails de l\'Opportunité:</strong></p><ul><li>Nom de l\'Opportunité: {opportunity_name}</li><li>Compte: {account_name}</li><li>Contact: {contact_name}</li><li>Étape: {opportunity_stage}</li><li>Montant: {opportunity_amount}</li><li>Date de Clôture: {opportunity_close_date}</li></ul><p><strong>Description:</strong></p><p>{opportunity_description}</p><p>Veuillez vous connecter au système pour voir les détails complets de l\'opportunité et commencer à travailler sur cette opportunité de vente.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(135, 9, 'he', 'הזדמנות חדשה נוצרה - {opportunity_name}', '<p>שלום {assigned_user_name},</p><p>הזדמנות מכירות חדשה נוצרה והוקצתה לך. אנא עיין בפרטים למטה ונקוט בפעולה המתאימה.</p><p><strong>פרטי ההזדמנות:</strong></p><ul><li>שם ההזדמנות: {opportunity_name}</li><li>חשבון: {account_name}</li><li>איש קשר: {contact_name}</li><li>שלב: {opportunity_stage}</li><li>סכום: {opportunity_amount}</li><li>תאריך סגירה: {opportunity_close_date}</li></ul><p><strong>תיאור:</strong></p><p>{opportunity_description}</p><p>אנא התחבר למערכת כדי לראות פרטי הזדמנות מלאים ולהתחיל לעבוד על הזדמנות מכירות זו.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(136, 9, 'it', 'Nuova Opportunità Creata - {opportunity_name}', '<p>Ciao {assigned_user_name},</p><p>Una nuova opportunità di vendita è stata creata e assegnata a te. Si prega di rivedere i dettagli qui sotto e prendere le azioni appropriate.</p><p><strong>Dettagli dell\'Opportunità:</strong></p><ul><li>Nome dell\'Opportunità: {opportunity_name}</li><li>Account: {account_name}</li><li>Contatto: {contact_name}</li><li>Fase: {opportunity_stage}</li><li>Importo: {opportunity_amount}</li><li>Data di Chiusura: {opportunity_close_date}</li></ul><p><strong>Descrizione:</strong></p><p>{opportunity_description}</p><p>Si prega di accedere al sistema per visualizzare i dettagli completi dell\'opportunità e iniziare a lavorare su questa opportunità di vendita.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(137, 9, 'ja', '新しい営業機会が作成されました - {opportunity_name}', '<p>こんにちは {assigned_user_name}さん、</p><p>新しい営業機会が作成され、あなたに割り当てられました。以下の詳細を確認し、適切な対応を取ってください。</p><p><strong>営業機会の詳細：</strong></p><ul><li>営業機会名：{opportunity_name}</li><li>アカウント：{account_name}</li><li>連絡先：{contact_name}</li><li>ステージ：{opportunity_stage}</li><li>金額：{opportunity_amount}</li><li>クローズ日：{opportunity_close_date}</li></ul><p><strong>説明：</strong></p><p>{opportunity_description}</p><p>システムにログインして営業機会の詳細を確認し、この営業機会の作業を開始してください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(138, 9, 'nl', 'Nieuwe Kans Aangemaakt - {opportunity_name}', '<p>Hallo {assigned_user_name},</p><p>Een nieuwe verkoopkans is aangemaakt en aan jou toegewezen. Bekijk de details hieronder en onderneem de juiste actie.</p><p><strong>Kans Details:</strong></p><ul><li>Kans Naam: {opportunity_name}</li><li>Account: {account_name}</li><li>Contact: {contact_name}</li><li>Fase: {opportunity_stage}</li><li>Bedrag: {opportunity_amount}</li><li>Sluitingsdatum: {opportunity_close_date}</li></ul><p><strong>Beschrijving:</strong></p><p>{opportunity_description}</p><p>Log in op het systeem om volledige kansdetails te bekijken en te beginnen met werken aan deze verkoopkans.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(139, 9, 'pl', 'Nowa Szansa Utworzona - {opportunity_name}', '<p>Cześć {assigned_user_name},</p><p>Nowa szansa sprzedażowa została utworzona i przypisana do Ciebie. Przejrzyj szczegóły poniżej i podejmij odpowiednie działania.</p><p><strong>Szczegóły Szansy:</strong></p><ul><li>Nazwa Szansy: {opportunity_name}</li><li>Konto: {account_name}</li><li>Kontakt: {contact_name}</li><li>Etap: {opportunity_stage}</li><li>Kwota: {opportunity_amount}</li><li>Data Zamknięcia: {opportunity_close_date}</li></ul><p><strong>Opis:</strong></p><p>{opportunity_description}</p><p>Zaloguj się do systemu, aby zobaczyć pełne szczegóły szansy i rozpocząć pracę nad tą szansą sprzedażową.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(140, 9, 'pt', 'Nova Oportunidade Criada - {opportunity_name}', '<p>Olá {assigned_user_name},</p><p>Uma nova oportunidade de vendas foi criada e atribuída a si. Por favor reveja os detalhes abaixo e tome as medidas apropriadas.</p><p><strong>Detalhes da Oportunidade:</strong></p><ul><li>Nome da Oportunidade: {opportunity_name}</li><li>Conta: {account_name}</li><li>Contacto: {contact_name}</li><li>Fase: {opportunity_stage}</li><li>Montante: {opportunity_amount}</li><li>Data de Fecho: {opportunity_close_date}</li></ul><p><strong>Descrição:</strong></p><p>{opportunity_description}</p><p>Por favor faça login no sistema para ver os detalhes completos da oportunidade e começar a trabalhar nesta oportunidade de vendas.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(141, 9, 'pt-BR', 'Nova Oportunidade Criada - {opportunity_name}', '<p>Olá {assigned_user_name},</p><p>Uma nova oportunidade de vendas foi criada e atribuída a você. Por favor revise os detalhes abaixo e tome as medidas apropriadas.</p><p><strong>Detalhes da Oportunidade:</strong></p><ul><li>Nome da Oportunidade: {opportunity_name}</li><li>Conta: {account_name}</li><li>Contato: {contact_name}</li><li>Estágio: {opportunity_stage}</li><li>Valor: {opportunity_amount}</li><li>Data de Fechamento: {opportunity_close_date}</li></ul><p><strong>Descrição:</strong></p><p>{opportunity_description}</p><p>Por favor faça login no sistema para ver os detalhes completos da oportunidade e começar a trabalhar nesta oportunidade de vendas.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(142, 9, 'ru', 'Создана новая возможность - {opportunity_name}', '<p>Привет {assigned_user_name},</p><p>Новая возможность продаж была создана и назначена вам. Пожалуйста, просмотрите детали ниже и предпримите соответствующие действия.</p><p><strong>Детали Возможности:</strong></p><ul><li>Название Возможности: {opportunity_name}</li><li>Аккаунт: {account_name}</li><li>Контакт: {contact_name}</li><li>Этап: {opportunity_stage}</li><li>Сумма: {opportunity_amount}</li><li>Дата Закрытия: {opportunity_close_date}</li></ul><p><strong>Описание:</strong></p><p>{opportunity_description}</p><p>Пожалуйста, войдите в систему, чтобы просмотреть полные детали возможности и начать работу над этой возможностью продаж.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(143, 9, 'tr', 'Yeni Fırsat Oluşturuldu - {opportunity_name}', '<p>Merhaba {assigned_user_name},</p><p>Yeni bir satış fırsatı oluşturuldu ve size atandı. Lütfen aşağıdaki detayları inceleyin ve uygun eylemi gerçekleştirin.</p><p><strong>Fırsat Detayları:</strong></p><ul><li>Fırsat Adı: {opportunity_name}</li><li>Hesap: {account_name}</li><li>İletişim: {contact_name}</li><li>Aşama: {opportunity_stage}</li><li>Tutar: {opportunity_amount}</li><li>Kapanış Tarihi: {opportunity_close_date}</li></ul><p><strong>Açıklama:</strong></p><p>{opportunity_description}</p><p>Lütfen tam fırsat detaylarını görüntülemek ve bu satış fırsatı üzerinde çalışmaya başlamak için sisteme giriş yapın.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(144, 9, 'zh', '新机会已创建 - {opportunity_name}', '<p>你好 {assigned_user_name}，</p><p>一个新的销售机会已创建并分配给您。请查看以下详细信息并采取适当行动。</p><p><strong>机会详情：</strong></p><ul><li>机会名称：{opportunity_name}</li><li>客户：{account_name}</li><li>联系人：{contact_name}</li><li>阶段：{opportunity_stage}</li><li>金额：{opportunity_amount}</li><li>关闭日期：{opportunity_close_date}</li></ul><p><strong>描述：</strong></p><p>{opportunity_description}</p><p>请登录系统查看完整的机会详情并开始处理这个销售机会。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(145, 10, 'en', 'Opportunity Stage Updated - {opportunity_name}', '<p>Hello {assigned_user_name},</p><p>The stage of your opportunity has been updated from <strong>{old_opportunity_stage}</strong> to <strong>{new_opportunity_stage}</strong>.</p><p><strong>Opportunity Details:</strong></p><ul><li>Opportunity Name: {opportunity_name}</li><li>Account: {account_name}</li><li>Contact: {contact_name}</li><li>Current Stage: {new_opportunity_stage}</li><li>Amount: {opportunity_amount}</li><li>Close Date: {opportunity_close_date}</li></ul><p><strong>Description:</strong></p><p>{opportunity_description}</p><p>Please continue working on this opportunity and update the progress as needed.</p><p style=\"text-align: right;\">Best regards,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(146, 10, 'es', 'Etapa de Oportunidad Actualizada - {opportunity_name}', '<p>Hola {assigned_user_name},</p><p>La etapa de su oportunidad ha sido actualizada de <strong>{old_opportunity_stage}</strong> a <strong>{new_opportunity_stage}</strong>.</p><p><strong>Detalles de la Oportunidad:</strong></p><ul><li>Nombre de la Oportunidad: {opportunity_name}</li><li>Cuenta: {account_name}</li><li>Contacto: {contact_name}</li><li>Etapa Actual: {new_opportunity_stage}</li><li>Monto: {opportunity_amount}</li><li>Fecha de Cierre: {opportunity_close_date}</li></ul><p><strong>Descripción:</strong></p><p>{opportunity_description}</p><p>Por favor continúe trabajando en esta oportunidad y actualice el progreso según sea necesario.</p><p style=\"text-align: right;\">Saludos cordiales,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(147, 10, 'ar', 'تم تحديث مرحلة الفرصة - {opportunity_name}', '<p>مرحباً {assigned_user_name}،</p><p>تم تحديث مرحلة فرصتك من <strong>{old_opportunity_stage}</strong> إلى <strong>{new_opportunity_stage}</strong>.</p><p><strong>تفاصيل الفرصة:</strong></p><ul><li>اسم الفرصة: {opportunity_name}</li><li>الحساب: {account_name}</li><li>جهة الاتصال: {contact_name}</li><li>المرحلة الحالية: {new_opportunity_stage}</li><li>المبلغ: {opportunity_amount}</li><li>تاريخ الإغلاق: {opportunity_close_date}</li></ul><p><strong>الوصف:</strong></p><p>{opportunity_description}</p><p>يرجى الاستمرار في العمل على هذه الفرصة وتحديث التقدم حسب الحاجة.</p><p style=\"text-align: right;\">أطيب التحيات،<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(148, 10, 'da', 'Muligheds Fase Opdateret - {opportunity_name}', '<p>Hej {assigned_user_name},</p><p>Fasen af din mulighed er blevet opdateret fra <strong>{old_opportunity_stage}</strong> til <strong>{new_opportunity_stage}</strong>.</p><p><strong>Muligheds Detaljer:</strong></p><ul><li>Muligheds Navn: {opportunity_name}</li><li>Konto: {account_name}</li><li>Kontakt: {contact_name}</li><li>Nuværende Fase: {new_opportunity_stage}</li><li>Beløb: {opportunity_amount}</li><li>Lukkedato: {opportunity_close_date}</li></ul><p><strong>Beskrivelse:</strong></p><p>{opportunity_description}</p><p>Fortsæt venligst med at arbejde på denne mulighed og opdater fremskridt efter behov.</p><p style=\"text-align: right;\">Med venlig hilsen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(149, 10, 'de', 'Verkaufschancen Phase Aktualisiert - {opportunity_name}', '<p>Hallo {assigned_user_name},</p><p>Die Phase Ihrer Verkaufschance wurde von <strong>{old_opportunity_stage}</strong> auf <strong>{new_opportunity_stage}</strong> aktualisiert.</p><p><strong>Verkaufschancen Details:</strong></p><ul><li>Verkaufschancen Name: {opportunity_name}</li><li>Konto: {account_name}</li><li>Kontakt: {contact_name}</li><li>Aktuelle Phase: {new_opportunity_stage}</li><li>Betrag: {opportunity_amount}</li><li>Abschlussdatum: {opportunity_close_date}</li></ul><p><strong>Beschreibung:</strong></p><p>{opportunity_description}</p><p>Bitte arbeiten Sie weiter an dieser Verkaufschance und aktualisieren Sie den Fortschritt nach Bedarf.</p><p style=\"text-align: right;\">Mit freundlichen Grüßen,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(150, 10, 'fr', 'Étape d\'Opportunité Mise à Jour - {opportunity_name}', '<p>Bonjour {assigned_user_name},</p><p>L\'étape de votre opportunité a été mise à jour de <strong>{old_opportunity_stage}</strong> à <strong>{new_opportunity_stage}</strong>.</p><p><strong>Détails de l\'Opportunité:</strong></p><ul><li>Nom de l\'Opportunité: {opportunity_name}</li><li>Compte: {account_name}</li><li>Contact: {contact_name}</li><li>Étape Actuelle: {new_opportunity_stage}</li><li>Montant: {opportunity_amount}</li><li>Date de Clôture: {opportunity_close_date}</li></ul><p><strong>Description:</strong></p><p>{opportunity_description}</p><p>Veuillez continuer à travailler sur cette opportunité et mettre à jour les progrès selon les besoins.</p><p style=\"text-align: right;\">Cordialement,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(151, 10, 'he', 'שלב ההזדמנות עודכן - {opportunity_name}', '<p>שלום {assigned_user_name},</p><p>שלב ההזדמנות שלך עודכן מ<strong>{old_opportunity_stage}</strong> ל<strong>{new_opportunity_stage}</strong>.</p><p><strong>פרטי ההזדמנות:</strong></p><ul><li>שם ההזדמנות: {opportunity_name}</li><li>חשבון: {account_name}</li><li>איש קשר: {contact_name}</li><li>שלב נוכחי: {new_opportunity_stage}</li><li>סכום: {opportunity_amount}</li><li>תאריך סגירה: {opportunity_close_date}</li></ul><p><strong>תיאור:</strong></p><p>{opportunity_description}</p><p>אנא המשך לעבוד על הזדמנות זו ועדכן את ההתקדמות לפי הצורך.</p><p style=\"text-align: right;\">בברכה,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(152, 10, 'it', 'Fase Opportunità Aggiornata - {opportunity_name}', '<p>Ciao {assigned_user_name},</p><p>La fase della tua opportunità è stata aggiornata da <strong>{old_opportunity_stage}</strong> a <strong>{new_opportunity_stage}</strong>.</p><p><strong>Dettagli dell\'Opportunità:</strong></p><ul><li>Nome dell\'Opportunità: {opportunity_name}</li><li>Account: {account_name}</li><li>Contatto: {contact_name}</li><li>Fase Attuale: {new_opportunity_stage}</li><li>Importo: {opportunity_amount}</li><li>Data di Chiusura: {opportunity_close_date}</li></ul><p><strong>Descrizione:</strong></p><p>{opportunity_description}</p><p>Si prega di continuare a lavorare su questa opportunità e aggiornare i progressi secondo necessità.</p><p style=\"text-align: right;\">Cordiali saluti,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(153, 10, 'ja', '営業機会のステージが更新されました - {opportunity_name}', '<p>こんにちは {assigned_user_name}さん、</p><p>あなたの営業機会のステージが<strong>{old_opportunity_stage}</strong>から<strong>{new_opportunity_stage}</strong>に更新されました。</p><p><strong>営業機会の詳細：</strong></p><ul><li>営業機会名：{opportunity_name}</li><li>アカウント：{account_name}</li><li>連絡先：{contact_name}</li><li>現在のステージ：{new_opportunity_stage}</li><li>金額：{opportunity_amount}</li><li>クローズ日：{opportunity_close_date}</li></ul><p><strong>説明：</strong></p><p>{opportunity_description}</p><p>この営業機会の作業を継続し、必要に応じて進捗を更新してください。</p><p style=\"text-align: right;\">よろしくお願いします、<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(154, 10, 'nl', 'Kans Fase Bijgewerkt - {opportunity_name}', '<p>Hallo {assigned_user_name},</p><p>De fase van jouw kans is bijgewerkt van <strong>{old_opportunity_stage}</strong> naar <strong>{new_opportunity_stage}</strong>.</p><p><strong>Kans Details:</strong></p><ul><li>Kans Naam: {opportunity_name}</li><li>Account: {account_name}</li><li>Contact: {contact_name}</li><li>Huidige Fase: {new_opportunity_stage}</li><li>Bedrag: {opportunity_amount}</li><li>Sluitingsdatum: {opportunity_close_date}</li></ul><p><strong>Beschrijving:</strong></p><p>{opportunity_description}</p><p>Ga door met werken aan deze kans en werk de voortgang bij indien nodig.</p><p style=\"text-align: right;\">Met vriendelijke groet,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(155, 10, 'pl', 'Etap Szansy Zaktualizowany - {opportunity_name}', '<p>Cześć {assigned_user_name},</p><p>Etap Twojej szansy został zaktualizowany z <strong>{old_opportunity_stage}</strong> na <strong>{new_opportunity_stage}</strong>.</p><p><strong>Szczegóły Szansy:</strong></p><ul><li>Nazwa Szansy: {opportunity_name}</li><li>Konto: {account_name}</li><li>Kontakt: {contact_name}</li><li>Obecny Etap: {new_opportunity_stage}</li><li>Kwota: {opportunity_amount}</li><li>Data Zamknięcia: {opportunity_close_date}</li></ul><p><strong>Opis:</strong></p><p>{opportunity_description}</p><p>Kontynuuj pracę nad tą szansą i aktualizuj postęp w razie potrzeby.</p><p style=\"text-align: right;\">Z poważaniem,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(156, 10, 'pt', 'Fase da Oportunidade Actualizada - {opportunity_name}', '<p>Olá {assigned_user_name},</p><p>A fase da sua oportunidade foi actualizada de <strong>{old_opportunity_stage}</strong> para <strong>{new_opportunity_stage}</strong>.</p><p><strong>Detalhes da Oportunidade:</strong></p><ul><li>Nome da Oportunidade: {opportunity_name}</li><li>Conta: {account_name}</li><li>Contacto: {contact_name}</li><li>Fase Actual: {new_opportunity_stage}</li><li>Montante: {opportunity_amount}</li><li>Data de Fecho: {opportunity_close_date}</li></ul><p><strong>Descrição:</strong></p><p>{opportunity_description}</p><p>Por favor continue a trabalhar nesta oportunidade e actualize o progresso conforme necessário.</p><p style=\"text-align: right;\">Cumprimentos,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(157, 10, 'pt-BR', 'Estágio da Oportunidade Atualizado - {opportunity_name}', '<p>Olá {assigned_user_name},</p><p>O estágio da sua oportunidade foi atualizado de <strong>{old_opportunity_stage}</strong> para <strong>{new_opportunity_stage}</strong>.</p><p><strong>Detalhes da Oportunidade:</strong></p><ul><li>Nome da Oportunidade: {opportunity_name}</li><li>Conta: {account_name}</li><li>Contato: {contact_name}</li><li>Estágio Atual: {new_opportunity_stage}</li><li>Valor: {opportunity_amount}</li><li>Data de Fechamento: {opportunity_close_date}</li></ul><p><strong>Descrição:</strong></p><p>{opportunity_description}</p><p>Por favor continue trabalhando nesta oportunidade e atualize o progresso conforme necessário.</p><p style=\"text-align: right;\">Atenciosamente,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(158, 10, 'ru', 'Этап возможности обновлен - {opportunity_name}', '<p>Привет {assigned_user_name},</p><p>Этап вашей возможности был обновлен с <strong>{old_opportunity_stage}</strong> на <strong>{new_opportunity_stage}</strong>.</p><p><strong>Детали Возможности:</strong></p><ul><li>Название Возможности: {opportunity_name}</li><li>Аккаунт: {account_name}</li><li>Контакт: {contact_name}</li><li>Текущий Этап: {new_opportunity_stage}</li><li>Сумма: {opportunity_amount}</li><li>Дата Закрытия: {opportunity_close_date}</li></ul><p><strong>Описание:</strong></p><p>{opportunity_description}</p><p>Пожалуйста, продолжайте работу над этой возможностью и обновляйте прогресс по мере необходимости.</p><p style=\"text-align: right;\">С уважением,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(159, 10, 'tr', 'Fırsat Aşaması Güncellendi - {opportunity_name}', '<p>Merhaba {assigned_user_name},</p><p>Fırsatınızın aşaması <strong>{old_opportunity_stage}</strong> seviyesinden <strong>{new_opportunity_stage}</strong> seviyesine güncellendi.</p><p><strong>Fırsat Detayları:</strong></p><ul><li>Fırsat Adı: {opportunity_name}</li><li>Hesap: {account_name}</li><li>İletişim: {contact_name}</li><li>Mevcut Aşama: {new_opportunity_stage}</li><li>Tutar: {opportunity_amount}</li><li>Kapanış Tarihi: {opportunity_close_date}</li></ul><p><strong>Açıklama:</strong></p><p>{opportunity_description}</p><p>Lütfen bu fırsat üzerinde çalışmaya devam edin ve gerektiğinde ilerlemeyi güncelleyin.</p><p style=\"text-align: right;\">Saygılarımızla,<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(160, 10, 'zh', '机会阶段已更新 - {opportunity_name}', '<p>你好 {assigned_user_name}，</p><p>您的机会阶段已从<strong>{old_opportunity_stage}</strong>更新为<strong>{new_opportunity_stage}</strong>。</p><p><strong>机会详情：</strong></p><ul><li>机会名称：{opportunity_name}</li><li>客户：{account_name}</li><li>联系人：{contact_name}</li><li>当前阶段：{new_opportunity_stage}</li><li>金额：{opportunity_amount}</li><li>关闭日期：{opportunity_close_date}</li></ul><p><strong>描述：</strong></p><p>{opportunity_description}</p><p>请继续处理这个机会并根据需要更新进度。</p><p style=\"text-align: right;\">此致敬礼，<br>{company_name}</p>', '2025-12-20 17:47:08', '2025-12-20 17:47:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
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
-- Estrutura para tabela `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_order_id` bigint UNSIGNED DEFAULT NULL,
  `quote_id` bigint UNSIGNED DEFAULT NULL,
  `opportunity_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('draft','sent','paid','partially_paid','overdue','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `terms` text COLLATE utf8mb4_unicode_ci,
  `payment_method` enum('stripe','paypal','bank_transfer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  KEY `invoices_sales_order_id_foreign` (`sales_order_id`),
  KEY `invoices_quote_id_foreign` (`quote_id`),
  KEY `invoices_opportunity_id_foreign` (`opportunity_id`),
  KEY `invoices_account_id_foreign` (`account_id`),
  KEY `invoices_contact_id_foreign` (`contact_id`),
  KEY `invoices_created_by_foreign` (`created_by`),
  KEY `invoices_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `invoice_activities`
--

DROP TABLE IF EXISTS `invoice_activities`;
CREATE TABLE IF NOT EXISTS `invoice_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_activities_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_activities_user_id_foreign` (`user_id`),
  KEY `invoice_activities_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `invoice_comments`
--

DROP TABLE IF EXISTS `invoice_comments`;
CREATE TABLE IF NOT EXISTS `invoice_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_comments_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_comments_user_id_foreign` (`user_id`),
  KEY `invoice_comments_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `invoice_payments`
--

DROP TABLE IF EXISTS `invoice_payments`;
CREATE TABLE IF NOT EXISTS `invoice_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','completed','failed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `processed_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_payments_invoice_id_status_index` (`invoice_id`,`status`),
  KEY `invoice_payments_payment_id_index` (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `invoice_products`
--

DROP TABLE IF EXISTS `invoice_products`;
CREATE TABLE IF NOT EXISTS `invoice_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount_type` enum('percentage','fixed','none') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_value` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `landing_page_custom_pages`
--

DROP TABLE IF EXISTS `landing_page_custom_pages`;
CREATE TABLE IF NOT EXISTS `landing_page_custom_pages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `landing_page_custom_pages_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `landing_page_custom_pages`
--

INSERT INTO `landing_page_custom_pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'about-us', 'About Our Sales SaaS Platform: Empowering businesses to <b>sell smarter, faster, and better</b>.<br>We are dedicated to helping companies streamline sales processes, optimize pipelines, and close deals with ease.<br>Our Sales SaaS solution centralizes customer data, automates repetitive tasks, and provides actionable insights to drive revenue growth.<br>Whether you\'re a startup or an enterprise, our platform adapts to your sales journey—from lead generation to customer retention—ensuring transparency, collaboration, and measurable success.<br><b>Stats:</b> &bull; 7+ Years Industry Experience &bull; 25K+ Active Users &bull; 80+ Countries Served<br><b>Our Mission:</b> Transform the way businesses sell by providing scalable, intelligent, and user-friendly sales management solutions.<br><b>Our Values:</b> Innovation, transparency, and customer success are at the heart of everything we build.<br><b>Our Commitment:</b> Deliver secure, scalable, and reliable sales solutions with world-class support.<br><b>Our Vision:</b> A future where every business maximizes its revenue potential through automation, data-driven decisions, and seamless customer engagement.', 'About Us - Sales SaaS Platform', 'Learn more about our Sales SaaS platform – designed to simplify sales management, optimize pipelines, and accelerate revenue growth for businesses worldwide.', 1, 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(2, 'Privacy Policy', 'privacy-policy', 'Your privacy is important to us. This Privacy Policy explains how our Sales SaaS platform collects, uses, and protects your information.<br><b>Information We Collect:</b> &bull; Business and personal details such as name, email, phone, and company information &bull; Sales pipeline, leads, deals, and customer interactions &bull; Billing and subscription details for account management &bull; Communication data including emails, chats, and activity logs &bull; System usage analytics to enhance platform performance<br><b>How We Use Your Information:</b> &bull; Provide, maintain, and improve Sales SaaS services &bull; Enable lead management, customer relationship tracking, and reporting &bull; Process payments, subscriptions, and invoices securely &bull; Send important updates, notifications, and promotional offers (with your consent) &bull; Monitor and enhance security, prevent fraud, and ensure compliance<br><b>Information Sharing:</b> We do not sell or trade personal or business data. Information may be shared with: &bull; Authorized company users and administrators &bull; Trusted third-party service providers (e.g., payment gateways, analytics tools) &bull; Legal authorities when required by law<br><b>Data Security:</b> We use encryption, firewalls, access control, and regular audits to safeguard customer and sales data from unauthorized access or misuse.<br><b>Data Retention:</b> Data is stored as long as your account remains active or as legally required. Upon request, data can be deleted, anonymized, or exported as needed.<br><b>Your Rights:</b> You have the right to access, correct, or request deletion of your personal data. You may also manage communication preferences or withdraw consent anytime by contacting our support team.', 'Privacy Policy - Sales SaaS', 'Read the privacy policy of our Sales SaaS platform to understand how sales, lead, and customer data is collected, used, and protected.', 1, 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(3, 'Terms of Service', 'terms-of-service', 'Please read these terms carefully before using our Sales SaaS platform. By accessing or using our services, you agree to these terms.<br><br>\n                                <b>Acceptance of Terms:</b> By creating an account or using our Sales SaaS product, you confirm that you have read, understood, and agree to be bound by these Terms of Service. If you do not agree, you may not use the platform.<br><br>\n                                <b>Service Description:</b> Our platform provides businesses with Sales and Customer Relationship Management (CRM) solutions, including but not limited to:<br>\n                                &bull; Lead and opportunity tracking<br>\n                                &bull; Sales pipeline and forecasting tools<br>\n                                &bull; Customer and contact management<br>\n                                &bull; Quotation and invoicing features<br>\n                                &bull; Reporting, analytics, and integrations<br><br>\n                                <b>User Responsibilities:</b> As a user of our Sales SaaS, you agree to:<br>\n                                &bull; Provide accurate and updated information when creating an account<br>\n                                &bull; Maintain confidentiality of your login credentials<br>\n                                &bull; Ensure that all uploaded content complies with applicable laws<br>\n                                &bull; Use the platform only for lawful sales and CRM management purposes<br><br>\n                                <b>Subscription & Payments:</b> You agree to pay all fees associated with your chosen plan in accordance with the billing terms. Failure to pay may result in suspension or termination of your account.<br><br>\n                                <b>Termination of Service:</b> We reserve the right to suspend or terminate your access if you violate these Terms or engage in harmful activities.<br><br>\n                                <b>Data & Privacy:</b> Your data will be handled per our Privacy Policy. You are responsible for safeguarding your account access.<br><br>\n                                <b>Limitation of Liability:</b> Our company shall not be held liable for any indirect, incidental, or consequential damages arising from your use of the Sales SaaS platform.', 'Terms of Service - Sales SaaS', 'Read our terms of service to understand the rules and responsibilities for using our Sales SaaS platform.', 1, 3, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(4, 'Contact Us', 'contact-us', 'Have questions about <b>Sales SaaS</b>? Our team is here to assist you with demos, pricing, integrations, and more.<br><br><b>Send us a Message:</b> Fill out the form with your Full Name, Email Address, Subject, and Message. Our dedicated support team will get back to you promptly.<br><br><b>Contact Information:</b><br>&bull; <b>Email Us:</b> support@salessaas.com (Average response time: within 24 hours)<br>&bull; <b>Call Us:</b> +1 (555) 987-6543 (Available Monday – Friday, 9am – 6pm EST)<br>&bull; <b>Visit Us:</b> 456 Growth St, Suite 200, New York, NY 10001<br><br><b>Business Hours:</b><br>&bull; Monday - Friday: 9:00 AM - 6:00 PM EST<br>&bull; Saturday: 10:00 AM - 2:00 PM EST<br>&bull; Sunday: Closed', 'Contact Us - Sales SaaS Support', 'Reach out to our Sales SaaS support team for inquiries, demos, pricing, or technical assistance. We’re here to help you succeed.', 1, 4, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(5, 'FAQ', 'faq', 'Find quick answers to the most <b>common questions</b> about using our Sales SaaS platform.<br><br>\n                            <b>Getting Started:</b><br>\n                            <b>What is Sales SaaS?</b> Sales SaaS is a cloud-based sales management platform that helps businesses streamline lead generation, track opportunities, manage pipelines, automate workflows, and close deals faster.<br>\n                            <b>How do I get started?</b> You can sign up for a free trial, set up your company profile, add your sales team, and start tracking leads and deals right away.<br><br>\n                            \n                            <b>Features & Plans:</b><br>\n                            <b>Which subscription plans are available?</b> We offer Basic, Professional, and Enterprise plans to fit teams of all sizes, each with advanced features such as pipeline automation, AI-driven insights, and reporting tools.<br>\n                            <b>Can I integrate Sales SaaS with other tools?</b> Yes, Sales SaaS integrates with popular CRMs, email marketing platforms, communication apps, and payment gateways.<br><br>\n                            \n                            <b>Analytics & Support:</b><br>\n                            <b>How does reporting work?</b> Our analytics dashboard provides real-time insights into sales performance, conversion rates, revenue forecasting, and team productivity.<br>\n                            <b>What support options are available?</b> We offer 24/7 email support, live chat, and phone assistance for premium users. You can also explore our Help Center for detailed guides and tutorials.', 'FAQ - Sales SaaS Help Center', 'Get answers to frequently asked questions about Sales SaaS, including features, pricing plans, integrations, and support options.', 1, 5, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(6, 'Refund Policy', 'refund-policy', 'We value your trust in <b>Sales SaaS</b> and are committed to delivering the best experience. Please review our refund policy below.<br><br>\n    \n                            <b>30-Day Money Back Guarantee:</b> We offer a 30-day money-back guarantee on all premium subscription plans. If Sales SaaS does not meet your expectations, you can request a full refund within 30 days of purchase.<br><br>\n                            \n                            <b>Eligible Refunds:</b><br>\n                            &bull; Monthly and annual subscription plans<br>\n                            &bull; One-time premium features or add-ons<br>\n                            &bull; Unused portions of prepaid services<br><br>\n                            \n                            <b>Refund Process:</b><br>\n                            1. Contact our support team within 30 days of purchase.<br>\n                            2. Provide your registered account details and reason for the refund.<br>\n                            3. Our team will review and process your request within 3–5 business days.<br>\n                            4. Refunds will be credited to your original payment method.<br><br>\n                            \n                            <b>Non-Refundable Items:</b><br>\n                            &bull; Custom development, consulting, or integration services<br>\n                            &bull; Third-party services or marketplace add-ons<br>\n                            &bull; Domain registration or external licensing fees<br>\n                            &bull; Subscriptions after the 30-day guarantee period<br><br>\n                            \n                            If you have any questions about our refund policy, please reach out to <b>support@sales-saas.com</b>. Our team is here to help.', 'Refund Policy - Sales SaaS', 'Read about the Sales SaaS refund policy, including our 30-day money-back guarantee and eligibility details.', 1, 6, '2025-12-20 17:47:09', '2025-12-20 17:47:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `landing_page_settings`
--

DROP TABLE IF EXISTS `landing_page_settings`;
CREATE TABLE IF NOT EXISTS `landing_page_settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Sales SaaS',
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'support@sales.com',
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '+1 (555) 123-4567',
  `contact_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'San Francisco, CA',
  `config_sections` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `landing_page_settings`
--

INSERT INTO `landing_page_settings` (`id`, `company_name`, `contact_email`, `contact_phone`, `contact_address`, `config_sections`, `created_at`, `updated_at`) VALUES
(1, 'Sales SaaS', 'support@sales.com', '+1 (555) 123-4567', 'San Francisco, CA', '{\"seo\": {\"meta_title\": \"Sales SaaS - Boost Your Sales & Grow Faster\", \"meta_keywords\": \"sales software, CRM, lead management, deal tracking, sales automation, SaaS\", \"meta_description\": \"All-in-one Sales SaaS platform to manage leads, close deals, and scale your business effortlessly.\"}, \"theme\": {\"favicon\": \"\", \"logo_dark\": \"\", \"logo_light\": \"\", \"accent_color\": \"#f7f7f7\", \"primary_color\": \"#10b981\", \"secondary_color\": \"#ffffff\"}, \"sections\": [{\"key\": \"header\", \"text_color\": \"#1f2937\", \"transparent\": false, \"button_style\": \"gradient\", \"background_color\": \"#ffffff\"}, {\"key\": \"hero\", \"image\": \"\", \"stats\": [{\"label\": \"Businesses Powered\", \"value\": \"5K+\"}, {\"label\": \"Modules Included\", \"value\": \"30+\"}, {\"label\": \"Customer Satisfaction\", \"value\": \"99%\"}], \"title\": \"All-in-One Sales SaaS to Power Your Business Growth\", \"height\": 600, \"layout\": \"image-right\", \"subtitle\": \"Manage leads, opportunities, quotes, orders, invoices, projects, and reports — all from one platform.\", \"text_color\": \"#1f2937\", \"background_color\": \"#f8fafc\", \"announcement_text\": \"🚀 Smart Reports & Advanced Analytics\", \"primary_button_text\": \"Start Free Trial\", \"secondary_button_text\": \"Login\"}, {\"key\": \"features\", \"image\": \"\", \"title\": \"Powerful Features to Streamline Your Sales\", \"layout\": \"grid\", \"columns\": 3, \"show_icons\": true, \"description\": \"From lead management to invoicing, get everything you need to manage and grow your sales pipeline in one platform.\", \"features_list\": [{\"icon\": \"users\", \"title\": \"CRM & Lead Management\", \"description\": \"Capture, nurture, and convert leads with smart automation tools.\"}, {\"icon\": \"zap\", \"title\": \"Opportunity & Pipeline\", \"description\": \"Track every deal stage and source to close more sales.\"}, {\"icon\": \"globe\", \"title\": \"Quotes & Orders\", \"description\": \"Create professional quotes, manage sales and purchase orders with ease.\"}, {\"icon\": \"smartphone\", \"title\": \"Invoices & Payments\", \"description\": \"Automate invoices, track payments, and simplify your billing process.\"}, {\"icon\": \"star\", \"title\": \"Projects & Tasks\", \"description\": \"Collaborate on projects, assign tasks, and deliver work on time.\"}, {\"icon\": \"bar-chart\", \"title\": \"Reports & Analytics\", \"description\": \"Gain deep insights with customizable reports and dashboards.\"}], \"background_color\": \"#ffffff\"}, {\"key\": \"screenshots\", \"title\": \"See Our Sales SaaS in Action\", \"subtitle\": \"Explore the modern interface and powerful modules that make managing your sales process effortless\", \"screenshots_list\": [{\"alt\": \"Sales SaaS Dashboard Overview\", \"src\": \"/screenshots/dashboard.png\", \"title\": \"Dashboard Overview\", \"description\": \"Get a complete view of leads, employees, projects, sales, projects, and performance insights in one place\"}, {\"alt\": \"CRM & Lead Management\", \"src\": \"/screenshots/crm.png\", \"title\": \"CRM & Lead Management\", \"description\": \"Easily manage accounts, contacts, and leads with a user-friendly CRM system\"}, {\"alt\": \"Quotes & Orders\", \"src\": \"/screenshots/orders.png\", \"title\": \"Quotes & Orders\", \"description\": \"Quickly generate quotes, process orders, and track every transaction with ease\"}, {\"alt\": \"Invoices & Payments\", \"src\": \"/screenshots/invoices.png\", \"title\": \"Invoices & Payments\", \"description\": \"Automate billing, manage payments, and simplify your financial workflows\"}, {\"alt\": \"Projects & Task Management\", \"src\": \"/screenshots/projects.png\", \"title\": \"Projects & Tasks\", \"description\": \"Plan, assign, and track tasks to deliver projects on time and boost team productivity.\"}, {\"alt\": \"Reports & Analytics\", \"src\": \"/screenshots/reports.png\", \"title\": \"Reports & Analytics\", \"description\": \"Visualize your sales performance with powerful reports and real-time analytics.\"}]}, {\"key\": \"why_choose_us\", \"stats\": [{\"color\": \"blue\", \"label\": \"Businesses Powered\", \"value\": \"5K+\"}, {\"color\": \"green\", \"label\": \"Customer Satisfaction\", \"value\": \"99%\"}], \"title\": \"Why Choose Our Sales SaaS?\", \"reasons\": [{\"icon\": \"clock\", \"title\": \"Quick Setup\", \"description\": \"Get started in minutes with a user-friendly interface and ready-to-use modules.\"}, {\"icon\": \"check-circle\", \"title\": \"All-in-One Solution\", \"description\": \"From leads to invoices, manage your entire sales process in one place.\"}, {\"icon\": \"zap\", \"title\": \"Boost Productivity\", \"description\": \"Streamline tasks, automate workflows, and close deals faster.\"}, {\"icon\": \"shield\", \"title\": \"Scalable & Secure\", \"description\": \"Built with enterprise-grade security and flexibility to grow with your business.\"}], \"subtitle\": \"We\'re more than just CRM — we\'re your complete sales growth platform.\"}, {\"key\": \"about\", \"image\": \"\", \"stats\": [{\"color\": \"blue\", \"label\": \"Industry Experience\", \"value\": \"4+ Years\"}, {\"color\": \"green\", \"label\": \"Happy Users\", \"value\": \"10K+\"}, {\"color\": \"purple\", \"label\": \"Businesses Powered\", \"value\": \"5K+\"}], \"title\": \"About Our Sales SaaS\", \"layout\": \"image-right\", \"description\": \"We are dedicated to simplifying and automating the entire sales lifecycle for businesses of all sizes.\", \"story_title\": \"Empowering Sales Teams Since 2020\", \"story_content\": \"Founded by a group of sales professionals and technology experts, our Sales SaaS was created to solve the common challenges businesses face in managing leads, orders, invoices, and projects. Today, we power thousands of businesses worldwide with a reliable, scalable, and easy-to-use platform.\", \"background_color\": \"#f9fafb\"}, {\"key\": \"team\", \"title\": \"Meet Our Team\", \"members\": [{\"bio\": \"Sales strategist and former tech executive with 15+ years of experience in scaling SaaS businesses.\", \"name\": \"Sarah Johnson\", \"role\": \"CEO & Founder\", \"email\": \"sarah@sales.com\", \"image\": \"\", \"linkedin\": \"#\"}, {\"bio\": \"Full-stack engineer specializing in Laravel and React with a passion for building scalable SaaS platforms.\", \"name\": \"Michael Lee\", \"role\": \"CTO\", \"email\": \"michael@sales.com\", \"image\": \"\", \"linkedin\": \"#\"}, {\"bio\": \"Product leader focused on delivering user-friendly sales solutions that solve real-world challenges.\", \"name\": \"Priya Sharma\", \"role\": \"Head of Product\", \"email\": \"priya@sales.com\", \"image\": \"\", \"linkedin\": \"#\"}, {\"bio\": \"Growth marketer with expertise in SaaS positioning, customer acquisition, and brand strategy.\", \"name\": \"David Kim\", \"role\": \"Head of Marketing\", \"email\": \"david@sales.com\", \"image\": \"\", \"linkedin\": \"#\"}], \"subtitle\": \"We are a passionate group of sales experts, developers, and innovators building the future of sales automation.\", \"cta_title\": \"Want to Join Our Team?\", \"cta_button_text\": \"View Open Positions\", \"cta_description\": \"We are always looking for talented individuals to help us shape the next generation of sales technology.\"}, {\"key\": \"testimonials\", \"title\": \"What Our Clients Say\", \"subtitle\": \"Don\'t just take our word for it — hear from businesses using our Sales SaaS.\", \"trust_stats\": [{\"color\": \"blue\", \"label\": \"Average Rating\", \"value\": \"4.9/5\"}, {\"color\": \"green\", \"label\": \"Happy Businesses\", \"value\": \"10K+\"}], \"trust_title\": \"Trusted by Businesses Worldwide\", \"testimonials\": [{\"name\": \"Alex Thompson\", \"role\": \"Sales Director\", \"rating\": 5, \"company\": \"TechCorp Inc.\", \"content\": \"This platform has transformed how we manage leads and opportunities. Our conversion rate has doubled since adopting it!\"}, {\"name\": \"Maria Lopez\", \"role\": \"Operations Manager\", \"rating\": 5, \"company\": \"Global Enterprises\", \"content\": \"Invoices and orders are now automated, saving us hours every week. The reports feature gives us clear insights into performance.\"}, {\"name\": \"Ravi Patel\", \"role\": \"Founder & CEO\", \"rating\": 5, \"company\": \"StartUp Hub\", \"content\": \"As a growing business, we needed a scalable CRM and project management tool. This SaaS delivers everything in one place!\"}]}, {\"key\": \"plans\", \"title\": \"Choose Your Plan\", \"faq_text\": \"Have questions about our plans? Contact our sales team\", \"subtitle\": \"Start with our free plan and upgrade as your business grows.\"}, {\"key\": \"faq\", \"faqs\": [{\"answer\": \"Unlike other tools, our platform is built to help you grow faster. With powerful automation, real-time analytics, and world-class support, you’ll get results from day one.\", \"question\": \"What makes this SaaS different from others?\"}, {\"answer\": \"Not at all! You can start with our free trial today. No credit card required. Upgrade anytime when you’re ready to unlock advanced features.\", \"question\": \"Do I need to pay upfront to get started?\"}, {\"answer\": \"Yes! Our pricing is flexible. Start small and scale seamlessly — whether you’re a freelancer, startup, or enterprise, we have a plan tailored for your growth.\", \"question\": \"Can I scale my plan as my business grows?\"}, {\"answer\": \"We use enterprise-grade encryption and follow strict compliance standards, so your data is always safe. Security is our top priority.\", \"question\": \"How secure is my data on your platform?\"}, {\"answer\": \"Every plan includes email support, and higher tiers unlock priority support with a dedicated account manager — so you’re never left waiting.\", \"question\": \"What kind of support do I get?\"}, {\"answer\": \"Paid plans unlock premium features like advanced analytics, integrations, team management, and unlimited usage — giving your business the competitive edge it needs.\", \"question\": \"Why should I upgrade to a paid plan?\"}], \"title\": \"Frequently Asked Questions\", \"cta_text\": \"Didn’t find your answer?\", \"subtitle\": \"Everything you need to know before getting started.\", \"button_text\": \"Talk to Sales\"}, {\"key\": \"newsletter\", \"title\": \"Stay Updated with Sales SaaS\", \"benefits\": [{\"icon\": \"📧\", \"title\": \"Weekly Insights\", \"description\": \"Proven sales strategies and SaaS growth hacks\"}, {\"icon\": \"🚀\", \"title\": \"Product Updates\", \"description\": \"Stay informed about new features and improvements\"}, {\"icon\": \"📊\", \"title\": \"Data-Driven Tips\", \"description\": \"Learn how to optimize sales with actionable analytics\"}], \"subtitle\": \"Get the latest sales strategies, product updates, and growth insights.\", \"privacy_text\": \"We value your privacy — no spam, unsubscribe anytime.\"}, {\"key\": \"contact\", \"title\": \"Connect with Sales SaaS\", \"layout\": \"split\", \"subtitle\": \"Have questions about Sales SaaS? Our team is here to help you succeed.\", \"form_title\": \"Send us a Message\", \"info_title\": \"Contact Information\", \"background_color\": \"#f9fafb\", \"info_description\": \"We\'re here to help and answer any question you might have.\"}, {\"key\": \"footer\", \"links\": {\"legal\": [{\"href\": \"#privacy-policy\", \"name\": \"Privacy Policy\"}, {\"href\": \"#terms-of-service\", \"name\": \"Terms of Service\"}], \"company\": [{\"href\": \"#about\", \"name\": \"About Us\"}, {\"href\": \"#careers\", \"name\": \"Careers\"}, {\"href\": \"#contact\", \"name\": \"Contact\"}], \"product\": [{\"href\": \"#features\", \"name\": \"Features\"}, {\"href\": \"#pricing\", \"name\": \"Pricing\"}, {\"href\": \"#integrations\", \"name\": \"Integrations\"}], \"support\": [{\"href\": \"#help-center\", \"name\": \"Help Center\"}, {\"href\": \"#faqs\", \"name\": \"FAQs\"}]}, \"description\": \"Empowering businesses to boost sales and grow faster with our all-in-one Sales SaaS platform.\", \"social_links\": [{\"href\": \"#\", \"icon\": \"Facebook\", \"name\": \"Facebook\"}, {\"href\": \"#\", \"icon\": \"Twitter\", \"name\": \"Twitter\"}, {\"href\": \"#\", \"icon\": \"Linkedin\", \"name\": \"LinkedIn\"}, {\"href\": \"#\", \"icon\": \"Instagram\", \"name\": \"Instagram\"}], \"section_titles\": {\"company\": \"Company\", \"product\": \"Product\"}, \"newsletter_title\": \"Stay Ahead\", \"newsletter_subtitle\": \"Subscribe for sales tips, product updates, and growth insights.\"}], \"custom_js\": \"\", \"custom_css\": \"\", \"section_order\": [\"header\", \"hero\", \"features\", \"screenshots\", \"why_choose_us\", \"about\", \"team\", \"testimonials\", \"plans\", \"faq\", \"newsletter\", \"contact\", \"footer\"], \"section_visibility\": {\"faq\": true, \"hero\": true, \"team\": true, \"about\": true, \"plans\": true, \"footer\": true, \"header\": true, \"contact\": true, \"features\": true, \"newsletter\": true, \"screenshots\": true, \"testimonials\": true, \"why_choose_us\": true}}', '2025-12-20 17:47:44', '2025-12-20 17:47:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE IF NOT EXISTS `leads` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_industry_id` bigint UNSIGNED DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `value` decimal(15,2) DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_converted` tinyint(1) NOT NULL DEFAULT '0',
  `lead_status_id` bigint UNSIGNED DEFAULT NULL,
  `lead_source_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `campaign_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_account_industry_id_foreign` (`account_industry_id`),
  KEY `leads_lead_status_id_foreign` (`lead_status_id`),
  KEY `leads_lead_source_id_foreign` (`lead_source_id`),
  KEY `leads_created_by_foreign` (`created_by`),
  KEY `leads_assigned_to_foreign` (`assigned_to`),
  KEY `leads_campaign_id_foreign` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lead_activities`
--

DROP TABLE IF EXISTS `lead_activities`;
CREATE TABLE IF NOT EXISTS `lead_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_activities_user_id_foreign` (`user_id`),
  KEY `lead_activities_lead_id_created_at_index` (`lead_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lead_comments`
--

DROP TABLE IF EXISTS `lead_comments`;
CREATE TABLE IF NOT EXISTS `lead_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_comments_lead_id_foreign` (`lead_id`),
  KEY `lead_comments_user_id_foreign` (`user_id`),
  KEY `lead_comments_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lead_sources`
--

DROP TABLE IF EXISTS `lead_sources`;
CREATE TABLE IF NOT EXISTS `lead_sources` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_sources_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lead_statuses`
--

DROP TABLE IF EXISTS `lead_statuses`;
CREATE TABLE IF NOT EXISTS `lead_statuses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_statuses_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_histories`
--

DROP TABLE IF EXISTS `login_histories`;
CREATE TABLE IF NOT EXISTS `login_histories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `details` json NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'login',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_histories_user_id_index` (`user_id`),
  KEY `login_histories_created_by_index` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `login_histories`
--

INSERT INTO `login_histories` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2025-12-20', '{\"as\": null, \"isp\": null, \"lat\": null, \"lon\": null, \"org\": null, \"zip\": null, \"city\": null, \"query\": \"127.0.0.1\", \"region\": null, \"status\": \"success\", \"country\": null, \"os_name\": \"Windows\", \"timezone\": null, \"regionName\": null, \"countryCode\": null, \"device_type\": \"desktop\", \"browser_name\": \"Chrome\", \"referrer_host\": \"127.0.0.1\", \"referrer_path\": \"/login\", \"browser_language\": \"en\"}', 'superadmin', 1, '2025-12-20 17:47:42', '2025-12-20 17:47:42'),
(2, 1, '127.0.0.1', '2025-12-20', '{\"as\": null, \"isp\": null, \"lat\": null, \"lon\": null, \"org\": null, \"zip\": null, \"city\": null, \"query\": \"127.0.0.1\", \"region\": null, \"status\": \"success\", \"country\": null, \"os_name\": \"Windows\", \"timezone\": null, \"regionName\": null, \"countryCode\": null, \"device_type\": \"desktop\", \"browser_name\": \"Chrome\", \"referrer_host\": \"127.0.0.1\", \"referrer_path\": \"/login\", \"browser_language\": \"en\"}', 'superadmin', 1, '2025-12-20 23:36:10', '2025-12-20 23:36:10'),
(3, 1, '127.0.0.1', '2025-12-20', '{\"as\": null, \"isp\": null, \"lat\": null, \"lon\": null, \"org\": null, \"zip\": null, \"city\": null, \"query\": \"127.0.0.1\", \"region\": null, \"status\": \"success\", \"country\": null, \"os_name\": \"Windows\", \"timezone\": null, \"regionName\": null, \"countryCode\": null, \"device_type\": \"desktop\", \"browser_name\": \"Chrome\", \"referrer_host\": \"127.0.0.1\", \"referrer_path\": \"/login\", \"browser_language\": \"en\"}', 'superadmin', 1, '2025-12-21 01:50:07', '2025-12-21 01:50:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_user_id_foreign` (`user_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\MediaItem', 1, 'd4fbc42e-d460-4276-afe6-d9ff3174ac79', 'images', 'cyzer_logo2_light', 'cyzer_logo2_light.png', 'image/png', 'public', 'public', 12192, '[]', '[]', '{\"thumb\": true}', '[]', 1, 1, '2025-12-20 18:01:46', '2025-12-20 18:01:47'),
(2, 'App\\Models\\MediaItem', 2, 'f56e08ee-3f21-4bc0-993e-556b2d92c9e0', 'images', 'cyzer_logo2_white2', 'cyzer_logo2_white2.png', 'image/png', 'public', 'public', 12553, '[]', '[]', '{\"thumb\": true}', '[]', 1, 1, '2025-12-20 18:02:27', '2025-12-20 18:02:27'),
(3, 'App\\Models\\MediaItem', 3, 'cedb9ce9-c18e-4d6e-93ff-d464dce63262', 'images', 'profile_1', 'profile_1.png', 'image/png', 'public', 'public', 24238, '[]', '[]', '{\"thumb\": true}', '[]', 1, 1, '2025-12-20 18:03:04', '2025-12-20 18:03:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `media_items`
--

DROP TABLE IF EXISTS `media_items`;
CREATE TABLE IF NOT EXISTS `media_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `media_items`
--

INSERT INTO `media_items` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'cyzer_logo2_light.png', NULL, '2025-12-20 18:01:45', '2025-12-20 18:01:45'),
(2, 'cyzer_logo2_white2.png', NULL, '2025-12-20 18:02:27', '2025-12-20 18:02:27'),
(3, 'profile_1.png', NULL, '2025-12-20 18:03:04', '2025-12-20 18:03:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `meetings`
--

DROP TABLE IF EXISTS `meetings`;
CREATE TABLE IF NOT EXISTS `meetings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `parent_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('planned','held','not_held') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'planned',
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_created_by_foreign` (`created_by`),
  KEY `meetings_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `meeting_attendees`
--

DROP TABLE IF EXISTS `meeting_attendees`;
CREATE TABLE IF NOT EXISTS `meeting_attendees` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint UNSIGNED NOT NULL,
  `attendee_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendee_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_attendees_meeting_id_foreign` (`meeting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_27_084150_create_landing_page_settings_table', 1),
(5, '2025_01_28_000001_create_webhooks_table', 1),
(6, '2025_01_29_000001_create_taxes_table', 1),
(7, '2025_01_29_000002_create_brands_table', 1),
(8, '2025_01_29_000003_create_account_types_table', 1),
(9, '2025_01_29_000003_create_categories_table', 1),
(10, '2025_01_29_000004_create_account_industries_table', 1),
(11, '2025_01_29_000004_create_products_table', 1),
(12, '2025_01_29_000005_create_accounts_table', 1),
(13, '2025_01_29_000006_create_contacts_table', 1),
(14, '2025_01_29_000007_create_lead_statuses_table', 1),
(15, '2025_01_29_000008_create_lead_sources_table', 1),
(16, '2025_01_29_000010_create_opportunity_stages_table', 1),
(17, '2025_01_29_000011_create_campaign_types_table', 1),
(18, '2025_01_29_000011_create_opportunity_sources_table', 1),
(19, '2025_01_29_000012_create_opportunities_table', 1),
(20, '2025_01_29_000012_create_target_lists_table', 1),
(21, '2025_01_29_000013_create_campaigns_table', 1),
(22, '2025_01_29_000013_create_opportunity_products_table', 1),
(23, '2025_01_29_000014_create_leads_table', 1),
(24, '2025_01_29_000015_create_cases_table', 1),
(25, '2025_01_29_000016_create_shipping_provider_types_table', 1),
(26, '2025_01_29_000020_create_projects_table', 1),
(27, '2025_01_29_000020_create_task_statuses_table', 1),
(28, '2025_01_29_000021_create_project_tasks_table', 1),
(29, '2025_01_29_000030_create_document_folders_table', 1),
(30, '2025_01_29_000031_create_document_types_table', 1),
(31, '2025_01_29_000032_create_documents_table', 1),
(32, '2025_01_30_000001_create_meetings_table', 1),
(33, '2025_01_30_000001_create_notification_templates_table', 1),
(34, '2025_01_30_000001_create_quotes_table', 1),
(35, '2025_01_30_000001_create_sales_orders_table', 1),
(36, '2025_01_30_000002_create_meeting_attendees_table', 1),
(37, '2025_01_30_000002_create_notification_template_langs_table', 1),
(38, '2025_01_30_000002_create_quote_products_table', 1),
(39, '2025_01_30_000002_create_sales_order_products_table', 1),
(40, '2025_01_30_000002_create_user_notification_templates_table', 1),
(41, '2025_01_30_000003_create_calls_table', 1),
(42, '2025_01_30_000003_create_invoices_table', 1),
(43, '2025_01_30_000004_create_call_attendees_table', 1),
(44, '2025_01_30_000004_create_invoice_products_table', 1),
(45, '2025_01_30_000005_create_invoice_activities_table', 1),
(46, '2025_01_30_000006_create_invoice_comments_table', 1),
(47, '2025_01_30_120000_create_return_orders_table', 1),
(48, '2025_01_30_120001_create_return_order_product_table', 1),
(49, '2025_01_31_000001_create_delivery_orders_table', 1),
(50, '2025_01_31_000002_create_delivery_order_products_table', 1),
(51, '2025_01_31_000010_create_purchase_orders_table', 1),
(52, '2025_01_31_000011_create_purchase_order_products_table', 1),
(53, '2025_01_31_000012_create_purchase_order_activities_table', 1),
(54, '2025_01_31_000013_create_purchase_order_comments_table', 1),
(55, '2025_01_31_000020_create_receipt_orders_table', 1),
(56, '2025_01_31_000021_create_receipt_order_products_table', 1),
(57, '2025_05_25_000000_create_permission_tables', 2),
(58, '2025_06_18_000001_create_plans_table', 2),
(59, '2025_06_18_105755_create_settings_table', 2),
(60, '2025_06_19_051735_create_coupons_table', 2),
(61, '2025_06_19_084856_create_plan_requests_table', 2),
(62, '2025_06_19_085023_create_plan_orders_table', 2),
(63, '2025_06_20_044143_create_referral_settings_table', 2),
(64, '2025_06_20_044158_create_referrals_table', 2),
(65, '2025_06_20_044206_create_payout_requests_table', 2),
(66, '2025_06_24_044208_create_currencies_table', 2),
(67, '2025_06_26_100501_create_payment_settings_table', 2),
(68, '2025_06_27_053245_create_media_table', 2),
(69, '2025_06_27_060535_create_media_items_table', 2),
(70, '2025_06_27_115807_create_email_templates_table', 2),
(71, '2025_06_27_115820_create_email_template_langs_table', 2),
(72, '2025_06_27_115828_create_user_email_templates_table', 2),
(73, '2025_07_02_094334_create_landing_page_custom_pages_table', 2),
(74, '2025_08_08_085111_create_lead_activities_table', 2),
(75, '2025_08_08_115553_create_lead_comments_table', 2),
(76, '2025_08_11_090404_create_quote_activities_table', 2),
(77, '2025_08_11_090819_create_quote_comments_table', 2),
(78, '2025_08_11_092346_create_sales_order_activities_table', 2),
(79, '2025_08_11_111152_create_account_activities_table', 2),
(80, '2025_08_11_111510_create_account_comments_table', 2),
(81, '2025_08_11_115519_create_opportunity_activities_table', 2),
(82, '2025_08_11_115538_create_opportunity_comments_table', 2),
(83, '2025_08_12_111557_create_invoice_payments_table', 2),
(84, '2025_09_25_063335_create_contact_messages_table', 2),
(85, '2025_09_25_090314_create_newsletters_table', 2),
(86, '2025_10_06_083830_create_login_histories_table', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletters_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE IF NOT EXISTS `notification_templates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'twilio',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Lead Create', 'twilio', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(2, 'Opportunity create', 'twilio', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(3, 'Account create', 'twilio', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(4, 'Quote Create', 'twilio', '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(5, 'Case Create', 'twilio', '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(6, 'Meeting Create', 'twilio', '2025-12-20 17:47:09', '2025-12-20 17:47:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_template_langs`
--

DROP TABLE IF EXISTS `notification_template_langs`;
CREATE TABLE IF NOT EXISTS `notification_template_langs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_template_langs_parent_id_lang_created_by_unique` (`parent_id`,`lang`,`created_by`),
  KEY `notification_template_langs_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `notification_template_langs`
--

INSERT INTO `notification_template_langs` (`id`, `parent_id`, `lang`, `title`, `content`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'New Lead Create', 'Hello {lead_name}, thank you for showing interest in {company_name}.Our team will contact you shortly to assist with your needs. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(2, 1, 'es', 'Nuevo Lead Creado', 'Hola {lead_name}, gracias por mostrar interés en {company_name}. Nuestro equipo se pondrá en contacto contigo pronto para ayudarte con tus necesidades. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(3, 1, 'ar', 'عميل محتمل جديد', 'مرحبا {lead_name}، شكرا لك لإظهار الاهتمام في {company_name}. سيتصل بك فريقنا قريبا لمساعدتك في احتياجاتك. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(4, 1, 'da', 'Nyt Lead Oprettet', 'Hej {lead_name}, tak for at vise interesse for {company_name}. Vores team vil kontakte dig snart for at hjælpe med dine behov. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(5, 1, 'de', 'Neuer Lead Erstellt', 'Hallo {lead_name}, vielen Dank für Ihr Interesse an {company_name}. Unser Team wird Sie bald kontaktieren, um Ihnen bei Ihren Bedürfnissen zu helfen. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(6, 1, 'fr', 'Nouveau Lead Créé', 'Bonjour {lead_name}, merci de montrer de l\'intérêt pour {company_name}. Notre équipe vous contactera bientôt pour vous aider avec vos besoins. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(7, 1, 'he', 'ליד חדש נוצר', 'שלום {lead_name}, תודה על הענין ב{company_name}. הצוות שלנו יצור איתך קשר בקרוב כדי לעזור עם הצרכים שלך. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(8, 1, 'it', 'Nuovo Lead Creato', 'Ciao {lead_name}, grazie per aver mostrato interesse in {company_name}. Il nostro team ti contatterà presto per aiutarti con le tue esigenze. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(9, 1, 'ja', '新しいリード作成', 'こんにちは{lead_name}、{company_name}に興味を示していただきありがとうございます。私たちのチームがあなたのニーズをお手伝いするためにすぐにご連絡いたします。 - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(10, 1, 'nl', 'Nieuwe Lead Aangemaakt', 'Hallo {lead_name}, bedankt voor je interesse in {company_name}. Ons team zal je binnenkort contacteren om je te helpen met je behoeften. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(11, 1, 'pl', 'Nowy Lead Utworzony', 'Cześć {lead_name}, dziękujemy za zainteresowanie {company_name}. Nasz zespół skontaktuje się z Tobą wkrótce, aby pomóc z Twoimi potrzebami. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(12, 1, 'pt', 'Novo Lead Criado', 'Olá {lead_name}, obrigado por mostrar interesse em {company_name}. Nossa equipe entrará em contato em breve para ajudar com suas necessidades. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(13, 1, 'pt-BR', 'Novo Lead Criado', 'Olá {lead_name}, obrigado por mostrar interesse em {company_name}. Nossa equipe entrará em contato em breve para ajudar com suas necessidades. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(14, 1, 'ru', 'Новый Лид Создан', 'Привет {lead_name}, спасибо за интерес к {company_name}. Наша команда свяжется с вами в ближайшее время, чтобы помочь с вашими потребностями. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(15, 1, 'tr', 'Yeni Müşteri Adayı Oluşturuldu', 'Merhaba {lead_name}, {company_name}\'e ilgi gösterdiğiniz için teşekkürler. Ekibimiz ihtiyaçlarınızla ilgili yardım etmek için yakında sizinle iletişime geçecek. - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(16, 1, 'zh', '新潜在客户创建', '你好{lead_name}，感谢您对{company_name}的关注。我们的团队将很快与您联系，协助满足您的需求。 - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(17, 1, 'en', 'New Lead Create', 'Hello {lead_name}, thank you for showing interest in {company_name}.Our team will contact you shortly to assist with your needs. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(18, 1, 'es', 'Nuevo Lead Creado', 'Hola {lead_name}, gracias por mostrar interés en {company_name}. Nuestro equipo se pondrá en contacto contigo pronto para ayudarte con tus necesidades. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(19, 1, 'ar', 'عميل محتمل جديد', 'مرحبا {lead_name}، شكرا لك لإظهار الاهتمام في {company_name}. سيتصل بك فريقنا قريبا لمساعدتك في احتياجاتك. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(20, 1, 'da', 'Nyt Lead Oprettet', 'Hej {lead_name}, tak for at vise interesse for {company_name}. Vores team vil kontakte dig snart for at hjælpe med dine behov. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(21, 1, 'de', 'Neuer Lead Erstellt', 'Hallo {lead_name}, vielen Dank für Ihr Interesse an {company_name}. Unser Team wird Sie bald kontaktieren, um Ihnen bei Ihren Bedürfnissen zu helfen. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(22, 1, 'fr', 'Nouveau Lead Créé', 'Bonjour {lead_name}, merci de montrer de l\'intérêt pour {company_name}. Notre équipe vous contactera bientôt pour vous aider avec vos besoins. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(23, 1, 'he', 'ליד חדש נוצר', 'שלום {lead_name}, תודה על הענין ב{company_name}. הצוות שלנו יצור איתך קשר בקרוב כדי לעזור עם הצרכים שלך. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(24, 1, 'it', 'Nuovo Lead Creato', 'Ciao {lead_name}, grazie per aver mostrato interesse in {company_name}. Il nostro team ti contatterà presto per aiutarti con le tue esigenze. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(25, 1, 'ja', '新しいリード作成', 'こんにちは{lead_name}、{company_name}に興味を示していただきありがとうございます。私たちのチームがあなたのニーズをお手伝いするためにすぐにご連絡いたします。 - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(26, 1, 'nl', 'Nieuwe Lead Aangemaakt', 'Hallo {lead_name}, bedankt voor je interesse in {company_name}. Ons team zal je binnenkort contacteren om je te helpen met je behoeften. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(27, 1, 'pl', 'Nowy Lead Utworzony', 'Cześć {lead_name}, dziękujemy za zainteresowanie {company_name}. Nasz zespół skontaktuje się z Tobą wkrótce, aby pomóc z Twoimi potrzebami. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(28, 1, 'pt', 'Novo Lead Criado', 'Olá {lead_name}, obrigado por mostrar interesse em {company_name}. Nossa equipe entrará em contato em breve para ajudar com suas necessidades. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(29, 1, 'pt-BR', 'Novo Lead Criado', 'Olá {lead_name}, obrigado por mostrar interesse em {company_name}. Nossa equipe entrará em contato em breve para ajudar com suas necessidades. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(30, 1, 'ru', 'Новый Лид Создан', 'Привет {lead_name}, спасибо за интерес к {company_name}. Наша команда свяжется с вами в ближайшее время, чтобы помочь с вашими потребностями. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(31, 1, 'tr', 'Yeni Müşteri Adayı Oluşturuldu', 'Merhaba {lead_name}, {company_name}\'e ilgi gösterdiğiniz için teşekkürler. Ekibimiz ihtiyaçlarınızla ilgili yardım etmek için yakında sizinle iletişime geçecek. - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(32, 1, 'zh', '新潜在客户创建', '你好{lead_name}，感谢您对{company_name}的关注。我们的团队将很快与您联系，协助满足您的需求。 - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(33, 2, 'en', 'New opportunity', 'New opportunity: {opportunity_name} worth ${amount}. Account: {account_name}. Close date: {close_date}. Take action now! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(34, 2, 'es', 'Nueva oportunidad', 'Nueva oportunidad: {opportunity_name} por valor de ${amount}. Cuenta: {account_name}. Fecha de cierre: {close_date}. ¡Actúa ahora! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(35, 2, 'ar', 'فرصة جديدة', 'فرصة جديدة: {opportunity_name} بقيمة ${amount}. الحساب: {account_name}. تاريخ الإغلاق: {close_date}. اتخذ إجراء الآن! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(36, 2, 'da', 'Ny mulighed', 'Ny mulighed: {opportunity_name} til værdi af ${amount}. Konto: {account_name}. Lukkedato: {close_date}. Tag handling nu! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(37, 2, 'de', 'Neue Gelegenheit', 'Neue Gelegenheit: {opportunity_name} im Wert von ${amount}. Konto: {account_name}. Abschlussdatum: {close_date}. Handeln Sie jetzt! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(38, 2, 'fr', 'Nouvelle opportunité', 'Nouvelle opportunité: {opportunity_name} d\'une valeur de ${amount}. Compte: {account_name}. Date de clôture: {close_date}. Agissez maintenant! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(39, 2, 'he', 'הזדמנות חדשה', 'הזדמנות חדשה: {opportunity_name} בשווי ${amount}. חשבון: {account_name}. תאריך סגירה: {close_date}. פעל עכשיו! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(40, 2, 'it', 'Nuova opportunità', 'Nuova opportunità: {opportunity_name} del valore di ${amount}. Account: {account_name}. Data di chiusura: {close_date}. Agisci ora! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(41, 2, 'ja', '新しい機会', '新しい機会: {opportunity_name} 価値${amount}。アカウント: {account_name}。クローズ日: {close_date}。今すぐ行動を！ - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(42, 2, 'nl', 'Nieuwe kans', 'Nieuwe kans: {opportunity_name} ter waarde van ${amount}. Account: {account_name}. Sluitdatum: {close_date}. Onderneem nu actie! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(43, 2, 'pl', 'Nowa szansa', 'Nowa szansa: {opportunity_name} o wartości ${amount}. Konto: {account_name}. Data zamknięcia: {close_date}. Działaj teraz! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(44, 2, 'pt', 'Nova oportunidade', 'Nova oportunidade: {opportunity_name} no valor de ${amount}. Conta: {account_name}. Data de fechamento: {close_date}. Aja agora! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(45, 2, 'pt-BR', 'Nova oportunidade', 'Nova oportunidade: {opportunity_name} no valor de ${amount}. Conta: {account_name}. Data de fechamento: {close_date}. Aja agora! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(46, 2, 'ru', 'Новая возможность', 'Новая возможность: {opportunity_name} стоимостью ${amount}. Аккаунт: {account_name}. Дата закрытия: {close_date}. Действуйте сейчас! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(47, 2, 'tr', 'Yeni fırsat', 'Yeni fırsat: {opportunity_name} ${amount} değerinde. Hesap: {account_name}. Kapanış tarihi: {close_date}. Şimdi harekete geç! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(48, 2, 'zh', '新机会', '新机会: {opportunity_name} 价值${amount}。账户: {account_name}。关闭日期: {close_date}。立即行动！ - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(49, 2, 'en', 'New opportunity', 'New opportunity: {opportunity_name} worth ${amount}. Account: {account_name}. Close date: {close_date}. Take action now! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(50, 2, 'es', 'Nueva oportunidad', 'Nueva oportunidad: {opportunity_name} por valor de ${amount}. Cuenta: {account_name}. Fecha de cierre: {close_date}. ¡Actúa ahora! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(51, 2, 'ar', 'فرصة جديدة', 'فرصة جديدة: {opportunity_name} بقيمة ${amount}. الحساب: {account_name}. تاريخ الإغلاق: {close_date}. اتخذ إجراء الآن! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(52, 2, 'da', 'Ny mulighed', 'Ny mulighed: {opportunity_name} til værdi af ${amount}. Konto: {account_name}. Lukkedato: {close_date}. Tag handling nu! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(53, 2, 'de', 'Neue Gelegenheit', 'Neue Gelegenheit: {opportunity_name} im Wert von ${amount}. Konto: {account_name}. Abschlussdatum: {close_date}. Handeln Sie jetzt! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(54, 2, 'fr', 'Nouvelle opportunité', 'Nouvelle opportunité: {opportunity_name} d\'une valeur de ${amount}. Compte: {account_name}. Date de clôture: {close_date}. Agissez maintenant! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(55, 2, 'he', 'הזדמנות חדשה', 'הזדמנות חדשה: {opportunity_name} בשווי ${amount}. חשבון: {account_name}. תאריך סגירה: {close_date}. פעל עכשיו! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(56, 2, 'it', 'Nuova opportunità', 'Nuova opportunità: {opportunity_name} del valore di ${amount}. Account: {account_name}. Data di chiusura: {close_date}. Agisci ora! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(57, 2, 'ja', '新しい機会', '新しい機会: {opportunity_name} 価値${amount}。アカウント: {account_name}。クローズ日: {close_date}。今すぐ行動を！ - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(58, 2, 'nl', 'Nieuwe kans', 'Nieuwe kans: {opportunity_name} ter waarde van ${amount}. Account: {account_name}. Sluitdatum: {close_date}. Onderneem nu actie! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(59, 2, 'pl', 'Nowa szansa', 'Nowa szansa: {opportunity_name} o wartości ${amount}. Konto: {account_name}. Data zamknięcia: {close_date}. Działaj teraz! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(60, 2, 'pt', 'Nova oportunidade', 'Nova oportunidade: {opportunity_name} no valor de ${amount}. Conta: {account_name}. Data de fechamento: {close_date}. Aja agora! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(61, 2, 'pt-BR', 'Nova oportunidade', 'Nova oportunidade: {opportunity_name} no valor de ${amount}. Conta: {account_name}. Data de fechamento: {close_date}. Aja agora! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(62, 2, 'ru', 'Новая возможность', 'Новая возможность: {opportunity_name} стоимостью ${amount}. Аккаунт: {account_name}. Дата закрытия: {close_date}. Действуйте сейчас! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(63, 2, 'tr', 'Yeni fırsat', 'Yeni fırsat: {opportunity_name} ${amount} değerinde. Hesap: {account_name}. Kapanış tarihi: {close_date}. Şimdi harekete geç! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(64, 2, 'zh', '新机会', '新机会: {opportunity_name} 价值${amount}。账户: {account_name}。关闭日期: {close_date}。立即行动！ - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(65, 3, 'en', 'Welcome to our family', 'Welcome {account_name}! Your account has been created successfully. We are excited to work with you! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(66, 3, 'es', 'Bienvenido a nuestra familia', '¡Bienvenido {account_name}! Tu cuenta ha sido creada exitosamente. ¡Estamos emocionados de trabajar contigo! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(67, 3, 'ar', 'مرحبا بك في عائلتنا', 'مرحبا {account_name}! تم إنشاء حسابك بنجاح. نحن متحمسون للعمل معك! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(68, 3, 'da', 'Velkommen til vores familie', 'Velkommen {account_name}! Din konto er blevet oprettet med succes. Vi er begejstrede for at arbejde med dig! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(69, 3, 'de', 'Willkommen in unserer Familie', 'Willkommen {account_name}! Ihr Konto wurde erfolgreich erstellt. Wir freuen uns auf die Zusammenarbeit mit Ihnen! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(70, 3, 'fr', 'Bienvenue dans notre famille', 'Bienvenue {account_name}! Votre compte a été créé avec succès. Nous sommes ravis de travailler avec vous! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(71, 3, 'he', 'ברוכים הבאים למשפחה שלנו', 'ברוך הבא {account_name}! החשבון שלך נוצר בהצלחה. אנחנו נרגשים לעבוד איתך! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(72, 3, 'it', 'Benvenuto nella nostra famiglia', 'Benvenuto {account_name}! Il tuo account è stato creato con successo. Siamo entusiasti di lavorare con te! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(73, 3, 'ja', '私たちの家族へようこそ', 'ようこそ{account_name}！あなたのアカウントが正常に作成されました。私たちはあなたと一緒に働くことを楽しみにしています！ - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(74, 3, 'nl', 'Welkom bij onze familie', 'Welkom {account_name}! Je account is succesvol aangemaakt. We zijn enthousiast om met je te werken! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(75, 3, 'pl', 'Witamy w naszej rodzinie', 'Witamy {account_name}! Twoje konto zostało pomyślnie utworzone. Jesteśmy podekscytowani współpracą z Tobą! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(76, 3, 'pt', 'Bem-vindo à nossa família', 'Bem-vindo {account_name}! Sua conta foi criada com sucesso. Estamos animados para trabalhar com você! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(77, 3, 'pt-BR', 'Bem-vindo à nossa família', 'Bem-vindo {account_name}! Sua conta foi criada com sucesso. Estamos animados para trabalhar com você! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(78, 3, 'ru', 'Добро пожаловать в нашу семью', 'Добро пожаловать {account_name}! Ваш аккаунт был успешно создан. Мы рады работать с вами! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(79, 3, 'tr', 'Ailemize hoş geldiniz', 'Hoş geldin {account_name}! Hesabın başarıyla oluşturuldu. Seninle çalışmaktan heyecan duyuyoruz! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(80, 3, 'zh', '欢迎加入我们的大家庭', '欢迎{account_name}！您的账户已成功创建。我们很高兴与您合作！ - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(81, 3, 'en', 'Welcome to our family', 'Welcome {account_name}! Your account has been created successfully. We are excited to work with you! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(82, 3, 'es', 'Bienvenido a nuestra familia', '¡Bienvenido {account_name}! Tu cuenta ha sido creada exitosamente. ¡Estamos emocionados de trabajar contigo! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(83, 3, 'ar', 'مرحبا بك في عائلتنا', 'مرحبا {account_name}! تم إنشاء حسابك بنجاح. نحن متحمسون للعمل معك! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(84, 3, 'da', 'Velkommen til vores familie', 'Velkommen {account_name}! Din konto er blevet oprettet med succes. Vi er begejstrede for at arbejde med dig! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(85, 3, 'de', 'Willkommen in unserer Familie', 'Willkommen {account_name}! Ihr Konto wurde erfolgreich erstellt. Wir freuen uns auf die Zusammenarbeit mit Ihnen! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(86, 3, 'fr', 'Bienvenue dans notre famille', 'Bienvenue {account_name}! Votre compte a été créé avec succès. Nous sommes ravis de travailler avec vous! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(87, 3, 'he', 'ברוכים הבאים למשפחה שלנו', 'ברוך הבא {account_name}! החשבון שלך נוצר בהצלחה. אנחנו נרגשים לעבוד איתך! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(88, 3, 'it', 'Benvenuto nella nostra famiglia', 'Benvenuto {account_name}! Il tuo account è stato creato con successo. Siamo entusiasti di lavorare con te! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(89, 3, 'ja', '私たちの家族へようこそ', 'ようこそ{account_name}！あなたのアカウントが正常に作成されました。私たちはあなたと一緒に働くことを楽しみにしています！ - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(90, 3, 'nl', 'Welkom bij onze familie', 'Welkom {account_name}! Je account is succesvol aangemaakt. We zijn enthousiast om met je te werken! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(91, 3, 'pl', 'Witamy w naszej rodzinie', 'Witamy {account_name}! Twoje konto zostało pomyślnie utworzone. Jesteśmy podekscytowani współpracą z Tobą! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(92, 3, 'pt', 'Bem-vindo à nossa família', 'Bem-vindo {account_name}! Sua conta foi criada com sucesso. Estamos animados para trabalhar com você! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(93, 3, 'pt-BR', 'Bem-vindo à nossa família', 'Bem-vindo {account_name}! Sua conta foi criada com sucesso. Estamos animados para trabalhar com você! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(94, 3, 'ru', 'Добро пожаловать в нашу семью', 'Добро пожаловать {account_name}! Ваш аккаунт был успешно создан. Мы рады работать с вами! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(95, 3, 'tr', 'Ailemize hoş geldiniz', 'Hoş geldin {account_name}! Hesabın başarıyla oluşturuldu. Seninle çalışmaktan heyecan duyuyoruz! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(96, 3, 'zh', '欢迎加入我们的大家庭', '欢迎{account_name}！您的账户已成功创建。我们很高兴与您合作！ - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(97, 4, 'en', 'New Quote Created', 'Quote #{quote_number} created for {account_name}. Amount: ${total_amount}. Valid until {valid_until}. Follow up soon! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(98, 4, 'es', 'Nueva Cotización Creada', 'Cotización #{quote_number} creada para {account_name}. Monto: ${total_amount}. Válida hasta {valid_until}. ¡Haz seguimiento pronto! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(99, 4, 'ar', 'عرض أسعار جديد', 'عرض أسعار #{quote_number} تم إنشاؤه لـ {account_name}. المبلغ: ${total_amount}. صالح حتى {valid_until}. تابع قريبا! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(100, 4, 'da', 'Nyt Tilbud Oprettet', 'Tilbud #{quote_number} oprettet for {account_name}. Beløb: ${total_amount}. Gyldig indtil {valid_until}. Følg op snart! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(101, 4, 'de', 'Neues Angebot Erstellt', 'Angebot #{quote_number} für {account_name} erstellt. Betrag: ${total_amount}. Gültig bis {valid_until}. Bald nachfassen! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(102, 4, 'fr', 'Nouveau Devis Créé', 'Devis #{quote_number} créé pour {account_name}. Montant: ${total_amount}. Valide jusqu\'au {valid_until}. Suivez bientôt! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(103, 4, 'he', 'הצעת מחיר חדשה נוצרה', 'הצעת מחיר #{quote_number} נוצרה עבור {account_name}. סכום: ${total_amount}. תקף עד {valid_until}. עקוב בקרוב! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(104, 4, 'it', 'Nuovo Preventivo Creato', 'Preventivo #{quote_number} creato per {account_name}. Importo: ${total_amount}. Valido fino al {valid_until}. Segui presto! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(105, 4, 'ja', '新しい見積もり作成', '見積もり#{quote_number}が{account_name}用に作成されました。金額: ${total_amount}。{valid_until}まで有効。すぐにフォローアップ！ - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(106, 4, 'nl', 'Nieuwe Offerte Aangemaakt', 'Offerte #{quote_number} aangemaakt voor {account_name}. Bedrag: ${total_amount}. Geldig tot {valid_until}. Volg snel op! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(107, 4, 'pl', 'Nowa Oferta Utworzona', 'Oferta #{quote_number} utworzona dla {account_name}. Kwota: ${total_amount}. Ważna do {valid_until}. Śledź wkrótce! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(108, 4, 'pt', 'Nova Cotação Criada', 'Cotação #{quote_number} criada para {account_name}. Valor: ${total_amount}. Válida até {valid_until}. Acompanhe em breve! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(109, 4, 'pt-BR', 'Nova Cotação Criada', 'Cotação #{quote_number} criada para {account_name}. Valor: ${total_amount}. Válida até {valid_until}. Acompanhe em breve! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(110, 4, 'ru', 'Новое Предложение Создано', 'Предложение #{quote_number} создано для {account_name}. Сумма: ${total_amount}. Действительно до {valid_until}. Следите скоро! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(111, 4, 'tr', 'Yeni Teklif Oluşturuldu', 'Teklif #{quote_number} {account_name} için oluşturuldu. Tutar: ${total_amount}. {valid_until} tarihine kadar geçerli. Yakında takip et! - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(112, 4, 'zh', '新报价创建', '为{account_name}创建报价#{quote_number}。金额: ${total_amount}。有效期至{valid_until}。尽快跟进！ - {company_name}', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(113, 4, 'en', 'New Quote Created', 'Quote #{quote_number} created for {account_name}. Amount: ${total_amount}. Valid until {valid_until}. Follow up soon! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(114, 4, 'es', 'Nueva Cotización Creada', 'Cotización #{quote_number} creada para {account_name}. Monto: ${total_amount}. Válida hasta {valid_until}. ¡Haz seguimiento pronto! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(115, 4, 'ar', 'عرض أسعار جديد', 'عرض أسعار #{quote_number} تم إنشاؤه لـ {account_name}. المبلغ: ${total_amount}. صالح حتى {valid_until}. تابع قريبا! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(116, 4, 'da', 'Nyt Tilbud Oprettet', 'Tilbud #{quote_number} oprettet for {account_name}. Beløb: ${total_amount}. Gyldig indtil {valid_until}. Følg op snart! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(117, 4, 'de', 'Neues Angebot Erstellt', 'Angebot #{quote_number} für {account_name} erstellt. Betrag: ${total_amount}. Gültig bis {valid_until}. Bald nachfassen! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(118, 4, 'fr', 'Nouveau Devis Créé', 'Devis #{quote_number} créé pour {account_name}. Montant: ${total_amount}. Valide jusqu\'au {valid_until}. Suivez bientôt! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(119, 4, 'he', 'הצעת מחיר חדשה נוצרה', 'הצעת מחיר #{quote_number} נוצרה עבור {account_name}. סכום: ${total_amount}. תקף עד {valid_until}. עקוב בקרוב! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(120, 4, 'it', 'Nuovo Preventivo Creato', 'Preventivo #{quote_number} creato per {account_name}. Importo: ${total_amount}. Valido fino al {valid_until}. Segui presto! - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(121, 4, 'ja', '新しい見積もり作成', '見積もり#{quote_number}が{account_name}用に作成されました。金額: ${total_amount}。{valid_until}まで有効。すぐにフォローアップ！ - {company_name}', 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(122, 4, 'nl', 'Nieuwe Offerte Aangemaakt', 'Offerte #{quote_number} aangemaakt voor {account_name}. Bedrag: ${total_amount}. Geldig tot {valid_until}. Volg snel op! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(123, 4, 'pl', 'Nowa Oferta Utworzona', 'Oferta #{quote_number} utworzona dla {account_name}. Kwota: ${total_amount}. Ważna do {valid_until}. Śledź wkrótce! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(124, 4, 'pt', 'Nova Cotação Criada', 'Cotação #{quote_number} criada para {account_name}. Valor: ${total_amount}. Válida até {valid_until}. Acompanhe em breve! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(125, 4, 'pt-BR', 'Nova Cotação Criada', 'Cotação #{quote_number} criada para {account_name}. Valor: ${total_amount}. Válida até {valid_until}. Acompanhe em breve! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(126, 4, 'ru', 'Новое Предложение Создано', 'Предложение #{quote_number} создано для {account_name}. Сумма: ${total_amount}. Действительно до {valid_until}. Следите скоро! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(127, 4, 'tr', 'Yeni Teklif Oluşturuldu', 'Teklif #{quote_number} {account_name} için oluşturuldu. Tutar: ${total_amount}. {valid_until} tarihine kadar geçerli. Yakında takip et! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(128, 4, 'zh', '新报价创建', '为{account_name}创建报价#{quote_number}。金额: ${total_amount}。有效期至{valid_until}。尽快跟进！ - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(129, 5, 'en', 'Case Received', 'Your case is received. Thank you! We will resolve it soon. Case: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(130, 5, 'es', 'Caso Recibido', 'Tu caso ha sido recibido. ¡Gracias! Lo resolveremos pronto. Caso: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(131, 5, 'ar', 'تم استلام الحالة', 'تم استلام حالتك. شكرا لك! سنحلها قريبا. الحالة: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(132, 5, 'da', 'Sag Modtaget', 'Din sag er modtaget. Tak! Vi vil løse det snart. Sag: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(133, 5, 'de', 'Fall Erhalten', 'Ihr Fall wurde erhalten. Danke! Wir werden es bald lösen. Fall: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(134, 5, 'fr', 'Cas Reçu', 'Votre cas est reçu. Merci! Nous le résoudrons bientôt. Cas: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(135, 5, 'he', 'המקרה התקבל', 'המקרה שלך התקבל. תודה! אנחנו נפתור את זה בקרוב. מקרה: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(136, 5, 'it', 'Caso Ricevuto', 'Il tuo caso è stato ricevuto. Grazie! Lo risolveremo presto. Caso: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(137, 5, 'ja', 'ケース受信', 'あなたのケースを受信しました。ありがとうございます！すぐに解決します。ケース: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(138, 5, 'nl', 'Case Ontvangen', 'Je case is ontvangen. Dank je! We zullen het binnenkort oplossen. Case: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(139, 5, 'pl', 'Sprawa Otrzymana', 'Twoja sprawa została otrzymana. Dziękujemy! Rozwiążemy to wkrótce. Sprawa: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(140, 5, 'pt', 'Caso Recebido', 'Seu caso foi recebido. Obrigado! Resolveremos em breve. Caso: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(141, 5, 'pt-BR', 'Caso Recebido', 'Seu caso foi recebido. Obrigado! Resolveremos em breve. Caso: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(142, 5, 'ru', 'Обращение Получено', 'Ваше обращение получено. Спасибо! Мы решим это в ближайшее время. Обращение: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(143, 5, 'tr', 'Vaka Alındı', 'Vakanız alındı. Teşekkürler! Yakında çözeceğiz. Vaka: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(144, 5, 'zh', '案例已收到', '您的案例已收到。谢谢！我们将很快解决。案例: {case_subject} - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(145, 5, 'en', 'Case Received', 'Your case is received. Thank you! We will resolve it soon. Case: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(146, 5, 'es', 'Caso Recibido', 'Tu caso ha sido recibido. ¡Gracias! Lo resolveremos pronto. Caso: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(147, 5, 'ar', 'تم استلام الحالة', 'تم استلام حالتك. شكرا لك! سنحلها قريبا. الحالة: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(148, 5, 'da', 'Sag Modtaget', 'Din sag er modtaget. Tak! Vi vil løse det snart. Sag: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(149, 5, 'de', 'Fall Erhalten', 'Ihr Fall wurde erhalten. Danke! Wir werden es bald lösen. Fall: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(150, 5, 'fr', 'Cas Reçu', 'Votre cas est reçu. Merci! Nous le résoudrons bientôt. Cas: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(151, 5, 'he', 'המקרה התקבל', 'המקרה שלך התקבל. תודה! אנחנו נפתור את זה בקרוב. מקרה: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(152, 5, 'it', 'Caso Ricevuto', 'Il tuo caso è stato ricevuto. Grazie! Lo risolveremo presto. Caso: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(153, 5, 'ja', 'ケース受信', 'あなたのケースを受信しました。ありがとうございます！すぐに解決します。ケース: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(154, 5, 'nl', 'Case Ontvangen', 'Je case is ontvangen. Dank je! We zullen het binnenkort oplossen. Case: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(155, 5, 'pl', 'Sprawa Otrzymana', 'Twoja sprawa została otrzymana. Dziękujemy! Rozwiążemy to wkrótce. Sprawa: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(156, 5, 'pt', 'Caso Recebido', 'Seu caso foi recebido. Obrigado! Resolveremos em breve. Caso: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(157, 5, 'pt-BR', 'Caso Recebido', 'Seu caso foi recebido. Obrigado! Resolveremos em breve. Caso: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(158, 5, 'ru', 'Обращение Получено', 'Ваше обращение получено. Спасибо! Мы решим это в ближайшее время. Обращение: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(159, 5, 'tr', 'Vaka Alındı', 'Vakanız alındı. Teşekkürler! Yakında çözeceğiz. Vaka: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(160, 5, 'zh', '案例已收到', '您的案例已收到。谢谢！我们将很快解决。案例: {case_subject} - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(161, 6, 'en', 'New Meeting Scheduled', 'Meeting scheduled: {meeting_subject} on {meeting_date} at {meeting_time}. Total Attendees: {attendee_count}. Be prepared! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(162, 6, 'es', 'Nueva Reunión Programada', 'Reunión programada: {meeting_subject} el {meeting_date} a las {meeting_time}. Total de Asistentes: {attendee_count}. ¡Prepárate! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(163, 6, 'ar', 'اجتماع جديد مجدول', 'اجتماع مجدول: {meeting_subject} في {meeting_date} في {meeting_time}. إجمالي الحضور: {attendee_count}. كن مستعدا! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(164, 6, 'da', 'Nyt Møde Planlagt', 'Møde planlagt: {meeting_subject} den {meeting_date} kl. {meeting_time}. Samlede deltagere: {attendee_count}. Vær forberedt! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(165, 6, 'de', 'Neues Meeting Geplant', 'Meeting geplant: {meeting_subject} am {meeting_date} um {meeting_time}. Gesamte Teilnehmer: {attendee_count}. Seien Sie vorbereitet! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(166, 6, 'fr', 'Nouvelle Réunion Programmée', 'Réunion programmée: {meeting_subject} le {meeting_date} à {meeting_time}. Total des participants: {attendee_count}. Soyez prêt! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(167, 6, 'he', 'פגישה חדשה נקבעה', 'פגישה נקבעה: {meeting_subject} ב{meeting_date} ב{meeting_time}. סך המשתתפים: {attendee_count}. היו מוכנים! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(168, 6, 'it', 'Nuovo Meeting Programmato', 'Meeting programmato: {meeting_subject} il {meeting_date} alle {meeting_time}. Totale partecipanti: {attendee_count}. Preparatevi! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(169, 6, 'ja', '新しい会議がスケジュール', '会議がスケジュールされました: {meeting_subject} {meeting_date} {meeting_time}。参加者総数: {attendee_count}。準備してください！ - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(170, 6, 'nl', 'Nieuwe Vergadering Gepland', 'Vergadering gepland: {meeting_subject} op {meeting_date} om {meeting_time}. Totaal deelnemers: {attendee_count}. Wees voorbereid! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(171, 6, 'pl', 'Nowe Spotkanie Zaplanowane', 'Spotkanie zaplanowane: {meeting_subject} dnia {meeting_date} o {meeting_time}. Łączna liczba uczestników: {attendee_count}. Bądź przygotowany! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(172, 6, 'pt', 'Nova Reunião Agendada', 'Reunião agendada: {meeting_subject} em {meeting_date} às {meeting_time}. Total de Participantes: {attendee_count}. Esteja preparado! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(173, 6, 'pt-BR', 'Nova Reunião Agendada', 'Reunião agendada: {meeting_subject} em {meeting_date} às {meeting_time}. Total de Participantes: {attendee_count}. Esteja preparado! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(174, 6, 'ru', 'Новая Встреча Запланирована', 'Встреча запланирована: {meeting_subject} {meeting_date} в {meeting_time}. Всего участников: {attendee_count}. Будьте готовы! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(175, 6, 'tr', 'Yeni Toplantı Planlandı', 'Toplantı planlandı: {meeting_subject} {meeting_date} tarihinde {meeting_time} saatinde. Toplam Katılımcı: {attendee_count}. Hazır olun! - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(176, 6, 'zh', '新会议已安排', '会议已安排: {meeting_subject} 于{meeting_date} {meeting_time}。参与者总数: {attendee_count}。请做好准备！ - {company_name}', 2, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(177, 6, 'en', 'New Meeting Scheduled', 'Meeting scheduled: {meeting_subject} on {meeting_date} at {meeting_time}. Total Attendees: {attendee_count}. Be prepared! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(178, 6, 'es', 'Nueva Reunión Programada', 'Reunión programada: {meeting_subject} el {meeting_date} a las {meeting_time}. Total de Asistentes: {attendee_count}. ¡Prepárate! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(179, 6, 'ar', 'اجتماع جديد مجدول', 'اجتماع مجدول: {meeting_subject} في {meeting_date} في {meeting_time}. إجمالي الحضور: {attendee_count}. كن مستعدا! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(180, 6, 'da', 'Nyt Møde Planlagt', 'Møde planlagt: {meeting_subject} den {meeting_date} kl. {meeting_time}. Samlede deltagere: {attendee_count}. Vær forberedt! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(181, 6, 'de', 'Neues Meeting Geplant', 'Meeting geplant: {meeting_subject} am {meeting_date} um {meeting_time}. Gesamte Teilnehmer: {attendee_count}. Seien Sie vorbereitet! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(182, 6, 'fr', 'Nouvelle Réunion Programmée', 'Réunion programmée: {meeting_subject} le {meeting_date} à {meeting_time}. Total des participants: {attendee_count}. Soyez prêt! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(183, 6, 'he', 'פגישה חדשה נקבעה', 'פגישה נקבעה: {meeting_subject} ב{meeting_date} ב{meeting_time}. סך המשתתפים: {attendee_count}. היו מוכנים! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(184, 6, 'it', 'Nuovo Meeting Programmato', 'Meeting programmato: {meeting_subject} il {meeting_date} alle {meeting_time}. Totale partecipanti: {attendee_count}. Preparatevi! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(185, 6, 'ja', '新しい会議がスケジュール', '会議がスケジュールされました: {meeting_subject} {meeting_date} {meeting_time}。参加者総数: {attendee_count}。準備してください！ - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(186, 6, 'nl', 'Nieuwe Vergadering Gepland', 'Vergadering gepland: {meeting_subject} op {meeting_date} om {meeting_time}. Totaal deelnemers: {attendee_count}. Wees voorbereid! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(187, 6, 'pl', 'Nowe Spotkanie Zaplanowane', 'Spotkanie zaplanowane: {meeting_subject} dnia {meeting_date} o {meeting_time}. Łączna liczba uczestników: {attendee_count}. Bądź przygotowany! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(188, 6, 'pt', 'Nova Reunião Agendada', 'Reunião agendada: {meeting_subject} em {meeting_date} às {meeting_time}. Total de Participantes: {attendee_count}. Esteja preparado! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(189, 6, 'pt-BR', 'Nova Reunião Agendada', 'Reunião agendada: {meeting_subject} em {meeting_date} às {meeting_time}. Total de Participantes: {attendee_count}. Esteja preparado! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(190, 6, 'ru', 'Новая Встреча Запланирована', 'Встреча запланирована: {meeting_subject} {meeting_date} в {meeting_time}. Всего участников: {attendee_count}. Будьте готовы! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(191, 6, 'tr', 'Yeni Toplantı Planlandı', 'Toplantı planlandı: {meeting_subject} {meeting_date} tarihinde {meeting_time} saatinde. Toplam Katılımcı: {attendee_count}. Hazır olun! - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09'),
(192, 6, 'zh', '新会议已安排', '会议已安排: {meeting_subject} 于{meeting_date} {meeting_time}。参与者总数: {attendee_count}。请做好准备！ - {company_name}', 1, '2025-12-20 17:47:09', '2025-12-20 17:47:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(15,2) DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `account_id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `opportunity_stage_id` bigint UNSIGNED NOT NULL,
  `opportunity_source_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunities_account_id_foreign` (`account_id`),
  KEY `opportunities_contact_id_foreign` (`contact_id`),
  KEY `opportunities_opportunity_stage_id_foreign` (`opportunity_stage_id`),
  KEY `opportunities_opportunity_source_id_foreign` (`opportunity_source_id`),
  KEY `opportunities_created_by_foreign` (`created_by`),
  KEY `opportunities_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `opportunity_activities`
--

DROP TABLE IF EXISTS `opportunity_activities`;
CREATE TABLE IF NOT EXISTS `opportunity_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `opportunity_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_activities_created_by_foreign` (`created_by`),
  KEY `opportunity_activities_opportunity_id_created_at_index` (`opportunity_id`,`created_at`),
  KEY `opportunity_activities_user_id_created_at_index` (`user_id`,`created_at`),
  KEY `opportunity_activities_activity_type_created_at_index` (`activity_type`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `opportunity_comments`
--

DROP TABLE IF EXISTS `opportunity_comments`;
CREATE TABLE IF NOT EXISTS `opportunity_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `opportunity_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_comments_created_by_foreign` (`created_by`),
  KEY `opportunity_comments_opportunity_id_created_at_index` (`opportunity_id`,`created_at`),
  KEY `opportunity_comments_user_id_created_at_index` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `opportunity_products`
--

DROP TABLE IF EXISTS `opportunity_products`;
CREATE TABLE IF NOT EXISTS `opportunity_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `opportunity_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_products_opportunity_id_foreign` (`opportunity_id`),
  KEY `opportunity_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `opportunity_sources`
--

DROP TABLE IF EXISTS `opportunity_sources`;
CREATE TABLE IF NOT EXISTS `opportunity_sources` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_sources_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `opportunity_stages`
--

DROP TABLE IF EXISTS `opportunity_stages`;
CREATE TABLE IF NOT EXISTS `opportunity_stages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `probability` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunity_stages_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_settings`
--

DROP TABLE IF EXISTS `payment_settings`;
CREATE TABLE IF NOT EXISTS `payment_settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_settings_user_id_key_unique` (`user_id`,`key`),
  KEY `payment_settings_user_id_key_index` (`user_id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payout_requests`
--

DROP TABLE IF EXISTS `payout_requests`;
CREATE TABLE IF NOT EXISTS `payout_requests` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payout_requests_company_id_foreign` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `module`, `name`, `guard_name`, `label`, `description`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'manage-dashboard', 'web', 'Manage Dashboard', 'Can view dashboard', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(2, 'dashboard', 'view-dashboard', 'web', 'View Dashboard', 'Can view dashboard', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(3, 'calendar', 'manage-calendar', 'web', 'Manage Calendar', 'Can manage calendar', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(4, 'calendar', 'view-calendar', 'web', 'View Calendar', 'Can view calendar', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(5, 'users', 'manage-users', 'web', 'Manage Users', 'Can manage users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(6, 'users', 'manage-any-users', 'web', 'Manage All Users', 'Manage Any Users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(7, 'users', 'manage-own-users', 'web', 'Manage Own Users', 'Manage Limited Users that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(8, 'users', 'view-users', 'web', 'Manage Users', 'View Users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(9, 'users', 'create-users', 'web', 'Create Users', 'Can create users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(10, 'users', 'edit-users', 'web', 'Edit Users', 'Can edit users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(11, 'users', 'delete-users', 'web', 'Delete Users', 'Can delete users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(12, 'users', 'reset-password-users', 'web', 'Reset Password Users', 'Can reset password users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(13, 'users', 'toggle-status-users', 'web', 'Change Status Users', 'Can change status users', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(14, 'roles', 'manage-roles', 'web', 'Manage Roles', 'Can manage roles', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(15, 'roles', 'manage-any-roles', 'web', 'Manage All Roles', 'Manage Any Roles', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(16, 'roles', 'manage-own-roles', 'web', 'Manage Own Roles', 'Manage Limited Roles that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(17, 'roles', 'view-roles', 'web', 'View Roles', 'View Roles', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(18, 'roles', 'create-roles', 'web', 'Create Roles', 'Can create roles', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(19, 'roles', 'edit-roles', 'web', 'Edit Roles', 'Can edit roles', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(20, 'roles', 'delete-roles', 'web', 'Delete Roles', 'Can delete roles', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(21, 'permissions', 'manage-permissions', 'web', 'Manage Permissions', 'Can manage permissions', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(22, 'permissions', 'manage-any-permissions', 'web', 'Manage All Permissions', 'Manage Any Permissions', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(23, 'permissions', 'manage-own-permissions', 'web', 'Manage Own Permissions', 'Manage Limited Permissions that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(24, 'permissions', 'view-permissions', 'web', 'View Permissions', 'View Permissions', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(25, 'permissions', 'create-permissions', 'web', 'Create Permissions', 'Can create permissions', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(26, 'permissions', 'edit-permissions', 'web', 'Edit Permissions', 'Can edit permissions', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(27, 'permissions', 'delete-permissions', 'web', 'Delete Permissions', 'Can delete permissions', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(28, 'companies', 'manage-companies', 'web', 'Manage Companies', 'Can manage Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(29, 'companies', 'manage-any-companies', 'web', 'Manage All Companies', 'Manage Any Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(30, 'companies', 'manage-own-companies', 'web', 'Manage Own Companies', 'Manage Limited Companies that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(31, 'companies', 'view-companies', 'web', 'View Companies', 'View Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(32, 'companies', 'create-companies', 'web', 'Create Companies', 'Can create Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(33, 'companies', 'edit-companies', 'web', 'Edit Companies', 'Can edit Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(34, 'companies', 'delete-companies', 'web', 'Delete Companies', 'Can delete Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(35, 'companies', 'reset-password-companies', 'web', 'Reset Password Companies', 'Can reset password Companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(36, 'companies', 'toggle-status-companies', 'web', 'Change Status Companies', 'Can change status companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(37, 'companies', 'manage-plans-companies', 'web', 'Manage Plan Companies', 'Can manage plans companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(38, 'companies', 'upgrade-plan-companies', 'web', 'Upgrade Plan Companies', 'Can upgrade plan of companies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(39, 'plans', 'manage-plans', 'web', 'Manage Plans', 'Can manage subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(40, 'plans', 'manage-any-plans', 'web', 'Manage All Plans', 'Manage Any Plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(41, 'plans', 'manage-own-plans', 'web', 'Manage Own Plans', 'Manage Limited Plans that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(42, 'plans', 'view-plans', 'web', 'View Plans', 'View Plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(43, 'plans', 'create-plans', 'web', 'Create Plans', 'Can create subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(44, 'plans', 'edit-plans', 'web', 'Edit Plans', 'Can edit subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(45, 'plans', 'delete-plans', 'web', 'Delete Plans', 'Can delete subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(46, 'plans', 'request-plans', 'web', 'Request Plans', 'Can request subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(47, 'plans', 'trial-plans', 'web', 'Trial Plans', 'Can start trial for subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(48, 'plans', 'subscribe-plans', 'web', 'Subscribe Plans', 'Can subscribe to subscription plans', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(49, 'coupons', 'manage-coupons', 'web', 'Manage Coupons', 'Can manage subscription Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(50, 'coupons', 'manage-any-coupons', 'web', 'Manage All Coupons', 'Manage Any Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(51, 'coupons', 'manage-own-coupons', 'web', 'Manage Own Coupons', 'Manage Limited Coupons that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(52, 'coupons', 'view-coupons', 'web', 'View Coupons', 'View Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(53, 'coupons', 'create-coupons', 'web', 'Create Coupons', 'Can create subscription Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(54, 'coupons', 'edit-coupons', 'web', 'Edit Coupons', 'Can edit subscription Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(55, 'coupons', 'delete-coupons', 'web', 'Delete Coupons', 'Can delete subscription Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(56, 'coupons', 'toggle-status-coupons', 'web', 'Change Status Coupons', 'Can change status Coupons', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(57, 'plan_requests', 'manage-plan-requests', 'web', 'Manage Plan Requests', 'Can manage plan requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(58, 'plan_requests', 'view-plan-requests', 'web', 'View Plan Requests', 'View Plan Requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(59, 'plan_requests', 'create-plan-requests', 'web', 'Create Plan Requests', 'Can create plan requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(60, 'plan_requests', 'edit-plan-requests', 'web', 'Edit Plan Requests', 'Can edit plan requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(61, 'plan_requests', 'delete-plan-requests', 'web', 'Delete Plan Requests', 'Can delete plan requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(62, 'plan_requests', 'approve-plan-requests', 'web', 'Approve plan requests', 'Can approve plan requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(63, 'plan_requests', 'reject-plan-requests', 'web', 'Reject plan requests', 'Can reject plplan requests', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(64, 'plan_orders', 'manage-plan-orders', 'web', 'Manage Plan Orders', 'Can manage plan orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(65, 'plan_orders', 'view-plan-orders', 'web', 'View Plan Orders', 'View Plan Orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(66, 'plan_orders', 'create-plan-orders', 'web', 'Create Plan Orders', 'Can create plan orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(67, 'plan_orders', 'edit-plan-orders', 'web', 'Edit Plan Orders', 'Can edit plan orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(68, 'plan_orders', 'delete-plan-orders', 'web', 'Delete Plan Orders', 'Can delete plan orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(69, 'plan_orders', 'approve-plan-orders', 'web', 'Approve Plan Orders', 'Can approve plan orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(70, 'plan_orders', 'reject-plan-orders', 'web', 'Reject Plan Orders', 'Can reject plan orders', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(71, 'settings', 'manage-settings', 'web', 'Manage Settings', 'Can manage All settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(72, 'settings', 'manage-system-settings', 'web', 'Manage System Settings', 'Can manage system settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(73, 'settings', 'manage-email-settings', 'web', 'Manage Email Settings', 'Can manage email settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(74, 'settings', 'manage-brand-settings', 'web', 'Manage Brand Settings', 'Can manage brand settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(75, 'settings', 'manage-company-settings', 'web', 'Manage Company Settings', 'Can manage Company settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(76, 'settings', 'manage-payment-settings', 'web', 'Manage Payment Settings', 'Can manage payment settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(77, 'settings', 'manage-currency-settings', 'web', 'Manage Currency Settings', 'Can manage currency settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(78, 'settings', 'manage-recaptcha-settings', 'web', 'Manage ReCaptch Settings', 'Can manage recaptcha settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(79, 'settings', 'manage-chatgpt-settings', 'web', 'Manage ChatGpt Settings', 'Can manage chatgpt settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(80, 'settings', 'manage-cookie-settings', 'web', 'Manage Cookie(GDPR) Settings', 'Can manage cookie settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(81, 'settings', 'manage-seo-settings', 'web', 'Manage Seo Settings', 'Can manage seo settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(82, 'settings', 'manage-cache-settings', 'web', 'Manage Cache Settings', 'Can manage cache settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(83, 'settings', 'manage-storage-settings', 'web', 'Manage Storage Settings', 'Can manage storage settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(84, 'settings', 'manage-account-settings', 'web', 'Manage Account Settings', 'Can manage account settings', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(85, 'currencies', 'manage-currencies', 'web', 'Manage Currencies', 'Can manage currencies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(86, 'currencies', 'manage-any-currencies', 'web', 'Manage All currencies', 'Manage Any currencies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(87, 'currencies', 'manage-own-currencies', 'web', 'Manage Own currencies', 'Manage Limited currencies that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(88, 'currencies', 'view-currencies', 'web', 'View Currencies', 'View Currencies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(89, 'currencies', 'create-currencies', 'web', 'Create Currencies', 'Can create currencies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(90, 'currencies', 'edit-currencies', 'web', 'Edit Currencies', 'Can edit currencies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(91, 'currencies', 'delete-currencies', 'web', 'Delete Currencies', 'Can delete currencies', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(92, 'referral', 'manage-referral', 'web', 'Manage Referral', 'Can manage referral program', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(93, 'referral', 'manage-users-referral', 'web', 'Manage User Referral', 'Can manage user referral program', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(94, 'referral', 'manage-setting-referral', 'web', 'Manage Referral Setting', 'Can manage Referral Setting', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(95, 'referral', 'manage-payout-referral', 'web', 'Manage Referral Payout', 'Can manage Referral Payout program', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(96, 'referral', 'approve-payout-referral', 'web', 'Manage Referral', 'Can approve payout request', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(97, 'referral', 'reject-payout-referral', 'web', 'Manage Referral', 'Can approve payout request', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(98, 'language', 'manage-language', 'web', 'Manage Language', 'Can manage language', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(99, 'language', 'edit-language', 'web', 'Edit Language', 'Edit Language', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(100, 'language', 'view-language', 'web', 'View Language', 'View Language', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(101, 'media', 'manage-media', 'web', 'Manage Media', 'Can manage media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(102, 'media', 'manage-any-media', 'web', 'Manage All Media', 'Manage Any media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(103, 'media', 'manage-own-media', 'web', 'Manage Own Media', 'Manage Limited media that is created by own', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(104, 'media', 'create-media', 'web', 'Create media', 'Create media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(105, 'media', 'edit-media', 'web', 'Edit media', 'Edit media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(106, 'media', 'delete-media', 'web', 'Delete media', 'Delete media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(107, 'media', 'view-media', 'web', 'View media', 'View media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(108, 'media', 'download-media', 'web', 'Download media', 'Download media', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(109, 'landing_page', 'manage-landing-page', 'web', 'Manage Landing Page', 'Can manage landing page', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(110, 'landing_page', 'view-landing-page', 'web', 'View Landing Page', 'View landing page', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(111, 'landing_page', 'edit-landing-page', 'web', 'Edit Landing Page', 'Edit landing page', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(112, 'taxes', 'manage-taxes', 'web', 'Manage Taxes', 'Can manage taxes', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(113, 'taxes', 'view-taxes', 'web', 'View Taxes', 'View Taxes', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(114, 'taxes', 'create-taxes', 'web', 'Create Taxes', 'Can create taxes', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(115, 'taxes', 'edit-taxes', 'web', 'Edit Taxes', 'Can edit taxes', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(116, 'taxes', 'delete-taxes', 'web', 'Delete Taxes', 'Can delete taxes', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(117, 'taxes', 'toggle-status-taxes', 'web', 'Toggle Status Taxes', 'Can toggle status taxes', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(118, 'brands', 'manage-brands', 'web', 'Manage Brands', 'Can manage brands', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(119, 'brands', 'view-brands', 'web', 'View Brands', 'View Brands', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(120, 'brands', 'create-brands', 'web', 'Create Brands', 'Can create brands', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(121, 'brands', 'edit-brands', 'web', 'Edit Brands', 'Can edit brands', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(122, 'brands', 'delete-brands', 'web', 'Delete Brands', 'Can delete brands', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(123, 'brands', 'toggle-status-brands', 'web', 'Toggle Status Brands', 'Can toggle status brands', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(124, 'categories', 'manage-categories', 'web', 'Manage Categories', 'Can manage categories', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(125, 'categories', 'view-categories', 'web', 'View Categories', 'View Categories', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(126, 'categories', 'create-categories', 'web', 'Create Categories', 'Can create categories', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(127, 'categories', 'edit-categories', 'web', 'Edit Categories', 'Can edit categories', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(128, 'categories', 'delete-categories', 'web', 'Delete Categories', 'Can delete categories', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(129, 'categories', 'toggle-status-categories', 'web', 'Toggle Status Categories', 'Can toggle status categories', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(130, 'products', 'manage-products', 'web', 'Manage Products', 'Can manage products', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(131, 'products', 'view-products', 'web', 'View Products', 'View Products', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(132, 'products', 'create-products', 'web', 'Create Products', 'Can create products', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(133, 'products', 'edit-products', 'web', 'Edit Products', 'Can edit products', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(134, 'products', 'delete-products', 'web', 'Delete Products', 'Can delete products', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(135, 'products', 'toggle-status-products', 'web', 'Toggle Status Products', 'Can toggle status products', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(136, 'contacts', 'manage-contacts', 'web', 'Manage Contacts', 'Can manage contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(137, 'contacts', 'view-contacts', 'web', 'View Contacts', 'View Contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(138, 'contacts', 'create-contacts', 'web', 'Create Contacts', 'Can create contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(139, 'contacts', 'edit-contacts', 'web', 'Edit Contacts', 'Can edit contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(140, 'contacts', 'delete-contacts', 'web', 'Delete Contacts', 'Can delete contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(141, 'contacts', 'toggle-status-contacts', 'web', 'Toggle Status Contacts', 'Can toggle status contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(142, 'accounts', 'manage-accounts', 'web', 'Manage Accounts', 'Can manage accounts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(143, 'accounts', 'view-accounts', 'web', 'View Accounts', 'View Accounts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(144, 'accounts', 'create-accounts', 'web', 'Create Accounts', 'Can create accounts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(145, 'accounts', 'edit-accounts', 'web', 'Edit Accounts', 'Can edit accounts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(146, 'accounts', 'delete-accounts', 'web', 'Delete Accounts', 'Can delete accounts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(147, 'accounts', 'toggle-status-accounts', 'web', 'Toggle Status Accounts', 'Can toggle status accounts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(148, 'account_types', 'manage-account-types', 'web', 'Manage Account Types', 'Can manage account types', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(149, 'account_types', 'view-account-types', 'web', 'View Account Types', 'View Account Types', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(150, 'account_types', 'create-account-types', 'web', 'Create Account Types', 'Can create account types', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(151, 'account_types', 'edit-account-types', 'web', 'Edit Account Types', 'Can edit account types', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(152, 'account_types', 'delete-account-types', 'web', 'Delete Account Types', 'Can delete account types', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(153, 'account_types', 'toggle-status-account-types', 'web', 'Toggle Status Account Types', 'Can toggle status account types', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(154, 'account_industries', 'manage-account-industries', 'web', 'Manage Account Industries', 'Can manage account industries', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(155, 'account_industries', 'view-account-industries', 'web', 'View Account Industries', 'View Account Industries', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(156, 'account_industries', 'create-account-industries', 'web', 'Create Account Industries', 'Can create account industries', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(157, 'account_industries', 'edit-account-industries', 'web', 'Edit Account Industries', 'Can edit account industries', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(158, 'account_industries', 'delete-account-industries', 'web', 'Delete Account Industries', 'Can delete account industries', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(159, 'account_industries', 'toggle-status-account-industries', 'web', 'Toggle Status Account Industries', 'Can toggle status account industries', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(160, 'lead_statuses', 'manage-lead-statuses', 'web', 'Manage Lead Statuses', 'Can manage lead statuses', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(161, 'lead_statuses', 'view-lead-statuses', 'web', 'View Lead Statuses', 'View Lead Statuses', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(162, 'lead_statuses', 'create-lead-statuses', 'web', 'Create Lead Statuses', 'Can create lead statuses', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(163, 'lead_statuses', 'edit-lead-statuses', 'web', 'Edit Lead Statuses', 'Can edit lead statuses', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(164, 'lead_statuses', 'delete-lead-statuses', 'web', 'Delete Lead Statuses', 'Can delete lead statuses', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(165, 'lead_statuses', 'toggle-status-lead-statuses', 'web', 'Toggle Status Lead Statuses', 'Can toggle status lead statuses', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(166, 'lead_sources', 'manage-lead-sources', 'web', 'Manage Lead Sources', 'Can manage lead sources', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(167, 'lead_sources', 'view-lead-sources', 'web', 'View Lead Sources', 'View Lead Sources', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(168, 'lead_sources', 'create-lead-sources', 'web', 'Create Lead Sources', 'Can create lead sources', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(169, 'lead_sources', 'edit-lead-sources', 'web', 'Edit Lead Sources', 'Can edit lead sources', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(170, 'lead_sources', 'delete-lead-sources', 'web', 'Delete Lead Sources', 'Can delete lead sources', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(171, 'lead_sources', 'toggle-status-lead-sources', 'web', 'Toggle Status Lead Sources', 'Can toggle status lead sources', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(172, 'leads', 'manage-leads', 'web', 'Manage Leads', 'Can manage leads', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(173, 'leads', 'view-leads', 'web', 'View Leads', 'View Leads', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(174, 'leads', 'create-leads', 'web', 'Create Leads', 'Can create leads', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(175, 'leads', 'edit-leads', 'web', 'Edit Leads', 'Can edit leads', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(176, 'leads', 'delete-leads', 'web', 'Delete Leads', 'Can delete leads', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(177, 'leads', 'toggle-status-leads', 'web', 'Toggle Status Leads', 'Can toggle status leads', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(178, 'leads', 'convert-leads', 'web', 'Convert Leads', 'Can convert leads to accounts/contacts', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(179, 'opportunity_stages', 'manage-opportunity-stages', 'web', 'Manage Opportunity Stages', 'Can manage opportunity stages', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(180, 'opportunity_stages', 'view-opportunity-stages', 'web', 'View Opportunity Stages', 'View Opportunity Stages', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(181, 'opportunity_stages', 'create-opportunity-stages', 'web', 'Create Opportunity Stages', 'Can create opportunity stages', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(182, 'opportunity_stages', 'edit-opportunity-stages', 'web', 'Edit Opportunity Stages', 'Can edit opportunity stages', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(183, 'opportunity_stages', 'delete-opportunity-stages', 'web', 'Delete Opportunity Stages', 'Can delete opportunity stages', '2025-12-20 17:47:05', '2025-12-20 17:47:05'),
(184, 'opportunity_stages', 'toggle-status-opportunity-stages', 'web', 'Toggle Status Opportunity Stages', 'Can toggle status opportunity stages', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(185, 'opportunity_sources', 'manage-opportunity-sources', 'web', 'Manage Opportunity Sources', 'Can manage opportunity sources', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(186, 'opportunity_sources', 'view-opportunity-sources', 'web', 'View Opportunity Sources', 'View Opportunity Sources', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(187, 'opportunity_sources', 'create-opportunity-sources', 'web', 'Create Opportunity Sources', 'Can create opportunity sources', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(188, 'opportunity_sources', 'edit-opportunity-sources', 'web', 'Edit Opportunity Sources', 'Can edit opportunity sources', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(189, 'opportunity_sources', 'delete-opportunity-sources', 'web', 'Delete Opportunity Sources', 'Can delete opportunity sources', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(190, 'opportunity_sources', 'toggle-status-opportunity-sources', 'web', 'Toggle Status Opportunity Sources', 'Can toggle status opportunity sources', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(191, 'opportunities', 'manage-opportunities', 'web', 'Manage Opportunities', 'Can manage opportunities', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(192, 'opportunities', 'view-opportunities', 'web', 'View Opportunities', 'View Opportunities', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(193, 'opportunities', 'create-opportunities', 'web', 'Create Opportunities', 'Can create opportunities', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(194, 'opportunities', 'edit-opportunities', 'web', 'Edit Opportunities', 'Can edit opportunities', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(195, 'opportunities', 'delete-opportunities', 'web', 'Delete Opportunities', 'Can delete opportunities', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(196, 'opportunities', 'toggle-status-opportunities', 'web', 'Toggle Status Opportunities', 'Can toggle status opportunities', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(197, 'campaign_types', 'manage-campaign-types', 'web', 'Manage Campaign Types', 'Can manage campaign types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(198, 'campaign_types', 'view-campaign-types', 'web', 'View Campaign Types', 'View Campaign Types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(199, 'campaign_types', 'create-campaign-types', 'web', 'Create Campaign Types', 'Can create campaign types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(200, 'campaign_types', 'edit-campaign-types', 'web', 'Edit Campaign Types', 'Can edit campaign types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(201, 'campaign_types', 'delete-campaign-types', 'web', 'Delete Campaign Types', 'Can delete campaign types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(202, 'campaign_types', 'toggle-status-campaign-types', 'web', 'Toggle Status Campaign Types', 'Can toggle status campaign types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(203, 'target_lists', 'manage-target-lists', 'web', 'Manage Target Lists', 'Can manage target lists', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(204, 'target_lists', 'view-target-lists', 'web', 'View Target Lists', 'View Target Lists', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(205, 'target_lists', 'create-target-lists', 'web', 'Create Target Lists', 'Can create target lists', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(206, 'target_lists', 'edit-target-lists', 'web', 'Edit Target Lists', 'Can edit target lists', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(207, 'target_lists', 'delete-target-lists', 'web', 'Delete Target Lists', 'Can delete target lists', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(208, 'target_lists', 'toggle-status-target-lists', 'web', 'Toggle Status Target Lists', 'Can toggle status target lists', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(209, 'campaigns', 'manage-campaigns', 'web', 'Manage Campaigns', 'Can manage campaigns', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(210, 'campaigns', 'view-campaigns', 'web', 'View Campaigns', 'View Campaigns', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(211, 'campaigns', 'create-campaigns', 'web', 'Create Campaigns', 'Can create campaigns', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(212, 'campaigns', 'edit-campaigns', 'web', 'Edit Campaigns', 'Can edit campaigns', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(213, 'campaigns', 'delete-campaigns', 'web', 'Delete Campaigns', 'Can delete campaigns', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(214, 'campaigns', 'toggle-status-campaigns', 'web', 'Toggle Status Campaigns', 'Can toggle status campaigns', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(215, 'shipping_provider_types', 'manage-shipping-provider-types', 'web', 'Manage Shipping Provider Types', 'Can manage shipping provider types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(216, 'shipping_provider_types', 'view-shipping-provider-types', 'web', 'View Shipping Provider Types', 'View Shipping Provider Types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(217, 'shipping_provider_types', 'create-shipping-provider-types', 'web', 'Create Shipping Provider Types', 'Can create shipping provider types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(218, 'shipping_provider_types', 'edit-shipping-provider-types', 'web', 'Edit Shipping Provider Types', 'Can edit shipping provider types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(219, 'shipping_provider_types', 'delete-shipping-provider-types', 'web', 'Delete Shipping Provider Types', 'Can delete shipping provider types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(220, 'shipping_provider_types', 'toggle-status-shipping-provider-types', 'web', 'Toggle Status Shipping Provider Types', 'Can toggle status shipping provider types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(221, 'cases', 'manage-cases', 'web', 'Manage Cases', 'Can manage cases', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(222, 'cases', 'view-cases', 'web', 'View Cases', 'View Cases', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(223, 'cases', 'create-cases', 'web', 'Create Cases', 'Can create cases', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(224, 'cases', 'edit-cases', 'web', 'Edit Cases', 'Can edit cases', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(225, 'cases', 'delete-cases', 'web', 'Delete Cases', 'Can delete cases', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(226, 'cases', 'toggle-status-cases', 'web', 'Toggle Status Cases', 'Can toggle status cases', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(227, 'quotes', 'manage-quotes', 'web', 'Manage Quotes', 'Can manage quotes', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(228, 'quotes', 'view-quotes', 'web', 'View Quotes', 'View Quotes', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(229, 'quotes', 'create-quotes', 'web', 'Create Quotes', 'Can create quotes', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(230, 'quotes', 'edit-quotes', 'web', 'Edit Quotes', 'Can edit quotes', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(231, 'quotes', 'delete-quotes', 'web', 'Delete Quotes', 'Can delete quotes', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(232, 'quotes', 'toggle-status-quotes', 'web', 'Toggle Status Quotes', 'Can toggle status quotes', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(233, 'sales_orders', 'manage-sales-orders', 'web', 'Manage Sales Orders', 'Can manage sales orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(234, 'sales_orders', 'view-sales-orders', 'web', 'View Sales Orders', 'View Sales Orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(235, 'sales_orders', 'create-sales-orders', 'web', 'Create Sales Orders', 'Can create sales orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(236, 'sales_orders', 'edit-sales-orders', 'web', 'Edit Sales Orders', 'Can edit sales orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(237, 'sales_orders', 'delete-sales-orders', 'web', 'Delete Sales Orders', 'Can delete sales orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(238, 'sales_orders', 'toggle-status-sales-orders', 'web', 'Toggle Status Sales Orders', 'Can toggle status sales orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(239, 'invoices', 'manage-invoices', 'web', 'Manage Invoices', 'Can manage invoices', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(240, 'invoices', 'view-invoices', 'web', 'View Invoices', 'View Invoices', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(241, 'invoices', 'create-invoices', 'web', 'Create Invoices', 'Can create invoices', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(242, 'invoices', 'edit-invoices', 'web', 'Edit Invoices', 'Can edit invoices', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(243, 'invoices', 'delete-invoices', 'web', 'Delete Invoices', 'Can delete invoices', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(244, 'invoices', 'toggle-status-invoices', 'web', 'Toggle Status Invoices', 'Can toggle status invoices', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(245, 'delivery_orders', 'manage-delivery-orders', 'web', 'Manage Delivery Orders', 'Can manage delivery orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(246, 'delivery_orders', 'view-delivery-orders', 'web', 'View Delivery Orders', 'View Delivery Orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(247, 'delivery_orders', 'create-delivery-orders', 'web', 'Create Delivery Orders', 'Can create delivery orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(248, 'delivery_orders', 'edit-delivery-orders', 'web', 'Edit Delivery Orders', 'Can edit delivery orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(249, 'delivery_orders', 'delete-delivery-orders', 'web', 'Delete Delivery Orders', 'Can delete delivery orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(250, 'delivery_orders', 'toggle-status-delivery-orders', 'web', 'Toggle Status Delivery Orders', 'Can toggle status delivery orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(251, 'return_orders', 'manage-return-orders', 'web', 'Manage Return Orders', 'Can manage return orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(252, 'return_orders', 'view-return-orders', 'web', 'View Return Orders', 'View Return Orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(253, 'return_orders', 'create-return-orders', 'web', 'Create Return Orders', 'Can create return orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(254, 'return_orders', 'edit-return-orders', 'web', 'Edit Return Orders', 'Can edit return orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(255, 'return_orders', 'delete-return-orders', 'web', 'Delete Return Orders', 'Can delete return orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(256, 'purchase_orders', 'manage-purchase-orders', 'web', 'Manage Purchase Orders', 'Can manage purchase orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(257, 'purchase_orders', 'view-purchase-orders', 'web', 'View Purchase Orders', 'View Purchase Orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(258, 'purchase_orders', 'create-purchase-orders', 'web', 'Create Purchase Orders', 'Can create purchase orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(259, 'purchase_orders', 'edit-purchase-orders', 'web', 'Edit Purchase Orders', 'Can edit purchase orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(260, 'purchase_orders', 'delete-purchase-orders', 'web', 'Delete Purchase Orders', 'Can delete purchase orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(261, 'purchase_orders', 'toggle-status-purchase-orders', 'web', 'Toggle Status Purchase Orders', 'Can toggle status purchase orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(262, 'receipt_orders', 'manage-receipt-orders', 'web', 'Manage Receipt Orders', 'Can manage receipt orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(263, 'receipt_orders', 'view-receipt-orders', 'web', 'View Receipt Orders', 'View Receipt Orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(264, 'receipt_orders', 'create-receipt-orders', 'web', 'Create Receipt Orders', 'Can create receipt orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(265, 'receipt_orders', 'edit-receipt-orders', 'web', 'Edit Receipt Orders', 'Can edit receipt orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(266, 'receipt_orders', 'delete-receipt-orders', 'web', 'Delete Receipt Orders', 'Can delete receipt orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(267, 'receipt_orders', 'toggle-status-receipt-orders', 'web', 'Toggle Status Receipt Orders', 'Can toggle status receipt orders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(268, 'projects', 'manage-projects', 'web', 'Manage Projects', 'Can manage projects', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(269, 'projects', 'view-projects', 'web', 'View Projects', 'View Projects', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(270, 'projects', 'create-projects', 'web', 'Create Projects', 'Can create projects', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(271, 'projects', 'edit-projects', 'web', 'Edit Projects', 'Can edit projects', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(272, 'projects', 'delete-projects', 'web', 'Delete Projects', 'Can delete projects', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(273, 'projects', 'toggle-status-projects', 'web', 'Toggle Status Projects', 'Can toggle status projects', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(274, 'project_tasks', 'manage-project-tasks', 'web', 'Manage Project Tasks', 'Can manage project tasks', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(275, 'project_tasks', 'view-project-tasks', 'web', 'View Project Tasks', 'View Project Tasks', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(276, 'project_tasks', 'create-project-tasks', 'web', 'Create Project Tasks', 'Can create project tasks', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(277, 'project_tasks', 'edit-project-tasks', 'web', 'Edit Project Tasks', 'Can edit project tasks', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(278, 'project_tasks', 'delete-project-tasks', 'web', 'Delete Project Tasks', 'Can delete project tasks', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(279, 'project_tasks', 'toggle-status-project-tasks', 'web', 'Toggle Status Project Tasks', 'Can toggle status project tasks', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(280, 'task_statuses', 'manage-task-statuses', 'web', 'Manage Task Statuses', 'Can manage task statuses', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(281, 'task_statuses', 'view-task-statuses', 'web', 'View Task Statuses', 'View Task Statuses', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(282, 'task_statuses', 'create-task-statuses', 'web', 'Create Task Statuses', 'Can create task statuses', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(283, 'task_statuses', 'edit-task-statuses', 'web', 'Edit Task Statuses', 'Can edit task statuses', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(284, 'task_statuses', 'delete-task-statuses', 'web', 'Delete Task Statuses', 'Can delete task statuses', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(285, 'task_statuses', 'toggle-status-task-statuses', 'web', 'Toggle Status Task Statuses', 'Can toggle status task statuses', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(286, 'meetings', 'manage-meetings', 'web', 'Manage Meetings', 'Can manage meetings', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(287, 'meetings', 'view-meetings', 'web', 'View Meetings', 'View Meetings', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(288, 'meetings', 'create-meetings', 'web', 'Create Meetings', 'Can create meetings', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(289, 'meetings', 'edit-meetings', 'web', 'Edit Meetings', 'Can edit meetings', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(290, 'meetings', 'delete-meetings', 'web', 'Delete Meetings', 'Can delete meetings', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(291, 'meetings', 'toggle-status-meetings', 'web', 'Toggle Status Meetings', 'Can toggle status meetings', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(292, 'calls', 'manage-calls', 'web', 'Manage Calls', 'Can manage calls', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(293, 'calls', 'view-calls', 'web', 'View Calls', 'View Calls', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(294, 'calls', 'create-calls', 'web', 'Create Calls', 'Can create calls', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(295, 'calls', 'edit-calls', 'web', 'Edit Calls', 'Can edit calls', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(296, 'calls', 'delete-calls', 'web', 'Delete Calls', 'Can delete calls', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(297, 'calls', 'toggle-status-calls', 'web', 'Toggle Status Calls', 'Can toggle status calls', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(298, 'document_folders', 'manage-document-folders', 'web', 'Manage Document Folders', 'Can manage document folders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(299, 'document_folders', 'view-document-folders', 'web', 'View Document Folders', 'View Document Folders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(300, 'document_folders', 'create-document-folders', 'web', 'Create Document Folders', 'Can create document folders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(301, 'document_folders', 'edit-document-folders', 'web', 'Edit Document Folders', 'Can edit document folders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(302, 'document_folders', 'delete-document-folders', 'web', 'Delete Document Folders', 'Can delete document folders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(303, 'document_folders', 'toggle-status-document-folders', 'web', 'Toggle Status Document Folders', 'Can toggle status document folders', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(304, 'document_types', 'manage-document-types', 'web', 'Manage Document Types', 'Can manage document types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(305, 'document_types', 'view-document-types', 'web', 'View Document Types', 'View Document Types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(306, 'document_types', 'create-document-types', 'web', 'Create Document Types', 'Can create document types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(307, 'document_types', 'edit-document-types', 'web', 'Edit Document Types', 'Can edit document types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(308, 'document_types', 'delete-document-types', 'web', 'Delete Document Types', 'Can delete document types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(309, 'document_types', 'toggle-status-document-types', 'web', 'Toggle Status Document Types', 'Can toggle status document types', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(310, 'documents', 'manage-documents', 'web', 'Manage Documents', 'Can manage documents', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(311, 'documents', 'view-documents', 'web', 'View Documents', 'View Documents', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(312, 'documents', 'create-documents', 'web', 'Create Documents', 'Can create documents', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(313, 'documents', 'edit-documents', 'web', 'Edit Documents', 'Can edit documents', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(314, 'documents', 'delete-documents', 'web', 'Delete Documents', 'Can delete documents', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(315, 'documents', 'toggle-status-documents', 'web', 'Toggle Status Documents', 'Can toggle status documents', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(316, 'reports', 'manage-reports', 'web', 'Manage Reports', 'Can manage reports', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(317, 'notification_templates', 'manage-notification-templates', 'web', 'Manage Notification Templates', 'Can manage notification templates', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(318, 'notification_templates', 'view-notification-templates', 'web', 'View Notification Templates', 'View Notification Templates', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(319, 'notification_templates', 'create-notification-templates', 'web', 'Create Notification Templates', 'Can create notification templates', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(320, 'notification_templates', 'edit-notification-templates', 'web', 'Edit Notification Templates', 'Can edit notification templates', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(321, 'notification_templates', 'delete-notification-templates', 'web', 'Delete Notification Templates', 'Can delete notification templates', '2025-12-20 17:47:06', '2025-12-20 17:47:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `yearly_price` double DEFAULT NULL,
  `duration` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_users` int NOT NULL DEFAULT '0',
  `max_projects` int NOT NULL DEFAULT '0',
  `max_contacts` int NOT NULL DEFAULT '0',
  `max_accounts` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `enable_branding` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `enable_chatgpt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `storage_limit` float NOT NULL DEFAULT '0',
  `is_trial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_day` int NOT NULL DEFAULT '0',
  `is_plan_enable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `module` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `yearly_price`, `duration`, `max_users`, `max_projects`, `max_contacts`, `max_accounts`, `description`, `enable_branding`, `enable_chatgpt`, `storage_limit`, `is_trial`, `trial_day`, `is_plan_enable`, `is_default`, `module`, `created_at`, `updated_at`) VALUES
(1, 'Free', 0, 0, 'monthly', 2, 1, 10, 5, 'Basic plan for small businesses just getting started.', 'on', 'off', 1, NULL, 0, 'on', 1, NULL, '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(2, 'Starter', 19.99, 191.9, 'monthly', 10, 5, 20, 25, 'Perfect for small businesses looking to grow their online presence.', 'off', 'off', 5, 'on', 7, 'on', 0, NULL, '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(3, 'Pro', 49.99, 479.9, 'monthly', 50, 20, 100, 100, 'Ideal for growing businesses with multiple stores and advanced needs.', 'off', 'on', 50, 'on', 14, 'on', 0, NULL, '2025-12-20 17:47:06', '2025-12-20 17:47:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plan_orders`
--

DROP TABLE IF EXISTS `plan_orders`;
CREATE TABLE IF NOT EXISTS `plan_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `billing_cycle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `final_price` decimal(10,2) NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ordered_at` timestamp NOT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `processed_by` bigint UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plan_orders_order_number_unique` (`order_number`),
  KEY `plan_orders_user_id_foreign` (`user_id`),
  KEY `plan_orders_plan_id_foreign` (`plan_id`),
  KEY `plan_orders_coupon_id_foreign` (`coupon_id`),
  KEY `plan_orders_processed_by_foreign` (`processed_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `plan_requests`
--

DROP TABLE IF EXISTS `plan_requests`;
CREATE TABLE IF NOT EXISTS `plan_requests` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `message` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `rejected_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_requests_user_id_foreign` (`user_id`),
  KEY `plan_requests_plan_id_foreign` (`plan_id`),
  KEY `plan_requests_approved_by_foreign` (`approved_by`),
  KEY `plan_requests_rejected_by_foreign` (`rejected_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `main_image_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_image_ids` json DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_tax_id_foreign` (`tax_id`),
  KEY `products_created_by_foreign` (`created_by`),
  KEY `products_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `budget` decimal(15,2) DEFAULT NULL,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('active','inactive','completed','on_hold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `account_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_account_id_foreign` (`account_id`),
  KEY `projects_created_by_foreign` (`created_by`),
  KEY `projects_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `project_tasks`
--

DROP TABLE IF EXISTS `project_tasks`;
CREATE TABLE IF NOT EXISTS `project_tasks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `project_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `task_status_id` bigint UNSIGNED DEFAULT NULL,
  `estimated_hours` decimal(8,2) DEFAULT NULL,
  `actual_hours` decimal(8,2) DEFAULT NULL,
  `progress` int NOT NULL DEFAULT '0',
  `attachments` json DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_tasks_project_id_foreign` (`project_id`),
  KEY `project_tasks_parent_id_foreign` (`parent_id`),
  KEY `project_tasks_assigned_to_foreign` (`assigned_to`),
  KEY `project_tasks_task_status_id_foreign` (`task_status_id`),
  KEY `project_tasks_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_order_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `billing_contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_provider_type_id` bigint UNSIGNED DEFAULT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date NOT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `status` enum('draft','sent','confirmed','received','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_order_number_unique` (`order_number`),
  KEY `purchase_orders_sales_order_id_foreign` (`sales_order_id`),
  KEY `purchase_orders_account_id_foreign` (`account_id`),
  KEY `purchase_orders_contact_id_foreign` (`contact_id`),
  KEY `purchase_orders_billing_contact_id_foreign` (`billing_contact_id`),
  KEY `purchase_orders_shipping_contact_id_foreign` (`shipping_contact_id`),
  KEY `purchase_orders_shipping_provider_type_id_foreign` (`shipping_provider_type_id`),
  KEY `purchase_orders_assigned_to_foreign` (`assigned_to`),
  KEY `purchase_orders_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `purchase_order_activities`
--

DROP TABLE IF EXISTS `purchase_order_activities`;
CREATE TABLE IF NOT EXISTS `purchase_order_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_activities_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_activities_user_id_foreign` (`user_id`),
  KEY `purchase_order_activities_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `purchase_order_comments`
--

DROP TABLE IF EXISTS `purchase_order_comments`;
CREATE TABLE IF NOT EXISTS `purchase_order_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_comments_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_comments_user_id_foreign` (`user_id`),
  KEY `purchase_order_comments_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `purchase_order_products`
--

DROP TABLE IF EXISTS `purchase_order_products`;
CREATE TABLE IF NOT EXISTS `purchase_order_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount_type` enum('percentage','fixed','none') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_products_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quotes`
--

DROP TABLE IF EXISTS `quotes`;
CREATE TABLE IF NOT EXISTS `quotes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quote_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `opportunity_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `billing_contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_provider_type_id` bigint UNSIGNED DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','sent','accepted','rejected','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `valid_until` date DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quotes_quote_number_unique` (`quote_number`),
  KEY `quotes_opportunity_id_foreign` (`opportunity_id`),
  KEY `quotes_account_id_foreign` (`account_id`),
  KEY `quotes_billing_contact_id_foreign` (`billing_contact_id`),
  KEY `quotes_shipping_contact_id_foreign` (`shipping_contact_id`),
  KEY `quotes_shipping_provider_type_id_foreign` (`shipping_provider_type_id`),
  KEY `quotes_assigned_to_foreign` (`assigned_to`),
  KEY `quotes_created_by_status_index` (`created_by`,`status`),
  KEY `quotes_quote_number_index` (`quote_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quote_activities`
--

DROP TABLE IF EXISTS `quote_activities`;
CREATE TABLE IF NOT EXISTS `quote_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quote_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_activities_quote_id_foreign` (`quote_id`),
  KEY `quote_activities_user_id_foreign` (`user_id`),
  KEY `quote_activities_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quote_comments`
--

DROP TABLE IF EXISTS `quote_comments`;
CREATE TABLE IF NOT EXISTS `quote_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quote_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_comments_quote_id_foreign` (`quote_id`),
  KEY `quote_comments_user_id_foreign` (`user_id`),
  KEY `quote_comments_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quote_products`
--

DROP TABLE IF EXISTS `quote_products`;
CREATE TABLE IF NOT EXISTS `quote_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quote_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount_type` enum('percentage','fixed','none') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quote_products_quote_id_product_id_unique` (`quote_id`,`product_id`),
  KEY `quote_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receipt_orders`
--

DROP TABLE IF EXISTS `receipt_orders`;
CREATE TABLE IF NOT EXISTS `receipt_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `purchase_order_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `return_order_id` bigint UNSIGNED DEFAULT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `receipt_date` date NOT NULL,
  `expected_date` date DEFAULT NULL,
  `status` enum('pending','received','partial','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_orders_receipt_number_unique` (`receipt_number`),
  KEY `receipt_orders_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `receipt_orders_account_id_foreign` (`account_id`),
  KEY `receipt_orders_return_order_id_foreign` (`return_order_id`),
  KEY `receipt_orders_contact_id_foreign` (`contact_id`),
  KEY `receipt_orders_assigned_to_foreign` (`assigned_to`),
  KEY `receipt_orders_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receipt_order_products`
--

DROP TABLE IF EXISTS `receipt_order_products`;
CREATE TABLE IF NOT EXISTS `receipt_order_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `receipt_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount_type` enum('percentage','fixed','none') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_value` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_order_products_receipt_order_id_foreign` (`receipt_order_id`),
  KEY `receipt_order_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `referrals`
--

DROP TABLE IF EXISTS `referrals`;
CREATE TABLE IF NOT EXISTS `referrals` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `commission_percentage` decimal(5,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referrals_user_id_foreign` (`user_id`),
  KEY `referrals_company_id_foreign` (`company_id`),
  KEY `referrals_plan_id_foreign` (`plan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `referral_settings`
--

DROP TABLE IF EXISTS `referral_settings`;
CREATE TABLE IF NOT EXISTS `referral_settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `commission_percentage` decimal(5,2) NOT NULL DEFAULT '10.00',
  `threshold_amount` decimal(10,2) NOT NULL DEFAULT '50.00',
  `guidelines` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `referral_settings`
--

INSERT INTO `referral_settings` (`id`, `is_enabled`, `commission_percentage`, `threshold_amount`, `guidelines`, `created_at`, `updated_at`) VALUES
(1, 1, 10.00, 50.00, NULL, '2025-12-20 18:02:21', '2025-12-20 18:02:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `return_orders`
--

DROP TABLE IF EXISTS `return_orders`;
CREATE TABLE IF NOT EXISTS `return_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `return_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_order_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_provider_type_id` bigint UNSIGNED DEFAULT NULL,
  `tracking_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','shipped','received','processed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` enum('defective','wrong_item','damaged','not_needed','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `reason_description` text COLLATE utf8mb4_unicode_ci,
  `return_date` date NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `return_orders_return_number_unique` (`return_number`),
  KEY `return_orders_sales_order_id_foreign` (`sales_order_id`),
  KEY `return_orders_account_id_foreign` (`account_id`),
  KEY `return_orders_contact_id_foreign` (`contact_id`),
  KEY `return_orders_shipping_provider_type_id_foreign` (`shipping_provider_type_id`),
  KEY `return_orders_created_by_foreign` (`created_by`),
  KEY `return_orders_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `return_order_product`
--

DROP TABLE IF EXISTS `return_order_product`;
CREATE TABLE IF NOT EXISTS `return_order_product` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `return_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_order_product_return_order_id_foreign` (`return_order_id`),
  KEY `return_order_product_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `label`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', 'Super Admin', 'Super Admin has full access to all features', NULL, '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(2, 'company', 'web', 'Company', 'Company has access to manage buissness', NULL, '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(3, 'sales-manager', 'web', 'Sales Manager', 'Sales Manager has access to manage sales operations', 2, '2025-12-20 17:47:08', '2025-12-20 17:47:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(7, 1),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(24, 2),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(39, 2),
(40, 1),
(41, 1),
(42, 1),
(42, 2),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(57, 2),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(71, 2),
(72, 1),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(101, 3),
(102, 1),
(103, 1),
(103, 2),
(103, 3),
(104, 1),
(104, 2),
(104, 3),
(105, 1),
(105, 2),
(105, 3),
(106, 1),
(106, 2),
(107, 1),
(107, 2),
(107, 3),
(108, 1),
(108, 2),
(109, 1),
(110, 1),
(110, 2),
(111, 1),
(112, 1),
(112, 2),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(115, 2),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(118, 2),
(118, 3),
(119, 1),
(119, 2),
(119, 3),
(120, 1),
(120, 2),
(121, 1),
(121, 2),
(122, 1),
(122, 2),
(123, 1),
(123, 2),
(124, 1),
(124, 2),
(124, 3),
(125, 1),
(125, 2),
(125, 3),
(126, 1),
(126, 2),
(127, 1),
(127, 2),
(128, 1),
(128, 2),
(129, 1),
(129, 2),
(130, 1),
(130, 2),
(130, 3),
(131, 1),
(131, 2),
(131, 3),
(132, 1),
(132, 2),
(133, 1),
(133, 2),
(134, 1),
(134, 2),
(135, 1),
(135, 2),
(136, 1),
(136, 2),
(136, 3),
(137, 1),
(137, 2),
(137, 3),
(138, 1),
(138, 2),
(138, 3),
(139, 1),
(139, 2),
(139, 3),
(140, 1),
(140, 2),
(140, 3),
(141, 1),
(141, 2),
(142, 1),
(142, 2),
(142, 3),
(143, 1),
(143, 2),
(143, 3),
(144, 1),
(144, 2),
(144, 3),
(145, 1),
(145, 2),
(145, 3),
(146, 1),
(146, 2),
(146, 3),
(147, 1),
(147, 2),
(148, 1),
(148, 2),
(149, 1),
(149, 2),
(150, 1),
(150, 2),
(151, 1),
(151, 2),
(152, 1),
(152, 2),
(153, 1),
(153, 2),
(154, 1),
(154, 2),
(155, 1),
(155, 2),
(156, 1),
(156, 2),
(157, 1),
(157, 2),
(158, 1),
(158, 2),
(159, 1),
(159, 2),
(160, 1),
(160, 2),
(161, 1),
(161, 2),
(162, 1),
(162, 2),
(163, 1),
(163, 2),
(164, 1),
(164, 2),
(165, 1),
(165, 2),
(166, 1),
(166, 2),
(167, 1),
(167, 2),
(168, 1),
(168, 2),
(169, 1),
(169, 2),
(170, 1),
(170, 2),
(171, 1),
(171, 2),
(172, 1),
(172, 2),
(172, 3),
(173, 1),
(173, 2),
(173, 3),
(174, 1),
(174, 2),
(174, 3),
(175, 1),
(175, 2),
(175, 3),
(176, 1),
(176, 2),
(176, 3),
(177, 1),
(177, 2),
(178, 1),
(178, 2),
(178, 3),
(179, 1),
(179, 2),
(180, 1),
(180, 2),
(181, 1),
(181, 2),
(182, 1),
(182, 2),
(183, 1),
(183, 2),
(184, 1),
(184, 2),
(185, 1),
(185, 2),
(186, 1),
(186, 2),
(187, 1),
(187, 2),
(188, 1),
(188, 2),
(189, 1),
(189, 2),
(190, 1),
(190, 2),
(191, 1),
(191, 2),
(191, 3),
(192, 1),
(192, 2),
(192, 3),
(193, 1),
(193, 2),
(193, 3),
(194, 1),
(194, 2),
(194, 3),
(195, 1),
(195, 2),
(195, 3),
(196, 1),
(196, 2),
(197, 1),
(197, 2),
(198, 1),
(198, 2),
(199, 1),
(199, 2),
(200, 1),
(200, 2),
(201, 1),
(201, 2),
(202, 1),
(202, 2),
(203, 1),
(203, 2),
(204, 1),
(204, 2),
(205, 1),
(205, 2),
(206, 1),
(206, 2),
(207, 1),
(207, 2),
(208, 1),
(208, 2),
(209, 1),
(209, 2),
(209, 3),
(210, 1),
(210, 2),
(210, 3),
(211, 1),
(211, 2),
(211, 3),
(212, 1),
(212, 2),
(212, 3),
(213, 1),
(213, 2),
(214, 1),
(214, 2),
(215, 1),
(215, 2),
(216, 1),
(216, 2),
(217, 1),
(217, 2),
(218, 1),
(218, 2),
(219, 1),
(219, 2),
(220, 1),
(220, 2),
(221, 1),
(221, 2),
(222, 1),
(222, 2),
(223, 1),
(223, 2),
(224, 1),
(224, 2),
(225, 1),
(225, 2),
(226, 1),
(226, 2),
(227, 1),
(227, 2),
(227, 3),
(228, 1),
(228, 2),
(228, 3),
(229, 1),
(229, 2),
(229, 3),
(230, 1),
(230, 2),
(230, 3),
(231, 1),
(231, 2),
(231, 3),
(232, 1),
(232, 2),
(233, 1),
(233, 2),
(233, 3),
(234, 1),
(234, 2),
(234, 3),
(235, 1),
(235, 2),
(235, 3),
(236, 1),
(236, 2),
(236, 3),
(237, 1),
(237, 2),
(237, 3),
(238, 1),
(238, 2),
(239, 1),
(239, 2),
(239, 3),
(240, 1),
(240, 2),
(240, 3),
(241, 1),
(241, 2),
(241, 3),
(242, 1),
(242, 2),
(242, 3),
(243, 1),
(243, 2),
(243, 3),
(244, 1),
(244, 2),
(245, 1),
(245, 2),
(245, 3),
(246, 1),
(246, 2),
(246, 3),
(247, 1),
(247, 2),
(247, 3),
(248, 1),
(248, 2),
(248, 3),
(249, 1),
(249, 2),
(250, 1),
(250, 2),
(251, 1),
(252, 1),
(252, 2),
(253, 1),
(253, 2),
(254, 1),
(254, 2),
(255, 1),
(255, 2),
(256, 1),
(256, 2),
(257, 1),
(257, 2),
(258, 1),
(258, 2),
(259, 1),
(259, 2),
(260, 1),
(260, 2),
(261, 1),
(261, 2),
(262, 1),
(262, 2),
(263, 1),
(263, 2),
(264, 1),
(264, 2),
(265, 1),
(265, 2),
(266, 1),
(266, 2),
(267, 1),
(267, 2),
(268, 1),
(268, 2),
(269, 1),
(269, 2),
(270, 1),
(270, 2),
(271, 1),
(271, 2),
(272, 1),
(272, 2),
(273, 1),
(273, 2),
(274, 1),
(274, 2),
(275, 1),
(275, 2),
(276, 1),
(276, 2),
(277, 1),
(277, 2),
(278, 1),
(278, 2),
(279, 1),
(279, 2),
(280, 1),
(280, 2),
(281, 1),
(281, 2),
(282, 1),
(282, 2),
(283, 1),
(283, 2),
(284, 1),
(284, 2),
(285, 1),
(285, 2),
(286, 1),
(286, 2),
(286, 3),
(287, 1),
(287, 2),
(287, 3),
(288, 1),
(288, 2),
(288, 3),
(289, 1),
(289, 2),
(289, 3),
(290, 1),
(290, 2),
(290, 3),
(291, 1),
(291, 2),
(292, 1),
(292, 2),
(292, 3),
(293, 1),
(293, 2),
(293, 3),
(294, 1),
(294, 2),
(294, 3),
(295, 1),
(295, 2),
(295, 3),
(296, 1),
(296, 2),
(296, 3),
(297, 1),
(297, 2),
(298, 1),
(298, 2),
(299, 1),
(299, 2),
(300, 1),
(300, 2),
(301, 1),
(301, 2),
(302, 1),
(302, 2),
(303, 1),
(303, 2),
(304, 1),
(304, 2),
(305, 1),
(305, 2),
(306, 1),
(306, 2),
(307, 1),
(307, 2),
(308, 1),
(308, 2),
(309, 1),
(309, 2),
(310, 1),
(310, 2),
(311, 1),
(311, 2),
(312, 1),
(312, 2),
(313, 1),
(313, 2),
(314, 1),
(314, 2),
(315, 1),
(315, 2),
(316, 1),
(316, 2),
(316, 3),
(317, 1),
(317, 2),
(318, 1),
(318, 2),
(319, 1),
(319, 2),
(320, 1),
(320, 2),
(321, 1),
(321, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sales_orders`
--

DROP TABLE IF EXISTS `sales_orders`;
CREATE TABLE IF NOT EXISTS `sales_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quote_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `billing_contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_contact_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_provider_type_id` bigint UNSIGNED DEFAULT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` enum('draft','confirmed','processing','shipped','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_orders_order_number_unique` (`order_number`),
  KEY `sales_orders_quote_id_foreign` (`quote_id`),
  KEY `sales_orders_account_id_foreign` (`account_id`),
  KEY `sales_orders_contact_id_foreign` (`contact_id`),
  KEY `sales_orders_billing_contact_id_foreign` (`billing_contact_id`),
  KEY `sales_orders_shipping_contact_id_foreign` (`shipping_contact_id`),
  KEY `sales_orders_shipping_provider_type_id_foreign` (`shipping_provider_type_id`),
  KEY `sales_orders_assigned_to_foreign` (`assigned_to`),
  KEY `sales_orders_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sales_order_activities`
--

DROP TABLE IF EXISTS `sales_order_activities`;
CREATE TABLE IF NOT EXISTS `sales_order_activities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `field_changed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_activities_sales_order_id_foreign` (`sales_order_id`),
  KEY `sales_order_activities_user_id_foreign` (`user_id`),
  KEY `sales_order_activities_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sales_order_products`
--

DROP TABLE IF EXISTS `sales_order_products`;
CREATE TABLE IF NOT EXISTS `sales_order_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount_type` enum('percentage','fixed','none') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_products_sales_order_id_foreign` (`sales_order_id`),
  KEY `sales_order_products_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_user_id_key_unique` (`user_id`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'defaultLanguage', 'pt-BR', '2025-12-20 17:47:06', '2025-12-20 18:25:18'),
(2, 1, 'dateFormat', 'Y-m-d', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(3, 1, 'timeFormat', 'H:i', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(4, 1, 'calendarStartDay', 'sunday', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(5, 1, 'defaultTimezone', 'UTC', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(6, 1, 'emailVerification', '0', '2025-12-20 17:47:06', '2025-12-20 18:25:18'),
(7, 1, 'landingPageEnabled', '1', '2025-12-20 17:47:06', '2025-12-20 18:25:18'),
(8, 1, 'logoDark', 'http://127.0.0.1:8001/storage/media/2/cyzer_logo2_white2.png', '2025-12-20 17:47:06', '2025-12-20 18:03:09'),
(9, 1, 'logoLight', 'http://127.0.0.1:8001/storage/media/1/cyzer_logo2_light.png', '2025-12-20 17:47:06', '2025-12-20 18:22:50'),
(10, 1, 'favicon', 'http://127.0.0.1:8001/storage/media/3/profile_1.png', '2025-12-20 17:47:06', '2025-12-20 18:03:33'),
(11, 1, 'titleText', 'Sales', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(12, 1, 'footerText', '© 2024 Sales. All rights reserved.', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(13, 1, 'themeColor', 'blue', '2025-12-20 17:47:06', '2025-12-20 19:35:35'),
(14, 1, 'customColor', '#10b981', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(15, 1, 'sidebarVariant', 'inset', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(16, 1, 'sidebarStyle', 'plain', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(17, 1, 'layoutDirection', 'left', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(18, 1, 'themeMode', 'light', '2025-12-20 17:47:06', '2025-12-20 19:35:28'),
(19, 1, 'storage_type', 'local', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(20, 1, 'storage_file_types', 'jpg,png,webp,gif,pdf,doc,docx,txt,csv', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(21, 1, 'storage_max_upload_size', '2048', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(22, 1, 'aws_access_key_id', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(23, 1, 'aws_secret_access_key', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(24, 1, 'aws_default_region', 'us-east-1', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(25, 1, 'aws_bucket', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(26, 1, 'aws_url', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(27, 1, 'aws_endpoint', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(28, 1, 'wasabi_access_key', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(29, 1, 'wasabi_secret_key', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(30, 1, 'wasabi_region', 'us-east-1', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(31, 1, 'wasabi_bucket', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(32, 1, 'wasabi_url', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(33, 1, 'wasabi_root', '', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(34, 1, 'decimalFormat', '2', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(35, 1, 'defaultCurrency', 'BRL', '2025-12-20 17:47:06', '2025-12-20 19:36:53'),
(36, 1, 'decimalSeparator', '.', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(37, 1, 'thousandsSeparator', ',', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(38, 1, 'floatNumber', '1', '2025-12-20 17:47:06', '2025-12-21 01:51:02'),
(39, 1, 'currencySymbolSpace', '1', '2025-12-20 17:47:06', '2025-12-21 01:51:02'),
(40, 1, 'currencySymbolPosition', 'before', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(41, 1, 'enableLogging', '0', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(42, 1, 'strictlyNecessaryCookies', '1', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(43, 1, 'cookieTitle', 'Cookie Consent', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(44, 1, 'strictlyCookieTitle', 'Strictly Necessary Cookies', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(45, 1, 'cookieDescription', 'We use cookies to enhance your browsing experience and provide personalized content.', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(46, 1, 'strictlyCookieDescription', 'These cookies are essential for the website to function properly.', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(47, 1, 'contactUsDescription', 'If you have any questions about our cookie policy, please contact us.', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(48, 1, 'contactUsUrl', 'https://example.com/contact', '2025-12-20 17:47:06', '2025-12-20 17:47:06'),
(49, 2, 'calendarStartDay', 'sunday', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(50, 2, 'contactUsDescription', 'If you have any questions about our cookie policy, please contact us.', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(51, 2, 'contactUsUrl', 'https://example.com/contact', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(52, 2, 'cookieDescription', 'We use cookies to enhance your browsing experience and provide personalized content.', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(53, 2, 'cookieTitle', 'Cookie Consent', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(54, 2, 'customColor', '#10b981', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(55, 2, 'dateFormat', 'Y-m-d', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(56, 2, 'defaultLanguage', 'en', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(57, 2, 'defaultTimezone', 'UTC', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(58, 2, 'emailVerification', '0', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(59, 2, 'enableLogging', '0', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(60, 2, 'favicon', '/images/logos/favicon.ico', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(61, 2, 'footerText', '© 2024 Sales. All rights reserved.', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(62, 2, 'landingPageEnabled', '1', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(63, 2, 'layoutDirection', 'left', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(64, 2, 'logoDark', '/images/logos/logo-dark.png', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(65, 2, 'logoLight', '/images/logos/logo-light.png', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(66, 2, 'sidebarStyle', 'plain', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(67, 2, 'sidebarVariant', 'inset', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(68, 2, 'strictlyCookieDescription', 'These cookies are essential for the website to function properly.', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(69, 2, 'strictlyCookieTitle', 'Strictly Necessary Cookies', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(70, 2, 'strictlyNecessaryCookies', '1', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(71, 2, 'themeColor', 'green', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(72, 2, 'themeMode', 'light', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(73, 2, 'timeFormat', 'H:i', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(74, 2, 'titleText', 'Sales', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(75, 2, 'decimalFormat', '2', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(76, 2, 'defaultCurrency', 'USD', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(77, 2, 'decimalSeparator', '.', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(78, 2, 'thousandsSeparator', ',', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(79, 2, 'floatNumber', '1', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(80, 2, 'currencySymbolSpace', '0', '2025-12-20 17:47:07', '2025-12-20 17:47:07'),
(81, 2, 'currencySymbolPosition', 'before', '2025-12-20 17:47:07', '2025-12-20 17:47:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `shipping_provider_types`
--

DROP TABLE IF EXISTS `shipping_provider_types`;
CREATE TABLE IF NOT EXISTS `shipping_provider_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_provider_types_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `target_lists`
--

DROP TABLE IF EXISTS `target_lists`;
CREATE TABLE IF NOT EXISTS `target_lists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_lists_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `task_statuses`
--

DROP TABLE IF EXISTS `task_statuses`;
CREATE TABLE IF NOT EXISTS `task_statuses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#6B7280',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_statuses_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `taxes`
--

DROP TABLE IF EXISTS `taxes`;
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) NOT NULL,
  `type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_created_by_foreign` (`created_by`),
  KEY `taxes_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'company',
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `plan_expire_date` date DEFAULT NULL,
  `requested_plan` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `plan_is_active` int NOT NULL DEFAULT '1',
  `storage_limit` float NOT NULL DEFAULT '0',
  `is_enable_login` int NOT NULL DEFAULT '1',
  `google2fa_enable` int NOT NULL DEFAULT '0',
  `google2fa_secret` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_trial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_day` int NOT NULL DEFAULT '0',
  `trial_expire_date` date DEFAULT NULL,
  `active_module` text COLLATE utf8mb4_unicode_ci,
  `referral_code` int NOT NULL DEFAULT '0',
  `used_referral_code` int NOT NULL DEFAULT '0',
  `commission_amount` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `lang`, `avatar`, `type`, `plan_id`, `plan_expire_date`, `requested_plan`, `created_by`, `mode`, `plan_is_active`, `storage_limit`, `is_enable_login`, `google2fa_enable`, `google2fa_secret`, `status`, `is_trial`, `trial_day`, `trial_expire_date`, `active_module`, `referral_code`, `used_referral_code`, `commission_amount`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@example.com', '2025-12-20 17:47:06', '$2y$12$3T1eKajOxyU9GzLbLhkUauNKOKhJlpIIq8RSixNHlB8ptmEBy/qzC', NULL, 'pt-BR', 'avatars/gQq9OdNYFERN4Qq4piky96yYQwnsanJvhWjFUSgU.png', 'superadmin', NULL, NULL, 0, 0, 'light', 1, 0, 1, 0, NULL, 'active', NULL, 0, NULL, NULL, 0, 0, 0, '2025-12-20 17:47:06', '2025-12-20 18:21:28'),
(2, 'Company', 'company@example.com', '2025-12-20 17:47:06', '$2y$12$Yu151Iyu3TKsTdRjhT6/Te6K27IoO2rcFEgQ2SvUUFvss.6GPoQaO', NULL, 'pt-BR', NULL, 'company', 1, NULL, 0, 0, 'light', 1, 0, 1, 0, NULL, 'active', NULL, 0, NULL, NULL, 842390, 0, 0, '2025-12-20 17:47:07', '2025-12-20 18:26:39'),
(3, 'Marjorie Hermann', 'marjorie.hermann.2@example.com', '2025-12-20 17:47:08', '$2y$12$15TVDS.EiFHtpaUX7aS8H.2J8TmY7EKSPCNCGM0N5y52F2XG/lpkq', NULL, 'es', NULL, 'staff', NULL, NULL, 0, 2, 'light', 1, 0, 1, 0, NULL, 'active', NULL, 0, NULL, NULL, 0, 0, 0, '2025-10-12 14:26:53', '2025-12-20 17:47:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_email_templates`
--

DROP TABLE IF EXISTS `user_email_templates`;
CREATE TABLE IF NOT EXISTS `user_email_templates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email_templates_template_id_foreign` (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `user_email_templates`
--

INSERT INTO `user_email_templates` (`id`, `template_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(2, 2, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(3, 3, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(4, 4, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(5, 5, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(6, 6, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(7, 7, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(8, 8, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(9, 9, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08'),
(10, 10, 1, 1, '2025-12-20 17:47:08', '2025-12-20 17:47:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_notification_templates`
--

DROP TABLE IF EXISTS `user_notification_templates`;
CREATE TABLE IF NOT EXISTS `user_notification_templates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_notification_templates_user_id_template_id_unique` (`user_id`,`template_id`),
  KEY `user_notification_templates_template_id_foreign` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
CREATE TABLE IF NOT EXISTS `webhooks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `module` enum('New User','Lead Assigned','Case Created','Meeting Invitation','Opportunity Created','Quote Created','Task Assigned') COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` enum('GET','POST') COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhooks_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
