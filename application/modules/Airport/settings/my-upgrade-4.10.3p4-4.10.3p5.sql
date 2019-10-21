/**
 * SocialEngine
 *
 * @category   Application_Extensions
 * @package    Airport
 * @author     Stars Developer
 */


ALTER TABLE `engine4_airport_threats`
ADD `imported` tinyint NOT NULL DEFAULT '1';

ALTER TABLE `engine4_airport_threats`
ADD `phase` varchar(32) COLLATE 'latin1_swedish_ci' NULL AFTER `body`;

ALTER TABLE `engine4_airport_votes`
CHANGE `parent_type` `parent_type` enum('airport','airport_expect','airport_threat','unknown') COLLATE 'utf8_general_ci' NOT NULL DEFAULT 'unknown' AFTER `vote_type`;