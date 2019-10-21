/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */


DROP TABLE IF EXISTS `engine4_airport_threats`;
CREATE TABLE `engine4_airport_threats` (
  `threat_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `airport_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext,
  `icon` varchar(128) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `article` varchar(32) DEFAULT NULL,
  `up_vote_count` int(11) NOT NULL DEFAULT '0',
  `down_vote_count` int(11) NOT NULL DEFAULT '0',
  `total_vote_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`threat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;