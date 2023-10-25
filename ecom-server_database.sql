-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table ecom-server.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_index` (`product_id`),
  KEY `carts_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.carts: ~0 rows (approximately)

-- Dumping structure for table ecom-server.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.categories: ~12 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Exfotiators', '2023-10-21 05:15:20', '2023-10-21 21:02:26'),
	(2, 'Eye Serums', '2023-10-21 05:27:48', '2023-10-21 21:01:52'),
	(4, 'Face Masques', '2023-10-21 06:15:33', '2023-10-21 21:03:08'),
	(5, 'Face Oils', '2023-10-21 06:17:09', '2023-10-21 21:03:30'),
	(6, 'Facial Cleansers', '2023-10-21 21:04:37', '2023-10-21 21:04:37'),
	(7, 'Moisturizers', '2023-10-21 21:05:48', '2023-10-21 21:05:48'),
	(8, 'Primers', '2023-10-21 21:06:03', '2023-10-21 21:06:03'),
	(9, 'Serums', '2023-10-21 21:06:50', '2023-10-21 21:06:50'),
	(10, 'Sets', '2023-10-21 21:07:01', '2023-10-21 21:07:01'),
	(11, 'Suncare', '2023-10-21 21:07:17', '2023-10-21 21:07:17'),
	(12, 'Toner', '2023-10-21 21:16:14', '2023-10-21 21:16:14'),
	(13, 'Tools', '2023-10-21 22:44:56', '2023-10-21 22:44:56');

-- Dumping structure for table ecom-server.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table ecom-server.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_user_id_foreign` (`user_id`),
  KEY `media_product_id_foreign` (`product_id`),
  CONSTRAINT `media_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `media_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.media: ~0 rows (approximately)

-- Dumping structure for table ecom-server.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.migrations: ~15 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 2),
	(3, '2019_08_19_000000_create_failed_jobs_table', 3),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 4),
	(5, '2023_10_19_105030_create_categories_table', 5),
	(6, '2023_10_19_105228_create_products_table', 6),
	(7, '2023_10_20_033954_create_media_table', 7),
	(8, '2023_10_20_034107_create_carts_table', 8),
	(9, '2023_10_20_034217_create_orders_table', 9),
	(10, '2023_10_20_040118_change_media_foreign_keys_to_nullable', 10),
	(12, '2023_10_21_143557_add_product_qty', 11),
	(14, '2023_10_20_040118_change_media_foreign_keys_to_nullable copy', 12),
	(15, '2023_10_21_143557_add_product_quantity', 13),
	(17, '2023_10_21_163851_create_order_items_table', 14),
	(18, '2023_10_22_135749_add_product_image', 15);

-- Dumping structure for table ecom-server.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` enum('Pending','For Packaging','Out for Delivery','Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` enum('Debit/Credit Card','Cash on Delivery') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.orders: ~4 rows (approximately)
INSERT INTO `orders` (`id`, `user_id`, `quantity`, `total`, `status`, `payment_type`, `created_at`, `updated_at`) VALUES
	(1, 2, 6, 1200.00, 'For Packaging', 'Debit/Credit Card', '2023-10-21 09:38:53', '2023-10-22 07:28:22'),
	(2, 1, 4, 800.00, 'Pending', 'Debit/Credit Card', '2023-10-21 09:47:38', '2023-10-21 09:47:38'),
	(3, 2, 3, 2092.26, 'Pending', 'Cash on Delivery', '2023-10-22 04:00:36', '2023-10-22 04:00:36'),
	(5, 2, 5, 2213.55, 'Pending', 'Cash on Delivery', '2023-10-22 07:29:04', '2023-10-22 07:29:04');

-- Dumping structure for table ecom-server.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.order_items: ~9 rows (approximately)
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`, `created_at`, `updated_at`) VALUES
	(1, '1', 5, 1, 200.00, 200.00, '2023-10-21 09:38:53', '2023-10-21 09:38:53'),
	(2, '1', 1, 1, 200.00, 200.00, '2023-10-21 09:38:53', '2023-10-21 09:38:53'),
	(3, '1', 4, 4, 200.00, 800.00, '2023-10-21 09:38:53', '2023-10-21 09:38:53'),
	(4, '2', 4, 4, 200.00, 800.00, '2023-10-21 09:47:38', '2023-10-21 09:47:38'),
	(5, '3', 15, 1, 618.04, 618.04, '2023-10-22 04:00:36', '2023-10-22 04:00:36'),
	(6, '3', 1, 2, 737.11, 1474.22, '2023-10-22 04:00:36', '2023-10-22 04:00:36'),
	(7, '5', 1, 1, 737.11, 737.11, '2023-10-22 07:29:04', '2023-10-22 07:29:04'),
	(8, '5', 1, 2, 1.11, 2.22, '2023-10-22 07:29:04', '2023-10-22 07:29:04'),
	(9, '5', 1, 2, 737.11, 1474.22, '2023-10-22 07:29:04', '2023-10-22 07:29:04');

-- Dumping structure for table ecom-server.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table ecom-server.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.personal_access_tokens: ~4 rows (approximately)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(7, 'App\\Models\\User', 2, 'test', '863a6cdf5f4fb1013db0be9cf1d1b33cd9a377fcdab1868a77029a2921b3e451', '["*"]', NULL, NULL, '2023-10-20 09:36:42', '2023-10-20 09:36:42'),
	(8, 'App\\Models\\User', 1, 'test', '22e8bcb01b7298f5c7a001283bc4a22d409788a29df8d7622b0470fd3c280911', '["*"]', NULL, NULL, '2023-10-20 09:37:00', '2023-10-20 09:37:00'),
	(9, 'App\\Models\\User', 2, 'test', 'de896a178539ddfa4342a7c1753745aa44552694e324a680fdad0c51b09ad091', '["*"]', '2023-10-22 07:35:28', NULL, '2023-10-21 05:00:30', '2023-10-22 07:35:28'),
	(10, 'App\\Models\\User', 3, 'test', '21169ff960ee5e5805747c9330527ffda98bf775a02627ffeb77ab332ace9faf', '["*"]', NULL, NULL, '2023-10-22 07:43:21', '2023-10-22 07:43:21');

-- Dumping structure for table ecom-server.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.products: ~48 rows (approximately)
INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'Glycolic Acid 7% Toning Solution', 'Glycolic Acid 7% Toning Solution is an exfoliator that significantly smoothes skin texture and promotes the appearance of a more even skin tone, as well as more luminous skin, with regular use. It also reduces the appearance of lines and wrinkles. The water-based toner format is suited to daily use. It contains a 7% concentration of Glycolic acid - a well-studied alpha-hydroxy acid - and a plant-derived Tasmanian Pepperberry derivative, which varies in colour seasonally, and which may cause an apparent colour variation in the formula from time to time. This formula should not be used on sensitive, peeling or compromised skin. Please refer to the additional sun protection notes and other warnings in the provided directions. This pH of this formula is approximately 3.6. Glycolic Acid has a pKa of 3.6 and pKa is the most important aspect to consider in formulating with acids. pKa describes the acidity of a molecule. When pKa is close to pH, there is an ideal balance between salt and acidity, maximizing effectiveness of the acid and reducing irritation.', 737.11, 1500, 'Toner.jpg', 1, '2023-10-21 07:20:08', '2023-10-22 06:09:33'),
	(3, 'AHA 30% + BHA 2% Peeling Solution', 'AHA 30% + BHA 2% Peeling Solution exfoliates multiple layers of the skin for a brighter, more even appearance. With the help of alpha-hydroxy acids (AHA), beta-hydroxy acids (BHA), and a studied Tasmanian pepperberry derivative, which reduces irritation that can be associated with acid use, this at-home peel helps even skin texture, clear pore congestion, and improve uneven pigmentation. The formula is further supported with a crosspolymer form of hyaluronic acid for comfort, pro-vitamin B5 for hydration, and black carrot for added protection. Note: This formula contains an extremely high concentration of free acids. We recommend use only if you are an experienced user of acid exfoliation and your skin is not sensitive. The pH of this formula is approximately 3.6. Glycolic Acid, the primary AHA used in the formula, has a pKa of 3.6 and pKa is the most important aspect to consider in formulating with acids. pKa implies acid availability. When pKa is close to pH, there is an ideal balance between salt and acidity, maximizing the effectiveness of the acid and reducing skin discomfort.', 538.65, 1500, 'Peel.jpg', 1, '2023-10-21 09:00:57', '2023-10-21 22:00:43'),
	(4, 'Lactic Acid 10% + HA', 'Lactic Acid 10% + HA is an alpha hydroxy acid solution that offers effective exfoliation targeted at the skin’s surface. It is supported with purified Tasmanian pepperberry extract, which has been shown to reduce irritation and sensitivity that can be associated with acid use. This water-based serum is ideal for dry skin types. This pH of this formula is approximately 3.8. Lactic Acid has a pKa of 3.8 and pKa is the most important aspect to consider in formulating with acids. pKa implies acid availability. When pKa is close to pH, there is an ideal balance between salt and acidity, maximizing effectiveness of the acid and reducing irritation', 504.63, 1500, 'Lactic10+HA.jpg', 1, '2023-10-21 09:00:59', '2023-10-21 21:44:41'),
	(5, 'Lactic Acid 5% + HA', 'Lactic Acid 5% + HA is a mild alpha hydroxy acid solution that offers gentle yet effective exfoliation targeted at the skin’s surface. It is supported with purified Tasmanian pepperberry extract , which has been shown to reduce irritation and sensitivity that can be associated with acid use. This water-based serum is ideal for dry and sensitive skin. This pH of this formula is approximately 3.8. Lactic Acid has a pKa of 3.8 and pKa is the most important aspect to consider in formulating with acids. pKa implies acid availability. When pKa is close to pH, there is an ideal balance between salt and acidity, maximizing effectiveness of the acid and reducing irritation', 442.26, 1500, 'Lactic5+HA.jpg', 1, '2023-10-21 09:01:00', '2023-10-21 21:46:08'),
	(6, 'Salicylic Acid 2% Solution', 'Made with Salicylic acid 2% concentration, this water based serum offers surface level exfoliation, encouraging the natural shedding of dead skin. It’s also lipophilic (oil- soluble) which means it can penetrate pores to control acne blemishes. The formula’s multi-functional approach helps clear up pores, improve the appearance of visible redness and comedones. This approach treats acne, allows skin to heal and results in clearer, smoother-looking skin. Suitable for use in teenagers with mild to moderate acne.', 368.55, 2000, 'SalicylicS.jpg', 1, '2023-10-21 21:49:39', '2023-10-21 21:49:39'),
	(7, 'Mandelic Acid 10% + HA', 'Mandelic Acid 10% + HA is an Alpha Hydroxy Acid serum that helps improve skin clarity, balance uneven skin tone, and correct skin texture in a gentle, yet effective manner. This is because it has a larger molecular weight than other alpha hydroxy acids, which results in a slower, more balanced distribution.', 425.25, 2000, 'Mandelic.jpg', 1, '2023-10-21 21:51:42', '2023-10-21 21:51:42'),
	(8, 'Salicylic Acid 2% Anhydrous Solution', 'Salicylic Acid 2% Anhydrous is a gentle formula that is designed to exfoliate the skin, decongest pores, smooth textural irregularities, and reduce redness and uneven skin tone. Among our other salicylic acid offerings, what sets this formula apart is its squalane-based emollient base and supporting hydrating polyglycerides. These ingredients release the salicylic acid over time and result in a more balanced distribution that helps reduce the irritation potential that can be associated with acid use making it ideal for new users.', 408.24, 2010, 'SalicylicAS.jpg', 1, '2023-10-21 21:52:46', '2023-10-21 21:52:46'),
	(9, 'Multi-Peptide Eye Serum', 'The Multi-Peptide Eye Serum is a water-based formula designed to target the appearance of common signs of aging around the eye area. This serum utilizes multiple peptide technologies to help reduce the appearance of crow’s feet and under eye wrinkles, eye bags, puffiness, and dark circles, leaving the eye area looking brighter, smoother and less puffy. The peptide technologies found within this eye serum formula include Palmitoyl Tripeptide-38. This formula also contains a combination of niacinamide and fraxinus excelsior bark extract, as well as propyl gallate, gallyl glucoside, and epigallocatechin gallatyl glucoside. Note: This formula comes at a higher price point than many of our other products due to the high concentration of actives required to address multiple eye area concerns at once. However, a little does go a long way. If you are looking to target puffiness and dark circles specifically, you may wish to explore our Caffeine Solution 5% + EGCG.', 1417.52, 2000, 'Eye.jpg', 2, '2023-10-21 22:08:29', '2023-10-21 22:08:29'),
	(10, 'Multi-Peptide Lash and Brow Serum', 'The Multi-Peptide Lash and Brow Serum is a light, non-greasy formula designed to support thicker, fuller, and healthier-looking lashes and brows. By utilizing 11 active ingredients, including four peptide complexes and a series of natural extracts, this twice-daily serum works to help nourish and protect your lashes and brows while enhancing the look of density and overall appearance in as little as four weeks. This formula contains SYMPEPTIDE XLASH® complex (with Myristoyl Pentapeptide-17), Anargy® complex (with Oligopeptide-2 and Glycoproteins), Widelash™ complex (with Biotinoyl Tripeptide-1 and Panthenol), REDENSYL™ complex (with Larix Europaea Wood Extract, Camellia Sinensis Leaf Extract, and Zinc Chloride), CAPIXYL™ complex (Acetyl Tetrapeptide-3 and Trifolium Pratense Flower Extract), and High-Solubility Caffeine.', 822.16, 2000, 'Lash.jpg', 2, '2023-10-21 22:10:05', '2023-10-21 22:10:05'),
	(11, 'Caffeine Solution 5% + EGCG', 'Caffeine Solution 5% + EGCG is a water-based serum that reduces the look of puffiness and dark circles in the eye contour. The formula works by combining a high concentration of caffeine with a highly-purified epigallocatechin gallatyl glucoside (EGCG).', 504.63, 2000, 'Caffeine.jpg', 2, '2023-10-21 22:11:39', '2023-10-21 22:11:39'),
	(12, 'Argireline Solution 10%', 'Argireline Solution 10% offers an advanced formula targeting dynamic forehead, “eleven eye”, and smile lines in an effective, “non-injective” way. By incorporating a high concentration of Argireline™ , this lightweight serum improves the appearance of facial areas prone to deep-set lines, resulting in smoother, more relaxed skin.', 532.98, 2000, 'Argireline.jpg', 2, '2023-10-21 22:12:48', '2023-10-21 22:12:48'),
	(13, 'AHA 30% + BHA 2% Peeling Solution', 'AHA 30% + BHA 2% Peeling Solution exfoliates multiple layers of the skin for a brighter, more even appearance. With the help of alpha-hydroxy acids (AHA), beta-hydroxy acids (BHA), and a studied Tasmanian pepperberry derivative, which reduces irritation that can be associated with acid use, this at-home peel helps even skin texture, clear pore congestion, and improve uneven pigmentation. The formula is further supported with a crosspolymer form of hyaluronic acid for comfort, pro-vitamin B5 for hydration, and black carrot for added protection. AHA 30% + BHA 2% Peeling Solution exfoliates multiple layers of the skin for a brighter, more even appearance. With the help of alpha-hydroxy acids (AHA), beta-hydroxy acids (BHA), and a studied Tasmanian pepperberry derivative, which reduces irritation that can be associated with acid use, this at-home peel helps even skin texture, clear pore congestion, and improve uneven pigmentation. The formula is further supported with a crosspolymer form of hyaluronic acid for comfort, pro-vitamin B5 for hydration, and black carrot for added protection. The pH of this formula is approximately 3.6. Glycolic Acid, the primary AHA used in the formula, has a pKa of 3.6 and pKa is the most important aspect to consider in formulating with acids. pKa implies acid availability. When pKa is close to pH, there is an ideal balance between salt and acidity, maximizing the effectiveness of the acid and reducing skin discomfort.', 538.65, 2000, 'Peel.jpg', 4, '2023-10-21 22:21:08', '2023-10-21 22:21:08'),
	(14, 'Salicylic Acid 2% Masque', 'Salicylic Acid 2% Masque is a charcoal- and clay-infused formula that targets lacklustre tone and textural irregularities, leaving your skin clean and refreshed. With the help of salicylic acid, a lipophilic BHA known to target pore congestion, this deeply cleansing masque removes dead skin cells and excess oil, which promotes soft and smooth skin. The clay and charcoal absorb facial impurities that would otherwise clog pores, helping to boost radiance.', 754.12, 1500, 'SalicylicM.jpg', 4, '2023-10-21 22:22:10', '2023-10-21 22:22:10'),
	(15, '100% Organic Cold-Pressed Rose Hip Seed Oil', '100% Organic Cold-Pressed Rosehip Seed Oil naturally hydrates skin to help address signs of aging by brightening and balancing uneven skin tone, supporting skin elasticity, and promoting supple, more radiant-looking skin. It’s made of 100% organic rosehip seed oil that is cold-pressed to retain its potency and is gentle enough for daily use. Our Rose Hip Seed Oil is completely unrefined and imparts a natural scent partly due to its high omega fatty acid content. This scent is not an indication of rancidity.', 618.04, 1500, 'Rose.jpg', 5, '2023-10-21 22:24:20', '2023-10-21 22:24:20'),
	(16, '100% Organic Cold-Pressed Moroccan Argan Oil', '100% Organic Cold-Pressed Moroccan Argan Oil is a cold-pressed, organic oil that naturally hydrates the skin while combating dryness and supporting healthy-looking skin. Argan oil is rich in fatty acids, vitamins, and other compounds, which allows it to also be used in hair, increasing softness and sheen. Our Moroccan Argan Oil is completely unrefined and imparts a natural scent. This scent is not an indication of rancidity.', 425.25, 1500, 'Moroccan.jpg', 5, '2023-10-21 22:25:31', '2023-10-21 22:25:31'),
	(17, '100% Organic Cold-Pressed Borage Seed Oil', '100% Organic Cold-Pressed Borage Seed Oil soothes, hydrates, and nourishes dry skin, thanks to its exceptionally high concentration of gamma-linolenic acid (GLA), an essential fatty acid that supports healthy-looking skin. And because it’s made of 100% organic borage seed oil that is naturally sourced and cold-pressed, it’s rich in linoleic, oleic, stearic, and palmitic acids—meaning it’s ideal for skin that has become irritated due to dryness. Our Borage Seed Oil imparts a characteristic odour. This scent is not an indication of rancidity.', 266.49, 2500, 'Borage.jpg', 5, '2023-10-21 22:27:15', '2023-10-21 22:27:15'),
	(18, '100% Organic Virgin Chia Seed Oil', '100% Organic Virgin Chia Seed Oil hydrates your skin without clogging pores. And because it’s made of 100% organic, virgin chia seed oil that is naturally sourced and cold-pressed, it contains alpha-linolenic acid —an essential fatty acid that promotes healthy-looking skin. What’s more, this natural skin hydrator also contains linoleic, oleic, stearic, and palmitic acids, which means it’s ideal for both skin and hair. Our Chia Seed Oil has a natural scent partly due to its high alpha-linolenic acid content.', 481.95, 2000, 'Chia.jpg', 5, '2023-10-21 22:28:17', '2023-10-21 22:28:17'),
	(19, '100% Organic Virgin Sea-Buckthorn Fruit Oil', '100% Organic Virgin Sea-Buckthorn Fruit Oil offers a high concentration of palmitoleic acid. This vibrantly coloured oil rehydrates your skin and protects its natural moisture barrier from damage due to dryness. It also contains linoleic, oleic, stearic, and palmitic acids, as well as antioxidants, which means this organically-sourced hydrator adds protection from the visible signs of oxidative stress while promoting a brighter complexion. Our Sea-Buckthorn Fruit oil is unrefined and imparts a natural scent due to its high palmitoleic acid (Omega-7) content. The formula\'s intense natural orange-red hue is due to its high carotenoids and lycopene content. After application, the colour of this oil will remain on your skin until it is washed off. Please use a very small amount or dilute with other products for easier application.', 935.56, 2000, 'Sea.jpg', 5, '2023-10-21 22:29:54', '2023-10-21 22:29:54'),
	(20, '“B” Oil', '“B” Oil offers a comprehensive blend of micro-algae, squalane, and antioxidant-rich oils (such as crambe and jojoba) that enhance skin radiance over time, supporting a natural glow by protecting your complexion from natural stressors. This formula offers effective surface hydration for a visibly softer and smoother appearance.The formula imparts a golden green hue and a mild herbal odour as a result of its high micro-algae concentration.', 629.38, 2000, 'B.jpg', 5, '2023-10-21 22:31:36', '2023-10-21 22:31:36'),
	(21, '100% Cold-Pressed Virgin Marula Oil', '100% Organic Cold-Pressed Virgin Marula Oil is a hydrating oil that helps visibly restore radiant tone, thanks to a combination of naturally present antioxidants. And because it’s made of 100% organic, virgin marula seed oil that is both cold-pressed and unrefined, this extra-rich oil contains oleic and linoleic acid that support skin hydration, which means it’s ideal for dry skin.', 623.71, 2000, 'Marula.jpg', 5, '2023-10-21 22:32:20', '2023-10-21 22:32:20'),
	(22, 'Squalane Cleanser', 'Squalane Cleanser is formulated to clean skin by removing makeup and dirt. This cleanser also supports your skin’s moisture barrier through hydration. Its skin-cleansing properties harness plant-derived squalane, a well-studied moisturizing agent, alongside lipophilic esters that will leave your skin feeling smooth and soft while dissolving makeup. The formula is non-comedogenic and soap-free so it’s gentle enough for daily use, suitable for all skin types, and suitable to combine with our other products.', 510.30, 2000, 'Squalane.jpg', 6, '2023-10-21 22:33:51', '2023-10-21 22:33:51'),
	(23, 'Glucoside Foaming Cleanser', 'The Glucoside Foaming Cleanser is a gel-like foaming cleanser that effectively helps remove dirt and environmental impurities. This formulation helps maintain the skin\'s moisture barrier, while also improving the look of skin clarity, skin texture, skin radiance, and suppleness with continued use. Formulated, and clinically proven, to be suitable for babies, Glucoside Foaming Cleanser respects the barrier of even the most delicate skin.Note: The surfactants used within this formulation are plant-derived.', 708.76, 2000, 'Glucoside.jpg', 6, '2023-10-21 22:36:26', '2023-10-21 22:36:26'),
	(24, 'Glycolipid Cream Cleanser', 'The Glycolipid Cream Cleanser effectively cleanses the skin and removes makeup such as foundation, eyeliner, and mascara. This formulation uses a plant-derived glycolipid cleansing agent that cleanses the skin while respecting the skin barrier to maintain hydration. Additionally, this cleanser is formulated to be non-stripping to respect the skin\'s natural pH.', 708.76, 2000, 'Glycolipid.jpg', 6, '2023-10-21 22:36:59', '2023-10-21 22:36:59'),
	(25, 'Natural Moisturizing Factors + PhytoCeramides', 'Natural Moisturizing Factors + PhytoCeramides is our most nourishing moisturizer, formulated with nearly four times more moisturizing emollients and two times more humectants than our Natural Moisturising Factors + HA. This rich and replenishing cream immediately boosts skin hydration by 68%,* helps strengthen the skin barrier, and offers all-day hydration, making it ideal for dry skin. It offers a triple-action approach to targeting dryness with the inclusion of skin-identical Natural Moisturizing Factors, PhytoCeramides and skin lipids. The inclusion of plant-derived PhytoCeramides help to improve the look of skin quality, for a fresher, more plumped appearance.', 1275.77, 2000, 'Phyto.jpg', 7, '2023-10-21 22:38:36', '2023-10-21 22:38:36'),
	(26, 'Natural Moisturizing Factors + HA', 'Natural Moisturizing Factors + HA is a moisturizer that works with your skin to support its natural hydration barrier. By using a collection of ingredients that appear naturally in your skin—such as amino acids, fatty acids, triglycerides, urea, ceramides, phospholipids, glycerine, saccharides, sodium PCA, and hyaluronic acid—this cream keeps the outer layer of your skin protected and well-hydrated, without feeling greasy. Plus, it provides both immediate and lasting effects, as it works to significantly improve skin barrier function with regular use.', 368.55, 2000, 'HA.jpg', 7, '2023-10-21 22:39:32', '2023-10-21 22:39:32'),
	(27, 'Natural Moisturizing Factors + Beta Glucan', 'Natural Moisturizing Factors + Beta Glucan is a lightweight gel moisturizer that provides all-day hydration after one application. With a blend of natural moisturizing factors, beta glucan, and ceramides, it also fortifies the skin\'s natural barrier. The Beta Glucan within the formula is an effective humectant, which helps to retain moisture. This helps support other ingredients within the formula to offer immediate hydration and barrier support. Ideal for all skin types, including sensitive skin, its non-greasy formula is particularly beneficial for those with oily and combination skin.', 765.46, 2000, 'Beta.jpg', 7, '2023-10-21 22:41:01', '2023-10-21 22:41:01'),
	(28, 'High-Adherence Silicone Primer', 'High-Adherence Silicone Primer is a cream-like product that uses advanced adaptive silicones to blur the look of pores and imperfections so that your makeup goes on smooth and stays on longer. And just like everything in our Colours collection, this formula is designed to be suitable for all skin types.', 379.89, 2000, 'Silicone.jpg', 8, '2023-10-21 22:42:19', '2023-10-21 22:42:19'),
	(29, 'High-Spreadability Fluid Primer', 'High-Spreadability Fluid Primer helps create a smooth base for longer-lasting makeup application. This next-generation primer increases the spreadability of your makeup so that it looks more even and natural—especially around your eyes, within fine lines, and on dry skin. Plus, it contains high-flexibility silicones, which means it has a soft, velvety feel with a dewy finish. And just like everything in our Colours collection, this formula is designed to be suitable for all skin types.', 567.01, 2000, 'Fluid.jpg', 8, '2023-10-21 22:44:32', '2023-10-21 22:44:32'),
	(30, 'Niacinamide 10% + Zinc 1%', 'Our Niacinamide 10% + Zinc 1% formula is a water-based serum that boosts skin brightness, improves skin smoothness and reinforces the skin barrier over time. It contains a high 10% concentration of Niacinamide (vitamin b3) and zinc PCA.Note: Niacinamide and Zinc PCA is not a treatment for acne. For persistent acne-related conditions, we recommend speaking to your health care provider regarding treatment options. This formulation can be used alongside acne treatments if desired for added visible skin benefits.', 340.20, 2000, 'Niacinamide.jpg', 9, '2023-10-21 23:04:01', '2023-10-21 23:04:01'),
	(31, 'Hyaluronic Acid 2% + B5', 'Hyaluronic Acid 2% + B5 is a water-based formula combining low-, medium- and high-molecular-weight hyaluronic acid molecules and a next-generation HA crosspolymer to support hydration to multiple layers of your skin. It also targets the appearance of wrinkles and textural irregularities. Plus, it uses pro-vitamin B5 to enhance hydration at the outer layers, resulting in smoother, plumper skin.', 504.63, 2000, 'Hyaluronic.jpg', 9, '2023-10-21 23:05:31', '2023-10-21 23:05:31'),
	(32, 'Multi-Peptide + HA Serum (Buffet)', 'Multi-Peptide + HA Serum (formerly known as “Buffet”) is a universal formula that combines a comprehensive array of technologies to improve skin smoothness and target multiple signs of aging at once. By utilizing four well-studied peptide technologies, skin-friendly amino acids, and multiple hyaluronic acid complexes, it helps significantly improve the appearance of crow\'s feet, as well as improving the feel of skin elasticity and firmness.', 992.26, 2000, 'Buffet.jpg', 9, '2023-10-21 23:08:08', '2023-10-21 23:08:08'),
	(33, 'Multi-Peptide + Copper Peptides 1% Serum', 'Multi-Peptide + Copper Peptides 1% (previously “Buffet” + Copper Peptides 1%) is a universal formula which utilizes multiple skin support technologies that target multiple signs of aging at once. The formula incorporates five well-studied peptide technologies, skin-friendly amino acids, and multiple hyaluronic acids. For those looking for an all-in-one solution for skin care, Multi-Peptide + Copper Peptides 1% helps to improve the appearance of fine and dynamic lines and supports your skin’s overall elasticity, smoothness and firmness. And because this advanced serum contains direct copper peptides, it also targets signs of aging that are typically associated with oxidative stress, resulting in radiant, healthier-looking skin.', 1752.06, 2000, 'Copper.jpg', 9, '2023-10-21 23:09:15', '2023-10-21 23:09:15'),
	(34, 'Soothing & Barrier Support Serum', 'Soothing & Barrier Support Serum is a multi-active solution targeted at reducing the look of irritated skin. It helps recover the skin barrier in 2 hours*, and provides an immediate 86%** boost in skin hydration. This helps soothe feelings of discomfort, and reduce signs of redness. While strengthening the skin barrier, the Soothing & Barrier Support Serum also improves the look of uneven texture for a smoother appearance. Formulated with multiple vitamins, lipids, and phytotechnologies, this comprehensive serum is suitable for all skin types, including sensitive skin.', 963.91, 2000, 'Barrier.jpg', 9, '2023-10-21 23:11:12', '2023-10-21 23:11:12'),
	(35, 'Multi-Peptide Lash and Brow Serum', 'The Multi-Peptide Lash and Brow Serum is a light, non-greasy formula designed to support thicker, fuller, and healthier-looking lashes and brows. By utilizing 11 active ingredients, including four peptide complexes and a series of natural extracts, this twice-daily serum works to help nourish and protect your lashes and brows while enhancing the look of density and overall appearance in as little as four weeks.', 822.16, 2000, 'Lash.jpg', 9, '2023-10-21 23:12:41', '2023-10-21 23:12:41'),
	(36, 'Azelaic Acid Suspension 10%', 'Azelaic Acid Suspension 10% is a cream-like formula that brightens skin tone and visibly improves skin texture due to a high concentration of azelaic acid—a natural and effective antioxidant found in grains. It has a lower irritation potential than other direct acids, which means it’s gentle enough for daily use as part of your skincare regimen.', 629.30, 2000, 'Azelaic.jpg', 9, '2023-10-21 23:14:47', '2023-10-21 23:14:47'),
	(37, 'Matrixyl 10% + HA', 'Matrixyl 10% + HA offers an advanced formula that targets fine lines and wrinkles by promoting firmer, plumper skin. With two generations of MatrixylTM and hyaluronic acid, this lightweight serum improves the appearance of facial areas prone to fine lines by supporting your skin’s overall collagen production.', 595.36, 2000, 'Matrixyl.jpg', 9, '2023-10-21 23:15:55', '2023-10-21 23:15:55'),
	(38, 'Amino Acids + B5', 'Amino Acids + B5 is an ultra-thin serum that works with your skin to support its natural hydration barrier. By including a concentrated 17% (by weight) solution of amino acids and amino acid derivatives that mimic your skin’s natural moisturizing factors, this water-based formula keeps the outer layer of your skin protected and well-hydrated without feeling greasy. Plus, it uses 5% (by weight) pro-vitamin B5 to provide surface and below-surface hydration, giving way to softer, smoother skin.', 504.63, 2000, 'Amino.jpg', 9, '2023-10-21 23:17:05', '2023-10-21 23:17:05'),
	(39, 'Ascorbyl Tetraisopalmitate Solution 20% in Vitamin F', 'Ascorbyl Tetraisopalmitate Solution 20% in Vitamin F is a lightweight oil that helps reduce signs of aging by brightening and balancing uneven skin tone. Unlike direct forms of vitamin C, this hydrating formula contains an oil-soluble vitamin C derivative that converts into vitamin C once applied, giving it less irritation potential. Plus, it has vitamin F—Omega 3 and Omega 6 fatty acids—to help support your skin’s natural hydration barrier.', 1122.68, 2000, 'Ascorbyl.jpg', 9, '2023-10-21 23:20:56', '2023-10-21 23:20:56'),
	(40, 'Granactive Retinoid 5% in Squalane', 'Granactive Retinoid 5% in Squalane is a light, oil-like serum that targets visible signs of aging through a highly-advanced retinoid active, one of the best all-around ingredients for skin. This next-generation retinoid improves the appearance of fine and dynamic lines that arise from a loss of collagen and elastin while evening skin texture and tone. It’s further supported with squalane, a moisturizing agent naturally found in the skin. That means it not only delivers comparable visible results to retinol, it’s less likely to cause irritation. Note: Once opened, this formula should be refrigerated and used within a three-month period. Caution: Retinoids can make the skin more sensitive to UV radiation. Sun protection is particularly important when using retinoids. This product must not be used in conjunction with other retinoids including retinol or retinoic acid. This product is not a treatment for acne. Note: When pregnant or breastfeeding, it is recommended to avoid any skincare products containing retinoids such as formulations with Granactive Retinoid or Retinol.', 912.88, 2000, 'Granactive.jpg', 9, '2023-10-21 23:22:24', '2023-10-21 23:22:24'),
	(41, 'Argireline Solution 10%', 'Argireline Solution 10% offers an advanced formula targeting dynamic forehead, “eleven eye”, and smile lines in an effective, “non-injective” way. By incorporating a high concentration of Argireline™ , this lightweight serum improves the appearance of facial areas prone to deep-set lines, resulting in smoother, more relaxed skin.', 532.98, 2000, 'Argireline.jpg', 9, '2023-10-21 23:24:37', '2023-10-21 23:24:37'),
	(42, '100% Plant-Derived Squalane', '100% Plant-Derived Squalane hydrates your skin while supporting its natural moisture barrier. Squalane is an exceptional hydrator found naturally in the skin, and this formula uses 100% plant-derived squalane derived from sugar cane for a non-comedogenic solution that enhances surface-level hydration. Our 100% Plant-Derived Squalane formula can also be used in hair to increase heat protection, add shine, and reduce breakage.', 567.01, 2000, 'Plant.jpg', 9, '2023-10-21 23:26:27', '2023-10-21 23:26:27'),
	(43, 'Marine Hyaluronics', 'Marine Hyaluronics offers an exceptionally lightweight serum, acting as a hyaluronic acid-alternative, which directs water where you need it most. By combining exopolysaccharides from skin-friendly marine bacteria, Hawaiian red algae, glycoproteins from Antarctic marine sources, micro-filtered blue-green algae, and several amino acids, this water-based formula targets hydration below the skin surface, resulting in a softer, plumper complexion.', 504.63, 2000, 'Marine.jpg', 9, '2023-10-21 23:27:19', '2023-10-21 23:27:19'),
	(44, 'Alpha Arbutin 2% + HA', 'Alpha Arbutin 2% + HA is a water-based serum specifically designed to target uneven skin tone and visibly improve pigmentation. It combines a high concentration of purified alpha arbutin, a well-known skin-brightening ingredient, with hyaluronic acid. Purified alpha-arbutin works to target dark spots and uneven skin tone. Meanwhile, hyaluronic acid helps to support product absorption into the skin. Note: Alpha Arbutin is extremely sensitive to degradation in the presence of water if the pH of the formulation is not ideal. The pH of this formula has been shown to be the most suitable pH to minimize degradation of Alpha Arbutin. We are aware of the potential colour changes of our Alpha Arbutin product. This is a natural occurrence, where certain ingredients in the product can change colour when exposed to sunlight or increased temperature. Testing has shown that the efficacy and safety profile of the active ingredient remains stable.', 629.38, 2000, 'Alpha.jpg', 9, '2023-10-21 23:29:01', '2023-10-21 23:29:01'),
	(45, 'Retinol 0.5% in Squalane', 'Retinol 0.5% in Squalane offers a water-free solution containing 0.5% retinol—an ingredient that improves the appearance of fine and dynamic lines that arise from a loss of collagen and elastin, while evening skin texture and tone. What’s more, this intermediate formula is supported with squalane, a moisturizing agent naturally found in your skin that enhances surface-level hydration and helps combat the dryness that can be associated with retinol use.\n\nThe Ordinary Tip: Start with Retinol 0.2% in Squalane and slowly work your way up to Retinol 0.5% in Squalane and Retinol 1% in Squalane. That said, if you are prone to sensitivity, you may prefer to use newer retinoid technologies, such as those found in our Granactive Retinoid 2% Emulsion.\n\nNote: Once opened, this formula should be refrigerated and used within a three-month period.\n\nCaution: Retinoids can make the skin more sensitive to UV radiation. Sun protection is particularly important when using retinoids. This product must not be used in conjunction with other retinoids including retinol or retinoic acid. This product is not a treatment for acne.\n\nNote: When pregnant or breastfeeding, it is recommended to avoid any skincare products containing retinoids such as formulations with Granactive Retinoid or Retinol.', 470.61, 2000, 'Retinol.jpg', 9, '2023-10-21 23:31:58', '2023-10-21 23:31:58'),
	(46, 'Mineral UV Filters SPF 30 with Antioxidants', 'Mineral UV Filters SPF 30 with Antioxidants is a broad-spectrum mineral sunscreen providing SPF 30 protection and integrates antioxidant, and hydration support. By providing both UVA and UVB coverage, this daily formula helps protect your skin against sunburn and sun damage and decreases early signs of aging caused by the sun. Its physical-based filters make it suitable for all skin types and a wide range of ages. The Mineral UV Filter formulas avoid the use of any nanoparticles.', 612.37, 2000, 'Suncare30.jpg', 11, '2023-10-21 23:35:38', '2023-10-21 23:35:38'),
	(47, 'Mineral UV Filters SPF 15 with Antioxidants', 'Mineral UV Filters SPF 15 with Antioxidants is a broad-spectrum mineral sunscreen providing SPF 15 protection and integrating antioxidant, and hydration support. By providing both UVA and UVB coverage, this daily formula helps protect your skin against sunburn and sun damage and decreases early signs of aging caused by the sun. Its physical-based filters make it suitable for all skin types and a wide range of ages. The Mineral UV Filter formulas avoid the use of any nanoparticles.', 561.34, 2000, 'Suncare15.jpg', 11, '2023-10-21 23:36:31', '2023-10-21 23:36:31'),
	(48, 'Glycolic Acid 7% Toning Solution', 'Glycolic Acid 7% Toning Solution is an exfoliator that significantly smoothes skin texture and promotes the appearance of a more even skin tone, as well as more luminous skin, with regular use. It also reduces the appearance of lines and wrinkles. The water-based toner format is suited to daily use. It contains a 7% concentration of Glycolic acid - a well-studied alpha-hydroxy acid - and a plant-derived Tasmanian Pepperberry derivative, which varies in colour seasonally, and which may cause an apparent colour variation in the formula from time to time. This formula should not be used on sensitive, peeling or compromised skin. Please refer to the additional sun protection notes and other warnings in the provided directions. This pH of this formula is approximately 3.6. Glycolic Acid has a pKa of 3.6 and pKa is the most important aspect to consider in formulating with acids. pKa describes the acidity of a molecule. When pKa is close to pH, there is an ideal balance between salt and acidity, maximizing effectiveness of the acid and reducing irritation. The Ordinary Tip: The multi-functional formula can also be applied to the scalp, where it helps rebalance and reduces dryness by hydrating the scalp skin.', 737.11, 2000, 'Toner.jpg', 12, '2023-10-21 23:38:41', '2023-10-21 23:38:41'),
	(49, 'Dropper - 1pc', 'An optional dropper to help dispense serum foundations. Suitable for 30ml Serum Foundation bottles', 51.03, 2000, 'Dropper.jpg', 13, '2023-10-21 23:40:25', '2023-10-21 23:40:25');

-- Dumping structure for table ecom-server.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecom-server.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@gmail.com', 'admin', '64574', 'ppc', NULL, '$2y$10$XvhAqohAkBwRvfPokNwQbeLEyGl1.4B1XtDtNW2gC7hx7VhSKVRB6', NULL, '2023-10-20 07:30:57', '2023-10-20 07:30:57'),
	(2, 'user', 'user@gmail.com', 'user', '64574', 'ppc', NULL, '$2y$10$9tmPr5b7n0fa3mTxKp.0COPTzPxxz.bgs9ndr1zh0QDdHq6zEk01y', NULL, '2023-10-20 07:34:12', '2023-10-20 07:34:12'),
	(3, 'user1', 'user1@gmail.com', 'user', '64574', 'ppc', NULL, '$2y$10$lGY2eTkvfsPy4DG08K.nCuXp8/U7XJLstWNcRyvkDAua2ULOVZNvO', NULL, '2023-10-22 07:43:21', '2023-10-22 07:43:21');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
