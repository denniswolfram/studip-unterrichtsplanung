SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET GLOBAL sql_mode = '';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `test`;
CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci */;
USE `test`;

DROP TABLE IF EXISTS `abschluss`;
CREATE TABLE `abschluss` (
  `abschluss_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_kurz` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beschreibung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(20) DEFAULT NULL,
  `chdate` int(20) DEFAULT NULL,
  PRIMARY KEY (`abschluss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `abschluss` (`abschluss_id`, `name`, `name_kurz`, `beschreibung`, `author_id`, `editor_id`, `mkdate`, `chdate`) VALUES
('228234544820cdf75db55b42d1ea3ecc',	'Bachelor',	NULL,	'',	'',	'',	1311416359,	1311416359),
('c7f569e815a35cf24a515a0e67928072',	'Master',	NULL,	'',	'',	'',	1311416385,	1311416385);

DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` enum('system','course','institute','user') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `context_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verb` enum('answered','attempted','attended','completed','created','deleted','edited','experienced','failed','imported','interacted','passed','shared','sent','voided') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'experienced',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `context_id` (`context_id`),
  KEY `mkdate` (`mkdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `admissionfactor`;
CREATE TABLE `admissionfactor` (
  `list_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `owner_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `admissionrules`;
CREATE TABLE `admissionrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruletype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruletype` (`ruletype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `admissionrules` (`id`, `ruletype`, `active`, `mkdate`, `path`) VALUES
(1,	'ConditionalAdmission',	1,	1388682201,	'lib/admissionrules/conditionaladmission'),
(2,	'LimitedAdmission',	1,	1388682201,	'lib/admissionrules/limitedadmission'),
(3,	'LockedAdmission',	1,	1388682201,	'lib/admissionrules/lockedadmission'),
(4,	'PasswordAdmission',	1,	1388682201,	'lib/admissionrules/passwordadmission'),
(5,	'TimedAdmission',	1,	1388682201,	'lib/admissionrules/timedadmission'),
(6,	'ParticipantRestrictedAdmission',	1,	1388682201,	'lib/admissionrules/participantrestrictedadmission'),
(7,	'CourseMemberAdmission',	1,	1414584420,	'lib/admissionrules/coursememberadmission'),
(8,	'PreferentialAdmission',	1,	1465458738,	'lib/admissionrules/preferentialadmission');

DROP TABLE IF EXISTS `admissionrule_compat`;
CREATE TABLE `admissionrule_compat` (
  `rule_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `compat_rule_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_type`,`compat_rule_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `admissionrule_compat` (`rule_type`, `compat_rule_type`, `mkdate`, `chdate`) VALUES
('ConditionalAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('ConditionalAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('ConditionalAdmission',	'LimitedAdmission',	1483462780,	1483462780),
('ConditionalAdmission',	'ParticipantRestrictedAdmission',	1483462780,	1483462780),
('ConditionalAdmission',	'PasswordAdmission',	1483462780,	1483462780),
('ConditionalAdmission',	'PreferentialAdmission',	1483462780,	1483462780),
('ConditionalAdmission',	'TimedAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'LimitedAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'ParticipantRestrictedAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'PasswordAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'PreferentialAdmission',	1483462780,	1483462780),
('CourseMemberAdmission',	'TimedAdmission',	1483462780,	1483462780),
('LimitedAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('LimitedAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('LimitedAdmission',	'ParticipantRestrictedAdmission',	1483462780,	1483462780),
('LimitedAdmission',	'PasswordAdmission',	1483462780,	1483462780),
('LimitedAdmission',	'PreferentialAdmission',	1483462780,	1483462780),
('LimitedAdmission',	'TimedAdmission',	1483462780,	1483462780),
('ParticipantRestrictedAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('ParticipantRestrictedAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('ParticipantRestrictedAdmission',	'LimitedAdmission',	1483462780,	1483462780),
('ParticipantRestrictedAdmission',	'PreferentialAdmission',	1483462780,	1483462780),
('ParticipantRestrictedAdmission',	'TimedAdmission',	1483462780,	1483462780),
('PasswordAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('PasswordAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('PasswordAdmission',	'PreferentialAdmission',	1483462780,	1483462780),
('PasswordAdmission',	'TimedAdmission',	1483462780,	1483462780),
('PreferentialAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('PreferentialAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('PreferentialAdmission',	'LimitedAdmission',	1483462780,	1483462780),
('PreferentialAdmission',	'ParticipantRestrictedAdmission',	1483462780,	1483462780),
('PreferentialAdmission',	'PasswordAdmission',	1483462780,	1483462780),
('PreferentialAdmission',	'TimedAdmission',	1483462780,	1483462780),
('TimedAdmission',	'ConditionalAdmission',	1483462780,	1483462780),
('TimedAdmission',	'CourseMemberAdmission',	1483462780,	1483462780),
('TimedAdmission',	'LimitedAdmission',	1483462780,	1483462780),
('TimedAdmission',	'ParticipantRestrictedAdmission',	1483462780,	1483462780),
('TimedAdmission',	'PasswordAdmission',	1483462780,	1483462780),
('TimedAdmission',	'PreferentialAdmission',	1483462780,	1483462780);

DROP TABLE IF EXISTS `admissionrule_inst`;
CREATE TABLE `admissionrule_inst` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `institute_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`,`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `admission_condition`;
CREATE TABLE `admission_condition` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `filter_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `conditiongroup_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `admission_conditiongroup`;
CREATE TABLE `admission_conditiongroup` (
  `conditiongroup_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `quota` int(11) NOT NULL,
  PRIMARY KEY (`conditiongroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `admission_seminar_user`;
CREATE TABLE `admission_seminar_user` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `status` enum('awaiting','accepted') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `position` int(5) DEFAULT NULL,
  `comment` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` enum('yes','no','unknown') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`user_id`,`seminar_id`),
  KEY `seminar_id` (`seminar_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `api_consumers`;
CREATE TABLE `api_consumers` (
  `consumer_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `consumer_type` enum('http','studip','oauth') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'studip',
  `auth_key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_secret` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `system` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `type` enum('website','mobile','desktop') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT 'website',
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `api_consumer_permissions`;
CREATE TABLE `api_consumer_permissions` (
  `route_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `consumer_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `method` char(6) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `granted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `route_id` (`route_id`,`consumer_id`,`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `api_consumer_permissions` (`route_id`, `consumer_id`, `method`, `granted`) VALUES
('301b5d2469584236ce86d4b62e0320f6',	'global',	'get',	1),
('301b5d2469584236ce86d4b62e0320f6',	'global',	'post',	1),
('4fdd10b33a73187eff2c5ee66138e007',	'global',	'get',	1),
('4fdd10b33a73187eff2c5ee66138e007',	'global',	'post',	1),
('5638725a387b0426dd4c4dc346db4306',	'global',	'get',	1),
('58ffd1089ee5bd547cfb12de54b342a5',	'global',	'post',	1),
('5a604ee32c498b8e19bfa18382ce91d9',	'global',	'put',	1);

DROP TABLE IF EXISTS `api_oauth_user_mapping`;
CREATE TABLE `api_oauth_user_mapping` (
  `oauth_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `api_user_permissions`;
CREATE TABLE `api_user_permissions` (
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `consumer_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `granted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `archiv`;
CREATE TABLE `archiv` (
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `untertitel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `beschreibung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(20) NOT NULL DEFAULT 0,
  `semester` varchar(16) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `heimat_inst_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `institute` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dozenten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fakultaet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dump` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `archiv_file_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `archiv_protected_file_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `forumdump` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `wikidump` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studienbereiche` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `VeranstaltungsNummer` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`seminar_id`),
  KEY `heimat_inst_id` (`heimat_inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `archiv_user`;
CREATE TABLE `archiv_user` (
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `status` enum('user','autor','tutor','dozent') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'user',
  PRIMARY KEY (`seminar_id`,`user_id`),
  KEY `user_id` (`user_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `auth_extern`;
CREATE TABLE `auth_extern` (
  `studip_user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_user_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `external_user_password` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_user_token` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_user_token_valid_until` int(11) NOT NULL DEFAULT 0,
  `external_user_category` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_user_system_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_user_type` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`studip_user_id`,`external_user_system_type`,`external_user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `auth_user_md5`;
CREATE TABLE `auth_user_md5` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varbinary(64) NOT NULL DEFAULT '',
  `perms` enum('user','autor','tutor','dozent','admin','root') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'user',
  `Vorname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nachname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation_key` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `auth_plugin` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'standard',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `lock_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked_by` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `visible` enum('global','always','yes','unknown','no','never') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `k_username` (`username`),
  KEY `perms` (`perms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `auth_user_md5` (`user_id`, `username`, `password`, `perms`, `Vorname`, `Nachname`, `Email`, `validation_key`, `auth_plugin`, `locked`, `lock_comment`, `locked_by`, `visible`) VALUES
('205f3efb7997a0fc9755da2b535038da',	'test_dozent',	UNHEX('24326124303824616A497667456A6431374D696944634672366D73632E786C646B6E482F745447616A555856684478444B4E4A565830483069763069'),	'dozent',	'Testaccount',	'Dozent',	'dozent@studip.de',	'',	'standard',	0,	NULL,	NULL,	'unknown'),
('6235c46eb9e962866ebdceece739ace5',	'test_admin',	UNHEX('24326124303824737676536D6132307649784952344A356763306A49753331677773315769626D69512F4844684354756B4641354771687363593147'),	'admin',	'Testaccount',	'Admin',	'admin@studip.de',	'',	'standard',	0,	NULL,	NULL,	'unknown'),
('76ed43ef286fb55cf9e41beadb484a9f',	'root@studip',	UNHEX('24326124303824486352366163445470416B466E4468786A375161564F356A4F57574D2E6E474655653377354A67766F774C6E54785245377458416D'),	'root',	'Root',	'Studip',	'root@localhost',	'',	'standard',	0,	NULL,	NULL,	'unknown'),
('7e81ec247c151c02ffd479511e24cc03',	'test_tutor',	UNHEX('243261243038246D4768426C3835545073694974756D5A34786A62674F6E5131767149684C414339676943665763467A706B45316A7165346C6D6279'),	'tutor',	'Testaccount',	'Tutor',	'tutor@studip.de',	'',	'standard',	0,	NULL,	NULL,	'unknown'),
('e7a0a84b161f3e8c09b4a0a2e8a58147',	'test_autor',	UNHEX('24326124303824787662727650686B6373766B7A505A734E682E6B63654C7732494977694E4A2E316A474F7759332E482F645232663850473558334F'),	'autor',	'Testaccount',	'Autor',	'autor@studip.de',	'',	'standard',	0,	NULL,	NULL,	'unknown');

DROP TABLE IF EXISTS `auto_insert_sem`;
CREATE TABLE `auto_insert_sem` (
  `seminar_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `status` enum('autor','tutor','dozent') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'autor',
  `domain_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`seminar_id`,`status`,`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `auto_insert_user`;
CREATE TABLE `auto_insert_user` (
  `seminar_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`seminar_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `aux_lock_rules`;
CREATE TABLE `aux_lock_rules` (
  `lock_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `banner_ads`;
CREATE TABLE `banner_ads` (
  `ad_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `banner_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alttext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` enum('url','seminar','inst','user','none') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'url',
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `startdate` int(20) NOT NULL DEFAULT 0,
  `enddate` int(20) NOT NULL DEFAULT 0,
  `priority` int(4) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber`;
CREATE TABLE `blubber` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `root_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `context_type` enum('public','private','course') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'public',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `author_host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `external_contact` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`),
  KEY `parent_id` (`parent_id`),
  KEY `chdate` (`chdate`),
  KEY `mkdate` (`mkdate`),
  KEY `user_id` (`user_id`,`Seminar_id`),
  KEY `root_id` (`root_id`,`mkdate`),
  KEY `Seminar_id` (`Seminar_id`,`context_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_events_queue`;
CREATE TABLE `blubber_events_queue` (
  `event_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `item_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL,
  PRIMARY KEY (`event_type`,`item_id`,`mkdate`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_external_contact`;
CREATE TABLE `blubber_external_contact` (
  `external_contact_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mail_identifier` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'anonymous',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`external_contact_id`),
  KEY `mail_identifier` (`mail_identifier`),
  KEY `contact_type` (`contact_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_follower`;
CREATE TABLE `blubber_follower` (
  `studip_user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `external_contact_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `left_follows_right` tinyint(1) NOT NULL,
  KEY `studip_user_id` (`studip_user_id`),
  KEY `external_contact_id` (`external_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_mentions`;
CREATE TABLE `blubber_mentions` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `external_contact` tinyint(4) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL,
  UNIQUE KEY `unique_users_per_topic` (`topic_id`,`user_id`,`external_contact`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_reshares`;
CREATE TABLE `blubber_reshares` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `external_contact` tinyint(4) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL,
  UNIQUE KEY `unique_reshares` (`topic_id`,`user_id`,`external_contact`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_streams`;
CREATE TABLE `blubber_streams` (
  `stream_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `sort` enum('activity','age') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'age',
  `defaultstream` tinyint(2) NOT NULL DEFAULT 0,
  `pool_courses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pool_groups` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pool_hashtags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_courses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_groups` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_users` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_hashtags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter_nohashtags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`stream_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `blubber_tags`;
CREATE TABLE `blubber_tags` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`topic_id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `cache_key` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `content` mediumblob NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `cache_operations`;
CREATE TABLE `cache_operations` (
  `cache_key` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `operation` char(6) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cache_key`(200),`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `calendar_event`;
CREATE TABLE `calendar_event` (
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `event_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `group_status` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL,
  `chdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`range_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `calendar_user`;
CREATE TABLE `calendar_user` (
  `owner_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `permission` int(2) NOT NULL,
  `mkdate` int(11) NOT NULL,
  `chdate` int(11) NOT NULL,
  PRIMARY KEY (`owner_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `object_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `conditionaladmissions`;
CREATE TABLE `conditionaladmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `conditions_stopped` tinyint(1) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `field` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('boolean','integer','string','array') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'string',
  `range` enum('global','user','course') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'global',
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `config` (`field`, `value`, `type`, `range`, `section`, `mkdate`, `chdate`, `description`) VALUES
('ACCESSKEY_ENABLE',	'',	'boolean',	'user',	'',	0,	0,	'Schaltet die Nutzung von Shortcuts für einen User ein oder aus, Systemdefault'),
('ADMIN_COURSES_SHOW_COMPLETE',	'0',	'boolean',	'global',	'global',	1462287310,	1462287310,	'Definiert, ob auf der Admin-Veranstaltunggseite der Komplett-Status für Veranstaltungen aufgeführt sein soll'),
('ADMISSION_PRELIM_COMMENT_ENABLE',	'0',	'boolean',	'global',	'',	1153814966,	1153814966,	'Schaltet ein oder aus, ob ein Nutzer im Modus \"Vorläufiger Eintrag\" eine Bemerkung hinterlegen kann'),
('AJAX_AUTOCOMPLETE_DISABLED',	'0',	'boolean',	'global',	'',	1293118060,	1293118060,	'Sollen alle QuickSearches deaktiviertes Autocomplete haben? Wenn es zu Performanceproblemen kommt, kann es sich lohnen, diese Variable auf true zu stellen.'),
('ALLOW_ADMIN_USERACCESS',	'1',	'boolean',	'global',	'permissions',	1240427632,	1240427632,	'Wenn eingeschaltet, dürfen Administratoren sensible persönliche Angaben wie z.B. Passwörter ändern.'),
('ALLOW_CHANGE_EMAIL',	'1',	'boolean',	'global',	'permissions',	1510849314,	1510849314,	'If true, users are allowed to change their email'),
('ALLOW_CHANGE_NAME',	'1',	'boolean',	'global',	'permissions',	1510849314,	1510849314,	'If true, users are allowed to change their name'),
('ALLOW_CHANGE_TITLE',	'1',	'boolean',	'global',	'permissions',	1510849314,	1510849314,	'If true, users are allowed to change their titles'),
('ALLOW_CHANGE_USERNAME',	'1',	'boolean',	'global',	'permissions',	1510849314,	1510849314,	'If true, users are allowed to change their username'),
('ALLOW_DOZENT_COURSESET_ADMIN',	'0',	'boolean',	'global',	'coursesets',	1403258021,	1403258021,	'Sollen Lehrende einrichtungsweite Anmeldesets anlegen und bearbeiten dürfen?'),
('ALLOW_DOZENT_DELETE',	'0',	'boolean',	'global',	'permissions',	0,	1109946684,	'Schaltet ein oder aus, ob ein Dozent eigene Veranstaltungen selbst löschen darf oder nicht'),
('ALLOW_DOZENT_VISIBILITY',	'0',	'boolean',	'global',	'permissions',	0,	0,	'Schaltet ein oder aus, ob ein Dozent eigene Veranstaltungen selbst verstecken darf oder nicht'),
('ALLOW_SELFASSIGN_INSTITUTE',	'1',	'boolean',	'global',	'permissions',	1240427632,	1240427632,	'Wenn eingeschaltet, dürfen Studenten sich selbst Einrichtungen an denen sie studieren zuordnen.'),
('ALLOW_SELFASSIGN_STUDYCOURSE',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'If true, students are allowed to set or change their studycourse (studiengang)'),
('API_ENABLED',	'1',	'boolean',	'global',	'global',	1403258019,	1403258019,	'Schaltet die REST-API an'),
('API_OAUTH_AUTH_PLUGIN',	'Standard',	'string',	'global',	'global',	1403258019,	1403258019,	'Definiert das für OAuth verwendete Authentifizierungsverfahren'),
('AUTO_INSERT_SEM_PARTICIPANTS_VIEW_PERM',	'tutor',	'string',	'global',	'global',	1311411856,	1311411856,	'Ab welchem Status soll in Veranstaltungen mit automatisch eingetragenen Nutzern der Teilnehmerreiter zu sehen sein?'),
('AUX_RULE_ADMIN_PERM',	'admin',	'string',	'global',	'permissions',	1240427632,	1240427632,	'mit welchem Status dürfen Zusatzangaben definiert werden (admin, root)'),
('BANNER_ADS_ENABLE',	'0',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob die Bannerwerbung global verfügbar ist.'),
('CALENDAR_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob der Kalender global verfügbar ist.'),
('CALENDAR_GRANT_ALL_INSERT',	'0',	'boolean',	'global',	'modules',	1462287762,	1462287762,	'Ermöglicht das Eintragen von Terminen in alle Nutzerkalender, ohne Beachtung des Rechtesystems.'),
('CALENDAR_GROUP_ENABLE',	'0',	'boolean',	'global',	'modules',	1326799692,	1326799692,	'Schaltet die Gruppenterminkalender-Funktionen ein.'),
('CALENDAR_SETTINGS',	'{\"view\":\"week\",\"start\":\"9\",\"end\":\"20\",\"step_day\":\"900\",\"step_week\":\"1800\",\"type_week\":\"LONG\",\"step_week_group\":\"3600\",\"step_day_group\":\"3600\"}',	'array',	'user',	'',	1403258015,	1403258015,	'persönliche Einstellungen des Kalenders'),
('CONSULTATION_ALLOW_DOCENTS_RESERVING',	'0',	'boolean',	'global',	'Sprechstunden',	1557244743,	1557244743,	'Dozenten können sich bei anderen Dozenten anmelden'),
('CONSULTATION_ENABLED',	'0',	'boolean',	'global',	'Sprechstunden',	1557244743,	1557244743,	'Schaltet die Sprechstunden global ein'),
('CONSULTATION_EXCLUDE_EXPIRED',	'1',	'boolean',	'user',	'global',	1573236813,	1573236813,	'Sprechstunden: Sollen abgelaufene Blöcke ausgeblendet werden'),
('CONSULTATION_REQUIRED_PERMISSION',	'dozent',	'string',	'global',	'Sprechstunden',	1557244743,	1557244743,	'Ab welcher Rechtestufe dürfen Nutzer Sprechstunden anlegen (user, autor, tutor, dozent, admin, root)'),
('CONSULTATION_SEND_MESSAGES',	'1',	'boolean',	'user',	'Sprechstunden',	1557244743,	1557244743,	'Nachrichten empfangen über Buchungen/Stornierungen'),
('CONVERT_IDNA_URL',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'If true, urls with german \"umlauts\" are converted'),
('COURSE_CALENDAR_ENABLE',	'0',	'boolean',	'global',	'modules',	1326799692,	1326799692,	'Kalender als Inhaltselement in Veranstaltungen.'),
('COURSE_NUMBER_FORMAT',	'',	'string',	'global',	'global',	1510849314,	1510849314,	'Erlaubt das Eintragen eines regulären Ausdrucks zur Validierung einer Veranstaltungsnummer. Im Kommentarfeld kann ein entsprechender Hilfetext hinterlegt werden.'),
('COURSE_PUBLIC_TOPICS',	'0',	'boolean',	'course',	'',	1543856103,	1543856103,	'Über diese Option können Sie die Themen einer Veranstaltung öffentlich einsehbar machen.'),
('COURSE_SEARCH_IS_VISIBLE_NOBODY',	'0',	'boolean',	'global',	'coursesearch',	1543856104,	1543856104,	'Soll die Veranstaltungssuche auch für nobody (ohne Anmeldung) sichtbar sein?'),
('COURSE_SEARCH_NAVIGATION_OPTIONS',	'{\"courses\":{\"visible\":true,\"target\":\"sidebar\"},\"semtree\":{\"visible\":true,\"target\":\"sidebar\"},\"rangetree\":{\"visible\":true,\"target\":\"sidebar\"},\"module\":{\"visible\":true,\"target\":\"sidebar\"}}',	'array',	'global',	'coursesearch',	1543856104,	1543856104,	'Aktivierung und Reihenfolge der Navigationsoptionen in der Veranstaltungssuche'),
('COURSE_SEARCH_SHOW_ADMISSION_STATE',	'0',	'boolean',	'global',	'coursesearch',	1543856104,	1543856104,	'Anzeige des Zugangsstatus in der Veranstaltungssuche als Icon.'),
('COURSE_SEM_TREE_CLOSED_LEVELS',	'[1]',	'array',	'global',	'global',	1416496270,	1416496270,	'Gibt an, welche Ebenen der Studienbereichszuordnung geschlossen bleiben sollen'),
('COURSE_SEM_TREE_DISPLAY',	'0',	'boolean',	'global',	'global',	1416496270,	1416496270,	'Zeigt den Studienbereichsbaum als Baum an'),
('COURSE_STUDENT_MAILING',	'0',	'boolean',	'course',	'',	1530289048,	1530289048,	'Über diese Option können Sie Studierenden das Schreiben von Nachrichten an alle anderen Teilnehmer der Veranstaltung erlauben.'),
('CRONJOBS_ENABLE',	'1',	'boolean',	'global',	'global',	1403258015,	1403258015,	'Schaltet die Cronjobs an'),
('CRONJOBS_ESCALATION',	'6000',	'integer',	'global',	'global',	1403258015,	1403258015,	'Gibt an, nach wievielen Sekunden ein Cronjob als steckengeblieben angesehen wird'),
('CURRENT_LOGIN_TIMESTAMP',	'0',	'integer',	'user',	'',	1403258015,	1403258015,	'Zeitstempel des Logins'),
('DEFAULT_LANGUAGE',	'de_DE',	'string',	'global',	'global',	1510849314,	1510849314,	'Which language should we use if we can gather no information from user?'),
('DEFAULT_TIMEZONE',	'Europe/Berlin',	'string',	'global',	'global',	1510849314,	1510849314,	'What timezone should be used (default: Europe/Berlin)?'),
('DEPUTIES_DEFAULTENTRY_ENABLE',	'0',	'boolean',	'global',	'deputies',	1293118059,	1293118059,	'Dürfen Lehrende Standardvertretungen festlegen? Diese werden automatisch bei Hinzufügen von Lehrenden als Vertretung in Veranstaltungen eingetragen.'),
('DEPUTIES_EDIT_ABOUT_ENABLE',	'1',	'boolean',	'global',	'deputies',	1293118059,	1293118059,	'Dürfen Lehrende ihren Standardvertretungen erlauben, ihr Profil zu bearbeiten?'),
('DEPUTIES_ENABLE',	'0',	'boolean',	'global',	'deputies',	1293118059,	1293118059,	'Legt fest, ob die Funktion Vertretung aktiviert ist.'),
('DOZENT_ALWAYS_VISIBLE',	'1',	'boolean',	'global',	'privacy',	1293118059,	1293118059,	'Legt fest, ob Personen mit Dozentenrechten immer global sichtbar sind und das auch nicht selbst ändern können.'),
('ELEARNING_INTERFACE_ENABLE',	'0',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob die Lernmodule global verfügbar sind.'),
('EMAIL_DOMAIN_RESTRICTION',	'',	'string',	'global',	'',	1157107088,	1157107088,	'Beschränkt die gültigkeit von Email-Adressen bei freier Registrierung auf die angegebenen Domains. Komma-separierte Liste von Domains ohne vorangestelltes @.'),
('EMAIL_VISIBILITY_DEFAULT',	'1',	'boolean',	'global',	'privacy',	1326799691,	1326799691,	'Ist die eigene Emailadresse sichtbar, falls der Nutzer nichts anderes eingestellt hat?'),
('ENABLE_ARCHIVE_SEARCH',	'0',	'boolean',	'global',	'global',	1557244743,	1557244743,	'Soll es eine Suche in dem alten Archiv geben?'),
('ENABLE_COURSESET_FCFS',	'1',	'boolean',	'global',	'coursesets',	1403258021,	1403258021,	'Soll first-come-first-served (Windhundverfahren) bei der Anmeldung erlaubt sein?'),
('ENABLE_FREE_ACCESS',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'If true, courses with public access are available'),
('ENABLE_PROTECTED_DOWNLOAD_RESTRICTION',	'0',	'boolean',	'global',	'files',	1257956185,	1257956185,	'Schaltet die Überprüfung (fester Teilnehmerkreis) bei Download von als geschützt markierten Dateien ein'),
('ENABLE_REQUEST_NEW_PASSWORD_BY_USER',	'1',	'boolean',	'global',	'permissions',	1510849314,	1510849314,	'If true, users are able to request a new password themselves'),
('ENABLE_SELF_REGISTRATION',	'1',	'boolean',	'global',	'permissions',	1510849314,	1510849314,	'Should it be possible for an user to register himself'),
('ENABLE_SKYPE_INFO',	'1',	'boolean',	'global',	'privacy',	1170242666,	1170242666,	'Ermöglicht die Eingabe / Anzeige eines Skype Namens '),
('ENTRIES_PER_PAGE',	'20',	'integer',	'global',	'global',	1311411856,	1311411856,	'Anzahl von Einträgen pro Seite'),
('EVAL_AUSWERTUNG_CONFIG_ENABLE',	'1',	'boolean',	'global',	'evaluation',	1141225624,	1141225624,	'Ermöglicht es dem Nutzer, die grafische Darstellung der Evaluationsauswertung zu konfigurieren'),
('EVAL_AUSWERTUNG_GRAPH_FORMAT',	'png',	'string',	'global',	'evaluation',	1141225624,	1141225624,	'Das Format, in dem die Diagramme der grafischen Evaluationsauswertung erstellt werden (jpg, png, gif).'),
('EXPORT_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob der Export global verfügbar ist.'),
('EXTERNAL_HELP',	'1',	'boolean',	'global',	'',	1155128579,	1155128579,	'Schaltet das externe Hilfesystem ein'),
('EXTERNAL_HELP_LOCATIONID',	'default',	'string',	'global',	'',	1155128579,	1155128579,	'Eine eindeutige ID zur Identifikation der gewünschten Hilfeseiten, leer bedeutet Standardhilfe'),
('EXTERNAL_HELP_URL',	'https://hilfe.studip.de/index.php/%s',	'string',	'global',	'',	1155128579,	1155128579,	'URL Template für das externe Hilfesystem'),
('EXTERN_ALLOW_ACCESS_WITHOUT_CONFIG',	'0',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Free access to external pages (without the need of a configuration), independent of SRI settings above'),
('EXTERN_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob die externen Seiten global verfügbar sind.'),
('EXTERN_SRI_ENABLE',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Allow the usage of SRI-interface (Stud.IP Remote Include)'),
('EXTERN_SRI_ENABLE_BY_ROOT',	'0',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Only root allows the usage of SRI-interface for specific institutes'),
('FOP_ENABLE',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Soll Export mit FOP erlaubt sein?'),
('FORUM_ANONYMOUS_POSTINGS',	'0',	'boolean',	'global',	'privacy',	1293118059,	1293118059,	'Legt fest, ob Forenbeiträge anonym verfasst werden dürfen (Root sieht aber immer den Urheber).'),
('FORUM_SETTINGS',	'{\"neuauf\":false,\"rateallopen\":true,\"showimages\":true,\"sortthemes\":\"last\",\"themeview\":\"mixed\",\"presetview\":\"mixed\",\"shrink\":604800}',	'array',	'user',	'',	1403258015,	1403258015,	'persönliche Einstellungen Forum'),
('GLOBALSEARCH_ASYNC_QUERIES',	'1',	'boolean',	'global',	'globalsearch',	1530289048,	1530289048,	'Sollen die Suchanfragen asynchron über mysqli gestellt werden? Andernfalls wird PDO verwendet.'),
('GLOBALSEARCH_MAX_RESULT_OF_TYPE',	'3',	'integer',	'global',	'globalsearch',	1530289048,	1530289048,	'Wie viele Ergebnisse sollen in der globalen Schnellsuche pro Kategorie angezeigt werden?'),
('GLOBALSEARCH_MODULES',	'{\"GlobalSearchBuzzwords\":{\"order\":1,\"active\":true,\"fulltext\":false},\"GlobalSearchMyCourses\":{\"order\":2,\"active\":true,\"fulltext\":false},\"GlobalSearchCourses\":{\"order\":3,\"active\":true,\"fulltext\":false},\"GlobalSearchUsers\":{\"order\":4,\"active\":true,\"fulltext\":false},\"GlobalSearchInstitutes\":{\"order\":5,\"active\":true,\"fulltext\":false},\"GlobalSearchFiles\":{\"order\":6,\"active\":true,\"fulltext\":false},\"GlobalSearchCalendar\":{\"order\":7,\"active\":true,\"fulltext\":false},\"GlobalSearchMessages\":{\"order\":8,\"active\":true,\"fulltext\":false},\"GlobalSearchForum\":{\"order\":9,\"active\":true,\"fulltext\":false},\"GlobalSearchResources\":{\"order\":10,\"active\":true,\"fulltext\":false},\"GlobalSearchRoomAssignments\":{\"order\":11,\"active\":true,\"fulltext\":false},\"GlobalSearchModules\":{\"order\":12,\"active\":true,\"fulltext\":false}}',	'array',	'global',	'globalsearch',	1530289048,	1530289048,	'Aktivierung und Reihenfolge der Module in der globalen Suche'),
('HELP_CONTENT_CURRENT_VERSION',	'3.1',	'string',	'global',	'global',	1416496271,	1416496271,	'Aktuelle Version der Helpbar-Einträge in Stud.IP'),
('HOMEPAGEPLUGIN_DEFAULT_ACTIVATION',	'1',	'boolean',	'global',	'privacy',	1403258014,	1403258014,	'Sollen neu installierte Homepageplugins automatisch für Benutzer aktiviert sein?'),
('HOMEPAGE_VISIBILITY_DEFAULT',	'VISIBILITY_STUDIP',	'string',	'global',	'privacy',	1293118059,	1293118059,	'Standardsichtbarkeit für Homepageelemente, falls der Benutzer nichts anderes eingestellt hat. Gültige Werte sind: VISIBILITY_ME, VISIBILITY_BUDDIES, VISIBILITY_DOMAIN, VISIBILITY_STUDIP, VISIBILITY_EXTERN'),
('ILIAS_INTERFACE_BASIC_SETTINGS',	'{\"moduletitle\":\"ILIAS\",\"edit_moduletitle\":false,\"search_active\":true,\"show_offline\":false,\"cache\":true}',	'array',	'global',	'modules',	1557244743,	1557244743,	''),
('ILIAS_INTERFACE_ENABLE',	'0',	'boolean',	'global',	'modules',	1557244743,	1557244743,	''),
('ILIAS_INTERFACE_MODULETITLE',	'ILIAS',	'string',	'course',	'modules',	1557244743,	1557244743,	''),
('ILIAS_INTERFACE_SETTINGS',	'[]',	'array',	'global',	'modules',	1557244743,	1557244743,	''),
('IMPORTANT_SEMNUMBER',	'0',	'boolean',	'global',	'global',	1403258018,	1403258018,	'Zeigt die Veranstaltungsnummer prominenter in der Suche und auf der Meine Veranstaltungen Seite an'),
('INST_FAK_ADMIN_PERMS',	'all',	'string',	'global',	'permissions',	1293118059,	1293118059,	'\"none\" Fakultätsadmin darf Einrichtungen weder anlegen noch löschen, \"create\" Fakultätsadmin darf Einrichtungen anlegen, aber nicht löschen, \"all\" Fakultätsadmin darf Einrichtungen anlegen und löschen.'),
('LAST_LOGIN_TIMESTAMP',	'0',	'integer',	'user',	'',	1403258015,	1403258015,	'Zeitstempel des vorherigen Logins'),
('LITERATURE_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob die Literaturverwaltung global verfügbar ist.'),
('LOAD_EXTERNAL_MEDIA',	'deny',	'string',	'global',	'',	1293118060,	1293118060,	'Sollen externe Medien über [img/flash/audio/video] eingebunden werden? deny=nicht erlaubt, allow=erlaubt, proxy=proxy benutzen.'),
('LOCK_RULE_ADMIN_PERM',	'admin',	'string',	'global',	'permissions',	1240427632,	1240427632,	'mit welchem Status dürfen Sperrebenen angepasst werden (admin, root)'),
('LOG_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob das Log global verfügbar ist.'),
('LTI_TOOL_TITLE',	'LTI-Tool',	'string',	'course',	'',	1557244743,	1557244743,	'Voreinstellung für den Titel des Reiters \"LTI-Tool\" im Kurs.'),
('MAILQUEUE_ENABLE',	'0',	'boolean',	'global',	'global',	1403258017,	1403258017,	'Aktiviert bzw. deaktiviert die Mailqueue'),
('MAILQUEUE_SEND_LIMIT',	'0',	'integer',	'global',	'global',	1462287310,	1462287310,	'Wieviele Mails soll die Mailqueue maximal auf einmal an den Mailserver schicken. 0 für unendlich viele.'),
('MAIL_AS_HTML',	'0',	'boolean',	'user',	'',	1293118060,	1293118060,	'Benachrichtigungen werden im HTML-Format versandt'),
('MAIL_NOTIFICATION_ENABLE',	'0',	'boolean',	'global',	'',	1122996278,	1122996278,	'Informationen über neue Inhalte per email verschicken'),
('MAIL_USE_SUBJECT_PREFIX',	'1',	'boolean',	'global',	'global',	1543856103,	1543856103,	'Stellt dem Titel von per Mail versandten Nachrichten den Wert von UNI_NAME_CLEAN voran.'),
('MAINTENANCE_MODE_ENABLE',	'0',	'boolean',	'global',	'',	1130840930,	1130840930,	'Schaltet das System in den Wartungsmodus, so dass nur noch Administratoren Zugriff haben'),
('MEDIA_CACHE_LIFETIME',	'86400',	'integer',	'global',	'global',	1510849314,	1510849314,	'Wieviele Sekunden soll gecached werden?'),
('MEDIA_CACHE_MAX_FILES',	'3000',	'integer',	'global',	'global',	1510849314,	1510849314,	'Wieviele Dateien sollen maximal gecached werden?'),
('MEDIA_CACHE_MAX_LENGTH',	'1000000',	'integer',	'global',	'global',	1510849314,	1510849314,	'Maximale Größe von Dateien, die im Media-Cache gecached werden (in Bytes)?'),
('MESSAGE_PRIORITY',	'0',	'boolean',	'global',	'',	1240427632,	1240427632,	'If enabled, messages of high priority are displayed reddish'),
('MESSAGING_SETTINGS',	'{\"show_only_buddys\":false,\"delete_messages_after_logout\":false,\"timefilter\":\"30d\",\"opennew\":1,\"logout_markreaded\":false,\"openall\":false,\"addsignature\":false,\"save_snd\":true,\"sms_sig\":\"\",\"send_view\":false,\"confirm_reading\":3,\"send_as_email\":false,\"folder\":{\"in\":[\"dummy\"],\"out\":[\"dummy\"]}}',	'array',	'user',	'',	1403258015,	1403258015,	'persönliche Einstellungen Nachrichtenbereich'),
('MVV_ACCESS_ASSIGN_LVGRUPPEN',	'admin',	'string',	'global',	'modules',	1483462780,	1483462780,	'Ab welchem Rechtestatus können Veranstaltungen Modulen (LV-Gruppen) zugeordnet werden. Bei Angabe von fakadmin darf nur dieser Zuordnungen vornehmen.'),
('MVV_ALLOW_CREATE_LVGRUPPEN_INDEPENDENTLY',	'0',	'boolean',	'global',	'',	1573236812,	1573236812,	'Soll das Anlegen von LV-Gruppen unabhängig von bestehenden Modulteilen auf der Verwaltungsseite für LV-Gruppen möglich sein?'),
('MY_COURSES_DEFAULT_CYCLE',	'last',	'string',	'global',	'MeineVeranstaltungen',	1462287310,	1462287310,	'Standardeinstellung für den Semester-Filter, falls noch keine Auswahl getätigt wurde. (all, future, current, last)'),
('MY_COURSES_ENABLE_ALL_SEMESTERS',	'1',	'boolean',	'global',	'MeineVeranstaltungen',	1416496224,	1416496224,	'Ermöglicht die Anzeige von allen Semestern unter meine Veranstaltungen.'),
('MY_COURSES_ENABLE_STUDYGROUPS',	'0',	'boolean',	'global',	'MeineVeranstaltungen',	1416496224,	1416496224,	'Sollen Studiengruppen in einem eigenen Bereich angezeigt werden (Neues Navigationelement in Meine Veranstaltungen)?.'),
('MY_COURSES_FORCE_GROUPING',	'sem_number',	'string',	'global',	'',	1293118059,	1293118059,	'Legt fest, ob die persönliche Veranstaltungsübersicht systemweit zwangsgruppiert werden soll, wenn keine eigene Gruppierung eingestellt ist. Werte: not_grouped, sem_number, sem_tree_id, sem_status, gruppe, dozent_id.'),
('MY_COURSES_GROUPING',	'',	'string',	'user',	'',	1403258015,	1403258015,	'Gruppierung der Veranstaltungsübersicht'),
('MY_COURSES_OPEN_GROUPS',	'[]',	'array',	'user',	'',	1403258015,	1403258015,	'geöffnete Gruppen der Veranstaltungsübersicht'),
('MY_INSTITUTES_DEFAULT',	'',	'string',	'user',	'',	1403258015,	1403258015,	'Standard Einrichtung in der Veranstaltungsübersicht für Admins'),
('MY_INSTITUTES_INCLUDE_CHILDREN',	'1',	'boolean',	'user',	'',	1530289048,	1530289048,	'Sollen untergeordnete Institute mit angezeigt werden in der Veranstaltungsübersicht für Admins?'),
('NEWS_DISABLE_GARBAGE_COLLECT',	'0',	'boolean',	'global',	'',	1123751948,	1123751948,	'Schaltet den Garbage-Collect für News ein oder aus'),
('NEWS_DISPLAY',	'2',	'integer',	'global',	'view',	1462287310,	1462287310,	'Legt fest, wie sich News für Anwender präsentieren. (2 zeigt sowohl Autor als auch Zugriffszahlen an. 1 zeigt nur den Autor an. 0 blendet beides für Benutzer aus.'),
('NEWS_RSS_EXPORT_ENABLE',	'1',	'boolean',	'global',	'',	0,	0,	'Schaltet die Möglichkeit des rss-Export von privaten News global ein oder aus'),
('NEW_INDICATOR_THRESHOLD',	'180',	'integer',	'global',	'global',	1448561064,	1448561064,	'Gibt an, nach wieviel Tagen ein Eintrag als alt angesehen und nicht mehr rot markiert werden soll (0 angeben, um nur das tatsäcliche Alter) zu betrachten.'),
('NOTIFY_ON_WAITLIST_ADVANCE',	'1',	'boolean',	'global',	'global',	1543856103,	1543856103,	'Versendet Nachrichten an Teilnehmer bei jeder Änderung der Position auf der Warteliste'),
('ONLINE_NAME_FORMAT',	'full_rev',	'string',	'user',	'',	1153814980,	1153814980,	'Default-Wert für wer-ist-online Namensformatierung'),
('ONLINE_VISIBILITY_DEFAULT',	'1',	'boolean',	'global',	'privacy',	1326799691,	1326799691,	'Sind Nutzer sichtbar in der Wer ist online-Liste, falls sie nichts anderes eingestellt haben?'),
('OPENGRAPH_ENABLE',	'1',	'boolean',	'global',	'global',	1403258018,	1403258018,	'De-/Aktiviert OpenGraph-Informationen und deren Abrufen.'),
('PDF_LOGO',	'',	'string',	'global',	'global',	1311411856,	1311411856,	'Geben Sie hier den absoluten Pfad auf Ihrem Server (also ohne http) zu einem Logo an, das bei PDF-Exporten im Kopfbereich verwendet wird.'),
('PERSONAL_NOTIFICATIONS_ACTIVATED',	'1',	'boolean',	'global',	'privacy',	1403258015,	1403258015,	'Sollen persönliche Benachrichtigungen aktiviert sein?'),
('PERSONAL_STARTPAGE',	'0',	'integer',	'user',	'',	1403258015,	1403258015,	'Persönliche Startseite'),
('PLUGINADMIN_DISPLAY_SETTINGS',	'{\"plugin_filter\":null,\"core_filter\":\"yes\"}',	'array',	'user',	'',	1483462779,	1483462779,	'Speichert die Darstellungseinstellungen der Pluginadministration'),
('PLUS_SETTINGS',	'[]',	'array',	'user',	'',	1436547919,	1436547919,	'Nutzer Konfiguration für Plusseite'),
('PRIVACY_CONTACT',	'root@studip',	'string',	'global',	'privacy',	1543856104,	1543856104,	'Username der Kontaktperson zum Datenschutz'),
('PRIVACY_PERM',	'root',	'string',	'global',	'privacy',	1543856104,	1543856104,	'Rechtestufe zum Datenzugriff'),
('PRIVACY_URL',	'dispatch.php/siteinfo/show/1/7',	'string',	'global',	'privacy',	1543856104,	1543856104,	'URL zur Datenschutzerklärung'),
('PROFILE_LAST_VISIT',	'0',	'integer',	'user',	'',	1403258015,	1403258015,	'Zeitstempel des letzten Besuchs der Profilseite'),
('PROPOSED_TEACHER_LABELS',	'',	'string',	'global',	'global',	1326799692,	1326799692,	'Write a list of comma separated possible labels for teachers and tutor here.'),
('RANGE_TREE_ADMIN_PERM',	'admin',	'string',	'global',	'permissions',	1219328498,	1219328498,	'mit welchem Status darf die Einrichtungshierarchie bearbeitet werden (admin oder root)'),
('RESOURCES_ALLOW_CREATE_ROOMS',	'2',	'integer',	'global',	'resources',	0,	1100709567,	'Welche Rechstufe darf  Räume anlegen? 1 = Nutzer ab Status tutor, 2 = Nutzer ab Status admin, 3 = nur Ressourcenadministratoren'),
('RESOURCES_ALLOW_CREATE_TOP_LEVEL',	'',	'boolean',	'global',	'resources',	0,	0,	'Schaltet für die Ressourcenverwaltung ein, ob neue Hierachieebenen von anderen Nutzern als Admins angelegt werden können oder nicht'),
('RESOURCES_ALLOW_DELETE_REQUESTS',	'1',	'boolean',	'global',	'resources',	1136826903,	1136826903,	'Erlaubt das Löschen von Raumanfragen für globale Ressourcenadmins'),
('RESOURCES_ALLOW_ROOM_PROPERTY_REQUESTS',	'1',	'boolean',	'global',	'resources',	0,	1074780851,	'Schaltet in der Ressourcenverwaltung die Möglichkeit, im Rahmen einer Anfrage Raumeigenschaften zu wünschen, ein oder aus'),
('RESOURCES_ALLOW_ROOM_REQUESTS',	'1',	'boolean',	'global',	'resources',	0,	1100709567,	'Schaltet in der Ressourcenverwaltung das System zum Stellen und Bearbeiten von Raumanfragen ein oder aus'),
('RESOURCES_ALLOW_ROOM_REQUESTS_ALL_ROOMS',	'1',	'boolean',	'global',	'resources',	1257956185,	1257956185,	'Schaltet in der Ressourcenverwaltung ein,ob alle Räume gewünscht werden können, oder nur eigene und \'Global\' gesetzte'),
('RESOURCES_ALLOW_SINGLE_ASSIGN_PERCENTAGE',	'50',	'integer',	'global',	'resources',	0,	1100709567,	'Wert (in Prozent), ab dem ein Raum mit Einzelbelegungen (statt Serienbelegungen) gefüllt wird, wenn dieser Anteil an möglichen Belegungen bereits durch andere Belegungen zu Überschneidungen führt'),
('RESOURCES_ALLOW_SINGLE_DATE_GROUPING',	'5',	'integer',	'global',	'resources',	0,	1100709567,	'Anzahl an Einzeltermine, ab der diese als Gruppe zusammengefasst bearbeitet werden'),
('RESOURCES_ALLOW_VIEW_RESOURCE_OCCUPATION',	'1',	'boolean',	'global',	'resources',	1462287310,	1462287310,	'Dürfen alle Nutzer Ressourcenbelegungen einsehen?'),
('RESOURCES_ENABLE',	'0',	'boolean',	'global',	'',	0,	0,	'Enable the Stud.IP resource management module'),
('RESOURCES_ENABLE_GROUPING',	'1',	'boolean',	'global',	'resources',	0,	1121861801,	'Schaltet in der Ressourcenverwaltung die Funktion zur Verwaltung von Raumgruppen ein oder aus'),
('RESOURCES_ENABLE_ORGA_CLASSIFY',	'1',	'boolean',	'global',	'resources',	0,	1100709567,	'Schaltet in der Ressourcenverwaltung das Einordnen von Ressourcen in Orga-Struktur (ohne Rechtevergabe) ein oder aus'),
('RESOURCES_ENABLE_SEM_SCHEDULE',	'1',	'boolean',	'global',	'resources',	0,	0,	'Schaltet in der Ressourcenverwaltung ein, ob ein Semesterbelegungsplan erstellt werden kann'),
('RESOURCES_ENABLE_VIRTUAL_ROOM_GROUPS',	'1',	'boolean',	'global',	'resources',	0,	0,	'Schaltet in der Ressourcenverwaltung automatische gebildete Raumgruppen neben per Konfigurationsdatei definierten Gruppen ein oder aus'),
('RESOURCES_HIDE_PAST_SINGLE_DATES',	'1',	'boolean',	'global',	'resources',	1257956185,	1257956185,	'Schaltet in der Ressourcenverwaltung ein,ob bereits vergangene Terminen bei der Buchung und Planung brücksichtigt werden sollen'),
('RESOURCES_INHERITANCE_PERMS',	'1',	'integer',	'global',	'resources',	0,	1100709567,	'Art der Rechtevererbung in der Ressourcenverwaltung für Ressourcen (nicht Räume): 1 = lokale Rechte der Einrichtung und Veranstaltung werden übertragen, 2 = nur Autorenrechte werden vergeben, 3 = es werden keine Rechte vergeben'),
('RESOURCES_INHERITANCE_PERMS_ROOMS',	'1',	'integer',	'global',	'resources',	0,	1100709567,	'Art der Rechtevererbung in der Ressourcenverwaltung für Räume: 1 = lokale Rechte der Einrichtung und Veranstaltung werden übertragen, 2 = nur Autorenrechte werden vergeben, 3 = es werden keine Rechte vergeben'),
('RESOURCES_LOCKING_ACTIVE',	'',	'boolean',	'global',	'resources',	0,	1100709567,	'Schaltet in der Ressourcenverwaltung das Blockieren der Bearbeitung für einen Zeitraum aus (nur Admins dürfen in dieser Zeit auf die Belegung zugreifen)'),
('RESOURCES_ROOM_REQUEST_DEFAULT_ACTION',	'NO_ROOM_INFO_ACTION',	'string',	'global',	'resources',	0,	0,	'Designates the pre-selected action for the room request dialog'),
('RESOURCES_ROOM_REQUEST_DEFAULT_SEATS',	'0',	'integer',	'global',	'resources',	1557244742,	1557244742,	'Vorbelegung der Sitzplatzanzahl einer Raumanfrage, falls der Kurs keine max. Teilnehmerzahl hat'),
('RESOURCES_SCHEDULE_EXPLAIN_USER_NAME',	'1',	'boolean',	'global',	'resources',	1123516671,	1123516671,	'Schaltet in der Ressourcenverwaltung die Anzeige der Namen des Belegers in der Ausgabe von Belegungsplänen ein oder aus'),
('RESOURCES_SEARCH_ONLY_REQUESTABLE_PROPERTY',	'1',	'boolean',	'global',	'resources',	0,	0,	'Schaltet in der Suche der Ressourcenverwaltun das Durchsuchen von nicht wünschbaren Eigenschaften ein oder aus'),
('RESOURCES_SHOW_ROOM_NOT_BOOKED_HINT',	'0',	'boolean',	'global',	'resources',	1168444600,	1168444600,	'Einstellung, ob bei aktivierter Raumverwaltung Raumangaben die nicht gebucht sind gekennzeichnet werden'),
('RESTRICTED_USER_MANAGEMENT',	'0',	'boolean',	'global',	'permissions',	1240427632,	1240427632,	'Schränkt Zugriff auf die globale Nutzerverwaltung auf root ein'),
('SCHEDULE_ENABLE',	'1',	'boolean',	'global',	'modules',	1326799692,	1326799692,	'Schaltet ein oder aus, ob der Stundenplan global verfügbar ist.'),
('SCHEDULE_SETTINGS',	'{\"glb_start_time\":8,\"glb_end_time\":19,\"glb_days\":{\"1\":1,\"2\":2,\"3\":3,\"4\":4,\"5\":5,\"6\":6,\"0\":0},\"glb_sem\":null,\"converted\":true}',	'array',	'user',	'',	1403258015,	1403258015,	'persönliche Einstellungen Stundenplan'),
('SCM_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob freie Informationsseiten global verfügbar sind.'),
('SCORE_ENABLE',	'1',	'boolean',	'global',	'modules',	1403258021,	1403258021,	'Schaltet ein oder aus, ob die Rangliste und die Score-Funktion global verfügbar sind.'),
('SEARCH_VISIBILITY_DEFAULT',	'1',	'boolean',	'global',	'privacy',	1326799691,	1326799691,	'Sind Nutzer auffindbar in der Personensuche, falls sie nichts anderes eingestellt haben?'),
('SEMESTER_ADMINISTRATION_ENABLE',	'1',	'boolean',	'global',	'',	1219328498,	1219328498,	'schaltet die Semesterverwaltung ein oder aus'),
('SEMESTER_TIME_SWITCH',	'0',	'integer',	'global',	'',	1140013696,	1140013696,	'Anzahl der Wochen vor Semesterende zu dem das vorgewählte Semester umspringt'),
('SEM_CREATE_PERM',	'dozent',	'string',	'global',	'permissions',	1170242930,	1170242930,	'Bestimmt den globalen Nutzerstatus, ab dem Veranstaltungen angelegt werden dürfen (root,admin,dozent)'),
('SEM_TREE_ADMIN_PERM',	'admin',	'string',	'global',	'permissions',	1219328498,	1219328498,	'mit welchem Status darf die Veranstaltungshierarchie bearbeitet werden (admin oder root)'),
('SEM_TREE_ALLOW_BRANCH_ASSIGN',	'1',	'boolean',	'global',	'',	1222947575,	1222947575,	'Diese Option beeinflusst die Möglichkeit, Veranstaltungen entweder nur an die Blätter oder überall in der Veranstaltungshierarchie einhängen zu dürfen.'),
('SEM_TREE_SHOW_EMPTY_AREAS_PERM',	'user',	'string',	'global',	'permissions',	1240427632,	1240427632,	'Bestimmt den globalen Nutzerstatus, ab dem in der Veranstaltungssuche auch Bereiche angezeigt werden, denen keine Veranstaltungen zugewiesen sind.'),
('SEM_VISIBILITY_PERM',	'root',	'string',	'global',	'permissions',	1170242706,	1170242706,	'Bestimmt den globalen Nutzerstatus, ab dem versteckte Veranstaltungen in der Suche gefunden werden (root,admin,dozent)'),
('SENDFILE_LINK_MODE',	'normal',	'string',	'global',	'files',	1141212096,	1141212096,	'Format der Downloadlinks: normal=sendfile.php?parameter=x, old=sendfile.php?/parameter=x, rewrite=download/parameter/file.txt'),
('SHOWSEM_ENABLE',	'1',	'boolean',	'user',	'',	1122461027,	1122461027,	'Einstellung für Nutzer, ob Semesterangaben in der Übersicht \"Meine Veranstaltung\" nach dem Titel der Veranstaltung gemacht werden; Systemdefault'),
('SHOW_ADRESSEES_LIMIT',	'20',	'string',	'global',	'global',	1530289048,	1530289048,	'Ab wievielen Adressaten dürfen diese aus datenschutzgründen nicht mehr angezeigt werden in einer empfangenen Nachricht?'),
('SHOW_TERMS_ON_FIRST_LOGIN',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'If true, the user has to accept the terms on his first login (this feature makes only sense, if you use disable ENABLE_SELF_REGISTRATION).'),
('SKIPLINKS_ENABLE',	'',	'boolean',	'user',	'privacy',	1311411856,	1311411856,	'Wählen Sie diese Option, um Skiplinks beim ersten Drücken der Tab-Taste anzuzeigen (Systemdefault).'),
('SMILEYADMIN_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob die Administration der Smileys verfügbar ist.'),
('SOAP_ENABLE',	'0',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Schaltet die SOAP-Schnittstelle an.'),
('SOAP_USE_PHP5',	'0',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Sollen PHP-Bibliotheken für SOAP verwendet werden?'),
('SORT_NEWS_BY_CHDATE',	'false',	'boolean',	'global',	'view',	1557244742,	1557244742,	'Wenn diese Einstellung gesetzt ist werden Ankündigungen nach ihrem letzten Änderungsdatum statt ihrem Erstellungsdatum sortiert angezeigt.'),
('STUDIP_INSTALLATION_ID',	'demo-installation',	'string',	'global',	'global',	1510849314,	1510849314,	'Unique identifier for installation'),
('STUDIP_SHORT_NAME',	'Stud.IP',	'string',	'global',	'global',	1436546684,	1436546684,	'Studip Kurzname'),
('STUDYGROUPS_ENABLE',	'0',	'boolean',	'global',	'studygroups',	1257956185,	1293118059,	'Schaltet ein oder aus, ob die Studiengruppen global verfügbar sind.'),
('STUDYGROUPS_INVISIBLE_ALLOWED',	'0',	'boolean',	'global',	'studygroups',	1403258018,	1403258018,	'Ermöglicht unsichtbare Studiengruppen'),
('STUDYGROUP_ACCEPTANCE_TEXT',	'Die Moderatorinnen und Moderatoren der Studiengruppe können Ihren Aufnahmewunsch bestätigen oder ablehnen. Erst nach Bestätigung erhalten Sie vollen Zugriff auf die Gruppe.',	'string',	'global',	'studygroups',	1448561064,	1448561064,	'Text, der angezeigt wird, wenn man sich in eine zugriffsbeschränkte Studiengruppe eintragen möchte'),
('STUDYGROUP_DEFAULT_INST',	'',	'string',	'global',	'studygroups',	1258042892,	1258042892,	'Die Standardeinrichtung für Studiengruppen kann hier gesetzt werden.'),
('STUDYGROUP_TERMS',	'Mir ist bekannt, dass ich die Gruppe nicht zu rechtswidrigen Zwecken nutzen darf. Dazu zählen u.a. Urheberrechtsverletzungen, Beleidigungen und andere Persönlichkeitsdelikte.\n\nIch erkläre mich damit einverstanden, dass Admins die Inhalte der Gruppe zu Kontrollzwecken einsehen dürfen.',	'string',	'global',	'studygroups',	1257956185,	1257956185,	'Hier werden die Nutzungsbedinungen der Studiengruppen hinterlegt.'),
('TFA_MAX_TRIES',	'3',	'integer',	'global',	'Zwei-Faktor-Authentifizierung',	1573236813,	1573236813,	'Maximale Anzahl fehlerhafter Versuche innerhalb eines Zeitraums'),
('TFA_MAX_TRIES_TIMESPAN',	'300',	'integer',	'global',	'Zwei-Faktor-Authentifizierung',	1573236813,	1573236813,	'Zeitraum in Sekunden, nach dem fehlerhafte Versuche vergessen werden'),
('TFA_PERMS',	'root',	'string',	'global',	'Zwei-Faktor-Authentifizierung',	1573236813,	1573236813,	'Systemrollen für die die Zwei-Faktor-Authentifizierung aktiviert ist (kommaseparierte Liste, mögliche Werte: autor, tutor, dozent, admin, root)'),
('TOURS_ENABLE',	'1',	'boolean',	'global',	'global',	1416496223,	1416496223,	'Aktiviert die Funktionen zum Anbieten von Touren in Stud.IP'),
('UNI_NAME_CLEAN',	'Stud.IP',	'string',	'global',	'global',	1510849314,	1510849314,	'Name der Stud.IP-Installation bzw. Hochschule.'),
('USERNAME_REGULAR_EXPRESSION',	'/^([a-zA-Z0-9_@.-]{4,})$/',	'string',	'global',	'global',	1510849314,	1510849314,	'Regex for allowed characters in usernames'),
('USER_VISIBILITY_CHECK',	'0',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Enable presentation of visibility decision texts for users after first login. see lib/include/header.php and lib/user_visible.inc.php for further info'),
('USER_VISIBILITY_UNKNOWN',	'1',	'boolean',	'global',	'privacy',	1153815901,	1153815901,	'Sollen Nutzer mit Sichtbarkeit \"unknown\" wie sichtbare behandelt werden?'),
('VOTE_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob die Umfragen global verfügbar sind.'),
('WEBSERVICES_ENABLE',	'0',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Schaltet die Webservice-Schnittstelle an.'),
('WIKI_COURSE_EDIT_RESTRICTED',	'0',	'boolean',	'course',	'',	1557244742,	1557244742,	'Legt fest, dass nur Teilnehmende ab Rechtestufe \"tutor\" das Wiki bearbeiten dürfen.'),
('WIKI_ENABLE',	'1',	'boolean',	'global',	'modules',	1293118059,	1293118059,	'Schaltet ein oder aus, ob das Wiki global verfügbar ist.'),
('WYSIWYG',	'1',	'boolean',	'global',	'global',	1403258021,	1403258021,	'Aktiviert den WYSIWYG Editor im JavaScript.'),
('XSLT_ENABLE',	'1',	'boolean',	'global',	'global',	1510849314,	1510849314,	'Soll Export mit XSLT angeschaltet sein?'),
('ZIP_DOWNLOAD_MAX_FILES',	'100',	'integer',	'global',	'files',	1219328498,	1219328498,	'Die maximale Anzahl an Dateien, die gezippt heruntergeladen werden kann'),
('ZIP_DOWNLOAD_MAX_SIZE',	'100',	'integer',	'global',	'files',	1219328498,	1219328498,	'Die maximale Größe aller Dateien, die zusammen in einem Zip heruntergeladen werden kann (in Megabytes).'),
('ZIP_UPLOAD_ENABLE',	'1',	'boolean',	'global',	'files',	1130840930,	1130840930,	'Ermöglicht es, ein Zip Archiv hochzuladen, welches automatisch entpackt wird'),
('ZIP_UPLOAD_MAX_DIRS',	'10',	'integer',	'global',	'files',	1130840962,	1130840962,	'Die maximale Anzahl an Verzeichnissen, die bei einem Zipupload automatisch entpackt werden'),
('ZIP_UPLOAD_MAX_FILES',	'100',	'integer',	'global',	'files',	1130840930,	1130840930,	'Die maximale Anzahl an Dateien, die bei einem Zipupload automatisch entpackt werden');

DROP TABLE IF EXISTS `config_values`;
CREATE TABLE `config_values` (
  `field` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`field`,`range_id`),
  KEY `field` (`field`,`value`(10)),
  KEY `range_id` (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `config_values` (`field`, `range_id`, `value`, `mkdate`, `chdate`, `comment`) VALUES
('CURRENT_LOGIN_TIMESTAMP',	'76ed43ef286fb55cf9e41beadb484a9f',	'1583167899',	1583167398,	1583167899,	''),
('LAST_LOGIN_TIMESTAMP',	'76ed43ef286fb55cf9e41beadb484a9f',	'1583167398',	1583167899,	1583167899,	''),
('STUDYGROUPS_ENABLE',	'studip',	'1',	1268739461,	1268739461,	'Studiengruppen'),
('STUDYGROUP_DEFAULT_INST',	'studip',	'ec2e364b28357106c0f8c282733dbe56',	1268739461,	1268739461,	''),
('STUDYGROUP_TERMS',	'studip',	'Mir ist bekannt, dass ich die Gruppe nicht zu rechtswidrigen Zwecken nutzen darf. Dazu zählen u.a. Urheberrechtsverletzungen, Beleidigungen und andere Persönlichkeitsdelikte.\r\n\r\nIch erkläre mich damit einverstanden, dass Admins die Inhalte der Gruppe zu Kontrollzwecken einsehen dürfen.',	1268739461,	1268739461,	''),
('TERMS_ACCEPTED',	'76ed43ef286fb55cf9e41beadb484a9f',	'1',	1583167903,	1583167903,	'');

DROP TABLE IF EXISTS `consultation_blocks`;
CREATE TABLE `consultation_blocks` (
  `block_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `start` int(11) unsigned NOT NULL,
  `end` int(11) unsigned NOT NULL,
  `room` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calendar_events` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT 'Create events for slots',
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` tinyint(2) unsigned NOT NULL DEFAULT 1 COMMENT 'How many people may book a slot',
  `course_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`block_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `consultation_bookings`;
CREATE TABLE `consultation_bookings` (
  `booking_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slot_id` int(11) unsigned NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_event_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `block_id` (`slot_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `consultation_slots`;
CREATE TABLE `consultation_slots` (
  `slot_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(11) unsigned NOT NULL,
  `start_time` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_event_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `owner_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`owner_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `content_terms_of_use_entries`;
CREATE TABLE `content_terms_of_use_entries` (
  `id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_condition` tinyint(2) NOT NULL,
  `icon` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_default` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(10) unsigned NOT NULL,
  `chdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `content_terms_of_use_entries` (`id`, `name`, `position`, `description`, `student_description`, `download_condition`, `icon`, `is_default`, `mkdate`, `chdate`) VALUES
('FREE_LICENSE',	'Werk mit freier Lizenz',	3,	'Werke, die unter einer freien Lizenz veröffentlich wurden, d.h. deren Weitergabe und zumeist auch Veränderung ohne Lizenzkosten gestattet ist, dürfen Sie ohne Einschränkungen für den Unterricht zugänglich machen. \n\nTypische Beispiele sind:\n- Open-Access-Publikationen \n- Open Educational Ressources (OER) \n- Werke unter Creative-Commons-Lizenzen (z.B. Wikipedia-Inhalte) \n\nAchtung: Vergewissern Sie sich im Einzelfall, welche Einschränkungen für die Verbreitung und Veränderung die jeweilige Lizenz ggf. enthält.',	'Das Dokument unterliegt einer freien Lizenz. Sie dürfen es weitergeben und unter Beachtung der Details der Lizenz (s. Angaben im Dokument) verändern und in eigene Werke übernehmen.',	0,	'cc',	0,	1499435049,	1499435049),
('NO_LICENSE',	'Veröffentlichte Werke ohne erworbene Lizenz oder gesonderte Erlaubnis',	5,	'Veröffentlichte Werke, für die keine Lizenz erworben wurde und für die keine gesonderte Erlaubnis vorliegt, dürfen unter den Erlaubnissen des § 60a UrhG für Unterrichtsteilnehmende zugänglich gemacht werden.\n\nEs muss sich dabei um kleine Teile des Gesamtwerkes handeln (z.B. max.  15% eines Buches oder Bildbandes, 5 Minuten bei Musikstücken oder Filmen, Kinofilme erst nach 2 Jahren). Einzelne Abbildungen, Photos oder Artikel aus wissenschaftlichen Zeitschriften dürfen ganz zugänglich gemacht werden, Artikel aus Zeitungen und anderen Zeitschriften allerdings ebenfalls nur zu 10%.\n\nZum Hintergrund: Diese Regelung gilt wegen der Befristung des § 60a UrhG zunächst bis März 2023, eine Einzelmeldung oder Abrechnung über die Hochschule o.ä. ist nicht erforderlich.',	'Das Dokument wird zur Nutzung im Rahmen dieser Veranstaltung bereitgestellt. Sie dürfen es für private Zwecke herunterladen und archivieren, nicht jedoch ohne Erlaubnis weitergeben.',	0,	'60a',	0,	1544006590,	1544006609),
('SELFMADE_NONPUB',	'Selbst verfasstes, nicht publiziertes Werk',	2,	'Selbst verfasste Werke dürfen Sie ohne Einschränkungen zugänglich machen, wenn Sie die Verwertungsrechte nicht an einen Verlag abgetreten haben. \nTypische Beispiele sind selbst verfasste:\n - Präsentationsfolien, auch mit Text- und Bildzitaten aus fremden Quellen \n- Übungsaufgaben, Musterlösungen \n- Computer-Programme \n- Literaturlisten, Seminarpläne\n - Vorlesungsskripte \n\nWichtig ist die Beachtung des Zitatrechtes: \nWenn Sie Teile fremder Quellen übernehmen, ist das zulässig, solange diese Teile mit Quelle gekennzeicht werden und Gegenstand einer wissenschaftlichen Auseinandersetzung sind.',	'Das Dokument wird von den Autor/-innen zur Nutzung im Rahmen dieser Veranstaltung bereitgestellt. Sie dürfen es für private Zwecke herunterladen und archivieren, nicht jedoch ohne Erlaubnis weitergeben. Für darüber hinaus gehende Erlaubnisse (Weitergabe, Veränderung) wenden Sie sich an die Autor/-innen oder beachten Sie die Hinweise im Dokument.',	0,	'own-license',	0,	1499435049,	1499435049),
('UNDEF_LICENSE',	'Ungeklärte Lizenz',	1,	'Bitte geben Sie an, welcher Lizenz das hochgeladene Material unterliegt bzw. auf welcher Grundlage Sie es zugänglich machen. Unterbleibt diese Angabe, wird beim Herunterladen auf den ungeklärten Lizenzstatus hingewiesen.',	'Diese Datei enthält Material mit einer ungeklärten Lizenz. Zu Fragen der Nutzung und Weitergabe wenden Sie sich an die Person, die diese Datei hochgeladen hat.',	0,	'question-circle',	1,	1499435049,	1516978561),
('WITH_LICENSE',	'Nutzungserlaubnis oder Lizenz liegt vor',	4,	'Wenn Sie urheberrechtlich geschützte Werke zugänglich machen wollen und keine der anderen Kategorien passt, benötigen Sie eine Erlaubnis oder kostenpflichtige Lizenz des Inhabers der Verwertungsrechte. Das ist bei publizierten Werken der Verlag, bei nicht publizierten Werken der Autor. \n\nTypische Beispiele sind: \n- Zustimmung von Kollegen oder Studierenden zur Weitergabe von Skripten, Seminararbeiten, Referatsfolien \n- Zustimmung eines Verlages zur Nutzung von Werkteilen für die Lehre \n- Verlags-Erlaubnis zur Nutzung eigener publizierter Werke für die Lehre \n- Erworbene Lizenz für die Weitergabe in Lehrveranstaltung (eine einzelne erworbene Kopie reicht nicht aus!) \n\nAchtung: Campus- oder Nationallizenzen erlauben es nicht, dass Sie ein Werk erneut hochladen und somit selbst verbreiten. Verlinken Sie in diesem Fall direkt auf das Angebot Ihrer Bibliothek o.ä.',	'Das Dokument wird zur Nutzung im Rahmen dieser Veranstaltung bereitgestellt. Sie dürfen es für private Zwecke herunterladen und archivieren, nicht jedoch ohne Erlaubnis weitergeben.',	0,	'license',	0,	1499435049,	1499435049);

DROP TABLE IF EXISTS `coursememberadmissions`;
CREATE TABLE `coursememberadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `course_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `modus` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `coursesets`;
CREATE TABLE `coursesets` (
  `set_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `infotext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `algorithm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `algorithm_run` tinyint(1) NOT NULL DEFAULT 0,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`set_id`),
  KEY `set_user` (`user_id`,`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `courseset_factorlist`;
CREATE TABLE `courseset_factorlist` (
  `set_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `factorlist_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`set_id`,`factorlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `courseset_institute`;
CREATE TABLE `courseset_institute` (
  `set_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `institute_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) DEFAULT NULL,
  `chdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`set_id`,`institute_id`),
  KEY `institute_id` (`institute_id`,`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `courseset_rule`;
CREATE TABLE `courseset_rule` (
  `set_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`set_id`,`rule_id`),
  KEY `type` (`set_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `coursewizardsteps`;
CREATE TABLE `coursewizardsteps` (
  `id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classname` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `coursewizardsteps` (`id`, `name`, `classname`, `number`, `enabled`, `mkdate`, `chdate`) VALUES
('3780ba468183b5ed6d7c32fbd73edb02',	'Erweiterte Grunddaten',	'AdvancedBasicDataWizardStep',	1,	0,	1483462779,	1483462779),
('59405e754a753a21588d63eac75f0ccd',	'Studienbereiche',	'StudyAreasWizardStep',	2,	1,	1448561064,	1448561064),
('6a7f6dfa33738438d332a85aaeadf230',	'LVGruppen',	'LVGroupsWizardStep',	3,	1,	1483462781,	1483462781),
('e455df8d296d7dc46a5a27cb9bcc40b0',	'Grunddaten',	'BasicDataWizardStep',	1,	1,	1448561064,	1448561064);

DROP TABLE IF EXISTS `cronjobs_logs`;
CREATE TABLE `cronjobs_logs` (
  `log_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `schedule_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `scheduled` int(11) unsigned NOT NULL,
  `executed` int(11) unsigned NOT NULL,
  `exception` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `output` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` float NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `schedule_id` (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `cronjobs_schedules`;
CREATE TABLE `cronjobs_schedules` (
  `schedule_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `task_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` enum('low','normal','high') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'normal',
  `type` enum('periodic','once') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'periodic',
  `minute` tinyint(2) DEFAULT NULL,
  `hour` tinyint(2) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `month` tinyint(2) DEFAULT NULL,
  `day_of_week` tinyint(1) unsigned DEFAULT NULL,
  `next_execution` int(11) unsigned NOT NULL DEFAULT 0,
  `last_execution` int(11) unsigned DEFAULT NULL,
  `last_result` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `cronjobs_schedules` (`schedule_id`, `task_id`, `active`, `title`, `description`, `parameters`, `priority`, `type`, `minute`, `hour`, `day`, `month`, `day_of_week`, `next_execution`, `last_execution`, `last_result`, `execution_count`, `mkdate`, `chdate`) VALUES
('3eb6cd006b1d27ab3dfd812c17d90f38',	'532b3fe76447dd85e10949a6fc5f3aa8',	0,	NULL,	'',	'{\"cronjobs\":\"1\",\"cronjobs-success\":\"7\",\"cronjobs-error\":\"14\"}',	'normal',	'periodic',	13,	2,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	0,	1403258015,	1403258107),
('6eef46d414b104b153402be299e16515',	'2f2713671892bd9624fc27866cfd4630',	0,	NULL,	'',	'{\"verbose\":\"1\",\"send_messages\":\"1\"}',	'normal',	'periodic',	-30,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	0,	1403258015,	1403258130),
('81411d712690ab3a82032439dbcdc8c1',	'9c4ad2a8fe47d07e61475d25f5e539db',	0,	NULL,	NULL,	'[]',	'normal',	'periodic',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	0,	1403258017,	1403258017),
('b6e232acce27674e496bd2182aab5aaa',	'43f9da3d9245d0f01b43f744e0b8cdce',	0,	NULL,	NULL,	'null',	'normal',	'periodic',	55,	0,	NULL,	NULL,	NULL,	1530312900,	NULL,	NULL,	0,	1530289049,	1530290418),
('cdf293c6c5ae966d87dc5ee723d9880d',	'823875ed4a4b2e87baca0e5137243d96',	0,	NULL,	'',	'{\"verbose\":\"1\"}',	'normal',	'periodic',	33,	2,	NULL,	NULL,	NULL,	1530318780,	NULL,	NULL,	0,	1403258015,	1530290419),
('dc849ba21c484ffbb82f7ef9edea3d7d',	'208619e89a59895771c2967076daf59e',	0,	NULL,	NULL,	'[]',	'low',	'periodic',	-30,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	0,	1403258015,	1403258015),
('dfd35e23a8256fee930e2e748cd53f1d',	'3428a64935e8c6a5ab5dcf5bf95fe556',	0,	NULL,	NULL,	'null',	'normal',	'periodic',	13,	3,	NULL,	NULL,	NULL,	1530321180,	NULL,	NULL,	0,	1403258015,	1530290420),
('f048bf3c13bfdb2a2a17ce867903ca0e',	'd19f37c382fec524b4fd51b3c5a1ada3',	0,	NULL,	NULL,	'[]',	'high',	'periodic',	7,	1,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	0,	1403258015,	1403258015);

DROP TABLE IF EXISTS `cronjobs_tasks`;
CREATE TABLE `cronjobs_tasks` (
  `task_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `execution_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  `assigned_count` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `cronjobs_tasks` (`task_id`, `filename`, `class`, `active`, `execution_count`, `assigned_count`) VALUES
('208619e89a59895771c2967076daf59e',	'lib/cronjobs/purge_cache.class.php',	'PurgeCacheJob',	1,	0,	0),
('2f2713671892bd9624fc27866cfd4630',	'lib/cronjobs/check_admission.class.php',	'CheckAdmissionJob',	1,	0,	0),
('3428a64935e8c6a5ab5dcf5bf95fe556',	'lib/cronjobs/session_gc.class.php',	'SessionGcJob',	1,	0,	0),
('43f9da3d9245d0f01b43f744e0b8cdce',	'lib/classes/FilesSearch/Cronjob.php',	'FilesSearch\\Cronjob',	1,	0,	2),
('532b3fe76447dd85e10949a6fc5f3aa8',	'lib/cronjobs/cleanup_log.class.php',	'CleanupLogJob',	1,	0,	0),
('823875ed4a4b2e87baca0e5137243d96',	'lib/cronjobs/garbage_collector.class.php',	'GarbageCollectorJob',	1,	0,	0),
('9c4ad2a8fe47d07e61475d25f5e539db',	'lib/cronjobs/send_mail_queue.class.php',	'SendMailQueueJob',	1,	0,	0),
('d0a556faa0bb93df823ccae8905b21d3',	'lib/cronjobs/clean_object_user_visits.php',	'CleanObjectUserVisits',	1,	0,	0),
('d19f37c382fec524b4fd51b3c5a1ada3',	'lib/cronjobs/send_mail_notifications.class.php',	'SendMailNotificationsJob',	1,	0,	0);

DROP TABLE IF EXISTS `datafields`;
CREATE TABLE `datafields` (
  `datafield_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_type` enum('sem','inst','user','userinstrole','usersemdata','roleinstdata','moduldeskriptor','modulteildeskriptor') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edit_perms` enum('user','autor','tutor','dozent','admin','root') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `view_perms` enum('all','user','autor','tutor','dozent','admin','root') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(20) unsigned DEFAULT NULL,
  `chdate` int(20) unsigned DEFAULT NULL,
  `type` enum('bool','textline','textlinei18n','textarea','textareai18n','textmarkup','textmarkupi18n','selectbox','date','time','email','phone','radio','combo','link','selectboxmultiple') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'textline',
  `typeparam` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(4) NOT NULL DEFAULT 0,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_userfilter` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`datafield_id`),
  KEY `object_type` (`object_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `datafields` (`datafield_id`, `name`, `object_type`, `object_class`, `edit_perms`, `view_perms`, `institut_id`, `priority`, `mkdate`, `chdate`, `type`, `typeparam`, `is_required`, `default_value`, `is_userfilter`, `description`, `system`) VALUES
('ce73a10d07b3bb13c0132d363549efda',	'Matrikelnummer',	'user',	'7',	'user',	'dozent',	NULL,	0,	NULL,	NULL,	'textline',	'',	0,	NULL,	0,	'',	0);

DROP TABLE IF EXISTS `datafields_entries`;
CREATE TABLE `datafields_entries` (
  `datafield_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(20) unsigned DEFAULT NULL,
  `chdate` int(20) unsigned DEFAULT NULL,
  `sec_range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `lang` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`datafield_id`,`range_id`,`sec_range_id`,`lang`) USING BTREE,
  KEY `range_id` (`range_id`,`datafield_id`),
  KEY `datafield_id_2` (`datafield_id`,`sec_range_id`),
  KEY `datafields_contents` (`datafield_id`,`content`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `datafields_entries` (`datafield_id`, `range_id`, `content`, `mkdate`, `chdate`, `sec_range_id`, `lang`) VALUES
('ce73a10d07b3bb13c0132d363549efda',	'e7a0a84b161f3e8c09b4a0a2e8a58147',	'1234567',	1530292487,	1530292487,	'',	'');

DROP TABLE IF EXISTS `deputies`;
CREATE TABLE `deputies` (
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `gruppe` tinyint(4) NOT NULL DEFAULT 0,
  `notification` int(10) NOT NULL DEFAULT 0,
  `edit_about` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`range_id`,`user_id`),
  KEY `user_id` (`user_id`,`range_id`,`edit_about`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_assignments`;
CREATE TABLE `etask_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `range_type` enum('course','global','group','institute','user') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_assignment_attempts`;
CREATE TABLE `etask_assignment_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_assignment_ranges`;
CREATE TABLE `etask_assignment_ranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `range_type` enum('course','global','group','institute','user') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assignment_id` (`assignment_id`,`range_type`,`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_responses`;
CREATE TABLE `etask_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `points` float DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grader_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mkdate` int(11) NOT NULL,
  `chdate` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_tasks`;
CREATE TABLE `etask_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL,
  `chdate` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_task_tags`;
CREATE TABLE `etask_task_tags` (
  `task_id` int(11) NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`task_id`,`user_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_tests`;
CREATE TABLE `etask_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL,
  `chdate` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_test_tags`;
CREATE TABLE `etask_test_tags` (
  `test_id` int(11) NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`test_id`,`user_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `etask_test_tasks`;
CREATE TABLE `etask_test_tasks` (
  `test_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `points` float DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`test_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `eval`;
CREATE TABLE `eval` (
  `eval_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `startdate` int(20) DEFAULT NULL,
  `stopdate` int(20) DEFAULT NULL,
  `timespan` int(20) DEFAULT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `anonymous` tinyint(1) NOT NULL DEFAULT 1,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `shared` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `evalanswer`;
CREATE TABLE `evalanswer` (
  `evalanswer_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT 0,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  `rows` tinyint(4) NOT NULL DEFAULT 0,
  `counter` int(11) NOT NULL DEFAULT 0,
  `residual` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`evalanswer_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `evalanswer` (`evalanswer_id`, `parent_id`, `position`, `text`, `value`, `rows`, `counter`, `residual`) VALUES
('087c734855c8a5b34d99c16ad09cd312',	'6fddac14c1f2ac490b93681b3da5fc66',	1,	'Dienstag',	2,	0,	0,	0),
('0be387b9379a05c5578afce64b0c688f',	'724244416b5d04a4d8f4eab8a86fdbf8',	4,	'Mangelhaft',	5,	0,	0,	0),
('21b3f7cf2de5cbb098d800f344d399ee',	'12e508079c4770fb13c9fce028f40cac',	0,	'Montag',	1,	0,	0,	0),
('39b98a5560d5dabaf67227e2895db8da',	'a68bd711902f23bd5c55a29f1ecaa095',	0,	'',	1,	5,	0,	0),
('3a3ab5307f39ea039d41fb6f2683475e',	'ef227e91618878835d52cfad3e6d816b',	3,	'',	4,	0,	0,	0),
('3d4dcedb714dfdcfbe65cd794b4d404b',	'724244416b5d04a4d8f4eab8a86fdbf8',	2,	'Befriedigend',	3,	0,	0,	0),
('48842cedeac739468741940982b5fe6d',	'6fddac14c1f2ac490b93681b3da5fc66',	4,	'Freitag',	5,	0,	0,	0),
('568d6fd620642cb7395c27d145a76734',	'12e508079c4770fb13c9fce028f40cac',	4,	'Freitag',	5,	0,	0,	0),
('5c4827f903168ed4483db5386a9ad5b8',	'95bbae27965d3404f7fa3af058850bd3',	4,	'trifft gar nicht zu',	5,	0,	0,	0),
('6115b19f694ccd3d010a0047ff8f970a',	'ef227e91618878835d52cfad3e6d816b',	4,	'Sehr Schlecht',	5,	0,	0,	0),
('61ae27ab33c402316a3f1eb74e1c46ab',	'442e1e464e12498bd238a7767215a5a2',	0,	'',	1,	1,	0,	0),
('63f5011614f45329cc396b90d94a7096',	'6fddac14c1f2ac490b93681b3da5fc66',	2,	'Mittwoch',	3,	0,	0,	0),
('64152ace8f2a74d0efb67c54eff64a2b',	'ef227e91618878835d52cfad3e6d816b',	2,	'',	3,	0,	0,	0),
('641686e7c61899b303cda106f20064e7',	'95bbae27965d3404f7fa3af058850bd3',	2,	'teilsteils',	3,	0,	0,	0),
('7052b76e616656e4b70f1c504c04ec81',	'ef227e91618878835d52cfad3e6d816b',	1,	'',	2,	0,	0,	0),
('7080335582e2787a54f315ec8cef631e',	'95bbae27965d3404f7fa3af058850bd3',	0,	'trifft völlig zu',	1,	0,	0,	0),
('7c36d074f2cc38765c982c9dfb769afc',	'95bbae27965d3404f7fa3af058850bd3',	3,	'trifft wenig zu',	4,	0,	0,	0),
('84be4c31449a9c1807bf2dea0dc869f1',	'724244416b5d04a4d8f4eab8a86fdbf8',	0,	'Sehr gut',	1,	0,	0,	0),
('aec07dd525f2610bdd10bf778aa1893b',	'724244416b5d04a4d8f4eab8a86fdbf8',	5,	'Nicht erteilt',	6,	0,	0,	1),
('b39860f6601899dcf87ba71944c57bc7',	'12e508079c4770fb13c9fce028f40cac',	3,	'Donnerstag',	4,	0,	0,	0),
('be4c3e5fe0b2b735bb3b2712afa8c490',	'ef227e91618878835d52cfad3e6d816b',	5,	'Keine Meinung',	6,	0,	0,	1),
('c10a3f4e97f8badc5230a9900afde0c7',	'95bbae27965d3404f7fa3af058850bd3',	5,	'kann ich nicht beurteilen',	6,	0,	0,	1),
('c446970d2addd68e43c2a6cae6117bf7',	'724244416b5d04a4d8f4eab8a86fdbf8',	1,	'Gut',	2,	0,	0,	0),
('c88242b50ff0bb43df32c1e15bdaca22',	'12e508079c4770fb13c9fce028f40cac',	2,	'Mittwoch',	3,	0,	0,	0),
('ccd1eaddccca993f6789659b36f40506',	'6fddac14c1f2ac490b93681b3da5fc66',	3,	'Donnerstag',	4,	0,	0,	0),
('ced33706ca95aff2163c7d0381ef5717',	'6fddac14c1f2ac490b93681b3da5fc66',	0,	'Montag',	1,	0,	0,	0),
('d67301d4f59aa35d1e3f12a9791b6885',	'ef227e91618878835d52cfad3e6d816b',	0,	'Sehr gut',	1,	0,	0,	0),
('d68a74dc2c1f0ce226366da918dd161d',	'95bbae27965d3404f7fa3af058850bd3',	1,	'trifft ziemlich zu',	2,	0,	0,	0),
('f0016e918b5bc5c4cf3cc62bf06fa2e9',	'12e508079c4770fb13c9fce028f40cac',	1,	'Dienstag',	2,	0,	0,	0),
('fa2bf667ba73ae74794df35171c2ad2e',	'724244416b5d04a4d8f4eab8a86fdbf8',	3,	'Ausreichend',	4,	0,	0,	0);

DROP TABLE IF EXISTS `evalanswer_user`;
CREATE TABLE `evalanswer_user` (
  `evalanswer_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `evaldate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`evalanswer_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `evalgroup`;
CREATE TABLE `evalgroup` (
  `evalgroup_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `child_type` enum('EvaluationGroup','EvaluationQuestion') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'EvaluationGroup',
  `mandatory` tinyint(1) NOT NULL DEFAULT 0,
  `template_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`evalgroup_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `evalquestion`;
CREATE TABLE `evalquestion` (
  `evalquestion_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `type` enum('likertskala','multiplechoice','polskala') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'multiplechoice',
  `position` int(11) NOT NULL DEFAULT 0,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiplechoice` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`evalquestion_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `evalquestion` (`evalquestion_id`, `parent_id`, `type`, `position`, `text`, `multiplechoice`) VALUES
('12e508079c4770fb13c9fce028f40cac',	'0',	'multiplechoice',	0,	'Werktage-mehrfach',	1),
('442e1e464e12498bd238a7767215a5a2',	'0',	'multiplechoice',	0,	'Freitext-Einzeilig',	0),
('6fddac14c1f2ac490b93681b3da5fc66',	'0',	'multiplechoice',	0,	'Werktage',	0),
('724244416b5d04a4d8f4eab8a86fdbf8',	'0',	'likertskala',	0,	'Schulnoten',	0),
('95bbae27965d3404f7fa3af058850bd3',	'0',	'likertskala',	0,	'Wertung (trifft zu, ...)',	0),
('a68bd711902f23bd5c55a29f1ecaa095',	'0',	'multiplechoice',	0,	'Freitext-Mehrzeilig',	0),
('ef227e91618878835d52cfad3e6d816b',	'0',	'polskala',	0,	'Wertung 1-5',	0);

DROP TABLE IF EXISTS `eval_group_template`;
CREATE TABLE `eval_group_template` (
  `evalgroup_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `group_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`evalgroup_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `eval_range`;
CREATE TABLE `eval_range` (
  `eval_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`eval_id`,`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `eval_templates`;
CREATE TABLE `eval_templates` (
  `template_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `institution_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show_questions` tinyint(1) NOT NULL DEFAULT 1,
  `show_total_stats` tinyint(1) NOT NULL DEFAULT 1,
  `show_graphics` tinyint(1) NOT NULL DEFAULT 1,
  `show_questionblock_headline` tinyint(1) NOT NULL DEFAULT 1,
  `show_group_headline` tinyint(1) NOT NULL DEFAULT 1,
  `polscale_gfx_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bars',
  `likertscale_gfx_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bars',
  `mchoice_scale_gfx_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bars',
  `kurzbeschreibung` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  KEY `user_id` (`user_id`,`institution_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `eval_templates_eval`;
CREATE TABLE `eval_templates_eval` (
  `eval_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `template_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`eval_id`),
  KEY `eval_id` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `eval_templates_user`;
CREATE TABLE `eval_templates_user` (
  `eval_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `template_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  KEY `eval_id` (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `eval_user`;
CREATE TABLE `eval_user` (
  `eval_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`eval_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `event_data`;
CREATE TABLE `event_data` (
  `event_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` int(10) unsigned NOT NULL DEFAULT 0,
  `end` int(10) unsigned NOT NULL DEFAULT 0,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` enum('PUBLIC','PRIVATE','CONFIDENTIAL') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'PRIVATE',
  `categories` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_intern` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `location` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` int(10) unsigned NOT NULL DEFAULT 0,
  `linterval` smallint(5) unsigned DEFAULT NULL,
  `sinterval` smallint(5) unsigned DEFAULT NULL,
  `wdays` varchar(7) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `month` tinyint(3) unsigned DEFAULT NULL,
  `day` tinyint(3) unsigned DEFAULT NULL,
  `rtype` enum('SINGLE','DAILY','WEEKLY','MONTHLY','YEARLY') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'SINGLE',
  `duration` smallint(5) unsigned NOT NULL DEFAULT 0,
  `count` smallint(5) DEFAULT 0,
  `expire` int(10) unsigned NOT NULL DEFAULT 0,
  `exceptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  `chdate` int(10) unsigned NOT NULL DEFAULT 0,
  `importdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `autor_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `extern_config`;
CREATE TABLE `extern_config` (
  `config_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `config_type` int(4) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_standard` int(4) NOT NULL DEFAULT 0,
  `config` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`config_id`,`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ex_termine`;
CREATE TABLE `ex_termine` (
  `termin_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `autor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL DEFAULT 0,
  `end_time` int(20) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `date_typ` tinyint(4) NOT NULL DEFAULT 0,
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `raum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadate_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `resource_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`termin_id`),
  KEY `range_id` (`range_id`,`date`),
  KEY `metadate_id` (`metadate_id`,`date`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `ex_termine` (`termin_id`, `range_id`, `autor_id`, `content`, `description`, `date`, `end_time`, `mkdate`, `chdate`, `date_typ`, `topic_id`, `raum`, `metadate_id`, `resource_id`) VALUES
('2f0ed59985a2726bbe103555b6abedf5',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1590994800,	1591002000,	1573239101,	1573239101,	1,	NULL,	NULL,	'fc3c44f257e448e3cd36a88406a8a9c1',	'');

DROP TABLE IF EXISTS `fach`;
CREATE TABLE `fach` (
  `fach_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_kurz` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beschreibung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schlagworte` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fach` (`fach_id`, `name`, `name_kurz`, `beschreibung`, `schlagworte`, `author_id`, `editor_id`, `mkdate`, `chdate`) VALUES
('6b9ac09535885ca55e29dd011e377c0a',	'Geschichte',	NULL,	'',	NULL,	'',	'',	1311416418,	1311416418),
('f981c9b42ca72788a09da4a45794a737',	'Informatik',	NULL,	'',	NULL,	'',	'',	1311416397,	1311416397);

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `storage` enum('disk','url') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'disk',
  `author_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mkdate` int(10) unsigned NOT NULL,
  `chdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `files` (`id`, `user_id`, `mime_type`, `name`, `size`, `storage`, `author_name`, `mkdate`, `chdate`) VALUES
('6b606bd3d6d6cda829200385fa79fcbf',	'76ed43ef286fb55cf9e41beadb484a9f',	'application/pdf',	'mappe_studip-el.pdf',	314146,	'url',	'Root Studip',	1343924827,	1343924841);

DROP TABLE IF EXISTS `files_search_attributes`;
CREATE TABLE `files_search_attributes` (
  `id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `file_ref_user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `file_ref_mkdate` int(10) unsigned NOT NULL,
  `file_ref_chdate` int(10) unsigned NOT NULL,
  `folder_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `folder_range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `folder_range_type` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `folder_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_status` tinyint(4) unsigned DEFAULT NULL,
  `semester_start` int(20) unsigned DEFAULT NULL,
  `semester_end` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folder_range_id` (`folder_range_id`),
  KEY `folder_range_type` (`folder_range_type`),
  KEY `semester_start` (`semester_start`),
  KEY `semester_end` (`semester_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `files_search_index`;
CREATE TABLE `files_search_index` (
  `FTS_DOC_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_ref_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `relevance` float NOT NULL,
  PRIMARY KEY (`FTS_DOC_ID`),
  KEY `file_ref_id` (`file_ref_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `file_refs`;
CREATE TABLE `file_refs` (
  `id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `file_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `folder_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `downloads` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_terms_of_use_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  `chdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `folder_id` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `file_refs` (`id`, `file_id`, `folder_id`, `downloads`, `description`, `content_terms_of_use_id`, `user_id`, `name`, `mkdate`, `chdate`) VALUES
('6b606bd3d6d6cda829200385fa79fcbf',	'6b606bd3d6d6cda829200385fa79fcbf',	'ca002fbae136b07e4df29e0136e3bd32',	0,	'Stud.IP-Produktbroschüre im PDF-Format',	'FREE_LICENSE',	'76ed43ef286fb55cf9e41beadb484a9f',	'mappe_studip-el.pdf',	1343924827,	1343924841);

DROP TABLE IF EXISTS `file_urls`;
CREATE TABLE `file_urls` (
  `file_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `url` varchar(4096) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_type` enum('proxy','redirect') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'proxy',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `file_urls` (`file_id`, `url`, `access_type`) VALUES
('6b606bd3d6d6cda829200385fa79fcbf',	'http://www.studip.de/download/mappe_studip-el.pdf',	'proxy');

DROP TABLE IF EXISTS `folders`;
CREATE TABLE `folders` (
  `id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `folder_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(10) unsigned NOT NULL,
  `chdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `range_id` (`range_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `folders` (`id`, `user_id`, `parent_id`, `range_id`, `range_type`, `folder_type`, `name`, `data_content`, `description`, `mkdate`, `chdate`) VALUES
('012cb91a42cf85e5fafdd84e54ed2ec3',	'76ed43ef286fb55cf9e41beadb484a9f',	'f7fc5ae64d2c453daa9619a820a6467e',	'a07535cf2f8a72df33c12ddfa4b53dde',	'course',	'CourseDateFolder',	'15. Klausur am Do., 21.02.2019, 12:00 - 14:00',	'{\"termin_id\":\"9ff59e18112a686c553412761a5df85c\",\"permission\":5}',	'',	1543859055,	1543859055),
('1af61dbdcfca1b394290c5d4283371d7',	'76ed43ef286fb55cf9e41beadb484a9f',	'da3c2c2b4ea4c9781dccbae6eade5721',	'7cb72dab1bf896a0b55c6aa7a70a3a86',	'course',	'StandardFolder',	'Allgemeiner Dateiordner',	'',	'Ablage für allgemeine Ordner und Dokumente der Veranstaltung',	1343924088,	1343924088),
('3cc9006789bceef5d3ea7bed680790b4',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	'110ce78ffefaf1e5f167cd7019b728bf',	'institute',	'RootFolder',	'externe Einrichtung B',	'',	'',	1510849315,	1510849315),
('694cdcef09c2b8e70a7313b028e36fb6',	'',	'3cc9006789bceef5d3ea7bed680790b4',	'110ce78ffefaf1e5f167cd7019b728bf',	'institute',	'StandardFolder',	'Allgemeiner Dateiordner',	'',	'Ablage für allgemeine Ordner und Dokumente der Einrichtung',	1156516698,	1156516698),
('76b822dcc7f1458ae6e144c3c0fb544e',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	'ec2e364b28357106c0f8c282733dbe56',	'institute',	'RootFolder',	'externe Bildungseinrichtungen',	'',	'',	1510849315,	1510849315),
('9082368f7e01b24af15178d0d954f4dc',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	'7a4f19a0a2c321ab2b8f7b798881af7c',	'institute',	'RootFolder',	'externe Einrichtung A',	'',	'',	1510849315,	1510849315),
('ad8dc6a6162fb0fe022af4a62a15e309',	'76ed43ef286fb55cf9e41beadb484a9f',	'f7fc5ae64d2c453daa9619a820a6467e',	'a07535cf2f8a72df33c12ddfa4b53dde',	'course',	'HomeworkFolder',	'Hausaufgaben',	'{\"permission\":\"3\"}',	'',	1343924873,	1343924877),
('b58081c411c76814bc8f78425fb2ab81',	'',	'9082368f7e01b24af15178d0d954f4dc',	'7a4f19a0a2c321ab2b8f7b798881af7c',	'institute',	'StandardFolder',	'Allgemeiner Dateiordner',	'',	'Ablage für allgemeine Ordner und Dokumente der Einrichtung',	1156516698,	1156516698),
('bc63814f56ec1bbbba731e07d0074b45',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	'76ed43ef286fb55cf9e41beadb484a9f',	'user',	'RootFolder',	'',	'[]',	'',	1543858972,	1543858972),
('ca002fbae136b07e4df29e0136e3bd32',	'76ed43ef286fb55cf9e41beadb484a9f',	'f7fc5ae64d2c453daa9619a820a6467e',	'a07535cf2f8a72df33c12ddfa4b53dde',	'course',	'StandardFolder',	'Allgemeiner Dateiordner',	'',	'Ablage für allgemeine Ordner und Dokumente der Veranstaltung',	1343924407,	1343924894),
('da3c2c2b4ea4c9781dccbae6eade5721',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	'7cb72dab1bf896a0b55c6aa7a70a3a86',	'course',	'RootFolder',	'Test Studiengruppe',	'',	'',	1510849315,	1510849315),
('dad53cd0f0d9f36817c3c9c7c124bda3',	'',	'76b822dcc7f1458ae6e144c3c0fb544e',	'ec2e364b28357106c0f8c282733dbe56',	'institute',	'StandardFolder',	'Allgemeiner Dateiordner',	'',	'Ablage für allgemeine Ordner und Dokumente der Einrichtung',	1156516698,	1156516698),
('df122112a21812ff4ffcf1965cb48fc3',	'76ed43ef286fb55cf9e41beadb484a9f',	'f7fc5ae64d2c453daa9619a820a6467e',	'a07535cf2f8a72df33c12ddfa4b53dde',	'course',	'CourseGroupFolder',	'Dateiordner der Gruppe: Studierende',	'{\"group\":\"2f597139a049a768dbf8345a0a0af3de\"}',	'Ablage für Ordner und Dokumente dieser Gruppe',	1343924860,	1343924860),
('f7fc5ae64d2c453daa9619a820a6467e',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	'a07535cf2f8a72df33c12ddfa4b53dde',	'course',	'RootFolder',	'Test Lehrveranstaltung',	'',	'',	1510849315,	1510849315);

DROP TABLE IF EXISTS `forum_abo_users`;
CREATE TABLE `forum_abo_users` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_categories`;
CREATE TABLE `forum_categories` (
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `entry_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`category_id`),
  KEY `seminar_id` (`seminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_categories_entries`;
CREATE TABLE `forum_categories_entries` (
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`category_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_entries`;
CREATE TABLE `forum_entries` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` tinyint(4) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL,
  `latest_chdate` int(11) DEFAULT NULL,
  `chdate` int(20) NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `sticky` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`),
  KEY `seminar_id` (`seminar_id`,`lft`),
  KEY `seminar_id_2` (`seminar_id`,`rgt`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_entries_issues`;
CREATE TABLE `forum_entries_issues` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `issue_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`topic_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_favorites`;
CREATE TABLE `forum_favorites` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_likes`;
CREATE TABLE `forum_likes` (
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `forum_visits`;
CREATE TABLE `forum_visits` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `visitdate` int(11) NOT NULL,
  `last_visitdate` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`seminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `globalsearch_buzzwords`;
CREATE TABLE `globalsearch_buzzwords` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rights` enum('user','autor','tutor','dozent','admin','root') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `buzzwords` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `grading_definitions`;
CREATE TABLE `grading_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool` varchar(64) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL,
  `mkdate` int(11) NOT NULL,
  `chdate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `tool` (`tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `grading_instances`;
CREATE TABLE `grading_instances` (
  `definition_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `rawgrade` decimal(6,5) unsigned NOT NULL,
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(11) NOT NULL,
  `chdate` int(11) NOT NULL,
  PRIMARY KEY (`definition_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `help_content`;
CREATE TABLE `help_content` (
  `global_content_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `content_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `language` char(2) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'de',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studip_version` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` tinyint(4) NOT NULL DEFAULT 1,
  `custom` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `installation_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `help_content` (`global_content_id`, `content_id`, `language`, `content`, `route`, `studip_version`, `position`, `custom`, `visible`, `author_email`, `installation_id`, `mkdate`, `chdate`) VALUES
('014a2106d384c0ca55d9311597029ca0',	'014a2106d384c0ca55d9311597029ca0',	'de',	'Mit der Ressourcensuche können universitäre Ressourcen wie Räume, Gebäude etc. gefunden werden.',	'resources.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('01ad8998268101ad186babf43dac30a4',	'01ad8998268101ad186babf43dac30a4',	'de',	'In den Standard-Vertretungseinstellungen können Dozierende eine Standard-Vertretung festlegen, die alle Veranstaltungen des Dozierenden verwalten und ändern kann.',	'dispatch.php/settings/deputies',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('0237ea35a203be81e44c979d82ef5ee6',	'0237ea35a203be81e44c979d82ef5ee6',	'en',	'Archived courses to which the user is assigned appear here. Content can no longer be changed, but stored files can be downloaded as zip files.',	'dispatch.php/my_courses/archive',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('02b4e3ce7b8fe6b3e6a3586d410a51a1',	'02b4e3ce7b8fe6b3e6a3586d410a51a1',	'en',	'This page shows the study groups to which the user is assigned. Study groups are an easy way to collaborate with fellow students, colleagues and others. Each user can create study groups or search for them. The colour coding can be adjusted individually.',	'dispatch.php/my_studygroups',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('04457f9a66eab07618fe502d470a9711',	'04457f9a66eab07618fe502d470a9711',	'de',	'In der Übersicht finden sich veranstaltungsbezogene Kurz- und Detail-Informationen, Ankündigungen, Termine und Umfragen.',	'dispatch.php/course/overview',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('0838a96b5678e2fc26be0ee38ae67619',	'0838a96b5678e2fc26be0ee38ae67619',	'en',	'In DoIT!, lecturers have the ability to set different types of tasks, including file uploads, multiple-choice questions, and peer reviewing. The task processing can be limited in time and can be done in groups.',	'plugins.php/reloadedplugin/show',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('0ad754cc62d1e86e97c1a28dd68ac40c',	'0ad754cc62d1e86e97c1a28dd68ac40c',	'en',	'Here you can find an overview of the dates that have been booked by students.',	'plugins.php/homepageterminvergabeplugin/show_bookings',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('0c055cc6ae418a96ff3afa9db13098df',	'0c055cc6ae418a96ff3afa9db13098df',	'en',	'You can use the administration features to change the properties of the course at a later date. Under Actions a simulation of the student\'s view is possible.',	'dispatch.php/course/management',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('0d83ce036f2870f873446230c0118bb7',	'0d83ce036f2870f873446230c0118bb7',	'en',	'The learning module interface makes it possible to provide study units or tests from external programs such as ILIAS and LON-CAPA in Stud.IP.',	'dispatch.php/course/elearning/show',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('0e816d9428a3bc8a73fb0042fb2da540',	'0e816d9428a3bc8a73fb0042fb2da540',	'en',	'Here the affiliation to user domains can be viewed, but not changed.',	'dispatch.php/settings/userdomains',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('1058f03da5b6fc6a5ff3a08c9c1fa5f7',	'1058f03da5b6fc6a5ff3a08c9c1fa5f7',	'de',	'Hier können der Veranstaltung weitere Funktionen hinzugefügt werden.',	'dispatch.php/course/plus',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1289e991a93dce5a0b4edd678514325e',	'1289e991a93dce5a0b4edd678514325e',	'de',	'Hier können einzelne Inhaltselemente nachträglich aktiviert oder deaktiviert werden. Aktivierte Inhaltselemente fügen neue Funktionen zu Ihrem Profil oder Ihren Einstellungen hinzu. Diese werden meist als neuer Reiter im Menü erscheinen. Wenn Funktionalitäten nicht benötigt werden, können diese hier deaktiviert werden. Die entsprechenden Menüpunkte werden dann ausgeblendet.',	'dispatch.php/profilemodules',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('142482b4b06a376b2eb4c91d38559a15',	'142482b4b06a376b2eb4c91d38559a15',	'de',	'Freie Gestaltung von Reiternamen und Inhalten durch Lehrende. Es gibt Raum für eigene Informationen, der Name des Reiters ist frei definierbar. Es können beliebig viele Einträge (\"neue Einträge\") hinzugefügt werden.',	'dispatch.php/course/scm',	'4.0',	1,	0,	1,	'',	'',	0,	0),
('14b77e9e0b7773c92db9e7344a23fcfc',	'14b77e9e0b7773c92db9e7344a23fcfc',	'de',	'Mit der Personensuche können NutzerInnen gefunden werden, solange deren Privatsphäre-Einstellung dies nicht verhindert. Die Suche kann auf bestimmte Veranstaltungen oder Einrichtungen begrenzt werden.',	'browse.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('164f77ab2cb7d38fd1ea20ed725834fd',	'164f77ab2cb7d38fd1ea20ed725834fd',	'de',	'Hier findet sich eine Übersicht über die Termine, die von Studierenden gebucht wurden.',	'plugins.php/homepageterminvergabeplugin/show_bookings',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1804e526c2f6794b877a4b2096eaa67a',	'1804e526c2f6794b877a4b2096eaa67a',	'en',	'Blubber is a mixed version of forum and chat where participants\' posts are displayed in real time. Others can be informed about a post by mentioning them in the post by @username or @\'first name last name\'.',	'plugins.php/blubber/streams/forum',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('194874212676ced8d45e1883da1ad456',	'194874212676ced8d45e1883da1ad456',	'de',	'Das Forum ist eine textbasierte, zeit- und ortsunabhängige Möglichkeit zum Austausch von Fragen, Meinungen und Erfahrungen. Beiträge können abonniert, exportiert, als Favoriten gekennzeichnet und editiert werden. Über die Navigation links können unterschieldiche Ansichten (z.B. Neue Beiträge seit letztem LogIn) gewählt werden.',	'plugins.php/coreforum',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('19c2bc232075602bd39efd4b6623d576',	'19c2bc232075602bd39efd4b6623d576',	'de',	'Mit der Studienbereiche-Funktion kann die Veranstaltung einem Studienbereich zugeordnet werden. Die Bearbeitung kann gesperrt sein, wenn Daten aus anderen Systemen (z.B. LSF/ UniVZ) übernommen werden.',	'dispatch.php/course/study_areas/show',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('19d47b782ac5c8b8b21bd1f94858a0fa',	'19d47b782ac5c8b8b21bd1f94858a0fa',	'de',	'Mit Zugangsberechtigungen (Anmeldeverfahren) lässt sich z.B. durch Passwörter, Zeitsteuerung und TeilnehmerInnenbeschränkung der Zugang zu einer Veranstaltung regulieren.',	'dispatch.php/course/admission',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1c61657979ce22a9af023248a617f6b2',	'1c61657979ce22a9af023248a617f6b2',	'de',	'Die Startseite wird nach dem Einloggen angezeigt und kann an persönliche Bedürfnisse mit Hilfe von Widgets angepasst werden.',	'dispatch.php/start',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1cb8fd77427ebc092d751eea95454b0a',	'1cb8fd77427ebc092d751eea95454b0a',	'en',	'Here you can edit reference lists and make them visible in the course (by clicking on the \"eye\").',	'dispatch.php/literature/edit_list',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('1d1323471cf21637f51284f4e6f2d135',	'1d1323471cf21637f51284f4e6f2d135',	'de',	'Detaillierte Informationen über die Veranstaltung werden angezeigt, wie z.B. die Veranstaltungsnummer, Zuordnungen, DozentInnen, TutorInnen etc. In den Detail-Informationen ist unter Aktionen das Eintragen in eine Veranstaltung möglich.',	'dispatch.php/course/details',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1da144f3c6f52af0566c343151a6a6ff',	'1da144f3c6f52af0566c343151a6a6ff',	'de',	'In den Benachrichtigungseinstellungen kann ausgewählt werden, bei welchen Änderungen innerhalb einer Veranstaltung eine Benachrichtigung erfolgen soll.',	'dispatch.php/settings/notification',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1dca5b0b83f7bca92ec4add50d34b8c5',	'1dca5b0b83f7bca92ec4add50d34b8c5',	'de',	'Hier können der Studiengruppe Mitglieder hinzugefügt und Nachrichten an diese versendet werden.',	'dispatch.php/course/studygroup/members',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('1ea099717ceb1b401aedcedc89814d9c',	'1ea099717ceb1b401aedcedc89814d9c',	'en',	'The study diary supports the autonomous studying process of the students and is managed independently by them. Inquiries to the lecturers regarding work steps are possible, certain data can be released individually.',	'plugins.php/lerntagebuchplugin/overview',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('1f216fe42d879c3fcbb582d67e9ad5a2',	'1f216fe42d879c3fcbb582d67e9ad5a2',	'en',	'Here, appointments can be assigned topics or previously entered topics can be taken over and edited.',	'dispatch.php/course/topics',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('1f6e2f98affbffb1d12904355e9313e5',	'1f6e2f98affbffb1d12904355e9313e5',	'de',	'Diese Seite zeigt die Einrichtungen an, denen die/der NutzerIn zugeordnet ist.',	'dispatch.php/my_institutes',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('2075fe42f56207fbd153a810188f1beb',	'2075fe42f56207fbd153a810188f1beb',	'en',	'Configuration of the study diary for students and creation of a study diary for lecturers.',	'plugins.php/lerntagebuchplugin/admin_settings',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('233564d01b8301ebec7ef2fe918d1290',	'233564d01b8301ebec7ef2fe918d1290',	'de',	'Ansicht über die der/ dem Stud.IP-NutzerIn zugeordneten Einrichtungen.',	'dispatch.php/settings/statusgruppen',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('245ce01d7a0175ab0b977ae822821e9e',	'245ce01d7a0175ab0b977ae822821e9e',	'de',	'Diese Seite bietet die Möglichkeit Stud.IP-Nutzende in das eigene Adressbuch einzutragen und alle bereits im Adressbuch befindlichen Kontakte aufzulisten.',	'contact.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('25255dc15fd0d6260bc1abd1f10aecc5',	'25255dc15fd0d6260bc1abd1f10aecc5',	'de',	'Individuelle persönliche Angaben, wie bspw. E-Mail-Adresse, können auf dieser Seite verändert und angepasst werden. ',	'dispatch.php/settings/account',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('260ee12fdc7dccb30eca2cc075ef0096',	'260ee12fdc7dccb30eca2cc075ef0096',	'en',	'The schedule settings offer the possibility to be adapted to your own needs.',	'dispatch.php/settings/calendar',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('2689cecba24e021f05fcece5e4c96057',	'2689cecba24e021f05fcece5e4c96057',	'de',	'Mit der Evaluationen-Funktion lassen sich Befragungen mit Multiple-Choice, Likert- und Freitextfragen für Veranstaltungen, Studiengruppen, das eigene Profil oder Einrichtungen erstellen. Dabei können auch öffentliche Vorlagen anderer Personen verwendet werden. Es werden alle zukünftigen, laufenden und beendeten Evaluationen angezeigt.',	'admin_evaluation.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('27c4d9837cfb1a9a40c079e16daac902',	'27c4d9837cfb1a9a40c079e16daac902',	'en',	'This page offers the possibility to enter Stud.IP users in your own address book and to list all contacts already in the address book.',	'contact.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('29c3bfa01ddbaaa998094d3ee975a06a',	'29c3bfa01ddbaaa998094d3ee975a06a',	'de',	'Der Ablaufplan zeigt Termine, Themen und Räume der Veranstaltung an. Einzelne Termine können bearbeitet werden, z.B. können Themen zu Terminen hinzugefügt werden.',	'dispatch.php/course/dates',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('2a389c2472656121a76ca4f3b0e137d4',	'2a389c2472656121a76ca4f3b0e137d4',	'en',	'Here you can upload a profile picture.',	'dispatch.php/settings/avatar',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('2c55eab1f52d6f7d1021880836906f5b',	'2c55eab1f52d6f7d1021880836906f5b',	'de',	'Hier lassen sich Literaturlisten bearbeiten und in der Veranstaltung sichtbar schalten (mit Klick auf das \"Auge\").',	'dispatch.php/literature/edit_list.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('2f1602394a4e31c2e30706f0a0b3112f',	'2f1602394a4e31c2e30706f0a0b3112f',	'en',	'On this page you can see which contacts are currently online. A message can be sent to these people. Clicking on a person\'s name will take you to their profile.',	'dispatch.php/online',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('2fcc672d91f2627ab5ca48499e8b1617',	'2fcc672d91f2627ab5ca48499e8b1617',	'de',	'Möglichkeit zur Bereitstellung von Vorlesungsaufzeichnungen und Podcasts für Studierende der Veranstaltung (durch Verlinkung auf die Dateien auf dem Medienserver). ',	'plugins.php/mediacastsplugin/show',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('3318ee99a062079b463e902348ad520e',	'3318ee99a062079b463e902348ad520e',	'en',	'Here, lecturers can create and display announcements for their courses, institutions, and profile page, with the ability to filter the display.',	'dispatch.php/news/admin_news',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('357bbf06015b2738aae15837f581a07d',	'357bbf06015b2738aae15837f581a07d',	'en',	'Detailed information about the course, e.g. the course number, assignments, lecturers, tutors, etc. is displayed. In the detail information, you can enter a course under Actions.',	'dispatch.php/course/details',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('35b1860b95854a2533b6ecfbbf04ab71',	'35b1860b95854a2533b6ecfbbf04ab71',	'de',	'Der Stundenplan besteht aus abonnierten Veranstaltungen, die ein- und ausgeblendet sowie in Darstellungsgröße und -form angepasst werden können.',	'dispatch.php/calendar/schedule',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('3607d6daea679dcd7003e076fdd1660a',	'3607d6daea679dcd7003e076fdd1660a',	'en',	'The list of participants shows a list of the participants of the course. Additional participants can be added, removed, downgraded, promoted or assigned to self-defined groups by lecturers.',	'dispatch.php/course/members',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('362a67fff2ef7af8cca9f8e20583c9f2',	'362a67fff2ef7af8cca9f8e20583c9f2',	'en',	'Contacts from the address book can be displayed sorted according to the groups here.',	'???',	'3.1',	0,	0,	1,	'',	'',	1412942388,	0),
('38d1a86517eb6cc195b2e921270c3035',	'38d1a86517eb6cc195b2e921270c3035',	'en',	'The group calendar provides an overview of course dates and personalized additional dates for that course.',	'plugins.php/gruppenkalenderplugin/show',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('394a45f94e1d84d3744027a5a69d9e3e',	'394a45f94e1d84d3744027a5a69d9e3e',	'de',	'Auf dieser Seite lässt sich einsehen, welche Kontakte gerade online sind. Diesen Personen kann eine Nachricht geschickt werden. Das Klicken auf den Namen einer Person leitet zu deren Profil weiter.',	'dispatch.php/online',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('3b7a4c04017fef2984ee029610194f26',	'3b7a4c04017fef2984ee029610194f26',	'en',	'The settings of the messaging system offer the possibility to forward the messages received in Stud.IP to your email address.',	'dispatch.php/settings/messaging',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('3d040e95a8c29e733a8d5439ee9f5b59',	'3d040e95a8c29e733a8d5439ee9f5b59',	'en',	'The name, function and access restriction of the study group can be edited here.',	'dispatch.php/course/studygroup/edit',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('4151003175042b71bea3529e5adc5a9e',	'4151003175042b71bea3529e5adc5a9e',	'de',	'Mit der Terminvergabe können Termine für Sprechstunden, Prüfungen usw. angelegt werden, in die sich Studierende selbst eintragen können.',	'plugins.php/homepageterminvergabeplugin/showadmin',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('42060187921376807f90e52fad5f9822',	'42060187921376807f90e52fad5f9822',	'en',	'With the Surveys and Tests function, you can create (time-controlled) surveys or individual multiple/single-choice questions for courses, study groups or the profile.',	'admin_vote.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('437c83a27473ef8139b47198101067fb',	'437c83a27473ef8139b47198101067fb',	'de',	'Hier erscheinen archivierte Veranstaltungen, denen der Nutzer zugeordnet ist. Inhalte können nicht mehr verändert, jedoch hinterlegte Dateien als zip-Datei heruntergeladen werden.',	'dispatch.php/my_courses/archive',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('438c4456f85afec29fd9f47c111136c1',	'438c4456f85afec29fd9f47c111136c1',	'en',	'This page shows the institutions that the user is assigned to.',	'dispatch.php/my_institutes',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('43df8e33145c25eb6d941e4e845ada24',	'43df8e33145c25eb6d941e4e845ada24',	'en',	'In the notification settings you can select which changes within a course you want to be notified for.',	'dispatch.php/settings/notification',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('440e50f7fcc825368aa9026273d2cd0d',	'440e50f7fcc825368aa9026273d2cd0d',	'en',	'The timetable consists of courses you have subscribed to, which can be shown and hidden as well as adjusted in display size and form.',	'dispatch.php/calendar/schedule',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('44edb997707d1458cbf8a3f8f316b908',	'44edb997707d1458cbf8a3f8f316b908',	'en',	'The reference page offers teachers the possibility to create reference lists or to import them from reference management programs. These lists can be copied into courses and made visible. Depending on the connection, the actual book inventory of the university can be searched.',	'dispatch.php/course/literature',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('462f1447b1a8a93ab7bdb2524f968b1a',	'462f1447b1a8a93ab7bdb2524f968b1a',	'de',	'Hier kann die Zugehörigkeit zu Nutzerdomänen eingesehen, aber nicht geändert werden.',	'dispatch.php/settings/userdomains',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('4698cafeb9823735c50fd3a1745950ba',	'4698cafeb9823735c50fd3a1745950ba',	'de',	'In den Grunddaten können Titel, Beschreibung, Dozierende etc. geändert werden. Die Bearbeitung kann teilweise gesperrt sein, wenn Daten aus anderen Systemen (z.B. LSF/ UniVZ) übernommen werden.',	'dispatch.php/course/basicdata/view',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('4e14c94cda99e2ef6462f7fef06d9c91',	'4e14c94cda99e2ef6462f7fef06d9c91',	'en',	'With access authorisation (enrolment procedure), access to a course can be regulated e.g. by means of passwords, time control and participant restrictions.',	'dispatch.php/course/admission',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('4e60dd9635f3d3fddecc78e0d1f646c7',	'4e60dd9635f3d3fddecc78e0d1f646c7',	'de',	'Unter \"Studiendaten\" können manuell zusätzliche Studiengänge und Einrichtungen hinzugefügt werden, wenn sie nicht automatisch aus einem externen System (z.B. LSF/ UniVZ) übernommen wurden.',	'dispatch.php/settings/studies',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('4f9d79fe88e81486b8c1f192d70232d5',	'4f9d79fe88e81486b8c1f192d70232d5',	'de',	'Mit der Einrichtungssuche können Einrichtungen über ein freies Suchfeld oder den Einrichtungsbaum gefunden werden.',	'institut_browse.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('51a0399250de6365619c961ec3669ad3',	'51a0399250de6365619c961ec3669ad3',	'en',	'Blubber is a mixture of forum and chat. Messages are displayed in the public stream. Other users can be informed about a post by mentioning them by @username or @\'firstname surname\' in the post.',	'plugins.php/blubber/streams/profile',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('51b98d659590e1e37dae5e5e5cc028bb',	'51b98d659590e1e37dae5e5e5cc028bb',	'en',	'File management provides the ability to upload, manage, and download personal files that are not visible to others.',	'dispatch.php/document/files',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('5475d65b07fdaf5f234bf6eed3d5e4a9',	'5475d65b07fdaf5f234bf6eed3d5e4a9',	'en',	'The evaluation function can be used to create surveys with multiple-choice, and free text questions for courses, study groups, your own profile or institutions. Other people\'s public templates can also be used. All future, current and completed evaluations are displayed.',	'admin_evaluation.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('55499281ce1a4757f17aaf73faa072ea',	'55499281ce1a4757f17aaf73faa072ea',	'de',	'Auf dieser Seite können sie sich vor dem Archivieren vergewissern, das die richtige(n) Veranstaltunge(n) zum Archivieren ausgewählt wurden.',	'dispatch.php/course/archive/confirm',	'4.0',	1,	0,	1,	'',	'',	0,	0),
('57f1b29d3c1a558f5cc799c1aade7f14',	'57f1b29d3c1a558f5cc799c1aade7f14',	'en',	'Here, contact groups or the entire address book can be exported in order to import them into an external program.',	'contact_export.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('595c46d86f681f7da4bd2fae780db618',	'595c46d86f681f7da4bd2fae780db618',	'de',	'Wählen Sie das gewünschte System und anschließend das Lernmodul/ den Test aus. Schreibrechte bestimmen, wer zukünftig das Lernmodul bearbeiten darf. In der Sidebar befindet sich die Option \"Zuordnungen aktualisieren\", um geänderte Inhalte z.B. im ILIAS Kurs zu Stud.IP zu übertragen.',	'dispatch.php/course/elearning/edit',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('5a90d1219dbeb07c124156592fb5d877',	'5a90d1219dbeb07c124156592fb5d877',	'de',	'In den allgemeinen Einstellungen können verschiedene Anzeigeoptionen und Benachrichtigungsfunktionen ausgewählt und verändert werden.',	'dispatch.php/settings/general',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('5ae72abc0822570bfe839e3ee24f0c81',	'5ae72abc0822570bfe839e3ee24f0c81',	'en',	'Date allocation can be used to create appointments for consultation hours, exams, etc. in which students can enter themselves.',	'plugins.php/homepageterminvergabeplugin/showadmin',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('5fab81bbd1e19949f304df08ea21ca1b',	'5fab81bbd1e19949f304df08ea21ca1b',	'de',	'Mit der Bild-Hochladen-Funktion lässt sich das Bild der Veranstaltung ändern, was Studierenden bei der Unterscheidung von Veranstaltungen auf der Meine-Veranstaltungen-Seite helfen kann.',	'dispatch.php/course/avatar/update',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('60b6caf75d0004dfdb0a1adfd66027ed',	'60b6caf75d0004dfdb0a1adfd66027ed',	'de',	'Hier können Dozierende Ankündigungen für ihre Veranstaltungen, Einrichtungen und ihre Profilseite erstellen und anzeigen, wobei die Anzeige gefiltert werden kann.',	'dispatch.php/news/admin_news',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('615c1887f0ee080043f133681ebf0def',	'615c1887f0ee080043f133681ebf0def',	'en',	'Titles, descriptions, lecturers, etc. can be changed in the basic data. Editing can be partially blocked if data is transferred from other systems (for example, LSF/ UniVZ).',	'dispatch.php/course/basicdata/view',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('633dab120ce3969c42f33aeb3a59fcc1',	'633dab120ce3969c42f33aeb3a59fcc1',	'de',	'Der Gruppenkalender bietet eine Übersicht über Veranstaltungstermine und personalisierte Zusatztermine für diese Veranstaltung. ',	'plugins.php/gruppenkalenderplugin/show',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('63c2ecb12f30816aef0fb203eab4f40a',	'63c2ecb12f30816aef0fb203eab4f40a',	'de',	'Hier können Termine angelegt und bearbeitet werden.',	'plugins.php/homepageterminvergabeplugin/show_category',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('6529fd70b461fa4a9242e874fbf2a5d3',	'6529fd70b461fa4a9242e874fbf2a5d3',	'de',	'In DoIT! haben Lehrende die Möglichkeit, verschiedene Arten von Aufgaben zu stellen, inklusive Hochladen von Dateien, Multiple-Choice-Fragen und Peer Reviewing. Die Aufgabenbearbeitung kann zeitlich befristet werden und wahlweise in Gruppen erfolgen.',	'plugins.php/reloadedplugin/show',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('690e6eff3e83a5f372ec99fc49cafeb2',	'690e6eff3e83a5f372ec99fc49cafeb2',	'de',	'Blubbern ist das Stud.IP Echtzeitforum, eine Mischform aus Forum und Chat. Andere können über einen Beitrag informiert werden, indem sie per @benutzername oder @\"Vorname Nachname\" im Beitrag erwähnt werden. Texte lassen sich formatieren und durch Smileys ergänzen.',	'plugins.php/blubber/streams/global',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('6acc653cfabd3a0d4433ff0ab417bf6a',	'6acc653cfabd3a0d4433ff0ab417bf6a',	'de',	'Übersicht über gesendete, systeminterne Nachrichten, welche mit selbstgewählten Schlüsselwörtern (sog. Tags) versehen werden können, um sie später leichter wieder auffinden zu können. ',	'dispatch.php/messages/sent',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('6b331f5cc2176daba82a0cc71aaa576f',	'6b331f5cc2176daba82a0cc71aaa576f',	'en',	'On this page you can sort contacts into self-defined groups.',	'contact_statusgruppen.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('70274c459a69e34bbf520e690a8e472b',	'70274c459a69e34bbf520e690a8e472b',	'de',	'Mit der Zeiten/Räume-Funktion können die Semester-, Termin- und Raumangaben der Veranstaltung geändert werden. Die Bearbeitung kann gesperrt sein, wenn Daten aus anderen Systemen (z.B. LSF/ UniVZ) übernommen werden.',	'dispatch.php/course/timesrooms',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('707b0db0e45fc3bab04be7eff38c1d32',	'707b0db0e45fc3bab04be7eff38c1d32',	'de',	'Die Literaturseite bietet Lehrenden die Möglichkeit, Literaturlisten zu erstellen oder aus Literaturverwaltungsprogrammen zu importieren. Diese Listen können in Lehrveranstaltungen kopiert und sichtbar geschaltet werden. Je nach Anbindung kann im tatsächlichen Buchbestand der Hochschule recherchiert werden. ',	'dispatch.php/course/literature',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('72cec29d985f3e6d7df2b5fabb7fe666',	'72cec29d985f3e6d7df2b5fabb7fe666',	'de',	'Konfiguation des Lerntagebuchs für Studierende und Anlegen eines Lerntagebuchs für die Dozierenden.',	'plugins.php/lerntagebuchplugin/admin_settings',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('7465a4aeedb6a320d3455cf9ad0bebd0',	'7465a4aeedb6a320d3455cf9ad0bebd0',	'en',	'Possibility of providing lecture recordings and podcasts for students of the course (by linking to the files on the media server).',	'plugins.php/mediacastsplugin/show',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('74863847eec53a3d4c8264d8de526be8',	'74863847eec53a3d4c8264d8de526be8',	'de',	'Mit der Archivsuche können Veranstaltungen gefunden werden, die bereits archiviert wurden.',	'dispatch.php/search/archive',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('74c1da86f33f5adfb43e10220bfad238',	'74c1da86f33f5adfb43e10220bfad238',	'de',	'Die Veranstaltungsseite zeigt alle abonnierten Veranstaltungen (standardmäßig nur die der letzten beiden Semester), alle abonnierten Studiengruppen sowie alle Einrichtungen, denen man zugeordnet wurde. Die Anzeige lässt sich über Farbgruppierungen, Semesterfilter usw. anpassen.',	'dispatch.php/my_courses',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('752d441cd321b05c55c8a5d9aa48ddce',	'752d441cd321b05c55c8a5d9aa48ddce',	'de',	'Auf dieser Seite können Kontakte aus dem Adressbuch in selbstdefinierte Gruppen sortiert werden.',	'contact_statusgruppen.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('76195b21d485823fd7ca2fd499131c12',	'76195b21d485823fd7ca2fd499131c12',	'en',	'Here you can add and edit dates.',	'plugins.php/homepageterminvergabeplugin/show_category',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('7bf322a6c5f13db67e047b7afae83e58',	'7bf322a6c5f13db67e047b7afae83e58',	'en',	'By exporting, data about courses and co-workers can be exported into the following formats: RTF, TXT, CSV, PDF, HTML and XML.',	'export.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('7cb7026818c4b90935009d0548300674',	'7cb7026818c4b90935009d0548300674',	'en',	'A custom Blubber stream can be created here. It always consists of a collection of posts from selected courses, contact groups and keywords, which can be further restricted by filtering. The new user-defined stream can be found after clicking on the Save button in the navigation under Global Stream.',	'plugins.php/blubber/streams/edit',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('7d40379f54250b550065e062d71e8fd8',	'7d40379f54250b550065e062d71e8fd8',	'en',	'With the archive search you can search for courses that have already been archived.',	'dispatch.php/search/archive',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('7ebdd278d06f9fc1d2659a54bb3171c1',	'7ebdd278d06f9fc1d2659a54bb3171c1',	'de',	'Die Rangliste sortiert die Stud.IP-Nutzenden absteigend anhand ihrer Punktzahl. Die Punktzahl wächst mit den Aktivitäten in Stud.IP und repräsentiert so die Erfahrung der Nutzenden mit dem System. Indem das Kästchen links mit einem Haken versehen wird, wird der eigene Wert für andere NutzerInnen in der Rangliste sichtbar gemacht. In der Grundeinstellung ist der eigene Wert nicht öffentlich sichtbar.',	'dispatch.php/score',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('7edc08f2f7b0786ca036f8c448441e07',	'7edc08f2f7b0786ca036f8c448441e07',	'en',	'The Wiki enables a common, asynchronous creation and editing of texts. Texts can be formatted and linked so that a branched reference guide is created.',	'wiki.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('7f4a1f5e3dfe2a459cf0eb357667d91c',	'7f4a1f5e3dfe2a459cf0eb357667d91c',	'de',	'Mit den Verwaltungsfunktionen lassen sich die Eigenschaften der Veranstaltung nachträglich ändern. Unter Aktionen ist die Simulation der Studierendenansicht möglich.',	'dispatch.php/course/management',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('80286432bf17df20e5f11f86b421b0a7',	'80286432bf17df20e5f11f86b421b0a7',	'en',	'The forum is a text-based, time- and location-independent platform for the exchange of questions, opinions and experiences. Contributions can be subscribed to, exported, marked as favourites and edited. The navigation on the left allows you to select different views (e.g. New posts since last login).',	'plugins.php/coreforum',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('82537b14dd3714ec9636124ed5af3272',	'82537b14dd3714ec9636124ed5af3272',	'de',	'Die Profilseite ermöglicht die Änderung der eigenen persönliche Angaben inkl. Profilbild und Kategorien. Ähnlich wie in Facebook können Kommentare hinterlassen werden. Das Profil von Lehrenden enthält Sprechstunden und Raumangaben. Daneben bietet die Seite die Verwaltung eigener Dateien.',	'dispatch.php/profile',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('82a17a5f19d211268b1fa90a1ebe0894',	'82a17a5f19d211268b1fa90a1ebe0894',	'de',	'Hier kann eine neue Studiengruppe angelegt werden. Jede/r Stud.IP-NutzerIn kann Studiengruppen anlegen und nach eigenen Bedürfnissen konfigurieren.',	'dispatch.php/course/studygroup/new',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('83fd70727605c485a0d8f2c5ef94289b',	'83fd70727605c485a0d8f2c5ef94289b',	'en',	'Here you can enter predefined information about yourself, that should appear on your profile page.',	'dispatch.php/settings/details',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('845d1ce67a62d376ec26c8ffbb22d492',	'845d1ce67a62d376ec26c8ffbb22d492',	'de',	'Die Einstellungen des Nachrichtensystems bieten die Möglichkeit z.B. eine Weiterleitung der in Stud.IP empfangenen Nachrichten an die E-Mail-Adresse zu veranlassen.',	'dispatch.php/settings/messaging',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('852991dc733639dd2df05fb627abf3db',	'852991dc733639dd2df05fb627abf3db',	'en',	'Here you can add further features to the course.',	'dispatch.php/course/plus',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('85c000e33732c5596d198776cb884860',	'85c000e33732c5596d198776cb884860',	'en',	'In the default substitution settings, lecturers can specify a default substitution that can manage and change all of the lecturer\'s courses.',	'dispatch.php/settings/deputies',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('85c709de75085bd56a739e4e8ac6fcad',	'85c709de75085bd56a739e4e8ac6fcad',	'en',	'The time/room feature can be used to change the semester, date and room details of the course. Editing can be blocked if data is transferred from other systems (e.g. LSF/ UniVZ).',	'dispatch.php/course/timesrooms',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('85cbaa1648af330cc4420b57df4be29c',	'85cbaa1648af330cc4420b57df4be29c',	'de',	'Die Einstellungen des Terminkalenders bieten die Möglichkeit, diesen an eigene Bedürfnisse anzupassen.',	'dispatch.php/settings/calendar',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('87489a40097e5c26f1d1349c072610de',	'87489a40097e5c26f1d1349c072610de',	'de',	'Mit der Veranstaltungssuche können Veranstaltungen, Studiengruppen usw. in verschiedenen Semestern und nach verschiedenen Suchkriterien (siehe \"Erweiterte Suche anzeigen\"in der Sidebar) gefunden werden. Das aktuelle Semester ist vorgewählt.',	'dispatch.php/search/courses',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('8a1d7d04c70d93be44e8fe6a8e8c3443',	'8a1d7d04c70d93be44e8fe6a8e8c3443',	'de',	'Das Lerntagebuch unterstützt den selbstgesteuerten Lernprozess der Studierenden und wird von ihnen selbstständig geführt. Anfragen zu Arbeitsschritten an die Dozierenden sind möglich, bestimmte Daten können individualisiert freigegeben werden.',	'plugins.php/lerntagebuchplugin/overview',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('8a32ca4e602a68307d4ae6ae51fa667e',	'8a32ca4e602a68307d4ae6ae51fa667e',	'en',	'With the institute search, institutions can be found via a free search field or the facility tree.',	'institut_browse.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('8ad364363acd415631226d5574d5592a',	'8ad364363acd415631226d5574d5592a',	'en',	'On this page you can enter self-defined information about yourself, which should appear on the profile page.',	'dispatch.php/settings/categories',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('8b690f942bf0cc0322e5bea0f1b9abed',	'8b690f942bf0cc0322e5bea0f1b9abed',	'en',	'Select the desired system and then the learning module/test. Writing permissions determine who can edit the learning module in the future. In the sidebar you will find the option \"Update assignments\" in order to transfer changed contents e.g. in the ILIAS course to Stud.IP.',	'dispatch.php/course/elearning/edit',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('8c2fc90bd8175e6d598f895944a8ddc2',	'8c2fc90bd8175e6d598f895944a8ddc2',	'en',	'The attendance list shows all course appointments (meeting, lecture, exercise, internship) of the schedule and allows students to be entered by the lecturers in Stud.IP as well as exporting the list to an overview or as a basis for handwritten entries.',	'participantsattendanceplugin/show',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('8c3067596811d3c6857d253299e01f6f',	'8c3067596811d3c6857d253299e01f6f',	'en',	'The schedule shows dates, topics and rooms of the course. Individual dates can be edited, for example, topics can be added to dates.',	'dispatch.php/course/dates',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('8dd3b80d9f95218d67edc3cb570559ff',	'8dd3b80d9f95218d67edc3cb570559ff',	'de',	'Hier lassen sich Literaturlisten bearbeiten und in der Veranstaltung sichtbar schalten (mit Klick auf das \"Auge\").',	'dispatch.php/literature/edit_list',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('90ffbd715843b02b3961907f81caf208',	'90ffbd715843b02b3961907f81caf208',	'en',	'The score list sorts the Stud.IP users in descending order according to their score. The number of points increases with the activities in Stud.IP and thus represents the experience of the users with the system. By ticking the box on the left, the own value is made visible to other users in the ranking. By default, your own value is not visible to the public.',	'dispatch.php/score',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('91d6f451c3ef8d8352a076773b0a19ee',	'91d6f451c3ef8d8352a076773b0a19ee',	'en',	'The courses page shows all subscribed courses (by default only those of the last two semesters), all subscribed study groups and all institutions to which you have been assigned. The display can be adjusted via colour codes, semester filters, etc.',	'dispatch.php/my_courses',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('94a193baa212abbc9004280a1498e724',	'94a193baa212abbc9004280a1498e724',	'de',	'Hier können Kontaktgruppen oder das gesamte Adressbuch exportiert werden, um sie in einem externen Programm importieren zu können.',	'contact_export.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('95ff3a2a68dae73bcb14a4a538a8e4b5',	'95ff3a2a68dae73bcb14a4a538a8e4b5',	'de',	'Blubbern ist eine Mischform aus Forum und Chat, bei dem Beiträge der Teilnehmenden in Echtzeit angezeigt werden. Andere können über einen Beitrag informiert werden, indem sie per @benutzername oder @\"Vorname Nachname\" im Beitrag erwähnt werden.',	'plugins.php/blubber/streams/forum',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('960d7bafb618853eced1b1b42a7dd412',	'960d7bafb618853eced1b1b42a7dd412',	'en',	'This page shows all study groups that exist in Stud.IP. Study groups are an easy way to collaborate with fellow students, colleagues and others. Each user can create study groups or search for them.',	'dispatch.php/studygroup/browse',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('970ebdf39ad5ca89083a52723c5c35f5',	'970ebdf39ad5ca89083a52723c5c35f5',	'en',	'Under \"Study details\", additional study programmes and institutions can be added manually if they have not been transferred automatically from an external system (e.g. LSF/ UniVZ).',	'dispatch.php/settings/studies',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('a1e3da35edc9b605f670e9c7f5019888',	'a1e3da35edc9b605f670e9c7f5019888',	'en',	'With the course search you can find courses, study groups etc. in different semesters and according to different search criteria (see \"Show advanced search\" in the sidebar). The current semester is preselected.',	'dispatch.php/search/courses',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('a1ea37130799a59f7774473f1a681141',	'a1ea37130799a59f7774473f1a681141',	'de',	'Die Lernmodulschnittstelle ermöglicht es, Selbstlerneinheiten oder Tests aus externen Programmen wie ILIAS und LON-CAPA in Stud.IP zur Verfügung zu stellen.',	'dispatch.php/course/elearning/show',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('a20036992a06e97a984832626121d99a',	'a20036992a06e97a984832626121d99a',	'de',	'Die TeilnehmerInnenliste zeigt eine Liste der Teilnehmenden dieser Veranstaltung. Weitere Teilnehmende können von Dozierenden hinzugefügt, entfernt, herabgestuft, heraufgestuft oder selbstdefinierten Gruppen zugeordnet werden.',	'dispatch.php/course/members',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('a202eb75df0a1da2a309ad7a4abfac59',	'a202eb75df0a1da2a309ad7a4abfac59',	'de',	'In den Privatsphäre-Einstellungen kann die Sichtbarkeit und Auffindbarkeit des eigenen Profils eingestellt werden.',	'dispatch.php/settings/privacy',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('a2a649de15c8d8473b11fccc731dc80f',	'a2a649de15c8d8473b11fccc731dc80f',	'en',	'Before archiving you can check on this page that the right course(s) have been selected for archiving.',	'dispatch.php/course/archive/confirm',	'4.4',	1,	0,	1,	'',	'',	0,	0),
('aa77d5ee6e0f9a9e6f4a1bbabeaf4a7e',	'aa77d5ee6e0f9a9e6f4a1bbabeaf4a7e',	'de',	'Die Anwesenheitsliste zeigt alle Sitzungstermine (Sitzung, Vorlesung, Übung, Praktikum) des Ablaufplans und ermöglicht das Eintragen von Studierenden durch die Dozierenden in Stud.IP sowie einen Export der Liste zur Übersicht oder als Grundlage handschriftlicher Eintragungen.',	'participantsattendanceplugin/show',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('abaa7b076e6923ac43120f3326322af0',	'abaa7b076e6923ac43120f3326322af0',	'en',	'This page allows the storing of free information, links etc.',	'dispatch.php/course/scm',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('abfb5d03de288d02df436f9a8bb96d9d',	'abfb5d03de288d02df436f9a8bb96d9d',	'en',	'With the image uploading feature, the image of a course can be changed, which can help students differentiate between courses on the My Courses page.',	'dispatch.php/course/avatar/update',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('ac5df1de9c75fc92af7718b2103d3037',	'ac5df1de9c75fc92af7718b2103d3037',	'de',	'Blubbern ist eine Mischform aus Forum und Chat. Nachrichten werden im öffentlichen Stream dargestellt. Andere Nutzer können über einen Beitrag informiert werden, indem sie per @benutzername oder @\"Vorname Nachname\" im Beitrag erwähnt werden.',	'plugins.php/blubber/streams/profile',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('ac7326260fd5ca4fa83c1154f2ffc7b9',	'ac7326260fd5ca4fa83c1154f2ffc7b9',	'de',	'Die Dateiverwaltung bietet die Möglichkeit zum Hochladen, Verlinken, Verwalten und Herunterladen von Dateien. ',	'folder.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('af7573cce1e898054db89a96284866f9',	'af7573cce1e898054db89a96284866f9',	'en',	'Here you can create a new study group. Each Stud.IP user can create study groups and configure them according to their own needs.',	'dispatch.php/course/studygroup/new',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('b05b27450e363c38c6b4620b902b3496',	'b05b27450e363c38c6b4620b902b3496',	'en',	'The start page opens after logging in and can be adjusted to your personal needs by using widgets.',	'dispatch.php/start',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('b283b58820db358284f4451dfb691678',	'b283b58820db358284f4451dfb691678',	'en',	'Here you can search for references in catalogues and add them to your list.',	'dispatch.php/literature/search',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('b32cb2c4ec56e925b07a5cb0105a6888',	'b32cb2c4ec56e925b07a5cb0105a6888',	'en',	'The password of the Stud.IP account can be changed here.',	'dispatch.php/settings/password',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('b3bd33cb0babbb0cc51a4f429d15d438',	'b3bd33cb0babbb0cc51a4f429d15d438',	'en',	'Here you can add members to a study group and send messages to them.',	'dispatch.php/course/studygroup/members',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('b5fabb1e5aed7ff8520314e9a86c5c87',	'b5fabb1e5aed7ff8520314e9a86c5c87',	'en',	'Here, individual content can be activated or deactivated. Active contents add new features to your profile or settings. These will usually appear as new tabs in the menu. If features are not required, they can be deactivated here. The corresponding menu items will then be hidden.',	'dispatch.php/profilemodules/index',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('b677e8b5f1bd7e8acbe474177449c4e1',	'b677e8b5f1bd7e8acbe474177449c4e1',	'de',	'Die Dateiverwaltung bietet die Möglichkeit zum Hochladen, Verwalten und Herunterladen persönlicher Dateien, die nicht für andere einsehbar sind. ',	'dispatch.php/document/files',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('b9586c280a0092f86f9392fe5b5ff2a0',	'b9586c280a0092f86f9392fe5b5ff2a0',	'en',	'Blubber is the Stud.IP real-time forum, a mixture of forum and chat. Others can be informed about a post by mentioning them by @username or @\'firstname surname\' in the post. Texts can be formatted and supplemented with smileys.',	'plugins.php/blubber/streams/global',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('bc1d6ecab9364cfe2c549d262bfda437',	'bc1d6ecab9364cfe2c549d262bfda437',	'de',	'Die Lernmodulschnittstelle ermöglicht es, Selbstlerneinheiten aus externen Programmen wie ILIAS und LON-CAPA in Stud.IP zur Verfügung zu stellen. Für jedes externe System wird ein eigener Benutzer-Account erstellt oder zugeordnet. Mit den entsprechenden Rechten können eigene Lernmodule erstellt werden.',	'dispatch.php/elearning/my_accounts',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('bcdedaf1b4bd3b96ef574e8230095b28',	'bcdedaf1b4bd3b96ef574e8230095b28',	'en',	'RSS feeds, i.e. news streams from external websites, can be integrated on the start page. The more feeds you include, the longer it takes to load the start page.',	'dispatch.php/admin/rss_feeds',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('bd0770f9eef5c10fc211114ac35fbe9b',	'bd0770f9eef5c10fc211114ac35fbe9b',	'de',	'Diese Seite zeigt die Studiengruppen an, denen die/der NutzerIn zugeordnet ist. Studiengruppen sind eine einfache Möglichkeit, mit Mitstudierenden, KollegInnen und anderen zusammenzuarbeiten. Jede/r NutzerIn kann Studiengruppen anlegen oder nach ihnen suchen. Die Farbgruppierung kann individuell angepasst werden.',	'dispatch.php/my_studygroups',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('bd5df4fb7b84da79149c96c5f43de46c',	'bd5df4fb7b84da79149c96c5f43de46c',	'en',	'Groups can be created and managed here. If the self-entry is activated, participants can register themselves and sign themselves out.',	'admin_statusgruppe.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('be204bdd0fce91702f51597bf8428fba',	'be204bdd0fce91702f51597bf8428fba',	'de',	'Das Wiki ermöglicht ein gemeinsames, asynchrones Erstellen und Bearbeiten von Texten. Texte lassen sich formatieren und miteinander verknüpfen, so dass ein verzweigtes Nachschlagewerk entsteht. ',	'wiki.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('bf9eb8f2c3842865009342b89fd35476',	'bf9eb8f2c3842865009342b89fd35476',	'de',	'Die Nachrichtenseite bietet einen Überblick über erhaltene, systeminterne Nachrichten, welche mit selbstgewählten Schlüsselwörtern (sog. Tags) versehen werden können, um sie später leichter wieder auffinden zu können.',	'dispatch.php/messages/overview',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('bfb70d5f036769d740fb2342b0b58183',	'bfb70d5f036769d740fb2342b0b58183',	'en',	'The learning module interface makes it possible to provide study units from external programs such as ILIAS and LON-CAPA in Stud.IP. A separate user account is created or assigned for each external system. With the appropriate rights, own learning modules can be created.',	'dispatch.php/elearning/my_accounts',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('c01725d6a3da568e1b07aee4e68a7e1f',	'c01725d6a3da568e1b07aee4e68a7e1f',	'de',	'Diese Seite ermöglicht das Hinterlegen von freien Informationen, Links etc.',	'dispatch.php/course/scm',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('c4dee277f741cfa7d5a65fa0c6bead4c',	'c4dee277f741cfa7d5a65fa0c6bead4c',	'de',	'Hier können Termine mit Themen versehen werden oder bereits eingegebene Themen übernommen und bearbeitet werden.',	'dispatch.php/course/topics',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('c8e789a0efb73f00f00dacf565524c73',	'c8e789a0efb73f00f00dacf565524c73',	'en',	'Various display and notification options can be selected and changed in the general settings.',	'dispatch.php/settings/general',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('cbd9b2b22fc00bc92df3589018644b70',	'cbd9b2b22fc00bc92df3589018644b70',	'de',	'Hier können vordefinierte Informationen über die eigene Person eingegeben werden, die auf der Profilseite erscheinen sollen. ',	'dispatch.php/settings/details',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('cd69b74cd46172785bf2147fb0582e3c',	'cd69b74cd46172785bf2147fb0582e3c',	'de',	'Hier kann ein benutzerdefinierter Blubber-Stream erstellt werden. Er besteht immer aus einer Sammlung von Beiträgen aus ausgewählten Veranstaltungen, Kontaktgruppen und Schlagwörten, die auf Basis einer Filterung noch weiter eingeschränkt werden können. Der neue benutzerdefinierte Stream findet sich nach dem Klick auf den Speichern-Button in der Navigation unter Globaler Stream.',	'plugins.php/blubber/streams/edit',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('ceb21257092b11dcf6897d5bb3085642',	'ceb21257092b11dcf6897d5bb3085642',	'en',	'An overview of sent, internal system messages, which can be provided with self-selected keywords (\"tags\") in order to be able to find them more easily later.',	'dispatch.php/messages/sent',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('d04ca1f9e867ee295a3025dac7ce9c7b',	'd04ca1f9e867ee295a3025dac7ce9c7b',	'en',	'View of the institutions assigned to the Stud.IP user.',	'dispatch.php/settings/statusgruppen',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('d1de152db139d8c12552610d2f7999c2',	'd1de152db139d8c12552610d2f7999c2',	'de',	'Mit dem Export können Daten über Veranstaltungen und MitarbeiterInnen in folgende Formate exportiert werden: RTF, TXT, CSV, PDF, HTML und XML.',	'export.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('d704267767d4c559aa9e552be60c49b5',	'd704267767d4c559aa9e552be60c49b5',	'de',	'Hier kann das Passwort für den Stud.IP-Account geändert werden.',	'dispatch.php/settings/password',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('d79ca3bc4a8251862339b1c934504a54',	'd79ca3bc4a8251862339b1c934504a54',	'de',	'Hier werden die selbstdefinierten Gruppen angezeigt. An diese können Nachrichten versendet werden. Ein Klick auf die orangenen Pfeile vor dem Gruppenname ordnet Sie der Gruppe zu.',	'statusgruppen.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('d97eff1196f6aed8e94f7c5096ebd2a9',	'd97eff1196f6aed8e94f7c5096ebd2a9',	'en',	'The overview contains course-related short and detailed information, announcements, dates and surveys.',	'dispatch.php/course/overview',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('db5a995bd12ba8e2ae96adcabeb8c8f7',	'db5a995bd12ba8e2ae96adcabeb8c8f7',	'de',	'Der Terminkalender besteht aus abonnierten Veranstaltungen und eigenen Terminen. Er kann bearbeitet, in der Anzeige verändert und mit externen Programmen (z.B. Outlook) abgeglichen werden. ',	'calendar.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('dddf5fd4406da0d91c9f121fcae607ad',	'dddf5fd4406da0d91c9f121fcae607ad',	'en',	'The appointment calendar consists of subscribed courses and your own appointments. It can be edited, changed in the display and compared with external programs (e.g. Outlook).',	'calendar.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('e03cec310c0a884aee80c2d1eea3a53e',	'e03cec310c0a884aee80c2d1eea3a53e',	'de',	'Diese Seite zeigt alle Studiengruppen an, die in Stud.IP existieren. Studiengruppen sind eine einfache Möglichkeit, mit Mitstudierenden, KollegInnen und anderen zusammenzuarbeiten. Jede/r NutzerIn kann Studiengruppen anlegen oder nach ihnen suchen.',	'dispatch.php/studygroup/browse',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('e206a4257e31a0f32ac516cefb8e8331',	'e206a4257e31a0f32ac516cefb8e8331',	'en',	'You can find university ressources like rooms, buildings etc. with the ressource search engine.',	'resources.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('e22701c71b4425fb5a95adf725866097',	'e22701c71b4425fb5a95adf725866097',	'de',	'Hier können Gruppen erstellt und verwaltet werden. Wenn der Selbsteintrag aktiviert ist, können sich TeilnehmerInnen selbst ein- und austragen.',	'admin_statusgruppe.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('e29098d188ae25c298d78978de50bf09',	'e29098d188ae25c298d78978de50bf09',	'de',	'Hier kann in Katalogen nach Literatur gesucht und diese zur Merkliste hinzugefügt werden.',	'dispatch.php/literature/search',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('e315a4c547be7f17d427b227f0f9d982',	'e315a4c547be7f17d427b227f0f9d982',	'de',	'Auf dieser Seite können selbstdefinierte Informationen über die eigene Person eingegeben werden, die auf der Profilseite erscheinen sollen. ',	'dispatch.php/settings/categories',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('e5bff29f7adee43202a2aa8f3f0a6ec7',	'e5bff29f7adee43202a2aa8f3f0a6ec7',	'en',	'The profile page allows you to change your own user data including profile picture and categories. Similar to Facebook, comments can be left. The lecturer\'s profile contains office hours and room details. In addition, the page offers the management of own files.',	'dispatch.php/profile',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('e939ac70210674f49a36ac428167a9b8',	'e939ac70210674f49a36ac428167a9b8',	'de',	'Mit der Umfragen-und-Tests-Funktion lassen sich (zeitgesteuerte) Umfragen oder einzelne Multiple-/Single-Choice-Fragen für Veranstaltungen, Studiengruppen oder das Profil erstellen.',	'admin_vote.php',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('ebb5bc1d831d460c06e3c6662236c159',	'ebb5bc1d831d460c06e3c6662236c159',	'de',	'Hier kann ein Profilbild hochgeladen werden.',	'dispatch.php/settings/avatar',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('ebcc460880b8a63af3f6e7eade97db78',	'ebcc460880b8a63af3f6e7eade97db78',	'en',	'With the user search, users can be found as long as their privacy settings do not prevent this. The search can be limited to certain courses or institutions.',	'browse.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('ee91ec0f9085221ada06d171a27d2405',	'ee91ec0f9085221ada06d171a27d2405',	'en',	'File management offers the possibility to upload, link to, manage and download files.',	'folder.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('eec46c5d8ea5523d959a8c334455c2ef',	'eec46c5d8ea5523d959a8c334455c2ef',	'en',	'You can use the fields of study-feature to assign a course to a field of study. Editing can be locked if data is transferred from other systems (for example, LSF/ UniVZ).',	'dispatch.php/course/study_areas/show',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('f3deb7a01205637d71a66e2b90b24cba',	'f3deb7a01205637d71a66e2b90b24cba',	'de',	'Hier können RSS-Feeds, d.h. Nachrichtenströme von externen Internetseiten, auf der Startseite eingebunden werden. Je mehr Feeds eingebunden werden, desto länger dauert das Laden der Startseite.',	'dispatch.php/admin/rss_feeds',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('f529bca4d1626b43cbb8149feea41a84',	'f529bca4d1626b43cbb8149feea41a84',	'en',	'The self-defined groups are displayed here. Messages can be sent to these groups. A click on the orange arrows in front of the group name assigns you to the group.',	'statusgruppen.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('f5e59c4fc98e1df7fe29b8e9320853e7',	'f5e59c4fc98e1df7fe29b8e9320853e7',	'en',	'In the privacy settings you can set the visibility and discoverability of your own profile.',	'dispatch.php/settings/privacy',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('f92b5422246f585f051de1a81602dd56',	'f92b5422246f585f051de1a81602dd56',	'de',	'Hier können Name, Funktionen und Zugangsbeschränkung der Studiengruppe bearbeitet werden.',	'dispatch.php/course/studygroup/edit',	'3.1',	0,	0,	1,	'',	'',	1406641688,	0),
('f966e348174927565b94e606bbcf064f',	'f966e348174927565b94e606bbcf064f',	'en',	'The message page provides an overview of received, internal system messages, which can be assigned self-selected keywords (\"tags\") to make them easier to find later.',	'dispatch.php/messages/overview',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('fa4bf491690645a5f12556f77e51233c',	'fa4bf491690645a5f12556f77e51233c',	'en',	'Here you can edit reference lists and make them visible in a course (click on the \"eye\").',	'dispatch.php/literature/edit_list.php',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0),
('fe23b56f4d691c0f5e2f872e37ce38b5',	'fe23b56f4d691c0f5e2f872e37ce38b5',	'en',	'Individual user data e.g. email address, can be changed on this page.',	'dispatch.php/settings/account',	'4.4',	0,	0,	1,	'',	'',	1412942388,	0);

DROP TABLE IF EXISTS `help_tours`;
CREATE TABLE `help_tours` (
  `global_tour_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tour_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('tour','wizard') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT 1,
  `language` char(2) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'de',
  `studip_version` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `installation_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'demo-installation',
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) unsigned NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL,
  PRIMARY KEY (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `help_tour_audiences`;
CREATE TABLE `help_tour_audiences` (
  `tour_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `type` enum('inst','sem','studiengang','abschluss','userdomain','tour') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`tour_id`,`range_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `help_tour_settings`;
CREATE TABLE `help_tour_settings` (
  `tour_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `active` tinyint(4) NOT NULL,
  `access` enum('standard','link','autostart','autostart_once') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `help_tour_settings` (`tour_id`, `active`, `access`) VALUES
('05434e40601a9a2a7f5fa8208ae148c1',	1,	'standard'),
('0b542c6c891af499763356f2c7218f7f',	1,	'autostart_once'),
('154e711257d4d32d865fb8f5fb70ad72',	1,	'standard'),
('19ac063e8319310d059d28379139b1cf',	1,	'standard'),
('1badcf28ab5b206d9150b2b9683b4cb6',	1,	'standard'),
('21f487fa74e3bfc7789886f40fe4131a',	1,	'standard'),
('25e7421f286fc5bdf9e41beadb484ffa',	1,	'standard'),
('3629493a16bf2680de64361f07cab096',	1,	'standard'),
('3a717a468afb0822cb1455e0ae6b6fce',	1,	'standard'),
('3dbe7099f82dcdbba4580acb1105a0d6',	1,	'standard'),
('44f859c50648d3410c39207048ddd833',	1,	'standard'),
('49604a77654617a745e29ad6b253e491',	1,	'standard'),
('4d41c9760a3248313236af202275107a',	1,	'standard'),
('4d41c9760a3248313236af202275107b',	1,	'standard'),
('4d41c9760a3248313236af202275107c',	1,	'standard'),
('588effa83da976a889a68c152bcabc90',	1,	'standard'),
('5d41c9760a3248313236af202275107a',	1,	'standard'),
('5d41c9760a3248313236af202275107b',	1,	'standard'),
('5d41c9760a3248313236af202275107c',	1,	'standard'),
('6849293baa05be5bef8ff438dc7c438b',	1,	'standard'),
('7af1e1fb7f53c910ba9f42f43a71c723',	1,	'standard'),
('7cccbe3b22dfa745c17cb776fb04537c',	1,	'standard'),
('83dc1d25e924f2748ee3293aaf0ede8e',	1,	'standard'),
('89786eac42f52ac316790825b4f5c0b2',	1,	'standard'),
('96ea422f286fb5bbf9e41beadb484a9a',	1,	'standard'),
('977f41c5c5239c4e86f04c3df27fae38',	0,	'autostart_once'),
('9e9dca9b1214294b9605824bfe90fba1',	1,	'standard'),
('b74f8459dce2437463096d56db7c73b9',	1,	'standard'),
('c89ce8e097f212e75686f73cc5008711',	1,	'standard'),
('d9913517f9c81d2c0fa8362592ce5d0e',	1,	'standard'),
('de1fbce508d01cbd257f9904ff8c3b43',	1,	'standard'),
('e41611616675b218845fe9f55bc11cf6',	1,	'standard'),
('edfcf78c614869724f93488c4ed09582',	1,	'standard'),
('ef5092ba722c81c37a5a6bd703890bd9',	1,	'standard'),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	1,	'standard'),
('fa963d2ca827b28e0082e98aafc88765',	1,	'standard');

DROP TABLE IF EXISTS `help_tour_steps`;
CREATE TABLE `help_tour_steps` (
  `tour_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `step` tinyint(4) NOT NULL DEFAULT 1,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `orientation` enum('T','TL','TR','L','LT','LB','B','BL','BR','R','RT','RB') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'B',
  `interactive` tinyint(4) NOT NULL,
  `css_selector` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `action_prev` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_next` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) unsigned NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL,
  PRIMARY KEY (`tour_id`,`step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `help_tour_steps` (`tour_id`, `step`, `title`, `tip`, `orientation`, `interactive`, `css_selector`, `route`, `action_prev`, `action_next`, `author_email`, `mkdate`, `chdate`) VALUES
('05434e40601a9a2a7f5fa8208ae148c1',	1,	'My documents',	'This tour provides an overview of the personal document manager.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'dispatch.php/document/files',	'',	'',	'',	1405592884,	0),
('05434e40601a9a2a7f5fa8208ae148c1',	2,	'Available storage space',	'The storage space of the personal document area is limited. It is displayed how much storage space is still available.',	'BR',	0,	'DIV.caption-actions',	'dispatch.php/document/files',	'',	'',	'',	1405594184,	0),
('05434e40601a9a2a7f5fa8208ae148c1',	3,	'New documents and indices',	'New documents can be uploaded from the computer into the personal document area and new indices can be created here.',	'TL',	0,	'#layout-sidebar SECTION DIV DIV UL LI A :eq(0)',	'dispatch.php/document/files',	'',	'',	'',	1405593409,	0),
('05434e40601a9a2a7f5fa8208ae148c1',	4,	'Document overview',	'All documents and indices are listed in a tabular form. In addition to the name even more information is displayed such as the document type or the document size.',	'TL',	0,	'#layout_content FORM TABLE THEAD TR TH :eq(3)',	'dispatch.php/document/files',	'',	'',	'',	1405593089,	0),
('05434e40601a9a2a7f5fa8208ae148c1',	5,	'Actions',	'Already uploaded documents and folders can be edited, downloaded, shifted, copied and deleted here.',	'TR',	0,	'#layout_content FORM TABLE THEAD TR TH :eq(7)',	'dispatch.php/document/files',	'',	'',	'',	1405594079,	0),
('05434e40601a9a2a7f5fa8208ae148c1',	6,	'Export',	'Here you have the possibility to download individual folders or the full document area as a ZIP document. All documents and indices are contained therein.',	'TL',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'dispatch.php/document/files',	'',	'',	'',	1405593708,	0),
('0b542c6c891af499763356f2c7218f7f',	1,	'Willkommen in Stud.IP 4!',	'Unter der Haube ist alles neu, auch an der Oberfläche hat sich einiges getan.',	'B',	0,	'',	'dispatch.php/start',	'',	'',	'root@localhost',	1514883131,	1514883295),
('0b542c6c891af499763356f2c7218f7f',	2,	'',	'Die wichtigsten Neuigkeiten im Schnelldurchlauf:',	'B',	0,	'',	'dispatch.php/start',	'',	'',	'root@localhost',	1514883334,	1514883383),
('0b542c6c891af499763356f2c7218f7f',	3,	'',	'Die Startseite lässt sich anpassen. Sie können selbst bestimmen, was angezeigt werden soll. Per Drag & Drop können sie die Position der Elemente auf der Startseite verändern.',	'R',	0,	'.sidebar-widget:eq(1) A:eq(0)',	'dispatch.php/start',	'',	'',	'root@localhost',	1514883313,	1516748869),
('0b542c6c891af499763356f2c7218f7f',	4,	'',	'Alle persönlichen Funktionen sind in diesem Menü zusammengefasst. Der persönliche Dateibereich ist nun immer standardmäßig eingeschaltet.',	'B',	0,	'#avatar-arrow',	'dispatch.php/start',	'',	'',	'root@localhost',	1514883360,	1516749166),
('0b542c6c891af499763356f2c7218f7f',	5,	'',	'Alle Dateibereiche wurden in Stud.IP 4 komplett überarbeitet. Im persönlichen Dateibereich finden sich u.a. Nachrichtenanhänge. Sie können aber auch eigene Ordner erstellen und diese auf ihrer Profilseite anderen zugänglich machen. In Veranstaltungen gibt es weitere Typen von Dateiordnern, wie den Hausaufgabenordner.',	'B',	0,	'',	'dispatch.php/files',	'',	'',	'root@localhost',	1514883588,	1514883588),
('0b542c6c891af499763356f2c7218f7f',	6,	'',	'Falls von der Hochschule gestattet, können Sie hier Owncloud/Nextcloud oder Powerfolder für die Dateiverwaltung koppeln.',	'R',	0,	'.sidebar-widget:eq(0) A:eq(0)',	'dispatch.php/files',	'',	'',	'root@localhost',	1514883641,	1516749255),
('0b542c6c891af499763356f2c7218f7f',	7,	'',	'Weniger häufig benötigte Funktionen sind in Stud.IP 4 hinter dem Aktionsmenü mit den drei Punkten zu finden.',	'LT',	0,	'table.documents nav.action-menu',	'dispatch.php/files',	'',	'',	'root@localhost',	1514883706,	1516749543),
('0b542c6c891af499763356f2c7218f7f',	8,	'',	'Ebenfalls neu ist die dezente Navigationszeile. Der gerade aktive Bereich wird durch eine Linie angezeigt.',	'B',	0,	'#tabs',	'dispatch.php/files',	'',	'',	'root@localhost',	1514883773,	1514883781),
('0b542c6c891af499763356f2c7218f7f',	9,	'',	'Das waren die allerwichtigsten Dinge im Überblick. In Stud.IP 4 hat sich aber noch viel mehr getan. Jedes Detail wurde durchdacht und verbessert . Damit ist Stud.IP 4 das modernste Open-Source-LMS auf dem Markt.',	'B',	0,	'',	'dispatch.php/files',	'',	'',	'root@localhost',	1514883871,	1514883871),
('0b542c6c891af499763356f2c7218f7f',	10,	'Das Stud.IP-Team wünscht viel Erfolg bei der Arbeit mit Stud.IP 4!',	'',	'B',	0,	'',	'dispatch.php/start',	'',	'',	'root@localhost',	1514883886,	1514883946),
('154e711257d4d32d865fb8f5fb70ad72',	1,	'Meine Dateien',	'Meine Dateien ist der persönliche Dateibereich. Hier können Dateien auf Stud.IP gespeichert werden, um sie von dort auf andere Rechner herunterladen zu können.\r\n\r\nAndere Studierende oder Dozierende erhalten keinen Zugriff auf Dateien, die in den persönlichen Dateibereich hochgeladen werden.\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'dispatch.php/document/files',	'',	'',	'',	1405592884,	0),
('154e711257d4d32d865fb8f5fb70ad72',	2,	'Verfügbarer Speicherplatz',	'Der Speicherplatz des persönlichen Dateibereichs ist begrenzt. Es wird angezeigt, wie viel Speicherplatz noch verfügbar ist.',	'BR',	0,	'DIV.caption-actions',	'dispatch.php/document/files',	'',	'',	'',	1405594184,	0),
('154e711257d4d32d865fb8f5fb70ad72',	3,	'Neue Dateien und Verzeichnisse',	'Hier können neue Dateien von dem Computer in den persönlichen Dateibereich hochgeladen und neue Verzeichnisse erstellt werden.',	'TL',	0,	'#layout-sidebar SECTION DIV DIV UL LI A :eq(0)',	'dispatch.php/document/files',	'',	'',	'',	1405593409,	0),
('154e711257d4d32d865fb8f5fb70ad72',	4,	'Dateiübersicht',	'Alle Dateien und Verzeichnisse werden tabellarisch aufgelistet. Neben dem Namen werden noch weitere Informationen wie der Dateityp oder die Dateigröße angezeigt.',	'TL',	0,	'#layout_content FORM TABLE THEAD TR TH :eq(3)',	'dispatch.php/document/files',	'',	'',	'',	1405593089,	0),
('154e711257d4d32d865fb8f5fb70ad72',	5,	'Aktionen',	'Bereits hochgeladene Dateien und Ordner können hier bearbeitet, heruntergeladen, verschoben, kopiert und gelöscht werden.',	'TR',	0,	'#layout_content FORM TABLE THEAD TR TH :eq(7)',	'dispatch.php/document/files',	'',	'',	'',	1405594079,	0),
('154e711257d4d32d865fb8f5fb70ad72',	6,	'Export',	'Hier besteht die Möglichkeit einzelne Ordner oder den vollständigen Dateibereich als ZIP-Datei herunterzuladen. Darin sind alle Dateien und Verzeichnisse enthalten.',	'TL',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'dispatch.php/document/files',	'',	'',	'',	1405593708,	0),
('19ac063e8319310d059d28379139b1cf',	1,	'Studiengruppe anlegen',	'Studiengruppen ermöglichen die Zusammenarbeit mit KommilitonInnen oder KolegInnen. Diese Tour gibt Ihnen einen Überblick darüber wie Sie Studiengruppen anlegen können.\r\n\r\nUm zum nächsten Schritt zu gelangen, klicken Sie bitte rechts unten auf \"Weiter\".',	'R',	0,	'',	'dispatch.php/my_studygroups',	'',	'',	'',	1405684423,	0),
('19ac063e8319310d059d28379139b1cf',	2,	'Studiengruppe anlegen',	'Mit Klick auf \"Neue Studiengruppe anlegen\" kann eine neue Studiengruppe angelegt werden.',	'R',	0,	'A#nav_browse_new',	'dispatch.php/my_studygroups',	'',	'',	'',	1406017730,	0),
('19ac063e8319310d059d28379139b1cf',	3,	'Studiengruppe benennen',	'Der Name einer Studiengruppe sollte aussagekräftig sein und einmalig im gesamten Stud.IP.',	'R',	0,	'INPUT#groupname',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405684720,	0),
('19ac063e8319310d059d28379139b1cf',	4,	'Beschreibung hinzufügen',	'Die Beschreibung ermöglicht es weitere Informationen anzuzeigen und somit das Auffinden der Gruppe zu erleichtern.',	'R',	0,	'TEXTAREA#groupdescription',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405684806,	0),
('19ac063e8319310d059d28379139b1cf',	5,	'Inhaltselemente zuordnen',	'Hier können Inhaltselemente aktiviert werden, welche  innerhalb der Studiengruppe zur Verfügung stehen sollen. Das Fragezeichen gibt nähere Informationen zur Bedeutung der einzelnen Inhaltselemente.',	'L',	0,	'#layout_content FORM TABLE TBODY TR TD :eq(5)',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405685093,	0),
('19ac063e8319310d059d28379139b1cf',	6,	'Zugang festlegen',	'Mit diesem Drop-down-Menü kann der Zugang zur Studiengruppe eingeschränkt werden.\r\n\r\nBeim Zugang \"offen für alle\" können sich alle Studierenden frei eintragen und an der Gruppe beteiligen.\r\n\r\nBeim Zugang \"Auf Anfrage\" müssen Teilnehmer durch den Gruppengründer hinzugefügt werden.',	'R',	0,	'SELECT#groupaccess',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405685334,	0),
('19ac063e8319310d059d28379139b1cf',	7,	'Nutzungsbedingungen akzeptieren',	'Bei der Erstellung einer Studiengruppe müssen die Nutzungsbedingungen akzeptiert werden.',	'R',	0,	'P LABEL',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405685652,	0),
('19ac063e8319310d059d28379139b1cf',	8,	'Studiengruppe speichern',	'Nach dem Speichern einer Studiengruppe erscheint diese unter \"Veranstaltungen > Meine Studiengruppen\".',	'L',	0,	'#layout_content FORM TABLE TBODY TR TD :eq(14)',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405686068,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	1,	'Help tour \"My event\"',	'This tour provides an overview of the functionality of \"My courses\".\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'dispatch.php/my_courses',	'',	'',	'',	1406125847,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	2,	'Overview of events',	'The courses of the current and past semester are displayed here. New courses initially appear in red.',	'TL',	0,	'#my_seminars TABLE THEAD TR TH :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1406125908,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	3,	'Event details',	'With a click on the \"i\" a window appears with the most important facts of the courses.',	'T',	0,	'#my_seminars TABLE THEAD TR TH :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1406125992,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	4,	'Course contents',	'All contents (such as e.g. a forum) are displayed by corresponding symbols here.\n\nIf there were any news since the last login these will appear in red.',	'LT',	0,	'#my_seminars TABLE THEAD TR TH :eq(4)',	'dispatch.php/my_courses',	'',	'',	'',	1406126049,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	5,	'Editing or deletion of an event',	'A click on the cog wheel enables you to edit a course.\n\nIf you have participant status in a course, you can sign out by clicking on the door icon.',	'TR',	0,	'#my_seminars TABLE THEAD TR TH :eq(5)',	'dispatch.php/my_courses',	'',	'',	'',	1406126134,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	6,	'Adjustment to the event view',	'In order to adjust the course overview you can order your courses according to certain criteria (such as e.g. fields of study, lecturers, or colours).',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1406126281,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	7,	'Access to an event of past and future semesters',	'For example, by clicking on the drop-down menu, courses from past semesters can be displayed.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1406126316,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	8,	'Further possible actions',	'Here you can mark all news as read, change colour groups as you please, and also adjust the notifications about activities in the individual courses.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'dispatch.php/my_courses',	'',	'',	'',	1406126374,	0),
('1badcf28ab5b206d9150b2b9683b4cb6',	9,	'Study groups and facilities',	'There is moreover the possibility to access personal study groups or facilities.',	'R',	0,	'#nav_browse_my_institutes A',	'dispatch.php/my_courses',	'',	'',	'',	1406126415,	0),
('21f487fa74e3bfc7789886f40fe4131a',	1,	'Forum',	'Diese Tour gibt einen Überblick über die Elemente und Interaktionsmöglichkeiten des Forums.\r\n\r\nUm zum nächsten Schritt zu gelangen, klicken Sie bitte rechts unten auf \"Weiter\".',	'BL',	0,	'',	'plugins.php/coreforum',	'',	'',	'',	1405415772,	0),
('21f487fa74e3bfc7789886f40fe4131a',	2,	'Sie befinden sich hier:...',	'An dieser Stelle wird angezeigt, welcher Bereich des Forums gerade betrachtet wird.',	'BL',	0,	'DIV#tutorBreadcrumb',	'plugins.php/coreforum',	'',	'',	'',	1405415875,	0),
('21f487fa74e3bfc7789886f40fe4131a',	3,	'Kategorie',	'Das Forum ist unterteilt in Kategorien, Themen und Beiträge. Eine Kategorie fasst Forumsbereiche in größere Sinneinheiten zusammen.',	'BL',	0,	'#layout_content #forum #sortable_areas TABLE CAPTION .category_name :eq(0)',	'plugins.php/coreforum',	'',	'',	'',	1405416611,	0),
('21f487fa74e3bfc7789886f40fe4131a',	4,	'Bereich',	'Das ist ein Bereich innerhalb einer Kategorie. Bereiche beinhalten die Diskussionstränge. Bereiche können mit per drag & drop in ihrer Reihenfolge verschoben werden.',	'BL',	0,	'#layout_content #forum TABLE THEAD TR TH :eq(0)',	'plugins.php/coreforum',	'',	'',	'',	1405416664,	0),
('21f487fa74e3bfc7789886f40fe4131a',	5,	'Info-Icon',	'Dieses Icon färbt sich rot, sobald es etwas neues in diesem Bereich gibt.',	'B',	0,	'IMG#tutorNotificationIcon',	'plugins.php/coreforum',	'',	'',	'',	1405416705,	0),
('21f487fa74e3bfc7789886f40fe4131a',	6,	'Suchen',	'Hier können sämtliche Inhalte dieses Forums durchsucht werden.\r\nUnterstützt werden auch Mehrwortsuchen. Außerdem kann die Suche auf eine beliebige Kombination aus Titel, Inhalt und Autor eingeschränkt werden.',	'BL',	0,	'#layout-sidebar SECTION #tutorSearchInfobox DIV #tutorSearchInfobox UL LI INPUT :eq(1)',	'plugins.php/coreforum',	'',	'',	'',	1405417134,	0),
('21f487fa74e3bfc7789886f40fe4131a',	7,	'Forum abonnieren',	'Das gesamte Forum, oder einzelne Themen können abonniert werden. Dann wird bei jedem neuen Beitrag in diesem Forum eine Benachrichtigung angezeigt und eine Nachricht versendet.',	'B',	0,	'#layout-sidebar SECTION DIV DIV UL LI A :eq(5)',	'plugins.php/coreforum',	'',	'',	'',	1405416795,	0),
('25e7421f286fc5bdf9e41beadb484ffa',	1,	'Profil',	'Diese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen des \"Profils\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'B',	0,	'',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('25e7421f286fc5bdf9e41beadb484ffa',	2,	'Bild hochladen',	'Auf dieser Seite lässt sich ein Profilbild hochladen.',	'BL',	0,	'#nav_profile_avatar A SPAN',	'dispatch.php/settings/avatar',	'',	'',	'',	1406722657,	0),
('25e7421f286fc5bdf9e41beadb484ffa',	3,	'Bild auswählen',	'Dafür kann eine beliebige Bilddatei hochgeladen werden.',	'L',	0,	'input[name=imgfile]',	'dispatch.php/settings/avatar',	'',	'',	'',	1406722657,	0),
('25e7421f286fc5bdf9e41beadb484ffa',	4,	'Voraussetzungen',	'Eine Bilddatei muss im **.jpg**, **.png** oder **.gif** Format vorliegen.\r\nDie Dateigröße darf 700 KB nicht überschreiten.',	'L',	0,	'#layout_content #edit_avatar TBODY TR TD FORM B :eq(2)',	'dispatch.php/settings/avatar',	'',	'',	'',	1406722657,	0),
('3629493a16bf2680de64361f07cab096',	1,	'Was ist Blubbern?',	'Diese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen von \"Blubber\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405507364,	0),
('3629493a16bf2680de64361f07cab096',	2,	'Beitrag erstellen',	'Hier kann eine Diskussion durch Schreiben von Text begonnen werden. Absätze lassen sich durch Drücken von Umschalt+Eingabe erzeugen. Der Text wird durch Drücken von Eingabe abgeschickt.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405507478,	0),
('3629493a16bf2680de64361f07cab096',	3,	'Text gestalten',	'Der Text kann formatiert und mit Smileys versehen werden.\r\nEs können die üblichen Formatierungen verwendet werden, wie z. B. **fett** oder %%kursiv%%.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508371,	0),
('3629493a16bf2680de64361f07cab096',	4,	'Personen erwähnen',	'Andere können über einen Beitrag informiert werden, indem sie per @benutzername oder @\"Vorname Nachname\" im Beitrag erwähnt werden.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405672301,	0),
('3629493a16bf2680de64361f07cab096',	5,	'Datei hinzufügen',	'Dateien können in einen Beitrag eingefügt werden, indem sie per Drag&Drop in ein Eingabefeld gezogen werden.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508401,	0),
('3629493a16bf2680de64361f07cab096',	6,	'Schlagworte',	'Beiträge können mit Schlagworten (engl. \"Hashtags\") versehen werden, indem einem beliebigen Wort des Beitrags ein # vorangestellt wird.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508442,	0),
('3629493a16bf2680de64361f07cab096',	7,	'Schlagwortwolke',	'Durch Anklicken eines Schlagwortes werden alle Beiträge aufgelistet, die dieses Schlagwort enthalten.',	'RT',	0,	'DIV.sidebar-widget-header',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508505,	0),
('3629493a16bf2680de64361f07cab096',	8,	'Beitrag ändern',	'Wird der Mauszeiger auf einem beliebigen Beitrag positioniert, erscheint dessen Datum. Bei eigenen Beiträgen erscheint außerdem rechts neben dem Datum ein Icon, mit dem der Beitrag nachträglich geändert werden kann.',	'BR',	0,	'DIV DIV A SPAN.time',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405507901,	0),
('3629493a16bf2680de64361f07cab096',	9,	'Beitrag verlinken',	'Wird der Mauszeiger auf dem ersten Diskussionsbeitrag positioniert, erscheint links neben dem Datum ein Link-Icon. Wenn dieses mit der rechten Maustaste angeklickt wird, kann der Link auf diesen Beitrag kopiert werden, um ihn an anderer Stelle einfügen zu können.',	'BR',	0,	'DIV DIV A.permalink',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508281,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	1,	'Was ist Blubbern?',	'Diese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen von \"Blubber\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405507364,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	2,	'Beitrag erstellen',	'Hier kann eine Diskussion durch Schreiben von Text begonnen werden. Absätze lassen sich durch Drücken von Umschalt+Eingabe erzeugen. Der Text wird durch Drücken von Eingabe abgeschickt.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405507478,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	3,	'Text gestalten',	'Der Text kann formatiert und mit Smileys versehen werden.\r\nEs können die üblichen Formatierungen verwendet werden, wie z. B. **fett** oder %%kursiv%%.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508371,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	4,	'Personen erwähnen',	'Andere können über einen Beitrag informiert werden, indem sie per @benutzername oder @\"Vorname Nachname\" im Beitrag erwähnt werden.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405672301,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	5,	'Datei hinzufügen',	'Dateien können in einen Beitrag eingefügt werden, indem sie per Drag&Drop in ein Eingabefeld gezogen werden.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508401,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	6,	'Schlagworte',	'Beiträge können mit Schlagworten (engl. \"Hashtags\") versehen werden, indem einem beliebigen Wort des Beitrags ein # vorangestellt wird.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508442,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	7,	'Schlagwortwolke',	'Durch Anklicken eines Schlagwortes werden alle Beiträge aufgelistet, die dieses Schlagwort enthalten.',	'RT',	0,	'DIV.sidebar-widget-header',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508505,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	8,	'Beitrag ändern',	'Wird der Mauszeiger auf einem beliebigen Beitrag positioniert, erscheint dessen Datum. Bei eigenen Beiträgen erscheint außerdem rechts neben dem Datum ein Icon, mit dem der Beitrag nachträglich geändert werden kann.',	'BR',	0,	'DIV DIV A SPAN.time',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405507901,	0),
('3a717a468afb0822cb1455e0ae6b6fce',	9,	'Beitrag verlinken',	'Wird der Mauszeiger auf dem ersten Diskussionsbeitrag positioniert, erscheint links neben dem Datum ein Link-Icon. Wenn dieses mit der rechten Maustaste angeklickt wird, kann der Link auf diesen Beitrag kopiert werden, um ihn an anderer Stelle einfügen zu können.',	'BR',	0,	'DIV DIV A.permalink',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508281,	0),
('3dbe7099f82dcdbba4580acb1105a0d6',	1,	'Administering the forum',	'This tour provides an overview of the forum\'s administration.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'plugins.php/coreforum',	'',	'',	'',	1405418008,	0),
('3dbe7099f82dcdbba4580acb1105a0d6',	2,	'Edit category',	'The name of the category can be changed or, however, the whole category deleted with these icons. The sectors will in this case be shifted into the category \"General\" and are thus retained.\n\nThe category \"General\" cannot be deleted and is therefore included in each forum.',	'BR',	0,	'#forum #sortable_areas TABLE CAPTION #tutorCategoryIcons',	'plugins.php/coreforum',	'',	'',	'',	1405424216,	0),
('3dbe7099f82dcdbba4580acb1105a0d6',	3,	'Edit area',	'Action icons will appear, if the cursor is positioned on an area\n\nYou can use the icons to change the name and description of an area, or to delete the whole area.\nThe deletion of an area causes all contained topics to be deleted.',	'B',	0,	'IMG.edit-area',	'plugins.php/coreforum',	'',	'',	'',	1405424346,	0),
('3dbe7099f82dcdbba4580acb1105a0d6',	4,	'Sort area',	'With this hatched surface areas can be sorted in at any place by clicking and dragging. This can, on one hand, be used in order to sort areas within a category, and on the other hand, areas can be shifted into other categories.',	'BR',	0,	'HTML #plugins #layout_wrapper #layout_page #layout_container #layout_content #forum #sortable_areas TABLE TBODY #tutorArea TD IMG#tutorMoveArea.handle.js :eq(1)',	'plugins.php/coreforum',	'',	'',	'',	1405424379,	0),
('3dbe7099f82dcdbba4580acb1105a0d6',	5,	'Add new area',	'New areas can be added to a category here.',	'BR',	0,	'TFOOT TR TD A SPAN',	'plugins.php/coreforum',	'',	'',	'',	1405424421,	0),
('3dbe7099f82dcdbba4580acb1105a0d6',	6,	'Create new category',	'A new category in the forum can be created here. Enter the title of the new category for this purpose.',	'TL',	0,	'#tutorAddCategory H2',	'plugins.php/coreforum',	'',	'',	'',	1405424458,	0),
('44f859c50648d3410c39207048ddd833',	1,	'Forum verwalten',	'Sie haben die Möglichkeit sich eine Tour zur Verwaltung des Forums anzuschauen.\r\n\r\nUm die Tour zu beginnen, klicken Sie bitte unten rechts auf \"Weiter\".',	'TL',	0,	'',	'plugins.php/coreforum',	'',	'',	'',	1405418008,	0),
('44f859c50648d3410c39207048ddd833',	2,	'Kategorie bearbeiten',	'Mit diesen Icons kann der Name der Kategorie geändert oder aber die gesamte Kategorie gelöscht werden. Die Bereiche werden in diesem Fall in die Kategorie \"Allgemein\" verschoben und bleiben somit erhalten.\r\n\r\nDie Kategorie \"Allgemein\" kann nicht gelöscht werden und ist daher in jedem Forum enthalten.',	'BR',	0,	'#forum #sortable_areas TABLE CAPTION #tutorCategoryIcons',	'plugins.php/coreforum',	'',	'',	'',	1405424216,	0),
('44f859c50648d3410c39207048ddd833',	3,	'Bereich bearbeiten',	'Wird der Mauszeiger auf einem Bereich positioniert, erscheinen Aktions-Icons.\r\nMit diesen Icons kann der Name und die Beschreibung eines Bereiches geändert oder auch der gesamte Bereich gelöscht werden.\r\nDas Löschen eines Bereichs, führt dazu, dass alle enthaltenen Themen gelöscht werden.',	'B',	0,	'IMG.edit-area',	'plugins.php/coreforum',	'',	'',	'',	1405424346,	0),
('44f859c50648d3410c39207048ddd833',	4,	'Bereiche sortieren',	'Mit dieser schraffierten Fläche können Bereiche an einer beliebigen Stelle durch Klicken-und-Ziehen einsortiert werden. Dies kann einerseits dazu verwendet werden, um Bereiche innerhalb einer Kategorie zu sortieren, andererseits können Bereiche in andere Kategorien verschoben werden.',	'BR',	0,	'HTML #plugins #layout_wrapper #layout_page #layout_container #layout_content #forum #sortable_areas TABLE TBODY #tutorArea TD IMG#tutorMoveArea.handle.js :eq(1)',	'plugins.php/coreforum',	'',	'',	'',	1405424379,	0),
('44f859c50648d3410c39207048ddd833',	5,	'Neuen Bereich hinzufügen',	'Hier können neue Bereiche zu einer Kategorie hinzugefügt werden.',	'BR',	0,	'TFOOT TR TD A SPAN',	'plugins.php/coreforum',	'',	'',	'',	1405424421,	0),
('44f859c50648d3410c39207048ddd833',	6,	'Neue Kategorie erstellen',	'Hier kann eine neue Kategorie im Forum erstellt werden. Geben Sie hierfür den Titel der neuen Kategorie ein.',	'TL',	0,	'#tutorAddCategory H2',	'plugins.php/coreforum',	'',	'',	'',	1405424458,	0),
('49604a77654617a745e29ad6b253e491',	1,	'Funktionen und Gestaltungs-möglichkeiten der Startseite',	'\r\nDiese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen der \"Startseite\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1405934926,	0),
('49604a77654617a745e29ad6b253e491',	2,	'Individuelle Gestaltung der Startseite',	'Die Startseite ist standardmäßig so konfiguriert, dass die Elemente \"Schnellzugriff\", \"Ankündigungen\", \"Meine aktuellen Termine\" und  \"Umfragen\" angezeigt werden. Die Elemente werden Widgets genannt und  können entfernt, hinzugefügt und verschoben werde.n Jedes Widget kann individuell hinzugefügt, entfernt und verschoben werden.',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1405934970,	0),
('49604a77654617a745e29ad6b253e491',	3,	'Widget hinzufügen',	'Hier können Widgets hinzugefügt werden. Zusätzlich zu den Standard-Widgets kann beispielsweise der persönliche Stundenplan auf der Startseite anzeigt werden. Neu hinzugefügte Widgets erscheinen ganz unten auf der Startseite. Darüber hinaus kann in der Sidebar direkt zu jedem Widget gesprungen werden.',	'R',	0,	'#layout-sidebar SECTION DIV DIV UL LI :eq(4)',	'dispatch.php/start',	'',	'',	'',	1405935192,	0),
('49604a77654617a745e29ad6b253e491',	4,	'Sprungmarken',	'Darüber hinaus kann mit Sprungmarken direkt zu jedem Widget gesprungen werden.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(0)',	'dispatch.php/start',	'',	'',	'',	1406623464,	0),
('49604a77654617a745e29ad6b253e491',	5,	'Widget positionieren',	'Ein Widget kann per Drag&Drop an die gewünschte Position verschoben werden: Dazu wird in die Titelzeile eines Widgets geklickt, die Maustaste gedrückt gehalten und das Widget an die gewünschte Position gezogen.',	'B',	0,	'.widget-header',	'dispatch.php/start',	'',	'',	'',	1405935687,	0),
('49604a77654617a745e29ad6b253e491',	6,	'Widget bearbeiten',	'Bei einigen Widgets wird neben dem X zum Schließen noch ein weiteres Symbol angezeigt. Der Schnellzugriff bspw. kann durch Klick auf diesen Button individuell angepasst, die Ankündigungen können abonniert und bei den aktuellen Terminen bzw. Stundenplan können Termine hinzugefügt werden.',	'L',	0,	'#layout_content DIV UL DIV SPAN A IMG :eq(0)',	'dispatch.php/start',	'',	'',	'',	1405935792,	0),
('49604a77654617a745e29ad6b253e491',	7,	'Widget entfernen',	'Jedes Widget kann durch Klicken auf das X in der rechten oberen Ecke entfernt werden. Bei Bedarf kann es jederzeit wieder hinzugefügt werden.',	'R',	0,	'.widget-header',	'dispatch.php/start',	'',	'',	'',	1405935376,	0),
('4d41c9760a3248313236af202275107a',	1,	'Allgemeines zum Wiki',	'Diese Tour gibt einen allgemeinen Überblick über das Wiki.\r\n\r\nUm zum nächsten Schritt zu gelangen, klicken Sie bitte rechts unten auf \"Weiter\".',	'T',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107a',	2,	'Kooperative Textarbeit',	'Das Wiki ist ein Tool für kooperative Textarbeit. Alle Teilnehmenden einer Veranstaltung haben das Recht, Texte zu erstellen, zu ändern und zu löschen.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107a',	3,	'Textänderungen schaden nicht',	'Weil das Wiki alle Textänderungen einer Seite protokolliert, können vorhergehende Versionen der Seite wiederhergestellt werden.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107a',	4,	'Textänderungen zurücknehmen',	'Textänderungen in einer Wiki-Seite lassen sich rückgängig machen, indem eine vorhergehende Version der Seite wiederhergestellt wird.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107a',	5,	'Neue Version einer Wiki-Seite',	'Wird eine Wiki-Seite bearbeitet, so erfolgt die Übernahme der Textänderungen sofort beim Speichern. Eine neue Version der Seite wird dreißig Minuten nach der Speicherung erstellt.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107a',	6,	'Kein synchrones Schreiben',	'Das Wiki ist nicht zum synchronen Schreiben geeignet. Es kann immer nur eine Person an einer Seite gleichzeitig arbeiten. Sobald eine zweite Person die Seite im Editor öffnet, erscheint eine Warnmeldung.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	1,	'Schreiben im Wiki',	'Diese Tour gibt einen Überblick über die Erstellung und Bearbeitung von Wiki-Seiten.\r\n\r\nUm zum nächsten Schritt zu gelangen, klicken Sie bitte rechts unten auf \"Weiter\".',	'T',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	2,	'WikiWikiWeb',	'Zeigt die Basis-Seite des Wikis an. Sie bildet die strukturelle Grundlage des gesamten Wikis.',	'R',	0,	'#nav_wiki_show',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	3,	'Neue Seiten',	'Zeigt eine tabellarische Übersicht neu erstellter und neu bearbeiteter Wiki-Seiten an.',	'R',	0,	'#nav_wiki_listnew',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	4,	'Alle Seiten',	'Zeigt eine tabellarische Übersicht aller Wiki-Seiten an.',	'R',	0,	'#nav_wiki_listall',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	5,	'Wiki-Seite bearbeiten',	'Durch einen Klick auf die Schaltfläche \"Bearbeiten\" öffnet sich ein Editor, über den eine Wiki-Seite mit Inhalt gefüllt werden kann.\r\n\r\nDie Eingabe eines Namens in doppelten eckigen Klammern erzeugt eine neue Wiki-Seite und vernetzt sie mit der angezeigten Seite.',	'B',	0,	'#main_content TABLE:eq(1)  TBODY:eq(0)  TR:eq(0)  TD:eq(0)  DIV:eq(0)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	6,	'Inhalt einer Wiki-Seite löschen',	'Der Inhalt einer Wiki-Seite lässt sich mit Hilfe eines Klicks auf die Schaltfläche \"Löschen\" entfernen. Die Wiki-Seite bleibt dabei erhalten.',	'B',	0,	'#main_content TABLE:eq(1)  TBODY:eq(0)  TR:eq(0)  TD:eq(0)  DIV:eq(0)  A:eq(1)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	7,	'QuickLinks',	'Dieser Bildschirmbereich zeigt eine Liste von QuickLinks (Verweisen) auf Wiki-Seiten. Ein Klick auf einen QuickLink öffnet die korrelierende Wiki-Seite. Deren Inhalt lässt sich mit Hilfe der Schaltflächen \"Bearbeiten\" und \"Löschen\" gestalten.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(5)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107b',	8,	'QuickLinks bearbeiten',	'Ein Klick auf dieses Icon öffnet einen Editor, der zur Bearbeitung der QuickLinks dient.\r\n\r\nNeue QuickLinks lassen sich mit doppelten eckigen Klammern erstellen: [[Name]]. Das Löschen eines QuickLinks entfernt die korrelierende Seite aus der Liste.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(5)  DIV:eq(0)  DIV:eq(0)  A:eq(0)  IMG:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	1,	'Lesen im Wiki',	'Diese Tour gibt einen Überblick über die Anzeige von Wiki-Seiten.\r\n\r\nUm zum nächsten Schritt zu gelangen, klicken Sie bitte rechts unten auf \"Weiter\".',	'T',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	2,	'WikiWikiWeb',	'Zeigt die Basis-Seite des Wikis an.',	'R',	0,	'#nav_wiki_show',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	3,	'Neue Seiten',	'Zeigt eine tabellarische Übersicht neu erstellter und neu bearbeiteter Wiki-Seiten an.',	'R',	0,	'#nav_wiki_listnew',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	4,	'Alle Seiten',	'Zeigt eine tabellarische Übersicht aller Wiki-Seiten an.',	'R',	0,	'#nav_wiki_listall',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	5,	'Ansichten',	'Wenn eine Textänderung in einer Wiki-Seite vorgenommen wurde, stehen drei Anzeigemodi zur Auswahl:\r\n- Standard: Ohne Zusatzinformation\r\n- Textänderungen anzeigen: Welche Textpassagen wurden geändert?\r\n- Text mit AutorInnenzuordnung anzeigen: Wer hat hat etwas geändert?',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(11)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	6,	'Suche',	'Zeigt die Wiki-Seiten an, in denen der eingegebene Suchbegriff vorkommt. Die Suche steht nur in der Standard-Ansicht zur Verfügung.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(14)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	7,	'Kommentare',	'Stellt verschiedene Modalitäten zur Anzeige von Kommentaren bereit, die in einer Wiki-Seite eingetragen wurden.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	8,	'Kommentare einblenden',	'Alle Kommentare werden als Textblock an der Textposition angezeigt, an der sie in die Wiki-Seite eingefügt wurden.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(1)  UL:eq(0)  LI:eq(0)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	9,	'Kommentare als Icon einblenden',	'Für jeden Kommentar wird an der Stelle, wo er in die Wiki-Seite eingefügt wurde, ein Icon angezeigt. Ein Klick auf das Icon öffnet den Kommentar.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(1)  UL:eq(0)  LI:eq(1)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('4d41c9760a3248313236af202275107c',	10,	'Kommentare ausblenden',	'Die in einer Wiki-Seite eingefügten Kommentare werden nicht angezeigt.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(1)  UL:eq(0)  LI:eq(2)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('588effa83da976a889a68c152bcabc90',	1,	'What is Blubber?',	'This tour provides an overview of the functionality of \"Blubber\".\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405507364,	0),
('588effa83da976a889a68c152bcabc90',	2,	'Create contribution',	'A discussion can be started here by writing a text. Paragraphs can be created by pressing shift+enter. The text will be sent by pressing enter.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405507478,	0),
('588effa83da976a889a68c152bcabc90',	3,	'Design text',	'The text can be formatted and smileys can be used.\n\nThe customary formatting such as e.g. **bold** or %%italics%%  can be used.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508371,	0),
('588effa83da976a889a68c152bcabc90',	4,	'Mention persons',	'Others can be informed about a post by mentioning them in the post, using the format @user name or @\'first name last name\'.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405672301,	0),
('588effa83da976a889a68c152bcabc90',	5,	'Add document',	'Documents can be inserted into a post by dragging them into an input field using drag&drop.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508401,	0),
('588effa83da976a889a68c152bcabc90',	6,	'Hashtags',	'Posts can be issued with key words (\"hashtags\") by placing a # in front of the chosen word.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508442,	0),
('588effa83da976a889a68c152bcabc90',	7,	'Hashtag cloud',	'By clicking on a hashtag, all posts containing this hashtag will be displayed.',	'RT',	0,	'DIV.sidebar-widget-header',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508505,	0),
('588effa83da976a889a68c152bcabc90',	8,	'Change contribution',	'If the cursor is positioned on a post, its date will appear. For your own posts an additional icon will appear on the right next to the date. This icon allow you to subsequently edit your post.',	'BR',	0,	'DIV DIV A SPAN.time',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405507901,	0),
('588effa83da976a889a68c152bcabc90',	9,	'Link contribution',	'If the cursor is positioned on the first contribution to the discussion a link icon will appear on the left next to the date. If this is clicked using the right mouse button the link can be copied on this contribution in order to be able to insert it in another place.',	'BR',	0,	'DIV DIV A.permalink',	'plugins.php/blubber/streams/profile',	'',	'',	'',	1405508281,	0),
('5d41c9760a3248313236af202275107a',	1,	'General information on the Wiki',	'This tour provides general information about the Wiki.\r\n\r\nTo proceed, please click \"Continue\" on the lower-right button.',	'T',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107a',	2,	'Tool for collaborative use',	'The Wiki is a collaborative tool. Every user may create, edit and delete content.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107a',	3,	'Changes in a Wiki page',	'Since all changes in a Wiki page are saved in a protocol, previous versions of its content can be restored.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107a',	4,	'New version of a Wiki page',	'While editing text in a Wiki page, clicking the Save-Button will save its content immediately. A new version of a Wiki page is displayed thirty minutes after saving at the latest.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107a',	5,	'Undo changes',	'All changes can be undone by restoring a previous version of text.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107a',	6,	'No support of synchronous editing',	'The editor is not designed for synchronous writing. Only one person may edit a page at the same time. If a second person links up to edit the same page, a warning message appears.',	'B',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	1,	'Editing the Wiki',	'This tour provides a general overview of how to create and edit Wiki pages.\r\n\r\nTo proceed, please click \"Continue\" on the lower-right button.',	'T',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	2,	'WikiWikiWeb',	'Displays the basic Wiki page, which is the foundation of all further Wiki pages.',	'R',	0,	'#nav_wiki_show',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	3,	'New pages',	'Displays a survey of all recently created or edited Wiki pages in table form.',	'R',	0,	'#nav_wiki_listnew',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	4,	'All pages',	'Displays a survey of all Wiki pages in table form.',	'R',	0,	'#nav_wiki_listall',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	5,	'Editing the a Wiki page',	'Clicking here will open an editor, allowing to fill a Wiki page with content.',	'B',	0,	'#main_content TABLE:eq(1)  TBODY:eq(0)  TR:eq(0)  TD:eq(0)  DIV:eq(0)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	6,	'Deleting the content of a Wiki page',	'Clicking here will delete all content and links of a Wiki page leaving it blank.',	'B',	0,	'#main_content TABLE:eq(1)  TBODY:eq(0)  TR:eq(0)  TD:eq(0)  DIV:eq(0)  A:eq(1)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	7,	'QuickLinks',	'This box displays links, leading to other Wiki pages. Selecting a link will forward to the related page. The content there may be edited the same way as described in step 5 and six.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(5)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107b',	8,	'Editing QuickLinks',	'A click on this icon will open an editor to edit the QuickLinks.\r\n\r\nEntering a name within double square brackets like [[name]] in the editor will create a new QuickLink leading to a correlating page. Deleting a QuickLink will cause its deletion in the QuickLink box.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(5)  DIV:eq(0)  DIV:eq(0)  A:eq(0)  IMG:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	1,	'Reading the Wiki',	'This tour gives a general overview of the different modes to read Wiki pages.\r\n\r\nTo proceed, please click \"Continue\" on the lower-right button.',	'T',	0,	'',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	2,	'WikiWikiWeb',	'Displays the basic Wiki page, which is the foundation of all further Wiki pages.',	'R',	0,	'#nav_wiki_show',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	3,	'New pages',	'Displays a survey of all recently created or edited Wiki pages in table form.',	'R',	0,	'#nav_wiki_listnew',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	4,	'All pages',	'Displays a survey of all Wiki pages in table form.',	'R',	0,	'#nav_wiki_listall',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	5,	'Views',	'If a Wiki page has been edited, the user may choose between three modes of viewing content:\r\n- Standard: Without extra information\r\n- Show text changes: Which parts of text have been edited?\r\n- Show text changes and associated author: Who was editing a part of text?',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(11)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	6,	'Search',	'Shows all Wiki pages which contain the entered search term. The search is supported in Standard-View only.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(14)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	7,	'Comments',	'Supports three modes of showing comments added to a Wiki page.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	8,	'Show comments',	'All comments are shown as a block of text exactly in that position, in which they were added.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(1)  UL:eq(0)  LI:eq(0)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	9,	'Show comments as icon',	'All comments are represented by an icon exactly in that position, in which a comment was added. A click on an icon shows the correlating comment.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(1)  UL:eq(0)  LI:eq(1)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('5d41c9760a3248313236af202275107c',	10,	'Hide comments',	'All added comments are hidden while displaying a page.',	'R',	0,	'#layout-sidebar SECTION:eq(0)  DIV:eq(20)  DIV:eq(1)  UL:eq(0)  LI:eq(2)  A:eq(0)',	'wiki.php',	'',	'',	'',	1441276241,	0),
('6849293baa05be5bef8ff438dc7c438b',	1,	'Suche',	'Diese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen der \"Suche\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'dispatch.php/search/courses',	'',	'',	'',	1405519865,	0),
('6849293baa05be5bef8ff438dc7c438b',	2,	'Suchbegriff eingeben',	'In dieses Eingabefeld kann ein Suchbegriff (wie z.B. der Veranstaltungsname, Dozent) eingegeben werden.',	'B',	0,	'INPUT#search_sem_quick_search_1.ui-autocomplete-input',	'dispatch.php/search/courses',	'',	'',	'',	1405520106,	0),
('6849293baa05be5bef8ff438dc7c438b',	3,	'Semesterauswahl',	'Durch einen Klick auf das Drop-Down Menü kann bestimmt werden, auf welches Semester sich der Suchbegriff beziehen soll. \r\n\r\nStandardgemäß ist das aktuelle Semester eingestellt.',	'TL',	0,	'SELECT#search_sem_sem',	'dispatch.php/search/courses',	'',	'',	'',	1405520208,	0),
('6849293baa05be5bef8ff438dc7c438b',	4,	'Navigation',	'Falls nur in einem bestimmten Bereich (wie z.B. Lehre) gesucht werden soll, kann dieser hier ausgewählt werden.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(0)',	'dispatch.php/search/courses',	'',	'',	'',	1406121826,	0),
('6849293baa05be5bef8ff438dc7c438b',	5,	'Erweiterte Suche',	'Mit der Erweiterten Suche kann die Suche um weitere Optionen erweitert werden.',	'R',	0,	'A.options-checkbox.options-unchecked',	'dispatch.php/search/courses',	'',	'',	'',	1405520436,	0),
('6849293baa05be5bef8ff438dc7c438b',	6,	'Schnellsuche',	'Die Schnellsuche ist auch auf anderen Seiten von Stud.IP jederzeit verfügbar. Nach der Eingabe eines Stichwortes, wird mit \"Enter\" bestätigt, oder auf die Lupe rechts neben dem Feld geklickt.',	'B',	0,	'INPUT#search_sem_quick_search_2.quicksearchbox.ui-autocomplete-input',	'dispatch.php/search/courses',	'',	'',	'',	1405520634,	0),
('6849293baa05be5bef8ff438dc7c438b',	7,	'Weitere Suchmöglichkeiten',	'Neben Veranstaltungen besteht auch die Möglichkeit, im Archiv, nach Personen, nach Einrichtungen oder nach Ressourcen zu suchen.',	'R',	0,	'#nav_search_resources A SPAN',	'dispatch.php/search/courses',	'',	'',	'',	1405520751,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	1,	'Search',	'This tour provides an overview of the supplied search options.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'dispatch.php/search/courses',	'',	'',	'',	1405519865,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	2,	'Enter search term',	'A search term (such as event name, lecturer) can be entered in this input field.',	'B',	0,	'INPUT#search_sem_quick_search_1.ui-autocomplete-input',	'dispatch.php/search/courses',	'',	'',	'',	1405520106,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	3,	'Semester selection',	'With a click on the drop-down menu you can choose to which semester the search term should refer. \n\nThe current semester is set as standard.',	'TL',	0,	'SELECT#search_sem_sem',	'dispatch.php/search/courses',	'',	'',	'',	1405520208,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	4,	'Navigation',	'If you want to search only one particular area, you can select one here.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(0)',	'dispatch.php/search/courses',	'',	'',	'',	1406121826,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	5,	'Extended search',	'The search can be extended by further options with the extended search.',	'R',	0,	'A.options-checkbox.options-unchecked',	'dispatch.php/search/courses',	'',	'',	'',	1405520436,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	6,	'Quick search',	'The quick search is also available on other sites of Stud.IP at all times. After entering a key word it is confirmed with \"Enter\" or by clicking the magnifying glass on the right next to the field.',	'B',	0,	'INPUT#search_sem_quick_search_2.quicksearchbox.ui-autocomplete-input',	'dispatch.php/search/courses',	'',	'',	'',	1405520634,	0),
('7af1e1fb7f53c910ba9f42f43a71c723',	7,	'Further search possibilities',	'In addition to searching for events there is also the possibility to search the archive for persons, facilities, or resources.',	'R',	0,	'#nav_search_resources A SPAN',	'dispatch.php/search/courses',	'',	'',	'',	1405520751,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	1,	'Hilfe-Tour \"Meine Veranstaltung\"',	'Diese Tour gibt einen Überblick über die wichtigsten Funktionen der Seite \"Meine Veranstaltungen\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'dispatch.php/my_courses',	'',	'',	'',	1406125847,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	2,	'Veranstaltungsüberblick',	'Hier werden die  Veranstaltungen des aktuellen und vergangenen Semesters angezeigt. Neue Veranstaltungen erscheinen zunächst in rot.',	'TL',	0,	'#my_seminars TABLE THEAD TR TH :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1406125908,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	3,	'Veranstaltungsdetails',	'Mit Klick auf das \"i\" erscheint ein Fenster mit den wichtigsten Eckdaten der Veranstaltung.',	'T',	0,	'#my_seminars TABLE THEAD TR TH :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1406125992,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	4,	'Veranstaltungsinhalte',	'Hier werden alle Inhalte (wie z.B. ein Forum) durch entsprechende Symbole angezeigt.\r\nFalls es seit dem letzten Login Neuigkeiten gab, erscheinen diese in rot.',	'LT',	0,	'#my_seminars TABLE THEAD TR TH :eq(4)',	'dispatch.php/my_courses',	'',	'',	'',	1406126049,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	5,	'Bearbeitung oder Löschung einer Veranstaltung',	'Der Klick auf das Zahnrad ermöglicht die Bearbeitung einer Veranstaltung.\r\nFalls bei einer Veranstaltung Teilnehmerstatus besteht, kann hier eine Austragung, durch Klick auf dasTür-Icon, vorgenommen werden.',	'TR',	0,	'#my_seminars TABLE THEAD TR TH :eq(5)',	'dispatch.php/my_courses',	'',	'',	'',	1406126134,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	6,	'Anpassung der Veranstaltungsansicht',	'Zur Anpassung der Veranstaltungsübersicht, kann man die Veranstaltungen nach bestimmten Kriterien (wie z.B. Studienbereiche, Dozenten oder Farben) gliedern.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1406126281,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	7,	'Zugriff auf Veranstaltung vergangener und zukünftiger Semester',	'Durch Klick auf das Drop-Down Menü können beispielsweise Veranstaltung aus vergangenen Semestern angezeigt werden.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1406126316,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	8,	'Weitere mögliche Aktionen',	'Hier können Sie alle Neuigkeiten als gelesen markieren, Farbgruppierungen nach Belieben ändern oder\r\nauch die Benachrichtigungen über Aktivitäten in den einzelnen Veranstaltungen anpassen.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'dispatch.php/my_courses',	'',	'',	'',	1406126374,	0),
('7cccbe3b22dfa745c17cb776fb04537c',	9,	'Studiengruppen und Einrichtungen',	'Es besteht zudem die Möglichkeit auf persönliche Studiengruppen oder Einrichtungen zuzugreifen.',	'R',	0,	'#nav_browse_my_institutes A',	'dispatch.php/my_courses',	'',	'',	'',	1406126415,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	1,	'What is Blubber?',	'This tour provides an overview of the functionality of \"Blubber\".\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405507364,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	2,	'Create contribution',	'A discussion can be started here by writing a text. Paragraphs can be created by pressing shift+enter. The text will be sent by pressing enter.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405507478,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	3,	'Design text',	'The text can be formatted and smileys can be used.\n\nThe customary formatting such as e.g. **bold** or %%italics%%  can be used.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508371,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	4,	'Mention persons',	'Others can be informed about a post by mentioning them in the post, using the format @user name or @\'first name last name\'.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405672301,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	5,	'Add document',	'Documents can be inserted into a post by dragging them into an input field using drag&drop.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508401,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	6,	'Hashtags',	'Posts can be issued with key words (\"hashtags\") by placing a # in front of the chosen word.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508442,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	7,	'Hashtag cloud',	'By clicking on a hashtag, all posts containing this hashtag will be displayed.',	'RT',	0,	'DIV.sidebar-widget-header',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508505,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	8,	'Change contribution',	'If the cursor is positioned on a post, its date will appear. For your own posts an additional icon will appear on the right next to the date. This icon allow you to subsequently edit your post.',	'BR',	0,	'DIV DIV A SPAN.time',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405507901,	0),
('83dc1d25e924f2748ee3293aaf0ede8e',	9,	'Link contribution',	'If the cursor is positioned on the first contribution to the discussion a link icon will appear on the left next to the date. If this is clicked using the right mouse button the link can be copied on this contribution in order to be able to insert it in another place.',	'BR',	0,	'DIV DIV A.permalink',	'plugins.php/blubber/streams/forum',	'',	'',	'',	1405508281,	0),
('89786eac42f52ac316790825b4f5c0b2',	1,	'Forum',	'This tour provides an overview of the forum\'s elements and options of interaction.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'BL',	0,	'',	'plugins.php/coreforum',	'',	'',	'',	1405415772,	0),
('89786eac42f52ac316790825b4f5c0b2',	2,	'You are here:...',	'Here you can see which sector of the forum you are currently looking at.',	'BL',	0,	'DIV#tutorBreadcrumb',	'plugins.php/coreforum',	'',	'',	'',	1405415875,	0),
('89786eac42f52ac316790825b4f5c0b2',	3,	'Category',	'The forum is divided into categories, topics and posts. A category summarises forum areas into larger units of meaning.',	'BL',	0,	'#layout_content #forum #sortable_areas TABLE CAPTION .category_name :eq(0)',	'plugins.php/coreforum',	'',	'',	'',	1405416611,	0),
('89786eac42f52ac316790825b4f5c0b2',	4,	'Area',	'This is an area within a category. Areas contain threads. The order of areas can be altered using drag&drop',	'BL',	0,	'#layout_content #forum TABLE THEAD TR TH :eq(0)',	'plugins.php/coreforum',	'',	'',	'',	1405416664,	0),
('89786eac42f52ac316790825b4f5c0b2',	5,	'Info-Icon',	'This icon turns red as soon as there is something new in this sector.',	'B',	0,	'IMG#tutorNotificationIcon',	'plugins.php/coreforum',	'',	'',	'',	1405416705,	0),
('89786eac42f52ac316790825b4f5c0b2',	6,	'Search',	'All contents of this forum can be browsed here. Multiple word searches are also supported. In addition, the search can be limited to any combination of title, content and author.',	'BL',	0,	'#layout-sidebar SECTION #tutorSearchInfobox DIV #tutorSearchInfobox UL LI INPUT :eq(1)',	'plugins.php/coreforum',	'',	'',	'',	1405417134,	0),
('89786eac42f52ac316790825b4f5c0b2',	7,	'Subscribe to forum',	'You can subscribe to the whole forum or individual topics . In this case a notification will be generated and you receive a meassage for each new post in this forum.',	'B',	0,	'#layout-sidebar SECTION DIV DIV UL LI A :eq(5)',	'plugins.php/coreforum',	'',	'',	'',	1405416795,	0),
('96ea422f286fb5bbf9e41beadb484a9a',	1,	'Profil-Tour',	'Diese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen des \"Profils\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'T',	0,	'',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('96ea422f286fb5bbf9e41beadb484a9a',	2,	'Persönliches Bild',	'Wenn ein Bild hochgeladen wurde, wird es hier angezeigt. Dieses kann jederzeit geändert werden.',	'RT',	0,	'.avatar-normal',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('96ea422f286fb5bbf9e41beadb484a9a',	3,	'Stud.IP-Score',	'Der Stud.IP-Score wächst mit den Aktivitäten in Stud.IP und repräsentiert so die Erfahrung mit Stud.IP.',	'BL',	0,	'#layout_content TABLE:eq(0) TBODY:eq(0) TR:eq(0) TD:eq(0) A:eq(0)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('96ea422f286fb5bbf9e41beadb484a9a',	4,	'Ankündigungen',	'Sie können auf dieser Seite persönliche Ankündigungen veröffentlichen.',	'B',	0,	'#layout_content SECTION HEADER H1 :eq(0)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('96ea422f286fb5bbf9e41beadb484a9a',	5,	'Neue Ankündigung',	'Klicken Sie auf das Plus-Zeichen, wenn Sie eine Ankündigung erstellen möchten.',	'BR',	0,	'.contentbox:eq(0) header img:eq(1)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('96ea422f286fb5bbf9e41beadb484a9a',	6,	'Persönliche Daten',	'Das Bild sowie weitere persönliche Angaben können über diese Seiten geändert werden.',	'BL',	0,	'#tabs li:eq(2)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('977f41c5c5239c4e86f04c3df27fae38',	1,	'Willkommen im neuen Stud.IP 3.1',	'Dies ist eine Hilfe-Tour, die die wichtigsten Neuerungen in Stud.IP vorstellt. \r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\". Eine Hilfe-Tour kann jederzeit durch einen Klick auf \"Beenden\" beendet werden.',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1405932373,	0),
('977f41c5c5239c4e86f04c3df27fae38',	2,	'Hilfelasche',	'Auf jeder Seite findet sich die Hilfe von nun an in der sogenannten Hilfelasche. Diese öffnet sich mit einem Klick auf das Fragezeichen. \r\n\r\nHier findet sich kurz und knapp zu jeder Seite die wichtigsten Informationen, Links zur ausführlichen Hilfeseite mit Anleitungsvideos und gegebenenfalls Hilfe-Touren.',	'BR',	0,	'DIV.helpbar-container .helpbar-title',	'dispatch.php/start',	'',	'',	'',	1405932475,	0),
('977f41c5c5239c4e86f04c3df27fae38',	3,	'Gliederung der Startseite',	'Die Startseite im neuen Stud.IP ist standardmäßig so gegliedert wie die alte Version. Neu ist, dass jedes Element (\"Widget\") individuell entfernt und verschoben werden kann. Darüber hinaus können noch weitere Widgets hinzugefügt werden. Hierzu gibt es eine separate Hilfe-Tour und die Hinweise in der Hilfe.',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1405932516,	0),
('977f41c5c5239c4e86f04c3df27fae38',	4,	'Sidebar',	'Auf allen Seiten ist nun links die Sidebar positioniert. Sie enthält Funktionen für die aktuelle Seite.\r\nIm alten Stud.IP gab es mit der Infobox auf der rechten Seite etwas Ähnliches.',	'R',	0,	'SECTION.sidebar',	'dispatch.php/start',	'',	'',	'',	1405932633,	0),
('977f41c5c5239c4e86f04c3df27fae38',	5,	'Änderung der Navigation',	'Häufig ist die Reiternavigation vom alten Stud.IP nun in der Sidebar zu finden. Auf dieser Seite sind das zum Beispiel die Punkte \"Neue Nachricht schreiben\" und der Gesendet-Ordner.',	'R',	0,	'SECTION.sidebar ',	'dispatch.php/messages/overview',	'',	'',	'',	1405932671,	0),
('977f41c5c5239c4e86f04c3df27fae38',	6,	'Studiengruppen und Einrichtungen',	'Die Einrichtungen, die früher unter den Veranstaltungen standen und die Studiengruppen, die früher zwischen den Veranstaltungen standen, finden sich nun in eigenen Reitern wieder.',	'R',	0,	'#nav_browse_my_institutes A SPAN',	'dispatch.php/my_courses',	'',	'',	'',	1405932830,	0),
('977f41c5c5239c4e86f04c3df27fae38',	7,	'Hinweise zu den Anmeldeverfahren',	'Im neuen Stud.IP haben sich die Zugangsberechtigungen und Anmeldeverfahren geändert. Das betrifft sowohl Studierende als auch Dozierende. Hierzu gibt es separate Feature-Touren und die Hinweise in der Hilfe.',	'TL',	0,	'',	'dispatch.php/my_courses',	'',	'',	'',	1405932890,	0),
('977f41c5c5239c4e86f04c3df27fae38',	8,	'Ende der Feature-Tour',	'Durch Klick auf \"Beenden\" in der Box rechts unten wird diese Tour beendet. Über die Hilfelasche lässt sich diese Tour jederzeit wieder starten.',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1406539532,	0),
('9e9dca9b1214294b9605824bfe90fba1',	1,	'Create study group',	'This tour provides an overview of the creation of study groups to cooperate with fellow students.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'R',	0,	'',	'dispatch.php/my_studygroups',	'',	'',	'',	1405684423,	0),
('9e9dca9b1214294b9605824bfe90fba1',	2,	'Create study group',	'A new study group can be created with a click on \"create new study group\".',	'R',	0,	'A#nav_browse_new',	'dispatch.php/my_studygroups',	'',	'',	'',	1406017730,	0),
('9e9dca9b1214294b9605824bfe90fba1',	3,	'Name a study group',	'The name of a study group should be meaningful and unique in the whole Stud.IP.',	'R',	0,	'INPUT#groupname',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405684720,	0),
('9e9dca9b1214294b9605824bfe90fba1',	4,	'Add description',	'The description makes it possible to display additional information that makes it easier to find the group.',	'R',	0,	'TEXTAREA#groupdescription',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405684806,	0),
('9e9dca9b1214294b9605824bfe90fba1',	5,	'Allocate content elements',	'Content elements can be activated here, which are to be available within the study group. The question mark provides more detailed information on the meaning of the individual content elements',	'L',	0,	'#layout_content FORM TABLE TBODY TR TD :eq(5)',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405685093,	0),
('9e9dca9b1214294b9605824bfe90fba1',	6,	'Stipulate access',	'The access to the study group can be restricted with this drop down menu.\n\nAll students can register freely and participate in the group with the access \"open for everyone\".\n\nWith the access \"upon request\" participants must be added by the group founder.',	'R',	0,	'SELECT#groupaccess',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405685334,	0),
('9e9dca9b1214294b9605824bfe90fba1',	7,	'Accept terms of use',	'The terms of use have to be accepted before you can create a study group.',	'R',	0,	'P LABEL',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405685652,	0),
('9e9dca9b1214294b9605824bfe90fba1',	8,	'Save study group',	'After you saved a study group it will appear under \"My courses\" > \"My study groups\".',	'L',	0,	'#layout_content FORM TABLE TBODY TR TD :eq(14)',	'dispatch.php/course/studygroup/new',	'',	'',	'',	1405686068,	0),
('b74f8459dce2437463096d56db7c73b9',	1,	'Hilfe-Tour \"Meine Veranstaltungen\"',	'Diese Tour gibt einen Überblick über die wichtigsten Funktionen der Seite \"Meine Veranstaltungen\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'dispatch.php/my_courses',	'',	'',	'',	1405521184,	0),
('b74f8459dce2437463096d56db7c73b9',	2,	'Veranstaltungsüberblick',	'Hier werden die  Veranstaltungen des aktuellen und vergangenen Semesters angezeigt. Neue Veranstaltungen erscheinen zunächst in rot.',	'T',	0,	'#my_seminars TABLE THEAD TR TH :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1405521244,	0),
('b74f8459dce2437463096d56db7c73b9',	3,	'Veranstaltungsdetails',	'Mit Klick auf das \"i\" erscheint ein Fenster mit den wichtigsten Eckdaten der Veranstaltung.',	'T',	0,	'#my_seminars TABLE THEAD TR TH :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1405931069,	0),
('b74f8459dce2437463096d56db7c73b9',	4,	'Veranstaltungsinhalte',	'Hier werden alle Inhalte (wie z.B. ein Forum) durch entsprechende Symbole angezeigt.\r\nFalls es seit dem letzten Login Neuigkeiten gab, erscheinen diese in rot.',	'LT',	0,	'#my_seminars TABLE THEAD TR TH :eq(4)',	'dispatch.php/my_courses',	'',	'',	'',	1405931225,	0),
('b74f8459dce2437463096d56db7c73b9',	5,	'Verlassen der Veranstaltung',	'Ein Klick auf das Tür-Icon ermöglicht eine direkte Austragung aus der Veranstaltung.',	'TR',	0,	'#my_seminars TABLE THEAD TR TH :eq(5)',	'dispatch.php/my_courses',	'',	'',	'',	1405931272,	0),
('b74f8459dce2437463096d56db7c73b9',	6,	'Zugriff auf archivierte Veranstaltungen',	'Falls Veranstaltungen archiviert sind, kann hier auf diese zugegriffen werden.',	'RT',	0,	'A#nav_browse_archive',	'dispatch.php/my_courses',	'',	'',	'',	1405931431,	0),
('b74f8459dce2437463096d56db7c73b9',	7,	'Anpassung der Veranstaltungsansicht',	'Zur Anpassung der Veranstaltungsübersicht, kann man die Veranstaltungen nach bestimmten Kriterien (wie z.B. Studienbereiche, Dozenten oder Farben) gliedern.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1405932131,	0),
('b74f8459dce2437463096d56db7c73b9',	8,	'Zugriff auf Veranstaltung vergangener und zukünftiger Semester',	'Durch Klick auf das Drop-Down Menü können beispielsweise Veranstaltung aus vergangenen Semestern angezeigt werden.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1405932230,	0),
('b74f8459dce2437463096d56db7c73b9',	9,	'Weitere mögliche Aktionen',	'Hier können Sie alle Neuigkeiten als gelesen markieren, Farbgruppierungen nach Belieben ändern oder\r\nauch die Benachrichtigungen über Aktivitäten in den einzelnen Veranstaltungen anpassen.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'dispatch.php/my_courses',	'',	'',	'',	1405932320,	0),
('b74f8459dce2437463096d56db7c73b9',	10,	'Studiengruppen und Einrichtungen',	'Es besteht zudem die Möglichkeit auf persönliche Studiengruppen oder Einrichtungen zuzugreifen.',	'R',	0,	'#nav_browse_my_institutes A',	'dispatch.php/my_courses',	'',	'',	'',	1405932519,	0),
('c89ce8e097f212e75686f73cc5008711',	1,	'Participant administration',	'This tour provides an overview of the participant administration\'s options.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'B',	0,	'',	'dispatch.php/course/members',	'',	'',	'',	1405688399,	0),
('c89ce8e097f212e75686f73cc5008711',	2,	'Add persons',	'With these functions you can search for individual persons in Stud.IP and directly  select them as lecturer, tutor or author. It is also possible to insert a list of participants in order to allocate several persons as a tutor of the event at the same time.',	'R',	0,	'#layout-sidebar SECTION DIV.sidebar-widget :eq(1)',	'dispatch.php/course/members',	'',	'',	'',	1405688707,	0),
('c89ce8e097f212e75686f73cc5008711',	3,	'Upgrade/ downgrade',	'In order to upgrade an already enroled person to a tutor, or to downgrade them to a reader select this person in the list and carry out the requested action by using the dropdown menu.',	'T',	0,	'#autor CAPTION',	'dispatch.php/course/members',	'',	'',	'',	1405690324,	0),
('c89ce8e097f212e75686f73cc5008711',	4,	'Send circular e-mail',	'A circular e-mail can be sent to all participants of the event here.',	'R',	0,	'#layout-sidebar SECTION DIV DIV UL LI A :eq(3)',	'dispatch.php/course/members',	'',	'',	'',	1406636964,	0),
('c89ce8e097f212e75686f73cc5008711',	5,	'Send circular e-mail to user group',	'There is further the possibility to send a circular e-mail to individual user groups.',	'BR',	0,	'#layout_container #layout_content TABLE CAPTION SPAN A IMG :eq(0)',	'dispatch.php/course/members',	'',	'',	'',	1406637123,	0),
('c89ce8e097f212e75686f73cc5008711',	6,	'Create groups',	'The participants of the event can be divided into groups here.',	'R',	0,	'A#nav_course_edit_groups',	'dispatch.php/course/members',	'',	'',	'',	1405689311,	0),
('c89ce8e097f212e75686f73cc5008711',	7,	'Name group',	'You can search for a suitable group name in the templates and select it using the yellow double arrow. As an alternative you also have the possibility to determine a new group name by directly entering the name in the right field.',	'B',	0,	'SELECT',	'admin_statusgruppe.php',	'',	'',	'',	1405689541,	0),
('c89ce8e097f212e75686f73cc5008711',	8,	'Group size',	'With the field \"group size\" you can set the maximum number of participants of a group. If you do not require this, simply leave the field empty.',	'B',	0,	'INPUT#role_size',	'admin_statusgruppe.php',	'',	'',	'',	1405689763,	0),
('c89ce8e097f212e75686f73cc5008711',	9,	'Self-entry',	'If you activate the function \"self-entry\", the participants of the event can enter themselves in the groups.',	'B',	0,	'INPUT#self_assign',	'admin_statusgruppe.php',	'',	'',	'',	1405689852,	0),
('c89ce8e097f212e75686f73cc5008711',	10,	'Document folder',	'If you activate the function \"document folder\", an additional document folder will  be created per group. Group-specific documents can be uploaded to this folder.',	'B',	0,	'INPUT#group_folder',	'admin_statusgruppe.php',	'',	'',	'',	1405689936,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	1,	'What is Blubber?',	'This tour provides an overview of the functionality of \"Blubber\".\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405507364,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	2,	'Create contribution',	'A discussion can be started here by writing a text. Paragraphs can be created by pressing shift+enter. The text will be sent by pressing enter.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405507478,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	3,	'Design text',	'The text can be formatted and smileys can be used.\n\nThe customary formatting such as e.g. **bold** or %%italics%%  can be used.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508371,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	4,	'Mention persons',	'Others can be informed about a post by mentioning them in the post, using the format @user name or @\'first name last name\'.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405672301,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	5,	'Add document',	'Documents can be inserted into a post by dragging them into an input field using drag&drop.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508401,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	6,	'Hashtags',	'Posts can be issued with key words (\"hashtags\") by placing a # in front of the chosen word.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508442,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	7,	'Hashtag cloud',	'By clicking on a hashtag, all posts containing this hashtag will be displayed.',	'RT',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508505,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	8,	'Change contribution',	'If the cursor is positioned on a post, its date will appear. For your own posts an additional icon will appear on the right next to the date. This icon allow you to subsequently edit your post.',	'BR',	0,	'DIV DIV A SPAN.time',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405507901,	0),
('d9913517f9c81d2c0fa8362592ce5d0e',	9,	'Link contribution',	'If the cursor is positioned on the first contribution to the discussion a link icon will appear on the left next to the date. If this is clicked using the right mouse button the link can be copied on this contribution in order to be able to insert it in another place.',	'BR',	0,	'DIV DIV A.permalink',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508281,	0),
('de1fbce508d01cbd257f9904ff8c3b43',	1,	'Profile tour',	'This tour provides a general overview of the profile page\'s structure.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'T',	0,	'',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('de1fbce508d01cbd257f9904ff8c3b43',	2,	'Personal picture',	'If you uploaded a picture, it will be displayed here. You can change it at all times.',	'RT',	0,	'.avatar-normal',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('de1fbce508d01cbd257f9904ff8c3b43',	3,	'Stud.IP-Score',	'The Stud.IP-Score increases with the activities in Stud.IP and thus represents the experience with  Stud.IP.',	'BL',	0,	'#layout_content TABLE:eq(0) TBODY:eq(0) TR:eq(0) TD:eq(0) A:eq(0)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('de1fbce508d01cbd257f9904ff8c3b43',	4,	'Announcements',	'You can publish personal announcements on this site.',	'B',	0,	'#layout_content SECTION HEADER H1 :eq(0)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('de1fbce508d01cbd257f9904ff8c3b43',	5,	'New announcement',	'Click on the plus sign, if you would like to create an announcement.',	'BR',	0,	'#layout_content SECTION HEADER NAV A :eq(0)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('de1fbce508d01cbd257f9904ff8c3b43',	6,	'Personal details',	'Your picture and additional user data can be changed on these sites.',	'BL',	0,	'#tabs li:eq(2)',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('e41611616675b218845fe9f55bc11cf6',	1,	'Profile',	'This tour shows how to upload a picture in the profile page.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'B',	0,	'',	'dispatch.php/profile',	'',	'',	'',	1406722657,	0),
('e41611616675b218845fe9f55bc11cf6',	2,	'Upload a picture',	'A profile picture can be uploaded on this site.',	'BL',	0,	'#nav_profile_avatar A SPAN',	'dispatch.php/settings/avatar',	'',	'',	'',	1406722657,	0),
('e41611616675b218845fe9f55bc11cf6',	3,	'Select picture',	'A image file can be uploaded for this purpose.',	'L',	0,	'input[name=imgfile]',	'dispatch.php/settings/avatar',	'',	'',	'',	1406722657,	0),
('e41611616675b218845fe9f55bc11cf6',	4,	'Requirements',	'The image file must be available in **.jpg**, **.png** or **.gif** format.\n\nThe document size must not exceed 700 KB.',	'L',	0,	'#layout_content #edit_avatar TBODY TR TD FORM B :eq(2)',	'dispatch.php/settings/avatar',	'',	'',	'',	1406722657,	0),
('edfcf78c614869724f93488c4ed09582',	1,	'Teilnehmerverwaltung',	'Diese Tour gibt einen Überblick über die Teilnehmerverwaltung einer Veranstaltung.\r\n\r\nUm zum nächsten Schritt zu gelangen, klicken Sie bitte rechts unten auf \"Weiter\".',	'B',	0,	'',	'dispatch.php/course/members',	'',	'',	'',	1405688399,	0),
('edfcf78c614869724f93488c4ed09582',	2,	'Personen eintragen',	'Mit diesen Funktionen können entweder einzelne Personen in Stud.IP gesucht und direkt als DozentIn, TutorIn oder AutorIn eintragen werden. Es ist auch möglich eine Teilnehmerliste einzugeben, um viele Personen auf einmal als TutorIn der Veranstaltung zuzuordnen.',	'R',	0,	'#layout-sidebar SECTION DIV.sidebar-widget :eq(1)',	'dispatch.php/course/members',	'',	'',	'',	1405688707,	0),
('edfcf78c614869724f93488c4ed09582',	3,	'Hochstufen / Herabstufen',	'Um eine bereits eingetragene Person zum/zur TutorIn hochzustufen oder zum/zur LeserIn herabzustufen, wählen Sie diese Person in der Liste aus und führen Sie mit Hilfe des Dropdown-Menü die gewünschte Aktion aus.',	'T',	0,	'#autor CAPTION',	'dispatch.php/course/members',	'',	'',	'',	1405690324,	0),
('edfcf78c614869724f93488c4ed09582',	4,	'Rundmail verschicken',	'Hier kann eine Rundmail an alle Teilnehmende der Veranstaltung verschickt werden.',	'R',	0,	'#layout-sidebar SECTION DIV DIV UL LI A :eq(3)',	'dispatch.php/course/members',	'',	'',	'',	1406636964,	0),
('edfcf78c614869724f93488c4ed09582',	5,	'Rundmail an Nutzergruppe versenden',	'Weiterhin besteht die Möglichkeit eine Rundmail an einzelne Nutzergruppen zu versenden.',	'BR',	0,	'#layout_container #layout_content TABLE CAPTION SPAN A IMG :eq(0)',	'dispatch.php/course/members',	'',	'',	'',	1406637123,	0),
('edfcf78c614869724f93488c4ed09582',	6,	'Gruppen erstellen',	'Hier können die TeilnehmerInnen der Veranstaltung in Gruppen eingeteilt werden.',	'R',	0,	'A#nav_course_edit_groups',	'dispatch.php/course/members',	'',	'',	'',	1405689311,	0),
('edfcf78c614869724f93488c4ed09582',	7,	'Gruppe benennen',	'Sie können in den Vorlagen nach einem passenden Gruppennamen suchen und ihn mit dem gelben Doppelpfeil auswählen. Alternativ haben Sie auch die Möglichkeit, einen neuen Gruppennamen zu bestimmen, indem Sie im rechten Feld den Namen direkt eintragen.',	'B',	0,	'SELECT',	'admin_statusgruppe.php',	'',	'',	'',	1405689541,	0),
('edfcf78c614869724f93488c4ed09582',	8,	'Gruppengröße',	'Mit dem Feld \"Gruppengröße\" können Sie die maximale Anzahl der Teilnehmer einer Gruppe festlegen. Wenn Sie dies nicht benötigen, lassen Sie das Feld einfach leer.',	'B',	0,	'INPUT#role_size',	'admin_statusgruppe.php',	'',	'',	'',	1405689763,	0),
('edfcf78c614869724f93488c4ed09582',	9,	'Selbsteintrag',	'Wenn Sie die Funktion \"Selbsteintrag\" aktivieren, können sich die Teilnehmenden der Veranstaltung selbst in die Gruppen eintragen.',	'B',	0,	'INPUT#self_assign',	'admin_statusgruppe.php',	'',	'',	'',	1405689852,	0),
('edfcf78c614869724f93488c4ed09582',	10,	'Dateiordner',	'Wenn Sie die Funktion \"Dateiordner\" aktivieren, wird zusätzlich ein Dateiordner pro Gruppe neu angelegt. In diesen Ordner können gruppenspezifische Dateien hochgeladen werden.',	'B',	0,	'INPUT#group_folder',	'admin_statusgruppe.php',	'',	'',	'',	1405689936,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	1,	'Was ist Blubbern?',	'Diese Tour gibt Ihnen einen Überblick über die wichtigsten Funktionen von \"Blubber\".\r\n\r\nUm auf den nächsten Schritt zu kommen, klicken Sie bitte rechts unten auf \"Weiter\".',	'TL',	0,	'',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405507364,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	2,	'Beitrag erstellen',	'Hier kann eine Diskussion durch Schreiben von Text begonnen werden. Absätze lassen sich durch Drücken von Umschalt+Eingabe erzeugen. Der Text wird durch Drücken von Eingabe abgeschickt.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405507478,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	3,	'Text gestalten',	'Der Text kann formatiert und mit Smileys versehen werden.\r\nEs können die üblichen Formatierungen verwendet werden, wie z. B. **fett** oder %%kursiv%%.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508371,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	4,	'Personen erwähnen',	'Andere können über einen Beitrag informiert werden, indem sie per @benutzername oder @\"Vorname Nachname\" im Beitrag erwähnt werden.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405672301,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	5,	'Datei hinzufügen',	'Dateien können in einen Beitrag eingefügt werden, indem sie per Drag&Drop in ein Eingabefeld gezogen werden.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508401,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	6,	'Schlagworte',	'Beiträge können mit Schlagworten (engl. \"Hashtags\") versehen werden, indem einem beliebigen Wort des Beitrags ein # vorangestellt wird.',	'BL',	0,	'TEXTAREA#new_posting.autoresize',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508442,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	7,	'Schlagwortwolke',	'Durch Anklicken eines Schlagwortes werden alle Beiträge aufgelistet, die dieses Schlagwort enthalten.',	'RT',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508505,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	8,	'Beitrag ändern',	'Wird der Mauszeiger auf einem beliebigen Beitrag positioniert, erscheint dessen Datum. Bei eigenen Beiträgen erscheint außerdem rechts neben dem Datum ein Icon, mit dem der Beitrag nachträglich geändert werden kann.',	'BR',	0,	'DIV DIV A SPAN.time',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405507901,	0),
('ef5092ba722c81c37a5a6bd703890bd9',	9,	'Beitrag verlinken',	'Wird der Mauszeiger auf dem ersten Diskussionsbeitrag positioniert, erscheint links neben dem Datum ein Link-Icon. Wenn dieses mit der rechten Maustaste angeklickt wird, kann der Link auf diesen Beitrag kopiert werden, um ihn an anderer Stelle einfügen zu können.',	'BR',	0,	'DIV DIV A.permalink',	'plugins.php/blubber/streams/global',	'',	'',	'',	1405508281,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	1,	'Functions and design possibilities of the start page',	'This tour provides an overview of the start page\'s features and functions.\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1405934926,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	2,	'Individual design of the start page',	'The default configuration of the start page is that the elements \"Quicklinks\", \"announcements\", \"my current appointments\" and  \"surveys\" are displayed. The elements are called widgets and  can be deleted, added and moved. Each widget can be individually added, deleted and moved.',	'TL',	0,	'',	'dispatch.php/start',	'',	'',	'',	1405934970,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	3,	'Add widget',	'Widgets can be added here. In addition to the standard widgets the personal timetable can, for example, be displayed on the start page. Newly added widgets appear right at the bottom on the start page. In addition, it is possible to jump directly to each widget in the sidebar.',	'R',	0,	'#layout-sidebar SECTION DIV DIV UL LI :eq(4)',	'dispatch.php/start',	'',	'',	'',	1405935192,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	4,	'Jump labels',	'In addition, it is possible to jump directly to each widget using jump labels.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(0)',	'dispatch.php/start',	'',	'',	'',	1406623464,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	5,	'Position widget',	'A widget can be moved to the desired position using drag&drop: For this purpose you click into the headline of a widget, hold down the mouse button, and drag the widget to the desired position.',	'B',	0,	'.widget-header',	'dispatch.php/start',	'',	'',	'',	1405935687,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	6,	'Edit widget',	'With several widgets a further symbol is displayed in addition to the X for closing. The widget \"Quicklinks\", for example, can be adjusted individually by clicking on this button, the announcements can be subscribed to and appointments can be added with the actual appointments or timetable.',	'L',	0,	'#layout_content DIV UL DIV SPAN A IMG :eq(0)',	'dispatch.php/start',	'',	'',	'',	1405935792,	0),
('f0aeb0f6c4da3bd61f48b445d9b30dc1',	7,	'Remove widget',	'Each widget can be removed by clicking on the X in the right upper corner. If required, it can be added again at all times.',	'R',	0,	'.widget-header',	'dispatch.php/start',	'',	'',	'',	1405935376,	0),
('fa963d2ca827b28e0082e98aafc88765',	1,	'Help tour \"My courses\"',	'This tour provides an overview of the functionality of \"My courses\".\r\n\rTo proceed, please click \"Continue\" in the lower-right corner.',	'TL',	0,	'',	'dispatch.php/my_courses',	'',	'',	'',	1405521184,	0),
('fa963d2ca827b28e0082e98aafc88765',	2,	'Overview of courses',	'The courses of the current and past semester are displayed here. New courses initially appear in red.',	'T',	0,	'#my_seminars TABLE THEAD TR TH :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1405521244,	0),
('fa963d2ca827b28e0082e98aafc88765',	3,	'Course details',	'With a click on the \"i\" a window appears with the most important benchmark data of the course.',	'T',	0,	'#my_seminars TABLE THEAD TR TH :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1405931069,	0),
('fa963d2ca827b28e0082e98aafc88765',	4,	'Course contents',	'All contents (such as e.g. a forum) are displayed by corresponding symbols here.\n\nIf there were any news since the last login these will appear in red.',	'LT',	0,	'#my_seminars TABLE THEAD TR TH :eq(4)',	'dispatch.php/my_courses',	'',	'',	'',	1405931225,	0),
('fa963d2ca827b28e0082e98aafc88765',	5,	'Leaving the course',	'A click on the door icon enables a direct removal from the course',	'TR',	0,	'#my_seminars TABLE THEAD TR TH :eq(5)',	'dispatch.php/my_courses',	'',	'',	'',	1405931272,	0),
('fa963d2ca827b28e0082e98aafc88765',	6,	'Access to archived courses',	'If courses have been archived, they can be accessed here.',	'RT',	0,	'A#nav_browse_archive',	'dispatch.php/my_courses',	'',	'',	'',	1405931431,	0),
('fa963d2ca827b28e0082e98aafc88765',	7,	'Adjustment to the course view',	'In order to adjust the course overview you can arrange your courses according to certain criteria (such as e.g. fields of study, lecturers or colours).',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(2)',	'dispatch.php/my_courses',	'',	'',	'',	1405932131,	0),
('fa963d2ca827b28e0082e98aafc88765',	8,	'Access to an course of past and future semesters',	'By clicking on the drop-down menu courses from past semesters can be displayed for example.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(3)',	'dispatch.php/my_courses',	'',	'',	'',	1405932230,	0),
('fa963d2ca827b28e0082e98aafc88765',	9,	'Further possible actions',	'Here you can mark all news as read, change colour groups as you please, or\n\nalso adjust the notifications about activities in the individual events.',	'R',	0,	'#layout-sidebar SECTION DIV DIV.sidebar-widget-header :eq(1)',	'dispatch.php/my_courses',	'',	'',	'',	1405932320,	0),
('fa963d2ca827b28e0082e98aafc88765',	10,	'Study groups and institutes',	'There is moreover the possibility to access personal study groups or institutes.',	'R',	0,	'#nav_browse_my_institutes A',	'dispatch.php/my_courses',	'',	'',	'',	1405932519,	0);

DROP TABLE IF EXISTS `help_tour_user`;
CREATE TABLE `help_tour_user` (
  `tour_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `step_nr` int(11) NOT NULL,
  `completed` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tour_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `i18n`;
CREATE TABLE `i18n` (
  `object_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`object_id`,`table`,`field`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `Institute`;
CREATE TABLE `Institute` (
  `Institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fakultaets_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Strasse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Plz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://www.studip.de',
  `telefon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `modules` int(10) unsigned DEFAULT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `lit_plugin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `srienabled` tinyint(4) NOT NULL DEFAULT 0,
  `lock_rule` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`Institut_id`),
  KEY `fakultaets_id` (`fakultaets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `Institute` (`Institut_id`, `Name`, `fakultaets_id`, `Strasse`, `Plz`, `url`, `telefon`, `email`, `fax`, `type`, `modules`, `mkdate`, `chdate`, `lit_plugin_name`, `srienabled`, `lock_rule`) VALUES
('110ce78ffefaf1e5f167cd7019b728bf',	'externe Einrichtung B',	'ec2e364b28357106c0f8c282733dbe56',	'',	'',	'',	'',	'',	'',	1,	16,	1156516698,	1156516698,	'Studip',	0,	''),
('1535795b0d6ddecac6813f5f6ac47ef2',	'Test Fakultät',	'1535795b0d6ddecac6813f5f6ac47ef2',	'Geismar Landstr. 17b',	'37083 Göttingen',	'http://www.studip.de',	'0551 / 381 985 0',	'testfakultaet@studip.de',	'0551 / 381 985 3',	1,	16,	1156516698,	1156516698,	'Studip',	0,	''),
('2560f7c7674942a7dce8eeb238e15d93',	'Test Einrichtung',	'1535795b0d6ddecac6813f5f6ac47ef2',	'',	'',	'',	'',	'',	'',	1,	16,	1156516698,	1156516698,	'Studip',	0,	''),
('536249daa596905f433e1f73578019db',	'Test Lehrstuhl',	'1535795b0d6ddecac6813f5f6ac47ef2',	'',	'',	'',	'',	'',	'',	3,	16,	1156516698,	1156516698,	'Studip',	0,	''),
('7a4f19a0a2c321ab2b8f7b798881af7c',	'externe Einrichtung A',	'ec2e364b28357106c0f8c282733dbe56',	'',	'',	'',	'',	'',	'',	1,	16,	1156516698,	1156516698,	'Studip',	0,	''),
('ec2e364b28357106c0f8c282733dbe56',	'externe Bildungseinrichtungen',	'ec2e364b28357106c0f8c282733dbe56',	'',	'',	'',	'',	'',	'',	1,	16,	1156516698,	1156516698,	'Studip',	0,	''),
('f02e2b17bc0e99fc885da6ac4c2532dc',	'Test Abteilung',	'1535795b0d6ddecac6813f5f6ac47ef2',	'',	'',	'',	'',	'',	'',	4,	16,	1156516698,	1156516698,	'Studip',	0,	'');

DROP TABLE IF EXISTS `kategorien`;
CREATE TABLE `kategorien` (
  `kategorie_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kategorie_id`),
  KEY `priority` (`priority`),
  KEY `range_id` (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `limitedadmissions`;
CREATE TABLE `limitedadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `maxnumber` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `lit_catalog`;
CREATE TABLE `lit_catalog` (
  `catalog_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  `lit_plugin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Studip',
  `accession_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dc_creator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dc_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_publisher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_contributor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_date` date DEFAULT NULL,
  `dc_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_language` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `dc_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_coverage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dc_rights` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `lit_catalog` (`catalog_id`, `user_id`, `mkdate`, `chdate`, `lit_plugin`, `accession_number`, `dc_title`, `dc_creator`, `dc_subject`, `dc_description`, `dc_publisher`, `dc_contributor`, `dc_date`, `dc_type`, `dc_format`, `dc_identifier`, `dc_source`, `dc_language`, `dc_relation`, `dc_coverage`, `dc_rights`) VALUES
('15074ad4f2bd2c57cbc9dfb343c1355b',	'studip',	1156516698,	1156516698,	'Gvk',	'384065813',	'Der Kater mit Hut',	'Geisel, Theodor Seuss',	'',	'',	'München [u.a.] : Piper',	'',	'2004-01-01',	'',	'75 S : zahlr. Ill ; 19 cm.',	'ISBN: 349224078X (kart.)',	'',	'ger',	'Serie Piper ;, 4078',	'',	''),
('54181f281faa777941acc252aebaf26d',	'studip',	1156516698,	1156516698,	'Gvk',	'387042768',	'Quickguide Strahlenschutz : [Aufgaben, Organisation, Schutzmaßnahmen].',	'Wolf, Heike',	'',	'',	'Kissing : WEKA Media',	'',	'2004-01-01',	'',	'74 S : Ill.',	'',	'',	'ger',	'[Der Strahlenschutzbeauftragte in Medizin und Technik / Heike Wolf] Praxislösungen',	'',	''),
('b5d115a7f7cad02b4535fb3090bf18da',	'studip',	1156516698,	1156516698,	'Gvk',	'386883831',	'E-Learning: Qualität und Nutzerakzeptanz sichern : Beiträge zur Planung, Umsetzung und Evaluation multimedialer und netzgestützter Anwendungen',	'Zinke, Gert',	'',	'',	'Bielefeld : Bertelsmann',	'Härtel, Michael; Bundesinstitut für Berufsbildung, ;',	'2004-01-01',	'',	'159 S : graph. Darst ; 225 mm x 155 mm.',	'ISBN: 3763910204',	'',	'ger',	'Berichte zur beruflichen Bildung ;, 265',	'',	''),
('ce704bbc9453994daa05d76d2d04aba0',	'studip',	1156516698,	1156516698,	'Gvk',	'379252104',	'Die volkswirtschaftliche Perspektive',	'Heise, Michael',	'',	'',	'In: Zeitschrift für das gesamte Kreditwesen, Vol. 57, No. 4 (2004), p. 211-217, Frankfurt, M. : Knapp',	'Kater, Ulrich;',	'2004-01-01',	'',	'graph. Darst.',	'',	'',	'ger',	'',	'',	''),
('d6623a3c2b8285fb472aa759150148ad',	'studip',	1156516698,	1156516698,	'Gvk',	'387042253',	'Röntgenverordnung : (RÖV) ; Verordnung über den Schutz vor Schäden durch Röntgenstrahlen.',	'Wolf, Heike',	'',	'',	'Kissing : WEKA Media',	'',	'2004-01-01',	'',	'50 S.',	'',	'',	'ger',	'[Der Strahlenschutzbeauftragte in Medizin und Technik / Heike Wolf] Praxislösungen',	'',	'');

DROP TABLE IF EXISTS `lit_list`;
CREATE TABLE `lit_list` (
  `list_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  `priority` smallint(6) NOT NULL DEFAULT 0,
  `visibility` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`list_id`),
  KEY `range_id` (`range_id`),
  KEY `priority` (`priority`),
  KEY `visibility` (`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `lit_list` (`list_id`, `range_id`, `name`, `format`, `user_id`, `mkdate`, `chdate`, `priority`, `visibility`) VALUES
('0b4d8c94244a1a571e3cc2afeeb15c5f',	'a07535cf2f8a72df33c12ddfa4b53dde',	'Basisliteratur der Veranstaltung',	'**{dc_creator}** |({dc_contributor})||\r\n{dc_title}||\r\n{dc_identifier}||\r\n%%{published}%%||\r\n{note}||\r\n[{lit_plugin_display_name}]{external_link}|',	'76ed43ef286fb55cf9e41beadb484a9f',	1343924971,	1343925058,	1,	1);

DROP TABLE IF EXISTS `lit_list_content`;
CREATE TABLE `lit_list_content` (
  `list_element_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `list_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `catalog_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`list_element_id`),
  KEY `list_id` (`list_id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `lit_list_content` (`list_element_id`, `list_id`, `catalog_id`, `user_id`, `mkdate`, `chdate`, `note`, `priority`) VALUES
('03e0d3910e15fd7ae2826ed6baf2b59d',	'0b4d8c94244a1a571e3cc2afeeb15c5f',	'ce704bbc9453994daa05d76d2d04aba0',	'76ed43ef286fb55cf9e41beadb484a9f',	1343925058,	1343925058,	'',	2),
('0cf7e4622ddbcc145b5792519979116f',	'0b4d8c94244a1a571e3cc2afeeb15c5f',	'd6623a3c2b8285fb472aa759150148ad',	'76ed43ef286fb55cf9e41beadb484a9f',	1343925058,	1343925058,	'',	4),
('28de3cab6e36758b96ba757b65512cd2',	'0b4d8c94244a1a571e3cc2afeeb15c5f',	'54181f281faa777941acc252aebaf26d',	'76ed43ef286fb55cf9e41beadb484a9f',	1343925058,	1343925058,	'',	3),
('48acf3d39374f46876d46df0f56203cd',	'0b4d8c94244a1a571e3cc2afeeb15c5f',	'b5d115a7f7cad02b4535fb3090bf18da',	'76ed43ef286fb55cf9e41beadb484a9f',	1343925058,	1343925058,	'',	5),
('7e129b140176dfc1a4c53e065fa5e8b1',	'0b4d8c94244a1a571e3cc2afeeb15c5f',	'15074ad4f2bd2c57cbc9dfb343c1355b',	'76ed43ef286fb55cf9e41beadb484a9f',	1343925058,	1343925058,	'',	1);

DROP TABLE IF EXISTS `lockedadmissions`;
CREATE TABLE `lockedadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `lock_rules`;
CREATE TABLE `lock_rules` (
  `lock_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `permission` enum('autor','tutor','dozent','admin','root') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'dozent',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_type` enum('sem','inst','user') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'sem',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `loginbackgrounds`;
CREATE TABLE `loginbackgrounds` (
  `background_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` tinyint(1) NOT NULL DEFAULT 1,
  `desktop` tinyint(1) NOT NULL DEFAULT 1,
  `in_release` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`background_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `loginbackgrounds` (`background_id`, `filename`, `mobile`, `desktop`, `in_release`) VALUES
(1,	'Login-Hintergrund.jpg',	0,	1,	1),
(2,	'Login-Hintergrund-mobil.jpg',	1,	0,	1);

DROP TABLE IF EXISTS `log_actions`;
CREATE TABLE `log_actions` (
  `action_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` int(20) NOT NULL DEFAULT 0,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('core','plugin','file') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `log_actions` (`action_id`, `name`, `description`, `info_template`, `active`, `expires`, `filename`, `class`, `type`) VALUES
('005df8d5eb23c66214b28b3c9792680b',	'SEM_CHANGED_ACCESS',	'Zugangsberechtigungen geändert',	'%user ändert die Zugangsberechtigungen der Veranstaltung %sem(%affected).',	0,	0,	NULL,	NULL,	NULL),
('00af9c41fc56b617097bdef1e7dca397',	'MVV_FACHINST_NEW',	'MVV: Fach-Einrichtung Zuweisung erstellen',	'%user weist das Fach %fach(%affected) der Einrichtung %inst(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('04061e4d13b416e10d6094679e7c9d9c',	'MVV_MODULTEIL_DEL',	'MVV: Modulteil löschen',	'%user löscht Modulteil %modulteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('060390e972f9580ab92c7febb99fb2fa',	'MVV_LVSEMINAR_NEW',	'MVV: LV-Gruppe zu Veranstaltung Zuweisung erstellen',	'%user weist der LV-Gruppe %lvgruppe(%affected) der Veranstaltung %sem(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('07c384b8328f56a33b4edb2570e85a48',	'MVV_MODULTEIL_DESK_NEW',	'MVV: Modulteil Deskriptor erstellen',	'%user erstellt neuen Modulteil Deskriptor %modulteildesk(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('08a643645ddb5d3df5826d9fa863f665',	'MVV_STGTEILABS_NEW',	'MVV: Studiengangteilabschnitt erstellen',	'%user erstellt neuen Studiengangteilabschnitt %stgteilabs(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('0966a73e85ac73c64818cc6eae4be09e',	'MVV_MODUL_USER_DEL',	'MVV: Person zu Modul Zuweisung löschen',	'%user löscht die Zuweisung von %user(%coaffected) als %gruppe zum Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('0a3d58fbc0964ed9d85950e4d729715d',	'MVV_STUDIENGANG_NEW',	'MVV: Studiengang erstellen',	'%user erstellt neuen Studiengang %stg(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('0d87c25b624b16fb9b8cdaf9f4e96e53',	'INST_CREATE',	'Einrichtung anlegen',	'%user legt Einrichtung %inst(%affected) an.',	1,	0,	NULL,	NULL,	NULL),
('0e46eec26da0b0217280e8be4b26227b',	'MVV_ABS_ZUORD_DEL',	'MVV: Abschluss-Kategorien Zuweisung  löschen',	'%user löscht die Zuweisung des Abschlusses %abschluss(%affected) zur Kategorie %abskategorie(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('0ee290df95f0547caafa163c4d533991',	'SEM_VISIBLE',	'Veranstaltung sichtbar schalten',	'%user schaltet %sem(%affected) sichtbar.',	1,	0,	NULL,	NULL,	NULL),
('0ef58f0b0a97d83616efc6e9479c522e',	'MVV_FACHBERATER_DEL',	'MVV: Person zu Fach Zuweisung löschen',	'%user löscht die Zuweisung von %user(%coaffected) zum Studiengangteil %stgteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('10916a5a08ca16bfd055e4823311377a',	'MVV_DOK_ZUORD_DEL',	'MVV: Dokumentzuordnung löschen',	'%user löscht die Zuweisung des Dokumentes %dokument(%affected) zu %object_type(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('10c31be1aec819c03b0dc299d0111576',	'CHANGE_BASIC_DATA',	'Basisdaten geändert',	'%user hat in Veranstaltung %sem(%affected) die Daten %info geändert.',	0,	0,	NULL,	NULL,	NULL),
('10c320bc80022f1ff1381857af46f474',	'SEM_DEL_FROM_GROUP',	'Veranstaltung aus Gruppe entfernen',	'%user entfernt Veranstaltung %sem(%affected) aus der Gruppe %sem(%coaffected).',	1,	0,	NULL,	NULL,	'core'),
('13b5297079e1600ccc3ca6f49081099f',	'MVV_STG_STGTEIL_DEL',	'MVV: Studiengang zu Studiengangteil Zuweisung löschen',	'%user löscht die Zuweisung des Studienganges %stg(%affected) zum Studiengangteil %stgteil(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('157f75beb242c7de8ff790d4005a259e',	'MVV_FACH_DEL',	'MVV: Fach löschen',	'%user löscht Fach %fach(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('1585bb70e5e403fd818e59bb622db4a3',	'STATUSGROUP_ADD_USER',	'Nutzer wird zu einer Statusgruppe hinzugefügt',	'%user fügt %user(%affected) zur %group(%coaffected) hinzu.',	1,	0,	NULL,	NULL,	NULL),
('17f0a527e9db7dec09687a70681559cf',	'RES_ASSIGN_DEL_SINGLE',	'Direktbuchung löschen',	'%user löscht Direktbuchung für %res(%affected) (%info).',	0,	0,	NULL,	NULL,	NULL),
('1a1e8c9c3125ea8d2c58c875a41226d6',	'INST_DEL',	'Einrichtung löschen',	'%user löscht Einrichtung %info (%affected).',	1,	0,	NULL,	NULL,	NULL),
('1a27a101df926fafce35635f0dd72522',	'MVV_MODULTEIL_NEW',	'MVV: Modulteil erstellen',	'%user erstellt neuen Modulteil %modulteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('1e6debdbfd7a7aeef2dcb61fa65beddd',	'MVV_ABSCHLUSS_DEL',	'MVV: Abschluss löschen',	'%user löscht Abschluss %abschluss(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('1eb6597264fc19da6b48f519c3e47078',	'MVV_MODUL_DESK_DEL',	'MVV: Modul Deskriptor löschen',	'%user löscht Modul Deskriptor %moduldesk(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('23f50ebeab22138bc959f27111ae5ab0',	'MVV_STG_STGTEIL_NEW',	'MVV: Studiengang zu Studiengangteil Zuweisung erstellen',	'%user weist den Studiengang %stg(%affected) dem Studiengangteil %stgteil(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('23f7a87368df1132df137e7d320fa698',	'MVV_LVMODULTEIL_NEW',	'MVV: LV-Gruppe zu Modulteil Zuweisung erstellen',	'%user weist der LV-Gruppe %lv(%affected) den Modulteil %modulteil(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('2420da2946df66a5ad96c6d45e97d5b9',	'SEM_ADD_STUDYAREA',	'Studienbereich zu Veranst. hinzufügen',	'%user fügt Studienbereich \"%studyarea(%coaffected)\" zu %sem(%affected) hinzu.',	0,	0,	NULL,	NULL,	NULL),
('248f54105b7102e5cbcc36e9439504fb',	'STUDYAREA_ADD',	'Studienbereich hinzufügen',	'%user legt Studienbereich %studyarea(%affected) an.',	0,	0,	NULL,	NULL,	NULL),
('292b1cf6c0b46d7038baa75e0b273299',	'MVV_MODUL_DEL',	'MV: Modul löschen',	'%user löscht Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('293a742d791a1edbaaa738f8991aeb7b',	'MVV_LVSEMINAR_UPDATE',	'MVV: LV-Gruppe zu Veranstaltung Zuweisung ändern',	'%user ändert die Zuweisung der LV-Gruppe %lvgruppe(%affected) zur Veranstaltung %sem(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('2dd254c28cac83c59856fe89500e3bc3',	'MVV_STGTEILABS_MODUL_DEL',	'MVV: Stgteilabschnitt-Modul Zuweisung löschen',	'%user löscht die Zuweisung des Studiengangteilabschnitts %stgteilabs(%affected) zum Modul %modul(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('2e816bfd792e4a99913f11c04ad49198',	'SEM_UNDELETE_SINGLEDATE',	'Einzeltermin wiederherstellen',	'%user stellt Einzeltermin %singledate(%affected) in %sem(%coaffected) wieder her.',	1,	0,	NULL,	NULL,	NULL),
('30dfb509cb1a8e228af3bd17dd6c8d1d',	'RES_ASSIGN_SEM',	'Buchen einer Ressource (VA)',	'%user bucht %res(%affected) für %sem(%coaffected) (%info).',	0,	0,	NULL,	NULL,	NULL),
('31fd4549853915608facb8c3e2b101d6',	'MVV_STGTEIL_DEL',	'MVV: Studiengangteil löschen',	'%user löscht Studiengangteil %stgteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('347738302758bea951248b255409fa85',	'MVV_KATEGORIE_UPDATE',	'MVV: Abschluss-Kategorie ändern',	'%user ändert Abschluss-Kategorie %abskategorie(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('370db4eb0e38051dd3c5d7c52717215a',	'SEM_DELETE_SINGLEDATE_REQUEST',	'Einzeltermin, Raumanfrage gelöscht',	'%user hat in %sem(%affected) die Raumanfrage für den Termin <em>%coaffected</em> gelöscht.',	1,	0,	NULL,	NULL,	NULL),
('3861d5249b8fe7f2be57adfda8944f4d',	'MVV_LVGRUPPE_UPDATE',	'MVV: LV-Gruppe ändern',	'%user ändert LV-Gruppe %lvgruppe(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('398c62a78ec7e2b72d88cce504c2730f',	'MVV_MODULTEIL_STGTEILABS_NEW',	'MVV: Studiengangteilabschnitt zu Modulteil Zuweisung erstellen',	'%user weist den Modulteil %modulteil(%affected) dem Studiengangteilabschnitt %stgteilabs(%coaffected) im %fachsem. Fachsemester zu.',	1,	0,	NULL,	'MVV',	'core'),
('3f7dcf6cc85d6fba1281d18c4d9aba6f',	'SEM_ADD_SINGLEDATE',	'Einzeltermin hinzufügen',	'%user hat in %sem(%affected) den Einzeltermin <em>%coaffected</em> hinzugefügt',	1,	0,	NULL,	NULL,	NULL),
('3f9b68eacae768ff01cc1cc2d0d82174',	'MVV_FACHBERATER_NEW',	'MVV: Person zu Fach Zuweisung erstellen',	'%user weist dem Studiengangteil %stgteil(%affected) %user(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('40455e06f6a679cd87c68c375c9dfa5a',	'MVV_STGTEILBEZ_DEL',	'MVV: Studiengangteil-Bezeichnung löschen',	'%user löscht Studiengangteil-Bezeichnung %stgteilbez(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('428c09d5a31b1057b08ca5e3b3877109',	'MVV_FACHBERATER_UPDATE',	'MVV: Person zu Fach Zuweisung ändern',	'%user ändert die Zuweisung von %user(%coaffected) zum Studiengangteil %stgteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('447d6ae1b51b97b04f7ae290c6b002d7',	'MVV_DOKUMENT_DEL',	'MVV: Dokument löschen',	'%user löscht Dokument %dokument(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('4490aa3d29644e716440fada68f54032',	'LOG_ERROR',	'Allgemeiner Log-Fehler',	'Allgemeiner Logging-Fehler, Details siehe Debug-Info.',	1,	0,	NULL,	NULL,	NULL),
('46bc7faabfc73864998b561b1011e3fe',	'RES_REQUEST_UPDATE',	'Geänderte Raumanfrage',	'%user ändert Raumanfrage für %sem(%affected), gewünschter Raum: %res(%coaffected), %info',	0,	0,	NULL,	NULL,	NULL),
('4765700be65e3fe1c12e7d74a2579bed',	'MVV_MODULINST_UPDATE',	'MVV: Modul-Einrichtung Beziehung ändern',	'%user ändert die Zuweisung der Einrichtungen %inst(%coaffected) zum Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('47c4f06ce3de71213b69d8d0f8d24f8e',	'MVV_MODUL_LANG_NEW',	'MVV: Sprache zu Modul Zuweisung erstellen',	'%user weist dem Modul %modul(%affected) die Unterrichtssprache %language(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('4869cd69f20d4d7ed4207e027d763a73',	'INST_USER_STATUS',	'Einrichtungsnutzerstatus ändern',	'%user ändert Status für %user(%coaffected) in Einrichtung %inst(%affected): %info.',	1,	0,	NULL,	NULL,	NULL),
('494b5df89948da383d087107d4c0bbec',	'MVV_LVSEMINAR_DEL',	'MVV: LV-Gruppe zu Veranstaltung Zuweisung löschen',	'%user löscht die Zuweisung der LV-Gruppe %lvgruppe(%affected) zur Veranstaltung %sem(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('499a15daf534b3d810e6b9bac9a00d3e',	'MVV_MODUL_USER_NEW',	'MVV: Person zu Modul Zuweisung erstellen',	'%user weist dem Modul %modul(%affected) %user(%coaffected) als %gruppe zu.',	1,	0,	NULL,	'MVV',	'core'),
('49d58ac93d608d731696eb75b29a1836',	'MVV_FACH_NEW',	'MVV: Fach erstellen',	'%user erstellt neues Fach %fach(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('4b08c6b8539466a1f1968b44ec2996ed',	'MVV_LVMODULTEIL_DEL',	'MVV: LV-Gruppe zu Modulteil Zuweisung löschen',	'%user löscht die Zuweisung der LV-Gruppe %lv(%affected) zum Modulteil %modulteil(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('4dd6b4101f7bf3bd7fe8374042da95e9',	'USER_NEWPWD',	'Neues Passwort',	'%user generiert neues Passwort für %user(%affected)',	1,	0,	NULL,	NULL,	NULL),
('4e2cf05ca311e5a616a7612ce8f5a885',	'MVV_MODULTEIL_STGTEILABS_DEL',	'MVV: Studiengangteilabschnitt zu Modulteil Zuweisung löschen',	'%user löscht die Zuweisung des Modulteils %modulteil(%affected) im %fachsem. des Studiengangteilabschnitt %stgteilabs(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('535010528d6c012ec0e3535e2d754f66',	'SEM_USER_ADD',	'In Veranstaltung eingetragen',	'%user hat %user(%coaffected) für %sem(%affected) mit dem status %info eingetragen. (%dbg_info)',	0,	0,	NULL,	NULL,	NULL),
('566a614092e9f502d9340467ecef59d1',	'MVV_STGTEILVERSION_UPDATE',	'MVV: Studiengangteilversion ändern',	'%user ändert Studiengangteilversion %version(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('5a34b0ea6a824f96c0117a035d1cf9e9',	'MVV_DOKUMENT_UPDATE',	'MVV: Dokument ändern',	'%user ändert Dokument %dokument(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('5b96f2fe994637253ba0fe4a94ad1b98',	'SEM_ARCHIVE',	'Veranstaltung archivieren',	'%user archiviert %info (ID: %affected).',	1,	0,	NULL,	NULL,	NULL),
('5f8fda12a4c0bd6eadbb94861de83696',	'SEM_ADD_CYCLE',	'Regelmäßige Zeit hinzugefügt',	'%user hat in %sem(%affected) die regelmäßige Zeit %info hinzugefügt.',	1,	0,	NULL,	NULL,	NULL),
('5fd9b4ddb5c4e035c0b0e7751613cd94',	'MVV_STGTEILABS_MODUL_NEW',	'MVV: Stgteilabschnitt-Modul Zuweisung erstellen',	'%user weist dem Studiengangteilabschnitt %stgteilabs(%affected) dem Modul %Modul(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('63042706e5cd50924987b9515e1e6cae',	'INST_USER_ADD',	'Benutzer zu Einrichtung hinzufügen',	'%user fügt %user(%coaffected) zu Einrichtung %inst(%affected) mit Status %info hinzu.',	1,	0,	NULL,	NULL,	NULL),
('65c495cf5d5fcd7af862106bf13cff23',	'MVV_STGTEIL_UPDATE',	'MVV: Studiengangteil ändern',	'%user ändert Studiengangteil %stgteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('687433f4cf1b36cb93ad417738236484',	'MVV_STGTEILABS_UPDATE',	'MVV: Studiengangteilabschnitt ändern',	'%user ändert Studiengangteilabschnitt %stgteilabs(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('6be59dcd70197c59d7bf3bcd3fec616f',	'INST_USER_DEL',	'Benutzer aus Einrichtung löschen',	'%user löscht %user(%coaffected) aus Einrichtung %inst(%affected).',	1,	0,	NULL,	NULL,	NULL),
('6c5d5ed836c464be1c5547adcec3eae0',	'MVV_MODULTEIL_LANG_UPDATE',	'MVV: Sprache zu Modulteil Zuweisung ändern',	'%user ändert die Zuweisung der Unterrichtssprache %language(%coaffected) zum Modulteil %modulteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('6e2b789a57b9125af59c0273f5b47cb1',	'SEM_USER_DEL',	'Aus Veranstaltung ausgetragen',	'%user hat %user(%coaffected) aus %sem(%affected) ausgetragen. (%info)',	0,	0,	NULL,	NULL,	NULL),
('6f4bb66c1caf89879d89f3b1921a93dd',	'SEM_DELETE_CYCLE',	'Regelmäßige Zeit gelöscht',	'%user hat in %sem(%affected) die regelmäßige Zeit %info gelöscht.',	1,	0,	NULL,	NULL,	NULL),
('71bfea5eb0d9a85d1247b83383ac5b7e',	'MVV_MODUL_DESK_NEW',	'MVV: Modul Deskriptor erstellen',	'%user erstellt neuen Modul Deskriptor %moduldesk(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('754708c8c0c61a916855c5031014acbb',	'SEM_DELETE_STUDYAREA',	'Studienbereich aus Veranst. löschen',	'%user entfernt Studienbereich \"%studyarea(%coaffected)\" aus %sem(%affected).',	0,	0,	NULL,	NULL,	NULL),
('770f76504dcbbfa6bdc51a8c0f6df4b2',	'MVV_STGTEILABS_DEL',	'MVV: Studiengangteilabschnitt löschen',	'%user löscht Studiengangteilabschnitt %stgteilabs(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('7d26ffbf73103601966f7517e40d7e66',	'RES_REQUEST_NEW',	'Neue Raumanfrage',	'%user stellt neue Raumanfrage für %sem(%affected), gewünschter Raum: %res(%coaffected), %info',	0,	0,	NULL,	NULL,	NULL),
('7d37d874592eea50eef5239fb7b8e3d7',	'MVV_MODULTEIL_LANG_DEL',	'MVV: Sprache zu Modulteil Zuweisung löschen',	'%user löscht die Zuweisung der Unterrichtssprache %language(%coaffected) zum Modulteil %modulteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('7f2ec1cbf988eee849de7cfa031b68f9',	'MVV_STGTEILVERSION_DEL',	'MVV: Studiengangteilversion löschen',	'%user löscht Studiengangteilversion %version(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('7f335b5d0d9f8d37652718cb89937b38',	'MVV_STGTEIL_NEW',	'MVV: Studiengangteil erstellen',	'%user erstellt neuen Studiengangteil %stgteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('8216cba6119cf4a4de82ec3ce8ac51b7',	'MVV_MODUL_USER_UPDATE',	'MVV: Person zu Modul Zuweisung ändern',	'%user ändert die Zuweisung von %user(%coaffected) als %gruppe zum Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('89114dcd6f02dd7f94488a616c21a7c3',	'PLUGIN_ENABLE',	'Plugin einschalten',	'%user hat in Veranstaltung %sem(%affected) das Plugin %plugin(%coaffected) aktiviert.',	1,	0,	NULL,	NULL,	NULL),
('897207a36c411d736947052219624b72',	'USER_CHANGE_PASSWORD',	'Nutzerpasswort geändert',	'%user ändert/setzt das Passwort für %user(%affected)',	0,	0,	NULL,	NULL,	NULL),
('8aad296e52423452fc75cabaf2bee384',	'USER_CHANGE_USERNAME',	'Benutzernamen ändern',	'%user ändert/setzt Benutzernamen für %user(%affected): %info.',	1,	0,	NULL,	NULL,	NULL),
('8f87cf1a8546e9671244fba1ac51e805',	'MVV_LVGRUPPE_DEL',	'MVV: LV-Gruppe löschen',	'%user löscht LV-Gruppe %lvgruppe(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('9123d360316ba28ddb32c0ed1a0320f2',	'STUDYAREA_DELETE',	'Studienbereich löschen',	'%user entfernt Studienbereich %studyarea(%affected).',	0,	0,	NULL,	NULL,	NULL),
('91251b5768b312ca23d6721cdc99a005',	'MVV_KATEGORIE_NEW',	'MVV: Abschluss-Kategorie erstellen',	'%user erstellt neue Abschluss-Kategorie %abskategorie(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('9179d3cf4e0353f9874bcde072d12b30',	'RES_REQUEST_DENY',	'Abgelehnte Raumanfrage',	'%user lehnt Raumanfrage für %sem(%coaffected), Raum %sem(%affected) ab.',	0,	0,	NULL,	NULL,	NULL),
('95935c7997427ea42a3dd6be05b51e81',	'MVV_MODULTEIL_UPDATE',	'MVV: Modulteil ändern',	'%user ändert Modulteil %modulteil(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('997cf01328d4d9f36b9f50ac9b6ace47',	'SEM_DELETE_SINGLEDATE',	'Einzeltermin löschen',	'%user löscht Einzeltermin %singledate(%affected) in %sem(%coaffected).',	1,	0,	NULL,	NULL,	NULL),
('9a7a5112de76fa0b8bd8910174d5f107',	'MVV_STGTEILBEZ_UPDATE',	'MVV: Studiengangteil-Bezeichnung ändern',	'%user ändert Studiengangteil-Bezeichnung %stgteilbez(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('9d13643a1833c061dc3d10b4fb227f12',	'SEM_SET_ENDSEMESTER',	'Semesterlaufzeit ändern',	'%user hat in %sem(%affected) die Laufzeit auf %semester(%coaffected) geändert',	1,	0,	NULL,	NULL,	NULL),
('9d642dc93540580d42ba2ea502c3fbf6',	'SINGLEDATE_CHANGE_TIME',	'Einzeltermin bearbeiten',	'%user hat in %sem(%affected) den Einzeltermin %coaffected geändert.',	1,	0,	NULL,	NULL,	NULL),
('9ed46a3ca3d4f43e17f91e314224dcae',	'SEM_CHANGE_CYCLE',	'Regelmäßige Zeit geändert',	'%user hat in %sem(%affected) die regelmäßige Zeit %info geändert',	1,	0,	NULL,	NULL,	NULL),
('9eea9c8ec3fa6916fae974559f3a6e64',	'MVV_STGTEILABS_MODUL_UPDATE',	'MVV: Stgteilabschnitt-Modul Zuweisung ändern',	'%user ändert die Zuweisung des Studiengangteilabschnitts %stgteilabs(%affected) zum Modul %modul(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('a06bd1ca1b5eec038c079042eb25acb0',	'MVV_DOKUMENT_NEW',	'MVV: Dokument erstellen',	'%user erstellt neues Dokument %dokument(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('a0928e74639fd2a55f5d4d2a3c5a8e71',	'RES_REQUEST_DEL',	'Raumanfrage löschen',	'%user löscht Raumanfrage für %sem(%affected).',	0,	0,	NULL,	NULL,	NULL),
('a0b8799fa671e0ce6069483e0c4b5123',	'MVV_ABS_ZUORD_NEW',	'MVV: Abschluss-Kategorien Zuweisung erstellen',	'%user weist den Abschluss %abschluss(%affected) der Kategorie %abskategorie(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('a3856b6531e2f79d158b5ebfb998e5db',	'RES_ASSIGN_DEL_SEM',	'VA-Buchung löschen',	'%user löscht Ressourcenbelegung für %res(%affected) in Veranstaltung %sem(%coaffected), %info.',	0,	0,	NULL,	NULL,	NULL),
('a3db2d066861fd1cf1d532d2a736d495',	'MVV_STUDIENGANG_DEL',	'MVV: Studiengang löschen',	'%user löscht Studiengang %stg(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('a66c9e04e9c41bf5cc4d23fa509a8667',	'PLUGIN_DISABLE',	'Plugin ausschalten',	'%user hat in Veranstaltung %sem(%affected) das Plugin %plugin(%coaffected) deaktiviert.',	1,	0,	NULL,	NULL,	NULL),
('a92afa63584cc2a62d2dd2996727b2c5',	'USER_CREATE',	'Nutzer anlegen',	'%user legt Nutzer %user(%affected) an.',	1,	0,	NULL,	NULL,	NULL),
('a94706b41493e32f8336194262418c01',	'SEM_INVISIBLE',	'Veranstaltung unsichtbar schalten',	'%user versteckt %sem(%affected).',	1,	0,	NULL,	NULL,	NULL),
('aa12de984598c527bfb8b118affaf34a',	'MVV_STG_STGTEIL_UPDATE',	'MVV: Studiengang zu Studiengangteil Zuweisung ändern',	'%user ändert die Zuweisung des Studienganges %stg(%affected) zum Studiengangteil %stgteil(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('ad405d21c2e0df758ee8a61ed39901fe',	'MVV_LVMODULTEIL_UPDATE',	'MVV: LV-Gruppe zu Modulteil Zuweisung ändern',	'%user ändert die Zuweisung der LV-Gruppe %lv(%affected) zum Modulteil %modulteil(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('b035ea1a197edc6271fafa4094f87a57',	'MVV_DOK_ZUORD_NEW',	'MVV: Dokumentzuordnung erstellen',	'%user weist das Dokument %dokument(%affected) %object_type(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('b19d01e45715df05f4b060cd56dc204f',	'MVV_MODULTEIL_DESK_UPDATE',	'MVV: Modulteil Deskriptor ändern',	'%user ändert Modulteil Deskriptor %modulteildesk(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('b205bde204b5607e036c10557a6ce149',	'SEM_SET_STARTSEMESTER',	'Startsemester ändern',	'%user hat in %sem(%affected) das Startsemester auf %semester(%coaffected) geändert.',	1,	0,	NULL,	NULL,	NULL),
('b38ecbb1fddf6c3868a6a9a75bab8ef8',	'MVV_KATEGORIE_DEL',	'MVV: Abschluss-Kategorie löschen',	'%user löscht Abschluss-Kategorie %abskategorie(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('b5e3e8401e7e92051c13ba7b46e28f75',	'MVV_STGTEILVERSION_NEW',	'MVV: Studiengangteilversion erstellen',	'%user erstellt neue Studiengangteilversion %version(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('b8e940588cd8d5181774377586b85202',	'MVV_STGTEILBEZ_NEW',	'MVV: Studiengangteil-Bezeichnung erstellen',	'%user erstellt neue Studiengangteil-Bezeichnung %stgteilbez(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('bace236af595612b77943bcb47a0a7fe',	'MVV_STUDIENGANG_UPDATE',	'MVV: Studiengang ändern',	'%user ändert Studiengang %stg(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('bd2103035a8021942390a78a431ba0c4',	'DUMMY',	'Dummy-Aktion',	'%user tut etwas.',	1,	0,	NULL,	NULL,	NULL),
('bd78090961a15a8010a566a6cd1355f2',	'MVV_DOK_ZUORD_UPDATE',	'MVV: Dokumentzuordnung ändern',	'%user ändert die Zuweisung des Dokumentes %dokument(%affected) zu %object_type(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('bf192518a9c3587129ed2fdb9ea56f73',	'SEM_DELETE_FROM_ARCHIVE',	'Veranstaltung aus Archiv löschen',	'%user löscht %info aus dem Archiv (ID: %affected).',	1,	0,	NULL,	NULL,	NULL),
('c1d980ac5c5de271bd1471a11a3e37af',	'MVV_MODULINST_DEL',	'MVV: Modul-Einrichtung Beziehung löschen',	'%user löscht die Zuweisung der Einrichtungen %inst(%coaffected) zum Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('c36fa0f804cde78a6dcb1c30c2ee47ba',	'SEM_DELETE_REQUEST',	'Raumanfrage gelöscht',	'%user hat in %sem(%affected) die Raumanfrage für die gesamte Veranstaltung gelöscht.',	1,	0,	NULL,	NULL,	NULL),
('c4b1d3305d017935c8b6946996594172',	'MVV_FACH_UPDATE',	'MVV: Fach ändern',	'%user ändert Fach %fach(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('c6a23a780aa2a219ddd0bb2445c19bf8',	'MVV_MODULTEIL_LANG_NEW',	'MVV: Sprache zu Modulteil Zuweisung erstellen',	'%user weist dem Modulteil %modulteil(%affected) die Unterrichtssprache %language(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('ca216ccdf753f59ba7fd621f7b22f7bd',	'USER_CHANGE_NAME',	'Personennamen ändern',	'%user ändert/setzt Name für %user(%affected) - %info.',	1,	0,	NULL,	NULL,	NULL),
('cbf93b2a248642289c2ad4b3d59b9d55',	'MVV_FACHINST_DEL',	'MVV: Fach-Einrichtung Zuweisung löschen',	'%user löscht die Zuweisung des Faches %fach(%affected) zur Einrichtung %inst(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('cf8986a67e67ca273e15fd9230f6e872',	'USER_CHANGE_TITLE',	'Akademische Titel ändern',	'%user ändert/setzt akademischen Titel für %user(%affected) - %info.',	1,	0,	NULL,	NULL,	NULL),
('d07c8b37c6d3e206cd012d07ba8028b1',	'SEM_CHANGED_RIGHTS',	'Veranstaltungsrechte geändert',	'%user hat %user(%coaffected) in %sem(%affected) als %info eingetragen. (%dbg_info)',	0,	0,	NULL,	NULL,	NULL),
('d18d750fb2c166e1c425976e8bca96e7',	'USER_CHANGE_EMAIL',	'E-Mail-Adresse ändern',	'%user ändert/setzt E-Mail-Adresse für %user(%affected): %info.',	1,	0,	NULL,	NULL,	NULL),
('d1989a21fc77ffc34e705bb3dc215ebb',	'STATUSGROUP_REMOVE_USER',	'Nutzer wird aus einer Statusgruppe gelöscht',	'%user entfernt %user(%affected) aus %group(%coaffected).',	1,	0,	NULL,	NULL,	NULL),
('d4e99ffb6ffb32a20c0d9075bb73889d',	'MVV_ABS_ZUORD_UPDATE',	'MVV: Abschluss-Kategorien Zuweisung  ändern',	'%user ändert die Zuweisung des Abschlusses %abschluss(%affected) zur Kategorie %abskategorie(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('d8e863ca143ff87cce89f17b2e3b409e',	'MVV_ABSCHLUSS_UPDATE',	'MVV: Abschluss ändern',	'%user ändert Abschluss %abschluss(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('dcd16239a49c367e37faf8ffe9ae0081',	'SEM_ADD_TO_GROUP',	'Veranstaltung zu Gruppe hinzufügen',	'%user ordnet Veranstaltung %sem(%affected) der Gruppe %sem(%coaffected) zu.',	1,	0,	NULL,	NULL,	'core'),
('df41cc74f6fd857b1690e36dafa070a9',	'MVV_MODUL_LANG_DEL',	'MVV: Sprache zu Modul Zuweisung löschen',	'%user löscht die Zuweisung der Unterrichtssprache %language(%coaffected) zum Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('e2c703a9167804463112284853b9545b',	'MVV_MODUL_UPDATE',	'MVV: Modul ändern',	'%user ändert Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('e406e407501c8418f752e977182cd782',	'USER_CHANGE_PERMS',	'Globalen Nutzerstatus ändern',	'%user ändert/setzt globalen Status von %user(%affected): %info',	1,	0,	NULL,	NULL,	NULL),
('e5c0ecfea7d12ed95ea485d4ec18c9ae',	'MVV_MODUL_LANG_UPDATE',	'MVV: Sprache zu Modul Zuweisung ändern',	'%user ändert die Zuweisung der Unterrichtssprache %language(%coaffected) zum Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('e694e86b2ec50bc0b99864acc947ed78',	'MVV_LVGRUPPE_NEW',	'MVV: LV-Gruppe erstellen',	'%user erstellt neue LV-Gruppe %lvgruppe(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('e7449d98b8ca69d16f13c0a342a8db41',	'MVV_ABSCHLUSS_NEW',	'MVV: Abschluss erstellen',	'%user erstellt neuen Abschluss %abschluss(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('e8423589894e5df742804e57f54fa5aa',	'MVV_MODULTEIL_STGTEILABS_UPDATE',	'MVV: Studiengangteilabschnitt zu Modulteil Zuweisung ändern',	'%user ändert die Zuweisung des Modulteils %modulteil(%affected) im %fachsem. des Studiengangteilabschnitt %stgteilabs(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('e8646729e5e04970954c8b9679af389b',	'USER_DEL',	'Benutzer löschen',	'%user löscht %user(%affected) (%info)',	1,	0,	NULL,	NULL,	NULL),
('e8b1105ca4f2305ef0db6c961d2fbe4c',	'RES_ASSIGN_SINGLE',	'Buchen einer Ressource (Einzel)',	'%user bucht %res(%affected) direkt (%info).',	0,	0,	NULL,	NULL,	NULL),
('eac0850398466b86ec6af4068cff74ab',	'MVV_MODULTEIL_DESK_DEL',	'MVV: Modulteil Deskriptor löschen',	'%user löscht Modulteil Deskriptor %modulteildesk(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('f363c6db07203dfcec893b1b8fc0eaee',	'MVV_FACHINST_UPDATE',	'MVV: Fach-Einrichtung Zuweisung ändern',	'%user ändert die Zuweisung des Faches %fach(%affected) zur Einrichtung %inst(%coaffected).',	1,	0,	NULL,	'MVV',	'core'),
('f858b05c11f5faa2198a109a783087a8',	'SEM_CREATE',	'Veranstaltung anlegen',	'%user legt %sem(%affected) an.',	1,	0,	NULL,	NULL,	NULL),
('f97335d7f45fd87a4e5e2c1d17f38dc0',	'MVV_MODUL_DESK_UPDATE',	'MVV: Modul Deskriptor ändern',	'%user ändert Modul Deskriptor %moduldesk(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('fb550711e786f5d7d6a9ef8b4eb915f6',	'MVV_MODULINST_NEW',	'MVV: Modul-Einrichtung Beziehung erstellen',	'%user weist dem Modul %modul(%affected) die Einrichtungen %inst(%coaffected) zu.',	1,	0,	NULL,	'MVV',	'core'),
('fc72d34ddb15a9819919fc42716830b3',	'MVV_MODUL_NEW',	'MVV: Modul erstellen',	'%user erstellt neues Modul %modul(%affected).',	1,	0,	NULL,	'MVV',	'core'),
('fd74339a9ea038d084569e33e2655b6a',	'CHANGE_INSTITUTE_DATA',	'Beteiligte Einrichtungen geändert',	'%user hat in Veranstaltung %sem(%affected) die Daten geändert. %info',	0,	0,	NULL,	NULL,	NULL),
('ff806b4b26f8bc8c3e65e29d14176cd9',	'RES_REQUEST_RESOLVE',	'Aufgelöste Raumanfrage',	'%user löst Raumanfrage für %sem(%affected), Raum %res(%coaffected) auf.',	0,	0,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `log_events`;
CREATE TABLE `log_events` (
  `event_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `action_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `affected_range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `coaffected_range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbg_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `action_id` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `lti_data`;
CREATE TABLE `lti_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT 0,
  `course_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_id` int(11) NOT NULL DEFAULT 0,
  `launch_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `lti_grade`;
CREATE TABLE `lti_grade` (
  `link_id` int(11) NOT NULL DEFAULT 0,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `score` float NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`link_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `lti_tool`;
CREATE TABLE `lti_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `launch_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consumer_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consumer_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_custom_url` tinyint(1) NOT NULL DEFAULT 0,
  `deep_linking` tinyint(1) NOT NULL DEFAULT 0,
  `send_lis_person` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mail_queue_entries`;
CREATE TABLE `mail_queue_entries` (
  `mail_queue_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `tries` int(11) NOT NULL,
  `last_try` int(11) NOT NULL DEFAULT 0,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`mail_queue_id`),
  KEY `message_id` (`message_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `media_cache`;
CREATE TABLE `media_cache` (
  `id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `autor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_adressees` tinyint(4) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `priority` enum('normal','high') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`message_id`),
  KEY `autor_id` (`autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `message_tags`;
CREATE TABLE `message_tags` (
  `message_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`message_id`,`user_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `message_user`;
CREATE TABLE `message_user` (
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `message_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `readed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `snd_rec` enum('rec','snd') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'rec',
  `answered` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`message_id`,`snd_rec`,`user_id`),
  KEY `user_id` (`user_id`,`snd_rec`,`deleted`,`readed`,`mkdate`),
  KEY `user_id_2` (`user_id`,`snd_rec`,`deleted`,`mkdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_abschl_kategorie`;
CREATE TABLE `mvv_abschl_kategorie` (
  `kategorie_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_kurz` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beschreibung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`kategorie_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_abschl_zuord`;
CREATE TABLE `mvv_abschl_zuord` (
  `abschluss_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `kategorie_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(4) NOT NULL DEFAULT 9999,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`abschluss_id`),
  KEY `kategorie_id` (`kategorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_dokument`;
CREATE TABLE `mvv_dokument` (
  `dokument_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `url` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linktext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beschreibung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`dokument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_dokument_zuord`;
CREATE TABLE `mvv_dokument_zuord` (
  `dokument_zuord_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `dokument_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `object_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(3) NOT NULL DEFAULT 999,
  `kommentar` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`dokument_zuord_id`),
  UNIQUE KEY `dokument_id` (`dokument_id`,`range_id`,`object_type`) USING BTREE,
  KEY `range_id_object_type` (`range_id`,`object_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_fachberater`;
CREATE TABLE `mvv_fachberater` (
  `stgteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`stgteil_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_fach_inst`;
CREATE TABLE `mvv_fach_inst` (
  `fach_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`fach_id`,`institut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_lvgruppe`;
CREATE TABLE `mvv_lvgruppe` (
  `lvgruppe_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alttext` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`lvgruppe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_lvgruppe_modulteil`;
CREATE TABLE `mvv_lvgruppe_modulteil` (
  `lvgruppe_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `modulteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `fn_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`lvgruppe_id`,`modulteil_id`),
  KEY `fn_id` (`fn_id`),
  KEY `modulteil_id` (`modulteil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_lvgruppe_seminar`;
CREATE TABLE `mvv_lvgruppe_seminar` (
  `lvgruppe_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`lvgruppe_id`,`seminar_id`),
  KEY `seminar_id` (`seminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modul`;
CREATE TABLE `mvv_modul` (
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `quelle` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variante` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `flexnow_modul` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `end` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `beschlussdatum` int(11) DEFAULT NULL,
  `fassung_nr` int(2) DEFAULT NULL,
  `fassung_typ` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `version` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `dauer` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kapazitaet` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kp` int(11) DEFAULT NULL,
  `wl_selbst` int(11) DEFAULT NULL,
  `wl_pruef` int(11) DEFAULT NULL,
  `pruef_ebene` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `faktor_note` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '1',
  `stat` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `kommentar_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verantwortlich` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modul_id`),
  KEY `stat` (`stat`),
  KEY `flexnow_modul` (`flexnow_modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modulteil`;
CREATE TABLE `mvv_modulteil` (
  `modulteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `flexnow_modul` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nummer` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `num_bezeichnung` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `lernlehrform` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `semester` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `kapazitaet` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kp` int(11) DEFAULT NULL,
  `sws` int(11) DEFAULT NULL,
  `wl_praesenz` int(11) DEFAULT NULL,
  `wl_bereitung` int(11) DEFAULT NULL,
  `wl_selbst` int(11) DEFAULT NULL,
  `wl_pruef` int(11) DEFAULT NULL,
  `anteil_note` int(11) DEFAULT NULL,
  `ausgleichbar` int(1) NOT NULL DEFAULT 0,
  `pflicht` int(2) NOT NULL DEFAULT 0,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modulteil_id`),
  KEY `modul_id` (`modul_id`),
  KEY `flexnow_modul` (`flexnow_modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modulteil_deskriptor`;
CREATE TABLE `mvv_modulteil_deskriptor` (
  `deskriptor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `modulteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `bezeichnung` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `voraussetzung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_kapazitaet` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_wl_praesenz` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_wl_bereitung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_wl_selbst` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_wl_pruef` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pruef_vorleistung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pruef_leistung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_pflicht` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`deskriptor_id`),
  KEY `modulteil_id` (`modulteil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modulteil_language`;
CREATE TABLE `mvv_modulteil_language` (
  `modulteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `lang` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modulteil_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modulteil_stgteilabschnitt`;
CREATE TABLE `mvv_modulteil_stgteilabschnitt` (
  `modulteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `abschnitt_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `fachsemester` int(2) NOT NULL,
  `differenzierung` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modulteil_id`,`abschnitt_id`,`fachsemester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modul_deskriptor`;
CREATE TABLE `mvv_modul_deskriptor` (
  `deskriptor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `verantwortlich` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bezeichnung` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voraussetzung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kompetenzziele` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inhalte` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `literatur` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `turnus` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_kapazitaet` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_sws` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_wl_selbst` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_wl_pruef` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kommentar_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pruef_vorleistung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pruef_leistung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pruef_wiederholung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ersatztext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`deskriptor_id`),
  KEY `modul_id` (`modul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modul_inst`;
CREATE TABLE `mvv_modul_inst` (
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `gruppe` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modul_id`,`institut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modul_language`;
CREATE TABLE `mvv_modul_language` (
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `lang` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modul_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_modul_user`;
CREATE TABLE `mvv_modul_user` (
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `gruppe` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`modul_id`,`user_id`,`gruppe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_stgteil`;
CREATE TABLE `mvv_stgteil` (
  `stgteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `fach_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `kp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` int(2) DEFAULT NULL,
  `zusatz` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`stgteil_id`),
  KEY `fach_id` (`fach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_stgteilabschnitt`;
CREATE TABLE `mvv_stgteilabschnitt` (
  `abschnitt_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `version_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kommentar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kp` int(11) DEFAULT NULL,
  `ueberschrift` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`abschnitt_id`),
  KEY `version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_stgteilabschnitt_modul`;
CREATE TABLE `mvv_stgteilabschnitt_modul` (
  `abschnitt_modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `abschnitt_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `modul_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `flexnow_modul` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modulcode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 9999,
  `bezeichnung` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`abschnitt_modul_id`),
  UNIQUE KEY `abschnitt_id` (`abschnitt_id`,`modul_id`) USING BTREE,
  KEY `flexnow_modul` (`flexnow_modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_stgteilversion`;
CREATE TABLE `mvv_stgteilversion` (
  `version_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `stgteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `start_sem` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `end_sem` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beschlussdatum` int(11) DEFAULT NULL,
  `fassung_nr` int(2) DEFAULT NULL,
  `fassung_typ` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `beschreibung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stat` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `kommentar_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `stgteil_id` (`stgteil_id`),
  KEY `stat` (`stat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_stgteil_bez`;
CREATE TABLE `mvv_stgteil_bez` (
  `stgteil_bez_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_kurz` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `position` int(4) NOT NULL DEFAULT 9999,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`stgteil_bez_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_stg_stgteil`;
CREATE TABLE `mvv_stg_stgteil` (
  `studiengang_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `stgteil_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `stgteil_bez_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `position` int(11) NOT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`studiengang_id`,`stgteil_id`,`stgteil_bez_id`),
  KEY `stgteil_id` (`stgteil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mvv_studiengang`;
CREATE TABLE `mvv_studiengang` (
  `studiengang_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `abschluss_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `typ` enum('einfach','mehrfach') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_kurz` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beschreibung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `start` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `end` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `beschlussdatum` int(11) DEFAULT NULL,
  `fassung_nr` int(2) DEFAULT NULL,
  `fassung_typ` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `stat` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `kommentar_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schlagworte` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `editor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`studiengang_id`),
  KEY `abschluss_id` (`abschluss_id`),
  KEY `institut_id` (`institut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `topic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `expire` int(11) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(1) NOT NULL DEFAULT 0,
  `chdate` int(10) unsigned NOT NULL DEFAULT 0,
  `chdate_uid` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`news_id`),
  KEY `date` (`date`),
  KEY `chdate` (`chdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `news` (`news_id`, `topic`, `body`, `author`, `date`, `user_id`, `expire`, `allow_comments`, `chdate`, `chdate_uid`, `mkdate`) VALUES
('29f2932ce32be989022c6f43b866e744',	'Herzlich Willkommen!',	'Das Stud.IP-Team heisst sie herzlich willkommen. \r\nBitte schauen Sie sich ruhig um!\r\n\r\nWenn Sie das System selbst installiert haben und diese News sehen, haben Sie die Demonstrationsdaten in die Datenbank eingefügt. Wenn Sie produktiv mit dem System arbeiten wollen, sollten Sie diese Daten später wieder löschen, da die Passwörter der Accounts (vor allem des root-Accounts) öffentlich bekannt sind.',	'Root Studip',	1583151309,	'76ed43ef286fb55cf9e41beadb484a9f',	14562502,	1,	1583151309,	'',	1583151309);

DROP TABLE IF EXISTS `news_range`;
CREATE TABLE `news_range` (
  `news_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`news_id`,`range_id`),
  KEY `range_id` (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `news_range` (`news_id`, `range_id`) VALUES
('29f2932ce32be989022c6f43b866e744',	'76ed43ef286fb55cf9e41beadb484a9f'),
('29f2932ce32be989022c6f43b866e744',	'studip');

DROP TABLE IF EXISTS `news_rss_range`;
CREATE TABLE `news_rss_range` (
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rss_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_type` enum('user','sem','inst','global') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'user',
  PRIMARY KEY (`range_id`),
  KEY `rss_id` (`rss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `news_rss_range` (`range_id`, `rss_id`, `range_type`) VALUES
('studip',	'70cefd1e80398bb20ff599636546cdff',	'global');

DROP TABLE IF EXISTS `oauth_consumer_registry`;
CREATE TABLE `oauth_consumer_registry` (
  `ocr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ocr_usa_id_ref` int(11) DEFAULT NULL,
  `ocr_consumer_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ocr_consumer_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ocr_signature_methods` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HMAC-SHA1,PLAINTEXT',
  `ocr_server_uri` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocr_server_uri_host` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocr_server_uri_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ocr_request_token_uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocr_authorize_uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocr_access_token_uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocr_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ocr_id`),
  UNIQUE KEY `ocr_consumer_key` (`ocr_consumer_key`,`ocr_usa_id_ref`,`ocr_server_uri`),
  KEY `ocr_server_uri` (`ocr_server_uri`),
  KEY `ocr_server_uri_host` (`ocr_server_uri_host`,`ocr_server_uri_path`),
  KEY `ocr_usa_id_ref` (`ocr_usa_id_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `oauth_consumer_token`;
CREATE TABLE `oauth_consumer_token` (
  `oct_id` int(11) NOT NULL AUTO_INCREMENT,
  `oct_ocr_id_ref` int(11) NOT NULL,
  `oct_usa_id_ref` int(11) NOT NULL,
  `oct_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `oct_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `oct_token_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `oct_token_type` enum('request','authorized','access') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `oct_token_ttl` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  `oct_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`oct_id`),
  UNIQUE KEY `oct_ocr_id_ref` (`oct_ocr_id_ref`,`oct_token`),
  UNIQUE KEY `oct_usa_id_ref` (`oct_usa_id_ref`,`oct_ocr_id_ref`,`oct_token_type`,`oct_name`),
  KEY `oct_token_ttl` (`oct_token_ttl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `oauth_log`;
CREATE TABLE `oauth_log` (
  `olg_id` int(11) NOT NULL AUTO_INCREMENT,
  `olg_osr_consumer_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `olg_ost_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `olg_ocr_consumer_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `olg_oct_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `olg_usa_id_ref` int(11) DEFAULT NULL,
  `olg_received` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `olg_sent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `olg_base_string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `olg_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `olg_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `olg_remote_ip` bigint(20) NOT NULL,
  PRIMARY KEY (`olg_id`),
  KEY `olg_osr_consumer_key` (`olg_osr_consumer_key`,`olg_id`),
  KEY `olg_ost_token` (`olg_ost_token`,`olg_id`),
  KEY `olg_ocr_consumer_key` (`olg_ocr_consumer_key`,`olg_id`),
  KEY `olg_oct_token` (`olg_oct_token`,`olg_id`),
  KEY `olg_usa_id_ref` (`olg_usa_id_ref`,`olg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `oauth_server_nonce`;
CREATE TABLE `oauth_server_nonce` (
  `osn_id` int(11) NOT NULL AUTO_INCREMENT,
  `osn_consumer_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `osn_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `osn_timestamp` bigint(20) NOT NULL,
  `osn_nonce` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`osn_id`),
  UNIQUE KEY `osn_consumer_key` (`osn_consumer_key`,`osn_token`,`osn_timestamp`,`osn_nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `oauth_server_registry`;
CREATE TABLE `oauth_server_registry` (
  `osr_id` int(11) NOT NULL AUTO_INCREMENT,
  `osr_usa_id_ref` int(11) DEFAULT NULL,
  `osr_consumer_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `osr_consumer_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `osr_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `osr_status` varchar(16) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `osr_requester_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_requester_email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_callback_uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_application_uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_application_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_application_descr` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_application_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `osr_application_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `osr_application_commercial` tinyint(1) NOT NULL DEFAULT 0,
  `osr_issue_date` datetime NOT NULL,
  `osr_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`osr_id`),
  UNIQUE KEY `osr_consumer_key` (`osr_consumer_key`),
  KEY `osr_usa_id_ref` (`osr_usa_id_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `oauth_server_token`;
CREATE TABLE `oauth_server_token` (
  `ost_id` int(11) NOT NULL AUTO_INCREMENT,
  `ost_osr_id_ref` int(11) NOT NULL,
  `ost_usa_id_ref` int(11) NOT NULL,
  `ost_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ost_token_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ost_token_type` enum('request','access') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ost_authorized` tinyint(1) NOT NULL DEFAULT 0,
  `ost_referrer_host` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ost_token_ttl` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  `ost_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ost_verifier` char(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ost_callback_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ost_id`),
  UNIQUE KEY `ost_token` (`ost_token`),
  KEY `ost_osr_id_ref` (`ost_osr_id_ref`),
  KEY `ost_token_ttl` (`ost_token_ttl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `object_contentmodules`;
CREATE TABLE `object_contentmodules` (
  `object_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `module_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `module_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`module_id`,`system_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `object_user_visits`;
CREATE TABLE `object_user_visits` (
  `object_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `type` enum('vote','documents','forum','literature','schedule','scm','sem','wiki','news','eval','inst','elearning_interface','ilias_interface','participants') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'vote',
  `visitdate` int(20) NOT NULL DEFAULT 0,
  `last_visitdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`user_id`,`type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `object_views`;
CREATE TABLE `object_views` (
  `object_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `views` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`),
  KEY `views` (`views`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `opengraphdata`;
CREATE TABLE `opengraphdata` (
  `opengraph_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_opengraph` tinyint(2) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`opengraph_id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `participantrestrictedadmissions`;
CREATE TABLE `participantrestrictedadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `distribution_time` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `passwordadmissions`;
CREATE TABLE `passwordadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `personal_notifications`;
CREATE TABLE `personal_notifications` (
  `personal_notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dialog` tinyint(4) NOT NULL DEFAULT 0,
  `html_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mkdate` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`personal_notification_id`),
  KEY `html_id` (`html_id`),
  KEY `url` (`url`(256))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `personal_notifications_user`;
CREATE TABLE `personal_notifications_user` (
  `personal_notification_id` int(10) unsigned NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`personal_notification_id`,`user_id`),
  KEY `user_id` (`user_id`,`seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `pluginid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pluginclassname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pluginpath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugintype` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` enum('yes','no') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'no',
  `navigationpos` int(10) unsigned NOT NULL DEFAULT 0,
  `dependentonid` int(10) unsigned DEFAULT NULL,
  `automatic_update_url` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `automatic_update_secret` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`pluginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `plugins` (`pluginid`, `pluginclassname`, `pluginpath`, `pluginname`, `plugintype`, `enabled`, `navigationpos`, `dependentonid`, `automatic_update_url`, `automatic_update_secret`) VALUES
(1,	'Blubber',	'core/Blubber',	'Blubber',	'StandardPlugin,SystemPlugin',	'yes',	1,	NULL,	NULL,	NULL),
(2,	'CoreForum',	'core/Forum',	'Forum',	'ForumModule,StandardPlugin,StudipModule',	'yes',	2,	NULL,	NULL,	NULL),
(3,	'EvaluationsWidget',	'core/EvaluationsWidget',	'EvaluationsWidget',	'PortalPlugin',	'yes',	3,	NULL,	NULL,	NULL),
(4,	'NewsWidget',	'core/NewsWidget',	'NewsWidget',	'PortalPlugin',	'yes',	4,	NULL,	NULL,	NULL),
(5,	'QuickSelection',	'core/QuickSelection',	'QuickSelection',	'PortalPlugin',	'yes',	5,	NULL,	NULL,	NULL),
(6,	'ScheduleWidget',	'core/ScheduleWidget',	'ScheduleWidget',	'PortalPlugin',	'yes',	6,	NULL,	NULL,	NULL),
(7,	'TerminWidget',	'core/TerminWidget',	'TerminWidget',	'PortalPlugin',	'yes',	7,	NULL,	NULL,	NULL),
(8,	'ActivityFeed',	'core/ActivityFeed',	'ActivityFeed',	'PortalPlugin',	'yes',	8,	NULL,	NULL,	NULL),
(9,	'IliasInterfaceModule',	'',	'Ilias-Interface',	'StandardPlugin,SystemPlugin',	'yes',	1,	NULL,	NULL,	NULL),
(10,	'LtiToolModule',	'',	'LTI-Tool',	'StandardPlugin,SystemPlugin,PrivacyPlugin',	'yes',	1,	NULL,	NULL,	NULL),
(11,	'GradebookModule',	'',	'Gradebook',	'StandardPlugin,SystemPlugin',	'yes',	1,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `plugins_activated`;
CREATE TABLE `plugins_activated` (
  `pluginid` int(10) unsigned NOT NULL DEFAULT 0,
  `range_type` enum('sem','inst','user') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'sem',
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pluginid`,`range_type`,`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `plugins_activated` (`pluginid`, `range_type`, `range_id`, `state`) VALUES
(1,	'sem',	'a07535cf2f8a72df33c12ddfa4b53dde',	1),
(2,	'sem',	'a07535cf2f8a72df33c12ddfa4b53dde',	1);

DROP TABLE IF EXISTS `plugins_default_activations`;
CREATE TABLE `plugins_default_activations` (
  `pluginid` int(10) unsigned NOT NULL DEFAULT 0,
  `institutid` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`pluginid`,`institutid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `plugin_assets`;
CREATE TABLE `plugin_assets` (
  `asset_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `plugin_id` int(10) unsigned NOT NULL,
  `type` enum('css','js') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `storagename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` int(11) unsigned DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL DEFAULT 0,
  `chdate` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `prefadmissions`;
CREATE TABLE `prefadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `favor_semester` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `prefadmission_condition`;
CREATE TABLE `prefadmission_condition` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `condition_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `chance` int(4) NOT NULL DEFAULT 1,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `priorities`;
CREATE TABLE `priorities` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `set_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`set_id`,`seminar_id`),
  KEY `user_rule_priority` (`user_id`,`priority`,`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `questionnaires`;
CREATE TABLE `questionnaires` (
  `questionnaire_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `startdate` bigint(20) DEFAULT NULL,
  `stopdate` bigint(20) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `resultvisibility` enum('always','never','afterending') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'always',
  `editanswers` tinyint(1) NOT NULL DEFAULT 1,
  `copyable` tinyint(4) NOT NULL DEFAULT 0,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`questionnaire_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `questionnaire_anonymous_answers`;
CREATE TABLE `questionnaire_anonymous_answers` (
  `anonymous_answer_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `questionnaire_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` int(11) NOT NULL,
  PRIMARY KEY (`anonymous_answer_id`),
  UNIQUE KEY `questionnaire_id_user_id` (`questionnaire_id`,`user_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `questionnaire_answers`;
CREATE TABLE `questionnaire_answers` (
  `answer_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `question_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `answerdata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `questionnaire_assignments`;
CREATE TABLE `questionnaire_assignments` (
  `assignment_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `questionnaire_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `range_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` int(11) NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `range_id_range_type` (`range_id`,`range_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `questionnaire_questions`;
CREATE TABLE `questionnaire_questions` (
  `question_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `questionnaire_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `etask_task_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `range_tree`;
CREATE TABLE `range_tree` (
  `item_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `studip_object` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `studip_object_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `parent_id` (`parent_id`),
  KEY `priority` (`priority`),
  KEY `studip_object_id` (`studip_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `range_tree` (`item_id`, `parent_id`, `level`, `priority`, `name`, `studip_object`, `studip_object_id`) VALUES
('105b70b72dc1908ce2925e057c4a8daa',	'a3d977a66f0010fa8e15c27dd71aff63',	0,	1,	'externe Einrichtung B',	'inst',	'110ce78ffefaf1e5f167cd7019b728bf'),
('1323254564871354786157481484621',	'3f93863e3d37ba0df286a6e7e26974ef',	1,	0,	'',	'inst',	'1535795b0d6ddecac6813f5f6ac47ef2'),
('2f4f90ac9d8d832cc8c8a95910fde4eb',	'1323254564871354786157481484621',	0,	1,	'Test Lehrstuhl',	'inst',	'536249daa596905f433e1f73578019db'),
('3f93863e3d37ba0df286a6e7e26974ef',	'root',	0,	0,	'Einrichtungen der Universität',	'',	''),
('5d032f70c255f3e57cf8aa85a429ad4e',	'1323254564871354786157481484621',	0,	2,	'Test Abteilung',	'inst',	'f02e2b17bc0e99fc885da6ac4c2532dc'),
('a3d977a66f0010fa8e15c27dd71aff63',	'root',	0,	1,	'externe Bildungseinrichtungen',	'fak',	'ec2e364b28357106c0f8c282733dbe56'),
('ce6c87bbf759b4cfd6f92d0c5560da5c',	'1323254564871354786157481484621',	0,	0,	'Test Einrichtung',	'inst',	'2560f7c7674942a7dce8eeb238e15d93'),
('e0ff0ead6a8c5191078ed787cd7c0c1f',	'a3d977a66f0010fa8e15c27dd71aff63',	0,	0,	'externe Einrichtung A',	'inst',	'7a4f19a0a2c321ab2b8f7b798881af7c');

DROP TABLE IF EXISTS `resources_assign`;
CREATE TABLE `resources_assign` (
  `assign_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `resource_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `assign_user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_free_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `begin` int(20) NOT NULL DEFAULT 0,
  `end` int(20) NOT NULL DEFAULT 0,
  `repeat_end` int(20) DEFAULT NULL,
  `repeat_quantity` int(2) DEFAULT NULL,
  `repeat_interval` int(2) DEFAULT NULL,
  `repeat_month_of_year` int(2) DEFAULT NULL,
  `repeat_day_of_month` int(2) DEFAULT NULL,
  `repeat_week_of_month` int(2) DEFAULT NULL,
  `repeat_day_of_week` int(2) DEFAULT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `comment_internal` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `resource_id` (`resource_id`),
  KEY `assign_user_id` (`assign_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_categories`;
CREATE TABLE `resources_categories` (
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `is_room` tinyint(4) NOT NULL DEFAULT 0,
  `iconnr` int(3) DEFAULT 1,
  PRIMARY KEY (`category_id`),
  KEY `is_room` (`is_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_categories_properties`;
CREATE TABLE `resources_categories_properties` (
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `property_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `requestable` tinyint(4) NOT NULL DEFAULT 0,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`category_id`,`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_locks`;
CREATE TABLE `resources_locks` (
  `lock_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `lock_begin` int(20) unsigned DEFAULT NULL,
  `lock_end` int(20) unsigned DEFAULT NULL,
  `type` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_objects`;
CREATE TABLE `resources_objects` (
  `resource_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `root_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `owner_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `level` int(4) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lockable` tinyint(4) DEFAULT NULL,
  `multiple_assign` tinyint(4) DEFAULT NULL,
  `requestable` tinyint(4) NOT NULL DEFAULT 1,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`resource_id`),
  KEY `institut_id` (`institut_id`),
  KEY `root_id` (`root_id`),
  KEY `parent_id` (`parent_id`),
  KEY `category_id` (`category_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_objects_properties`;
CREATE TABLE `resources_objects_properties` (
  `resource_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `property_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`resource_id`,`property_id`),
  KEY `property_id` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_properties`;
CREATE TABLE `resources_properties` (
  `property_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` set('bool','text','num','select') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bool',
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `info_label` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_requests`;
CREATE TABLE `resources_requests` (
  `request_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `termin_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `metadate_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `last_modified_by` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `resource_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_recipients` enum('requester','lecturer') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'requester',
  `closed` tinyint(3) unsigned DEFAULT NULL,
  `mkdate` int(20) unsigned DEFAULT NULL,
  `chdate` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `termin_id` (`termin_id`),
  KEY `seminar_id` (`seminar_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  KEY `category_id` (`category_id`),
  KEY `closed` (`closed`,`request_id`,`resource_id`),
  KEY `metadate_id` (`metadate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_requests_properties`;
CREATE TABLE `resources_requests_properties` (
  `request_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `property_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(20) unsigned DEFAULT NULL,
  `chdate` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`request_id`,`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_requests_user_status`;
CREATE TABLE `resources_requests_user_status` (
  `request_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`request_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_temporary_events`;
CREATE TABLE `resources_temporary_events` (
  `event_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `resource_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `assign_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `begin` int(20) NOT NULL DEFAULT 0,
  `end` int(20) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`event_id`),
  KEY `resource_id` (`resource_id`,`begin`),
  KEY `assign_object_id` (`assign_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `resources_user_resources`;
CREATE TABLE `resources_user_resources` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `resource_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `perms` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system` enum('y','n') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'n',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `roles` (`roleid`, `rolename`, `system`) VALUES
(1,	'Root-Administrator(in)',	'y'),
(2,	'Administrator(in)',	'y'),
(3,	'Mitarbeiter(in)',	'y'),
(4,	'Lehrende(r)',	'y'),
(5,	'Studierende(r)',	'y'),
(6,	'Tutor(in)',	'y'),
(7,	'Nobody',	'y'),
(8,	'DedicatedAdmin',	'n'),
(9,	'MVVAdmin',	'n'),
(10,	'MVVFreigabe',	'n'),
(11,	'MVVEntwickler',	'n'),
(12,	'MVVRedakteur',	'n'),
(13,	'MVVTranslator',	'n'),
(14,	'MVVLvGruppenAdmin',	'n');

DROP TABLE IF EXISTS `roles_plugins`;
CREATE TABLE `roles_plugins` (
  `roleid` int(10) unsigned NOT NULL DEFAULT 0,
  `pluginid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`roleid`,`pluginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `roles_plugins` (`roleid`, `pluginid`) VALUES
(1,	1),
(1,	2),
(1,	3),
(1,	4),
(1,	5),
(1,	6),
(1,	7),
(1,	8),
(1,	9),
(1,	10),
(1,	11),
(2,	1),
(2,	2),
(2,	3),
(2,	4),
(2,	5),
(2,	6),
(2,	7),
(2,	8),
(2,	9),
(2,	10),
(2,	11),
(3,	1),
(3,	2),
(3,	3),
(3,	4),
(3,	5),
(3,	6),
(3,	7),
(3,	8),
(3,	9),
(3,	10),
(3,	11),
(4,	1),
(4,	2),
(4,	3),
(4,	4),
(4,	5),
(4,	6),
(4,	7),
(4,	8),
(4,	9),
(4,	10),
(4,	11),
(5,	1),
(5,	2),
(5,	3),
(5,	4),
(5,	5),
(5,	6),
(5,	7),
(5,	8),
(5,	9),
(5,	10),
(5,	11),
(6,	1),
(6,	2),
(6,	3),
(6,	4),
(6,	5),
(6,	6),
(6,	7),
(6,	8),
(6,	9),
(6,	10),
(6,	11),
(7,	1),
(7,	2),
(7,	10),
(7,	11);

DROP TABLE IF EXISTS `roles_studipperms`;
CREATE TABLE `roles_studipperms` (
  `roleid` int(10) unsigned NOT NULL DEFAULT 0,
  `permname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`roleid`,`permname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `roles_studipperms` (`roleid`, `permname`) VALUES
(1,	'root'),
(2,	'admin'),
(3,	'admin'),
(3,	'root'),
(4,	'dozent'),
(5,	'autor'),
(5,	'tutor'),
(6,	'tutor');

DROP TABLE IF EXISTS `roles_user`;
CREATE TABLE `roles_user` (
  `roleid` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `institut_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`roleid`,`userid`,`institut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `roles_user` (`roleid`, `userid`, `institut_id`) VALUES
(7,	'nobody',	'');

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` smallint(6) NOT NULL COMMENT 'start hour and minutes',
  `end` smallint(6) NOT NULL COMMENT 'end hour and minutes',
  `day` tinyint(4) NOT NULL COMMENT 'day of week, 0-6',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'color, rgb in hex',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `schedule_seminare`;
CREATE TABLE `schedule_seminare` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `metadate_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `color` varchar(7) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'color, rgb in hex',
  PRIMARY KEY (`user_id`,`seminar_id`,`metadate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `schema_versions`;
CREATE TABLE `schema_versions` (
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `version` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`domain`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `schema_versions` (`domain`, `version`) VALUES
('studip',	1),
('studip',	2),
('studip',	3),
('studip',	4),
('studip',	5),
('studip',	6),
('studip',	7),
('studip',	8),
('studip',	9),
('studip',	10),
('studip',	11),
('studip',	12),
('studip',	13),
('studip',	14),
('studip',	15),
('studip',	16),
('studip',	17),
('studip',	18),
('studip',	19),
('studip',	20),
('studip',	21),
('studip',	22),
('studip',	23),
('studip',	24),
('studip',	25),
('studip',	26),
('studip',	27),
('studip',	28),
('studip',	29),
('studip',	30),
('studip',	31),
('studip',	32),
('studip',	33),
('studip',	34),
('studip',	35),
('studip',	36),
('studip',	37),
('studip',	38),
('studip',	39),
('studip',	40),
('studip',	41),
('studip',	42),
('studip',	43),
('studip',	44),
('studip',	45),
('studip',	46),
('studip',	47),
('studip',	48),
('studip',	49),
('studip',	50),
('studip',	51),
('studip',	52),
('studip',	53),
('studip',	54),
('studip',	55),
('studip',	56),
('studip',	57),
('studip',	58),
('studip',	59),
('studip',	60),
('studip',	61),
('studip',	62),
('studip',	63),
('studip',	64),
('studip',	65),
('studip',	66),
('studip',	67),
('studip',	68),
('studip',	69),
('studip',	70),
('studip',	71),
('studip',	72),
('studip',	73),
('studip',	74),
('studip',	75),
('studip',	76),
('studip',	77),
('studip',	78),
('studip',	79),
('studip',	80),
('studip',	81),
('studip',	82),
('studip',	83),
('studip',	84),
('studip',	85),
('studip',	86),
('studip',	87),
('studip',	88),
('studip',	89),
('studip',	90),
('studip',	91),
('studip',	92),
('studip',	93),
('studip',	94),
('studip',	95),
('studip',	96),
('studip',	97),
('studip',	98),
('studip',	99),
('studip',	100),
('studip',	101),
('studip',	102),
('studip',	103),
('studip',	104),
('studip',	105),
('studip',	106),
('studip',	107),
('studip',	108),
('studip',	109),
('studip',	110),
('studip',	111),
('studip',	112),
('studip',	113),
('studip',	114),
('studip',	115),
('studip',	116),
('studip',	117),
('studip',	118),
('studip',	119),
('studip',	120),
('studip',	121),
('studip',	122),
('studip',	123),
('studip',	124),
('studip',	125),
('studip',	126),
('studip',	127),
('studip',	128),
('studip',	129),
('studip',	130),
('studip',	131),
('studip',	132),
('studip',	133),
('studip',	134),
('studip',	135),
('studip',	136),
('studip',	137),
('studip',	138),
('studip',	139),
('studip',	140),
('studip',	141),
('studip',	142),
('studip',	143),
('studip',	144),
('studip',	145),
('studip',	146),
('studip',	147),
('studip',	148),
('studip',	149),
('studip',	150),
('studip',	151),
('studip',	152),
('studip',	153),
('studip',	154),
('studip',	155),
('studip',	156),
('studip',	157),
('studip',	158),
('studip',	159),
('studip',	160),
('studip',	161),
('studip',	162),
('studip',	163),
('studip',	164),
('studip',	165),
('studip',	166),
('studip',	167),
('studip',	168),
('studip',	169),
('studip',	170),
('studip',	171),
('studip',	172),
('studip',	173),
('studip',	174),
('studip',	175),
('studip',	176),
('studip',	177),
('studip',	178),
('studip',	179),
('studip',	180),
('studip',	181),
('studip',	182),
('studip',	183),
('studip',	184),
('studip',	185),
('studip',	186),
('studip',	187),
('studip',	188),
('studip',	189),
('studip',	190),
('studip',	191),
('studip',	192),
('studip',	193),
('studip',	194),
('studip',	195),
('studip',	196),
('studip',	197),
('studip',	198),
('studip',	199),
('studip',	200),
('studip',	201),
('studip',	202),
('studip',	203),
('studip',	204),
('studip',	205),
('studip',	206),
('studip',	207),
('studip',	208),
('studip',	209),
('studip',	210),
('studip',	211),
('studip',	212),
('studip',	213),
('studip',	214),
('studip',	215),
('studip',	216),
('studip',	217),
('studip',	218),
('studip',	219),
('studip',	220),
('studip',	221),
('studip',	222),
('studip',	223),
('studip',	224),
('studip',	225),
('studip',	226),
('studip',	227),
('studip',	228),
('studip',	229),
('studip',	230),
('studip',	231),
('studip',	232),
('studip',	233),
('studip',	234),
('studip',	235),
('studip',	236),
('studip',	237),
('studip',	238),
('studip',	239),
('studip',	240),
('studip',	241),
('studip',	242),
('studip',	243),
('studip',	244),
('studip',	245),
('studip',	246),
('studip',	247),
('studip',	248),
('studip',	249),
('studip',	250),
('studip',	251),
('studip',	252),
('studip',	253),
('studip',	254),
('studip',	255),
('studip',	256),
('studip',	257),
('studip',	258),
('studip',	259),
('studip',	20190702),
('studip',	20190705),
('studip',	20190823),
('studip',	20190917);

DROP TABLE IF EXISTS `scm`;
CREATE TABLE `scm` (
  `scm_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `tab_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `position` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`scm_id`),
  KEY `chdate` (`chdate`),
  KEY `range_id` (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `scm` (`scm_id`, `range_id`, `user_id`, `tab_name`, `content`, `mkdate`, `chdate`, `position`) VALUES
('a07df31918cc8e5ca0597e959a4a5297',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'Informationen',	'',	1343924407,	1343924407,	0);

DROP TABLE IF EXISTS `semester_data`;
CREATE TABLE `semester_data` (
  `semester_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_token` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `beginn` int(20) unsigned DEFAULT NULL,
  `ende` int(20) unsigned DEFAULT NULL,
  `vorles_beginn` int(20) unsigned DEFAULT NULL,
  `vorles_ende` int(20) unsigned DEFAULT NULL,
  `visible` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `external_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `semester_data` (`semester_id`, `name`, `description`, `semester_token`, `beginn`, `ende`, `vorles_beginn`, `vorles_ende`, `visible`, `external_id`) VALUES
('322f640f3f4643ebe514df65f1163eb1',	'SS 2020',	'',	'',	1585692000,	1601503199,	1586815200,	1595023199,	1,	''),
('4967f0a483e36554b77e3dc47aa58941',	'WS 2019/2020',	'',	'',	1569880800,	1585691999,	1571608800,	1581116399,	1,	NULL);

DROP TABLE IF EXISTS `semester_holiday`;
CREATE TABLE `semester_holiday` (
  `holiday_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `semester_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `beginn` int(20) unsigned DEFAULT NULL,
  `ende` int(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `semester_holiday` (`holiday_id`, `semester_id`, `name`, `description`, `beginn`, `ende`) VALUES
('704038f0cb3ea0a285ba0a453788ebed',	'',	'Unterbrechung',	'',	1576882800,	1578265199);

DROP TABLE IF EXISTS `seminare`;
CREATE TABLE `seminare` (
  `Seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `VeranstaltungsNummer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Untertitel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT 1,
  `Beschreibung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ort` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sonstiges` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lesezugriff` tinyint(4) NOT NULL DEFAULT 0,
  `Schreibzugriff` tinyint(4) NOT NULL DEFAULT 0,
  `start_time` int(20) DEFAULT 0,
  `duration_time` int(20) DEFAULT NULL,
  `art` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teilnehmer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vorrausetzungen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lernorga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leistungsnachweis` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `ects` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `admission_turnout` int(5) DEFAULT NULL,
  `admission_binding` tinyint(4) DEFAULT NULL,
  `admission_prelim` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `admission_prelim_txt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission_disable_waitlist` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `visible` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `showscore` tinyint(3) DEFAULT 0,
  `modules` int(10) unsigned DEFAULT NULL,
  `aux_lock_rule` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `aux_lock_rule_forced` tinyint(4) NOT NULL DEFAULT 0,
  `lock_rule` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `admission_waitlist_max` int(10) unsigned NOT NULL DEFAULT 0,
  `admission_disable_waitlist_move` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `completion` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `parent_course` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`Seminar_id`),
  KEY `Institut_id` (`Institut_id`),
  KEY `visible` (`visible`),
  KEY `status` (`status`,`Seminar_id`),
  KEY `parent_course` (`parent_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `seminare` (`Seminar_id`, `VeranstaltungsNummer`, `Institut_id`, `Name`, `Untertitel`, `status`, `Beschreibung`, `Ort`, `Sonstiges`, `Lesezugriff`, `Schreibzugriff`, `start_time`, `duration_time`, `art`, `teilnehmer`, `vorrausetzungen`, `lernorga`, `leistungsnachweis`, `mkdate`, `chdate`, `ects`, `admission_turnout`, `admission_binding`, `admission_prelim`, `admission_prelim_txt`, `admission_disable_waitlist`, `visible`, `showscore`, `modules`, `aux_lock_rule`, `aux_lock_rule_forced`, `lock_rule`, `admission_waitlist_max`, `admission_disable_waitlist_move`, `completion`, `parent_course`) VALUES
('7cb72dab1bf896a0b55c6aa7a70a3a86',	'',	'ec2e364b28357106c0f8c282733dbe56',	'Test Studiengruppe',	'',	99,	'Studiengruppen sind eine einfache Möglichkeit, mit KommilitonInnen, KollegInnen und anderen zusammenzuarbeiten.',	'',	'',	1,	1,	1254348000,	-1,	'',	'',	'',	'',	'',	1268739824,	1343924088,	'',	0,	0,	0,	'',	0,	1,	0,	395,	NULL,	0,	NULL,	0,	0,	0,	NULL),
('a07535cf2f8a72df33c12ddfa4b53dde',	'12345',	'2560f7c7674942a7dce8eeb238e15d93',	'Test Lehrveranstaltung',	'eine normale Lehrveranstaltung',	1,	'',	'',	'',	1,	1,	1585692000,	0,	'',	'für alle Studierenden',	'abgeschlossenes Grundstudium',	'Referate in Gruppenarbeit',	'Klausur',	1343924407,	1573239101,	'4',	0,	0,	0,	'',	0,	1,	0,	20911,	NULL,	0,	NULL,	0,	0,	0,	NULL);

DROP TABLE IF EXISTS `seminar_courseset`;
CREATE TABLE `seminar_courseset` (
  `set_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`set_id`,`seminar_id`),
  KEY `seminar_id` (`seminar_id`,`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `seminar_cycle_dates`;
CREATE TABLE `seminar_cycle_dates` (
  `metadate_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `weekday` tinyint(3) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sws` decimal(2,1) NOT NULL DEFAULT 0.0,
  `cycle` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `week_offset` int(11) NOT NULL DEFAULT 0,
  `end_offset` int(11) DEFAULT NULL,
  `sorter` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(10) unsigned NOT NULL,
  `chdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`metadate_id`),
  KEY `seminar_id` (`seminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `seminar_cycle_dates` (`metadate_id`, `seminar_id`, `start_time`, `end_time`, `weekday`, `description`, `sws`, `cycle`, `week_offset`, `end_offset`, `sorter`, `mkdate`, `chdate`) VALUES
('fc3c44f257e448e3cd36a88406a8a9c1',	'a07535cf2f8a72df33c12ddfa4b53dde',	'09:00:00',	'11:00:00',	1,	'',	0.0,	0,	0,	13,	0,	1530291739,	1573239101);

DROP TABLE IF EXISTS `seminar_inst`;
CREATE TABLE `seminar_inst` (
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`seminar_id`,`institut_id`),
  KEY `institut_id` (`institut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `seminar_inst` (`seminar_id`, `institut_id`) VALUES
('a07535cf2f8a72df33c12ddfa4b53dde',	'2560f7c7674942a7dce8eeb238e15d93');

DROP TABLE IF EXISTS `seminar_sem_tree`;
CREATE TABLE `seminar_sem_tree` (
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `sem_tree_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`seminar_id`,`sem_tree_id`),
  KEY `sem_tree_id` (`sem_tree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `seminar_sem_tree` (`seminar_id`, `sem_tree_id`) VALUES
('a07535cf2f8a72df33c12ddfa4b53dde',	'3d39528c1d560441fd4a8cb0b7717285'),
('a07535cf2f8a72df33c12ddfa4b53dde',	'5c41d2b4a5a8338e069dda987a624b74'),
('a07535cf2f8a72df33c12ddfa4b53dde',	'dd7fff9151e85e7130cdb684edf0c370');

DROP TABLE IF EXISTS `seminar_user`;
CREATE TABLE `seminar_user` (
  `Seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `status` enum('user','autor','tutor','dozent') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'user',
  `position` int(11) NOT NULL DEFAULT 0,
  `gruppe` tinyint(4) NOT NULL DEFAULT 0,
  `notification` int(10) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` enum('yes','no','unknown') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'unknown',
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bind_calendar` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Seminar_id`,`user_id`),
  KEY `status` (`status`,`Seminar_id`),
  KEY `user_id` (`user_id`,`Seminar_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `seminar_user` (`Seminar_id`, `user_id`, `status`, `position`, `gruppe`, `notification`, `mkdate`, `comment`, `visible`, `label`, `bind_calendar`) VALUES
('7cb72dab1bf896a0b55c6aa7a70a3a86',	'e7a0a84b161f3e8c09b4a0a2e8a58147',	'dozent',	0,	8,	0,	0,	'',	'unknown',	'',	1),
('a07535cf2f8a72df33c12ddfa4b53dde',	'205f3efb7997a0fc9755da2b535038da',	'dozent',	0,	5,	0,	1343924407,	'',	'yes',	'',	1),
('a07535cf2f8a72df33c12ddfa4b53dde',	'7e81ec247c151c02ffd479511e24cc03',	'tutor',	0,	5,	0,	1343924407,	'',	'yes',	'',	1),
('a07535cf2f8a72df33c12ddfa4b53dde',	'e7a0a84b161f3e8c09b4a0a2e8a58147',	'autor',	0,	5,	0,	1343924589,	'',	'unknown',	'',	1);

DROP TABLE IF EXISTS `seminar_userdomains`;
CREATE TABLE `seminar_userdomains` (
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `userdomain_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`seminar_id`,`userdomain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sem_classes`;
CREATE TABLE `sem_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `only_inst_user` tinyint(4) NOT NULL,
  `default_read_level` int(11) NOT NULL,
  `default_write_level` int(11) NOT NULL,
  `bereiche` tinyint(4) NOT NULL,
  `module` tinyint(4) NOT NULL,
  `show_browse` tinyint(4) NOT NULL,
  `write_access_nobody` tinyint(4) NOT NULL,
  `topic_create_autor` tinyint(4) NOT NULL,
  `visible` tinyint(4) NOT NULL,
  `course_creation_forbidden` tinyint(4) NOT NULL,
  `overview` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documents` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participants` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `literature` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scm` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wiki` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resources` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calendar` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elearning_interface` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `studygroup_mode` tinyint(4) NOT NULL,
  `admission_prelim_default` tinyint(4) NOT NULL DEFAULT 0,
  `admission_type_default` tinyint(4) NOT NULL DEFAULT 0,
  `title_dozent` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_dozent_plural` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_tutor` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_tutor_plural` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_autor` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_autor_plural` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_raumzeit` tinyint(4) NOT NULL DEFAULT 1,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `sem_classes` (`id`, `name`, `only_inst_user`, `default_read_level`, `default_write_level`, `bereiche`, `module`, `show_browse`, `write_access_nobody`, `topic_create_autor`, `visible`, `course_creation_forbidden`, `overview`, `forum`, `admin`, `documents`, `schedule`, `participants`, `literature`, `scm`, `wiki`, `resources`, `calendar`, `elearning_interface`, `modules`, `description`, `create_description`, `studygroup_mode`, `admission_prelim_default`, `admission_type_default`, `title_dozent`, `title_dozent_plural`, `title_tutor`, `title_tutor_plural`, `title_autor`, `title_autor_plural`, `show_raumzeit`, `is_group`, `mkdate`, `chdate`) VALUES
(1,	'Lehre',	1,	1,	1,	1,	0,	1,	0,	0,	1,	0,	'CoreOverview',	'CoreForum',	'CoreAdmin',	'CoreDocuments',	'CoreSchedule',	'CoreParticipants',	'CoreLiterature',	'CoreScm',	'CoreWiki',	'CoreResources',	'CoreCalendar',	'CoreElearningInterface',	'{\"CoreOverview\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreAdmin\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreForum\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreParticipants\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreDocuments\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreSchedule\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreLiterature\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreScm\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreWiki\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreResources\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreCalendar\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreElearningInterface\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreStudygroupAdmin\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreStudygroupParticipants\":{\"activated\":\"0\",\"sticky\":\"1\"}}',	'Hier finden Sie alle in Stud.IP registrierten Lehrveranstaltungen',	'',	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	1366882120,	1366882169),
(2,	'Organisation',	0,	2,	2,	0,	0,	1,	0,	0,	1,	0,	'CoreOverview',	'CoreForum',	'CoreAdmin',	'CoreDocuments',	'CoreSchedule',	'CoreParticipants',	NULL,	NULL,	'CoreWiki',	'CoreResources',	NULL,	NULL,	'{\"CoreOverview\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreAdmin\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreForum\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreParticipants\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreDocuments\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreSchedule\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreWiki\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreResources\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreStudygroupAdmin\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreStudygroupParticipants\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreScm\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreLiterature\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreCalendar\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreElearningInterface\":{\"activated\":\"0\",\"sticky\":\"1\"}}',	'Hier finden Sie virtuelle Veranstaltungen zu verschiedenen Gremien an der Universit&auml;t',	'',	0,	0,	0,	'LeiterIn',	'LeiterInnen',	'Mitglied',	'Mitglieder',	NULL,	NULL,	1,	0,	1366882120,	1366882198),
(3,	'Community',	0,	1,	1,	0,	0,	1,	1,	0,	1,	0,	'CoreOverview',	'CoreForum',	'CoreAdmin',	'CoreDocuments',	'CoreSchedule',	'CoreParticipants',	'CoreLiterature',	NULL,	'CoreWiki',	'CoreResources',	NULL,	NULL,	'{\"CoreOverview\":{\"activated\":1,\"sticky\":1},\"CoreAdmin\":{\"activated\":1,\"sticky\":1}}',	'Hier finden Sie virtuelle Veranstaltungen zu unterschiedlichen Themen',	'',	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	1366882120,	1366882120),
(99,	'Studiengruppen',	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	'CoreOverview',	'CoreForum',	'CoreStudygroupAdmin',	'CoreDocuments',	'CoreSchedule',	'CoreStudygroupParticipants',	NULL,	'CoreScm',	'CoreWiki',	NULL,	NULL,	NULL,	'{\"CoreOverview\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreStudygroupAdmin\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreForum\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreStudygroupParticipants\":{\"activated\":\"1\",\"sticky\":\"1\"},\"CoreDocuments\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreScm\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreWiki\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreAdmin\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreSchedule\":{\"activated\":\"1\",\"sticky\":\"0\"},\"CoreParticipants\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreLiterature\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreCalendar\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreElearningInterface\":{\"activated\":\"0\",\"sticky\":\"1\"},\"CoreResources\":{\"activated\":\"0\",\"sticky\":\"1\"}}',	'',	'',	1,	0,	0,	'GruppengründerIn',	'GruppengründerInnen',	'ModeratorIn',	'ModeratorInnen',	'Mitglied',	'Mitglieder',	0,	0,	1366882120,	1462287763);

DROP TABLE IF EXISTS `sem_tree`;
CREATE TABLE `sem_tree` (
  `sem_tree_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `parent_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `priority` tinyint(4) NOT NULL DEFAULT 0,
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `studip_object_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`sem_tree_id`),
  KEY `parent_id` (`parent_id`),
  KEY `priority` (`priority`),
  KEY `studip_object_id` (`studip_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `sem_tree` (`sem_tree_id`, `parent_id`, `priority`, `info`, `name`, `studip_object_id`, `type`) VALUES
('01c8b1d188be40c5ac64b54a01aae294',	'5b73e28644a3e259a6e0bc1e1499773c',	2,	'',	'Test Studienbereich C',	NULL,	0),
('3d39528c1d560441fd4a8cb0b7717285',	'439618ae57d8c10dcaabcf7e21bcc1d9',	0,	'',	'Test Studienbereich A-1',	NULL,	0),
('439618ae57d8c10dcaabcf7e21bcc1d9',	'5b73e28644a3e259a6e0bc1e1499773c',	0,	'',	'Test Studienbereich A',	NULL,	0),
('5b73e28644a3e259a6e0bc1e1499773c',	'root',	1,	'',	'',	'1535795b0d6ddecac6813f5f6ac47ef2',	0),
('5c41d2b4a5a8338e069dda987a624b74',	'5b73e28644a3e259a6e0bc1e1499773c',	1,	'',	'Test Studienbereich B',	NULL,	0),
('dd7fff9151e85e7130cdb684edf0c370',	'439618ae57d8c10dcaabcf7e21bcc1d9',	1,	'',	'Test Studienbereich A-2',	NULL,	0);

DROP TABLE IF EXISTS `sem_types`;
CREATE TABLE `sem_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` int(11) NOT NULL,
  `mkdate` bigint(20) NOT NULL,
  `chdate` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `sem_types` (`id`, `name`, `class`, `mkdate`, `chdate`) VALUES
(1,	'Vorlesung',	1,	1366882120,	1366882120),
(2,	'Seminar',	1,	1366882120,	1366882120),
(3,	'Übung',	1,	1366882120,	1366882120),
(4,	'Praktikum',	1,	1366882120,	1366882120),
(5,	'Colloquium',	1,	1366882120,	1366882120),
(6,	'Forschungsgruppe',	1,	1366882120,	1366882120),
(7,	'sonstige',	1,	1366882120,	1366882120),
(8,	'Gremium',	2,	1366882120,	1366882120),
(9,	'Projektgruppe',	2,	1366882120,	1366882120),
(10,	'sonstige',	2,	1366882120,	1366882120),
(11,	'Kulturforum',	3,	1366882120,	1366882120),
(12,	'Veranstaltungsboard',	3,	1366882120,	1366882120),
(13,	'sonstige',	3,	1366882120,	1366882120),
(99,	'Studiengruppe',	99,	1366882120,	1366882120);

DROP TABLE IF EXISTS `session_data`;
CREATE TABLE `session_data` (
  `sid` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `val` mediumblob NOT NULL,
  `changed` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sid`),
  KEY `changed` (`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `siteinfo_details`;
CREATE TABLE `siteinfo_details` (
  `detail_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rubric_id` smallint(5) unsigned NOT NULL,
  `position` tinyint(3) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `siteinfo_details` (`detail_id`, `rubric_id`, `position`, `name`, `content`) VALUES
(1,	1,	NULL,	'[lang=de]Ansprechpartner[/lang][lang=en]Contact[/lang]',	'[style=float: right]\n[img]http://www.studip.de/images/studipanim.gif\n**Version:** (:version:)\n[/style]\n[lang=de]Für diese Stud.IP-Installation ((:uniname:)) sind folgende Administratoren zuständig:[/lang]\n[lang=en]The following administrators are responsible for this Stud.IP installation ((:uniname:)):[/lang]\n(:rootlist:)\n[lang=de]allgemeine Anfragen wie Passwort-Anforderungen u.a. richten Sie bitte an:[/lang]\n[lang=en]General queries e.g., password queries, please contact:[/lang]\n(:unicontact:)\n[lang=de]Folgende Einrichtungen sind beteiligt:\n(Genannt werden die jeweiligen Administratoren der Einrichtungen für entsprechende Anfragen)[/lang]\n[lang=en]The following institutes participate:\n(Named are the institutes administrators responsible for the corresponding query areas)[/lang]\n(:adminlist:)'),
(2,	1,	NULL,	'[lang=de]Entwickler[/lang][lang=en]Developer[/lang]',	'[style=float: right]\r\n[img]http://www.studip.de/images/studipanim.gif\r\n**Version:** (:version:)\r\n[/style]\r\n[lang=de]Stud.IP ist ein Open Source Projekt zur Unterstützung von Präsenzlehre an Universitäten, Hochschulen und anderen Bildungseinrichtungen. Das System entstand am Zentrum für interdisziplinäre Medienwissenschaft (ZiM) der Georg-August-Universität Göttingen unter Mitwirkung der Suchi & Berg GmbH (data-quest) , Göttingen. Heute erfolgt die Weiterentwicklung von Stud.IP verteilt an vielen Standorten (Göttingen, Osnabrück, Oldenburg, Bremen, Hannover, Jena und weiteren). Die Koordination der Entwicklung erfolgt durch die Stud.IP-CoreGroup.\r\nStud.IP steht unter der GNU General Public License, Version 2.\r\n\r\nWeitere Informationen finden sie auf ** [www.studip.de]http://www.studip.de **,**  [develop.studip.de]http://develop.studip.de ** und ** [blog.studip.de]http://blog.studip.de **.[/lang]\r\n\r\n[lang=en]Stud.IP is an opensource project for supporting attendance courses offered by universities, institutions of higher education and other educational institutions. The system was established at the Zentrum für interdisziplinäre Medienwissenschaft (ZiM) in the Georg-August-Universität Göttingen in cooperation with Suchi & Berg GmbH (data-quest) , Göttingen. At the present further developing takes place at various locations (among others Göttingen, Osnabrück, Oldenburg, Bremen, Hannover, Jena) under coordination through the Stud.IP-CoreGroup.\r\n\r\nStud.IP is covered by the GNU General Public Licence, version 2.\r\n\r\nFurther information can be found under ** [www.studip.de]http://www.studip.de **,**  [develop.studip.de]http://develop.studip.de ** and ** [blog.studip.de]http://blog.studip.de **.[/lang]\r\n\r\n(:coregroup:)\r\n[lang=de]Sie erreichen uns auch über folgende **Mailinglisten**:\r\n\r\n**Nutzer-Anfragen**, E-Mail: studip-users@lists.sourceforge.net : Fragen, Anregungen und Vorschläge an die Entwickler - bitte __keine__ Passwort Anfragen!\r\n**News-Mailingsliste**, E-Mail: studip-news@lists.sourceforge.net : News rund um Stud.IP (Eintragung notwendig)\r\n\r\nWir laden alle Entwickler, Betreiber und Nutzer von Stud.IP ein, sich auf dem Developer-Server http://develop.studip.de an den Diskussionen rund um die Weiterentwicklung und Nutzung der Plattform zu beteiligen.[/lang]\r\n[lang=en]You can contact us via the following **mailing lists**:\r\n\r\n**User enquiries**, E-Mail: studip-users@lists.sourceforge.net : Questions, suggestions and recommendations to the developers - __please no password queries__!\r\n\r\n**News mailing list**, E-Mail: studip-news@lists.sourceforge.net : News about Stud.IP (registration necessary)\r\n\r\nWe invite all developers, administrators and users of Stud.IP to join the discussions on further developing and using the platform available at the developer server http://develop.studip.de[/lang]'),
(3,	2,	NULL,	'[lang=de]Technik[/lang][lang=en]Technology[/lang]',	'[style=float: right]\n[img]http://www.studip.de/images/studipanim.gif\n**Version:** (:version:)\n[/style]\n[lang=de]Stud IP ist ein Open-Source Projekt und steht unter der GNU General Public License. Sämtliche zum Betrieb notwendigen Dateien können unter http://sourceforge.net/projects/studip/ heruntergeladen werden.\nDie technische Grundlage bietet ein LINUX-System mit Apache Webserver sowie eine MySQL Datenbank, die über PHP gesteuert wird.\nIm System findet ein 6-stufiges Rechtesystem Verwendung, das individuell auf verschiedenen Ebenen wirkt - etwa in Veranstaltungen, Einrichtungen, Fakultäten oder systemweit.\n\nDas System wird ständig weiterentwickelt und an die Wünsche unserer Nutzer angepasst - [sagen Sie uns Ihre Meinung!]studip-users@lists.sourceforge.net[/lang]\n[lang=en]Stud.IP is an Open Source Project and is covered by the Gnu General Public License (GPL). All files necessary for operation can be downloaded from http://sourceforge.net/projects/studip/ .\nThe technical basis can be provided by a LINUX system with Apache Webserver and a MySQL database, which is then controlled by PHP.\nThe system features a authorisation system with six ranks, that affects individually different levels - in courses, institutes,faculties or system wide.\n\nThe system is continually being developed and customised to the wishes of our users - [Tell us your opinion!]studip-users@lists.sourceforge.net[/lang]'),
(4,	2,	NULL,	'[lang=de]Statistik[/lang][lang=en]Statistics[/lang]',	'[lang=de]!!Top-Listen aller Veranstaltungen[/lang][lang=en]!!Top list of all courses[/lang]\n[style=float: right]\n[lang=de]!!Statistik[/lang][lang=en]!!statistics[/lang]\n(:indicator seminar_all:)\n(:indicator seminar_archived:)\n(:indicator institute_firstlevel_all:)\n(:indicator institute_secondlevel_all:)\n(:indicator user_admin:)\n(:indicator user_dozent:)\n(:indicator user_tutor:)\n(:indicator user_autor:)\n(:indicator posting:)\n(:indicator document:)\n(:indicator link:)\n(:indicator litlist:)\n(:indicator termin:)\n(:indicator news:)\n(:indicator guestbook:)\n(:indicator vote:)\n(:indicator test:)\n(:indicator evaluation:)\n(:indicator wiki_pages:)\n(:indicator lernmodul:)\n(:indicator resource:)\n[/style]\n(:toplist mostparticipants:)\n(:toplist recentlycreated:)\n(:toplist mostdocuments:)\n(:toplist mostpostings:)\n(:toplist mostvisitedhomepages:)'),
(5,	2,	NULL,	'History',	'(:history:)'),
(6,	2,	NULL,	'Stud.IP-Blog',	'[lang=de]Das Blog der Stud.IP-Entwickler finden Sie auf:[/lang]\n[lang=en]The Stud.IP-Developer-Blog can be found under:[/lang]\nhttp://blog.studip.de'),
(7,	1,	NULL,	'Datenschutzerklärung',	'++**Datenschutzerklärung**++\n\nSie erhalten als Nutzer/-in unserer Internetseite in dieser Datenschutzerklärung notwendige Informationen darüber, wie und in welchem Umfang sowie zu welchem Zweck die  **[Betreibereinrichtung]** Daten von Ihnen erhebt und wie diese verwendet werden. Die Daten werden nur innerhalb der **[Betreibereinrichtung]** verarbeitet und verwendet und nicht an Dritte weitergegeben.\n\n\n++**Rechtsgrundlagen**++\n\nDie Erhebung und Nutzung Ihrer Daten erfolgt streng nach den gesetzlichen Vorgaben. Regelungen dazu finden sich in:\nEuropäische Datenschutzgrundverordnung (EU DSGVO)\nBundesdatenschutzgesetz (BDSG)\nNiedersächsisches Datenschutzgesetz (NDSG)\nTeledienstegesetz (TDG)\nMediendienste-Staatsvertrag (MDStV)\nTeledienstedatenschutzgesetz (TDDSG).\n\n\n++**Personenbezogene Daten**++\n\nPersonenbezogene Daten werden zum Zwecke der administrativen Nutzerverwaltung, zur Kontaktaufnahme und Interaktion mit Ihnen sowie zur Bereitstellung personalisierter Dienste [zur Durchführung Ihres Studium bzw. Ihrer Arbeit an **[Betreibereinrichtung]**] von uns gespeichert.\nFür die Nutzung von Stud.IP  werden folgende Daten abgefragt und gespeichert:\n- Nutzername\n- Vorname, Nachname\n- Mailadresse\n- [ggf. weitere Daten]\n\n\nWeitere Daten, die evtl. Ihnen gespeichert werden, sind Inhalte, die Sie selbst im Rahmen Ihrer Arbeit oder Ihres Studiums in Stud.IP einstellen. Dazu gehören:\n- Freiwillige Angaben zur Person\n- Beiträge in Foren\n- hochgeladene Dateien\n- Chatverläufe in Blubber\n- interne Nachrichten\n- Kalendereinträge und Stundenpläne\n- Teilnahme an Lehrveranstaltungen, Studiengruppen, Orgagremien\n- Persönliche Einstellungen und Konfigurationen\n- [ggf. Plugindaten]\n\n\nDiese Inhalte werden mit Ihrem Klarnamen gespeichert und angezeigt. Sie haben die Möglichkeit über die Privatsphäreeinstellungen selbst zu bestimmen, ob und ggf. welche Personengruppen diese Daten sehen dürfen. Diese Daten werden von Stud.IP intern verschlüsselt abgelegt.\n\n\n++**Aufbewahrungsfristen **++\n\nIhre personenbezogenen Daten werden für die Dauer Ihres Studiums/Ihrer Arbeit bei [Beitreibereinrichtung] gespeichert. Nach Beendigung ihrer Tätigkeit und Ablauf der gesetzlichen Aufbewahrungsfristen werden Ihre Daten gelöscht.\n\n\n++**Auskunft, Löschung, Sperrung**++\n\nSie erhalten jederzeit auf Anfrage Auskunft über die von uns über Sie gespeicherten personenbezogenen Daten sowie dem Zweck von Datenerhebung sowie Datenverarbeitung. Bitte wenden Sie sich hierzu an o.g. Kontaktadresse.\n\nAußerdem haben Sie das Recht, die Berichtigung, die Sperrung oder Löschung Ihrer Daten zu verlangen. Sie können Ihre Einwilligung ohne Angabe von Gründen durch Schreiben an die o.g. Kontakadresse widerrufen. Ihre Daten werden dann umgehend gelöscht. Eine weitere Nutzung der Lernplattform Stud.IP ist dann aber nicht mehr möglich.\n\nAusgenommen von der Löschung sind Daten, die aufgrund gesetzlicher Vorschriften aufbewahrt oder zur ordnungsgemäßen Geschäftsabwicklung benötigt werden. Damit eine Datensperre jederzeit realisiert werden kann, werden Daten zu Kontrollzwecken in einer Sperrdatei vorgehalten.\n\nWerden Daten nicht von einer gesetzlichen Archivierungspflicht erfasst, löschen wir Ihre Daten auf Ihren Wunsch. Greift die Archivierungspflicht, sperren wir Ihre Daten. Für alle Fragen und Anliegen zur Berichtigung, Sperrung oder Löschung von personenbezogenen Daten wenden Sie sich bitte an unsere Datenschutzbeauftragten unter den Kontaktdaten in dieser Datenschutzerklärung bzw. an die im Impressum genannte Adresse.\n\n\n++**Datenübertragbarkeit**++\n\nSie haben das Recht, jederzeit Ihre Daten ausgehändigt zu bekommen. Auf Anfrage stellen wir Ihnen Ihre Daten in menschenlesbaren, gängigen und bearbeitbaren Formaten zur Verfügung.\n\n\n++**Cookies**++\n\nStud.IP verwendet ein Session-Cookie. Diese kleine Textdatei beinhaltet lediglich eine verschlüsselte Zeichenfolge, die bei der Navigation im System hilft. Das Cookie wird bei der Abmeldung aus Stud.IP oder beim Schließen des Browsers gelöscht.\n\n\n++**Server Logfiles**++\n\nMit dem Zugriff auf Stud.IP werden IP-Adresse, Datum, Uhrzeit und Browserversion zum Zeitpunkt des Zugriffs registriert und anonymisiert gespeichert. Die Erhebung und Nutzung dieser Log-File-Daten dient lediglich der Auswertung zu rein statistischen Forschungs- und Evaluationszwecken der Lernplattform, werden also nicht in Verbindung mit Namen oder Mailadresse gespeichert oder ausgewertet. Diese Daten werden für die Zeit von [X] Monaten auf gesicherten Systemen der **[Betreibereinrichtung]** gespeichert und ebenfalls nicht an Dritte weitergegeben.\n\n\n++**SSL-Verschlüsselung**++\n\nDie Verbindung zu Stud.IP erfolgt mit einer SSL-Verschlüsselung. Über SSL verschlüsselte Daten sind nicht von Dritten lesbar. Übermitteln Sie Ihre vertraulichen Informationen nur bei aktivierter SSL-Verschlüsselung und wenden Sie sich im Zweifel an uns.\n\n\n++Kontaktdaten:++\n**Name:**\n**Telefonnummer:**\n**E-Mail-Adresse:**\n**Unternehmensbezeichnung:**\n\n++Datenschutzbeauftragte/-r:++\n**Name:**\n**Telefonnummer:**\n**E-Mail-Adresse:**\n**Unternehmensbezeichnung:**\n\n\n');

DROP TABLE IF EXISTS `siteinfo_rubrics`;
CREATE TABLE `siteinfo_rubrics` (
  `rubric_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position` tinyint(3) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rubric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `siteinfo_rubrics` (`rubric_id`, `position`, `name`) VALUES
(1,	NULL,	'[lang=de]Kontakt[/lang][lang=en]Contact[/lang]'),
(2,	NULL,	'[lang=de]Über Stud.IP[/lang][lang=en]About Stud.IP[/lang]');

DROP TABLE IF EXISTS `smiley`;
CREATE TABLE `smiley` (
  `smiley_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smiley_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `smiley_width` int(11) NOT NULL DEFAULT 0,
  `smiley_height` int(11) NOT NULL DEFAULT 0,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `smiley_counter` int(11) unsigned NOT NULL DEFAULT 0,
  `short_counter` int(11) unsigned NOT NULL DEFAULT 0,
  `fav_counter` int(11) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(10) unsigned DEFAULT NULL,
  `chdate` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`smiley_id`),
  UNIQUE KEY `name` (`smiley_name`),
  KEY `short` (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `statusgruppen`;
CREATE TABLE `statusgruppen` (
  `statusgruppe_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `position` int(20) NOT NULL DEFAULT 0,
  `size` int(20) NOT NULL DEFAULT 0,
  `selfassign` tinyint(4) NOT NULL DEFAULT 0,
  `selfassign_start` int(11) NOT NULL DEFAULT 0,
  `selfassign_end` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `calendar_group` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `name_w` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`statusgruppe_id`),
  KEY `range_id` (`range_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `statusgruppen` (`statusgruppe_id`, `name`, `range_id`, `position`, `size`, `selfassign`, `selfassign_start`, `selfassign_end`, `mkdate`, `chdate`, `calendar_group`, `name_w`, `name_m`) VALUES
('2f597139a049a768dbf8345a0a0af3de',	'Studierende',	'a07535cf2f8a72df33c12ddfa4b53dde',	1,	0,	0,	0,	0,	1343924562,	1343924562,	0,	NULL,	NULL),
('5d40b1fc0434e6589d7341a3ee742baf',	'Direktor/-in',	'2560f7c7674942a7dce8eeb238e15d93',	1,	0,	0,	0,	0,	1156516698,	1156516698,	0,	NULL,	NULL),
('600403561c21a50ae8b4d41655bd2191',	'Hochschullehrer/-in',	'2560f7c7674942a7dce8eeb238e15d93',	4,	0,	0,	0,	0,	1156516698,	1156516698,	0,	NULL,	NULL),
('86498c641ccf4f4d4e02f4961ccc3829',	'Lehrbeauftragte',	'2560f7c7674942a7dce8eeb238e15d93',	3,	0,	0,	0,	0,	1156516698,	1156516698,	0,	NULL,	NULL),
('efb56e092f33cb78a8766676042dc1c5',	'wiss. Mitarbeiter/-in',	'2560f7c7674942a7dce8eeb238e15d93',	2,	0,	0,	0,	0,	1156516698,	1156516698,	0,	NULL,	NULL),
('f4319d9909e9f7cb4692c16771887f22',	'Lehrende',	'a07535cf2f8a72df33c12ddfa4b53dde',	0,	0,	0,	0,	0,	1343924551,	1343924551,	0,	NULL,	NULL);

DROP TABLE IF EXISTS `statusgruppe_user`;
CREATE TABLE `statusgruppe_user` (
  `statusgruppe_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `inherit` tinyint(4) NOT NULL DEFAULT 1,
  `mkdate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`statusgruppe_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `statusgruppe_user` (`statusgruppe_id`, `user_id`, `position`, `visible`, `inherit`, `mkdate`) VALUES
('2f597139a049a768dbf8345a0a0af3de',	'e7a0a84b161f3e8c09b4a0a2e8a58147',	1,	1,	1,	NULL),
('5d40b1fc0434e6589d7341a3ee742baf',	'205f3efb7997a0fc9755da2b535038da',	1,	1,	1,	NULL),
('efb56e092f33cb78a8766676042dc1c5',	'7e81ec247c151c02ffd479511e24cc03',	1,	1,	1,	NULL),
('f4319d9909e9f7cb4692c16771887f22',	'205f3efb7997a0fc9755da2b535038da',	1,	1,	1,	NULL),
('f4319d9909e9f7cb4692c16771887f22',	'7e81ec247c151c02ffd479511e24cc03',	2,	1,	1,	NULL);

DROP TABLE IF EXISTS `studygroup_invitations`;
CREATE TABLE `studygroup_invitations` (
  `sem_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(20) NOT NULL,
  PRIMARY KEY (`sem_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `termine`;
CREATE TABLE `termine` (
  `termin_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `autor_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL DEFAULT 0,
  `end_time` int(20) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `date_typ` tinyint(4) NOT NULL DEFAULT 0,
  `topic_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `raum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadate_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`termin_id`),
  KEY `metadate_id` (`metadate_id`,`date`),
  KEY `range_id` (`range_id`,`date`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `termine` (`termin_id`, `range_id`, `autor_id`, `content`, `description`, `date`, `end_time`, `mkdate`, `chdate`, `date_typ`, `topic_id`, `raum`, `metadate_id`) VALUES
('03626188114055538dbf693be5885252',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1587366000,	1587373200,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('32015cac311883bc9ff552d4fdfaf3a4',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1594018800,	1594026000,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('38afd00c489bfaa133a8274d8b9e3e80',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1590390000,	1590397200,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('4d17fb2feeafc97ee96d2362522ea478',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1589785200,	1589792400,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('4d48d87e876b00c1c6a0a20c7faafd54',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1588575600,	1588582800,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('529a4259af99a226bb35cef9fdcf5bb0',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1594623600,	1594630800,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('78959e3630ba91331cecc8f0a86bebb5',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1587970800,	1587978000,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('7afe4f7ab26e81a89ee185ae2edd920a',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1592809200,	1592816400,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('8385a788f8e67d20c8042814a056e34f',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1593414000,	1593421200,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('9b8992bc23019378e21158a333f98b4f',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1589180400,	1589187600,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('9ff59e18112a686c553412761a5df85c',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1593511200,	1593518400,	1510852723,	1573239163,	3,	NULL,	'',	NULL),
('a9828c0e7fd4fb8a07c546ab485de285',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1591599600,	1591606800,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1'),
('aabc75c01f0afdc86fa983314ae48f2f',	'a07535cf2f8a72df33c12ddfa4b53dde',	'76ed43ef286fb55cf9e41beadb484a9f',	'',	NULL,	1592204400,	1592211600,	1573239101,	1573239488,	1,	NULL,	'',	'fc3c44f257e448e3cd36a88406a8a9c1');

DROP TABLE IF EXISTS `termin_related_groups`;
CREATE TABLE `termin_related_groups` (
  `termin_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `statusgruppe_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`termin_id`,`statusgruppe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `termin_related_persons`;
CREATE TABLE `termin_related_persons` (
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`range_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `themen`;
CREATE TABLE `themen` (
  `issue_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `seminar_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `author_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` smallint(5) unsigned NOT NULL DEFAULT 0,
  `paper_related` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `mkdate` int(10) unsigned NOT NULL DEFAULT 0,
  `chdate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`issue_id`),
  KEY `seminar_id` (`seminar_id`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `themen_termine`;
CREATE TABLE `themen_termine` (
  `issue_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `termin_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`issue_id`,`termin_id`),
  KEY `termin_id` (`termin_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `timedadmissions`;
CREATE TABLE `timedadmissions` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rule_id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `start_end` (`start_time`,`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `userdomains`;
CREATE TABLE `userdomains` (
  `userdomain_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`userdomain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `userfilter`;
CREATE TABLE `userfilter` (
  `filter_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `userfilter_fields`;
CREATE TABLE `userfilter_fields` (
  `field_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `filter_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compare_op` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mkdate` int(11) NOT NULL DEFAULT 0,
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `userlimits`;
CREATE TABLE `userlimits` (
  `rule_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `maxnumber` int(11) DEFAULT NULL,
  `mkdate` int(11) DEFAULT NULL,
  `chdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`rule_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `users_tfa`;
CREATE TABLE `users_tfa` (
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `secret` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `confirmed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `type` enum('email','app') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'email',
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `users_tfa_tokens`;
CREATE TABLE `users_tfa_tokens` (
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `token` char(6) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `user_factorlist`;
CREATE TABLE `user_factorlist` (
  `list_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `mkdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`list_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `hobby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lebenslauf` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publi` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `schwerp` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Home` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privatnr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privatcell` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privadr` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `score` int(11) unsigned NOT NULL DEFAULT 0,
  `geschlecht` tinyint(4) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  `chdate` int(20) NOT NULL DEFAULT 0,
  `title_front` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title_rear` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `preferred_language` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `smsforward_copy` tinyint(1) NOT NULL DEFAULT 1,
  `smsforward_rec` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `email_forward` tinyint(4) NOT NULL DEFAULT 0,
  `smiley_favorite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `motto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lock_rule` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `user_info` (`user_id`, `hobby`, `lebenslauf`, `publi`, `schwerp`, `Home`, `privatnr`, `privatcell`, `privadr`, `score`, `geschlecht`, `mkdate`, `chdate`, `title_front`, `title_rear`, `preferred_language`, `smsforward_copy`, `smsforward_rec`, `email_forward`, `smiley_favorite`, `motto`, `lock_rule`) VALUES
('205f3efb7997a0fc9755da2b535038da',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	'',	NULL,	1,	'',	0,	'',	'',	''),
('6235c46eb9e962866ebdceece739ace5',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	'',	NULL,	1,	'',	0,	'',	'',	''),
('76ed43ef286fb55cf9e41beadb484a9f',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	0,	1583167398,	'',	'',	'de_DE',	1,	'',	0,	'',	'',	''),
('7e81ec247c151c02ffd479511e24cc03',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	'',	NULL,	1,	'',	0,	'',	'',	''),
('e7a0a84b161f3e8c09b4a0a2e8a58147',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	'',	NULL,	1,	'',	0,	'',	'',	'');

DROP TABLE IF EXISTS `user_inst`;
CREATE TABLE `user_inst` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `Institut_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `inst_perms` enum('user','autor','tutor','dozent','admin') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'user',
  `sprechzeiten` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `raum` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Telefon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `externdefault` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `visible` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`Institut_id`,`user_id`),
  KEY `inst_perms` (`inst_perms`,`Institut_id`),
  KEY `user_id` (`user_id`,`inst_perms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `user_inst` (`user_id`, `Institut_id`, `inst_perms`, `sprechzeiten`, `raum`, `Telefon`, `Fax`, `externdefault`, `priority`, `visible`) VALUES
('205f3efb7997a0fc9755da2b535038da',	'2560f7c7674942a7dce8eeb238e15d93',	'dozent',	'',	'',	'',	'',	0,	0,	1),
('6235c46eb9e962866ebdceece739ace5',	'2560f7c7674942a7dce8eeb238e15d93',	'admin',	'',	'',	'',	'',	0,	0,	1),
('7e81ec247c151c02ffd479511e24cc03',	'2560f7c7674942a7dce8eeb238e15d93',	'tutor',	'',	'',	'',	'',	0,	0,	1),
('e7a0a84b161f3e8c09b4a0a2e8a58147',	'2560f7c7674942a7dce8eeb238e15d93',	'user',	'',	'',	'',	'',	1,	0,	1);

DROP TABLE IF EXISTS `user_online`;
CREATE TABLE `user_online` (
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `last_lifesign` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `last_lifesign` (`last_lifesign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `user_studiengang`;
CREATE TABLE `user_studiengang` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `fach_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `semester` tinyint(2) DEFAULT 0,
  `abschluss_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `version_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`,`fach_id`,`abschluss_id`),
  KEY `studiengang_id` (`fach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `user_studiengang` (`user_id`, `fach_id`, `semester`, `abschluss_id`, `version_id`) VALUES
('7e81ec247c151c02ffd479511e24cc03',	'f981c9b42ca72788a09da4a45794a737',	1,	'228234544820cdf75db55b42d1ea3ecc',	NULL),
('e7a0a84b161f3e8c09b4a0a2e8a58147',	'6b9ac09535885ca55e29dd011e377c0a',	2,	'228234544820cdf75db55b42d1ea3ecc',	NULL);

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `token` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `expiration` int(11) unsigned NOT NULL,
  PRIMARY KEY (`token`),
  KEY `index_expiration` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `user_userdomains`;
CREATE TABLE `user_userdomains` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `userdomain_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`userdomain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `user_visibility`;
CREATE TABLE `user_visibility` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `online` tinyint(1) NOT NULL DEFAULT 1,
  `search` tinyint(1) NOT NULL DEFAULT 1,
  `email` tinyint(1) NOT NULL DEFAULT 1,
  `homepage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_homepage_visibility` int(11) NOT NULL DEFAULT 0,
  `mkdate` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `user_visibility_settings`;
CREATE TABLE `user_visibility_settings` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `visibilityid` int(32) NOT NULL AUTO_INCREMENT,
  `parent_id` int(32) NOT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(2) DEFAULT NULL,
  `plugin` int(11) DEFAULT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`visibilityid`),
  KEY `parent_id` (`parent_id`),
  KEY `identifier` (`identifier`),
  KEY `userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `webservice_access_rules`;
CREATE TABLE `webservice_access_rules` (
  `api_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip_range` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` enum('allow','deny') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'allow',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `widget_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `filename` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`widget_id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `widgets` (`widget_id`, `class`, `filename`, `enabled`, `mkdate`, `chdate`) VALUES
(1,	'Widgets\\FilesDashboard\\MyPublicFilesWidget',	'app/widgets/files_dashboard/MyPublicFilesWidget.php',	1,	1530289049,	1530289049),
(2,	'Widgets\\FilesDashboard\\LatestFilesWidget',	'app/widgets/files_dashboard/LatestFilesWidget.php',	1,	1530289049,	1530289049);

DROP TABLE IF EXISTS `widget_containers`;
CREATE TABLE `widget_containers` (
  `container_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `range_type` enum('course','institute','user','plugin','other') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'course',
  `scope` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'default',
  `parent_id` int(11) unsigned DEFAULT NULL,
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`container_id`),
  UNIQUE KEY `range` (`range_id`,`range_type`,`scope`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `widget_containers` (`container_id`, `range_id`, `range_type`, `scope`, `parent_id`, `mkdate`, `chdate`) VALUES
(1,	'user',	'user',	'dashboard',	NULL,	1530289049,	1530289049),
(2,	'autor',	'user',	'dashboard',	NULL,	1530289049,	1530289049),
(3,	'tutor',	'user',	'dashboard',	NULL,	1530289049,	1530289049),
(4,	'dozent',	'user',	'dashboard',	NULL,	1530289049,	1530289049),
(5,	'admin',	'user',	'dashboard',	NULL,	1530289049,	1530289049),
(6,	'root',	'user',	'dashboard',	NULL,	1530289049,	1530289049);

DROP TABLE IF EXISTS `widget_default`;
CREATE TABLE `widget_default` (
  `pluginid` int(11) NOT NULL,
  `col` tinyint(1) NOT NULL DEFAULT 0,
  `position` tinyint(1) NOT NULL DEFAULT 0,
  `perm` enum('user','autor','tutor','dozent','admin','root') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'autor',
  PRIMARY KEY (`perm`,`pluginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `widget_default` (`pluginid`, `col`, `position`, `perm`) VALUES
(3,	0,	3,	'user'),
(4,	0,	1,	'user'),
(5,	0,	0,	'user'),
(7,	0,	2,	'user'),
(3,	0,	3,	'autor'),
(4,	0,	1,	'autor'),
(5,	0,	0,	'autor'),
(7,	0,	2,	'autor'),
(3,	0,	3,	'tutor'),
(4,	0,	1,	'tutor'),
(5,	0,	0,	'tutor'),
(7,	0,	2,	'tutor'),
(3,	0,	3,	'dozent'),
(4,	0,	1,	'dozent'),
(5,	0,	0,	'dozent'),
(7,	0,	2,	'dozent'),
(3,	0,	3,	'admin'),
(4,	0,	1,	'admin'),
(5,	0,	0,	'admin'),
(7,	0,	2,	'admin'),
(3,	0,	3,	'root'),
(4,	0,	1,	'root'),
(5,	0,	0,	'root'),
(7,	0,	2,	'root');

DROP TABLE IF EXISTS `widget_elements`;
CREATE TABLE `widget_elements` (
  `element_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `container_id` int(11) unsigned NOT NULL,
  `widget_id` int(11) unsigned NOT NULL,
  `x` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `y` tinyint(3) unsigned NOT NULL,
  `width` tinyint(1) unsigned NOT NULL,
  `height` tinyint(1) unsigned NOT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `removable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `options` varchar(8192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
  `mkdate` int(11) unsigned NOT NULL,
  `chdate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`element_id`),
  KEY `container_id` (`container_id`),
  KEY `widget_id` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `widget_elements` (`element_id`, `container_id`, `widget_id`, `x`, `y`, `width`, `height`, `locked`, `removable`, `options`, `mkdate`, `chdate`) VALUES
(1,	1,	2,	0,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(2,	1,	1,	3,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(3,	2,	2,	0,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(4,	2,	1,	3,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(5,	3,	2,	0,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(6,	3,	1,	3,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(7,	4,	2,	0,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(8,	4,	1,	3,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(9,	5,	2,	0,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(10,	5,	1,	3,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(11,	6,	2,	0,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049),
(12,	6,	1,	3,	0,	3,	3,	1,	0,	'[]',	1530289049,	1530289049);

DROP TABLE IF EXISTS `widget_user`;
CREATE TABLE `widget_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginid` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `col` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `range_id` (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `wiki`;
CREATE TABLE `wiki` (
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `chdate` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`range_id`,`keyword`,`version`),
  KEY `user_id` (`user_id`),
  KEY `chdate` (`chdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `wiki_links`;
CREATE TABLE `wiki_links` (
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `from_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `to_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`range_id`,`to_keyword`,`from_keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `wiki_locks`;
CREATE TABLE `wiki_locks` (
  `user_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `range_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `chdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`range_id`,`user_id`,`keyword`),
  KEY `user_id` (`user_id`),
  KEY `chdate` (`chdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `wiki_page_config`;
CREATE TABLE `wiki_page_config` (
  `range_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `read_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `edit_restricted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`range_id`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
