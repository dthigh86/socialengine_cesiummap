/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Stars Developer
 * Created: Sep 5, 2019
 */

DROP TABLE IF EXISTS `engine4_airport_airports`;
CREATE TABLE `engine4_airport_airports` (
  `airport_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL,
  `description` longtext,
  `country` varchar(255) NOT NULL,
  `region` varchar(128) NOT NULL,
  `icao` varchar(32) NOT NULL,
  `iata` varchar(32) NOT NULL,
  `777_200lr` varchar(32) NOT NULL,
  `777_300er` varchar(32) NOT NULL,
  `777f` varchar(32) NOT NULL,
  `a380` varchar(32) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_privacy` varchar(32) NOT NULL DEFAULT 'everyone',
  `search` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `engine4_airport_expects`;
CREATE TABLE `engine4_airport_expects` (
  `expect_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `airport_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `phase` varchar(32) NOT NULL,
  `up_vote_count` int(11) NOT NULL DEFAULT '0',
  `down_vote_count` int(11) NOT NULL DEFAULT '0',
  `total_vote_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `engine4_core_menuitems` (`name`, `module`, `label`, `plugin`, `params`, `menu`, `submenu`, `enabled`, `custom`, `order`) VALUES
('airport_admin_main_manage',	'airport',	'Manage Airports',	'',	'{\"route\":\"admin_default\",\"module\":\"airport\",\"controller\":\"manage\"}',	'airport_admin_main',	'',	1,	0,	1),
('core_admin_main_plugins_airport',	'airport',	'SD - Airports',	'',	'{\"route\":\"admin_default\",\"module\":\"airport\",\"controller\":\"manage\"}',	'core_admin_main_plugins',	'',	1,	0,	999);


ALTER TABLE `engine4_airport_airports`
ADD `view_count` int NOT NULL DEFAULT '0',
ADD `like_count` int NOT NULL DEFAULT '0' AFTER `view_count`,
ADD `comment_count` int NOT NULL DEFAULT '0' AFTER `like_count`;

