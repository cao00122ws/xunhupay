-- --------------------------------------------------------
-- 主机:                           121.41.72.181
-- 服务器版本:                        5.7.41-0ubuntu0.18.04.1-log - (Ubuntu)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 xunhupay 的数据库结构
CREATE DATABASE IF NOT EXISTS `xunhupay` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `xunhupay`;

-- 导出  表 xunhupay.app 结构
CREATE TABLE IF NOT EXISTS `app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `domain` varchar(128) NOT NULL,
  `appkey` varchar(32) DEFAULT NULL,
  `channel_type` varchar(16) NOT NULL,
  `config` text,
  `published_time` int(11) DEFAULT NULL,
  `created_time` int(11) NOT NULL,
  `status` varchar(16) NOT NULL,
  `remark` text,
  `config1` text,
  `v_time` int(11) DEFAULT NULL,
  `exchange_rate` decimal(18,4) NOT NULL DEFAULT '0.0100',
  `parent_exchange_rate` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `ext_p0` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ext_p0` (`ext_p0`)
) ENGINE=InnoDB AUTO_INCREMENT=201906122645 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.log 结构
CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg` text,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.member 结构
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `wechat` text CHARACTER SET utf8mb4,
  `mobile` varchar(32) DEFAULT NULL COMMENT '包含国外手机',
  `role_id` varchar(64) NOT NULL,
  `expire_warning` tinyint(4) NOT NULL DEFAULT '0',
  `parent_user_id` int(11) NOT NULL DEFAULT '1',
  `message_open` tinyint(4) NOT NULL DEFAULT '1',
  `password_salt` varchar(16) NOT NULL,
  `password_hash` varchar(32) NOT NULL,
  `created_time` datetime NOT NULL,
  `pt_amount` decimal(18,2) NOT NULL DEFAULT '5.00' COMMENT '平台使用费用',
  `income` decimal(18,2) NOT NULL DEFAULT '0.00',
  `withdraw` decimal(18,2) NOT NULL DEFAULT '0.00',
  `withdrawing` decimal(18,2) NOT NULL DEFAULT '0.00',
  `status` varchar(1) NOT NULL COMMENT 'A:活跃的|D:冻结的|I:未被激活的',
  `exchange_rate` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `config` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_unique` (`mobile`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8414 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.member_auth_history 结构
CREATE TABLE IF NOT EXISTS `member_auth_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL COMMENT 'login|register',
  `ip` varchar(16) NOT NULL,
  `success` tinyint(4) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=15705 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.member_income 结构
CREATE TABLE IF NOT EXISTS `member_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `appid` bigint(20) DEFAULT NULL,
  `desc` text,
  `type` varchar(16) DEFAULT 'order',
  `created_time` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `exchange_rate` decimal(18,4) NOT NULL,
  `pt_amount` decimal(18,2) NOT NULL,
  `parent_income` decimal(18,2) NOT NULL DEFAULT '0.00',
  `parent_member_id` int(11) NOT NULL DEFAULT '1',
  `parent_exchange_rate` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=225710 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.member_withdraw 结构
CREATE TABLE IF NOT EXISTS `member_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL COMMENT '体现金额',
  `income` decimal(18,2) NOT NULL COMMENT '当前总收入',
  `remark` text COMMENT '系统错误',
  `created_time` datetime NOT NULL,
  `handling_time` datetime DEFAULT NULL,
  `status` varchar(1) NOT NULL COMMENT 'A:待审核 D：已处理 F：拒绝',
  `is_removed_by_member` tinyint(4) NOT NULL DEFAULT '0',
  `is_removed_by_admin` tinyint(4) NOT NULL DEFAULT '0',
  `balance` decimal(18,2) NOT NULL DEFAULT '0.00',
  `withdrawing` decimal(18,2) NOT NULL DEFAULT '0.00',
  `withdraw` decimal(18,2) DEFAULT '0.00',
  `realname` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `transaction_id` varchar(512) DEFAULT NULL,
  `openid` varchar(512) DEFAULT NULL,
  `customer_name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `customer_img` varchar(512) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `bank` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.menu 结构
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(512) NOT NULL,
  `status` varchar(1) NOT NULL,
  `icon` varchar(512) DEFAULT NULL,
  `action` varchar(64) DEFAULT NULL,
  `controller` varchar(64) DEFAULT NULL,
  `area` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.message 结构
CREATE TABLE IF NOT EXISTS `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `service_id` varchar(32) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `sended_time` datetime DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `sended_result` text,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51489 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.options 结构
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `group` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`key`,`group`),
  KEY `key` (`key`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.order 结构
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` bigint(20) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `transaction_id` varchar(128) DEFAULT NULL,
  `payment_method` varchar(32) NOT NULL,
  `status` varchar(2) NOT NULL,
  `title` text,
  `order_date` datetime NOT NULL,
  `order_paid_date` datetime DEFAULT NULL,
  `trade_order_id` varchar(128) NOT NULL,
  `notify_url` text,
  `return_url` text,
  `callback_url` text,
  `check_paid_time` int(11) NOT NULL DEFAULT '0' COMMENT '0,1,2检查失败  100 检查成功',
  `check_callback_time` int(11) NOT NULL DEFAULT '0' COMMENT '0,1,2检查失败  100 检查成功',
  `service_id` varchar(32) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `plugins` varchar(128) DEFAULT NULL,
  `pay_url` text,
  `attach` text,
  `bad` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `service_id` (`service_id`),
  KEY `trade_order_id_key` (`trade_order_id`),
  KEY `appid` (`appid`),
  KEY `check_callback_time` (`check_callback_time`)
) ENGINE=InnoDB AUTO_INCREMENT=20200838698 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.recharge 结构
CREATE TABLE IF NOT EXISTS `recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `time` bigint(20) DEFAULT NULL,
  `desc` text,
  `removed_by_user` tinyint(4) NOT NULL DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `current_expire_date` datetime DEFAULT NULL,
  `payment_method` varchar(64) DEFAULT NULL,
  `transaction_id` varchar(64) DEFAULT NULL,
  `re_type` varchar(16) NOT NULL DEFAULT 'recharge',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1750 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.role_menu 结构
CREATE TABLE IF NOT EXISTS `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(32) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.sessions 结构
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106174 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.ueditor_file 结构
CREATE TABLE IF NOT EXISTS `ueditor_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type` varchar(32) NOT NULL,
  `filename` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_commentmeta 结构
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_comments 结构
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_links 结构
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_options 结构
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_postmeta 结构
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_posts 结构
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_termmeta 结构
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_terms 结构
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_term_relationships 结构
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_term_taxonomy 结构
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_usermeta 结构
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_users 结构
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay.wp_xh_sessions 结构
CREATE TABLE IF NOT EXISTS `wp_xh_sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 xunhupay._session 结构
CREATE TABLE IF NOT EXISTS `_session` (
  `id` varchar(32) NOT NULL,
  `expiry` bigint(20) NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
