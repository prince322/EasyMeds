-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.48 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for waterpurifier_db
CREATE DATABASE IF NOT EXISTS `waterpurifier_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `waterpurifier_db`;

-- Dumping structure for table waterpurifier_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_permission: ~36 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add role details', 7, 'add_roledetails'),
	(20, 'Can change role details', 7, 'change_roledetails'),
	(21, 'Can delete role details', 7, 'delete_roledetails'),
	(22, 'Can add descriptions', 8, 'add_descriptions'),
	(23, 'Can change descriptions', 8, 'change_descriptions'),
	(24, 'Can delete descriptions', 8, 'delete_descriptions'),
	(25, 'Can add modals', 9, 'add_modals'),
	(26, 'Can change modals', 9, 'change_modals'),
	(27, 'Can delete modals', 9, 'delete_modals'),
	(28, 'Can add purifier brands', 10, 'add_purifierbrands'),
	(29, 'Can change purifier brands', 10, 'change_purifierbrands'),
	(30, 'Can delete purifier brands', 10, 'delete_purifierbrands'),
	(31, 'Can add features', 11, 'add_features'),
	(32, 'Can change features', 11, 'change_features'),
	(33, 'Can delete features', 11, 'delete_features'),
	(34, 'Can add service charges', 12, 'add_servicecharges'),
	(35, 'Can change service charges', 12, 'change_servicecharges'),
	(36, 'Can delete service charges', 12, 'delete_servicecharges');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_descriptions
CREATE TABLE IF NOT EXISTS `backend_panel_descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) DEFAULT NULL,
  `modal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_descri_modal_id_25e97cf5_fk_backend_p` (`modal_id`),
  CONSTRAINT `backend_panel_descri_modal_id_25e97cf5_fk_backend_p` FOREIGN KEY (`modal_id`) REFERENCES `backend_panel_modals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_descriptions: ~1 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_descriptions` DISABLE KEYS */;
INSERT INTO `backend_panel_descriptions` (`id`, `description`, `modal_id`) VALUES
	(8, 'very high quality', 4);
/*!40000 ALTER TABLE `backend_panel_descriptions` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_features
CREATE TABLE IF NOT EXISTS `backend_panel_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `features` varchar(225) DEFAULT NULL,
  `modal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_featur_modal_id_642e230e_fk_backend_p` (`modal_id`),
  CONSTRAINT `backend_panel_featur_modal_id_642e230e_fk_backend_p` FOREIGN KEY (`modal_id`) REFERENCES `backend_panel_modals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_features: ~0 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_panel_features` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_modals
CREATE TABLE IF NOT EXISTS `backend_panel_modals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `backend_panel_modals_brand_id_73c124fd_fk_backend_p` (`brand_id`),
  CONSTRAINT `backend_panel_modals_brand_id_73c124fd_fk_backend_p` FOREIGN KEY (`brand_id`) REFERENCES `backend_panel_purifierbrands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_modals: ~1 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_modals` DISABLE KEYS */;
INSERT INTO `backend_panel_modals` (`id`, `name`, `image`, `price`, `brand_id`) VALUES
	(4, 'aquaguard model ', 'website-page-16.png', 'Rs. 15000', 2);
/*!40000 ALTER TABLE `backend_panel_modals` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_purifierbrands
CREATE TABLE IF NOT EXISTS `backend_panel_purifierbrands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brands` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands` (`brands`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_purifierbrands: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_purifierbrands` DISABLE KEYS */;
INSERT INTO `backend_panel_purifierbrands` (`id`, `brands`) VALUES
	(2, 'Dr.aquaguard'),
	(3, 'Livepure');
/*!40000 ALTER TABLE `backend_panel_purifierbrands` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_servicecharges
CREATE TABLE IF NOT EXISTS `backend_panel_servicecharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service` (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_servicecharges: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_servicecharges` DISABLE KEYS */;
INSERT INTO `backend_panel_servicecharges` (`id`, `service`, `price`) VALUES
	(3, 'Simpe service', 'Rs. 250'),
	(4, 'service with piping', 'Rs. 250');
/*!40000 ALTER TABLE `backend_panel_servicecharges` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_content_type: ~12 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(8, 'backend_panel', 'descriptions'),
	(11, 'backend_panel', 'features'),
	(9, 'backend_panel', 'modals'),
	(10, 'backend_panel', 'purifierbrands'),
	(12, 'backend_panel', 'servicecharges'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'front_panel', 'roledetails'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_migrations: ~17 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-07-21 13:11:35'),
	(2, 'auth', '0001_initial', '2019-07-21 13:11:39'),
	(3, 'admin', '0001_initial', '2019-07-21 13:11:40'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-07-21 13:11:40'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2019-07-21 13:11:40'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2019-07-21 13:11:41'),
	(7, 'auth', '0003_alter_user_email_max_length', '2019-07-21 13:11:41'),
	(8, 'auth', '0004_alter_user_username_opts', '2019-07-21 13:11:41'),
	(9, 'auth', '0005_alter_user_last_login_null', '2019-07-21 13:11:41'),
	(10, 'auth', '0006_require_contenttypes_0002', '2019-07-21 13:11:41'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2019-07-21 13:11:41'),
	(12, 'auth', '0008_alter_user_username_max_length', '2019-07-21 13:11:42'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2019-07-21 13:11:42'),
	(14, 'front_panel', '0001_initial', '2019-07-21 13:11:42'),
	(15, 'sessions', '0001_initial', '2019-07-21 13:11:43'),
	(16, 'backend_panel', '0001_initial', '2019-07-23 11:02:13'),
	(17, 'backend_panel', '0002_servicecharges', '2019-07-24 17:16:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_session: ~3 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('gj2kl9u85141vzm31mvdncd8ythxtax8', 'MWM5NDA2OWNhZGQ2NjMzYjIyY2Y1M2RhMDM0MWRjYTQ4ZTQ3MjljZjp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJwcmluY2UifQ==', '2019-08-08 04:57:35'),
	('hoveq9ctzhxhvk2vnh968nqntgvtxnhv', 'MWM5NDA2OWNhZGQ2NjMzYjIyY2Y1M2RhMDM0MWRjYTQ4ZTQ3MjljZjp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJwcmluY2UifQ==', '2019-08-07 18:40:10'),
	('ihfiz7giyznen7odal3wwce8hrzpjyx4', 'MWM5NDA2OWNhZGQ2NjMzYjIyY2Y1M2RhMDM0MWRjYTQ4ZTQ3MjljZjp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJwcmluY2UifQ==', '2019-08-07 18:31:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.front_panel_roledetails
CREATE TABLE IF NOT EXISTS `front_panel_roledetails` (
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `mobile` varchar(225) NOT NULL,
  `image` varchar(225) DEFAULT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `otp` varchar(225) DEFAULT NULL,
  `active` varchar(225) NOT NULL,
  `verify_link` varchar(225) DEFAULT NULL,
  `auth_token` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.front_panel_roledetails: ~1 rows (approximately)
/*!40000 ALTER TABLE `front_panel_roledetails` DISABLE KEYS */;
INSERT INTO `front_panel_roledetails` (`name`, `email`, `password`, `mobile`, `image`, `gender`, `address`, `otp`, `active`, `verify_link`, `auth_token`) VALUES
	('Rajani Kant Mukherjee', 'pg7298441495@gmail.com', 'pbkdf2_sha256$100000$TUDAdVSeqavh$hyPVaxd2NxcUOSqHOBGQywauqAf72g2SgSgjBue8sKI=', '9888074267', NULL, '', 'chandigarh', '', '1', '', '');
/*!40000 ALTER TABLE `front_panel_roledetails` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
