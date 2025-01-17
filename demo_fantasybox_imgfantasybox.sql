-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2023 at 04:05 AM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Beatmysquad`
--

-- --------------------------------------------------------

--
-- Table structure for table `aadharcard`
--

CREATE TABLE `aadharcard` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `aadhar_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `aadhar_number` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `aadhar_dob` date NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `imageback` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `aadharcard`
--

INSERT INTO `aadharcard` (`id`, `userid`, `aadhar_name`, `aadhar_number`, `aadhar_dob`, `image`, `imageback`, `status`, `comment`, `created_at`, `updated_at`) VALUES
(1, 9, 'Thanki Harshadkumar Ramesh', '884200314815', '1991-12-24', 'users/aadharcard/front/FRONT88420031481591698328943.png', 'users/aadharcard/back/BACK88420031481591698328943.png', 1, NULL, '2023-10-26 14:02:23', '2023-10-26 14:04:02'),
(2, 11, 'Joshi Milan bhai', '243975062679', '1987-02-15', 'users/aadharcard/front/FRONT243975062679111698337057.png', 'users/aadharcard/back/BACK243975062679111698337057.png', 1, NULL, '2023-10-26 16:17:37', '2023-10-26 16:20:23'),
(3, 12, 'Rohit lalwani', '519692276799', '2005-10-12', 'users/aadharcard/front/FRONT519692276799121698404255.png', 'users/aadharcard/back/BACK519692276799121698404255.png', 1, NULL, '2023-10-27 10:57:35', '2023-10-27 10:58:04'),
(4, 10, 'Thank Rameshkumar Bhagvanji', '867584604766', '1961-07-11', 'users/aadharcard/front/FRONT867584604766101698415929.png', 'users/aadharcard/back/BACK867584604766101698415929.png', 1, NULL, '2023-10-27 14:12:09', '2023-10-27 14:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `adminwallets`
--

CREATE TABLE `adminwallets` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `amount` double DEFAULT '0',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `moneytype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminwallets`
--

INSERT INTO `adminwallets` (`id`, `userid`, `amount`, `type`, `description`, `moneytype`, `created_at`, `updated_at`) VALUES
(1, 11, 500, 'add_fund', 'Play', 'addmoney', '2023-10-26 16:43:04', '2023-10-26 16:43:04'),
(2, 9, 5000, 'add_fund', 'Owner', 'addmoney', '2023-10-26 16:45:11', '2023-10-26 16:45:11'),
(3, 11, 400, 'add_fund', 'xyz', 'deductmoney', '2023-10-26 17:04:01', '2023-10-26 17:04:01'),
(4, 11, 100000, 'add_fund', 'ramo moj karo', 'addmoney', '2023-10-26 17:04:44', '2023-10-26 17:04:44'),
(5, 11, 99100, 'add_fund', 'Debited', 'deductmoney', '2023-10-26 17:29:29', '2023-10-26 17:29:29'),
(6, 8, 200, 'add_fund', 'Developer', 'addmoney', '2023-10-27 10:54:43', '2023-10-27 10:54:43'),
(7, 10, 1000, 'add_fund', 'xyz', 'addmoney', '2023-10-27 14:19:29', '2023-10-27 14:19:29'),
(8, 9, 1000, 'add_fund', 'xyz', 'addmoney', '2023-10-27 14:19:50', '2023-10-27 14:19:50'),
(9, 9, 1000, 'add_fund', 'xyz', 'addmoney', '2023-10-27 14:21:33', '2023-10-27 14:21:33'),
(10, 13, 1000, 'add_fund', 'xyz', 'addmoney', '2023-10-27 14:25:38', '2023-10-27 14:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `accountholder` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accno` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ifsc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bankname` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `userid`, `accountholder`, `accno`, `ifsc`, `bankname`, `status`, `image`, `comment`, `created_at`, `updated_at`) VALUES
(1, 9, 'Harshadkumar Ramesh Thanki', '3767001500003499', 'PUNB0376700', 'PUNJAB NATI', 1, 'users/bank/376700150000349991698329423.png', NULL, '2023-10-26 14:10:23', '2023-10-26 14:10:40'),
(2, 11, 'Milan Narsibhai Joshi', '18100100007718', 'BARB0GOSAXX', 'BOB', 1, 'users/bank/18100100007718111698337508.png', NULL, '2023-10-26 16:25:08', '2023-10-26 16:25:32'),
(3, 10, 'RAMESHKUMAR BHAGVANJI Thanki', '30009929994', 'SBIN0000456', 'SBI', 1, 'users/bank/30009929994101698416207.png', NULL, '2023-10-27 14:16:47', '2023-10-27 14:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int NOT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `type`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'banner/cpQcLpR5zBdTiwc0gZ7TZ43uunYrfHpTAhJEFHft.png', '2023-10-26 15:09:31', '2023-10-26 15:09:31'),
(2, NULL, NULL, 'banner/wifqmn6E0uIlYg1HtWPFcU7BvT3vS6fG0TZdgxnZ.png', '2023-10-26 17:19:38', '2023-10-26 17:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `id` int UNSIGNED NOT NULL,
  `fantasy_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `mega_status` int NOT NULL DEFAULT '0',
  `entryfee` double NOT NULL,
  `offerentryfee` int NOT NULL DEFAULT '0',
  `win_amount` double NOT NULL DEFAULT '0',
  `win_amount_2` double DEFAULT '0',
  `winning_percentage` int NOT NULL DEFAULT '0',
  `maximum_user` int NOT NULL DEFAULT '0',
  `minimum_user` int NOT NULL DEFAULT '0',
  `contest_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_entry` int NOT NULL DEFAULT '0',
  `team_limit` int DEFAULT '1',
  `confirmed_challenge` int NOT NULL DEFAULT '0',
  `is_bonus` int NOT NULL DEFAULT '0',
  `is_running` int NOT NULL DEFAULT '0',
  `type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `contest_cat` int NOT NULL,
  `bonus_percentage` double NOT NULL DEFAULT '0',
  `pricecard_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `freez` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`id`, `fantasy_type`, `mega_status`, `entryfee`, `offerentryfee`, `win_amount`, `win_amount_2`, `winning_percentage`, `maximum_user`, `minimum_user`, `contest_type`, `c_type`, `multi_entry`, `team_limit`, `confirmed_challenge`, `is_bonus`, `is_running`, `type`, `contest_cat`, `bonus_percentage`, `pricecard_type`, `freez`, `created_at`, `updated_at`) VALUES
(1, '1', 0, 49, 0, 20000, 0, 0, 500, 0, 'Amount', NULL, 1, 11, 1, 0, 0, 'global', 1, 0, 'Percentage', 0, '2023-10-26 14:18:34', '2023-10-26 14:19:06'),
(2, '1', 0, 100, 0, 150, 0, 0, 2, 0, 'Amount', NULL, 0, 1, 1, 0, 1, 'global', 2, 0, 'Amount', 0, '2023-10-26 14:23:01', '2023-10-26 14:23:01'),
(3, '1', 0, 50, 0, 100, 0, 0, 3, 0, 'Amount', NULL, 0, 1, 1, 0, 1, 'global', 3, 0, 'Amount', 0, '2023-10-26 14:24:05', '2023-10-26 14:24:05'),
(4, '1', 0, 500, 0, 2000, 0, 0, 5, 0, 'Amount', NULL, 0, 1, 1, 0, 1, 'global', 4, 0, 'Percentage', 0, '2023-10-26 14:34:45', '2023-10-27 13:19:13'),
(5, '1', 0, 20, 0, 30, 0, 0, 2, 0, 'Amount', NULL, 0, 1, 0, 0, 1, 'global', 2, 0, 'Percentage', 0, '2023-10-26 16:37:59', '2023-10-26 18:15:34'),
(6, '1', 0, 500, 0, 1400, 0, 0, 3, 0, 'Amount', NULL, 0, 1, 0, 0, 1, 'global', 3, 0, 'Percentage', 0, '2023-10-27 11:19:00', '2023-10-27 11:19:00'),
(7, '1', 0, 1000, 0, 4500, 0, 0, 5, 0, 'Amount', NULL, 0, 1, 0, 0, 1, 'global', 4, 0, 'Percentage', 0, '2023-10-27 11:25:20', '2023-10-27 11:25:20'),
(8, '1', 0, 500, 0, 900, 0, 0, 2, 0, 'Amount', NULL, 0, 1, 0, 0, 1, 'global', 2, 0, 'Percentage', 0, '2023-10-27 11:31:42', '2023-10-27 11:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `contest_category`
--

CREATE TABLE `contest_category` (
  `id` int NOT NULL,
  `fantasy_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tbl_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contest_category`
--

INSERT INTO `contest_category` (`id`, `fantasy_type`, `name`, `sub_title`, `image`, `tbl_order`, `created_at`, `updated_at`) VALUES
(1, '1', 'Grand League', 'Mega', 'category/L3nDPNzhqQVg5n5h9PuJmKDuP8Jxqys2TVo2Uihf.png', 0, '2023-10-26 14:14:28', '2023-10-26 14:14:28'),
(2, '1', 'Head To Head', 'Winner takes all', 'category/VL3xzCKg1gioJPyMMlhFpXbiz9A4TGXPnsUKkXZh.png', 0, '2023-10-26 14:16:06', '2023-10-26 14:16:06'),
(3, '1', 'Champion', 'Winner takes all', 'category/mr9S1wCsENdkBwop2PqPnw4lE8r1mnRCoUCEg2og.png', 0, '2023-10-26 14:17:52', '2023-10-26 14:17:52'),
(4, '1', 'High Investor', 'Win Big!', 'category/0ztWqu5gejB2PBmAQi9ivTonqEilMgsi8iGC5BtX.png', 0, '2023-10-26 14:32:27', '2023-10-26 14:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `devicetoken`
--

CREATE TABLE `devicetoken` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `device_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devicetoken`
--

INSERT INTO `devicetoken` (`id`, `userid`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 8, 'd8Gpc7MoSmuB38xF44Gcbp:APA91bEv963PGUswriB1695MWMo5oqXivzSMcqeXEsNf-A9NAF8bAOtwjl3u8GKepkBxSYeZJlJiLsdpJIQ4nlASvcu-gfoZwOuAeaCDrR_Yd5WtIllmo5IyUdnrVkYOAXFEqK_KnyLW', '2023-10-26 12:47:07', '2023-10-26 12:47:07'),
(2, 9, 'ekge0iMdT_iH_R9jQjpJlV:APA91bGo_TqF810pmPsCqV1LP6dIdpk-10Z0ssSJQo_3K0tFhZ7gK59NoJEUiMStx89ApFcvFuI3crLRKxR0aq1skOD0wcDRhaOZVFRiRwdWRUyF8wgXXQdVfyoE7avgDsdRn6cjxTcq', '2023-10-26 13:59:40', '2023-10-26 13:59:40'),
(3, 10, 'fiViSVZfRMmgAwkiz_66hb:APA91bHc6NlBOoHAv5z3TrAi2iefaqsZpMh-luK5xUXY1uVGYeJYwG3lmHmBRWbq2K7Zrd_mRHVehpajbn4qIRwM6JsFSkyj-V9KpBTW8QpJxNhtLfGRm3oHihMLutxVVm6prLX7LSxi', '2023-10-26 16:04:59', '2023-10-26 16:04:59'),
(4, 11, 'eWRuWJRGROOUPNKl5vzIqr:APA91bHuRygaYNrtRqMu1LQfNbNjVG0GHUBL9sazPeoAKRJLvqtSzL0GrPbtyY6PmQgOiS9HrQjrWQjXiFVPb3bpcF7DRsUE6A3GXFnN0crvkM4H8Sx2no-SNsfRr1drQ9qsg4kBSsfF', '2023-10-26 16:06:25', '2023-10-26 16:06:25'),
(5, 11, 'eWRuWJRGROOUPNKl5vzIqr:APA91bHuRygaYNrtRqMu1LQfNbNjVG0GHUBL9sazPeoAKRJLvqtSzL0GrPbtyY6PmQgOiS9HrQjrWQjXiFVPb3bpcF7DRsUE6A3GXFnN0crvkM4H8Sx2no-SNsfRr1drQ9qsg4kBSsfF', '2023-10-26 16:57:49', '2023-10-26 16:57:49'),
(6, 8, 'fADMloi8TVaitLHCgj05C7:APA91bHd2YnyNinIhKKYCMNCa3dG8YoOxsfoBbVYzkBdoM46jKT6q0WbITEgic4Fy1ukPxBQSY5yoZpMXq2pc_FQhN1PbMwVZqEXhQA6bh3N3EmaalH4UIY9syq8_J6acdM94h1k4v-n', '2023-10-27 10:15:24', '2023-10-27 10:15:24'),
(7, 12, 'esYTegQ1TfqCRM13gS0XMW:APA91bGQNb2AWCD1AsMGVfONVDrW-2BGkm7QGUrQduRLo5p5u6fUNOirgadCSS10KpgjM9kbdsR8fV2SLjfn6e-j0aDeoNiUQSW0N1xwnLi1c0Et6JjSOIyjGmFJoSL1VznZao1ccWot', '2023-10-27 10:26:29', '2023-10-27 10:26:29'),
(8, 13, 'eX-U1Th7QfCr7aJ7XnQxlR:APA91bFk64u4ueXucxGD2mssg3eLNBx9soQwafuu13yyI71yk8bh_hLr2IvVwR16VysQpdCzodY-NiqNZe9wZAL7EQo5K3hMh8CYkn7DPi5ebqhnawbvPjd1Y6sSJAjhVkJzwTlfclbY', '2023-10-27 11:13:28', '2023-10-27 11:13:28'),
(9, 10, 'c9ZM9s0BQTS_Bne7HYIj2-:APA91bH4Tyi7Ebc9E5BtHbbDoEm_BlRXrtW3FBxcmdI8lrtx-LxvOvIU61qZoodppdzEHltM2HOjm9u9R4cUntGcPT9c_7R8QMXQtwNIojkdTbOBCrgX2ChL4YX1Kmh8J357_aHYQa3p', '2023-10-27 14:07:34', '2023-10-27 14:07:34'),
(10, 13, 'dgUbExpRTHyJyXKOdvN0kR:APA91bE01s8enc7uBVE2hqCFRuUD7NNKQIr-IYTVVw68QKwPfVyvF4DGC1dsLoA6MVagUAvBIIlHfirK8RXswhMV0Bjs_O5Df9u8LY_RVqaTkRoARa-nX-tgEtXBbq7iZjA5QClWxvBT', '2023-10-27 14:24:05', '2023-10-27 14:24:05'),
(11, 9, 'dgUbExpRTHyJyXKOdvN0kR:APA91bE01s8enc7uBVE2hqCFRuUD7NNKQIr-IYTVVw68QKwPfVyvF4DGC1dsLoA6MVagUAvBIIlHfirK8RXswhMV0Bjs_O5Df9u8LY_RVqaTkRoARa-nX-tgEtXBbq7iZjA5QClWxvBT', '2023-10-27 14:40:52', '2023-10-27 14:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fantasy`
--

CREATE TABLE `fantasy` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fantasy`
--

INSERT INTO `fantasy` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cricket', 'Cricket.png', 1, '2023-08-17 03:37:12', '2023-10-05 04:50:37'),
(2, 'Football', 'Football.png', 0, '2023-08-17 03:37:24', '2023-10-25 12:07:08'),
(3, 'Basketball', 'Basketball.png', 0, '2023-08-17 03:37:33', '2023-10-25 12:07:05'),
(4, 'Kabaddi', 'Kabaddi.png', 0, '2023-08-17 03:37:44', '2023-10-05 04:50:54'),
(5, 'Stock', 'Stock.png', 0, '2023-08-17 03:37:53', '2023-10-05 04:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `finalresults`
--

CREATE TABLE `finalresults` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `points` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `matchkey` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `challengeid` int NOT NULL,
  `transaction_id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `joinedid` int NOT NULL,
  `seriesid` int NOT NULL,
  `rank` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finalresults`
--

INSERT INTO `finalresults` (`id`, `userid`, `points`, `amount`, `matchkey`, `challengeid`, `transaction_id`, `joinedid`, `seriesid`, `rank`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, '413', 150, '46', 33, 'WIN-964963313', 13, 5, 1, 1, '2023-10-27 17:18:18', '2023-10-27 17:18:18'),
(2, 10, '413', 0, '46', 39, 'WIN-938283914', 14, 5, 1, 1, '2023-10-27 17:18:19', '2023-10-27 17:18:19'),
(3, 10, '578', 150, '47', 43, 'WIN-221054319', 19, 4, 1, 1, '2023-10-28 02:12:53', '2023-10-28 02:12:53'),
(4, 9, '1068.5', 150, '54', 52, 'WIN-887375221', 21, 12, 1, 1, '2023-10-28 16:47:14', '2023-10-28 16:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `generaltabs`
--

CREATE TABLE `generaltabs` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generaltabs`
--

INSERT INTO `generaltabs` (`id`, `type`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'signup_bonus', 'Signup Bonus', '0', '2021-12-13 09:54:39', '2023-10-26 12:50:58'),
(2, 'refer_bonus', 'Refer Bonus', '0', '2021-12-13 09:54:56', '2023-10-26 12:51:02'),
(3, 'pan_bonus', 'Pan Bonus', '0', '2021-12-30 04:12:57', '2023-10-26 12:51:05'),
(4, 'bank_bonus', 'Bank Bonus', '0', '2021-12-30 04:13:05', '2023-10-26 12:51:09'),
(5, 'email_bonus', 'Email Bonus', '0', '2021-12-30 04:13:15', '2023-10-26 12:51:14'),
(6, 'mobile_bonus', 'Mobile Bonus', '0', '2021-12-30 04:13:21', '2023-10-26 12:51:19'),
(8, 'aadhar_bonus', 'Aadhar Bonus', '0', '2023-09-04 07:11:09', '2023-10-26 12:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `influencer_bonus`
--

CREATE TABLE `influencer_bonus` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `fromid` int NOT NULL,
  `joinid` int NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matchkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `challengeid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txnid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joinedleauges`
--

CREATE TABLE `joinedleauges` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `challengeid` int NOT NULL,
  `teamid` int NOT NULL,
  `matchkey` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fantasy_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `refercode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seriesid` int NOT NULL DEFAULT '0',
  `teamnumbercount` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `joinedleauges`
--

INSERT INTO `joinedleauges` (`id`, `userid`, `challengeid`, `teamid`, `matchkey`, `fantasy_type`, `refercode`, `transaction_id`, `seriesid`, `teamnumbercount`, `created_at`, `updated_at`) VALUES
(1, 11, 2, 1, '5', '1', 'BMS5ARK1', 'BMS-JL-2-169833862932-11', 0, 0, '2023-10-26 16:43:49', '2023-10-26 16:43:49'),
(2, 9, 2, 2, '5', '1', 'BMSOIBM2', 'BMS-JL-2-169833881519-9', 0, 0, '2023-10-26 16:46:55', '2023-10-26 16:46:55'),
(3, 11, 7, 1, '5', '1', 'BMSWEJS3', 'BMS-JL-7-169834030831-11', 0, 0, '2023-10-26 17:11:48', '2023-10-26 17:11:48'),
(4, 9, 7, 2, '5', '1', 'BMSS1UZ4', 'BMS-JL-7-169834032115-9', 0, 0, '2023-10-26 17:12:01', '2023-10-26 17:12:01'),
(5, 11, 13, 3, '29', '1', 'BMSQ9X15', 'BMS-JL-13-169839483595-11', 0, 0, '2023-10-27 08:20:35', '2023-10-27 08:20:35'),
(6, 11, 13, 4, '29', '1', 'BMSA9346', 'BMS-JL-13-169839491116-11', 0, 0, '2023-10-27 08:21:51', '2023-10-27 08:21:51'),
(7, 11, 13, 5, '29', '1', 'BMS23GG7', 'BMS-JL-13-169839504555-11', 0, 0, '2023-10-27 08:24:05', '2023-10-27 08:24:05'),
(8, 11, 13, 6, '29', '1', 'BMS3ERD8', 'BMS-JL-13-169839511781-11', 0, 0, '2023-10-27 08:25:17', '2023-10-27 08:25:17'),
(9, 11, 13, 7, '29', '1', 'BMSLQC79', 'BMS-JL-13-169839517888-11', 0, 0, '2023-10-27 08:26:18', '2023-10-27 08:26:18'),
(10, 9, 22, 8, '45', '1', 'BMSK6MF10', 'BMS-JL-22-169840208596-9', 0, 0, '2023-10-27 10:21:25', '2023-10-27 10:21:25'),
(11, 12, 12, 10, '77', '1', 'BMSVYPU11', 'BMS-JL-12-169840434124-12', 0, 0, '2023-10-27 10:59:01', '2023-10-27 10:59:01'),
(12, 11, 22, 11, '45', '1', 'BMS9JP612', 'BMS-JL-22-169841088512-11', 0, 0, '2023-10-27 12:48:05', '2023-10-27 12:48:05'),
(13, 10, 33, 13, '46', '1', 'BMS8I5H13', 'BMS-JL-33-169841696189-10', 0, 0, '2023-10-27 14:29:21', '2023-10-27 14:29:21'),
(14, 10, 39, 13, '46', '1', 'BMSPMCZ14', 'BMS-JL-39-169841697862-10', 0, 0, '2023-10-27 14:29:38', '2023-10-27 14:29:38'),
(15, 9, 33, 14, '46', '1', 'BMSPHMC15', 'BMS-JL-33-169841773876-9', 0, 0, '2023-10-27 14:42:18', '2023-10-27 14:42:18'),
(16, 9, 39, 14, '46', '1', 'BMSHGXS16', 'BMS-JL-39-169841774673-9', 0, 0, '2023-10-27 14:42:26', '2023-10-27 14:42:26'),
(17, 9, 43, 15, '47', '1', 'BMSY0LP17', 'BMS-JL-43-169841913463-9', 0, 0, '2023-10-27 15:05:34', '2023-10-27 15:05:34'),
(18, 9, 49, 15, '47', '1', 'BMS4PBL18', 'BMS-JL-49-169841914318-9', 0, 0, '2023-10-27 15:05:43', '2023-10-27 15:05:43'),
(19, 10, 43, 16, '47', '1', 'BMSNVJV19', 'BMS-JL-43-169841964839-10', 0, 0, '2023-10-27 15:14:08', '2023-10-27 15:14:08'),
(20, 10, 52, 17, '54', '1', 'BMS4DR520', 'BMS-JL-52-169845966835-10', 0, 0, '2023-10-28 02:21:08', '2023-10-28 02:21:08'),
(21, 9, 52, 18, '54', '1', 'BMSGWSG21', 'BMS-JL-52-169845972948-9', 0, 0, '2023-10-28 02:22:09', '2023-10-28 02:22:09'),
(22, 9, 61, 19, '104', '1', 'BMSHKJY22', 'BMS-JL-61-169863874268-9', 0, 0, '2023-10-30 04:05:42', '2023-10-30 04:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `jointeam`
--

CREATE TABLE `jointeam` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `matchkey` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamnumber` int NOT NULL,
  `players` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vicecaptain` int NOT NULL,
  `captain` int NOT NULL,
  `points` double NOT NULL DEFAULT '0',
  `lastpoints` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jointeam`
--

INSERT INTO `jointeam` (`id`, `userid`, `matchkey`, `teamnumber`, `players`, `vicecaptain`, `captain`, `points`, `lastpoints`, `created_at`, `updated_at`) VALUES
(1, 11, '5', 1, '28,20,21,22,25,27,10,1,11,12,16', 22, 28, 0, 0, '2023-10-26 16:43:44', '2023-10-26 16:43:44'),
(2, 9, '5', 1, '28,20,21,25,27,30,10,2,1,11,16', 16, 28, 0, 0, '2023-10-26 16:46:50', '2023-10-26 16:46:50'),
(3, 11, '29', 1, '92,85,86,87,94,67,79,78,72,71,69', 67, 85, 493.5, 492.5, '2023-10-27 08:20:33', '2023-10-27 13:24:02'),
(4, 11, '29', 2, '87,88,90,91,94,95,96,67,80,75,74', 91, 88, 474, 464, '2023-10-27 08:21:49', '2023-10-27 13:26:03'),
(5, 11, '29', 3, '92,85,91,96,98,79,76,75,73,71,69', 96, 92, 531, 464, '2023-10-27 08:24:02', '2023-10-27 13:26:03'),
(6, 11, '29', 4, '86,90,94,98,79,78,76,75,73,72,71', 73, 71, 298, 464, '2023-10-27 08:25:15', '2023-10-27 13:26:03'),
(7, 11, '29', 5, '92,85,87,88,90,91,95,79,78,76,75', 79, 78, 474, 469, '2023-10-27 08:26:16', '2023-10-27 13:26:04'),
(8, 9, '45', 1, '127,119,120,121,122,118,129,130,103,104,105', 103, 105, 97, 64, '2023-10-27 10:21:22', '2023-10-27 14:50:02'),
(9, 8, '77', 1, '52,59,58,56,55,54,53,50,49,48,46', 54, 59, 0, 0, '2023-10-27 10:53:48', '2023-10-27 10:54:59'),
(10, 12, '77', 1, '64,63,62,58,56,54,53,37,46,43,38', 54, 56, 0, 0, '2023-10-27 10:55:32', '2023-10-27 10:55:32'),
(11, 11, '45', 1, '120,123,125,126,128,129,132,104,105,115,116', 104, 126, 220.5, 171, '2023-10-27 12:48:03', '2023-10-27 14:50:02'),
(12, 13, '46', 1, '165,156,158,159,160,155,168,137,140,150,153', 137, 165, 374.5, 366.5, '2023-10-27 14:26:53', '2023-10-27 17:10:05'),
(13, 10, '46', 1, '156,159,161,162,163,168,170,137,140,150,153', 163, 170, 413, 405, '2023-10-27 14:29:17', '2023-10-27 17:10:05'),
(14, 9, '46', 1, '165,156,158,159,160,155,168,140,143,150,153', 143, 165, 407.5, 399.5, '2023-10-27 14:42:16', '2023-10-27 17:10:05'),
(15, 9, '47', 1, '206,198,201,202,203,208,210,211,183,174,192', 198, 210, 341, 316, '2023-10-27 15:05:31', '2023-10-27 19:38:03'),
(16, 10, '47', 1, '206,201,202,203,205,208,210,179,192,193,194', 206, 208, 578, 570, '2023-10-27 15:14:06', '2023-10-27 19:52:04'),
(17, 10, '54', 1, '231,245,241,239,237,234,232,230,228,221,218', 237, 239, 893, 887, '2023-10-28 02:21:04', '2023-10-28 12:58:02'),
(18, 9, '54', 1, '231,245,241,239,238,216,228,227,223,220,218', 223, 241, 1068.5, 1062.5, '2023-10-28 02:22:02', '2023-10-28 12:58:02'),
(19, 9, '104', 1, '273,265,267,270,264,274,276,277,256,248,258', 273, 267, 0, 0, '2023-10-30 04:05:38', '2023-10-30 04:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `leaugestransactions`
--

CREATE TABLE `leaugestransactions` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `matchkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `challengeid` int NOT NULL,
  `joinid` int NOT NULL,
  `bonus` double NOT NULL DEFAULT '0',
  `winning` double NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaugestransactions`
--

INSERT INTO `leaugestransactions` (`id`, `user_id`, `matchkey`, `challengeid`, `joinid`, `bonus`, `winning`, `balance`, `created_at`, `updated_at`) VALUES
(1, 11, '5', 2, 1, 0, 0, 100, '2023-10-26 16:43:49', '2023-10-26 16:43:49'),
(2, 9, '5', 2, 2, 0, 0, 100, '2023-10-26 16:46:55', '2023-10-26 16:46:55'),
(3, 11, '5', 7, 3, 0, 0, 100, '2023-10-26 17:11:48', '2023-10-26 17:11:48'),
(4, 9, '5', 7, 4, 0, 0, 100, '2023-10-26 17:12:01', '2023-10-26 17:12:01'),
(5, 11, '29', 13, 5, 0, 0, 49, '2023-10-27 08:20:35', '2023-10-27 08:20:35'),
(6, 11, '29', 13, 6, 0, 0, 49, '2023-10-27 08:21:51', '2023-10-27 08:21:51'),
(7, 11, '29', 13, 7, 0, 0, 49, '2023-10-27 08:24:05', '2023-10-27 08:24:05'),
(8, 11, '29', 13, 8, 0, 0, 49, '2023-10-27 08:25:17', '2023-10-27 08:25:17'),
(9, 11, '29', 13, 9, 0, 0, 49, '2023-10-27 08:26:18', '2023-10-27 08:26:18'),
(10, 9, '45', 22, 10, 0, 0, 100, '2023-10-27 10:21:25', '2023-10-27 10:21:25'),
(11, 12, '77', 12, 11, 0, 0, 20, '2023-10-27 10:59:01', '2023-10-27 10:59:01'),
(12, 11, '45', 22, 12, 0, 0, 100, '2023-10-27 12:48:05', '2023-10-27 12:48:05'),
(13, 10, '46', 33, 13, 0, 0, 100, '2023-10-27 14:29:21', '2023-10-27 14:29:21'),
(14, 10, '46', 39, 14, 0, 0, 500, '2023-10-27 14:29:38', '2023-10-27 14:29:38'),
(15, 9, '46', 33, 15, 0, 0, 100, '2023-10-27 14:42:18', '2023-10-27 14:42:18'),
(16, 9, '46', 39, 16, 0, 0, 500, '2023-10-27 14:42:26', '2023-10-27 14:42:26'),
(17, 9, '47', 43, 17, 0, 0, 100, '2023-10-27 15:05:34', '2023-10-27 15:05:34'),
(18, 9, '47', 49, 18, 0, 0, 500, '2023-10-27 15:05:43', '2023-10-27 15:05:43'),
(19, 10, '47', 43, 19, 0, 0, 100, '2023-10-27 15:14:08', '2023-10-27 15:14:08'),
(20, 10, '54', 52, 20, 0, 0, 100, '2023-10-28 02:21:08', '2023-10-28 02:21:08'),
(21, 9, '54', 52, 21, 0, 0, 100, '2023-10-28 02:22:09', '2023-10-28 02:22:09'),
(22, 9, '104', 61, 22, 0, 0, 100, '2023-10-30 04:05:42', '2023-10-30 04:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `listmatches`
--

CREATE TABLE `listmatches` (
  `id` int UNSIGNED NOT NULL,
  `fantasy_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cricket',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team1` int NOT NULL,
  `team2` int NOT NULL,
  `matchkey` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `real_matchkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `second_inning_status` int DEFAULT '0',
  `series` int DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `launch_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tbl_order` int DEFAULT '0',
  `match_notification` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `playing11_status` int NOT NULL DEFAULT '0',
  `status_overview` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `squadstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tosswinner_team` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toss_decision` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdfstatus` int DEFAULT '0',
  `pointsstatus` int NOT NULL DEFAULT '0',
  `report_status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `format` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaderboard_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listmatches`
--

INSERT INTO `listmatches` (`id`, `fantasy_type`, `type`, `name`, `team1`, `team2`, `matchkey`, `real_matchkey`, `second_inning_status`, `series`, `start_date`, `status`, `launch_status`, `final_status`, `tbl_order`, `match_notification`, `playing11_status`, `status_overview`, `squadstatus`, `tosswinner_team`, `toss_decision`, `pdfstatus`, `pointsstatus`, `report_status`, `created_at`, `updated_at`, `format`, `leaderboard_status`) VALUES
(1, '1', 'cricket', 'Sir Oliver Split vs Zagreb Warriors', 1, 2, '1', '70677', 0, 1, '2023-10-26 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(2, '1', 'cricket', 'Karwan CC vs Fly Emirates ', 3, 4, '2', '70711', 0, 2, '2023-10-26 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(3, '1', 'cricket', 'Renegades K vs Blue Squadrons', 5, 6, '3', '70414', 0, 3, '2023-10-26 22:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(4, '1', 'cricket', 'Gems Education CC vs Alif Pharma', 7, 8, '4', '70736', 0, 4, '2023-10-26 22:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(5, '1', 'cricket', 'Mid-East Metals Vs DCC Starlets', 9, 10, '5', '70712', 0, 2, '2023-10-26 22:45:00', 'notstarted', 'launched', 'IsCanceled', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 17:14:10', 't20', '0'),
(6, '1', 'cricket', 'Seazen Challengers vs GAT', 11, 12, '6', '70742', 0, 5, '2023-10-26 23:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(7, '1', 'cricket', 'MG Warriors vs Gujarat Cricket Club', 13, 14, '7', '70743', 0, 5, '2023-10-27 01:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(8, '1', 'cricket', 'Al Hajery vs Kuwait Swedish', 15, 16, '8', '70738', 0, 6, '2023-10-27 08:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(9, '1', 'cricket', 'Arunachal Pradesh vs Punjab', 17, 18, '9', '70235', 0, 7, '2023-10-27 09:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(10, '1', 'cricket', 'Himachal Pradesh vs Sikkim', 19, 20, '10', '70236', 0, 7, '2023-10-27 09:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(11, '1', 'cricket', 'Mizoram vs Mumbai', 21, 22, '11', '70237', 0, 7, '2023-10-27 09:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(12, '1', 'cricket', 'Pakistan Under-19s vs Sri Lanka Under-19s', 23, 24, '12', '70608', 0, 8, '2023-10-27 10:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 'one-day', '0'),
(13, '1', 'cricket', 'CECC-A vs Stack CC', 25, 26, '13', '70739', 0, 6, '2023-10-27 10:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(14, '1', 'cricket', 'Nepal vs United Arab Emirates', 27, 28, '14', '70755', 0, 9, '2023-10-27 10:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(15, '1', 'cricket', 'Assam vs Kerala', 29, 30, '15', '70238', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(16, '1', 'cricket', 'Goa vs Saurashtra', 31, 32, '16', '70239', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(17, '1', 'cricket', 'Haryana vs Hyderabad (India)', 33, 34, '17', '70240', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(18, '1', 'cricket', 'Madhya Pradesh vs Uttar Pradesh', 35, 36, '18', '70241', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(19, '1', 'cricket', 'Maharashtra vs Rajasthan', 37, 38, '19', '70242', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(20, '1', 'cricket', 'Nagaland vs Tamil Nadu', 39, 40, '20', '70243', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(21, '1', 'cricket', 'Puducherry vs Uttarakhand', 41, 42, '21', '70244', 0, 7, '2023-10-27 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(22, '1', 'cricket', 'Adelaide Strikers Women vs Hobart Hurricanes Women', 43, 44, '22', '65509', 0, 10, '2023-10-27 11:10:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(23, '1', 'cricket', 'Saipem vs NCM Investments', 45, 46, '23', '70740', 0, 6, '2023-10-27 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(24, '1', 'cricket', 'Mount Meru Queens vs Kilimanjaro Queens', 47, 48, '24', '70493', 0, 11, '2023-10-27 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(25, '1', 'cricket', 'Zagreb Sokol vs Sir Oliver Split', 49, 1, '25', '70678', 0, 1, '2023-10-27 12:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(26, '1', 'cricket', 'Bihar vs Services', 50, 51, '26', '70245', 0, 7, '2023-10-27 13:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(27, '1', 'cricket', 'Chhattisgarh vs Jammu & Kashmir', 52, 53, '27', '70246', 0, 7, '2023-10-27 13:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(28, '1', 'cricket', 'Gujarat vs Manipur', 54, 55, '28', '70247', 0, 7, '2023-10-27 13:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(29, '1', 'cricket', 'Pakistan Vs South Africa', 56, 57, '29', '64480', 0, 12, '2023-10-27 14:00:00', 'started', 'launched', 'IsCanceled', 0, NULL, 1, 'Play Ongoing', 'yes', '0', '0', 0, 0, 0, '2023-10-26 12:43:56', '2023-10-27 13:26:09', 'one-day', '0'),
(30, '1', 'cricket', 'Zagreb Sokol vs Zagreb chiefs', 49, 58, '30', '70679', 0, 1, '2023-10-27 14:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(31, '1', 'cricket', 'Brisbane Heat Women vs Melbourne Stars Women', 59, 60, '31', '65510', 0, 10, '2023-10-27 14:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(32, '1', 'cricket', 'Bangladesh Women vs Pakistan Women', 61, 62, '32', '70726', 0, 13, '2023-10-27 16:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(33, '1', 'cricket', 'Zagreb chiefs vs Sir Oliver Split', 58, 1, '33', '70680', 0, 1, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(34, '1', 'cricket', 'Almulla Exchange CC vs Tally Riders', 63, 64, '34', '70741', 0, 6, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't10', '0'),
(35, '1', 'cricket', 'Andhra vs Railways', 65, 66, '35', '70248', 0, 7, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(36, '1', 'cricket', 'Baroda vs Meghalaya', 67, 68, '36', '70249', 0, 7, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(37, '1', 'cricket', 'Chandigarh vs Odisha', 69, 70, '37', '70250', 0, 7, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(38, '1', 'cricket', 'Jharkhand vs Vidarbha', 71, 72, '38', '70251', 0, 7, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(39, '1', 'cricket', 'Karnataka vs Tripura', 73, 74, '39', '70252', 0, 7, '2023-10-27 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(40, '1', 'cricket', 'Chui Challengers vs Royal Rhinos', 75, 76, '40', '70640', 0, 14, '2023-10-27 16:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(41, '1', 'cricket', 'Namibia vs Zimbabwe', 77, 78, '41', '70663', 0, 15, '2023-10-27 17:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56', 't20', '0'),
(42, '1', 'cricket', 'TBA vs TBA', 79, 79, '42', '70415', 0, 3, '2023-10-27 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(43, '1', 'cricket', 'Zagreb chiefs vs Zagreb Assassins', 58, 80, '43', '70681', 0, 1, '2023-10-27 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(44, '1', 'cricket', 'Seven Districts vs Solarwinds', 81, 82, '44', '70713', 0, 2, '2023-10-27 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(45, '1', 'cricket', 'Emirates Blues Vs Fujairah', 83, 84, '45', '70751', 0, 16, '2023-10-27 19:00:00', 'started', 'launched', 'IsCanceled', 0, NULL, 1, 'Play Ongoing', 'yes', '0', '0', 0, 0, 0, '2023-10-26 12:43:57', '2023-10-27 14:52:36', 't20', '0'),
(46, '1', 'cricket', 'MG Warriors Vs Seazen Challengers', 11, 13, '46', '70764', 0, 5, '2023-10-27 20:30:00', 'completed', 'launched', 'winnerdeclared', 0, NULL, 1, 'Default', 'yes', '0', '0', 0, 0, 0, '2023-10-26 12:43:57', '2023-10-27 17:18:19', 't10', '0'),
(47, '1', 'cricket', 'Z Games Strikers Vs CSS Group', 85, 86, '47', '70737', 0, 4, '2023-10-27 22:15:00', 'completed', 'launched', 'winnerdeclared', 0, NULL, 1, 'Default', 'yes', '0', '0', 0, 0, 0, '2023-10-26 12:43:57', '2023-10-28 02:12:54', 't20', '0'),
(48, '1', 'cricket', 'Suncorp vs Valley Boyz', 87, 88, '48', '70717', 0, 2, '2023-10-27 22:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(49, '1', 'cricket', 'Dubai vs Ajman', 89, 90, '49', '70752', 0, 16, '2023-10-27 23:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(50, '1', 'cricket', 'ANZ Embassy CC vs Bangladesh Embassy CC', 91, 92, '50', '70756', 0, 17, '2023-10-28 06:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(51, '1', 'cricket', 'Melbourne Renegades Women vs Sydney Sixers Women', 93, 94, '51', '65511', 0, 10, '2023-10-28 06:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(52, '1', 'cricket', 'Japan Embassy CC vs Pakistan Embassy CC', 95, 96, '52', '70757', 0, 17, '2023-10-28 07:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(53, '1', 'cricket', 'ANZ Embassy CC vs Great Britian Embassy CC', 91, 97, '53', '70758', 0, 17, '2023-10-28 09:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(54, '1', 'cricket', 'Australia Vs New Zealand', 98, 99, '54', '64481', 0, 12, '2023-10-28 10:30:00', 'completed', 'launched', 'winnerdeclared', 0, 'New Zealand elected to bowl', 1, 'Default', 'yes', '7', '2', 0, 0, 0, '2023-10-26 12:43:57', '2023-10-28 16:47:15', 'one-day', '0'),
(55, '1', 'cricket', 'Japan Embassy CC vs India Embassy CC', 95, 100, '55', '70759', 0, 17, '2023-10-28 11:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(56, '1', 'cricket', 'Buffalo Blaster vs Royal Rhinos', 101, 76, '56', '70641', 0, 14, '2023-10-28 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(57, '1', 'cricket', 'Zagreb Sokol vs Zagreb Warriors', 49, 2, '57', '70682', 0, 1, '2023-10-28 12:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(58, '1', 'cricket', 'Netherlands VS Bangladesh', 102, 103, '58', '64482', 0, 12, '2023-10-28 14:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 'one-day', '0'),
(59, '1', 'cricket', 'Zagreb Sokol vs Zagreb Warriors', 49, 2, '59', '70683', 0, 1, '2023-10-28 14:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(60, '1', 'cricket', 'Twiga Titans vs Chui Challengers', 104, 75, '60', '70642', 0, 14, '2023-10-28 16:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(61, '1', 'cricket', 'Zagreb Warriors vs Ljubljana', 2, 105, '61', '70684', 0, 1, '2023-10-28 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(62, '1', 'cricket', 'Karwan CC vs Seven Districts Juniors', 3, 106, '62', '70749', 0, 4, '2023-10-28 18:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(63, '1', 'cricket', 'Zagreb Assassins vs Ljubljana', 80, 105, '63', '70685', 0, 1, '2023-10-28 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(64, '1', 'cricket', 'Alif Pharma vs HSBC', 8, 107, '64', '70718', 0, 2, '2023-10-28 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(65, '1', 'cricket', 'Sharjah vs Abu Dhabi', 108, 109, '65', '70753', 0, 16, '2023-10-28 19:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(66, '1', 'cricket', 'The Vision Shipping vs SA Sports Club', 110, 111, '66', '70750', 0, 4, '2023-10-28 22:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(67, '1', 'cricket', 'Dubai Dare Devils vs Dubai Wanderers', 112, 113, '67', '70719', 0, 2, '2023-10-28 22:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(68, '1', 'cricket', 'Ajman vs Fujairah', 90, 84, '68', '70754', 0, 16, '2023-10-28 23:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(69, '1', 'cricket', 'Al Hajery vs Tally Riders', 15, 64, '69', '70765', 0, 6, '2023-10-28 22:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-27 14:02:45', 't10', '0'),
(70, '1', 'cricket', 'CECC-A vs Kuwait Swedish', 25, 16, '70', '70766', 0, 6, '2023-10-29 00:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-27 14:02:45', 't10', '0'),
(71, '1', 'cricket', 'Melbourne Stars Women vs Perth Scorchers Women', 60, 114, '71', '65512', 0, 10, '2023-10-29 09:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(72, '1', 'cricket', 'Pakistan Under-19s vs Sri Lanka Under-19s', 23, 24, '72', '70609', 0, 8, '2023-10-29 10:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-27 14:02:45', 'one-day', '0'),
(73, '1', 'cricket', 'Kilimanjaro Queens vs Usambara Queens', 48, 115, '73', '70494', 0, 11, '2023-10-29 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(74, '1', 'cricket', 'Mighty Lions vs Royal Rhinos', 116, 76, '74', '70779', 0, 18, '2023-10-29 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(75, '1', 'cricket', 'Sir Oliver Split vs Ljubljana', 1, 105, '75', '70686', 0, 1, '2023-10-29 13:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(76, '1', 'cricket', 'Adelaide Strikers Women vs Brisbane Heat Women', 43, 59, '76', '65513', 0, 10, '2023-10-29 13:40:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(77, '1', 'cricket', 'India vs England', 117, 118, '77', '64499', 0, 12, '2023-10-29 14:00:00', 'notstarted', 'launched', 'IsCanceled', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-27 14:02:45', 'one-day', '0'),
(78, '1', 'cricket', 'Namibia vs Zimbabwe', 77, 78, '78', '70664', 0, 15, '2023-10-29 14:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't20', '0'),
(79, '1', 'cricket', 'Fighters Buffalos vs Lighting Zebras', 119, 120, '79', '70780', 0, 18, '2023-10-29 14:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(80, '1', 'cricket', 'Sir Oliver Split vs Ljubljana', 1, 105, '80', '70687', 0, 1, '2023-10-29 15:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57', 't10', '0'),
(81, '1', 'cricket', 'Bangladesh Women vs Pakistan Women', 61, 62, '81', '70727', 0, 13, '2023-10-29 16:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-26 12:49:58', '2023-10-26 12:49:58', 't20', '0'),
(82, '1', 'cricket', 'Himachal Pradesh Women vs Kerala Women', 121, 122, '82', '70784', 0, 19, '2023-10-28 09:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(83, '1', 'cricket', 'Andhra Women vs Odisha Women', 123, 124, '83', '70794', 0, 19, '2023-10-28 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(84, '1', 'cricket', 'Bengal Women vs Karnataka Women', 125, 126, '84', '70795', 0, 19, '2023-10-28 13:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(85, '1', 'cricket', 'Baroda Women vs Mumbai Women', 127, 128, '85', '70796', 0, 19, '2023-10-28 16:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(86, '1', 'cricket', 'Simba Kings vs Royal Rhinos', 129, 76, '86', '70643', 0, 14, '2023-10-29 16:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(87, '1', 'cricket', 'Zagreb Assassins vs Zagreb Warriors', 80, 2, '87', '70688', 0, 1, '2023-10-29 17:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(88, '1', 'cricket', 'Mighty Lions vs Rocking Hippos', 116, 130, '88', '70781', 0, 18, '2023-10-29 17:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(89, '1', 'cricket', 'Gems Education CC vs Z Games Strikers', 7, 85, '89', '70785', 0, 4, '2023-10-29 18:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(90, '1', 'cricket', 'Karwan CC vs Suncorp', 3, 87, '90', '70788', 0, 2, '2023-10-29 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(91, '1', 'cricket', 'Sir Oliver Split vs Ljubljana', 1, 105, '91', '70689', 0, 1, '2023-10-29 19:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(92, '1', 'cricket', 'Seven Districts vs The Vision Shipping', 81, 110, '92', '70786', 0, 4, '2023-10-29 22:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(93, '1', 'cricket', 'Ajman Heroes vs DCC Starlets', 131, 9, '93', '70789', 0, 2, '2023-10-29 22:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(94, '1', 'cricket', 'Stack CC vs Saipem', 26, 45, '94', '70767', 0, 6, '2023-10-29 23:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(95, '1', 'cricket', 'Almulla Exchange CC vs NCM Investments', 63, 46, '95', '70768', 0, 6, '2023-10-30 01:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(96, '1', 'cricket', 'Nepal vs Singapore', 27, 132, '96', '70760', 0, 20, '2023-10-30 08:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(97, '1', 'cricket', 'United Arab Emirates vs Bahrain', 28, 133, '97', '70761', 0, 20, '2023-10-30 08:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(98, '1', 'cricket', 'Royal Rhinos vs Fighters Buffalos', 76, 119, '98', '70782', 0, 18, '2023-10-30 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(99, '1', 'cricket', 'Buffalo Blaster vs Simba Kings', 101, 129, '99', '70644', 0, 14, '2023-10-30 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(100, '1', 'cricket', 'Hobart Hurricanes Women vs Sydney Thunder Women', 44, 134, '100', '65514', 0, 10, '2023-10-30 12:40:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(101, '1', 'cricket', 'Zagreb chiefs vs Zagreb Sokol', 58, 49, '101', '70690', 0, 1, '2023-10-30 13:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(102, '1', 'cricket', 'Hong Kong vs Kuwait', 135, 136, '102', '70762', 0, 20, '2023-10-30 13:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(103, '1', 'cricket', 'Oman vs Malaysia', 137, 138, '103', '70763', 0, 20, '2023-10-30 13:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(104, '1', 'cricket', 'Sri Lanka Vs Afghanistan', 139, 140, '104', '64500', 0, 12, '2023-10-30 14:00:00', 'notstarted', 'launched', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-30 04:04:44', 'one-day', '0'),
(105, '1', 'cricket', 'Lighting Zebras vs Rocking Hippos', 120, 130, '105', '70783', 0, 18, '2023-10-30 14:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(106, '1', 'cricket', 'Zagreb chiefs vs Zagreb Sokol', 58, 49, '106', '70691', 0, 1, '2023-10-30 15:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(107, '1', 'cricket', 'Twiga Titans vs Royal Rhinos', 104, 76, '107', '70645', 0, 14, '2023-10-30 16:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(108, '1', 'cricket', 'Ljubljana vs Zagreb Warriors', 105, 2, '108', '70692', 0, 1, '2023-10-30 17:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(109, '1', 'cricket', 'Namibia vs Zimbabwe', 77, 78, '109', '70665', 0, 15, '2023-10-30 17:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(110, '1', 'cricket', 'Alif Pharma vs Mid-East Metals', 8, 10, '110', '70790', 0, 2, '2023-10-30 18:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(111, '1', 'cricket', 'Ljubljana vs Zagreb Warriors', 105, 2, '111', '70693', 0, 1, '2023-10-30 19:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(112, '1', 'cricket', 'The Vision Shipping vs Fly Emirates ', 110, 4, '112', '70791', 0, 2, '2023-10-30 22:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(113, '1', 'cricket', 'TBA vs TBA', 79, 79, '113', '70769', 0, 6, '2023-10-30 23:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't10', '0'),
(114, '1', 'cricket', 'Gems Education CC vs Alif Pharma', 7, 8, '114', '70787', 0, 4, '2023-10-30 23:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45', 't20', '0'),
(115, '1', 'cricket', 'TBA vs TBA', 79, 79, '115', '70770', 0, 6, '2023-10-31 01:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't10', '0'),
(116, '1', 'cricket', 'Singapore vs Oman', 132, 137, '116', '70771', 0, 20, '2023-10-31 08:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0'),
(117, '1', 'cricket', 'Bahrain vs Hong Kong', 133, 135, '117', '70772', 0, 20, '2023-10-31 08:45:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0'),
(118, '1', 'cricket', 'Pakistan Under-19s vs Sri Lanka Under-19s', 23, 24, '118', '70610', 0, 8, '2023-10-31 10:30:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 'one-day', '0'),
(119, '1', 'cricket', 'TBA vs TBA', 79, 79, '119', '70253', 0, 7, '2023-10-31 11:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0'),
(120, '1', 'cricket', 'Ngorongoro Queens vs Kilimanjaro Queens', 141, 48, '120', '70495', 0, 11, '2023-10-31 12:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0'),
(121, '1', 'cricket', 'Zagreb chiefs vs Zagreb Warriors', 58, 2, '121', '70694', 0, 1, '2023-10-31 13:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't10', '0'),
(122, '1', 'cricket', 'Malaysia vs Nepal', 138, 27, '122', '70773', 0, 20, '2023-10-31 13:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0'),
(123, '1', 'cricket', 'Kuwait vs United Arab Emirates', 136, 28, '123', '70774', 0, 20, '2023-10-31 13:15:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0'),
(124, '1', 'cricket', 'Pakistan vs Bangladesh', 56, 103, '124', '64501', 0, 12, '2023-10-31 14:00:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 'one-day', '0'),
(125, '1', 'cricket', 'Perth Scorchers Women vs Sydney Sixers Women', 114, 94, '125', '65515', 0, 10, '2023-10-31 14:40:00', 'notstarted', 'pending', 'pending', 0, NULL, 0, NULL, 'yes', NULL, NULL, 0, 0, 0, '2023-10-27 14:02:46', '2023-10-27 14:02:46', 't20', '0');

-- --------------------------------------------------------

--
-- Table structure for table `matchchallenges`
--

CREATE TABLE `matchchallenges` (
  `id` int UNSIGNED NOT NULL,
  `fantasy_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `matchkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_id` int DEFAULT '0',
  `entryfee` double NOT NULL,
  `offerentryfee` int NOT NULL DEFAULT '0',
  `win_amount` double NOT NULL,
  `win_amount_2` double DEFAULT '0',
  `contest_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winning_percentage` int NOT NULL DEFAULT '0',
  `maximum_user` int NOT NULL DEFAULT '0',
  `minimum_user` int DEFAULT '0',
  `confirmed_challenge` int NOT NULL DEFAULT '0',
  `is_bonus` int NOT NULL DEFAULT '0',
  `pricecard_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_running` int DEFAULT '0',
  `contest_cat` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` int DEFAULT '0',
  `bonus_percentage` int DEFAULT '0',
  `created_by` int DEFAULT '0',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price_status` int DEFAULT '0' COMMENT '0=>not_compressed,1=>compressed',
  `joinedusers` int DEFAULT '0',
  `multi_entry` int DEFAULT '0',
  `team_limit` int DEFAULT '1',
  `contest_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_created` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `refercode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matchchallenges`
--

INSERT INTO `matchchallenges` (`id`, `fantasy_type`, `matchkey`, `challenge_id`, `entryfee`, `offerentryfee`, `win_amount`, `win_amount_2`, `contest_type`, `c_type`, `winning_percentage`, `maximum_user`, `minimum_user`, `confirmed_challenge`, `is_bonus`, `pricecard_type`, `is_running`, `contest_cat`, `is_private`, `bonus_percentage`, `created_by`, `status`, `price_status`, `joinedusers`, `multi_entry`, `team_limit`, `contest_name`, `bonus_type`, `pdf_created`, `created_at`, `updated_at`, `refercode`) VALUES
(1, '1', '5', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'canceled', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-26 10:01:47', '2023-10-26 17:14:10', NULL),
(2, '1', '5', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-26 10:01:47', '2023-10-26 17:14:10', NULL),
(3, '1', '5', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:01:47', '2023-10-26 17:14:10', NULL),
(4, '1', '5', 4, 500, 0, 4000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:01:47', '2023-10-26 17:14:10', NULL),
(6, '1', '5', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:10:58', '2023-10-26 17:14:10', NULL),
(7, '1', '5', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-26 10:01:47', '2023-10-26 17:14:11', NULL),
(8, '1', '77', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'canceled', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-26 10:19:03', '2023-10-27 13:26:15', NULL),
(9, '1', '77', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:19:03', '2023-10-27 13:26:15', NULL),
(10, '1', '77', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:19:03', '2023-10-27 13:26:15', NULL),
(11, '1', '77', 4, 500, 0, 4000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:19:03', '2023-10-27 13:26:15', NULL),
(12, '1', '77', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 1, 0, 1, NULL, NULL, NULL, '2023-10-26 10:19:03', '2023-10-27 13:26:16', NULL),
(13, '1', '29', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'canceled', 0, 5, 1, 11, NULL, NULL, NULL, '2023-10-26 10:23:09', '2023-10-27 13:26:10', NULL),
(14, '1', '29', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:23:09', '2023-10-27 13:26:10', NULL),
(15, '1', '29', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:23:09', '2023-10-27 13:26:10', NULL),
(16, '1', '29', 4, 500, 0, 4000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:23:09', '2023-10-27 13:26:10', NULL),
(18, '1', '5', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 10:01:47', '2023-10-26 17:14:11', NULL),
(20, '1', '29', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-26 11:46:20', '2023-10-27 13:26:10', NULL),
(21, '1', '45', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'canceled', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-27 03:50:04', '2023-10-27 14:52:36', NULL),
(22, '1', '45', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'canceled', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-27 03:50:04', '2023-10-27 14:52:37', NULL),
(23, '1', '45', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 03:50:04', '2023-10-27 14:52:37', NULL),
(25, '1', '45', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 03:50:04', '2023-10-27 13:45:02', NULL),
(27, '1', '45', 6, 500, 0, 1400, 0, 'Amount', NULL, 0, 3, 0, 0, 0, 'Percentage', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 04:54:16', '2023-10-27 13:45:02', NULL),
(28, '1', '45', 7, 1000, 0, 4500, 0, 'Amount', NULL, 0, 5, 0, 0, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 04:56:16', '2023-10-27 13:45:02', NULL),
(29, '1', '45', 8, 500, 0, 900, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 05:02:18', '2023-10-27 13:45:02', NULL),
(31, '1', '45', 4, 500, 0, 2000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 06:52:44', '2023-10-27 14:52:37', NULL),
(32, '1', '46', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'opened', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 07:33:15', NULL),
(33, '1', '46', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'closed', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 14:42:18', NULL),
(34, '1', '46', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 07:33:15', NULL),
(35, '1', '46', 4, 500, 0, 2000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 07:33:15', NULL),
(36, '1', '46', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 15:15:02', NULL),
(37, '1', '46', 6, 500, 0, 1400, 0, 'Amount', NULL, 0, 3, 0, 0, 0, 'Percentage', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 15:15:02', NULL),
(38, '1', '46', 7, 1000, 0, 4500, 0, 'Amount', NULL, 0, 5, 0, 0, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 15:15:02', NULL),
(39, '1', '46', 8, 500, 0, 900, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'closed', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 14:42:26', NULL),
(40, '1', '46', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 14:29:21', NULL),
(41, '1', '46', 8, 500, 0, 900, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 07:33:15', '2023-10-27 15:15:02', NULL),
(42, '1', '47', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'opened', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 08:35:03', NULL),
(43, '1', '47', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'closed', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 15:14:08', NULL),
(44, '1', '47', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 08:35:03', NULL),
(45, '1', '47', 4, 500, 0, 2000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 08:35:03', NULL),
(46, '1', '47', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 17:00:02', NULL),
(47, '1', '47', 6, 500, 0, 1400, 0, 'Amount', NULL, 0, 3, 0, 0, 0, 'Percentage', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 17:00:02', NULL),
(48, '1', '47', 7, 1000, 0, 4500, 0, 'Amount', NULL, 0, 5, 0, 0, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 17:00:02', NULL),
(49, '1', '47', 8, 500, 0, 900, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 1, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 17:00:03', NULL),
(50, '1', '47', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-27 08:35:03', '2023-10-27 15:05:34', NULL),
(51, '1', '54', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'opened', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 07:50:10', NULL),
(52, '1', '54', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'closed', 0, 2, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 02:22:09', NULL),
(53, '1', '54', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 07:50:10', NULL),
(54, '1', '54', 4, 500, 0, 2000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 07:50:10', NULL),
(55, '1', '54', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 05:15:02', NULL),
(56, '1', '54', 6, 500, 0, 1400, 0, 'Amount', NULL, 0, 3, 0, 0, 0, 'Percentage', 1, '3', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 05:15:02', NULL),
(57, '1', '54', 7, 1000, 0, 4500, 0, 'Amount', NULL, 0, 5, 0, 0, 0, 'Percentage', 1, '4', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 05:15:02', NULL),
(58, '1', '54', 8, 500, 0, 900, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'canceled', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 05:15:02', NULL),
(59, '1', '54', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-28 07:50:10', '2023-10-28 02:21:08', NULL),
(60, '1', '104', 1, 49, 0, 20000, 0, 'Amount', NULL, 0, 500, 0, 1, 0, 'Percentage', 0, '1', 0, 0, 0, 'opened', 0, 0, 1, 11, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL),
(61, '1', '104', 2, 100, 0, 150, 0, 'Amount', NULL, 0, 2, 0, 1, 0, 'Amount', 1, '2', 0, 0, 0, 'opened', 0, 1, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 04:05:42', NULL),
(62, '1', '104', 3, 50, 0, 100, 0, 'Amount', NULL, 0, 3, 0, 1, 0, 'Amount', 1, '3', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL),
(63, '1', '104', 4, 500, 0, 2000, 0, 'Amount', NULL, 0, 5, 0, 1, 0, 'Percentage', 1, '4', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL),
(64, '1', '104', 5, 20, 0, 30, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL),
(65, '1', '104', 6, 500, 0, 1400, 0, 'Amount', NULL, 0, 3, 0, 0, 0, 'Percentage', 1, '3', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL),
(66, '1', '104', 7, 1000, 0, 4500, 0, 'Amount', NULL, 0, 5, 0, 0, 0, 'Percentage', 1, '4', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL),
(67, '1', '104', 8, 500, 0, 900, 0, 'Amount', NULL, 0, 2, 0, 0, 0, 'Percentage', 1, '2', 0, 0, 0, 'opened', 0, 0, 0, 1, NULL, NULL, NULL, '2023-10-30 09:34:54', '2023-10-30 09:34:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matchplayers`
--

CREATE TABLE `matchplayers` (
  `id` int UNSIGNED NOT NULL,
  `matchkey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `playerid` int NOT NULL,
  `points` double DEFAULT '0',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `battingstyle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bowlingstyle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playingstatus` int NOT NULL DEFAULT '-1',
  `playingtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vplaying` int NOT NULL DEFAULT '0',
  `selection_per` double NOT NULL DEFAULT '0',
  `captainselected` double NOT NULL DEFAULT '0',
  `vcaptainselected` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matchplayers`
--

INSERT INTO `matchplayers` (`id`, `matchkey`, `playerid`, `points`, `role`, `credit`, `name`, `battingstyle`, `bowlingstyle`, `playingstatus`, `playingtime`, `vplaying`, `selection_per`, `captainselected`, `vcaptainselected`, `created_at`, `updated_at`) VALUES
(1, '5', 1, 0, 'keeper', '6.5', 'Vansh Kumar', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(2, '5', 2, 0, 'batsman', '7', 'Raizal Nadir', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(3, '5', 3, 0, 'batsman', '8', 'Shaurya Singh', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(4, '5', 4, 0, 'batsman', '7.5', 'Rameez Shahzad', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(5, '5', 5, 0, 'batsman', '8', 'Aaraash Raheja', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(6, '5', 6, 0, 'batsman', '6.5', 'Shival Bawa', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(7, '5', 7, 0, 'allrounder', '6', 'Syed Musaib', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(8, '5', 8, 0, 'allrounder', '6', 'Mohammad Aniq', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(9, '5', 9, 0, 'allrounder', '8.5', 'Angad Nehru', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(10, '5', 10, 0, 'bowler', '8.5', 'Shane Saldanha', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(11, '5', 11, 0, 'bowler', '6.5', 'Soorya Sathish', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(12, '5', 12, 0, 'bowler', '6', 'Hriday Savnani', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(13, '5', 13, 0, 'bowler', '9.5', 'Rishabh Mukherjee', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(14, '5', 14, 0, 'batsman', '6.5', 'Ayaan Misbah', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(15, '5', 15, 0, 'bowler', '7', 'Aahil Nagarwala', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(16, '5', 16, 0, 'keeper', '8.5', 'Ateeq Ur Rehman', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(17, '5', 17, 0, 'keeper', '6', 'Omar Hayat-I', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(18, '5', 18, 0, 'keeper', '6.5', 'Farhan babar', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(19, '5', 19, 0, 'batsman', '6.5', 'Haroon Altaf', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(20, '5', 20, 0, 'batsman', '8', 'Zar Muhmmad', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(21, '5', 21, 0, 'batsman', '7', 'Rizwan Khan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(22, '5', 22, 0, 'batsman', '7', 'Awais Noor', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(23, '5', 23, 0, 'batsman', '8.5', 'Faizan Awan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(24, '5', 24, 0, 'batsman', '6', 'Shakeel Butt', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(25, '5', 25, 0, 'allrounder', '6.5', 'Rashid Mohd Habibullah', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(26, '5', 26, 0, 'batsman', '6.5', 'Mannal Siddiqui', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(27, '5', 27, 0, 'allrounder', '9', 'Ali Anwaar', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(28, '5', 28, 0, 'allrounder', '6.5', 'Nouman Khan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(29, '5', 29, 0, 'allrounder', '9', 'Tehran Khan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(30, '5', 30, 0, 'bowler', '6.5', 'Mohammad Imran', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(31, '5', 31, 0, 'bowler', '7.5', 'Khurram Khawaja', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(32, '5', 32, 0, 'bowler', '7.5', 'Mustafa Ayub', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(33, '5', 33, 0, 'bowler', '7.5', 'Hazrat Bilal', 'Right Hand Bat', 'Right Arm Medium Fast', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(34, '5', 34, 0, 'bowler', '8', 'Basit Ali-I', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(35, '5', 35, 0, 'bowler', '7.5', 'Muhammad Qaiser', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(36, '5', 36, 0, 'allrounder', '6', 'Muhammad Asif', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:30:55', '2023-10-26 16:32:03'),
(37, '77', 37, 0, 'keeper', '7', 'Ishan Kishan', 'Left hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(38, '77', 38, 0, 'keeper', '8.5', 'KL Rahul', 'Right Hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(39, '77', 39, 0, 'batsman', '9', 'Rohit Sharma', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(40, '77', 40, 0, 'batsman', '8.5', 'Shubman Gill', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(41, '77', 41, 0, 'batsman', '9', 'Virat Kohli', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(42, '77', 42, 0, 'batsman', '8', 'Shreyas Iyer', 'Right Hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(43, '77', 43, 0, 'batsman', '6.5', 'Suryakumar Yadav', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(44, '77', 44, 0, 'allrounder', '8.5', 'Hardik Pandya', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(45, '77', 45, 0, 'allrounder', '8', 'Ravindra Jadeja', 'Left hand Bat', 'Left Arm Orthodox', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(46, '77', 46, 0, 'allrounder', '7', 'Ravichandran Ashwin', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(47, '77', 47, 0, 'bowler', '7', 'Shardul Thakur', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(48, '77', 48, 0, 'bowler', '9', 'Jasprit Bumrah', 'Right Hand Bat', 'Right Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(49, '77', 49, 0, 'bowler', '9', 'Mohammed Siraj', 'Right Hand Bat', 'Right Arm Fast', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(50, '77', 50, 0, 'bowler', '8', 'Kuldeep Yadav', 'Left hand Bat', 'Left Arm Wrist Spin', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(51, '77', 51, 0, 'bowler', '8', 'Mohammed Shami', 'Right Hand Bat', 'Right Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(52, '77', 52, 0, 'keeper', '8', 'Jonny Bairstow', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(53, '77', 53, 0, 'keeper', '8.5', 'Jos Buttler', 'Right Hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(54, '77', 54, 0, 'batsman', '6.5', 'Harry Brook', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(55, '77', 55, 0, 'batsman', '8', 'Dawid Malan', 'Left hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(56, '77', 56, 0, 'batsman', '8.5', 'Joe Root', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(57, '77', 57, 0, 'batsman', '9', 'Ben Stokes', 'Left hand Bat', 'Right Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(58, '77', 58, 0, 'allrounder', '7', 'Liam Livingstone', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(59, '77', 59, 0, 'allrounder', '7.5', 'Moeen Ali', 'Left hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(60, '77', 60, 0, 'allrounder', '6.5', 'Sam Curran', 'Left hand Bat', 'Left Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(61, '77', 61, 0, 'bowler', '7.5', 'Chris Woakes', 'Right Hand Bat', 'Right Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(62, '77', 62, 0, 'bowler', '5.5', 'Gus Atkinson', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(63, '77', 63, 0, 'bowler', '7.5', 'Adil Rashid', 'Right Hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(64, '77', 64, 0, 'bowler', '8', 'Mark Wood', 'Right Hand Bat', 'Right Arm Fast', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(65, '77', 65, 0, 'bowler', '7', 'David Willey', 'Left hand Bat', 'Left Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(66, '77', 66, 0, 'bowler', '8.5', 'Brydon Carse', 'Right Hand Bat', 'Right Arm Fast', -1, NULL, 0, 0, 0, 0, '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(67, '29', 67, 43, 'keeper', '9', 'Mohammad Rizwan', 'Right Hand Bat', '', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 09:41:02'),
(68, '29', 68, 0, 'keeper', '6', 'Mohammad Haris', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(69, '29', 69, 64, 'batsman', '9', 'Babar Azam', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 10:31:02'),
(70, '29', 70, 0, 'batsman', '7.5', 'Fakhar Zaman', 'Left hand Bat', 'Left Arm Orthodox', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(71, '29', 71, 14, 'batsman', '8', 'Abdullah Shafique', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 08:48:02'),
(72, '29', 72, 28, 'allrounder', '7', 'Iftikhar Ahmed', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 10:20:02'),
(73, '29', 73, 18, 'batsman', '8', 'Imam ul Haq', 'Left hand Bat', '', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 09:02:02'),
(74, '29', 74, 69, 'batsman', '7', 'Saud Shakeel', 'Left hand Bat', 'Left Arm Orthodox', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 11:44:03'),
(75, '29', 75, 56, 'allrounder', '8', 'Shadab Khan', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 11:37:03'),
(76, '29', 76, 35, 'allrounder', '7', 'Mohammad Nawaz', 'Left hand Bat', 'Left Arm Orthodox', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 12:07:03'),
(77, '29', 77, 0, 'allrounder', '6', 'Agha Salman', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(78, '29', 78, 31, 'bowler', '9', 'Shaheen Afridi', 'Left hand Bat', 'Left Arm Fast', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 13:06:03'),
(79, '29', 79, 4, 'bowler', '8.5', 'Haris Rauf', 'Right Hand Bat', 'Right Arm Fast', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 08:30:04'),
(80, '29', 80, 21, 'bowler', '6.5', 'Mohammad Wasim', 'Right Hand Bat', 'Right Arm Fast Medium', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 13:06:03'),
(81, '29', 81, 0, 'bowler', '6.5', 'Usama Mir', 'Right Hand Bat', 'Right Arm Leg Spin', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(82, '29', 82, 0, 'bowler', '7.5', 'Hasan Ali', 'Right Hand Bat', 'Right Arm Medium Fast', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(83, '29', 83, 0, 'bowler', '6', 'Zaman Khan', 'Right Hand Bat', 'Right Arm Fast', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(84, '29', 84, 0, 'bowler', '5.5', 'Abrar Ahmed', 'Right Hand Bat', 'Right Arm Leg Spin', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(85, '29', 85, 69, 'keeper', '9', 'Quinton de Kock', 'Left hand Bat', '', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 13:02:03'),
(86, '29', 86, 20, 'keeper', '9', 'Heinrich Klaasen', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 10:25:02'),
(87, '29', 87, 10, 'batsman', '8.5', 'Rassie van der Dussen', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 13:24:02'),
(88, '29', 88, 29, 'batsman', '8', 'Temba Bavuma', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 13:26:03'),
(89, '29', 89, 0, 'batsman', '6.5', 'Reeza Hendricks', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(90, '29', 90, 12, 'batsman', '7.5', 'David Miller', 'Left hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 12:11:03'),
(91, '29', 91, 4, 'allrounder', '9', 'Aiden Markram', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 08:30:04'),
(92, '29', 92, 83, 'allrounder', '9', 'Marco Jansen', 'Right Hand Bat', 'Left Arm Medium Fast', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 12:11:03'),
(93, '29', 93, 0, 'allrounder', '6.5', 'Andile Phehlukwayo', 'Left hand Bat', 'Right Arm Medium Fast', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(94, '29', 94, 37, 'bowler', '7.5', 'Lungi Ngidi', 'Right Hand Bat', 'Right Arm Fast Medium', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 12:18:02'),
(95, '29', 95, 108, 'bowler', '7.5', 'Tabraiz Shamsi', 'Right Hand Bat', 'Left Arm Wrist Spin', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 12:04:02'),
(96, '29', 96, 54, 'bowler', '7', 'Gerald Coetzee', 'Right Hand Bat', 'Right Arm Fast', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 11:39:03'),
(97, '29', 97, 0, 'bowler', '9', 'Kagiso Rabada', 'Left hand Bat', 'Right Arm Fast', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(98, '29', 98, 20, 'bowler', '7', 'Keshav Maharaj', 'Right Hand Bat', 'Left Arm Orthodox', 1, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 12:04:02'),
(99, '29', 99, 0, 'bowler', '6', 'Lizaad Williams', 'Left hand Bat', 'Right Arm Medium Fast', 0, NULL, 0, 0, 0, 0, '2023-10-26 16:52:39', '2023-10-27 07:35:05'),
(100, '45', 100, 39, 'batsman', '7.5', 'Fahad Nawaz', 'Right Hand Bat', 'Left Arm Orthodox', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:35:03'),
(101, '45', 101, 0, 'keeper', '7.5', 'Syed Haider Wasi Shah', 'Right Hand Bat', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(102, '45', 102, 0, 'batsman', '8', 'Deepak Raj', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(103, '45', 103, 4, 'batsman', '6.5', 'Rayan Khan', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(104, '45', 104, 37, 'batsman', '6.5', 'Madhav Manoj', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:50:02'),
(105, '45', 105, 4, 'batsman', '6', 'Lovepreet Singh Bajwa', 'Right Hand Bat', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(106, '45', 106, 0, 'batsman', '6.5', 'Yasir Khan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(107, '45', 107, 24, 'batsman', '8', 'Yash Sabnani', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:11:03'),
(108, '45', 108, 0, 'allrounder', '8', 'Zawar Farid', 'Right Hand Bat', 'Right Arm Medium', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(109, '45', 109, 4, 'allrounder', '7', 'Karan Dhiman', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(110, '45', 110, 0, 'allrounder', '6', 'Muhammad Zuhaib-Zubair', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(111, '45', 111, 76, 'allrounder', '8.5', 'Adithya Shetty', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:38:04'),
(112, '45', 112, 4, 'batsman', '8', 'CP Rizwan', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(113, '45', 113, 4, 'allrounder', '8.5', 'Junaid Shamsuddin', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(114, '45', 114, 0, 'bowler', '6.5', 'Abdullah Ismail', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(115, '45', 115, 35, 'bowler', '6', 'Hazrat Bilal', 'Right Hand Bat', 'Right Arm Medium Fast', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:15:03'),
(116, '45', 116, 35, 'bowler', '7.5', 'Mohammad Ayaz', 'Left hand Bat', 'Left Arm Medium Fast', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:49:03'),
(117, '45', 117, 0, 'bowler', '7', 'Riyaz Khaliq', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(118, '45', 118, 0, 'bowler', '6.5', 'Monish Gajeswaran', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(119, '45', 119, 0, 'keeper', '8', 'Sana Ul Haq Bhatti', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(120, '45', 120, 31, 'keeper', '7.5', 'Ashwant Valthapa', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:45:03'),
(121, '45', 121, 0, 'batsman', '6.5', 'Hameedullah Azizullah Khan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(122, '45', 122, 0, 'batsman', '8', 'Nikhil Srinivasan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(123, '45', 123, 5, 'batsman', '7', 'Ahaan Fernandes', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:28:03'),
(124, '45', 124, 0, 'batsman', '7.5', 'Muhammad Shahdad-I', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(125, '45', 125, 14, 'batsman', '6', 'Aaryan Madani', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:43:02'),
(126, '45', 126, 8, 'allrounder', '8', 'Ammar Badami', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:36:02'),
(127, '45', 127, 0, 'allrounder', '8', 'Samal Udawaththa', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(128, '45', 128, 10, 'allrounder', '6.5', 'Raunak Anil Vaswani', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 14:46:03'),
(129, '45', 129, 11, 'bowler', '8', 'Mohammad Umer Doger', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:49:03'),
(130, '45', 130, 4, 'bowler', '7', 'Sailles Jaishankar', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(131, '45', 131, 0, 'allrounder', '7', 'Muhammad Irfan-II', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(132, '45', 132, 4, 'allrounder', '8', 'Vikum Bandara Sanjaya', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(133, '45', 133, 0, 'bowler', '7.5', 'Hafiz Almas', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 12:35:03'),
(134, '45', 134, 4, 'bowler', '7', 'Muhammad Asif-Jr', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(135, '45', 135, 4, 'bowler', '6', 'Neel Hegde', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 10:19:53', '2023-10-27 13:30:03'),
(136, '46', 136, 72, 'keeper', '8', 'Hashim Mohammed', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 17:10:05'),
(137, '46', 137, 15, 'batsman', '7.5', 'Shafir Ali', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:23:03'),
(138, '46', 138, 0, 'batsman', '8', 'Siju Mathew', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(139, '46', 139, 6, 'batsman', '8.5', 'Irfan Kaleel', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:14:03'),
(140, '46', 140, 102, 'allrounder', '9', 'Mohammed Hisham', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 17:10:05'),
(141, '46', 141, 13, 'allrounder', '9', 'Nichel Prakash', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:50:04'),
(142, '46', 142, 173, 'allrounder', '8.5', 'Anoop Oravanakundil', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 17:08:04'),
(143, '46', 143, 37, 'batsman', '7.5', 'Abhijith Asokan', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:38:03'),
(144, '46', 144, 0, 'bowler', '5.5', 'Joby Jose', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(145, '46', 145, 0, 'batsman', '6', 'Murali Krishnan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(146, '46', 146, 4, 'keeper', '6.5', 'Ashok Nithin', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:00:03'),
(147, '46', 147, 0, 'batsman', '6.5', 'Shiju Jose', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(148, '46', 148, 0, 'batsman', '6', 'Amal Thankachan', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(149, '46', 149, 20, 'batsman', '7', 'Hari Krishnan Nair', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:59:04'),
(150, '46', 150, 27, 'bowler', '7.5', 'Rahul Rajan', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:39:04'),
(151, '46', 151, 0, 'bowler', '6.5', 'Mohammed Aflal', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(152, '46', 152, 0, 'bowler', '8', 'Robin Plathanath', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(153, '46', 153, 4, 'bowler', '7', 'Jinesh Ponniyath', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:00:03'),
(154, '46', 154, 0, 'bowler', '5.5', 'Midhun Thekkekara', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(155, '46', 155, 25, 'keeper', '7', 'Abid Mushtaq', 'Right Hand Bat', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:41:02'),
(156, '46', 156, 4, 'keeper', '7', 'Tanveer Hussain', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:00:03'),
(157, '46', 157, 0, 'batsman', '6.5', 'Asim Gull', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(158, '46', 158, 32, 'batsman', '8', 'Farhan Meer', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:58:04'),
(159, '46', 159, 25, 'batsman', '7', 'Yasir Idrees Butt', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 17:05:03'),
(160, '46', 160, 31, 'allrounder', '8.5', 'Adith Kumara Bolanda', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:35:03'),
(161, '46', 161, 0, 'batsman', '6', 'Faisal Nawaz', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(162, '46', 162, 72, 'batsman', '9', 'Khalid Butt', 'Right Hand Bat', 'Right Arm Medium Fast', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:11:02'),
(163, '46', 163, 0, 'allrounder', '6', 'Zaheer Anjum Dar', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(164, '46', 164, 0, 'allrounder', '6.5', 'Saifullah Rafiq', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(165, '46', 165, 16, 'allrounder', '7.5', 'Hisham Mirza', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 15:57:04'),
(166, '46', 166, 10, 'allrounder', '8', 'Mohammad-Ahsan', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 17:05:03'),
(167, '46', 167, 0, 'bowler', '5.5', 'Sami Ur Rehman', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(168, '46', 168, 70, 'bowler', '7', 'Tahir Abbas', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:35:03'),
(169, '46', 169, 107, 'bowler', '8', 'Sibtain Raza Shah', 'Left hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:50:04'),
(170, '46', 170, 47, 'allrounder', '7.5', 'Raheel Khan', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 16:29:04'),
(171, '46', 171, 0, 'bowler', '6.5', 'Mahmoud Abdullah', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(172, '46', 172, 0, 'bowler', '6.5', 'Ansar Ali Rehmat', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(173, '46', 173, 0, 'bowler', '6', 'Nadim Akram', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 14:02:55', '2023-10-27 14:05:04'),
(174, '47', 174, 6, 'keeper', '7', 'Bilal Cheema', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:21:02'),
(175, '47', 175, 0, 'keeper', '7.5', 'Safeer Tariq', 'Right Hand Bat', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(176, '47', 176, 0, 'batsman', '8.5', 'Shahrukh Amin', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(177, '47', 177, 0, 'batsman', '6', 'Rameez Shahzad', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(178, '47', 178, 0, 'batsman', '7', 'Ahaan Fernandes', 'Right Hand Bat', 'Right Arm Medium', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(179, '47', 179, 27, 'batsman', '7', 'Sardar Bahzad', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 18:54:05'),
(180, '47', 180, 0, 'batsman', '6.5', 'Zainullah', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(181, '47', 181, 0, 'batsman', '6', 'Lovepreet Singh Bajwa', 'Right Hand Bat', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(182, '47', 182, 0, 'batsman', '5.5', 'Ahmer Arif', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(183, '47', 183, 38, 'batsman', '6.5', 'Hameedullah Azizullah Khan', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 18:24:02'),
(184, '47', 184, 91, 'allrounder', '6.5', 'Babar Agha Hussain', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:02:03'),
(185, '47', 185, 0, 'allrounder', '9', 'Ronak Panoly', 'Right Hand Bat', 'Left Arm Medium', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(186, '47', 186, 0, 'allrounder', '7', 'Nadir Hussain', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(187, '47', 187, 13, 'allrounder', '6.5', 'Muhammad Aizaz', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:49:03'),
(188, '47', 188, 38, 'allrounder', '6', 'Abdullah Saleem', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 18:35:03'),
(189, '47', 189, 0, 'bowler', '6', 'Nilansh Keswani', 'Left hand Bat', 'Left Arm Orthodox', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(190, '47', 190, 0, 'allrounder', '5', 'Ayaman Ahmed', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(191, '47', 191, 69, 'allrounder', '7.5', 'Muhammad Azhar', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:48:03'),
(192, '47', 192, 8, 'bowler', '8.5', 'Mubeen Ali', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 17:44:03'),
(193, '47', 193, 37, 'bowler', '8', 'Faisal Altaf', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:35:03'),
(194, '47', 194, 155, 'bowler', '7.5', 'Danish Qureshi', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:11:03'),
(195, '47', 195, 0, 'bowler', '7', 'Muhammed Ismail', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(196, '47', 196, 0, 'bowler', '7', 'Aryaman Sharma', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(197, '47', 197, 0, 'bowler', '6.5', 'Taimoor Bhatti', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(198, '47', 198, 12, 'bowler', '5.5', 'Irfan Khattak', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 17:11:04'),
(199, '47', 199, 0, 'keeper', '7', 'Aquib Fazal', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(200, '47', 200, 0, 'keeper', '4.5', 'Mohammed Hafeef', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(201, '47', 201, 2, 'batsman', '6.5', 'Vishnu Raj', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 17:17:03'),
(202, '47', 202, 34, 'keeper', '7.5', 'Danish Sarhadi', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:29:03'),
(203, '47', 203, 26, 'batsman', '9', 'Abhiram Hrithwik', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:17:03'),
(204, '47', 204, 9, 'batsman', '7.5', 'Albin Alias', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 17:06:04'),
(205, '47', 205, 15, 'batsman', '7', 'Kalliparambil Rojith', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:52:04'),
(206, '47', 206, 84, 'allrounder', '8.5', 'Renjith Mani', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:02:03'),
(207, '47', 207, 0, 'allrounder', '5.5', 'Ranjith Haridas', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(208, '47', 208, 68, 'allrounder', '5', 'Aquib Khan', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:32:03'),
(209, '47', 209, 0, 'bowler', '6', 'Mohammed Sheraz', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(210, '47', 210, 12, 'allrounder', '9', 'Zohaib-Khan', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 16:50:04'),
(211, '47', 211, 33, 'bowler', '6.5', 'Ahmed Farzeen', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:38:03'),
(212, '47', 212, 72, 'allrounder', '7', 'PV Vimalnadh', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:38:03'),
(213, '47', 213, 0, 'bowler', '7.5', 'Gihan Chathuranga', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(214, '47', 214, 42, 'bowler', '7', 'Nipun Babu', '', '', 1, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 19:15:03'),
(215, '47', 215, 0, 'bowler', '6.5', 'Krishna Kala', '', '', 0, NULL, 0, 0, 0, 0, '2023-10-27 15:04:50', '2023-10-27 15:50:05'),
(216, '54', 216, 58, 'keeper', '7.5', 'Josh Inglis', 'Right Hand Bat', '', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:58:02'),
(217, '54', 217, 0, 'keeper', '9', 'Alex Carey', 'Left hand Bat', '', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(218, '54', 218, 110, 'batsman', '9', 'David Warner', 'Left hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 06:20:04'),
(219, '54', 219, 24, 'batsman', '8.5', 'Steven Smith', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 06:56:03'),
(220, '54', 220, 151, 'batsman', '9', 'Travis Head', 'Left hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 06:36:04'),
(221, '54', 221, 46, 'batsman', '9', 'Marnus Labuschagne', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:58:02'),
(222, '54', 222, 42, 'allrounder', '9', 'Mitchell Marsh', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 07:30:03'),
(223, '54', 223, 93, 'allrounder', '8', 'Glenn Maxwell', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:22:03'),
(224, '54', 224, 0, 'allrounder', '7', 'Marcus Stoinis', 'Right Hand Bat', 'Right Arm Medium', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(225, '54', 225, 0, 'allrounder', '8.5', 'Cameron Green', 'Right Hand Bat', 'Right Arm Medium Fast', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(226, '54', 226, 0, 'allrounder', '6', 'Sean Abbott', 'Right Hand Bat', 'Right Arm Fast Medium', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(227, '54', 227, 77, 'bowler', '8', 'Adam Zampa', 'Right Hand Bat', 'Right Arm Leg Spin', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:22:03'),
(228, '54', 228, 27, 'bowler', '9', 'Mitchell Starc', 'Left hand Bat', 'Left Arm Fast', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 11:11:03'),
(229, '54', 229, 101, 'bowler', '8', 'Pat Cummins', 'Right Hand Bat', 'Right Arm Fast', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:37:05'),
(230, '54', 230, 68, 'bowler', '8.5', 'Josh Hazlewood', 'Left hand Bat', 'Right Arm Fast Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:37:05'),
(231, '54', 231, 38, 'keeper', '9', 'Devon Conway', 'Left hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 09:41:02'),
(232, '54', 232, 27, 'keeper', '8.5', 'Tom Latham', 'Left hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 11:26:04'),
(233, '54', 233, 0, 'keeper', '5', 'Tom Blundell', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(234, '54', 234, 42, 'batsman', '6.5', 'Will Young', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 09:52:03'),
(235, '54', 235, 0, 'batsman', '9', 'Kane Williamson', 'Right Hand Bat', 'Right Arm Off Break', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(236, '54', 236, 0, 'batsman', '7', 'Mark Chapman', 'Left hand Bat', 'Left Arm Orthodox', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(237, '54', 237, 72, 'batsman', '8.5', 'Daryl Mitchell', 'Right Hand Bat', 'Right Arm Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 10:51:03'),
(238, '54', 238, 118, 'batsman', '7', 'Glenn Phillips', 'Right Hand Bat', 'Right Arm Off Break', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 11:50:04'),
(239, '54', 239, 157, 'allrounder', '8', 'Rachin Ravindra', 'Left hand Bat', 'Left Arm Orthodox', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:03:02'),
(240, '54', 240, 114, 'allrounder', '6.5', 'Jimmy Neesham', 'Left hand Bat', 'Right Arm Medium Fast', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:57:02'),
(241, '54', 241, 80, 'allrounder', '8', 'Mitchell Santner', 'Left hand Bat', 'Left Arm Orthodox', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:19:02'),
(242, '54', 242, 121, 'bowler', '8.5', 'Trent Boult', 'Right Hand Bat', 'Left Arm Fast Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:51:02'),
(243, '54', 243, 4, 'bowler', '7.5', 'Lockie Ferguson', 'Right Hand Bat', 'Right Arm Fast', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 05:00:04'),
(244, '54', 244, 0, 'bowler', '7', 'Ish Sodhi', 'Right Hand Bat', 'Right Arm Leg Spin', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(245, '54', 245, 33, 'bowler', '7.5', 'Matt Henry', 'Right Hand Bat', 'Right Arm Fast Medium', 1, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 12:35:04'),
(246, '54', 246, 0, 'bowler', '7.5', 'Tim Southee', 'Right Hand Bat', 'Right Arm Medium Fast', 0, NULL, 0, 0, 0, 0, '2023-10-28 02:20:00', '2023-10-28 04:05:03'),
(247, '104', 247, 0, 'keeper', '8.5', 'Rahmanullah Gurbaz', 'Right Hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(248, '104', 248, 0, 'keeper', '6.5', 'Ikram Alikhil', 'Left hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(249, '104', 249, 0, 'batsman', '7.5', 'Hashmatullah Shahidi', 'Left hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(250, '104', 250, 0, 'batsman', '8', 'Ibrahim Zadran', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(251, '104', 251, 0, 'batsman', '6', 'Riaz Hassan', 'Right Hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(252, '104', 252, 0, 'batsman', '7', 'Rahmat Shah', 'Right Hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(253, '104', 253, 0, 'batsman', '7.5', 'Najibullah Zadran', 'Left hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(254, '104', 254, 0, 'allrounder', '8', 'Mohammad Nabi', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(255, '104', 255, 0, 'allrounder', '5.5', 'Abdul Rahman', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(256, '104', 256, 0, 'allrounder', '7.5', 'Azmatullah Omarzai', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(257, '104', 257, 0, 'allrounder', '6', 'Gulbadin Naib', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(258, '104', 258, 0, 'bowler', '9', 'Rashid Khan', 'Right Hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(259, '104', 259, 0, 'bowler', '8.5', 'Mujeeb Ur Rahman', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(260, '104', 260, 0, 'bowler', '7', 'Noor Ahmad', 'Right Hand Bat', 'Left Arm Wrist Spin', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(261, '104', 261, 0, 'bowler', '8', 'Fazalhaq Farooqi', 'Right Hand Bat', 'Left Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(262, '104', 262, 0, 'bowler', '7.5', 'Naveen-ul-Haq', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(263, '104', 263, 0, 'bowler', '5.5', 'Fareed Malik', 'Left hand Bat', 'Left Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(264, '104', 264, 0, 'bowler', '5.5', 'Sharafuddin Ashraf', 'Right Hand Bat', 'Left Arm Orthodox', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(265, '104', 265, 0, 'keeper', '9', 'Kusal Mendis', 'Right Hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(266, '104', 266, 0, 'keeper', '8', 'Sadeera Samarawickrama', 'Right Hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(267, '104', 267, 0, 'batsman', '7', 'Kusal Perera', 'Left hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(268, '104', 268, 0, 'batsman', '7.5', 'Dimuth Karunaratne', 'Left hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(269, '104', 269, 0, 'batsman', '8.5', 'Pathum Nissanka', 'Right Hand Bat', '', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(270, '104', 270, 0, 'batsman', '7', 'Charith Asalanka', 'Left hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(271, '104', 271, 0, 'allrounder', '5.5', 'Dushan Hemantha', 'Right Hand Bat', 'Right Arm Leg Spin', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(272, '104', 272, 0, 'allrounder', '7.5', 'Dhananjaya de Silva', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(273, '104', 273, 0, 'allrounder', '6.5', 'Dasun Shanaka', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(274, '104', 274, 0, 'allrounder', '7', 'Dunith Wellalage', 'Left hand Bat', 'Left Arm Orthodox', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(275, '104', 275, 0, 'allrounder', '6', 'Chamika Karunaratne', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(276, '104', 276, 0, 'batsman', '7', 'Angelo Mathews', 'Right Hand Bat', 'Right Arm Medium', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(277, '104', 277, 0, 'bowler', '8', 'Kasun Rajitha', 'Right Hand Bat', 'Right Arm Medium Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(278, '104', 278, 0, 'bowler', '8.5', 'Maheesh Theekshana', 'Right Hand Bat', 'Right Arm Off Break', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(279, '104', 279, 0, 'bowler', '6', 'Lahiru Kumara', 'Left hand Bat', 'Right Arm Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(280, '104', 280, 0, 'bowler', '7.5', 'Dilshan Madushanka', 'Right Hand Bat', 'Left Arm Fast Medium', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(281, '104', 281, 0, 'bowler', '7', 'Dushmantha Chameera', 'Right Hand Bat', 'Right Arm Fast', -1, NULL, 0, 0, 0, 0, '2023-10-30 04:04:40', '2023-10-30 04:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `matchpricecards`
--

CREATE TABLE `matchpricecards` (
  `id` int NOT NULL,
  `challenge_id` int NOT NULL,
  `matchkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winners` int NOT NULL,
  `price` double DEFAULT NULL,
  `price_percent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_position` int DEFAULT NULL,
  `max_position` int DEFAULT NULL,
  `total` double NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matchpricecards`
--

INSERT INTO `matchpricecards` (`id`, `challenge_id`, `matchkey`, `winners`, `price`, `price_percent`, `min_position`, `max_position`, `total`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, '5', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(2, 1, '5', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(3, 1, '5', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(4, 1, '5', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(5, 1, '5', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(6, 1, '5', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(7, 2, '5', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(8, 3, '5', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(9, 4, '5', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(10, 4, '5', 1, 0, NULL, 1, 2, 1000, 'Percentage', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(12, 6, '5', 1, 30, NULL, 0, 1, 30, 'Amount', '2023-10-26 10:10:58', '2023-10-26 10:10:58'),
(13, 7, '5', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(14, 8, '77', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(15, 8, '77', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(16, 8, '77', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(17, 8, '77', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(18, 8, '77', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(19, 8, '77', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(20, 9, '77', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(21, 10, '77', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(22, 11, '77', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(23, 11, '77', 1, 0, NULL, 1, 2, 1000, 'Percentage', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(24, 12, '77', 1, 30, NULL, 0, 1, 30, 'Amount', '2023-10-26 10:19:03', '2023-10-26 10:19:03'),
(25, 13, '29', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(26, 13, '29', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(27, 13, '29', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(28, 13, '29', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(29, 13, '29', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(30, 13, '29', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(31, 14, '29', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(32, 15, '29', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(33, 16, '29', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(34, 16, '29', 1, 0, NULL, 1, 2, 1000, 'Percentage', '2023-10-26 10:23:09', '2023-10-26 10:23:09'),
(36, 18, '5', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-26 10:01:47', '2023-10-26 10:01:47'),
(38, 20, '29', 1, 0, NULL, 0, 1, 30, 'Percentage', '2023-10-26 11:46:20', '2023-10-26 11:46:20'),
(39, 21, '45', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(40, 21, '45', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(41, 21, '45', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(42, 21, '45', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(43, 21, '45', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(44, 21, '45', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(45, 22, '45', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(46, 23, '45', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(49, 25, '45', 1, 0, NULL, 0, 1, 30, 'Percentage', '2023-10-27 03:50:04', '2023-10-27 03:50:04'),
(51, 27, '45', 1, 0, NULL, 0, 1, 1400, 'Percentage', '2023-10-27 04:54:16', '2023-10-27 04:54:16'),
(52, 28, '45', 1, 0, NULL, 0, 1, 3375, 'Percentage', '2023-10-27 04:56:16', '2023-10-27 04:56:16'),
(53, 28, '45', 1, 0, NULL, 1, 2, 1125, 'Percentage', '2023-10-27 04:56:16', '2023-10-27 04:56:16'),
(54, 29, '45', 1, 0, NULL, 0, 1, 900, 'Percentage', '2023-10-27 05:02:18', '2023-10-27 05:02:18'),
(56, 31, '45', 1, 0, NULL, 0, 1, 1500, 'Percentage', '2023-10-27 06:52:44', '2023-10-27 06:52:44'),
(57, 31, '45', 1, 0, NULL, 1, 2, 500, 'Percentage', '2023-10-27 06:52:44', '2023-10-27 06:52:44'),
(58, 32, '46', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(59, 32, '46', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(60, 32, '46', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(61, 32, '46', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(62, 32, '46', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(63, 32, '46', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(64, 33, '46', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(65, 34, '46', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(66, 35, '46', 1, 0, NULL, 0, 1, 1500, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(67, 35, '46', 1, 0, NULL, 1, 2, 500, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(68, 36, '46', 1, 0, NULL, 0, 1, 30, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(69, 37, '46', 1, 0, NULL, 0, 1, 1400, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(70, 38, '46', 1, 0, NULL, 0, 1, 3375, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(71, 38, '46', 1, 0, NULL, 1, 2, 1125, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(72, 39, '46', 1, 0, NULL, 0, 1, 900, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(73, 40, '46', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(74, 41, '46', 1, 0, NULL, 0, 1, 900, 'Percentage', '2023-10-27 07:33:15', '2023-10-27 07:33:15'),
(75, 42, '47', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(76, 42, '47', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(77, 42, '47', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(78, 42, '47', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(79, 42, '47', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(80, 42, '47', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(81, 43, '47', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(82, 44, '47', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(83, 45, '47', 1, 0, NULL, 0, 1, 1500, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(84, 45, '47', 1, 0, NULL, 1, 2, 500, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(85, 46, '47', 1, 0, NULL, 0, 1, 30, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(86, 47, '47', 1, 0, NULL, 0, 1, 1400, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(87, 48, '47', 1, 0, NULL, 0, 1, 3375, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(88, 48, '47', 1, 0, NULL, 1, 2, 1125, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(89, 49, '47', 1, 0, NULL, 0, 1, 900, 'Percentage', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(90, 50, '47', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-27 08:35:03', '2023-10-27 08:35:03'),
(91, 51, '54', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(92, 51, '54', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(93, 51, '54', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(94, 51, '54', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(95, 51, '54', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(96, 51, '54', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(97, 52, '54', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(98, 53, '54', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(99, 54, '54', 1, 0, NULL, 0, 1, 1500, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(100, 54, '54', 1, 0, NULL, 1, 2, 500, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(101, 55, '54', 1, 0, NULL, 0, 1, 30, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(102, 56, '54', 1, 0, NULL, 0, 1, 1400, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(103, 57, '54', 1, 0, NULL, 0, 1, 3375, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(104, 57, '54', 1, 0, NULL, 1, 2, 1125, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(105, 58, '54', 1, 0, NULL, 0, 1, 900, 'Percentage', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(106, 59, '54', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-28 07:50:10', '2023-10-28 07:50:10'),
(107, 60, '104', 1, 0, NULL, 0, 1, 3000, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(108, 60, '104', 1, 0, NULL, 1, 2, 2400, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(109, 60, '104', 3, 0, NULL, 2, 5, 6000, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(110, 60, '104', 10, 0, NULL, 5, 15, 6000, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(111, 60, '104', 5, 0, NULL, 15, 20, 2000, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(112, 60, '104', 6, 0, NULL, 20, 26, 600, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(113, 61, '104', 1, 150, NULL, 0, 1, 150, 'Amount', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(114, 62, '104', 1, 100, NULL, 0, 1, 100, 'Amount', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(115, 63, '104', 1, 0, NULL, 0, 1, 1500, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(116, 63, '104', 1, 0, NULL, 1, 2, 500, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(117, 64, '104', 1, 0, NULL, 0, 1, 30, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(118, 65, '104', 1, 0, NULL, 0, 1, 1400, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(119, 66, '104', 1, 0, NULL, 0, 1, 3375, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(120, 66, '104', 1, 0, NULL, 1, 2, 1125, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54'),
(121, 67, '104', 1, 0, NULL, 0, 1, 900, 'Percentage', '2023-10-30 09:34:54', '2023-10-30 09:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `matchruns`
--

CREATE TABLE `matchruns` (
  `id` int NOT NULL,
  `matchkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams1` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `runs1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `wickets1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `overs1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `teams2` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `overs2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `runs2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `wickets2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `winning_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `matchdata` blob,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matchruns`
--

INSERT INTO `matchruns` (`id`, `matchkey`, `teams1`, `runs1`, `wickets1`, `overs1`, `teams2`, `overs2`, `runs2`, `wickets2`, `winning_status`, `matchdata`, `created_at`, `updated_at`) VALUES
(1, '29', 'PAK', '270', '10', '46.4', 'SA', '8', '57', '1', 'South Africa need 214 runs in 42.0 remaining overs', 0x7b226d617463685f6964223a36343438302c227469746c65223a2250616b697374616e20767320536f75746820416672696361222c2273686f72745f7469746c65223a2250414b207673205341222c227375627469746c65223a2232367468204d61746368222c226d617463685f6e756d626572223a223236222c22666f726d6174223a312c22666f726d61745f737472223a224f4449222c22737461747573223a332c227374617475735f737472223a224c697665222c227374617475735f6e6f7465223a22536f75746820416672696361206e656564203231342072756e7320696e2034322e302072656d61696e696e67206f76657273222c227665726966696564223a2266616c7365222c227072655f7371756164223a2274727565222c226f6464735f617661696c61626c65223a2266616c7365222c2267616d655f7374617465223a332c2267616d655f73746174655f737472223a22506c6179204f6e676f696e67222c22636f6d7065746974696f6e223a7b22636964223a3132373737322c227469746c65223a2249434320437269636b657420576f726c6420437570222c2261626272223a2249434320437269636b657420576f726c6420437570222c2274797065223a22746f75726e616d656e74222c2263617465676f7279223a22696e7465726e6174696f6e616c222c226d617463685f666f726d6174223a226f6469222c22736561736f6e223a2232303233222c22737461747573223a226c697665222c22646174657374617274223a22323032332d31302d3035222c2264617465656e64223a22323032332d31312d3139222c22636f756e747279223a22696e74222c22746f74616c5f6d617463686573223a223438222c22746f74616c5f726f756e6473223a2231222c22746f74616c5f7465616d73223a223130227d2c227465616d61223a7b227465616d5f6964223a31332c226e616d65223a2250616b697374616e222c2273686f72745f6e616d65223a2250414b222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30355c2f50616b697374616e2e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30355c2f50616b697374616e2e706e67222c2273636f7265735f66756c6c223a223237305c2f3130202834362e34206f7629222c2273636f726573223a223237305c2f3130222c226f76657273223a2234362e34227d2c227465616d62223a7b227465616d5f6964223a31392c226e616d65223a22536f75746820416672696361222c2273686f72745f6e616d65223a225341222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30355c2f536f7574682d6166726963612e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30355c2f536f7574682d6166726963612e706e67222c2273636f7265735f66756c6c223a222a35375c2f31202838206f7629222c2273636f726573223a2235375c2f31222c226f76657273223a2238227d2c22646174655f7374617274223a22323032332d31302d32372030383a33303a3030222c22646174655f656e64223a22323032332d31302d32382030323a33303a3030222c2274696d657374616d705f7374617274223a313639383339353430302c2274696d657374616d705f656e64223a313639383436303230302c22646174655f73746172745f697374223a22323032332d31302d32372031343a30303a3030222c22646174655f656e645f697374223a22323032332d31302d32382030383a30303a3030222c2276656e7565223a7b2276656e75655f6964223a223531222c226e616d65223a224d412043686964616d626172616d205374616469756d222c226c6f636174696f6e223a224368656e6e6169222c22636f756e747279223a22496e646961222c2274696d657a6f6e65223a22227d2c22756d7069726573223a22416c65782057686172662028456e676c616e64292c205061756c205265696666656c20284175737472616c6961292c205269636861726420496c6c696e67776f7274682028456e676c616e642c20545629222c2272656665726565223a225269636869652052696368617264736f6e20285765737420496e6469657329222c226571756174696f6e223a22222c226c697665223a22536f75746820416672696361206e656564203231342072756e7320696e2034322e302072656d61696e696e67206f76657273222c22726573756c74223a22222c22726573756c745f74797065223a22222c2277696e5f6d617267696e223a22222c2277696e6e696e675f7465616d5f6964223a302c22636f6d6d656e74617279223a312c227761676f6e223a312c226c61746573745f696e6e696e675f6e756d626572223a322c2270726573717561645f74696d65223a22323032332d31302d32332030333a32323a3034222c227665726966795f74696d65223a22222c226d617463685f646c735f6166666563746564223a2266616c7365222c226c6976655f696e6e696e675f6e756d626572223a22222c22746f7373223a7b2274657874223a2250616b697374616e20656c656374656420746f20626174222c2277696e6e6572223a31332c226465636973696f6e223a317d2c2263757272656e745f6f766572223a22222c2270726576696f75735f6f766572223a22222c226d616e5f6f665f7468655f6d61746368223a22222c226d616e5f6f665f7468655f736572696573223a22222c2269735f666f6c6c6f776f6e223a302c227465616d5f62617474696e675f6669727374223a22222c227465616d5f62617474696e675f7365636f6e64223a22222c226c6173745f666976655f6f76657273223a22222c22696e6e696e6773223a5b7b22696964223a3135323538342c226e756d626572223a312c226e616d65223a2250616b697374616e20496e6e696e67222c2273686f72745f6e616d65223a2250414b20496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a312c2262617474696e675f7465616d5f6964223a31332c226669656c64696e675f7465616d5f6964223a31392c2273636f726573223a223237305c2f3130222c2273636f7265735f66756c6c223a223237305c2f3130202834362e34206f7629222c22626174736d656e223a5b7b226e616d65223a22416264756c6c6168205368616669717565222c22626174736d616e5f6964223a223438343630222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2239222c2262616c6c735f6661636564223a223137222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a223133222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2231222c2272756e35223a2230222c22686f775f6f7574223a2263204c204e676964692062204d204a616e73656e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2235322e3934222c22626f776c65725f6964223a223630333934222c2266697273745f6669656c6465725f6964223a223436313331222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22496d616d20756c20486171222c22626174736d616e5f6964223a223435313939222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223132222c2262616c6c735f6661636564223a223138222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a223133222c2272756e31223a2232222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632048204b6c616173656e2062204d204a616e73656e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2236362e3637222c22626f776c65725f6964223a223630333934222c2266697273745f6669656c6465725f6964223a223436313234222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22426162617220417a616d222c22626174736d616e5f6964223a223433333731222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22284329222c2272756e73223a223530222c2262616c6c735f6661636564223a223635222c22666f757273223a2234222c227369786573223a2231222c2272756e30223a223335222c2272756e31223a223233222c2272756e32223a2231222c2272756e33223a2231222c2272756e35223a2230222c22686f775f6f7574223a2263205144204b6f636b20622054205368616d7369222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2237362e3932222c22626f776c65725f6964223a223436313236222c2266697273745f6669656c6465725f6964223a22313539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d6f68616d6d61642052697a77616e222c22626174736d616e5f6964223a223434303534222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a223331222c2262616c6c735f6661636564223a223237222c22666f757273223a2234222c227369786573223a2231222c2272756e30223a223135222c2272756e31223a2236222c2272756e32223a2230222c2272756e33223a2231222c2272756e35223a2230222c22686f775f6f7574223a2263205144204b6f636b2062204720436f65747a6565222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223131342e3831222c22626f776c65725f6964223a223630333432222c2266697273745f6669656c6465725f6964223a22313539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22496674696b6861722041686d6564222c22626174736d616e5f6964223a2231373731222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223231222c2262616c6c735f6661636564223a223331222c22666f757273223a2231222c227369786573223a2231222c2272756e30223a223138222c2272756e31223a223131222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632048204b6c616173656e20622054205368616d7369222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2236372e3734222c22626f776c65725f6964223a223436313236222c2266697273745f6669656c6465725f6964223a223436313234222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2253617564205368616b65656c222c22626174736d616e5f6964223a223435343230222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223532222c2262616c6c735f6661636564223a223532222c22666f757273223a2237222c227369786573223a2230222c2272756e30223a223234222c2272756e31223a223138222c2272756e32223a2233222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263205144204b6f636b20622054205368616d7369222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223130302e3030222c22626f776c65725f6964223a223436313236222c2266697273745f6669656c6465725f6964223a22313539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22536861646162204b68616e222c22626174736d616e5f6964223a2231313637222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223433222c2262616c6c735f6661636564223a223336222c22666f757273223a2233222c227369786573223a2232222c2272756e30223a223134222c2272756e31223a223135222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204b204d61686172616a2062204720436f65747a6565222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223131392e3434222c22626f776c65725f6964223a223630333432222c2266697273745f6669656c6465725f6964223a223439373036222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d6f68616d6d6164204e6177617a222c22626174736d616e5f6964223a2231373630222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223234222c2262616c6c735f6661636564223a223234222c22666f757273223a2231222c227369786573223a2232222c2272756e30223a223135222c2272756e31223a2234222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632044204d696c6c65722062204d204a616e73656e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223130302e3030222c22626f776c65725f6964223a223630333934222c2266697273745f6669656c6465725f6964223a22313637222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225368616865656e20416672696469222c22626174736d616e5f6964223a223932393931222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2232222c2262616c6c735f6661636564223a2234222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2232222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204b204d61686172616a20622054205368616d7369222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2235302e3030222c22626f776c65725f6964223a223436313236222c2266697273745f6669656c6465725f6964223a223439373036222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d6f68616d6d616420576173696d222c22626174736d616e5f6964223a223538313532222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2237222c2262616c6c735f6661636564223a2239222c22666f757273223a2230222c227369786573223a2231222c2272756e30223a2237222c2272756e31223a2231222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263205144204b6f636b2062204c204e67696469222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2237372e3738222c22626f776c65725f6964223a223436313331222c2266697273745f6669656c6465725f6964223a22313539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2248617269732052617566222c22626174736d616e5f6964223a223932333831222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2231222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a224d6172636f204a616e73656e222c22626f776c65725f6964223a223630333934222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2239222c226d616964656e73223a2231222c2272756e735f636f6e6365646564223a223433222c227769636b657473223a2233222c226e6f62616c6c73223a2232222c227769646573223a2236222c2265636f6e223a22342e3738222c2272756e30223a223430222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224c756e6769204e67696469222c22626f776c65725f6964223a223436313331222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a22372e34222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223435222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2233222c2265636f6e223a22352e3837222c2272756e30223a223236222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22416964656e204d61726b72616d222c22626f776c65725f6964223a223436313137222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223230222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22352e3030222c2272756e30223a223132222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224b6573686176204d61686172616a222c22626f776c65725f6964223a223439373036222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2239222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223536222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22362e3232222c2272756e30223a223330222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22476572616c6420436f65747a6565222c22626f776c65725f6964223a223630333432222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2237222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223432222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22362e3030222c2272756e30223a223230222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a225461627261697a205368616d7369222c22626f776c65725f6964223a223436313236222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223630222c227769636b657473223a2234222c226e6f62616c6c73223a2232222c227769646573223a2231222c2265636f6e223a22362e3030222c2272756e30223a223238222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a223436313331222c226669656c6465725f6e616d65223a224c756e6769204e67696469222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223436313234222c226669656c6465725f6e616d65223a224865696e72696368204b6c616173656e222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313539222c226669656c6465725f6e616d65223a225175696e746f6e206465204b6f636b222c2263617463686573223a342c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223439373036222c226669656c6465725f6e616d65223a224b6573686176204d61686172616a222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313637222c226669656c6465725f6e616d65223a224461766964204d696c6c6572222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a7b227031223a7b2273746172746f766572223a22302e31222c22656e646f766572223a223130227d2c227032223a7b2273746172746f766572223a2231302e31222c22656e646f766572223a223430227d2c227033223a7b2273746172746f766572223a2234302e31222c22656e646f766572223a223530227d7d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2232222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2232227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2232222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2231222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2231227d7d2c22666f7773223a5b7b226e616d65223a22416264756c6c6168205368616669717565222c22626174736d616e5f6964223a223438343630222c2272756e73223a2239222c2262616c6c73223a223137222c22686f775f6f7574223a2263204c204e676964692062204d204a616e73656e222c2273636f72655f61745f6469736d697373616c223a32302c226f766572735f61745f6469736d697373616c223a22342e33222c22626f776c65725f6964223a223630333934222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a22496d616d20756c20486171222c22626174736d616e5f6964223a223435313939222c2272756e73223a223132222c2262616c6c73223a223138222c22686f775f6f7574223a22632048204b6c616173656e2062204d204a616e73656e222c2273636f72655f61745f6469736d697373616c223a33382c226f766572735f61745f6469736d697373616c223a22362e33222c22626f776c65725f6964223a223630333934222c226469736d697373616c223a22636175676874222c226e756d626572223a327d2c7b226e616d65223a224d6f68616d6d61642052697a77616e222c22626174736d616e5f6964223a223434303534222c2272756e73223a223331222c2262616c6c73223a223237222c22686f775f6f7574223a2263205144204b6f636b2062204720436f65747a6565222c2273636f72655f61745f6469736d697373616c223a38362c226f766572735f61745f6469736d697373616c223a2231352e35222c22626f776c65725f6964223a223630333432222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a22496674696b6861722041686d6564222c22626174736d616e5f6964223a2231373731222c2272756e73223a223231222c2262616c6c73223a223331222c22686f775f6f7574223a22632048204b6c616173656e20622054205368616d7369222c2273636f72655f61745f6469736d697373616c223a3132392c226f766572735f61745f6469736d697373616c223a2232352e31222c22626f776c65725f6964223a223436313236222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a22426162617220417a616d222c22626174736d616e5f6964223a223433333731222c2272756e73223a223530222c2262616c6c73223a223635222c22686f775f6f7574223a2263205144204b6f636b20622054205368616d7369222c2273636f72655f61745f6469736d697373616c223a3134312c226f766572735f61745f6469736d697373616c223a2232372e35222c22626f776c65725f6964223a223436313236222c226469736d697373616c223a22636175676874222c226e756d626572223a357d2c7b226e616d65223a22536861646162204b68616e222c22626174736d616e5f6964223a2231313637222c2272756e73223a223433222c2262616c6c73223a223336222c22686f775f6f7574223a2263204b204d61686172616a2062204720436f65747a6565222c2273636f72655f61745f6469736d697373616c223a3232352c226f766572735f61745f6469736d697373616c223a2233392e34222c22626f776c65725f6964223a223630333432222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c7b226e616d65223a2253617564205368616b65656c222c22626174736d616e5f6964223a223435343230222c2272756e73223a223532222c2262616c6c73223a223532222c22686f775f6f7574223a2263205144204b6f636b20622054205368616d7369222c2273636f72655f61745f6469736d697373616c223a3234302c226f766572735f61745f6469736d697373616c223a2234322e31222c22626f776c65725f6964223a223436313236222c226469736d697373616c223a22636175676874222c226e756d626572223a377d2c7b226e616d65223a225368616865656e20416672696469222c22626174736d616e5f6964223a223932393931222c2272756e73223a2232222c2262616c6c73223a2234222c22686f775f6f7574223a2263204b204d61686172616a20622054205368616d7369222c2273636f72655f61745f6469736d697373616c223a3235392c226f766572735f61745f6469736d697373616c223a2234342e32222c22626f776c65725f6964223a223436313236222c226469736d697373616c223a22636175676874222c226e756d626572223a387d2c7b226e616d65223a224d6f68616d6d6164204e6177617a222c22626174736d616e5f6964223a2231373630222c2272756e73223a223234222c2262616c6c73223a223234222c22686f775f6f7574223a22632044204d696c6c65722062204d204a616e73656e222c2273636f72655f61745f6469736d697373616c223a3236382c226f766572735f61745f6469736d697373616c223a2234352e35222c22626f776c65725f6964223a223630333934222c226469736d697373616c223a22636175676874222c226e756d626572223a397d2c7b226e616d65223a224d6f68616d6d616420576173696d222c22626174736d616e5f6964223a223538313532222c2272756e73223a2237222c2262616c6c73223a2239222c22686f775f6f7574223a2263205144204b6f636b2062204c204e67696469222c2273636f72655f61745f6469736d697373616c223a3237302c226f766572735f61745f6469736d697373616c223a2234362e34222c22626f776c65725f6964223a223436313331222c226469736d697373616c223a22636175676874222c226e756d626572223a31307d5d2c226c6173745f7769636b6574223a7b226e616d65223a224d6f68616d6d616420576173696d222c22626174736d616e5f6964223a223538313532222c2272756e73223a2237222c2262616c6c73223a2239222c22686f775f6f7574223a2263205144204b6f636b2062204c204e67696469222c2273636f72655f61745f6469736d697373616c223a3237302c226f766572735f61745f6469736d697373616c223a2234362e34222c22626f776c65725f6964223a223436313331222c226469736d697373616c223a22636175676874222c226e756d626572223a31307d2c2265787472615f72756e73223a7b2262796573223a342c226c656762796573223a302c227769646573223a31312c226e6f62616c6c73223a342c2270656e616c7479223a2230222c22746f74616c223a31397d2c226571756174696f6e73223a7b2272756e73223a3237302c227769636b657473223a31302c226f76657273223a2234362e34222c22626f776c6572735f75736564223a362c2272756e72617465223a22352e3739227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a322c2262616c6c73223a352c226f76657273223a302e352c22626174736d656e223a5b7b226e616d65223a2248617269732052617566222c22626174736d616e5f6964223a39323338312c2272756e73223a302c2262616c6c73223a317d2c7b226e616d65223a224d6f68616d6d616420576173696d222c22626174736d616e5f6964223a35383135322c2272756e73223a302c2262616c6c73223a347d5d7d2c226469645f6e6f745f626174223a5b5d2c226d61785f6f766572223a223530222c22746172676574223a2230227d2c7b22696964223a3135323630392c226e756d626572223a322c226e616d65223a22536f7574682041667269636120496e6e696e67222c2273686f72745f6e616d65223a22534120496e6e696e67222c22737461747573223a332c22697373757065726f766572223a2266616c7365222c22726573756c74223a302c2262617474696e675f7465616d5f6964223a31392c226669656c64696e675f7465616d5f6964223a31332c2273636f726573223a2235375c2f31222c2273636f7265735f66756c6c223a2235375c2f31202838206f7629222c22626174736d656e223a5b7b226e616d65223a2254656d626120426176756d61222c22626174736d616e5f6964223a223436313339222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22626174222c22726f6c655f737472223a22284329222c2272756e73223a223231222c2262616c6c735f6661636564223a223233222c22666f757273223a2234222c227369786573223a2230222c2272756e30223a223135222c2272756e31223a2233222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a2239312e3330222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225175696e746f6e206465204b6f636b222c22626174736d616e5f6964223a22313539222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a223234222c2262616c6c735f6661636564223a223134222c22666f757273223a2235222c227369786573223a2230222c2272756e30223a2236222c2272756e31223a2232222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204d20576173696d2062205320416672696469222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223137312e3433222c22626f776c65725f6964223a223932393931222c2266697273745f6669656c6465725f6964223a223538313532222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225261737369652076616e206465722044757373656e222c22626174736d616e5f6964223a223436313335222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2236222c2262616c6c735f6661636564223a223131222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2235222c2272756e31223a2236222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a2235342e3535222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a22496674696b6861722041686d6564222c22626f776c65725f6964223a2231373731222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223135222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22372e3530222c2272756e30223a2236222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a225368616865656e20416672696469222c22626f776c65725f6964223a223932393931222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223236222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22362e3530222c2272756e30223a223135222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d6f68616d6d6164204e6177617a222c22626f776c65725f6964223a2231373630222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223136222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22382e3030222c2272756e30223a2235222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a223538313532222c226669656c6465725f6e616d65223a224d6f68616d6d616420576173696d222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a7b227031223a7b2273746172746f766572223a22302e31222c22656e646f766572223a223130227d7d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2232222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2232227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2232222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2232227d7d2c22666f7773223a5b7b226e616d65223a225175696e746f6e206465204b6f636b222c22626174736d616e5f6964223a22313539222c2272756e73223a223234222c2262616c6c73223a223134222c22686f775f6f7574223a2263204d20576173696d2062205320416672696469222c2273636f72655f61745f6469736d697373616c223a33342c226f766572735f61745f6469736d697373616c223a22332e33222c22626f776c65725f6964223a223932393931222c226469736d697373616c223a22636175676874222c226e756d626572223a317d5d2c226c6173745f7769636b6574223a7b226e616d65223a225175696e746f6e206465204b6f636b222c22626174736d616e5f6964223a22313539222c2272756e73223a223234222c2262616c6c73223a223134222c22686f775f6f7574223a2263204d20576173696d2062205320416672696469222c2273636f72655f61745f6469736d697373616c223a33342c226f766572735f61745f6469736d697373616c223a22332e33222c22626f776c65725f6964223a223932393931222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c2265787472615f72756e73223a7b2262796573223a302c226c656762796573223a302c227769646573223a362c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a367d2c226571756174696f6e73223a7b2272756e73223a35372c227769636b657473223a312c226f76657273223a2238222c22626f776c6572735f75736564223a332c2272756e72617465223a22372e3133227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a32332c2262616c6c73223a32372c226f76657273223a342e332c22626174736d656e223a5b7b226e616d65223a225261737369652076616e206465722044757373656e222c22626174736d616e5f6964223a34363133352c2272756e73223a362c2262616c6c73223a31317d2c7b226e616d65223a2254656d626120426176756d61222c22626174736d616e5f6964223a34363133392c2272756e73223a31372c2262616c6c73223a31367d5d7d2c226469645f6e6f745f626174223a5b7b22706c617965725f6964223a223436313137222c226e616d65223a22416964656e204d61726b72616d227d2c7b22706c617965725f6964223a223436313234222c226e616d65223a224865696e72696368204b6c616173656e227d2c7b22706c617965725f6964223a22313637222c226e616d65223a224461766964204d696c6c6572227d2c7b22706c617965725f6964223a223630333934222c226e616d65223a224d6172636f204a616e73656e227d2c7b22706c617965725f6964223a223630333432222c226e616d65223a22476572616c6420436f65747a6565227d2c7b22706c617965725f6964223a223439373036222c226e616d65223a224b6573686176204d61686172616a227d2c7b22706c617965725f6964223a223436313236222c226e616d65223a225461627261697a205368616d7369227d2c7b22706c617965725f6964223a223436313331222c226e616d65223a224c756e6769204e67696469227d5d2c226d61785f6f766572223a223530222c22746172676574223a22323731227d5d2c22706c6179657273223a5b7b22706964223a3135392c227469746c65223a225175696e746f6e206465204b6f636b222c2273686f72745f6e616d65223a225144204b6f636b222c2266697273745f6e616d65223a225175696e746f6e206465204b6f636b222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d31322d3137222c226269727468706c616365223a224a6f68616e6e6573627572672c2047617574656e67222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a227769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a225175696e746f6e206465204b6f636b222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f5175696e746f6e44654b6f636b4f6666696369616c31325c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f5175696e6e7944654b6f636b3639222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f71646b5f31325c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a3136372c227469746c65223a224461766964204d696c6c6572222c2273686f72745f6e616d65223a2244204d696c6c6572222c2266697273745f6e616d65223a224461766964204d696c6c6572222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30362d3130222c226269727468706c616365223a225069657465726d617269747a627572672c206e6174616c222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a224461766964204d696c6c6572222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f64617669646d696c6c6572736131325c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f44617669644d696c6c657253413132222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f64617669646d696c6c6572736131325c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a313136372c227469746c65223a22536861646162204b68616e222c2273686f72745f6e616d65223a2253204b68616e222c2266697273745f6e616d65223a22536861646162204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939382d31302d3034222c226269727468706c616365223a224d69616e77616c69222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22536861646162204b68616e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f7368616461626b68616e2e637269636b657465725c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f37367368616461626b68616e222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f736861646162303830305c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a313736302c227469746c65223a224d6f68616d6d6164204e6177617a222c2273686f72745f6e616d65223a224d204e6177617a222c2266697273745f6e616d65223a224d6f68616d6d6164204e6177617a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939342d30332d3231222c226269727468706c616365223a2220526177616c70696e64692c2050756e6a6162222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a224d6f68616d6d6164204e6177617a222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f526e6177617a3331383838222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d5f6e6177617a6b68616e5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a313737312c227469746c65223a22496674696b6861722041686d6564222c2273686f72745f6e616d65223a22492041686d6564222c2266697273745f6e616d65223a22496674696b6861722041686d6564222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30392d3033222c226269727468706c616365223a2250657368617761722c204e6f7274682d576573742046726f6e746965722050726f76696e6365222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22496674696b6861722041686d6564222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f496674694d616e6961222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6966746961686d65643232315c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a313935332c227469746c65223a224b616769736f20526162616461222c2273686f72745f6e616d65223a224b20526162616461222c2266697273745f6e616d65223a224b616769736f20526162616461222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939352d30352d3235222c226269727468706c616365223a224a6f68616e6e657362757267222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224b616769736f20526162616461222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4b616769736f5261626164614f6666696369616c5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6b616769736f7261626164613235222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7261626164615f32355c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34333337302c227469746c65223a2246616b686172205a616d616e222c2273686f72745f6e616d65223a2246205a616d616e222c2266697273745f6e616d65223a2246616b686172205a616d616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30342d3130222c226269727468706c616365223a224d617264616e2c204e6f7274682d576573742046726f6e746965722050726f76696e6365222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a2246616b686172205a616d616e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f69616d66616b6861727a616d616e5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f46616b6861725a616d616e4c697665222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f66616b6861727a616d616e3731395c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34333337312c227469746c65223a22426162617220417a616d222c2273686f72745f6e616d65223a224220417a616d222c2266697273745f6e616d65223a22426162617220417a616d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939342d31302d3135222c226269727468706c616365223a224c61686f72652c2050756e6a6162222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22426162617220417a616d222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4d4261626172417a616d50616b697374616e222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6261626172617a616d323538222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6261626172617a616d5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626174222c22726f6c655f737472223a22284329227d2c7b22706964223a34343035342c227469746c65223a224d6f68616d6d61642052697a77616e222c2273686f72745f6e616d65223a224d2052697a77616e222c2266697273745f6e616d65223a224d6f68616d6d61642052697a77616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d30362d3031222c226269727468706c616365223a2250657368617761722c204b68796265722050616b6874756e6b687761222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a225769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224d6f68616d6d61642052697a77616e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f696d72697a77616e70616b695c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f694d52697a77616e50616b222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d72697a77616e70616b5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a34343037302c227469746c65223a225573616d61204d6972222c2273686f72745f6e616d65223a2255204d6972222c2266697273745f6e616d65223a225573616d61204d6972222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939352d31322d3233222c226269727468706c616365223a225369616c6b6f74222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f69616d7573616d616d6972222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f69616d7573616d616d69725c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34343039392c227469746c65223a22486173616e20416c69222c2273686f72745f6e616d65223a224820416c69222c2266697273745f6e616d65223a22486173616e20416c69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939342d30372d3032222c226269727468706c616365223a2247756a72616e77616c612c2050756e6a6162222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22486173616e20416c69222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f5265616c68617373616e33325c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f5265616c48613535616e222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f68613535616e5f616c695c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34353139392c227469746c65223a22496d616d20756c20486171222c2273686f72745f6e616d65223a22495520486171222c2266697273745f6e616d65223a22496d616d20756c20486171222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939352d31322d3132222c226269727468706c616365223a224c61686f72652c2050756e6a6162222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a32343130312c22726563656e745f617070656172616e6365223a313531353434383830302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22496d616d2d756c2d486171222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f696d616d2e3234365c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f496d616d556c4861713132222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f696d616d756c6861716f6666696369616c5c2f3f686c3d656e2d6762222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a34353339372c227469746c65223a22416768612053616c6d616e222c2273686f72745f6e616d65223a22412053616c6d616e222c2266697273745f6e616d65223a22416768612053616c6d616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939332d31312d3233222c226269727468706c616365223a224c61686f72652c2050756e6a6162222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22416768612053616c6d616e222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f53616c6d616e416c694167686131222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34353432302c227469746c65223a2253617564205368616b65656c222c2273686f72745f6e616d65223a2253205368616b65656c222c2266697273745f6e616d65223a2253617564205368616b65656c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939352d30392d3035222c226269727468706c616365223a224b6172616368692c2053696e64222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a2253617564205368616b65656c222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f736175642e3039355c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f736175647368616b222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f69736175647368616b5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a34363131372c227469746c65223a22416964656e204d61726b72616d222c2273686f72745f6e616d65223a2241204d61726b72616d222c2266697273745f6e616d65223a22416964656e204d61726b72616d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939342d31302d3034222c226269727468706c616365223a2243656e747572696f6e222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22416964656e204d61726b72616d222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f70656f706c655c2f416964656e2d6d61726b72616d5c2f3130303037373433383234353935305c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f416964656e4d61726b72616d222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f616964656e6d61726b72616d5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a34363132342c227469746c65223a224865696e72696368204b6c616173656e222c2273686f72745f6e616d65223a2248204b6c616173656e222c2266697273745f6e616d65223a224865696e72696368204b6c616173656e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d30372d3330222c226269727468706c616365223a22507265746f7269612c205472616e737661616c222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a225769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224865696e72696368204b6c616173656e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6865696e726963682e6b6c616173656e2e33315c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4865696e693232222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6865696e696534355c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22776b222c22726f6c655f737472223a22227d2c7b22706964223a34363132362c227469746c65223a225461627261697a205368616d7369222c2273686f72745f6e616d65223a2254205368616d7369222c2266697273745f6e616d65223a225461627261697a205368616d7369222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30322d3138222c226269727468706c616365223a224a6f68616e6e6573627572672c2047617574656e67222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d205772697374205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a225461627261697a205368616d7369222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7368616d736939305c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a34363133312c227469746c65223a224c756e6769204e67696469222c2273686f72745f6e616d65223a224c204e67696469222c2266697273745f6e616d65223a224c756e6769204e67696469222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939362d30332d3239222c226269727468706c616365223a2244757262616e2c204e6174616c222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a224c756e6769204e67696469222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4e676964694c756e67695c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4e676964694c756e6769222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6c756e67696e676964695c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a34363133352c227469746c65223a225261737369652076616e206465722044757373656e222c2273686f72745f6e616d65223a225256442044757373656e222c2266697273745f6e616d65223a225261737369652076616e206465722044757373656e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30322d3037222c226269727468706c616365223a22507265746f7269612c205472616e737661616c222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a225261737369652076616e206465722044757373656e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f52617373696537324f6666696369616c5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f5261737369653732222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f72617373696537325c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a34363133392c227469746c65223a2254656d626120426176756d61222c2273686f72745f6e616d65223a225420426176756d61222c2266697273745f6e616d65223a2254656d626120426176756d61222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30352d3137222c226269727468706c616365223a224361706520546f776e2c20436170652050726f76696e6365222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a2254656d626120426176756d61222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f54656d6261426176756d615c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f54656d6261426176756d61222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f74656d6261626176756d615c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626174222c22726f6c655f737472223a22284329227d2c7b22706964223a34373438372c227469746c65223a224c697a6161642057696c6c69616d73222c2273686f72745f6e616d65223a224c2057696c6c69616d73222c2266697273745f6e616d65223a224c697a6161642057696c6c69616d73222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939332d31302d3031222c226269727468706c616365223a2256726564656e62757267222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6c697a616164773137222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6c697a7a797731315c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34383436302c227469746c65223a22416264756c6c6168205368616669717565222c2273686f72745f6e616d65223a2241205368616669717565222c2266697273745f6e616d65223a22416264756c6c6168205368616669717565222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939392d31312d3230222c226269727468706c616365223a225369616c6b6f74222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22416264756c6c6168205368616669717565222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f416264756c6c6168736861666971756532385c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f696d6162643238222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f696d61626432385c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a34393730302c227469746c65223a225265657a612048656e647269636b73222c2273686f72745f6e616d65223a22522048656e647269636b73222c2266697273745f6e616d65223a225265657a612048656e647269636b73222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30382d3134222c226269727468706c616365223a224b696d6265726c65792c20436170652050726f76696e6365222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a225265657a612048656e647269636b73222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f7265657a612e68656e647269636b735c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f7265657a6168656e647269636b73222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7265657a6168656e647269636b735c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34393730362c227469746c65223a224b6573686176204d61686172616a222c2273686f72745f6e616d65223a224b204d61686172616a222c2266697273745f6e616d65223a224b6573686176204d61686172616a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30322d3037222c226269727468706c616365223a222044757262616e2c204e6174616c222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a224b6573686176204d61686172616a222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f6d2e66616365626f6f6b2e636f6d5c2f70656f706c655c2f4b65736861762d4d61686172616a5c2f3130303037363637343733383431305c2f222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6b65736861766d61686172616a31365c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a35333030302c227469746c65223a22416e64696c6520506865686c756b7761796f222c2273686f72745f6e616d65223a224120506865686c756b7761796f222c2266697273745f6e616d65223a22416e64696c6520506865686c756b7761796f222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939362d30332d3033222c226269727468706c616365223a2244757262616e222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22416e64696c6520506865686c756b7761796f222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f6d2e66616365626f6f6b2e636f6d5c2f616e64696c652e706865686c756b7761796f5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f616e64696c656c75636b3139222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f616e64696c655f706865686c756b7761796f5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a35383135322c227469746c65223a224d6f68616d6d616420576173696d222c2273686f72745f6e616d65223a224d20576173696d222c2266697273745f6e616d65223a224d6f68616d6d616420576173696d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030312d30382d3235222c226269727468706c616365223a224e6f7274682057617a6972617374616e222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a224d6f68616d6d616420576173696d222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4d7568616d6d6164576173696d3737222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a35383630382c227469746c65223a2241627261722041686d6564222c2273686f72745f6e616d65223a22412041686d6564222c2266697273745f6e616d65223a2241627261722041686d6564222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939382d30392d3137222c226269727468706c616365223a224b6172616368692c2050616b697374616e222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a2241627261722041686d6564222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f416272617241686d656450616b222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a36303334322c227469746c65223a22476572616c6420436f65747a6565222c2273686f72745f6e616d65223a224720436f65747a6565222c2266697273745f6e616d65223a22476572616c6420436f65747a6565222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030302d31302d3032222c226269727468706c616365223a22426c6f656d666f6e7465696e222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22476572616c6420436f65747a6565222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f476572616c64436f65747a65653632222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f676572616c645f636f65747a656536325c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a36303339342c227469746c65223a224d6172636f204a616e73656e222c2273686f72745f6e616d65223a224d204a616e73656e222c2266697273745f6e616d65223a224d6172636f204a616e73656e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030302d30352d3031222c226269727468706c616365223a224b6c65726b73646f72702c20536f75746820416672696361222c22636f756e747279223a227a61222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224d6172636f204a616e73656e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f705c2f4d6172636f2d4a616e73656e2d3130303036363735353434343735305c2f222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d6172636f376a616e73656e5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22536f75746820416672696361222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a39323338312c227469746c65223a2248617269732052617566222c2273686f72745f6e616d65223a22482052617566222c2266697273745f6e616d65223a2248617269732052617566222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939332d31312d3037222c226269727468706c616365223a22526177616c70696e64692c2050616b697374616e222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a2248617269732052617566222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6968617269737261756637375c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4861726973526175663134222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6861726973726175666f6666696369616c5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a39323939312c227469746c65223a225368616865656e20416672696469222c2273686f72745f6e616d65223a225320416672696469222c2266697273745f6e616d65223a225368616865656e20416672696469222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030302d30342d3036222c226269727468706c616365223a224b6879626572204167656e6379222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a225368616865656e20416672696469222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f695368616865656e61667269646934305c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f695368616865656e416672696469222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f697368616865656e61667269646931305c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a39353934322c227469746c65223a225a616d616e204b68616e222c2273686f72745f6e616d65223a225a204b68616e222c2266697273745f6e616d65223a225a616d616e204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030312d30392d3130222c226269727468706c616365223a224d6972707572222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f5a616d616e4b68616e50616b222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7265616c5f7a616d616e6b68616e5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a39363739382c227469746c65223a224d6f68616d6d6164204861726973222c2273686f72745f6e616d65223a224d204861726973222c2266697273745f6e616d65223a224d6f68616d6d6164204861726973222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030312d30332d3330222c226269727468706c616365223a225065736861776172222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a224f63636173696f6e616c205769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4d7568616d6d6164486172697336335c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f69616d68617269733633222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f69616d686172697336335c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d5d2c227072655f6d617463685f6f646473223a5b5d2c226461795f72656d61696e696e675f6f766572223a22222c226d617463685f6e6f746573223a5b5b2250616b697374616e20696e6e696e672031222c22506f776572706c617920312028302e31202d203130292052756e2035382c207769636b65742032222c22506f776572706c61792032202831302e31202d203430292052756e203137322c207769636b65742034222c22506f776572706c61792033202834302e31202d203530292052756e2034382c207769636b65742035222c2250616b697374616e3a2035302072756e7320696e20382e35206f766572732e222c2250616b697374616e3a203130302072756e7320696e2031392e35206f766572732e222c2250616b697374616e3a203135302072756e7320696e2032392e33206f766572732e222c2235302072756e20706172746e657273686970206f662034352062616c6c732c53617564205368616b65656c203234283231292072756e732c20536861646162204b68616e203237283234292072756e732e222c2250616b697374616e3a203230302072756e7320696e2033362e34206f766572732e222c2253617564205368616b65656c2035302072756e7320696e2035302062616c6c73202834207820372c203620582030292e222c2250616b697374616e3a203235302072756e7320696e2034322e36206f766572732e222c22506f776572706c6179203320283430202d203530292052756e2034382c207769636b65742035222c22496e6e696e677320427265616b3a2050616b697374616e202d203237305c2f3130206f766572732034362e34202862616c6c7320323830292e225d2c5b22536f7574682041667269636120696e6e696e672032222c22506f776572706c617920312028302e31202d203130292052756e2035372c207769636b65742031222c22536f757468204166726963613a2035302072756e7320696e20362e35206f766572732e222c22506f776572706c61792031202830202d203130292052756e2035372c207769636b65742031222c22536f75746820416672696361206e656564203231342072756e7320696e2034322e302072656d61696e696e67206f76657273225d5d7d, '2023-10-27 13:26:03', '2023-10-27 13:26:03');
INSERT INTO `matchruns` (`id`, `matchkey`, `teams1`, `runs1`, `wickets1`, `overs1`, `teams2`, `overs2`, `runs2`, `wickets2`, `winning_status`, `matchdata`, `created_at`, `updated_at`) VALUES
(2, '45', 'EMB', '0', '0', '0', 'FUJ', '15', '72', '6', 'Fujairah elected to bat', 0x7b226d617463685f6964223a37303735312c227469746c65223a22456d69726174657320426c7565732076732046756a6169726168222c2273686f72745f7469746c65223a22454d422076732046554a222c227375627469746c65223a224d61746368203235222c226d617463685f6e756d626572223a223235222c22666f726d6174223a362c22666f726d61745f737472223a22543230222c22737461747573223a332c227374617475735f737472223a224c697665222c227374617475735f6e6f7465223a2246756a616972616820656c656374656420746f20626174222c227665726966696564223a2266616c7365222c227072655f7371756164223a2274727565222c226f6464735f617661696c61626c65223a2266616c7365222c2267616d655f7374617465223a332c2267616d655f73746174655f737472223a22506c6179204f6e676f696e67222c22636f6d7065746974696f6e223a7b22636964223a3132383330392c227469746c65223a22456d69726174657320443230222c2261626272223a2245443230222c2274797065223a22746f75726e616d656e74222c2263617465676f7279223a22646f6d6573746963222c226d617463685f666f726d6174223a22743230222c22736561736f6e223a2232303233222c22737461747573223a226c697665222c22646174657374617274223a22323032332d31302d3133222c2264617465656e64223a22323032332d31302d3331222c22636f756e747279223a226165222c22746f74616c5f6d617463686573223a223238222c22746f74616c5f726f756e6473223a2231222c22746f74616c5f7465616d73223a2236227d2c227465616d61223a7b227465616d5f6964223a37333239322c226e616d65223a22456d69726174657320426c756573222c2273686f72745f6e616d65223a22454d42222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032315c2f31325c2f454d422e6a7067222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032315c2f31325c2f454d422e6a7067222c2273636f7265735f66756c6c223a22227d2c227465616d62223a7b227465616d5f6964223a3131363232332c226e616d65223a2246756a6169726168222c2273686f72745f6e616d65223a2246554a222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032305c2f31325c2f6262622d33327833322e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032305c2f31325c2f6262622d33327833322e706e67222c2273636f7265735f66756c6c223a222a37325c2f3620283135206f7629222c2273636f726573223a2237325c2f36222c226f76657273223a223135227d2c22646174655f7374617274223a22323032332d31302d32372031333a33303a3030222c22646174655f656e64223a22323032332d31302d32372032333a33303a3030222c2274696d657374616d705f7374617274223a313639383431333430302c2274696d657374616d705f656e64223a313639383434393430302c22646174655f73746172745f697374223a22323032332d31302d32372031393a30303a3030222c22646174655f656e645f697374223a22323032332d31302d32382030353a30303a3030222c2276656e7565223a7b2276656e75655f6964223a22313030222c226e616d65223a22447562616920496e7465726e6174696f6e616c20437269636b6574205374616469756d222c226c6f636174696f6e223a224475626169222c22636f756e747279223a22556e69746564204172616220456d697261746573222c2274696d657a6f6e65223a22227d2c22756d7069726573223a22222c2272656665726565223a22222c226571756174696f6e223a22222c226c697665223a2246756a616972616820656c656374656420746f20626174222c22726573756c74223a22222c22726573756c745f74797065223a22222c2277696e5f6d617267696e223a22222c2277696e6e696e675f7465616d5f6964223a302c22636f6d6d656e74617279223a312c227761676f6e223a302c226c61746573745f696e6e696e675f6e756d626572223a312c2270726573717561645f74696d65223a22323032332d31302d32352031323a32333a3232222c227665726966795f74696d65223a22222c226d617463685f646c735f6166666563746564223a2266616c7365222c226c6976655f696e6e696e675f6e756d626572223a22222c22746f7373223a7b2274657874223a2246756a616972616820656c656374656420746f20626174222c2277696e6e6572223a3131363232332c226465636973696f6e223a317d2c2263757272656e745f6f766572223a22222c2270726576696f75735f6f766572223a22222c226d616e5f6f665f7468655f6d61746368223a22222c226d616e5f6f665f7468655f736572696573223a22222c2269735f666f6c6c6f776f6e223a302c227465616d5f62617474696e675f6669727374223a22222c227465616d5f62617474696e675f7365636f6e64223a22222c226c6173745f666976655f6f76657273223a22222c22696e6e696e6773223a5b7b22696964223a3135323631372c226e756d626572223a312c226e616d65223a2246756a616972616820496e6e696e67222c2273686f72745f6e616d65223a2246554a20496e6e696e67222c22737461747573223a332c22697373757065726f766572223a2266616c7365222c22726573756c74223a302c2262617474696e675f7465616d5f6964223a3131363232332c226669656c64696e675f7465616d5f6964223a37333239322c2273636f726573223a2237325c2f36222c2273636f7265735f66756c6c223a2237325c2f3620283135206f7629222c22626174736d656e223a5b7b226e616d65223a2241617279616e204d6164616e69222c22626174736d616e5f6964223a22313034363230222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2239222c2262616c6c735f6661636564223a2238222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2233222c2272756e31223a2233222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632041646974687961205368657474792062204d6f68616d6d6164204179617a222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223131322e3530222c22626f776c65725f6964223a223834353738222c2266697273745f6669656c6465725f6964223a22313139353230222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22417279616e20536178656e61222c22626174736d616e5f6964223a22313132373932222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223132222c2262616c6c735f6661636564223a223136222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a223130222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632059205361626e616e69206220482042696c616c222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2237352e3030222c22626f776c65725f6964223a22313031313934222c2266697273745f6669656c6465725f6964223a22313235343432222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d6f68616d6d616420556d657220446f676572222c22626174736d616e5f6964223a22313332373934222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2236222c2262616c6c735f6661636564223a2238222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2235222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2273742059205361626e616e6920622046204e6177617a222c226469736d697373616c223a227374756d706564222c22737472696b655f72617465223a2237352e3030222c22626f776c65725f6964223a223933393336222c2266697273745f6669656c6465725f6964223a22313235343432222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2241736877616e742056616c7468617061222c22626174736d616e5f6964223a22313332383538222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a223236222c2262616c6c735f6661636564223a223237222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2237222c2272756e31223a223136222c2272756e32223a2233222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a2239362e3330222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22416861616e204665726e616e646573222c22626174736d616e5f6964223a22313034363539222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2236222c2262616c6c735f6661636564223a223135222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a223132222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632046204e6177617a2062204164697468796120536865747479222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2234302e3030222c22626f776c65725f6964223a22313139353230222c2266697273745f6669656c6465725f6964223a223933393336222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22416d6d617220426164616d69222c22626174736d616e5f6964223a22313132383038222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2234222c2262616c6c735f6661636564223a2237222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2233222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226320262062204164697468796120536865747479222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2235372e3134222c22626f776c65725f6964223a22313139353230222c2266697273745f6669656c6465725f6964223a22313139353230222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225261756e616b20416e696c2056617377616e69222c22626174736d616e5f6964223a22313132383337222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2236222c2262616c6c735f6661636564223a2239222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2236222c2272756e31223a2231222c2272756e32223a2231222c2272756e33223a2231222c2272756e35223a2230222c22686f775f6f7574223a226320262062204d6164686176204d616e6f6a222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2236362e3637222c22626f776c65725f6964223a22313332383637222c2266697273745f6669656c6465725f6964223a22313332383637222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a224d6f68616d6d6164204179617a222c22626f776c65725f6964223a223834353738222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2233222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223132222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22342e3030222c2272756e30223a223133222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224661686164204e6177617a222c22626f776c65725f6964223a223933393336222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2233222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223230222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22362e3637222c2272756e30223a2235222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a2248617a7261742042696c616c222c22626f776c65725f6964223a22313031313934222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2233222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223130222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22332e3333222c2272756e30223a223131222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224164697468796120536865747479222c22626f776c65725f6964223a22313139353230222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223138222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2232222c2265636f6e223a22342e3530222c2272756e30223a223130222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224a756e616964205368616d73756464696e222c22626f776c65725f6964223a22313231393433222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2231222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223130222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231302e3030222c2272756e30223a2232222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d6164686176204d616e6f6a222c22626f776c65725f6964223a22313332383637222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a2231222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a2232222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22322e3030222c2272756e30223a2235222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a22313139353230222c226669656c6465725f6e616d65223a224164697468796120536865747479222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313235343432222c226669656c6465725f6e616d65223a2259617368205361626e616e69222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a312c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223933393336222c226669656c6465725f6e616d65223a224661686164204e6177617a222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313332383637222c226669656c6465725f6e616d65223a224d6164686176204d616e6f6a222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a5b5d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2230222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2230222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d7d2c22666f7773223a5b7b226e616d65223a2241617279616e204d6164616e69222c22626174736d616e5f6964223a22313034363230222c2272756e73223a2239222c2262616c6c73223a2238222c22686f775f6f7574223a22632041646974687961205368657474792062204d6f68616d6d6164204179617a222c2273636f72655f61745f6469736d697373616c223a31342c226f766572735f61745f6469736d697373616c223a22322e32222c22626f776c65725f6964223a223834353738222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a224d6f68616d6d616420556d657220446f676572222c22626174736d616e5f6964223a22313332373934222c2272756e73223a2236222c2262616c6c73223a2238222c22686f775f6f7574223a2273742059205361626e616e6920622046204e6177617a222c2273636f72655f61745f6469736d697373616c223a32312c226f766572735f61745f6469736d697373616c223a22332e35222c22626f776c65725f6964223a223933393336222c226469736d697373616c223a227374756d706564222c226e756d626572223a327d2c7b226e616d65223a22417279616e20536178656e61222c22626174736d616e5f6964223a22313132373932222c2272756e73223a223132222c2262616c6c73223a223136222c22686f775f6f7574223a22632059205361626e616e69206220482042696c616c222c2273636f72655f61745f6469736d697373616c223a33382c226f766572735f61745f6469736d697373616c223a22372e31222c22626f776c65725f6964223a22313031313934222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a22416861616e204665726e616e646573222c22626174736d616e5f6964223a22313034363539222c2272756e73223a2236222c2262616c6c73223a223135222c22686f775f6f7574223a22632046204e6177617a2062204164697468796120536865747479222c2273636f72655f61745f6469736d697373616c223a34392c226f766572735f61745f6469736d697373616c223a2231302e35222c22626f776c65725f6964223a22313139353230222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a22416d6d617220426164616d69222c22626174736d616e5f6964223a22313132383038222c2272756e73223a2234222c2262616c6c73223a2237222c22686f775f6f7574223a226320262062204164697468796120536865747479222c2273636f72655f61745f6469736d697373616c223a35382c226f766572735f61745f6469736d697373616c223a2231322e34222c22626f776c65725f6964223a22313139353230222c226469736d697373616c223a22636175676874222c226e756d626572223a357d2c7b226e616d65223a225261756e616b20416e696c2056617377616e69222c22626174736d616e5f6964223a22313132383337222c2272756e73223a2236222c2262616c6c73223a2239222c22686f775f6f7574223a226320262062204d6164686176204d616e6f6a222c2273636f72655f61745f6469736d697373616c223a37322c226f766572735f61745f6469736d697373616c223a2231342e36222c22626f776c65725f6964223a22313332383637222c226469736d697373616c223a22636175676874222c226e756d626572223a367d5d2c226c6173745f7769636b6574223a7b226e616d65223a225261756e616b20416e696c2056617377616e69222c22626174736d616e5f6964223a22313132383337222c2272756e73223a2236222c2262616c6c73223a2239222c22686f775f6f7574223a226320262062204d6164686176204d616e6f6a222c2273636f72655f61745f6469736d697373616c223a37322c226f766572735f61745f6469736d697373616c223a2231342e36222c22626f776c65725f6964223a22313332383637222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c2265787472615f72756e73223a7b2262796573223a302c226c656762796573223a302c227769646573223a332c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a337d2c226571756174696f6e73223a7b2272756e73223a37322c227769636b657473223a362c226f76657273223a223135222c22626f776c6572735f75736564223a362c2272756e72617465223a22342e3830227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a31342c2262616c6c73223a31342c226f76657273223a322e322c22626174736d656e223a5b7b226e616d65223a225261756e616b20416e696c2056617377616e69222c22626174736d616e5f6964223a3131323833372c2272756e73223a362c2262616c6c73223a397d2c7b226e616d65223a2241736877616e742056616c7468617061222c22626174736d616e5f6964223a3133323835382c2272756e73223a382c2262616c6c73223a357d5d7d2c226469645f6e6f745f626174223a5b7b22706c617965725f6964223a22313233363635222c226e616d65223a2256696b756d2042616e646172612053616e6a617961227d2c7b22706c617965725f6964223a22313133333231222c226e616d65223a225361696c6c6573204a61697368616e6b6172227d2c7b22706c617965725f6964223a22313038313435222c226e616d65223a224d7568616d6d616420417369662d4a72227d2c7b22706c617965725f6964223a22313237323635222c226e616d65223a224e65656c204865676465227d5d2c226d61785f6f766572223a223230222c22746172676574223a2230227d5d2c22706c6179657273223a5b7b22706964223a38343537382c227469746c65223a224d6f68616d6d6164204179617a222c2273686f72745f6e616d65223a224d6f68616d6d6164204179617a222c2266697273745f6e616d65223a224d6f68616d6d6164204179617a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938372d31302d3133222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a39333933362c227469746c65223a224661686164204e6177617a222c2273686f72745f6e616d65223a2246204e6177617a222c2266697273745f6e616d65223a224661686164204e6177617a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030302d30312d3135222c226269727468706c616365223a224475626169222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f66616861645f5f6e6177617a556165222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f66616861645f5f6e6177617a5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a2228574b29227d2c7b22706964223a39343138302c227469746c65223a22537965642048616964657220576173692053686168222c2273686f72745f6e616d65223a22537965642048616964657220576173692053686168222c2266697273745f6e616d65223a22537965642048616964657220576173692053686168222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030312d30342d3236222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a39343439352c227469746c65223a2243502052697a77616e222c2273686f72745f6e616d65223a2243502052697a77616e222c2266697273745f6e616d65223a2243502052697a77616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938382d30342d3139222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a224368756e64616e6761706f79696c2052697a77616e222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a39353735342c227469746c65223a225a61776172204661726964222c2273686f72745f6e616d65223a225a61776172204661726964222c2266697273745f6e616d65223a225a61776172204661726964222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3130313139342c227469746c65223a2248617a7261742042696c616c222c2273686f72745f6e616d65223a22482042696c616c222c2266697273745f6e616d65223a2248617a7261742042696c616c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3130343632302c227469746c65223a2241617279616e204d6164616e69222c2273686f72745f6e616d65223a2241204d6164616e69222c2266697273745f6e616d65223a2241617279616e204d6164616e69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3130343635392c227469746c65223a22416861616e204665726e616e646573222c2273686f72745f6e616d65223a2241204665726e616e646573222c2266697273745f6e616d65223a22416861616e204665726e616e646573222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3130363631332c227469746c65223a224e696b68696c205372696e69766173616e222c2273686f72745f6e616d65223a224e205372696e69766173616e222c2266697273745f6e616d65223a224e696b68696c205372696e69766173616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3130383134352c227469746c65223a224d7568616d6d616420417369662d4a72222c2273686f72745f6e616d65223a224d20417369662d4a72222c2266697273745f6e616d65223a224d7568616d6d616420417369662d4a72222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3131323739322c227469746c65223a22417279616e20536178656e61222c2273686f72745f6e616d65223a224120536178656e61222c2266697273745f6e616d65223a22417279616e20536178656e61222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3131323739372c227469746c65223a2244656570616b2052616a222c2273686f72745f6e616d65223a222052616a222c2266697273745f6e616d65223a2244656570616b2052616a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131323830382c227469746c65223a22416d6d617220426164616d69222c2273686f72745f6e616d65223a224120426164616d69222c2266697273745f6e616d65223a22416d6d617220426164616d69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3131323833372c227469746c65223a225261756e616b20416e696c2056617377616e69222c2273686f72745f6e616d65223a225220412056617377616e69222c2266697273745f6e616d65223a225261756e616b20416e696c2056617377616e69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3131333038372c227469746c65223a224d7568616d6d6164205a75686169622d5a7562616972222c2273686f72745f6e616d65223a224d5a205a7562616972222c2266697273745f6e616d65223a224d7568616d6d6164205a75686169622d5a7562616972222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030332d31322d3331222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131333332312c227469746c65223a225361696c6c6573204a61697368616e6b6172222c2273686f72745f6e616d65223a2253204a61697368616e6b6172222c2266697273745f6e616d65223a225361696c6c6573204a61697368616e6b6172222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030322d31312d3132222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3131333639372c227469746c65223a22416264756c6c61682049736d61696c222c2273686f72745f6e616d65223a22412049736d61696c222c2266697273745f6e616d65223a22416264756c6c61682049736d61696c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131343636362c227469746c65223a224d7568616d6d616420497266616e2d4949222c2273686f72745f6e616d65223a224d20497266616e2d4949222c2266697273745f6e616d65223a224d7568616d6d616420497266616e2d4949222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131373132352c227469746c65223a224b6172616e204468696d616e222c2273686f72745f6e616d65223a224b204468696d616e222c2266697273745f6e616d65223a224b6172616e204468696d616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3131393532302c227469746c65223a224164697468796120536865747479222c2273686f72745f6e616d65223a224164697468796120536865747479222c2266697273745f6e616d65223a224164697468796120536865747479222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3131393535342c227469746c65223a22526179616e204b68616e222c2273686f72745f6e616d65223a2252204b68616e222c2266697273745f6e616d65223a22526179616e204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3131393537322c227469746c65223a2253616d616c2055646177617468746861222c2273686f72745f6e616d65223a22532055646177617468746861222c2266697273745f6e616d65223a2253616d616c2055646177617468746861222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132303834382c227469746c65223a22486166697a20416c6d6173222c2273686f72745f6e616d65223a22486166697a20416c6d6173222c2266697273745f6e616d65223a22486166697a20416c6d6173222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132313934332c227469746c65223a224a756e616964205368616d73756464696e222c2273686f72745f6e616d65223a224a205368616d73756464696e222c2266697273745f6e616d65223a224a756e616964205368616d73756464696e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132333636352c227469746c65223a2256696b756d2042616e646172612053616e6a617961222c2273686f72745f6e616d65223a2256696b756d2042616e646172612053616e6a617961222c2266697273745f6e616d65223a2256696b756d2042616e646172612053616e6a617961222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a6e756c6c2c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132343234362c227469746c65223a224d6f6e6973682047616a6573776172616e222c2273686f72745f6e616d65223a224d2047616a6573776172616e222c2266697273745f6e616d65223a224d6f6e6973682047616a6573776172616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132353434322c227469746c65223a2259617368205361626e616e69222c2273686f72745f6e616d65223a2259205361626e616e69222c2266697273745f6e616d65223a2259617368205361626e616e69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3132353635392c227469746c65223a225961736972204b68616e222c2273686f72745f6e616d65223a225961736972204b68616e222c2266697273745f6e616d65223a225961736972204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a6e756c6c2c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132373235382c227469746c65223a224c6f766570726565742053696e67682042616a7761222c2273686f72745f6e616d65223a224c532042616a7761222c2266697273745f6e616d65223a224c6f766570726565742053696e67682042616a7761222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030322d31322d3035222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3132373236352c227469746c65223a224e65656c204865676465222c2273686f72745f6e616d65223a224e204865676465222c2266697273745f6e616d65223a224e65656c204865676465222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3132373332322c227469746c65223a2253616e6120556c2048617120426861747469222c2273686f72745f6e616d65223a225320556c204820426861747469222c2266697273745f6e616d65223a2253616e6120556c2048617120426861747469222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323739342c227469746c65223a224d6f68616d6d616420556d657220446f676572222c2273686f72745f6e616d65223a224d5520446f676572222c2266697273745f6e616d65223a224d6f68616d6d616420556d657220446f676572222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3133323835382c227469746c65223a2241736877616e742056616c7468617061222c2273686f72745f6e616d65223a22412056616c7468617061222c2266697273745f6e616d65223a2241736877616e742056616c7468617061222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030312d30362d3136222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a3133323835392c227469746c65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c2273686f72745f6e616d65223a224841204b68616e222c2266697273745f6e616d65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30322d3134222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323836302c227469746c65223a224d7568616d6d616420536861686461642d49222c2273686f72745f6e616d65223a224d20536861686461642d49222c2266697273745f6e616d65223a224d7568616d6d616420536861686461642d49222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030302d31322d3039222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323836372c227469746c65223a224d6164686176204d616e6f6a222c2273686f72745f6e616d65223a224d6164686176204d616e6f6a222c2266697273745f6e616d65223a224d6164686176204d616e6f6a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3133323836382c227469746c65223a22526979617a204b68616c6971222c2273686f72745f6e616d65223a2252204b68616c6971222c2266697273745f6e616d65223a22526979617a204b68616c6971222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d5d2c227072655f6d617463685f6f646473223a5b5d2c226461795f72656d61696e696e675f6f766572223a22222c226d617463685f6e6f746573223a5b5b2246756a616972616820696e6e696e672031222c2246756a61697261683a2035302072756e7320696e2031302e36206f766572732e222c2246756a616972616820656c656374656420746f20626174225d5d7d, '2023-10-27 14:50:02', '2023-10-27 14:50:02');
INSERT INTO `matchruns` (`id`, `matchkey`, `teams1`, `runs1`, `wickets1`, `overs1`, `teams2`, `overs2`, `runs2`, `wickets2`, `winning_status`, `matchdata`, `created_at`, `updated_at`) VALUES
(3, '46', 'SZN', '116', '7', '10', 'MGW', '10', '124', '6', 'MG Warriors won by 8 runs.', 0x7b226d617463685f6964223a37303736342c227469746c65223a225365617a656e204368616c6c656e67657273207673204d472057617272696f7273222c2273686f72745f7469746c65223a22535a4e207673204d4757222c227375627469746c65223a2246696e616c20222c226d617463685f6e756d626572223a223333222c22666f726d6174223a31372c22666f726d61745f737472223a22543130222c22737461747573223a322c227374617475735f737472223a22436f6d706c65746564222c227374617475735f6e6f7465223a224d472057617272696f727320776f6e20627920382072756e732e222c227665726966696564223a2266616c7365222c227072655f7371756164223a2274727565222c226f6464735f617661696c61626c65223a2266616c7365222c2267616d655f7374617465223a302c2267616d655f73746174655f737472223a2244656661756c74222c22636f6d7065746974696f6e223a7b22636964223a3132383136322c227469746c65223a224b434320543130204368616c6c656e676520437570222c2261626272223a224b434320543130204368616c6c656e676520437570222c2274797065223a22746f75726e616d656e74222c2263617465676f7279223a22646f6d6573746963222c226d617463685f666f726d6174223a22743130222c22736561736f6e223a2232303233222c22737461747573223a226c697665222c22646174657374617274223a22323032332d30392d3231222c2264617465656e64223a22323032332d31302d3237222c22636f756e747279223a226b77222c22746f74616c5f6d617463686573223a223333222c22746f74616c5f726f756e6473223a2232222c22746f74616c5f7465616d73223a223135227d2c227465616d61223a7b227465616d5f6964223a3132383039362c226e616d65223a225365617a656e204368616c6c656e67657273222c2273686f72745f6e616d65223a22535a4e222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30395c2f5365617a656e2d4368616c6c656e676572732e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30395c2f5365617a656e2d4368616c6c656e676572732e706e67222c2273636f7265735f66756c6c223a223131365c2f3720283130206f7629222c2273636f726573223a223131365c2f37222c226f76657273223a223130227d2c227465616d62223a7b227465616d5f6964223a3132373832392c226e616d65223a224d472057617272696f7273222c2273686f72745f6e616d65223a224d4757222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30365c2f52656374616e676c652d333334382d382e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30365c2f52656374616e676c652d333334382d382e706e67222c2273636f7265735f66756c6c223a223132345c2f3620283130206f7629222c2273636f726573223a223132345c2f36222c226f76657273223a223130227d2c22646174655f7374617274223a22323032332d31302d32372031353a30303a3030222c22646174655f656e64223a22323032332d31302d32382030313a30303a3030222c2274696d657374616d705f7374617274223a313639383431383830302c2274696d657374616d705f656e64223a313639383435343830302c22646174655f73746172745f697374223a22323032332d31302d32372032303a33303a3030222c22646174655f656e645f697374223a22323032332d31302d32382030363a33303a3030222c2276656e7565223a7b2276656e75655f6964223a2231323133333732222c226e616d65223a2253756c61696269796120437269636b65742047726f756e64222c226c6f636174696f6e223a224b7577616974222c22636f756e747279223a22556e69746564204172616220456d697261746573222c2274696d657a6f6e65223a22227d2c22756d7069726573223a22222c2272656665726565223a22222c226571756174696f6e223a22222c226c697665223a22222c22726573756c74223a224d475720776f6e20627920382072756e732e222c22726573756c745f74797065223a322c2277696e5f6d617267696e223a22382072756e732e222c2277696e6e696e675f7465616d5f6964223a3132373832392c22636f6d6d656e74617279223a312c227761676f6e223a302c226c61746573745f696e6e696e675f6e756d626572223a322c2270726573717561645f74696d65223a22323032332d31302d32372031313a32383a3135222c227665726966795f74696d65223a22222c226d617463685f646c735f6166666563746564223a2266616c7365222c226c6976655f696e6e696e675f6e756d626572223a22222c22746f7373223a7b2274657874223a224d472057617272696f727320656c656374656420746f20626174222c2277696e6e6572223a3132373832392c226465636973696f6e223a317d2c2263757272656e745f6f766572223a22222c2270726576696f75735f6f766572223a22222c226d616e5f6f665f7468655f6d61746368223a22222c226d616e5f6f665f7468655f736572696573223a22222c2269735f666f6c6c6f776f6e223a302c227465616d5f62617474696e675f6669727374223a22222c227465616d5f62617474696e675f7365636f6e64223a22222c226c6173745f666976655f6f76657273223a22222c22696e6e696e6773223a5b7b22696964223a3135323632322c226e756d626572223a312c226e616d65223a224d472057617272696f727320496e6e696e67222c2273686f72745f6e616d65223a224d475720496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a342c2262617474696e675f7465616d5f6964223a3132373832392c226669656c64696e675f7465616d5f6964223a3132383039362c2273636f726573223a223132345c2f36222c2273636f7265735f66756c6c223a223132345c2f3620283130206f7629222c22626174736d656e223a5b7b226e616d65223a224b68616c69642042757474222c22626174736d616e5f6964223a223537313530222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223336222c2262616c6c735f6661636564223a223135222c22666f757273223a2232222c227369786573223a2234222c2272756e30223a2235222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204e205072616b617368206220522052616a616e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223234302e3030222c22626f776c65725f6964223a22313332303931222c2266697273745f6669656c6465725f6964223a22313234353232222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224164697468204b756d61726120426f6c616e6461222c22626174736d616e5f6964223a22313234353334222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223139222c2262616c6c735f6661636564223a223130222c22666f757273223a2232222c227369786573223a2231222c2272756e30223a2232222c2272756e31223a2235222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632041204f726176616e616b756e64696c2062204d2048697368616d222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223139302e3030222c22626f776c65725f6964223a22313230323134222c2266697273745f6669656c6465725f6964223a22313239353038222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2241626964204d757368746171222c22626174736d616e5f6964223a223537313538222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a22222c2272756e73223a223137222c2262616c6c735f6661636564223a223130222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2235222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226320262062204d2048697368616d222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223137302e3030222c22626f776c65725f6964223a22313230323134222c2266697273745f6669656c6465725f6964223a22313230323134222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2246617268616e204d656572222c22626174736d616e5f6964223a22313233383530222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223136222c2262616c6c735f6661636564223a2238222c22666f757273223a2232222c227369786573223a2231222c2272756e30223a2233222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632048204d6f68616d6d656420622041204f726176616e616b756e64696c222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223230302e3030222c22626f776c65725f6964223a22313239353038222c2266697273745f6669656c6465725f6964223a22313230323232222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225961736972204964726565732042757474222c22626174736d616e5f6964223a22313332323533222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2236222c2262616c6c735f6661636564223a2237222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2234222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226320484b204e61697220622041204f726176616e616b756e64696c222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2238352e3731222c22626f776c65725f6964223a22313239353038222c2266697273745f6669656c6465725f6964223a22313332303930222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2248697368616d204d69727a61222c22626174736d616e5f6964223a223537313534222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22284329222c2272756e73223a2239222c2262616c6c735f6661636564223a2236222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2233222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a223135302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225369627461696e2052617a612053686168222c22626174736d616e5f6964223a223537313630222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2232222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2232222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22622041204f726176616e616b756e64696c222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a22313239353038222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2252616865656c204b68616e222c22626174736d616e5f6964223a223632343830222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2238222c2262616c6c735f6661636564223a2232222c22666f757273223a2230222c227369786573223a2231222c2272756e30223a2230222c2272756e31223a2230222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a223430302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a224e696368656c205072616b617368222c22626f776c65725f6964223a22313234353232222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223239222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231342e3530222c2272756e30223a2234222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a2248617269204b726973686e616e204e616972222c22626f776c65725f6964223a22313332303930222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223236222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2232222c2265636f6e223a2231332e3030222c2272756e30223a2233222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22526168756c2052616a616e222c22626f776c65725f6964223a22313332303931222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223239222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231342e3530222c2272756e30223a2231222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d6f68616d6d65642048697368616d222c22626f776c65725f6964223a22313230323134222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223135222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22372e3530222c2272756e30223a2234222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22416e6f6f70204f726176616e616b756e64696c222c22626f776c65725f6964223a22313239353038222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223232222c227769636b657473223a2233222c226e6f62616c6c73223a2230222c227769646573223a2232222c2265636f6e223a2231312e3030222c2272756e30223a2236222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a22313234353232222c226669656c6465725f6e616d65223a224e696368656c205072616b617368222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313239353038222c226669656c6465725f6e616d65223a22416e6f6f70204f726176616e616b756e64696c222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313230323134222c226669656c6465725f6e616d65223a224d6f68616d6d65642048697368616d222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313230323232222c226669656c6465725f6e616d65223a2248617368696d204d6f68616d6d6564222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313332303930222c226669656c6465725f6e616d65223a2248617269204b726973686e616e204e616972222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a5b5d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2230222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2230222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d7d2c22666f7773223a5b7b226e616d65223a224b68616c69642042757474222c22626174736d616e5f6964223a223537313530222c2272756e73223a223336222c2262616c6c73223a223135222c22686f775f6f7574223a2263204e205072616b617368206220522052616a616e222c2273636f72655f61745f6469736d697373616c223a34362c226f766572735f61745f6469736d697373616c223a22332e33222c22626f776c65725f6964223a22313332303931222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a224164697468204b756d61726120426f6c616e6461222c22626174736d616e5f6964223a22313234353334222c2272756e73223a223139222c2262616c6c73223a223130222c22686f775f6f7574223a22632041204f726176616e616b756e64696c2062204d2048697368616d222c2273636f72655f61745f6469736d697373616c223a36312c226f766572735f61745f6469736d697373616c223a22342e34222c22626f776c65725f6964223a22313230323134222c226469736d697373616c223a22636175676874222c226e756d626572223a327d2c7b226e616d65223a2241626964204d757368746171222c22626174736d616e5f6964223a223537313538222c2272756e73223a223137222c2262616c6c73223a223130222c22686f775f6f7574223a226320262062204d2048697368616d222c2273636f72655f61745f6469736d697373616c223a38382c226f766572735f61745f6469736d697373616c223a22362e35222c22626f776c65725f6964223a22313230323134222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a2246617268616e204d656572222c22626174736d616e5f6964223a22313233383530222c2272756e73223a223136222c2262616c6c73223a2238222c22686f775f6f7574223a22632048204d6f68616d6d656420622041204f726176616e616b756e64696c222c2273636f72655f61745f6469736d697373616c223a39392c226f766572735f61745f6469736d697373616c223a22372e33222c22626f776c65725f6964223a22313239353038222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a225961736972204964726565732042757474222c22626174736d616e5f6964223a22313332323533222c2272756e73223a2236222c2262616c6c73223a2237222c22686f775f6f7574223a226320484b204e61697220622041204f726176616e616b756e64696c222c2273636f72655f61745f6469736d697373616c223a3131362c226f766572735f61745f6469736d697373616c223a22392e32222c22626f776c65725f6964223a22313239353038222c226469736d697373616c223a22636175676874222c226e756d626572223a357d2c7b226e616d65223a225369627461696e2052617a612053686168222c22626174736d616e5f6964223a223537313630222c2272756e73223a2230222c2262616c6c73223a2232222c22686f775f6f7574223a22622041204f726176616e616b756e64696c222c2273636f72655f61745f6469736d697373616c223a3131362c226f766572735f61745f6469736d697373616c223a22392e34222c22626f776c65725f6964223a22313239353038222c226469736d697373616c223a22626f776c6564222c226e756d626572223a367d5d2c226c6173745f7769636b6574223a7b226e616d65223a225369627461696e2052617a612053686168222c22626174736d616e5f6964223a223537313630222c2272756e73223a2230222c2262616c6c73223a2232222c22686f775f6f7574223a22622041204f726176616e616b756e64696c222c2273636f72655f61745f6469736d697373616c223a3131362c226f766572735f61745f6469736d697373616c223a22392e34222c22626f776c65725f6964223a22313239353038222c226469736d697373616c223a22626f776c6564222c226e756d626572223a367d2c2265787472615f72756e73223a7b2262796573223a322c226c656762796573223a312c227769646573223a31302c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a31337d2c226571756174696f6e73223a7b2272756e73223a3132342c227769636b657473223a362c226f76657273223a223130222c22626f776c6572735f75736564223a352c2272756e72617465223a2231322e3430227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a382c2262616c6c73223a322c226f76657273223a302e322c22626174736d656e223a5b7b226e616d65223a2252616865656c204b68616e222c22626174736d616e5f6964223a36323438302c2272756e73223a382c2262616c6c73223a327d2c7b226e616d65223a2248697368616d204d69727a61222c22626174736d616e5f6964223a35373135342c2272756e73223a302c2262616c6c73223a307d5d7d2c226469645f6e6f745f626174223a5b7b22706c617965725f6964223a22313230313637222c226e616d65223a2254616e76656572204875737361696e227d2c7b22706c617965725f6964223a223935353639222c226e616d65223a224d6f68616d6d61642d416873616e227d2c7b22706c617965725f6964223a22313237373331222c226e616d65223a225461686972204162626173227d5d2c226d61785f6f766572223a223130222c22746172676574223a2230227d2c7b22696964223a3135323632342c226e756d626572223a322c226e616d65223a225365617a656e204368616c6c656e6765727320496e6e696e67222c2273686f72745f6e616d65223a22535a4e20496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a342c2262617474696e675f7465616d5f6964223a3132383039362c226669656c64696e675f7465616d5f6964223a3132373832392c2273636f726573223a223131365c2f37222c2273636f7265735f66756c6c223a223131365c2f3720283130206f7629222c22626174736d656e223a5b7b226e616d65223a22497266616e204b616c65656c222c22626174736d616e5f6964223a22313237363431222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2232222c2262616c6c735f6661636564223a2233222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22622054204162626173222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a2236362e3637222c22626f776c65725f6964223a22313237373331222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2248617368696d204d6f68616d6d6564222c22626174736d616e5f6964223a22313230323232222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a2230222c2262616c6c735f6661636564223a2231222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204b68616c6964204275747420622052616865656c204b68616e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a223632343830222c2266697273745f6669656c6465725f6964223a223537313530222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2253686166697220416c69222c22626174736d616e5f6964223a22313233383033222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2239222c2262616c6c735f6661636564223a2238222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a2235222c2272756e31223a2231222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632052616865656c204b68616e20622054204162626173222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223131322e3530222c22626f776c65725f6964223a22313237373331222c2266697273745f6669656c6465725f6964223a223632343830222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22416268696a6974682041736f6b616e222c22626174736d616e5f6964223a22313237363330222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223233222c2262616c6c735f6661636564223a223133222c22666f757273223a2232222c227369786573223a2232222c2272756e30223a2237222c2272756e31223a2231222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226320594920427574742062205369627461696e2052617a61222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223137362e3932222c22626f776c65725f6964223a223537313630222c2266697273745f6669656c6465725f6964223a22313332323533222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d6f68616d6d65642048697368616d222c22626174736d616e5f6964223a22313230323134222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223138222c2262616c6c735f6661636564223a2237222c22666f757273223a2232222c227369786573223a2231222c2272756e30223a2231222c2272756e31223a2232222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2262205369627461696e2052617a61222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a223235372e3134222c22626f776c65725f6964223a223537313630222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224e696368656c205072616b617368222c22626174736d616e5f6964223a22313234353232222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22284329222c2272756e73223a2235222c2262616c6c735f6661636564223a2237222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2233222c2272756e31223a2233222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632046617268616e204d6565722062205369627461696e2052617a61222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2237312e3433222c22626f776c65725f6964223a223537313630222c2266697273745f6669656c6465725f6964223a22313233383530222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22416e6f6f70204f726176616e616b756e64696c222c22626174736d616e5f6964223a22313239353038222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223431222c2262616c6c735f6661636564223a223138222c22666f757273223a2231222c227369786573223a2233222c2272756e30223a2231222c2272756e31223a2237222c2272756e32223a2236222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a223232372e3738222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2248617269204b726973686e616e204e616972222c22626174736d616e5f6964223a22313332303930222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2237222c2262616c6c735f6661636564223a2233222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2230222c2272756e31223a2231222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2272756e6f757420284d6f68616d6d616420416873616e205c2f205949204275747429222c226469736d697373616c223a2272756e6f7574222c22737472696b655f72617465223a223233332e3333222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22313332323533222c227365636f6e645f6669656c6465725f6964223a223935353639222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224173686f6b204e697468696e222c22626174736d616e5f6964223a22313332303837222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22776b222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2230222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2230222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a2252616865656c204b68616e222c22626f776c65725f6964223a223632343830222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223230222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231302e3030222c2272756e30223a2234222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a225461686972204162626173222c22626f776c65725f6964223a22313237373331222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223234222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2235222c2265636f6e223a2231322e3030222c2272756e30223a2237222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d2c7b226e616d65223a225369627461696e2052617a612053686168222c22626f776c65725f6964223a223537313630222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223135222c227769636b657473223a2233222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22372e3530222c2272756e30223a2236222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d6f68616d6d61642d416873616e222c22626f776c65725f6964223a223935353639222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223230222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231302e3030222c2272756e30223a2232222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224b68616c69642042757474222c22626f776c65725f6964223a223537313530222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2231222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223133222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231332e3030222c2272756e30223a2230222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a2246617268616e204d656572222c22626f776c65725f6964223a22313233383530222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2231222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223231222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2232312e3030222c2272756e30223a2230222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a223537313530222c226669656c6465725f6e616d65223a224b68616c69642042757474222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223632343830222c226669656c6465725f6e616d65223a2252616865656c204b68616e222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313332323533222c226669656c6465725f6e616d65223a225961736972204964726565732042757474222c2263617463686573223a312c2272756e6f75745f7468726f776572223a312c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313233383530222c226669656c6465725f6e616d65223a2246617268616e204d656572222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223935353639222c226669656c6465725f6e616d65223a224d6f68616d6d61642d416873616e222c2263617463686573223a302c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a312c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a5b5d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2230222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2230222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d7d2c22666f7773223a5b7b226e616d65223a2248617368696d204d6f68616d6d6564222c22626174736d616e5f6964223a22313230323232222c2272756e73223a2230222c2262616c6c73223a2231222c22686f775f6f7574223a2263204b68616c6964204275747420622052616865656c204b68616e222c2273636f72655f61745f6469736d697373616c223a312c226f766572735f61745f6469736d697373616c223a22302e32222c22626f776c65725f6964223a223632343830222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a22497266616e204b616c65656c222c22626174736d616e5f6964223a22313237363431222c2272756e73223a2232222c2262616c6c73223a2233222c22686f775f6f7574223a22622054204162626173222c2273636f72655f61745f6469736d697373616c223a382c226f766572735f61745f6469736d697373616c223a22312e31222c22626f776c65725f6964223a22313237373331222c226469736d697373616c223a22626f776c6564222c226e756d626572223a327d2c7b226e616d65223a2253686166697220416c69222c22626174736d616e5f6964223a22313233383033222c2272756e73223a2239222c2262616c6c73223a2238222c22686f775f6f7574223a22632052616865656c204b68616e20622054204162626173222c2273636f72655f61745f6469736d697373616c223a33322c226f766572735f61745f6469736d697373616c223a22332e32222c22626f776c65725f6964223a22313237373331222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a22416268696a6974682041736f6b616e222c22626174736d616e5f6964223a22313237363330222c2272756e73223a223233222c2262616c6c73223a223133222c22686f775f6f7574223a226320594920427574742062205369627461696e2052617a61222c2273636f72655f61745f6469736d697373616c223a35382c226f766572735f61745f6469736d697373616c223a22342e35222c22626f776c65725f6964223a223537313630222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a224d6f68616d6d65642048697368616d222c22626174736d616e5f6964223a22313230323134222c2272756e73223a223138222c2262616c6c73223a2237222c22686f775f6f7574223a2262205369627461696e2052617a61222c2273636f72655f61745f6469736d697373616c223a36372c226f766572735f61745f6469736d697373616c223a22362e31222c22626f776c65725f6964223a223537313630222c226469736d697373616c223a22626f776c6564222c226e756d626572223a357d2c7b226e616d65223a224e696368656c205072616b617368222c22626174736d616e5f6964223a22313234353232222c2272756e73223a2235222c2262616c6c73223a2237222c22686f775f6f7574223a22632046617268616e204d6565722062205369627461696e2052617a61222c2273636f72655f61745f6469736d697373616c223a37302c226f766572735f61745f6469736d697373616c223a22362e36222c22626f776c65725f6964223a223537313630222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c7b226e616d65223a2248617269204b726973686e616e204e616972222c22626174736d616e5f6964223a22313332303930222c2272756e73223a2237222c2262616c6c73223a2233222c22686f775f6f7574223a2272756e6f757420284d6f68616d6d616420416873616e205c2f205949204275747429222c2273636f72655f61745f6469736d697373616c223a3131332c226f766572735f61745f6469736d697373616c223a22392e34222c22626f776c65725f6964223a2230222c226469736d697373616c223a2272756e6f7574222c226e756d626572223a377d5d2c226c6173745f7769636b6574223a7b226e616d65223a2248617269204b726973686e616e204e616972222c22626174736d616e5f6964223a22313332303930222c2272756e73223a2237222c2262616c6c73223a2233222c22686f775f6f7574223a2272756e6f757420284d6f68616d6d616420416873616e205c2f205949204275747429222c2273636f72655f61745f6469736d697373616c223a3131332c226f766572735f61745f6469736d697373616c223a22392e34222c22626f776c65725f6964223a2230222c226469736d697373616c223a2272756e6f7574222c226e756d626572223a377d2c2265787472615f72756e73223a7b2262796573223a302c226c656762796573223a332c227769646573223a382c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a31317d2c226571756174696f6e73223a7b2272756e73223a3131362c227769636b657473223a372c226f76657273223a223130222c22626f776c6572735f75736564223a362c2272756e72617465223a2231312e3630227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a332c2262616c6c73223a322c226f76657273223a302e322c22626174736d656e223a5b7b226e616d65223a22416e6f6f70204f726176616e616b756e64696c222c22626174736d616e5f6964223a3132393530382c2272756e73223a332c2262616c6c73223a327d2c7b226e616d65223a224173686f6b204e697468696e222c22626174736d616e5f6964223a3133323038372c2272756e73223a302c2262616c6c73223a307d5d7d2c226469645f6e6f745f626174223a5b7b22706c617965725f6964223a22313332303934222c226e616d65223a224a696e65736820506f6e6e6979617468227d2c7b22706c617965725f6964223a22313332303931222c226e616d65223a22526168756c2052616a616e227d5d2c226d61785f6f766572223a223130222c22746172676574223a22313235227d5d2c22706c6179657273223a5b7b22706964223a35373135302c227469746c65223a224b68616c69642042757474222c2273686f72745f6e616d65223a224b68616c69642042757474222c2266697273745f6e616d65223a224b68616c69642042757474222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938322d31322d3131222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a35373135342c227469746c65223a2248697368616d204d69727a61222c2273686f72745f6e616d65223a2248697368616d204d69727a61222c2266697273745f6e616d65223a2248697368616d204d69727a61222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938302d30372d3033222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22284329227d2c7b22706964223a35373135382c227469746c65223a2241626964204d757368746171222c2273686f72745f6e616d65223a2241626964204d757368746171222c2266697273745f6e616d65223a2241626964204d757368746171222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938322d30372d3038222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22776b222c22726f6c655f737472223a22227d2c7b22706964223a35373136302c227469746c65223a225369627461696e2052617a612053686168222c2273686f72745f6e616d65223a225369627461696e2052617a61222c2266697273745f6e616d65223a225369627461696e2052617a612053686168222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938352d31302d3130222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a36323438302c227469746c65223a2252616865656c204b68616e222c2273686f72745f6e616d65223a2252616865656c204b68616e222c2266697273745f6e616d65223a2252616865656c204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313937392d30312d3031222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a39353536392c227469746c65223a224d6f68616d6d61642d416873616e222c2273686f72745f6e616d65223a224d6f68616d6d616420416873616e222c2266697273745f6e616d65223a224d6f68616d6d61642d416873616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938302d30372d3139222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132303133322c227469746c65223a224d61686d6f756420416264756c6c6168222c2273686f72745f6e616d65223a224d20416264756c6c6168222c2266697273745f6e616d65223a224d61686d6f756420416264756c6c6168222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132303136372c227469746c65223a2254616e76656572204875737361696e222c2273686f72745f6e616d65223a2254204875737361696e222c2266697273745f6e616d65223a2254616e76656572204875737361696e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226368222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22537769747a65726c616e64222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a3132303231342c227469746c65223a224d6f68616d6d65642048697368616d222c2273686f72745f6e616d65223a224d2048697368616d222c2266697273745f6e616d65223a224d6f68616d6d65642048697368616d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132303232322c227469746c65223a2248617368696d204d6f68616d6d6564222c2273686f72745f6e616d65223a2248204d6f68616d6d6564222c2266697273745f6e616d65223a2248617368696d204d6f68616d6d6564222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a3132333830332c227469746c65223a2253686166697220416c69222c2273686f72745f6e616d65223a2253686166697220416c69222c2266697273745f6e616d65223a2253686166697220416c69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3132333835302c227469746c65223a2246617268616e204d656572222c2273686f72745f6e616d65223a2246617268616e204d656572222c2266697273745f6e616d65223a2246617268616e204d656572222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3132343532322c227469746c65223a224e696368656c205072616b617368222c2273686f72745f6e616d65223a224e205072616b617368222c2266697273745f6e616d65223a224e696368656c205072616b617368222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224e696368656c205072616b617368222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22284329227d2c7b22706964223a3132343533342c227469746c65223a224164697468204b756d61726120426f6c616e6461222c2273686f72745f6e616d65223a22414b20426f6c616e6461222c2266697273745f6e616d65223a224164697468204b756d61726120426f6c616e6461222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a224164697468204b756d61726120426f6c616e6461222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132353135352c227469746c65223a2246616973616c204e6177617a222c2273686f72745f6e616d65223a2246204e6177617a222c2266697273745f6e616d65223a2246616973616c204e6177617a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132363734312c227469746c65223a224173696d2047756c6c222c2273686f72745f6e616d65223a22412047756c6c222c2266697273745f6e616d65223a224173696d2047756c6c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132373633302c227469746c65223a22416268696a6974682041736f6b616e222c2273686f72745f6e616d65223a22412041736f6b616e222c2266697273745f6e616d65223a22416268696a6974682041736f6b616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3132373634312c227469746c65223a22497266616e204b616c65656c222c2273686f72745f6e616d65223a2249204b616c65656c222c2266697273745f6e616d65223a22497266616e204b616c65656c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3132373732342c227469746c65223a225a616865657220416e6a756d20446172222c2273686f72745f6e616d65223a225a204120446172222c2266697273745f6e616d65223a225a616865657220416e6a756d20446172222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132373732352c227469746c65223a2253616d69205572205265686d616e222c2273686f72745f6e616d65223a22532055205265686d616e222c2266697273745f6e616d65223a2253616d69205572205265686d616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132373732392c227469746c65223a2253616966756c6c6168205261666971222c2273686f72745f6e616d65223a225320205261666971222c2266697273745f6e616d65223a2253616966756c6c6168205261666971222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132373733312c227469746c65223a225461686972204162626173222c2273686f72745f6e616d65223a2254204162626173222c2266697273745f6e616d65223a225461686972204162626173222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3132373733322c227469746c65223a22416e73617220416c69205265686d6174222c2273686f72745f6e616d65223a22412041205265686d6174222c2266697273745f6e616d65223a22416e73617220416c69205265686d6174222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132393530382c227469746c65223a22416e6f6f70204f726176616e616b756e64696c222c2273686f72745f6e616d65223a2241204f726176616e616b756e64696c222c2266697273745f6e616d65223a22416e6f6f70204f726176616e616b756e64696c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132393534332c227469746c65223a2253696a75204d6174686577222c2273686f72745f6e616d65223a2253204d6174686577222c2266697273745f6e616d65223a2253696a75204d6174686577222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132393535342c227469746c65223a224d7572616c69204b726973686e616e222c2273686f72745f6e616d65223a224d204b726973686e616e222c2266697273745f6e616d65223a224d7572616c69204b726973686e616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132393536362c227469746c65223a224a6f6279204a6f7365222c2273686f72745f6e616d65223a224a204a6f7365222c2266697273745f6e616d65223a224a6f6279204a6f7365222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323038372c227469746c65223a224173686f6b204e697468696e222c2273686f72745f6e616d65223a2241204e697468696e222c2266697273745f6e616d65223a224173686f6b204e697468696e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22776b222c22726f6c655f737472223a22227d2c7b22706964223a3133323038382c227469746c65223a225368696a75204a6f7365222c2273686f72745f6e616d65223a2253204a6f7365222c2266697273745f6e616d65223a225368696a75204a6f7365222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323038392c227469746c65223a22416d616c205468616e6b616368616e222c2273686f72745f6e616d65223a2241205468616e6b616368616e222c2266697273745f6e616d65223a22416d616c205468616e6b616368616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323039302c227469746c65223a2248617269204b726973686e616e204e616972222c2273686f72745f6e616d65223a22484b204e616972222c2266697273745f6e616d65223a2248617269204b726973686e616e204e616972222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3133323039312c227469746c65223a22526168756c2052616a616e222c2273686f72745f6e616d65223a22522052616a616e222c2266697273745f6e616d65223a22526168756c2052616a616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3133323039322c227469746c65223a224d6f68616d6d65642041666c616c222c2273686f72745f6e616d65223a224d2041666c616c222c2266697273745f6e616d65223a224d6f68616d6d65642041666c616c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323039332c227469746c65223a22526f62696e20506c617468616e617468222c2273686f72745f6e616d65223a225220506c617468616e617468222c2266697273745f6e616d65223a22526f62696e20506c617468616e617468222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323039342c227469746c65223a224a696e65736820506f6e6e6979617468222c2273686f72745f6e616d65223a224a20506f6e6e6979617468222c2266697273745f6e616d65223a224a696e65736820506f6e6e6979617468222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3133323039352c227469746c65223a224d696468756e205468656b6b656b617261222c2273686f72745f6e616d65223a224d205468656b6b656b617261222c2266697273745f6e616d65223a224d696468756e205468656b6b656b617261222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323235332c227469746c65223a225961736972204964726565732042757474222c2273686f72745f6e616d65223a2259492042757474222c2266697273745f6e616d65223a225961736972204964726565732042757474222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3133323731382c227469746c65223a224e6164696d20416b72616d222c2273686f72745f6e616d65223a224e20416b72616d222c2266697273745f6e616d65223a224e6164696d20416b72616d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939372d30372d3032222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d5d2c227072655f6d617463685f6f646473223a5b5d2c226461795f72656d61696e696e675f6f766572223a22222c226d617463685f6e6f746573223a5b5b224d472057617272696f727320696e6e696e672031222c224d472057617272696f72733a2035302072756e7320696e20332e35206f766572732e222c224d472057617272696f72733a203130302072756e7320696e20382e31206f766572732e222c22496e6e696e677320427265616b3a204d472057617272696f7273202d203132345c2f36206f76657273203130202862616c6c73203630292e225d2c5b225365617a656e204368616c6c656e6765727320696e6e696e672032222c225365617a656e204368616c6c656e676572733a2035302072756e7320696e20342e31206f766572732e222c225365617a656e204368616c6c656e676572733a203130302072756e7320696e20382e36206f766572732e222c224d472057617272696f727320776f6e20627920382072756e732e225d5d7d, '2023-10-27 17:15:05', '2023-10-27 17:15:05');
INSERT INTO `matchruns` (`id`, `matchkey`, `teams1`, `runs1`, `wickets1`, `overs1`, `teams2`, `overs2`, `runs2`, `wickets2`, `winning_status`, `matchdata`, `created_at`, `updated_at`) VALUES
(4, '47', 'ZGS', '95', '7', '19.3', 'CSG', '18', '92', '10', 'Z Games Strikers won by 3 wickets', 0x7b226d617463685f6964223a37303733372c227469746c65223a225a2047616d657320537472696b657273207673204353532047726f7570222c2273686f72745f7469746c65223a225a475320767320435347222c227375627469746c65223a224d61746368203136222c226d617463685f6e756d626572223a223136222c22666f726d6174223a362c22666f726d61745f737472223a22543230222c22737461747573223a322c227374617475735f737472223a22436f6d706c65746564222c227374617475735f6e6f7465223a225a2047616d657320537472696b65727320776f6e2062792033207769636b657473222c227665726966696564223a2266616c7365222c227072655f7371756164223a2274727565222c226f6464735f617661696c61626c65223a2266616c7365222c2267616d655f7374617465223a302c2267616d655f73746174655f737472223a2244656661756c74222c22636f6d7065746974696f6e223a7b22636964223a3132383330342c227469746c65223a224342465320542d3230204c6561677565222c2261626272223a224342465320542d3230222c2274797065223a22746f75726e616d656e74222c2263617465676f7279223a22646f6d6573746963222c226d617463685f666f726d6174223a22743230222c22736561736f6e223a2232303233222c22737461747573223a226c697665222c22646174657374617274223a22323032332d31302d3038222c2264617465656e64223a22323032332d31312d3033222c22636f756e747279223a226165222c22746f74616c5f6d617463686573223a223232222c22746f74616c5f726f756e6473223a2232222c22746f74616c5f7465616d73223a223131227d2c227465616d61223a7b227465616d5f6964223a3132363638302c226e616d65223a225a2047616d657320537472696b657273222c2273686f72745f6e616d65223a225a4753222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f5c2f323032325c2f31305c2f424b2d4352314032782e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f5c2f323032325c2f31305c2f424b2d4352314032782e706e67222c2273636f7265735f66756c6c223a2239355c2f37202831392e33206f7629222c2273636f726573223a2239355c2f37222c226f76657273223a2231392e33227d2c227465616d62223a7b227465616d5f6964223a3132373636322c226e616d65223a224353532047726f7570222c2273686f72745f6e616d65223a22435347222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30365c2f52656374616e676c652d333334382d323032332d30362d3036543135353833332e3535372e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30365c2f52656374616e676c652d333334382d323032332d30362d3036543135353833332e3535372e706e67222c2273636f7265735f66756c6c223a2239325c2f313020283138206f7629222c2273636f726573223a2239325c2f3130222c226f76657273223a223138227d2c22646174655f7374617274223a22323032332d31302d32372031363a34353a3030222c22646174655f656e64223a22323032332d31302d32382030323a34353a3030222c2274696d657374616d705f7374617274223a313639383432353130302c2274696d657374616d705f656e64223a313639383436313130302c22646174655f73746172745f697374223a22323032332d31302d32372032323a31353a3030222c22646174655f656e645f697374223a22323032332d31302d32382030383a31353a3030222c2276656e7565223a7b2276656e75655f6964223a223938222c226e616d65223a22536861726a616820437269636b6574205374616469756d222c226c6f636174696f6e223a22536861726a6168222c22636f756e747279223a22556e69746564204172616220456d697261746573222c2274696d657a6f6e65223a22227d2c22756d7069726573223a22222c2272656665726565223a22222c226571756174696f6e223a22222c226c697665223a22222c22726573756c74223a225a475320776f6e2062792033207769636b657473222c22726573756c745f74797065223a312c2277696e5f6d617267696e223a2233207769636b657473222c2277696e6e696e675f7465616d5f6964223a3132363638302c22636f6d6d656e74617279223a312c227761676f6e223a302c226c61746573745f696e6e696e675f6e756d626572223a322c2270726573717561645f74696d65223a22323032332d31302d32342031323a34343a3233222c227665726966795f74696d65223a22222c226d617463685f646c735f6166666563746564223a2266616c7365222c226c6976655f696e6e696e675f6e756d626572223a22222c22746f7373223a7b2274657874223a224353532047726f757020656c656374656420746f20626174222c2277696e6e6572223a3132373636322c226465636973696f6e223a317d2c2263757272656e745f6f766572223a22222c2270726576696f75735f6f766572223a22222c226d616e5f6f665f7468655f6d61746368223a22222c226d616e5f6f665f7468655f736572696573223a22222c2269735f666f6c6c6f776f6e223a302c227465616d5f62617474696e675f6669727374223a22222c227465616d5f62617474696e675f7365636f6e64223a22222c226c6173745f666976655f6f76657273223a22222c22696e6e696e6773223a5b7b22696964223a3135323632352c226e756d626572223a312c226e616d65223a224353532047726f757020496e6e696e67222c2273686f72745f6e616d65223a2243534720496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a312c2262617474696e675f7465616d5f6964223a3132373636322c226669656c64696e675f7465616d5f6964223a3132363638302c2273636f726573223a2239325c2f3130222c2273636f7265735f66756c6c223a2239325c2f313020283138206f7629222c22626174736d656e223a5b7b226e616d65223a225a6f686169622d4b68616e222c22626174736d616e5f6964223a22313234383737222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2237222c2262616c6c735f6661636564223a2235222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2232222c2272756e31223a2231222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226c6277206220442051757265736869222c226469736d697373616c223a226c6277222c22737472696b655f72617465223a223134302e3030222c22626f776c65725f6964223a22313036363236222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224162686972616d20487269746877696b222c22626174736d616e5f6964223a22313135363435222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22284329222c2272756e73223a223135222c2262616c6c735f6661636564223a223135222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2233222c2272756e31223a223131222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204841204b68616e2062204d20417a686172222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223130302e3030222c22626f776c65725f6964223a22313136333832222c2266697273745f6669656c6465725f6964223a22313332383539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2252656e6a697468204d616e69222c22626174736d616e5f6964223a22313132373936222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223134222c2262616c6c735f6661636564223a2238222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a2232222c2272756e31223a2232222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632049204b68617474616b206220442051757265736869222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223137352e3030222c22626f776c65725f6964223a22313036363236222c2266697273745f6669656c6465725f6964223a22313232333035222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22416c62696e20416c696173222c22626174736d616e5f6964223a22313035373433222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2234222c2262616c6c735f6661636564223a2236222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2235222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226320412053616c65656d206220442051757265736869222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2236362e3637222c22626f776c65725f6964223a22313036363236222c2266697273745f6669656c6465725f6964223a22313231313236222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22566973686e752052616a222c22626174736d616e5f6964223a22313035373431222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2231222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204841204b68616e206220442051757265736869222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a22313036363236222c2266697273745f6669656c6465725f6964223a22313332383539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2250562056696d616c6e616468222c22626174736d616e5f6964223a22313234343133222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2238222c2262616c6c735f6661636564223a223131222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2236222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204620416c746166206220442051757265736869222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2237322e3733222c22626f776c65725f6964223a22313036363236222c2266697273745f6669656c6465725f6964223a22313034363431222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2244616e6973682053617268616469222c22626174736d616e5f6964223a22313332373638222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a223132222c2262616c6c735f6661636564223a223234222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a223133222c2272756e31223a223130222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2262204d20417a686172222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a2235302e3030222c22626f776c65725f6964223a22313136333832222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224b616c6c69706172616d62696c20526f6a697468222c22626174736d616e5f6964223a22313035303533222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2237222c2262616c6c735f6661636564223a223134222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2238222c2272756e31223a2235222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204620416c746166206220422041204875737361696e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2235302e3030222c22626f776c65725f6964223a22313234303538222c2266697273745f6669656c6465725f6964223a22313034363431222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2241686d6564204661727a65656e222c22626174736d616e5f6964223a223933323436222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2236222c2262616c6c735f6661636564223a223130222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2234222c2272756e31223a2236222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a2236302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224e6970756e2042616275222c22626174736d616e5f6964223a22313235353330222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2238222c2262616c6c735f6661636564223a223130222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2234222c2272756e31223a2234222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226320412053616c65656d20622053204261687a6164222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2238302e3030222c22626f776c65725f6964223a22313134343833222c2266697273745f6669656c6465725f6964223a22313231313236222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224171756962204b68616e222c22626174736d616e5f6964223a223936353338222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2237222c2262616c6c735f6661636564223a2234222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2231222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204841204b68616e206220422041204875737361696e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223137352e3030222c22626f776c65725f6964223a22313234303538222c2266697273745f6669656c6465725f6964223a22313332383539222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a2244616e6973682051757265736869222c22626f776c65725f6964223a22313036363236222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223139222c227769636b657473223a2235222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22342e3735222c2272756e30223a223133222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2231227d2c7b226e616d65223a22497266616e204b68617474616b222c22626f776c65725f6964223a22313232333035222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223138222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2232222c2265636f6e223a22392e3030222c2272756e30223a2234222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d756265656e20416c69222c22626f776c65725f6964223a22313231323031222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2233222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223137222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22352e3637222c2272756e30223a2238222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d7568616d6d616420417a686172222c22626f776c65725f6964223a22313136333832222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223133222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22332e3235222c2272756e30223a223132222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d2c7b226e616d65223a2242616261722041676861204875737361696e222c22626f776c65725f6964223a22313234303538222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223230222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22352e3030222c2272756e30223a2239222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22536172646172204261687a6164222c22626f776c65725f6964223a22313134343833222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2231222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a2234222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22342e3030222c2272756e30223a2233222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a22313332383539222c226669656c6465725f6e616d65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c2263617463686573223a332c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313232333035222c226669656c6465725f6e616d65223a22497266616e204b68617474616b222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313231313236222c226669656c6465725f6e616d65223a22416264756c6c61682053616c65656d222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313034363431222c226669656c6465725f6e616d65223a2246616973616c20416c746166222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a5b5d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2230222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2230222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d7d2c22666f7773223a5b7b226e616d65223a225a6f686169622d4b68616e222c22626174736d616e5f6964223a22313234383737222c2272756e73223a2237222c2262616c6c73223a2235222c22686f775f6f7574223a226c6277206220442051757265736869222c2273636f72655f61745f6469736d697373616c223a382c226f766572735f61745f6469736d697373616c223a22302e36222c22626f776c65725f6964223a22313036363236222c226469736d697373616c223a226c6277222c226e756d626572223a317d2c7b226e616d65223a2252656e6a697468204d616e69222c22626174736d616e5f6964223a22313132373936222c2272756e73223a223134222c2262616c6c73223a2238222c22686f775f6f7574223a22632049204b68617474616b206220442051757265736869222c2273636f72655f61745f6469736d697373616c223a32342c226f766572735f61745f6469736d697373616c223a22322e35222c22626f776c65725f6964223a22313036363236222c226469736d697373616c223a22636175676874222c226e756d626572223a327d2c7b226e616d65223a22416c62696e20416c696173222c22626174736d616e5f6964223a22313035373433222c2272756e73223a2234222c2262616c6c73223a2236222c22686f775f6f7574223a226320412053616c65656d206220442051757265736869222c2273636f72655f61745f6469736d697373616c223a33342c226f766572735f61745f6469736d697373616c223a22342e32222c22626f776c65725f6964223a22313036363236222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a22566973686e752052616a222c22626174736d616e5f6964223a22313035373431222c2272756e73223a2230222c2262616c6c73223a2231222c22686f775f6f7574223a2263204841204b68616e206220442051757265736869222c2273636f72655f61745f6469736d697373616c223a33342c226f766572735f61745f6469736d697373616c223a22342e33222c22626f776c65725f6964223a22313036363236222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a2250562056696d616c6e616468222c22626174736d616e5f6964223a22313234343133222c2272756e73223a2238222c2262616c6c73223a223131222c22686f775f6f7574223a2263204620416c746166206220442051757265736869222c2273636f72655f61745f6469736d697373616c223a34392c226f766572735f61745f6469736d697373616c223a22362e35222c22626f776c65725f6964223a22313036363236222c226469736d697373616c223a22636175676874222c226e756d626572223a357d2c7b226e616d65223a224162686972616d20487269746877696b222c22626174736d616e5f6964223a22313135363435222c2272756e73223a223135222c2262616c6c73223a223135222c22686f775f6f7574223a2263204841204b68616e2062204d20417a686172222c2273636f72655f61745f6469736d697373616c223a35352c226f766572735f61745f6469736d697373616c223a22392e31222c22626f776c65725f6964223a22313136333832222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c7b226e616d65223a224b616c6c69706172616d62696c20526f6a697468222c22626174736d616e5f6964223a22313035303533222c2272756e73223a2237222c2262616c6c73223a223134222c22686f775f6f7574223a2263204620416c746166206220422041204875737361696e222c2273636f72655f61745f6469736d697373616c223a36392c226f766572735f61745f6469736d697373616c223a2231332e32222c22626f776c65725f6964223a22313234303538222c226469736d697373616c223a22636175676874222c226e756d626572223a377d2c7b226e616d65223a2244616e6973682053617268616469222c22626174736d616e5f6964223a22313332373638222c2272756e73223a223132222c2262616c6c73223a223234222c22686f775f6f7574223a2262204d20417a686172222c2273636f72655f61745f6469736d697373616c223a37332c226f766572735f61745f6469736d697373616c223a2231342e35222c22626f776c65725f6964223a22313136333832222c226469736d697373616c223a22626f776c6564222c226e756d626572223a387d2c7b226e616d65223a224e6970756e2042616275222c22626174736d616e5f6964223a22313235353330222c2272756e73223a2238222c2262616c6c73223a223130222c22686f775f6f7574223a226320412053616c65656d20622053204261687a6164222c2273636f72655f61745f6469736d697373616c223a38332c226f766572735f61745f6469736d697373616c223a2231362e36222c22626f776c65725f6964223a22313134343833222c226469736d697373616c223a22636175676874222c226e756d626572223a397d2c7b226e616d65223a224171756962204b68616e222c22626174736d616e5f6964223a223936353338222c2272756e73223a2237222c2262616c6c73223a2234222c22686f775f6f7574223a2263204841204b68616e206220422041204875737361696e222c2273636f72655f61745f6469736d697373616c223a39322c226f766572735f61745f6469736d697373616c223a2231372e36222c22626f776c65725f6964223a22313234303538222c226469736d697373616c223a22636175676874222c226e756d626572223a31307d5d2c226c6173745f7769636b6574223a7b226e616d65223a224171756962204b68616e222c22626174736d616e5f6964223a223936353338222c2272756e73223a2237222c2262616c6c73223a2234222c22686f775f6f7574223a2263204841204b68616e206220422041204875737361696e222c2273636f72655f61745f6469736d697373616c223a39322c226f766572735f61745f6469736d697373616c223a2231372e36222c22626f776c65725f6964223a22313234303538222c226469736d697373616c223a22636175676874222c226e756d626572223a31307d2c2265787472615f72756e73223a7b2262796573223a302c226c656762796573223a312c227769646573223a332c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a347d2c226571756174696f6e73223a7b2272756e73223a39322c227769636b657473223a31302c226f76657273223a223138222c22626f776c6572735f75736564223a362c2272756e72617465223a22352e3131227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a392c2262616c6c73223a362c226f76657273223a312c22626174736d656e223a5b7b226e616d65223a2241686d6564204661727a65656e222c22626174736d616e5f6964223a39333234362c2272756e73223a322c2262616c6c73223a327d2c7b226e616d65223a224171756962204b68616e222c22626174736d616e5f6964223a39363533382c2272756e73223a372c2262616c6c73223a347d5d7d2c226469645f6e6f745f626174223a5b5d2c226d61785f6f766572223a223230222c22746172676574223a2230227d2c7b22696964223a3135323632392c226e756d626572223a322c226e616d65223a225a2047616d657320537472696b65727320496e6e696e67222c2273686f72745f6e616d65223a225a475320496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a332c2262617474696e675f7465616d5f6964223a3132363638302c226669656c64696e675f7465616d5f6964223a3132373636322c2273636f726573223a2239355c2f37222c2273636f7265735f66756c6c223a2239355c2f37202831392e33206f7629222c22626174736d656e223a5b7b226e616d65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c22626174736d616e5f6964223a22313332383539222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2235222c2262616c6c735f6661636564223a2233222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2231222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204b20526f6a6974682062204171756962204b68616e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223136362e3637222c22626f776c65725f6964223a223936353338222c2266697273745f6669656c6465725f6964223a22313035303533222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22416264756c6c61682053616c65656d222c22626174736d616e5f6964223a22313231313236222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223135222c2262616c6c735f6661636564223a223132222c22666f757273223a2233222c227369786573223a2230222c2272756e30223a2237222c2272756e31223a2231222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204420536172686164692062204171756962204b68616e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223132352e3030222c22626f776c65725f6964223a223936353338222c2266697273745f6669656c6465725f6964223a22313332373638222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2242616261722041676861204875737361696e222c22626174736d616e5f6964223a22313234303538222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223239222c2262616c6c735f6661636564223a223236222c22666f757273223a2234222c227369786573223a2230222c2272756e30223a223132222c2272756e31223a2237222c2272756e32223a2233222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632050562056696d616c6e61646820622052204d616e69222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223131312e3534222c22626f776c65725f6964223a22313132373936222c2266697273745f6669656c6465725f6964223a22313234343133222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22536172646172204261687a6164222c22626174736d616e5f6964223a22313134343833222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a2234222c2262616c6c735f6661636564223a223134222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a223130222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22622052204d616e69222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a2232382e3537222c22626f776c65725f6964223a22313132373936222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2242696c616c20436865656d61222c22626174736d616e5f6964223a22313034363438222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a2238222c2262616c6c735f6661636564223a223234222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a223138222c2272756e31223a2234222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632044205361726861646920622050562056696d616c6e616468222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2233332e3333222c22626f776c65725f6964223a22313234343133222c2266697273745f6669656c6465725f6964223a22313332373638222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2244616e6973682051757265736869222c22626174736d616e5f6964223a22313036363236222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2232222c2262616c6c735f6661636564223a223131222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2239222c2272756e31223a2232222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2272756e6f75742028442053617268616469205c2f204120487269746877696b29222c226469736d697373616c223a2272756e6f7574222c22737472696b655f72617465223a2231382e3138222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22313135363435222c227365636f6e645f6669656c6465725f6964223a22313332373638222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2246616973616c20416c746166222c22626174736d616e5f6964223a22313034363431222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a223133222c2262616c6c735f6661636564223a2238222c22666f757273223a2230222c227369786573223a2232222c2272756e30223a2235222c2272756e31223a2231222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632050562056696d616c6e61646820622041204661727a65656e222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223136322e3530222c22626f776c65725f6964223a223933323436222c2266697273745f6669656c6465725f6964223a22313234343133222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d7568616d6d616420417a686172222c22626174736d616e5f6964223a22313136333832222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22284329222c2272756e73223a2235222c2262616c6c735f6661636564223a223130222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2237222c2272756e31223a2231222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a2235302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d7568616d6d61642041697a617a222c22626174736d616e5f6964223a22313231313234222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a2238222c2262616c6c735f6661636564223a2239222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2234222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a2238382e3839222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a224171756962204b68616e222c22626f776c65725f6964223a223936353338222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223138222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22342e3530222c2272756e30223a223135222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a2241686d6564204661727a65656e222c22626f776c65725f6964223a223933323436222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a22322e33222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223232222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22382e3830222c2272756e30223a2237222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224e6970756e2042616275222c22626f776c65725f6964223a22313235353330222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2232222c2272756e735f636f6e6365646564223a223135222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22332e3735222c2272756e30223a223137222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a2252656e6a697468204d616e69222c22626f776c65725f6964223a22313132373936222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2234222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223133222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22332e3235222c2272756e30223a223136222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d2c7b226e616d65223a2250562056696d616c6e616468222c22626f776c65725f6964223a22313234343133222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2234222c226d616964656e73223a2231222c2272756e735f636f6e6365646564223a223133222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22332e3235222c2272756e30223a223135222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22566973686e752052616a222c22626f776c65725f6964223a22313035373431222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2231222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a2239222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22392e3030222c2272756e30223a2233222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a22313035303533222c226669656c6465725f6e616d65223a224b616c6c69706172616d62696c20526f6a697468222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313332373638222c226669656c6465725f6e616d65223a2244616e6973682053617268616469222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a312c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313234343133222c226669656c6465725f6e616d65223a2250562056696d616c6e616468222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a22313135363435222c226669656c6465725f6e616d65223a224162686972616d20487269746877696b222c2263617463686573223a302c2272756e6f75745f7468726f776572223a312c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a5b5d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2230222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2230222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2230222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d7d2c22666f7773223a5b7b226e616d65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c22626174736d616e5f6964223a22313332383539222c2272756e73223a2235222c2262616c6c73223a2233222c22686f775f6f7574223a2263204b20526f6a6974682062204171756962204b68616e222c2273636f72655f61745f6469736d697373616c223a362c226f766572735f61745f6469736d697373616c223a22302e35222c22626f776c65725f6964223a223936353338222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a22416264756c6c61682053616c65656d222c22626174736d616e5f6964223a22313231313236222c2272756e73223a223135222c2262616c6c73223a223132222c22686f775f6f7574223a2263204420536172686164692062204171756962204b68616e222c2273636f72655f61745f6469736d697373616c223a32312c226f766572735f61745f6469736d697373616c223a22322e36222c22626f776c65725f6964223a223936353338222c226469736d697373616c223a22636175676874222c226e756d626572223a327d2c7b226e616d65223a22536172646172204261687a6164222c22626174736d616e5f6964223a22313134343833222c2272756e73223a2234222c2262616c6c73223a223134222c22686f775f6f7574223a22622052204d616e69222c2273636f72655f61745f6469736d697373616c223a35302c226f766572735f61745f6469736d697373616c223a22372e35222c22626f776c65725f6964223a22313132373936222c226469736d697373616c223a22626f776c6564222c226e756d626572223a337d2c7b226e616d65223a2242616261722041676861204875737361696e222c22626174736d616e5f6964223a22313234303538222c2272756e73223a223239222c2262616c6c73223a223236222c22686f775f6f7574223a22632050562056696d616c6e61646820622052204d616e69222c2273636f72655f61745f6469736d697373616c223a35372c226f766572735f61745f6469736d697373616c223a22392e32222c22626f776c65725f6964223a22313132373936222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a2244616e6973682051757265736869222c22626174736d616e5f6964223a22313036363236222c2272756e73223a2232222c2262616c6c73223a223131222c22686f775f6f7574223a2272756e6f75742028442053617268616469205c2f204120487269746877696b29222c2273636f72655f61745f6469736d697373616c223a36342c226f766572735f61745f6469736d697373616c223a2231322e36222c22626f776c65725f6964223a2230222c226469736d697373616c223a2272756e6f7574222c226e756d626572223a357d2c7b226e616d65223a2242696c616c20436865656d61222c22626174736d616e5f6964223a22313034363438222c2272756e73223a2238222c2262616c6c73223a223234222c22686f775f6f7574223a22632044205361726861646920622050562056696d616c6e616468222c2273636f72655f61745f6469736d697373616c223a37342c226f766572735f61745f6469736d697373616c223a2231352e35222c22626f776c65725f6964223a22313234343133222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c7b226e616d65223a2246616973616c20416c746166222c22626174736d616e5f6964223a22313034363431222c2272756e73223a223133222c2262616c6c73223a2238222c22686f775f6f7574223a22632050562056696d616c6e61646820622041204661727a65656e222c2273636f72655f61745f6469736d697373616c223a38332c226f766572735f61745f6469736d697373616c223a2231372e32222c22626f776c65725f6964223a223933323436222c226469736d697373616c223a22636175676874222c226e756d626572223a377d5d2c226c6173745f7769636b6574223a7b226e616d65223a2246616973616c20416c746166222c22626174736d616e5f6964223a22313034363431222c2272756e73223a223133222c2262616c6c73223a2238222c22686f775f6f7574223a22632050562056696d616c6e61646820622041204661727a65656e222c2273636f72655f61745f6469736d697373616c223a38332c226f766572735f61745f6469736d697373616c223a2231372e32222c22626f776c65725f6964223a223933323436222c226469736d697373616c223a22636175676874222c226e756d626572223a377d2c2265787472615f72756e73223a7b2262796573223a332c226c656762796573223a322c227769646573223a312c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a367d2c226571756174696f6e73223a7b2272756e73223a39352c227769636b657473223a372c226f76657273223a2231392e33222c22626f776c6572735f75736564223a362c2272756e72617465223a22342e3837227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a31322c2262616c6c73223a31332c226f76657273223a322e312c22626174736d656e223a5b7b226e616d65223a224d7568616d6d61642041697a617a222c22626174736d616e5f6964223a3132313132342c2272756e73223a382c2262616c6c73223a397d2c7b226e616d65223a224d7568616d6d616420417a686172222c22626174736d616e5f6964223a3131363338322c2272756e73223a332c2262616c6c73223a347d5d7d2c226469645f6e6f745f626174223a5b7b22706c617965725f6964223a22313231323031222c226e616d65223a224d756265656e20416c69227d2c7b22706c617965725f6964223a22313232333035222c226e616d65223a22497266616e204b68617474616b227d5d2c226d61785f6f766572223a223230222c22746172676574223a223933227d5d2c22706c6179657273223a5b7b22706964223a35333536302c227469746c65223a22536166656572205461726971222c2273686f72745f6e616d65223a22536166656572205461726971222c2266697273745f6e616d65223a22536166656572205461726971222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d31322d3035222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a38363639342c227469746c65223a2252616d65657a20536861687a6164222c2273686f72745f6e616d65223a225220536861687a6164222c2266697273745f6e616d65223a2252616d65657a20536861687a6164222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938372d31312d3330222c226269727468706c616365223a224c61686f72652c2050616b697374616e222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f72616d65657a736861687a61645f36222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f72616d65657a5f5f5f736861687a61645c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a39333234362c227469746c65223a2241686d6564204661727a65656e222c2273686f72745f6e616d65223a2241204661727a65656e222c2266697273745f6e616d65223a2241686d6564204661727a65656e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d30312d3130222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a39343137382c227469746c65223a22526f6e616b2050616e6f6c79222c2273686f72745f6e616d65223a2252532050616e6f6c79222c2266697273745f6e616d65223a22526f6e616b2050616e6f6c79222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030332d30312d3035222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a39363533382c227469746c65223a224171756962204b68616e222c2273686f72745f6e616d65223a224171756962204b68616e222c2266697273745f6e616d65223a224171756962204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030332d31322d3235222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3130343634312c227469746c65223a2246616973616c20416c746166222c2273686f72745f6e616d65223a224620416c746166222c2266697273745f6e616d65223a2246616973616c20416c746166222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030312d30332d3135222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3130343634382c227469746c65223a2242696c616c20436865656d61222c2273686f72745f6e616d65223a224220436865656d61222c2266697273745f6e616d65223a2242696c616c20436865656d61222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a3130343635322c227469746c65223a224e696c616e7368204b657377616e69222c2273686f72745f6e616d65223a224e204b657377616e69222c2266697273745f6e616d65223a224e696c616e7368204b657377616e69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030332d30382d3038222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6e696c616e73686b657377616e697561655c2f222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3130343635392c227469746c65223a22416861616e204665726e616e646573222c2273686f72745f6e616d65223a2241204665726e616e646573222c2266697273745f6e616d65223a22416861616e204665726e616e646573222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3130353035332c227469746c65223a224b616c6c69706172616d62696c20526f6a697468222c2273686f72745f6e616d65223a224b20526f6a697468222c2266697273745f6e616d65223a224b616c6c69706172616d62696c20526f6a697468222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3130353734312c227469746c65223a22566973686e752052616a222c2273686f72745f6e616d65223a22562052616a222c2266697273745f6e616d65223a22566973686e752052616a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3130353734332c227469746c65223a22416c62696e20416c696173222c2273686f72745f6e616d65223a224120416c696173222c2266697273745f6e616d65223a22416c62696e20416c696173222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3130363631302c227469746c65223a224d7568616d6d65642049736d61696c222c2273686f72745f6e616d65223a224d2049736d61696c222c2266697273745f6e616d65223a224d7568616d6d65642049736d61696c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3130363632362c227469746c65223a2244616e6973682051757265736869222c2273686f72745f6e616d65223a22442051757265736869222c2266697273745f6e616d65223a2244616e6973682051757265736869222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3131323739362c227469746c65223a2252656e6a697468204d616e69222c2273686f72745f6e616d65223a2252204d616e69222c2266697273745f6e616d65223a2252656e6a697468204d616e69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3131323739392c227469746c65223a225a61696e756c6c6168222c2273686f72745f6e616d65223a225a205a61696e222c2266697273745f6e616d65223a225a61696e756c6c6168222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030342d30312d3035222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131333430322c227469746c65223a225368616872756b6820416d696e222c2273686f72745f6e616d65223a225320416d696e222c2266697273745f6e616d65223a225368616872756b6820416d696e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131333430332c227469746c65223a224e61646972204875737361696e222c2273686f72745f6e616d65223a224e204875737361696e222c2266697273745f6e616d65223a224e61646972204875737361696e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131343434372c227469746c65223a225461696d6f6f7220426861747469222c2273686f72745f6e616d65223a225420426861747469222c2266697273745f6e616d65223a225461696d6f6f7220426861747469222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3131343438332c227469746c65223a22536172646172204261687a6164222c2273686f72745f6e616d65223a2253204261687a6164222c2266697273745f6e616d65223a22536172646172204261687a6164222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a3131353634352c227469746c65223a224162686972616d20487269746877696b222c2273686f72745f6e616d65223a224120487269746877696b222c2266697273745f6e616d65223a224162686972616d20487269746877696b222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626174222c22726f6c655f737472223a22284329227d2c7b22706964223a3131363338322c227469746c65223a224d7568616d6d616420417a686172222c2273686f72745f6e616d65223a224d20417a686172222c2266697273745f6e616d65223a224d7568616d6d616420417a686172222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22284329227d2c7b22706964223a3132313132342c227469746c65223a224d7568616d6d61642041697a617a222c2273686f72745f6e616d65223a224d2041697a617a222c2266697273745f6e616d65223a224d7568616d6d61642041697a617a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132313132362c227469746c65223a22416264756c6c61682053616c65656d222c2273686f72745f6e616d65223a22412053616c65656d222c2266697273745f6e616d65223a22416264756c6c61682053616c65656d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132313230312c227469746c65223a224d756265656e20416c69222c2273686f72745f6e616d65223a224d756265656e20416c69222c2266697273745f6e616d65223a224d756265656e20416c69222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3132323330352c227469746c65223a22497266616e204b68617474616b222c2273686f72745f6e616d65223a2249204b68617474616b222c2266697273745f6e616d65223a22497266616e204b68617474616b222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3132343035382c227469746c65223a2242616261722041676861204875737361696e222c2273686f72745f6e616d65223a22422041204875737361696e222c2266697273745f6e616d65223a2242616261722041676861204875737361696e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132343430332c227469746c65223a2241717569622046617a616c222c2273686f72745f6e616d65223a22412046617a616c222c2266697273745f6e616d65223a2241717569622046617a616c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343430342c227469746c65223a224d6f68616d6d656420486166656566222c2273686f72745f6e616d65223a224d20486166656566222c2266697273745f6e616d65223a224d6f68616d6d656420486166656566222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a342e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343430362c227469746c65223a2252616e6a6974682048617269646173222c2273686f72745f6e616d65223a22522048617269646173222c2266697273745f6e616d65223a2252616e6a6974682048617269646173222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343430372c227469746c65223a224d6f68616d6d65642053686572617a222c2273686f72745f6e616d65223a224d2053686572617a222c2266697273745f6e616d65223a224d6f68616d6d65642053686572617a222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343431332c227469746c65223a2250562056696d616c6e616468222c2273686f72745f6e616d65223a2250562056696d616c6e616468222c2266697273745f6e616d65223a2250562056696d616c6e616468222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e74222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e7465726e6174696f6e616c222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132343431342c227469746c65223a224b726973686e61204b616c61222c2273686f72745f6e616d65223a224b204b616c61222c2266697273745f6e616d65223a224b726973686e61204b616c61222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343431352c227469746c65223a22476968616e2043686174687572616e6761222c2273686f72745f6e616d65223a22472043686174687572616e6761222c2266697273745f6e616d65223a22476968616e2043686174687572616e6761222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e74222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e7465726e6174696f6e616c222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343638392c227469746c65223a22417279616d616e20536861726d61222c2273686f72745f6e616d65223a22417279616d616e20536861726d61222c2266697273745f6e616d65223a22417279616d616e20536861726d61222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3132343837372c227469746c65223a225a6f686169622d4b68616e222c2273686f72745f6e616d65223a225a204b68616e222c2266697273745f6e616d65223a225a6f686169622d4b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939382d31302d3035222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a3132353533302c227469746c65223a224e6970756e2042616275222c2273686f72745f6e616d65223a224e2042616275222c2266697273745f6e616d65223a224e6970756e2042616275222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22696e222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22496e646961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3132373235382c227469746c65223a224c6f766570726565742053696e67682042616a7761222c2273686f72745f6e616d65223a224c532042616a7761222c2266697273745f6e616d65223a224c6f766570726565742053696e67682042616a7761222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22323030322d31322d3035222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323736382c227469746c65223a2244616e6973682053617268616469222c2273686f72745f6e616d65223a22442053617268616469222c2266697273745f6e616d65223a2244616e6973682053617268616469222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a3133323832302c227469746c65223a2241686d65722041726966222c2273686f72745f6e616d65223a22412041726966222c2266697273745f6e616d65223a2241686d65722041726966222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226165222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a22556e69746564204172616220456d697261746573222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323832312c227469746c65223a224179616d616e2041686d6564222c2273686f72745f6e616d65223a22412041686d6564222c2266697273745f6e616d65223a224179616d616e2041686d6564222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22222c226269727468706c616365223a22222c22636f756e747279223a226b77222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224b7577616974222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a3133323835392c227469746c65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c2273686f72745f6e616d65223a224841204b68616e222c2266697273745f6e616d65223a2248616d656564756c6c616820417a697a756c6c6168204b68616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30322d3134222c226269727468706c616365223a22222c22636f756e747279223a22706b222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a22222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a22222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a2250616b697374616e222c22726f6c65223a22626174222c22726f6c655f737472223a22227d5d2c227072655f6d617463685f6f646473223a5b5d2c226461795f72656d61696e696e675f6f766572223a22222c226d617463685f6e6f746573223a5b5b224353532047726f757020696e6e696e672031222c224353532047726f75703a2035302072756e7320696e20372e34206f766572732e222c22496e6e696e677320427265616b3a204353532047726f7570202d2039325c2f3130206f76657273203138202862616c6c7320313038292e225d2c5b225a2047616d657320537472696b65727320696e6e696e672032222c225a2047616d657320537472696b6572733a2035302072756e7320696e20382e34206f766572732e222c224d6174636820636f6d706c65746564225d5d7d, '2023-10-27 19:56:03', '2023-10-27 19:56:03');
INSERT INTO `matchruns` (`id`, `matchkey`, `teams1`, `runs1`, `wickets1`, `overs1`, `teams2`, `overs2`, `runs2`, `wickets2`, `winning_status`, `matchdata`, `created_at`, `updated_at`) VALUES
(5, '54', 'AUS', '388', '10', '49.2', 'NZ', '50', '383', '9', 'Australia won by 5 runs.', 0x7b226d617463685f6964223a36343438312c227469746c65223a224175737472616c6961207673204e6577205a65616c616e64222c2273686f72745f7469746c65223a22415553207673204e5a222c227375627469746c65223a2232377468204d61746368222c226d617463685f6e756d626572223a223237222c22666f726d6174223a312c22666f726d61745f737472223a224f4449222c22737461747573223a322c227374617475735f737472223a22436f6d706c65746564222c227374617475735f6e6f7465223a224175737472616c696120776f6e20627920352072756e732e222c227665726966696564223a2266616c7365222c227072655f7371756164223a2274727565222c226f6464735f617661696c61626c65223a2266616c7365222c2267616d655f7374617465223a302c2267616d655f73746174655f737472223a2244656661756c74222c22636f6d7065746974696f6e223a7b22636964223a3132373737322c227469746c65223a2249434320437269636b657420576f726c6420437570222c2261626272223a2249434320437269636b657420576f726c6420437570222c2274797065223a22746f75726e616d656e74222c2263617465676f7279223a22696e7465726e6174696f6e616c222c226d617463685f666f726d6174223a226f6469222c22736561736f6e223a2232303233222c22737461747573223a226c697665222c22646174657374617274223a22323032332d31302d3035222c2264617465656e64223a22323032332d31312d3139222c22636f756e747279223a22696e74222c22746f74616c5f6d617463686573223a223438222c22746f74616c5f726f756e6473223a2231222c22746f74616c5f7465616d73223a223130227d2c227465616d61223a7b227465616d5f6964223a352c226e616d65223a224175737472616c6961222c2273686f72745f6e616d65223a22415553222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f5c2f323032335c2f30315c2f4175737472616c69612d312e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f5c2f323032335c2f30315c2f4175737472616c69612d312e706e67222c2273636f7265735f66756c6c223a223338385c2f3130202834392e32206f7629222c2273636f726573223a223338385c2f3130222c226f76657273223a2234392e32227d2c227465616d62223a7b227465616d5f6964223a372c226e616d65223a224e6577205a65616c616e64222c2273686f72745f6e616d65223a224e5a222c226c6f676f5f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30355c2f4e65772d7a65616c616e642e706e67222c227468756d625f75726c223a2268747470733a5c2f5c2f696d616765732e656e7469747973706f72742e636f6d5c2f6173736574735c2f75706c6f6164735c2f323032335c2f30355c2f4e65772d7a65616c616e642e706e67222c2273636f7265735f66756c6c223a223338335c2f3920283530206f7629222c2273636f726573223a223338335c2f39222c226f76657273223a223530227d2c22646174655f7374617274223a22323032332d31302d32382030353a30303a3030222c22646174655f656e64223a22323032332d31302d32382032333a30303a3030222c2274696d657374616d705f7374617274223a313639383436393230302c2274696d657374616d705f656e64223a313639383533343030302c22646174655f73746172745f697374223a22323032332d31302d32382031303a33303a3030222c22646174655f656e645f697374223a22323032332d31302d32392030343a33303a3030222c2276656e7565223a7b2276656e75655f6964223a223239222c226e616d65223a2248696d616368616c205072616465736820437269636b6574204173736f63696174696f6e205374616469756d222c226c6f636174696f6e223a2244686172616d73616c61222c22636f756e747279223a22496e646961222c2274696d657a6f6e65223a22227d2c22756d7069726573223a224d617261697320457261736d7573202028536f75746820416672696361292c2053686172667564646f756c61202842616e676c6164657368292c204e6974696e204d656e6f6e2028496e6469612c20545629222c2272656665726565223a22416e647920507963726f667420285a696d626162776529222c226571756174696f6e223a22222c226c697665223a22222c22726573756c74223a2241555320776f6e20627920352072756e732e222c22726573756c745f74797065223a312c2277696e5f6d617267696e223a22352072756e732e222c2277696e6e696e675f7465616d5f6964223a352c22636f6d6d656e74617279223a312c227761676f6e223a312c226c61746573745f696e6e696e675f6e756d626572223a322c2270726573717561645f74696d65223a22323032332d31302d32342030363a31373a3430222c227665726966795f74696d65223a22222c226d617463685f646c735f6166666563746564223a2266616c7365222c226c6976655f696e6e696e675f6e756d626572223a22222c22746f7373223a7b2274657874223a224e6577205a65616c616e6420656c656374656420746f20626f776c222c2277696e6e6572223a372c226465636973696f6e223a327d2c2263757272656e745f6f766572223a22222c2270726576696f75735f6f766572223a22222c226d616e5f6f665f7468655f6d61746368223a22222c226d616e5f6f665f7468655f736572696573223a22222c2269735f666f6c6c6f776f6e223a302c227465616d5f62617474696e675f6669727374223a22222c227465616d5f62617474696e675f7365636f6e64223a22222c226c6173745f666976655f6f76657273223a22222c22696e6e696e6773223a5b7b22696964223a3135323634352c226e756d626572223a312c226e616d65223a224175737472616c696120496e6e696e67222c2273686f72745f6e616d65223a2241555320496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a312c2262617474696e675f7465616d5f6964223a352c226669656c64696e675f7465616d5f6964223a372c2273636f726573223a223338385c2f3130222c2273636f7265735f66756c6c223a223338385c2f3130202834392e32206f7629222c22626174736d656e223a5b7b226e616d65223a224461766964205761726e6572222c22626174736d616e5f6964223a223731222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223831222c2262616c6c735f6661636564223a223635222c22666f757273223a2235222c227369786573223a2236222c2272756e30223a223332222c2272756e31223a223139222c2272756e32223a2233222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263202620622047205068696c6c697073222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223132342e3632222c22626f776c65725f6964223a2231303832222c2266697273745f6669656c6465725f6964223a2231303832222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225472617669732048656164222c22626174736d616e5f6964223a223433343731222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a22313039222c2262616c6c735f6661636564223a223637222c22666f757273223a223130222c227369786573223a2237222c2272756e30223a223236222c2272756e31223a223231222c2272756e32223a2233222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22622047205068696c6c697073222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a223136322e3639222c22626f776c65725f6964223a2231303832222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d69746368656c6c204d61727368222c22626174736d616e5f6964223a223833222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223336222c2262616c6c735f6661636564223a223531222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a223233222c2272756e31223a223234222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2262204d2053616e746e6572222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a2237302e3539222c22626f776c65725f6964223a2231393233222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2253746576656e20536d697468222c22626174736d616e5f6964223a223737222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223138222c2262616c6c735f6661636564223a223137222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a2235222c2272756e31223a223130222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263205420426f756c7420622047205068696c6c697073222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223130352e3838222c22626f776c65725f6964223a2231303832222c2266697273745f6669656c6465725f6964223a223437222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d61726e7573204c61627573636861676e65222c22626174736d616e5f6964223a223533363031222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223138222c2262616c6c735f6661636564223a223236222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a223134222c2272756e31223a223130222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263205220526176696e6472612062204d2053616e746e6572222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2236392e3233222c22626f776c65725f6964223a2231393233222c2266697273745f6669656c6465725f6964223a2231303831222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22476c656e6e204d617877656c6c222c22626174736d616e5f6964223a223831222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223431222c2262616c6c735f6661636564223a223234222c22666f757273223a2235222c227369786573223a2232222c2272756e30223a223130222c2272756e31223a2235222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263205420426f756c742062204a204e65657368616d222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223137302e3833222c22626f776c65725f6964223a223331343330222c2266697273745f6669656c6465725f6964223a223437222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224a6f736820496e676c6973222c22626174736d616e5f6964223a223535383436222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29222c2272756e73223a223338222c2262616c6c735f6661636564223a223238222c22666f757273223a2234222c227369786573223a2231222c2272756e30223a2238222c2272756e31223a223134222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632047205068696c6c6970732062205420426f756c74222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223133352e3731222c22626f776c65725f6964223a223437222c2266697273745f6669656c6465725f6964223a2231303832222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225061742043756d6d696e73222c22626174736d616e5f6964223a22333838222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22284329222c2272756e73223a223337222c2262616c6c735f6661636564223a223134222c22666f757273223a2232222c227369786573223a2234222c2272756e30223a2234222c2272756e31223a2233222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a226c62772062205420426f756c74222c226469736d697373616c223a226c6277222c22737472696b655f72617465223a223236342e3239222c22626f776c65725f6964223a223437222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d69746368656c6c205374617263222c22626174736d616e5f6964223a223839222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2231222c2262616c6c735f6661636564223a2233222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2232222c2272756e31223a2231222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204a204e65657368616d2062204d2048656e7279222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2233332e3333222c22626f776c65725f6964223a22343836222c2266697273745f6669656c6465725f6964223a223331343330222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224164616d205a616d7061222c22626174736d616e5f6964223a2231393635222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2233222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2233222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2262205420426f756c74222c226469736d697373616c223a22626f776c6564222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a223437222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224a6f73682048617a6c65776f6f64222c22626174736d616e5f6964223a223931222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2230222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2230222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a224d6174742048656e7279222c22626f776c65725f6964223a22343836222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a22362e32222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223637222c227769636b657473223a2231222c226e6f62616c6c73223a2232222c227769646573223a2232222c2265636f6e223a2231302e3538222c2272756e30223a223231222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a225472656e7420426f756c74222c22626f776c65725f6964223a223437222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223737222c227769636b657473223a2233222c226e6f62616c6c73223a2230222c227769646573223a2233222c2265636f6e223a22372e3730222c2272756e30223a223235222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2231227d2c7b226e616d65223a224c6f636b6965204665726775736f6e222c22626f776c65725f6964223a223136363433222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2233222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223338222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231322e3637222c2272756e30223a2236222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d69746368656c6c2053616e746e6572222c22626f776c65725f6964223a2231393233222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223830222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22382e3030222c2272756e30223a223233222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d2c7b226e616d65223a22476c656e6e205068696c6c697073222c22626f776c65725f6964223a2231303832222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223337222c227769636b657473223a2233222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22332e3730222c2272756e30223a223330222c22626f776c6564636f756e74223a2231222c226c6277636f756e74223a2230227d2c7b226e616d65223a2252616368696e20526176696e647261222c22626f776c65725f6964223a2231303831222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2238222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223536222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22372e3030222c2272756e30223a223138222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224a696d6d79204e65657368616d222c22626f776c65725f6964223a223331343330222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223332222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a2231362e3030222c2272756e30223a2234222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a2231303832222c226669656c6465725f6e616d65223a22476c656e6e205068696c6c697073222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223437222c226669656c6465725f6e616d65223a225472656e7420426f756c74222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a2231303831222c226669656c6465725f6e616d65223a2252616368696e20526176696e647261222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223331343330222c226669656c6465725f6e616d65223a224a696d6d79204e65657368616d222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a7b227031223a7b2273746172746f766572223a22302e31222c22656e646f766572223a223130227d2c227032223a7b2273746172746f766572223a2231302e31222c22656e646f766572223a223430227d2c227033223a7b2273746172746f766572223a2234302e31222c22656e646f766572223a223530227d7d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2232222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2231222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2231227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2232222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2231222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2231227d7d2c22666f7773223a5b7b226e616d65223a224461766964205761726e6572222c22626174736d616e5f6964223a223731222c2272756e73223a223831222c2262616c6c73223a223635222c22686f775f6f7574223a2263202620622047205068696c6c697073222c2273636f72655f61745f6469736d697373616c223a3137352c226f766572735f61745f6469736d697373616c223a2231392e31222c22626f776c65725f6964223a2231303832222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a225472617669732048656164222c22626174736d616e5f6964223a223433343731222c2272756e73223a22313039222c2262616c6c73223a223637222c22686f775f6f7574223a22622047205068696c6c697073222c2273636f72655f61745f6469736d697373616c223a3230302c226f766572735f61745f6469736d697373616c223a2232332e32222c22626f776c65725f6964223a2231303832222c226469736d697373616c223a22626f776c6564222c226e756d626572223a327d2c7b226e616d65223a2253746576656e20536d697468222c22626174736d616e5f6964223a223737222c2272756e73223a223138222c2262616c6c73223a223137222c22686f775f6f7574223a2263205420426f756c7420622047205068696c6c697073222c2273636f72655f61745f6469736d697373616c223a3232382c226f766572735f61745f6469736d697373616c223a2232392e34222c22626f776c65725f6964223a2231303832222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a224d69746368656c6c204d61727368222c22626174736d616e5f6964223a223833222c2272756e73223a223336222c2262616c6c73223a223531222c22686f775f6f7574223a2262204d2053616e746e6572222c2273636f72655f61745f6469736d697373616c223a3236342c226f766572735f61745f6469736d697373616c223a2233362e33222c22626f776c65725f6964223a2231393233222c226469736d697373616c223a22626f776c6564222c226e756d626572223a347d2c7b226e616d65223a224d61726e7573204c61627573636861676e65222c22626174736d616e5f6964223a223533363031222c2272756e73223a223138222c2262616c6c73223a223236222c22686f775f6f7574223a2263205220526176696e6472612062204d2053616e746e6572222c2273636f72655f61745f6469736d697373616c223a3237342c226f766572735f61745f6469736d697373616c223a2233382e31222c22626f776c65725f6964223a2231393233222c226469736d697373616c223a22636175676874222c226e756d626572223a357d2c7b226e616d65223a22476c656e6e204d617877656c6c222c22626174736d616e5f6964223a223831222c2272756e73223a223431222c2262616c6c73223a223234222c22686f775f6f7574223a2263205420426f756c742062204a204e65657368616d222c2273636f72655f61745f6469736d697373616c223a3332352c226f766572735f61745f6469736d697373616c223a2234342e33222c22626f776c65725f6964223a223331343330222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c7b226e616d65223a224a6f736820496e676c6973222c22626174736d616e5f6964223a223535383436222c2272756e73223a223338222c2262616c6c73223a223238222c22686f775f6f7574223a22632047205068696c6c6970732062205420426f756c74222c2273636f72655f61745f6469736d697373616c223a3338372c226f766572735f61745f6469736d697373616c223a2234382e31222c22626f776c65725f6964223a223437222c226469736d697373616c223a22636175676874222c226e756d626572223a377d2c7b226e616d65223a225061742043756d6d696e73222c22626174736d616e5f6964223a22333838222c2272756e73223a223337222c2262616c6c73223a223134222c22686f775f6f7574223a226c62772062205420426f756c74222c2273636f72655f61745f6469736d697373616c223a3338382c226f766572735f61745f6469736d697373616c223a2234382e33222c22626f776c65725f6964223a223437222c226469736d697373616c223a226c6277222c226e756d626572223a387d2c7b226e616d65223a224164616d205a616d7061222c22626174736d616e5f6964223a2231393635222c2272756e73223a2230222c2262616c6c73223a2233222c22686f775f6f7574223a2262205420426f756c74222c2273636f72655f61745f6469736d697373616c223a3338382c226f766572735f61745f6469736d697373616c223a2234382e36222c22626f776c65725f6964223a223437222c226469736d697373616c223a22626f776c6564222c226e756d626572223a397d2c7b226e616d65223a224d69746368656c6c205374617263222c22626174736d616e5f6964223a223839222c2272756e73223a2231222c2262616c6c73223a2233222c22686f775f6f7574223a2263204a204e65657368616d2062204d2048656e7279222c2273636f72655f61745f6469736d697373616c223a3338382c226f766572735f61745f6469736d697373616c223a2234392e32222c22626f776c65725f6964223a22343836222c226469736d697373616c223a22636175676874222c226e756d626572223a31307d5d2c226c6173745f7769636b6574223a7b226e616d65223a224d69746368656c6c205374617263222c22626174736d616e5f6964223a223839222c2272756e73223a2231222c2262616c6c73223a2233222c22686f775f6f7574223a2263204a204e65657368616d2062204d2048656e7279222c2273636f72655f61745f6469736d697373616c223a3338382c226f766572735f61745f6469736d697373616c223a2234392e32222c22626f776c65725f6964223a22343836222c226469736d697373616c223a22636175676874222c226e756d626572223a31307d2c2265787472615f72756e73223a7b2262796573223a312c226c656762796573223a302c227769646573223a362c226e6f62616c6c73223a322c2270656e616c7479223a2230222c22746f74616c223a397d2c226571756174696f6e73223a7b2272756e73223a3338382c227769636b657473223a31302c226f76657273223a2234392e32222c22626f776c6572735f75736564223a372c2272756e72617465223a22372e3836227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a302c2262616c6c73223a322c226f76657273223a302e322c22626174736d656e223a5b7b226e616d65223a224d69746368656c6c205374617263222c22626174736d616e5f6964223a38392c2272756e73223a302c2262616c6c73223a327d2c7b226e616d65223a224a6f73682048617a6c65776f6f64222c22626174736d616e5f6964223a39312c2272756e73223a302c2262616c6c73223a307d5d7d2c226469645f6e6f745f626174223a5b5d2c226d61785f6f766572223a223530222c22746172676574223a2230227d2c7b22696964223a3135323639362c226e756d626572223a322c226e616d65223a224e6577205a65616c616e6420496e6e696e67222c2273686f72745f6e616d65223a224e5a20496e6e696e67222c22737461747573223a322c22697373757065726f766572223a2266616c7365222c22726573756c74223a342c2262617474696e675f7465616d5f6964223a372c226669656c64696e675f7465616d5f6964223a352c2273636f726573223a223338335c2f39222c2273636f7265735f66756c6c223a223338335c2f3920283530206f7629222c22626174736d656e223a5b7b226e616d65223a224465766f6e20436f6e776179222c22626174736d616e5f6964223a223436313431222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a22222c2272756e73223a223238222c2262616c6c735f6661636564223a223137222c22666f757273223a2236222c227369786573223a2230222c2272756e30223a2237222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204d2053746172632062204a2048617a6c65776f6f64222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223136342e3731222c22626f776c65725f6964223a223931222c2266697273745f6669656c6465725f6964223a223839222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2257696c6c20596f756e67222c22626174736d616e5f6964223a223136363039222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223332222c2262616c6c735f6661636564223a223337222c22666f757273223a2234222c227369786573223a2231222c2272756e30223a223232222c2272756e31223a223130222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204d2053746172632062204a2048617a6c65776f6f64222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2238362e3439222c22626f776c65725f6964223a223931222c2266697273745f6669656c6465725f6964223a223839222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a2252616368696e20526176696e647261222c22626174736d616e5f6964223a2231303831222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a22313136222c2262616c6c735f6661636564223a223839222c22666f757273223a2239222c227369786573223a2235222c2272756e30223a223239222c2272756e31223a223432222c2272756e32223a2234222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204d204c61627573636861676e65206220502043756d6d696e73222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223133302e3334222c22626f776c65725f6964223a22333838222c2266697273745f6669656c6465725f6964223a223533363031222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22446172796c204d69746368656c6c222c22626174736d616e5f6964223a223136353039222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223534222c2262616c6c735f6661636564223a223531222c22666f757273223a2236222c227369786573223a2231222c2272756e30223a223232222c2272756e31223a223230222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204d20537461726320622041205a616d7061222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223130352e3838222c22626f776c65725f6964223a2231393635222c2266697273745f6669656c6465725f6964223a223839222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22546f6d204c617468616d222c22626174736d616e5f6964223a223434313835222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b5c2f4329222c2272756e73223a223231222c2262616c6c735f6661636564223a223232222c22666f757273223a2232222c227369786573223a2230222c2272756e30223a2239222c2272756e31223a2239222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204a2048617a6c65776f6f6420622041205a616d7061222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2239352e3435222c22626f776c65725f6964223a2231393635222c2266697273745f6669656c6465725f6964223a223931222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a22476c656e6e205068696c6c697073222c22626174736d616e5f6964223a2231303832222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626174222c22726f6c655f737472223a22222c2272756e73223a223132222c2262616c6c735f6661636564223a223136222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2237222c2272756e31223a2238222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204d204c61627573636861676e6520622047204d617877656c6c222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a2237352e3030222c22626f776c65725f6964223a223831222c2266697273745f6669656c6465725f6964223a223533363031222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224a696d6d79204e65657368616d222c22626174736d616e5f6964223a223331343330222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223538222c2262616c6c735f6661636564223a223339222c22666f757273223a2233222c227369786573223a2233222c2272756e30223a223130222c2272756e31223a223138222c2272756e32223a2235222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2272756e6f757420284a20496e676c6973205c2f204d204c61627573636861676e6529222c226469736d697373616c223a2272756e6f7574222c22737472696b655f72617465223a223134382e3732222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a223533363031222c227365636f6e645f6669656c6465725f6964223a223535383436222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d69746368656c6c2053616e746e6572222c22626174736d616e5f6964223a2231393233222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22616c6c222c22726f6c655f737472223a22222c2272756e73223a223137222c2262616c6c735f6661636564223a223132222c22666f757273223a2231222c227369786573223a2231222c2272756e30223a2235222c2272756e31223a2233222c2272756e32223a2232222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a22632047204d617877656c6c20622041205a616d7061222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223134312e3637222c22626f776c65725f6964223a2231393635222c2266697273745f6669656c6465725f6964223a223831222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224d6174742048656e7279222c22626174736d616e5f6964223a22343836222c2262617474696e67223a2266616c7365222c22706f736974696f6e223a22222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2239222c2262616c6c735f6661636564223a2238222c22666f757273223a2231222c227369786573223a2230222c2272756e30223a2233222c2272756e31223a2233222c2272756e32223a2231222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a2263204a2048617a6c65776f6f64206220502043756d6d696e73222c226469736d697373616c223a22636175676874222c22737472696b655f72617465223a223131322e3530222c22626f776c65725f6964223a22333838222c2266697273745f6669656c6465725f6964223a223931222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a225472656e7420426f756c74222c22626174736d616e5f6964223a223437222c2262617474696e67223a2274727565222c22706f736974696f6e223a226e6f6e20737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a223130222c2262616c6c735f6661636564223a2238222c22666f757273223a2230222c227369786573223a2231222c2272756e30223a2233222c2272756e31223a2234222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a223132352e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d2c7b226e616d65223a224c6f636b6965204665726775736f6e222c22626174736d616e5f6964223a223136363433222c2262617474696e67223a2274727565222c22706f736974696f6e223a22737472696b6572222c22726f6c65223a22626f776c222c22726f6c655f737472223a22222c2272756e73223a2230222c2262616c6c735f6661636564223a2231222c22666f757273223a2230222c227369786573223a2230222c2272756e30223a2231222c2272756e31223a2230222c2272756e32223a2230222c2272756e33223a2230222c2272756e35223a2230222c22686f775f6f7574223a224e6f74206f7574222c226469736d697373616c223a22222c22737472696b655f72617465223a22302e3030222c22626f776c65725f6964223a2230222c2266697273745f6669656c6465725f6964223a22222c227365636f6e645f6669656c6465725f6964223a22222c2274686972645f6669656c6465725f6964223a22227d5d2c22626f776c657273223a5b7b226e616d65223a224d69746368656c6c205374617263222c22626f776c65725f6964223a223839222c22626f776c696e67223a2274727565222c22706f736974696f6e223a2261637469766520626f776c6572222c226f76657273223a2239222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223839222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2239222c2265636f6e223a22392e3839222c2272756e30223a223231222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224a6f73682048617a6c65776f6f64222c22626f776c65725f6964223a223931222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a226c61737420626f776c6572222c226f76657273223a2239222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223730222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22372e3738222c2272756e30223a223234222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a225061742043756d6d696e73222c22626f776c65725f6964223a22333838222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223636222c227769636b657473223a2232222c226e6f62616c6c73223a2230222c227769646573223a2233222c2265636f6e223a22362e3630222c2272756e30223a223236222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a22476c656e6e204d617877656c6c222c22626f776c65725f6964223a223831222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223632222c227769636b657473223a2231222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22362e3230222c2272756e30223a223232222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224164616d205a616d7061222c22626f776c65725f6964223a2231393635222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a223130222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223734222c227769636b657473223a2233222c226e6f62616c6c73223a2230222c227769646573223a2230222c2265636f6e223a22372e3430222c2272756e30223a223232222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d2c7b226e616d65223a224d69746368656c6c204d61727368222c22626f776c65725f6964223a223833222c22626f776c696e67223a2266616c7365222c22706f736974696f6e223a22222c226f76657273223a2232222c226d616964656e73223a2230222c2272756e735f636f6e6365646564223a223138222c227769636b657473223a2230222c226e6f62616c6c73223a2230222c227769646573223a2231222c2265636f6e223a22392e3030222c2272756e30223a2233222c22626f776c6564636f756e74223a2230222c226c6277636f756e74223a2230227d5d2c226669656c646572223a5b7b226669656c6465725f6964223a223839222c226669656c6465725f6e616d65223a224d69746368656c6c205374617263222c2263617463686573223a332c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223533363031222c226669656c6465725f6e616d65223a224d61726e7573204c61627573636861676e65222c2263617463686573223a322c2272756e6f75745f7468726f776572223a312c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223931222c226669656c6465725f6e616d65223a224a6f73682048617a6c65776f6f64222c2263617463686573223a322c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223535383436222c226669656c6465725f6e616d65223a224a6f736820496e676c6973222c2263617463686573223a302c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a312c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d2c7b226669656c6465725f6964223a223831222c226669656c6465725f6e616d65223a22476c656e6e204d617877656c6c222c2263617463686573223a312c2272756e6f75745f7468726f776572223a302c2272756e6f75745f63617463686572223a302c2272756e6f75745f6469726563745f686974223a302c227374756d70696e67223a302c2269735f73756273746974757465223a2266616c7365227d5d2c22706f776572706c6179223a7b227031223a7b2273746172746f766572223a22302e31222c22656e646f766572223a223130227d2c227032223a7b2273746172746f766572223a2231302e31222c22656e646f766572223a223430227d2c227033223a7b2273746172746f766572223a2234302e31222c22656e646f766572223a223530227d7d2c22726576696577223a7b2262617474696e67223a7b2262617474696e675f7465616d5f746f74616c5f726576696577223a2232222c2262617474696e675f7465616d5f7265766965775f73756363657373223a2230222c2262617474696e675f7465616d5f7265766965775f6661696c6564223a2230222c2262617474696e675f7465616d5f7265766965775f617661696c61626c65223a2232227d2c22626f776c696e67223a7b22626f776c696e675f7465616d5f746f74616c5f726576696577223a2232222c22626f776c696e675f7465616d5f7265766965775f73756363657373223a2230222c22626f776c696e675f7465616d5f7265766965775f6661696c6564223a2232222c22626f776c696e675f7465616d5f7265766965775f617661696c61626c65223a2230227d7d2c22666f7773223a5b7b226e616d65223a224465766f6e20436f6e776179222c22626174736d616e5f6964223a223436313431222c2272756e73223a223238222c2262616c6c73223a223137222c22686f775f6f7574223a2263204d2053746172632062204a2048617a6c65776f6f64222c2273636f72655f61745f6469736d697373616c223a36312c226f766572735f61745f6469736d697373616c223a22372e32222c22626f776c65725f6964223a223931222c226469736d697373616c223a22636175676874222c226e756d626572223a317d2c7b226e616d65223a2257696c6c20596f756e67222c22626174736d616e5f6964223a223136363039222c2272756e73223a223332222c2262616c6c73223a223337222c22686f775f6f7574223a2263204d2053746172632062204a2048617a6c65776f6f64222c2273636f72655f61745f6469736d697373616c223a37322c226f766572735f61745f6469736d697373616c223a22392e34222c22626f776c65725f6964223a223931222c226469736d697373616c223a22636175676874222c226e756d626572223a327d2c7b226e616d65223a22446172796c204d69746368656c6c222c22626174736d616e5f6964223a223136353039222c2272756e73223a223534222c2262616c6c73223a223531222c22686f775f6f7574223a2263204d20537461726320622041205a616d7061222c2273636f72655f61745f6469736d697373616c223a3136382c226f766572735f61745f6469736d697373616c223a2232332e36222c22626f776c65725f6964223a2231393635222c226469736d697373616c223a22636175676874222c226e756d626572223a337d2c7b226e616d65223a22546f6d204c617468616d222c22626174736d616e5f6964223a223434313835222c2272756e73223a223231222c2262616c6c73223a223232222c22686f775f6f7574223a2263204a2048617a6c65776f6f6420622041205a616d7061222c2273636f72655f61745f6469736d697373616c223a3232322c226f766572735f61745f6469736d697373616c223a2233312e32222c22626f776c65725f6964223a2231393635222c226469736d697373616c223a22636175676874222c226e756d626572223a347d2c7b226e616d65223a22476c656e6e205068696c6c697073222c22626174736d616e5f6964223a2231303832222c2272756e73223a223132222c2262616c6c73223a223136222c22686f775f6f7574223a2263204d204c61627573636861676e6520622047204d617877656c6c222c2273636f72655f61745f6469736d697373616c223a3236352c226f766572735f61745f6469736d697373616c223a2233362e36222c22626f776c65725f6964223a223831222c226469736d697373616c223a22636175676874222c226e756d626572223a357d2c7b226e616d65223a2252616368696e20526176696e647261222c22626174736d616e5f6964223a2231303831222c2272756e73223a22313136222c2262616c6c73223a223839222c22686f775f6f7574223a2263204d204c61627573636861676e65206220502043756d6d696e73222c2273636f72655f61745f6469736d697373616c223a3239332c226f766572735f61745f6469736d697373616c223a2234302e32222c22626f776c65725f6964223a22333838222c226469736d697373616c223a22636175676874222c226e756d626572223a367d2c7b226e616d65223a224d69746368656c6c2053616e746e6572222c22626174736d616e5f6964223a2231393233222c2272756e73223a223137222c2262616c6c73223a223132222c22686f775f6f7574223a22632047204d617877656c6c20622041205a616d7061222c2273636f72655f61745f6469736d697373616c223a3332302c226f766572735f61745f6469736d697373616c223a2234332e33222c22626f776c65725f6964223a2231393635222c226469736d697373616c223a22636175676874222c226e756d626572223a377d2c7b226e616d65223a224d6174742048656e7279222c22626174736d616e5f6964223a22343836222c2272756e73223a2239222c2262616c6c73223a2238222c22686f775f6f7574223a2263204a2048617a6c65776f6f64206220502043756d6d696e73222c2273636f72655f61745f6469736d697373616c223a3334362c226f766572735f61745f6469736d697373616c223a2234362e34222c22626f776c65725f6964223a22333838222c226469736d697373616c223a22636175676874222c226e756d626572223a387d2c7b226e616d65223a224a696d6d79204e65657368616d222c22626174736d616e5f6964223a223331343330222c2272756e73223a223538222c2262616c6c73223a223339222c22686f775f6f7574223a2272756e6f757420284a20496e676c6973205c2f204d204c61627573636861676e6529222c2273636f72655f61745f6469736d697373616c223a3338332c226f766572735f61745f6469736d697373616c223a2234392e35222c22626f776c65725f6964223a2230222c226469736d697373616c223a2272756e6f7574222c226e756d626572223a397d5d2c226c6173745f7769636b6574223a7b226e616d65223a224a696d6d79204e65657368616d222c22626174736d616e5f6964223a223331343330222c2272756e73223a223538222c2262616c6c73223a223339222c22686f775f6f7574223a2272756e6f757420284a20496e676c6973205c2f204d204c61627573636861676e6529222c2273636f72655f61745f6469736d697373616c223a3338332c226f766572735f61745f6469736d697373616c223a2234392e35222c22626f776c65725f6964223a2230222c226469736d697373616c223a2272756e6f7574222c226e756d626572223a397d2c2265787472615f72756e73223a7b2262796573223a302c226c656762796573223a342c227769646573223a32322c226e6f62616c6c73223a302c2270656e616c7479223a2230222c22746f74616c223a32367d2c226571756174696f6e73223a7b2272756e73223a3338332c227769636b657473223a392c226f76657273223a223530222c22626f776c6572735f75736564223a362c2272756e72617465223a22372e3636227d2c2263757272656e745f706172746e657273686970223a7b2272756e73223a302c2262616c6c73223a312c226f76657273223a302e312c22626174736d656e223a5b7b226e616d65223a224c6f636b6965204665726775736f6e222c22626174736d616e5f6964223a31363634332c2272756e73223a302c2262616c6c73223a317d2c7b226e616d65223a225472656e7420426f756c74222c22626174736d616e5f6964223a34372c2272756e73223a302c2262616c6c73223a307d5d7d2c226469645f6e6f745f626174223a5b5d2c226d61785f6f766572223a223530222c22746172676574223a22333839227d5d2c22706c6179657273223a5b7b22706964223a33312c227469746c65223a224b616e652057696c6c69616d736f6e222c2273686f72745f6e616d65223a224b2057696c6c69616d736f6e222c2266697273745f6e616d65223a224b616e652057696c6c69616d736f6e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30382d3038222c226269727468706c616365223a2254617572616e6761222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224b616e652057696c6c69616d736f6e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4b616e6557696c6c547261696e5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4b616e6557696c69616d736f6e222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6b616e655f735f775c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34332c227469746c65223a2254696d20536f7574686565222c2273686f72745f6e616d65223a225420536f7574686565222c2266697273745f6e616d65223a2254696d20536f7574686565222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938382d31322d3131222c226269727468706c616365223a225768616e67617265692c204e6f7274686c616e64222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a2254696d20536f7574686565222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f74696d5f736f75746865655c2f222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f74696d5f736f75746865655c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34372c227469746c65223a225472656e7420426f756c74222c2273686f72745f6e616d65223a225420426f756c74222c2266697273745f6e616d65223a225472656e7420426f756c74222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30372d3232222c226269727468706c616365223a22526f746f727561222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d2046617374204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a225472656e7420426f756c74222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f5472656e74426f756c74437269636b657465725c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f54727272656e74426f756c74222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f74727272656e745f5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a37312c227469746c65223a224461766964205761726e6572222c2273686f72745f6e616d65223a2244205761726e6572222c2266697273745f6e616d65223a224461766964205761726e6572222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938362d31302d3237222c226269727468706c616365223a2250616464696e67746f6e2c204e657720536f7574682057616c6573222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224461766964205761726e6572222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f64617669647761726e657233315c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f64617669647761726e65723331222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f64617669647761726e657233315c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a37372c227469746c65223a2253746576656e20536d697468222c2273686f72745f6e616d65223a225320536d697468222c2266697273745f6e616d65223a2253746576656e20536d697468222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30362d3032222c226269727468706c616365223a225379646e65792c204e657720536f7574682057616c6573222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22537465766520536d697468222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f5374657665536d6974685c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f7374657665736d6974683439222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f73746576655f736d69746834395c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a38312c227469746c65223a22476c656e6e204d617877656c6c222c2273686f72745f6e616d65223a2247204d617877656c6c222c2266697273745f6e616d65223a22476c656e6e204d617877656c6c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938382d31302d3134222c226269727468706c616365223a224b65772c204d656c626f75726e652c20566963746f726961222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a31383937342c22726563656e745f617070656172616e6365223a313531373130393630302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a22476c656e6e204d617877656c6c222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f476c656e6e4d617877656c6c437269636b65745c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f476d6178695f3332222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f676d6178695f33325c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a38332c227469746c65223a224d69746368656c6c204d61727368222c2273686f72745f6e616d65223a224d204d61727368222c2266697273745f6e616d65223a224d69746368656c6c204d61727368222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d31302d3230222c226269727468706c616365223a22204174746164616c652c205065727468222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a31383936382c22726563656e745f617070656172616e6365223a313531343234343630302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224d69746368656c6c204d61727368222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6d697463686d617273683233355c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f496d4d69746368656c6d61727368222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d697463686d617273683233355c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a38392c227469746c65223a224d69746368656c6c205374617263222c2273686f72745f6e616d65223a224d205374617263222c2266697273745f6e616d65223a224d69746368656c6c205374617263222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30312d3330222c226269727468706c616365223a224261756c6b68616d2048696c6c732c205379646e65792c204e657720536f7574682057616c6573222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224d69746368656c6c205374617263222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6d737461726335365c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6d73746172633536222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d737461726335365c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a39312c227469746c65223a224a6f73682048617a6c65776f6f64222c2273686f72745f6e616d65223a224a2048617a6c65776f6f64222c2266697273745f6e616d65223a224a6f73682048617a6c65776f6f64222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d30312d3038222c226269727468706c616365223a2254616d776f7274682c204e657720536f7574682057616c6573222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a224a6f73682048617a6c65776f6f64222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4a6f73685f48617a6c65776f6f6431222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3338382c227469746c65223a225061742043756d6d696e73222c2273686f72745f6e616d65223a22502043756d6d696e73222c2266697273745f6e616d65223a225061742043756d6d696e73222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939332d30352d3038222c226269727468706c616365223a22576573746d6561642c205379646e6579222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a225061742043756d6d696e73222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f70617463756d6d696e733330222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f70617463756d6d696e733330222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f70617463756d6d696e7333305c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22284329227d2c7b22706964223a3438362c227469746c65223a224d6174742048656e7279222c2273686f72745f6e616d65223a224d2048656e7279222c2266697273745f6e616d65223a224d6174742048656e7279222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d31322d3134222c226269727468706c616365223a224368726973746368757263682c2043616e74657262757279222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a224d6174742048656e7279222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a3635312c227469746c65223a225365616e204162626f7474222c2273686f72745f6e616d65223a2253204162626f7474222c2266697273745f6e616d65223a225365616e204162626f7474222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d30322d3239222c226269727468706c616365223a2257696e64736f722c204e657720536f7574682057616c6573222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362c22616c745f6e616d65223a225365616e204162626f7474222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f7365616e6162626f74743737222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7365616e5f6162626f74745c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a313038312c227469746c65223a2252616368696e20526176696e647261222c2273686f72745f6e616d65223a225220526176696e647261222c2266697273745f6e616d65223a2252616368696e20526176696e647261222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939392d31312d3138222c226269727468706c616365223a2257656c6c696e67746f6e222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a2252616368696e20526176696e647261222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f72616368696e726176696e6472615c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a313038322c227469746c65223a22476c656e6e205068696c6c697073222c2273686f72745f6e616d65223a2247205068696c6c697073222c2266697273745f6e616d65223a22476c656e6e205068696c6c697073222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939362d31322d3036222c226269727468706c616365223a2245617374204c6f6e646f6e2c204561737465726e20436170652c20536f75746820416672696361222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a225769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a22476c656e6e205068696c6c697073222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f705c2f476c656e6e2d5068696c6c6970732d3130303036343731333033393433385c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f676c656e6e646f6d696e6963313539222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f676c656e6e7068696c6c6970733233365c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a313730382c227469746c65223a224d61726b20436861706d616e222c2273686f72745f6e616d65223a224d20436861706d616e222c2266697273745f6e616d65223a224d61726b20436861706d616e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939342d30362d3237222c226269727468706c616365223a22486f6e67204b6f6e67222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a224d61726b20436861706d616e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6d61726b73636861706d616e385c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6d61726b636861706d616e3038222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d61726b636861706d616e385c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a313932332c227469746c65223a224d69746368656c6c2053616e746e6572222c2273686f72745f6e616d65223a224d2053616e746e6572222c2266697273745f6e616d65223a224d69746368656c6c2053616e746e6572222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d30322d3035222c226269727468706c616365223a222048616d696c746f6e222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a224c6566742041726d204f7274686f646f78222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a224d69746368656c6c2053616e746e6572222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6d69746368656c6c73616e746e65726e7a5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4d69746368656c6c53616e746e6572222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d6974636873616e746e65725c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a313932372c227469746c65223a2249736820536f646869222c2273686f72745f6e616d65223a224920536f646869222c2266697273745f6e616d65223a2249736820536f646869222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d31302d3331222c226269727468706c616365223a224c75646869616e612c20496e646961222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a2249736820536f646869222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f497368536f6468695c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6973685f736f646869222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6963335f6f64695c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a313936352c227469746c65223a224164616d205a616d7061222c2273686f72745f6e616d65223a2241205a616d7061222c2266697273745f6e616d65223a224164616d205a616d7061222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d30332d3331222c226269727468706c616365223a225368656c6c686172626f75722c204e657720536f7574682057616c6573222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a31383937302c22726563656e745f617070656172616e6365223a313531353930303030302c2266616e746173795f706c617965725f726174696e67223a382c22616c745f6e616d65223a224164616d205a616d7061222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f7a616d7073626f6f6b5c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4164616d5a616d7061415553222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7a616d707374616772616d222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a31363530392c227469746c65223a22446172796c204d69746368656c6c222c2273686f72745f6e616d65223a2244204d69746368656c6c222c2266697273745f6e616d65223a22446172796c204d69746368656c6c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d30352d3230222c226269727468706c616365223a2248616d696c746f6e222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22446172796c204d69746368656c6c222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f705c2f446172796c2d4d69746368656c6c2d3130303037353435313031333939345c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f64617a6d69746368656c6c3437222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f64617a6d69746368656c6c34375c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a31363539352c227469746c65223a22546f6d20426c756e64656c6c222c2273686f72745f6e616d65223a22544120426c756e64656c6c222c2266697273745f6e616d65223a22546f6d20426c756e64656c6c222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30392d3031222c226269727468706c616365223a2257656c6c696e67746f6e222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a227769636b6574206b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a352c22616c745f6e616d65223a22546f6d20426c756e64656c6c222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f54426c756e64657273222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f746f6d626c756e64656c6c6e7a5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a31363630392c227469746c65223a2257696c6c20596f756e67222c2273686f72745f6e616d65223a225720596f756e67222c2266697273745f6e616d65223a2257696c6c20596f756e67222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d31312d3232222c226269727468706c616365223a224e657720506c796d6f757468222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a2257696c6c20596f756e67222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f77696c6c796f756e675c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f77696c6c796f756e67222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f77696c6c796f756e676f6666696369616c5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a31363634332c227469746c65223a224c6f636b6965204665726775736f6e222c2273686f72745f6e616d65223a224c204665726775736f6e222c2266697273745f6e616d65223a224c6f636b6965204665726775736f6e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d30362d3133222c226269727468706c616365223a224175636b6c616e64222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626f776c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a32333939312c22726563656e745f617070656172616e6365223a313531333938303030302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a224c6163686c616e204665726775736f6e222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4c6f636b69654665726775736f6e38375c2f222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6c6f636b69656665726775736f6e5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22626f776c222c22726f6c655f737472223a22227d2c7b22706964223a33313433302c227469746c65223a224a696d6d79204e65657368616d222c2273686f72745f6e616d65223a224a204e65657368616d222c2266697273745f6e616d65223a224a696d6d79204e65657368616d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939302d30392d3137222c226269727468706c616365223a224175636b6c616e64222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a362e352c22616c745f6e616d65223a224a696d6d79204e65657368616d222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f4a696d6d794e656573685c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4a696d6d794e65657368222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6a696d6d796e65657368616d5c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22616c6c222c22726f6c655f737472223a22227d2c7b22706964223a34333437312c227469746c65223a225472617669732048656164222c2273686f72745f6e616d65223a22542048656164222c2266697273745f6e616d65223a225472617669732048656164222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939332d31322d3239222c226269727468706c616365223a224164656c616964652c20536f757468204175737472616c6961222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204f666620427265616b222c226669656c64696e675f706f736974696f6e223a225769636b65746b6565706572222c22726563656e745f6d61746368223a31383937302c22726563656e745f617070656172616e6365223a313531353930303030302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a225472617669732048656164222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f7472617669732e686561642e393834395c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f747261766973686561643334222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f7472617669736865616433345c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a34333438322c227469746c65223a224d61726375732053746f696e6973222c2273686f72745f6e616d65223a224d2053746f696e6973222c2266697273745f6e616d65223a224d61726375732053746f696e6973222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313938392d30382d3136222c226269727468706c616365223a2250657274682c204175737472616c6961222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372c22616c745f6e616d65223a224d61726375732053746f696e6973222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f6d617263757373746f696e69736175735c2f222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f4d53746f696e6973222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d617263757373746f696e69735c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a34343138352c227469746c65223a22546f6d204c617468616d222c2273686f72745f6e616d65223a2254204c617468616d222c2266697273745f6e616d65223a22546f6d204c617468616d222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939322d30342d3032222c226269727468706c616365223a224368726973746368757263682c2043616e74657262757279222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a227769636b6574206b6565706572222c22726563656e745f6d61746368223a32333939312c22726563656e745f617070656172616e6365223a313531333938303030302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a22546f6d204c617468616d222c2266616365626f6f6b5f70726f66696c65223a2268747470733a5c2f5c2f7777772e66616365626f6f6b2e636f6d5c2f746f6d6c617468616d6f6666696369616c222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f546f6d6c617468616d32222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f746f6d6c617468616d325c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b5c2f4329227d2c7b22706964223a34363134312c227469746c65223a224465766f6e20436f6e776179222c2273686f72745f6e616d65223a224420436f6e776179222c2266697273745f6e616d65223a224465766f6e20436f6e776179222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d30372d3038222c226269727468706c616365223a224a6f68616e6e6573627572672c205472616e737661616c222c22636f756e747279223a226e7a222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d222c226669656c64696e675f706f736974696f6e223a226f63636173696f6e616c207769636b6574206b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224465766f6e20436f6e776179222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f445f436f6e7761793838222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6465766f6e636f6e77617938385c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224e6577205a65616c616e64222c22726f6c65223a22776b222c22726f6c655f737472223a22227d2c7b22706964223a35333630312c227469746c65223a224d61726e7573204c61627573636861676e65222c2273686f72745f6e616d65223a224d204c61627573636861676e65222c2266697273745f6e616d65223a224d61726e7573204c61627573636861676e65222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939342d30362d3232222c226269727468706c616365223a224b6c65726b73646f72702c204e6f72746820576573742050726f76696e63652c20536f75746820416672696361222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22626174222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204c6567205370696e222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a224d61726e7573204c61627573636861676e65222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f6d61726e757333637269636b6574222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6d61726e7573335c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22626174222c22726f6c655f737472223a22227d2c7b22706964223a35353130362c227469746c65223a22416c6578204361726579222c2273686f72745f6e616d65223a2241204361726579222c2266697273745f6e616d65223a22416c6578204361726579222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939312d30382d3237222c226269727468706c616365223a224c6f78746f6e2c20536f757468204175737472616c6961222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a224c6566742068616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a225769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a392c22616c745f6e616d65223a22416c6578204361726579222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a22222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f616c657863617265795f355c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d2c7b22706964223a35353834362c227469746c65223a224a6f736820496e676c6973222c2273686f72745f6e616d65223a224a20496e676c6973222c2266697273745f6e616d65223a224a6f736820496e676c6973222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939352d30332d3034222c226269727468706c616365223a224c656564732c20596f726b73686972652c20456e676c616e64222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22776b222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a22222c226669656c64696e675f706f736974696f6e223a225769636b65746b6565706572222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a372e352c22616c745f6e616d65223a224a6f736820496e676c6973222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f7961626269653239222c22696e7374616772616d5f70726f66696c65223a2268747470733a5c2f5c2f7777772e696e7374616772616d2e636f6d5c2f6a6f7368696e676c697339355c2f222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a22776b222c22726f6c655f737472223a2228574b29227d2c7b22706964223a39333133302c227469746c65223a2243616d65726f6e20477265656e222c2273686f72745f6e616d65223a224320477265656e222c2266697273745f6e616d65223a2243616d65726f6e20477265656e222c226c6173745f6e616d65223a22222c226d6964646c655f6e616d65223a22222c22626972746864617465223a22313939392d30362d3033222c226269727468706c616365223a2250657274682c204175737472616c6961222c22636f756e747279223a226175222c227072696d6172795f7465616d223a5b5d2c226c6f676f5f75726c223a22222c22706c6179696e675f726f6c65223a22616c6c222c2262617474696e675f7374796c65223a2252696768742048616e6420426174222c22626f776c696e675f7374796c65223a2252696768742041726d204d656469756d2046617374222c226669656c64696e675f706f736974696f6e223a22222c22726563656e745f6d61746368223a302c22726563656e745f617070656172616e6365223a302c2266616e746173795f706c617965725f726174696e67223a382e352c22616c745f6e616d65223a2243616d65726f6e20477265656e222c2266616365626f6f6b5f70726f66696c65223a22222c22747769747465725f70726f66696c65223a2268747470733a5c2f5c2f747769747465722e636f6d5c2f43616d65726f6e477265656e5f222c22696e7374616772616d5f70726f66696c65223a22222c2264656275745f64617461223a22222c227468756d625f75726c223a22222c226e6174696f6e616c697479223a224175737472616c6961222c22726f6c65223a227371756164222c22726f6c655f737472223a22227d5d2c227072655f6d617463685f6f646473223a5b5d2c226461795f72656d61696e696e675f6f766572223a22222c226d617463685f6e6f746573223a5b5b224175737472616c696120696e6e696e672031222c22506f776572706c617920312028302e31202d203130292052756e203131382c207769636b65742030222c22506f776572706c61792032202831302e31202d203430292052756e203138342c207769636b65742035222c22506f776572706c61792033202834302e31202d203530292052756e203130392c207769636b65742035222c224175737472616c69613a2035302072756e7320696e20342e32206f766572732e222c2235302072756e20706172746e657273686970206f662032382062616c6c732c5472617669732048656164203235283131292072756e732c204461766964205761726e6572203236283137292072756e732e222c224461766964205761726e65722035302072756e7320696e2033302062616c6c73202834207820342c203620582035292e222c224175737472616c69613a203130302072756e7320696e20382e35206f766572732e222c223130302072756e20706172746e657273686970206f662035352062616c6c732c5472617669732048656164203436283234292072756e732c204461766964205761726e6572203535283331292072756e732e222c224175737472616c69613a203135302072756e7320696e2031342e36206f766572732e222c223135302072756e20706172746e657273686970206f662039362062616c6c732c5472617669732048656164203735283432292072756e732c204461766964205761726e6572203736283534292072756e732e222c225472617669732048656164203130302072756e7320696e2036302062616c6c7320283420782031302c203620582036292e222c224175737472616c69613a203230302072756e7320696e2032332e33206f766572732e222c224175737472616c69613a203235302072756e7320696e2033342e35206f766572732e222c224175737472616c69613a203330302072756e7320696e2034312e33206f766572732e222c224175737472616c69613a203335302072756e7320696e2034362e32206f766572732e222c22506f776572706c6179203320283430202d203530292052756e203130392c207769636b65742035222c22496e6e696e677320427265616b3a204175737472616c6961202d203338385c2f3130206f766572732034392e32202862616c6c7320323936292e225d2c5b224e6577205a65616c616e6420696e6e696e672032222c22506f776572706c617920312028302e31202d203130292052756e2037332c207769636b65742032222c22506f776572706c61792032202831302e31202d203430292052756e203232352c207769636b65742034222c22506f776572706c61792033202834302e31202d203530292052756e203130302c207769636b65742034222c224e6577205a65616c616e643a2035302072756e7320696e20352e33206f766572732e222c2235302072756e20706172746e657273686970206f662034332062616c6c732c57696c6c20596f756e67203233283237292072756e732c204465766f6e20436f6e776179203238283136292072756e732e222c224e6577205a65616c616e643a203130302072756e7320696e2031332e36206f766572732e222c224e6577205a65616c616e643a203135302072756e7320696e2032312e33206f766572732e222c22446172796c204d69746368656c6c2035302072756e7320696e2034322062616c6c73202834207820362c203620582031292e222c224e6577205a65616c616e643a203230302072756e7320696e2032392e32206f766572732e222c224e6577205a65616c616e643a203235302072756e7320696e2033352e35206f766572732e222c2252616368696e20526176696e647261203130302072756e7320696e2037382062616c6c73202834207820372c203620582035292e222c224e6577205a65616c616e643a203330302072756e7320696e2034312e35206f766572732e222c224e6577205a65616c616e643a203335302072756e7320696e2034372e31206f766572732e222c22506f776572706c6179203320283430202d203530292052756e203130302c207769636b65742034222c224d6174636820636f6d706c65746564225d5d7d, '2023-10-28 13:00:03', '2023-10-28 13:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '2014_10_12_000000_create_users_table', 1),
(32, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(33, '2019_08_19_000000_create_failed_jobs_table', 1),
(34, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(35, '2023_07_03_061000_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(7, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 7),
(8, 'App\\Models\\User', 8),
(8, 'App\\Models\\User', 9),
(8, 'App\\Models\\User', 10),
(8, 'App\\Models\\User', 11),
(8, 'App\\Models\\User', 12),
(8, 'App\\Models\\User', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `userid`, `title`, `seen`, `created_at`, `updated_at`) VALUES
(1, 8, 'You have got ₹500 for Signup Bonus.', NULL, '2023-10-26 12:47:07', '2023-10-26 12:47:07'),
(2, 8, 'You have got ₹10 for Mobile Bonus.', NULL, '2023-10-26 12:47:08', '2023-10-26 12:47:08'),
(3, 11, '₹500 has been added to your wallet successfully.', 0, '2023-10-26 16:43:04', '2023-10-26 16:43:04'),
(4, 11, 'You have successfully joined league of Rs 100', 0, '2023-10-26 16:43:49', '2023-10-26 16:43:49'),
(5, 9, '₹5000 has been added to your wallet successfully.', 0, '2023-10-26 16:45:11', '2023-10-26 16:45:11'),
(6, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-26 16:46:55', '2023-10-26 16:46:55'),
(7, 11, '₹400 has been debited to your wallet successfully.', 0, '2023-10-26 17:04:01', '2023-10-26 17:04:01'),
(8, 11, '₹100000 has been added to your wallet successfully.', 0, '2023-10-26 17:04:44', '2023-10-26 17:04:44'),
(9, 11, 'You have successfully joined league of Rs 100', 0, '2023-10-26 17:11:48', '2023-10-26 17:11:48'),
(10, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-26 17:12:01', '2023-10-26 17:12:01'),
(11, 11, 'Refund Amount of Rs.100 for challenge cancellation', NULL, '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(12, 9, 'Refund Amount of Rs.100 for challenge cancellation', NULL, '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(13, 11, 'Refund Amount of Rs.100 for challenge cancellation', NULL, '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(14, 9, 'Refund Amount of Rs.100 for challenge cancellation', NULL, '2023-10-26 17:14:11', '2023-10-26 17:14:11'),
(15, 11, '₹99100 has been debited to your wallet successfully.', 0, '2023-10-26 17:29:29', '2023-10-26 17:29:29'),
(16, 11, 'You have successfully joined league of Rs 49', 0, '2023-10-27 08:20:35', '2023-10-27 08:20:35'),
(17, 11, 'You have successfully joined league of Rs 49', 0, '2023-10-27 08:21:51', '2023-10-27 08:21:51'),
(18, 11, 'You have successfully joined league of Rs 49', 0, '2023-10-27 08:24:05', '2023-10-27 08:24:05'),
(19, 11, 'You have successfully joined league of Rs 49', 0, '2023-10-27 08:25:17', '2023-10-27 08:25:17'),
(20, 11, 'You have successfully joined league of Rs 49', 0, '2023-10-27 08:26:18', '2023-10-27 08:26:18'),
(21, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-27 10:21:25', '2023-10-27 10:21:25'),
(22, 8, '₹200 has been added to your wallet successfully.', 0, '2023-10-27 10:54:43', '2023-10-27 10:54:43'),
(23, 12, 'You have successfully joined league of Rs 20', 0, '2023-10-27 10:59:01', '2023-10-27 10:59:01'),
(24, 11, 'You have successfully joined league of Rs 100', 0, '2023-10-27 12:48:05', '2023-10-27 12:48:05'),
(25, 11, 'Refund Amount of Rs.49 for challenge cancellation', NULL, '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(26, 11, 'Refund Amount of Rs.49 for challenge cancellation', NULL, '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(27, 11, 'Refund Amount of Rs.49 for challenge cancellation', NULL, '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(28, 11, 'Refund Amount of Rs.49 for challenge cancellation', NULL, '2023-10-27 13:26:10', '2023-10-27 13:26:10'),
(29, 11, 'Refund Amount of Rs.49 for challenge cancellation', NULL, '2023-10-27 13:26:10', '2023-10-27 13:26:10'),
(30, 12, 'Refund Amount of Rs.20 for challenge cancellation', NULL, '2023-10-27 13:26:15', '2023-10-27 13:26:15'),
(31, 10, '₹1000 has been added to your wallet successfully.', 0, '2023-10-27 14:19:29', '2023-10-27 14:19:29'),
(32, 9, '₹1000 has been added to your wallet successfully.', 0, '2023-10-27 14:19:50', '2023-10-27 14:19:50'),
(33, 9, '₹1000 has been added to your wallet successfully.', 0, '2023-10-27 14:21:33', '2023-10-27 14:21:33'),
(34, 13, '₹1000 has been added to your wallet successfully.', 0, '2023-10-27 14:25:38', '2023-10-27 14:25:38'),
(35, 10, 'You have successfully joined league of Rs 100', 0, '2023-10-27 14:29:21', '2023-10-27 14:29:21'),
(36, 10, 'You have successfully joined league of Rs 500', 0, '2023-10-27 14:29:38', '2023-10-27 14:29:38'),
(37, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-27 14:42:18', '2023-10-27 14:42:18'),
(38, 9, 'You have successfully joined league of Rs 500', 0, '2023-10-27 14:42:26', '2023-10-27 14:42:26'),
(39, 9, 'Refund Amount of Rs.100 for challenge cancellation', NULL, '2023-10-27 14:52:36', '2023-10-27 14:52:36'),
(40, 11, 'Refund Amount of Rs.100 for challenge cancellation', NULL, '2023-10-27 14:52:36', '2023-10-27 14:52:36'),
(41, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-27 15:05:34', '2023-10-27 15:05:34'),
(42, 9, 'You have successfully joined league of Rs 500', 0, '2023-10-27 15:05:43', '2023-10-27 15:05:43'),
(43, 10, 'You have successfully joined league of Rs 100', 0, '2023-10-27 15:14:08', '2023-10-27 15:14:08'),
(44, 9, 'Refund Amount of Rs.500 for challenge cancellation', NULL, '2023-10-27 17:00:02', '2023-10-27 17:00:02'),
(45, 10, 'You won amount Rs.150.00', NULL, '2023-10-27 17:18:18', '2023-10-27 17:18:18'),
(46, 10, 'You won amount Rs.150.00', NULL, '2023-10-28 02:12:53', '2023-10-28 02:12:53'),
(47, 10, 'You have successfully joined league of Rs 100', 0, '2023-10-28 02:21:08', '2023-10-28 02:21:08'),
(48, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-28 02:22:09', '2023-10-28 02:22:09'),
(49, 9, 'You won amount Rs.150.00', NULL, '2023-10-28 16:47:14', '2023-10-28 16:47:14'),
(50, 9, 'You have successfully joined league of Rs 100', 0, '2023-10-30 04:05:42', '2023-10-30 04:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int UNSIGNED NOT NULL,
  `minamount` int DEFAULT NULL,
  `maxamount` int NOT NULL,
  `bonus` int NOT NULL,
  `prize_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bonus',
  `offercode` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_time` int NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pancard`
--

CREATE TABLE `pancard` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `pan_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pan_number` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pan_dob` date NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pancard`
--

INSERT INTO `pancard` (`id`, `userid`, `pan_name`, `pan_number`, `pan_dob`, `image`, `status`, `comment`, `created_at`, `updated_at`) VALUES
(1, 9, 'Harshadkumar Ramesh Thanki', 'ATGPT2050C', '1991-12-24', 'users/pancard/ATGPT2050C91698328977.png', 1, NULL, '2023-10-26 14:02:57', '2023-10-26 14:03:38'),
(2, 11, 'Milan Narsibhai Joshi', 'BDAPJ5008D', '1987-02-15', 'users/pancard/BDAPJ5008D111698337131.png', 1, NULL, '2023-10-26 16:18:51', '2023-10-26 16:19:40'),
(3, 10, 'Thank Rameshkumar Bhagvanni', 'ABMPT0729N', '1961-07-11', 'users/pancard/ABMPT0729N101698415991.png', 1, NULL, '2023-10-27 14:13:11', '2023-10-27 14:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentprocess`
--

CREATE TABLE `paymentprocess` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `paymentmethod` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `orderid` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `offerid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `returnid` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `paymentprocess`
--

INSERT INTO `paymentprocess` (`id`, `userid`, `paymentmethod`, `amount`, `orderid`, `offerid`, `returnid`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'manual', 100, 'BMS-ADD-16983294649', NULL, NULL, 'pending', '2023-10-26 14:11:05', '2023-10-26 14:11:05'),
(2, 9, 'manual', 100, 'BMS-ADD-16983294819', NULL, NULL, 'pending', '2023-10-26 14:11:22', '2023-10-26 14:11:22'),
(3, 11, 'manual', 100, 'BMS-ADD-169833851011', NULL, NULL, 'pending', '2023-10-26 16:41:51', '2023-10-26 16:41:51'),
(4, 11, 'manual', 200, 'BMS-ADD-169834091011', NULL, NULL, 'pending', '2023-10-26 17:21:51', '2023-10-26 17:21:51'),
(5, 9, 'manual', 100, 'BMS-ADD-16983772709', NULL, NULL, 'pending', '2023-10-27 03:27:51', '2023-10-27 03:27:51'),
(6, 12, 'manual', 500, 'BMS-ADD-169840431612', NULL, 'TWFWGEHEH', 'success', '2023-10-27 10:58:36', '2023-10-27 10:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `payment_data`
--

CREATE TABLE `payment_data` (
  `id` int NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'ApiToken', '52abbd118f99cdb107b09a8b63d126d89f83ac6e63e9b3a0a9adc4ffde6ad6c5', '[\"*\"]', '2023-10-27 15:53:42', NULL, '2023-10-26 18:17:08', '2023-10-27 15:53:42'),
(2, 'App\\Models\\User', 9, 'ApiToken', '954cd0ea2d597b24d9ac9edaf271637acd58c61723abfc698e4c5ee5bf747da1', '[\"*\"]', '2023-10-27 16:09:44', NULL, '2023-10-26 19:29:40', '2023-10-27 16:09:44'),
(3, 'App\\Models\\User', 10, 'ApiToken', '59ba7174b69d10e1464c4e63aec5bdcf9203fc55696a39dd0edb8acc083cf96b', '[\"*\"]', '2023-10-27 15:58:01', NULL, '2023-10-26 21:34:59', '2023-10-27 15:58:01'),
(4, 'App\\Models\\User', 11, 'ApiToken', '88381f55468f6bf3cea27e05ed5a8082d9206d5aa13821019cb59b8d85cc4280', '[\"*\"]', '2023-10-26 22:25:36', NULL, '2023-10-26 21:36:25', '2023-10-26 22:25:36'),
(5, 'App\\Models\\User', 11, 'ApiToken', 'eb0064008ed5cda9ab370927f9fb56ecfaecac0d6c572c23169ddd901813babd', '[\"*\"]', '2023-10-27 21:55:43', NULL, '2023-10-26 22:27:49', '2023-10-27 21:55:43'),
(6, 'App\\Models\\User', 8, 'ApiToken', '06746c785a1ae93998b14662487c3796b6e21064a0e844f346e515b1df8606db', '[\"*\"]', '2023-10-30 09:34:30', NULL, '2023-10-27 15:45:24', '2023-10-30 09:34:30'),
(7, 'App\\Models\\User', 12, 'ApiToken', '00d17c70967cd9b859f99defa689bd4feec0f89f0338924ee54a25adfcdd7a21', '[\"*\"]', '2023-10-30 09:35:20', NULL, '2023-10-27 15:56:29', '2023-10-30 09:35:20'),
(8, 'App\\Models\\User', 13, 'ApiToken', '8f98dd71011dbfba98c49bbffdc972d73586b5b2683a0c58387a76269ae215d7', '[\"*\"]', '2023-10-27 19:53:03', NULL, '2023-10-27 16:43:28', '2023-10-27 19:53:03'),
(9, 'App\\Models\\User', 10, 'ApiToken', '6f3c19fe3f8d776aded4bb2d30ad96811cfe8949b47c8930df51fb318516c806', '[\"*\"]', '2023-10-28 22:18:32', NULL, '2023-10-27 19:37:34', '2023-10-28 22:18:32'),
(10, 'App\\Models\\User', 13, 'ApiToken', '2793f55d312120befd2db3f4e43b1c74cbf72eae481d2e0d21eb9f8c77252f1e', '[\"*\"]', '2023-10-27 19:58:42', NULL, '2023-10-27 19:54:05', '2023-10-27 19:58:42'),
(11, 'App\\Models\\User', 9, 'ApiToken', 'cb1d7dbe2155fd0f52de2e2234ade7241fd99ee4e034f680316f8f34e9c83977', '[\"*\"]', '2023-10-30 09:35:42', NULL, '2023-10-27 20:10:52', '2023-10-30 09:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int UNSIGNED NOT NULL,
  `fantasy_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `player_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `players_key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team` int NOT NULL,
  `credit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` double DEFAULT '0',
  `fullname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `battingstyle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bowlingstyle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `fantasy_type`, `player_name`, `players_key`, `team`, `credit`, `role`, `image`, `points`, `fullname`, `dob`, `country`, `battingstyle`, `bowlingstyle`, `created_at`, `updated_at`) VALUES
(1, '1', 'Vansh Kumar', '120908', 9, '6.5', 'keeper', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(2, '1', 'Raizal Nadir', '125725', 9, '7', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(3, '1', 'Shaurya Singh', '122050', 9, '8', 'batsman', NULL, 0, NULL, '', 'India', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(4, '1', 'Rameez Shahzad', '86694', 9, '7.5', 'batsman', NULL, 0, NULL, '1987-11-30', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(5, '1', 'Aaraash Raheja', '117123', 9, '8', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(6, '1', 'Shival Bawa', '113091', 9, '6.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(7, '1', 'Syed Musaib', '132865', 9, '6', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(8, '1', 'Mohammad Aniq', '126407', 9, '6', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(9, '1', 'Angad Nehru', '119620', 9, '8.5', 'allrounder', NULL, 0, NULL, '', 'India', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(10, '1', 'Shane Saldanha', '121058', 9, '8.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(11, '1', 'Soorya Sathish', '104626', 9, '6.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(12, '1', 'Hriday Savnani', '125724', 9, '6', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(13, '1', 'Rishabh Mukherjee', '95987', 9, '9.5', 'bowler', NULL, 0, NULL, '2001-05-19', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(14, '1', 'Ayaan Misbah', '133248', 9, '6.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(15, '1', 'Aahil Nagarwala', '133249', 9, '7', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(16, '1', 'Ateeq Ur Rehman', '104632', 10, '8.5', 'keeper', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(17, '1', 'Omar Hayat-I', '124424', 10, '6', 'keeper', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(18, '1', 'Farhan babar', '114444', 10, '6.5', 'keeper', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(19, '1', 'Haroon Altaf', '113648', 10, '6.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(20, '1', 'Zar Muhmmad', '123784', 10, '8', 'batsman', NULL, 0, NULL, '', NULL, '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(21, '1', 'Rizwan Khan', '115430', 10, '7', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(22, '1', 'Awais Noor', '115042', 10, '7', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(23, '1', 'Faizan Awan', '115048', 10, '8.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(24, '1', 'Shakeel Butt', '125624', 10, '6', 'batsman', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(25, '1', 'Rashid Mohd Habibullah', '123662', 10, '6.5', 'allrounder', NULL, 0, NULL, '1984-04-20', 'Pakistan', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(26, '1', 'Mannal Siddiqui', '119007', 10, '6.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(27, '1', 'Ali Anwaar', '101192', 10, '9', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(28, '1', 'Nouman Khan', '115045', 10, '6.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(29, '1', 'Tehran Khan', '115047', 10, '9', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(30, '1', 'Mohammad Imran', '121391', 10, '6.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(31, '1', 'Khurram Khawaja', '115046', 10, '7.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(32, '1', 'Mustafa Ayub', '121095', 10, '7.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(33, '1', 'Hazrat Bilal', '101194', 10, '7.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(34, '1', 'Basit Ali-I', '113678', 10, '8', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(35, '1', 'Muhammad Qaiser', '116925', 10, '7.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(36, '1', 'Muhammad Asif', '115050', 10, '6', 'allrounder', NULL, 0, NULL, '2001-02-10', 'United Arab Emirates', '', '', '2023-10-26 16:30:55', '2023-10-26 16:30:55'),
(37, '1', 'Ishan Kishan', '1097', 117, '7', 'keeper', NULL, 0, NULL, '1998-07-18', 'India', 'Left hand Bat', '', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(38, '1', 'KL Rahul', '661', 117, '8.5', 'keeper', NULL, 0, NULL, '1992-04-18', 'India', 'Right Hand Bat', '', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(39, '1', 'Rohit Sharma', '115', 117, '9', 'batsman', NULL, 0, NULL, '1987-04-30', 'India', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(40, '1', 'Shubman Gill', '90739', 117, '8.5', 'batsman', NULL, 0, NULL, '1999-09-08', 'India', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(41, '1', 'Virat Kohli', '119', 117, '9', 'batsman', NULL, 0, NULL, '1988-11-05', 'India', 'Right Hand Bat', 'Right Arm Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(42, '1', 'Shreyas Iyer', '620', 117, '8', 'batsman', NULL, 0, NULL, '1994-12-06', 'India', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(43, '1', 'Suryakumar Yadav', '598', 117, '6.5', 'batsman', NULL, 0, NULL, '1990-09-14', 'India', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(44, '1', 'Hardik Pandya', '727', 117, '8.5', 'allrounder', NULL, 0, NULL, '1993-10-11', 'India', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(45, '1', 'Ravindra Jadeja', '125', 117, '8', 'allrounder', NULL, 0, NULL, '1988-12-06', 'India', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(46, '1', 'Ravichandran Ashwin', '129', 117, '7', 'allrounder', NULL, 0, NULL, '1986-09-17', 'India', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(47, '1', 'Shardul Thakur', '810', 117, '7', 'bowler', NULL, 0, NULL, '1991-10-16', 'India', 'Right Hand Bat', 'Right Arm Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(48, '1', 'Jasprit Bumrah', '607', 117, '9', 'bowler', NULL, 0, NULL, '1993-12-06', 'India', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(49, '1', 'Mohammed Siraj', '90381', 117, '9', 'bowler', NULL, 0, NULL, '1994-03-13', 'India', 'Right Hand Bat', 'Right Arm Fast', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(50, '1', 'Kuldeep Yadav', '775', 117, '8', 'bowler', NULL, 0, NULL, '1994-12-14', 'India', 'Left hand Bat', 'Left Arm Wrist Spin', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(51, '1', 'Mohammed Shami', '131', 117, '8', 'bowler', NULL, 0, NULL, '1990-09-03', 'India', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(52, '1', 'Jonny Bairstow', '44100', 118, '8', 'keeper', NULL, 0, NULL, '1989-09-26', 'England', 'Right Hand Bat', 'Right Arm Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(53, '1', 'Jos Buttler', '105', 118, '8.5', 'keeper', NULL, 0, NULL, '1990-09-08', 'England', 'Right Hand Bat', '', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(54, '1', 'Harry Brook', '90887', 118, '6.5', 'batsman', NULL, 0, NULL, '1999-02-22', 'England', 'Right Hand Bat', 'Right Arm Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(55, '1', 'Dawid Malan', '43358', 118, '8', 'batsman', NULL, 0, NULL, '1987-09-03', 'England', 'Left hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(56, '1', 'Joe Root', '99', 118, '8.5', 'batsman', NULL, 0, NULL, '1990-12-30', 'England', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(57, '1', 'Ben Stokes', '1931', 118, '9', 'batsman', NULL, 0, NULL, '1991-06-04', 'England', 'Left hand Bat', 'Right Arm Fast Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(58, '1', 'Liam Livingstone', '48436', 118, '7', 'allrounder', NULL, 0, NULL, '1993-08-04', 'England', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(59, '1', 'Moeen Ali', '93', 118, '7.5', 'allrounder', NULL, 0, NULL, '1987-06-18', 'England', 'Left hand Bat', 'Right Arm Off Break', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(60, '1', 'Sam Curran', '1047', 118, '6.5', 'allrounder', NULL, 0, NULL, '1998-06-03', 'England', 'Left hand Bat', 'Left Arm Medium Fast', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(61, '1', 'Chris Woakes', '107', 118, '7.5', 'bowler', NULL, 0, NULL, '1989-03-02', 'England', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(62, '1', 'Gus Atkinson', '93749', 118, '5.5', 'bowler', NULL, 0, NULL, '1998-01-19', 'England', 'Right Hand Bat', 'Right Arm Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(63, '1', 'Adil Rashid', '1933', 118, '7.5', 'bowler', NULL, 0, NULL, '1988-02-17', 'England', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(64, '1', 'Mark Wood', '49060', 118, '8', 'bowler', NULL, 0, NULL, '1990-01-11', 'England', 'Right Hand Bat', 'Right Arm Fast', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(65, '1', 'David Willey', '1935', 118, '7', 'bowler', NULL, 0, NULL, '1990-02-28', 'England', 'Left hand Bat', 'Left Arm Fast Medium', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(66, '1', 'Brydon Carse', '55651', 118, '8.5', 'bowler', NULL, 0, NULL, '1995-07-31', 'England', 'Right Hand Bat', 'Right Arm Fast', '2023-10-26 16:48:26', '2023-10-26 16:48:26'),
(67, '1', 'Mohammad Rizwan', '44054', 56, '9', 'keeper', NULL, 0, NULL, '1992-06-01', 'Pakistan', 'Right Hand Bat', '', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(68, '1', 'Mohammad Haris', '96798', 56, '6', 'keeper', NULL, 0, NULL, '2001-03-30', 'Pakistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(69, '1', 'Babar Azam', '43371', 56, '9', 'batsman', NULL, 0, NULL, '1994-10-15', 'Pakistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(70, '1', 'Fakhar Zaman', '43370', 56, '7.5', 'batsman', NULL, 0, NULL, '1990-04-10', 'Pakistan', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(71, '1', 'Abdullah Shafique', '48460', 56, '8', 'batsman', NULL, 0, NULL, '1999-11-20', 'Pakistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(72, '1', 'Iftikhar Ahmed', '1771', 56, '7', 'allrounder', NULL, 0, NULL, '1990-09-03', 'Pakistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(73, '1', 'Imam ul Haq', '45199', 56, '8', 'batsman', NULL, 0, NULL, '1995-12-12', 'Pakistan', 'Left hand Bat', '', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(74, '1', 'Saud Shakeel', '45420', 56, '7', 'batsman', NULL, 0, NULL, '1995-09-05', 'Pakistan', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(75, '1', 'Shadab Khan', '1167', 56, '8', 'allrounder', NULL, 0, NULL, '1998-10-04', 'Pakistan', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(76, '1', 'Mohammad Nawaz', '1760', 56, '7', 'allrounder', NULL, 0, NULL, '1994-03-21', 'Pakistan', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(77, '1', 'Agha Salman', '45397', 56, '6', 'allrounder', NULL, 0, NULL, '1993-11-23', 'Pakistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(78, '1', 'Shaheen Afridi', '92991', 56, '9', 'bowler', NULL, 0, NULL, '2000-04-06', 'Pakistan', 'Left hand Bat', 'Left Arm Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(79, '1', 'Haris Rauf', '92381', 56, '8.5', 'bowler', NULL, 0, NULL, '1993-11-07', 'Pakistan', 'Right Hand Bat', 'Right Arm Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(80, '1', 'Mohammad Wasim', '58152', 56, '6.5', 'bowler', NULL, 0, NULL, '2001-08-25', 'Pakistan', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(81, '1', 'Usama Mir', '44070', 56, '6.5', 'bowler', NULL, 0, NULL, '1995-12-23', 'Pakistan', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(82, '1', 'Hasan Ali', '44099', 56, '7.5', 'bowler', NULL, 0, NULL, '1994-07-02', 'Pakistan', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(83, '1', 'Zaman Khan', '95942', 56, '6', 'bowler', NULL, 0, NULL, '2001-09-10', 'Pakistan', 'Right Hand Bat', 'Right Arm Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(84, '1', 'Abrar Ahmed', '58608', 56, '5.5', 'bowler', NULL, 0, NULL, '1998-09-17', 'Pakistan', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(85, '1', 'Quinton de Kock', '159', 57, '9', 'keeper', NULL, 0, NULL, '1992-12-17', 'South Africa', 'Left hand Bat', '', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(86, '1', 'Heinrich Klaasen', '46124', 57, '9', 'keeper', NULL, 0, NULL, '1991-07-30', 'South Africa', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(87, '1', 'Rassie van der Dussen', '46135', 57, '8.5', 'batsman', NULL, 0, NULL, '1989-02-07', 'South Africa', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(88, '1', 'Temba Bavuma', '46139', 57, '8', 'batsman', NULL, 0, NULL, '1990-05-17', 'South Africa', 'Right Hand Bat', 'Right Arm Medium', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(89, '1', 'Reeza Hendricks', '49700', 57, '6.5', 'batsman', NULL, 0, NULL, '1989-08-14', 'South Africa', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(90, '1', 'David Miller', '167', 57, '7.5', 'batsman', NULL, 0, NULL, '1989-06-10', 'South Africa', 'Left hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(91, '1', 'Aiden Markram', '46117', 57, '9', 'allrounder', NULL, 0, NULL, '1994-10-04', 'South Africa', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(92, '1', 'Marco Jansen', '60394', 57, '9', 'allrounder', NULL, 0, NULL, '2000-05-01', 'South Africa', 'Right Hand Bat', 'Left Arm Medium Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(93, '1', 'Andile Phehlukwayo', '53000', 57, '6.5', 'allrounder', NULL, 0, NULL, '1996-03-03', 'South Africa', 'Left hand Bat', 'Right Arm Medium Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(94, '1', 'Lungi Ngidi', '46131', 57, '7.5', 'bowler', NULL, 0, NULL, '1996-03-29', 'South Africa', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(95, '1', 'Tabraiz Shamsi', '46126', 57, '7.5', 'bowler', NULL, 0, NULL, '1990-02-18', 'South Africa', 'Right Hand Bat', 'Left Arm Wrist Spin', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(96, '1', 'Gerald Coetzee', '60342', 57, '7', 'bowler', NULL, 0, NULL, '2000-10-02', 'South Africa', 'Right Hand Bat', 'Right Arm Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(97, '1', 'Kagiso Rabada', '1953', 57, '9', 'bowler', NULL, 0, NULL, '1995-05-25', 'South Africa', 'Left hand Bat', 'Right Arm Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(98, '1', 'Keshav Maharaj', '49706', 57, '7', 'bowler', NULL, 0, NULL, '1990-02-07', 'South Africa', 'Right Hand Bat', 'Left Arm Orthodox', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(99, '1', 'Lizaad Williams', '47487', 57, '6', 'bowler', NULL, 0, NULL, '1993-10-01', 'South Africa', 'Left hand Bat', 'Right Arm Medium Fast', '2023-10-26 16:52:39', '2023-10-26 16:52:39'),
(100, '1', 'Fahad Nawaz', '93936', 83, '7.5', 'batsman', NULL, 0, NULL, '2000-01-15', 'United Arab Emirates', 'Right Hand Bat', 'Left Arm Orthodox', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(101, '1', 'Syed Haider Wasi Shah', '94180', 83, '7.5', 'keeper', NULL, 0, NULL, '2001-04-26', 'United Arab Emirates', 'Right Hand Bat', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(102, '1', 'Deepak Raj', '112797', 83, '8', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(103, '1', 'Rayan Khan', '119554', 83, '6.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(104, '1', 'Madhav Manoj', '132867', 83, '6.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(105, '1', 'Lovepreet Singh Bajwa', '127258', 83, '6', 'batsman', NULL, 0, NULL, '2002-12-05', 'United Arab Emirates', 'Right Hand Bat', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(106, '1', 'Yasir Khan', '125659', 83, '6.5', 'batsman', NULL, 0, NULL, '', NULL, '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(107, '1', 'Yash Sabnani', '125442', 83, '8', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(108, '1', 'Zawar Farid', '95754', 83, '8', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(109, '1', 'Karan Dhiman', '117125', 83, '7', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(110, '1', 'Muhammad Zuhaib-Zubair', '113087', 83, '6', 'allrounder', NULL, 0, NULL, '2003-12-31', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(111, '1', 'Adithya Shetty', '119520', 83, '8.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(112, '1', 'CP Rizwan', '94495', 83, '8', 'batsman', NULL, 0, NULL, '1988-04-19', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(113, '1', 'Junaid Shamsuddin', '121943', 83, '8.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(114, '1', 'Abdullah Ismail', '113697', 83, '6.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(115, '1', 'Hazrat Bilal', '101194', 83, '6', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(116, '1', 'Mohammad Ayaz', '84578', 83, '7.5', 'bowler', NULL, 0, NULL, '1987-10-13', 'United Arab Emirates', 'Left hand Bat', 'Left Arm Medium Fast', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(117, '1', 'Riyaz Khaliq', '132868', 83, '7', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(118, '1', 'Monish Gajeswaran', '124246', 83, '6.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(119, '1', 'Sana Ul Haq Bhatti', '127322', 84, '8', 'keeper', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(120, '1', 'Ashwant Valthapa', '132858', 84, '7.5', 'keeper', NULL, 0, NULL, '2001-06-16', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(121, '1', 'Hameedullah Azizullah Khan', '132859', 84, '6.5', 'batsman', NULL, 0, NULL, '1989-02-14', 'Pakistan', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(122, '1', 'Nikhil Srinivasan', '106613', 84, '8', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(123, '1', 'Ahaan Fernandes', '104659', 84, '7', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(124, '1', 'Muhammad Shahdad-I', '132860', 84, '7.5', 'batsman', NULL, 0, NULL, '2000-12-09', 'India', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(125, '1', 'Aaryan Madani', '104620', 84, '6', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(126, '1', 'Ammar Badami', '112808', 84, '8', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(127, '1', 'Samal Udawaththa', '119572', 84, '8', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(128, '1', 'Raunak Anil Vaswani', '112837', 84, '6.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(129, '1', 'Mohammad Umer Doger', '132794', 84, '8', 'bowler', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(130, '1', 'Sailles Jaishankar', '113321', 84, '7', 'bowler', NULL, 0, NULL, '2002-11-12', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(131, '1', 'Muhammad Irfan-II', '114666', 84, '7', 'allrounder', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(132, '1', 'Vikum Bandara Sanjaya', '123665', 84, '8', 'allrounder', NULL, 0, NULL, '', NULL, '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(133, '1', 'Hafiz Almas', '120848', 84, '7.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(134, '1', 'Muhammad Asif-Jr', '108145', 84, '7', 'bowler', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(135, '1', 'Neel Hegde', '127265', 84, '6', 'bowler', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 10:19:53', '2023-10-27 10:19:53'),
(136, '1', 'Hashim Mohammed', '120222', 11, '8', 'keeper', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(137, '1', 'Shafir Ali', '123803', 11, '7.5', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(138, '1', 'Siju Mathew', '129543', 11, '8', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(139, '1', 'Irfan Kaleel', '127641', 11, '8.5', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(140, '1', 'Mohammed Hisham', '120214', 11, '9', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(141, '1', 'Nichel Prakash', '124522', 11, '9', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(142, '1', 'Anoop Oravanakundil', '129508', 11, '8.5', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(143, '1', 'Abhijith Asokan', '127630', 11, '7.5', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(144, '1', 'Joby Jose', '129566', 11, '5.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(145, '1', 'Murali Krishnan', '129554', 11, '6', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(146, '1', 'Ashok Nithin', '132087', 11, '6.5', 'keeper', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(147, '1', 'Shiju Jose', '132088', 11, '6.5', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(148, '1', 'Amal Thankachan', '132089', 11, '6', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(149, '1', 'Hari Krishnan Nair', '132090', 11, '7', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(150, '1', 'Rahul Rajan', '132091', 11, '7.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(151, '1', 'Mohammed Aflal', '132092', 11, '6.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(152, '1', 'Robin Plathanath', '132093', 11, '8', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(153, '1', 'Jinesh Ponniyath', '132094', 11, '7', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(154, '1', 'Midhun Thekkekara', '132095', 11, '5.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(155, '1', 'Abid Mushtaq', '57158', 13, '7', 'keeper', NULL, 0, NULL, '1982-07-08', 'Kuwait', 'Right Hand Bat', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(156, '1', 'Tanveer Hussain', '120167', 13, '7', 'keeper', NULL, 0, NULL, '', 'Switzerland', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(157, '1', 'Asim Gull', '126741', 13, '6.5', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(158, '1', 'Farhan Meer', '123850', 13, '8', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(159, '1', 'Yasir Idrees Butt', '132253', 13, '7', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(160, '1', 'Adith Kumara Bolanda', '124534', 13, '8.5', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(161, '1', 'Faisal Nawaz', '125155', 13, '6', 'batsman', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(162, '1', 'Khalid Butt', '57150', 13, '9', 'batsman', NULL, 0, NULL, '1982-12-11', 'Kuwait', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(163, '1', 'Zaheer Anjum Dar', '127724', 13, '6', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(164, '1', 'Saifullah Rafiq', '127729', 13, '6.5', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(165, '1', 'Hisham Mirza', '57154', 13, '7.5', 'allrounder', NULL, 0, NULL, '1980-07-03', 'Kuwait', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(166, '1', 'Mohammad-Ahsan', '95569', 13, '8', 'allrounder', NULL, 0, NULL, '1980-07-19', 'Kuwait', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(167, '1', 'Sami Ur Rehman', '127725', 13, '5.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(168, '1', 'Tahir Abbas', '127731', 13, '7', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(169, '1', 'Sibtain Raza Shah', '57160', 13, '8', 'bowler', NULL, 0, NULL, '1985-10-10', 'Kuwait', 'Left hand Bat', 'Right Arm Off Break', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(170, '1', 'Raheel Khan', '62480', 13, '7.5', 'allrounder', NULL, 0, NULL, '1979-01-01', 'Kuwait', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(171, '1', 'Mahmoud Abdullah', '120132', 13, '6.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(172, '1', 'Ansar Ali Rehmat', '127732', 13, '6.5', 'bowler', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(173, '1', 'Nadim Akram', '132718', 13, '6', 'bowler', NULL, 0, NULL, '1997-07-02', 'Kuwait', '', '', '2023-10-27 14:02:55', '2023-10-27 14:02:55'),
(174, '1', 'Bilal Cheema', '104648', 85, '7', 'keeper', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(175, '1', 'Safeer Tariq', '53560', 85, '7.5', 'keeper', NULL, 0, NULL, '1992-12-05', 'Pakistan', 'Right Hand Bat', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(176, '1', 'Shahrukh Amin', '113402', 85, '8.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(177, '1', 'Rameez Shahzad', '86694', 85, '6', 'batsman', NULL, 0, NULL, '1987-11-30', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(178, '1', 'Ahaan Fernandes', '104659', 85, '7', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(179, '1', 'Sardar Bahzad', '114483', 85, '7', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(180, '1', 'Zainullah', '112799', 85, '6.5', 'batsman', NULL, 0, NULL, '2004-01-05', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(181, '1', 'Lovepreet Singh Bajwa', '127258', 85, '6', 'batsman', NULL, 0, NULL, '2002-12-05', 'United Arab Emirates', 'Right Hand Bat', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(182, '1', 'Ahmer Arif', '132820', 85, '5.5', 'batsman', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(183, '1', 'Hameedullah Azizullah Khan', '132859', 85, '6.5', 'batsman', NULL, 0, NULL, '1989-02-14', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(184, '1', 'Babar Agha Hussain', '124058', 85, '6.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(185, '1', 'Ronak Panoly', '94178', 85, '9', 'allrounder', NULL, 0, NULL, '2003-01-05', 'United Arab Emirates', 'Right Hand Bat', 'Left Arm Medium', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(186, '1', 'Nadir Hussain', '113403', 85, '7', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(187, '1', 'Muhammad Aizaz', '121124', 85, '6.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(188, '1', 'Abdullah Saleem', '121126', 85, '6', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(189, '1', 'Nilansh Keswani', '104652', 85, '6', 'bowler', NULL, 0, NULL, '2003-08-08', 'United Arab Emirates', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(190, '1', 'Ayaman Ahmed', '132821', 85, '5', 'allrounder', NULL, 0, NULL, '', 'Kuwait', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(191, '1', 'Muhammad Azhar', '116382', 85, '7.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(192, '1', 'Mubeen Ali', '121201', 85, '8.5', 'bowler', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(193, '1', 'Faisal Altaf', '104641', 85, '8', 'bowler', NULL, 0, NULL, '2001-03-15', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(194, '1', 'Danish Qureshi', '106626', 85, '7.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(195, '1', 'Muhammed Ismail', '106610', 85, '7', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(196, '1', 'Aryaman Sharma', '124689', 85, '7', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(197, '1', 'Taimoor Bhatti', '114447', 85, '6.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(198, '1', 'Irfan Khattak', '122305', 85, '5.5', 'bowler', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(199, '1', 'Aquib Fazal', '124403', 86, '7', 'keeper', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(200, '1', 'Mohammed Hafeef', '124404', 86, '4.5', 'keeper', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(201, '1', 'Vishnu Raj', '105741', 86, '6.5', 'batsman', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(202, '1', 'Danish Sarhadi', '132768', 86, '7.5', 'keeper', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(203, '1', 'Abhiram Hrithwik', '115645', 86, '9', 'batsman', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(204, '1', 'Albin Alias', '105743', 86, '7.5', 'batsman', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(205, '1', 'Kalliparambil Rojith', '105053', 86, '7', 'batsman', NULL, 0, NULL, '', 'India', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(206, '1', 'Renjith Mani', '112796', 86, '8.5', 'allrounder', NULL, 0, NULL, '', 'United Arab Emirates', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(207, '1', 'Ranjith Haridas', '124406', 86, '5.5', 'allrounder', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(208, '1', 'Aquib Khan', '96538', 86, '5', 'allrounder', NULL, 0, NULL, '2003-12-25', 'India', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(209, '1', 'Mohammed Sheraz', '124407', 86, '6', 'bowler', NULL, 0, NULL, '', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(210, '1', 'Zohaib-Khan', '124877', 86, '9', 'allrounder', NULL, 0, NULL, '1998-10-05', 'Pakistan', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(211, '1', 'Ahmed Farzeen', '93246', 86, '6.5', 'bowler', NULL, 0, NULL, '1992-01-10', 'India', 'Right Hand Bat', 'Right Arm Medium', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(212, '1', 'PV Vimalnadh', '124413', 86, '7', 'allrounder', NULL, 0, NULL, '', 'International', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(213, '1', 'Gihan Chathuranga', '124415', 86, '7.5', 'bowler', NULL, 0, NULL, '', 'International', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(214, '1', 'Nipun Babu', '125530', 86, '7', 'bowler', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(215, '1', 'Krishna Kala', '124414', 86, '6.5', 'bowler', NULL, 0, NULL, '', 'India', '', '', '2023-10-27 15:04:50', '2023-10-27 15:04:50'),
(216, '1', 'Josh Inglis', '55846', 98, '7.5', 'keeper', NULL, 0, NULL, '1995-03-04', 'Australia', 'Right Hand Bat', '', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(217, '1', 'Alex Carey', '55106', 98, '9', 'keeper', NULL, 0, NULL, '1991-08-27', 'Australia', 'Left hand Bat', '', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(218, '1', 'David Warner', '71', 98, '9', 'batsman', NULL, 0, NULL, '1986-10-27', 'Australia', 'Left hand Bat', 'Right Arm Leg Spin', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(219, '1', 'Steven Smith', '77', 98, '8.5', 'batsman', NULL, 0, NULL, '1989-06-02', 'Australia', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(220, '1', 'Travis Head', '43471', 98, '9', 'batsman', NULL, 0, NULL, '1993-12-29', 'Australia', 'Left hand Bat', 'Right Arm Off Break', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(221, '1', 'Marnus Labuschagne', '53601', 98, '9', 'batsman', NULL, 0, NULL, '1994-06-22', 'Australia', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(222, '1', 'Mitchell Marsh', '83', 98, '9', 'allrounder', NULL, 0, NULL, '1991-10-20', 'Australia', 'Right Hand Bat', 'Right Arm Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(223, '1', 'Glenn Maxwell', '81', 98, '8', 'allrounder', NULL, 0, NULL, '1988-10-14', 'Australia', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(224, '1', 'Marcus Stoinis', '43482', 98, '7', 'allrounder', NULL, 0, NULL, '1989-08-16', 'Australia', 'Right Hand Bat', 'Right Arm Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(225, '1', 'Cameron Green', '93130', 98, '8.5', 'allrounder', NULL, 0, NULL, '1999-06-03', 'Australia', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(226, '1', 'Sean Abbott', '651', 98, '6', 'allrounder', NULL, 0, NULL, '1992-02-29', 'Australia', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(227, '1', 'Adam Zampa', '1965', 98, '8', 'bowler', NULL, 0, NULL, '1992-03-31', 'Australia', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(228, '1', 'Mitchell Starc', '89', 98, '9', 'bowler', NULL, 0, NULL, '1990-01-30', 'Australia', 'Left hand Bat', 'Left Arm Fast', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(229, '1', 'Pat Cummins', '388', 98, '8', 'bowler', NULL, 0, NULL, '1993-05-08', 'Australia', 'Right Hand Bat', 'Right Arm Fast', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(230, '1', 'Josh Hazlewood', '91', 98, '8.5', 'bowler', NULL, 0, NULL, '1991-01-08', 'Australia', 'Left hand Bat', 'Right Arm Fast Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(231, '1', 'Devon Conway', '46141', 99, '9', 'keeper', NULL, 0, NULL, '1991-07-08', 'New Zealand', 'Left hand Bat', 'Right Arm Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(232, '1', 'Tom Latham', '44185', 99, '8.5', 'keeper', NULL, 0, NULL, '1992-04-02', 'New Zealand', 'Left hand Bat', 'Right Arm Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(233, '1', 'Tom Blundell', '16595', 99, '5', 'keeper', NULL, 0, NULL, '1990-09-01', 'New Zealand', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(234, '1', 'Will Young', '16609', 99, '6.5', 'batsman', NULL, 0, NULL, '1992-11-22', 'New Zealand', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(235, '1', 'Kane Williamson', '31', 99, '9', 'batsman', NULL, 0, NULL, '1990-08-08', 'New Zealand', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(236, '1', 'Mark Chapman', '1708', 99, '7', 'batsman', NULL, 0, NULL, '1994-06-27', 'New Zealand', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(237, '1', 'Daryl Mitchell', '16509', 99, '8.5', 'batsman', NULL, 0, NULL, '1991-05-20', 'New Zealand', 'Right Hand Bat', 'Right Arm Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(238, '1', 'Glenn Phillips', '1082', 99, '7', 'batsman', NULL, 0, NULL, '1996-12-06', 'New Zealand', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(239, '1', 'Rachin Ravindra', '1081', 99, '8', 'allrounder', NULL, 0, NULL, '1999-11-18', 'New Zealand', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(240, '1', 'Jimmy Neesham', '31430', 99, '6.5', 'allrounder', NULL, 0, NULL, '1990-09-17', 'New Zealand', 'Left hand Bat', 'Right Arm Medium Fast', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(241, '1', 'Mitchell Santner', '1923', 99, '8', 'allrounder', NULL, 0, NULL, '1992-02-05', 'New Zealand', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(242, '1', 'Trent Boult', '47', 99, '8.5', 'bowler', NULL, 0, NULL, '1989-07-22', 'New Zealand', 'Right Hand Bat', 'Left Arm Fast Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(243, '1', 'Lockie Ferguson', '16643', 99, '7.5', 'bowler', NULL, 0, NULL, '1991-06-13', 'New Zealand', 'Right Hand Bat', 'Right Arm Fast', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(244, '1', 'Ish Sodhi', '1927', 99, '7', 'bowler', NULL, 0, NULL, '1992-10-31', 'New Zealand', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(245, '1', 'Matt Henry', '486', 99, '7.5', 'bowler', NULL, 0, NULL, '1991-12-14', 'New Zealand', 'Right Hand Bat', 'Right Arm Fast Medium', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(246, '1', 'Tim Southee', '43', 99, '7.5', 'bowler', NULL, 0, NULL, '1988-12-11', 'New Zealand', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-28 02:20:00', '2023-10-28 02:20:00'),
(247, '1', 'Rahmanullah Gurbaz', '93570', 139, '8.5', 'keeper', NULL, 0, NULL, '2001-11-28', 'Afghanistan', 'Right Hand Bat', '', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(248, '1', 'Ikram Alikhil', '1153', 139, '6.5', 'keeper', NULL, 0, NULL, '2000-09-29', 'Afghanistan', 'Left hand Bat', '', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(249, '1', 'Hashmatullah Shahidi', '44991', 139, '7.5', 'batsman', NULL, 0, NULL, '1994-11-04', 'Afghanistan', 'Left hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(250, '1', 'Ibrahim Zadran', '45172', 139, '8', 'batsman', NULL, 0, NULL, '2001-12-12', 'Afghanistan', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(251, '1', 'Riaz Hassan', '94162', 139, '6', 'batsman', NULL, 0, NULL, '2002-11-07', 'Afghanistan', 'Right Hand Bat', '', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(252, '1', 'Rahmat Shah', '44977', 139, '7', 'batsman', NULL, 0, NULL, '1993-07-06', 'Afghanistan', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(253, '1', 'Najibullah Zadran', '321', 139, '7.5', 'batsman', NULL, 0, NULL, '1993-02-28', 'Afghanistan', 'Left hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(254, '1', 'Mohammad Nabi', '319', 139, '8', 'allrounder', NULL, 0, NULL, '1985-01-01', 'Afghanistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(255, '1', 'Abdul Rahman', '94154', 139, '5.5', 'allrounder', NULL, 0, NULL, '2001-11-22', 'Afghanistan', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(256, '1', 'Azmatullah Omarzai', '93481', 139, '7.5', 'allrounder', NULL, 0, NULL, '2000-03-24', 'Afghanistan', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(257, '1', 'Gulbadin Naib', '428', 139, '6', 'allrounder', NULL, 0, NULL, '1991-06-04', 'Afghanistan', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(258, '1', 'Rashid Khan', '1157', 139, '9', 'bowler', NULL, 0, NULL, '1998-09-20', 'Afghanistan', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(259, '1', 'Mujeeb Ur Rahman', '93418', 139, '8.5', 'bowler', NULL, 0, NULL, '2001-03-28', 'Afghanistan', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(260, '1', 'Noor Ahmad', '102210', 139, '7', 'bowler', NULL, 0, NULL, '2005-01-03', 'Afghanistan', 'Right Hand Bat', 'Left Arm Wrist Spin', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(261, '1', 'Fazalhaq Farooqi', '62778', 139, '8', 'bowler', NULL, 0, NULL, '2000-09-22', 'Afghanistan', 'Right Hand Bat', 'Left Arm Fast Medium', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(262, '1', 'Naveen-ul-Haq', '1404', 139, '7.5', 'bowler', NULL, 0, NULL, '1999-09-23', 'Afghanistan', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(263, '1', 'Fareed Malik', '59085', 139, '5.5', 'bowler', NULL, 0, NULL, '1994-08-10', 'Afghanistan', 'Left hand Bat', 'Left Arm Fast Medium', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(264, '1', 'Sharafuddin Ashraf', '45009', 139, '5.5', 'bowler', NULL, 0, NULL, '1995-01-10', 'Afghanistan', 'Right Hand Bat', 'Left Arm Orthodox', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(265, '1', 'Kusal Mendis', '43953', 140, '9', 'keeper', NULL, 0, NULL, '1995-02-02', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(266, '1', 'Sadeera Samarawickrama', '43676', 140, '8', 'keeper', NULL, 0, NULL, '1995-08-30', 'Sri Lanka', 'Right Hand Bat', '', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(267, '1', 'Kusal Perera', '460', 140, '7', 'batsman', NULL, 0, NULL, '1990-08-17', 'Sri Lanka', 'Left hand Bat', '', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(268, '1', 'Dimuth Karunaratne', '57', 140, '7.5', 'batsman', NULL, 0, NULL, '1988-04-21', 'Sri Lanka', 'Left hand Bat', 'Right Arm Medium', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(269, '1', 'Pathum Nissanka', '84107', 140, '8.5', 'batsman', NULL, 0, NULL, '1998-05-18', 'Sri Lanka', 'Right Hand Bat', '', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(270, '1', 'Charith Asalanka', '1137', 140, '7', 'batsman', NULL, 0, NULL, '1997-06-29', 'Sri Lanka', 'Left hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(271, '1', 'Dushan Hemantha', '43931', 140, '5.5', 'allrounder', NULL, 0, NULL, '1994-05-24', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Leg Spin', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(272, '1', 'Dhananjaya de Silva', '43745', 140, '7.5', 'allrounder', NULL, 0, NULL, '1991-09-06', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(273, '1', 'Dasun Shanaka', '1734', 140, '6.5', 'allrounder', NULL, 0, NULL, '1991-09-09', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Medium', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(274, '1', 'Dunith Wellalage', '111141', 140, '7', 'allrounder', NULL, 0, NULL, '2003-01-09', 'Sri Lanka', 'Left hand Bat', 'Left Arm Orthodox', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(275, '1', 'Chamika Karunaratne', '43761', 140, '6', 'allrounder', NULL, 0, NULL, '1996-05-29', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(276, '1', 'Angelo Mathews', '59', 140, '7', 'batsman', NULL, 0, NULL, '1987-06-02', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Medium', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(277, '1', 'Kasun Rajitha', '44001', 140, '8', 'bowler', NULL, 0, NULL, '1993-06-01', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Medium Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(278, '1', 'Maheesh Theekshana', '94457', 140, '8.5', 'bowler', NULL, 0, NULL, '2000-08-01', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Off Break', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(279, '1', 'Lahiru Kumara', '1142', 140, '6', 'bowler', NULL, 0, NULL, '1997-02-13', 'Sri Lanka', 'Left hand Bat', 'Right Arm Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(280, '1', 'Dilshan Madushanka', '95301', 140, '7.5', 'bowler', NULL, 0, NULL, '2000-09-18', 'Sri Lanka', 'Right Hand Bat', 'Left Arm Fast Medium', '2023-10-30 04:04:40', '2023-10-30 04:04:40'),
(281, '1', 'Dushmantha Chameera', '462', 140, '7', 'bowler', NULL, 0, NULL, '1992-01-11', 'Sri Lanka', 'Right Hand Bat', 'Right Arm Fast', '2023-10-30 04:04:40', '2023-10-30 04:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `pricecards`
--

CREATE TABLE `pricecards` (
  `id` int NOT NULL,
  `winners` int NOT NULL,
  `price` double DEFAULT NULL,
  `price_percent` double DEFAULT NULL,
  `min_position` int NOT NULL,
  `max_position` int NOT NULL,
  `total` int DEFAULT NULL,
  `challenge_id` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricecards`
--

INSERT INTO `pricecards` (`id`, `winners`, `price`, `price_percent`, `min_position`, `max_position`, `total`, `challenge_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 15, 0, 1, 3000, 1, 'Percentage', '2023-10-26 14:19:30', '2023-10-26 14:19:30'),
(2, 1, 0, 12, 1, 2, 2400, 1, 'Percentage', '2023-10-26 14:19:43', '2023-10-26 14:19:43'),
(3, 3, 0, 10, 2, 5, 6000, 1, 'Percentage', '2023-10-26 14:20:06', '2023-10-26 14:20:06'),
(4, 10, 0, 3, 5, 15, 6000, 1, 'Percentage', '2023-10-26 14:20:42', '2023-10-26 14:20:42'),
(5, 5, 0, 2, 15, 20, 2000, 1, 'Percentage', '2023-10-26 14:20:56', '2023-10-26 14:20:56'),
(6, 6, 0, 0.5, 20, 26, 600, 1, 'Percentage', '2023-10-26 14:21:54', '2023-10-26 14:21:54'),
(7, 1, 150, NULL, 0, 1, 150, 2, 'Amount', '2023-10-26 14:23:33', '2023-10-26 14:23:33'),
(8, 1, 100, NULL, 0, 1, 100, 3, 'Amount', '2023-10-26 14:24:19', '2023-10-26 14:24:19'),
(14, 1, 0, 100, 0, 1, 30, 5, 'Percentage', '2023-10-26 18:15:49', '2023-10-26 18:15:49'),
(15, 1, 0, 100, 0, 1, 1400, 6, 'Percentage', '2023-10-27 11:19:10', '2023-10-27 11:19:10'),
(16, 1, 0, 75, 0, 1, 3375, 7, 'Percentage', '2023-10-27 11:25:38', '2023-10-27 11:25:38'),
(17, 1, 0, 25, 1, 2, 1125, 7, 'Percentage', '2023-10-27 11:25:48', '2023-10-27 11:25:48'),
(18, 1, 0, 100, 0, 1, 900, 8, 'Percentage', '2023-10-27 11:31:55', '2023-10-27 11:31:55'),
(19, 1, 0, 75, 0, 1, 1500, 4, 'Percentage', '2023-10-27 13:19:41', '2023-10-27 13:19:41'),
(20, 1, 0, 25, 1, 2, 500, 4, 'Percentage', '2023-10-27 13:19:52', '2023-10-27 13:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `amount` double NOT NULL,
  `joinid` int NOT NULL,
  `challengeid` int NOT NULL,
  `matchkey` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`id`, `userid`, `amount`, `joinid`, `challengeid`, `matchkey`, `transaction_id`, `reason`, `created_at`, `updated_at`) VALUES
(1, 11, 100, 1, 2, '5', 'BMS-8631698340450-11', 'Match canceled', '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(2, 9, 100, 2, 2, '5', 'BMS-6561698340450-9', 'Match canceled', '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(3, 11, 100, 3, 7, '5', 'BMS-9171698340450-11', 'Match canceled', '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(4, 9, 100, 4, 7, '5', 'BMS-3191698340451-9', 'Match canceled', '2023-10-26 17:14:11', '2023-10-26 17:14:11'),
(5, 11, 49, 5, 13, '29', 'BMS-3951698413169-11', 'Match canceled', '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(6, 11, 49, 6, 13, '29', 'BMS-6751698413169-11', 'Match canceled', '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(7, 11, 49, 7, 13, '29', 'BMS-9711698413169-11', 'Match canceled', '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(8, 11, 49, 8, 13, '29', 'BMS-5841698413170-11', 'Match canceled', '2023-10-27 13:26:10', '2023-10-27 13:26:10'),
(9, 11, 49, 9, 13, '29', 'BMS-2121698413170-11', 'Match canceled', '2023-10-27 13:26:10', '2023-10-27 13:26:10'),
(10, 12, 20, 11, 12, '77', 'BMS-9201698413175-12', 'Match canceled', '2023-10-27 13:26:15', '2023-10-27 13:26:15'),
(11, 9, 100, 10, 22, '45', 'BMS-4721698418356-9', 'Match canceled', '2023-10-27 14:52:36', '2023-10-27 14:52:36'),
(12, 11, 100, 12, 22, '45', 'BMS-7361698418356-11', 'Match canceled', '2023-10-27 14:52:36', '2023-10-27 14:52:36'),
(13, 9, 500, 18, 49, '47', 'BMS-9531698426002-9', 'challenge cancel', '2023-10-27 17:00:02', '2023-10-27 17:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `result_matches`
--

CREATE TABLE `result_matches` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `player_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `innings` int NOT NULL DEFAULT '1',
  `batting` int NOT NULL DEFAULT '0',
  `bowling` int NOT NULL DEFAULT '0',
  `runs` int NOT NULL DEFAULT '0',
  `six` int NOT NULL DEFAULT '0',
  `fours` int NOT NULL DEFAULT '0',
  `hitter` int NOT NULL DEFAULT '0',
  `thrower` int NOT NULL DEFAULT '0',
  `duck` int NOT NULL DEFAULT '0',
  `wicket` int NOT NULL DEFAULT '0',
  `wicket_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wplayerid` int DEFAULT '0',
  `maiden_over` int NOT NULL DEFAULT '0',
  `catch` int NOT NULL DEFAULT '0',
  `stumbed` int NOT NULL DEFAULT '0',
  `runouts` int NOT NULL DEFAULT '0',
  `starting11` int NOT NULL DEFAULT '0',
  `bball` int NOT NULL DEFAULT '0',
  `balls` int NOT NULL DEFAULT '0',
  `overs` int NOT NULL DEFAULT '0',
  `out_str` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `batting_points` double DEFAULT '0',
  `bowling_points` double NOT NULL DEFAULT '0',
  `fielding_points` double NOT NULL DEFAULT '0',
  `extra_points` double NOT NULL DEFAULT '0',
  `negative_points` double NOT NULL DEFAULT '0',
  `strike_rate` double NOT NULL DEFAULT '0',
  `economy_rate` double NOT NULL DEFAULT '0',
  `grun` double NOT NULL DEFAULT '0',
  `battingdots` double NOT NULL DEFAULT '0',
  `balldots` double NOT NULL DEFAULT '0',
  `total_points` double NOT NULL DEFAULT '0',
  `man_of_match` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `result_matches`
--

INSERT INTO `result_matches` (`id`, `player_id`, `player_key`, `match_key`, `innings`, `batting`, `bowling`, `runs`, `six`, `fours`, `hitter`, `thrower`, `duck`, `wicket`, `wicket_type`, `wplayerid`, `maiden_over`, `catch`, `stumbed`, `runouts`, `starting11`, `bball`, `balls`, `overs`, `out_str`, `batting_points`, `bowling_points`, `fielding_points`, `extra_points`, `negative_points`, `strike_rate`, `economy_rate`, `grun`, `battingdots`, `balldots`, `total_points`, `man_of_match`, `extra`) VALUES
(1, 1, '120908', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(2, 2, '125725', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(3, 3, '122050', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(4, 4, '86694', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(5, 5, '117123', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(6, 6, '113091', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(7, 7, '132865', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(8, 8, '126407', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(9, 9, '119620', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(10, 10, '121058', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(11, 11, '104626', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(12, 12, '125724', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(13, 13, '95987', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(14, 14, '133248', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(15, 15, '133249', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(16, 16, '104632', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(17, 17, '124424', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(18, 18, '114444', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(19, 19, '113648', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(20, 20, '123784', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(21, 21, '115430', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(22, 22, '115042', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(23, 23, '115048', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(24, 24, '125624', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(25, 25, '123662', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(26, 26, '119007', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(27, 27, '101192', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(28, 28, '115045', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(29, 29, '115047', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(30, 30, '121391', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(31, 31, '115046', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(32, 32, '121095', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(33, 33, '101194', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(34, 34, '113678', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(35, 35, '116925', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(36, 36, '115050', '5', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(37, 71, '48460', '29', 1, 1, 0, 9, 0, 1, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 17, 0, 0, 'c L Ngidi b M Jansen', 10, 0, 0, 0, 0, 52.94, 0, 0, 0, 0, 14, NULL, 0),
(38, 73, '45199', '29', 1, 1, 0, 12, 0, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 18, 0, 0, 'c H Klaasen b M Jansen', 14, 0, 0, 0, 0, 66.67, 0, 0, 0, 0, 18, NULL, 0),
(39, 69, '43371', '29', 1, 1, 0, 50, 1, 4, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 65, 0, 0, 'c QD Kock b T Shamsi', 60, 0, 0, 0, 0, 76.92, 0, 0, 0, 0, 64, NULL, 0),
(40, 67, '44054', '29', 1, 1, 0, 31, 1, 4, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 27, 0, 0, 'c QD Kock b G Coetzee', 39, 0, 0, 0, 0, 114.81, 0, 0, 0, 0, 43, NULL, 0),
(41, 74, '45420', '29', 1, 1, 0, 52, 0, 7, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 52, 0, 0, 'c QD Kock b T Shamsi', 65, 0, 0, 0, 0, 100, 0, 0, 0, 0, 69, NULL, 0),
(42, 75, '1167', '29', 1, 1, 0, 43, 2, 3, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 36, 0, 0, 'c K Maharaj b G Coetzee', 52, 0, 0, 0, 0, 119.44, 0, 0, 0, 0, 56, NULL, 0),
(43, 72, '1771', '29', 1, 1, 1, 21, 1, 1, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 31, 12, 2, 'c H Klaasen b T Shamsi', 24, 0, 0, 0, 0, 67.74, 7.5, 15, 0, 6, 28, NULL, 0),
(44, 78, '92991', '29', 1, 1, 1, 2, 0, 0, 0, 0, 0, 1, 'caught', 0, 0, 0, 0, 0, 1, 4, 24, 4, 'c K Maharaj b T Shamsi', 2, 25, 0, 0, 0, 50, 6.5, 26, 0, 15, 31, NULL, 0),
(45, 81, '44070', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(46, 82, '44099', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(47, 79, '92381', '29', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 1, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(48, 68, '96798', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(49, 70, '43370', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(50, 76, '1760', '29', 1, 1, 1, 24, 2, 1, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 24, 12, 2, 'c D Miller b M Jansen', 31, 0, 0, 0, 0, 100, 8, 16, 0, 5, 35, NULL, 0),
(51, 77, '45397', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(52, 80, '58152', '29', 1, 1, 0, 7, 1, 0, 0, 0, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 9, 0, 0, 'c QD Kock b L Ngidi', 9, 0, 8, 0, 0, 77.78, 0, 0, 0, 0, 21, NULL, 0),
(53, 83, '95942', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(54, 84, '58608', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(55, 85, '159', '29', 1, 1, 0, 24, 0, 5, 0, 0, 0, 0, 'caught', 0, 0, 4, 0, 0, 1, 14, 0, 0, 'c M Wasim b S Afridi', 29, 0, 36, 0, 0, 171.43, 0, 0, 0, 0, 69, NULL, 0),
(56, 89, '49700', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(57, 87, '46135', '29', 1, 1, 0, 6, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 11, 0, 0, 'not out', 6, 0, 0, 0, 0, 54.55, 0, 0, 0, 0, 10, NULL, 0),
(58, 91, '46117', '29', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 24, 4, 'not out', 0, 0, 0, 0, 0, 0, 5, 20, 0, 12, 4, NULL, 0),
(59, 86, '46124', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 20, NULL, 0),
(60, 90, '167', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 12, NULL, 0),
(61, 92, '60394', '29', 1, 0, 1, 0, 0, 0, 0, 0, 0, 3, NULL, 0, 1, 0, 0, 0, 1, 0, 54, 9, 'not out', 0, 79, 0, 0, 0, 0, 4.78, 43, 0, 40, 83, NULL, 8),
(62, 96, '60342', '29', 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 0, 0, 0, 0, 0, 1, 0, 42, 7, 'not out', 0, 50, 0, 0, 0, 0, 6, 42, 0, 20, 54, NULL, 0),
(63, 98, '49706', '29', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 2, 0, 0, 1, 0, 54, 9, 'not out', 0, 0, 16, 0, 0, 0, 6.22, 56, 0, 30, 20, NULL, 0),
(64, 97, '1953', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(65, 99, '47487', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(66, 88, '46139', '29', 1, 1, 0, 21, 0, 4, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 23, 0, 0, 'not out', 25, 0, 0, 0, 0, 91.3, 0, 0, 0, 0, 29, NULL, 0),
(67, 93, '53000', '29', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(68, 94, '46131', '29', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 1, 0, 44, 7, 'not out', 0, 25, 8, 0, 0, 0, 5.87, 45, 0, 26, 37, NULL, 0),
(69, 95, '46126', '29', 1, 0, 1, 0, 0, 0, 0, 0, 0, 4, NULL, 0, 0, 0, 0, 0, 1, 0, 60, 10, 'not out', 0, 104, 0, 0, 0, 0, 6, 60, 0, 28, 108, NULL, 3),
(70, 100, '93936', '45', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 1, 0, 18, 3, 'not out', 0, 27, 8, 0, 0, 0, 6.67, 20, 0, 5, 39, NULL, 0),
(71, 101, '94180', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(72, 102, '112797', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(73, 103, '119554', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(74, 104, '132867', '45', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 1, 0, 6, 1, 'not out', 0, 25, 8, 0, 0, 0, 2, 2, 0, 5, 37, NULL, 0),
(75, 105, '127258', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(76, 106, '125659', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(77, 107, '125442', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 1, 0, 1, 0, 0, 0, 'not out', 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 24, NULL, 0),
(78, 108, '95754', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(79, 109, '117125', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(80, 110, '113087', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(81, 111, '119520', '45', 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 0, 0, 2, 0, 0, 1, 0, 24, 4, 'not out', 0, 56, 16, 0, 0, 0, 4.5, 18, 0, 10, 76, NULL, 0),
(82, 112, '94495', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(83, 113, '121943', '45', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 6, 1, 'not out', 0, 0, 0, 0, 0, 0, 10, 10, 0, 2, 4, NULL, 0),
(84, 114, '113697', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(85, 115, '101194', '45', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 1, 0, 18, 3, 'not out', 0, 31, 0, 0, 0, 0, 3.33, 10, 0, 11, 35, NULL, 0),
(86, 116, '84578', '45', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 1, 0, 18, 3, 'not out', 0, 31, 0, 0, 0, 0, 4, 12, 0, 13, 35, NULL, 0),
(87, 117, '132868', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(88, 118, '124246', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(89, 119, '127322', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(90, 120, '132858', '45', 1, 1, 0, 26, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 27, 0, 0, 'not out', 27, 0, 0, 0, 0, 96.3, 0, 0, 0, 0, 31, NULL, 0),
(91, 121, '132859', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(92, 122, '106613', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(93, 123, '104659', '45', 1, 1, 0, 6, 0, 1, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 15, 0, 0, 'c F Nawaz b Adithya Shetty', 1, 0, 0, 0, 0, 40, 0, 0, 0, 0, 5, NULL, 0),
(94, 124, '132860', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(95, 125, '104620', '45', 1, 1, 0, 9, 0, 1, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 8, 0, 0, 'c Adithya Shetty b Mohammad Ayaz', 10, 0, 0, 0, 0, 112.5, 0, 0, 0, 0, 14, NULL, 0),
(96, 126, '112808', '45', 1, 1, 0, 4, 0, 0, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 7, 0, 0, 'c & b Adithya Shetty', 4, 0, 0, 0, 0, 57.14, 0, 0, 0, 0, 8, NULL, 0),
(97, 127, '119572', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(98, 128, '112837', '45', 1, 1, 0, 6, 0, 0, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 9, 0, 0, 'c & b Madhav Manoj', 6, 0, 0, 0, 0, 66.67, 0, 0, 0, 0, 10, NULL, 0),
(99, 129, '132794', '45', 1, 1, 0, 6, 0, 1, 0, 0, 0, 0, 'stumped', 0, 0, 0, 0, 0, 1, 8, 0, 0, 'st Y Sabnani b F Nawaz', 7, 0, 0, 0, 0, 75, 0, 0, 0, 0, 11, NULL, 0),
(100, 130, '113321', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(101, 131, '114666', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(102, 132, '123665', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(103, 133, '120848', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(104, 134, '108145', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(105, 135, '127265', '45', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(106, 136, '120222', '46', 1, 1, 1, 0, 0, 0, 0, 0, 1, 2, 'caught', 0, 0, 1, 0, 0, 1, 1, 12, 2, 'c Khalid Butt b Raheel Khan', 0, 62, 8, 0, 0, 0, 7.5, 15, 0, 4, 72, NULL, 0),
(107, 137, '123803', '46', 1, 1, 0, 9, 0, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 8, 0, 0, 'c Raheel Khan b T Abbas', 11, 0, 0, 0, 0, 112.5, 0, 0, 0, 0, 15, NULL, 0),
(108, 138, '129543', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(109, 139, '127641', '46', 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 'bowled', 168, 0, 0, 0, 0, 1, 3, 0, 0, 'b T Abbas', 2, 0, 0, 0, 0, 66.67, 0, 0, 0, 0, 6, NULL, 0),
(110, 140, '120214', '46', 1, 1, 1, 18, 1, 2, 0, 0, 0, 2, 'bowled', 169, 0, 1, 0, 0, 1, 7, 12, 2, 'b Sibtain Raza', 28, 62, 8, 0, 0, 257.14, 7.5, 15, 0, 4, 102, NULL, 0),
(111, 141, '124522', '46', 1, 1, 1, 5, 0, 0, 0, 0, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 7, 12, 2, 'c Farhan Meer b Sibtain Raza', 3, -2, 8, 0, 0, 71.43, 14.5, 29, 0, 4, 13, NULL, 0),
(112, 142, '129508', '46', 1, 1, 1, 41, 3, 1, 0, 0, 0, 3, '', 0, 0, 1, 0, 0, 1, 18, 12, 2, 'not out', 62, 99, 8, 0, 0, 227.78, 11, 22, 0, 6, 173, NULL, 0),
(113, 143, '127630', '46', 1, 1, 0, 23, 2, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 13, 0, 0, 'c YI Butt b Sibtain Raza', 33, 0, 0, 0, 0, 176.92, 0, 0, 0, 0, 37, NULL, 0),
(114, 144, '129566', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(115, 145, '129554', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(116, 146, '132087', '46', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(117, 147, '132088', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(118, 148, '132089', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(119, 149, '132090', '46', 1, 1, 1, 7, 0, 1, 0, 0, 0, 0, 'runout', 0, 0, 1, 0, 0, 1, 3, 12, 2, 'runout (Mohammad Ahsan / YI Butt)', 8, 0, 8, 0, 0, 233.33, 13, 26, 0, 3, 20, NULL, 0),
(120, 150, '132091', '46', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 1, 0, 12, 2, 'not out', 0, 23, 0, 0, 0, 0, 14.5, 29, 0, 1, 27, NULL, 0),
(121, 151, '132092', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(122, 152, '132093', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(123, 153, '132094', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(124, 154, '132095', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(125, 155, '57158', '46', 1, 1, 0, 17, 0, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 10, 0, 0, 'c & b M Hisham', 21, 0, 0, 0, 0, 170, 0, 0, 0, 0, 25, NULL, 0),
(126, 156, '120167', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, 0),
(127, 157, '126741', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(128, 158, '123850', '46', 1, 1, 1, 16, 1, 2, 0, 0, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 8, 6, 1, 'c H Mohammed b A Oravanakundil', 26, -6, 8, 0, 0, 200, 21, 21, 0, 0, 32, NULL, 0),
(129, 159, '132253', '46', 1, 1, 0, 6, 0, 1, 0, 1, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 7, 0, 0, 'c HK Nair b A Oravanakundil', 7, 0, 14, 0, 0, 85.71, 0, 0, 0, 0, 25, NULL, 0),
(130, 160, '124534', '46', 1, 1, 0, 19, 1, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 10, 0, 0, 'c A Oravanakundil b M Hisham', 27, 0, 0, 0, 0, 190, 0, 0, 0, 0, 31, NULL, 0),
(131, 161, '125155', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(132, 162, '57150', '46', 1, 1, 1, 36, 4, 2, 0, 0, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 15, 6, 1, 'c N Prakash b R Rajan', 60, 0, 8, 0, 0, 240, 13, 13, 0, 0, 72, NULL, 0),
(133, 163, '127724', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(134, 164, '127729', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(135, 165, '57154', '46', 1, 1, 0, 9, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 6, 0, 0, 'not out', 12, 0, 0, 0, 0, 150, 0, 0, 0, 0, 16, NULL, 0),
(136, 166, '95569', '46', 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 12, 2, 'not out', 0, 0, 6, 0, 0, 0, 10, 20, 0, 2, 10, NULL, 0),
(137, 167, '127725', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(138, 168, '127731', '46', 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, NULL, 0, 0, 0, 0, 0, 1, 0, 12, 2, 'not out', 0, 66, 0, 0, 0, 0, 12, 24, 0, 7, 70, NULL, 0),
(139, 169, '57160', '46', 1, 1, 1, 0, 0, 0, 0, 0, 0, 3, 'bowled', 142, 0, 0, 0, 0, 1, 2, 12, 2, 'b A Oravanakundil', 0, 103, 0, 0, 0, 0, 7.5, 15, 0, 6, 107, NULL, 0),
(140, 170, '62480', '46', 1, 1, 1, 8, 1, 0, 0, 0, 0, 1, '', 0, 0, 1, 0, 0, 1, 2, 12, 2, 'not out', 10, 25, 8, 0, 0, 400, 10, 20, 0, 4, 47, NULL, 0),
(141, 171, '120132', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(142, 172, '127732', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(143, 173, '132718', '46', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(144, 174, '104648', '47', 1, 1, 0, 8, 0, 0, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 24, 0, 0, 'c D Sarhadi b PV Vimalnadh', 2, 0, 0, 0, 0, 33.33, 0, 0, 0, 0, 6, NULL, 0),
(145, 175, '53560', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(146, 176, '113402', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(147, 177, '86694', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(148, 178, '104659', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(149, 179, '114483', '47', 1, 1, 1, 4, 0, 0, 0, 0, 0, 1, 'bowled', 206, 0, 0, 0, 0, 1, 14, 6, 1, 'b R Mani', -2, 25, 0, 0, 0, 28.57, 4, 4, 0, 3, 27, NULL, 0),
(150, 180, '112799', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(151, 181, '127258', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(152, 182, '132820', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(153, 183, '132859', '47', 1, 1, 0, 5, 0, 1, 0, 0, 0, 0, 'caught', 0, 0, 3, 0, 0, 1, 3, 0, 0, 'c K Rojith b Aquib Khan', 6, 0, 28, 0, 0, 166.67, 0, 0, 0, 0, 38, NULL, 0),
(154, 184, '124058', '47', 1, 1, 1, 29, 0, 4, 0, 0, 0, 2, 'caught', 0, 0, 0, 0, 0, 1, 26, 24, 4, 'c PV Vimalnadh b R Mani', 33, 54, 0, 0, 0, 111.54, 5, 20, 0, 9, 91, NULL, 0),
(155, 185, '94178', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(156, 186, '113403', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(157, 187, '121124', '47', 1, 1, 0, 8, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 9, 0, 0, 'not out', 9, 0, 0, 0, 0, 88.89, 0, 0, 0, 0, 13, NULL, 0),
(158, 188, '121126', '47', 1, 1, 0, 15, 0, 3, 0, 0, 0, 0, 'caught', 0, 0, 2, 0, 0, 1, 12, 0, 0, 'c D Sarhadi b Aquib Khan', 18, 0, 16, 0, 0, 125, 0, 0, 0, 0, 38, NULL, 0),
(159, 189, '104652', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(160, 190, '132821', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(161, 191, '116382', '47', 1, 1, 1, 5, 0, 0, 0, 0, 0, 2, '', 0, 0, 0, 0, 0, 1, 10, 24, 4, 'not out', 1, 64, 0, 0, 0, 50, 3.25, 13, 0, 12, 69, NULL, 0),
(162, 192, '121201', '47', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 18, 3, 'not out', 0, 4, 0, 0, 0, 0, 5.67, 17, 0, 8, 8, NULL, 0),
(163, 193, '104641', '47', 1, 1, 0, 13, 2, 0, 0, 0, 0, 0, 'caught', 0, 0, 2, 0, 0, 1, 8, 0, 0, 'c PV Vimalnadh b A Farzeen', 17, 0, 16, 0, 0, 162.5, 0, 0, 0, 0, 37, NULL, 0),
(164, 194, '106626', '47', 1, 1, 1, 2, 0, 0, 0, 0, 0, 5, 'runout', 0, 0, 0, 0, 0, 1, 11, 24, 4, 'runout (D Sarhadi / A Hrithwik)', -4, 155, 0, 0, 0, 18.18, 4.75, 19, 0, 13, 155, NULL, 0),
(165, 195, '106610', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(166, 196, '124689', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(167, 197, '114447', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(168, 198, '122305', '47', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 1, 0, 12, 2, 'not out', 0, 0, 8, 0, 0, 0, 9, 18, 0, 4, 12, NULL, 0),
(169, 199, '124403', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(170, 200, '124404', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(171, 201, '105741', '47', 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 'caught', 0, 0, 0, 0, 0, 1, 1, 6, 1, 'c HA Khan b D Qureshi', 0, 0, 0, 0, 0, 0, 9, 9, 0, 3, 2, NULL, 0),
(172, 202, '132768', '47', 1, 1, 0, 12, 0, 0, 1, 0, 0, 0, 'bowled', 191, 0, 2, 0, 0, 1, 24, 0, 0, 'b M Azhar', 8, 0, 22, 0, 0, 50, 0, 0, 0, 0, 34, NULL, 0),
(173, 203, '115645', '47', 1, 1, 0, 15, 0, 1, 0, 1, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 15, 0, 0, 'c HA Khan b M Azhar', 16, 0, 6, 0, 0, 100, 0, 0, 0, 0, 26, NULL, 0),
(174, 204, '105743', '47', 1, 1, 0, 4, 0, 1, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 6, 0, 0, 'c A Saleem b D Qureshi', 5, 0, 0, 0, 0, 66.67, 0, 0, 0, 0, 9, NULL, 0),
(175, 205, '105053', '47', 1, 1, 0, 7, 0, 0, 0, 0, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 14, 0, 0, 'c F Altaf b B A Hussain', 3, 0, 8, 0, 0, 50, 0, 0, 0, 0, 15, NULL, 0),
(176, 206, '112796', '47', 1, 1, 1, 14, 0, 2, 0, 0, 0, 2, 'caught', 0, 0, 0, 0, 0, 1, 8, 24, 4, 'c I Khattak b D Qureshi', 16, 64, 0, 0, 0, 175, 3.25, 13, 0, 16, 84, NULL, 0),
(177, 207, '124406', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(178, 208, '96538', '47', 1, 1, 1, 7, 0, 1, 0, 0, 0, 2, 'caught', 0, 0, 0, 0, 0, 1, 4, 24, 4, 'c HA Khan b B A Hussain', 8, 56, 0, 0, 0, 175, 4.5, 18, 0, 15, 68, NULL, 0),
(179, 209, '124407', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(180, 210, '124877', '47', 1, 1, 0, 7, 0, 1, 0, 0, 0, 0, 'lbw', 194, 0, 0, 0, 0, 1, 5, 0, 0, 'lbw b D Qureshi', 8, 0, 0, 0, 0, 140, 0, 0, 0, 0, 12, NULL, 0),
(181, 211, '93246', '47', 1, 1, 1, 6, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, 1, 10, 14, 2, 'not out', 4, 25, 0, 0, 0, 60, 8.8, 22, 0, 7, 33, NULL, 0),
(182, 212, '124413', '47', 1, 1, 1, 8, 0, 1, 0, 0, 0, 1, 'caught', 0, 1, 2, 0, 0, 1, 11, 24, 4, 'c F Altaf b D Qureshi', 9, 43, 16, 0, 0, 72.73, 3.25, 13, 0, 15, 72, NULL, 0),
(183, 213, '124415', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(184, 214, '125530', '47', 1, 1, 1, 8, 0, 0, 0, 0, 0, 0, 'caught', 0, 2, 0, 0, 0, 1, 10, 24, 4, 'c A Saleem b S Bahzad', 8, 30, 0, 0, 0, 80, 3.75, 15, 0, 17, 42, NULL, 0),
(185, 215, '124414', '47', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(186, 216, '55846', '54', 1, 1, 0, 38, 1, 4, 1, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 28, 0, 0, 'c G Phillips b T Boult', 48, 0, 6, 0, 0, 135.71, 0, 0, 0, 0, 58, NULL, 0),
(187, 217, '55106', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(188, 218, '71', '54', 1, 1, 0, 81, 6, 5, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 65, 0, 0, 'c & b G Phillips', 106, 0, 0, 0, 0, 124.62, 0, 0, 0, 0, 110, NULL, 0),
(189, 219, '77', '54', 1, 1, 0, 18, 0, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 17, 0, 0, 'c T Boult b G Phillips', 20, 0, 0, 0, 0, 105.88, 0, 0, 0, 0, 24, NULL, 0),
(190, 220, '43471', '54', 1, 1, 0, 109, 7, 10, 0, 0, 0, 0, 'bowled', 238, 0, 0, 0, 0, 1, 67, 0, 0, 'b G Phillips', 147, 0, 0, 0, 0, 162.69, 0, 0, 0, 0, 151, NULL, 0),
(191, 221, '53601', '54', 1, 1, 0, 18, 0, 2, 0, 1, 0, 0, 'caught', 0, 0, 2, 0, 0, 1, 26, 0, 0, 'c R Ravindra b M Santner', 20, 0, 22, 0, 0, 69.23, 0, 0, 0, 0, 46, NULL, 0),
(192, 222, '83', '54', 1, 1, 1, 36, 0, 2, 0, 0, 0, 0, 'bowled', 241, 0, 0, 0, 0, 1, 51, 12, 2, 'b M Santner', 38, 0, 0, 0, 0, 70.59, 9, 18, 0, 3, 42, NULL, 0),
(193, 223, '81', '54', 1, 1, 1, 41, 2, 5, 0, 0, 0, 1, 'caught', 0, 0, 1, 0, 0, 1, 24, 60, 10, 'c T Boult b J Neesham', 56, 25, 8, 0, 0, 170.83, 6.2, 62, 0, 22, 93, NULL, 0),
(194, 224, '43482', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(195, 225, '93130', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(196, 226, '651', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(197, 227, '1965', '54', 1, 1, 1, 0, 0, 0, 0, 0, 0, 3, 'bowled', 242, 0, 0, 0, 0, 1, 3, 60, 10, 'b T Boult', 0, 73, 0, 0, 0, 0, 7.4, 74, 0, 22, 77, NULL, 0),
(198, 228, '89', '54', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'caught', 0, 0, 3, 0, 0, 1, 3, 54, 9, 'c J Neesham b M Henry', 1, -6, 28, 0, 0, 33.33, 9.89, 89, 0, 21, 27, NULL, 0),
(199, 229, '388', '54', 1, 1, 1, 37, 4, 2, 0, 0, 0, 2, 'lbw', 242, 0, 0, 0, 0, 1, 14, 60, 10, 'lbw b T Boult', 47, 50, 0, 0, 0, 264.29, 6.6, 66, 0, 26, 101, NULL, 0),
(200, 230, '91', '54', 1, 1, 1, 0, 0, 0, 0, 0, 0, 2, '', 0, 0, 2, 0, 0, 1, 0, 54, 9, 'not out', 0, 48, 16, 0, 0, 0, 7.78, 70, 0, 24, 68, NULL, 0),
(201, 231, '46141', '54', 1, 1, 0, 28, 0, 6, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 17, 0, 0, 'c M Starc b J Hazlewood', 34, 0, 0, 0, 0, 164.71, 0, 0, 0, 0, 38, NULL, 0),
(202, 232, '44185', '54', 1, 1, 0, 21, 0, 2, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 22, 0, 0, 'c J Hazlewood b A Zampa', 23, 0, 0, 0, 0, 95.45, 0, 0, 0, 0, 27, NULL, 0),
(203, 233, '16595', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(204, 234, '16609', '54', 1, 1, 0, 32, 1, 4, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 37, 0, 0, 'c M Starc b J Hazlewood', 38, 0, 0, 0, 0, 86.49, 0, 0, 0, 0, 42, NULL, 0),
(205, 235, '31', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(206, 236, '1708', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(207, 237, '16509', '54', 1, 1, 0, 54, 1, 6, 0, 0, 0, 0, 'caught', 0, 0, 0, 0, 0, 1, 51, 0, 0, 'c M Starc b A Zampa', 68, 0, 0, 0, 0, 105.88, 0, 0, 0, 0, 72, NULL, 0),
(208, 238, '1082', '54', 1, 1, 1, 12, 0, 1, 0, 0, 0, 3, 'caught', 0, 0, 2, 0, 0, 1, 16, 60, 10, 'c M Labuschagne b G Maxwell', 13, 85, 16, 0, 0, 75, 3.7, 37, 0, 30, 118, NULL, 0),
(209, 239, '1081', '54', 1, 1, 1, 116, 5, 9, 0, 0, 0, 0, 'caught', 0, 0, 1, 0, 0, 1, 89, 48, 8, 'c M Labuschagne b P Cummins', 147, -2, 8, 0, 0, 130.34, 7, 56, 0, 18, 157, NULL, 0),
(210, 240, '31430', '54', 1, 1, 1, 58, 3, 3, 0, 0, 0, 1, 'runout', 0, 0, 1, 0, 0, 1, 39, 12, 2, 'runout (J Inglis / M Labuschagne)', 77, 25, 8, 0, 0, 148.72, 16, 32, 0, 4, 114, NULL, 0),
(211, 241, '1923', '54', 1, 1, 1, 17, 1, 1, 0, 0, 0, 2, 'caught', 0, 0, 0, 0, 0, 1, 12, 60, 10, 'c G Maxwell b A Zampa', 20, 56, 0, 0, 0, 141.67, 8, 80, 0, 23, 80, NULL, 0),
(212, 242, '47', '54', 1, 1, 1, 10, 1, 0, 0, 0, 0, 3, '', 0, 0, 2, 0, 0, 1, 8, 60, 10, 'not out', 12, 89, 16, 0, 0, 125, 7.7, 77, 0, 25, 121, NULL, 0),
(213, 243, '16643', '54', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 1, 18, 3, 'not out', 0, 0, 0, 0, 0, 0, 12.67, 38, 0, 6, 4, NULL, 0),
(214, 244, '1927', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(215, 245, '486', '54', 1, 1, 1, 9, 0, 1, 0, 0, 0, 1, 'caught', 0, 0, 0, 0, 0, 1, 8, 37, 6, 'c J Hazlewood b P Cummins', 10, 19, 0, 0, 0, 112.5, 10.58, 67, 0, 21, 33, NULL, 4),
(216, 246, '43', '54', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'not out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `result_points`
--

CREATE TABLE `result_points` (
  `id` int NOT NULL,
  `matchkey` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `playerid` int NOT NULL,
  `resultmatch_id` int NOT NULL,
  `startingpoints` double NOT NULL,
  `runs` double NOT NULL DEFAULT '0',
  `fours` double NOT NULL DEFAULT '0',
  `sixs` double NOT NULL DEFAULT '0',
  `strike_rate` double NOT NULL DEFAULT '0',
  `century` double NOT NULL DEFAULT '0',
  `halfcentury` double NOT NULL DEFAULT '0',
  `thirtypoints` double DEFAULT '0',
  `wicketbonuspoint` double DEFAULT '0',
  `wickets` double NOT NULL DEFAULT '0',
  `maidens` double NOT NULL DEFAULT '0',
  `economy_rate` double NOT NULL DEFAULT '0',
  `runouts` double NOT NULL DEFAULT '0',
  `catch` double NOT NULL DEFAULT '0',
  `stumping` double NOT NULL DEFAULT '0',
  `thrower` double NOT NULL DEFAULT '0',
  `hitter` double NOT NULL DEFAULT '0',
  `bonus` double NOT NULL DEFAULT '0',
  `negative` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `result_points`
--

INSERT INTO `result_points` (`id`, `matchkey`, `playerid`, `resultmatch_id`, `startingpoints`, `runs`, `fours`, `sixs`, `strike_rate`, `century`, `halfcentury`, `thirtypoints`, `wicketbonuspoint`, `wickets`, `maidens`, `economy_rate`, `runouts`, `catch`, `stumping`, `thrower`, `hitter`, `bonus`, `negative`, `total`, `created_at`, `updated_at`) VALUES
(1, '5', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(2, '5', 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(3, '5', 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(4, '5', 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(5, '5', 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(6, '5', 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(7, '5', 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(8, '5', 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(9, '5', 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(10, '5', 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(11, '5', 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(12, '5', 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(13, '5', 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(14, '5', 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(15, '5', 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(16, '5', 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(17, '5', 17, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(18, '5', 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(19, '5', 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(20, '5', 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(21, '5', 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(22, '5', 22, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(23, '5', 23, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(24, '5', 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(25, '5', 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(26, '5', 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(27, '5', 27, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(28, '5', 28, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(29, '5', 29, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(30, '5', 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(31, '5', 31, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(32, '5', 32, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(33, '5', 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(34, '5', 34, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(35, '5', 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(36, '5', 36, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:32:03', '2023-10-26 16:32:03'),
(37, '29', 71, 37, 4, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(38, '29', 73, 38, 4, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(39, '29', 69, 39, 4, 50, 4, 2, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(40, '29', 67, 40, 4, 31, 4, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(41, '29', 74, 41, 4, 52, 7, 0, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(42, '29', 75, 42, 4, 43, 3, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(43, '29', 72, 43, 4, 21, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(44, '29', 78, 44, 4, 2, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(45, '29', 81, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(46, '29', 82, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(47, '29', 79, 47, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(48, '29', 68, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(49, '29', 70, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(50, '29', 76, 50, 4, 24, 1, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(51, '29', 77, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(52, '29', 80, 52, 4, 7, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 21, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(53, '29', 83, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(54, '29', 84, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(55, '29', 85, 55, 4, 24, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 69, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(56, '29', 89, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(57, '29', 87, 57, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(58, '29', 91, 58, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(59, '29', 86, 59, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 20, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(60, '29', 90, 60, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 12, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(61, '29', 92, 61, 4, 0, 0, 0, 0, 0, 0, 0, 0, 75, 4, 0, 0, 0, 0, 0, 0, 0, 0, 83, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(62, '29', 96, 62, 4, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(63, '29', 98, 63, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 20, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(64, '29', 97, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(65, '29', 99, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(66, '29', 88, 66, 4, 21, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(67, '29', 93, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(68, '29', 94, 68, 4, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 8, 0, 0, 0, 0, 0, 37, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(69, '29', 95, 69, 4, 0, 0, 0, 0, 0, 0, 0, 0, 104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, '2023-10-27 07:35:05', '2023-10-27 18:56:03'),
(70, '45', 100, 70, 4, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 2, 0, 8, 0, 0, 0, 0, 0, 39, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(71, '45', 101, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(72, '45', 102, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(73, '45', 103, 73, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(74, '45', 104, 74, 4, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 8, 0, 0, 0, 0, 0, 37, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(75, '45', 105, 75, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(76, '45', 106, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(77, '45', 107, 77, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 12, 0, 0, 0, 0, 24, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(78, '45', 108, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(79, '45', 109, 79, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(80, '45', 110, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(81, '45', 111, 81, 4, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 6, 0, 16, 0, 0, 0, 0, 0, 76, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(82, '45', 112, 82, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(83, '45', 113, 83, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(84, '45', 114, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(85, '45', 115, 85, 4, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 6, 0, 0, 0, 0, 0, 0, 0, 35, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(86, '45', 116, 86, 4, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 6, 0, 0, 0, 0, 0, 0, 0, 35, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(87, '45', 117, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(88, '45', 118, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(89, '45', 119, 89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(90, '45', 120, 90, 4, 26, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(91, '45', 121, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(92, '45', 122, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(93, '45', 123, 93, 4, 6, 1, 0, -6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(94, '45', 124, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(95, '45', 125, 95, 4, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(96, '45', 126, 96, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(97, '45', 127, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(98, '45', 128, 98, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(99, '45', 129, 99, 4, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(100, '45', 130, 100, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(101, '45', 131, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(102, '45', 132, 102, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(103, '45', 133, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(104, '45', 134, 104, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(105, '45', 135, 105, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 12:35:03', '2023-10-27 20:22:02'),
(106, '46', 136, 106, 4, 0, 0, 0, 0, 0, 0, 0, 0, 58, 0, 4, 0, 8, 0, 0, 0, 0, -2, 72, '2023-10-27 14:05:03', '2023-10-27 22:45:05'),
(107, '46', 137, 107, 4, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, '2023-10-27 14:05:03', '2023-10-27 22:45:05'),
(108, '46', 138, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:03', '2023-10-27 22:45:05'),
(109, '46', 139, 109, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, '2023-10-27 14:05:03', '2023-10-27 22:45:05'),
(110, '46', 140, 110, 4, 18, 2, 2, 6, 0, 0, 0, 0, 58, 0, 4, 0, 8, 0, 0, 0, 0, 0, 102, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(111, '46', 141, 111, 4, 5, 0, 0, -2, 0, 0, 0, 0, 0, 0, -2, 0, 8, 0, 0, 0, 0, 0, 13, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(112, '46', 142, 112, 4, 41, 1, 6, 6, 0, 8, 0, 8, 91, 0, 0, 0, 8, 0, 0, 0, 0, 0, 173, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(113, '46', 143, 113, 4, 23, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(114, '46', 144, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(115, '46', 145, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(116, '46', 146, 116, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(117, '46', 147, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(118, '46', 148, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(119, '46', 149, 119, 4, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 20, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(120, '46', 150, 120, 4, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, -2, 0, 0, 0, 0, 0, 0, 0, 27, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(121, '46', 151, 121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(122, '46', 152, 122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(123, '46', 153, 123, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(124, '46', 154, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(125, '46', 155, 125, 4, 17, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(126, '46', 156, 126, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(127, '46', 157, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(128, '46', 158, 128, 4, 16, 2, 2, 6, 0, 0, 0, 0, 0, 0, -6, 0, 8, 0, 0, 0, 0, 0, 32, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(129, '46', 159, 129, 4, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 6, 0, 0, 0, 25, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(130, '46', 160, 130, 4, 19, 2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(131, '46', 161, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(132, '46', 162, 132, 4, 36, 2, 8, 6, 0, 8, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 72, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(133, '46', 163, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(134, '46', 164, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(135, '46', 165, 135, 4, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(136, '46', 166, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 10, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(137, '46', 167, 137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(138, '46', 168, 138, 4, 0, 0, 0, 0, 0, 0, 0, 8, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(139, '46', 169, 139, 4, 0, 0, 0, 0, 0, 0, 0, 8, 91, 0, 4, 0, 0, 0, 0, 0, 0, 0, 107, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(140, '46', 170, 140, 4, 8, 0, 2, 0, 0, 0, 0, 0, 25, 0, 0, 0, 8, 0, 0, 0, 0, 0, 47, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(141, '46', 171, 141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(142, '46', 172, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(143, '46', 173, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 14:05:04', '2023-10-27 22:45:05'),
(144, '47', 174, 144, 4, 8, 0, 0, -6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(145, '47', 175, 145, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(146, '47', 176, 146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(147, '47', 177, 147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(148, '47', 178, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(149, '47', 179, 149, 4, 4, 0, 0, -6, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(150, '47', 180, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(151, '47', 181, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(152, '47', 182, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(153, '47', 183, 153, 4, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 38, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(154, '47', 184, 154, 4, 29, 4, 0, 0, 0, 0, 0, 0, 50, 0, 4, 0, 0, 0, 0, 0, 0, 0, 91, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(155, '47', 185, 155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(156, '47', 186, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(157, '47', 187, 157, 4, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(158, '47', 188, 158, 4, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 38, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(159, '47', 189, 159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(160, '47', 190, 160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(161, '47', 191, 161, 4, 5, 0, 0, -4, 0, 0, 0, 8, 50, 0, 6, 0, 0, 0, 0, 0, 0, 0, 69, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(162, '47', 192, 162, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 8, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(163, '47', 193, 163, 4, 13, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 37, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(164, '47', 194, 164, 4, 2, 0, 0, -6, 0, 0, 0, 8, 141, 0, 6, 0, 0, 0, 0, 0, 0, 0, 155, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(165, '47', 195, 165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(166, '47', 196, 166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(167, '47', 197, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(168, '47', 198, 168, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 12, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(169, '47', 199, 169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(170, '47', 200, 170, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(171, '47', 201, 171, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 2, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(172, '47', 202, 172, 4, 12, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 6, 0, 0, 34, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(173, '47', 203, 173, 4, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 26, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(174, '47', 204, 174, 4, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(175, '47', 205, 175, 4, 7, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 15, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(176, '47', 206, 176, 4, 14, 2, 0, 0, 0, 0, 0, 8, 50, 0, 6, 0, 0, 0, 0, 0, 0, 0, 84, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(177, '47', 207, 177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(178, '47', 208, 178, 4, 7, 1, 0, 0, 0, 0, 0, 0, 50, 0, 6, 0, 0, 0, 0, 0, 0, 0, 68, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(179, '47', 209, 179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(180, '47', 210, 180, 4, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(181, '47', 211, 181, 4, 6, 0, 0, -2, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(182, '47', 212, 182, 4, 8, 1, 0, 0, 0, 0, 0, 0, 25, 12, 6, 0, 16, 0, 0, 0, 0, 0, 72, '2023-10-27 15:50:04', '2023-10-28 01:26:03'),
(183, '47', 213, 183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:05', '2023-10-28 01:26:03'),
(184, '47', 214, 184, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 24, 6, 0, 0, 0, 0, 0, 0, 0, 42, '2023-10-27 15:50:05', '2023-10-28 01:26:03'),
(185, '47', 215, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 15:50:05', '2023-10-28 01:26:03'),
(186, '54', 216, 186, 4, 38, 4, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 58, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(187, '54', 217, 187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(188, '54', 218, 188, 4, 81, 5, 12, 4, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(189, '54', 219, 189, 4, 18, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(190, '54', 220, 190, 4, 109, 10, 14, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 151, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(191, '54', 221, 191, 4, 18, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 6, 0, 0, 0, 46, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(192, '54', 222, 192, 4, 36, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(193, '54', 223, 193, 4, 41, 5, 4, 6, 0, 0, 0, 0, 25, 0, 0, 0, 8, 0, 0, 0, 0, 0, 93, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(194, '54', 224, 194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(195, '54', 225, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(196, '54', 226, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(197, '54', 227, 197, 4, 0, 0, 0, 0, 0, 0, 0, 0, 75, 0, -2, 0, 0, 0, 0, 0, 0, 0, 77, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(198, '54', 228, 198, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6, 0, 28, 0, 0, 0, 0, 0, 27, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(199, '54', 229, 199, 4, 37, 2, 8, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(200, '54', 230, 200, 4, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, -2, 0, 16, 0, 0, 0, 0, 0, 68, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(201, '54', 231, 201, 4, 28, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(202, '54', 232, 202, 4, 21, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(203, '54', 233, 203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(204, '54', 234, 204, 4, 32, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(205, '54', 235, 205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(206, '54', 236, 206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(207, '54', 237, 207, 4, 54, 6, 2, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(208, '54', 238, 208, 4, 12, 1, 0, 0, 0, 0, 0, 8, 75, 0, 2, 0, 16, 0, 0, 0, 0, 0, 118, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(209, '54', 239, 209, 4, 116, 9, 10, 4, 8, 0, 0, 0, 0, 0, -2, 0, 8, 0, 0, 0, 0, 0, 157, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(210, '54', 240, 210, 4, 58, 3, 6, 6, 0, 4, 0, 0, 25, 0, 0, 0, 8, 0, 0, 0, 0, 0, 114, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(211, '54', 241, 211, 4, 17, 1, 2, 0, 0, 0, 0, 8, 50, 0, -2, 0, 0, 0, 0, 0, 0, 0, 80, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(212, '54', 242, 212, 4, 10, 0, 2, 0, 0, 0, 0, 16, 75, 0, -2, 0, 16, 0, 0, 0, 0, 0, 121, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(213, '54', 243, 213, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(214, '54', 244, 214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(215, '54', 245, 215, 4, 9, 1, 0, 0, 0, 0, 0, 0, 25, 0, -6, 0, 0, 0, 0, 0, 0, 0, 33, '2023-10-28 04:05:03', '2023-10-28 18:30:03'),
(216, '54', 246, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-28 04:05:03', '2023-10-28 18:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(2, 'admin', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(3, 'cricket', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(4, 'football', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(5, 'basketball', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(6, 'stock', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(7, 'kabaddi', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(8, 'user', 'web', '2023-10-26 18:12:25', '2023-10-26 18:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int UNSIGNED NOT NULL,
  `fantasy_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cricket',
  `series_key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'opened',
  `teamcount` varchar(151) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matchcount` varchar(151) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rounds_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `has_leaderboard` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `winning_status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `fantasy_type`, `series_key`, `name`, `start_date`, `end_date`, `status`, `teamcount`, `matchcount`, `rounds_data`, `has_leaderboard`, `winning_status`, `created_at`, `updated_at`) VALUES
(1, '1', 'ECSCT10', 'ECS Croatia T10', '2023-10-23 00:00:00', '2023-11-04 00:00:00', 'opened', '6', '45', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(2, '1', 'ACLT20', 'ICCA Arabian T20 League', '2023-10-19 00:00:00', '2023-11-30 00:00:00', 'opened', '16', '13', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(3, '1', 'KCC T10', 'KCC T10 Emerging League', '2023-09-16 00:00:00', '2023-10-27 00:00:00', 'opened', '27', '69', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(4, '1', 'CBFS T-20', 'CBFS T-20 League', '2023-10-08 00:00:00', '2023-11-03 00:00:00', 'opened', '11', '19', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(5, '1', 'KCC T10 Challenge Cup', 'KCC T10 Challenge Cup', '2023-09-21 00:00:00', '2023-10-27 00:00:00', 'opened', '15', '33', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(6, '1', 'KCC T10 Elite Championship', 'KCC T10 Elite Championship', '2023-10-13 00:00:00', '2023-10-31 00:00:00', 'opened', '10', '24', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(7, '1', 'SMAT 2023', 'Syed Mushtaq Ali Trophy', '2023-10-16 00:00:00', '2023-11-06 00:00:00', 'opened', '38', '135', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(8, '1', 'Sri Lanka Under-19 tour of Pakistan', 'Sri Lanka Under-19 tour of Pakistan', '2023-10-15 00:00:00', '2023-10-31 00:00:00', 'opened', '2', '6', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(9, '1', 'Nepal T20I triangular Series', 'Nepal T20I triangular Series', '2023-10-18 00:00:00', '2023-10-27 00:00:00', 'opened', '3', '6', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(10, '1', 'WBBL 2023', 'Women\'s Big Bash League', '2023-10-19 00:00:00', '2023-12-02 00:00:00', 'opened', '8', '57', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(11, '1', 'TANWT20', 'Tanzania Women\'s T20', '2023-10-14 00:00:00', '2023-11-05 00:00:00', 'opened', '4', '19', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(12, '1', 'ICC Cricket World Cup', 'ICC Cricket World Cup', '2023-10-05 00:00:00', '2023-11-19 00:00:00', 'opened', '10', '48', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(13, '1', 'PWTOBW', 'Pakistan Women tour of Bangladesh', '2023-10-25 00:00:00', '2023-12-31 00:00:00', 'opened', '2', '6', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(14, '1', 'TCPL', 'Tanzania Cricket Premier League', '2023-10-16 00:00:00', '2023-11-05 00:00:00', 'opened', '5', '20', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(15, '1', 'NTOZ', 'Zimbabwe tour of Namibia', '2023-10-24 00:00:00', '2023-10-31 00:00:00', 'opened', '2', '5', 'null', 'no', 0, '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(16, '1', 'ED20', 'Emirates D20', '2023-10-13 00:00:00', '2023-10-31 00:00:00', 'opened', '6', '28', 'null', 'no', 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(17, '1', 'ECT10', 'Embassy Cup T10', '2023-10-28 00:00:00', '2023-10-29 00:00:00', 'opened', '6', '4', 'null', 'no', 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(18, '1', 'Kenya T10', 'Kenya T10', '2023-10-29 00:00:00', '2023-11-08 00:00:00', 'opened', '5', '5', 'null', 'no', 0, '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(19, '1', 'SWT20T', 'Senior Women\'s T20 Trophy', '2023-10-19 00:00:00', '2023-11-09 00:00:00', 'opened', '23', '22', 'null', 'no', 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(20, '1', 'ICC Men\'s T20 WC Asia Regional Final', 'ICC Men\'s T20 WC Asia Regional Final', '2023-10-30 00:00:00', '2023-11-05 00:00:00', 'opened', '8', '8', 'null', 'no', 0, '2023-10-27 14:02:45', '2023-10-27 14:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, '', 'project_name', 'Beatmysquad', '2023-07-03 09:54:52', '2023-10-25 11:56:21'),
(2, '', 'short_name', 'BMS', '2023-07-03 09:54:52', '2023-10-25 11:56:21'),
(3, '', 'user_image', 'user_image.png', '2023-07-03 09:54:52', '2023-07-03 11:17:25'),
(4, '', 'team_image', 'team_image.png', '2023-07-03 09:54:52', '2023-07-03 11:17:25'),
(5, '', 'player_image', 'player_image.png', '2023-07-03 09:54:52', '2023-07-03 11:17:25'),
(6, '', 'favicon', 'favicon.png', '2023-07-03 09:54:52', '2023-10-25 12:05:58'),
(7, '', 'firebase_key', 'AAAAxcJmaYQ:APA91bEqmataC39TTfr9jZ0HSG-i7z6orgVWm8y37L-wUC47Tey0IBHwoptwSYv1X24OjPqrRuaQgTMxBF_6tkf75x22YE9MDi_raexHIuGk5qrTf43fUGHZIWhWfuCgAvQJvuOoa7nF', '2023-07-03 09:54:52', '2023-10-26 05:13:07'),
(8, '', 'mobile', '9649868677', '2023-07-03 09:54:52', '2023-07-03 11:30:56'),
(9, '', 'logo', 'logo.png', '2023-07-03 09:54:52', '2023-10-25 12:05:58'),
(10, '', 'site_url', 'https://beatmysquad.com/', '2023-07-03 09:54:52', '2023-10-25 11:56:04'),
(11, '', 'admin_folder', 'Flixaura_admin', '2023-07-03 09:54:52', '2023-07-03 11:32:34'),
(12, '', 'app_status', '1', '2023-09-04 09:19:51', '2023-09-04 09:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `stock_challenges`
--

CREATE TABLE `stock_challenges` (
  `id` int UNSIGNED NOT NULL,
  `mega_status` int NOT NULL DEFAULT '0',
  `entryfee` double NOT NULL,
  `offerentryfee` int NOT NULL DEFAULT '0',
  `win_amount` double NOT NULL DEFAULT '0',
  `win_amount_2` double DEFAULT '0',
  `winning_percentage` int NOT NULL DEFAULT '0',
  `maximum_user` int NOT NULL DEFAULT '0',
  `minimum_user` int NOT NULL DEFAULT '0',
  `contest_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_entry` int NOT NULL DEFAULT '0',
  `team_limit` int DEFAULT '1',
  `confirmed_challenge` int NOT NULL DEFAULT '0',
  `is_bonus` int NOT NULL DEFAULT '0',
  `is_running` int NOT NULL DEFAULT '0',
  `type` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `contest_cat` int NOT NULL,
  `bonus_percentage` double NOT NULL DEFAULT '0',
  `pricecard_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `freez` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_commodity`
--

CREATE TABLE `stock_commodity` (
  `id` int NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentvalue` double NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_companies`
--

CREATE TABLE `stock_companies` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentvalue` double DEFAULT NULL,
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mic_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `high_close_value` double DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_contest_category`
--

CREATE TABLE `stock_contest_category` (
  `id` int NOT NULL,
  `exchange_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tbl_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_exchanges`
--

CREATE TABLE `stock_exchanges` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_listmatches`
--

CREATE TABLE `stock_listmatches` (
  `id` int NOT NULL,
  `matchkey` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'notstarted',
  `launch_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `final_status` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_matchchallenges`
--

CREATE TABLE `stock_matchchallenges` (
  `id` int UNSIGNED NOT NULL,
  `matchkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_id` int DEFAULT '0',
  `entryfee` double NOT NULL,
  `offerentryfee` int NOT NULL DEFAULT '0',
  `win_amount` double NOT NULL,
  `win_amount_2` double DEFAULT '0',
  `contest_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winning_percentage` int NOT NULL DEFAULT '0',
  `maximum_user` int NOT NULL DEFAULT '0',
  `minimum_user` int DEFAULT '0',
  `confirmed_challenge` int NOT NULL DEFAULT '0',
  `is_bonus` int NOT NULL DEFAULT '0',
  `pricecard_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_running` int DEFAULT '0',
  `contest_cat` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` int DEFAULT '0',
  `bonus_percentage` int DEFAULT '0',
  `created_by` int DEFAULT '0',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price_status` int DEFAULT '0' COMMENT '0=>not_compressed,1=>compressed',
  `joinedusers` int DEFAULT '0',
  `multi_entry` int DEFAULT '0',
  `team_limit` int DEFAULT '1',
  `contest_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_created` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `refercode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_matchpricecards`
--

CREATE TABLE `stock_matchpricecards` (
  `id` int NOT NULL,
  `challenge_id` int NOT NULL,
  `matchkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winners` int NOT NULL,
  `price` double DEFAULT NULL,
  `min_position` int DEFAULT NULL,
  `max_position` int DEFAULT NULL,
  `total` double NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_pricecards`
--

CREATE TABLE `stock_pricecards` (
  `id` int NOT NULL,
  `winners` int NOT NULL,
  `price` double DEFAULT NULL,
  `price_percent` double DEFAULT NULL,
  `min_position` int NOT NULL,
  `max_position` int NOT NULL,
  `total` int DEFAULT NULL,
  `challenge_id` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int UNSIGNED NOT NULL,
  `fantasy_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `team` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `team_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#ffffff',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `fantasy_type`, `team`, `logo`, `team_key`, `short_name`, `color`, `created_at`, `updated_at`) VALUES
(1, '1', 'Sir Oliver Split', 'https://images.entitysport.com/assets/uploads/2021/10/2820.png', '121787', 'SOS', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(2, '1', 'Zagreb Warriors', 'https://images.entitysport.com/assets/uploads//2022/07/VZW-CR1@2x.png', '125261', 'ZA', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(3, '1', 'Karwan CC', 'https://images.entitysport.com/assets/uploads//2022/09/FC-KARW@2x.png', '125822', 'KCC', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(4, '1', 'Fly Emirates ', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-48.png', '127787', 'FES', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(5, '1', 'Renegades K', 'https://images.entitysport.com/assets/uploads/2023/09/Rectangle-3460-27.png', '128066', 'REN', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(6, '1', 'Blue Squadrons', 'https://images.entitysport.com/assets/uploads/2023/09/Rectangle-3460.png', '128039', 'BS', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(7, '1', 'Gems Education CC', 'https://images.entitysport.com/assets/uploads//2022/10/FC-GECC@2x.png', '126560', 'GED', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(8, '1', 'Alif Pharma', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-49.png', '127786', 'ALP', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(9, '1', 'DCC Starlets', 'https://images.entitysport.com/assets/uploads/2022/03/DCS-CR1@2x.png', '123842', 'DCS', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(10, '1', 'Mid-East Metals', 'https://images.entitysport.com/assets/uploads/2022/03/MEM-CR1@2x.png', '123838', 'MEM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(11, '1', 'Seazen Challengers', 'https://images.entitysport.com/assets/uploads/2023/09/Seazen-Challengers.png', '128096', 'SZN', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(12, '1', 'GAT', 'https://images.entitysport.com/assets/uploads/2023/09/GAT.png', '128093', 'GAT', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(13, '1', 'MG Warriors', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-8.png', '127829', 'MGW', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(14, '1', 'Gujarat Cricket Club', 'https://images.entitysport.com/assets/uploads/2023/09/Gujarat-Cricket-Club.png', '128094', 'GCC', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(15, '1', 'Al Hajery', 'https://images.entitysport.com/assets/uploads//2022/10/ALH-CR1@2x.png', '126290', 'ALH', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(16, '1', 'Kuwait Swedish', 'https://images.entitysport.com/assets/uploads//2022/10/KS-CR2@2x.png', '126333', 'KW', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(17, '1', 'Arunachal Pradesh', 'https://images.entitysport.com/assets/uploads/2023/08/arunchal.png', '111568', 'ARP', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(18, '1', 'Punjab', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-19T084042.439.png', '12965', 'PUN', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(19, '1', 'Himachal Pradesh', 'https://images.entitysport.com/assets/uploads/2023/07/Himachal.png', '12997', 'HIM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(20, '1', 'Sikkim', 'https://images.entitysport.com/assets/uploads/2023/08/sikim.png', '111566', 'SIKM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(21, '1', 'Mizoram', 'https://images.entitysport.com/assets/uploads/2023/08/mizo.png', '111562', 'MIZ', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(22, '1', 'Mumbai', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-19T084204.280.png', '8516', 'MUM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(23, '1', 'Pakistan Under-19s', 'https://images.entitysport.com/assets/uploads/2023/05/Pakistan.png', '1148', 'PK-19', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(24, '1', 'Sri Lanka Under-19s', 'https://images.entitysport.com/assets/uploads/2023/05/Sri-lanka.png', '1121', 'SL-19', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(25, '1', 'CECC-A', 'https://images.entitysport.com/assets/uploads/2023/09/Rectangle-3460-28.png', '128055', 'CEC-A', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(26, '1', 'Stack CC', 'https://images.entitysport.com/assets/uploads//2022/10/Seville.png', '126334', 'SCC', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(27, '1', 'Nepal', 'https://images.entitysport.com/assets/uploads/2023/05/Nepal.png', '10814', 'NEP', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(28, '1', 'United Arab Emirates', 'https://images.entitysport.com/assets/uploads/2023/05/United_Arab_Emirates.png', '15', 'UAE', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(29, '1', 'Assam', 'https://images.entitysport.com/assets/uploads/2023/07/Assam.png', '12987', 'ASM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(30, '1', 'Kerala', 'https://images.entitysport.com/assets/uploads/2023/07/Kerala.png', '12981', 'KER', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(31, '1', 'Goa', 'https://images.entitysport.com/assets/uploads/2023/07/Goa.png', '12991', 'GA', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(32, '1', 'Saurashtra', 'https://images.entitysport.com/assets/uploads/2023/07/Saurashtra.png', '13015', 'SAU', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(33, '1', 'Haryana', 'https://images.entitysport.com/assets/uploads/2023/07/Haryana.png', '12982', 'HAR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(34, '1', 'Hyderabad (India)', 'https://images.entitysport.com/assets/uploads/2023/07/Hyderabad.png', '13000', 'HYD', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(35, '1', 'Madhya Pradesh', 'https://images.entitysport.com/assets/uploads/2023/07/Madhya-Pradesh.png', '13014', 'MP', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(36, '1', 'Uttar Pradesh', 'https://images.entitysport.com/assets/uploads/2023/07/Uttar-Pradesh.png', '12998', 'UP', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(37, '1', 'Maharashtra', 'https://images.entitysport.com/assets/uploads//2023/01/MAH-CR1@2x.png', '127595', 'MAHA', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(38, '1', 'Rajasthan', 'https://images.entitysport.com/assets/uploads/2023/07/raj.png', '12972', 'RAJ', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(39, '1', 'Nagaland', 'https://images.entitysport.com/assets/uploads/2023/08/nagaland.png', '111561', 'NAG', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(40, '1', 'Tamil Nadu', 'https://images.entitysport.com/assets/uploads/2023/07/Tamil-Nadu.png', '12988', 'TN', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(41, '1', 'Puducherry', 'https://images.entitysport.com/assets/uploads/2023/08/puduchery.png', '111569', 'PUD', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(42, '1', 'Uttarakhand', 'https://images.entitysport.com/assets/uploads/2023/08/utarakhand.png', '111564', 'UT', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(43, '1', 'Adelaide Strikers Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-13.png', '15804', 'AS-W', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(44, '1', 'Hobart Hurricanes Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-15.png', '15800', 'HH-W', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(45, '1', 'Saipem', 'https://images.entitysport.com/assets/uploads//2023/02/FC-SAIP@2x.png', '126305', 'SAI', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(46, '1', 'NCM Investments', 'https://images.entitysport.com/assets/uploads//2022/10/NCMI-CR1@2x.png', '126307', 'NCMI', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(47, '1', 'Mount Meru Queens', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461.png', '128127', 'MMQ', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(48, '1', 'Kilimanjaro Queens', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-3.png', '128130', 'KJQ', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(49, '1', 'Zagreb Sokol', 'https://images.entitysport.com/assets/uploads/2021/10/2816.png', '121784', 'ZAS', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(50, '1', 'Bihar', 'https://images.entitysport.com/assets/uploads/2023/07/Bihar.png', '12985', 'BIR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(51, '1', 'Services', 'https://images.entitysport.com/assets/uploads/2023/09/Rectangle-3460-39.png', '12973', 'SER', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(52, '1', 'Chhattisgarh', 'https://images.entitysport.com/assets/uploads/2023/07/cscs.png', '90075', 'CHT', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(53, '1', 'Jammu & Kashmir', 'https://images.entitysport.com/assets/uploads/2023/07/J-K.png', '12984', 'J&K', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(54, '1', 'Gujarat', 'https://images.entitysport.com/assets/uploads//2022/10/Gujarat.png', '13029', 'GUJ', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(55, '1', 'Manipur', 'https://images.entitysport.com/assets/uploads/2023/08/manipur.png', '111565', 'MAN', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(56, '1', 'Pakistan', 'https://images.entitysport.com/assets/uploads/2023/05/Pakistan.png', '13', 'PAK', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(57, '1', 'South Africa', 'https://images.entitysport.com/assets/uploads/2023/05/South-africa.png', '19', 'SA', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(58, '1', 'Zagreb chiefs', 'https://images.entitysport.com/assets/uploads/2023/10/ECS-Croatia-T10-min.png.png', '128135', 'ZR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(59, '1', 'Brisbane Heat Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-14.png', '15792', 'BH-W', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(60, '1', 'Melbourne Stars Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-17.png', '15793', 'MS-W', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(61, '1', 'Bangladesh Women', 'https://images.entitysport.com/assets/uploads/2023/05/Bangladesh-10.png', '10712', 'BD-W', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(62, '1', 'Pakistan Women', 'https://images.entitysport.com/assets/uploads/2023/05/Pakistan.png', '10259', 'PK-W', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(63, '1', 'Almulla Exchange CC', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-06T134055.495.png', '127707', 'AEC', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(64, '1', 'Tally Riders', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-9.png', '127830', 'TYR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(65, '1', 'Andhra', 'https://images.entitysport.com/assets/uploads/2023/07/andh.png', '12975', 'AND', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(66, '1', 'Railways', 'https://images.entitysport.com/assets/uploads/2023/07/Railways.png', '12979', 'RAL', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(67, '1', 'Baroda', 'https://images.entitysport.com/assets/uploads/2023/07/Baroda.png', '12994', 'BRD', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(68, '1', 'Meghalaya', 'https://images.entitysport.com/assets/uploads/2023/08/meghalya.png', '111567', 'MEG', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(69, '1', 'Chandigarh', 'https://images.entitysport.com/assets/uploads/2023/08/haryana.png', '113656', 'CHR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(70, '1', 'Odisha', 'https://images.entitysport.com/assets/uploads/2023/07/Odisha.png', '12968', 'ODI', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(71, '1', 'Jharkhand', 'https://images.entitysport.com/assets/uploads/2023/08/jharakhand.png', '105780', 'JHR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(72, '1', 'Vidarbha', 'https://images.entitysport.com/assets/uploads/2023/07/vi.webp', '12969', 'VID', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(73, '1', 'Karnataka', 'https://images.entitysport.com/assets/uploads/2023/07/Karnataka.png', '12978', 'KAR', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(74, '1', 'Tripura', 'https://images.entitysport.com/assets/uploads/2023/07/tri.png', '12976', 'TRI', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(75, '1', 'Chui Challengers', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-46.jpg', '116376', 'CC', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(76, '1', 'Royal Rhinos', 'https://images.entitysport.com/assets/uploads/2020/08/5826fe8d-631f-4fae-8f94-f1d519bddfb5-1-32x32.jpg', '116373', 'RR', '#ffffff', '2023-10-26 12:43:56', '2023-10-27 14:02:45'),
(77, '1', 'Namibia', 'https://images.entitysport.com/assets/uploads/2023/05/Namibia.png', '10798', 'NAM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(78, '1', 'Zimbabwe', 'https://images.entitysport.com/assets/uploads/2023/05/Zimbawe.png', '493', 'ZIM', '#ffffff', '2023-10-26 12:43:56', '2023-10-26 12:43:56'),
(79, '1', 'TBA', 'https://images.entitysport.com/assets/uploads/2021/09/team-120x120.png', '127770', 'TBA', '#ffffff', '2023-10-26 12:43:56', '2023-10-27 14:02:46'),
(80, '1', 'Zagreb Assassins', 'https://images.entitysport.com/assets/uploads//2022/10/Zagreb-Assassins.png', '126546', 'ZA', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(81, '1', 'Seven Districts', 'https://images.entitysport.com/assets/uploads//2022/08/FC-SD@2x.png', '125817', 'SED', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(82, '1', 'Solarwinds', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-24T152359.390.png', '128132', 'SLW', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(83, '1', 'Emirates Blues', 'https://images.entitysport.com/assets/uploads/2021/12/EMB.jpg', '73292', 'EMB', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(84, '1', 'Fujairah', 'https://images.entitysport.com/assets/uploads/2020/12/bbb-32x32.png', '116223', 'FUJ', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(85, '1', 'Z Games Strikers', 'https://images.entitysport.com/assets/uploads//2022/10/BK-CR1@2x.png', '126680', 'ZGS', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(86, '1', 'CSS Group', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-06T155833.557.png', '127662', 'CSG', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(87, '1', 'Suncorp', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-24T152156.116.png', '128133', 'SCP', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(88, '1', 'Valley Boyz', 'https://images.entitysport.com/assets/uploads//2022/08/FC-VB@2x.png', '125819', 'VAB', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(89, '1', 'Dubai', 'https://images.entitysport.com/assets/uploads/2020/12/eee-32x32.png', '116224', 'DUB', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(90, '1', 'Ajman', 'https://images.entitysport.com/assets/uploads/2022/06/AJM-CR2@2x.png', '116221', 'AJM', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(91, '1', 'ANZ Embassy CC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-26T141948.683.png', '128136', 'AEC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(92, '1', 'Bangladesh Embassy CC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-26T142038.617.png', '128140', 'BEC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(93, '1', 'Melbourne Renegades Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-16.png', '15799', 'MR-W', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(94, '1', 'Sydney Sixers Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-19.png', '15797', 'SS-W', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(95, '1', 'Japan Embassy CC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-26T142123.138.png', '128141', 'JEC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(96, '1', 'Pakistan Embassy CC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-26T142208.952.png', '128142', 'PEC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(97, '1', 'Great Britian Embassy CC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-26T142256.640.png', '128143', 'GBE', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(98, '1', 'Australia', 'https://images.entitysport.com/assets/uploads//2023/01/Australia-1.png', '5', 'AUS', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(99, '1', 'New Zealand', 'https://images.entitysport.com/assets/uploads/2023/05/New-zealand.png', '7', 'NZ', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(100, '1', 'India Embassy CC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-26T142325.389.png', '128144', 'IEC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(101, '1', 'Buffalo Blaster', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-43.jpg', '116372', 'BB', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(102, '1', 'Netherlands', 'https://images.entitysport.com/assets/uploads/2023/05/Netherlands.png', '1824', 'NED', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(103, '1', 'Bangladesh', 'https://images.entitysport.com/assets/uploads/2023/05/Bangladesh-10.png', '23', 'BAN', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(104, '1', 'Twiga Titans', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-44.jpg', '116374', 'TT', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(105, '1', 'Ljubljana', 'https://images.entitysport.com/assets/uploads/2021/10/2818.png', '121789', 'LJU', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(106, '1', 'Seven Districts Juniors', 'https://images.entitysport.com/assets/uploads/2023/10/seven-district-junior.png', '128125', 'SVDJ', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(107, '1', 'HSBC', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2023-10-24T152008.010.png', '128134', 'HSBC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(108, '1', 'Sharjah', 'https://images.entitysport.com/assets/uploads/2023/05/SHA-CR2@2x.png', '116225', 'SHA', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(109, '1', 'Abu Dhabi', 'https://images.entitysport.com/assets/uploads/2021/12/Abu.jpg', '116220', 'ABD', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(110, '1', 'The Vision Shipping', 'https://images.entitysport.com/assets/uploads/2022/01/FC-TVSL@2x.png', '122728', 'TVS', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(111, '1', 'SA Sports Club', 'https://images.entitysport.com/assets/uploads/2023/10/sa-sports-club.png', '128124', 'SSC', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(112, '1', 'Dubai Dare Devils', 'https://images.entitysport.com/assets/uploads//2022/08/FC-DDD@2x.png', '125818', 'DDD', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(113, '1', 'Dubai Wanderers', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-06T133902.773.png', '127709', 'DUW', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(114, '1', 'Perth Scorchers Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-18.png', '15802', 'PS-W', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(115, '1', 'Usambara Queens', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-1.png', '128128', 'UBQ', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(116, '1', 'Mighty Lions', 'https://images.entitysport.com/assets/uploads/2023/10/1000.png', '128147', 'MGl', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(117, '1', 'India', 'https://images.entitysport.com/assets/uploads//2023/01/india-4.png', '25', 'IND', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(118, '1', 'England', 'https://images.entitysport.com/assets/uploads/2023/05/England.png', '490', 'ENG', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(119, '1', 'Fighters Buffalos', 'https://images.entitysport.com/assets/uploads/2023/10/123.png', '128145', 'FGS', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(120, '1', 'Lighting Zebras', 'https://images.entitysport.com/assets/uploads/2023/10/httpsimages.entitysport.comassetsuploads202310Group-33846-min.png.png', '128146', 'LIZS', '#ffffff', '2023-10-26 12:43:57', '2023-10-26 12:43:57'),
(121, '1', 'Himachal Pradesh Women', 'https://images.entitysport.com/assets/uploads/2023/08/Himachal-Pradesh-Women.png', '15981', 'HPWMN', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(122, '1', 'Kerala Women', 'https://images.entitysport.com/assets/uploads/2023/08/Kerala-Women.png', '15974', 'KER-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(123, '1', 'Andhra Women', 'https://images.entitysport.com/assets/uploads/2023/08/Andhra-Women.png', '15970', 'AND-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(124, '1', 'Odisha Women', 'https://images.entitysport.com/assets/uploads/2023/08/Odisha-Women.png', '15975', 'ODS-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(125, '1', 'Bengal Women', 'https://images.entitysport.com/assets/uploads/2023/08/Bengal-Women.png', '16010', 'BEN-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(126, '1', 'Karnataka Women', 'https://images.entitysport.com/assets/uploads/2023/08/Karnataka-Women.png', '15995', 'KAR-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(127, '1', 'Baroda Women', 'https://images.entitysport.com/assets/uploads/2023/08/Baroda-Women.png', '15991', 'BAR-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(128, '1', 'Mumbai Women', 'https://images.entitysport.com/assets/uploads/2023/08/Mumbai-Women.png', '15963', 'MUM-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(129, '1', 'Simba Kings', 'https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-42.jpg', '116371', 'SK', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(130, '1', 'Rocking Hippos', 'https://images.entitysport.com/assets/uploads/2023/10/10000.png', '128148', 'RHPS', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(131, '1', 'Ajman Heroes', 'https://images.entitysport.com/assets/uploads/2022/03/FC-AJH@2x.png', '123575', 'AH', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(132, '1', 'Singapore', 'https://images.entitysport.com/assets/uploads/2023/07/Singapore.png', '16199', 'SGP', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(133, '1', 'Bahrain', 'https://images.entitysport.com/assets/uploads/2023/07/Bahrain-1.png', '30519', 'BAH', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(134, '1', 'Sydney Thunder Women', 'https://images.entitysport.com/assets/uploads/2023/07/Rectangle-3348-20.png', '15796', 'ST-W', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(135, '1', 'Hong Kong', 'https://images.entitysport.com/assets/uploads/2023/05/Hong_Kong.png', '1544', 'HKG', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(136, '1', 'Kuwait', 'https://images.entitysport.com/assets/uploads/2023/07/Kuwait-1.png', '26800', 'KUW', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(137, '1', 'Oman', 'https://images.entitysport.com/assets/uploads/2023/05/Oman.png', '1546', 'OMN', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(138, '1', 'Malaysia', 'https://images.entitysport.com/assets/uploads/2023/05/Malaysia.png', '9132', 'MAL', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(139, '1', 'Afghanistan', 'https://images.entitysport.com/assets/uploads/2023/07/Afghanistan-3.png', '498', 'AFG', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(140, '1', 'Sri Lanka', 'https://images.entitysport.com/assets/uploads/2023/05/Sri-lanka.png', '21', 'SL', '#ffffff', '2023-10-27 14:02:45', '2023-10-27 14:02:45'),
(141, '1', 'Ngorongoro Queens', 'https://images.entitysport.com/assets/uploads/2023/10/Rectangle-3461-2.png', '128129', 'NGQ', '#ffffff', '2023-10-27 14:02:46', '2023-10-27 14:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `tempuser`
--

CREATE TABLE `tempuser` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `refer_code` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_id` int NOT NULL DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tempuser`
--

INSERT INTO `tempuser` (`id`, `name`, `email`, `image`, `mobile`, `address`, `city`, `state`, `country`, `pincode`, `code`, `refer_code`, `refer_id`, `username`, `dob`, `gender`, `team`, `email_verified_at`, `password`, `remember_token`, `device_token`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, NULL, '9679679487', NULL, NULL, NULL, NULL, NULL, 652, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 15:11:57', '2023-10-26 15:11:57'),
(4, NULL, NULL, NULL, '8141325017', NULL, NULL, NULL, NULL, NULL, 4465, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 16:01:42', '2023-10-26 16:01:42'),
(6, NULL, NULL, NULL, '8141325017', NULL, NULL, NULL, NULL, NULL, 717, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 16:05:29', '2023-10-26 16:05:29'),
(8, NULL, NULL, NULL, '9694097241', NULL, NULL, NULL, NULL, NULL, 853, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-27 09:52:06', '2023-10-27 09:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transaction_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `paymentstatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `challengeid` int DEFAULT '0',
  `seriesid` int DEFAULT '0',
  `joinid` int NOT NULL DEFAULT '0',
  `bonus_amt` double DEFAULT '0',
  `win_amt` double NOT NULL DEFAULT '0',
  `addfund_amt` double NOT NULL DEFAULT '0',
  `bal_bonus_amt` double NOT NULL DEFAULT '0',
  `bal_win_amt` double DEFAULT '0',
  `bal_fund_amt` double DEFAULT '0',
  `total_available_amt` double NOT NULL DEFAULT '0',
  `challenge_join_amt` double NOT NULL DEFAULT '0',
  `withdraw_amt` double NOT NULL DEFAULT '0',
  `cons_bonus` double NOT NULL DEFAULT '0',
  `cons_win` double NOT NULL DEFAULT '0',
  `cons_amount` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `userid`, `type`, `transaction_id`, `transaction_by`, `amount`, `paymentstatus`, `challengeid`, `seriesid`, `joinid`, `bonus_amt`, `win_amt`, `addfund_amt`, `bal_bonus_amt`, `bal_win_amt`, `bal_fund_amt`, `total_available_amt`, `challenge_join_amt`, `withdraw_amt`, `cons_bonus`, `cons_win`, `cons_amount`, `created_at`, `updated_at`) VALUES
(1, 8, 'Signup Bonus', 'BMS-EBONUS-16983244278-1611', 'BMS', 500, 'confirmed', 0, 0, 0, 500, 0, 0, 500, 0, 0, 500, 0, 0, 0, 0, 0, '2023-10-26 18:17:07', '2023-10-26 12:47:07'),
(2, 8, 'Mobile Bonus', 'BMS-EBONUS-16983244288-7535', 'BMS', 10, 'confirmed', 0, 0, 0, 10, 0, 0, 510, 0, 0, 510, 0, 0, 0, 0, 0, '2023-10-26 18:17:08', '2023-10-26 12:47:08'),
(3, 11, 'Add Fund Adjustments', 'BMS-31698338584', 'BMS', 500, 'confirmed', 0, 0, 0, 0, 0, 500, 0, 0, 500, 500, 0, 0, 0, 0, 0, '2023-10-26 16:43:04', '2023-10-26 16:43:04'),
(4, 11, 'Contest Joining Fee', 'BMS-JL-2-169833862932-11', 'wallet', 100, 'confirmed', 2, 0, 0, 0, 0, 0, 0, 0, 400, 400, 0, 0, 0, 0, 100, '2023-10-26 16:43:49', '2023-10-26 16:43:49'),
(5, 9, 'Add Fund Adjustments', 'BMS-51698338711', 'BMS', 5000, 'confirmed', 0, 0, 0, 0, 0, 5000, 0, 0, 5000, 5000, 0, 0, 0, 0, 0, '2023-10-26 16:45:11', '2023-10-26 16:45:11'),
(6, 9, 'Contest Joining Fee', 'BMS-JL-2-169833881519-9', 'wallet', 100, 'confirmed', 2, 0, 0, 0, 0, 0, 0, 0, 4900, 4900, 0, 0, 0, 0, 100, '2023-10-26 16:46:55', '2023-10-26 16:46:55'),
(7, 11, 'Deduct Fund', 'BMS-71698339841', 'BMS', 400, 'confirmed', 0, 0, 0, 0, 0, 400, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 17:04:01', '2023-10-26 17:04:01'),
(8, 11, 'Add Fund Adjustments', 'BMS-81698339884', 'BMS', 100000, 'confirmed', 0, 0, 0, 0, 0, 100000, 0, 0, 100000, 100000, 0, 0, 0, 0, 0, '2023-10-26 17:04:44', '2023-10-26 17:04:44'),
(9, 11, 'Contest Joining Fee', 'BMS-JL-7-169834030831-11', 'wallet', 100, 'confirmed', 7, 0, 0, 0, 0, 0, 0, 0, 99900, 99900, 0, 0, 0, 0, 100, '2023-10-26 17:11:48', '2023-10-26 17:11:48'),
(10, 9, 'Contest Joining Fee', 'BMS-JL-7-169834032115-9', 'wallet', 100, 'confirmed', 7, 0, 0, 0, 0, 0, 0, 0, 4800, 4800, 0, 0, 0, 0, 100, '2023-10-26 17:12:01', '2023-10-26 17:12:01'),
(11, 11, 'Refund', 'BMS-8631698340450-11', 'BMS', 100, 'confirmed', 2, 0, 0, 0, 0, 100, 0, 0, 100000, 100000, 0, 0, 0, 0, 0, '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(12, 9, 'Refund', 'BMS-6561698340450-9', 'BMS', 100, 'confirmed', 2, 0, 0, 0, 0, 100, 0, 0, 4900, 4900, 0, 0, 0, 0, 0, '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(13, 11, 'Refund', 'BMS-9171698340450-11', 'BMS', 100, 'confirmed', 7, 0, 0, 0, 0, 100, 0, 0, 100100, 100100, 0, 0, 0, 0, 0, '2023-10-26 17:14:10', '2023-10-26 17:14:10'),
(14, 9, 'Refund', 'BMS-3191698340451-9', 'BMS', 100, 'confirmed', 7, 0, 0, 0, 0, 100, 0, 0, 5000, 5000, 0, 0, 0, 0, 0, '2023-10-26 17:14:11', '2023-10-26 17:14:11'),
(15, 11, 'Deduct Fund', 'BMS-151698341369', 'BMS', 99100, 'confirmed', 0, 0, 0, 0, 0, 99100, 0, 0, 1000, 1000, 0, 0, 0, 0, 0, '2023-10-26 17:29:29', '2023-10-26 17:29:29'),
(16, 11, 'Contest Joining Fee', 'BMS-JL-13-169839483595-11', 'wallet', 49, 'confirmed', 13, 0, 0, 0, 0, 0, 0, 0, 951, 951, 0, 0, 0, 0, 49, '2023-10-27 08:20:35', '2023-10-27 08:20:35'),
(17, 11, 'Contest Joining Fee', 'BMS-JL-13-169839491116-11', 'wallet', 49, 'confirmed', 13, 0, 0, 0, 0, 0, 0, 0, 902, 902, 0, 0, 0, 0, 49, '2023-10-27 08:21:51', '2023-10-27 08:21:51'),
(18, 11, 'Contest Joining Fee', 'BMS-JL-13-169839504555-11', 'wallet', 49, 'confirmed', 13, 0, 0, 0, 0, 0, 0, 0, 853, 853, 0, 0, 0, 0, 49, '2023-10-27 08:24:05', '2023-10-27 08:24:05'),
(19, 11, 'Contest Joining Fee', 'BMS-JL-13-169839511781-11', 'wallet', 49, 'confirmed', 13, 0, 0, 0, 0, 0, 0, 0, 804, 804, 0, 0, 0, 0, 49, '2023-10-27 08:25:17', '2023-10-27 08:25:17'),
(20, 11, 'Contest Joining Fee', 'BMS-JL-13-169839517888-11', 'wallet', 49, 'confirmed', 13, 0, 0, 0, 0, 0, 0, 0, 755, 755, 0, 0, 0, 0, 49, '2023-10-27 08:26:18', '2023-10-27 08:26:18'),
(21, 9, 'Contest Joining Fee', 'BMS-JL-22-169840208596-9', 'wallet', 100, 'confirmed', 22, 0, 0, 0, 0, 0, 0, 0, 4900, 4900, 0, 0, 0, 0, 100, '2023-10-27 10:21:25', '2023-10-27 10:21:25'),
(22, 8, 'Add Fund Adjustments', 'BMS-221698404083', 'BMS', 200, 'confirmed', 0, 0, 0, 0, 0, 200, 510, 0, 200, 710, 0, 0, 0, 0, 0, '2023-10-27 10:54:43', '2023-10-27 10:54:43'),
(23, 12, 'Cash added', 'BMS-ADD-169840431612', 'manual', 500, 'confirmed', 0, 0, 0, 0, 0, 500, 0, 0, 500, 500, 0, 0, 0, 0, 0, '2023-10-27 10:58:47', '2023-10-27 10:58:47'),
(24, 12, 'Contest Joining Fee', 'BMS-JL-12-169840434124-12', 'wallet', 20, 'confirmed', 12, 0, 0, 0, 0, 0, 0, 0, 480, 480, 0, 0, 0, 0, 20, '2023-10-27 10:59:01', '2023-10-27 10:59:01'),
(25, 11, 'Contest Joining Fee', 'BMS-JL-22-169841088512-11', 'wallet', 100, 'confirmed', 22, 0, 0, 0, 0, 0, 0, 0, 655, 655, 0, 0, 0, 0, 100, '2023-10-27 12:48:05', '2023-10-27 12:48:05'),
(26, 11, 'Refund', 'BMS-3951698413169-11', 'BMS', 49, 'confirmed', 13, 0, 0, 0, 0, 49, 0, 0, 704, 704, 0, 0, 0, 0, 0, '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(27, 11, 'Refund', 'BMS-6751698413169-11', 'BMS', 49, 'confirmed', 13, 0, 0, 0, 0, 49, 0, 0, 753, 753, 0, 0, 0, 0, 0, '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(28, 11, 'Refund', 'BMS-9711698413169-11', 'BMS', 49, 'confirmed', 13, 0, 0, 0, 0, 49, 0, 0, 802, 802, 0, 0, 0, 0, 0, '2023-10-27 13:26:09', '2023-10-27 13:26:09'),
(29, 11, 'Refund', 'BMS-5841698413170-11', 'BMS', 49, 'confirmed', 13, 0, 0, 0, 0, 49, 0, 0, 851, 851, 0, 0, 0, 0, 0, '2023-10-27 13:26:10', '2023-10-27 13:26:10'),
(30, 11, 'Refund', 'BMS-2121698413170-11', 'BMS', 49, 'confirmed', 13, 0, 0, 0, 0, 49, 0, 0, 900, 900, 0, 0, 0, 0, 0, '2023-10-27 13:26:10', '2023-10-27 13:26:10'),
(31, 12, 'Refund', 'BMS-9201698413175-12', 'BMS', 20, 'confirmed', 12, 0, 0, 0, 0, 20, 0, 0, 500, 500, 0, 0, 0, 0, 0, '2023-10-27 13:26:15', '2023-10-27 13:26:15'),
(32, 10, 'Add Fund Adjustments', 'BMS-321698416369', 'BMS', 1000, 'confirmed', 0, 0, 0, 0, 0, 1000, 0, 0, 1000, 1000, 0, 0, 0, 0, 0, '2023-10-27 14:19:29', '2023-10-27 14:19:29'),
(33, 9, 'Add Fund Adjustments', 'BMS-331698416390', 'BMS', 1000, 'confirmed', 0, 0, 0, 0, 0, 1000, 0, 0, 5900, 5900, 0, 0, 0, 0, 0, '2023-10-27 14:19:50', '2023-10-27 14:19:50'),
(34, 9, 'Add Fund Adjustments', 'BMS-341698416493', 'BMS', 1000, 'confirmed', 0, 0, 0, 0, 0, 1000, 0, 0, 6900, 6900, 0, 0, 0, 0, 0, '2023-10-27 14:21:33', '2023-10-27 14:21:33'),
(35, 13, 'Add Fund Adjustments', 'BMS-351698416738', 'BMS', 1000, 'confirmed', 0, 0, 0, 0, 0, 1000, 0, 0, 1000, 1000, 0, 0, 0, 0, 0, '2023-10-27 14:25:38', '2023-10-27 14:25:38'),
(36, 10, 'Contest Joining Fee', 'BMS-JL-33-169841696189-10', 'wallet', 100, 'confirmed', 33, 0, 0, 0, 0, 0, 0, 0, 900, 900, 0, 0, 0, 0, 100, '2023-10-27 14:29:21', '2023-10-27 14:29:21'),
(37, 10, 'Contest Joining Fee', 'BMS-JL-39-169841697862-10', 'wallet', 500, 'confirmed', 39, 0, 0, 0, 0, 0, 0, 0, 400, 400, 0, 0, 0, 0, 500, '2023-10-27 14:29:38', '2023-10-27 14:29:38'),
(38, 9, 'Contest Joining Fee', 'BMS-JL-33-169841773876-9', 'wallet', 100, 'confirmed', 33, 0, 0, 0, 0, 0, 0, 0, 6800, 6800, 0, 0, 0, 0, 100, '2023-10-27 14:42:18', '2023-10-27 14:42:18'),
(39, 9, 'Contest Joining Fee', 'BMS-JL-39-169841774673-9', 'wallet', 500, 'confirmed', 39, 0, 0, 0, 0, 0, 0, 0, 6300, 6300, 0, 0, 0, 0, 500, '2023-10-27 14:42:26', '2023-10-27 14:42:26'),
(40, 9, 'Refund', 'BMS-4721698418356-9', 'BMS', 100, 'confirmed', 22, 0, 0, 0, 0, 100, 0, 0, 6400, 6400, 0, 0, 0, 0, 0, '2023-10-27 14:52:36', '2023-10-27 14:52:36'),
(41, 11, 'Refund', 'BMS-7361698418356-11', 'BMS', 100, 'confirmed', 22, 0, 0, 0, 0, 100, 0, 0, 1000, 1000, 0, 0, 0, 0, 0, '2023-10-27 14:52:36', '2023-10-27 14:52:36'),
(42, 9, 'Contest Joining Fee', 'BMS-JL-43-169841913463-9', 'wallet', 100, 'confirmed', 43, 0, 0, 0, 0, 0, 0, 0, 6300, 6300, 0, 0, 0, 0, 100, '2023-10-27 15:05:34', '2023-10-27 15:05:34'),
(43, 9, 'Contest Joining Fee', 'BMS-JL-49-169841914318-9', 'wallet', 500, 'confirmed', 49, 0, 0, 0, 0, 0, 0, 0, 5800, 5800, 0, 0, 0, 0, 500, '2023-10-27 15:05:43', '2023-10-27 15:05:43'),
(44, 10, 'Contest Joining Fee', 'BMS-JL-43-169841964839-10', 'wallet', 100, 'confirmed', 43, 0, 0, 0, 0, 0, 0, 0, 300, 300, 0, 0, 0, 0, 100, '2023-10-27 15:14:08', '2023-10-27 15:14:08'),
(45, 9, 'Refund', 'BMS-9531698426002-9', 'BMS', 500, 'confirmed', 49, 0, 0, 0, 0, 500, 0, 0, 6300, 6300, 0, 0, 0, 0, 0, '2023-10-27 17:00:02', '2023-10-27 17:00:02'),
(46, 10, 'Challenge Winning Amount', 'WIN-964963313', 'BMS', 150, 'confirmed', 33, 0, 0, 0, 150, 0, 0, 150, 300, 450, 0, 0, 0, 0, 0, '2023-10-27 17:18:18', '2023-10-27 17:18:18'),
(47, 10, 'Amount Withdraw', 'WD-10-1698458960', 'wallet', 150, 'pending', 0, 0, 0, 0, 0, 0, 0, 0, 300, 300, 0, 150, 0, 150, 0, '2023-10-28 02:09:20', '2023-10-28 02:09:20'),
(48, 10, 'Challenge Winning Amount', 'WIN-221054319', 'BMS', 150, 'confirmed', 43, 0, 0, 0, 150, 0, 0, 150, 300, 450, 0, 0, 0, 0, 0, '2023-10-28 02:12:53', '2023-10-28 02:12:53'),
(49, 10, 'Amount Withdraw', 'WD-10-1698459253', 'wallet', 150, 'pending', 0, 0, 0, 0, 0, 0, 0, 0, 300, 300, 0, 150, 0, 150, 0, '2023-10-28 02:14:13', '2023-10-28 02:14:13'),
(50, 10, 'Contest Joining Fee', 'BMS-JL-52-169845966835-10', 'wallet', 100, 'confirmed', 52, 0, 0, 0, 0, 0, 0, 0, 200, 200, 0, 0, 0, 0, 100, '2023-10-28 02:21:08', '2023-10-28 02:21:08'),
(51, 9, 'Contest Joining Fee', 'BMS-JL-52-169845972948-9', 'wallet', 100, 'confirmed', 52, 0, 0, 0, 0, 0, 0, 0, 6200, 6200, 0, 0, 0, 0, 100, '2023-10-28 02:22:09', '2023-10-28 02:22:09'),
(52, 9, 'Challenge Winning Amount', 'WIN-887375221', 'BMS', 150, 'confirmed', 52, 0, 0, 0, 150, 0, 0, 150, 6200, 6350, 0, 0, 0, 0, 0, '2023-10-28 16:47:14', '2023-10-28 16:47:14'),
(53, 9, 'Contest Joining Fee', 'BMS-JL-61-169863874268-9', 'wallet', 100, 'confirmed', 61, 0, 0, 0, 0, 0, 0, 150, 6100, 6250, 0, 0, 0, 0, 100, '2023-10-30 04:05:42', '2023-10-30 04:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `used_offer`
--

CREATE TABLE `used_offer` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `offer_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userbalance`
--

CREATE TABLE `userbalance` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `winning` decimal(10,2) DEFAULT '0.00',
  `bonus` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userbalance`
--

INSERT INTO `userbalance` (`id`, `user_id`, `balance`, `winning`, `bonus`, `created_at`, `updated_at`) VALUES
(1, 1, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(2, 2, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(3, 3, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(4, 4, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(5, 5, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(6, 6, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(7, 7, '0.00', '0.00', '0.00', '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(8, 8, '200.00', '0.00', '510.00', '2023-10-26 18:17:07', '2023-10-27 10:54:43'),
(9, 9, '6100.00', '150.00', '0.00', '2023-10-26 19:29:40', '2023-10-30 04:05:42'),
(10, 10, '200.00', '0.00', '0.00', '2023-10-26 21:34:59', '2023-10-28 02:21:08'),
(11, 11, '1000.00', '0.00', '0.00', '2023-10-26 21:36:25', '2023-10-27 14:52:36'),
(12, 12, '500.00', '0.00', '0.00', '2023-10-27 15:56:29', '2023-10-27 13:26:15'),
(13, 13, '1000.00', '0.00', '0.00', '2023-10-27 16:43:28', '2023-10-27 14:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masterpassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1=>active\r\n0=>Block',
  `code` int DEFAULT NULL,
  `refer_code` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_id` int NOT NULL DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` int DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `masterpassword`, `image`, `mobile`, `address`, `city`, `state`, `country`, `pincode`, `status`, `code`, `refer_code`, `refer_id`, `username`, `dob`, `gender`, `team`, `type`, `percentage`, `email_verified_at`, `password`, `remember_token`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(2, 'admin', 'admin@gmail.com', 'masterpassword', 'https://beatmysquad.com/beatmysquad_admin/public/users/profile/USER2.png', '9999999999', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:13:45'),
(3, 'cricket', 'cricket@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(4, 'football', 'football@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(5, 'basketball', 'basketball@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(6, 'kabaddi', 'kabaddi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(7, 'stock', 'stock@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-26 18:12:25', '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', NULL, NULL, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(8, NULL, NULL, NULL, 'https://beatmysquad.com/beatmysquad_admin/public/users/profile/USER881698421979.png', '9649868677', NULL, NULL, NULL, NULL, NULL, 1, 3598, 'BMSNWET9C8', 0, NULL, NULL, NULL, 'BMSNWET9C8', NULL, NULL, NULL, NULL, NULL, 'd8Gpc7MoSmuB38xF44Gcbp:APA91bEv963PGUswriB1695MWMo5oqXivzSMcqeXEsNf-A9NAF8bAOtwjl3u8GKepkBxSYeZJlJiLsdpJIQ4nlASvcu-gfoZwOuAeaCDrR_Yd5WtIllmo5IyUdnrVkYOAXFEqK_KnyLW', '2023-10-26 12:47:07', '2023-10-27 21:22:59'),
(9, 'Milan', 'pilotharshad320@gmail.com', NULL, 'https://beatmysquad.com/beatmysquad_admin/public/users/profile/USER991698329549.png', '8401559228', 'Porbandar', 'Porbandar', 'Gujarat', 'India', 360575, 1, 1144, 'MILAN20', 0, NULL, '12/24/1991', 'male', 'beatmy11', NULL, NULL, NULL, '$2y$10$l52Y9m8Rd98BypbSL4xSFuGW5SATnsS8qS9.etSH9f/yyKxRKMTnG', NULL, 'ekge0iMdT_iH_R9jQjpJlV:APA91bGo_TqF810pmPsCqV1LP6dIdpk-10Z0ssSJQo_3K0tFhZ7gK59NoJEUiMStx89ApFcvFuI3crLRKxR0aq1skOD0wcDRhaOZVFRiRwdWRUyF8wgXXQdVfyoE7avgDsdRn6cjxTcq', '2023-10-26 13:59:40', '2023-10-27 14:40:43'),
(10, 'Ramesh', 'drrbthanki@gmail.com', NULL, 'https://beatmysquad.com/beatmysquad_admin/public/users/profile/USER10101698416318.png', '7016244286', 'Porbandar', 'Porbandar', 'Gujarat', 'India', 360575, 1, NULL, 'BMS0I4AF610', 0, NULL, '7/11/1961', 'male', 'RBT11', NULL, NULL, NULL, NULL, NULL, 'fiViSVZfRMmgAwkiz_66hb:APA91bHc6NlBOoHAv5z3TrAi2iefaqsZpMh-luK5xUXY1uVGYeJYwG3lmHmBRWbq2K7Zrd_mRHVehpajbn4qIRwM6JsFSkyj-V9KpBTW8QpJxNhtLfGRm3oHihMLutxVVm6prLX7LSxi', '2023-10-26 16:04:59', '2023-10-27 19:48:38'),
(11, 'Milan Joshi', 'milanjoshi1587@gmail.com', NULL, 'https://beatmysquad.com/beatmysquad_admin/public/users/profile/USER11111698337761.png', '8141325017', 'Gosa', 'Porbandar', 'Gujarat', 'India', 360575, 1, 7039, 'BMS3M3GR411', 0, NULL, '2/15/1987', 'male', 'MJ11', NULL, NULL, NULL, NULL, NULL, 'eWRuWJRGROOUPNKl5vzIqr:APA91bHuRygaYNrtRqMu1LQfNbNjVG0GHUBL9sazPeoAKRJLvqtSzL0GrPbtyY6PmQgOiS9HrQjrWQjXiFVPb3bpcF7DRsUE6A3GXFnN0crvkM4H8Sx2no-SNsfRr1drQ9qsg4kBSsfF', '2023-10-26 16:06:25', '2023-10-26 16:57:26'),
(12, 'Rohit Lalwani', 'rohit19.img@gmail.com', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIVQRQJSpLyH7iSxgkvcv0oCmZdn_HnqSTXyKuu2ld_TA=s96-c', '7014992938', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'BMSDR4FIY12', 0, NULL, NULL, NULL, 'BMSDR4FIY12', NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-27 10:26:29', '2023-10-27 10:55:59'),
(13, 'Harshad Thanki', 'harshadthanki.capt@gmail.com', NULL, NULL, '7600522412', 'Porbandar', 'porbandar', 'Gujarat', 'India', 360575, 1, NULL, 'BMSEW18YQ13', 0, NULL, '12/24/1991', 'male', 'beatmy1111', NULL, NULL, NULL, NULL, NULL, 'eX-U1Th7QfCr7aJ7XnQxlR:APA91bFk64u4ueXucxGD2mssg3eLNBx9soQwafuu13yyI71yk8bh_hLr2IvVwR16VysQpdCzodY-NiqNZe9wZAL7EQo5K3hMh8CYkn7DPi5ebqhnawbvPjd1Y6sSJAjhVkJzwTlfclbY', '2023-10-27 11:13:28', '2023-10-27 14:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_verify`
--

CREATE TABLE `user_verify` (
  `id` int UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `mobile_verify` int DEFAULT '0',
  `email_verify` int DEFAULT '0',
  `pan_verify` int DEFAULT '-1',
  `bank_verify` int DEFAULT '-1',
  `aadhar_verify` int DEFAULT '-1',
  `mobilebonus` int DEFAULT '0',
  `emailbonus` int NOT NULL DEFAULT '0',
  `panbonus` int DEFAULT '0',
  `bankbonus` int DEFAULT '0',
  `aadharbonus` int DEFAULT '0',
  `signupbonus` int DEFAULT '0',
  `referbonus` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_verify`
--

INSERT INTO `user_verify` (`id`, `userid`, `mobile_verify`, `email_verify`, `pan_verify`, `bank_verify`, `aadhar_verify`, `mobilebonus`, `emailbonus`, `panbonus`, `bankbonus`, `aadharbonus`, `signupbonus`, `referbonus`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(2, 2, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(3, 3, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(4, 4, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(5, 5, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(6, 6, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(7, 7, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 18:12:25', '2023-10-26 18:12:25'),
(8, 8, 1, 0, -1, -1, -1, 1, 0, 0, 0, 0, 1, 0, '2023-10-26 12:47:07', '2023-10-26 12:47:08'),
(9, 9, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 13:59:40', '2023-10-26 14:10:40'),
(10, 10, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:04:59', '2023-10-27 14:17:21'),
(11, 11, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2023-10-26 16:06:25', '2023-10-26 16:25:32'),
(12, 12, 1, 1, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 10:26:29', '2023-10-27 10:58:04'),
(13, 13, 1, 1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '2023-10-27 11:13:28', '2023-10-27 14:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `beneId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_request_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved_date` datetime DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `withdrawfrom` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` int NOT NULL DEFAULT '0',
  `suspect` int NOT NULL DEFAULT '0',
  `remark` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `user_id`, `amount`, `beneId`, `transfer_id`, `withdraw_request_id`, `comment`, `approved_date`, `status`, `withdrawfrom`, `review`, `suspect`, `remark`, `created_at`, `updated_at`) VALUES
(1, 10, 150, NULL, NULL, 'WD-10-1698458960', NULL, NULL, 0, 'winning', 0, 0, NULL, '2023-10-28 02:09:20', '2023-10-28 02:09:20'),
(2, 10, 150, NULL, NULL, 'WD-10-1698459253', NULL, NULL, 0, 'winning', 0, 0, NULL, '2023-10-28 02:14:13', '2023-10-28 02:14:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aadharcard`
--
ALTER TABLE `aadharcard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aadhar_number` (`aadhar_number`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userid_2` (`userid`,`aadhar_number`);

--
-- Indexes for table `adminwallets`
--
ALTER TABLE `adminwallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accno` (`accno`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userid_2` (`userid`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fantasy_type` (`fantasy_type`),
  ADD KEY `contest_cat` (`contest_cat`),
  ADD KEY `entryfee` (`entryfee`),
  ADD KEY `win_amount` (`win_amount`),
  ADD KEY `contest_type` (`contest_type`),
  ADD KEY `maximum_user` (`maximum_user`),
  ADD KEY `mega_status` (`mega_status`),
  ADD KEY `win_amount_2` (`win_amount_2`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `contest_category`
--
ALTER TABLE `contest_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `id` (`id`),
  ADD KEY `tbl_order` (`tbl_order`);

--
-- Indexes for table `devicetoken`
--
ALTER TABLE `devicetoken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fantasy`
--
ALTER TABLE `fantasy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finalresults`
--
ALTER TABLE `finalresults`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `joinedid_2` (`joinedid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `matchkey` (`matchkey`(255)),
  ADD KEY `challengeid` (`challengeid`),
  ADD KEY `transaction_id` (`transaction_id`(255)),
  ADD KEY `joinedid` (`joinedid`),
  ADD KEY `seriesid` (`seriesid`),
  ADD KEY `userid_2` (`userid`,`matchkey`(255)),
  ADD KEY `userid_3` (`userid`,`matchkey`(255),`challengeid`),
  ADD KEY `userid_4` (`userid`,`joinedid`),
  ADD KEY `rank` (`rank`),
  ADD KEY `status` (`status`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `generaltabs`
--
ALTER TABLE `generaltabs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `influencer_bonus`
--
ALTER TABLE `influencer_bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `fromid` (`fromid`),
  ADD KEY `matchkey` (`matchkey`),
  ADD KEY `challengeid` (`challengeid`),
  ADD KEY `txnid` (`txnid`),
  ADD KEY `userid_2` (`userid`,`matchkey`),
  ADD KEY `userid_3` (`userid`,`matchkey`,`challengeid`),
  ADD KEY `type` (`type`),
  ADD KEY `joinid` (`joinid`);

--
-- Indexes for table `joinedleauges`
--
ALTER TABLE `joinedleauges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `challengeid` (`challengeid`),
  ADD KEY `teamid` (`teamid`),
  ADD KEY `matchkey` (`matchkey`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `userid_2` (`userid`,`challengeid`),
  ADD KEY `challengeid_2` (`challengeid`,`matchkey`),
  ADD KEY `userid_3` (`userid`,`challengeid`,`matchkey`),
  ADD KEY `userid_4` (`userid`,`challengeid`,`teamid`,`matchkey`),
  ADD KEY `teamnumbercount` (`teamnumbercount`),
  ADD KEY `refercode` (`refercode`),
  ADD KEY `fantasy_type` (`fantasy_type`);

--
-- Indexes for table `jointeam`
--
ALTER TABLE `jointeam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `matchkey` (`matchkey`),
  ADD KEY `userid_2` (`userid`,`matchkey`),
  ADD KEY `teamnumber` (`teamnumber`),
  ADD KEY `userid_3` (`userid`,`matchkey`,`teamnumber`),
  ADD KEY `id` (`id`),
  ADD KEY `vicecaptain` (`vicecaptain`),
  ADD KEY `captain` (`captain`),
  ADD KEY `points` (`points`),
  ADD KEY `lastpoints` (`lastpoints`),
  ADD KEY `userid_4` (`userid`,`matchkey`),
  ADD KEY `matchkey_2` (`matchkey`,`captain`);

--
-- Indexes for table `leaugestransactions`
--
ALTER TABLE `leaugestransactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `matchkey` (`matchkey`),
  ADD KEY `challengeid` (`challengeid`),
  ADD KEY `joinid` (`joinid`),
  ADD KEY `user_id_2` (`user_id`,`matchkey`),
  ADD KEY `user_id_3` (`user_id`,`matchkey`,`challengeid`);

--
-- Indexes for table `listmatches`
--
ALTER TABLE `listmatches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `listmatches_matchkey_unique` (`matchkey`),
  ADD KEY `series` (`series`),
  ADD KEY `name` (`name`),
  ADD KEY `team2` (`team2`),
  ADD KEY `fantasy_type` (`fantasy_type`),
  ADD KEY `fantasy_type_2` (`fantasy_type`,`status`,`launch_status`,`final_status`),
  ADD KEY `real_matchkey` (`real_matchkey`),
  ADD KEY `second_inning_status` (`second_inning_status`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `playing11_status` (`playing11_status`),
  ADD KEY `team1` (`team1`),
  ADD KEY `fantasy_type_3` (`fantasy_type`,`start_date`,`status`,`launch_status`,`final_status`),
  ADD KEY `report_status` (`report_status`),
  ADD KEY `format` (`format`),
  ADD KEY `squadstatus` (`squadstatus`),
  ADD KEY `series_2` (`series`,`start_date`,`launch_status`),
  ADD KEY `tbl_order` (`tbl_order`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `matchchallenges`
--
ALTER TABLE `matchchallenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matchplayers`
--
ALTER TABLE `matchplayers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matchpricecards`
--
ALTER TABLE `matchpricecards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matchruns`
--
ALTER TABLE `matchruns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pancard`
--
ALTER TABLE `pancard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentprocess`
--
ALTER TABLE `paymentprocess`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_data`
--
ALTER TABLE `payment_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricecards`
--
ALTER TABLE `pricecards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_matches`
--
ALTER TABLE `result_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_points`
--
ALTER TABLE `result_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_challenges`
--
ALTER TABLE `stock_challenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_commodity`
--
ALTER TABLE `stock_commodity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_companies`
--
ALTER TABLE `stock_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_contest_category`
--
ALTER TABLE `stock_contest_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_exchanges`
--
ALTER TABLE `stock_exchanges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_listmatches`
--
ALTER TABLE `stock_listmatches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_matchchallenges`
--
ALTER TABLE `stock_matchchallenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_matchpricecards`
--
ALTER TABLE `stock_matchpricecards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_pricecards`
--
ALTER TABLE `stock_pricecards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempuser`
--
ALTER TABLE `tempuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `used_offer`
--
ALTER TABLE `used_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userbalance`
--
ALTER TABLE `userbalance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_verify`
--
ALTER TABLE `user_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aadharcard`
--
ALTER TABLE `aadharcard`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `adminwallets`
--
ALTER TABLE `adminwallets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contest_category`
--
ALTER TABLE `contest_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `devicetoken`
--
ALTER TABLE `devicetoken`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fantasy`
--
ALTER TABLE `fantasy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `finalresults`
--
ALTER TABLE `finalresults`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `generaltabs`
--
ALTER TABLE `generaltabs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `influencer_bonus`
--
ALTER TABLE `influencer_bonus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joinedleauges`
--
ALTER TABLE `joinedleauges`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jointeam`
--
ALTER TABLE `jointeam`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `leaugestransactions`
--
ALTER TABLE `leaugestransactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `listmatches`
--
ALTER TABLE `listmatches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `matchchallenges`
--
ALTER TABLE `matchchallenges`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `matchplayers`
--
ALTER TABLE `matchplayers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `matchpricecards`
--
ALTER TABLE `matchpricecards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `matchruns`
--
ALTER TABLE `matchruns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pancard`
--
ALTER TABLE `pancard`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentprocess`
--
ALTER TABLE `paymentprocess`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_data`
--
ALTER TABLE `payment_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `pricecards`
--
ALTER TABLE `pricecards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `result_matches`
--
ALTER TABLE `result_matches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `result_points`
--
ALTER TABLE `result_points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stock_challenges`
--
ALTER TABLE `stock_challenges`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_commodity`
--
ALTER TABLE `stock_commodity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_companies`
--
ALTER TABLE `stock_companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_contest_category`
--
ALTER TABLE `stock_contest_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_exchanges`
--
ALTER TABLE `stock_exchanges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_listmatches`
--
ALTER TABLE `stock_listmatches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_matchchallenges`
--
ALTER TABLE `stock_matchchallenges`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_matchpricecards`
--
ALTER TABLE `stock_matchpricecards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_pricecards`
--
ALTER TABLE `stock_pricecards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `tempuser`
--
ALTER TABLE `tempuser`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `used_offer`
--
ALTER TABLE `used_offer`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userbalance`
--
ALTER TABLE `userbalance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_verify`
--
ALTER TABLE `user_verify`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
