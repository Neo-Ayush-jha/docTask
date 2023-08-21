-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 08:00 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pastask`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add blog post', 7, 'add_blogpost'),
(26, 'Can change blog post', 7, 'change_blogpost'),
(27, 'Can delete blog post', 7, 'delete_blogpost'),
(28, 'Can view blog post', 7, 'view_blogpost'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'pasTask', 'blogpost'),
(8, 'pasTask', 'category'),
(6, 'pasTask', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-17 17:58:22.528635'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-08-17 17:58:22.665640'),
(3, 'auth', '0001_initial', '2023-08-17 17:58:23.081416'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-08-17 17:58:23.190424'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-08-17 17:58:23.207427'),
(6, 'auth', '0004_alter_user_username_opts', '2023-08-17 17:58:23.219427'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-08-17 17:58:23.233428'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-08-17 17:58:23.243431'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-08-17 17:58:23.263431'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-08-17 17:58:23.280439'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-08-17 17:58:23.298436'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-08-17 17:58:23.343437'),
(13, 'auth', '0011_update_proxy_permissions', '2023-08-17 17:58:23.358437'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-08-17 17:58:23.375438'),
(15, 'pasTask', '0001_initial', '2023-08-17 17:58:23.838791'),
(16, 'admin', '0001_initial', '2023-08-17 17:58:24.048561'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-08-17 17:58:24.072568'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-17 17:58:24.109568'),
(19, 'sessions', '0001_initial', '2023-08-17 17:58:24.195572'),
(20, 'pasTask', '0002_category_blogpost', '2023-08-19 17:59:49.732228');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('47e0oz3pqslofr3v7a3h8q1l9zq525go', '.eJxVjDsOwjAQBe_iGlnrD_5Q0nOGaJ1d4wCypTipEHdHllJA-2bmvcWE-1amvfM6LSQuwonT75ZwfnIdgB5Y703OrW7rkuRQ5EG7vDXi1_Vw_w4K9jLq5GPQKTtMOrK1yoB1oI1nBhUUBUsueciYWXMkgGgxsAc8g3Fakfh8AdqsN2o:1qXSTr:zaZTgslzDrj-xYvHwNWK2x6ktZNaQxHRmM5TS__ERXU', '2023-09-02 20:23:31.760962'),
('5723e40zd2nz5v4pp12l0x7v21y5lrkn', '.eJxVjEsOwjAMBe-SNYqSuB-HJXvOUDm2SwsokZp2hbg7VOoCtm9m3ssMtK3TsFVdhlnM2fTm9Lsl4ofmHcid8q1YLnld5mR3xR602msRfV4O9-9gojp965CIRoAOkwNtG68IITCOEhyQekYUia7VBE6gg-j7thFGjxypD1HN-wPkGjel:1qXQP0:2ddofHFAZgpUebEKkdP3weUff_aUWm3101BOjst9GD0', '2023-09-02 18:10:22.270712'),
('vqf7z5l6yx9w06u3n17skx7qfftaifj3', '.eJxVjDsOwjAQBe_iGlnrD_5Q0nOGaJ1d4wCypTipEHdHllJA-2bmvcWE-1amvfM6LSQuwonT75ZwfnIdgB5Y703OrW7rkuRQ5EG7vDXi1_Vw_w4K9jLq5GPQKTtMOrK1yoB1oI1nBhUUBUsueciYWXMkgGgxsAc8g3Fakfh8AdqsN2o:1qWqj2:vsR6trNXwCMnYmRP3VuTIT8Sp3qCbWLIrNSB7A9OCLo', '2023-09-01 04:04:40.733820');

-- --------------------------------------------------------

--
-- Table structure for table `pastask_blogpost`
--

CREATE TABLE `pastask_blogpost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `summary` longtext NOT NULL,
  `content` longtext NOT NULL,
  `is_draft` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pastask_blogpost`
--

INSERT INTO `pastask_blogpost` (`id`, `title`, `image`, `summary`, `content`, `is_draft`, `created_at`, `category_id`) VALUES
(9, 'Active immunization', 'blog_images/th_t8sbjc7.jpeg', 'Process by which an individual\'s immune system becomes fortified against an agent.\r\nImmunization, or immunisation, is the process by which an individual\'s immune system becomes fortified against an infectious agent (known as the immunogen). When this system is exposed to molecules that are foreign to the body, called non-self, it will orchestrate an immune response, and it will also develop the ability to quickly respond to a subsequent encounter because of immunological memory.', 'Active immunization can occur naturally when a person comes in contact with, for example, a microbe. The immune system will eventually create antibodies and other defenses against the microbe. The next time, the immune response against this microbe can be very efficient; this is the case in many of the childhood infections that a person only contracts once, but then is immune.\r\n\r\nArtificial active immunization is where the microbe, or parts of it, are injected into the person before they are able to take it in naturally. If whole microbes are used, they are pre-treated.\r\n\r\nThe importance of immunization is so great that the American Centers for Disease Control and Prevention has named it one of the \"Ten Great Public Health Achievements in the 20th Century\".[6] Live attenuated vaccines have decreased pathogenicity. Their effectiveness depends on the immune systems ability to replicate and elicits a response similar to natural infection. It is usually effective with a single dose. Examples of live, attenuated vaccines include measles, mumps, rubella, MMR, yellow fever, varicella, rotavirus, and influenza (LAIV).', 1, '2023-08-21 05:53:26.012081', 1),
(10, 'Epidemiology', 'blog_images/th_1.jpeg', 'Mental health encompasses emotional, psychological, and social well-being, influencing cognition, perception, and behavior. According to World Health Organization (WHO), it is a \"state of well-being in which the individual realizes his or her abilities, can cope with the normal stresses of life, can work productively and fruitfully, and can contribute to his or her community\".[1] It likewise determines how an individual handles stress, interpersonal relationships, and decision-making.[2] Mental health includes subjective well-being, perceived self-efficacy, autonomy, competence, intergenerational dependence, and self-actualization of one\'s intellectual and emotional potential, among others.[3] From the perspectives of positive psychology or holism, mental health may include an individual\'s ability to enjoy life and to create a balance between life activities and efforts to achieve psychological resilience.[4] Cultural differences, subjective assessments, and competing professional theories all affect how one defines \"mental health\".[5] Some early signs related to mental health difficulties are sleep irritation, lack of energy, lack of appetite, and thinking of harming yourself or others.[6]', 'Mental illnesses are more common than cancer, diabetes, or heart disease. Over 26 percent of all Americans over the age of 18 meet the criteria for having a mental illness.[33] Evidence suggests that 450 million people worldwide have some mental illness. Major depression ranks fourth among the top 10 leading causes of disease worldwide. By 2029, mental illness is predicted to become the leading cause of disease worldwide. One million people commit suicide every year and 10 to 20 million attempt it.[34] A World Health Organization (WHO) report estimates the global cost of mental illness at nearly $2.5 trillion (two-thirds in indirect costs) in 2010, with a projected increase to over $6 trillion by 2030.[35]\r\n\r\nEvidence from the WHO suggests that nearly half of the world\'s population is affected by mental illness with an impact on their self-esteem, relationships and ability to function in everyday life.[36] An individual\'s emotional health can impact their physical health. Poor mental health can lead to problems such as the inability to make adequate decisions and substance use disorders.[37]\r\n\r\nGood mental health can improve life quality whereas poor mental health can worsen it. According to Richards, Campania, & Muse-Burke, \"There is growing evidence that is showing emotional abilities are associated with pro-social behaviors such as stress management and physical health.\"[37] Their research also concluded that people who lack emotional expression are inclined to anti-social behaviors (e.g., substance use disorder and alcohol use disorder, physical fights, vandalism), which reflects one\'s mental health and suppressed emotions.[37] Adults and children who face mental illness may experience social stigma, which can exacerbate the issues.[38]', 1, '2023-08-21 05:55:19.867984', 2),
(11, 'Cardiovascular disease', 'blog_images/th_2.jpeg', 'Cardiovascular disease (CVD) is any disease involving the heart or blood vessels.[3] CVDs constitute a class of diseases that includes: coronary artery diseases (e.g. angina, heart attack), stroke, heart failure, hypertensive heart disease, rheumatic heart disease, cardiomyopathy, abnormal heart rhythms, congenital heart disease, valvular heart disease, carditis, aortic aneurysms, peripheral artery disease, thromboembolic disease, and venous thrombosis.[3][4]', 'Risk factors\r\nThere are many risk factors for heart diseases: age, sex, tobacco use, physical inactivity, non-alcoholic fatty liver disease, excessive alcohol consumption, unhealthy diet, obesity, genetic predisposition and family history of cardiovascular disease, raised blood pressure (hypertension), raised blood sugar (diabetes mellitus), raised blood cholesterol (hyperlipidemia), undiagnosed celiac disease, psychosocial factors, poverty and low educational status, air pollution, and poor sleep.[3][17][18][19][20][21] While the individual contribution of each risk factor varies between different communities or ethnic groups the overall contribution of these risk factors is very consistent.[22] Some of these risk factors, such as age, sex or family history/genetic predisposition, are immutable; however, many important cardiovascular risk factors are modifiable by lifestyle change, social change, drug treatment (for example prevention of hypertension, hyperlipidemia, and diabetes).[23] People with obesity are at increased risk of atherosclerosis of the coronary arteries.[24]\r\n\r\nGenetics\r\nCardiovascular disease in a person\'s parents increases their risk by ~3 fold,[25] and genetics is an important risk factor for cardiovascular diseases. Genetic cardiovascular disease can occur either as a consequence of single variant (Mendelian) or polygenic influences.[26] There are more than 40 inherited cardiovascular disease that can be traced to a single disease-causing DNA variant, although these conditions are rare.[26] Most common cardiovascular diseases are non-Mendelian and are thought to be due to hundreds or thousands of genetic variants (known as single nucleotide polymorphisms), each associated with a small effect.[27][28]\r\n\r\nAge\r\n\r\nCalcified heart of an older woman with cardiomegaly\r\nAge is the most important risk factor in developing cardiovascular or heart diseases, with approximately a tripling of risk with each decade of life.[29] Coronary fatty streaks can begin to form in adolescence.[30] It is estimated that 82 percent of people who die of coronary heart disease are 65 and older.[31] Simultaneously, the risk of stroke doubles every decade after age 55.[32]\r\n\r\nMultiple explanations are proposed to explain why age increases the risk of cardiovascular/heart diseases. One of them relates to serum cholesterol level.[33] In most populations, the serum total cholesterol level increases as age increases. In men, this increase levels off around age 45 to 50 years. In women, the increase continues sharply until age 60 to 65 years.[33]\r\n\r\nAging is also associated with changes in the mechanical and structural properties of the vascular wall, which leads to the loss of arterial elasticity and reduced arterial compliance and may subsequently lead to coronary artery disease.[34]', 1, '2023-08-21 05:57:23.993226', 3),
(12, 'Pathophysiology', 'blog_images/th_3.jpeg', 'Population-based studies show that atherosclerosis, the major precursor of cardiovascular disease, begins in childhood. The Pathobiological Determinants of Atherosclerosis in Youth (PDAY) study demonstrated that intimal lesions appear in all the aortas and more than half of the right coronary arteries of youths aged 7–9 years.[', 'Population-based studies show that atherosclerosis, the major precursor of cardiovascular disease, begins in childhood. The Pathobiological Determinants of Atherosclerosis in Youth (PDAY) study demonstrated that intimal lesions appear in all the aortas and more than half of the right coronary arteries of youths aged 7–9 years.[74]\r\n\r\nObesity and diabetes mellitus are linked to cardiovascular disease,[75] as are a history of chronic kidney disease and hypercholesterolaemia.[76] In fact, cardiovascular disease is the most life-threatening of the diabetic complications and diabetics are two- to four-fold more likely to die of cardiovascular-related causes than nondiabetics.', 0, '2023-08-21 05:59:52.668036', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pastask_category`
--

CREATE TABLE `pastask_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pastask_category`
--

INSERT INTO `pastask_category` (`id`, `name`) VALUES
(1, 'Immunization'),
(2, 'Mental Health'),
(3, 'Heart Disease');

-- --------------------------------------------------------

--
-- Table structure for table `pastask_user`
--

CREATE TABLE `pastask_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_doctor` tinyint(1) NOT NULL,
  `is_patient` tinyint(1) NOT NULL,
  `profile_Picture` varchar(100) DEFAULT NULL,
  `address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pastask_user`
--

INSERT INTO `pastask_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_doctor`, `is_patient`, `profile_Picture`, `address`) VALUES
(1, 'pbkdf2_sha256$390000$S9JsKrLGUuWVJSZSHikvhf$0dfnoyKMqW2tAGz6QtXnw6BZNy9+w2RX2HNf6qapXVc=', '2023-08-17 17:59:28.193434', 0, 'smriti', 'Smriti', 'Kumari', 'smriti@gmail.com', 0, 1, '2023-08-17 17:59:27.586307', 0, 1, 'photo/WhatsApp_Image_2023-05-10_at_00.11.36.jpg', 'Rerum molestias non'),
(2, 'pbkdf2_sha256$390000$63zeuxknXob2fjScQ3NgNZ$SsrWD8I8BDuMvtoODt2NMF/REsP7dTTKQiIjE2HNvkM=', '2023-08-17 18:00:09.242046', 0, 'ayush_jha', 'Ayush', 'Jha', 'ayush9334kumar@gmail.com', 0, 1, '2023-08-17 18:00:08.836020', 1, 0, 'photo/me.jpeg', 'Enim consequatur es'),
(3, 'pbkdf2_sha256$390000$ojP6cKsGuwEtYsQVm7PAeZ$zxZ4RiPH4xGEvB+7LFUjO2gL4Mae8qk7DCtcFWVCANU=', '2023-08-18 03:57:42.248991', 0, 'Niki', 'Nikita', 'Jha', 'niki@gmail.com', 0, 1, '2023-08-18 03:51:51.586302', 0, 1, 'photo/WhatsApp_Image_2023-05-10_at_00.11.36_NLXBZc2.jpg', 'Navalal chowk ,line basti ,purnea ,Bihar'),
(4, 'pbkdf2_sha256$390000$gvihtd47HWeoykyjn3I4zf$xcxbvZhWdUl40GF+ej1GEFzwTRuPxKrHzZAGNdIZB9Q=', '2023-08-18 03:53:12.156134', 0, 'Ayush', 'Ayush', 'Kumar', 'ayush9334kumar@gmail.com', 0, 1, '2023-08-18 03:52:40.863378', 1, 0, 'photo/me_kH4dmxR.jpeg', '04-Line basti newalal chowk purnia bihar'),
(5, 'pbkdf2_sha256$390000$50OLs05HDJRXPi0OBmoIiw$Hv5aa0dNBG1nJoNS3VEdYF+Gr2jc001JECfNfp98UYo=', '2023-08-18 04:00:19.775554', 0, 'miss_smriti', 'Smriti', 'Kumari', 'smriti933@gmail.com', 0, 1, '2023-08-18 04:00:19.418073', 0, 1, '', '04-Line basti newalal chowk purnia bihar'),
(6, 'pbkdf2_sha256$390000$F9YWbZD0hM7VC8kHOtMGu9$m3knRcXAoLrsBXoE6SXBzy6Ri7t6Ryy/UtykyDeysYo=', '2023-08-21 04:11:46.267498', 0, 'aman', 'Aman', 'Kumar', 'ayush9334kumar@gmail.com', 0, 1, '2023-08-18 04:03:10.213234', 0, 1, 'photo/my.jpeg', '04-Line basti newalal chowk purnia bihar'),
(7, 'pbkdf2_sha256$390000$q8InhqeZmKkUwdkXcF2GzG$VPSM+85A9yueEJThx9mj48BBPfocQIFW1eGZTb0ajDo=', '2023-08-21 05:48:21.977939', 0, 'Anish_m', 'Anish', 'Kumar', 'anish@gmail.com', 0, 1, '2023-08-18 04:04:00.346177', 1, 0, 'photo/anish.jpg', '04-Line basti newalal chowk purnia bihar');

-- --------------------------------------------------------

--
-- Table structure for table `pastask_user_groups`
--

CREATE TABLE `pastask_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pastask_user_user_permissions`
--

CREATE TABLE `pastask_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_pasTask_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `pastask_blogpost`
--
ALTER TABLE `pastask_blogpost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasTask_blogpost_category_id_7d5fdb16_fk_pasTask_category_id` (`category_id`);

--
-- Indexes for table `pastask_category`
--
ALTER TABLE `pastask_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pastask_user`
--
ALTER TABLE `pastask_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pastask_user_groups`
--
ALTER TABLE `pastask_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasTask_user_groups_user_id_group_id_51ca05fc_uniq` (`user_id`,`group_id`),
  ADD KEY `pasTask_user_groups_group_id_688c7532_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `pastask_user_user_permissions`
--
ALTER TABLE `pastask_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasTask_user_user_permis_user_id_permission_id_f9b9a42c_uniq` (`user_id`,`permission_id`),
  ADD KEY `pasTask_user_user_pe_permission_id_e9ea4f6d_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pastask_blogpost`
--
ALTER TABLE `pastask_blogpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pastask_category`
--
ALTER TABLE `pastask_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pastask_user`
--
ALTER TABLE `pastask_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pastask_user_groups`
--
ALTER TABLE `pastask_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pastask_user_user_permissions`
--
ALTER TABLE `pastask_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_pasTask_user_id` FOREIGN KEY (`user_id`) REFERENCES `pastask_user` (`id`);

--
-- Constraints for table `pastask_blogpost`
--
ALTER TABLE `pastask_blogpost`
  ADD CONSTRAINT `pasTask_blogpost_category_id_7d5fdb16_fk_pasTask_category_id` FOREIGN KEY (`category_id`) REFERENCES `pastask_category` (`id`);

--
-- Constraints for table `pastask_user_groups`
--
ALTER TABLE `pastask_user_groups`
  ADD CONSTRAINT `pasTask_user_groups_group_id_688c7532_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `pasTask_user_groups_user_id_55194fa4_fk_pasTask_user_id` FOREIGN KEY (`user_id`) REFERENCES `pastask_user` (`id`);

--
-- Constraints for table `pastask_user_user_permissions`
--
ALTER TABLE `pastask_user_user_permissions`
  ADD CONSTRAINT `pasTask_user_user_pe_permission_id_e9ea4f6d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `pasTask_user_user_pe_user_id_6518621f_fk_pasTask_u` FOREIGN KEY (`user_id`) REFERENCES `pastask_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
