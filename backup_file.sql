-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: point_of_sale
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advance_salaries`
--

DROP TABLE IF EXISTS `advance_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `advance_salary` decimal(15,2) NOT NULL,
  `is_deducted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advance_salaries_employee_id_foreign` (`employee_id`),
  KEY `advance_salaries_date_index` (`date`),
  KEY `advance_salaries_is_deducted_index` (`is_deducted`),
  CONSTRAINT `advance_salaries_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salaries`
--

LOCK TABLES `advance_salaries` WRITE;
/*!40000 ALTER TABLE `advance_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_employee_id_foreign` (`employee_id`),
  KEY `attendances_date_index` (`date`),
  CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Smartphones','smartphones',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Jane Doe','jane.doe@example.com','1234567890','123 Main St, New York, NY, USA',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14'),(2,'John Smith','john.smith@example.com','0987654321','456 Elm St, Los Angeles, CA, USA',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14'),(3,'Emily Johnson','emily.j@example.com','1122334455','789 Oak Ave, Chicago, IL, USA',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14'),(4,'Walk-in Customer','walkin@store.com','0000000000','Store Location',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(15,2) DEFAULT NULL,
  `vacation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  UNIQUE KEY `employees_phone_unique` (`phone`),
  KEY `employees_name_index` (`name`),
  KEY `employees_city_index` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Michael Brown','michael.b@store.com','1231231234','100 Broadway, New York, NY','2 Years',NULL,5000.00,'12','New York','2026-02-21 06:21:14','2026-02-21 06:21:14'),(2,'Sarah Wilson','sarah.w@store.com','3213214321','200 High St, Columbus, OH','1 Year',NULL,4500.00,'12','Columbus','2026-02-21 06:21:14','2026-02-21 06:21:14'),(3,'David Lee','david.l@store.com','5556667777','300 Market St, Philadelphia, PA','3 Years',NULL,6000.00,'14','Philadelphia','2026-02-21 06:21:14','2026-02-21 06:21:14');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'2026-03-08','Office supplies',45.50,'2026-03-08 09:19:44','2026-03-08 09:19:44'),(2,'2026-03-07','Taxi fare',12.75,'2026-03-08 09:19:45','2026-03-08 09:19:45'),(3,'2026-03-06','Lunch with client',60.00,'2026-03-08 09:19:45','2026-03-08 09:19:45'),(4,'2026-03-01','Monthly subscription',9.99,'2026-03-08 09:19:45','2026-03-08 09:19:45'),(5,'2026-02-06','Hardware repair',120.00,'2026-03-08 09:19:45','2026-03-08 09:19:45'),(7,'2026-03-08','KE Bill',500.00,'2026-03-08 09:36:35','2026-03-08 09:36:35');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_03_24_080143_create_employees_table',1),(6,'2023_03_29_025458_create_customers_table',1),(7,'2023_03_30_020042_create_suppliers_table',1),(8,'2023_03_30_083652_create_advance_salaries_table',1),(9,'2023_04_01_142106_create_pay_salaries_table',1),(10,'2023_04_02_141037_create_attendances_table',1),(11,'2023_04_04_041700_create_categories_table',1),(12,'2023_04_04_052256_create_products_table',1),(13,'2023_04_10_043156_create_orders_table',1),(14,'2023_04_10_044212_create_order_details_table',1),(15,'2023_04_13_222344_create_permission_tables',1),(16,'2026_01_19_220150_add_job_description_and_location_to_users_table',1),(17,'2026_02_28_000000_create_purchases_table',2),(18,'2026_02_28_000001_create_purchase_details_table',2),(19,'2026_02_28_000002_add_payment_details_to_orders_and_purchases_table',3),(20,'2026_03_07_121001_create_payments_table',4),(21,'2026_03_07_122104_add_reference_code_to_payments_table',5),(22,'2026_03_08_000001_create_expenses_table',6),(23,'2026_03_08_082326_add_soft_deletes_to_payments_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(3,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_product_id_foreign` (`product_id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_products` int NOT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `vat` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_invoice_no_unique` (`invoice_no`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_order_date_index` (`order_date`),
  KEY `orders_order_status_index` (`order_status`),
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_salaries`
--

DROP TABLE IF EXISTS `pay_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `advance_salary` decimal(15,2) DEFAULT NULL,
  `due_salary` decimal(15,2) NOT NULL,
  `salary_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pay_salaries_employee_id_foreign` (`employee_id`),
  KEY `pay_salaries_date_index` (`date`),
  CONSTRAINT `pay_salaries_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_salaries`
--

LOCK TABLES `pay_salaries` WRITE;
/*!40000 ALTER TABLE `pay_salaries` DISABLE KEYS */;
INSERT INTO `pay_salaries` VALUES (1,3,'2026-03-08',6000.00,0.00,6000.00,'01-2026','2026-03-08 07:04:19','2026-03-08 07:04:19');
/*!40000 ALTER TABLE `pay_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `supplier_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_customer_id_foreign` (`customer_id`),
  KEY `payments_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'pos.menu','web','pos','2026-02-21 06:21:13','2026-02-21 06:21:13'),(2,'employee.menu','web','employee','2026-02-21 06:21:13','2026-02-21 06:21:13'),(3,'customer.menu','web','customer','2026-02-21 06:21:13','2026-02-21 06:21:13'),(4,'supplier.menu','web','supplier','2026-02-21 06:21:13','2026-02-21 06:21:13'),(5,'salary.menu','web','salary','2026-02-21 06:21:13','2026-02-21 06:21:13'),(6,'attendance.menu','web','attendance','2026-02-21 06:21:13','2026-02-21 06:21:13'),(7,'category.menu','web','category','2026-02-21 06:21:13','2026-02-21 06:21:13'),(8,'product.menu','web','product','2026-02-21 06:21:14','2026-02-21 06:21:14'),(9,'orders.menu','web','orders','2026-02-21 06:21:14','2026-02-21 06:21:14'),(10,'stock.menu','web','stock','2026-02-21 06:21:14','2026-02-21 06:21:14'),(11,'roles.menu','web','roles','2026-02-21 06:21:14','2026-02-21 06:21:14'),(12,'user.menu','web','user','2026-02-21 06:21:14','2026-02-21 06:21:14'),(13,'database.menu','web','database','2026-02-21 06:21:14','2026-02-21 06:21:14'),(14,'expense.menu','web','pos','2026-03-08 09:23:54','2026-03-08 09:24:23');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `buying_price` int DEFAULT NULL,
  `selling_price` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_code_unique` (`code`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 11 Black 64GB','iphone-11-black-64gb','PRD-000001',1,0,400,500,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:14','2026-03-08 07:14:17'),(2,'iPhone 11 Black 128GB','iphone-11-black-128gb','PRD-000002',1,0,400,500,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:14','2026-03-08 08:12:13'),(3,'iPhone 11 Black 256GB','iphone-11-black-256gb','PRD-000003',1,0,480,600,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(4,'iPhone 11 Green 64GB','iphone-11-green-64gb','PRD-000004',1,0,400,500,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(5,'iPhone 11 Green 128GB','iphone-11-green-128gb','PRD-000005',1,0,400,500,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(6,'iPhone 11 Green 256GB','iphone-11-green-256gb','PRD-000006',1,0,480,600,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(7,'iPhone 11 Yellow 64GB','iphone-11-yellow-64gb','PRD-000007',1,0,400,500,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(8,'iPhone 11 Yellow 128GB','iphone-11-yellow-128gb','PRD-000008',1,0,400,500,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(9,'iPhone 11 Yellow 256GB','iphone-11-yellow-256gb','PRD-000009',1,0,480,600,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(10,'iPhone 11 Purple 64GB','iphone-11-purple-64gb','PRD-000010',1,0,400,500,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(11,'iPhone 11 Purple 128GB','iphone-11-purple-128gb','PRD-000011',1,0,400,500,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(12,'iPhone 11 Purple 256GB','iphone-11-purple-256gb','PRD-000012',1,0,480,600,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(13,'iPhone 11 Red 64GB','iphone-11-red-64gb','PRD-000013',1,0,400,500,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(14,'iPhone 11 Red 128GB','iphone-11-red-128gb','PRD-000014',1,0,400,500,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(15,'iPhone 11 Red 256GB','iphone-11-red-256gb','PRD-000015',1,0,480,600,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:14','2026-02-21 06:21:14'),(16,'iPhone 11 White 64GB','iphone-11-white-64gb','PRD-000016',1,0,400,500,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(17,'iPhone 11 White 128GB','iphone-11-white-128gb','PRD-000017',1,0,400,500,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(18,'iPhone 11 White 256GB','iphone-11-white-256gb','PRD-000018',1,0,480,600,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(19,'iPhone 11 Pro Gold 64GB','iphone-11-pro-gold-64gb','PRD-000019',1,0,560,700,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(20,'iPhone 11 Pro Gold 256GB','iphone-11-pro-gold-256gb','PRD-000020',1,0,640,800,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(21,'iPhone 11 Pro Gold 512GB','iphone-11-pro-gold-512gb','PRD-000021',1,0,720,900,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(22,'iPhone 11 Pro Space Gray 64GB','iphone-11-pro-space-gray-64gb','PRD-000022',1,0,560,700,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(23,'iPhone 11 Pro Space Gray 256GB','iphone-11-pro-space-gray-256gb','PRD-000023',1,0,640,800,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(24,'iPhone 11 Pro Space Gray 512GB','iphone-11-pro-space-gray-512gb','PRD-000024',1,0,720,900,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(25,'iPhone 11 Pro Silver 64GB','iphone-11-pro-silver-64gb','PRD-000025',1,0,560,700,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(26,'iPhone 11 Pro Silver 256GB','iphone-11-pro-silver-256gb','PRD-000026',1,0,640,800,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(27,'iPhone 11 Pro Silver 512GB','iphone-11-pro-silver-512gb','PRD-000027',1,0,720,900,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(28,'iPhone 11 Pro Midnight Green 64GB','iphone-11-pro-midnight-green-64gb','PRD-000028',1,0,560,700,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(29,'iPhone 11 Pro Midnight Green 256GB','iphone-11-pro-midnight-green-256gb','PRD-000029',1,0,640,800,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(30,'iPhone 11 Pro Midnight Green 512GB','iphone-11-pro-midnight-green-512gb','PRD-000030',1,0,720,900,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(31,'iPhone 11 Pro Max Gold 64GB','iphone-11-pro-max-gold-64gb','PRD-000031',1,0,640,800,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(32,'iPhone 11 Pro Max Gold 256GB','iphone-11-pro-max-gold-256gb','PRD-000032',1,0,720,900,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(33,'iPhone 11 Pro Max Gold 512GB','iphone-11-pro-max-gold-512gb','PRD-000033',1,0,800,1000,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(34,'iPhone 11 Pro Max Space Gray 64GB','iphone-11-pro-max-space-gray-64gb','PRD-000034',1,0,640,800,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(35,'iPhone 11 Pro Max Space Gray 256GB','iphone-11-pro-max-space-gray-256gb','PRD-000035',1,0,720,900,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(36,'iPhone 11 Pro Max Space Gray 512GB','iphone-11-pro-max-space-gray-512gb','PRD-000036',1,0,800,1000,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(37,'iPhone 11 Pro Max Silver 64GB','iphone-11-pro-max-silver-64gb','PRD-000037',1,0,640,800,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(38,'iPhone 11 Pro Max Silver 256GB','iphone-11-pro-max-silver-256gb','PRD-000038',1,0,720,900,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(39,'iPhone 11 Pro Max Silver 512GB','iphone-11-pro-max-silver-512gb','PRD-000039',1,0,800,1000,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(40,'iPhone 11 Pro Max Midnight Green 64GB','iphone-11-pro-max-midnight-green-64gb','PRD-000040',1,0,640,800,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(41,'iPhone 11 Pro Max Midnight Green 256GB','iphone-11-pro-max-midnight-green-256gb','PRD-000041',1,0,720,900,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(42,'iPhone 11 Pro Max Midnight Green 512GB','iphone-11-pro-max-midnight-green-512gb','PRD-000042',1,0,800,1000,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(43,'iPhone 12 Black 64GB','iphone-12-black-64gb','PRD-000043',1,0,480,600,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(44,'iPhone 12 Black 128GB','iphone-12-black-128gb','PRD-000044',1,0,480,600,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(45,'iPhone 12 Black 256GB','iphone-12-black-256gb','PRD-000045',1,0,560,700,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(46,'iPhone 12 White 64GB','iphone-12-white-64gb','PRD-000046',1,0,480,600,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(47,'iPhone 12 White 128GB','iphone-12-white-128gb','PRD-000047',1,0,480,600,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(48,'iPhone 12 White 256GB','iphone-12-white-256gb','PRD-000048',1,0,560,700,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(49,'iPhone 12 Red 64GB','iphone-12-red-64gb','PRD-000049',1,0,480,600,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(50,'iPhone 12 Red 128GB','iphone-12-red-128gb','PRD-000050',1,0,480,600,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(51,'iPhone 12 Red 256GB','iphone-12-red-256gb','PRD-000051',1,0,560,700,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(52,'iPhone 12 Green 64GB','iphone-12-green-64gb','PRD-000052',1,0,480,600,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(53,'iPhone 12 Green 128GB','iphone-12-green-128gb','PRD-000053',1,0,480,600,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(54,'iPhone 12 Green 256GB','iphone-12-green-256gb','PRD-000054',1,0,560,700,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(55,'iPhone 12 Blue 64GB','iphone-12-blue-64gb','PRD-000055',1,0,480,600,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(56,'iPhone 12 Blue 128GB','iphone-12-blue-128gb','PRD-000056',1,0,480,600,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(57,'iPhone 12 Blue 256GB','iphone-12-blue-256gb','PRD-000057',1,0,560,700,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(58,'iPhone 12 Purple 64GB','iphone-12-purple-64gb','PRD-000058',1,0,480,600,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(59,'iPhone 12 Purple 128GB','iphone-12-purple-128gb','PRD-000059',1,0,480,600,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(60,'iPhone 12 Purple 256GB','iphone-12-purple-256gb','PRD-000060',1,0,560,700,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(61,'iPhone 12 Mini Black 64GB','iphone-12-mini-black-64gb','PRD-000061',1,0,440,550,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(62,'iPhone 12 Mini Black 128GB','iphone-12-mini-black-128gb','PRD-000062',1,0,440,550,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(63,'iPhone 12 Mini Black 256GB','iphone-12-mini-black-256gb','PRD-000063',1,0,520,650,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(64,'iPhone 12 Mini White 64GB','iphone-12-mini-white-64gb','PRD-000064',1,0,440,550,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(65,'iPhone 12 Mini White 128GB','iphone-12-mini-white-128gb','PRD-000065',1,0,440,550,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(66,'iPhone 12 Mini White 256GB','iphone-12-mini-white-256gb','PRD-000066',1,0,520,650,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(67,'iPhone 12 Mini Red 64GB','iphone-12-mini-red-64gb','PRD-000067',1,0,440,550,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(68,'iPhone 12 Mini Red 128GB','iphone-12-mini-red-128gb','PRD-000068',1,0,440,550,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(69,'iPhone 12 Mini Red 256GB','iphone-12-mini-red-256gb','PRD-000069',1,0,520,650,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(70,'iPhone 12 Mini Green 64GB','iphone-12-mini-green-64gb','PRD-000070',1,0,440,550,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(71,'iPhone 12 Mini Green 128GB','iphone-12-mini-green-128gb','PRD-000071',1,0,440,550,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(72,'iPhone 12 Mini Green 256GB','iphone-12-mini-green-256gb','PRD-000072',1,0,520,650,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(73,'iPhone 12 Mini Blue 64GB','iphone-12-mini-blue-64gb','PRD-000073',1,0,440,550,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(74,'iPhone 12 Mini Blue 128GB','iphone-12-mini-blue-128gb','PRD-000074',1,0,440,550,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(75,'iPhone 12 Mini Blue 256GB','iphone-12-mini-blue-256gb','PRD-000075',1,0,520,650,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(76,'iPhone 12 Mini Purple 64GB','iphone-12-mini-purple-64gb','PRD-000076',1,0,440,550,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(77,'iPhone 12 Mini Purple 128GB','iphone-12-mini-purple-128gb','PRD-000077',1,0,440,550,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(78,'iPhone 12 Mini Purple 256GB','iphone-12-mini-purple-256gb','PRD-000078',1,0,520,650,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(79,'iPhone 12 Pro Silver 128GB','iphone-12-pro-silver-128gb','PRD-000079',1,0,640,800,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(80,'iPhone 12 Pro Silver 256GB','iphone-12-pro-silver-256gb','PRD-000080',1,0,720,900,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(81,'iPhone 12 Pro Silver 512GB','iphone-12-pro-silver-512gb','PRD-000081',1,0,800,1000,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(82,'iPhone 12 Pro Graphite 128GB','iphone-12-pro-graphite-128gb','PRD-000082',1,0,640,800,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(83,'iPhone 12 Pro Graphite 256GB','iphone-12-pro-graphite-256gb','PRD-000083',1,0,720,900,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:15','2026-02-21 06:21:15'),(84,'iPhone 12 Pro Graphite 512GB','iphone-12-pro-graphite-512gb','PRD-000084',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(85,'iPhone 12 Pro Gold 128GB','iphone-12-pro-gold-128gb','PRD-000085',1,0,640,800,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(86,'iPhone 12 Pro Gold 256GB','iphone-12-pro-gold-256gb','PRD-000086',1,0,720,900,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(87,'iPhone 12 Pro Gold 512GB','iphone-12-pro-gold-512gb','PRD-000087',1,0,800,1000,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(88,'iPhone 12 Pro Pacific Blue 128GB','iphone-12-pro-pacific-blue-128gb','PRD-000088',1,0,640,800,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(89,'iPhone 12 Pro Pacific Blue 256GB','iphone-12-pro-pacific-blue-256gb','PRD-000089',1,0,720,900,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(90,'iPhone 12 Pro Pacific Blue 512GB','iphone-12-pro-pacific-blue-512gb','PRD-000090',1,0,800,1000,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(91,'iPhone 12 Pro Max Silver 128GB','iphone-12-pro-max-silver-128gb','PRD-000091',1,0,720,900,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(92,'iPhone 12 Pro Max Silver 256GB','iphone-12-pro-max-silver-256gb','PRD-000092',1,0,800,1000,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(93,'iPhone 12 Pro Max Silver 512GB','iphone-12-pro-max-silver-512gb','PRD-000093',1,0,880,1100,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(94,'iPhone 12 Pro Max Graphite 128GB','iphone-12-pro-max-graphite-128gb','PRD-000094',1,0,720,900,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(95,'iPhone 12 Pro Max Graphite 256GB','iphone-12-pro-max-graphite-256gb','PRD-000095',1,0,800,1000,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(96,'iPhone 12 Pro Max Graphite 512GB','iphone-12-pro-max-graphite-512gb','PRD-000096',1,0,880,1100,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(97,'iPhone 12 Pro Max Gold 128GB','iphone-12-pro-max-gold-128gb','PRD-000097',1,0,720,900,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(98,'iPhone 12 Pro Max Gold 256GB','iphone-12-pro-max-gold-256gb','PRD-000098',1,0,800,1000,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(99,'iPhone 12 Pro Max Gold 512GB','iphone-12-pro-max-gold-512gb','PRD-000099',1,0,880,1100,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(100,'iPhone 12 Pro Max Pacific Blue 128GB','iphone-12-pro-max-pacific-blue-128gb','PRD-000100',1,0,720,900,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(101,'iPhone 12 Pro Max Pacific Blue 256GB','iphone-12-pro-max-pacific-blue-256gb','PRD-000101',1,0,800,1000,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(102,'iPhone 12 Pro Max Pacific Blue 512GB','iphone-12-pro-max-pacific-blue-512gb','PRD-000102',1,0,880,1100,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(103,'iPhone 13 Starlight 128GB','iphone-13-starlight-128gb','PRD-000103',1,0,560,700,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(104,'iPhone 13 Starlight 256GB','iphone-13-starlight-256gb','PRD-000104',1,0,640,800,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(105,'iPhone 13 Starlight 512GB','iphone-13-starlight-512gb','PRD-000105',1,0,720,900,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(106,'iPhone 13 Midnight 128GB','iphone-13-midnight-128gb','PRD-000106',1,0,560,700,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(107,'iPhone 13 Midnight 256GB','iphone-13-midnight-256gb','PRD-000107',1,0,640,800,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(108,'iPhone 13 Midnight 512GB','iphone-13-midnight-512gb','PRD-000108',1,0,720,900,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(109,'iPhone 13 Blue 128GB','iphone-13-blue-128gb','PRD-000109',1,0,560,700,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(110,'iPhone 13 Blue 256GB','iphone-13-blue-256gb','PRD-000110',1,0,640,800,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(111,'iPhone 13 Blue 512GB','iphone-13-blue-512gb','PRD-000111',1,0,720,900,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(112,'iPhone 13 Pink 128GB','iphone-13-pink-128gb','PRD-000112',1,0,560,700,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(113,'iPhone 13 Pink 256GB','iphone-13-pink-256gb','PRD-000113',1,0,640,800,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(114,'iPhone 13 Pink 512GB','iphone-13-pink-512gb','PRD-000114',1,0,720,900,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(115,'iPhone 13 Red 128GB','iphone-13-red-128gb','PRD-000115',1,0,560,700,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(116,'iPhone 13 Red 256GB','iphone-13-red-256gb','PRD-000116',1,0,640,800,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(117,'iPhone 13 Red 512GB','iphone-13-red-512gb','PRD-000117',1,0,720,900,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(118,'iPhone 13 Green 128GB','iphone-13-green-128gb','PRD-000118',1,0,560,700,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(119,'iPhone 13 Green 256GB','iphone-13-green-256gb','PRD-000119',1,0,640,800,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(120,'iPhone 13 Green 512GB','iphone-13-green-512gb','PRD-000120',1,0,720,900,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(121,'iPhone 13 Mini Starlight 128GB','iphone-13-mini-starlight-128gb','PRD-000121',1,0,520,650,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(122,'iPhone 13 Mini Starlight 256GB','iphone-13-mini-starlight-256gb','PRD-000122',1,0,600,750,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(123,'iPhone 13 Mini Starlight 512GB','iphone-13-mini-starlight-512gb','PRD-000123',1,0,680,850,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(124,'iPhone 13 Mini Midnight 128GB','iphone-13-mini-midnight-128gb','PRD-000124',1,0,520,650,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(125,'iPhone 13 Mini Midnight 256GB','iphone-13-mini-midnight-256gb','PRD-000125',1,0,600,750,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(126,'iPhone 13 Mini Midnight 512GB','iphone-13-mini-midnight-512gb','PRD-000126',1,0,680,850,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(127,'iPhone 13 Mini Blue 128GB','iphone-13-mini-blue-128gb','PRD-000127',1,0,520,650,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(128,'iPhone 13 Mini Blue 256GB','iphone-13-mini-blue-256gb','PRD-000128',1,0,600,750,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(129,'iPhone 13 Mini Blue 512GB','iphone-13-mini-blue-512gb','PRD-000129',1,0,680,850,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(130,'iPhone 13 Mini Pink 128GB','iphone-13-mini-pink-128gb','PRD-000130',1,0,520,650,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(131,'iPhone 13 Mini Pink 256GB','iphone-13-mini-pink-256gb','PRD-000131',1,0,600,750,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(132,'iPhone 13 Mini Pink 512GB','iphone-13-mini-pink-512gb','PRD-000132',1,0,680,850,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(133,'iPhone 13 Mini Red 128GB','iphone-13-mini-red-128gb','PRD-000133',1,0,520,650,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(134,'iPhone 13 Mini Red 256GB','iphone-13-mini-red-256gb','PRD-000134',1,0,600,750,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(135,'iPhone 13 Mini Red 512GB','iphone-13-mini-red-512gb','PRD-000135',1,0,680,850,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(136,'iPhone 13 Mini Green 128GB','iphone-13-mini-green-128gb','PRD-000136',1,0,520,650,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(137,'iPhone 13 Mini Green 256GB','iphone-13-mini-green-256gb','PRD-000137',1,0,600,750,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(138,'iPhone 13 Mini Green 512GB','iphone-13-mini-green-512gb','PRD-000138',1,0,680,850,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(139,'iPhone 13 Pro Silver 128GB','iphone-13-pro-silver-128gb','PRD-000139',1,0,720,900,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(140,'iPhone 13 Pro Silver 256GB','iphone-13-pro-silver-256gb','PRD-000140',1,0,800,1000,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(141,'iPhone 13 Pro Silver 512GB','iphone-13-pro-silver-512gb','PRD-000141',1,0,880,1100,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(142,'iPhone 13 Pro Silver 1TB','iphone-13-pro-silver-1tb','PRD-000142',1,0,1040,1300,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(143,'iPhone 13 Pro Graphite 128GB','iphone-13-pro-graphite-128gb','PRD-000143',1,0,720,900,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(144,'iPhone 13 Pro Graphite 256GB','iphone-13-pro-graphite-256gb','PRD-000144',1,0,800,1000,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(145,'iPhone 13 Pro Graphite 512GB','iphone-13-pro-graphite-512gb','PRD-000145',1,0,880,1100,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(146,'iPhone 13 Pro Graphite 1TB','iphone-13-pro-graphite-1tb','PRD-000146',1,0,1040,1300,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(147,'iPhone 13 Pro Gold 128GB','iphone-13-pro-gold-128gb','PRD-000147',1,0,720,900,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(148,'iPhone 13 Pro Gold 256GB','iphone-13-pro-gold-256gb','PRD-000148',1,0,800,1000,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(149,'iPhone 13 Pro Gold 512GB','iphone-13-pro-gold-512gb','PRD-000149',1,0,880,1100,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(150,'iPhone 13 Pro Gold 1TB','iphone-13-pro-gold-1tb','PRD-000150',1,0,1040,1300,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(151,'iPhone 13 Pro Sierra Blue 128GB','iphone-13-pro-sierra-blue-128gb','PRD-000151',1,0,720,900,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(152,'iPhone 13 Pro Sierra Blue 256GB','iphone-13-pro-sierra-blue-256gb','PRD-000152',1,0,800,1000,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(153,'iPhone 13 Pro Sierra Blue 512GB','iphone-13-pro-sierra-blue-512gb','PRD-000153',1,0,880,1100,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(154,'iPhone 13 Pro Sierra Blue 1TB','iphone-13-pro-sierra-blue-1tb','PRD-000154',1,0,1040,1300,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(155,'iPhone 13 Pro Alpine Green 128GB','iphone-13-pro-alpine-green-128gb','PRD-000155',1,0,720,900,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:16','2026-02-21 06:21:16'),(156,'iPhone 13 Pro Alpine Green 256GB','iphone-13-pro-alpine-green-256gb','PRD-000156',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(157,'iPhone 13 Pro Alpine Green 512GB','iphone-13-pro-alpine-green-512gb','PRD-000157',1,0,880,1100,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(158,'iPhone 13 Pro Alpine Green 1TB','iphone-13-pro-alpine-green-1tb','PRD-000158',1,0,1040,1300,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(159,'iPhone 13 Pro Max Silver 128GB','iphone-13-pro-max-silver-128gb','PRD-000159',1,0,800,1000,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(160,'iPhone 13 Pro Max Silver 256GB','iphone-13-pro-max-silver-256gb','PRD-000160',1,0,880,1100,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(161,'iPhone 13 Pro Max Silver 512GB','iphone-13-pro-max-silver-512gb','PRD-000161',1,0,960,1200,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(162,'iPhone 13 Pro Max Silver 1TB','iphone-13-pro-max-silver-1tb','PRD-000162',1,0,1120,1400,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(163,'iPhone 13 Pro Max Graphite 128GB','iphone-13-pro-max-graphite-128gb','PRD-000163',1,0,800,1000,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(164,'iPhone 13 Pro Max Graphite 256GB','iphone-13-pro-max-graphite-256gb','PRD-000164',1,0,880,1100,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(165,'iPhone 13 Pro Max Graphite 512GB','iphone-13-pro-max-graphite-512gb','PRD-000165',1,0,960,1200,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(166,'iPhone 13 Pro Max Graphite 1TB','iphone-13-pro-max-graphite-1tb','PRD-000166',1,0,1120,1400,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(167,'iPhone 13 Pro Max Gold 128GB','iphone-13-pro-max-gold-128gb','PRD-000167',1,0,800,1000,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(168,'iPhone 13 Pro Max Gold 256GB','iphone-13-pro-max-gold-256gb','PRD-000168',1,0,880,1100,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(169,'iPhone 13 Pro Max Gold 512GB','iphone-13-pro-max-gold-512gb','PRD-000169',1,0,960,1200,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(170,'iPhone 13 Pro Max Gold 1TB','iphone-13-pro-max-gold-1tb','PRD-000170',1,0,1120,1400,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(171,'iPhone 13 Pro Max Sierra Blue 128GB','iphone-13-pro-max-sierra-blue-128gb','PRD-000171',1,0,800,1000,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(172,'iPhone 13 Pro Max Sierra Blue 256GB','iphone-13-pro-max-sierra-blue-256gb','PRD-000172',1,0,880,1100,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(173,'iPhone 13 Pro Max Sierra Blue 512GB','iphone-13-pro-max-sierra-blue-512gb','PRD-000173',1,0,960,1200,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(174,'iPhone 13 Pro Max Sierra Blue 1TB','iphone-13-pro-max-sierra-blue-1tb','PRD-000174',1,0,1120,1400,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(175,'iPhone 13 Pro Max Alpine Green 128GB','iphone-13-pro-max-alpine-green-128gb','PRD-000175',1,0,800,1000,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(176,'iPhone 13 Pro Max Alpine Green 256GB','iphone-13-pro-max-alpine-green-256gb','PRD-000176',1,0,880,1100,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(177,'iPhone 13 Pro Max Alpine Green 512GB','iphone-13-pro-max-alpine-green-512gb','PRD-000177',1,0,960,1200,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(178,'iPhone 13 Pro Max Alpine Green 1TB','iphone-13-pro-max-alpine-green-1tb','PRD-000178',1,0,1120,1400,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(179,'iPhone 14 Midnight 128GB','iphone-14-midnight-128gb','PRD-000179',1,0,640,800,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(180,'iPhone 14 Midnight 256GB','iphone-14-midnight-256gb','PRD-000180',1,0,720,900,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(181,'iPhone 14 Midnight 512GB','iphone-14-midnight-512gb','PRD-000181',1,0,800,1000,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(182,'iPhone 14 Purple 128GB','iphone-14-purple-128gb','PRD-000182',1,0,640,800,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(183,'iPhone 14 Purple 256GB','iphone-14-purple-256gb','PRD-000183',1,0,720,900,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(184,'iPhone 14 Purple 512GB','iphone-14-purple-512gb','PRD-000184',1,0,800,1000,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(185,'iPhone 14 Starlight 128GB','iphone-14-starlight-128gb','PRD-000185',1,0,640,800,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(186,'iPhone 14 Starlight 256GB','iphone-14-starlight-256gb','PRD-000186',1,0,720,900,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(187,'iPhone 14 Starlight 512GB','iphone-14-starlight-512gb','PRD-000187',1,0,800,1000,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(188,'iPhone 14 Blue 128GB','iphone-14-blue-128gb','PRD-000188',1,0,640,800,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(189,'iPhone 14 Blue 256GB','iphone-14-blue-256gb','PRD-000189',1,0,720,900,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(190,'iPhone 14 Blue 512GB','iphone-14-blue-512gb','PRD-000190',1,0,800,1000,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(191,'iPhone 14 Red 128GB','iphone-14-red-128gb','PRD-000191',1,0,640,800,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(192,'iPhone 14 Red 256GB','iphone-14-red-256gb','PRD-000192',1,0,720,900,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(193,'iPhone 14 Red 512GB','iphone-14-red-512gb','PRD-000193',1,0,800,1000,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(194,'iPhone 14 Yellow 128GB','iphone-14-yellow-128gb','PRD-000194',1,0,640,800,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(195,'iPhone 14 Yellow 256GB','iphone-14-yellow-256gb','PRD-000195',1,0,720,900,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(196,'iPhone 14 Yellow 512GB','iphone-14-yellow-512gb','PRD-000196',1,0,800,1000,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(197,'iPhone 14 Plus Midnight 128GB','iphone-14-plus-midnight-128gb','PRD-000197',1,0,720,900,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(198,'iPhone 14 Plus Midnight 256GB','iphone-14-plus-midnight-256gb','PRD-000198',1,0,800,1000,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(199,'iPhone 14 Plus Midnight 512GB','iphone-14-plus-midnight-512gb','PRD-000199',1,0,880,1100,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(200,'iPhone 14 Plus Purple 128GB','iphone-14-plus-purple-128gb','PRD-000200',1,0,720,900,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(201,'iPhone 14 Plus Purple 256GB','iphone-14-plus-purple-256gb','PRD-000201',1,0,800,1000,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(202,'iPhone 14 Plus Purple 512GB','iphone-14-plus-purple-512gb','PRD-000202',1,0,880,1100,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(203,'iPhone 14 Plus Starlight 128GB','iphone-14-plus-starlight-128gb','PRD-000203',1,0,720,900,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(204,'iPhone 14 Plus Starlight 256GB','iphone-14-plus-starlight-256gb','PRD-000204',1,0,800,1000,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(205,'iPhone 14 Plus Starlight 512GB','iphone-14-plus-starlight-512gb','PRD-000205',1,0,880,1100,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(206,'iPhone 14 Plus Blue 128GB','iphone-14-plus-blue-128gb','PRD-000206',1,0,720,900,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(207,'iPhone 14 Plus Blue 256GB','iphone-14-plus-blue-256gb','PRD-000207',1,0,800,1000,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(208,'iPhone 14 Plus Blue 512GB','iphone-14-plus-blue-512gb','PRD-000208',1,0,880,1100,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(209,'iPhone 14 Plus Red 128GB','iphone-14-plus-red-128gb','PRD-000209',1,0,720,900,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(210,'iPhone 14 Plus Red 256GB','iphone-14-plus-red-256gb','PRD-000210',1,0,800,1000,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(211,'iPhone 14 Plus Red 512GB','iphone-14-plus-red-512gb','PRD-000211',1,0,880,1100,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(212,'iPhone 14 Plus Yellow 128GB','iphone-14-plus-yellow-128gb','PRD-000212',1,0,720,900,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:17','2026-02-21 06:21:17'),(213,'iPhone 14 Plus Yellow 256GB','iphone-14-plus-yellow-256gb','PRD-000213',1,0,800,1000,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(214,'iPhone 14 Plus Yellow 512GB','iphone-14-plus-yellow-512gb','PRD-000214',1,0,880,1100,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(215,'iPhone 14 Pro Space Black 128GB','iphone-14-pro-space-black-128gb','PRD-000215',1,0,800,1000,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(216,'iPhone 14 Pro Space Black 256GB','iphone-14-pro-space-black-256gb','PRD-000216',1,0,880,1100,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(217,'iPhone 14 Pro Space Black 512GB','iphone-14-pro-space-black-512gb','PRD-000217',1,0,960,1200,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(218,'iPhone 14 Pro Space Black 1TB','iphone-14-pro-space-black-1tb','PRD-000218',1,0,1120,1400,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(219,'iPhone 14 Pro Silver 128GB','iphone-14-pro-silver-128gb','PRD-000219',1,0,800,1000,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(220,'iPhone 14 Pro Silver 256GB','iphone-14-pro-silver-256gb','PRD-000220',1,0,880,1100,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(221,'iPhone 14 Pro Silver 512GB','iphone-14-pro-silver-512gb','PRD-000221',1,0,960,1200,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(222,'iPhone 14 Pro Silver 1TB','iphone-14-pro-silver-1tb','PRD-000222',1,0,1120,1400,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(223,'iPhone 14 Pro Gold 128GB','iphone-14-pro-gold-128gb','PRD-000223',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(224,'iPhone 14 Pro Gold 256GB','iphone-14-pro-gold-256gb','PRD-000224',1,0,880,1100,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(225,'iPhone 14 Pro Gold 512GB','iphone-14-pro-gold-512gb','PRD-000225',1,0,960,1200,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(226,'iPhone 14 Pro Gold 1TB','iphone-14-pro-gold-1tb','PRD-000226',1,0,1120,1400,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(227,'iPhone 14 Pro Deep Purple 128GB','iphone-14-pro-deep-purple-128gb','PRD-000227',1,0,800,1000,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(228,'iPhone 14 Pro Deep Purple 256GB','iphone-14-pro-deep-purple-256gb','PRD-000228',1,0,880,1100,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(229,'iPhone 14 Pro Deep Purple 512GB','iphone-14-pro-deep-purple-512gb','PRD-000229',1,0,960,1200,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(230,'iPhone 14 Pro Deep Purple 1TB','iphone-14-pro-deep-purple-1tb','PRD-000230',1,0,1120,1400,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(231,'iPhone 14 Pro Max Space Black 128GB','iphone-14-pro-max-space-black-128gb','PRD-000231',1,0,880,1100,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(232,'iPhone 14 Pro Max Space Black 256GB','iphone-14-pro-max-space-black-256gb','PRD-000232',1,0,960,1200,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(233,'iPhone 14 Pro Max Space Black 512GB','iphone-14-pro-max-space-black-512gb','PRD-000233',1,0,1040,1300,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(234,'iPhone 14 Pro Max Space Black 1TB','iphone-14-pro-max-space-black-1tb','PRD-000234',1,0,1200,1500,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(235,'iPhone 14 Pro Max Silver 128GB','iphone-14-pro-max-silver-128gb','PRD-000235',1,0,880,1100,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(236,'iPhone 14 Pro Max Silver 256GB','iphone-14-pro-max-silver-256gb','PRD-000236',1,0,960,1200,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(237,'iPhone 14 Pro Max Silver 512GB','iphone-14-pro-max-silver-512gb','PRD-000237',1,0,1040,1300,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(238,'iPhone 14 Pro Max Silver 1TB','iphone-14-pro-max-silver-1tb','PRD-000238',1,0,1200,1500,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(239,'iPhone 14 Pro Max Gold 128GB','iphone-14-pro-max-gold-128gb','PRD-000239',1,0,880,1100,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(240,'iPhone 14 Pro Max Gold 256GB','iphone-14-pro-max-gold-256gb','PRD-000240',1,0,960,1200,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(241,'iPhone 14 Pro Max Gold 512GB','iphone-14-pro-max-gold-512gb','PRD-000241',1,0,1040,1300,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(242,'iPhone 14 Pro Max Gold 1TB','iphone-14-pro-max-gold-1tb','PRD-000242',1,0,1200,1500,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(243,'iPhone 14 Pro Max Deep Purple 128GB','iphone-14-pro-max-deep-purple-128gb','PRD-000243',1,0,880,1100,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(244,'iPhone 14 Pro Max Deep Purple 256GB','iphone-14-pro-max-deep-purple-256gb','PRD-000244',1,0,960,1200,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(245,'iPhone 14 Pro Max Deep Purple 512GB','iphone-14-pro-max-deep-purple-512gb','PRD-000245',1,0,1040,1300,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(246,'iPhone 14 Pro Max Deep Purple 1TB','iphone-14-pro-max-deep-purple-1tb','PRD-000246',1,0,1200,1500,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(247,'iPhone 15 Black 128GB','iphone-15-black-128gb','PRD-000247',1,0,720,900,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(248,'iPhone 15 Black 256GB','iphone-15-black-256gb','PRD-000248',1,0,800,1000,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(249,'iPhone 15 Black 512GB','iphone-15-black-512gb','PRD-000249',1,0,880,1100,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(250,'iPhone 15 Blue 128GB','iphone-15-blue-128gb','PRD-000250',1,0,720,900,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(251,'iPhone 15 Blue 256GB','iphone-15-blue-256gb','PRD-000251',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(252,'iPhone 15 Blue 512GB','iphone-15-blue-512gb','PRD-000252',1,0,880,1100,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(253,'iPhone 15 Green 128GB','iphone-15-green-128gb','PRD-000253',1,0,720,900,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(254,'iPhone 15 Green 256GB','iphone-15-green-256gb','PRD-000254',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(255,'iPhone 15 Green 512GB','iphone-15-green-512gb','PRD-000255',1,0,880,1100,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(256,'iPhone 15 Yellow 128GB','iphone-15-yellow-128gb','PRD-000256',1,0,720,900,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(257,'iPhone 15 Yellow 256GB','iphone-15-yellow-256gb','PRD-000257',1,0,800,1000,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(258,'iPhone 15 Yellow 512GB','iphone-15-yellow-512gb','PRD-000258',1,0,880,1100,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(259,'iPhone 15 Pink 128GB','iphone-15-pink-128gb','PRD-000259',1,0,720,900,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(260,'iPhone 15 Pink 256GB','iphone-15-pink-256gb','PRD-000260',1,0,800,1000,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(261,'iPhone 15 Pink 512GB','iphone-15-pink-512gb','PRD-000261',1,0,880,1100,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(262,'iPhone 15 Plus Black 128GB','iphone-15-plus-black-128gb','PRD-000262',1,0,800,1000,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(263,'iPhone 15 Plus Black 256GB','iphone-15-plus-black-256gb','PRD-000263',1,0,880,1100,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(264,'iPhone 15 Plus Black 512GB','iphone-15-plus-black-512gb','PRD-000264',1,0,960,1200,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(265,'iPhone 15 Plus Blue 128GB','iphone-15-plus-blue-128gb','PRD-000265',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(266,'iPhone 15 Plus Blue 256GB','iphone-15-plus-blue-256gb','PRD-000266',1,0,880,1100,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(267,'iPhone 15 Plus Blue 512GB','iphone-15-plus-blue-512gb','PRD-000267',1,0,960,1200,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(268,'iPhone 15 Plus Green 128GB','iphone-15-plus-green-128gb','PRD-000268',1,0,800,1000,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(269,'iPhone 15 Plus Green 256GB','iphone-15-plus-green-256gb','PRD-000269',1,0,880,1100,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(270,'iPhone 15 Plus Green 512GB','iphone-15-plus-green-512gb','PRD-000270',1,0,960,1200,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(271,'iPhone 15 Plus Yellow 128GB','iphone-15-plus-yellow-128gb','PRD-000271',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(272,'iPhone 15 Plus Yellow 256GB','iphone-15-plus-yellow-256gb','PRD-000272',1,0,880,1100,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:18','2026-02-21 06:21:18'),(273,'iPhone 15 Plus Yellow 512GB','iphone-15-plus-yellow-512gb','PRD-000273',1,0,960,1200,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(274,'iPhone 15 Plus Pink 128GB','iphone-15-plus-pink-128gb','PRD-000274',1,0,800,1000,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(275,'iPhone 15 Plus Pink 256GB','iphone-15-plus-pink-256gb','PRD-000275',1,0,880,1100,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(276,'iPhone 15 Plus Pink 512GB','iphone-15-plus-pink-512gb','PRD-000276',1,0,960,1200,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(277,'iPhone 15 Pro Black Titanium 128GB','iphone-15-pro-black-titanium-128gb','PRD-000277',1,0,880,1100,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(278,'iPhone 15 Pro Black Titanium 256GB','iphone-15-pro-black-titanium-256gb','PRD-000278',1,0,960,1200,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(279,'iPhone 15 Pro Black Titanium 512GB','iphone-15-pro-black-titanium-512gb','PRD-000279',1,0,1040,1300,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(280,'iPhone 15 Pro Black Titanium 1TB','iphone-15-pro-black-titanium-1tb','PRD-000280',1,0,1200,1500,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(281,'iPhone 15 Pro White Titanium 128GB','iphone-15-pro-white-titanium-128gb','PRD-000281',1,0,880,1100,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(282,'iPhone 15 Pro White Titanium 256GB','iphone-15-pro-white-titanium-256gb','PRD-000282',1,0,960,1200,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(283,'iPhone 15 Pro White Titanium 512GB','iphone-15-pro-white-titanium-512gb','PRD-000283',1,0,1040,1300,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(284,'iPhone 15 Pro White Titanium 1TB','iphone-15-pro-white-titanium-1tb','PRD-000284',1,0,1200,1500,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(285,'iPhone 15 Pro Blue Titanium 128GB','iphone-15-pro-blue-titanium-128gb','PRD-000285',1,0,880,1100,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(286,'iPhone 15 Pro Blue Titanium 256GB','iphone-15-pro-blue-titanium-256gb','PRD-000286',1,0,960,1200,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(287,'iPhone 15 Pro Blue Titanium 512GB','iphone-15-pro-blue-titanium-512gb','PRD-000287',1,0,1040,1300,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(288,'iPhone 15 Pro Blue Titanium 1TB','iphone-15-pro-blue-titanium-1tb','PRD-000288',1,0,1200,1500,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(289,'iPhone 15 Pro Natural Titanium 128GB','iphone-15-pro-natural-titanium-128gb','PRD-000289',1,0,880,1100,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(290,'iPhone 15 Pro Natural Titanium 256GB','iphone-15-pro-natural-titanium-256gb','PRD-000290',1,0,960,1200,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(291,'iPhone 15 Pro Natural Titanium 512GB','iphone-15-pro-natural-titanium-512gb','PRD-000291',1,0,1040,1300,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(292,'iPhone 15 Pro Natural Titanium 1TB','iphone-15-pro-natural-titanium-1tb','PRD-000292',1,0,1200,1500,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(293,'iPhone 15 Pro Max Black Titanium 256GB','iphone-15-pro-max-black-titanium-256gb','PRD-000293',1,0,1040,1300,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(294,'iPhone 15 Pro Max Black Titanium 512GB','iphone-15-pro-max-black-titanium-512gb','PRD-000294',1,0,1120,1400,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(295,'iPhone 15 Pro Max Black Titanium 1TB','iphone-15-pro-max-black-titanium-1tb','PRD-000295',1,0,1280,1600,NULL,'2026-02-17','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(296,'iPhone 15 Pro Max White Titanium 256GB','iphone-15-pro-max-white-titanium-256gb','PRD-000296',1,0,1040,1300,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(297,'iPhone 15 Pro Max White Titanium 512GB','iphone-15-pro-max-white-titanium-512gb','PRD-000297',1,0,1120,1400,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(298,'iPhone 15 Pro Max White Titanium 1TB','iphone-15-pro-max-white-titanium-1tb','PRD-000298',1,0,1280,1600,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(299,'iPhone 15 Pro Max Blue Titanium 256GB','iphone-15-pro-max-blue-titanium-256gb','PRD-000299',1,0,1040,1300,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(300,'iPhone 15 Pro Max Blue Titanium 512GB','iphone-15-pro-max-blue-titanium-512gb','PRD-000300',1,0,1120,1400,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(301,'iPhone 15 Pro Max Blue Titanium 1TB','iphone-15-pro-max-blue-titanium-1tb','PRD-000301',1,0,1280,1600,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(302,'iPhone 15 Pro Max Natural Titanium 256GB','iphone-15-pro-max-natural-titanium-256gb','PRD-000302',1,0,1040,1300,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(303,'iPhone 15 Pro Max Natural Titanium 512GB','iphone-15-pro-max-natural-titanium-512gb','PRD-000303',1,0,1120,1400,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(304,'iPhone 15 Pro Max Natural Titanium 1TB','iphone-15-pro-max-natural-titanium-1tb','PRD-000304',1,0,1280,1600,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(305,'iPhone 16 Black 128GB','iphone-16-black-128gb','PRD-000305',1,0,800,1000,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(306,'iPhone 16 Black 256GB','iphone-16-black-256gb','PRD-000306',1,0,880,1100,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(307,'iPhone 16 Black 512GB','iphone-16-black-512gb','PRD-000307',1,0,960,1200,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(308,'iPhone 16 White 128GB','iphone-16-white-128gb','PRD-000308',1,0,800,1000,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(309,'iPhone 16 White 256GB','iphone-16-white-256gb','PRD-000309',1,0,880,1100,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(310,'iPhone 16 White 512GB','iphone-16-white-512gb','PRD-000310',1,0,960,1200,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(311,'iPhone 16 Pink 128GB','iphone-16-pink-128gb','PRD-000311',1,0,800,1000,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(312,'iPhone 16 Pink 256GB','iphone-16-pink-256gb','PRD-000312',1,0,880,1100,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(313,'iPhone 16 Pink 512GB','iphone-16-pink-512gb','PRD-000313',1,0,960,1200,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(314,'iPhone 16 Teal 128GB','iphone-16-teal-128gb','PRD-000314',1,0,800,1000,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(315,'iPhone 16 Teal 256GB','iphone-16-teal-256gb','PRD-000315',1,0,880,1100,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(316,'iPhone 16 Teal 512GB','iphone-16-teal-512gb','PRD-000316',1,0,960,1200,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(317,'iPhone 16 Ultramarine 128GB','iphone-16-ultramarine-128gb','PRD-000317',1,0,800,1000,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(318,'iPhone 16 Ultramarine 256GB','iphone-16-ultramarine-256gb','PRD-000318',1,0,880,1100,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(319,'iPhone 16 Ultramarine 512GB','iphone-16-ultramarine-512gb','PRD-000319',1,0,960,1200,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(320,'iPhone 16 Plus Black 128GB','iphone-16-plus-black-128gb','PRD-000320',1,0,880,1100,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(321,'iPhone 16 Plus Black 256GB','iphone-16-plus-black-256gb','PRD-000321',1,0,960,1200,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(322,'iPhone 16 Plus Black 512GB','iphone-16-plus-black-512gb','PRD-000322',1,0,1040,1300,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(323,'iPhone 16 Plus White 128GB','iphone-16-plus-white-128gb','PRD-000323',1,0,880,1100,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(324,'iPhone 16 Plus White 256GB','iphone-16-plus-white-256gb','PRD-000324',1,0,960,1200,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(325,'iPhone 16 Plus White 512GB','iphone-16-plus-white-512gb','PRD-000325',1,0,1040,1300,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(326,'iPhone 16 Plus Pink 128GB','iphone-16-plus-pink-128gb','PRD-000326',1,0,880,1100,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(327,'iPhone 16 Plus Pink 256GB','iphone-16-plus-pink-256gb','PRD-000327',1,0,960,1200,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(328,'iPhone 16 Plus Pink 512GB','iphone-16-plus-pink-512gb','PRD-000328',1,0,1040,1300,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(329,'iPhone 16 Plus Teal 128GB','iphone-16-plus-teal-128gb','PRD-000329',1,0,880,1100,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(330,'iPhone 16 Plus Teal 256GB','iphone-16-plus-teal-256gb','PRD-000330',1,0,960,1200,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(331,'iPhone 16 Plus Teal 512GB','iphone-16-plus-teal-512gb','PRD-000331',1,0,1040,1300,NULL,'2026-02-11','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(332,'iPhone 16 Plus Ultramarine 128GB','iphone-16-plus-ultramarine-128gb','PRD-000332',1,0,880,1100,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:19','2026-02-21 06:21:19'),(333,'iPhone 16 Plus Ultramarine 256GB','iphone-16-plus-ultramarine-256gb','PRD-000333',1,0,960,1200,NULL,'2026-01-22','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(334,'iPhone 16 Plus Ultramarine 512GB','iphone-16-plus-ultramarine-512gb','PRD-000334',1,0,1040,1300,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(335,'iPhone 16e Black 128GB','iphone-16e-black-128gb','PRD-000335',1,0,760,950,NULL,'2026-01-30','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(336,'iPhone 16e White 128GB','iphone-16e-white-128gb','PRD-000336',1,0,760,950,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(337,'iPhone 16 Pro Black Titanium 128GB','iphone-16-pro-black-titanium-128gb','PRD-000337',1,0,960,1200,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(338,'iPhone 16 Pro Black Titanium 256GB','iphone-16-pro-black-titanium-256gb','PRD-000338',1,0,1040,1300,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(339,'iPhone 16 Pro Black Titanium 512GB','iphone-16-pro-black-titanium-512gb','PRD-000339',1,0,1120,1400,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(340,'iPhone 16 Pro Black Titanium 1TB','iphone-16-pro-black-titanium-1tb','PRD-000340',1,0,1280,1600,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(341,'iPhone 16 Pro White Titanium 128GB','iphone-16-pro-white-titanium-128gb','PRD-000341',1,0,960,1200,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(342,'iPhone 16 Pro White Titanium 256GB','iphone-16-pro-white-titanium-256gb','PRD-000342',1,0,1040,1300,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(343,'iPhone 16 Pro White Titanium 512GB','iphone-16-pro-white-titanium-512gb','PRD-000343',1,0,1120,1400,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(344,'iPhone 16 Pro White Titanium 1TB','iphone-16-pro-white-titanium-1tb','PRD-000344',1,0,1280,1600,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(345,'iPhone 16 Pro Natural Titanium 128GB','iphone-16-pro-natural-titanium-128gb','PRD-000345',1,0,960,1200,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(346,'iPhone 16 Pro Natural Titanium 256GB','iphone-16-pro-natural-titanium-256gb','PRD-000346',1,0,1040,1300,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(347,'iPhone 16 Pro Natural Titanium 512GB','iphone-16-pro-natural-titanium-512gb','PRD-000347',1,0,1120,1400,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(348,'iPhone 16 Pro Natural Titanium 1TB','iphone-16-pro-natural-titanium-1tb','PRD-000348',1,0,1280,1600,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(349,'iPhone 16 Pro Desert Titanium 128GB','iphone-16-pro-desert-titanium-128gb','PRD-000349',1,0,960,1200,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(350,'iPhone 16 Pro Desert Titanium 256GB','iphone-16-pro-desert-titanium-256gb','PRD-000350',1,0,1040,1300,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(351,'iPhone 16 Pro Desert Titanium 512GB','iphone-16-pro-desert-titanium-512gb','PRD-000351',1,0,1120,1400,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(352,'iPhone 16 Pro Desert Titanium 1TB','iphone-16-pro-desert-titanium-1tb','PRD-000352',1,0,1280,1600,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(353,'iPhone 16 Pro Max Black Titanium 256GB','iphone-16-pro-max-black-titanium-256gb','PRD-000353',1,0,1120,1400,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(354,'iPhone 16 Pro Max Black Titanium 512GB','iphone-16-pro-max-black-titanium-512gb','PRD-000354',1,0,1200,1500,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(355,'iPhone 16 Pro Max Black Titanium 1TB','iphone-16-pro-max-black-titanium-1tb','PRD-000355',1,0,1360,1700,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(356,'iPhone 16 Pro Max White Titanium 256GB','iphone-16-pro-max-white-titanium-256gb','PRD-000356',1,0,1120,1400,NULL,'2026-02-09','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(357,'iPhone 16 Pro Max White Titanium 512GB','iphone-16-pro-max-white-titanium-512gb','PRD-000357',1,0,1200,1500,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(358,'iPhone 16 Pro Max White Titanium 1TB','iphone-16-pro-max-white-titanium-1tb','PRD-000358',1,0,1360,1700,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(359,'iPhone 16 Pro Max Natural Titanium 256GB','iphone-16-pro-max-natural-titanium-256gb','PRD-000359',1,0,1120,1400,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(360,'iPhone 16 Pro Max Natural Titanium 512GB','iphone-16-pro-max-natural-titanium-512gb','PRD-000360',1,0,1200,1500,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(361,'iPhone 16 Pro Max Natural Titanium 1TB','iphone-16-pro-max-natural-titanium-1tb','PRD-000361',1,0,1360,1700,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(362,'iPhone 16 Pro Max Desert Titanium 256GB','iphone-16-pro-max-desert-titanium-256gb','PRD-000362',1,0,1120,1400,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(363,'iPhone 16 Pro Max Desert Titanium 512GB','iphone-16-pro-max-desert-titanium-512gb','PRD-000363',1,0,1200,1500,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(364,'iPhone 16 Pro Max Desert Titanium 1TB','iphone-16-pro-max-desert-titanium-1tb','PRD-000364',1,0,1360,1700,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(365,'iPhone 17 Black 256GB','iphone-17-black-256gb','PRD-000365',1,0,960,1200,NULL,'2026-02-08','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(366,'iPhone 17 Black 512GB','iphone-17-black-512gb','PRD-000366',1,0,1040,1300,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(367,'iPhone 17 White 256GB','iphone-17-white-256gb','PRD-000367',1,0,960,1200,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(368,'iPhone 17 White 512GB','iphone-17-white-512gb','PRD-000368',1,0,1040,1300,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(369,'iPhone 17 Mist Blue 256GB','iphone-17-mist-blue-256gb','PRD-000369',1,0,960,1200,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(370,'iPhone 17 Mist Blue 512GB','iphone-17-mist-blue-512gb','PRD-000370',1,0,1040,1300,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(371,'iPhone 17 Sage 256GB','iphone-17-sage-256gb','PRD-000371',1,0,960,1200,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(372,'iPhone 17 Sage 512GB','iphone-17-sage-512gb','PRD-000372',1,0,1040,1300,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(373,'iPhone 17 Lavender 256GB','iphone-17-lavender-256gb','PRD-000373',1,0,960,1200,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(374,'iPhone 17 Lavender 512GB','iphone-17-lavender-512gb','PRD-000374',1,0,1040,1300,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(375,'iPhone Air Sky Blue 256GB','iphone-air-sky-blue-256gb','PRD-000375',1,0,1040,1300,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(376,'iPhone Air Sky Blue 512GB','iphone-air-sky-blue-512gb','PRD-000376',1,0,1120,1400,NULL,'2026-01-24','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(377,'iPhone Air Sky Blue 1TB','iphone-air-sky-blue-1tb','PRD-000377',1,0,1280,1600,NULL,'2026-02-20','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(378,'iPhone Air Light Gold 256GB','iphone-air-light-gold-256gb','PRD-000378',1,0,1040,1300,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(379,'iPhone Air Light Gold 512GB','iphone-air-light-gold-512gb','PRD-000379',1,0,1120,1400,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(380,'iPhone Air Light Gold 1TB','iphone-air-light-gold-1tb','PRD-000380',1,0,1280,1600,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(381,'iPhone Air Cloud White 256GB','iphone-air-cloud-white-256gb','PRD-000381',1,0,1040,1300,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(382,'iPhone Air Cloud White 512GB','iphone-air-cloud-white-512gb','PRD-000382',1,0,1120,1400,NULL,'2026-01-26','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(383,'iPhone Air Cloud White 1TB','iphone-air-cloud-white-1tb','PRD-000383',1,0,1280,1600,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(384,'iPhone Air Space Black 256GB','iphone-air-space-black-256gb','PRD-000384',1,0,1040,1300,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(385,'iPhone Air Space Black 512GB','iphone-air-space-black-512gb','PRD-000385',1,0,1120,1400,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(386,'iPhone Air Space Black 1TB','iphone-air-space-black-1tb','PRD-000386',1,0,1280,1600,NULL,'2026-01-23','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(387,'iPhone 17 Pro Cosmic Orange 256GB','iphone-17-pro-cosmic-orange-256gb','PRD-000387',1,0,1120,1400,NULL,'2026-02-02','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(388,'iPhone 17 Pro Cosmic Orange 512GB','iphone-17-pro-cosmic-orange-512gb','PRD-000388',1,0,1200,1500,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(389,'iPhone 17 Pro Cosmic Orange 1TB','iphone-17-pro-cosmic-orange-1tb','PRD-000389',1,0,1360,1700,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(390,'iPhone 17 Pro Cosmic Orange 2TB','iphone-17-pro-cosmic-orange-2tb','PRD-000390',1,0,1520,1900,NULL,'2026-02-03','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(391,'iPhone 17 Pro Deep Blue 256GB','iphone-17-pro-deep-blue-256gb','PRD-000391',1,0,1120,1400,NULL,'2026-02-19','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(392,'iPhone 17 Pro Deep Blue 512GB','iphone-17-pro-deep-blue-512gb','PRD-000392',1,0,1200,1500,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(393,'iPhone 17 Pro Deep Blue 1TB','iphone-17-pro-deep-blue-1tb','PRD-000393',1,0,1360,1700,NULL,'2026-02-13','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(394,'iPhone 17 Pro Deep Blue 2TB','iphone-17-pro-deep-blue-2tb','PRD-000394',1,0,1520,1900,NULL,'2026-02-07','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(395,'iPhone 17 Pro Silver 256GB','iphone-17-pro-silver-256gb','PRD-000395',1,0,1120,1400,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(396,'iPhone 17 Pro Silver 512GB','iphone-17-pro-silver-512gb','PRD-000396',1,0,1200,1500,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(397,'iPhone 17 Pro Silver 1TB','iphone-17-pro-silver-1tb','PRD-000397',1,0,1360,1700,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(398,'iPhone 17 Pro Silver 2TB','iphone-17-pro-silver-2tb','PRD-000398',1,0,1520,1900,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(399,'iPhone 17 Pro Space Black 256GB','iphone-17-pro-space-black-256gb','PRD-000399',1,0,1120,1400,NULL,'2026-02-14','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(400,'iPhone 17 Pro Space Black 512GB','iphone-17-pro-space-black-512gb','PRD-000400',1,0,1200,1500,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(401,'iPhone 17 Pro Space Black 1TB','iphone-17-pro-space-black-1tb','PRD-000401',1,0,1360,1700,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(402,'iPhone 17 Pro Space Black 2TB','iphone-17-pro-space-black-2tb','PRD-000402',1,0,1520,1900,NULL,'2026-02-12','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(403,'iPhone 17 Pro Max Cosmic Orange 256GB','iphone-17-pro-max-cosmic-orange-256gb','PRD-000403',1,0,1200,1500,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:20','2026-02-21 06:21:20'),(404,'iPhone 17 Pro Max Cosmic Orange 512GB','iphone-17-pro-max-cosmic-orange-512gb','PRD-000404',1,0,1280,1600,NULL,'2026-01-25','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(405,'iPhone 17 Pro Max Cosmic Orange 1TB','iphone-17-pro-max-cosmic-orange-1tb','PRD-000405',1,0,1440,1800,NULL,'2026-02-06','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(406,'iPhone 17 Pro Max Cosmic Orange 2TB','iphone-17-pro-max-cosmic-orange-2tb','PRD-000406',1,0,1600,2000,NULL,'2026-02-15','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(407,'iPhone 17 Pro Max Deep Blue 256GB','iphone-17-pro-max-deep-blue-256gb','PRD-000407',1,0,1200,1500,NULL,'2026-02-16','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(408,'iPhone 17 Pro Max Deep Blue 512GB','iphone-17-pro-max-deep-blue-512gb','PRD-000408',1,0,1280,1600,NULL,'2026-02-01','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(409,'iPhone 17 Pro Max Deep Blue 1TB','iphone-17-pro-max-deep-blue-1tb','PRD-000409',1,0,1440,1800,NULL,'2026-01-31','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(410,'iPhone 17 Pro Max Deep Blue 2TB','iphone-17-pro-max-deep-blue-2tb','PRD-000410',1,0,1600,2000,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(411,'iPhone 17 Pro Max Silver 256GB','iphone-17-pro-max-silver-256gb','PRD-000411',1,0,1200,1500,NULL,'2026-01-29','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(412,'iPhone 17 Pro Max Silver 512GB','iphone-17-pro-max-silver-512gb','PRD-000412',1,0,1280,1600,NULL,'2026-02-10','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(413,'iPhone 17 Pro Max Silver 1TB','iphone-17-pro-max-silver-1tb','PRD-000413',1,0,1440,1800,NULL,'2026-02-18','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(414,'iPhone 17 Pro Max Silver 2TB','iphone-17-pro-max-silver-2tb','PRD-000414',1,0,1600,2000,NULL,'2026-02-05','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(415,'iPhone 17 Pro Max Space Black 256GB','iphone-17-pro-max-space-black-256gb','PRD-000415',1,0,1200,1500,NULL,'2026-01-28','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(416,'iPhone 17 Pro Max Space Black 512GB','iphone-17-pro-max-space-black-512gb','PRD-000416',1,0,1280,1600,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(417,'iPhone 17 Pro Max Space Black 1TB','iphone-17-pro-max-space-black-1tb','PRD-000417',1,0,1440,1800,NULL,'2026-02-04','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21'),(418,'iPhone 17 Pro Max Space Black 2TB','iphone-17-pro-max-space-black-2tb','PRD-000418',1,0,1600,2000,NULL,'2026-01-27','2027-02-21','2026-02-21 06:21:21','2026-02-21 06:21:21');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_cost` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_details_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint unsigned NOT NULL,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` datetime NOT NULL,
  `purchase_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_products` int NOT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `vat` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_purchase_no_unique` (`purchase_no`),
  KEY `purchases_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(3,2),(4,2),(6,2),(12,2),(3,3),(4,3),(12,3),(2,4),(5,4),(6,4),(8,4),(9,4),(10,4);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SuperAdmin','web','2026-02-21 06:21:14','2026-02-21 06:21:14'),(2,'Admin','web','2026-02-21 06:21:14','2026-02-21 06:21:14'),(3,'Account','web','2026-02-21 06:21:14','2026-02-21 06:21:14'),(4,'Manager','web','2026-02-21 06:21:14','2026-02-21 06:21:14');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_email_unique` (`email`),
  UNIQUE KEY `suppliers_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Future Tech Inc.','contact@futuretech.com','123-456-7890','123 Tech Avenue, Silicon Valley, CA, USA',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14'),(2,'Global Supplies LLC','sales@globalsupplies.com','987-654-3210','456 Market Street, San Francisco, CA, USA',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14'),(3,'Gadget World Ltd.','support@gadgetworld.com','555-123-4567','789 Innovation Drive, Austin, TX, USA',NULL,'2026-02-21 06:21:14','2026-02-21 06:21:14');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin',NULL,NULL,NULL,'admin@gmail.com','2026-02-21 06:21:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','E8d5lnBdRu9Xvq9kUk1KBw1SL16hs0t45m0qGwT1b4S0qCzoGOuqDDKLcDkq','2026-02-21 06:21:14','2026-02-21 06:21:14'),(2,'User','user',NULL,NULL,NULL,'user@gmail.com','2026-02-21 06:21:14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TdR0pNjBzL','2026-02-21 06:21:14','2026-02-21 06:21:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-08 23:53:38
