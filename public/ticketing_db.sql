# ************************************************************
# Sequel Ace SQL dump
# Version 20096
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 9.5.0)
# Database: ticketing_db
# Generation Time: 2026-01-26 17:31:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cache_locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table detail_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detail_orders`;

CREATE TABLE `detail_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `tiket_id` bigint unsigned NOT NULL,
  `jumlah` int NOT NULL,
  `subtotal_harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_orders_order_id_foreign` (`order_id`),
  KEY `detail_orders_tiket_id_foreign` (`tiket_id`),
  CONSTRAINT `detail_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detail_orders_tiket_id_foreign` FOREIGN KEY (`tiket_id`) REFERENCES `tikets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `detail_orders` WRITE;
/*!40000 ALTER TABLE `detail_orders` DISABLE KEYS */;

INSERT INTO `detail_orders` (`id`, `order_id`, `tiket_id`, `jumlah`, `subtotal_harga`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,1500000.00,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(2,2,3,1,200000.00,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(3,3,3,1,200000.00,'2026-01-17 07:30:56','2026-01-17 07:30:56'),
	(4,4,4,2,600000.00,'2026-01-17 13:27:11','2026-01-17 13:27:11'),
	(5,5,1,1,1500000.00,'2026-01-17 15:34:59','2026-01-17 15:34:59'),
	(6,6,1,2,3000000.00,'2026-01-17 15:55:05','2026-01-17 15:55:05');

/*!40000 ALTER TABLE `detail_orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `kategori_id` bigint unsigned NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_waktu` datetime NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_user_id_foreign` (`user_id`),
  KEY `events_kategori_id_foreign` (`kategori_id`),
  CONSTRAINT `events_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;

INSERT INTO `events` (`id`, `user_id`, `kategori_id`, `judul`, `deskripsi`, `lokasi`, `tanggal_waktu`, `gambar`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'Konser Musik Rock','Nikmati malam penuh energi dengan band rock terkenal.','Stadion Utama','2024-08-15 19:00:00','1768653645.png','2026-01-17 04:44:51','2026-01-17 12:40:45'),
	(2,1,2,'Pameran Seni Kontemporer','Jelajahi karya seni modern dari seniman lokal dan internasional.','Galeri Seni Kota','2024-09-10 10:00:00','1768653718.jpg','2026-01-17 04:44:51','2026-01-17 12:41:58'),
	(3,1,3,'Festival Makanan Internasional','Cicipi berbagai hidangan lezat dari seluruh dunia.','Taman Kota','2024-10-05 12:00:00','1768653743.png','2026-01-17 04:44:51','2026-01-17 12:42:23'),
	(6,1,1,'kontes MLBB','MLBB','Gedung H','2026-01-24 22:57:00','1768665458.png','2026-01-17 15:57:38','2026-01-17 15:57:38'),
	(7,1,6,'Konser Kotak','konser kotak dinus inside','Gedung G','2026-01-29 13:32:00','1769409191.jpg','2026-01-26 06:33:11','2026-01-26 06:33:11');

/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
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



# Dump of table job_batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table kategoris
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kategoris`;

CREATE TABLE `kategoris` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kategoris_nama_unique` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `kategoris` WRITE;
/*!40000 ALTER TABLE `kategoris` DISABLE KEYS */;

INSERT INTO `kategoris` (`id`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,'Sport','2026-01-17 04:44:50','2026-01-17 13:28:37'),
	(2,'Seminar','2026-01-17 04:44:50','2026-01-17 04:44:50'),
	(3,'Workshop','2026-01-17 04:44:50','2026-01-17 04:44:50'),
	(6,'Konser','2026-01-26 06:31:28','2026-01-26 06:32:25');

/*!40000 ALTER TABLE `kategoris` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'0001_01_01_000000_create_users_table',1),
	(2,'0001_01_01_000001_create_cache_table',1),
	(3,'0001_01_01_000002_create_jobs_table',1),
	(4,'2026_01_13_074436_create_kategoris_table',1),
	(5,'2026_01_13_074446_create_events_table',1),
	(6,'2026_01_13_074451_create_tikets_table',1),
	(7,'2026_01_13_074455_create_orders_table',1),
	(8,'2026_01_13_074500_create_detail_orders_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `event_id` bigint unsigned NOT NULL,
  `order_date` datetime NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_event_id_foreign` (`event_id`),
  CONSTRAINT `orders_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `event_id`, `order_date`, `total_harga`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'2024-07-01 14:30:00',1500000.00,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(2,2,2,'2024-07-02 10:15:00',200000.00,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(3,5,2,'2026-01-17 07:30:56',200000.00,'2026-01-17 07:30:56','2026-01-17 07:30:56'),
	(4,8,3,'2026-01-17 13:27:11',600000.00,'2026-01-17 13:27:11','2026-01-17 13:27:11'),
	(5,9,1,'2026-01-17 15:34:59',1500000.00,'2026-01-17 15:34:59','2026-01-17 15:34:59'),
	(6,10,1,'2026-01-17 15:55:05',3000000.00,'2026-01-17 15:55:05','2026-01-17 15:55:05');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`)
VALUES
	('h7rVJXUW092VmkHh9pBakNs3wpRCP9Gcls7HUPeO',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVJPMEhCdFBraW1Rc0VlYktLemFpeXE3a2ZLZXI5VDhST1dab3NMWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90aWNrZXRpbmctYXBwLnRlc3QiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fX0=',1769410371),
	('ZPqSRFs2a768q8aIXfTKS8TlV1X3lar0iB8mFObS',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXNYazV0MHJqYVdxRGN3QW5ucVUyZE9VVUw2VHprT0lRd1JrUVVIQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly90aWNrZXRpbmctYXBwLnRlc3QvP2hlcmQ9cHJldmlldyI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769405739);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tikets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tikets`;

CREATE TABLE `tikets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint unsigned NOT NULL,
  `tipe` enum('reguler','premium') COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tikets_event_id_foreign` (`event_id`),
  CONSTRAINT `tikets_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tikets` WRITE;
/*!40000 ALTER TABLE `tikets` DISABLE KEYS */;

INSERT INTO `tikets` (`id`, `event_id`, `tipe`, `harga`, `stok`, `created_at`, `updated_at`)
VALUES
	(1,1,'premium',1500000.00,97,'2026-01-17 04:44:51','2026-01-17 15:55:05'),
	(2,1,'reguler',500000.00,500,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(3,2,'premium',200000.00,299,'2026-01-17 04:44:51','2026-01-17 07:30:56'),
	(4,3,'premium',300000.00,198,'2026-01-17 04:44:51','2026-01-17 13:27:11'),
	(6,6,'reguler',500000.00,2,'2026-01-17 15:58:17','2026-01-17 15:58:17'),
	(7,7,'reguler',100000.00,10,'2026-01-26 06:33:36','2026-01-26 06:33:36');

/*!40000 ALTER TABLE `tikets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `no_hp`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin User','admin@gmail.com',NULL,'admin',NULL,'$2y$12$itRIcMDERHvJIcpJrKTjQumhnhibtp7qoQVV3krHeBi10Y4btrFwq',NULL,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(2,'Regular User','user@gmail.com','081234567890','user',NULL,'$2y$12$H1Io9juxTXnJZa5JUx093uQwCbgVDRVIGpvI585psTFXMNA8Z32DG',NULL,'2026-01-17 04:44:51','2026-01-17 04:44:51'),
	(3,'sakho','sakho@email.com',NULL,'user',NULL,'$2y$12$iWh/1wPocITS8GGdrY24oO7C0cTd2Ux6Y9UDzkYf0w5P6vDhpQab.',NULL,'2026-01-17 06:22:32','2026-01-17 06:22:32'),
	(4,'fahmi','fahmi@email.com',NULL,'user',NULL,'$2y$12$jkXwcZwkDvnDVgGYDCACFuoa0VzuEahRuVMcaett8WQAcX790MEEC',NULL,'2026-01-17 06:26:43','2026-01-17 06:26:43'),
	(5,'dani','dani@email.com',NULL,'user',NULL,'$2y$12$JT/gQpBVpSE2E8nWKa8WYu0O7py0dFpVyUJqoJw5DVXDN4t34nQKq',NULL,'2026-01-17 06:33:36','2026-01-17 06:33:36'),
	(6,'samid','samid@email.com',NULL,'user',NULL,'$2y$12$BulfyGrfHTRdCg2jWPojSueizFQ7xvQ8Mr4GG3dgtTwixLZDBwn2m',NULL,'2026-01-17 07:41:10','2026-01-17 07:41:10'),
	(7,'gagah','gagah@email.com',NULL,'user',NULL,'$2y$12$p7EIfdI.9WXSVD/NZo7qOue6RAdsetbHVXojLqACUbHcLCC3nz7nC',NULL,'2026-01-17 07:46:38','2026-01-17 07:46:38'),
	(8,'rifqi','rifqi@email.com',NULL,'user',NULL,'$2y$12$/9hAPk1gHAVNEafxcjn7bu5MCdkSCO2e8wn8VU4C0.KPUmVID1F7C',NULL,'2026-01-17 13:23:57','2026-01-17 13:23:57'),
	(9,'hilmi','hilmi@email.com',NULL,'user',NULL,'$2y$12$rpfC5L.GMGynGOF/ITaj0.DmGoVuo7GHgDKrdM/6ItADhOg7l0bee',NULL,'2026-01-17 15:33:02','2026-01-17 15:33:02'),
	(10,'aziz','aziz@email.com',NULL,'user',NULL,'$2y$12$Nz4CfurbYbxDe6SXAfc2VeBWgM1RqnEnQeqs990fvU3orzk58XVMK',NULL,'2026-01-17 15:53:24','2026-01-17 15:53:24');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
