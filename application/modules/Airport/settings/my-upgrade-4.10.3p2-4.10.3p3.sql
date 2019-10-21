/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */


ALTER TABLE `engine4_airport_expects`
CHANGE `phase` `phase` varchar(32) COLLATE 'latin1_swedish_ci' NULL AFTER `body`;

ALTER TABLE `engine4_airport_expects`
ADD `comment_count` int(11) NOT NULL DEFAULT '0';

ALTER TABLE `engine4_airport_expects`
ADD `creation_date` datetime NOT NULL,
ADD `modified_date` datetime NOT NULL AFTER `creation_date`;

DROP TABLE IF EXISTS `engine4_airport_votes`;
CREATE TABLE `engine4_airport_votes` (
  `vote_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vote_type` tinyint(1) NOT NULL,
  `parent_type` enum('airport','airport_expect','unknown') NOT NULL DEFAULT 'unknown',
  `parent_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vote_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `parent_type` (`parent_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `engine4_core_menuitems` (`name`, `module`, `label`, `plugin`, `params`, `menu`, `submenu`, `enabled`, `custom`, `order`) VALUES
('airport_admin_main_level',	'airport',	'Member Level Settings',	'',	'{\"route\":\"admin_default\",\"module\":\"airport\",\"controller\":\"settings\",\"action\":\"level\"}',	'airport_admin_main',	'',	1,	0,	2);