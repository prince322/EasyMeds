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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.auth_permission: ~45 rows (approximately)
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
	(42, 'Can delete medicines category', 14, 'delete_medicinescategory'),
	(43, 'Can add precautions', 15, 'add_precautions'),
	(44, 'Can change precautions', 15, 'change_precautions'),
	(45, 'Can delete precautions', 15, 'delete_precautions');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_diseases: ~15 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_diseases` DISABLE KEYS */;
INSERT INTO `backend_panel_diseases` (`id`, `dis_name`) VALUES
	(5, 'Acne'),
	(6, 'Alcoholic Addiction'),
	(7, 'Allergies'),
	(8, 'Alzehmeir'),
	(9, 'Amoeabiasis'),
	(10, 'Anaemia '),
	(11, 'Anaesthesia'),
	(12, 'Anxiety'),
	(13, 'Appetite'),
	(14, 'Arthritis'),
	(15, 'Asthma/Copd'),
	(16, 'cancer'),
	(17, 'Constipation'),
	(18, 'Cough and Cold'),
	(19, 'Diabetes');
/*!40000 ALTER TABLE `backend_panel_diseases` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_medicinedetails
CREATE TABLE IF NOT EXISTS `backend_panel_medicinedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_name` varchar(225) NOT NULL,
  `image` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_medici_cat_id_01e84755_fk_backend_p` (`cat_id`),
  CONSTRAINT `backend_panel_medici_cat_id_01e84755_fk_backend_p` FOREIGN KEY (`cat_id`) REFERENCES `backend_panel_medicinescategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_medicinedetails: ~45 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_medicinedetails` DISABLE KEYS */;
INSERT INTO `backend_panel_medicinedetails` (`id`, `med_name`, `image`, `price`, `description`, `cat_id`) VALUES
	(5, 'Persol AC 2.5% Gel 30gm(Benzoyl Peroxide)', 'acne-allo.jpg', 'Rs. 110', 'This medicine is for external use only. Use it in the dose and duration as advised by your doctor. Check the label for directions before use. Clean and dry the affected area and apply the gel. Wash your hands after applying, unless hands are the affected area.', 13),
	(7, 'Roots & Herbs Ayurvedic Natural Treatment 100% Vegan No Paraben Mulethi ', 'acne_ayur.jpg', 'Rs. 1,450', 'This mulethi acne clarifying face ubtan and activator kit is a powerful blend which helps in exfoliating & stimulating the underlying tissues by its revitalizing, refreshing anti-bacterial & antiseptic properties', 14),
	(8, 'SBL Kali Bromatum Dilution 30 CH', 'acne_homo_ZdfsvZX.jpg', 'Rs. 80', 'Key Ingredients: Bromide of potassium Lactose', 15),
	(9, 'Alcoliv 500mg Tablet 10\'S', 'alchol_allo.jpg', 'Rs. 159', 'Alcoliv Tablet is a liver-protective agent used in the treatment of alcohol intoxication and fatty liver', 13),
	(10, 'ABHYARISTH', 'alchol_ayur.jpg', 'Rs. 78', 'Cures piles and fistula.  Improves digestion', 14),
	(11, 'Dr. Reckeweg Quer Gland Spi Mother Tincture Q', 'alchol_homo_Hdy7sec.PNG', 'Rs. 253', '15 drops of Quercus Glandium Spiritus mother tincture in half a cup of normal water twice a day until symptoms disappear for 3 months or as prescribed by physician. Can be taken with allopathic medicines', 15),
	(12, '1 AL 5mg Tablet 10\'S', 'allergy_alllo.jpg', 'Rs. 26', 'It is used to treat symptoms associated with allergic conditions, such as: Hay fever Year-round allergies such as dust or pet allergies Chronic nettle rash', 13),
	(13, 'GILOY GHAN VATI', 'allergy_ayueved.png', 'Rs. 100', 'Giloy(Tinospora cordifolia)', 14),
	(14, 'Dr. Reckeweg R84 (Inhallergol) (30ml)', 'allergy_homo_ySxqqT5.jpg', 'Rs. 270', '5 to 10 drops of Dr. Reckeweg R84 3 times daily is normally recommended, but some cases of extreme reactivity will react to this concentration In these cases the drops should be put into a glass of water and then the patient should drink some of the water', 15),
	(15, 'Galamer 4mg Tablet 10\'S', 'alzhmier_allo.jpg', 'Rs. 168', 'Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it. Galamer 4 Tablet is to be taken with food.', 13),
	(16, 'Divya Medha Vati Extra Power - 92 g (120 Tablets)', 'alzhier_homo.jpg', 'Rs. 185', 'useful in insomnia, depression, a brain tonic and memory enhancer', 14),
	(17, 'Braino life', 'real alzhmier homo_1f0xl7j.jpg', 'Rs. 70', 'Braino Life Syrup is a Safe & Effective Mental Tonic, Weakness of Memory, Forgetfulness, Lack of Concentration, Depressed and Nervous Mental State.', 15),
	(18, 'Gramogyl Plus Tablet 10\'S', 'amobeases_allo.PNG', 'Rs. 65', 'Tinidazole (600mg) + Norfloxacin (400mg) + Lactobacillus (120Millionspores)', 13),
	(19, 'Baidyanath Amoebica Tablet (25tab)', 'ayur_amobeasis.jpg', 'Rs. 120', '2 Amoebica Tablets twice a day with water', 14),
	(20, 'Dr. Reckeweg Nux Vomica Dilution 30 CH', 'homo_amobeasesis_LXTwpP4.jpg', 'Rs. 112', 'Take 10-15 drops of Dilution in half cup water thrice a day or as directed by the physician', 15),
	(21, 'chery syrup', 'allo-anaemia.jpg', 'rs.150.00 ', 'Cheri syrup can be taken orally with water, after meals', 13),
	(22, 'Dr Willmar Schwabe Germany Biofungin Syrup', 'homo-anaemia.jpg', 'rs.847', 'One tablespoonful half an hour before meals, 3 times a day or as prescribed by the physician', 15),
	(23, 'LOHASAVA (L)', 'ayur_anaemaia.png', 'rs.85.00', 'Patanjali Lohasava is an Ayurvedic medicine for Anemia. It contains naturally processed Iron. Lohasava contains 4 – 10 % of self generated alcohol in it which acts as a media to deliver water and alcohol soluble the active herbal components to the body.', 14),
	(24, 'Mucaine anesthetic antacid gel', 'allo-anaesthesia.jpg', 'rs.107', 'Justifying our position in the national market, we are engrossed in providing a finest class Mucaine Gel to the prestigious clients at very inexpensive price.', 13),
	(25, 'Dr. Reckeweg R70  ', 'homo-anaesthesia.jpg', 'rs.235', 'In severe pain: 10 drops in some water every ¼ to ½ hour. To prevent relapses administer R70 over a long period 10-15 drops in some water before meals 3 times daily', 15),
	(26, 'Sarvakalp Kwath  ', 'ayurvedic_anaesthesia.png', 'rs.30', '100 grams for 10 days.', 14),
	(27, 'elpam Tablet', 'allo_anxiety.jpg', 'rs.25', 'Elpam 5 mg Tablet is a benzodiazepine. It works by increasing the action of a chemical messenger (GABA) which suppresses the abnormal and excessive activity of the nerve cells in the brain.', 13),
	(28, 'R89 ', 'homo_anxiety.jpg', 'rs.196.00', 'Take 10 drops in half cup of water three times a day.', 15),
	(29, 'sumenat tablet', 'ayur-anxiety.jpg', 'rs.171', 'SUMENTA helps improve all psychological activities. It is an excellent antidepressant, anxiolytic drug with mild tranquilizing property, but without any side effects.', 14),
	(30, 'Cypon Capsule ', 'allo-appetite.jpg', 'rs.33', 'Do not chew, crush or break it. Cypon Capsule may be taken with or without food, but it is better to take it at a fixed time.', 13),
	(31, 'Dr. Reckeweg R31 Increases Appetite And Blood Supply Drop', 'homo-appetite.jpg', 'rs.223', '3 times a day 10-15 drops in a little water before meals. During the first days of treatment, in case of pronounced anaemia, frequent doses, eventually 6-10 times daily 10-15 drops. On noting improvement, reduce the dose to 2-3 times a day', 15),
	(32, 'Longifene Syrup', 'ayur-appetite.jpg', 'Rs.79', 'take as per suggestion of the suggestion', 14),
	(33, 'Lubrijoint 750 Tablet', 'allopathy-arthritis.jpg', 'rs.385', 'Take this medicine in the dose and duration as advised by your doctor. Swallow it as a whole. Do not chew, crush or break it.', 13),
	(34, 'Dr. Reckeweg R73 (Spondarthrin) (22ml)', 'homopathic_arthritis.jpg', 'rs.229', 'desc1:To begin with give 10-15 drops of Dr Reckeweg R73 in some water 4-6 times daily', 15),
	(35, 'AAMVATARI RAS', 'ayurvedic-arthritis.jpg', 'rs.37', 'dosage as per the doctor advise.', 14),
	(36, 'salbutamol and theophylline', 'allopathy-asthma.jpg', 'Rs. 245', 'It inhibit phosphodiesterase enzyme which degrades cyclic nucleotides intracellularly and it results the cyclic AMP accumulation in the cell.', 13),
	(37, 'DR. RECKEWEG R43', 'homopathy-asthma.png', 'rs.123', 'Adults and children  less than 12 years 5-10 drops 1-3 times daily in a little water or undiluted or as recommended.', 15),
	(38, 'Dabur Shwaasamrit', 'ayurveda-asthma.jpg', 'rs.232', '1-2 teaspoonfuls twice daily or as directed by the Physician', 14),
	(39, 'Abatitor 250mg Tablet 30\'S', 'allo-cancer.jpg', 'Rs.9,975.00', 'Please seek the advice of a physician or other qualified health provider with any questions you may have regarding a medical condition. ', 13),
	(40, 'carcinosin', 'homo-cancer.jpeg', 'rs.1243', '5-10 drops in 120ml water.', 15),
	(41, 'Upcount Capsule', 'ayurveda-cancer.jpg', 'rs.600', 'For Platelet count for Above 50,000 - 2 Caps once daily', 14),
	(42, 'Evict Syrup 200ml', 'constipation-allopathy.jpg', 'rs.216.30 ', 'It makes the stool softer and easier to pass, by drawing water into the bowel', 13),
	(43, 'Hapdco Laxosoft Laxative Powder (100g)', 'constipation-homopathy.jpg', 'rs.131', '1 tsp after meal twice a day with lukewarm water.', 15),
	(44, 'Himalaya Herbolax 100\'s Tablet', 'constipation-ayurveda.jpg', 'rs.94', 'As directed by your physician. ', 14),
	(45, 'D\' cold total', 'cold-allo.jpg', 'rs.70', 'Dosage as per the advice of physician', 13),
	(46, 'Dr. Reckeweg R9 Drop ', 'homo-cold.jpg', 'rs.206', 'In the beginning of the treatment frequent doses, every 1 hour 10 drops in some water, or one teaspoon (5ml) of syrup.', 15),
	(47, 'MULETHI CHURNA 100GM ', 'ayur-cold.jpg', 'rs.42', '1-4 g powder twice or thrice daily empty stomach with lukewarm water or milk or as directed by the Physician.', 14),
	(48, 'Diabetrol Tablet 10\'S', 'allo-diabetes.jpg', 'rs.44', 'To lower blood sugar levels and are used in the treatment of late-onset diabetes (type II diabetes mellitus) in patients whose blood sugar is not controlled by diet alone and who are not suitable for insulin injections', 13),
	(49, 'Dr. Reckeweg Syzygium Jamb Mother Tincture Q', 'homo-diabetes.jpeg', 'rs.193', 'Dosage as per directed by the physician', 15),
	(50, 'DIABEX ', 'ayur-diabets.jpg', 'rs.32', '2 pills thrice a day before meals; Moderate Cases: 2 pills before breakfast and dinner and 1 pill before breakfast and dinner for Borderline Cases.', 14);
/*!40000 ALTER TABLE `backend_panel_medicinedetails` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_medicinescategory
CREATE TABLE IF NOT EXISTS `backend_panel_medicinescategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_medicinescategory: ~4 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_medicinescategory` DISABLE KEYS */;
INSERT INTO `backend_panel_medicinescategory` (`id`, `type`) VALUES
	(13, 'Allopathy'),
	(14, 'Ayurvedic'),
	(16, 'general fitness'),
	(15, 'Homopathy');
/*!40000 ALTER TABLE `backend_panel_medicinescategory` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_precautions
CREATE TABLE IF NOT EXISTS `backend_panel_precautions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precautions` varchar(225) DEFAULT NULL,
  `dis_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_precau_dis_id_452328a8_fk_backend_p` (`dis_id`),
  CONSTRAINT `backend_panel_precau_dis_id_452328a8_fk_backend_p` FOREIGN KEY (`dis_id`) REFERENCES `backend_panel_diseases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_precautions: ~92 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_precautions` DISABLE KEYS */;
INSERT INTO `backend_panel_precautions` (`id`, `precautions`, `dis_id`) VALUES
	(1, '1.Avoid an unbalanced diet.', 5),
	(2, '2.Avoid an unbalanced diet.', 5),
	(3, '3.Avoid smoking and drinking too much coffee or alcohol. ', 5),
	(4, '4.If you wear makeup, learn the proper way to apply it', 5),
	(5, '5.Arrange your hair so that it does not brush against your acne', 5),
	(6, '6.Wash your face gently but thoroughly with soap.', 5),
	(7, '7.If you work up a sweat, wash your face or body right away to keep it clean', 5),
	(8, '1.Avoid drinking on an empty stomach', 6),
	(9, '2.Sip your drink slowly and don’t binge drink', 6),
	(10, '3.Tell friends and family about the intention to stop or reduce alcohol intake', 6),
	(11, '4.Refuse alcoholic drinks and ask for something non-alcoholic when socializing', 6),
	(12, '5.Don’t stock alcohol at home', 6),
	(13, '6.Avoid drinking when you are emotional or upset', 6),
	(14, '7.Avoid drinking after a stressful or tiring day and deal with the stress by exercising or other healthy activities', 6),
	(15, '8.Curtail time spent with friends and colleagues who drink excessively', 6),
	(16, '1.If you\'re allergic to pollen and you know pollen counts are going to be high, try to remain indoors with doors and windows closed. ', 8),
	(17, '2.Use a high-efficiency particulate air filter (HEPA). HEPA filters trap airborne allergens.', 8),
	(18, '3.If you already have a cat or dog that you’re allergic to, don’t sleep with the pet and wash your hands promptly after contact. Don’t touch your eyes, nose, or mouth after touching an animal.', 8),
	(19, '4.If you\'re trying to figure out which allergens might cause or worsen your symptoms, keep a log. Write down what you eat and all your activities to help pinpoint triggers.', 8),
	(20, '5.Wash bedding frequently and use hot water to lessen your exposure to dust mites, pet dander, pollen, and other airborne irritants', 8),
	(21, '6.If you have severe allergies, a medical alert bracelet or necklace can get you medical assistance in an emergency.', 8),
	(22, '1.Avoid smoking.', 7),
	(23, ' 2.Control vascular risk factors, including high blood pressure, high cholesterol and diabetes.', 7),
	(24, '3.Eat a balanced diet — such as the Mediterranean diet — that\'s rich in vegetables, fruits and lean protein, particularly protein sources containing omega-3 fatty acids.', 7),
	(25, '4.Be physically and socially active, including engaging in aerobic exercise.', 7),
	(26, '5.Take care of your mental health.', 7),
	(27, '6.Use thinking (cognitive) skills, such as memory skills.', 7),
	(28, '1. maintaining good environmental sanitation, especially in controlling quality of drinking water; ', 9),
	(29, '2. prompt investigation of cases and implementation of control measures to prevent spread of the disease; ', 9),
	(30, '3 health education to the general public and food trade on observance of good personal, environmental and food hygiene.', 9),
	(31, '1.Check with your doctor.', 10),
	(32, '2.Get a red blood cell count.', 10),
	(33, '3.Get treatment for your anemia (blood transfusions or growth factors)', 10),
	(34, '4.Drink plenty of water', 10),
	(35, '5.Get up and walk around every hour or two if it is safe to do so', 10),
	(36, '1.Food: do not eat, suck on candy or chew gum less than six hours before the procedure.', 11),
	(37, '2.Beverages: stop drinking fluids six hours prior to the procedure; only clear liquids (water or tea) are permitted up to two hours before the procedure; after that time, all beverages are prohibited.', 11),
	(38, '3.Smoking: it is advisable to stop smoking at least 12 hours before the procedure', 11),
	(39, '1.Exercise', 12),
	(40, '2.Meditation', 12),
	(41, '3.Relaxation exercises, including deep breathing', 12),
	(42, '4.Visualization', 12),
	(43, '5.Adequate rest', 12),
	(44, '6.Health diet', 12),
	(45, '7.Interpersonal skills in dealing with difficult people and situations or parenting skills training in dealing with your children', 12),
	(46, '1.Avoid cooking strong smelling foods (such as fish or cauliflower). ', 13),
	(47, '2.Eat several small meals daily, instead of large ones.', 13),
	(48, '3.Feeding through artificial means (such as a tube or IV). ', 13),
	(49, '4.Exercising regularly can increase your appetite. ', 13),
	(50, '5.Home Remedies for Appetite loss ', 13),
	(51, '6.Oranges are an extremely useful remedy for anorexia. ', 13),
	(52, '7.Lime is also a valuable remedy for restoring a lost appetite. ', 13),
	(53, '8.The application of an ice-bag over the stomach for half an hour before meals, and a cool hip bath once or twice daily, will go a long way in curing anorexia. ', 13),
	(54, '1.medications', 14),
	(55, '2.non-pharmacologic therapies', 14),
	(56, '3.physical or occupational therapy', 14),
	(57, '4.splints or joint assistive aids', 14),
	(58, '5.patient education and support', 14),
	(59, '6.weight loss', 14),
	(60, '7.surgery, including joint replacemen', 14),
	(61, '1.Wash all bedding in hot water once a week.', 15),
	(62, '2.Don\'t allow smoking in your house.', 15),
	(63, '3.Wear a mask and gloves when cleaning, vacuuming, or painting to limit dust and chemical exposure.', 15),
	(64, '4.Vacuum twice a week.', 15),
	(65, '5.Limit throw rugs to reduce dust and mold. If you do have rugs, make sure they are washable.', 15),
	(66, '6.Keep all clothing in drawers and closets. Keep drawers and closets closed.', 15),
	(67, '7.Cover air ducts with filters or cheesecloth. Change these when soiled.', 15),
	(68, '1.Lump or area of thickening that can be felt under the skin', 16),
	(69, '2.Weight changes, including unintended loss or gain', 16),
	(70, '3.Skin changes, such as yellowing, darkening or redness of the skin, sores that won\'t heal, or changes to existing moles', 16),
	(71, '4.Changes in bowel or bladder habits', 16),
	(72, '5.Persistent cough or trouble breathing', 16),
	(73, '6.Difficulty swallowing', 16),
	(74, '7.Hoarseness', 16),
	(75, '1.Increasing intake of dietary fibre and fluid', 17),
	(76, '2.Exercising daily', 17),
	(77, '3.Reducing consumption of constipating foods and beverages.', 17),
	(78, '1.Avoid close contact with someone infected with a cold.', 18),
	(79, '2.Eat plenty of vitamin-rich fruit and vegetables to help keep the immune system strong.', 18),
	(80, '3.When sneezing or coughing, make sure it is done into a tissue. Discard the tissue carefully and wash your hands.', 18),
	(81, '4.If you sneeze into your hands, make sure you wash them with soap and water immediately.', 18),
	(82, '5.If you have no tissues or a handkerchief, cough into the inside (crook) of your elbow rather than your hands.', 18),
	(83, '6.Wash your hands regularly; cold viruses can be transmitted from one person to another by touch. In fact, more germs are passed by shaking hands than by kissing.', 18),
	(84, '7.Keep surfaces in your home clean — especially in the kitchen or bathroom.', 18),
	(85, '8.Avoid touching your face, especially your nose and mouth', 18),
	(86, '1.Cut Sugar and Refined Carbs From Your Diet. ...', 19),
	(87, '2.Work Out Regularly. ...', 19),
	(88, '3.Drink Water as Your Primary Beverage. ...', 19),
	(89, '4.Lose Weight If You\'re Overweight or Obese. ...', 19),
	(90, '5.Quit Smoking. ...', 19),
	(91, '6.Follow a Very-Low-Carb Diet. ...', 19),
	(92, '7.Avoid Sedentary Behaviors.', 19);
/*!40000 ALTER TABLE `backend_panel_precautions` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_relation: ~45 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_relation` DISABLE KEYS */;
INSERT INTO `backend_panel_relation` (`id`, `dis_id`, `med_id`) VALUES
	(21, 5, 5),
	(22, 5, 8),
	(23, 5, 7),
	(25, 6, 9),
	(26, 6, 11),
	(27, 6, 10),
	(28, 7, 12),
	(29, 7, 14),
	(30, 7, 13),
	(31, 8, 15),
	(32, 8, 16),
	(33, 8, 17),
	(34, 9, 18),
	(35, 9, 20),
	(36, 9, 19),
	(37, 10, 21),
	(38, 10, 22),
	(39, 10, 23),
	(40, 11, 24),
	(41, 11, 25),
	(42, 11, 26),
	(43, 12, 27),
	(44, 12, 28),
	(45, 12, 29),
	(46, 13, 30),
	(47, 13, 31),
	(48, 13, 32),
	(49, 14, 33),
	(50, 14, 34),
	(51, 14, 35),
	(52, 15, 36),
	(53, 15, 37),
	(54, 15, 38),
	(55, 16, 39),
	(56, 16, 40),
	(57, 16, 41),
	(58, 17, 42),
	(59, 17, 43),
	(60, 17, 44),
	(61, 18, 45),
	(62, 18, 46),
	(63, 18, 47),
	(64, 19, 48),
	(65, 19, 49),
	(66, 19, 50);
/*!40000 ALTER TABLE `backend_panel_relation` ENABLE KEYS */;

-- Dumping structure for table easymeds_db.backend_panel_symptoms
CREATE TABLE IF NOT EXISTS `backend_panel_symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoms` varchar(225) DEFAULT NULL,
  `dis_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_sympto_dis_id_68522e1d_fk_backend_p` (`dis_id`),
  CONSTRAINT `backend_panel_sympto_dis_id_68522e1d_fk_backend_p` FOREIGN KEY (`dis_id`) REFERENCES `backend_panel_diseases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.backend_panel_symptoms: ~88 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_symptoms` DISABLE KEYS */;
INSERT INTO `backend_panel_symptoms` (`id`, `symptoms`, `dis_id`) VALUES
	(6, 'Whiteheads (closed plugged pores)', 5),
	(7, 'Blackheads (open plugged pores)', 5),
	(8, 'Small red, tender bumps (papules)', 5),
	(9, ' Pimples (pustules), which are papules with pus at their tips', 5),
	(10, 'Large, solid, painful lumps beneath the surface of the skin (nodules)', 5),
	(11, 'Poor coordination', 6),
	(12, 'Slurred speech', 6),
	(13, 'Impaired thinking', 6),
	(14, 'Memory impairment', 6),
	(15, 'Wanting to stop drinking but not managing to do so', 6),
	(16, 'Having less energy and drive to do things', 7),
	(17, 'Less interest in work and social activities and spending more time just sitting, watching TV, or sleeping', 7),
	(18, 'Loss of recent memories, like forgetting conversations and events that just happened', 7),
	(19, 'Language problems, like trouble putting their thoughts into words or understanding others', 7),
	(20, 'Mild coordination problems, such as trouble writing or using familiar objects.', 7),
	(21, 'sneezing and an itchy, runny or blocked nose (allergic rhinitis)', 8),
	(22, 'itchy, red, watering eyes (conjunctivitis)', 8),
	(23, 'wheezing, chest tightness, shortness of breath and a cough', 8),
	(24, 'a raised, itchy, red rash (hives)', 8),
	(25, 'swollen lips, tongue, eyes or face', 8),
	(26, 'loose stools,', 9),
	(27, 'mild abdominal cramping,', 9),
	(28, 'frequent, watery, and/or bloody stools with severe abdominal cramping (termed amoebic dysentery) may occur,', 9),
	(29, 'flatulence,', 9),
	(30, 'appetite loss', 9),
	(31, '1.extreme tiredness (fatigue)', 10),
	(32, '2.lack of energy (lethargy)', 10),
	(33, '3.breathlessness', 10),
	(34, '4.feeling faint', 10),
	(35, '5.headaches', 10),
	(36, '6.pale skin', 10),
	(37, '7.noticeable heartbeats (palpitations)', 10),
	(38, '8.loss of appetite and weight loss', 10),
	(39, '1.temporary confusion and memory loss, although this is more common in the elderly.', 11),
	(40, '2.dizziness.', 11),
	(41, '3.difficulty passing urine.', 11),
	(42, '4.bruising or soreness from the IV drip.', 11),
	(43, '5.nausea and vomiting.', 11),
	(44, '6.shivering and feeling cold.', 11),
	(45, '7.sore throat, due to the breathing tube.', 11),
	(46, '1.Feeling nervous, restless or tense.', 12),
	(47, '2.Having a sense of impending danger, panic or doom.', 12),
	(48, '3.Having an increased heart rate.', 12),
	(49, '4.Breathing rapidly (hyperventilation)', 12),
	(50, '5.Sweating.', 12),
	(51, '6.Trembling.', 12),
	(52, '7.Feeling weak or tired.', 12),
	(53, '1.extreme fatigue.', 13),
	(54, '2.weight loss.', 13),
	(55, '3.a rapid heart rate.', 13),
	(56, '4.fever', 13),
	(57, '5.irritability.', 13),
	(58, '6.a general ill feeling, or malaise', 13),
	(59, '1.pain', 14),
	(60, '2.Stiffness', 14),
	(61, '3.Swelling', 14),
	(62, '4.Redness', 14),
	(63, '5.Decreased range of motion', 14),
	(64, '1.Coughing, especially at night, during exercise or when laughing.', 15),
	(65, '2.Difficulty breathing.', 15),
	(66, '3.Chest tightness.', 15),
	(67, '4.Shortness of breath.', 15),
	(68, '5.Wheezing (a whistling or squeaky sound in your chest when breathing, especially when exhaling) ', 15),
	(69, '1.Lump or area of thickening that can be felt under the skin', 16),
	(70, '2.Weight changes, including unintended loss or gain', 16),
	(71, '3.Skin changes, such as yellowing, darkening or redness of the skin, sores that won\'t heal, or changes to existing moles', 16),
	(72, '4.Changes in bowel or bladder habits', 16),
	(73, '5.Persistent cough or trouble breathing', 16),
	(74, '6.Difficulty swallowing', 16),
	(75, '7.Hoarseness', 16),
	(76, '1.Fewer than 3 bowel movements a week', 17),
	(77, '2.Dry, hard-to-pass stools', 17),
	(78, '3.Straining during a bowel movement', 17),
	(79, '4.The feeling of not completely emptying your bowels', 17),
	(80, '1.dry throat', 18),
	(81, '2.sore throat', 18),
	(82, '3.cough', 18),
	(83, '4.mild fever', 18),
	(84, '5.hoarse voice', 18),
	(85, '6.blocked nose', 18),
	(86, '7.mild headache', 18),
	(87, '1.increased hunger', 19),
	(88, '2.increased thirst', 19),
	(89, '3.weight loss', 19),
	(90, '4.frequent urination', 19),
	(91, '5.blurry vision', 19),
	(92, '6.extreme fatigue', 19),
	(93, '7.sores that don’t heal', 19);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.django_content_type: ~15 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(10, 'backend_panel', 'diseases'),
	(12, 'backend_panel', 'medicinedetails'),
	(14, 'backend_panel', 'medicinescategory'),
	(15, 'backend_panel', 'precautions'),
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.django_migrations: ~23 rows (approximately)
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
	(19, 'backend_panel', '0001_initial', '2019-07-10 18:06:44'),
	(20, 'first_panel', '0005_roledetails_image', '2019-07-16 19:43:34'),
	(21, 'backend_panel', '0002_auto_20190720_0105', '2019-07-19 19:36:00'),
	(22, 'backend_panel', '0003_auto_20190720_0119', '2019-07-19 19:49:57'),
	(23, 'backend_panel', '0004_auto_20190721_1440', '2019-07-21 09:10:52');
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
	('7bja4i67oua59cycce97022lyf0xkdye', 'OTdlZmU5NGUyMWI0MTM0NTRlYWE3NmZkN2VhOWJhNjljMzhiNThjZjp7ImVtYWlsIjoicmt1bmFsOTgwQGdtYWlsLmNvbSIsInJvbGUiOjEsImF1dGhlbnRpY2F0ZSI6dHJ1ZSwibmFtZSI6Imt1bmFsIn0=', '2019-08-12 17:51:11'),
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
  `image` varchar(225),
  PRIMARY KEY (`email`),
  KEY `first_panel_roledeta_role_id_f53da955_fk_first_pan` (`role_id`),
  CONSTRAINT `first_panel_roledeta_role_id_f53da955_fk_first_pan` FOREIGN KEY (`role_id`) REFERENCES `first_panel_userrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymeds_db.first_panel_roledetails: ~1 rows (approximately)
/*!40000 ALTER TABLE `first_panel_roledetails` DISABLE KEYS */;
INSERT INTO `first_panel_roledetails` (`name`, `email`, `password`, `mobile`, `gender`, `address`, `otp`, `otp_time`, `last_login`, `active`, `verify_link`, `auth_token`, `role_id`, `image`) VALUES
	('kunal', 'rkunal980@gmail.com', 'pbkdf2_sha256$100000$vYGN40KRx3Yn$MUOp90M52yjgp4joeBOlfL+Dbjo3jPd5P1gwztATuxk=', '6555555555555555555', 'Male', 'amritsar', '', '', '', '1', '', '', 1, '13977.jpg');
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
