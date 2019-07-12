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


-- Dumping database structure for easymeds_db
CREATE DATABASE IF NOT EXISTS `easymeds_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `easymeds_db`;

-- Dumping structure for table easymeds_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.auth_group_permissions
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

-- Dumping data for table easymeds_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.auth_permission: ~42 rows (approximately)
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
	(19, 'Can add user role', 7, 'add_userrole'),
	(20, 'Can change user role', 7, 'change_userrole'),
	(21, 'Can delete user role', 7, 'delete_userrole'),
	(22, 'Can add role details', 8, 'add_roledetails'),
	(23, 'Can change role details', 8, 'change_roledetails'),
	(24, 'Can delete role details', 8, 'delete_roledetails'),
	(25, 'Can add login details', 9, 'add_logindetails'),
	(26, 'Can change login details', 9, 'change_logindetails'),
	(27, 'Can delete login details', 9, 'delete_logindetails'),
	(28, 'Can add diseases', 10, 'add_diseases'),
	(29, 'Can change diseases', 10, 'change_diseases'),
	(30, 'Can delete diseases', 10, 'delete_diseases'),
	(31, 'Can add relation', 11, 'add_relation'),
	(32, 'Can change relation', 11, 'change_relation'),
	(33, 'Can delete relation', 11, 'delete_relation'),
	(34, 'Can add medicine details', 12, 'add_medicinedetails'),
	(35, 'Can change medicine details', 12, 'change_medicinedetails'),
	(36, 'Can delete medicine details', 12, 'delete_medicinedetails'),
	(37, 'Can add symptoms', 13, 'add_symptoms'),
	(38, 'Can change symptoms', 13, 'change_symptoms'),
	(39, 'Can delete symptoms', 13, 'delete_symptoms'),
	(40, 'Can add medicines category', 14, 'add_medicinescategory'),
	(41, 'Can change medicines category', 14, 'change_medicinescategory'),
	(42, 'Can delete medicines category', 14, 'delete_medicinescategory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.auth_user
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.auth_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$u13Ttt26syzP$DLoc5sGHutAoxeEeQX2Tm+1kBOCWWtQg9rZ36gDXcfQ=', '2019-06-26 17:48:56', 1, 'hp_pc', '', '', '', 1, 1, '2019-06-26 17:47:25'),
	(2, 'pbkdf2_sha256$100000$iBcHNfcP7GMP$hzlfjmUX5eokTLExNeeH6ROYCgKdY6VftduaN/35xCI=', '2019-07-02 09:28:53', 1, 'Atm', '', '', '', 1, 1, '2019-07-02 09:17:33');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.auth_user_groups
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

-- Dumping data for table easymeds_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.auth_user_user_permissions
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

-- Dumping data for table easymeds_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_diseases
CREATE TABLE IF NOT EXISTS `backend_panel_diseases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_name` varchar(225) NOT NULL,
  `precaution` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_diseases: ~0 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_panel_diseases` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_medicinedetails
CREATE TABLE IF NOT EXISTS `backend_panel_medicinedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_name` varchar(225) NOT NULL,
  `image` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_medici_cat_id_01e84755_fk_backend_p` (`cat_id`),
  CONSTRAINT `backend_panel_medici_cat_id_01e84755_fk_backend_p` FOREIGN KEY (`cat_id`) REFERENCES `backend_panel_medicinescategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_medicinedetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_medicinedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_panel_medicinedetails` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_medicinescategory
CREATE TABLE IF NOT EXISTS `backend_panel_medicinescategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_medicinescategory: ~0 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_medicinescategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_panel_medicinescategory` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_relation
CREATE TABLE IF NOT EXISTS `backend_panel_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_relati_dis_id_a2fd8079_fk_backend_p` (`dis_id`),
  KEY `backend_panel_relati_med_id_363092cd_fk_backend_p` (`med_id`),
  CONSTRAINT `backend_panel_relati_dis_id_a2fd8079_fk_backend_p` FOREIGN KEY (`dis_id`) REFERENCES `backend_panel_diseases` (`id`),
  CONSTRAINT `backend_panel_relati_med_id_363092cd_fk_backend_p` FOREIGN KEY (`med_id`) REFERENCES `backend_panel_medicinedetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_relation: ~0 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_panel_relation` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_symptoms
CREATE TABLE IF NOT EXISTS `backend_panel_symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoms` varchar(225) DEFAULT NULL,
  `dis_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_sympto_dis_id_68522e1d_fk_backend_p` (`dis_id`),
  CONSTRAINT `backend_panel_sympto_dis_id_68522e1d_fk_backend_p` FOREIGN KEY (`dis_id`) REFERENCES `backend_panel_diseases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_symptoms: ~0 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_symptoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_panel_symptoms` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.django_admin_log
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.django_admin_log: ~4 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-06-26 17:49:30', '1', 'user', 1, '[{"added": {}}]', 7, 1),
	(2, '2019-07-02 09:09:06', '2', 'admin', 1, '[{"added": {}}]', 7, 1),
	(3, '2019-07-02 09:29:23', '3', 'admin', 1, '[{"added": {}}]', 7, 2),
	(4, '2019-07-02 09:29:53', '4', 'user', 1, '[{"added": {}}]', 7, 2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.django_content_type: ~14 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(10, 'backend_panel', 'diseases'),
	(12, 'backend_panel', 'medicinedetails'),
	(14, 'backend_panel', 'medicinescategory'),
	(11, 'backend_panel', 'relation'),
	(13, 'backend_panel', 'symptoms'),
	(5, 'contenttypes', 'contenttype'),
	(9, 'first_panel', 'logindetails'),
	(8, 'first_panel', 'roledetails'),
	(7, 'first_panel', 'userrole'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.django_migrations: ~19 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-06-25 20:19:37'),
	(2, 'auth', '0001_initial', '2019-06-25 20:19:39'),
	(3, 'admin', '0001_initial', '2019-06-25 20:19:40'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-06-25 20:19:40'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2019-06-25 20:19:40'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2019-06-25 20:19:41'),
	(7, 'auth', '0003_alter_user_email_max_length', '2019-06-25 20:19:41'),
	(8, 'auth', '0004_alter_user_username_opts', '2019-06-25 20:19:41'),
	(9, 'auth', '0005_alter_user_last_login_null', '2019-06-25 20:19:41'),
	(10, 'auth', '0006_require_contenttypes_0002', '2019-06-25 20:19:41'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2019-06-25 20:19:41'),
	(12, 'auth', '0008_alter_user_username_max_length', '2019-06-25 20:19:42'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2019-06-25 20:19:42'),
	(14, 'first_panel', '0001_initial', '2019-06-25 20:19:42'),
	(15, 'sessions', '0001_initial', '2019-06-25 20:19:42'),
	(16, 'first_panel', '0002_roledetails', '2019-06-26 17:17:26'),
	(17, 'first_panel', '0003_logindetails', '2019-07-05 09:46:58'),
	(18, 'first_panel', '0004_auto_20190709_1447', '2019-07-09 09:18:06'),
	(19, 'backend_panel', '0001_initial', '2019-07-10 18:06:44');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.django_session: ~2 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('1w53n1z4w9ivfo3jtey2sj90sp6rrmea', 'NTQ1NTE5MGI3MTI0YTI1YWUzYTk4MjlkYTdmZDZkYjgzZDcxNTJjZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYzY5YTY3ZDgzMDc4Y2Q0NTkwZThjNTk5NTY5MGE2ZTEzMGNlMDk5IiwiZW1haWwiOiJya3VuYWw5ODBAZ21haWwuY29tIiwibmFtZSI6ImRlbW8iLCJyb2xlIjoxfQ==', '2019-07-24 10:08:35'),
	('z2jqc1v5otnxk4djvl82a1rkvnujri4o', 'NjNlYTljNzc4YmU5YzAyOGIyYjlkYmZiOWY1NTY0NTE4NDY3YWVhOTp7ImVtYWlsIjoicmt1bmFsOTgwQGdtYWlsLmNvbSJ9', '2019-07-15 10:07:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.first_panel_logindetails
CREATE TABLE IF NOT EXISTS `first_panel_logindetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(225) DEFAULT NULL,
  `log_in` varchar(225) DEFAULT NULL,
  `log_out` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.first_panel_logindetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `first_panel_logindetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_panel_logindetails` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.first_panel_roledetails
CREATE TABLE IF NOT EXISTS `first_panel_roledetails` (
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `mobile` varchar(225) NOT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `otp` varchar(225) DEFAULT NULL,
  `otp_time` varchar(225) DEFAULT NULL,
  `last_login` varchar(225) DEFAULT NULL,
  `active` varchar(225) NOT NULL,
  `verify_link` varchar(225) DEFAULT NULL,
  `auth_token` varchar(225) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `first_panel_roledeta_role_id_f53da955_fk_first_pan` (`role_id`),
  CONSTRAINT `first_panel_roledeta_role_id_f53da955_fk_first_pan` FOREIGN KEY (`role_id`) REFERENCES `first_panel_userrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.first_panel_roledetails: ~1 rows (approximately)
/*!40000 ALTER TABLE `first_panel_roledetails` DISABLE KEYS */;
INSERT INTO `first_panel_roledetails` (`name`, `email`, `password`, `mobile`, `gender`, `address`, `otp`, `otp_time`, `last_login`, `active`, `verify_link`, `auth_token`, `role_id`) VALUES
	('kunal', 'rkunal980@gmail.com', 'pbkdf2_sha256$100000$IN0pPxThsSq0$0v7jd1nAq/njNBhWUx0pMu3YUBR/0jrRcY0ux6RbdIM=', '', 'Male', '', '', '', '', '1', '', '', 1);
/*!40000 ALTER TABLE `first_panel_roledetails` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.first_panel_userrole
CREATE TABLE IF NOT EXISTS `first_panel_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.first_panel_userrole: ~2 rows (approximately)
/*!40000 ALTER TABLE `first_panel_userrole` DISABLE KEYS */;
INSERT INTO `first_panel_userrole` (`id`, `role`) VALUES
	(1, 'admin'),
	(4, 'user');
/*!40000 ALTER TABLE `first_panel_userrole` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
