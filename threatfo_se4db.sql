-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2019 at 08:35 PM
-- Server version: 10.2.26-MariaDB-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `threatfo_se4db`
--

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_actions`
--

CREATE TABLE `engine4_activity_actions` (
  `action_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `attachment_count` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `comment_count` mediumint(5) UNSIGNED NOT NULL DEFAULT 0,
  `like_count` mediumint(5) UNSIGNED NOT NULL DEFAULT 0,
  `privacy` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_actions`
--

INSERT INTO `engine4_activity_actions` (`action_id`, `type`, `subject_type`, `subject_id`, `object_type`, `object_id`, `body`, `params`, `date`, `modified_date`, `attachment_count`, `comment_count`, `like_count`, `privacy`) VALUES
(1, 'signup', 'user', 2, 'user', 2, '', '[]', '2019-08-30 11:59:58', '2019-08-30 11:59:58', 0, 0, 0, NULL),
(2, 'friends', 'user', 1, 'user', 2, '{item:$object} is now friends with {item:$subject}.', '[]', '2019-09-05 09:36:04', '2019-09-05 09:36:04', 0, 0, 0, NULL),
(3, 'friends', 'user', 2, 'user', 1, '{item:$object} is now friends with {item:$subject}.', '[]', '2019-09-05 09:36:04', '2019-09-05 09:36:04', 0, 0, 0, NULL),
(4, 'profile_photo_update', 'user', 1, 'user', 1, '', '[]', '2019-09-05 10:59:05', '2019-09-05 10:59:05', 1, 0, 0, NULL),
(5, 'network_join', 'user', 1, 'network', 1, '', '[]', '2019-09-15 17:59:26', '2019-09-15 17:59:26', 0, 0, 0, NULL),
(6, 'signup', 'user', 3, 'user', 3, '', '[]', '2019-09-22 17:34:22', '2019-09-22 17:34:22', 0, 0, 0, NULL),
(9, 'signup', 'user', 9, 'user', 9, '', '[]', '2019-09-23 09:50:02', '2019-09-23 09:50:02', 0, 0, 0, NULL),
(10, 'signup', 'user', 12, 'user', 12, '', '[]', '2019-09-23 13:09:38', '2019-09-23 13:09:38', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_actionsettings`
--

CREATE TABLE `engine4_activity_actionsettings` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_actiontypes`
--

CREATE TABLE `engine4_activity_actiontypes` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `displayable` tinyint(1) NOT NULL DEFAULT 3,
  `attachable` tinyint(1) NOT NULL DEFAULT 1,
  `commentable` tinyint(1) NOT NULL DEFAULT 1,
  `shareable` tinyint(1) NOT NULL DEFAULT 1,
  `editable` tinyint(1) NOT NULL DEFAULT 0,
  `is_generated` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_actiontypes`
--

INSERT INTO `engine4_activity_actiontypes` (`type`, `module`, `body`, `enabled`, `displayable`, `attachable`, `commentable`, `shareable`, `editable`, `is_generated`) VALUES
('comment_activity_action', 'activity', '{item:$subject} commented on {item:$owner}\'s {item:$object:post}.', 1, 1, 1, 3, 3, 0, 0),
('comment_user', 'user', '{item:$subject} commented on {item:$owner}\'s profile: {body:$body}', 1, 7, 1, 3, 1, 0, 1),
('cover_photo_update', 'user', '{item:$subject} has added a new cover photo.', 1, 5, 1, 4, 1, 0, 1),
('friends', 'user', '{item:$subject} is now friends with {item:$object}.', 1, 3, 0, 1, 1, 0, 1),
('friends_follow', 'user', '{item:$subject} is now following {item:$object}.', 1, 3, 0, 1, 1, 0, 1),
('like_activity_action', 'activity', '{item:$subject} liked {item:$owner}\'s {item:$object:post}.', 1, 1, 1, 3, 3, 0, 0),
('login', 'user', '{item:$subject} has signed in.', 0, 1, 0, 1, 1, 0, 1),
('logout', 'user', '{item:$subject} has signed out.', 0, 1, 0, 1, 1, 0, 1),
('network_join', 'network', '{item:$subject} joined the network {item:$object}', 1, 3, 1, 1, 1, 0, 1),
('post', 'user', '{actors:$subject:$object}: {body:$body}', 1, 7, 1, 4, 1, 1, 0),
('post_self', 'user', '{item:$subject} {body:$body}', 1, 5, 1, 4, 1, 1, 0),
('profile_photo_update', 'user', '{item:$subject} has added a new profile photo.', 1, 5, 1, 4, 1, 0, 1),
('share', 'activity', '{item:$subject} shared {item:$object}\'s {var:$type}. {body:$body}', 1, 5, 1, 1, 0, 1, 1),
('signup', 'user', '{item:$subject} has just signed up. Say hello!', 1, 5, 0, 1, 1, 0, 1),
('status', 'user', '{item:$subject} {body:$body}', 1, 5, 0, 1, 4, 1, 0),
('tagged', 'user', '{item:$subject} tagged {item:$object} in a {var:$label}:', 1, 7, 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_attachments`
--

CREATE TABLE `engine4_activity_attachments` (
  `attachment_id` int(11) UNSIGNED NOT NULL,
  `action_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_attachments`
--

INSERT INTO `engine4_activity_attachments` (`attachment_id`, `action_id`, `type`, `id`, `mode`) VALUES
(1, 4, 'storage_file', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_comments`
--

CREATE TABLE `engine4_activity_comments` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `like_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_likes`
--

CREATE TABLE `engine4_activity_likes` (
  `like_id` int(11) UNSIGNED NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_notifications`
--

CREATE TABLE `engine4_activity_notifications` (
  `notification_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `mitigated` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_notifications`
--

INSERT INTO `engine4_activity_notifications` (`notification_id`, `user_id`, `subject_type`, `subject_id`, `object_type`, `object_id`, `type`, `params`, `read`, `mitigated`, `date`) VALUES
(1, 2, 'user', 1, 'user', 2, 'friend_request', NULL, 1, 1, '2019-09-05 09:34:14'),
(2, 1, 'user', 2, 'user', 1, 'friend_accepted', NULL, 1, 0, '2019-09-05 09:36:04'),
(4, 1, 'user', 2, 'airport_expect', 2, 'commented', '{\"label\":\"expect\"}', 1, 0, '2019-09-19 10:48:46'),
(5, 1, 'user', 2, 'airport_threat', 60, 'commented', '{\"label\":\"threat\"}', 1, 0, '2019-09-19 10:54:42'),
(6, 1, 'user', 2, 'core_comment', 3, 'liked', '{\"label\":\"comment\"}', 1, 0, '2019-09-19 10:58:41'),
(7, 1, 'user', 2, 'core_comment', 1, 'liked', '{\"label\":\"comment\"}', 1, 0, '2019-09-19 10:59:20'),
(8, 1, 'user', 2, 'airport_expect', 2, 'liked', '{\"label\":\"expect\"}', 1, 0, '2019-09-19 10:59:43'),
(9, 1, 'user', 2, 'airport_threat', 60, 'liked', '{\"label\":\"threat\"}', 1, 0, '2019-09-19 10:59:45'),
(10, 1, 'user', 2, 'core_comment', 3, 'liked', '{\"label\":\"comment\"}', 1, 0, '2019-09-19 11:00:39'),
(11, 1, 'user', 2, 'airport_expect', 2, 'expects_upvote', '{\"label\":\"expect\"}', 1, 0, '2019-09-19 11:24:48'),
(12, 1, 'user', 2, 'airport_threat', 60, 'threat_upvote', '{\"label\":\"threat\"}', 1, 0, '2019-09-19 11:29:00'),
(14, 1, 'user', 2, 'airport_threat', 62, 'threat_upvote', '{\"label\":\"threat\"}', 1, 0, '2019-09-19 11:32:07'),
(15, 1, 'user', 2, 'airport_expect', 5, 'expects_upvote', '{\"label\":\"expect\"}', 1, 0, '2019-09-19 11:32:08'),
(16, 1, 'user', 2, 'messages_conversation', 1, 'message_new', NULL, 1, 0, '2019-09-20 10:27:33'),
(18, 2, 'user', 1, 'airport_expect', 2, 'commented_commented', '{\"label\":\"expect\"}', 0, 0, '2019-09-25 11:51:28'),
(19, 2, 'user', 1, 'airport_expect', 2, 'commented_commented', '{\"label\":\"expect\"}', 0, 0, '2019-09-25 11:58:11'),
(20, 2, 'user', 1, 'airport_expect', 2, 'commented_commented', '{\"label\":\"expect\"}', 0, 0, '2019-09-25 12:09:19'),
(21, 2, 'user', 1, 'airport_threat', 60, 'commented_commented', '{\"label\":\"threat\"}', 0, 0, '2019-09-25 12:12:09'),
(22, 2, 'user', 1, 'airport_expect', 2, 'commented_commented', '{\"label\":\"expect\"}', 0, 0, '2019-09-25 12:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_notificationsettings`
--

CREATE TABLE `engine4_activity_notificationsettings` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_notificationsettings`
--

INSERT INTO `engine4_activity_notificationsettings` (`user_id`, `type`, `email`) VALUES
(9, 'commented', 0),
(9, 'commented_commented', 0),
(9, 'friend_accepted', 0),
(9, 'friend_request', 0),
(9, 'liked', 0),
(9, 'liked_commented', 0),
(9, 'message_new', 0),
(9, 'post_user', 0),
(9, 'shared', 0),
(9, 'tagged', 0),
(12, 'commented', 0),
(12, 'commented_commented', 0),
(12, 'friend_accepted', 0),
(12, 'friend_request', 0),
(12, 'liked', 0),
(12, 'liked_commented', 0),
(12, 'message_new', 0),
(12, 'post_user', 0),
(12, 'shared', 0),
(12, 'tagged', 0),
(18, 'commented', 0),
(18, 'commented_commented', 0),
(18, 'friend_accepted', 0),
(18, 'friend_request', 0),
(18, 'liked', 0),
(18, 'liked_commented', 0),
(18, 'message_new', 0),
(18, 'post_user', 0),
(18, 'shared', 0),
(18, 'tagged', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_notificationtypes`
--

CREATE TABLE `engine4_activity_notificationtypes` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `is_request` tinyint(1) NOT NULL DEFAULT 0,
  `handler` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_notificationtypes`
--

INSERT INTO `engine4_activity_notificationtypes` (`type`, `module`, `body`, `is_request`, `handler`, `default`) VALUES
('commented', 'activity', '{item:$subject} has commented on your {item:$object:$label}.', 0, '', 0),
('commented_commented', 'activity', '{item:$subject} has commented on a {item:$object:$label} you commented on.', 0, '', 0),
('expects_upvote', 'airport', '{item:$subject} upvote your {item:$object:$label}.', 0, '', 1),
('friend_accepted', 'user', 'You and {item:$subject} are now friends.', 0, '', 0),
('friend_follow', 'user', '{item:$subject} is now following you.', 0, '', 0),
('friend_follow_accepted', 'user', 'You are now following {item:$subject}.', 0, '', 0),
('friend_follow_request', 'user', '{item:$subject} has requested to follow you.', 1, 'user.friends.request-follow', 0),
('friend_request', 'user', '{item:$subject} has requested to be your friend.', 1, 'user.friends.request-friend', 0),
('liked', 'activity', '{item:$subject} likes your {item:$object:$label}.', 0, '', 0),
('liked_commented', 'activity', '{item:$subject} has commented on a {item:$object:$label} you liked.', 0, '', 0),
('message_new', 'messages', '{item:$subject} has sent you a {item:$object:message}.', 0, '', 0),
('post_user', 'user', '{item:$subject} has posted on your {item:$object:profile}.', 0, '', 0),
('shared', 'activity', '{item:$subject} has shared your {item:$object:$label}.', 0, '', 0),
('tagged', 'user', '{item:$subject} tagged you in a {item:$object:$label}.', 0, '', 0),
('threat_upvote', 'airport', '{item:$subject} upvote your {item:$object:$label}.', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_activity_stream`
--

CREATE TABLE `engine4_activity_stream` (
  `target_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `target_id` int(11) UNSIGNED NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `action_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_activity_stream`
--

INSERT INTO `engine4_activity_stream` (`target_type`, `target_id`, `subject_type`, `subject_id`, `object_type`, `object_id`, `type`, `action_id`) VALUES
('everyone', 0, 'user', 2, 'user', 2, 'signup', 1),
('everyone', 0, 'user', 1, 'user', 2, 'friends', 2),
('everyone', 0, 'user', 2, 'user', 1, 'friends', 3),
('everyone', 0, 'user', 1, 'user', 1, 'profile_photo_update', 4),
('everyone', 0, 'user', 3, 'user', 3, 'signup', 6),
('everyone', 0, 'user', 9, 'user', 9, 'signup', 9),
('everyone', 0, 'user', 12, 'user', 12, 'signup', 10),
('members', 1, 'user', 2, 'user', 1, 'friends', 3),
('members', 1, 'user', 1, 'user', 1, 'profile_photo_update', 4),
('members', 2, 'user', 2, 'user', 2, 'signup', 1),
('members', 2, 'user', 1, 'user', 2, 'friends', 2),
('members', 3, 'user', 3, 'user', 3, 'signup', 6),
('members', 9, 'user', 9, 'user', 9, 'signup', 9),
('members', 12, 'user', 12, 'user', 12, 'signup', 10),
('owner', 1, 'user', 1, 'user', 2, 'friends', 2),
('owner', 1, 'user', 1, 'user', 1, 'profile_photo_update', 4),
('owner', 1, 'user', 1, 'network', 1, 'network_join', 5),
('owner', 2, 'user', 2, 'user', 2, 'signup', 1),
('owner', 2, 'user', 2, 'user', 1, 'friends', 3),
('owner', 3, 'user', 3, 'user', 3, 'signup', 6),
('owner', 9, 'user', 9, 'user', 9, 'signup', 9),
('owner', 12, 'user', 12, 'user', 12, 'signup', 10),
('parent', 1, 'user', 2, 'user', 1, 'friends', 3),
('parent', 1, 'user', 1, 'user', 1, 'profile_photo_update', 4),
('parent', 2, 'user', 2, 'user', 2, 'signup', 1),
('parent', 2, 'user', 1, 'user', 2, 'friends', 2),
('parent', 3, 'user', 3, 'user', 3, 'signup', 6),
('parent', 9, 'user', 9, 'user', 9, 'signup', 9),
('parent', 12, 'user', 12, 'user', 12, 'signup', 10),
('registered', 0, 'user', 2, 'user', 2, 'signup', 1),
('registered', 0, 'user', 1, 'user', 2, 'friends', 2),
('registered', 0, 'user', 2, 'user', 1, 'friends', 3),
('registered', 0, 'user', 1, 'user', 1, 'profile_photo_update', 4),
('registered', 0, 'user', 3, 'user', 3, 'signup', 6),
('registered', 0, 'user', 9, 'user', 9, 'signup', 9),
('registered', 0, 'user', 12, 'user', 12, 'signup', 10);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_airport_airports`
--

CREATE TABLE `engine4_airport_airports` (
  `airport_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
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
  `search` tinyint(4) NOT NULL DEFAULT 1,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engine4_airport_airports`
--

INSERT INTO `engine4_airport_airports` (`airport_id`, `owner_id`, `photo_id`, `title`, `description`, `country`, `region`, `icao`, `iata`, `777_200lr`, `777_300er`, `777f`, `a380`, `creation_date`, `modified_date`, `view_privacy`, `search`, `view_count`, `like_count`, `comment_count`) VALUES
(1, 1, 0, 'Honiara', NULL, 'Solomon Islands', 'Oceania', 'AGGH ', 'HIR', 'A2', 'A2', 'A2', '-', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 0, 0, 0),
(2, 1, 0, 'Port Moresby', NULL, 'Papaua New Guinea', 'Oceania', 'AYPY', 'POM', 'A2', 'A2', 'A2', '-', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 0, 0, 0),
(3, 1, 0, 'Kangerlussuaq / Stromford', NULL, 'Greenland', 'Europe', 'BGSF', 'SFJ', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 1, 0, 0),
(4, 1, 0, 'Thule', NULL, 'Greenland', 'Europe', 'BGTL', 'THU', 'EA', 'EA', 'EA', '-', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 0, 0, 0),
(5, 1, 0, 'Keflavik', NULL, 'Iceland', 'Europe', 'BIKF', 'KEF', 'A1', 'A1', 'A1', 'A2', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 1, 0, 0),
(6, 1, 0, 'Edmonton', NULL, 'Canada', 'North America', 'CYEG', 'YEG', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 0, 0, 0),
(7, 1, 0, 'Iqaluit/frobisher Bay', NULL, 'Canada', 'North America', 'CYFB ', 'YFB', 'CA', 'CA', 'CA', 'EA', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 2, 0, 0),
(8, 1, 0, 'Hamilton', NULL, 'Canada', 'North America', 'CYHM', 'YHM', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:10', '2019-09-05 07:59:10', 'everyone', 1, 0, 0, 0),
(9, 1, 0, 'Halifax', NULL, 'Canada', 'North America', 'CYHZ', 'YHZ', 'A1', 'A1', 'A1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(10, 1, 0, 'Fort Mcmurray', NULL, 'Canada', 'North America', 'CYMM', 'YMM', 'CA', 'CA', 'CA', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(11, 1, 0, 'Ottawa', NULL, 'Canada', 'North America', 'CYOW', 'YOW', 'A1', 'A1', 'A1', 'A2', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(12, 1, 0, 'Quebec', NULL, 'Canada', 'North America', 'CYQB ', 'YQB', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(13, 1, 0, 'Gander', NULL, 'Canada', 'North America', 'CYQX ', 'YQX', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(14, 1, 0, 'Trenton', NULL, 'Canada', 'North America', 'CYTR', 'YTR', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(15, 1, 0, 'Montreal', NULL, 'Canada', 'North America', 'CYUL ', 'YUL', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(16, 1, 0, 'Vancouver', NULL, 'Canada', 'North America', 'CYVR', 'YVR', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(17, 1, 0, 'Winnipeg', NULL, 'Canada', 'North America', 'CYWG', 'YWG', 'A1', 'A1', 'A1', 'A2', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(18, 1, 0, 'Saskatoon / John G. Diefenbacher', NULL, 'Canada', 'North America', 'CYXE', 'YXE', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(19, 1, 0, 'London', NULL, 'Canada', 'North America', 'CYXU', 'YXU', 'CA', 'CA', 'CA', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(20, 1, 0, 'Whitehorse', NULL, 'Canada', 'North America', 'CYXY ', 'YXY', 'CA', 'CA', 'A1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(21, 1, 0, 'Calgary', NULL, 'Canada', 'North America', 'CYYC', 'YYC', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(22, 1, 0, 'Goosebay', NULL, 'Canada', 'North America', 'CYYR', 'YYR', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(23, 1, 0, 'St. John\'s', NULL, 'Canada', 'North America', 'CYYT', 'YYT', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(24, 1, 0, 'Toronto', NULL, 'Canada', 'North America', 'CYYZ', 'YYZ', 'D', 'D', 'D', 'D', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 1, 0, 0),
(25, 1, 0, 'Yellowknife', NULL, 'Canada', 'North America', 'CYZF', 'YZF', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(26, 1, 0, 'Algiers', NULL, 'Algeria', 'Africa', 'DAAG ', 'ALG', 'D', 'D', 'D', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(27, 1, 0, 'Tamanrasset', NULL, 'Algeria', 'Africa', 'DAAT', 'TMR', 'A1', 'A1', 'A1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(28, 1, 0, 'Oran', NULL, 'Algeria', 'Africa', 'DAOO', 'ORN', 'A1', 'A1', 'A1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(29, 1, 0, 'Zarzaitine', NULL, 'Algeria', 'Africa', 'DAUZ', 'IAM', 'CA', 'CA', 'CA', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(30, 1, 0, 'Cotonou', NULL, 'Benin', 'Africa', 'DBBB', 'COO', 'A1', 'A1', 'A1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(31, 1, 0, 'Ouagadougou', NULL, 'Burkina', 'Africa', 'DFFD', 'OUA', 'A1', 'A1', 'D', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(32, 1, 0, 'Acra', NULL, 'Ghana', 'Africa', 'DGAA', 'ACC', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(33, 1, 0, 'Abidjan', NULL, 'Ivory Coast', 'Africa', 'DIAP', 'ABJ', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(34, 1, 0, 'Abuja', NULL, 'Nigeria', 'Africa', 'DNAA', 'ABV', 'D', 'D', 'D', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(35, 1, 0, 'Kano', NULL, 'Nigeria', 'Africa', 'DNKN', 'KAN', 'CA', 'CA', 'A1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(36, 1, 0, 'Lagos', NULL, 'Nigeria', 'Africa', 'DNMM', 'LOS', 'D', 'D', 'D', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(37, 1, 0, 'Port Harcourt', NULL, 'Nigeria', 'Africa', 'DNPO', 'PHC', 'A2', 'A2', 'A2', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(38, 1, 0, 'Niamey', NULL, 'Niger ', 'Africa', 'DRRN ', 'NIM', 'A1', 'A1', 'a1', '-', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(39, 1, 0, 'Tabaraka', NULL, 'Tunisia', 'Africa', 'DTKA', 'TBJ', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(40, 1, 0, 'Monastir', NULL, 'Tunisia', 'Africa', 'DTMB', 'MIR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(41, 1, 0, 'Enfidha', NULL, 'Tunisia', 'Africa', 'DTNH', 'NBE', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(42, 1, 0, 'Tunis', NULL, 'Tunisia', 'Africa', 'DTTA', 'TUN', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(43, 1, 0, 'Djerba', NULL, 'Tunisia', 'Africa', 'DTTJ', 'DJE', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(44, 1, 0, 'Sfax', NULL, 'Tunisia', 'Africa', 'DTTX', 'SFA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(45, 1, 0, 'Lome', NULL, 'Togo', 'Africa', 'DXXX', 'LFW', 'A1', 'A1', 'D', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(46, 1, 0, 'Brusslels', NULL, 'Belgium', 'Europe', 'EBBR', 'BRU', 'D', 'D', 'D', 'A2', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(47, 1, 0, 'Liege', NULL, 'Belgium', 'Europe', 'EBLG', 'LGG', 'A1', 'A1', 'D', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(48, 1, 0, 'Dresden', NULL, 'Germany', 'Europe', 'EDDC', 'DRS', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(49, 1, 0, 'Frankfurt', NULL, 'Germany', 'Europe', 'EDDF', 'FRA', 'D', 'D', 'D', 'D', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(50, 1, 0, 'Hamburg', NULL, 'Germany', 'Europe', 'EDDH', 'HAM', 'D', 'D', 'D', 'D', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(51, 1, 0, 'Cologne', NULL, 'Germany', 'Europe', 'EDDK', 'CGN', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(52, 1, 0, 'Dussledorf', NULL, 'Germany', 'Europe', 'EDDL', 'DUS', 'D', 'D', 'D', 'D', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(53, 1, 0, 'Munich', NULL, 'Germany', 'Europe', 'EDDM', 'MUC', 'D', 'D', 'D', 'D', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(54, 1, 0, 'Nurenberg', NULL, 'Germany', 'Europe', 'EDDN', 'NUE', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(55, 1, 0, 'Leipzig-halle', NULL, 'Germany', 'Europe', 'EDDP', 'LEJ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(56, 1, 0, 'Berlin Tegel', NULL, 'Germany', 'Europe', 'EDDT', 'TXL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(57, 1, 0, 'Hannover', NULL, 'Germany', 'Europe', 'EDDV', 'HAJ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(58, 1, 0, 'Frankfurt-hahn', NULL, 'Germany', 'Europe', 'EDFH', 'HHN', 'A2', 'A2', 'D', '', '2019-09-05 07:59:11', '2019-09-05 07:59:11', 'everyone', 1, 0, 0, 0),
(59, 1, 0, 'Hamburg (finkenwerder)', NULL, 'Germany', 'Europe', 'EDHI', 'XFW', '', '', '', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(60, 1, 0, 'Tallinn', NULL, 'Estonia', 'Europe', 'EETN', 'TLL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(61, 1, 0, 'Helsinki', NULL, 'Finland', 'Europe', 'EFHK', 'HEL', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(62, 1, 0, 'Rovaniemi', NULL, 'Finland', 'Europe', 'EFRO', 'RVN', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(63, 1, 0, 'Birmingham', NULL, 'United Kingdom', 'Europe', 'EGBB', 'BHX', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(64, 1, 0, 'Manchester', NULL, 'United Kingdom', 'Europe', 'EGCC', 'MAN', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(65, 1, 0, 'Doncaster Sheffield', NULL, 'United Kingdom', 'Europe', 'EGCN', 'DSA', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(66, 1, 0, 'London Lgw', NULL, 'United Kingdom', 'Europe', 'EGKK', 'LGW', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(67, 1, 0, 'London Lhr', NULL, 'United Kingdom', 'Europe', 'EGLL', 'LHR', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 1, 0, 0),
(68, 1, 0, 'Newcastle', NULL, 'United Kingdom', 'Europe', 'EGNT', 'NCL', 'D', 'D', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(69, 1, 0, 'East Midlands', NULL, 'United Kingdom', 'Europe', 'EGNX', 'EMA', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(70, 1, 0, 'Glasgow', NULL, 'United Kingdom', 'Europe', 'EGPF', 'GLA', 'D', 'D', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(71, 1, 0, 'Edinburgh', NULL, 'United Kingdom', 'Europe', 'EGPH', 'EDI', 'D', 'D', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(72, 1, 0, 'Prestwick', NULL, 'United Kingdom', 'Europe', 'EGPK', 'PIK', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(73, 1, 0, 'London Stn', NULL, 'United Kingdom', 'Europe', 'EGSS', 'STN', 'D', 'D', 'D', 'A2', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(74, 1, 0, 'Amsterdam', NULL, 'The Netherlands', 'Europe', 'EHAM', 'AMS', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(75, 1, 0, 'Maastricht', NULL, 'The Netherlands', 'Europe', 'EHBK', 'MST', 'A2', 'A2', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(76, 1, 0, 'Dublin', NULL, 'Ireland', 'Europe', 'EIDW', 'DUB', 'D', 'D', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(77, 1, 0, 'Shannon', NULL, 'Ireland', 'Europe', 'EINN', 'SNN', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(78, 1, 0, 'Billund', NULL, 'Denmark', 'Europe', 'EKBI', 'BLL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(79, 1, 0, 'Copenhagen', NULL, 'Denmark', 'Europe', 'EKCH', 'CPH', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(80, 1, 0, 'Luxembourg', NULL, 'Luxembourg', 'Europe', 'ELLX', 'LUX', 'A1', 'A1', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(81, 1, 0, 'Bodo', NULL, 'Norway', 'Europe', 'ENBO', 'BOO', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(82, 1, 0, 'Bergen', NULL, 'Norway', 'Europe', 'ENBR', 'BGO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(83, 1, 0, 'Oslo', NULL, 'Norway', 'Europe', 'ENGM', 'OSL', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(84, 1, 0, 'Svalbarad Longyear', NULL, 'Norway', 'Europe', 'ENSB', 'LYR', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 3, 0, 0),
(85, 1, 0, 'Trondheim', NULL, 'Norway', 'Europe', 'ENVA', 'TRD', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(86, 1, 0, 'Stavanger', NULL, 'Norway', 'Europe', 'ENZV', 'SVG', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(87, 1, 0, 'Gdansk', NULL, 'Poland', 'Europe', 'EPGD', 'GDN', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(88, 1, 0, 'Poznan', NULL, 'Poland', 'Europe', 'EPPO', 'POZ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(89, 1, 0, 'Warsaw', NULL, 'Poland', 'Europe', 'EPWA', 'WAW', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(90, 1, 0, 'Goteborg', NULL, 'Sweden', 'Europe', 'ESGG', 'GOT', 'A1', 'A1', 'D', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(91, 1, 0, 'Malmo', NULL, 'Sweden', 'Europe', 'ESMS', 'MMX', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(92, 1, 0, 'Stockholm', NULL, 'Sweden', 'Europe', 'ESSA', 'ARN', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 2, 0, 0),
(93, 1, 0, 'Riga', NULL, 'Latvia', 'Europe', 'EVRA', 'RIX', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(94, 1, 0, 'Vilnius', NULL, 'Lithuania', 'Europe', 'EYVI', 'VNO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(95, 1, 0, 'Bloemfontein', NULL, 'South Africa', 'Africa', 'FABL', 'BFN', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(96, 1, 0, 'Capetown', NULL, 'South Africa', 'Africa', 'FACT', 'CPT', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 1, 0, 0),
(97, 1, 0, 'Durban', NULL, 'South Africa', 'Africa', 'FALE', 'DUR', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(98, 1, 0, 'Johanseburg', NULL, 'South Africa', 'Africa', 'FAOR', 'JNB', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(99, 1, 0, 'Gaborone', NULL, 'Botswana', 'Africa', 'FBSK', 'GBE', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(100, 1, 0, 'Brazzaville', NULL, 'Republic Of Congo', 'Africa', 'FCBB', 'BZV', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(101, 1, 0, 'Bangui', NULL, 'Central African Republic', 'Africa', 'FEFF', 'BGF', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(102, 1, 0, 'Ascension Is', NULL, 'United Kingdom', 'Africa', 'FHAW', 'ASI', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(103, 1, 0, 'Mauritius', NULL, 'Mauritius', 'Africa', 'FIMP', 'MRU', 'D', 'D', 'D', 'D', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(104, 1, 0, 'Diego Garcia', NULL, 'United Kingdom', 'Asia', 'FJDG', 'NKW', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(105, 1, 0, 'Douala', NULL, 'Cameroon', 'Africa', 'FKKD', 'DLA', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(106, 1, 0, 'Yaounde Nsimalen', NULL, 'Cameroon', 'Africa', 'FKYS', 'NSI', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(107, 1, 0, 'Lusaka', NULL, 'Zambia', 'Africa', 'FLKK', 'LUN', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:12', '2019-09-05 07:59:12', 'everyone', 1, 0, 0, 0),
(108, 1, 0, 'St Denis Reunion', NULL, 'France', 'Africa', 'FMEE', 'RUN', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(109, 1, 0, 'Antananarivo', NULL, 'Madagascar', 'Africa', 'FMMI', 'TNR', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(110, 1, 0, 'Luanda', NULL, 'Angola', 'Africa', 'FNLU', 'LAD', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(111, 1, 0, 'Libreville', NULL, 'Gabon', 'Africa', 'FOOL', 'LBV', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(112, 1, 0, 'Beira', NULL, 'Mozambique', 'Africa', 'FQBR', 'BEW', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(113, 1, 0, 'Maputo', NULL, 'Mozambique', 'Africa', 'FQMA', 'MPM', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(114, 1, 0, 'Seychelles', NULL, 'Seychelles', 'Africa', 'FSIA', 'SEZ', 'D', 'D', 'D', 'EA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 1, 0, 0),
(115, 1, 0, 'N\'djamena', NULL, 'Chad', 'Africa', 'FTTJ', 'NDJ', 'A1', 'A2', 'D', 'EA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(116, 1, 0, 'Victoria Falls', NULL, 'Zimbabwe', 'Africa', 'FVFA', 'VFA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(117, 1, 0, 'Harare', NULL, 'Zimbabwe', 'Africa', 'FVRG', 'HRE', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(118, 1, 0, 'Lilongwe / Kamuzu Intl', NULL, 'Malawi', 'Africa', 'FWKI', 'LLW', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(119, 1, 0, 'Windhoek Hosea Kutako', NULL, 'Namibia', 'Africa', 'FYWH', 'WDH', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(120, 1, 0, 'Kisangani / Bangoka', NULL, 'Democratic Republic Of Congo', 'Africa', 'FZIC', 'FKI', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(121, 1, 0, 'Banjul', NULL, 'Gambia', 'Africa', 'GBYD', 'BJL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(122, 1, 0, 'Gran Canaria / Las Palmas', NULL, 'Gran Canaria', 'Europe', 'GCLP', 'LPA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(123, 1, 0, 'Monrovia', NULL, 'Liberia', 'Africa', 'GLRB', 'ROB', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(124, 1, 0, 'Agadir Al Massira', NULL, 'Marocco', 'Africa', 'GMAD', 'AGA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 1, 0, 0),
(125, 1, 0, 'Fez', NULL, 'Marocco', 'Africa', 'GMFF', 'FEZ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(126, 1, 0, 'Rabat', NULL, 'Marocco', 'Africa', 'GMME', 'RBA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(127, 1, 0, 'Casablanca', NULL, 'Marocco', 'Africa', 'GMMN', 'CMN', 'D', 'D', 'D', 'D', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(128, 1, 0, 'Marrakech', NULL, 'Marocco', 'Africa', 'GMMX', 'RAK', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(129, 1, 0, 'Dakar', NULL, 'Senegal', 'Africa', 'GOBD', 'DSS', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(130, 1, 0, 'Nouakchott', NULL, 'Mauritania', 'Africa', 'GQNO', 'NKC', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(131, 1, 0, 'Conakry', NULL, 'Guinea', 'Africa', 'GUCY', 'CKY', 'D', 'D', 'D', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(132, 1, 0, 'Sal Amilcar Cabral', NULL, 'Cabo Verde', 'Africa', 'GVAC', 'SID', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(133, 1, 0, 'Addis Ababa', NULL, 'Ethiopia', 'Africa', 'HAAB', 'ADD', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(134, 1, 0, 'Djibouti', NULL, 'Djibouti', 'Africa', 'HDAM', 'JIB', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(135, 1, 0, 'Alexandria Borg El Arab', NULL, 'Egypt', 'Africa', 'HEBA', 'HBE', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(136, 1, 0, 'Cairo', NULL, 'Egypt', 'Africa', 'HECA ', 'CAI', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(137, 1, 0, 'Hurghada', NULL, 'Egypt', 'Africa', 'HEGN', 'HRG', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(138, 1, 0, 'Luxor', NULL, 'Egypt', 'Africa', 'HELX', 'LXR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(139, 1, 0, 'Sharm El Sheikh', '', 'Egypt', 'Africa', 'HESH', 'SSH', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:13', '2019-09-25 15:07:25', 'everyone', 1, 1, 0, 0),
(140, 1, 0, 'Aswan', NULL, 'Egypt', 'Africa', 'HESN', 'ASW', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(141, 1, 0, 'Asmara', NULL, 'Eritrea', 'Africa', 'HHAS', 'ASM', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(142, 1, 0, 'Eldoret', NULL, 'Kenya', 'Africa', 'HKEL', 'EDL', 'CA', 'CA', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(143, 1, 0, 'Nairobi', NULL, 'Kenya', 'Africa', 'HKJK', 'NBO', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(144, 1, 0, 'Mombasa', NULL, 'Kenya', 'Africa', 'HKMO', 'MBA ', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(145, 1, 0, 'Kigali', NULL, 'Rwanda', 'Africa', 'HRYR', 'KGL', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(146, 1, 0, 'Port Sudan', NULL, 'Sudan', 'Africa', 'HSPN', 'PZU ', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(147, 1, 0, 'Juba', NULL, 'South Sudan', 'Africa', 'HSSJ', 'JUB', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(148, 1, 0, 'Khartoum', NULL, 'Sudan', 'Africa', 'HSSS', 'KRT', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(149, 1, 0, 'Dar Es Salam', NULL, 'Tanzania', 'Africa', 'HTDA', 'DAR', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(150, 1, 0, 'Kilamanjaro', NULL, 'Tanzania', 'Africa', 'HTKJ', 'JRO', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(151, 1, 0, 'Zanizbar', NULL, 'Tanzania', 'Africa', 'HTZA', 'ZNZ', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(152, 1, 0, 'Entebbe', NULL, 'Uganda', 'Africa', 'HUEN', 'EBB', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(153, 1, 0, 'Aluquerque', NULL, 'United States', 'North America', 'KABQ', 'ABQ', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(154, 1, 0, 'Atlanta Hartsfield', NULL, 'United States', 'North America', 'KATL', 'ATL', 'A2', 'A2', 'D', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 1, 0, 0),
(155, 1, 0, 'Austin Bergstrom', NULL, 'United States', 'North America', 'KAUS', 'AUS', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(156, 1, 0, 'Windsor Lock', NULL, 'United States', 'North America', 'KBDL', 'BDL', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(157, 1, 0, 'Bangor', NULL, 'United States', 'North America', 'KBGR', 'BGR', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(158, 1, 0, 'Billings', NULL, 'United States', 'North America', 'KBIL', 'BIL', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(159, 1, 0, 'Nashville Int', NULL, 'United States', 'North America', 'KBNA', 'BNA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(160, 1, 0, 'Boise', NULL, 'United States', 'North America', 'KBOI', 'BOI', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(161, 1, 0, 'Boston', NULL, 'United States', 'North America', 'KBOS', 'BOS', 'D', 'D', 'D', 'D', '2019-09-05 07:59:13', '2019-09-05 07:59:13', 'everyone', 1, 0, 0, 0),
(162, 1, 0, 'Buffalo Niagara ', NULL, 'United States', 'North America', 'KBUF', 'BUF', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(163, 1, 0, 'Baltimore', NULL, 'United States', 'North America', 'KBWI', 'BWI ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(164, 1, 0, 'Cleveland', NULL, 'United States', 'North America', 'KCLE', 'CLE', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(165, 1, 0, 'Charlotte Douglas', NULL, 'United States', 'North America', 'KCLT', 'CLT', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(166, 1, 0, 'Casper', NULL, 'United States', 'North America', 'KCPR', 'CPR', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(167, 1, 0, 'Convington Cincinnati', NULL, 'United States', 'North America', 'KCVG', 'CVG', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(168, 1, 0, 'Kallas Love', NULL, 'United States', 'North America', 'KDAL', 'DAL', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(169, 1, 0, 'Denver', NULL, 'United States', 'North America', 'KDEN', 'DEN', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(170, 1, 0, 'Dallas Fortworth', NULL, 'United States', 'North America', 'KDFW', 'DFW', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(171, 1, 0, 'Detroit', NULL, 'United States', 'North America', 'KDTW', 'DTW', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(172, 1, 0, 'Newark', NULL, 'United States', 'North America', 'KEWR ', 'EWR', 'D', 'D', 'D', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 1, 0, 0),
(173, 1, 0, 'Fort Lauderdale', NULL, 'United States', 'North America', 'KFLL', 'FLL', 'D', 'D', 'D', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 46, 0, 0),
(174, 1, 0, 'Krand Canyon', NULL, 'United States', 'North America', 'KGCN', 'GCN', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(175, 1, 0, 'Spokane', NULL, 'United States', 'North America', 'KGEG', 'GEG', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(176, 1, 0, 'Washington', NULL, 'United States', 'North America', 'KIAD', 'IAD', 'D', 'D', 'D', 'D', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(177, 1, 0, 'Niagara Falls', NULL, 'United States', 'North America', 'KIAG', 'IAG', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(178, 1, 0, 'Houston', NULL, 'United States', 'North America', 'KIAH', 'IAH', 'D', 'D', 'D', 'D', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(179, 1, 0, 'New York', NULL, 'United States', 'North America', 'KJFK', 'JFK', 'D', 'D', 'D', 'D', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(180, 1, 0, 'Las Vegas', NULL, 'United States', 'North America', 'KLAS', 'LAS', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(181, 1, 0, 'Los Angeles', NULL, 'United States', 'North America', 'KLAX', 'LAX', 'D', 'D', 'D', 'D', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(182, 1, 0, 'Columbus Rickenbacker', NULL, 'United States', 'North America', 'KLCK', 'LCK', 'CA', 'CA', 'D', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(183, 1, 0, 'Long Beach', NULL, 'United States', 'North America', 'KLGB', 'LGB', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(184, 1, 0, 'Kansas City', NULL, 'United States', 'North America', 'KMCI', 'MCI', 'A1', 'A1', 'A1', 'A2', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(185, 1, 0, 'Orlando', NULL, 'United States', 'North America', 'KMCO', 'MCO', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(186, 1, 0, 'Memphis Intl', NULL, 'United States', 'North America', 'KMEM', 'MEM', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(187, 1, 0, 'Medford', NULL, 'United States', 'North America', 'KMFR', 'MFR', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(188, 1, 0, 'Miami', NULL, 'United States', 'North America', 'KMIA', 'MIA', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(189, 1, 0, 'Milwaukee', NULL, 'United States', 'North America', 'KMKE', 'MKE', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(190, 1, 0, 'Minneapolis St Paul', NULL, 'United States', 'North America', 'KMSP', 'MSP', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 4, 0, 0),
(191, 1, 0, 'New Orleans', NULL, 'United States', 'North America', 'KMSY', 'MSY', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(192, 1, 0, 'Moses Lake ', NULL, 'United States', 'North America', 'KMWH', 'MWH', 'CA', 'CA', 'CA', 'EA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(193, 1, 0, 'Oakland', NULL, 'United States', 'North America', 'KOAK', 'OAK', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(194, 1, 0, 'Oklahoma City', NULL, 'United States', 'North America', 'KOKC', 'OKC', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(195, 1, 0, 'Ontario', NULL, 'United States', 'North America', 'KONT', 'ONT', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 1, 0, 0),
(196, 1, 0, 'Chicago', NULL, 'United States', 'North America', 'KORD', 'ORD', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 60, 0, 0),
(197, 1, 0, 'Norfolk', NULL, 'United States', 'North America', 'KORF', 'ORF', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(198, 1, 0, 'Everett', NULL, 'United States', 'North America', 'KPAE', 'PAE', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(199, 1, 0, 'West Palm Beach', NULL, 'United States', 'North America', 'KPBI', 'PBI', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(200, 1, 0, 'Portland', NULL, 'United States', 'North America', 'KPDX', 'PDX', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(201, 1, 0, 'Philadelphia', NULL, 'United States', 'North America', 'KPHL', 'PHL', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(202, 1, 0, 'Phoenix', NULL, 'United States', 'North America', 'KPHX', 'PHX', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(203, 1, 0, 'Pocatello', NULL, 'United States', 'North America', 'KPIH', 'PIH', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(204, 1, 0, 'Pittsburgh', NULL, 'United States', 'North America', 'KPIT', 'PIT', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(205, 1, 0, 'Raleigh / Durham ', NULL, 'United States', 'North America', 'KRDU', 'RDU', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(206, 1, 0, 'Richmond', NULL, 'United States', 'North America', 'KRIC', 'RIC', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(207, 1, 0, 'Reno', NULL, 'United States', 'North America', 'KRNO', 'RNO', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(208, 1, 0, 'Fort Mayers ', NULL, 'United States', 'North America', 'KRSW', 'RSW', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(209, 1, 0, 'Taipei', NULL, 'Taiwan', 'As', 'RCTP', 'TPE', 'D', 'D', 'D', 'D', '2019-09-05 07:59:14', '2019-09-05 07:59:14', 'everyone', 1, 0, 0, 0),
(210, 1, 0, 'San Diego', NULL, 'United States', 'North America', 'KSAN ', 'SAN', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(211, 1, 0, 'San Antonio', NULL, 'United States', 'North America', 'KSAT ', 'SAT', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(212, 1, 0, 'Louisville', NULL, 'United States', 'North America', 'KSDF', 'SDF', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(213, 1, 0, 'Seattle', NULL, 'United States', 'North America', 'KSEA', 'SEA', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(214, 1, 0, 'San Francisco', NULL, 'United States', 'North America', 'KSFO', 'SFO', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(215, 1, 0, 'San Jose', NULL, 'United States', 'North America', 'KSJC', 'SJC', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(216, 1, 0, 'Salt Lake City', NULL, 'United States', 'North America', 'KSLC', 'SLC', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(217, 1, 0, 'Sacramento', NULL, 'United States', 'North America', 'KSMF', 'SMF', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(218, 1, 0, 'St. Louis', NULL, 'United States', 'North America', 'KSTL', 'STL', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(219, 1, 0, 'Newburgh', NULL, 'United States', 'North America', 'KSWF', 'SWF', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(220, 1, 0, 'Tampa', NULL, 'United States', 'North America', 'KTPA', 'TPA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(221, 1, 0, 'Tulsa', NULL, 'United States', 'North America', 'KTUL', 'TUL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(222, 1, 0, 'Burgas', NULL, 'Bulgaria', 'Europe', 'LBBG', 'BOJ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(223, 1, 0, 'Sofia', NULL, 'Bulgaria', 'Europe', 'LBSF', 'SOF', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 1, 0, 0),
(224, 1, 0, 'Varna', NULL, 'Bulgaria', 'Europe', 'LBWN', 'VAR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(225, 1, 0, 'Larnaca', NULL, 'Cyprus', 'Europe', 'LCLK', 'LCA', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(226, 1, 0, 'Pafos', NULL, 'Cyprus', 'Europe', 'LCPH', 'PFO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(227, 1, 0, 'Zagreb', NULL, 'Croatia', 'Europe', 'LDZA', 'ZAG', 'D', 'D', 'D', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(228, 1, 0, 'Alicante', NULL, 'Spain', 'Europe', 'LEAL', 'ALC', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(229, 1, 0, 'Barcelona', NULL, 'Spain', 'Europe', 'LEBL', 'BCN', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(230, 1, 0, 'Girona', NULL, 'Spain', 'Europe', 'LEGE', 'GRO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(231, 1, 0, 'Ibiza', NULL, 'Spain', 'Europe', 'LEIB', 'IBZ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 1, 0, 0),
(232, 1, 0, 'Madrid', NULL, 'Spain', 'Europe', 'LEMD', 'MAD', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 2, 0, 0),
(233, 1, 0, 'Malaga', NULL, 'Spain', 'Europe', 'LEMG', 'AGP', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(234, 1, 0, 'Palma De Mallorca', NULL, 'Spain', 'Europe', 'LEPA', 'PMI', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(235, 1, 0, 'Santiago De Composte', NULL, 'Spain', 'Europe', 'LEST', 'SCQ', 'A1', 'A1', 'D', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(236, 1, 0, 'Valencia', NULL, 'Spain', 'Europe', 'LEVC', 'VLC', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(237, 1, 0, 'Zaragoza', NULL, 'Spain', 'Europe', 'LEZG', 'ZAZ', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(238, 1, 0, 'Bordeauz', '', 'France', 'Europe', 'LFBD', 'BOD', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-25 15:12:22', 'everyone', 1, 0, 0, 0),
(239, 1, 0, 'Toulouse', NULL, 'France', 'Europe', 'LFBO', 'TLS', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(240, 1, 0, 'Lyon', NULL, 'France', 'Europe', 'LFLL', 'LYS', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(241, 1, 0, 'Nice', NULL, 'France', 'Europe', 'LFMN', 'NCE', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(242, 1, 0, 'Paris Cdg', NULL, 'France', 'Europe', 'LFPG', 'CDG', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 1, 0, 0),
(243, 1, 0, 'Paris Orly', NULL, 'France', 'Europe', 'LFPO', 'ORY', 'A1', 'A1', 'A1', 'A2', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(244, 1, 0, 'Lille', NULL, 'France', 'Europe', 'LFQQ', 'LIL', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(245, 1, 0, 'Brest', NULL, 'France', 'Europe', 'LFRB', 'BES', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(246, 1, 0, 'Basle', NULL, 'France', 'Europe', 'LFSB', 'BSL', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(247, 1, 0, 'Athens', NULL, 'Greece', 'Europe', 'LGAV', 'ATH', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(248, 1, 0, 'Iraklion', NULL, 'Greece', 'Europe', 'LGIR', 'HER', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(249, 1, 0, 'Rodos', NULL, 'Greece', 'Europe', 'LGRP', 'RHO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(250, 1, 0, 'Thessaloniki', NULL, 'Greece', 'Europe', 'LGTS', 'SKG', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(251, 1, 0, 'Budapest', NULL, 'Hungary', 'Europe', 'LHBP', 'BUD', 'D', 'D', 'D', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(252, 1, 0, 'Brindisi', NULL, 'Italy', 'Europe', 'LIBR', 'BDS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(253, 1, 0, 'Olbia', NULL, 'Italy', 'Europe', 'LIEO', 'OLB', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(254, 1, 0, 'Milan Malpensa', NULL, 'Italy', 'Europe', 'LIMC', 'MXP', 'D', 'D', 'D', 'D', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(255, 1, 0, 'Bergamo', NULL, 'Italy', 'Europe', 'LIME', 'BGY', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(256, 1, 0, 'Torino', NULL, 'Italy', 'Europe', 'LIMF', 'TRN', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(257, 1, 0, 'Bologna', NULL, 'Italy', 'Europe', 'LIPE', 'BLQ', 'D', 'D', 'D', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(258, 1, 0, 'Trieste', NULL, 'Italy', 'Europe', 'LIPQ', 'TRS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:15', '2019-09-05 07:59:15', 'everyone', 1, 0, 0, 0),
(259, 1, 0, 'Venice', NULL, 'Italy', 'Europe', 'LIPZ', 'VCE', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(260, 1, 0, 'Rome Cia', NULL, 'Italy', 'Europe', 'LIRA', 'CIA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(261, 1, 0, 'Rome Fco', NULL, 'Italy', 'Europe', 'LIRF', 'FCO', 'D', 'D', 'D', 'D', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(262, 1, 0, 'Naples', NULL, 'Italy', 'Europe', 'LIRN', 'NAP', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(263, 1, 0, 'Pisa', NULL, 'Italy', 'Europe', 'LIRP', 'PSA', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(264, 1, 0, 'Ljubljana ', NULL, 'Slovenia', 'Europe', 'LJLJ', 'LJU', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 1, 0, 0),
(265, 1, 0, 'Ostrava', NULL, 'Slovakia', 'Europe', 'LKMT', 'OSR', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(266, 1, 0, 'Prague', NULL, 'Slovakia', 'Europe', 'LKPR', 'PRG', 'D', 'D', 'D', 'D', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(267, 1, 0, 'Brno', NULL, 'Slovakia', 'Europe', 'LKTB', 'BRQ', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(268, 1, 0, 'Malta', NULL, 'Malta', 'Europe', 'LMML', 'MLA', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(269, 1, 0, 'Graz', NULL, 'Austria', 'Europe', 'LOWG', 'GRZ', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(270, 1, 0, 'Linz', NULL, 'Austria', 'Europe', 'LOWL ', 'LNZ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(271, 1, 0, 'Vienna', NULL, 'Austria', 'Europe', 'LOWW', 'VIE', 'D', 'D', 'D', 'D', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(272, 1, 0, 'Santa Maria', NULL, 'Portugal', 'Europe', 'LPAZ', 'SMA', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(273, 1, 0, 'Beja', NULL, 'Portugal', 'Europe', 'LPBJ', 'BYJ', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(274, 1, 0, 'Faro', NULL, 'Portugal', 'Europe', 'LPFR', 'FAO', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(275, 1, 0, 'Lajes', NULL, 'Portugal', 'Europe', 'LPLA', 'TER', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(276, 1, 0, 'Ponto Delgada', NULL, 'Portugal', 'Europe', 'LPPD', 'PDL', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(277, 1, 0, 'Porto', NULL, 'Portugal', 'Europe', 'LPPR', 'OPO', 'D', 'D', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(278, 1, 0, 'Porto Santo', NULL, 'Portugal', 'Europe', 'LPPS', 'PXO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(279, 1, 0, 'Lisbon', NULL, 'Portugal', 'Europe', 'LPPT', 'LIS', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(280, 1, 0, 'Bucharest', NULL, 'Romania', 'Europe', 'LROP', 'OTP', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(281, 1, 0, 'Geneva', NULL, 'Switzerland', 'Europe', 'LSGG', 'GVA', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(282, 1, 0, 'Zurich', NULL, 'Switzerland', 'Europe', 'LSZH', 'ZRH', 'D', 'D', 'D', 'D', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(283, 1, 0, 'Ankara', NULL, 'Turkey', 'Europe', 'LTAC', 'ESB', 'A1', 'A1', 'A1', 'EA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(284, 1, 0, 'Adana', NULL, 'Turkey', 'Europe', 'LTAF', 'ADA', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(285, 1, 0, 'Antalya', NULL, 'Turkey', 'Europe', 'LTAI', 'AYT', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(286, 1, 0, 'Konya', NULL, 'Turkey', 'Europe', 'LTAN', 'KYA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(287, 1, 0, 'Izmir', NULL, 'Turkey', 'Europe', 'LTBJ', 'ADB', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(288, 1, 0, 'Elazig', NULL, 'Turkey', 'Europe', 'LTCA', 'IZD', 'A1', 'A1', 'A1', 'EA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 8, 0, 0),
(289, 1, 0, 'Erzurum', NULL, 'Turkey', 'Europe', 'LTCE', 'ERZ', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(290, 1, 0, 'Trabzon', NULL, 'Turkey', 'Europe', 'LTCG', 'TZX', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(291, 1, 0, 'Samsun', NULL, 'Turkey', 'Europe', 'LTFH', 'SZF', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(292, 1, 0, 'Istanbul Saw', NULL, 'Turkey', 'Europe', 'LTFJ', 'SAW', 'D', 'D', 'D', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(293, 1, 0, 'Istanbul Ist', NULL, 'Turkey', 'Europe', 'LTFM', 'IST', 'D', 'D', 'D', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(294, 1, 0, 'Chisinau', NULL, 'Moldova', 'Europe', 'LUKK', 'KIV', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(295, 1, 0, 'Belgrade', NULL, 'Serbia', 'Europe', 'LYBE', 'BEG', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 1, 0, 0),
(296, 1, 0, 'Providenciales', NULL, 'United Kingdom', 'South America', 'MBPV', 'PLS', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(297, 1, 0, 'Higuey', NULL, 'Dominican Republic', 'South America', 'MDPC', 'PUJ', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(298, 1, 0, 'Santo Domingo', NULL, 'Dominican Republic', 'South America', 'MDSD', 'SDQ', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(299, 1, 0, 'Kingston', NULL, 'Mexico', 'South America', 'MKJP', 'KIN', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(300, 1, 0, 'Acapulco', NULL, 'Mexico', 'South America', 'MMAA', 'ACA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(301, 1, 0, 'Chihuahua', NULL, 'Mexico', 'South America', 'MMCU', 'CUU', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(302, 1, 0, 'Guadalajara', NULL, 'Mexico', 'South America', 'MMGL', 'GDL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(303, 1, 0, 'Mexico City', NULL, 'Mexico', 'South America', 'MMMX', 'MEX', 'A1', 'A1', 'D', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(304, 1, 0, 'Monterrey', NULL, 'Mexico', 'South America', 'MMMY', 'MTY', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:16', '2019-09-05 07:59:16', 'everyone', 1, 0, 0, 0),
(305, 1, 0, 'Puebla', NULL, 'Mexico', 'South America', 'MMPB', 'PBC', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(306, 1, 0, 'Rueretaro', NULL, 'Mexico', 'South America', 'MMQT', 'QRO', 'A1', 'CA', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(307, 1, 0, 'Cancun', NULL, 'Mexico', 'South America', 'MMUN', 'CUN', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0);
INSERT INTO `engine4_airport_airports` (`airport_id`, `owner_id`, `photo_id`, `title`, `description`, `country`, `region`, `icao`, `iata`, `777_200lr`, `777_300er`, `777f`, `a380`, `creation_date`, `modified_date`, `view_privacy`, `search`, `view_count`, `like_count`, `comment_count`) VALUES
(308, 1, 0, 'Balboa', NULL, 'Panama', 'South America', 'MPPA', 'BLB', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(309, 1, 0, 'Rio Hato', NULL, 'Panama', 'South America', 'MPSM', 'RIH', 'CA', 'EA', 'EA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(310, 1, 0, 'Panama City', NULL, 'Panama', 'South America', 'MPTO', 'PTY', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(311, 1, 0, 'San Salvador', NULL, 'El Salvador', 'South America', 'MSLP', 'SAL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(312, 1, 0, 'Freeport', NULL, 'The Bahamas', 'South America', 'MYGF', 'FPO', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(313, 1, 0, 'Nassau', NULL, 'The Bahamas', 'South America', 'MYNN', 'NAS', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(314, 1, 0, 'Rarotonga Intl', NULL, 'Cook Islands', 'South America', 'NCRG', 'RAR', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(315, 1, 0, 'Nadi Intl', NULL, 'Fiji', 'Oceania', 'NFFN', 'NAN', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(316, 1, 0, 'Nuku Alofa', NULL, 'Fiji', 'Oceania', 'NFTF', 'TBU', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(317, 1, 0, 'Tarawa', NULL, 'Republic Of Kiribati', 'Oceania', 'NGTA', 'TRW', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 2, 0, 0),
(318, 1, 0, 'Niue Island', NULL, 'Niue', 'Oceania', 'NIUE', 'IUE', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(319, 1, 0, 'Apia', NULL, 'Samoa', 'Oceania', 'NSFA', 'APW', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(320, 1, 0, 'Pago Pago', NULL, 'Samoa', 'Oceania', 'NSTU', 'PPG', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(321, 1, 0, 'Tahiti', NULL, 'Tahiti', 'Oceania', 'NTAA', 'PPT', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(322, 1, 0, 'Port Vila', NULL, 'Vanuatu', 'Oceania', 'NVVV', 'VLI', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(323, 1, 0, 'Noumea Tontouta', NULL, 'France', 'Oceania', 'NWWW', 'NOU', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(324, 1, 0, 'Auckland', NULL, 'New Zealand', 'Oceania', 'NZAA', 'AKL', 'D', 'D', 'D', 'D', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(325, 1, 0, 'Christchurch', NULL, 'New Zealand', 'Oceania', 'NZCH', 'CHC', 'D', 'D', 'D', 'D', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(326, 1, 0, 'Ohakea', NULL, 'New Zealand', 'Oceania', 'NZOH', 'OHA', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(327, 1, 0, 'Wellington', NULL, 'New Zealand', 'Oceania', 'NZWN', 'WLG', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(328, 1, 0, 'Kabul', NULL, 'Afghanisatan', 'Asia', 'OAKB', 'KBL', 'D', 'D', 'D', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 4, 0, 0),
(329, 1, 0, 'Bahrain', NULL, 'Bahrain', 'Middle East', 'OBBI', 'BAH', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(330, 1, 0, 'Dammam', NULL, 'Saudi Arabia', 'Middle East', 'OEDF', 'DMM', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(331, 1, 0, 'Gassim', NULL, 'Saudi Arabia', 'Middle East', 'OEGS', 'ELQ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(332, 1, 0, 'Jeddah', NULL, 'Saudi Arabia', 'Middle East', 'OEJN', 'JED', 'D', 'D', 'D', 'D', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(333, 1, 0, 'Madinah', NULL, 'Saudi Arabia', 'Middle East', 'OEMA', 'MED', 'D', 'D', 'D', 'D', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(334, 1, 0, 'Riyadh', NULL, 'Saudi Arabia', 'Middle East', 'OERK', 'RUH', 'D', 'D', 'D', 'D', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(335, 1, 0, 'Taif', NULL, 'Saudi Arabia', 'Middle East', 'OETF', 'TIF', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(336, 1, 0, 'Turaif', NULL, 'Saudi Arabia', 'Middle East', 'OETR', 'TUI', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(337, 1, 0, 'Bushehr', NULL, 'Iran', 'Middle East', 'OIBB', 'BUZ', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(338, 1, 0, 'Kermanshah', NULL, 'Iran', 'Middle East', 'OICC', 'KSH', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(339, 1, 0, 'Esfahan', NULL, 'Iran', 'Middle East', 'OIFM', 'IFN', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(340, 1, 0, 'Teheran Ika', NULL, 'Iran', 'Middle East', 'OIIE', 'IKA', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 1, 0, 0),
(341, 1, 0, 'Teheran Thr', NULL, 'Iran', 'Middle East', 'OIII', 'THR', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(342, 1, 0, 'Kerman ', NULL, 'Iran', 'Middle East', 'OIKK ', 'KER', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(343, 1, 0, 'Mashad', NULL, 'Iran', 'Middle East', 'OIMM', 'MHD', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(344, 1, 0, 'Shiraz', NULL, 'Iran', 'Middle East', 'OISS', 'SYZ', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(345, 1, 0, 'Uromiyeh', NULL, 'Iran', 'Middle East', 'OITR', 'OMH', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(346, 1, 0, 'Tabriz', NULL, 'Iran', 'Middle East', 'OITT', 'TBZ', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 1, 0, 0),
(347, 1, 0, 'Yazd', NULL, 'Iran', 'Middle East', 'OIYY', 'AZD', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(348, 1, 0, 'Amman Q\'alia', NULL, 'Jordan', 'Middle East', 'OJAI', 'AMM', 'D', 'D', 'D', 'D', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(349, 1, 0, 'Amman Marka ', NULL, 'Jordan', 'Middle East', 'OJAM', 'ADJ', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(350, 1, 0, 'Aqaba', NULL, 'Jordan', 'Middle East', 'OJAQ', 'AQJ', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(351, 1, 0, 'Kuwait', NULL, 'Kuwait', 'Middle East', 'OKBK', 'KWI', 'D', 'D', 'D', 'EA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 0, 0, 0),
(352, 1, 0, 'Beirut', NULL, 'Lebanon', 'Middle East', 'OLBA', 'BEY', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:17', '2019-09-05 07:59:17', 'everyone', 1, 1, 0, 0),
(353, 1, 0, 'Abu Dhabi', NULL, 'United Arab Emirates', 'Middle East', 'OMAA', 'AUH', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(354, 1, 0, 'Al Ain', NULL, 'United Arab Emirates', 'Middle East', 'OMAL', 'AAN', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(355, 1, 0, 'Dubai', NULL, 'United Arab Emirates', 'Middle East', 'OMDB', 'DXB', 'D', 'D', 'D', 'D', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 11, 0, 0),
(356, 1, 0, 'Minhad', NULL, 'United Arab Emirates', 'Middle East', 'OMDM', 'NHD', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(357, 1, 0, 'Dubai World', NULL, 'United Arab Emirates', 'Middle East', 'OMDW', 'DWC', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(358, 1, 0, 'Fujairah', NULL, 'United Arab Emirates', 'Middle East', 'OMFJ', 'FJR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(359, 1, 0, 'Ras Al Khaimah', NULL, 'United Arab Emirates', 'Middle East', 'OMRK', 'RKT', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(360, 1, 0, 'Sharjah', NULL, 'United Arab Emirates', 'Middle East', 'OMSJ', 'SHJ', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(361, 1, 0, 'Muscat', NULL, 'Oman', 'Middle East', 'OOMS', 'MCT', 'D', 'D', 'D', 'D', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(362, 1, 0, 'Salalah', NULL, 'Oman', 'Middle East', 'OOSA', 'SLL', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 1, 0, 0),
(363, 1, 0, 'Suhar', NULL, 'Oman', 'Middle East', 'OOSH', 'OHS', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(364, 1, 0, 'Islamabad', NULL, 'Pakistan', 'Middle East', 'OPIS', 'ISB', 'D', 'D', 'D', 'D', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(365, 1, 0, 'Karachi', NULL, 'Pakistan', 'Middle East', 'OPKC', 'KHI', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(366, 1, 0, 'Lahore', NULL, 'Pakistan', 'Middle East', 'OPLA', 'LHE', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 10, 0, 0),
(367, 1, 0, 'Multan', NULL, 'Pakistan', 'Middle East', 'OPMT', 'MUX', 'D', 'D', 'D', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(368, 1, 0, 'Nawabshah', NULL, 'Pakistan', 'Middle East', 'OPNH', 'WNS', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(369, 1, 0, 'Peshawar', NULL, 'Pakistan', 'Middle East', 'OPPS ', 'PEW', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(370, 1, 0, 'Sialkot', NULL, 'Pakistan', 'Middle East', 'OPST', 'SKT', 'D', 'D', 'D', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(371, 1, 0, 'Baghdad', NULL, 'Iraq', 'Middle East', 'ORBI', 'BGW', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(372, 1, 0, 'Erbil', NULL, 'Iraq', 'Middle East', 'ORER', 'EBL', 'EA', 'EA', 'D', 'EA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(373, 1, 0, 'Basrah', NULL, 'Iraq', 'Middle East', 'ORMM', 'BSR', 'D', 'D', 'D', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(374, 1, 0, 'Sulaymaniyah', NULL, 'Iraq', 'Middle East', 'ORSU', 'ISU', '', '', 'D', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(375, 1, 0, 'Doha Intl', NULL, 'Qatar', 'Middle East', 'OTBD', 'XXD', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(376, 1, 0, 'Doha Hamad Intl', NULL, 'Qatar', 'Middle East', 'OTHH', 'DOH', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(377, 1, 0, 'Cold Bay', NULL, 'United States', 'North America', 'PACD', 'CDB', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(378, 1, 0, 'Anchorage Elmendorf Afb', NULL, 'United States', 'North America', 'PAED', 'EDF', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(379, 1, 0, 'Fairbanks', NULL, 'United States', 'North America', 'PAFA', 'FAI', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(380, 1, 0, 'King Salmon', NULL, 'United States', 'North America', 'PAKN', 'AKN', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(381, 1, 0, 'Anchorage Ted Stevens', NULL, 'United States', 'North America', 'PANC', 'ANC', 'A1', 'A1', 'D', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(382, 1, 0, 'Shemya /eareckson', NULL, 'United States', 'North America', 'PASY', 'SYA', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(383, 1, 0, 'Saipan Island', NULL, 'Mariana Islands', 'Oceania', 'PGSN', 'SPN', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(384, 1, 0, 'Agana Guam', NULL, 'Guam', 'Oceania', 'PGUM', 'GUM', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(385, 1, 0, 'Kailua / Kona Intl', NULL, 'United States', 'North America', 'PHKO', 'KOA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(386, 1, 0, 'Honolulu Intl', NULL, 'United States', 'North America', 'PHNL', 'HNL', 'A1', 'A1', 'D', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(387, 1, 0, 'Kahului', NULL, 'United States', 'North America', 'PHOG', 'OGG', '', '', 'CA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(388, 1, 0, 'Hilo', NULL, 'United States', 'North America', 'PHTO', 'ITO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(389, 1, 0, 'Majuro Atol', NULL, 'Marshal Islands', 'Oceania', 'PKMJ', 'MAJ', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 2, 0, 0),
(390, 1, 0, 'Christmas Island', NULL, 'Kiribati', 'Oceania', 'PLCH', 'CXI', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(391, 1, 0, 'Sand Island', NULL, 'United States', 'Oceania', 'PMDY', 'MDY', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(392, 1, 0, 'Wake Island Airfield', NULL, 'United States', 'Oceania', 'PWAK', 'AWK', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(393, 1, 0, 'Tokyo', NULL, 'Japan', 'Asia', 'RJAA', 'NRT', 'D', 'D', 'D', 'D', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 1, 0, 0),
(394, 1, 0, 'Osaka', NULL, 'Japan', 'Asia', 'RJBB', 'KIX', 'D', 'D', 'D', 'D', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(395, 1, 0, 'Sapporo', NULL, 'Japan', 'Asia', 'RJCC', 'CTS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(396, 1, 0, 'Nagasaki', NULL, 'Japan', 'Asia', 'RJFU', 'NGS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(397, 1, 0, 'Nagoya Chubu', NULL, 'Japan', 'Asia', 'RJGG', 'NGO', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(398, 1, 0, 'Hiroshima', NULL, 'Japan', 'Asia', 'RJOA ', 'HIJ', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(399, 1, 0, 'Sendai', NULL, 'Japan', 'Asia', 'RJSS', 'SDJ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(400, 1, 0, 'Kaohsiung', NULL, 'Korea', 'Asia', 'RKCH', 'KHH', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(401, 1, 0, 'Jeju', NULL, 'Korea', 'Asia', 'RKPC', 'CJU', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(402, 1, 0, 'Busan Gimhae', NULL, 'Korea', 'Asia', 'RKPK', 'PUS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(403, 1, 0, 'Seoul Incheon', NULL, 'Korea', 'Asia', 'RKSI', 'ICN', 'D', 'D', 'D', 'D', '2019-09-05 07:59:18', '2019-09-05 07:59:18', 'everyone', 1, 0, 0, 0),
(404, 1, 0, 'Seoul Gimpo', NULL, 'Korea', 'Asia', 'RKSS', 'GMP', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(405, 1, 0, 'Naha', NULL, 'Japan', 'Asia', 'ROAH', 'OKA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(406, 1, 0, 'Angels City', NULL, 'Philipines', 'Asia', 'RPLC', 'CRK', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(407, 1, 0, 'Laoag', NULL, 'Philipines', 'Asia', 'RPLI', 'LAO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(408, 1, 0, 'Manila', NULL, 'Philipines', 'Asia', 'RPLL', 'MNL', 'D', 'D', 'D', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(409, 1, 0, 'Davao', NULL, 'Philipines', 'Asia', 'RPMD', 'DVO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(410, 1, 0, 'Lapu Lapu', NULL, 'Philipines', 'Asia', 'RPVM', 'CEB', 'D', 'D', 'D', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(411, 1, 0, 'Rosario', NULL, 'Argentia', 'South America', 'SAAR', 'ROS', 'A2', 'A2', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(412, 1, 0, 'Cordoba', NULL, 'Argentia', 'South America', 'SACO', 'COR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(413, 1, 0, 'Buenos Aires', NULL, 'Argentia', 'South America', 'SAEZ', 'EZE', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(414, 1, 0, 'Mendoza', NULL, 'Argentia', 'South America', 'SAME', 'MDZ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(415, 1, 0, 'Mar Del Plata ', NULL, 'Argentia', 'South America', 'SAZM', 'MDQ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(416, 1, 0, 'Belem Val De Cans', NULL, 'Brazil', 'South America', 'SBBE', 'BEL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(417, 1, 0, 'Brasilia', NULL, 'Brazil', 'South America', 'SBBR', 'BSB', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(418, 1, 0, 'Belo Horizonte', NULL, 'Brazil', 'South America', 'SBCF', 'CNF', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(419, 1, 0, 'Curitiba', NULL, 'Brazil', 'South America', 'SBCT', 'CWB', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(420, 1, 0, 'Manaus', NULL, 'Brazil', 'South America', 'SBEG', 'MAO', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(421, 1, 0, 'Foz De Igacu', NULL, 'Brazil', 'South America', 'SBFI', 'IGU', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(422, 1, 0, 'Florianopolis', NULL, 'Brazil', 'South America', 'SBFL', 'FLN', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(423, 1, 0, 'Fortaleza', NULL, 'Brazil', 'South America', 'SBFZ', 'FOR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(424, 1, 0, 'Rio De Janeiro', NULL, 'Brazil', 'South America', 'SBGL', 'GIG', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(425, 1, 0, 'Sao Paulo', NULL, 'Brazil', 'South America', 'SBGR', 'GRU', 'D', 'D', 'D', 'D', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(426, 1, 0, 'Campinas Viracopos', NULL, 'Brazil', 'South America', 'SBKP', 'VCP', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(427, 1, 0, 'Porto Alegre', NULL, 'Brazil', 'South America', 'SBPA', 'POA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(428, 1, 0, 'Recife', NULL, 'Brazil', 'South America', 'SBRF', 'REC', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(429, 1, 0, 'Salvador', NULL, 'Brazil', 'South America', 'SBSV', 'SSA', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(430, 1, 0, 'Iquique Diego Aracena', NULL, 'Chile', 'South America', 'SCDA', 'IQQ ', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(431, 1, 0, 'Santiago  ', NULL, 'Chile', 'South America', 'SCEL', 'SCL', 'D', 'D', 'D', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(432, 1, 0, 'Concepcion', NULL, 'Chile', 'South America', 'SCIE', 'CCP', 'A2', 'A2', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(433, 1, 0, 'Isla De Pascua', NULL, 'Chile', 'South America', 'SCIP', 'IPC', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(434, 1, 0, 'Puerto Montt', NULL, 'Chile', 'South America', 'SCTE', 'PMC', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(435, 1, 0, 'Seymour Airport', NULL, 'Ecuador', 'South America', 'SEGS', 'GPS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(436, 1, 0, 'Guayaquil', NULL, 'Ecuador', 'South America', 'SEGU', 'GYE', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(437, 1, 0, 'Manta', NULL, 'Ecuador', 'South America', 'SEMT', 'MEC', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(438, 1, 0, 'Quito', NULL, 'Ecuador', 'South America', 'SEQM', 'UIO', 'A1', 'A1', 'D', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 2, 0, 0),
(439, 1, 0, 'Lugue', NULL, 'Paraguay', 'South America', 'SGAS', 'ASU', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(440, 1, 0, 'Guarani', NULL, 'Paraguay', 'South America', 'SGES', 'AGT', 'A1', 'A1', 'D', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(441, 1, 0, 'Batam Isl', NULL, 'Cabo Verde', 'Africa', 'SIDD', 'BTH', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(442, 1, 0, 'Bogota', NULL, 'Columbia', 'South America', 'SKBO', 'BOG', 'A1', 'A1', 'D', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(443, 1, 0, 'Barranquilla', NULL, 'Columbia', 'South America', 'SKBQ', 'BAQ', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(444, 1, 0, 'Cartagena', NULL, 'Columbia', 'South America', 'SKCG', 'CTG', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(445, 1, 0, 'Cali', NULL, 'Columbia', 'South America', 'SKCL', 'CLO', 'A2', 'A2', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(446, 1, 0, 'Medellin', NULL, 'Columbia', 'South America', 'SKRG', 'MDE', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(447, 1, 0, 'San Andreas', NULL, 'Columbia', 'South America', 'SKSP', 'ADZ', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(448, 1, 0, 'Pucallpa Intl', NULL, 'Peru', 'South America', 'SPCL', 'PCL', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(449, 1, 0, 'Lima Callao', NULL, 'Peru', 'South America', 'SPJC', 'LIM', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:19', '2019-09-05 07:59:19', 'everyone', 1, 0, 0, 0),
(450, 1, 0, 'Iquitos', NULL, 'Peru', 'South America', 'SPQT', 'IQT', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(451, 1, 0, 'Montevideo', NULL, 'Uruguay', 'South America', 'SUMU', 'MVD', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(452, 1, 0, 'Maracaibo', NULL, 'Uruguay', 'South America', 'SVMC', 'MAR', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(453, 1, 0, 'Maiquetia', NULL, 'Venezuela', 'South America', 'SVMI', 'CCS', 'CA', 'CA', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(454, 1, 0, 'Barbados', NULL, 'Barbados', 'South America', 'TBPB', 'BGI', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(455, 1, 0, 'Martinique', NULL, 'France', 'South America', 'TFFF', 'FDF', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(456, 1, 0, 'Point-a-pitre', NULL, 'France', 'South America', 'TFFR', 'PTP', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(457, 1, 0, 'Aguadilla', NULL, 'Puerto Rico', 'South America', 'TJBQ', 'BQN', 'A1', 'A1', 'D', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(458, 1, 0, 'San Juan', NULL, 'Puerto Rico', 'South America', 'TJSJ', 'SJU', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(459, 1, 0, 'Aruba', NULL, 'Aruba', 'South America', 'TNCA', 'AUA', 'CA', 'CA', 'A2', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(460, 1, 0, 'Bonaire', NULL, 'The Netherlands', 'South America', 'TNCB', 'BON', 'CA', 'CA', 'A2', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(461, 1, 0, 'Curacao', NULL, 'The Netherlands', 'South America', 'TNCC', 'CUR', 'A1', 'A1', 'D', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(462, 1, 0, 'Bermuda', NULL, 'United Kingdom', 'South America', 'TXKF', 'BDA', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(463, 1, 0, 'Almaty', NULL, 'Kazakhstan', 'Asia', 'UAAA', 'ALA', 'A1', 'A1', 'D', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(464, 1, 0, 'Astana', NULL, 'Kazakhstan', 'Asia', 'UACC', 'TSE', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(465, 1, 0, 'Atyrau', NULL, 'Kazakhstan', 'Asia', 'UATG', 'GUW', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(466, 1, 0, 'Aktobe', NULL, 'Kazakhstan', 'Asia', 'UATT', 'AKX', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(467, 1, 0, 'Baku', NULL, 'Azerbaijan', 'Asia', 'UBBB', 'GYD', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(468, 1, 0, 'Ganja', NULL, 'Azerbaijan', 'Asia', 'UBBG', 'KVD', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(469, 1, 0, 'Bishkek', NULL, 'Kyrgyzstan', 'Asia', 'UCFM', 'FRU', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(470, 1, 0, 'Yerevan', NULL, 'Armenia', 'Asia', 'UDYZ', 'EVN', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(471, 1, 0, 'Tiblisi', NULL, 'Georgia', 'Asia', 'UGTB', 'TBS', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(472, 1, 0, 'Khabarovsk', NULL, 'Russia', 'Asia', 'UHHH', 'KHV', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(473, 1, 0, 'Anadyr', NULL, 'Russia', 'Asia', 'UHMA', 'DYR', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(474, 1, 0, 'Magdan Sokol', NULL, 'Russia', 'Asia', 'UHMM', 'GDX', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(475, 1, 0, 'Petropavlovks Kamchiatsky', NULL, 'Russia', 'Asia', 'UHPP', 'PKC', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(476, 1, 0, 'Yuzhno-sakhalinsk', NULL, 'Russia', 'Asia', 'UHSS', 'UUS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(477, 1, 0, 'Vladivostok', NULL, 'Russia', 'Asia', 'UHWW', 'VVO', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(478, 1, 0, 'St. Petersburg', NULL, 'Russia', 'Asia', 'ULLI', 'LED', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(479, 1, 0, 'Murmansk', NULL, 'Russia', 'Asia', 'ULMM', 'MMK', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(480, 1, 0, 'Minsk 2', NULL, 'Russia', 'Asia', 'UMMS', 'MSQ', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(481, 1, 0, 'Krasnoyarsk', NULL, 'Russia', 'Asia', 'UNKL', 'KJA', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(482, 1, 0, 'Novosibirsk', NULL, 'Russia', 'Asia', 'UNNT', 'OVB', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(483, 1, 0, 'Norilsk', NULL, 'Russia', 'Asia', 'UOOO', 'NSK', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(484, 1, 0, 'Krasnodar', NULL, 'Russia', 'Asia', 'URKK', 'KRR', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(485, 1, 0, 'Mineralnyve Vody', NULL, 'Russia', 'Asia', 'URMM', 'MRV', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(486, 1, 0, 'Rostov Na Donu - Platov', NULL, 'Russia', 'Asia', 'URRP', 'ROV', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(487, 1, 0, 'Sochi', NULL, 'Russia', 'Asia', 'URSS', 'AER', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(488, 1, 0, 'Chelyabinsk Balandino', NULL, 'Russia', 'Asia', 'USCC', 'CEK', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(489, 1, 0, 'Nizhnevartovsk', NULL, 'Russia', 'Asia', 'USNN', 'NJC', '', '', '', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(490, 1, 0, 'Surgut', NULL, 'Russia', 'Asia', 'USRR', 'SGC', '', '', '', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(491, 1, 0, 'Yekaterinburg', NULL, 'Russia', 'Asia', 'USSS', 'SVX', 'A1', 'A1', 'A1', 'A2', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(492, 1, 0, 'Ashgabat', NULL, 'Turkmenistan', 'Asia', 'UTAA', 'ASB', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(493, 1, 0, 'Dushanbe', NULL, 'Tajikistan', 'Asia', 'UTDD', 'DYU', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(494, 1, 0, 'Khudzhand', NULL, 'Tajikistan', 'Asia', 'UTDL', 'LBD', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:20', '2019-09-05 07:59:20', 'everyone', 1, 0, 0, 0),
(495, 1, 0, 'Bukhara', NULL, 'Uzbekistan', 'Asia', 'UTSB', 'BHK', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(496, 1, 0, 'Tashkent', NULL, 'Uzbekistan', 'Asia', 'UTTT', 'TAS', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(497, 1, 0, 'Moscow', NULL, 'Russia', 'Asia', 'UUDD', 'DME', 'D', 'D', 'D', 'D', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(498, 1, 0, 'Nizhny Novograd', NULL, 'Russia', 'Asia', 'UWGG', 'GOJ', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(499, 1, 0, 'Kazan', NULL, 'Russia', 'Asia', 'UWKD', 'KZN', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(500, 1, 0, 'Ahmedabad', NULL, 'India', 'Asia', 'VAAH', 'AMD', 'D', 'D', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(501, 1, 0, 'Mumbai', NULL, 'India', 'Asia', 'VABB', 'BOM', 'D', 'D', 'D', 'D', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 1, 0, 0),
(502, 1, 0, 'Nagpur', NULL, 'India', 'Asia', 'VANP', 'NAG', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(503, 1, 0, 'Katunayake', NULL, 'Sri Lanka', 'Asia', 'VCBI', 'CMB', 'D', 'D', 'D', 'EA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(504, 1, 0, 'Mattala', NULL, 'Sri Lanka', 'Asia', 'VCRI', 'HRI', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(505, 1, 0, 'Phnom Penh', NULL, 'Cambodia', 'Asia', 'VDPP', 'PNH', 'D', 'D', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(506, 1, 0, 'Kolkata', NULL, 'India', 'Asia', 'VECC', 'CCU', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(507, 1, 0, 'Chittagong', NULL, 'Bangladesh', 'Asia', 'VGEG', 'CGP', 'A1', 'A1', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(508, 1, 0, 'Dhaka', NULL, 'Bangladesh', 'Asia', 'VGHS', 'DAC', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 1, 0, 0),
(509, 1, 0, 'Hong Kong', NULL, 'China', 'Asia', 'VHHH', 'HKG', 'D', 'D', 'D', 'D', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 1, 0, 0),
(510, 1, 0, 'Amritsar', NULL, 'India', 'Asia', 'VIAR', 'ATQ', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(511, 1, 0, 'Delhi', NULL, 'India', 'Asia', 'VIDP', 'DEL', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(512, 1, 0, 'Jaipur', NULL, 'India', 'Asia', 'VIJP', 'JAI', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(513, 1, 0, 'Lucknow', NULL, 'India', 'Asia', 'VILK', 'LKO', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(514, 1, 0, 'Macau', NULL, 'Mcau', 'Asia', 'VMMC', 'MFM', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(515, 1, 0, 'Bangalore', NULL, 'India', 'Asia', 'VOBL', 'BLR', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(516, 1, 0, 'Cochin', NULL, 'India', 'Asia', 'VOCI', 'COK', 'D', 'D', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(517, 1, 0, 'Hyderabad', NULL, 'India', 'Asia', 'VOHS', 'HYD', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(518, 1, 0, 'Chennai', NULL, 'India', 'Asia', 'VOMM', 'MAA', 'D', 'D', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(519, 1, 0, 'Thiruvananthapuram', NULL, 'India', 'Asia', 'VOTV', 'TRV', 'D', 'D', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(520, 1, 0, 'Gan Island', NULL, 'Maldives', 'Asia', 'VRMG', 'GAN', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(521, 1, 0, 'Male', NULL, 'Maldives', 'Asia', 'VRMM', 'MLE', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(522, 1, 0, 'Bangkok', NULL, 'Thailand', 'Asia', 'VTBD', 'DMK', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(523, 1, 0, 'Rayong', NULL, 'Thailand', 'Asia', 'VTBU', 'UTP', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(524, 1, 0, 'Chang Mai', NULL, 'Thailand', 'Asia', 'VTCC', 'CNX', 'A1', 'A1', 'A1', 'EA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(525, 1, 0, 'Krabi', NULL, 'Thailand', 'Asia', 'VTSG', 'KBV', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(526, 1, 0, 'Phuket', NULL, 'Thailand', 'Asia', 'VTSP', 'HKT', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(527, 1, 0, 'Ubon Ratchathani', NULL, 'Thailand', 'Asia', 'VTUU', 'UBP', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(528, 1, 0, 'Danang', NULL, 'Vietnam', 'Asia', 'VVDN', 'DAD', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(529, 1, 0, 'Hanoi', NULL, 'Vietnam', 'Asia', 'VVNB', 'HAN', 'D', 'D', 'D', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(530, 1, 0, 'Hochiminh', NULL, 'Vietnam', 'Asia', 'VVTS', 'SGN', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(531, 1, 0, 'Mandalay', NULL, 'Myanmar', 'Asia', 'VYMD', 'MDL', 'A2', 'A2', 'A2', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(532, 1, 0, 'Yangon', NULL, 'Myanmar', 'Asia', 'VYYY', 'RGN', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(533, 1, 0, 'Denpasar', NULL, 'Indonesia', 'Asia', 'WADD', 'DPS', 'D', 'D', 'D', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(534, 1, 0, 'Surabaya', NULL, 'Indonesia', 'Asia', 'WARR', 'SUB', 'A2', 'A2', 'A2', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(535, 1, 0, 'Kota Kinabalu', NULL, 'Malaysia', 'Asia', 'WBKK', 'BKI', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(536, 1, 0, 'Bandar Seri Begawan', NULL, 'Brunei', 'Asia', 'WBSB', 'BWN', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(537, 1, 0, 'Jakarta', NULL, 'Indonesia', 'Asia', 'WIHH', 'HLP', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(538, 1, 0, 'Medan Kualanamu', NULL, 'Indonesia', 'Asia', 'WIMM', 'KNO', 'A1', 'A1', 'A1', 'CA', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(539, 1, 0, 'Banda Aceh', NULL, 'Indonesia', 'Asia', 'WITT', 'BTJ', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(540, 1, 0, 'Jahor Bahru', NULL, 'Malaysia', 'Asia', 'WMKJ', 'JHB', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:21', '2019-09-05 07:59:21', 'everyone', 1, 0, 0, 0),
(541, 1, 0, 'Kuala Lumpur', NULL, 'Malaysia', 'Asia', 'WMKK', 'KUL', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(542, 1, 0, 'Langkawi', NULL, 'Malaysia', 'Asia', 'WMKL', 'LGK', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(543, 1, 0, 'Penang', NULL, 'Malaysia', 'Asia', 'WMKP', 'PEN', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(544, 1, 0, 'Singapore', NULL, 'Singapre', 'Asia', 'WSAP', 'QPG', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(545, 1, 0, 'Alice Springs', NULL, 'Australia', 'Oceania', 'YBAS', 'ASP', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(546, 1, 0, 'Brisbane', NULL, 'Australia', 'Oceania', 'YBBN', 'BNE', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(547, 1, 0, 'Gold Coast', NULL, 'Australia', 'Oceania', 'YBCG', 'OOL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(548, 1, 0, 'Cairns', NULL, 'Australia', 'Oceania', 'YBCS', 'CNS', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(549, 1, 0, 'Rockhampton', NULL, 'Australia', 'Oceania', 'YBRK', 'ROK', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(550, 1, 0, 'Townsvill', NULL, 'Australia', 'Oceania', 'YBTL', 'YSV', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(551, 1, 0, 'Avalon', NULL, 'Australia', 'Oceania', 'YMAV', 'AVV', 'A2', 'A2', 'A2', 'A2', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(552, 1, 0, 'Williamtown', NULL, 'Australia', 'Oceania', 'YMLW', 'NTL', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(553, 1, 0, 'Melbourne', NULL, 'Australia', 'Oceania', 'YMML', 'MEL', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(554, 1, 0, 'Adelaide', NULL, 'Australia', 'Oceania', 'YPAD', 'ADL', 'D', 'D', 'D', 'A1', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(555, 1, 0, 'Cocos I', NULL, 'Australia', 'Oceania', 'YPCC', 'CCK', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(556, 1, 0, 'Darwin', NULL, 'Australia', 'Oceania', 'YPDN', 'DRW', 'A1', 'A1', 'A1', 'A1', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(557, 1, 0, 'Pearce', NULL, 'Australia', 'Oceania', 'YPEA', '', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(558, 1, 0, 'Kalgoorlie', NULL, 'Australia', 'Oceania', 'YPKG', 'KGI', 'EA', 'EA', 'EA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(559, 1, 0, 'Learmonth', NULL, 'Australia', 'Oceania', 'YPLM', 'LEA', 'A2', 'A2', 'A2', 'EA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(560, 1, 0, 'Perth', NULL, 'Australia', 'Oceania', 'YPPH', 'PER', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(561, 1, 0, 'Canberra', NULL, 'Australia', 'Oceania', 'YSCB', 'CBR', 'A1', 'A1', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(562, 1, 0, 'Sydney', NULL, 'Australia', 'Oceania', 'YSSY', 'SYD', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(563, 1, 0, 'Beijing Capital', NULL, 'China', 'Asia', 'ZBAA', 'PEK', 'A1', 'D', 'A1', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(564, 1, 0, 'Hohhot / Baita', NULL, 'China', 'Asia', 'ZBHH', 'HET', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(565, 1, 0, 'Tianjin Banhai', NULL, 'China', 'Asia', 'ZBTJ', 'TSN', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(566, 1, 0, 'Taiyuan / Wusu', NULL, 'China', 'Asia', 'ZBYN', 'TYN', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(567, 1, 0, 'Guangzhou', NULL, 'China', 'Asia', 'ZGGG', 'CAN', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(568, 1, 0, 'Nanning', NULL, 'China', 'Asia', 'ZGNN', 'NNG', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(569, 1, 0, 'Shenzhen', NULL, 'China', 'Asia', 'ZGSZ', 'SZX', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(570, 1, 0, 'Zhengzhou', NULL, 'China', 'Asia', 'ZHCC', 'CGO', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(571, 1, 0, 'Wuhan', NULL, 'China', 'Asia', 'ZHHH', 'WUH', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(572, 1, 0, 'Yinchuan', NULL, 'China', 'Asia', 'ZLIC', 'INC', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(573, 1, 0, 'Jiayuguan', NULL, 'China', 'Asia', 'ZLJQ', 'JGN', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(574, 1, 0, 'Lanzhou', NULL, 'China', 'Asia', 'ZLLL', 'LHW', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(575, 1, 0, 'Xian Xianyang', NULL, 'China', 'Asia', 'ZLXY ', 'XIY', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(576, 1, 0, 'Ulaanbaatar', NULL, 'Mongolia', 'Asia', 'ZMUB', 'UL', 'A1', 'A1', 'A1', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(577, 1, 0, 'Kunming', NULL, 'China', 'Asia', 'ZPPP ', 'KMG', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(578, 1, 0, 'Hangzhou', NULL, 'China', 'Asia', 'ZSHC', 'HGH', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(579, 1, 0, 'Nanjing', NULL, 'China', 'Asia', 'ZSNJ', 'NKG', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(580, 1, 0, 'Shanghai', NULL, 'China', 'Asia', 'ZSPD', 'PVG', 'D', 'D', 'D', 'D', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(581, 1, 0, 'Chengdu', NULL, 'China', 'Asia', 'ZUUU', 'CTU', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(582, 1, 0, 'Kashi', NULL, 'China', 'Asia', 'ZWSH', 'KHG', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(583, 1, 0, 'Turpan', NULL, 'China', 'Asia', 'ZWTL', 'TLQ', 'EA', 'EA', 'EA', 'EA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(584, 1, 0, 'Hotan', NULL, 'China', 'Asia', 'ZWTN', 'HTN', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(585, 1, 0, 'Urumqi', NULL, 'China', 'Asia', 'ZWWW', 'URC', 'CA', 'CA', 'CA', 'CA', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(586, 1, 0, 'Dalian', NULL, 'China', 'Asia', 'ZYTL', 'DLC', 'CA', 'CA', 'CA', '', '2019-09-05 07:59:22', '2019-09-05 07:59:22', 'everyone', 1, 0, 0, 0),
(587, 1, 0, 'Test Airport', 'test description 2', 'Pakistan', 'Punjab', 'ABC', 'LHR', 'A1', 'B2', 'C3', 'D4', '2019-09-06 10:26:01', '2019-09-19 08:33:23', 'everyone', 1, 0, 0, 0),
(590, 3, 0, 'Rockford ', '', 'United States', 'North America', 'KRFD', 'RFD', 'A1', 'A1', 'A1', ' -', '2019-09-25 15:10:12', '2019-09-25 15:10:12', 'everyone', 1, 0, 0, 0),
(591, 3, 0, 'Tabuk', '', 'Saudi Arabia', 'Middle East', 'OETB', 'TUU', 'A2', 'A2', 'A2', '-', '2019-09-25 15:13:25', '2019-09-25 15:13:25', 'everyone', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_airport_expects`
--

CREATE TABLE `engine4_airport_expects` (
  `expect_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `airport_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `phase` varchar(32) DEFAULT NULL,
  `up_vote_count` int(11) NOT NULL DEFAULT 0,
  `down_vote_count` int(11) NOT NULL DEFAULT 0,
  `total_vote_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engine4_airport_expects`
--

INSERT INTO `engine4_airport_expects` (`expect_id`, `owner_id`, `airport_id`, `body`, `phase`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`) VALUES
(1, 1, 366, 'Test1', 'Flight', 1, 0, 0, 0, '2019-09-13 10:58:13', '2019-09-13 10:58:13'),
(2, 1, 366, 'Test2', 'Ground', 2, 0, 0, 5, '2019-09-13 10:58:20', '2019-09-13 10:58:20'),
(3, 1, 366, 'Test3', 'Departure', 1, 0, 0, 0, '2019-09-13 10:58:26', '2019-09-13 10:58:26'),
(4, 1, 366, 'Test4', 'Ground', 0, 1, 0, 0, '2019-09-13 10:58:32', '2019-09-13 10:58:32'),
(5, 1, 366, 'What to write?', '', 1, 0, 0, 0, '2019-09-13 12:38:18', '2019-09-13 12:38:18'),
(6, 1, 355, 'So beautiful ;)', 'Ground', 2, 0, 0, 0, '2019-09-15 18:31:14', '2019-09-15 18:31:14'),
(7, 1, 366, 'test', 'Flight', 0, 0, 0, 0, '2019-09-19 09:24:48', '2019-09-19 09:24:48'),
(8, 1, 1, 'hello', 'Flight', 0, 0, 0, 0, '2019-09-19 09:25:03', '2019-09-19 09:25:03'),
(11, 3, 355, 'dfdfdf', 'Flight', 0, 1, 0, 0, '2019-09-22 21:46:59', '2019-09-22 21:46:59'),
(12, 4, 355, 'lalalla', 'Ground', 1, 0, 0, 0, '2019-09-22 23:14:03', '2019-09-22 23:14:03'),
(14, 3, 196, 'On arrival vacated RW28c via DD, taxi right on P hold short of Y. (waited 40 min). Taxi left on rwy 28R, GG, N, EE, A19, Stand M4', 'Ground', 0, 0, 0, 0, '2019-09-23 02:18:43', '2019-09-23 02:18:43'),
(16, 1, 366, 'On arrival vacated RW28c via DD, taxi right on P hold short of Y. (waited 40 min). Taxi left on rwy 28R, GG, N, EE, A19, Stand M4 On arrival vacated RW28c via DD, taxi right on P hold short of Y. (waited 40 min). Taxi left on rwy 28R, GG, N, EE, A19, Stand M4 On arrival vacated RW28c via DD, taxi right on P hold short of Y. (waited 40 min). Taxi left on rwy 28R, GG, N, EE, A19, Stand M4 On arrival vacated RW28c via DD, taxi right on P hold short of Y. (waited 40 min). Taxi left on rwy 28R, GG, N, EE, A19, Stand M4 On arrival vacated RW28c via DD, taxi right on P hold short of Y. (waited 40 min). Taxi left on rwy 28R, GG, N, EE, A19, Stand M4 ', 'Flight', 0, 0, 0, 0, '2019-09-23 09:15:52', '2019-09-23 09:15:52'),
(23, 3, 196, 'Rwy 28r, departed full length. After departure maintained RW HDG, remained on tower freq. Then right HDG 040 contact 125.0Mhz. Then climb 15,000 DCT EBAKE', 'Departure', 0, 0, 0, 0, '2019-09-24 19:05:25', '2019-09-24 19:05:25'),
(24, 3, 196, 'On departure: contact Ramp 129.050 for push & start. From M9 pushed back tail EAST, nose abeam M10. Contact Metering then Ground. Taxi via V2, V, V4, N to holding point Y RW28r. Monitor 132.7Mhz.', 'Ground', 0, 0, 0, 0, '2019-09-24 19:13:31', '2019-09-24 19:13:31'),
(25, 3, 196, 'Contact World wide flight services 130.3Mhz 0:20 minutes before landing for stand allocation.', 'Flight', 0, 0, 0, 0, '2019-09-24 19:39:40', '2019-09-24 19:39:40'),
(26, 3, 196, 'Contact Ramp 129.050Mhz after landing to confirm stand and entry point + if stand occupied or open. (if occupied expect to wait for long periods of time)', 'Ground', 0, 0, 0, 0, '2019-09-24 19:41:24', '2019-09-24 19:41:24'),
(29, 3, 196, '      Expect WYNDE 9 arrival, FNT transition for ILS RWYs 28c or 10c. ', 'Arrival', 0, 0, 0, 0, '2019-09-24 19:47:22', '2019-09-24 19:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_airport_threats`
--

CREATE TABLE `engine4_airport_threats` (
  `threat_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `airport_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext DEFAULT NULL,
  `phase` varchar(32) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `article` varchar(32) DEFAULT NULL,
  `up_vote_count` int(11) NOT NULL DEFAULT 0,
  `down_vote_count` int(11) NOT NULL DEFAULT 0,
  `total_vote_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `imported` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engine4_airport_threats`
--

INSERT INTO `engine4_airport_threats` (`threat_id`, `owner_id`, `airport_id`, `title`, `body`, `phase`, `icon`, `href`, `article`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`, `imported`) VALUES
(1, 1, 366, 'PIA B772 at Lahore on Aug 26th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc0ab37&opt=0', '4cc0ab37', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(2, 1, 366, 'PIA A320 near Lahore on Oct 11th 2017, cargo smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af9018d&opt=0', '4af9018d', 1, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(3, 1, 366, 'PIA B772 at Lahore on Apr 25th 2019, stoned engine', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c73043b&opt=0', '4c73043b', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(4, 1, 366, 'PIA B773 at Lahore on Mar 22nd 2019, bird strike penetrates leading edge of wing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5b6b84&opt=0', '4c5b6b84', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(5, 1, 366, 'Vietnam A21N near Lahore on Feb 6th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3e23bd&opt=0', '4c3e23bd', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(6, 1, 366, 'PIA A320 at Lahore on Dec 21st 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c1e7359&opt=0', '4c1e7359', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(7, 1, 366, 'PIA B773 at Lahore on Aug 8th 2018, rejected takeoff due to engine failure results in blown tyres', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc1a410&opt=0', '4bc1a410', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(8, 1, 366, 'PIA B772 at Lahore on Jun 2nd 2018, bird strike on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b95bba7&opt=0', '4b95bba7', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(9, 1, 366, 'PIA B772 at Lahore on May 12th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b87edb4&opt=0', '4b87edb4', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(10, 1, 366, 'Serene B738 at Lahore on Mar 25th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6942f1&opt=0', '4b6942f1', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(11, 1, 366, 'Kuwait A320 at Lahore on Jan 11th 2018, cabin overpressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b383737&opt=0', '4b383737', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(12, 1, 366, 'PIA B773 enroute on Nov 30th 2017, loose cargo containers in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b1be329&opt=0', '4b1be329', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(13, 1, 366, 'Shaheen B734 at Lahore on Nov 3rd 2015, runway excursion, both main gear collapsed', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=48ec2e81/0006&opt=0', '48ec2e81/0006', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(14, 1, 366, 'Shaheen B734 at Lahore on Nov 3rd 2015, runway excursion, both main gear collapsed', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=48ec2e81&opt=0', '48ec2e81', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(15, 1, 366, 'Vietjet A320 near Karachi on Sep 5th 2017, instrument problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4adf2050&opt=0', '4adf2050', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(16, 1, 366, 'PIA A320 at Lahore on Sep 5th 2017, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4adf1e20&opt=0', '4adf1e20', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(17, 1, 366, 'Shaheen A319 at Lahore on Aug 16th 2017, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ad11f1e&opt=0', '4ad11f1e', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(18, 1, 366, 'Malindo B739 near Delhi on Jun 25th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aad5c8d&opt=0', '4aad5c8d', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(19, 1, 366, 'PIA A320 near Karachi on Jun 19th 2017, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aaa3556&opt=0', '4aaa3556', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(20, 1, 366, 'PIA B773 at Milan on Jan 28th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a42e948&opt=0', '4a42e948', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(21, 1, 366, 'Shaheen A332 near Lahore on Jan 8th 2017, engine fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a335181&opt=0', '4a335181', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(22, 1, 366, 'PIA A313 at Tokyo on Dec 23rd 2016, hard landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4a29dfd1&opt=0', '4a29dfd1', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(23, 1, 366, 'PIA B772 at Lahore on Dec 23rd 2016, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a27ec92&opt=0', '4a27ec92', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(24, 1, 366, 'PIA A313 near Delhi on Dec 19th 2016, hydraulic problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a2529db&opt=0', '4a2529db', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(25, 1, 366, 'PIA B772 near Manchester on Nov 19th 2016, toilets choked', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a0fa84c&opt=0', '4a0fa84c', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(26, 1, 366, 'PIA B772 near Riyadh on Nov 11th 2016, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a09dc63&opt=0', '4a09dc63', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(27, 1, 366, 'Ethiopian B773 near Lahore on Nov 8th 2016, suspected fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a0790c6&opt=0', '4a0790c6', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(28, 1, 366, 'PIA A320 at Lahore on Nov 5th 2016, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a0577c0&opt=0', '4a0577c0', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(29, 1, 366, 'Malindo B739 at Lahore on Sep 24th 2016, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49e71f52&opt=0', '49e71f52', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(30, 1, 366, 'Shaheen A320 at Lahore on Jun 2nd 2016, rejected takeoff due to engine problem, tyre damage', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4992ea54&opt=0', '4992ea54', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(31, 1, 366, 'PIA A313 near Lahore on Jun 20th 2016, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49a17448&opt=0', '49a17448', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(32, 1, 366, 'Shaheen A333 at Lahore on Jun 16th 2016, nose gear steering failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=499e72e5&opt=0', '499e72e5', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(33, 1, 366, 'Qatar A333 at Lahore on May 10th 2016, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4981d32f&opt=0', '4981d32f', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(34, 1, 366, 'Saudia A333 at Lahore on Dec 25th 2015, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=491741cc&opt=0', '491741cc', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(35, 1, 366, 'PIA B772 at Lahore on Dec 4th 2015, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4905dd8e&opt=0', '4905dd8e', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(36, 1, 366, 'PIA B773 at New York on Sep 8th 2015, gear did not retract', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48c1724c&opt=0', '48c1724c', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(37, 1, 366, 'Windrose A321 at Lahore and Muscat on Sep 2nd 2015, burst tyre on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48bcb14c&opt=0', '48bcb14c', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(38, 1, 366, 'Lufthansa A343 near Athens on Jun 20th 2015, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48837b91&opt=0', '48837b91', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(39, 1, 366, 'PIA B772 at Manchester on Jun 10th 2015, burst tyre on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=487ae83d&opt=0', '487ae83d', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(40, 1, 366, 'PIA AT42 near Lahore on May 27th 2015, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48734539&opt=0', '48734539', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(41, 1, 366, 'Oman B739 at Lahore on Apr 24th 2015, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48541bd7&opt=0', '48541bd7', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(42, 1, 366, 'PIA B772 at Karachi on Apr 22nd 2015, flock of birds', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4854192c&opt=0', '4854192c', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(43, 1, 366, 'Shaheen A320 near Lahore on Apr 5th 2015, cabin pressurization problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48467cfe&opt=0', '48467cfe', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(44, 1, 366, 'Gulf A332 at Lahore on Mar 1st 2015, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48293ea1&opt=0', '48293ea1', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(45, 1, 366, 'PIA B772 at Lahore on Feb 19th 2015, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48208216&opt=0', '48208216', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(46, 1, 366, 'Indus B733 near Karachi on Jan 13th 2015, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48039258&opt=0', '48039258', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(47, 1, 366, 'Shaheen B734 at Lahore on Dec 30th 2014, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=47f88d77&opt=0', '47f88d77', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(48, 1, 366, 'PIA B772 near Lahore on Dec 31st 2014, wheels got stuck on runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47f95b98&opt=0', '47f95b98', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(49, 1, 366, 'PIA A320 at Lahore on Oct 8th 2014, damaged windshields', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47b7a4da&opt=0', '47b7a4da', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(50, 1, 366, 'Shaheen A333 near Lahore on Sep 6th 2014, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47abeac3&opt=0', '47abeac3', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(51, 1, 366, 'PIA A313 near Kuala Lumpur on Mar 20th 2014, navigation problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=471b2c42&opt=0', '471b2c42', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(52, 1, 366, 'PIA A313 near Karachi on Oct 10th 2013, smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=469d3e15&opt=0', '469d3e15', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(53, 1, 366, 'PIA A313 at Lahore on Aug 17th 2013, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46719874&opt=0', '46719874', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(54, 1, 366, 'PIA B773 near Manchester on May 24th 2013, safety threats on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=462c0ad4&opt=0', '462c0ad4', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(55, 1, 366, 'PIA A313 near Kerman on Jan 4th 2013, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45b9c5a9&opt=0', '45b9c5a9', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(56, 1, 366, 'PIA B743 near Karachi on Nov 18th 2012, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45947f03&opt=0', '45947f03', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(57, 1, 366, 'PIA A313 at Lahore on Oct 29th 2012, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4583cf70&opt=0', '4583cf70', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(58, 1, 366, 'PIA B743 at Lahore on Oct 25th 2012, burst tyres on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=457fb206&opt=0', '457fb206', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(59, 1, 366, 'PIA AT42 at Lahore on Aug 31st 2012, runway excursion, right main gear collapse', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=455253e7&opt=0', '455253e7', 0, 0, 0, 0, '2019-09-13 13:06:46', '2019-09-13 13:06:46', 1),
(60, 1, 366, '', 'Test1', '777-300ER', NULL, NULL, NULL, 1, 0, 0, 3, '2019-09-13 14:14:48', '2019-09-13 14:14:48', 0),
(61, 1, 366, '', 'Test2', 'All Planes', NULL, NULL, NULL, 1, 0, 0, 0, '2019-09-13 14:14:54', '2019-09-13 14:14:54', 0),
(62, 1, 366, '', 'Test3', 'A380', NULL, NULL, NULL, 1, 0, 0, 0, '2019-09-13 14:15:00', '2019-09-13 14:15:00', 0),
(63, 1, 366, 'PIA B772 at Lahore on Sep 15th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccdbc4e&opt=0', '4ccdbc4e', 0, 0, 0, 0, '2019-09-15 17:12:01', '2019-09-15 17:12:01', 1),
(64, 1, 355, 'Emirates A388 at Amsterdam on Aug 8th 2019, flat tyres before landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb69bde&opt=0', '4cb69bde', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(65, 1, 355, 'Azerbaijan A319 near Baku on Jul 26th 2019, cargo smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cadc3f2&opt=0', '4cadc3f2', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(66, 1, 355, 'Emirates A388 near Chennai on Jul 10th 2019, turbulence injures passengers and crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4ca6780c&opt=0', '4ca6780c', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(67, 1, 355, 'Emirates A388 near Toronto on Jul 20th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cad1cb9&opt=0', '4cad1cb9', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(68, 1, 355, 'India Express B738 at Mangalore on Jun 30th 2019, runway excursion on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9d4a5a&opt=0', '4c9d4a5a', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(69, 1, 355, 'Emirates A388 at Osaka on Jun 29th 2019, unsafe gear on approach', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9df29b&opt=0', '4c9df29b', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(70, 1, 355, 'Flydubai B738 at Multan on Jun 25th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9a520e&opt=0', '4c9a520e', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(71, 1, 355, 'Flydubai B738 near Jeddah on Jun 7th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9c09e2&opt=0', '4b9c09e2', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(72, 1, 355, 'Flydubai B738 and El Al B738 near Kiev on Jun 13th 2018, too many ATC spoil the separation, TCAS at the rescue', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4c95b03d&opt=0', '4c95b03d', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(73, 1, 355, 'India Express B738 at Kochi on Jun 13th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c934f05&opt=0', '4c934f05', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(74, 1, 355, 'Spicejet B738 at Dubai and Jaipur on Jun 12th 2019, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c91feb7&opt=0', '4c91feb7', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(75, 1, 355, 'Lufthansa A346 enroute on Jan 11th 2016, fumes on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49250f26&opt=0', '49250f26', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(76, 1, 355, 'Joon A343 near Isfahan on May 8th 2019, malfunction of ventilation circuit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7b1170&opt=0', '4c7b1170', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(77, 1, 355, 'Ethiopian B38M near Bishoftu on Mar 10th 2019, impacted terrain after departure', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4c534c4a/0052&opt=0', '4c534c4a/0052', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(78, 1, 355, 'Emirates B773 at Cape Town on Apr 20th 2019, cargo door indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6fc915&opt=0', '4c6fc915', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(79, 1, 355, 'Emirates A388 at Munich on Mar 25th 2019, multiple lightning strikes', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5e3fe5&opt=0', '4c5e3fe5', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(80, 1, 355, 'Emirates B773 at Rio de Janeiro on Mar 14th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c582fa5&opt=0', '4c582fa5', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(81, 1, 355, 'Biman B738 near Dhaka on Feb 24th 2019, attempted hijack', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4a2fa5&opt=0', '4c4a2fa5', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(82, 1, 355, 'Norwegian B38M near Shiraz on Dec 14th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c18fbc9&opt=0', '4c18fbc9', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(83, 1, 355, 'Emirates A388 at London and Manchester on Feb 8th 2019, fuel emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c43df30&opt=0', '4c43df30', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(84, 1, 355, 'Flydubai B738 at Dubai on Feb 10th 2019, charred bird', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c412c7b&opt=0', '4c412c7b', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(85, 1, 355, 'Emirates B773 at Cairo on Jan 12th 2019, rejected takeoff due to unattended vehicle on runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2dfb0c&opt=0', '4c2dfb0c', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(86, 1, 355, 'India Express B738 at Mumbai on Jan 6th 2019, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c28733b&opt=0', '4c28733b', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(87, 1, 355, 'Solitaire B733 at Aqaba on Sep 17th 2017, runway excursion on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ae7b1c1&opt=0', '4ae7b1c1', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(88, 1, 355, 'Flydubai B738 at Moscow on Dec 2nd 2018, commenced takeoff without clearance and rejected', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c117450&opt=0', '4c117450', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(89, 1, 355, 'Lion B38M near Jakarta on Oct 29th 2018, aircraft lost height and crashed into Java Sea, wrong AoA data', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4bf90724/0008&opt=0', '4bf90724/0008', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(90, 1, 355, 'Flydubai B738 at Odessa on Oct 27th 2018, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf8dd5c&opt=0', '4bf8dd5c', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(91, 1, 355, 'India Express B738 at Tiruchirappalli on Oct 12th 2018, impacted localizer antenna and wall on departure', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bedd321&opt=0', '4bedd321', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(92, 1, 355, 'Flydubai B738 at Dubai on Aug 8th 2017, hydraulic failure caused by damaged tyre', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4bdeebd2&opt=0', '4bdeebd2', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(93, 1, 355, 'Algerie A332 at Algiers on Sep 16th 2018, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdcfa91&opt=0', '4bdcfa91', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(94, 1, 355, 'Flydubai B738 at Rostov on Don on Mar 19th 2016, lost height on go around after stabilizer moved nose down following holding for 2 hours', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=495997e2/0031&opt=0', '495997e2/0031', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(95, 1, 355, 'Flydubai B738 at Rostov on Don on Mar 19th 2016, lost height on go around after stabilizer moved nose down following holding for 2 hours', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=495997e2&opt=0', '495997e2', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(96, 1, 355, 'Emirates B773 at Dubai on Aug 3rd 2016, long landing, go around without thrust results in runway impact, aircraft on fire', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49c12302&opt=0', '49c12302', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(97, 1, 355, 'Emirates B773 near Iqaluit on Jul 18th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbca680&opt=0', '4bbca680', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(98, 1, 355, 'Emirates B773 at Sialkot on Jul 4th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bab9743&opt=0', '4bab9743', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(99, 1, 355, 'Emirates A388 at London on Jun 19th 2018, did not retract landing gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba16ee0&opt=0', '4ba16ee0', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(100, 1, 355, 'Emirates B773 near Varna on Jun 10th 2018, lavatory issues', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9b72b0&opt=0', '4b9b72b0', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(101, 1, 355, 'Emirates B773 at Sialkot on Jun 2nd 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b966d63&opt=0', '4b966d63', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(102, 1, 355, 'SriLankan A333 near Muscat on May 7th 2018, low fuel or security issue?', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8a8e94&opt=0', '4b8a8e94', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(103, 1, 355, '10 years The Aviation Herald - thoughts, a brief look into the history and a brief outlook', NULL, NULL, '/images/news.gif', 'http://avherald.com/h?article=4b87bfc1&opt=0', '4b87bfc1', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(104, 1, 355, 'Indigo A320 near Mumbai on May 2nd 2018, cargo smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b81e6e6&opt=0', '4b81e6e6', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(105, 1, 355, 'Saudia A333 near Doha on Apr 27th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b7e07fa&opt=0', '4b7e07fa', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(106, 1, 355, 'Flydubai B738 at Istanbul on Apr 5th 2018, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b703f88&opt=0', '4b703f88', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(107, 1, 355, 'Shaheen A320 enroute on Feb 25th 2018, hail strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6af03f&opt=0', '4b6af03f', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(108, 1, 355, 'Emirates B772 near Dubai on Oct 22nd 2014, captain incapacitated', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4b6653e8&opt=0', '4b6653e8', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(109, 1, 355, 'Emirates B773 at Entebbe on Mar 14th 2018, flight attendant fell off aircraft', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b613282&opt=0', '4b613282', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(110, 1, 355, 'UPS MD11 near Yangon on Feb 28th 2018, LiOn batteries cargo fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5883e1&opt=0', '4b5883e1', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(111, 1, 355, 'Emirates B773 at Islamabad on Feb 27th 2018, ambulift topples over', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b5725f9&opt=0', '4b5725f9', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(112, 1, 355, 'Indigo A320 and Emirates B773 near Raipur on Jan 28th 2018, ATC descends A320 into conflict, contradicts TCAS RA', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4ac0db&opt=0', '4b4ac0db', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(113, 1, 355, 'USA und UK require electronic devices larger than smartphones to be checked in from certain countries/airports', NULL, NULL, '/images/news.gif', 'http://avherald.com/h?article=4a67fce7&opt=0', '4a67fce7', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(114, 1, 355, 'Emirates A388 at Dubai on Dec 16th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b27f290&opt=0', '4b27f290', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(115, 1, 355, 'Emirates A388 at New York on Dec 4th 2017, at about 200 feet in the middle of turn to runway 13L', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b21e320&opt=0', '4b21e320', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(116, 1, 355, 'Flydubai B738 at Kiev on Nov 22nd 2017, rejected takeoff twice due to engine issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b171aa6&opt=0', '4b171aa6', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(117, 1, 355, 'Meridiana B762 near Mauritius on Nov 13th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b16531a&opt=0', '4b16531a', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(118, 1, 355, 'Sichuan A333 and China Southern A319 over Myanmar on May 3rd 2017, loss of separation enroute', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a972cd9&opt=0', '4a972cd9', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(119, 1, 355, 'UTAir B735 at Moscow on Oct 13th 2017, loss of control recovered', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b01e302&opt=0', '4b01e302', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(120, 1, 355, 'Cargolux B744 at Chicago on Oct 9th 2017, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af86206&opt=0', '4af86206', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(121, 1, 355, 'Emirates A388 at Moscow on Sep 10th 2017, go around from about 400 feet AGL 8nm before runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ae84b8a&opt=0', '4ae84b8a', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(122, 1, 355, 'Emirates B773 at Dubai and Newcastle on Sep 10th 2017, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ae2aedf&opt=0', '4ae2aedf', 0, 0, 0, 0, '2019-09-15 18:30:35', '2019-09-15 18:30:35', 1),
(123, 1, 176, 'PSA CRJ7 at Washington on Sep 10th 2019, flaps fail', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccdc6b0&opt=0', '4ccdc6b0', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(124, 1, 176, 'Wisconsin CRJ2 at Washington on Sep 6th 2019, gear problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccab1f4&opt=0', '4ccab1f4', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(125, 1, 176, 'United B764 at Washington on Aug 31st 2019, spoiler problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc72cb2&opt=0', '4cc72cb2', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(126, 1, 176, 'PSA CRJ7 near Charleston on Sep 2nd 2019, fuel gauge inoperative', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc52e89&opt=0', '4cc52e89', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(127, 1, 176, 'SAA A332 at Accra on Aug 5th 2019, smoke on board following ground incident', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb3a3ec&opt=0', '4cb3a3ec', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(128, 1, 176, 'PSA CRJ7 near New York on Aug 1st 2019, brakes problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb1bae6&opt=0', '4cb1bae6', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(129, 1, 176, 'TAP A332 near Lisbon on Jul 26th 2019, hydraulic problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cadc979&opt=0', '4cadc979', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(130, 1, 176, 'PSA CRJ2 at Washington on Jul 10th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca8ed21&opt=0', '4ca8ed21', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(131, 1, 176, 'Mesa CRJ7 at Portland on Jul 7th 2019, could not retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca2ff33&opt=0', '4ca2ff33', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(132, 1, 176, 'Wisconsin CRJ2 at Washington on Jun 22nd 2019, pressurization issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c990c54&opt=0', '4c990c54', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(133, 1, 176, 'British Airways B744 near Shannon on Jun 10th 2019, burning smell in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c916ead&opt=0', '4c916ead', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(134, 1, 176, 'American A321 at Washington on May 22nd 2019, went around due to TCAS RA at 800 feet AGL', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c846038&opt=0', '4c846038', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(135, 1, 176, 'Sky Regional E175 at Toronto on Mar 17th 2019, lavatory smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c68faf7&opt=0', '4c68faf7', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(136, 1, 176, 'Ethiopian B38M near Bishoftu on Mar 10th 2019, impacted terrain after departure', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4c534c4a/0023&opt=0', '4c534c4a/0023', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(137, 1, 176, 'United B772 at Washington on Mar 28th 2019, a fairly large bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6025f1&opt=0', '4c6025f1', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(138, 1, 176, 'United B738 near Baltimore on Mar 29th 2019, odour on board sends 7 passengers to hospital', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c602875&opt=0', '4c602875', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(139, 1, 176, 'Atlas B763 at Houston on Feb 23rd 2019, loss of control on approach', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4c497c3c&opt=0', '4c497c3c', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(140, 1, 176, 'Ameristar MD83 at Detroit on Mar 8th 2017, overran runway after rejected takeoff due to elevator malfunction', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4a5ecf6a&opt=0', '4a5ecf6a', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(141, 1, 176, 'United B739 near Denver on Mar 4th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c504ee4&opt=0', '4c504ee4', 0, 0, 0, 0, '2019-09-15 18:36:33', '2019-09-15 18:36:33', 1),
(142, 1, 176, 'Delta A321 at Washington on Mar 1st 2019, engine trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4e4da4&opt=0', '4c4e4da4', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(143, 1, 176, 'Endeavor CRJ2 at New York on Feb 25th 2019, wing damage possibly by jet blast of previous departing aircraft', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4b7ad8&opt=0', '4c4b7ad8', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(144, 1, 176, 'United B763 at Amsterdam on Feb 16th 2019, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c461d4c&opt=0', '4c461d4c', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(145, 1, 176, 'United B763 at Amsterdam on Feb 16th 2019, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c44a6a4&opt=0', '4c44a6a4', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(146, 1, 176, 'PSA CRJ2 at Washington on Jan 14th 2019, gear disagree after departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2e04d8&opt=0', '4c2e04d8', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(147, 1, 176, 'PSA CRJ2 near Raleigh Durham on Jan 4th 2019, fuel imbalance', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c27370a&opt=0', '4c27370a', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(148, 1, 176, 'Mesa E175 at Toronto on Nov 14th 2018, runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c17a7c7&opt=0', '4c17a7c7', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(149, 1, 176, 'United B788 near Ottawa on Dec 4th 2018, variable frequency starter generator failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c1426cd&opt=0', '4c1426cd', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(150, 1, 176, 'Southwest B737 near Kansas City on Nov 28th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c0eabd7&opt=0', '4c0eabd7', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(151, 1, 176, 'Sunwing B38M near Washington on Nov 14th 2018, multiple system failures', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c0886c4&opt=0', '4c0886c4', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(152, 1, 176, 'Jazz CRJ2 at Washington on Oct 20th 2018, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf6dcc5&opt=0', '4bf6dcc5', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(153, 1, 176, 'Piedmont E145 near Washington on Sep 27th 2018, cabin pressure problems', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4be80dcd&opt=0', '4be80dcd', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(154, 1, 176, 'Delta MD88 at Richmond on Sep 18th 2018, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdfabc4&opt=0', '4bdfabc4', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(155, 1, 176, 'United B739 at Washington on Sep 17th 2018, rejected takeoff after ATC cleared aircraft to cross the runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdf88a4&opt=0', '4bdf88a4', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(156, 1, 176, 'Brussels A332 near Birmingham on Sep 11th 2018, FMU fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd8d7c0&opt=0', '4bd8d7c0', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(157, 1, 176, 'Frontier A320 at Denver on Sep 10th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd81fcb&opt=0', '4bd81fcb', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(158, 1, 176, 'PSA CRJ2 near Chattanooga on Aug 28th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd084f5&opt=0', '4bd084f5', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(159, 1, 176, 'Fedex MD10 at Fort Lauderdale on Oct 28th 2016, main gear collapse on landing, aircraft on fire', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49ffaff0&opt=0', '49ffaff0', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(160, 1, 176, 'Horizon DH8D at Ketron Island on Aug 10th 2018, stolen aircraft crashed into forest', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4bc36d84&opt=0', '4bc36d84', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(161, 1, 176, 'Trans States E145 near New York on Aug 7th 2018, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc11497&opt=0', '4bc11497', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(162, 1, 176, 'Austrian B763 at Washington on Jul 19th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb807db&opt=0', '4bb807db', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(163, 1, 176, 'Wisconsin CRJ2 near Burlington on Jul 22nd 2018, cabin pressure problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb7fc6d&opt=0', '4bb7fc6d', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(164, 1, 176, 'Alaska A320 near Kansas City on Jul 16th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb45a90&opt=0', '4bb45a90', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(165, 1, 176, 'Mesa CRJ7 at Nashville on Jul 10th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb0f39c&opt=0', '4bb0f39c', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(166, 1, 176, 'United B764 near Zurich on Aug 23rd 2017, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ad5f83d&opt=0', '4ad5f83d', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(167, 1, 176, 'Southwest B737 enroute on Jun 3rd 2017, engine shut down in flight, inlet cowl sliced', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aa5cfcc&opt=0', '4aa5cfcc', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(168, 1, 176, 'Colgan DH8D near Washington on May 16th 2011, turbulence injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=43cb2da8&opt=0', '43cb2da8', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(169, 1, 176, 'United B763 near Geneva on May 30th 2018, engine vibrations', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9d7168&opt=0', '4b9d7168', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(170, 1, 176, 'PSA CRJ7 at Washington on Apr 27th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b7ea1c6&opt=0', '4b7ea1c6', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(171, 1, 176, 'Expressjet CRJ7 at New York on Apr 17th 2018, dropped wheel on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b7744a1&opt=0', '4b7744a1', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(172, 1, 176, 'Sky Regional E175 at Washington on Mar 25th 2018, smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b690060&opt=0', '4b690060', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(173, 1, 176, 'Commutair DH8B at Washington on Sep 24th 2016, landed without nose gear', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49e7df41&opt=0', '49e7df41', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(174, 1, 176, 'United B737 near Washington on Feb 18th 2018, dual autopilot failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b521246&opt=0', '4b521246', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(175, 1, 176, 'PSA CRJ2 near Birmingham on Feb 15th 2018, engine bleed duct failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5012a2&opt=0', '4b5012a2', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(176, 1, 176, 'American B763 at Chicago on Oct 28th 2016, rejected takeoff, fire at right hand wing due to uncontained engine failure', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49ffa115/0002&opt=0', '49ffa115/0002', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(177, 1, 176, 'Expressjet E145 en route on Jan 23rd 2018, turbulence injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b40b58e&opt=0', '4b40b58e', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(178, 1, 176, 'Ethiopian B773 at Washington on Jan 15th 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b3b9745&opt=0', '4b3b9745', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(179, 1, 176, 'United B738 at Boston on Jan 5th 2018, possible runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b35692a&opt=0', '4b35692a', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(180, 1, 176, 'United B763 at Geneva on Dec 17th 2017, flap problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b271ad3&opt=0', '4b271ad3', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(181, 1, 176, 'Volaris A319 at New York on Dec 5th 2017, lined up runway 13R instead 13L on visual Canarsie approach', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b1fab9b&opt=0', '4b1fab9b', 0, 0, 0, 0, '2019-09-15 18:36:34', '2019-09-15 18:36:34', 1),
(185, 1, 355, '', 'Are you sure you want to delete this threat?', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-15 18:52:58', '2019-09-15 18:52:58', 0),
(186, 1, 1, 'Solomon DH8A near Gizo on Apr 26th 2015, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48578c9f&opt=0', '48578c9f', 0, 0, 0, 0, '2019-09-19 09:05:28', '2019-09-19 09:05:28', 1),
(187, 1, 1, 'Airwork B733 at Honiara on Jan 26th 2014, gear collapse on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=46f15c12&opt=0', '46f15c12', 0, 0, 0, 0, '2019-09-19 09:05:28', '2019-09-19 09:05:28', 1),
(188, 1, 1, 'Strategic A320 near Honiara on May 16th 2011, cargo fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43cab5ec&opt=0', '43cab5ec', 0, 0, 0, 0, '2019-09-19 09:05:28', '2019-09-19 09:05:28', 1),
(189, 1, 1, 'SkyAirWorld E190 at Brisbane on Sep 2nd 2008, fuel venting from both wings', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40c27f93&opt=0', '40c27f93', 0, 0, 0, 0, '2019-09-19 09:05:28', '2019-09-19 09:05:28', 1),
(190, 1, 1, 'Sky Air World E170 at Honiara on Jul 27th 2008, veered off runway on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=40a60c32&opt=0', '40a60c32', 0, 0, 0, 0, '2019-09-19 09:05:28', '2019-09-19 09:05:28', 1),
(191, 1, 1, 'Air Pacific B73H near Honiara on May 29th 2008, turbulence injures four passengers', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4076b145&opt=0', '4076b145', 0, 0, 0, 0, '2019-09-19 09:05:28', '2019-09-19 09:05:28', 1),
(192, 1, 366, '', 'Test 4', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-20 13:07:50', '2019-09-20 13:07:50', 0),
(193, 1, 295, 'Norwegian B738 at Sarajevo and Belgrade on May 17th 2019, flaps fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c832811&opt=0', '4c832811', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(194, 1, 295, 'TuiFly B738 over Montenegro on Apr 9th 2019, loss comm prompts intercept', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c682389&opt=0', '4c682389', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(195, 1, 295, 'Serbia AT72 near Sofia on Nov 26th 2017, noise and vibrations felt from airframe', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b204112&opt=0', '4b204112', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(196, 1, 295, 'Aeroflot A320 near Budapest on Feb 3rd 2019, smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3c3f7c&opt=0', '4c3c3f7c', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(197, 1, 295, 'Serbia A319 near Paphos on Sep 19th 2018, cargo smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bde4e6f&opt=0', '4bde4e6f', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(198, 1, 295, 'Egypt B738 at Belgrade on Sep 12th 2018, all 4 main tyres blown on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd94a18&opt=0', '4bd94a18', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(199, 1, 295, 'Lufthansa A320 at Belgrade on Jul 22nd 2018, unsafe gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb80195&opt=0', '4bb80195', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(200, 1, 295, 'American B738 near Denver on Jul 20th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb7f81c&opt=0', '4bb7f81c', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(201, 1, 295, 'Swift AT72 at Belgrade on Jun 4th 2018, dropped engine cover on turn to final', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9e3998&opt=0', '4b9e3998', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(202, 1, 295, 'Avion Express A320 near Belgrade on Jun 5th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b98c71f&opt=0', '4b98c71f', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(203, 1, 295, 'Mediterranean B734 at Dusseldorf on May 24th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9162b3&opt=0', '4b9162b3', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(204, 1, 295, 'Swiss A320 at Zurich on Mar 4th 2018, the big bang theory', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5a5af0&opt=0', '4b5a5af0', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(205, 1, 295, 'Swiss A320 near Belgrade on Dec 24th 2017, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b2bfd59&opt=0', '4b2bfd59', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(206, 1, 295, 'Sun Express Deutschland B738 near Belgrade on Jul 26th 2017, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ac3a8fb&opt=0', '4ac3a8fb', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(207, 1, 295, 'Horizon DH8D at Belgrade on Jul 2nd 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ab2412d&opt=0', '4ab2412d', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(208, 1, 295, 'Swiftair AT72 near Frankfurt on Dec 27th 2016, first officer incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a3632fc&opt=0', '4a3632fc', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(209, 1, 295, 'Wizz A320 at Stockholm on Mar 12th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a627dcf&opt=0', '4a627dcf', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(210, 1, 295, 'Austrian F100 near Belgrade on Nov 6th 2016, engine vibrations, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a06dc48&opt=0', '4a06dc48', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1);
INSERT INTO `engine4_airport_threats` (`threat_id`, `owner_id`, `airport_id`, `title`, `body`, `phase`, `icon`, `href`, `article`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`, `imported`) VALUES
(211, 1, 295, 'Serbia A319 at Zurich on Oct 17th 2014, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47c013db&opt=0', '47c013db', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(212, 1, 295, 'Smartwings B737 near Belgrade on Jul 15th 2016, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49fe0369&opt=0', '49fe0369', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(213, 1, 295, 'Austrian A321 near Belgrade on Oct 19th 2016, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49f9d904&opt=0', '49f9d904', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(214, 1, 295, 'Austrian E195 near Belgrade on Oct 4th 2016, turbulence injures three cabin crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49f4333a&opt=0', '49f4333a', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(215, 1, 295, 'Germanwings A319 near Belgrade on Oct 8th 2016, fan failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49f2e1e5&opt=0', '49f2e1e5', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(216, 1, 295, 'TUIFly B738 near Belgrade on Aug 20th 2016, gear indication problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49ce8277&opt=0', '49ce8277', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(217, 1, 295, 'Condor A320 near Belgrade on Aug 12th 2016, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49c9736b&opt=0', '49c9736b', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(218, 1, 295, 'Onur A333 near Belgrade on May 28th 2016, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=498fee61&opt=0', '498fee61', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(219, 1, 295, 'THY B773 near Belgrade on May 26th 2016, unsmartphone', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=498dc96c&opt=0', '498dc96c', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(220, 1, 295, 'TAROM AT42 near Timisoara on May 13th 2016, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49840d09&opt=0', '49840d09', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(221, 1, 295, 'Delta B738 enroute on Jun 30th 2015, a trolley and a passenger\'s foot in the aisle', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=496a67f9&opt=0', '496a67f9', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(222, 1, 295, 'Swiftair AT72 at Sofia on Jan 21st 2016, loss of communication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=492beace&opt=0', '492beace', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(223, 1, 295, 'Serbia A319 near Larnaca on Oct 8th 2015, burning odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48d81bb8&opt=0', '48d81bb8', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(224, 1, 295, 'Serbia A319 at Amsterdam on Jul 11th 2015, false ECAM flight control message', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48932816&opt=0', '48932816', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(225, 1, 295, 'Gojet CRJ7 at Belgrade on Feb 26th 2015, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4826d55d&opt=0', '4826d55d', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(226, 1, 295, 'Austrian DH8D near Vienna on Jan 21st 2015, computer problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4809c705&opt=0', '4809c705', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(227, 1, 295, 'Serbia AT72 at Belgrade on Jan 17th 2015, engine fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48068ff5&opt=0', '48068ff5', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(228, 1, 295, 'Skywork D328 at Bern on Jun 2nd 2012, high risk of collision with helicopter on takeoff', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=47a5bbe4&opt=0', '47a5bbe4', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(229, 1, 295, 'Montenegro E190 enroute on Aug 16th 2014, both bleed air systems failed', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4793ae3f&opt=0', '4793ae3f', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(230, 1, 295, 'Novair A321 near Belgrade on Aug 19th 2014, burning smell in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4791856a&opt=0', '4791856a', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(231, 1, 295, 'Austrian F100 near Cologne on Jul 29th 2014, problems with pressure vessel', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47817951&opt=0', '47817951', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(232, 1, 295, 'Swiss A319 near Zurich on Mar 6th 2014, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=470fe3c5&opt=0', '470fe3c5', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(233, 1, 295, 'Montenegro F100 near Belgrade on Dec 7th 2013, windshield heating failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46cb06c9&opt=0', '46cb06c9', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(234, 1, 295, 'Adria CRJ9 near Zagreb on Oct 2nd 2013, anti ice problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4695a3a1&opt=0', '4695a3a1', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(235, 1, 295, 'JAT B733 near Athens on Sep 2nd 2013, fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=467debd0&opt=0', '467debd0', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(236, 1, 295, 'El Al B738 near Budapest on Jul 29th 2012, fuel system problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4537a76d&opt=0', '4537a76d', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(237, 1, 295, 'Germanwings A319 near Cologne on Dec 20th 2011, unruly passenger', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=448061ef&opt=0', '448061ef', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(238, 1, 295, 'Jettime B737 near Marsa Alam on Nov 27th 2011, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=446f031d&opt=0', '446f031d', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(239, 1, 295, 'Germanwings A319 near Zagreb on Oct 7th 2011, unruly passenger', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4446394d&opt=0', '4446394d', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(240, 1, 295, 'Germanwings A319 near Vienna on Oct 11th 2011, failure of air conditioning', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44455495&opt=0', '44455495', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(241, 1, 295, 'Amsterdam A320 near Belgrade on Sep 5th 2011, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44274b0e&opt=0', '44274b0e', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(242, 1, 295, 'Tunisair B735 at Belgrade on Jul 26th 2011, door open indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4405c9d4&opt=0', '4405c9d4', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(243, 1, 295, 'Wizzair A320 near Budapest on Jun 11th 2011, suspected bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43e0cf92&opt=0', '43e0cf92', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(244, 1, 295, 'Montenegro F100 at Tivat on May 19th 2011, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43cd09d5&opt=0', '43cd09d5', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(245, 1, 295, 'XL Airways B738 near Belgrade on Oct 18th 2008, smoke from engine after diversion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=40e80efc/0004&opt=0', '40e80efc/0004', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(246, 1, 295, 'Air France A318 and Ryanair B738 near Zurich on Jun 8th 2009, near collision', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=435b1253&opt=0', '435b1253', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(247, 1, 295, 'Air France A319 near Belgrade on Jan 1st 2011, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=435986c9&opt=0', '435986c9', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(248, 1, 295, 'Adria Airways CRJ2 at Ljubljana on Dec 18th 2010, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=434ea432&opt=0', '434ea432', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(249, 1, 295, 'Condor A320 near Belgrade on Dec 16th 2010, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=434c358c&opt=0', '434c358c', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(250, 1, 295, 'Blue Line MD83 near Kempten on Sep 20th 2009, TCAS RA', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=43302aec&opt=0', '43302aec', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(251, 1, 295, 'Transavia B738 near Belgrade on Sep 16th 2010, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43108e4b&opt=0', '43108e4b', 0, 0, 0, 0, '2019-09-22 17:36:39', '2019-09-22 17:36:39', 1),
(252, 1, 328, 'THY A333 near Ashgabat on Feb 6th 2019, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3e4bfa&opt=0', '4c3e4bfa', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(253, 1, 328, 'Jordan B734 at Kabul on Dec 10th 2016, soft landing causes right main gear collapse', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4a1e576e&opt=0', '4a1e576e', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(254, 1, 328, 'Singapore A388 near Baku on Jan 6th 2014, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46e1dcdb/0001&opt=0', '46e1dcdb/0001', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(255, 1, 328, 'Omni B763 at Kabul on Jun 20th 2014, tail strike on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=477cdd62&opt=0', '477cdd62', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(256, 1, 328, 'National Air Cargo B744 at Bagram on Apr 29th 2013, lost height shortly after takeoff following load shift and stall', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=46183bb4&opt=0', '46183bb4', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(257, 1, 328, 'Ariana Afghan B734 at Kabul on Nov 7th 2014, gear collapse on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=47d11b69&opt=0', '47d11b69', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(258, 1, 328, 'Ariana Afghan B734 at Kabul on May 8th 2014, overran runway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=474144f1&opt=0', '474144f1', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(259, 1, 328, 'Singapore A388 near Baku on Jan 6th 2014, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46e1dcdb/0000&opt=0', '46e1dcdb/0000', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(260, 1, 328, 'THY A320 near Ankara on Apr 16th 2013, abandoned mobile phone', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=460d7d5b&opt=0', '460d7d5b', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(261, 1, 328, 'Antonov A124 near Kabul on Jan 10th 2013, engine starved', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45e8ebe7&opt=0', '45e8ebe7', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(262, 1, 328, 'Danish Air Transport MD83 near Ashgabat on Sep 29th 2011, captain incapacitated due to violent seizures', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=45125d26&opt=0', '45125d26', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(263, 1, 328, 'World Airways MD11 at Kabul on Sep 22nd 2010, wing tip scrape on go-around', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4469d812&opt=0', '4469d812', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(264, 1, 328, 'Silk Way IL76 near Bagram on Jul 6th 2011, impacted mountain', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=43f45a43&opt=0', '43f45a43', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(265, 1, 328, 'Regional 1 DH8B at Kabul on Feb 6th 2011, excessive control forces', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=439079b6&opt=0', '439079b6', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(266, 1, 328, 'Pamir Airways B734 at Dubai on Nov 20th 2010, burst tyre on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=433b78de&opt=0', '433b78de', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(267, 1, 328, 'Transafrik C130 near Kabul on Oct 12th 2010, impacted mountaineous terrain', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4321af59&opt=0', '4321af59', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(268, 1, 328, 'Pamir AN24 near Kabul on May 17th 2010, impacted terrain on approach', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=42b9d241&opt=0', '42b9d241', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(269, 1, 328, 'Ariana Afghan B722 near Kandahar on May 9th 2010, unruly passenger', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42b50784&opt=0', '42b50784', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(270, 1, 328, 'Safi Airways B762 at Kabul on Oct 3rd 2009, wheel fire', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=420c0a5a&opt=0', '420c0a5a', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(271, 1, 328, 'Kam Air B762 enroute on Aug 9th 2009, no bomb at all', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41dfd20a&opt=0', '41dfd20a', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(272, 1, 328, 'Ariana Afghan B722 at Dubai on Feb 4th 2009, hydraulics problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41496dc2&opt=0', '41496dc2', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(273, 1, 328, 'One Two Go MD82 at Phuket on Sep 16th 2007, skidded off the runway and burst into flames', NULL, NULL, '/images/crash.\r\n1000\r\ngif', 'http://avherald.com/h?article=3fa5cfa4/0022&opt=0', '3fa5cfa4/0022', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(274, 1, 328, 'Ariana A300 at Kabul on Aug 30th 2004, nearly collided with UAV', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=3f292988&opt=0', '3f292988', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(275, 1, 328, 'Ariana A300 at Istanbul on  Mar 23rd 2007, overshot runway on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3f183ce9&opt=0', '3f183ce9', 0, 0, 0, 0, '2019-09-22 17:37:11', '2019-09-22 17:37:11', 1),
(276, 1, 196, 'British Airways B744 near Chicago on Sep 17th 2019, electrical burning odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccfb7b9&opt=0', '4ccfb7b9', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(277, 1, 196, 'United B738 at Tampa on Sep 16th 2019, takeoff cancelled due to engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccf1c3d&opt=0', '4ccf1c3d', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(278, 1, 196, 'Sky Regional E175 at Chicago on Aug 8th 2019, tail strike on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb86b23&opt=0', '4cb86b23', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(279, 1, 196, 'Wisconsin CRJ2 at Erie on Jul 27th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4caf0dca&opt=0', '4caf0dca', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(280, 1, 196, 'United A319 near La Grange on Jul 20th 2019, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4caab78a&opt=0', '4caab78a', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(281, 1, 196, 'Envoy E145 near Indianapolis on Jul 9th 2019, odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca2f76a&opt=0', '4ca2f76a', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(282, 1, 196, 'American B738 at Boston on Jul 3rd 2019, flight control problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9fba1a&opt=0', '4c9fba1a', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(283, 1, 196, 'Southwest B737 at Raleigh/Durham on Jun 25th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9accba&opt=0', '4c9accba', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(284, 1, 196, 'Expressjet E145 at Montreal on Jun 16th 2019, fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c970c08&opt=0', '4c970c08', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(285, 1, 196, 'United B772 at Paris on Jun 18th 2019, burning odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c95e486&opt=0', '4c95e486', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(286, 1, 196, 'Western Global MD11 at Chicago on Jun 15th 2019, engine fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9542af&opt=0', '4c9542af', 0, 0, 0, 0, '2019-09-22 17:39:57', '2019-09-22 17:39:57', 1),
(287, 1, 196, 'World Atlantic MD83 at Alexandria on Apr 20th 2018, right main gear collapsed during rollout', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b79d87a&opt=0', '4b79d87a', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(288, 1, 196, 'Trans States E145 at Peoria on May 7th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7b1539&opt=0', '4c7b1539', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(289, 1, 196, 'Skywest CRJ7 at Chicago on Jun 10th 2017, uncontained engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aa3ba31&opt=0', '4aa3ba31', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(290, 1, 196, 'Skywest CRJ2 near Bloomington on Apr 28th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c751fc5&opt=0', '4c751fc5', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(291, 1, 196, 'American B738 at Vancouver on Apr 19th 2019, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c751748&opt=0', '4c751748', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(292, 1, 196, 'United B738 at Chicago on Apr 7th 2019, could not retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6652c0&opt=0', '4c6652c0', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(293, 1, 196, 'Jetblue E190 at Boston on Mar 19th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5a13c0&opt=0', '4c5a13c0', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(294, 1, 196, 'American A321 near Chicago on Mar 14th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5784c2&opt=0', '4c5784c2', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(295, 1, 196, 'Eva B773 near Fukuoka on Nov 22nd 2017, turbulence injures 11', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b17dc45&opt=0', '4b17dc45', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(296, 1, 196, 'Envoy E145 at Chicago on Mar 1st 2019, unexpected turn on departure causes loss of separation', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4e31c5&opt=0', '4c4e31c5', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(297, 1, 196, 'Expressjet CRJ2 at Lexington on Feb 27th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4ce073&opt=0', '4c4ce073', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(298, 1, 196, 'Alaska B739 near Minneapolis on Feb 27th 2019, smell of burning plastics on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c4cd85b&opt=0', '4c4cd85b', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(299, 1, 196, 'American B738 at Hartford on Feb 26th 2019, odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4c56a5&opt=0', '4c4c56a5', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(300, 1, 196, 'United B739 at Chicago on Jan 19th 2019, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c31631a&opt=0', '4c31631a', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(301, 1, 196, 'United B753 at Chicago on Jan 1st 2019, hydraulic problem, unsafe gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c265a62&opt=0', '4c265a62', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(302, 1, 196, 'Skywest CRJ7 at Chicago on Jan 1st 2019, unsafe gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c254b26&opt=0', '4c254b26', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(303, 1, 196, 'Envoy E145 near Toledo on Dec 17th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c1b162a&opt=0', '4c1b162a', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(304, 1, 196, 'United A319 at Dallas on Dec 1st 2018, bird strike causes loss of airspeed indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c116cf5&opt=0', '4c116cf5', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(305, 1, 196, 'UPS A306 at Chicago on Nov 27th 2018, could not retract landing gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c0eb492&opt=0', '4c0eb492', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(306, 1, 196, 'United B739 near Cedar Rapids on Nov 26th 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c0d706f&opt=0', '4c0d706f', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(307, 1, 196, 'Skylease Cargo B744 at Halifax on Nov 7th 2018, overran runway on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bff5d1e&opt=0', '4bff5d1e', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(308, 1, 196, 'Spirit A320 near Indianapolis on Dec 14th 2016, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a21890f&opt=0', '4a21890f', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(309, 1, 196, 'Skywest CRJ2 at Ottawa on Oct 5th 2018, fumes from overhead bin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bfadee5&opt=0', '4bfadee5', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(310, 1, 196, 'Korean B748 at Chicago on Oct 10th 2018, could not retract landing gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4becb5c4&opt=0', '4becb5c4', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(311, 1, 196, 'ATI B762 at Sacramento on Oct 6th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bec04db&opt=0', '4bec04db', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(312, 1, 196, 'Expressjet E145 near Rochester on Sep 28th 2018, flight control problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4be68467&opt=0', '4be68467', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(313, 1, 196, 'Skywest CRJ9 at Salt Lake City and Chicago on Sep 20th 2018, dropped wheel on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdf8f48&opt=0', '4bdf8f48', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(314, 1, 196, 'Spirit A320 near Chicago on Sep 2nd 2018, fumes cause passengers and crew feel unwell', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bda2bf7&opt=0', '4bda2bf7', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(315, 1, 196, 'PSA CRJ7 near Syracuse on Sep 11th 2018, FADEC problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd8d358&opt=0', '4bd8d358', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(316, 1, 196, 'British Airways B744 at Chicago on Sep 12th 2018, could not retract nose gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bda25a3&opt=0', '4bda25a3', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(317, 1, 196, 'Canada A333 near Bangor on Sep 5th 2018, wake turbulence by B773 injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bd9571c&opt=0', '4bd9571c', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(318, 1, 196, 'Southwest B737 at Charlotte on Dec 24th 2015, clear air turbulence injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bc4e625&opt=0', '4bc4e625', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(319, 1, 196, 'Wisconsin CRJ2 near Bristol on Aug 14th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc66f76&opt=0', '4bc66f76', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(320, 1, 196, 'American A321 at Charlotte on Aug 15th 2018, engine stall', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc6651e&opt=0', '4bc6651e', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(321, 1, 196, 'Atlas B744 at New York on Jul 29th 2018, shredded tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbc2a57&opt=0', '4bbc2a57', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(322, 1, 196, 'China Airlines B744 at Chicago on Jun 21st 2018, veered off the runway and went around', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba33b1c&opt=0', '4ba33b1c', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(323, 1, 196, 'Envoy E145 at Springfield on Jun 27th 2018, departed despite runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb88f44&opt=0', '4bb88f44', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(324, 1, 196, 'Skywest CRJ7 at Cedar Rapids on Jul 12th 2018, light strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb1964c&opt=0', '4bb1964c', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(325, 1, 196, 'American B788 near Chicago on Jul 9th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bafc15c&opt=0', '4bafc15c', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(326, 1, 196, 'United B752 near Chicago on Jul 7th 2018, crew oxygen supply problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bae55cd&opt=0', '4bae55cd', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(327, 1, 196, 'Atlantic Southeast CRJ9 at Westchester on Sep 25th 2010, could not extend right hand main gear', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4316a077&opt=0', '4316a077', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(328, 1, 196, 'United B753 near Chicago on Jul 1st 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4baa18d4&opt=0', '4baa18d4', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(329, 1, 196, 'Expressjet E145 near Detroit on Jun 26th 2018, smell of smoke on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba5e5e5&opt=0', '4ba5e5e5', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(330, 1, 196, 'United B763 at Chicago on Jun 23rd 2018, gear problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba4aa9a&opt=0', '4ba4aa9a', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(331, 1, 196, 'Expressjet E145 near Memphis on Jun 13th 2018, first officer incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9e553c&opt=0', '4b9e553c', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(332, 1, 196, 'Southwest B737 at San Antonio on Jun 7th 2018, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9a3ce6&opt=0', '4b9a3ce6', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(333, 1, 196, 'United B739 at Chicago on May 29th 2018, flaps/slats issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9342fd&opt=0', '4b9342fd', 0, 0, 0, 0, '2019-09-22 17:39:58', '2019-09-22 17:39:58', 1),
(336, 1, 5, 'United B752 at Keflavik on Aug 26th 2019, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc0a9e0&opt=0', '4cc0a9e0', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(337, 1, 5, 'Iceland B752 near Kulusuk on Aug 9th 2019, failure of navigation systems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb69626&opt=0', '4cb69626', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(338, 1, 5, 'Delta B763 near Keflavik on Jun 19th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c967164&opt=0', '4c967164', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(339, 1, 5, 'Canada B789 over Atlantic on Jun 5th 2019, hydraulic fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c920b6c&opt=0', '4c920b6c', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(340, 1, 5, 'Iceland B752 near Stavanger on Jun 9th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c90c2c7&opt=0', '4c90c2c7', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(341, 1, 5, 'Delta B763 over Atlantic on May 23rd 2019, problems with oxygen', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c84f999&opt=0', '4c84f999', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(342, 1, 5, 'Iceland B752 near Glasgow on Jan 14th 2019, burning odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2eb46c&opt=0', '4c2eb46c', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(343, 1, 5, 'WOW A321 at Keflavik on Nov 1st 2018, engine shut down in flight, other engine also leaks oil', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bfb9119&opt=0', '4bfb9119', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(344, 1, 5, 'Iceland B752 near Bagotville on Oct 19th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf6dbb7&opt=0', '4bf6dbb7', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(345, 1, 5, 'Greenland A332 near Keflavik on Jul 3rd 2018, odour in galley', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4baae534&opt=0', '4baae534', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(346, 1, 5, 'SAS A333 near Keflavik on Jun 22nd 2018, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba362b1&opt=0', '4ba362b1', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(347, 1, 5, 'Iceland B752 near Vancouver on Jun 7th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba2a628&opt=0', '4ba2a628', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(348, 1, 5, 'Norwegian B738 near Belfast on Jun 16th 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9f779c&opt=0', '4b9f779c', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(349, 1, 5, 'Delta B772 over Greenland on Jun 1st 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b968f38&opt=0', '4b968f38', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(350, 1, 5, 'United B763 over Atlantic on Mar 25th 2018, fuel imbalance and fuel low indications', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6a69aa&opt=0', '4b6a69aa', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(351, 1, 5, 'Iceland B752 over Labrador Sea on Mar 5th 2018, engine fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6089a1&opt=0', '4b6089a1', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(352, 1, 5, 'Iceland B752 near Edmonton on Dec 26th 2017, generator and APU failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b32b594&opt=0', '4b32b594', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(353, 1, 5, 'Primera B738 at Alicante on Oct 17th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4afd3161&opt=0', '4afd3161', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(354, 1, 5, 'Iceland B752 at East Midlands on Sep 20th 2017, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aeaba67&opt=0', '4aeaba67', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(355, 1, 5, 'Wizz A320 near Keflavik on Sep 13th 2017, electronic cigarette smoking', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ae57a7e&opt=0', '4ae57a7e', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(356, 1, 5, 'Lufthansa B748 over Atlantic on Aug 19th 2017, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ad31c72&opt=0', '4ad31c72', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(357, 1, 5, 'SAS A343 near Keflavik on Aug 8th 2017, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4accedad&opt=0', '4accedad', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(358, 1, 5, 'Virgin Atlantic B789 near Los Angeles on Jul 30th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ac649ef&opt=0', '4ac649ef', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(359, 1, 5, 'Virgin Atlantic B789 over Greenland on Jul 29th 2017, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ac444da&opt=0', '4ac444da', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(360, 1, 5, 'Norwegian B788 over Greenland on Jul 16th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4abb5d6e&opt=0', '4abb5d6e', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(361, 1, 5, 'Iceland B752 at Toronto on Jun 25th 2017, runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ab72813&opt=0', '4ab72813', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(362, 1, 5, 'Iceland B752 at Keflavik on Jul 6th 2017, rejected takeoff due to de-icing issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ab45633&opt=0', '4ab45633', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(363, 1, 5, 'Iceland B752 near Boston on May 30th 2017, rubbery', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a9b7f4c&opt=0', '4a9b7f4c', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(364, 1, 5, 'Primera Nordic B738 at Keflavik on Apr 28th 2017, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a8424ce&opt=0', '4a8424ce', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(365, 1, 5, 'HiFly A332 at Cologne on Sep 18th 2016, touched down short of runway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49eb3f54&opt=0', '49eb3f54', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(366, 1, 5, 'Iceland B752 at Keflavik on Oct 19th 2016, performed approach below profile', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a2b797e&opt=0', '4a2b797e', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(367, 1, 5, 'SAS A320 near Malmo on Dec 26th 2016, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a2a1602&opt=0', '4a2a1602', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(368, 1, 5, 'Turkmenistan B772 over Atlantic Ocean on Oct 31st 2016, engine oil low quantity', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a07050b&opt=0', '4a07050b', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(369, 1, 5, 'Volaris A320 near Glasgow on Oct 28th 2016, loss of communication on delivery flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49ff80db&opt=0', '49ff80db', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(370, 1, 5, 'British Airways B744 at London on Jan 30th 2016, both main gear did not extend', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4932a82e&opt=0', '4932a82e', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(371, 1, 5, 'Westjet B763 near Keflavik on Sep 10th 2016, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49dd00dd&opt=0', '49dd00dd', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(372, 1, 5, 'Condor B763 over Atlantic on Sep 12th 2016, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49df31d1&opt=0', '49df31d1', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(373, 1, 5, 'WOW A321 at Baltimore on Sep 5th 2016, flock of birds on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49ddb61a&opt=0', '49ddb61a', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(374, 1, 5, 'Iceland B763 at Keflavik on May 21st 2016, could not retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=498a12c4&opt=0', '498a12c4', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(375, 1, 5, 'Iceland B763 near Boston on May 16th 2016, could not retract one main gear strut', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49888d27&opt=0', '49888d27', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(376, 1, 5, 'Sukhoi SU95 at Keflavik on Jul 21st 2013, belly landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=465ade78&opt=0', '465ade78', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(377, 1, 5, 'Iceland B752 at Brussels on Mar 10th 2016, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49531eda&opt=0', '49531eda', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(378, 1, 5, 'Icelandair B753 near Keflavik on Dec 13th 2015, pressurization problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=490c325a&opt=0', '490c325a', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(379, 1, 5, 'Icelandair B753 near Amsterdam on Dec 12th 2015, pressurization problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=490b654d&opt=0', '490b654d', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(380, 1, 5, 'Lufthansa B748 near Keflavik on Dec 10th 2015, electrical odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4909e4e6&opt=0', '4909e4e6', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(381, 1, 5, 'Delta A333 near Keflavik on Aug 20th 2015, single generator remaining', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48b339cb&opt=0', '48b339cb', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(382, 1, 5, 'Icelandair B752 at Keflavik on Feb 26th 2013, hydraulic failure, control difficulties', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45e77cdf&opt=0', '45e77cdf', 0, 0, 0, 0, '2019-09-22 17:55:37', '2019-09-22 17:55:37', 1),
(383, 1, 5, 'Air Berlin A320 at Keflavik on May 15th 2015, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48672b2a&opt=0', '48672b2a', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(384, 1, 5, 'Iceland B752 near Keflavik on Apr 7th 2015, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=484814b3&opt=0', '484814b3', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(385, 1, 5, 'Iceland B752 at Copenhagen on Jan 26th 2015, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=480de420&opt=0', '480de420', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(386, 1, 5, 'Lingus A333 near Keflavik on Dec 9th 2014, engine problem', NULL, NULL, '/images/in\r\n1000\r\ncident.gif', 'http://avherald.com/h?article=47e81c78&opt=0', '47e81c78', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(387, 1, 5, 'SAS A343 near Keflavik on Aug 10th 2014, instrument failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=478b6e4d&opt=0', '478b6e4d', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(388, 1, 5, 'Emirates B773 over Atlantic on Mar 16th 2014, toilets inoperative', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4718cc54&opt=0', '4718cc54', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(389, 1, 5, 'Icelandair B752 near Glasgow on Nov 17th 2013, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46bc4af4&opt=0', '46bc4af4', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(390, 1, 5, 'LOT B788 near Toronto on Sep 28th 2013, technical problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=469305b9&opt=0', '469305b9', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(391, 1, 5, 'LOT B788 at Toronto on Sep 28th 2013, transponder problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4694a17f&opt=0', '4694a17f', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(392, 1, 5, 'Icelandair B752 near London on Jun 4th 2009, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41aaa9d3&opt=0', '41aaa9d3', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(393, 1, 5, 'Primera B738 near Keflavik on Mar 6th 2013, cabin pressure problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45ec2719&opt=0', '45ec2719', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(394, 1, 5, 'Icelandair B752 near Edmonton on Feb 9th 2013, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45d892c0&opt=0', '45d892c0', 0, 0, 0, 0, '2019-09-22 17:55:38', '2019-09-22 17:55:38', 1),
(395, 1, 96, 'Comair B738 near Lanseria on Jul 8th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb4b089&opt=0', '4cb4b089', 0, 0, 0, 0, '2019-09-22 17:56:25', '2019-09-22 17:56:25', 1),
(396, 1, 96, 'Nationwide B732 at Cape Town on Nov 7th 2007, engine detached from win&#xD;\nf6a&#xD;\ng after  reverser deployment during takeoff', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fcf217d/0029&opt=0', '3fcf217d/0029', 0, 0, 0, 0, '2019-09-22 17:56:25', '2019-09-22 17:56:25', 1),
(397, 1, 96, 'Nationwide B732 at Cape Town on Nov 7th 2007, engine detached from wing after  reverser deployment during takeoff', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fcf217d/0000&opt=0', '3fcf217d/0000', 0, 0, 0, 0, '2019-09-22 17:56:25', '2019-09-22 17:56:25', 1),
(398, 1, 393, 'Canada B789 near Tokyo on Sep 1st 2019,  cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc482c2&opt=0', '4cc482c2', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(399, 1, 393, 'JAL B788 near Tokyo on Aug 28h 2019, muttering away', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc32487&opt=0', '4cc32487', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(400, 1, 393, 'Air China A333 at Beijing on Aug 27th 2019, aircraft on fire at the gate', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4cc111cc&opt=0', '4cc111cc', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(401, 1, 393, 'JAL B788 over Sea of Japan on Ag 22nd 2019, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cbe025d&opt=0', '4cbe025d', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(402, 1, 393, 'ANA B788 near Beijing on Aug 15th 2019, turbulence injures 4 people', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4cbcbd6f&opt=0', '4cbcbd6f', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(403, 1, 393, 'ANA B788 near Tokyo on Jul 17th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca7a528&opt=0', '4ca7a528', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(404, 1, 393, 'PIA B772 at Islamabad and Beijing on Jul 11th 2019, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca53130&opt=0', '4ca53130', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(405, 1, 393, 'Skymark B738 and ANA B789 at Tokyo on Jun 15th 2019, ATC operational error, B789 crosses runway while B738 lands', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c951e26&opt=0', '4c951e26', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(406, 1, 393, 'Vanilla A320 near Miyazaki on Aug 27th 2018, turbulence injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bd3ed6d&opt=0', '4bd3ed6d', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(407, 1, 393, 'Polar Cargo B748 at Tokyo on Jul 15th 2017, overran runway on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4accc5bc&opt=0', '4accc5bc', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(408, 1, 393, 'JAL B788 at San Diego on Jun 5th 2019, slat trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8eb9d6&opt=0', '4c8eb9d6', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(409, 1, 393, 'ANA B788 near Tokyo on Jun 1st 2019, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8d41ba&opt=0', '4c8d41ba', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(410, 1, 393, 'Hong Kong A332 at Hong Kong on May 29th 2019, a screw loose or two', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c898081&opt=0', '4c898081', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(411, 1, 393, 'Thai A333 at Tokyo on May 27th 2019, burst tyre on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c87a9e1&opt=0', '4c87a9e1', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(412, 1, 393, 'Qantas B744 over Pacific on May 12th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7dda0b&opt=0', '4c7dda0b', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(413, 1, 393, 'Tway B738 near Tokyo on May 2nd 2019, turbulence injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c7affd1&opt=0', '4c7affd1', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(414, 1, 393, 'Alitalia B772 near Tokyo on May 2nd 2019, turbulence injures 3 cabin crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c772192&opt=0', '4c772192', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(415, 1, 393, 'Alitalia A332 at Milan on Apr 15th 2019, autothrust control problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6c8ab6&opt=0', '4c6c8ab6', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(416, 1, 393, 'Hawaiian A332 at Tokyo on Jan 28th 2019, runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c373df6&opt=0', '4c373df6', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(417, 1, 393, 'ANA B788 at Osaka on Jan 17th 2019, both engines rolled back after landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2fe53a&opt=0', '4c2fe53a', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1);
INSERT INTO `engine4_airport_threats` (`threat_id`, `owner_id`, `airport_id`, `title`, `body`, `phase`, `icon`, `href`, `article`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`, `imported`) VALUES
(418, 1, 393, 'ANA A21N at Tokyo on Jan 5th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c293c7a&opt=0', '4c293c7a', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(419, 1, 393, 'JAL B772 at Osaka on Dec 19th 2018, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c1d1481&opt=0', '4c1d1481', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(420, 1, 393, 'JAL B789 at Shanghai on Nov 13th 2018, runway incursion forces rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c03c0f9&opt=0', '4c03c0f9', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(421, 1, 393, 'ANA A21N at Okayama on Nov 7th 2018, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bff954c&opt=0', '4bff954c', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(422, 1, 393, 'ANA B738 near Tokyo on May 27th 2016, cabin pressure problems', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=499224f7&opt=0', '499224f7', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(423, 1, 393, 'China Airlines A333 near Tokyo on Oct 1st 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4be6a977&opt=0', '4be6a977', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(424, 1, 393, 'Delta B763 near Tokyo on Sep 23rd 2018, fuel pump failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4be108b2&opt=0', '4be108b2', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(425, 1, 393, 'Jetstar Japan A320 enroute on Jul 9th 2016, unreliable airspeeds', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49b0ffa9&opt=0', '49b0ffa9', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(426, 1, 393, 'Delta B763 near Tokyo on Sep 15th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdb8813&opt=0', '4bdb8813', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(427, 1, 393, 'Canada B773 over Pacific on Aug 24th 2018, engine oil leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bcc6860&opt=0', '4bcc6860', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(428, 1, 393, 'ANA B763 near Tokyo on Aug 21st 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bcb0ff7&opt=0', '4bcb0ff7', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(429, 1, 393, 'Korean B773 at Tokyo on May 27th 2016, rejected takeoff due to engine fire', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=498e2ae5&opt=0', '498e2ae5', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(430, 1, 393, 'Solaseed B738 at Miazaki on Aug 17th 2018, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc91362&opt=0', '4bc91362', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(431, 1, 393, 'American B772 enroute on Aug 16th 2018, dropped panel in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc7c429&opt=0', '4bc7c429', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(432, 1, 393, 'Solaseed B738 at Oita on Aug 16th 2018, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc7c0b5&opt=0', '4bc7c0b5', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(433, 1, 393, 'Alitalia B772 near Sapporo on Aug 7th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc117eb&opt=0', '4bc117eb', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(434, 1, 393, 'PAL B773 near Tokyo on Aug 2nd 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbdefd1&opt=0', '4bbdefd1', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(435, 1, 393, 'Canada B788 at Tokyo on Jul 30th 2018, turns off runway into dead end', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbbea30&opt=0', '4bbbea30', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(436, 1, 393, 'Korean B773 at Tokyo Narita on Jun 29th 2018, main gear axle fractured on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4ba7efc8&opt=0', '4ba7efc8', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(437, 1, 393, 'Delta B763 at Manila on Jul 18th 2018, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb58cf7&opt=0', '4bb58cf7', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(438, 1, 393, 'ANA B789 at Singapore on Jul 13th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb3ce67&opt=0', '4bb3ce67', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(439, 1, 393, 'Busan A321 near Tokyo on Jul 14th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb2eb67&opt=0', '4bb2eb67', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(440, 1, 393, 'Asiana A359 over Pacific on Jul 8th 2018, abnormal tyre pressure indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4baf215c&opt=0', '4baf215c', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(441, 1, 393, 'ANA B788 at Tokyo on Jun 30th 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba92c24&opt=0', '4ba92c24', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(442, 1, 393, 'ANA B763 near Osaka on Jun 27th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba6855e&opt=0', '4ba6855e', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(443, 1, 393, 'United B738 at Tokyo on Jun 26th 2018, blew tyre, another deflated on taxiing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba5e1a8&opt=0', '4ba5e1a8', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(444, 1, 393, 'JAL B773 near Sendai on Jun 24th 2018, turbulence injures one flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4ba522be&opt=0', '4ba522be', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(445, 1, 393, 'ANA B788 near Helsinki on Jun 23rd 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba3ebc0&opt=0', '4ba3ebc0', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(446, 1, 393, 'American B772 at Dallas on Jun 10th 2018, moderate turbulence on approach', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b9c35d3&opt=0', '4b9c35d3', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(447, 1, 393, 'Korean B772 near Tokyo on Jun 2nd 2018, cargo smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b95d3bb&opt=0', '4b95d3bb', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(448, 1, 393, 'JAL B763 at Kumamoto on May 24th 2018, raining engine', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b9008a0&opt=0', '4b9008a0', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(449, 1, 393, 'ANA B763 at Tokyo on May 21st 2018, smoke in cabin', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b8de774&opt=0', '4b8de774', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(450, 1, 393, 'United B789 at Tokyo on May 14th 2018, rejected takeoff due to burst tyre', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8a0e1f&opt=0', '4b8a0e1f', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(451, 1, 393, 'ANZ B789 near Auckland on Dec 5th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b1f3235&opt=0', '4b1f3235', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(452, 1, 393, 'United B789 near Tokyo on Apr 22nd 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b7b8e05&opt=0', '4b7b8e05', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(453, 1, 393, 'ANZ B789 at Auckland on Apr 21st 2018, cabin did not pressurize properly', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b7a087f&opt=0', '4b7a087f', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(454, 1, 393, 'Thai B744 at Tokyo on Apr 11th 2018, GPWS alert on short final', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b771e84&opt=0', '4b771e84', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(455, 1, 393, 'Thai AirAsia X A333 at Tokyo on Feb 14th 2017, runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a4f2655&opt=0', '4a4f2655', 0, 0, 0, 0, '2019-09-22 18:04:36', '2019-09-22 18:04:36', 1),
(456, 1, 362, 'Qatar A359 near Salalah on Jul 11th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca494eb&opt=0', '4ca494eb', 0, 0, 0, 0, '2019-09-22 19:23:53', '2019-09-22 19:23:53', 1),
(457, 1, 362, 'Arabia A320 at Sharjah on Sep 18th 2018, intersection line up departed in wron&#xD;\n1000&#xD;\ng direction', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bded52d&opt=0', '4bded52d', 0, 0, 0, 0, '2019-09-22 19:23:53', '2019-09-22 19:23:53', 1),
(458, 1, 362, 'Salam A320 at Sohar and Salalah on Sep 8th 2017, tyre damage on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ae2b7ac&opt=0', '4ae2b7ac', 0, 0, 0, 0, '2019-09-22 19:23:53', '2019-09-22 19:23:53', 1),
(459, 1, 362, 'Rotana E145 near Al Ain on Sep 12th 2015, PFD1, MFD1 and EICAS went blank, electrical odour in cockpit', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4a0e2027&opt=0', '4a0e2027', 0, 0, 0, 0, '2019-09-22 19:23:53', '2019-09-22 19:23:53', 1),
(460, 1, 362, 'Oman B738 near Muscat on Jun 17th 2013, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46413dd3&opt=0', '46413dd3', 0, 0, 0, 0, '2019-09-22 19:23:53', '2019-09-22 19:23:53', 1),
(461, 1, 232, 'Norwegian B789 at Los Angeles on Sep 13th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cce83e3&opt=0', '4cce83e3', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(462, 1, 232, 'Evelop A333 over Ethiopia on Aug 20th 2019, severe turbulence injures 16', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4cbd6d41&opt=0', '4cbd6d41', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(463, 1, 232, 'France A321 near Bordeaux on Aug 16th 2019, indication of loss of pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cba3de2&opt=0', '4cba3de2', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(464, 1, 232, 'TAROM B738 at Madrid on Oct 4th 2018, near collision with fighter aircraft', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cba2878&opt=0', '4cba2878', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(465, 1, 232, 'Aeromexico B789 over Atlantic on Jul 10th 2019, loss of communication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca38831&opt=0', '4ca38831', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(466, 1, 232, 'Iberia A20N at Athens on Jun 11th 2019, engine fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c970ee8&opt=0', '4c970ee8', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(467, 1, 232, 'BoA B763 at Madrid on Jun 7th 2019, engine ingested foreign object', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c90c929&opt=0', '4c90c929', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(468, 1, 232, 'Ryanair B738 near Madrid on Jun 2nd 2019, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8b76d9&opt=0', '4c8b76d9', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(469, 1, 232, 'American A332 at Philadelphia on May 31st 2019, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8ac5fc&opt=0', '4c8ac5fc', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(470, 1, 232, 'Iberia A346 over Atlantic on May 21st 2019, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c83bdca&opt=0', '4c83bdca', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(471, 1, 232, 'Iberia A346 over Atlantic on May 17th 2019, technical fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c813561&opt=0', '4c813561', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(472, 1, 232, 'Swiss BCS1 at Madrid on May 13th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7e9c74&opt=0', '4c7e9c74', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(473, 1, 232, 'Iberia A333 at Johannesburg on Apr 24th 2019, could not fully retract landing gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c726cdf&opt=0', '4c726cdf', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(474, 1, 232, 'Aeromexico B789 near Mexico City on Apr 20th 2019, electrical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6fbb7e&opt=0', '4c6fbb7e', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(475, 1, 232, 'Klasjet B735 at Madrid on Apr 5th 2019, navigation malfunction', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c65913a&opt=0', '4c65913a', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(476, 1, 232, 'Iberia A346 near Bogota on Jan 17th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2ff20e&opt=0', '4c2ff20e', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(477, 1, 232, 'Wizz A320 near Madrid on Nov 10th 2018, descent below cleared level causes near collision', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2b4349&opt=0', '4c2b4349', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(478, 1, 232, 'Iberia A346 at Buenos Aires on Dec 1st 2018, burst tyre on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c100bf4&opt=0', '4c100bf4', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(479, 1, 232, 'Iberia A320 at Madrid on Nov 1st 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c005a3f&opt=0', '4c005a3f', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(480, 1, 232, 'Argentinas A343 at Buenos Aires on Oct 26th 2018, gear doors did not close', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf97e1f&opt=0', '4bf97e1f', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(481, 1, 232, 'Iberia A359 over Atlantic on Oct 6th 2018, technical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4beacef7&opt=0', '4beacef7', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(482, 1, 232, 'Iberia A359 near Halifax on Sep 11th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd97c82&opt=0', '4bd97c82', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(483, 1, 232, 'Iberia Express A321 at Madrid on Sep 18th 2018, inflight nesting not recommended', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bde5058&opt=0', '4bde5058', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(484, 1, 232, 'American B763 near Boston on Aug 30th 2018, ND failure, fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd08fa7&opt=0', '4bd08fa7', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(485, 1, 232, 'American B763 near Halifax on Aug 29th 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd08e3b&opt=0', '4bd08e3b', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(486, 1, 232, 'Iberia A346 at Quito on Aug 11th 2018, balked landing and tyre damage', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc45278&opt=0', '4bc45278', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(487, 1, 232, 'Iberia A319 at Barcelona on Aug 17th 2018, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bcb13f9&opt=0', '4bcb13f9', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(488, 1, 232, 'American B763 over Atlantic on Aug 20th 2018, odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bc9c61c&opt=0', '4bc9c61c', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(489, 1, 232, 'Wizz A320 near Milan on Jul 29th 2018 ,smell of smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbb76fa&opt=0', '4bbb76fa', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(490, 1, 232, 'Iberia A320 at Madrid on Jul 3rd 2018, fumes and smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb9a91d&opt=0', '4bb9a91d', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(491, 1, 232, 'Iberia A346 at Mexico City on Jul 18th 2018, could not retract landing gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb59367&opt=0', '4bb59367', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(492, 1, 232, 'Avianca B788 near Santa Maria on Jun 23rd 2018, electrical problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba54a56&opt=0', '4ba54a56', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(493, 1, 232, 'Ryanair B738 near Madrid on May 20th 2018, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8f6d7e&opt=0', '4b8f6d7e', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(494, 1, 232, 'TAM A332 over Atlantic on Sep 2nd 2013, turbulence injures 15', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=467cef2b&opt=0', '467cef2b', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(495, 1, 232, 'Europa B738 at Madrid on Apr 30th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b80604c&opt=0', '4b80604c', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(496, 1, 232, 'American A332 at Charlotte on Apr 16th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b77a9cb&opt=0', '4b77a9cb', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(497, 1, 232, 'Canada A333 over Atlantic on Mar 14th 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6492f1&opt=0', '4b6492f1', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(498, 1, 232, 'Transavia B738 at Malaga on Dec 2nd 2016, landed below final fuel reserve after diversion and go around due to runway incursion', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4b5c6300&opt=0', '4b5c6300', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(499, 1, 232, 'Iberia A346 at Mexico City on Feb 28th 2018, rejected takeoff due to engine indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b588edd&opt=0', '4b588edd', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(500, 1, 232, 'Iberia A332 over Russia on Feb 9th 2018, suspected fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4e1e0a&opt=0', '4b4e1e0a', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(501, 1, 232, 'Iberia Express A321 at Palma Mallorca on Jan 23rd 2018, cabin pressure fault indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b401927&opt=0', '4b401927', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(502, 1, 232, 'Europa B738 at Madrid on Jan 6th 2018, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b363f5a&opt=0', '4b363f5a', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(503, 1, 232, 'Europa E195 at Madrid on Nov 19th 2017, rejected takeoff due to uncommanded yaw', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b14e7af&opt=0', '4b14e7af', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(504, 1, 232, 'Brussels A320 at Madrid on Sep 27th 2017, hard landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4af7bb44&opt=0', '4af7bb44', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(505, 1, 232, 'Swift AT72 near Alicante on Sep 9th 2017, stall in icing conditions', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aefca90&opt=0', '4aefca90', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(506, 1, 232, 'THY A333 at Istanbul on Aug 27th 2017, technical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ad8c7b3&opt=0', '4ad8c7b3', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(507, 1, 232, 'Europa E195 at Zurich on Jul 2nd 2017, very bad smell in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ab197f4&opt=0', '4ab197f4', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(508, 1, 232, 'Iberia Express A320 at Santa Cruz de la Palma on Jun 25th 2017, flock of birds', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aad993c&opt=0', '4aad993c', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(509, 1, 232, 'Europa A332 at Madrid on Oct 17th 2014, takeoff despite vehicle on runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47ef44db&opt=0', '47ef44db', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(510, 1, 232, 'American B763 near Paris on Jun 4th 2017, fumes on board injure two cabin crew, passengers suffer from nausea', NULL, NULL, '/images/accid\r\n1bb5\r\nent.gif', 'http://avherald.com/h?article=4a9ecf5a&opt=0', '4a9ecf5a', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(511, 1, 232, 'Iberia Express A320 at London on May 25th 2017, smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a98b73f&opt=0', '4a98b73f', 0, 0, 0, 0, '2019-09-22 21:35:37', '2019-09-22 21:35:37', 1),
(512, 1, 232, 'Europa B788 near Miami on May 24th 2017, windshield cracked after lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a9753b9&opt=0', '4a9753b9', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(513, 1, 232, 'TAROM B733 at Madrid on May 4th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a886aab&opt=0', '4a886aab', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(514, 1, 232, 'Europa A332 at Madrid on Apr 11th 2017, brakes problem on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a77f1fd&opt=0', '4a77f1fd', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(515, 1, 232, 'Europa E195 at Madrid on Jun 15th 2016, door open indication in flight, mechanics examining on ground falls off aircraft', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49a2b22c&opt=0', '49a2b22c', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(516, 1, 232, 'Nostrum CRJX at Pamplona and Madrid on Feb 1st 2015, burst one tyre, one tyre with flat spot', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=49460707&opt=0', '49460707', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(517, 1, 232, 'LATAM Chile B763 near Guayaquil on Feb 27th 2017, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a599aba&opt=0', '4a599aba', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(518, 1, 232, 'Easyjet A319 near Madrid on Sep 21st 2014, jolt injures cabin crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=47b5f963&opt=0', '47b5f963', 0, 0, 0, 0, '2019-09-22 21:35:38', '2019-09-22 21:35:38', 1),
(519, 1, 231, 'KLM B738 at Amsterdam on Jul 24th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cafbc1b&opt=0', '4cafbc1b', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(520, 1, 231, 'Brussels A319 near Brussels on Jul 13th 2019, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca5e588&opt=0', '4ca5e588', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(521, 1, 231, 'Easyjet A319 at London on May 25th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c864e8c&opt=0', '4c864e8c', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(522, 1, 231, 'Thomas Cook A321 near Glasgow on Jul 25th 2018, suspected tyre damage', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb9b07c&opt=0', '4bb9b07c', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(523, 1, 231, 'Privilege Style B752 at Palma Mallorca and Ibiza on Sep 4th 2015, landed below final fuel reserve', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48d742f8&opt=0', '48d742f8', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(524, 1, 231, 'Easyjet A320 at Ibiza on Sep 3rd 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ade77d8&opt=0', '4ade77d8', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(525, 1, 231, 'Europa AT72 at Ibiza on Aug 18th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ad311fa&opt=0', '4ad311fa', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(526, 1, 231, 'Thomson B752 near Rennes on Jul 17th 2017, loss of communication prompts intercept', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4abc4d46&opt=0', '4abc4d46', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(527, 1, 231, 'Jet2.com B733 near Barcelona on Jul 16th 2017, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4abb6ac0&opt=0', '4abb6ac0', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(528, 1, 231, 'Jet2 B733 at East Midlands on Sep 3rd 2014, electrical problems resulting in smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=479ce9f1&opt=0', '479ce9f1', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(529, 1, 231, 'Transavia B738 at Ibiza on Jun 2nd 2015, door indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4875b0dc&opt=0', '4875b0dc', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(530, 1, 231, 'Easyjet A319 near Bordeaux on Sep 20th 2014, weather radar problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47a9c9ab&opt=0', '47a9c9ab', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(531, 1, 231, 'Jet2 B738 at Ibiza on Jul 21st 2011, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4400977d/0000&opt=0', '4400977d/0000', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(532, 1, 231, 'Ryanair B738 and American B763 at Barcelona on Apr 14th 2011, both aircraft departed despite ground collision and passenger complaints', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=45363621&opt=0', '45363621', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(533, 1, 231, 'Jet2 B738 at Manchester on Jun 20th 2012, autopilot problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4519aa06&opt=0', '4519aa06', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(534, 1, 231, 'Ryanair near Paris on May 15th 2012, technical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44f96db5&opt=0', '44f96db5', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(535, 1, 231, 'Air Berlin B738 near Ibiza on Feb 16th 2012, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44b01e25&opt=0', '44b01e25', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(536, 1, 231, 'Jet2 B738 at Ibiza on Jul 21st 2011, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4400977d&opt=0', '4400977d', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(537, 1, 231, 'Itali Airlines MD82 at Rome on Sep 13th 2009, unsafe gear after takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41fb1f5b&opt=0', '41fb1f5b', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(538, 1, 231, 'Spanair MD82 at Compostela on Aug 20th 2009, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41e938fb&opt=0', '41e938fb', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(539, 1, 231, 'Transavia B737 near Amsterdam on Jul 20th 2009, returned twice', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41cff968&opt=0', '41cff968', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(540, 1, 231, 'Thomson Airways B733 enroute on Jul 18th 2009, unruly passenger', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41ce7ba9&opt=0', '41ce7ba9', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(541, 1, 231, 'Thomas Cook A321 at Manchester on Jul 18th 2008, severe hard landing', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=41b07c82&opt=0', '41b07c82', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(542, 1, 231, 'Spanair MD82 near Palma Mallorca on Sep 4th 2008, technical trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40c3549f&opt=0', '40c3549f', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(543, 1, 231, 'Spanair MD82 at Madrid on Aug 27th 2008, pressurization issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40bd86d3&opt=0', '40bd86d3', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(544, 1, 231, 'Thomsonfly B733 at Ibiza on May 2nd 2008, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4061ddc0&opt=0', '4061ddc0', 0, 0, 0, 0, '2019-09-22 21:39:55', '2019-09-22 21:39:55', 1),
(545, 1, 114, 'Joon A343 at Mahe on Nov 4th 2018, suspected bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c00eaef&opt=0', '4c00eaef', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(546, 1, 114, 'THY A333 near Jeddah on Jul 28th 2018, engine oil leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbd36c6&opt=0', '4bbd36c6', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(547, 1, 114, 'Emirates A388 near Mauritius on Jul 14th 2017, descended below cleared level causing TCAS resolution', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4abb6417&opt=0', '4abb6417', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(548, 1, 114, 'Blue Panorama B752 near Mahe on Jul 11th 2012, cracked passenger window', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4529b9a3&opt=0', '4529b9a3', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(549, 1, 114, 'Air Seychelles B763 near Geneva on Oct 1st 2010, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=431acb77&opt=0', '431acb77', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(550, 1, 114, 'Eurofly A332 near  Cairo on Sep 27th 2009, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42071288&opt=0', '42071288', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(551, 1, 114, 'Air Seychelles B762 at Singapore on May 6th 2009, engine failure on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41940f01&opt=0', '41940f01', 0, 0, 0, 0, '2019-09-22 22:13:08', '2019-09-22 22:13:08', 1),
(552, 1, 172, 'Euroatlantic B763 near Gander on Sep 5th 2019, smoking CDU', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccbef08&opt=0', '4ccbef08', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(553, 1, 172, 'United B739 near Portland on Sep 4th 2019, airframe vibrations', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc689ec&opt=0', '4cc689ec', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(554, 1, 172, 'United B78X near Boston on Aug 8th 2019, periodic smell of smoke', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb880ff&opt=0', '4cb880ff', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(555, 1, 172, 'United B752 at Porto on Aug 6th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb431ac&opt=0', '4cb431ac', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(556, 1, 172, 'S7 A319 at Barcelona on Jul 7th 2019, wrong turn causes loss of separations with 2 other aircraft', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb19094&opt=0', '4cb19094', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(557, 1, 172, 'United B752 at San Francisco on Jul 26th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cad26f4&opt=0', '4cad26f4', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(558, 1, 172, 'Jetblue A320 near New York on Jul 14th 2019, passengers and crew become sick', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4ca5e77b&opt=0', '4ca5e77b', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(559, 1, 172, 'United B738 at San Jose on Jul 11th 2019, tail scrape on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca41601&opt=0', '4ca41601', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(560, 1, 172, 'United A319 at New York and Newark on Jun 29th 2019, hydraulic issues', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c9cad94&opt=0', '4c9cad94', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(561, 1, 172, 'Commutair E145 at Montreal on Jun 15th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9a4f68&opt=0', '4c9a4f68', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(562, 1, 172, 'United B752 near Omaha on Jun 19th 2019, fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9711e5&opt=0', '4c9711e5', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(563, 1, 172, 'United B752 at Newark on Jun 15th 2019, hard landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c93f411&opt=0', '4c93f411', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(564, 1, 172, 'Canada B788 at Vancouver on May 18th 2019, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c87a3e2&opt=0', '4c87a3e2', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(565, 1, 172, 'United A320 at Seattle on May 21st 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c86fed6&opt=0', '4c86fed6', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(566, 1, 172, 'United B772 near Nagasaki on Apr 6th 2019, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6be6f1&opt=0', '4c6be6f1', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(567, 1, 172, 'Commutair E145 at Presque Isle on Mar 4th 2019, runway excursion, hard landing and gear collapse', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c4f9a68&opt=0', '4c4f9a68', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(568, 1, 172, 'United B763 at Munich on Mar 12th 2019, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c555573&opt=0', '4c555573', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(569, 1, 172, 'Transat B738 near Newark on Mar 9th 2019, cargo smoke indication', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c52f14a&opt=0', '4c52f14a', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(570, 1, 172, 'United B739 near Houston on Mar 10th 2019, engine problem results in evacuation', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5440d3&opt=0', '4c5440d3', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(571, 1, 172, 'United B752 over Atlantic on Feb 28th 2019, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4cf583&opt=0', '4c4cf583', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(572, 1, 172, 'Jetblue A320 at Santo Domingo on Feb 25th 2019, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4c51b4&opt=0', '4c4c51b4', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(573, 1, 172, 'Porter DH8D near Scranton on Feb 7th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3e46e6&opt=0', '4c3e46e6', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(574, 1, 172, 'American B738 at Miami on Feb 4th 2019, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3cf248&opt=0', '4c3cf248', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(575, 1, 172, 'United B763 at Geneva on Feb 3rd 2019, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3c45c3&opt=0', '4c3c45c3', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(576, 1, 172, 'United B738 at San Jose on Feb 1st 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3a241e&opt=0', '4c3a241e', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(577, 1, 172, 'Commut E145 at Greenville on Jan 28th 2019, smoke detector activated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3815d0&opt=0', '4c3815d0', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(578, 1, 172, 'Jetblue A320 at Orlando on Dec 3rd 2018, fumes on board, passenger and cabin crew sick', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c12e0f0&opt=0', '4c12e0f0', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(579, 1, 172, 'El Al B789 at Tel Aviv on Mar 29th 2018, departure using wrong takeoff performance data', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4c0febbf&opt=0', '4c0febbf', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(580, 1, 172, 'United B752 at Newark on Oct 31st 2018, slat let go', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bfb6427&opt=0', '4bfb6427', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(581, 1, 172, 'Swiss A333 near Paris on Nov 21st 2014, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47d97ff4&opt=0', '47d97ff4', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(582, 1, 172, 'United B738 at New York on Oct 23rd 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf6221c&opt=0', '4bf6221c', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(583, 1, 172, 'United A320 at Fort Myers on Oct 10th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bed6c35&opt=0', '4bed6c35', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(584, 1, 172, 'Delta B763 near Newark on Sep 24th 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4be2810a&opt=0', '4be2810a', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(585, 1, 172, 'Lufthansa A333 over Atlantic on Mar 12th 2018, first officer incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b671ffe&opt=0', '4b671ffe', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(586, 1, 172, 'United B752 near Denver on Sep 18th 2018, odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdd9121&opt=0', '4bdd9121', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(587, 1, 172, 'India B773 at New York on Sep 11th 2018, multiple instruments including localizer receivers lost', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd8a3c1&opt=0', '4bd8a3c1', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(588, 1, 172, 'American B738 at Newark on Sep 3rd 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bd3e9e7&opt=0', '4bd3e9e7', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(589, 1, 172, 'Canada B789 at Vancouver and Newark on Aug 26th 2018, left is where the right thumb is', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bcfd0e2&opt=0', '4bcfd0e2', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(590, 1, 172, 'Spirit A321 near Jacksonville on Aug 22nd 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bcbb724&opt=0', '4bcbb724', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(591, 1, 172, 'Republic E170 near Minneapolis on Aug 20th 2018, unruly air marshal', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bca78b7&opt=0', '4bca78b7', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(592, 1, 172, 'United B738 at Newark on Jul 26th 2018, flight control problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bba4145&opt=0', '4bba4145', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(593, 1, 172, 'United B737 at Santa Ana on Jul 13th 2018, engine oil indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb91548&opt=0', '4bb91548', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(594, 1, 172, 'United B752 near Las Vegas on Jul 10th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb06be1&opt=0', '4bb06be1', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(595, 1, 172, 'Euro Atlantic B772 at Paris on Jul 6th 2018, could not retract nose gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bae6d1a&opt=0', '4bae6d1a', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(596, 1, 172, 'United B739 at Phoenix on Jun 29th 2018, rejected takeoff due to mechanical issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba88cd7&opt=0', '4ba88cd7', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(597, 1, 172, 'United B752 over Atlantic on Jun 23rd 2018, electrical problems, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba3e80a&opt=0', '4ba3e80a', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(598, 1, 172, 'United B772 near Halifax on May 28th 2018, engine oil leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b951d75&opt=0', '4b951d75', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(599, 1, 172, 'United B763 at Munich on May 30th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b93cb44&opt=0', '4b93cb44', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(600, 1, 172, 'Delta B752 at Dallas on May 23rd 2018, could not pressurize cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b90b704&opt=0', '4b90b704', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(601, 1, 172, 'United B764 near Shannon on May 23rd 2018, cabin pressure problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8f68ed&opt=0', '4b8f68ed', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(602, 1, 172, 'Delta MD88 near Newark on May 22nd 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8ec687&opt=0', '4b8ec687', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(603, 1, 172, 'United B752 at Newark on May 22nd 2018, smoking engine', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8ec2f8&opt=0', '4b8ec2f8', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(604, 1, 172, 'United B764 near Zurich on May 20th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8d6334&opt=0', '4b8d6334', 0, 0, 0, 0, '2019-09-23 00:16:54', '2019-09-23 00:16:54', 1),
(605, 1, 172, 'United B763 at Geneva on May 9th 2018, gear problem after departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b85ea12&opt=0', '4b85ea12', 0, 0, 0, 0, '2019-09-23 00:16:55', '2019-09-23 00:16:55', 1),
(606, 1, 172, 'Southwest B737 near Cleveland on May 2nd 2018, cracked cabin window', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b81469f&opt=0', '4b81469f', 0, 0, 0, 0, '2019-09-23 00:16:55', '2019-09-23 00:16:55', 1),
(607, 1, 172, 'Fedex MD11 near Newark on Apr 29th 2018, fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b7f49ef&opt=0', '4b7f49ef', 0, 0, 0, 0, '2019-09-23 00:16:55', '2019-09-23 00:16:55', 1),
(608, 1, 195, 'UPS A306 near Tulsa on Aug 2nd 2019, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb241f1&opt=0', '4cb241f1', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(609, 1, 195, 'Volaris A20N near Tijuana on Apr 22nd 2019, engine oil issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c877e09&opt=0', '4c877e09', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(610, 1, 195, 'Jazz DH8D at Toronto on Nov 9th 2017, hard landing at more than +5.5G, aircraft departs for return flight', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b1c8af7&opt=0', '4b1c8af7', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(611, 1, 195, 'Ameriflight SW4 at San Luis Obispo on Feb 6th 2018, runway excursion on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4a20d3&opt=0', '4b4a20d3', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(612, 1, 195, 'Porter DH8D and Jazz DH8D at Sudbury on Oct 14th 2016, near collision', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49fe21aa&opt=0', '49fe21aa', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(613, 1, 195, 'Southwest B737 at Sacramento on Oct 3rd 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af42436&opt=0', '4af42436', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(614, 1, 195, 'Air Canada A320 at Halifax on Mar 29th 2015, touched down short of runway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=483e7337&opt=0', '483e7337', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(615, 1, 195, 'Fedex MD11 at Memphis on Oct 18th 2016, dropped part during roll out, engine damage', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49f901fa&opt=0', '49f901fa', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(616, 1, 195, 'UPS B763 at Albuquerque on Mar 5th 2016, hard landing results in tail strike', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49579e3e&opt=0', '49579e3e', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(617, 1, 195, 'Southwest B737 at Las Vegas on May 23rd 2016, control issue', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=498c48ae&opt=0', '498c48ae', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(618, 1, 195, 'Polar Air Cargo B748 at Los Angeles on Apr 15th 2016, engine pod strike', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49707f00&opt=0', '49707f00', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(619, 1, 195, 'Southwest B733 at San Jose on Oct 27th 2015, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48e7ae66&opt=0', '48e7ae66', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(620, 1, 195, 'Bearskin SW4 at Red Lake on Nov 10th 2013, impacted ground on final approach', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=46b4f37d/0000&opt=0', '46b4f37d/0000', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(621, 1, 195, 'United B753 near Ontario on Jan 29th 2015, burning smell', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4810cd92&opt=0', '4810cd92', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(622, 1, 195, 'Southwest B737 near Ontario on Jan 5th 2015, suspected fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47fed8bc&opt=0', '47fed8bc', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1);
INSERT INTO `engine4_airport_threats` (`threat_id`, `owner_id`, `airport_id`, `title`, `body`, `phase`, `icon`, `href`, `article`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`, `imported`) VALUES
(623, 1, 195, 'Fedex MD11 near Las Vegas on Nov 7th 2014, cargo fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47cef688&opt=0', '47cef688', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(624, 1, 195, 'American MD83 at Dallas on Oct 22nd 2014, engine problems after tyre damage on takeoff', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=47c8c0f9&opt=0', '47c8c0f9', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(625, 1, 195, 'UPS A306 near Rockford on Sep 10th 2014, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47a29262&opt=0', '47a29262', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(626, 1, 195, 'UPS A306 at Sacramento on Jul 30th 2014, engine problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47830b26&opt=0', '47830b26', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(627, 1, 195, 'American MD82 at Dallas on May 11th 2013, struck runway center line light on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=462372bc&opt=0', '462372bc', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(628, 1, 195, 'Southwest B737 at Phoenix on Nov 8th 2012, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=458c303f&opt=0', '458c303f', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(629, 1, 195, 'Alaska B734 near San Jose on Aug 8th 2012, loss of cabin pressure, electric failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=453f0aee&opt=0', '453f0aee', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(630, 1, 195, 'Skywest CRJ2 at Ontario on May 23rd 2010, nose gear up landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=42bede0a/0001&opt=0', '42bede0a/0001', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(631, 1, 195, 'Southwest B737 near Los Angeles on Jul 7th 2012, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45273475&opt=0', '45273475', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(632, 1, 195, 'United B738 near San Antonio on Jan 24th 2012, unruly passenger', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=449d1d8d&opt=0', '449d1d8d', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(633, 1, 195, 'Skywest CRJ7 at Ontario on Sep 10th 2011, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=442d4098&opt=0', '442d4098', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(634, 1, 195, 'American MD83 at Dallas on Jul 25th 2011, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4404cddf&opt=0', '4404cddf', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(635, 1, 195, 'Air Canada A320 at Los Angeles on Mar 15th 2011, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=439dadfd&opt=0', '439dadfd', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(636, 1, 195, 'Skywest CRJ2 at Ontario on May 23rd 2010, nose gear up landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=42bede0a/0000&opt=0', '42bede0a/0000', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(637, 1, 195, 'Skywest CRJ2 at Ontario on May 23rd 2010, nose gear up landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=42bede0a&opt=0', '42bede0a', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(638, 1, 195, 'Southwest B733 at Sacramento on Jan 5th 2010, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=425565a3&opt=0', '425565a3', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(639, 1, 195, 'Morningstar B722 at Toronto on Aug 27th 2009, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41eddf6f&opt=0', '41eddf6f', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(640, 1, 195, 'SouthWest B733 near Vegas on Feb 24th 2008, clear air turbulence', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=402a4c28&opt=0', '402a4c28', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(641, 1, 195, 'Delta Airlines B752 near Ontario on Jun 23rd 2009, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41ba59ee&opt=0', '41ba59ee', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(642, 1, 195, 'FAA lists 2 dual engine bird strikes per year', NULL, NULL, '/images/news.gif', 'http://avherald.com/h?article=4189d827&opt=0', '4189d827', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(643, 1, 195, 'Alaska Airlines MD83 at Ontario on Dec 25th 2007, severe turbulence seriously injures two flight attendants', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=412fe58f&opt=0', '412fe58f', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(644, 1, 195, 'Jet Airways A332 at Toronto on Jul 14th 2008, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=409a901c&opt=0', '409a901c', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(645, 1, 195, 'American MD83 near Ontario on May 19th 2008, mechanical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=407040a4&opt=0', '407040a4', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(646, 1, 195, 'UPS DC87 at Louisville on Mar 19th 2008, engine on fire on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=403d3fa8&opt=0', '403d3fa8', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(647, 1, 195, 'Cargojet &#xD;\n1000&#xD;\nB727 near Halifax on Feb 14th 2008, smoke', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4021b9c6&opt=0', '4021b9c6', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(648, 1, 195, 'Air Canada A319 near Calgary on Jan 10th 2008, hit clear air turbulence, injuries on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=400417b3/0007&opt=0', '400417b3/0007', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(649, 1, 195, 'Air Canada A319 at Vernon on Aug 23rd 2003, confused airports on unnecessary visual approach', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=3dfdf5e8&opt=0', '3dfdf5e8', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(650, 1, 195, 'Air Cargo Shorts 360 at Oshawa, Canada on Dec 16th 2004, landing rejected, but impact with rising terrain', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=3db96b56&opt=0', '3db96b56', 0, 0, 0, 0, '2019-09-24 07:13:00', '2019-09-24 07:13:00', 1),
(656, 1, 173, 'Jetblue A320 at Ft. Lauderdale on Sep 17th 2019, rejected takeoff due to brakes overheat', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cd057e0&opt=0', '4cd057e0', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(657, 1, 173, 'Delta B763 near Tampa on Sep 18th 2019, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cd04bf7&\r\n5000\r\nopt=0', '4cd04bf7', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(658, 1, 173, 'Jetblue A321 enroute on Jul 4th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9fc06d&opt=0', '4c9fc06d', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(659, 1, 173, 'Jetblue A320 near Fort Lauderdale on Jun 16th 2019, flight attendant injured by trolley', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c953b7d&opt=0', '4c953b7d', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(660, 1, 173, 'Canada Rouge A319 enroute on May 12th 2019, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7e8c73&opt=0', '4c7e8c73', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(661, 1, 173, 'Spirit A321 at Baltimore on Apr 24th 2019, odour on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c71c290&opt=0', '4c71c290', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(662, 1, 173, 'Canada Rouge 763 at Montreal on Mar 29th 2019, gear disagrees', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c64337a&opt=0', '4c64337a', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(663, 1, 173, 'Southwest B738 at Fort Lauderdale and Orlando on Feb 21st 2019, tyre damage on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c48279c&opt=0', '4c48279c', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(664, 1, 173, 'Southwest B738 near Providence on Feb 15th 2019, lightning strike', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c44ae31&opt=0', '4c44ae31', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(665, 1, 173, 'Spirit A320 at Guayaquil on Feb 16th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c44a2bc&opt=0', '4c44a2bc', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(666, 1, 173, 'Transat A321 at Quebec City on Jan 24th 2019, passengers become ill during de-icing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c34b4a8&opt=0', '4c34b4a8', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(667, 1, 173, 'Jetblue A321 at Fort Lauderdale on Jan 20th 2019, rejected takeoff due to gear indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c32bee0&opt=0', '4c32bee0', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(668, 1, 173, 'Transat B738 at Fort Lauderdale on Jan 12th 2019, engine overheat', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c32ba24&opt=0', '4c32ba24', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(669, 1, 173, 'American A320 near Fort Lauderdale on Jan 10th 2019, fumes on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2b4010&opt=0', '4c2b4010', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(670, 1, 173, 'American B738 near Dallas on Dec 26th 2018, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c228bc1&opt=0', '4c228bc1', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(671, 1, 173, 'Jetblue A321 at Fort Lauderdale on Oct 18th 2018, unsafe gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf2e416&opt=0', '4bf2e416', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(672, 1, 173, 'Spirit A319 near Fort Lauderdale on Oct 1st 2018, fumes injure passengers and crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bed7aaf&opt=0', '4bed7aaf', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(673, 1, 173, 'Spirit A321 near Myrtle Beach on Jul 26th 2018, burning odour on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bba4ce7&opt=0', '4bba4ce7', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(674, 1, 173, 'Azul A332 at Sao Paulo on Jul 23rd 2018, both autopilots failed', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb9196c&opt=0', '4bb9196c', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(675, 1, 173, 'Spirit A321 near Fort Lauderdale on Dec 5th 2017, severe turbulence injures 4', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b1fb607&opt=0', '4b1fb607', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(676, 1, 173, 'Jetblue A320 over Gulf of Mexico on May 13th 2018, failure of weather radar', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b88a1c7&opt=0', '4b88a1c7', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(677, 1, 173, 'Jetblue A320 near Fort Lauderdale on May 6th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b846ad5&opt=0', '4b846ad5', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(678, 1, 173, 'Spirit A319 at Boston on Jul 17th 2015, fumes on board, captain died 50 days later', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b6eb830&opt=0', '4b6eb830', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(679, 1, 173, 'Southwest B737 near Orlando on Feb 21st 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b54a0b7&opt=0', '4b54a0b7', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(680, 1, 173, 'Jetblue A320 near Fort Lauderdale on Feb 13th 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4eba6b&opt=0', '4b4eba6b', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(681, 1, 173, 'Spirit A320 on Feb 11th 2018, fumes on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b4e24d4&opt=0', '4b4e24d4', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(682, 1, 173, 'Spirit A20N near Fort Lauderdale on Jan 28th 2018, fumes on board, crew feeling increasingly incapacitated', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b4623d6&opt=0', '4b4623d6', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(683, 1, 173, 'Jetblue A320 near Charleston on Feb 8th 2018, fumes on board', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b4b8aa9&opt=0', '4b4b8aa9', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(684, 1, 173, 'Norwegian B788 over Atlantic on Jan 24th 2018, captain incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b40bfbc&opt=0', '4b40bfbc', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(685, 1, 173, 'Southwest B737 at Fort Lauderdale and Baltimore on Oct 21st 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b013a05&opt=0', '4b013a05', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(686, 1, 173, 'Southwest B737 at Columbus on Aug 26th 2017, damaged tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ad8caef&opt=0', '4ad8caef', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(687, 1, 173, 'Jetblue A320 near Fort Lauderdale on Aug 10th 2017, 3 flight attendants feel ill in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4acd8f3a&opt=0', '4acd8f3a', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(688, 1, 173, 'Jetblue A320 near Oklahoma City on Aug 2nd 2017, odour injures passengers', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4ac7d6d0&opt=0', '4ac7d6d0', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(689, 1, 173, 'Spirit A319 near Fort Lauderdale on Jul 31st 2017, odour in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ac6572a&opt=0', '4ac6572a', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(690, 1, 173, 'Jetblue A320 at Fort Lauderdale on Jul 19th 2017, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4abd91bc&opt=0', '4abd91bc', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(691, 1, 173, 'Jetblue E190 near Charleston on Jun 23rd 2017, smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aab8bab&opt=0', '4aab8bab', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(692, 1, 173, 'Jetblue A320 near San Jose on Jun 7th 2017, strong odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aa27adb&opt=0', '4aa27adb', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(693, 1, 173, 'Spirit A321 at Fort Lauderdale on Jan 29th 2016, rejected takeoff on ATC instruction due to vehicle on runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a9cbba4&opt=0', '4a9cbba4', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(694, 1, 173, 'Alaska B738 near Kansas City on May 29th 2017, electrical burning odour in lavatory', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a9aa7a9&opt=0', '4a9aa7a9', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(695, 1, 173, 'Canada Rouge A319 at Toronto on Apr 3rd 2017, pilot incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a789c0c&opt=0', '4a789c0c', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(696, 1, 173, 'Spirit A321 at New York on Mar 20th 2017, odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a684e9e&opt=0', '4a684e9e', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(697, 1, 173, 'Jetblue A320 at Fort Lauderdale on Mar 15th 2017, brakes fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a63f30d&opt=0', '4a63f30d', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(698, 1, 173, 'Jetblue A320 near Fort Lauderdale on Mar 11th 2017, turbulence injures passenger', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4a6257d1&opt=0', '4a6257d1', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(699, 1, 173, 'Jetblue E190 at Fort Lauderdale on Mar 1st 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a5a3858&opt=0', '4a5a3858', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(700, 1, 173, 'Spirit A319 at Fort Lauderdale on Feb 13th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a4e94f0&opt=0', '4a4e94f0', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(701, 1, 173, 'Southwest B737 at Fort Lauderdale on Feb 7th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a4a21b3&opt=0', '4a4a21b3', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(702, 1, 173, 'Jetblue A320 near Orlando on Feb 2nd 2017, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a47ea86&opt=0', '4a47ea86', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(703, 1, 173, 'Virgin America A320 at Ft. Lauderdale on Dec 28th 2016, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a2cad4b&opt=0', '4a2cad4b', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(704, 1, 173, 'Allegiant A320 near Syracuse on Dec 24th 2016, partial flight control failure, after landing advised lost all hydraulics', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a2c0ba9&opt=0', '4a2c0ba9', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(705, 1, 173, 'Southwest B737 at Fort Lauderdale on Oct 21st 2016, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49fcbe64&opt=0', '49fcbe64', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(706, 1, 173, 'Jetblue E190 near Baltimore on Sep 30th 2016, dual bleed failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49eb797a&opt=0', '49eb797a', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(707, 1, 173, 'Spirit A320 at Niagara Falls on Sep 26th 2016, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49e85c43&opt=0', '49e85c43', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(708, 1, 173, 'Delta A321 near Orlando on Aug 28th 2016, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49d3903c&opt=0', '49d3903c', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(709, 1, 173, 'Southwest B737 at Baltimore on Jul 18th 2016, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49b6fedb&opt=0', '49b6fedb', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(710, 1, 173, 'Jetblue E190 at Charleston on Jul 18th 2016, fumes in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49b64228&opt=0', '49b64228', 0, 0, 0, 0, '2019-09-24 11:01:54', '2019-09-24 11:01:54', 1),
(711, 1, 190, 'Compass E175 near Fargo on May 8th 2008, fire in bathroom', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4065c139&opt=0', '4065c139', 0, 0, 0, 0, '2019-09-24 11:26:14', '2019-09-24 11:26:14', 1),
(712, 1, 190, 'Pinnacle CRJ at Traverse City on Apr 12th 2007, overshot&#xD;\nf36&#xD;\n runway on landing in snow', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3f2927ce/0000&opt=0', '3f2927ce/0000', 0, 0, 0, 0, '2019-09-24 11:26:14', '2019-09-24 11:26:14', 1),
(713, 1, 190, 'Northwest DC9 &amp;A319 at Minneapolis on May 10th 2005: two planes collide at gate', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3d257e0f&opt=0', '3d257e0f', 0, 0, 0, 0, '2019-09-24 11:26:14', '2019-09-24 11:26:14', 1),
(714, 1, 24, 'Canada E190 at Toronto on Aug 29th 2019, odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ccf0b97&opt=0', '4ccf0b97', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(715, 1, 24, 'Westjet Encore DH8D at London on Aug 19th 2019, flapless landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc671da&opt=0', '4cc671da', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(716, 1, 24, 'Canada A320 enroute on Aug 12th 2019, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cbd6645&opt=0', '4cbd6645', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(717, 1, 24, 'Canada Rouge B763 over Netherlands on Aug 9th 2019, hydraulic problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb86c3a&opt=0', '4cb86c3a', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(718, 1, 24, 'Canada B773 at Hong Kong on Jul 29th 2019, popping sound and debris on the departure runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb675ef&opt=0', '4cb675ef', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(719, 1, 24, 'Canada Rouge A321 near Halifax on Jul 26th 2019, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb4ca88&opt=0', '4cb4ca88', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(720, 1, 24, 'Jazz DH8D at Montreal on Jul 28th 2019, hydraulic failure causes flapless landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb3a208&opt=0', '4cb3a208', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(721, 1, 24, 'Porter DH8D at Albany on Jul 17th 2019, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb11806&opt=0', '4cb11806', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(722, 1, 24, 'THY B773 at Istanbul on Jul 30th 2019, flock of birds', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4cafb711&opt=0', '4cafb711', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(723, 1, 24, 'Canada A320 at Montreal on Jul 13th 2019, dual hydraulic overheating', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca8e3d3&opt=0', '4ca8e3d3', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(724, 1, 24, 'Georgian CRJ2 at Toronto on Jul 5th 2019, rejected takeoff due to engine duct warning', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca85722&opt=0', '4ca85722', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(725, 1, 24, 'Westjet B737 near Winnipeg on Jun 23rd 2019, odour and haze in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca24fa9&opt=0', '4ca24fa9', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(726, 1, 24, 'Transat B738 near Winnipeg on Jun 21st 2019, turbulence injures flight attendant', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c9f0898&opt=0', '4c9f0898', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(727, 1, 24, 'Jazz DH8A enroute on May 30th 2019, engine shut down due to propeller overspeed', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9a505c&opt=0', '4c9a505c', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(728, 1, 24, 'Porter DH8D near Hamilton on Jun 18th 2019, hydraulic failure, burst all main tyres on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c97bdfa&opt=0', '4c97bdfa', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(729, 1, 24, 'Jazz DH8C at Toronto on May 10th 2019, fuel truck ran into aircraft', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c7c7d88&opt=0', '4c7c7d88', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(730, 1, 24, 'Canada A320 near Syracuse on Jun 5th 2019, spook in the ducts', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c929e6b&opt=0', '4c929e6b', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(731, 1, 24, 'Canada Rouge A321 enroute on Jun 2nd 2019, collision with an object at FL360', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8e159f&opt=0', '4c8e159f', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(732, 1, 24, 'Canada Rouge B763 at Athens on Jun 5th 2019, rejected takeoff due to engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8d6f85&opt=0', '4c8d6f85', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(733, 1, 24, 'American A319 at Toronto on May 13th 2019, runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8cba90&opt=0', '4c8cba90', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(734, 1, 24, 'Canada Rouge B763 at Melbourne on May 8th 2019, rejected takeoff due to gear not down', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7e8b59&opt=0', '4c7e8b59', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(735, 1, 24, 'American A319 at Toronto on Apr 4th 2019, runway confusion on final approach', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7c75d0&opt=0', '4c7c75d0', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(736, 1, 24, 'Eva B773 at Los Angeles on Dec 16th 2016, ATC instructs turn left instead of right, loss of separation, confusion, dangerous closure to terrain', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a25c5e6&opt=0', '4a25c5e6', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(737, 1, 24, 'Envoy E135 near Syracuse on May 2nd 2019, smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c77c6fb&opt=0', '4c77c6fb', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(738, 1, 24, 'Canada Rouge A319 near Raleigh Durham on Apr 23rd 2019, fumes on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c766a93&opt=0', '4c766a93', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(739, 1, 24, 'Canada Rouge A319 at Toronto on Apr 17th 2019, fumes on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c730df6&opt=0', '4c730df6', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(740, 1, 24, 'Envoy E135 at Toronto on Apr 7th 2019, unsafe gear indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6d28e4&opt=0', '4c6d28e4', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(741, 1, 24, 'Jazz DH8A at Toronto on Mar 23rd 2019, continuous stick shaker', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c69b669&opt=0', '4c69b669', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(742, 1, 24, 'Sunwing B738 enroute on Mar 22nd 2019, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c68fc6c&opt=0', '4c68fc6c', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(743, 1, 24, 'United A320 at Toronto on Mar 23rd 2019, loss of engine control', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c62ee64&opt=0', '4c62ee64', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(744, 1, 24, 'Canada A320 at New York on Mar 21st 2019, nose gear steering fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5e336a&opt=0', '4c5e336a', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(745, 1, 24, 'Westjet B737 enroute on Mar 16th 2019, pilot incapacited', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c5aa859&opt=0', '4c5aa859', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(746, 1, 24, 'Sunwing B738 over Atlantic on Mar 7th 2019, near collision with weather balloon at FL360', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c58da40&opt=0', '4c58da40', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(747, 1, 24, 'Canada B763 at Halifax on Mar 4th 2019, pirouette on roll out', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c501c39&opt=0', '4c501c39', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(748, 1, 24, 'Westjet B737 at Toronto on Feb 25th 2019, during departure outclimbed fire vehicle on runway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c50eab5&opt=0', '4c50eab5', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(749, 1, 24, 'Canada A333 at Toronto on Feb 20th 2019, multiple system faults', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4da277&opt=0', '4c4da277', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(750, 1, 24, 'Canada Rouge B763 at Toronto on Feb 14th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4ceee2&opt=0', '4c4ceee2', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(751, 1, 24, 'Canada B789 at Toronto on Feb 10th 2019, fuelitis', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4c4e51&opt=0', '4c4c4e51', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(752, 1, 24, 'Canada E190 at Boston on Feb 8th 2019, hard landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c46be32&opt=0', '4c46be32', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(753, 1, 24, 'Canada A321 near Toronto and Vancouver on Jan 31st 2019, ELACerrate', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4288f0&opt=0', '4c4288f0', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(754, 1, 24, 'Georgian CRJ1 near Toronto on Jan 11th 2019, unreliable airspeeds and altitudes', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c42862a&opt=0', '4c42862a', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(755, 1, 24, 'Jazz DH8D at Toronto on Jan 25th 2019, engine door sneaked off', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c41e46f&opt=0', '4c41e46f', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(756, 1, 24, 'Canada B773 at Hong Kong on Dec 11th 2018, tail strike on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c17ab7d&opt=0', '4c17ab7d', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(757, 1, 24, 'Sky Regional E175 at Toronto on Jan 28th 2019, rejected takeoff due to runway incursion by snow ploughs', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3d8d34&opt=0', '4c3d8d34', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(758, 1, 24, 'Canada A320 near Colorado Springs on Jan 27th 2019, engine rolled back in mountain wave', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3a18ab&opt=0', '4c3a18ab', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(759, 1, 24, 'Transat B738 near Pittsburgh on Jan 31st 2019, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c3a1786&opt=0', '4c3a1786', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(760, 1, 24, 'Fly Jamaica B752 at Georgetown on Nov 9th 2018, hydraulic failure causes runway excursion on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c00d6b3&opt=0', '4c00d6b3', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(761, 1, 24, 'Jazz DH8A at Timmins on Dec 5th 2018, could not retract right main gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2be2b0&opt=0', '4c2be2b0', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(762, 1, 24, 'Jazz DH8D at Thunder Bay on Dec 13th 2018, unsafe gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c21d389&opt=0', '4c21d389', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(763, 1, 24, 'Transat B738 at Paris on Dec 12th 2018, rejected takeoff due to thick white smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c1dbfbe&opt=0', '4c1dbfbe', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(764, 1, 24, 'Cathay Pacific B773 at Toronto on Dec 6th 2018, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c185672&opt=0', '4c185672', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(765, 1, 24, 'Canada B763 at Ottawa on Dec 2nd 2018, turbulence injures three cabin crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c183f77&opt=0', '4c183f77', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(766, 1, 24, 'Canada Rouge A319 at Liberia on Dec 2nd 2018, could not retract gear, multiple ECAM messages', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c121196&opt=0', '4c121196', 0, 0, 0, 0, '2019-09-24 17:14:45', '2019-09-24 17:14:45', 1),
(767, 1, 264, 'Adria CRJ9 at Ljubljana on Apr 24th 2019, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c725f49&opt=0', '4c725f49', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(768, 1, 264, 'Swiftair B734 at Ljubljana on Feb 28th 2019, aft service door open indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4e4f43&opt=0', '4c4e4f43', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(769, 1, 264, 'Montenegro F100 enroute on Nov 11th 2018, engine combustion chamber damage', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c09e4a4&opt=0', '4c09e4a4', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(770, 1, 264, 'Wizz A320 at Ljubljana on Nov 7th 2016, lightning strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a070a29&opt=0', '4a070a29', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(771, 1, 264, 'Adria CRJ9 at Munich on Nov 6th 2014, brakes problem on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47d15dab&opt=0', '47d15dab', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(772, 1, 264, 'Adria CRJ9 at Frankfurt on Jul 13th 2013, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46599301&opt=0', '46599301', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(773, 1, 264, 'Adria CRJ9 near Ljubljana on Jul 17th 2013, lavatory smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4657eac8&opt=0', '4657eac8', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(774, 1, 264, 'Iran A313 at Hamburg on Jul 7th 2013, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=464fcef5&opt=0', '464fcef5', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(775, 1, 264, 'Adria A320 at Rhodes on Aug 17th 2012, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=454770bb&opt=0', '454770bb', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(776, 1, 264, 'Regional CAE E145 at Ljubljana on May 24th 2010, hard landing', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=451cb70d&opt=0', '451cb70d', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(777, 1, 264, 'CSA AT42 near Prague on Oct 28th 2009, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=421e7cbd&opt=0', '421e7cbd', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(778, 1, 264, 'Budapest Air E120 near Budapest on Jul 8th 2009, flaps problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41c66997&opt=0', '41c66997', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(779, 1, 264, 'Clickair A320 at Barcelona on Sep 1st 2008, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40c0e4cd&opt=0', '40c0e4cd', 0, 0, 0, 0, '2019-09-24 18:53:20', '2019-09-24 18:53:20', 1),
(780, 3, 196, '', 'Taxing to M stands via V2/3/4/5/6 or A19/20 entry points seems tight wingtip clearance wise. e.g. we were given stand M4 via EE, A19, stands M7/6/5 were all occupied. Requested entry via A20 but were denied.', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:24:28', '2019-09-24 19:24:28', 0),
(781, 3, 196, '', 'Insufficient wingtip clearance if twy A & B simulatneously used by B777(300ER/200LR/F), B744(400/800), A340(600/500), A350-900', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:33:55', '2019-09-24 19:33:55', 0),
(782, 3, 196, '', 'Ground vehicles (trucks, catering) zooming around airport.', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:34:44', '2019-09-24 19:34:44', 0),
(783, 3, 196, '', 'Posibility of PRM approach, notified through ATIS', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:35:37', '2019-09-24 19:35:37', 0),
(784, 3, 196, '', 'Complex airport layout, multiple runways, hotspots', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:37:39', '2019-09-24 19:37:39', 0),
(785, 3, 196, '', 'Hight density traffic including VFR, increased probability of TCAS TA/RA', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:38:11', '2019-09-24 19:38:11', 0),
(786, 3, 196, '', 'RW 28c VGSI and ILS GP not coincident.', 'All Planes', NULL, NULL, NULL, 0, 0, 0, 0, '2019-09-24 19:48:36', '2019-09-24 19:48:36', 0),
(787, 1, 501, 'GoAir A20N at Jaipur on Sep 16th 2019, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cce7f2b&opt=0', '4cce7f2b', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(788, 1, 501, 'India A20N at Goa on Aug 13th 2019, dogged landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cb90112&opt=0', '4cb90112', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(789, 1, 501, 'Vistara A20N at Lucknow on Jul 15th 2019, landed with just 260kg of fuel remaining', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca8397f&opt=0', '4ca8397f', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(790, 1, 501, 'Oman A333 at Mumbai on Jul 3rd 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9f0ccb&opt=0', '4c9f0ccb', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(791, 1, 501, 'Spicejet B738 at Mumbai on Jul 1st 2019, overran runway on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c9e333b&opt=0', '4c9e333b', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(792, 1, 501, 'India B738 at Mumbai on Jul 10th 2018, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bafb73b&opt=0', '4bafb73b', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(793, 1, 501, 'Indigo A20N at Jaipur on Jun 22nd 2019, engine shut down in flight due to suspected fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c99adcd&opt=0', '4c99adcd', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(794, 1, 501, 'Jet Airways B738 at Riyadh on Aug 3rd 2018, rejected takeoff from taxiway results in taxiway excursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbe6fd3&opt=0', '4bbe6fd3', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(795, 1, 501, 'GoAir A20N near Aurangabad on Jun 2nd 2019, problems with oxygen supply', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8b72af&opt=0', '4c8b72af', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(796, 1, 501, 'India B773 near Vienna on May 7th 2019, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7bb947&opt=0', '4c7bb947', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(797, 1, 501, 'Indigo A20N enroute on Mar 24th 2019, intermittent engine vibrations', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c7a4c04&opt=0', '4c7a4c04', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(798, 1, 501, 'Indigo A20N at Delhi on Apr 9th 2019, engine vibrations', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c69b545&opt=0', '4c69b545', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(799, 1, 501, 'Indigo A20N at Mumbai on Jan 21st 2017, rejected takeoff due to engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a3cfe26&opt=0', '4a3cfe26', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(800, 1, 501, 'Alliance AT72 at Diu on Jan 26th 2019, tail strike on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c36a42c&opt=0', '4c36a42c', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(801, 1, 501, 'GoAir A320 at Delhi on Jun 21st 2017, bird strike, wrong engine shut down and restarted', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aaadd7a&opt=0', '4aaadd7a', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(802, 1, 501, 'GoAir A20N at Mumbai on Jan 10th 2019, engine vibrations', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c2b2eaa&opt=0', '4c2b2eaa', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(803, 1, 501, 'Spicejet DH8D at Ahmedabad on Dec 31st 2018, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c25129c&opt=0', '4c25129c', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(804, 1, 501, 'Kuwait A320 at Mumbai on Dec 22nd 2018, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c1e6eb4&opt=0', '4c1e6eb4', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(805, 1, 501, 'Joon A343 near Kuwait on Dec 4th 2018, lot of smoke in the cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c12dc45&opt=0', '4c12dc45', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(806, 1, 501, 'Jet Airways B738 at Goa on Dec 27th 2016, runway excursion during rejected takeoff', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4a2a6d90&opt=0', '4a2a6d90', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(807, 1, 501, 'Jet Airways B738 at Mumbai on Sep 20th 2018, sudden change of cabin pressure', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bded8e6&opt=0', '4bded8e6', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(808, 1, 501, 'Lufthansa A333 near Ankara on Oct 27th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf821ec&opt=0', '4bf821ec', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(809, 1, 501, 'GoAir A20N at Delhi on Feb 8th 2017, engine shut down in flight, engine fire confirmed by AIB, denied by DGCA', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a4bb10d&opt=0', '4a4bb10d', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(810, 1, 501, 'India B773 at Mumbai on Oct 15th 2018,flight attendant falls off aircraft', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4beff6a0&opt=0', '4beff6a0', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(811, 1, 501, 'Jet Airways B738 at Indore on Oct 1st 2018, airport \"disappeared\" without  David Copperfield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4be96596&opt=0', '4be96596', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(812, 1, 501, 'Indigo A320 at Mumbai on Sep 19th 2018, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bde4bba&opt=0', '4bde4bba', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(813, 1, 501, 'Jet Airways B773 at London on Aug 30th 2016, unsafe departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49efab9c&opt=0', '49efab9c', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(814, 1, 501, 'British Airways B772 near Baku on Jul 12th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb10768&opt=0', '4bb10768', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(815, 1, 501, 'Spicejet B738 near Ahmedabad on Jul 4th 2018, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bab9a31&opt=0', '4bab9a31', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(816, 1, 501, 'Jet Airways B38M at Chennai on Jul 3rd 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bab9557&opt=0', '4bab9557', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(817, 1, 501, 'JetKonnect B737 at Rajkot on Jun 30th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba92fac&opt=0', '4ba92fac', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(818, 1, 501, 'India A321 near Mumbai on Jun 20th 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba1fcaf&opt=0', '4ba1fcaf', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(819, 1, 501, 'India A320 at Mumbai on May 21st 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8e1b17&opt=0', '4b8e1b17', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(820, 1, 501, 'India Regional AT72 at Shirdi on May 21st 2018, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8dfcca&opt=0', '4b8dfcca', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(821, 1, 501, 'Indigo A320 at Lucknow on May 18th 2018, rejected takeoff due to engine fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8c1a1c&opt=0', '4b8c1a1c', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(822, 1, 501, 'Lufthansa MD11 over Iran on Jan 18th 2018, senior first officer incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b85246f&opt=0', '4b85246f', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(823, 1, 501, 'Swiss A333 at Mumbai on Apr 15th 2018, rejected takeoff due to engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b76051a&opt=0', '4b76051a', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(824, 1, 501, 'UPS B744 at Mumbai on Mar 8th 2018, hydraulic failure and tyre damage', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5d3c50&opt=0', '4b5d3c50', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(825, 1, 501, 'India A320 near Mangalore on Feb 27th 2017, loss of cabin pressure', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4b5c6961&opt=0', '4b5c6961', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(826, 1, 501, 'India A321 at Mumbai on Mar 5th 2018, rejected takeoff due to engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5bdd7e&opt=0', '4b5bdd7e', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(827, 1, 501, 'Indigo A20N at Mumbai on Mar 1st 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b592af3&opt=0', '4b592af3', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(828, 1, 501, 'Jet Airways B739 at Mumbai on Mar 3rd 2016, main gear collapse on taxiway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=494e27cc&opt=0', '494e27cc', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(829, 1, 501, 'Vistara A20N near Pune on Feb 7th 2018, descended below cleared level causing near collision', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4d865a&opt=0', '4b4d865a', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(830, 1, 501, 'Jet Airways B738 at Udaipur on Jan 7th 2018, rejected takeoff due to jackal', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b378e38&opt=0', '4b378e38', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(831, 1, 501, 'Indigo A20N at Mumbai on Jan 9th 2018, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b3787ae&opt=0', '4b3787ae', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1);
INSERT INTO `engine4_airport_threats` (`threat_id`, `owner_id`, `airport_id`, `title`, `body`, `phase`, `icon`, `href`, `article`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`, `imported`) VALUES
(832, 1, 501, 'India A319 at Mumbai on Jan 7th 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b358a56&opt=0', '4b358a56', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(833, 1, 501, 'British Airways B773 near Baku on Dec 11th 2017, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b2336e4&opt=0', '4b2336e4', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(834, 1, 501, 'Air India A321 at Mumbai on Feb 15th 2015, tail strike on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=481de898&opt=0', '481de898', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(835, 1, 501, 'Jet Airways B738 at Kolkata on Jan 14th 2015, tail scrape on landing', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4b1fb4cb&opt=0', '4b1fb4cb', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(836, 1, 501, 'Indigo A320 at Mumbai on Mar 9th 2013, unreported runway excursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45ef6842&opt=0', '45ef6842', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(837, 1, 501, 'Singapore A359 at Mumbai on Dec 4th 2017, go around on final approach portrayed as approach to wrong airport', NULL, NULL, '/images/news.gif', 'http://avherald.com/h?article=4b1e5d70&opt=0', '4b1e5d70', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(838, 1, 501, 'Jet Airways B738 near Ahmedabad on Nov 21st 2017, cargo smoke indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b164c9e&opt=0', '4b164c9e', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(839, 1, 501, 'Indigo A20N at Goa on Oct 23rd 2017, rejected takeoff due to stray dog', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b020ccd&opt=0', '4b020ccd', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(840, 1, 501, 'Spicejet DH8D at Jabalpur on Dec 4th 2015, boar strike, runway excursion, left main and nose gear collapsed', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=49052366&opt=0', '49052366', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(841, 1, 501, 'Canada B789 near Hyderabad on Sep 19th 2017, ATC tries to divert aircraft despite several Mayday calls following two diversions', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af4dc97&opt=0', '4af4dc97', 0, 0, 0, 0, '2019-09-24 19:49:18', '2019-09-24 19:49:18', 1),
(842, 1, 223, 'Lufthansa A343 near Sofia on Jul 25th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cac963e&opt=0', '4cac963e', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(843, 1, 223, 'Bulgaria A319 at Paris on Nov 25th 2014, runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47e3197e&opt=0', '47e3197e', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(844, 1, 223, 'Jet2.com A332 at Tenerife on Jun 27th 2017, burst two tyres on landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4aae4354&opt=0', '4aae4354', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(845, 1, 223, 'Iraqi A320 at Sofia on Jul 3rd 2019, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ca06537&opt=0', '4ca06537', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(846, 1, 223, 'El Al B738 at Sofia on Jun 26th 2019, fumes in cabin, bird strike suspected', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c9ae4cf&opt=0', '4c9ae4cf', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(847, 1, 223, 'British Airways A321 near London on Jun 23rd 2019, fumes in the cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c99bc26&opt=0', '4c99bc26', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(848, 1, 223, 'TAROM AT42 at Bucharest on Jun 19th 2019, gear problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c971aac&opt=0', '4c971aac', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(849, 1, 223, 'British Airways A321 at Sofia on Jun 15th 2019, fumes in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c93ddeb&opt=0', '4c93ddeb', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(850, 1, 223, 'Easyjet A320 at Tenerife on Jun 2nd 2014, fuel emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=478557e3&opt=0', '478557e3', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(851, 1, 223, 'Easyjet A320 at Tenerife on Jun 2nd 2014, fuel emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4765fe45&opt=0', '4765fe45', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(852, 1, 223, 'Ryanair B738 at Tenerife on Apr 7th 2019, first officer incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c67955e&opt=0', '4c67955e', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(853, 1, 223, 'Lufthansa A320 at Sofia and Munich on Mar 30th 2019, flat tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c60d94f&opt=0', '4c60d94f', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(854, 1, 223, 'THY A21N near Sofia on Mar 12th 2019, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c54cde6&opt=0', '4c54cde6', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(855, 1, 223, 'Bulgarian Charter A320 near Bratislava and Sofia on Sep 9th 2017, engine trouble, FADEC trouble and shut down', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af99414&opt=0', '4af99414', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(856, 1, 223, 'Tailwind B734 near Sofia on Mar 11th 2018, \"we have lost the cabin\"', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5f3855&opt=0', '4b5f3855', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(857, 1, 223, 'Bulgaria E190 near Vienna on Dec 11th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c17adc8&opt=0', '4c17adc8', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(858, 1, 223, 'Austrian A320 near Sofia on Jul 30th 2018, turbulence injures 5', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bbcac74&opt=0', '4bbcac74', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(859, 1, 223, 'Sunwing B738 near Sofia on Jun 21st 2018, smell of smoke', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ba359ba&opt=0', '4ba359ba', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(860, 1, 223, 'Small Planet A321 near Sofia on May 13th 2018, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b896123&opt=0', '4b896123', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(861, 1, 223, 'Wizz A321 at Sofia on Feb 26th 2018, unreliable airspeed indications', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b572ccf&opt=0', '4b572ccf', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(862, 1, 223, 'Wizz A321 at Sofia on Feb 26th 2018, unreliable airspeed', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b5728f2&opt=0', '4b5728f2', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(863, 1, 223, 'Wizz A321 at Sofia on Feb 26th 2018, rejected takeoff due to unreliable airspeed', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b572e7b&opt=0', '4b572e7b', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(864, 1, 223, 'Atlasjet A321 over Bulgaria on Sep 8th 2016, climb instead of descent results in near collision', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49efb31c&opt=0', '49efb31c', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(865, 1, 223, 'Lufthansa A321 near Sofia on Dec 26th 2017, electrical smoke in aft galley', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b2df513&opt=0', '4b2df513', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(866, 1, 223, 'Thomson B738 near Sofia on Oct 8th 2017, pilot incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af7b386&opt=0', '4af7b386', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(867, 1, 223, 'Smartwings B738 near Paris on Apr 6th 2017, hydraulic leak, strong odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4abe1a85&opt=0', '4abe1a85', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(868, 1, 223, 'Bulgaria E190 at Rijeka on Jun 1st 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a9c2e98&opt=0', '4a9c2e98', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(869, 1, 223, 'Oman A333 near Sofia on Mar 4th 2017, smell of smoke', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a5c9d76&opt=0', '4a5c9d76', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(870, 1, 223, 'LOT E170 near Varna on Jun 30th 2015, transponder inadvertently off results in near collision with business jet', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4a424405&opt=0', '4a424405', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(871, 1, 223, 'Martinair MD11 at Tenerife on Mar 9th 2014, uncontained engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=471498de&opt=0', '471498de', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(872, 1, 223, 'Wizz A320 at Memmingen on Sep 25th 2016, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49ea0f1b&opt=0', '49ea0f1b', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(873, 1, 223, 'Wizz A320 at Sofia on Jan 3rd 2016, inadvertently retracted flaps on final approach', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49de3dbc&opt=0', '49de3dbc', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(874, 1, 223, 'British Airways B763 near Varna on Sep 1st 2016, unreliable airspeed', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49d6de2f&opt=0', '49d6de2f', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(875, 1, 223, 'Sata A320 near Toulouse on Apr 25th 2014, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4737f721&opt=0', '4737f721', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(876, 1, 223, 'Lufthansa Cityline CRJ9 near Munich on Mar 17th 2016, electrical odour on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=495893d1&opt=0', '495893d1', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(877, 1, 223, 'Primera B738 near Nantes on Feb 28th 2016, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=494a65d5&opt=0', '494a65d5', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(878, 1, 223, 'Easyjet A320 near Sofia on Nov 10th 2015, strong burning odour in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48f3fd8a&opt=0', '48f3fd8a', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(879, 1, 223, 'Swiss RJ1H at Zurich on Aug 30th 2015, problem with flight guidance system', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48b9575b&opt=0', '48b9575b', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(880, 1, 223, 'Pegasus B738 near Sofia on Aug 28th 2015, failed engine restarted in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48b7e49b&opt=0', '48b7e49b', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(881, 1, 223, 'Germanwings A319 near Sofia on Jul 12th 2015, suspected bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48931696&opt=0', '48931696', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(882, 1, 223, 'Condor A320 at Tenerife on Dec 11th 2013, descended below minimum safe height', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46d3c184&opt=0', '46d3c184', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(883, 1, 223, 'Naysa AT72 at Tenerife on Aug 4th 2013, turbulence injures 2 cabin crew', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=46781920&opt=0', '46781920', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(884, 1, 223, 'CSA A319 near Bourgas on Sep 19th 2014, loss of cabin pressure', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=487f61a5&opt=0', '487f61a5', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(885, 1, 223, 'Wizz A320 near Sofia on Jun 16th 2015, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=487ea589&opt=0', '487ea589', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(886, 1, 223, 'THY A321 near Sofia on Jun 3rd 2015, smoke detector indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4874e2f1&opt=0', '4874e2f1', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(887, 1, 223, 'Jetairfly B737 near Paris on Mar 6th 2015, fuel filter indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=482c40cd&opt=0', '482c40cd', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(888, 1, 223, 'Thomas Cook B753 near Budapest on Feb 21st 2015, smoke in the flightdeck', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4822d1f7&opt=0', '4822d1f7', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(889, 1, 223, 'Jet2 B752 near Tenerife on Aug 7th 2012, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=454b6fc2&opt=0', '454b6fc2', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(890, 1, 223, 'Transavia B738 near Paris on Jan 21st 2015, hydraulic problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4809cac2&opt=0', '4809cac2', 0, 0, 0, 0, '2019-09-24 20:13:02', '2019-09-24 20:13:02', 1),
(891, 1, 223, 'Ryanair B738 near Faro on Oct 9th 2013, captain incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=469ae3a7&opt=0', '469ae3a7', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(892, 1, 223, 'Air France A319 at Sofia on Oct 16th 2012, rejected takeoff from taxiway', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4579eb0f/0001&opt=0', '4579eb0f/0001', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(893, 1, 223, 'Jet2.com B738 near Funchal on Oct 13th 2014, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47bd1511&opt=0', '47bd1511', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(894, 1, 223, 'Thomas Cook A320 near Brussels on Sep 5th 2014, strange smell in cockpit and cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=479df923&opt=0', '479df923', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(895, 1, 223, 'Austrian F100 at Sofia on Jun 27th 2014, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4769dd44&opt=0', '4769dd44', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(896, 1, 223, 'Jet2 B752 near Sofia on Jun 4th 2014, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4755f290&opt=0', '4755f290', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(897, 1, 223, 'Bulgaria A319 at Sofia on Apr 10th 2014, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=472d43df&opt=0', '472d43df', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(898, 1, 223, 'Air Berlin A333 at Dusseldorf on Aug 15th 2011, fire on board', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44528d0c&opt=0', '44528d0c', 0, 0, 0, 0, '2019-09-24 20:13:03', '2019-09-24 20:13:03', 1),
(899, 1, 508, 'Biman B738 at Dhaka on Sep 19th 2019, could not fully retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cd04fdb&opt=0', '4cd04fdb', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(900, 1, 508, 'Biman DH8D at Yangon on May 8th 2019, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4c7ae66f&opt=0', '4c7ae66f', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(901, 1, 508, 'Salam A20N at Muscat on Aug 26th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4cc32876&opt=0', '4cc32876', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(902, 1, 508, 'Onur A332 at Jeddah on May 21st 2018, landed without nose gear', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b8e1e10&opt=0', '4b8e1e10', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(903, 1, 508, 'Thai B772 at Dhaka on Jul 24th 2018, temporary runway excursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb87135&opt=0', '4bb87135', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(904, 1, 508, 'Biman B738 near Chittagong on Apr 8th 2019, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c66ff27&opt=0', '4c66ff27', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(905, 1, 508, 'Biman DH8D at Sylhet on Mar 1st 2019, burst tyre on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c4daa50&opt=0', '4c4daa50', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(906, 1, 508, 'Singapore A333 near Mandalay on Feb 7th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4adfe3&opt=0', '4b4adfe3', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(907, 1, 508, 'US-Bangla DH8D at Kathmandu on Mar 12th 2018, landed across the runway and fell down slope', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4b5fa1cb&opt=0', '4b5fa1cb', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(908, 1, 508, 'Qatar B773 at Dhaka on Oct 22nd 2018, could not fully retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bf57db3&opt=0', '4bf57db3', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(909, 1, 508, 'Biman DH8D at Dhaka and Sylhet on Oct 3rd 2018, tyre damage on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4be813a8&opt=0', '4be813a8', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(910, 1, 508, 'US-Bangla B738 at Chittagong on Sep 26th 2018, landed without nose gear', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4be3023d&opt=0', '4be3023d', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(911, 1, 508, 'US-Bangla B738 near Dhaka on Mar 24th 2018, fuel filter bypass indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b67d833&opt=0', '4b67d833', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(912, 1, 508, 'Biman DH8D at Dhaka on Mar 20th 2018, cabin pressure problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b64fe2f&opt=0', '4b64fe2f', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(913, 1, 508, 'Cathay Dragon A333 at Dhaka on Dec 1st 2017, nose gear steering failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b1d3e45&opt=0', '4b1d3e45', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(914, 1, 508, 'Biman DH8D at Saidpur and Dhaka on Oct 25th 2017, dropped wheel on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b029493&opt=0', '4b029493', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(915, 1, 508, 'Jet Airways B738 at Dhaka on Jan 22nd 2017, tail strike on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a3f0934&opt=0', '4a3f0934', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(916, 1, 508, 'Malindo B738 near Dhaka on Jun 27th 2017, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aae44fc&opt=0', '4aae44fc', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(917, 1, 508, 'Biman B738 at Muscat and Dhaka on Dec 22nd 2016, tyre damage on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a27f049&opt=0', '4a27f049', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(918, 1, 508, 'Biman B773 near Ashgabat on Nov 27th 2016, engine fuel pressure problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a155d4e&opt=0', '4a155d4e', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(919, 1, 508, 'India Regional CRJ7 and THY A333 near Amritsar on Sep 1st 2016, TCAS resolution, discussion about cleared FL', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49d8799f&opt=0', '49d8799f', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(920, 1, 508, 'Regent B737 at Dhaka on Aug 24th 2016, rejected takeoff due to gear fire, evacuation', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49d0b0e5&opt=0', '49d0b0e5', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(921, 1, 508, 'Biman Bangladesh B773 at Dhaka on Jun 7th 2016, rejected takeoff due to engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=499b7faf&opt=0', '499b7faf', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(922, 1, 508, 'Saudia B772 at Dhaka on May 18th 2016, nose gear problem while lining up', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=498aaa28&opt=0', '498aaa28', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(923, 1, 508, 'Novo AT72 at Dhaka on May 16th 2016, could not retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=498707b1&opt=0', '498707b1', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(924, 1, 508, 'Etihad B748 at Dhaka on Apr 9th 2016, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=496cad11&opt=0', '496cad11', 0, 0, 0, 0, '2019-09-25 08:19:20', '2019-09-25 08:19:20', 1),
(925, 1, 508, 'US-Bangla DH8D at Saidpur on Sep 4th 2015, runway excursion after landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48bd5aec&opt=0', '48bd5aec', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(926, 1, 508, 'Singapore A333 near Bangkok on Apr 22nd 2013, cargo fire', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4613943a&opt=0', '4613943a', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(927, 1, 508, 'United Airways MD83 near Raipur on Aug 7th 2015, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48a83edd&opt=0', '48a83edd', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(928, 1, 508, 'Biman A313 at Sylhet on Aug 1st 2015, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48a45451&opt=0', '48a45451', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(929, 1, 508, 'Biman A313 near Dhaka on Mar 28th 2015, engine fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=483dfb32&opt=0', '483dfb32', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(930, 1, 508, 'Biman B772 at Chittagong on Feb 6th 2015, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4817303f&opt=0', '4817303f', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(931, 1, 508, 'Biman Bangladesh A313 at Kathmandu on Jul 28th 2014, brakes overheated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47800073&opt=0', '47800073', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(932, 1, 508, 'United Airways AT72 at Coxs Bazar on Jul 20th 2014, nose gear collapse', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=477a3999&opt=0', '477a3999', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(933, 1, 508, 'Atlanta Icelandic B744 at Dhaka on Sep 28th 2013, overheating brakes', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4692673b&opt=0', '4692673b', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(934, 1, 508, 'United Airways MD83 at Muscat on May 10th 2013, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=462108fe&opt=0', '462108fe', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(935, 1, 508, 'PIA B773 at Dhaka on Dec 26th 2012, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45b30b90&opt=0', '45b30b90', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(936, 1, 508, 'Kuwait A313 over Indian Ocean on Sep 13th 2012, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4561a142&opt=0', '4561a142', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(937, 1, 508, 'United Airways AT72 near Dhaka on Aug 13th 2012, windshield completely blown out', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4543f999&opt=0', '4543f999', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(938, 1, 508, 'Biman A313 near Dhaka on Jun 2nd 2012, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45092fe2&opt=0', '45092fe2', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(939, 1, 508, 'Gulf A332 near Karachi on Feb 28th 2012, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44ba9c6f&opt=0', '44ba9c6f', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(940, 1, 508, 'Biman A313 near Amman on Sep 18th 2011, engine trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44326a18&opt=0', '44326a18', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(941, 1, 508, 'Biman A313 at Sylhet on Aug 2nd 2011, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=440aca52&opt=0', '440aca52', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(942, 1, 508, 'Air Atlanta Icelandic B743 at Dhaka on Mar 25th 2008, engine and wing on fire, smoke in cabin', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=43f48353&opt=0', '43f48353', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(943, 1, 508, 'PIA B733 near Makassar on Mar 7th 2011, intercepted by fighter aircraft', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43905546&opt=0', '43905546', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(944, 1, 508, 'Kuwait A306 near Kuwait on Nov 10th 2010, smoke in cabin', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=43348d8a&opt=0', '43348d8a', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(945, 1, 508, 'Kuwait Airways A306 near Kuwait City on Nov 17th 2010, cabin pressure problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=433c3135&opt=0', '433c3135', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(946, 1, 508, 'Kuwait Airways A306 near Kuwait on Oct 23rd 2010, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=432a6fa6&opt=0', '432a6fa6', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(947, 1, 508, 'Biman Bangladesh A313 at Kuwait on Oct 14th 2010, rejected  takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43246cdd&opt=0', '43246cdd', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(948, 1, 508, 'Sky Capital L101 at Dhaka on Mar 22nd 2010, engine failure', NULL, NULL, '/images/incident.gif\r\n1000\r\n', 'http://avherald.com/h?article=4290cda6&opt=0', '4290cda6', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(949, 1, 508, 'Spicejet B738 enroute on May 5th 2010, passenger suspected unruly', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42b17704&opt=0', '42b17704', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(950, 1, 508, 'Biman DC10 near Karachi on Apr 27th 2010, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42ab7cb4&opt=0', '42ab7cb4', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(951, 1, 508, 'United Airways DH8A near Chittagong on Apr 20th 2010, engine trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42a5e735&opt=0', '42a5e735', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(952, 1, 508, 'PIA  A313 enroute on Feb 2nd 2010, hydraulics problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=426d7d16&opt=0', '426d7d16', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(953, 1, 508, 'United Airways DH8A at Dhaka on Jan 24th 2010, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42644247&opt=0', '42644247', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(954, 1, 508, 'Jet Airways B738 at Dhaka on Aug 17th 2009, skidded off runway  before takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41e5b050&opt=0', '41e5b050', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(955, 1, 508, 'Livingston A332 at Dhaka on Aug 2nd 2009, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41da0dba&opt=0', '41da0dba', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(956, 1, 508, 'Druk  Air A319 at Dhaka on May 7th 2009, TCAS RA on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41974c61&opt=0', '41974c61', 0, 0, 0, 0, '2019-09-25 08:19:21', '2019-09-25 08:19:21', 1),
(957, 1, 438, 'Avianca A319 at Galapagos on Sep 7th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bdee656&opt=0', '4bdee656', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(958, 1, 438, 'Delta B752 at Atlanta on Mar 29th 2018, hydraulic failure, wheel fire after landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6baa1a&opt=0', '4b6baa1a', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(959, 1, 438, 'TAME E190 at Cuenca on Apr 28th 2016, overran runway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4978aed0&opt=0', '4978aed0', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(960, 1, 438, 'KLM B772 at Quito on Apr 18h 2017, rejected takeoff due to engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a7f15eb&opt=0', '4a7f15eb', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(961, 1, 438, 'United B738 near Houston on Dec 22nd 2016, suspected unintentional passenger', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a27f202&opt=0', '4a27f202', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(962, 1, 438, 'Suramericanas B722 at Bogota on May 6th 2015, engine failure distributes debris over city', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=485d6984&opt=0', '485d6984', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(963, 1, 438, 'American B752 at Quito on Oct 15th 2014, could not fully retract gear', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47bde556&opt=0', '47bde556', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(964, 1, 438, 'Copa B738 near Panama City on Aug 4th 2014, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47890df6&opt=0', '47890df6', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(965, 1, 438, 'Lufthansa A346 at Tokyo on Mar 18th 2014, hard landing', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=471e70e9&opt=0', '471e70e9', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(966, 1, 438, 'TAME E190 at Quito on Sep 16th 2011, overran runway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=44313add/0000&opt=0', '44313add/0000', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(967, 1, 438, 'Copa B738 at Quito on Nov 29th 2012, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=459d34b4&opt=0', '459d34b4', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(968, 1, 438, 'Iberia A343 at Madrid on Oct 1st 2012, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=456c2801&opt=0', '456c2801', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(969, 1, 438, 'Aerolineas Argentinas A343 near Quito on Apr 30th 2012, turbulence injures 9', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=44edba73&opt=0', '44edba73', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(970, 1, 438, 'Tame A320 at Cuenca on Apr 11th 2012, hydraulic leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44dda875&opt=0', '44dda875', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(971, 1, 438, 'TAME A320 near Guayaquil on Dec 26th 2011, technical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44853b54&opt=0', '44853b54', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(972, 1, 438, 'LAN A319 at Lima on Dec 5th 2011, loss of nose wheel steering', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44732d50&opt=0', '44732d50', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(973, 1, 438, 'TAME E190 at Quito on Sep 16th 2011, overran runway', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=44313add&opt=0', '44313add', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(974, 1, 438, 'China Airlines A333 at Taipei on Aug 19th 2011, rejected takeoff due to runway incursion', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=441a6441&opt=0', '441a6441', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(975, 1, 438, 'Iberia A346 at Quito on Aug 31st 2007, hard landing', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=43d1ffd3&opt=0', '43d1ffd3', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(976, 1, 438, 'American B752 near Montego Bay on Jan 28th 2011, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=436f7982&opt=0', '436f7982', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(977, 1, 438, 'Aerogal B732 at Quito on Oct 22nd 2010, engine trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43288c0e&opt=0', '43288c0e', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(978, 1, 438, 'TAME A320 near Guayaquil on Oct 18th 2010, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4325d335&opt=0', '4325d335', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(979, 1, 438, 'Conviasa B732 near Latacunga  on Aug 31st 2008, lost radio contact', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=40c0093f/0002&opt=0', '40c0093f/0002', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(980, 1, 438, 'Aerogal B732 near Cali on May 13th 2010, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42b71e3b&opt=0', '42b71e3b', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(981, 1, 438, 'Icaro F28 at Quito on Sep 22nd 2008, slid off runway during rejected takeoff', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=40d2a859/0000&opt=0', '40d2a859/0000', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(982, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, overran runway', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=422bdd7d&opt=0', '422bdd7d', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(983, 1, 438, 'KLM MD11 near Bonaire on Aug 24th 2009, hydraulics problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41edd9b8&opt=0', '41edd9b8', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(984, 1, 438, 'Aerogal B722 near Guayaquil on May 17th 2009, technical trouble then fuel spill', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41afaad7&opt=0', '41afaad7', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(985, 1, 438, 'TAME E170 at Quito on Jun 1st 2009, burning smell', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41a88174&opt=0', '41a88174', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(986, 1, 438, 'Delta Airlines B73G near Orlando on May 29th 2009, three medical emergencies', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41a5ca15&opt=0', '41a5ca15', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(987, 1, 438, 'Aerogal B732 near Guayaquil on May 4th 2009, high EGT', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4192fbdb&opt=0', '4192fbdb', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(988, 1, 438, 'Iberia A343 at Quito on Apr 9th 2009, rejected takeoff because of failed nose gear steering', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=417d8f43&opt=0', '417d8f43', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(989, 1, 438, 'American B752 near Quito on Mar 6th 2009, flaps problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4161edfc&opt=0', '4161edfc', 0, 0, 0, 0, '2019-09-25 11:29:40', '2019-09-25 11:29:40', 1),
(990, 1, 438, 'Where\'s the beef?', NULL, NULL, '/images/news.gif', 'http://avherald.com/h?article=411ddd21&opt=0', '411ddd21', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(991, 1, 438, 'Aerogal B722 at Guayaquil on Dec 12th 2008, gear problems due to hydraulics leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=411a1398&opt=0', '411a1398', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(992, 1, 438, 'TAME E190 at Manta on Nov 12th 2008, unsafe gear after departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40ff3eca&opt=0', '40ff3eca', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(993, 1, 438, 'TAME A320 at Guyaquil on Oct 7th 2008, evacuation on runway before  takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40de9744&opt=0', '40de9744', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(994, 1, 438, 'Icaro F28 at Quito on Sep 22nd 2008, slid off runway during rejected takeoff', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=40d2a859&opt=0', '40d2a859', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(995, 1, 438, 'Spanair MD82 at Madrid on Aug 20th 2008, went off runway during takeoff', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=40b73189/0016&opt=0', '40b73189/0016', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(996, 1, 438, 'Delta Airlines B752 near Orlando on Jul 30th 2008, engine trouble', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40a76f74&opt=0', '40a76f74', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(997, 1, 438, 'Santa Barbara ATR42 near Merida on Feb 21st 2008, went straight into mountain wall', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4027719e/0010&opt=0', '4027719e/0010', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(998, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0038&opt=0', '3fd15b33/0038', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(999, 1, 438, 'Galapagos B722 at Guayaquil on Apr 18th 2008, hydraulics problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40577899&opt=0', '40577899', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1000, 1, 438, 'Iberia A343 near Madrid on Mar 26th 2008, hydraulics problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4042e9c6&opt=0', '4042e9c6', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1001, 1, 438, 'American ATR72 and UPS B752 at Miami on Feb 26th 2008, ATR entered runway while B752 took off', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=402bae27&opt=0', '402bae27', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1002, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0037&opt=0', '3fd15b33/0037', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1003, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33&opt=0', '3fd15b33', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1004, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0027&opt=0', '3fd15b33/0027', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1005, 1, 438, '&#xD;\n1000&#xD;\nIberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0026&opt=0', '3fd15b33/0026', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1006, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0025&opt=0', '3fd15b33/0025', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1007, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0024&opt=0', '3fd15b33/0024', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1008, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0023&opt=0', '3fd15b33/0023', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1009, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0015&opt=0', '3fd15b33/0015', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1010, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0013&opt=0', '3fd15b33/0013', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1011, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0012&opt=0', '3fd15b33/0012', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1012, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0008&opt=0', '3fd15b33/0008', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1013, 1, 438, 'Iberia A346 at Quito on Nov 9th 2007, runway excursion', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=3fd15b33/0006&opt=0', '3fd15b33/0006', 0, 0, 0, 0, '2019-09-25 11:29:41', '2019-09-25 11:29:41', 1),
(1014, 1, 352, 'Kuwait A320 at Beirut on Apr 21st 2019, bent nose', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c6fe1d2&opt=0', '4c6fe1d2', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1015, 1, 352, 'MEA A320 at Beirut or Abu Dhabi on Mar 5th 2019, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c50f9ee&opt=0', '4c50f9ee', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1016, 1, 352, 'Wataniya A320 near Aqaba on Jul 17th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bb45d19&opt=0', '4bb45d19', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1017, 1, 352, 'Middle East A320 at Istanbul on Jul 6th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bad0de2&opt=0', '4bad0de2', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1018, 1, 352, 'Algerie B736 near Algiers on Feb 4th 2018, cabin pressure problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b4851ad&opt=0', '4b4851ad', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1019, 1, 352, 'THY A321 and Egypt B738 at Cairo on Jan 4th 2018, loss of separation on simultaneous go around and takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b33206a&opt=0', '4b33206a', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1020, 1, 352, 'Europa B738 at Katowice on Oct 28th 2007, touched down 870m before runway threshold on ILS approach', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4b2a7cd7&opt=0', '4b2a7cd7', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1021, 1, 352, 'Iran A306 near Tehran on Jul 22nd 2016, electrical problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49baad5a&opt=0', '49baad5a', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1022, 1, 352, 'Flydubai B738 at Beirut on Mar 28th 2016, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=496148fa&opt=0', '496148fa', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1023, 1, 352, 'Mahan A306 at Beirut on Jun 12th 2015, burst tyre on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=487dfd2b&opt=0', '487dfd2b', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1024, 1, 352, 'Cargolux B748 enroute on May 6th 2015, dropped wing panel', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=485f1aab&opt=0', '485f1aab', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1025, 1, 352, 'Lufthansa A321 at Beirut on Mar 17th 2015, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48356d59&opt=0', '48356d59', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1026, 1, 352, 'MEA A320 near Rome on Sep 14th 2014, luggage mismatch raises bomb alert', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=47a5d99a&opt=0', '47a5d99a', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1027, 1, 352, 'Cyprus A320 at Larnaca on May 5th 2013, burst tyre on roll out', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=461d142d&opt=0', '461d142d', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1028, 1, 352, 'Air France B772 near Zurich on Apr 15th 2013, loss comm', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=460cef66&opt=0', '460cef66', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1029, 1, 352, 'Middle East A332 at Abidjan on Aug 21st 2011, runway excursion resolved in go-around', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=45a07859&opt=0', '45a07859', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1030, 1, 352, 'Saudia A333 at Jeddah on May 9th 2012, disagreeing airspeed, pitot probe blocked by burned pitot cover', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4505a76a&opt=0', '4505a76a', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1031, 1, 352, 'Ethiopian Airlines B738 near Beirut on Jan 25th 2010, lost height after takeoff and impacted Mediterranean', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4264b8d5/0001&opt=0', '4264b8d5/0001', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1032, 1, 352, 'BMI A321 at Beirut on May 3rd 2011, rejected takeoff due to bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43bf6122&opt=0', '43bf6122', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1033, 1, 352, 'FAA and EASA release EAD for B736-B739 to examine elevator control tab mechanisms', NULL, NULL, '/images/news.gif', 'http://avherald.com/h?article=428aeb65&opt=0', '428aeb65', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1034, 1, 352, 'Ethiopian Airlines B738 near Beirut on Jan 25th 2010, lost height after takeoff and impacted Mediterranean', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4264b8d5/0000&opt=0', '4264b8d5/0000', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1035, 1, 352, 'Ethiopian Airlines B738 near Beirut on Jan 25th 2010, lost height after takeoff and impacted Mediterranean', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=4264b8d5&opt=0', '4264b8d5', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1036, 1, 352, 'bmi A321 near Bucharest on Nov 28th 2010, cargo smoke alert', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=433fe6e4&opt=0', '433fe6e4', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1);
INSERT INTO `engine4_airport_threats` (`threat_id`, `owner_id`, `airport_id`, `title`, `body`, `phase`, `icon`, `href`, `article`, `up_vote_count`, `down_vote_count`, `total_vote_count`, `comment_count`, `creation_date`, `modified_date`, `imported`) VALUES
(1037, 1, 352, 'BMI A321 over northern Sudan on Aug 24th 2010, electrical problems', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=4331c079&opt=0', '4331c079', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1038, 1, 352, 'Saudi E170 near Turaif on Oct 8th 2010, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=431fc818&opt=0', '431fc818', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1039, 1, 352, 'UM Air DC95 at Beirut on Sep 21st 2010, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=431400c9&opt=0', '431400c9', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1040, 1, 352, 'Lufthansa A320 near Frankfurt on Aug 23rd 2010, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=430163b5&opt=0', '430163b5', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1041, 1, 352, 'Royal Jordanian E190 near Beirut on Jul 21st 2010, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42e986cf&opt=0', '42e986cf', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1042, 1, 352, 'Gulf Air A319 near Beirut on Jul 20th 2010, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42e9756a&opt=0', '42e9756a', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1043, 1, 352, 'NAS Air A320 at Riyadh on Jul 10th 2010, body found in wheel well', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42e15369&opt=0', '42e15369', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1044, 1, 352, 'Ethiopian B738 at Beirut on Jun 17th 2010, door problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42d0e3b8&opt=0', '42d0e3b8', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1045, 1, 352, 'Air Algerie B736 near Beirut on Jun 3rd 2010, engine fire', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42c7dc44&opt=0', '42c7dc44', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1046, 1, 352, 'UTA B727-200 at Cotonou Dec 25th 2003, crash on takeoff due to overload and forward CG', NULL, NULL, '/images/report.gif', 'http://avherald.com/h?article=3d884ec6&opt=0', '3d884ec6', 0, 0, 0, 0, '2019-09-25 11:41:35', '2019-09-25 11:41:35', 1),
(1047, 1, 346, 'ATA MD83 at Tabriz on Jan 4th 2019, hydraulic failure results in three deflated tyres on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c273b65&opt=0', '4c273b65', 0, 0, 0, 0, '2019-09-25 13:44:16', '2019-09-25 13:44:16', 1),
(1048, 1, 346, 'Kish A321 at Kish on May 8th 2018, rejected takeoff &#xD;\n1000&#xD;\ndue to gazelle strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b874887&opt=0', '4b874887', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1049, 1, 346, 'Caspian MD83 near Tabriz on Apr 9th 2018, cabin did not pressurize', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b722dc7&opt=0', '4b722dc7', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1050, 1, 346, 'ATA MD83 near Tehran on Apr 5th 2018, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6fa1d8&opt=0', '4b6fa1d8', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1051, 1, 346, 'ATA MD83 at Kish and Tabriz on Mar 29th 2018, tyre damage on departure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b6ba435&opt=0', '4b6ba435', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1052, 1, 346, 'Smartwings B738 enroute on Dec 10th 2017, smoke in cockpit', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b41f818&opt=0', '4b41f818', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1053, 1, 346, 'Ata MD83 near Sari on Dec 24th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b2c08d1&opt=0', '4b2c08d1', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1054, 1, 346, 'Ata MD83 at Tehran on May 8th 2017, runway incursion forces departing F100 to climb over the MD83', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b164129&opt=0', '4b164129', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1055, 1, 346, 'ATA MD83 at Tabriz on Oct 20th 2017, burst two tyres on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4affe325&opt=0', '4affe325', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1056, 1, 346, 'ATA MD83 at Tabriz on Sep 12th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ae41a30&opt=0', '4ae41a30', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1057, 1, 346, 'Iran Airtour MD82 at Tehran on Aug 30th 2017, gear problem after landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4ade7e08&opt=0', '4ade7e08', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1058, 1, 346, 'Iran Aseman F100 at Tabriz on Aug 26th 2010, runway excursion into a ditch', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=43028227&opt=0', '43028227', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1059, 1, 346, 'ATA MD83 near Tabriz on May 8th 2012, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=451bf39e&opt=0', '451bf39e', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1060, 1, 346, 'Khors MD83 at Tabriz on Apr 2nd 2012, engine problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45024df1&opt=0', '45024df1', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1061, 1, 346, 'Caspian MD83 near Tabriz on Sep 27th 2011, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44550499&opt=0', '44550499', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1062, 1, 346, 'Iran Air F100 near Tabriz on Oct 11th 2009, flaps problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=421211df&opt=0', '421211df', 0, 0, 0, 0, '2019-09-25 13:44:17', '2019-09-25 13:44:17', 1),
(1063, 1, 139, 'Bravo MD83 at Sharm el Sheikh on Apr 12th 2019, rejected takeoff due to wheels not turning', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4c8083c8&opt=0', '4c8083c8', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1064, 1, 139, 'UIA B739 at Lviv on Jul 30th 2018, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4bbcb009&opt=0', '4bbcb009', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1065, 1, 139, 'DAT A320 near Bratislava on May 21st 2018, hydraulic failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b8ecc9a&opt=0', '4b8ecc9a', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1066, 1, 139, 'Monarch A321 enroute on Aug 27th 2015, two small lavatory fires', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48bd8b94&opt=0', '48bd8b94', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1067, 1, 139, 'Metrojet A321 over Sinai on Oct 31st 2015, broke up in climb over Sinai, preliminary report states no unlawful interference', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=48e9abe4&opt=0', '48e9abe4', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1068, 1, 139, 'Egypt B772 near Sharm el Sheikh on Aug 4th 2016, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49c4542b&opt=0', '49c4542b', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1069, 1, 139, 'Fly Jordan B733 near Amman on Jul 15th 2016, leaking door', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49b4b701&opt=0', '49b4b701', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1070, 1, 139, 'Egypt A332 near Sharm el Sheikh on Mar 31st 2016, engine shut down in flight due to fuel leak', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=49646141&opt=0', '49646141', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1071, 1, 139, 'Egypt A320 near Cairo on Mar 29th 2016, hijack to Larnaca ended peacefully, hijacker arrested, no explosives', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4961976f&opt=0', '4961976f', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1072, 1, 139, 'Orenair B772 at Sharm el Sheikh and Moscow on Oct 26th 2015, burst tyre on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=48e7c3ed&opt=0', '48e7c3ed', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1073, 1, 139, 'Nordwind A321 at Sharm el Sheikh on Apr 9th 2015, engine indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=484818ac&opt=0', '484818ac', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1074, 1, 139, 'Thomson B738 at Cardiff on Apr 21st 2014, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4734cf9f&opt=0', '4734cf9f', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1075, 1, 139, 'Monarch A306 near Sharm el Sheikh on Aug 8th 2013, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=466952df&opt=0', '466952df', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1076, 1, 139, 'Nordwind A320 over Syria on Apr 29th 2013, two missiles near the aircraft', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=46191d48&opt=0', '46191d48', 0, 0, 0, 0, '2019-09-25 15:07:39', '2019-09-25 15:07:39', 1),
(1077, 1, 139, 'Travel Service B738 at Katowice on Mar 12th 2013, overran runway on landing', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45f14e33&opt=0', '45f14e33', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1078, 1, 139, 'Condor B753 over Mediterranean on Jan 27th 2013, first officer incapacitated', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45f7b866&opt=0', '45f7b866', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1079, 1, 139, 'Ural A321 at Kazan on Jan 25th 2013, aircraft struck localizer antenna during go-around', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=45cb69c9&opt=0', '45cb69c9', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1080, 1, 139, 'Nordwind A321 near Sheremetyevo on Jan 5th 2013, navigation system failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45bdef2d&opt=0', '45bdef2d', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1081, 1, 139, 'Nordstar B738 near Antalya on Jan 3rd 2013, cargo fire indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45bdeaa3&opt=0', '45bdeaa3', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1082, 1, 139, 'Thomson B752 near Munich on Dec 31st 2012, weather radar failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=45b7ef36&opt=0', '45b7ef36', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1083, 1, 139, 'Orenair B738 at St. Petersburg on Nov 18th 2012, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4594808f&opt=0', '4594808f', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1084, 1, 139, 'Transaero B744 at Sharm el Sheikh on Nov 11th 2012, leading edge flap did not retract', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=458f972b&opt=0', '458f972b', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1085, 1, 139, 'Orenair B738 at Moscow on Oct 22nd 2012, flaps problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=457edaec&opt=0', '457edaec', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1086, 1, 139, 'Transavia B738 near Zagreb on Oct 20th 2012, odour in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=457b95e0&opt=0', '457b95e0', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1087, 1, 139, 'Egypt B738 near Cairo on Jul 9th 2012, weather radar failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4526b390&opt=0', '4526b390', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1088, 1, 139, 'Thomson B738 near London on Feb 13th 2012, loss of cabin pressure indication', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=44ad3259&opt=0', '44ad3259', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1089, 1, 139, 'Nordwind B752 at Moscow on Jan 22nd 2012, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=449b764e&opt=0', '449b764e', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1090, 1, 139, 'Nordwind B752 at Moscow on Jan 27th 2012, smoke in cabin', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=449ee781&opt=0', '449ee781', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1091, 1, 139, 'Orenair B738 near Ekaterinburg on Nov 1st 2011, cabin pressure problems', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4456f64c&opt=0', '4456f64c', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1092, 1, 139, 'Nordwind B752 at Novosibirsk on Aug 26th 2011, could not retract flaps', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=441ebefa&opt=0', '441ebefa', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1093, 1, 139, 'Ukraine B734 at Odessa on Mar 31st 2011, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43c03b51&opt=0', '43c03b51', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1094, 1, 139, 'Easyjet A320 near Cairo on Apr 23rd 2011, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43b79936&opt=0', '43b79936', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1095, 1, 139, 'Thomson B752 near Athens on Apr 4th 2011, bomb hoax', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43a6b310&opt=0', '43a6b310', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1096, 1, 139, 'Saudia A320 near Sharm el Sheikh on Mar 31st 2011, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43a5b4dd&opt=0', '43a5b4dd', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1097, 1, 139, 'Azza Transport B707 at Sharjah on Oct 21st 2009, lost height after takeoff', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=42190267/0000&opt=0', '42190267/0000', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1098, 1, 139, 'Midwest Airlines B738 at Sharm el Sheikh on Jan 15th 2011, cabin pressure problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43655b70&opt=0', '43655b70', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1099, 1, 139, 'Monarch Airlines A306 near Split on Nov 4th 2010, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=433248b6&opt=0', '433248b6', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1100, 1, 139, 'Viking B738 near Zagreb on May 9th 2010, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42b4568b&opt=0', '42b4568b', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1101, 1, 139, 'Viking B738 near Zagreb on May 9th 2010, loss of cabin pressure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42b4568b/0000&opt=0', '42b4568b/0000', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1102, 1, 139, 'Travel Service B738 at Brno on Jul 8th 2010, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42dfe513&opt=0', '42dfe513', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1103, 1, 139, 'Lotus Air A320 at Turin on May 23rd 2010, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42be59a0&opt=0', '42be59a0', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1104, 1, 139, 'Travel Service B738 near Cairo on May 17th 2010, fire alert in wheel well', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42bb7473&opt=0', '42bb7473', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1105, 1, 139, 'Thomson B763 over Adriatic Sea on May 9th 2010, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=42b4487e&opt=0', '42b4487e', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1106, 1, 139, 'Koral Blue A319 near Cairo on Feb 25th 2010, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=427d0cef&opt=0', '427d0cef', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1107, 1, 139, 'Egypt Express E170 near Cairo on Dec 6th 2009, technical problem', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=423d49b7&opt=0', '423d49b7', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1108, 1, 139, 'Easyjet A320 near Munich on Nov 23rd  2009, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=423321f0&opt=0', '423321f0', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1109, 1, 139, 'Thomson B752 near Athens on Nov 22nd 2009, medical emergency', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=423326bf&opt=0', '423326bf', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1110, 1, 139, 'Thomas Cook B752 near Manchester on Nov 3rd 2009, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4222e500&opt=0', '4222e500', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1111, 1, 139, 'Belair A320 at Basel on Aug 11th 2009, rejected takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41e1e25a&opt=0', '41e1e25a', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1112, 1, 139, 'AMC B738 at Cagliari on Aug 2nd 2009, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41dacfbd&opt=0', '41dacfbd', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1113, 1, 139, 'Livingston A321 at Sharm El Sheikh on Jul 2nd 2009, electrical failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41c10bc6&opt=0', '41c10bc6', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1114, 1, 139, 'Skyservice B752 at Dublin on May 29th 2009, near collision - with a lawn mower', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=41bf6e61&opt=0', '41bf6e61', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1115, 1, 139, 'Red Wings T204 near Sochi on Apr 25th 2009, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4189eb23&opt=0', '4189eb23', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1116, 1, 139, 'Orenburg B734 at Volgograd on Feb 26th 2009, hit runway light on takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=415a94e2&opt=0', '415a94e2', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1117, 1, 139, 'Eurofly A320 at Bologna on Mar 21st 2009, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=416f91eb&opt=0', '416f91eb', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1118, 1, 139, 'Eurofly A320 near Rome on Mar 2nd 2009, clogged fuel filter warning on both engines', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=415e9ab1&opt=0', '415e9ab1', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1119, 1, 139, 'Egypt Express E170 at Sharm el Sheikh on Dec 24th 2008, lost nose wheel after takeoff', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4123bbaf&opt=0', '4123bbaf', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1120, 1, 139, 'XL Airways B739 near Larnaca on Jul 9th 2008, engine failure', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=40968722&opt=0', '40968722', 0, 0, 0, 0, '2019-09-25 15:07:40', '2019-09-25 15:07:40', 1),
(1121, 3, 590, 'UPS B752 near Cedar Rapids on Aug 29th 2018, smoke in cockpit', NULL, NULL, '/images/accident.gif', 'http://avherald.com/h?article=4bd1265c&opt=0', '4bd1265c', 0, 0, 0, 0, '2019-09-25 15:11:01', '2019-09-25 15:11:01', 1),
(1122, 3, 590, 'ABX B762 near Providence on Dec 28th 2017, engine shut down in flight', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4b2f5b6c&opt=0', '4b2f5b6c', 0, 0, 0, 0, '2019-09-25 15:11:02', '2019-09-25 15:11:02', 1),
(1123, 3, 590, 'UPS B752 at Rockford on Oct 9th 2017, bird strike', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4af8d6f4&opt=0', '4af8d6f4', 0, 0, 0, 0, '2019-09-25 15:11:03', '2019-09-25 15:11:03', 1),
(1124, 3, 590, 'United B739 near Chicago on Sep 25th 2017, collision with glider averted by evasive turn', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4aee9c01&opt=0', '4aee9c01', 0, 0, 0, 0, '2019-09-25 15:11:03', '2019-09-25 15:11:03', 1),
(1125, 3, 590, 'Allegiant A320 at Chicago on Dec 15th 2016, flock of birds', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=4a22e85f&opt=0', '4a22e85f', 0, 0, 0, 0, '2019-09-25 15:11:04', '2019-09-25 15:11:04', 1),
(1126, 3, 590, 'UPS A306 at Birmingham on Aug 14th 2013, contacted trees and touched down outside airport', NULL, NULL, '/images/crash.gif', 'http://avherald.com/h?article=466d969f&opt=0', '466d969f', 0, 0, 0, 0, '2019-09-25 15:11:05', '2019-09-25 15:11:05', 1),
(1127, 3, 590, 'Expressjet E145 near Madison on Jun 8th 2011, cracked windshield', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=43dd9a7e&opt=0', '43dd9a7e', 0, 0, 0, 0, '2019-09-25 15:11:07', '2019-09-25 15:11:07', 1),
(1128, 3, 590, 'Allegiant MD87 near Chicago Rockford on Apr 14th 2008, smell of smoke on board, UPS B747 at fault', NULL, NULL, '/images/incident.gif', 'http://avherald.com/h?article=405478e7&opt=0', '405478e7', 0, 0, 0, 0, '2019-09-25 15:11:08', '2019-09-25 15:11:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_airport_votes`
--

CREATE TABLE `engine4_airport_votes` (
  `vote_id` int(11) UNSIGNED NOT NULL,
  `vote_type` tinyint(1) NOT NULL,
  `parent_type` enum('airport','airport_expect','airport_threat','unknown') NOT NULL DEFAULT 'unknown',
  `parent_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `engine4_airport_votes`
--

INSERT INTO `engine4_airport_votes` (`vote_id`, `vote_type`, `parent_type`, `parent_id`, `user_id`, `creation_date`, `modified_date`) VALUES
(11, 1, 'airport_expect', 6, 1, '2019-09-15 18:34:58', '2019-09-15 18:34:58'),
(12, 1, 'airport_expect', 1, 1, '2019-09-19 10:27:45', '2019-09-19 10:27:45'),
(16, 1, 'airport_expect', 2, 2, '2019-09-19 11:24:48', '2019-09-19 11:24:48'),
(17, 1, 'airport_threat', 60, 2, '2019-09-19 11:29:00', '2019-09-19 11:29:00'),
(18, 1, 'airport_expect', 2, 1, '2019-09-19 11:29:31', '2019-09-19 11:29:31'),
(19, 1, 'airport_expect', 3, 1, '2019-09-19 11:31:49', '2019-09-19 11:31:49'),
(20, 1, 'airport_threat', 61, 1, '2019-09-19 11:31:52', '2019-09-19 11:31:52'),
(21, 1, 'airport_threat', 62, 2, '2019-09-19 11:32:07', '2019-09-19 11:32:07'),
(22, 1, 'airport_expect', 5, 2, '2019-09-19 11:32:08', '2019-09-19 11:32:08'),
(24, 1, 'airport_threat', 2, 1, '2019-09-19 12:31:50', '2019-09-19 12:31:50'),
(25, 0, 'airport_expect', 4, 1, '2019-09-20 11:06:15', '2019-09-20 11:06:15'),
(26, 1, 'airport_expect', 9, 3, '2019-09-22 17:42:27', '2019-09-22 17:42:27'),
(29, 1, 'airport_expect', 6, 4, '2019-09-22 23:14:27', '2019-09-22 23:14:27'),
(30, 0, 'airport_threat', 334, 3, '2019-09-24 17:32:32', '2019-09-24 17:32:32'),
(31, 1, 'airport_threat', 335, 3, '2019-09-24 17:32:52', '2019-09-24 17:32:52'),
(34, 1, 'airport_expect', 12, 3, '2019-09-25 10:23:35', '2019-09-25 10:23:35'),
(37, 0, 'airport_expect', 11, 3, '2019-09-25 10:24:00', '2019-09-25 10:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_announcement_announcements`
--

CREATE TABLE `engine4_announcement_announcements` (
  `announcement_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `networks` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_levels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_types` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_allow`
--

CREATE TABLE `engine4_authorization_allow` (
  `resource_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `action` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `value` tinyint(1) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_authorization_allow`
--

INSERT INTO `engine4_authorization_allow` (`resource_type`, `resource_id`, `action`, `role`, `role_id`, `value`, `params`) VALUES
('airport', 1, 'comment', 'everyone', 0, 1, NULL),
('airport', 1, 'comment', 'member', 0, 1, NULL),
('airport', 1, 'comment', 'parent_member', 0, 1, NULL),
('airport', 1, 'comment', 'registered', 0, 1, NULL),
('airport', 1, 'view', 'everyone', 0, 1, NULL),
('airport', 1, 'view', 'member', 0, 1, NULL),
('airport', 1, 'view', 'parent_member', 0, 1, NULL),
('airport', 1, 'view', 'registered', 0, 1, NULL),
('airport', 2, 'comment', 'everyone', 0, 1, NULL),
('airport', 2, 'comment', 'member', 0, 1, NULL),
('airport', 2, 'comment', 'parent_member', 0, 1, NULL),
('airport', 2, 'comment', 'registered', 0, 1, NULL),
('airport', 2, 'view', 'everyone', 0, 1, NULL),
('airport', 2, 'view', 'member', 0, 1, NULL),
('airport', 2, 'view', 'parent_member', 0, 1, NULL),
('airport', 2, 'view', 'registered', 0, 1, NULL),
('airport', 3, 'comment', 'everyone', 0, 1, NULL),
('airport', 3, 'comment', 'member', 0, 1, NULL),
('airport', 3, 'comment', 'parent_member', 0, 1, NULL),
('airport', 3, 'comment', 'registered', 0, 1, NULL),
('airport', 3, 'view', 'everyone', 0, 1, NULL),
('airport', 3, 'view', 'member', 0, 1, NULL),
('airport', 3, 'view', 'parent_member', 0, 1, NULL),
('airport', 3, 'view', 'registered', 0, 1, NULL),
('airport', 4, 'comment', 'everyone', 0, 1, NULL),
('airport', 4, 'comment', 'member', 0, 1, NULL),
('airport', 4, 'comment', 'parent_member', 0, 1, NULL),
('airport', 4, 'comment', 'registered', 0, 1, NULL),
('airport', 4, 'view', 'everyone', 0, 1, NULL),
('airport', 4, 'view', 'member', 0, 1, NULL),
('airport', 4, 'view', 'parent_member', 0, 1, NULL),
('airport', 4, 'view', 'registered', 0, 1, NULL),
('airport', 5, 'comment', 'everyone', 0, 1, NULL),
('airport', 5, 'comment', 'member', 0, 1, NULL),
('airport', 5, 'comment', 'parent_member', 0, 1, NULL),
('airport', 5, 'comment', 'registered', 0, 1, NULL),
('airport', 5, 'view', 'everyone', 0, 1, NULL),
('airport', 5, 'view', 'member', 0, 1, NULL),
('airport', 5, 'view', 'parent_member', 0, 1, NULL),
('airport', 5, 'view', 'registered', 0, 1, NULL),
('airport', 6, 'comment', 'everyone', 0, 1, NULL),
('airport', 6, 'comment', 'member', 0, 1, NULL),
('airport', 6, 'comment', 'parent_member', 0, 1, NULL),
('airport', 6, 'comment', 'registered', 0, 1, NULL),
('airport', 6, 'view', 'everyone', 0, 1, NULL),
('airport', 6, 'view', 'member', 0, 1, NULL),
('airport', 6, 'view', 'parent_member', 0, 1, NULL),
('airport', 6, 'view', 'registered', 0, 1, NULL),
('airport', 7, 'comment', 'everyone', 0, 1, NULL),
('airport', 7, 'comment', 'member', 0, 1, NULL),
('airport', 7, 'comment', 'parent_member', 0, 1, NULL),
('airport', 7, 'comment', 'registered', 0, 1, NULL),
('airport', 7, 'view', 'everyone', 0, 1, NULL),
('airport', 7, 'view', 'member', 0, 1, NULL),
('airport', 7, 'view', 'parent_member', 0, 1, NULL),
('airport', 7, 'view', 'registered', 0, 1, NULL),
('airport', 8, 'comment', 'everyone', 0, 1, NULL),
('airport', 8, 'comment', 'member', 0, 1, NULL),
('airport', 8, 'comment', 'parent_member', 0, 1, NULL),
('airport', 8, 'comment', 'registered', 0, 1, NULL),
('airport', 8, 'view', 'everyone', 0, 1, NULL),
('airport', 8, 'view', 'member', 0, 1, NULL),
('airport', 8, 'view', 'parent_member', 0, 1, NULL),
('airport', 8, 'view', 'registered', 0, 1, NULL),
('airport', 9, 'comment', 'everyone', 0, 1, NULL),
('airport', 9, 'comment', 'member', 0, 1, NULL),
('airport', 9, 'comment', 'parent_member', 0, 1, NULL),
('airport', 9, 'comment', 'registered', 0, 1, NULL),
('airport', 9, 'view', 'everyone', 0, 1, NULL),
('airport', 9, 'view', 'member', 0, 1, NULL),
('airport', 9, 'view', 'parent_member', 0, 1, NULL),
('airport', 9, 'view', 'registered', 0, 1, NULL),
('airport', 10, 'comment', 'everyone', 0, 1, NULL),
('airport', 10, 'comment', 'member', 0, 1, NULL),
('airport', 10, 'comment', 'parent_member', 0, 1, NULL),
('airport', 10, 'comment', 'registered', 0, 1, NULL),
('airport', 10, 'view', 'everyone', 0, 1, NULL),
('airport', 10, 'view', 'member', 0, 1, NULL),
('airport', 10, 'view', 'parent_member', 0, 1, NULL),
('airport', 10, 'view', 'registered', 0, 1, NULL),
('airport', 11, 'comment', 'everyone', 0, 1, NULL),
('airport', 11, 'comment', 'member', 0, 1, NULL),
('airport', 11, 'comment', 'parent_member', 0, 1, NULL),
('airport', 11, 'comment', 'registered', 0, 1, NULL),
('airport', 11, 'view', 'everyone', 0, 1, NULL),
('airport', 11, 'view', 'member', 0, 1, NULL),
('airport', 11, 'view', 'parent_member', 0, 1, NULL),
('airport', 11, 'view', 'registered', 0, 1, NULL),
('airport', 12, 'comment', 'everyone', 0, 1, NULL),
('airport', 12, 'comment', 'member', 0, 1, NULL),
('airport', 12, 'comment', 'parent_member', 0, 1, NULL),
('airport', 12, 'comment', 'registered', 0, 1, NULL),
('airport', 12, 'view', 'everyone', 0, 1, NULL),
('airport', 12, 'view', 'member', 0, 1, NULL),
('airport', 12, 'view', 'parent_member', 0, 1, NULL),
('airport', 12, 'view', 'registered', 0, 1, NULL),
('airport', 13, 'comment', 'everyone', 0, 1, NULL),
('airport', 13, 'comment', 'member', 0, 1, NULL),
('airport', 13, 'comment', 'parent_member', 0, 1, NULL),
('airport', 13, 'comment', 'registered', 0, 1, NULL),
('airport', 13, 'view', 'everyone', 0, 1, NULL),
('airport', 13, 'view', 'member', 0, 1, NULL),
('airport', 13, 'view', 'parent_member', 0, 1, NULL),
('airport', 13, 'view', 'registered', 0, 1, NULL),
('airport', 14, 'comment', 'everyone', 0, 1, NULL),
('airport', 14, 'comment', 'member', 0, 1, NULL),
('airport', 14, 'comment', 'parent_member', 0, 1, NULL),
('airport', 14, 'comment', 'registered', 0, 1, NULL),
('airport', 14, 'view', 'everyone', 0, 1, NULL),
('airport', 14, 'view', 'member', 0, 1, NULL),
('airport', 14, 'view', 'parent_member', 0, 1, NULL),
('airport', 14, 'view', 'registered', 0, 1, NULL),
('airport', 15, 'comment', 'everyone', 0, 1, NULL),
('airport', 15, 'comment', 'member', 0, 1, NULL),
('airport', 15, 'comment', 'parent_member', 0, 1, NULL),
('airport', 15, 'comment', 'registered', 0, 1, NULL),
('airport', 15, 'view', 'everyone', 0, 1, NULL),
('airport', 15, 'view', 'member', 0, 1, NULL),
('airport', 15, 'view', 'parent_member', 0, 1, NULL),
('airport', 15, 'view', 'registered', 0, 1, NULL),
('airport', 16, 'comment', 'everyone', 0, 1, NULL),
('airport', 16, 'comment', 'member', 0, 1, NULL),
('airport', 16, 'comment', 'parent_member', 0, 1, NULL),
('airport', 16, 'comment', 'registered', 0, 1, NULL),
('airport', 16, 'view', 'everyone', 0, 1, NULL),
('airport', 16, 'view', 'member', 0, 1, NULL),
('airport', 16, 'view', 'parent_member', 0, 1, NULL),
('airport', 16, 'view', 'registered', 0, 1, NULL),
('airport', 17, 'comment', 'everyone', 0, 1, NULL),
('airport', 17, 'comment', 'member', 0, 1, NULL),
('airport', 17, 'comment', 'parent_member', 0, 1, NULL),
('airport', 17, 'comment', 'registered', 0, 1, NULL),
('airport', 17, 'view', 'everyone', 0, 1, NULL),
('airport', 17, 'view', 'member', 0, 1, NULL),
('airport', 17, 'view', 'parent_member', 0, 1, NULL),
('airport', 17, 'view', 'registered', 0, 1, NULL),
('airport', 18, 'comment', 'everyone', 0, 1, NULL),
('airport', 18, 'comment', 'member', 0, 1, NULL),
('airport', 18, 'comment', 'parent_member', 0, 1, NULL),
('airport', 18, 'comment', 'registered', 0, 1, NULL),
('airport', 18, 'view', 'everyone', 0, 1, NULL),
('airport', 18, 'view', 'member', 0, 1, NULL),
('airport', 18, 'view', 'parent_member', 0, 1, NULL),
('airport', 18, 'view', 'registered', 0, 1, NULL),
('airport', 19, 'comment', 'everyone', 0, 1, NULL),
('airport', 19, 'comment', 'member', 0, 1, NULL),
('airport', 19, 'comment', 'parent_member', 0, 1, NULL),
('airport', 19, 'comment', 'registered', 0, 1, NULL),
('airport', 19, 'view', 'everyone', 0, 1, NULL),
('airport', 19, 'view', 'member', 0, 1, NULL),
('airport', 19, 'view', 'parent_member', 0, 1, NULL),
('airport', 19, 'view', 'registered', 0, 1, NULL),
('airport', 20, 'comment', 'everyone', 0, 1, NULL),
('airport', 20, 'comment', 'member', 0, 1, NULL),
('airport', 20, 'comment', 'parent_member', 0, 1, NULL),
('airport', 20, 'comment', 'registered', 0, 1, NULL),
('airport', 20, 'view', 'everyone', 0, 1, NULL),
('airport', 20, 'view', 'member', 0, 1, NULL),
('airport', 20, 'view', 'parent_member', 0, 1, NULL),
('airport', 20, 'view', 'registered', 0, 1, NULL),
('airport', 21, 'comment', 'everyone', 0, 1, NULL),
('airport', 21, 'comment', 'member', 0, 1, NULL),
('airport', 21, 'comment', 'parent_member', 0, 1, NULL),
('airport', 21, 'comment', 'registered', 0, 1, NULL),
('airport', 21, 'view', 'everyone', 0, 1, NULL),
('airport', 21, 'view', 'member', 0, 1, NULL),
('airport', 21, 'view', 'parent_member', 0, 1, NULL),
('airport', 21, 'view', 'registered', 0, 1, NULL),
('airport', 22, 'comment', 'everyone', 0, 1, NULL),
('airport', 22, 'comment', 'member', 0, 1, NULL),
('airport', 22, 'comment', 'parent_member', 0, 1, NULL),
('airport', 22, 'comment', 'registered', 0, 1, NULL),
('airport', 22, 'view', 'everyone', 0, 1, NULL),
('airport', 22, 'view', 'member', 0, 1, NULL),
('airport', 22, 'view', 'parent_member', 0, 1, NULL),
('airport', 22, 'view', 'registered', 0, 1, NULL),
('airport', 23, 'comment', 'everyone', 0, 1, NULL),
('airport', 23, 'comment', 'member', 0, 1, NULL),
('airport', 23, 'comment', 'parent_member', 0, 1, NULL),
('airport', 23, 'comment', 'registered', 0, 1, NULL),
('airport', 23, 'view', 'everyone', 0, 1, NULL),
('airport', 23, 'view', 'member', 0, 1, NULL),
('airport', 23, 'view', 'parent_member', 0, 1, NULL),
('airport', 23, 'view', 'registered', 0, 1, NULL),
('airport', 24, 'comment', 'everyone', 0, 1, NULL),
('airport', 24, 'comment', 'member', 0, 1, NULL),
('airport', 24, 'comment', 'parent_member', 0, 1, NULL),
('airport', 24, 'comment', 'registered', 0, 1, NULL),
('airport', 24, 'view', 'everyone', 0, 1, NULL),
('airport', 24, 'view', 'member', 0, 1, NULL),
('airport', 24, 'view', 'parent_member', 0, 1, NULL),
('airport', 24, 'view', 'registered', 0, 1, NULL),
('airport', 25, 'comment', 'everyone', 0, 1, NULL),
('airport', 25, 'comment', 'member', 0, 1, NULL),
('airport', 25, 'comment', 'parent_member', 0, 1, NULL),
('airport', 25, 'comment', 'registered', 0, 1, NULL),
('airport', 25, 'view', 'everyone', 0, 1, NULL),
('airport', 25, 'view', 'member', 0, 1, NULL),
('airport', 25, 'view', 'parent_member', 0, 1, NULL),
('airport', 25, 'view', 'registered', 0, 1, NULL),
('airport', 26, 'comment', 'everyone', 0, 1, NULL),
('airport', 26, 'comment', 'member', 0, 1, NULL),
('airport', 26, 'comment', 'parent_member', 0, 1, NULL),
('airport', 26, 'comment', 'registered', 0, 1, NULL),
('airport', 26, 'view', 'everyone', 0, 1, NULL),
('airport', 26, 'view', 'member', 0, 1, NULL),
('airport', 26, 'view', 'parent_member', 0, 1, NULL),
('airport', 26, 'view', 'registered', 0, 1, NULL),
('airport', 27, 'comment', 'everyone', 0, 1, NULL),
('airport', 27, 'comment', 'member', 0, 1, NULL),
('airport', 27, 'comment', 'parent_member', 0, 1, NULL),
('airport', 27, 'comment', 'registered', 0, 1, NULL),
('airport', 27, 'view', 'everyone', 0, 1, NULL),
('airport', 27, 'view', 'member', 0, 1, NULL),
('airport', 27, 'view', 'parent_member', 0, 1, NULL),
('airport', 27, 'view', 'registered', 0, 1, NULL),
('airport', 28, 'comment', 'everyone', 0, 1, NULL),
('airport', 28, 'comment', 'member', 0, 1, NULL),
('airport', 28, 'comment', 'parent_member', 0, 1, NULL),
('airport', 28, 'comment', 'registered', 0, 1, NULL),
('airport', 28, 'view', 'everyone', 0, 1, NULL),
('airport', 28, 'view', 'member', 0, 1, NULL),
('airport', 28, 'view', 'parent_member', 0, 1, NULL),
('airport', 28, 'view', 'registered', 0, 1, NULL),
('airport', 29, 'comment', 'everyone', 0, 1, NULL),
('airport', 29, 'comment', 'member', 0, 1, NULL),
('airport', 29, 'comment', 'parent_member', 0, 1, NULL),
('airport', 29, 'comment', 'registered', 0, 1, NULL),
('airport', 29, 'view', 'everyone', 0, 1, NULL),
('airport', 29, 'view', 'member', 0, 1, NULL),
('airport', 29, 'view', 'parent_member', 0, 1, NULL),
('airport', 29, 'view', 'registered', 0, 1, NULL),
('airport', 30, 'comment', 'everyone', 0, 1, NULL),
('airport', 30, 'comment', 'member', 0, 1, NULL),
('airport', 30, 'comment', 'parent_member', 0, 1, NULL),
('airport', 30, 'comment', 'registered', 0, 1, NULL),
('airport', 30, 'view', 'everyone', 0, 1, NULL),
('airport', 30, 'view', 'member', 0, 1, NULL),
('airport', 30, 'view', 'parent_member', 0, 1, NULL),
('airport', 30, 'view', 'registered', 0, 1, NULL),
('airport', 31, 'comment', 'everyone', 0, 1, NULL),
('airport', 31, 'comment', 'member', 0, 1, NULL),
('airport', 31, 'comment', 'parent_member', 0, 1, NULL),
('airport', 31, 'comment', 'registered', 0, 1, NULL),
('airport', 31, 'view', 'everyone', 0, 1, NULL),
('airport', 31, 'view', 'member', 0, 1, NULL),
('airport', 31, 'view', 'parent_member', 0, 1, NULL),
('airport', 31, 'view', 'registered', 0, 1, NULL),
('airport', 32, 'comment', 'everyone', 0, 1, NULL),
('airport', 32, 'comment', 'member', 0, 1, NULL),
('airport', 32, 'comment', 'parent_member', 0, 1, NULL),
('airport', 32, 'comment', 'registered', 0, 1, NULL),
('airport', 32, 'view', 'everyone', 0, 1, NULL),
('airport', 32, 'view', 'member', 0, 1, NULL),
('airport', 32, 'view', 'parent_member', 0, 1, NULL),
('airport', 32, 'view', 'registered', 0, 1, NULL),
('airport', 33, 'comment', 'everyone', 0, 1, NULL),
('airport', 33, 'comment', 'member', 0, 1, NULL),
('airport', 33, 'comment', 'parent_member', 0, 1, NULL),
('airport', 33, 'comment', 'registered', 0, 1, NULL),
('airport', 33, 'view', 'everyone', 0, 1, NULL),
('airport', 33, 'view', 'member', 0, 1, NULL),
('airport', 33, 'view', 'parent_member', 0, 1, NULL),
('airport', 33, 'view', 'registered', 0, 1, NULL),
('airport', 34, 'comment', 'everyone', 0, 1, NULL),
('airport', 34, 'comment', 'member', 0, 1, NULL),
('airport', 34, 'comment', 'parent_member', 0, 1, NULL),
('airport', 34, 'comment', 'registered', 0, 1, NULL),
('airport', 34, 'view', 'everyone', 0, 1, NULL),
('airport', 34, 'view', 'member', 0, 1, NULL),
('airport', 34, 'view', 'parent_member', 0, 1, NULL),
('airport', 34, 'view', 'registered', 0, 1, NULL),
('airport', 35, 'comment', 'everyone', 0, 1, NULL),
('airport', 35, 'comment', 'member', 0, 1, NULL),
('airport', 35, 'comment', 'parent_member', 0, 1, NULL),
('airport', 35, 'comment', 'registered', 0, 1, NULL),
('airport', 35, 'view', 'everyone', 0, 1, NULL),
('airport', 35, 'view', 'member', 0, 1, NULL),
('airport', 35, 'view', 'parent_member', 0, 1, NULL),
('airport', 35, 'view', 'registered', 0, 1, NULL),
('airport', 36, 'comment', 'everyone', 0, 1, NULL),
('airport', 36, 'comment', 'member', 0, 1, NULL),
('airport', 36, 'comment', 'parent_member', 0, 1, NULL),
('airport', 36, 'comment', 'registered', 0, 1, NULL),
('airport', 36, 'view', 'everyone', 0, 1, NULL),
('airport', 36, 'view', 'member', 0, 1, NULL),
('airport', 36, 'view', 'parent_member', 0, 1, NULL),
('airport', 36, 'view', 'registered', 0, 1, NULL),
('airport', 37, 'comment', 'everyone', 0, 1, NULL),
('airport', 37, 'comment', 'member', 0, 1, NULL),
('airport', 37, 'comment', 'parent_member', 0, 1, NULL),
('airport', 37, 'comment', 'registered', 0, 1, NULL),
('airport', 37, 'view', 'everyone', 0, 1, NULL),
('airport', 37, 'view', 'member', 0, 1, NULL),
('airport', 37, 'view', 'parent_member', 0, 1, NULL),
('airport', 37, 'view', 'registered', 0, 1, NULL),
('airport', 38, 'comment', 'everyone', 0, 1, NULL),
('airport', 38, 'comment', 'member', 0, 1, NULL),
('airport', 38, 'comment', 'parent_member', 0, 1, NULL),
('airport', 38, 'comment', 'registered', 0, 1, NULL),
('airport', 38, 'view', 'everyone', 0, 1, NULL),
('airport', 38, 'view', 'member', 0, 1, NULL),
('airport', 38, 'view', 'parent_member', 0, 1, NULL),
('airport', 38, 'view', 'registered', 0, 1, NULL),
('airport', 39, 'comment', 'everyone', 0, 1, NULL),
('airport', 39, 'comment', 'member', 0, 1, NULL),
('airport', 39, 'comment', 'parent_member', 0, 1, NULL),
('airport', 39, 'comment', 'registered', 0, 1, NULL),
('airport', 39, 'view', 'everyone', 0, 1, NULL),
('airport', 39, 'view', 'member', 0, 1, NULL),
('airport', 39, 'view', 'parent_member', 0, 1, NULL),
('airport', 39, 'view', 'registered', 0, 1, NULL),
('airport', 40, 'comment', 'everyone', 0, 1, NULL),
('airport', 40, 'comment', 'member', 0, 1, NULL),
('airport', 40, 'comment', 'parent_member', 0, 1, NULL),
('airport', 40, 'comment', 'registered', 0, 1, NULL),
('airport', 40, 'view', 'everyone', 0, 1, NULL),
('airport', 40, 'view', 'member', 0, 1, NULL),
('airport', 40, 'view', 'parent_member', 0, 1, NULL),
('airport', 40, 'view', 'registered', 0, 1, NULL),
('airport', 41, 'comment', 'everyone', 0, 1, NULL),
('airport', 41, 'comment', 'member', 0, 1, NULL),
('airport', 41, 'comment', 'parent_member', 0, 1, NULL),
('airport', 41, 'comment', 'registered', 0, 1, NULL),
('airport', 41, 'view', 'everyone', 0, 1, NULL),
('airport', 41, 'view', 'member', 0, 1, NULL),
('airport', 41, 'view', 'parent_member', 0, 1, NULL),
('airport', 41, 'view', 'registered', 0, 1, NULL),
('airport', 42, 'comment', 'everyone', 0, 1, NULL),
('airport', 42, 'comment', 'member', 0, 1, NULL),
('airport', 42, 'comment', 'parent_member', 0, 1, NULL),
('airport', 42, 'comment', 'registered', 0, 1, NULL),
('airport', 42, 'view', 'everyone', 0, 1, NULL),
('airport', 42, 'view', 'member', 0, 1, NULL),
('airport', 42, 'view', 'parent_member', 0, 1, NULL),
('airport', 42, 'view', 'registered', 0, 1, NULL),
('airport', 43, 'comment', 'everyone', 0, 1, NULL),
('airport', 43, 'comment', 'member', 0, 1, NULL),
('airport', 43, 'comment', 'parent_member', 0, 1, NULL),
('airport', 43, 'comment', 'registered', 0, 1, NULL),
('airport', 43, 'view', 'everyone', 0, 1, NULL),
('airport', 43, 'view', 'member', 0, 1, NULL),
('airport', 43, 'view', 'parent_member', 0, 1, NULL),
('airport', 43, 'view', 'registered', 0, 1, NULL),
('airport', 44, 'comment', 'everyone', 0, 1, NULL),
('airport', 44, 'comment', 'member', 0, 1, NULL),
('airport', 44, 'comment', 'parent_member', 0, 1, NULL),
('airport', 44, 'comment', 'registered', 0, 1, NULL),
('airport', 44, 'view', 'everyone', 0, 1, NULL),
('airport', 44, 'view', 'member', 0, 1, NULL),
('airport', 44, 'view', 'parent_member', 0, 1, NULL),
('airport', 44, 'view', 'registered', 0, 1, NULL),
('airport', 45, 'comment', 'everyone', 0, 1, NULL),
('airport', 45, 'comment', 'member', 0, 1, NULL),
('airport', 45, 'comment', 'parent_member', 0, 1, NULL),
('airport', 45, 'comment', 'registered', 0, 1, NULL),
('airport', 45, 'view', 'everyone', 0, 1, NULL),
('airport', 45, 'view', 'member', 0, 1, NULL),
('airport', 45, 'view', 'parent_member', 0, 1, NULL),
('airport', 45, 'view', 'registered', 0, 1, NULL),
('airport', 46, 'comment', 'everyone', 0, 1, NULL),
('airport', 46, 'comment', 'member', 0, 1, NULL),
('airport', 46, 'comment', 'parent_member', 0, 1, NULL),
('airport', 46, 'comment', 'registered', 0, 1, NULL),
('airport', 46, 'view', 'everyone', 0, 1, NULL),
('airport', 46, 'view', 'member', 0, 1, NULL),
('airport', 46, 'view', 'parent_member', 0, 1, NULL),
('airport', 46, 'view', 'registered', 0, 1, NULL),
('airport', 47, 'comment', 'everyone', 0, 1, NULL),
('airport', 47, 'comment', 'member', 0, 1, NULL),
('airport', 47, 'comment', 'parent_member', 0, 1, NULL),
('airport', 47, 'comment', 'registered', 0, 1, NULL),
('airport', 47, 'view', 'everyone', 0, 1, NULL),
('airport', 47, 'view', 'member', 0, 1, NULL),
('airport', 47, 'view', 'parent_member', 0, 1, NULL),
('airport', 47, 'view', 'registered', 0, 1, NULL),
('airport', 48, 'comment', 'everyone', 0, 1, NULL),
('airport', 48, 'comment', 'member', 0, 1, NULL),
('airport', 48, 'comment', 'parent_member', 0, 1, NULL),
('airport', 48, 'comment', 'registered', 0, 1, NULL),
('airport', 48, 'view', 'everyone', 0, 1, NULL),
('airport', 48, 'view', 'member', 0, 1, NULL),
('airport', 48, 'view', 'parent_member', 0, 1, NULL),
('airport', 48, 'view', 'registered', 0, 1, NULL),
('airport', 49, 'comment', 'everyone', 0, 1, NULL),
('airport', 49, 'comment', 'member', 0, 1, NULL),
('airport', 49, 'comment', 'parent_member', 0, 1, NULL),
('airport', 49, 'comment', 'registered', 0, 1, NULL),
('airport', 49, 'view', 'everyone', 0, 1, NULL),
('airport', 49, 'view', 'member', 0, 1, NULL),
('airport', 49, 'view', 'parent_member', 0, 1, NULL),
('airport', 49, 'view', 'registered', 0, 1, NULL),
('airport', 50, 'comment', 'everyone', 0, 1, NULL),
('airport', 50, 'comment', 'member', 0, 1, NULL),
('airport', 50, 'comment', 'parent_member', 0, 1, NULL),
('airport', 50, 'comment', 'registered', 0, 1, NULL),
('airport', 50, 'view', 'everyone', 0, 1, NULL),
('airport', 50, 'view', 'member', 0, 1, NULL),
('airport', 50, 'view', 'parent_member', 0, 1, NULL),
('airport', 50, 'view', 'registered', 0, 1, NULL),
('airport', 51, 'comment', 'everyone', 0, 1, NULL),
('airport', 51, 'comment', 'member', 0, 1, NULL),
('airport', 51, 'comment', 'parent_member', 0, 1, NULL),
('airport', 51, 'comment', 'registered', 0, 1, NULL),
('airport', 51, 'view', 'everyone', 0, 1, NULL),
('airport', 51, 'view', 'member', 0, 1, NULL),
('airport', 51, 'view', 'parent_member', 0, 1, NULL),
('airport', 51, 'view', 'registered', 0, 1, NULL),
('airport', 52, 'comment', 'everyone', 0, 1, NULL),
('airport', 52, 'comment', 'member', 0, 1, NULL),
('airport', 52, 'comment', 'parent_member', 0, 1, NULL),
('airport', 52, 'comment', 'registered', 0, 1, NULL),
('airport', 52, 'view', 'everyone', 0, 1, NULL),
('airport', 52, 'view', 'member', 0, 1, NULL),
('airport', 52, 'view', 'parent_member', 0, 1, NULL),
('airport', 52, 'view', 'registered', 0, 1, NULL),
('airport', 53, 'comment', 'everyone', 0, 1, NULL),
('airport', 53, 'comment', 'member', 0, 1, NULL),
('airport', 53, 'comment', 'parent_member', 0, 1, NULL),
('airport', 53, 'comment', 'registered', 0, 1, NULL),
('airport', 53, 'view', 'everyone', 0, 1, NULL),
('airport', 53, 'view', 'member', 0, 1, NULL),
('airport', 53, 'view', 'parent_member', 0, 1, NULL),
('airport', 53, 'view', 'registered', 0, 1, NULL),
('airport', 54, 'comment', 'everyone', 0, 1, NULL),
('airport', 54, 'comment', 'member', 0, 1, NULL),
('airport', 54, 'comment', 'parent_member', 0, 1, NULL),
('airport', 54, 'comment', 'registered', 0, 1, NULL),
('airport', 54, 'view', 'everyone', 0, 1, NULL),
('airport', 54, 'view', 'member', 0, 1, NULL),
('airport', 54, 'view', 'parent_member', 0, 1, NULL),
('airport', 54, 'view', 'registered', 0, 1, NULL),
('airport', 55, 'comment', 'everyone', 0, 1, NULL),
('airport', 55, 'comment', 'member', 0, 1, NULL),
('airport', 55, 'comment', 'parent_member', 0, 1, NULL),
('airport', 55, 'comment', 'registered', 0, 1, NULL),
('airport', 55, 'view', 'everyone', 0, 1, NULL),
('airport', 55, 'view', 'member', 0, 1, NULL),
('airport', 55, 'view', 'parent_member', 0, 1, NULL),
('airport', 55, 'view', 'registered', 0, 1, NULL),
('airport', 56, 'comment', 'everyone', 0, 1, NULL),
('airport', 56, 'comment', 'member', 0, 1, NULL),
('airport', 56, 'comment', 'parent_member', 0, 1, NULL),
('airport', 56, 'comment', 'registered', 0, 1, NULL),
('airport', 56, 'view', 'everyone', 0, 1, NULL),
('airport', 56, 'view', 'member', 0, 1, NULL),
('airport', 56, 'view', 'parent_member', 0, 1, NULL),
('airport', 56, 'view', 'registered', 0, 1, NULL),
('airport', 57, 'comment', 'everyone', 0, 1, NULL),
('airport', 57, 'comment', 'member', 0, 1, NULL),
('airport', 57, 'comment', 'parent_member', 0, 1, NULL),
('airport', 57, 'comment', 'registered', 0, 1, NULL),
('airport', 57, 'view', 'everyone', 0, 1, NULL),
('airport', 57, 'view', 'member', 0, 1, NULL),
('airport', 57, 'view', 'parent_member', 0, 1, NULL),
('airport', 57, 'view', 'registered', 0, 1, NULL),
('airport', 58, 'comment', 'everyone', 0, 1, NULL),
('airport', 58, 'comment', 'member', 0, 1, NULL),
('airport', 58, 'comment', 'parent_member', 0, 1, NULL),
('airport', 58, 'comment', 'registered', 0, 1, NULL),
('airport', 58, 'view', 'everyone', 0, 1, NULL),
('airport', 58, 'view', 'member', 0, 1, NULL),
('airport', 58, 'view', 'parent_member', 0, 1, NULL),
('airport', 58, 'view', 'registered', 0, 1, NULL),
('airport', 59, 'comment', 'everyone', 0, 1, NULL),
('airport', 59, 'comment', 'member', 0, 1, NULL),
('airport', 59, 'comment', 'parent_member', 0, 1, NULL),
('airport', 59, 'comment', 'registered', 0, 1, NULL),
('airport', 59, 'view', 'everyone', 0, 1, NULL),
('airport', 59, 'view', 'member', 0, 1, NULL),
('airport', 59, 'view', 'parent_member', 0, 1, NULL),
('airport', 59, 'view', 'registered', 0, 1, NULL),
('airport', 60, 'comment', 'everyone', 0, 1, NULL),
('airport', 60, 'comment', 'member', 0, 1, NULL),
('airport', 60, 'comment', 'parent_member', 0, 1, NULL),
('airport', 60, 'comment', 'registered', 0, 1, NULL),
('airport', 60, 'view', 'everyone', 0, 1, NULL),
('airport', 60, 'view', 'member', 0, 1, NULL),
('airport', 60, 'view', 'parent_member', 0, 1, NULL),
('airport', 60, 'view', 'registered', 0, 1, NULL),
('airport', 61, 'comment', 'everyone', 0, 1, NULL),
('airport', 61, 'comment', 'member', 0, 1, NULL),
('airport', 61, 'comment', 'parent_member', 0, 1, NULL),
('airport', 61, 'comment', 'registered', 0, 1, NULL),
('airport', 61, 'view', 'everyone', 0, 1, NULL),
('airport', 61, 'view', 'member', 0, 1, NULL),
('airport', 61, 'view', 'parent_member', 0, 1, NULL),
('airport', 61, 'view', 'registered', 0, 1, NULL),
('airport', 62, 'comment', 'everyone', 0, 1, NULL),
('airport', 62, 'comment', 'member', 0, 1, NULL),
('airport', 62, 'comment', 'parent_member', 0, 1, NULL),
('airport', 62, 'comment', 'registered', 0, 1, NULL),
('airport', 62, 'view', 'everyone', 0, 1, NULL),
('airport', 62, 'view', 'member', 0, 1, NULL),
('airport', 62, 'view', 'parent_member', 0, 1, NULL),
('airport', 62, 'view', 'registered', 0, 1, NULL),
('airport', 63, 'comment', 'everyone', 0, 1, NULL),
('airport', 63, 'comment', 'member', 0, 1, NULL),
('airport', 63, 'comment', 'parent_member', 0, 1, NULL),
('airport', 63, 'comment', 'registered', 0, 1, NULL),
('airport', 63, 'view', 'everyone', 0, 1, NULL),
('airport', 63, 'view', 'member', 0, 1, NULL),
('airport', 63, 'view', 'parent_member', 0, 1, NULL),
('airport', 63, 'view', 'registered', 0, 1, NULL),
('airport', 64, 'comment', 'everyone', 0, 1, NULL),
('airport', 64, 'comment', 'member', 0, 1, NULL),
('airport', 64, 'comment', 'parent_member', 0, 1, NULL),
('airport', 64, 'comment', 'registered', 0, 1, NULL),
('airport', 64, 'view', 'everyone', 0, 1, NULL),
('airport', 64, 'view', 'member', 0, 1, NULL),
('airport', 64, 'view', 'parent_member', 0, 1, NULL),
('airport', 64, 'view', 'registered', 0, 1, NULL),
('airport', 65, 'comment', 'everyone', 0, 1, NULL),
('airport', 65, 'comment', 'member', 0, 1, NULL),
('airport', 65, 'comment', 'parent_member', 0, 1, NULL),
('airport', 65, 'comment', 'registered', 0, 1, NULL),
('airport', 65, 'view', 'everyone', 0, 1, NULL),
('airport', 65, 'view', 'member', 0, 1, NULL),
('airport', 65, 'view', 'parent_member', 0, 1, NULL),
('airport', 65, 'view', 'registered', 0, 1, NULL),
('airport', 66, 'comment', 'everyone', 0, 1, NULL),
('airport', 66, 'comment', 'member', 0, 1, NULL),
('airport', 66, 'comment', 'parent_member', 0, 1, NULL),
('airport', 66, 'comment', 'registered', 0, 1, NULL),
('airport', 66, 'view', 'everyone', 0, 1, NULL),
('airport', 66, 'view', 'member', 0, 1, NULL),
('airport', 66, 'view', 'parent_member', 0, 1, NULL),
('airport', 66, 'view', 'registered', 0, 1, NULL),
('airport', 67, 'comment', 'everyone', 0, 1, NULL),
('airport', 67, 'comment', 'member', 0, 1, NULL),
('airport', 67, 'comment', 'parent_member', 0, 1, NULL),
('airport', 67, 'comment', 'registered', 0, 1, NULL),
('airport', 67, 'view', 'everyone', 0, 1, NULL),
('airport', 67, 'view', 'member', 0, 1, NULL),
('airport', 67, 'view', 'parent_member', 0, 1, NULL),
('airport', 67, 'view', 'registered', 0, 1, NULL),
('airport', 68, 'comment', 'everyone', 0, 1, NULL),
('airport', 68, 'comment', 'member', 0, 1, NULL),
('airport', 68, 'comment', 'parent_member', 0, 1, NULL),
('airport', 68, 'comment', 'registered', 0, 1, NULL),
('airport', 68, 'view', 'everyone', 0, 1, NULL),
('airport', 68, 'view', 'member', 0, 1, NULL),
('airport', 68, 'view', 'parent_member', 0, 1, NULL),
('airport', 68, 'view', 'registered', 0, 1, NULL),
('airport', 69, 'comment', 'everyone', 0, 1, NULL),
('airport', 69, 'comment', 'member', 0, 1, NULL),
('airport', 69, 'comment', 'parent_member', 0, 1, NULL),
('airport', 69, 'comment', 'registered', 0, 1, NULL),
('airport', 69, 'view', 'everyone', 0, 1, NULL),
('airport', 69, 'view', 'member', 0, 1, NULL),
('airport', 69, 'view', 'parent_member', 0, 1, NULL),
('airport', 69, 'view', 'registered', 0, 1, NULL),
('airport', 70, 'comment', 'everyone', 0, 1, NULL),
('airport', 70, 'comment', 'member', 0, 1, NULL),
('airport', 70, 'comment', 'parent_member', 0, 1, NULL),
('airport', 70, 'comment', 'registered', 0, 1, NULL),
('airport', 70, 'view', 'everyone', 0, 1, NULL),
('airport', 70, 'view', 'member', 0, 1, NULL),
('airport', 70, 'view', 'parent_member', 0, 1, NULL),
('airport', 70, 'view', 'registered', 0, 1, NULL),
('airport', 71, 'comment', 'everyone', 0, 1, NULL),
('airport', 71, 'comment', 'member', 0, 1, NULL),
('airport', 71, 'comment', 'parent_member', 0, 1, NULL),
('airport', 71, 'comment', 'registered', 0, 1, NULL),
('airport', 71, 'view', 'everyone', 0, 1, NULL),
('airport', 71, 'view', 'member', 0, 1, NULL),
('airport', 71, 'view', 'parent_member', 0, 1, NULL),
('airport', 71, 'view', 'registered', 0, 1, NULL),
('airport', 72, 'comment', 'everyone', 0, 1, NULL),
('airport', 72, 'comment', 'member', 0, 1, NULL),
('airport', 72, 'comment', 'parent_member', 0, 1, NULL),
('airport', 72, 'comment', 'registered', 0, 1, NULL),
('airport', 72, 'view', 'everyone', 0, 1, NULL),
('airport', 72, 'view', 'member', 0, 1, NULL),
('airport', 72, 'view', 'parent_member', 0, 1, NULL),
('airport', 72, 'view', 'registered', 0, 1, NULL),
('airport', 73, 'comment', 'everyone', 0, 1, NULL),
('airport', 73, 'comment', 'member', 0, 1, NULL),
('airport', 73, 'comment', 'parent_member', 0, 1, NULL),
('airport', 73, 'comment', 'registered', 0, 1, NULL),
('airport', 73, 'view', 'everyone', 0, 1, NULL),
('airport', 73, 'view', 'member', 0, 1, NULL),
('airport', 73, 'view', 'parent_member', 0, 1, NULL),
('airport', 73, 'view', 'registered', 0, 1, NULL),
('airport', 74, 'comment', 'everyone', 0, 1, NULL),
('airport', 74, 'comment', 'member', 0, 1, NULL),
('airport', 74, 'comment', 'parent_member', 0, 1, NULL),
('airport', 74, 'comment', 'registered', 0, 1, NULL),
('airport', 74, 'view', 'everyone', 0, 1, NULL),
('airport', 74, 'view', 'member', 0, 1, NULL),
('airport', 74, 'view', 'parent_member', 0, 1, NULL),
('airport', 74, 'view', 'registered', 0, 1, NULL),
('airport', 75, 'comment', 'everyone', 0, 1, NULL),
('airport', 75, 'comment', 'member', 0, 1, NULL),
('airport', 75, 'comment', 'parent_member', 0, 1, NULL),
('airport', 75, 'comment', 'registered', 0, 1, NULL),
('airport', 75, 'view', 'everyone', 0, 1, NULL),
('airport', 75, 'view', 'member', 0, 1, NULL),
('airport', 75, 'view', 'parent_member', 0, 1, NULL),
('airport', 75, 'view', 'registered', 0, 1, NULL),
('airport', 76, 'comment', 'everyone', 0, 1, NULL),
('airport', 76, 'comment', 'member', 0, 1, NULL),
('airport', 76, 'comment', 'parent_member', 0, 1, NULL),
('airport', 76, 'comment', 'registered', 0, 1, NULL),
('airport', 76, 'view', 'everyone', 0, 1, NULL),
('airport', 76, 'view', 'member', 0, 1, NULL),
('airport', 76, 'view', 'parent_member', 0, 1, NULL),
('airport', 76, 'view', 'registered', 0, 1, NULL),
('airport', 77, 'comment', 'everyone', 0, 1, NULL),
('airport', 77, 'comment', 'member', 0, 1, NULL),
('airport', 77, 'comment', 'parent_member', 0, 1, NULL),
('airport', 77, 'comment', 'registered', 0, 1, NULL),
('airport', 77, 'view', 'everyone', 0, 1, NULL),
('airport', 77, 'view', 'member', 0, 1, NULL),
('airport', 77, 'view', 'parent_member', 0, 1, NULL),
('airport', 77, 'view', 'registered', 0, 1, NULL),
('airport', 78, 'comment', 'everyone', 0, 1, NULL),
('airport', 78, 'comment', 'member', 0, 1, NULL),
('airport', 78, 'comment', 'parent_member', 0, 1, NULL),
('airport', 78, 'comment', 'registered', 0, 1, NULL),
('airport', 78, 'view', 'everyone', 0, 1, NULL),
('airport', 78, 'view', 'member', 0, 1, NULL),
('airport', 78, 'view', 'parent_member', 0, 1, NULL),
('airport', 78, 'view', 'registered', 0, 1, NULL),
('airport', 79, 'comment', 'everyone', 0, 1, NULL),
('airport', 79, 'comment', 'member', 0, 1, NULL),
('airport', 79, 'comment', 'parent_member', 0, 1, NULL),
('airport', 79, 'comment', 'registered', 0, 1, NULL),
('airport', 79, 'view', 'everyone', 0, 1, NULL),
('airport', 79, 'view', 'member', 0, 1, NULL),
('airport', 79, 'view', 'parent_member', 0, 1, NULL),
('airport', 79, 'view', 'registered', 0, 1, NULL),
('airport', 80, 'comment', 'everyone', 0, 1, NULL),
('airport', 80, 'comment', 'member', 0, 1, NULL),
('airport', 80, 'comment', 'parent_member', 0, 1, NULL),
('airport', 80, 'comment', 'registered', 0, 1, NULL),
('airport', 80, 'view', 'everyone', 0, 1, NULL),
('airport', 80, 'view', 'member', 0, 1, NULL),
('airport', 80, 'view', 'parent_member', 0, 1, NULL),
('airport', 80, 'view', 'registered', 0, 1, NULL),
('airport', 81, 'comment', 'everyone', 0, 1, NULL),
('airport', 81, 'comment', 'member', 0, 1, NULL),
('airport', 81, 'comment', 'parent_member', 0, 1, NULL),
('airport', 81, 'comment', 'registered', 0, 1, NULL),
('airport', 81, 'view', 'everyone', 0, 1, NULL),
('airport', 81, 'view', 'member', 0, 1, NULL),
('airport', 81, 'view', 'parent_member', 0, 1, NULL),
('airport', 81, 'view', 'registered', 0, 1, NULL),
('airport', 82, 'comment', 'everyone', 0, 1, NULL),
('airport', 82, 'comment', 'member', 0, 1, NULL),
('airport', 82, 'comment', 'parent_member', 0, 1, NULL),
('airport', 82, 'comment', 'registered', 0, 1, NULL),
('airport', 82, 'view', 'everyone', 0, 1, NULL),
('airport', 82, 'view', 'member', 0, 1, NULL),
('airport', 82, 'view', 'parent_member', 0, 1, NULL),
('airport', 82, 'view', 'registered', 0, 1, NULL),
('airport', 83, 'comment', 'everyone', 0, 1, NULL),
('airport', 83, 'comment', 'member', 0, 1, NULL),
('airport', 83, 'comment', 'parent_member', 0, 1, NULL),
('airport', 83, 'comment', 'registered', 0, 1, NULL),
('airport', 83, 'view', 'everyone', 0, 1, NULL),
('airport', 83, 'view', 'member', 0, 1, NULL),
('airport', 83, 'view', 'parent_member', 0, 1, NULL),
('airport', 83, 'view', 'registered', 0, 1, NULL),
('airport', 84, 'comment', 'everyone', 0, 1, NULL),
('airport', 84, 'comment', 'member', 0, 1, NULL),
('airport', 84, 'comment', 'parent_member', 0, 1, NULL),
('airport', 84, 'comment', 'registered', 0, 1, NULL),
('airport', 84, 'view', 'everyone', 0, 1, NULL),
('airport', 84, 'view', 'member', 0, 1, NULL),
('airport', 84, 'view', 'parent_member', 0, 1, NULL),
('airport', 84, 'view', 'registered', 0, 1, NULL),
('airport', 85, 'comment', 'everyone', 0, 1, NULL),
('airport', 85, 'comment', 'member', 0, 1, NULL),
('airport', 85, 'comment', 'parent_member', 0, 1, NULL),
('airport', 85, 'comment', 'registered', 0, 1, NULL),
('airport', 85, 'view', 'everyone', 0, 1, NULL),
('airport', 85, 'view', 'member', 0, 1, NULL),
('airport', 85, 'view', 'parent_member', 0, 1, NULL),
('airport', 85, 'view', 'registered', 0, 1, NULL),
('airport', 86, 'comment', 'everyone', 0, 1, NULL),
('airport', 86, 'comment', 'member', 0, 1, NULL),
('airport', 86, 'comment', 'parent_member', 0, 1, NULL),
('airport', 86, 'comment', 'registered', 0, 1, NULL),
('airport', 86, 'view', 'everyone', 0, 1, NULL),
('airport', 86, 'view', 'member', 0, 1, NULL),
('airport', 86, 'view', 'parent_member', 0, 1, NULL),
('airport', 86, 'view', 'registered', 0, 1, NULL),
('airport', 87, 'comment', 'everyone', 0, 1, NULL),
('airport', 87, 'comment', 'member', 0, 1, NULL),
('airport', 87, 'comment', 'parent_member', 0, 1, NULL),
('airport', 87, 'comment', 'registered', 0, 1, NULL),
('airport', 87, 'view', 'everyone', 0, 1, NULL),
('airport', 87, 'view', 'member', 0, 1, NULL),
('airport', 87, 'view', 'parent_member', 0, 1, NULL),
('airport', 87, 'view', 'registered', 0, 1, NULL),
('airport', 88, 'comment', 'everyone', 0, 1, NULL),
('airport', 88, 'comment', 'member', 0, 1, NULL),
('airport', 88, 'comment', 'parent_member', 0, 1, NULL),
('airport', 88, 'comment', 'registered', 0, 1, NULL),
('airport', 88, 'view', 'everyone', 0, 1, NULL),
('airport', 88, 'view', 'member', 0, 1, NULL),
('airport', 88, 'view', 'parent_member', 0, 1, NULL),
('airport', 88, 'view', 'registered', 0, 1, NULL),
('airport', 89, 'comment', 'everyone', 0, 1, NULL),
('airport', 89, 'comment', 'member', 0, 1, NULL),
('airport', 89, 'comment', 'parent_member', 0, 1, NULL),
('airport', 89, 'comment', 'registered', 0, 1, NULL),
('airport', 89, 'view', 'everyone', 0, 1, NULL),
('airport', 89, 'view', 'member', 0, 1, NULL),
('airport', 89, 'view', 'parent_member', 0, 1, NULL),
('airport', 89, 'view', 'registered', 0, 1, NULL),
('airport', 90, 'comment', 'everyone', 0, 1, NULL),
('airport', 90, 'comment', 'member', 0, 1, NULL),
('airport', 90, 'comment', 'parent_member', 0, 1, NULL),
('airport', 90, 'comment', 'registered', 0, 1, NULL),
('airport', 90, 'view', 'everyone', 0, 1, NULL),
('airport', 90, 'view', 'member', 0, 1, NULL),
('airport', 90, 'view', 'parent_member', 0, 1, NULL),
('airport', 90, 'view', 'registered', 0, 1, NULL),
('airport', 91, 'comment', 'everyone', 0, 1, NULL),
('airport', 91, 'comment', 'member', 0, 1, NULL),
('airport', 91, 'comment', 'parent_member', 0, 1, NULL),
('airport', 91, 'comment', 'registered', 0, 1, NULL),
('airport', 91, 'view', 'everyone', 0, 1, NULL),
('airport', 91, 'view', 'member', 0, 1, NULL),
('airport', 91, 'view', 'parent_member', 0, 1, NULL),
('airport', 91, 'view', 'registered', 0, 1, NULL),
('airport', 92, 'comment', 'everyone', 0, 1, NULL),
('airport', 92, 'comment', 'member', 0, 1, NULL),
('airport', 92, 'comment', 'parent_member', 0, 1, NULL),
('airport', 92, 'comment', 'registered', 0, 1, NULL),
('airport', 92, 'view', 'everyone', 0, 1, NULL),
('airport', 92, 'view', 'member', 0, 1, NULL),
('airport', 92, 'view', 'parent_member', 0, 1, NULL),
('airport', 92, 'view', 'registered', 0, 1, NULL),
('airport', 93, 'comment', 'everyone', 0, 1, NULL),
('airport', 93, 'comment', 'member', 0, 1, NULL),
('airport', 93, 'comment', 'parent_member', 0, 1, NULL),
('airport', 93, 'comment', 'registered', 0, 1, NULL),
('airport', 93, 'view', 'everyone', 0, 1, NULL),
('airport', 93, 'view', 'member', 0, 1, NULL),
('airport', 93, 'view', 'parent_member', 0, 1, NULL),
('airport', 93, 'view', 'registered', 0, 1, NULL),
('airport', 94, 'comment', 'everyone', 0, 1, NULL),
('airport', 94, 'comment', 'member', 0, 1, NULL),
('airport', 94, 'comment', 'parent_member', 0, 1, NULL),
('airport', 94, 'comment', 'registered', 0, 1, NULL),
('airport', 94, 'view', 'everyone', 0, 1, NULL),
('airport', 94, 'view', 'member', 0, 1, NULL),
('airport', 94, 'view', 'parent_member', 0, 1, NULL),
('airport', 94, 'view', 'registered', 0, 1, NULL),
('airport', 95, 'comment', 'everyone', 0, 1, NULL),
('airport', 95, 'comment', 'member', 0, 1, NULL),
('airport', 95, 'comment', 'parent_member', 0, 1, NULL),
('airport', 95, 'comment', 'registered', 0, 1, NULL),
('airport', 95, 'view', 'everyone', 0, 1, NULL),
('airport', 95, 'view', 'member', 0, 1, NULL),
('airport', 95, 'view', 'parent_member', 0, 1, NULL),
('airport', 95, 'view', 'registered', 0, 1, NULL),
('airport', 96, 'comment', 'everyone', 0, 1, NULL),
('airport', 96, 'comment', 'member', 0, 1, NULL),
('airport', 96, 'comment', 'parent_member', 0, 1, NULL),
('airport', 96, 'comment', 'registered', 0, 1, NULL),
('airport', 96, 'view', 'everyone', 0, 1, NULL),
('airport', 96, 'view', 'member', 0, 1, NULL),
('airport', 96, 'view', 'parent_member', 0, 1, NULL),
('airport', 96, 'view', 'registered', 0, 1, NULL),
('airport', 97, 'comment', 'everyone', 0, 1, NULL),
('airport', 97, 'comment', 'member', 0, 1, NULL),
('airport', 97, 'comment', 'parent_member', 0, 1, NULL),
('airport', 97, 'comment', 'registered', 0, 1, NULL),
('airport', 97, 'view', 'everyone', 0, 1, NULL),
('airport', 97, 'view', 'member', 0, 1, NULL),
('airport', 97, 'view', 'parent_member', 0, 1, NULL),
('airport', 97, 'view', 'registered', 0, 1, NULL),
('airport', 98, 'comment', 'everyone', 0, 1, NULL),
('airport', 98, 'comment', 'member', 0, 1, NULL),
('airport', 98, 'comment', 'parent_member', 0, 1, NULL),
('airport', 98, 'comment', 'registered', 0, 1, NULL),
('airport', 98, 'view', 'everyone', 0, 1, NULL),
('airport', 98, 'view', 'member', 0, 1, NULL),
('airport', 98, 'view', 'parent_member', 0, 1, NULL),
('airport', 98, 'view', 'registered', 0, 1, NULL),
('airport', 99, 'comment', 'everyone', 0, 1, NULL),
('airport', 99, 'comment', 'member', 0, 1, NULL),
('airport', 99, 'comment', 'parent_member', 0, 1, NULL),
('airport', 99, 'comment', 'registered', 0, 1, NULL),
('airport', 99, 'view', 'everyone', 0, 1, NULL),
('airport', 99, 'view', 'member', 0, 1, NULL),
('airport', 99, 'view', 'parent_member', 0, 1, NULL),
('airport', 99, 'view', 'registered', 0, 1, NULL),
('airport', 100, 'comment', 'everyone', 0, 1, NULL),
('airport', 100, 'comment', 'member', 0, 1, NULL),
('airport', 100, 'comment', 'parent_member', 0, 1, NULL),
('airport', 100, 'comment', 'registered', 0, 1, NULL),
('airport', 100, 'view', 'everyone', 0, 1, NULL),
('airport', 100, 'view', 'member', 0, 1, NULL),
('airport', 100, 'view', 'parent_member', 0, 1, NULL),
('airport', 100, 'view', 'registered', 0, 1, NULL),
('airport', 101, 'comment', 'everyone', 0, 1, NULL),
('airport', 101, 'comment', 'member', 0, 1, NULL),
('airport', 101, 'comment', 'parent_member', 0, 1, NULL),
('airport', 101, 'comment', 'registered', 0, 1, NULL),
('airport', 101, 'view', 'everyone', 0, 1, NULL),
('airport', 101, 'view', 'member', 0, 1, NULL),
('airport', 101, 'view', 'parent_member', 0, 1, NULL),
('airport', 101, 'view', 'registered', 0, 1, NULL),
('airport', 102, 'comment', 'everyone', 0, 1, NULL),
('airport', 102, 'comment', 'member', 0, 1, NULL),
('airport', 102, 'comment', 'parent_member', 0, 1, NULL),
('airport', 102, 'comment', 'registered', 0, 1, NULL),
('airport', 102, 'view', 'everyone', 0, 1, NULL),
('airport', 102, 'view', 'member', 0, 1, NULL),
('airport', 102, 'view', 'parent_member', 0, 1, NULL),
('airport', 102, 'view', 'registered', 0, 1, NULL),
('airport', 103, 'comment', 'everyone', 0, 1, NULL),
('airport', 103, 'comment', 'member', 0, 1, NULL),
('airport', 103, 'comment', 'parent_member', 0, 1, NULL),
('airport', 103, 'comment', 'registered', 0, 1, NULL),
('airport', 103, 'view', 'everyone', 0, 1, NULL),
('airport', 103, 'view', 'member', 0, 1, NULL),
('airport', 103, 'view', 'parent_member', 0, 1, NULL),
('airport', 103, 'view', 'registered', 0, 1, NULL),
('airport', 104, 'comment', 'everyone', 0, 1, NULL),
('airport', 104, 'comment', 'member', 0, 1, NULL),
('airport', 104, 'comment', 'parent_member', 0, 1, NULL),
('airport', 104, 'comment', 'registered', 0, 1, NULL),
('airport', 104, 'view', 'everyone', 0, 1, NULL),
('airport', 104, 'view', 'member', 0, 1, NULL),
('airport', 104, 'view', 'parent_member', 0, 1, NULL),
('airport', 104, 'view', 'registered', 0, 1, NULL),
('airport', 105, 'comment', 'everyone', 0, 1, NULL),
('airport', 105, 'comment', 'member', 0, 1, NULL),
('airport', 105, 'comment', 'parent_member', 0, 1, NULL),
('airport', 105, 'comment', 'registered', 0, 1, NULL),
('airport', 105, 'view', 'everyone', 0, 1, NULL),
('airport', 105, 'view', 'member', 0, 1, NULL),
('airport', 105, 'view', 'parent_member', 0, 1, NULL),
('airport', 105, 'view', 'registered', 0, 1, NULL),
('airport', 106, 'comment', 'everyone', 0, 1, NULL),
('airport', 106, 'comment', 'member', 0, 1, NULL),
('airport', 106, 'comment', 'parent_member', 0, 1, NULL),
('airport', 106, 'comment', 'registered', 0, 1, NULL),
('airport', 106, 'view', 'everyone', 0, 1, NULL),
('airport', 106, 'view', 'member', 0, 1, NULL),
('airport', 106, 'view', 'parent_member', 0, 1, NULL),
('airport', 106, 'view', 'registered', 0, 1, NULL),
('airport', 107, 'comment', 'everyone', 0, 1, NULL),
('airport', 107, 'comment', 'member', 0, 1, NULL),
('airport', 107, 'comment', 'parent_member', 0, 1, NULL),
('airport', 107, 'comment', 'registered', 0, 1, NULL),
('airport', 107, 'view', 'everyone', 0, 1, NULL),
('airport', 107, 'view', 'member', 0, 1, NULL),
('airport', 107, 'view', 'parent_member', 0, 1, NULL),
('airport', 107, 'view', 'registered', 0, 1, NULL),
('airport', 108, 'comment', 'everyone', 0, 1, NULL),
('airport', 108, 'comment', 'member', 0, 1, NULL),
('airport', 108, 'comment', 'parent_member', 0, 1, NULL),
('airport', 108, 'comment', 'registered', 0, 1, NULL),
('airport', 108, 'view', 'everyone', 0, 1, NULL),
('airport', 108, 'view', 'member', 0, 1, NULL),
('airport', 108, 'view', 'parent_member', 0, 1, NULL),
('airport', 108, 'view', 'registered', 0, 1, NULL),
('airport', 109, 'comment', 'everyone', 0, 1, NULL),
('airport', 109, 'comment', 'member', 0, 1, NULL),
('airport', 109, 'comment', 'parent_member', 0, 1, NULL),
('airport', 109, 'comment', 'registered', 0, 1, NULL),
('airport', 109, 'view', 'everyone', 0, 1, NULL),
('airport', 109, 'view', 'member', 0, 1, NULL),
('airport', 109, 'view', 'parent_member', 0, 1, NULL),
('airport', 109, 'view', 'registered', 0, 1, NULL),
('airport', 110, 'comment', 'everyone', 0, 1, NULL),
('airport', 110, 'comment', 'member', 0, 1, NULL),
('airport', 110, 'comment', 'parent_member', 0, 1, NULL),
('airport', 110, 'comment', 'registered', 0, 1, NULL),
('airport', 110, 'view', 'everyone', 0, 1, NULL),
('airport', 110, 'view', 'member', 0, 1, NULL),
('airport', 110, 'view', 'parent_member', 0, 1, NULL),
('airport', 110, 'view', 'registered', 0, 1, NULL),
('airport', 111, 'comment', 'everyone', 0, 1, NULL),
('airport', 111, 'comment', 'member', 0, 1, NULL),
('airport', 111, 'comment', 'parent_member', 0, 1, NULL),
('airport', 111, 'comment', 'registered', 0, 1, NULL),
('airport', 111, 'view', 'everyone', 0, 1, NULL),
('airport', 111, 'view', 'member', 0, 1, NULL),
('airport', 111, 'view', 'parent_member', 0, 1, NULL),
('airport', 111, 'view', 'registered', 0, 1, NULL),
('airport', 112, 'comment', 'everyone', 0, 1, NULL),
('airport', 112, 'comment', 'member', 0, 1, NULL),
('airport', 112, 'comment', 'parent_member', 0, 1, NULL),
('airport', 112, 'comment', 'registered', 0, 1, NULL),
('airport', 112, 'view', 'everyone', 0, 1, NULL),
('airport', 112, 'view', 'member', 0, 1, NULL),
('airport', 112, 'view', 'parent_member', 0, 1, NULL),
('airport', 112, 'view', 'registered', 0, 1, NULL),
('airport', 113, 'comment', 'everyone', 0, 1, NULL),
('airport', 113, 'comment', 'member', 0, 1, NULL),
('airport', 113, 'comment', 'parent_member', 0, 1, NULL),
('airport', 113, 'comment', 'registered', 0, 1, NULL),
('airport', 113, 'view', 'everyone', 0, 1, NULL),
('airport', 113, 'view', 'member', 0, 1, NULL),
('airport', 113, 'view', 'parent_member', 0, 1, NULL),
('airport', 113, 'view', 'registered', 0, 1, NULL),
('airport', 114, 'comment', 'everyone', 0, 1, NULL),
('airport', 114, 'comment', 'member', 0, 1, NULL),
('airport', 114, 'comment', 'parent_member', 0, 1, NULL),
('airport', 114, 'comment', 'registered', 0, 1, NULL),
('airport', 114, 'view', 'everyone', 0, 1, NULL),
('airport', 114, 'view', 'member', 0, 1, NULL),
('airport', 114, 'view', 'parent_member', 0, 1, NULL),
('airport', 114, 'view', 'registered', 0, 1, NULL),
('airport', 115, 'comment', 'everyone', 0, 1, NULL),
('airport', 115, 'comment', 'member', 0, 1, NULL),
('airport', 115, 'comment', 'parent_member', 0, 1, NULL),
('airport', 115, 'comment', 'registered', 0, 1, NULL),
('airport', 115, 'view', 'everyone', 0, 1, NULL),
('airport', 115, 'view', 'member', 0, 1, NULL),
('airport', 115, 'view', 'parent_member', 0, 1, NULL),
('airport', 115, 'view', 'registered', 0, 1, NULL),
('airport', 116, 'comment', 'everyone', 0, 1, NULL),
('airport', 116, 'comment', 'member', 0, 1, NULL),
('airport', 116, 'comment', 'parent_member', 0, 1, NULL),
('airport', 116, 'comment', 'registered', 0, 1, NULL),
('airport', 116, 'view', 'everyone', 0, 1, NULL),
('airport', 116, 'view', 'member', 0, 1, NULL),
('airport', 116, 'view', 'parent_member', 0, 1, NULL),
('airport', 116, 'view', 'registered', 0, 1, NULL),
('airport', 117, 'comment', 'everyone', 0, 1, NULL),
('airport', 117, 'comment', 'member', 0, 1, NULL),
('airport', 117, 'comment', 'parent_member', 0, 1, NULL),
('airport', 117, 'comment', 'registered', 0, 1, NULL),
('airport', 117, 'view', 'everyone', 0, 1, NULL),
('airport', 117, 'view', 'member', 0, 1, NULL),
('airport', 117, 'view', 'parent_member', 0, 1, NULL),
('airport', 117, 'view', 'registered', 0, 1, NULL),
('airport', 118, 'comment', 'everyone', 0, 1, NULL),
('airport', 118, 'comment', 'member', 0, 1, NULL),
('airport', 118, 'comment', 'parent_member', 0, 1, NULL),
('airport', 118, 'comment', 'registered', 0, 1, NULL),
('airport', 118, 'view', 'everyone', 0, 1, NULL),
('airport', 118, 'view', 'member', 0, 1, NULL),
('airport', 118, 'view', 'parent_member', 0, 1, NULL),
('airport', 118, 'view', 'registered', 0, 1, NULL),
('airport', 119, 'comment', 'everyone', 0, 1, NULL),
('airport', 119, 'comment', 'member', 0, 1, NULL),
('airport', 119, 'comment', 'parent_member', 0, 1, NULL),
('airport', 119, 'comment', 'registered', 0, 1, NULL),
('airport', 119, 'view', 'everyone', 0, 1, NULL),
('airport', 119, 'view', 'member', 0, 1, NULL),
('airport', 119, 'view', 'parent_member', 0, 1, NULL),
('airport', 119, 'view', 'registered', 0, 1, NULL),
('airport', 120, 'comment', 'everyone', 0, 1, NULL),
('airport', 120, 'comment', 'member', 0, 1, NULL),
('airport', 120, 'comment', 'parent_member', 0, 1, NULL),
('airport', 120, 'comment', 'registered', 0, 1, NULL),
('airport', 120, 'view', 'everyone', 0, 1, NULL),
('airport', 120, 'view', 'member', 0, 1, NULL),
('airport', 120, 'view', 'parent_member', 0, 1, NULL),
('airport', 120, 'view', 'registered', 0, 1, NULL),
('airport', 121, 'comment', 'everyone', 0, 1, NULL),
('airport', 121, 'comment', 'member', 0, 1, NULL),
('airport', 121, 'comment', 'parent_member', 0, 1, NULL),
('airport', 121, 'comment', 'registered', 0, 1, NULL),
('airport', 121, 'view', 'everyone', 0, 1, NULL),
('airport', 121, 'view', 'member', 0, 1, NULL),
('airport', 121, 'view', 'parent_member', 0, 1, NULL),
('airport', 121, 'view', 'registered', 0, 1, NULL),
('airport', 122, 'comment', 'everyone', 0, 1, NULL),
('airport', 122, 'comment', 'member', 0, 1, NULL),
('airport', 122, 'comment', 'parent_member', 0, 1, NULL),
('airport', 122, 'comment', 'registered', 0, 1, NULL),
('airport', 122, 'view', 'everyone', 0, 1, NULL),
('airport', 122, 'view', 'member', 0, 1, NULL),
('airport', 122, 'view', 'parent_member', 0, 1, NULL),
('airport', 122, 'view', 'registered', 0, 1, NULL),
('airport', 123, 'comment', 'everyone', 0, 1, NULL),
('airport', 123, 'comment', 'member', 0, 1, NULL),
('airport', 123, 'comment', 'parent_member', 0, 1, NULL),
('airport', 123, 'comment', 'registered', 0, 1, NULL),
('airport', 123, 'view', 'everyone', 0, 1, NULL),
('airport', 123, 'view', 'member', 0, 1, NULL),
('airport', 123, 'view', 'parent_member', 0, 1, NULL),
('airport', 123, 'view', 'registered', 0, 1, NULL),
('airport', 124, 'comment', 'everyone', 0, 1, NULL),
('airport', 124, 'comment', 'member', 0, 1, NULL),
('airport', 124, 'comment', 'parent_member', 0, 1, NULL),
('airport', 124, 'comment', 'registered', 0, 1, NULL),
('airport', 124, 'view', 'everyone', 0, 1, NULL),
('airport', 124, 'view', 'member', 0, 1, NULL),
('airport', 124, 'view', 'parent_member', 0, 1, NULL),
('airport', 124, 'view', 'registered', 0, 1, NULL),
('airport', 125, 'comment', 'everyone', 0, 1, NULL),
('airport', 125, 'comment', 'member', 0, 1, NULL),
('airport', 125, 'comment', 'parent_member', 0, 1, NULL),
('airport', 125, 'comment', 'registered', 0, 1, NULL),
('airport', 125, 'view', 'everyone', 0, 1, NULL),
('airport', 125, 'view', 'member', 0, 1, NULL),
('airport', 125, 'view', 'parent_member', 0, 1, NULL);
INSERT INTO `engine4_authorization_allow` (`resource_type`, `resource_id`, `action`, `role`, `role_id`, `value`, `params`) VALUES
('airport', 125, 'view', 'registered', 0, 1, NULL),
('airport', 126, 'comment', 'everyone', 0, 1, NULL),
('airport', 126, 'comment', 'member', 0, 1, NULL),
('airport', 126, 'comment', 'parent_member', 0, 1, NULL),
('airport', 126, 'comment', 'registered', 0, 1, NULL),
('airport', 126, 'view', 'everyone', 0, 1, NULL),
('airport', 126, 'view', 'member', 0, 1, NULL),
('airport', 126, 'view', 'parent_member', 0, 1, NULL),
('airport', 126, 'view', 'registered', 0, 1, NULL),
('airport', 127, 'comment', 'everyone', 0, 1, NULL),
('airport', 127, 'comment', 'member', 0, 1, NULL),
('airport', 127, 'comment', 'parent_member', 0, 1, NULL),
('airport', 127, 'comment', 'registered', 0, 1, NULL),
('airport', 127, 'view', 'everyone', 0, 1, NULL),
('airport', 127, 'view', 'member', 0, 1, NULL),
('airport', 127, 'view', 'parent_member', 0, 1, NULL),
('airport', 127, 'view', 'registered', 0, 1, NULL),
('airport', 128, 'comment', 'everyone', 0, 1, NULL),
('airport', 128, 'comment', 'member', 0, 1, NULL),
('airport', 128, 'comment', 'parent_member', 0, 1, NULL),
('airport', 128, 'comment', 'registered', 0, 1, NULL),
('airport', 128, 'view', 'everyone', 0, 1, NULL),
('airport', 128, 'view', 'member', 0, 1, NULL),
('airport', 128, 'view', 'parent_member', 0, 1, NULL),
('airport', 128, 'view', 'registered', 0, 1, NULL),
('airport', 129, 'comment', 'everyone', 0, 1, NULL),
('airport', 129, 'comment', 'member', 0, 1, NULL),
('airport', 129, 'comment', 'parent_member', 0, 1, NULL),
('airport', 129, 'comment', 'registered', 0, 1, NULL),
('airport', 129, 'view', 'everyone', 0, 1, NULL),
('airport', 129, 'view', 'member', 0, 1, NULL),
('airport', 129, 'view', 'parent_member', 0, 1, NULL),
('airport', 129, 'view', 'registered', 0, 1, NULL),
('airport', 130, 'comment', 'everyone', 0, 1, NULL),
('airport', 130, 'comment', 'member', 0, 1, NULL),
('airport', 130, 'comment', 'parent_member', 0, 1, NULL),
('airport', 130, 'comment', 'registered', 0, 1, NULL),
('airport', 130, 'view', 'everyone', 0, 1, NULL),
('airport', 130, 'view', 'member', 0, 1, NULL),
('airport', 130, 'view', 'parent_member', 0, 1, NULL),
('airport', 130, 'view', 'registered', 0, 1, NULL),
('airport', 131, 'comment', 'everyone', 0, 1, NULL),
('airport', 131, 'comment', 'member', 0, 1, NULL),
('airport', 131, 'comment', 'parent_member', 0, 1, NULL),
('airport', 131, 'comment', 'registered', 0, 1, NULL),
('airport', 131, 'view', 'everyone', 0, 1, NULL),
('airport', 131, 'view', 'member', 0, 1, NULL),
('airport', 131, 'view', 'parent_member', 0, 1, NULL),
('airport', 131, 'view', 'registered', 0, 1, NULL),
('airport', 132, 'comment', 'everyone', 0, 1, NULL),
('airport', 132, 'comment', 'member', 0, 1, NULL),
('airport', 132, 'comment', 'parent_member', 0, 1, NULL),
('airport', 132, 'comment', 'registered', 0, 1, NULL),
('airport', 132, 'view', 'everyone', 0, 1, NULL),
('airport', 132, 'view', 'member', 0, 1, NULL),
('airport', 132, 'view', 'parent_member', 0, 1, NULL),
('airport', 132, 'view', 'registered', 0, 1, NULL),
('airport', 133, 'comment', 'everyone', 0, 1, NULL),
('airport', 133, 'comment', 'member', 0, 1, NULL),
('airport', 133, 'comment', 'parent_member', 0, 1, NULL),
('airport', 133, 'comment', 'registered', 0, 1, NULL),
('airport', 133, 'view', 'everyone', 0, 1, NULL),
('airport', 133, 'view', 'member', 0, 1, NULL),
('airport', 133, 'view', 'parent_member', 0, 1, NULL),
('airport', 133, 'view', 'registered', 0, 1, NULL),
('airport', 134, 'comment', 'everyone', 0, 1, NULL),
('airport', 134, 'comment', 'member', 0, 1, NULL),
('airport', 134, 'comment', 'parent_member', 0, 1, NULL),
('airport', 134, 'comment', 'registered', 0, 1, NULL),
('airport', 134, 'view', 'everyone', 0, 1, NULL),
('airport', 134, 'view', 'member', 0, 1, NULL),
('airport', 134, 'view', 'parent_member', 0, 1, NULL),
('airport', 134, 'view', 'registered', 0, 1, NULL),
('airport', 135, 'comment', 'everyone', 0, 1, NULL),
('airport', 135, 'comment', 'member', 0, 1, NULL),
('airport', 135, 'comment', 'parent_member', 0, 1, NULL),
('airport', 135, 'comment', 'registered', 0, 1, NULL),
('airport', 135, 'view', 'everyone', 0, 1, NULL),
('airport', 135, 'view', 'member', 0, 1, NULL),
('airport', 135, 'view', 'parent_member', 0, 1, NULL),
('airport', 135, 'view', 'registered', 0, 1, NULL),
('airport', 136, 'comment', 'everyone', 0, 1, NULL),
('airport', 136, 'comment', 'member', 0, 1, NULL),
('airport', 136, 'comment', 'parent_member', 0, 1, NULL),
('airport', 136, 'comment', 'registered', 0, 1, NULL),
('airport', 136, 'view', 'everyone', 0, 1, NULL),
('airport', 136, 'view', 'member', 0, 1, NULL),
('airport', 136, 'view', 'parent_member', 0, 1, NULL),
('airport', 136, 'view', 'registered', 0, 1, NULL),
('airport', 137, 'comment', 'everyone', 0, 1, NULL),
('airport', 137, 'comment', 'member', 0, 1, NULL),
('airport', 137, 'comment', 'parent_member', 0, 1, NULL),
('airport', 137, 'comment', 'registered', 0, 1, NULL),
('airport', 137, 'view', 'everyone', 0, 1, NULL),
('airport', 137, 'view', 'member', 0, 1, NULL),
('airport', 137, 'view', 'parent_member', 0, 1, NULL),
('airport', 137, 'view', 'registered', 0, 1, NULL),
('airport', 138, 'comment', 'everyone', 0, 1, NULL),
('airport', 138, 'comment', 'member', 0, 1, NULL),
('airport', 138, 'comment', 'parent_member', 0, 1, NULL),
('airport', 138, 'comment', 'registered', 0, 1, NULL),
('airport', 138, 'view', 'everyone', 0, 1, NULL),
('airport', 138, 'view', 'member', 0, 1, NULL),
('airport', 138, 'view', 'parent_member', 0, 1, NULL),
('airport', 138, 'view', 'registered', 0, 1, NULL),
('airport', 139, 'comment', 'everyone', 0, 1, NULL),
('airport', 139, 'comment', 'member', 0, 1, NULL),
('airport', 139, 'comment', 'parent_member', 0, 1, NULL),
('airport', 139, 'comment', 'registered', 0, 1, NULL),
('airport', 139, 'view', 'everyone', 0, 1, NULL),
('airport', 139, 'view', 'member', 0, 1, NULL),
('airport', 139, 'view', 'parent_member', 0, 1, NULL),
('airport', 139, 'view', 'registered', 0, 1, NULL),
('airport', 140, 'comment', 'everyone', 0, 1, NULL),
('airport', 140, 'comment', 'member', 0, 1, NULL),
('airport', 140, 'comment', 'parent_member', 0, 1, NULL),
('airport', 140, 'comment', 'registered', 0, 1, NULL),
('airport', 140, 'view', 'everyone', 0, 1, NULL),
('airport', 140, 'view', 'member', 0, 1, NULL),
('airport', 140, 'view', 'parent_member', 0, 1, NULL),
('airport', 140, 'view', 'registered', 0, 1, NULL),
('airport', 141, 'comment', 'everyone', 0, 1, NULL),
('airport', 141, 'comment', 'member', 0, 1, NULL),
('airport', 141, 'comment', 'parent_member', 0, 1, NULL),
('airport', 141, 'comment', 'registered', 0, 1, NULL),
('airport', 141, 'view', 'everyone', 0, 1, NULL),
('airport', 141, 'view', 'member', 0, 1, NULL),
('airport', 141, 'view', 'parent_member', 0, 1, NULL),
('airport', 141, 'view', 'registered', 0, 1, NULL),
('airport', 142, 'comment', 'everyone', 0, 1, NULL),
('airport', 142, 'comment', 'member', 0, 1, NULL),
('airport', 142, 'comment', 'parent_member', 0, 1, NULL),
('airport', 142, 'comment', 'registered', 0, 1, NULL),
('airport', 142, 'view', 'everyone', 0, 1, NULL),
('airport', 142, 'view', 'member', 0, 1, NULL),
('airport', 142, 'view', 'parent_member', 0, 1, NULL),
('airport', 142, 'view', 'registered', 0, 1, NULL),
('airport', 143, 'comment', 'everyone', 0, 1, NULL),
('airport', 143, 'comment', 'member', 0, 1, NULL),
('airport', 143, 'comment', 'parent_member', 0, 1, NULL),
('airport', 143, 'comment', 'registered', 0, 1, NULL),
('airport', 143, 'view', 'everyone', 0, 1, NULL),
('airport', 143, 'view', 'member', 0, 1, NULL),
('airport', 143, 'view', 'parent_member', 0, 1, NULL),
('airport', 143, 'view', 'registered', 0, 1, NULL),
('airport', 144, 'comment', 'everyone', 0, 1, NULL),
('airport', 144, 'comment', 'member', 0, 1, NULL),
('airport', 144, 'comment', 'parent_member', 0, 1, NULL),
('airport', 144, 'comment', 'registered', 0, 1, NULL),
('airport', 144, 'view', 'everyone', 0, 1, NULL),
('airport', 144, 'view', 'member', 0, 1, NULL),
('airport', 144, 'view', 'parent_member', 0, 1, NULL),
('airport', 144, 'view', 'registered', 0, 1, NULL),
('airport', 145, 'comment', 'everyone', 0, 1, NULL),
('airport', 145, 'comment', 'member', 0, 1, NULL),
('airport', 145, 'comment', 'parent_member', 0, 1, NULL),
('airport', 145, 'comment', 'registered', 0, 1, NULL),
('airport', 145, 'view', 'everyone', 0, 1, NULL),
('airport', 145, 'view', 'member', 0, 1, NULL),
('airport', 145, 'view', 'parent_member', 0, 1, NULL),
('airport', 145, 'view', 'registered', 0, 1, NULL),
('airport', 146, 'comment', 'everyone', 0, 1, NULL),
('airport', 146, 'comment', 'member', 0, 1, NULL),
('airport', 146, 'comment', 'parent_member', 0, 1, NULL),
('airport', 146, 'comment', 'registered', 0, 1, NULL),
('airport', 146, 'view', 'everyone', 0, 1, NULL),
('airport', 146, 'view', 'member', 0, 1, NULL),
('airport', 146, 'view', 'parent_member', 0, 1, NULL),
('airport', 146, 'view', 'registered', 0, 1, NULL),
('airport', 147, 'comment', 'everyone', 0, 1, NULL),
('airport', 147, 'comment', 'member', 0, 1, NULL),
('airport', 147, 'comment', 'parent_member', 0, 1, NULL),
('airport', 147, 'comment', 'registered', 0, 1, NULL),
('airport', 147, 'view', 'everyone', 0, 1, NULL),
('airport', 147, 'view', 'member', 0, 1, NULL),
('airport', 147, 'view', 'parent_member', 0, 1, NULL),
('airport', 147, 'view', 'registered', 0, 1, NULL),
('airport', 148, 'comment', 'everyone', 0, 1, NULL),
('airport', 148, 'comment', 'member', 0, 1, NULL),
('airport', 148, 'comment', 'parent_member', 0, 1, NULL),
('airport', 148, 'comment', 'registered', 0, 1, NULL),
('airport', 148, 'view', 'everyone', 0, 1, NULL),
('airport', 148, 'view', 'member', 0, 1, NULL),
('airport', 148, 'view', 'parent_member', 0, 1, NULL),
('airport', 148, 'view', 'registered', 0, 1, NULL),
('airport', 149, 'comment', 'everyone', 0, 1, NULL),
('airport', 149, 'comment', 'member', 0, 1, NULL),
('airport', 149, 'comment', 'parent_member', 0, 1, NULL),
('airport', 149, 'comment', 'registered', 0, 1, NULL),
('airport', 149, 'view', 'everyone', 0, 1, NULL),
('airport', 149, 'view', 'member', 0, 1, NULL),
('airport', 149, 'view', 'parent_member', 0, 1, NULL),
('airport', 149, 'view', 'registered', 0, 1, NULL),
('airport', 150, 'comment', 'everyone', 0, 1, NULL),
('airport', 150, 'comment', 'member', 0, 1, NULL),
('airport', 150, 'comment', 'parent_member', 0, 1, NULL),
('airport', 150, 'comment', 'registered', 0, 1, NULL),
('airport', 150, 'view', 'everyone', 0, 1, NULL),
('airport', 150, 'view', 'member', 0, 1, NULL),
('airport', 150, 'view', 'parent_member', 0, 1, NULL),
('airport', 150, 'view', 'registered', 0, 1, NULL),
('airport', 151, 'comment', 'everyone', 0, 1, NULL),
('airport', 151, 'comment', 'member', 0, 1, NULL),
('airport', 151, 'comment', 'parent_member', 0, 1, NULL),
('airport', 151, 'comment', 'registered', 0, 1, NULL),
('airport', 151, 'view', 'everyone', 0, 1, NULL),
('airport', 151, 'view', 'member', 0, 1, NULL),
('airport', 151, 'view', 'parent_member', 0, 1, NULL),
('airport', 151, 'view', 'registered', 0, 1, NULL),
('airport', 152, 'comment', 'everyone', 0, 1, NULL),
('airport', 152, 'comment', 'member', 0, 1, NULL),
('airport', 152, 'comment', 'parent_member', 0, 1, NULL),
('airport', 152, 'comment', 'registered', 0, 1, NULL),
('airport', 152, 'view', 'everyone', 0, 1, NULL),
('airport', 152, 'view', 'member', 0, 1, NULL),
('airport', 152, 'view', 'parent_member', 0, 1, NULL),
('airport', 152, 'view', 'registered', 0, 1, NULL),
('airport', 153, 'comment', 'everyone', 0, 1, NULL),
('airport', 153, 'comment', 'member', 0, 1, NULL),
('airport', 153, 'comment', 'parent_member', 0, 1, NULL),
('airport', 153, 'comment', 'registered', 0, 1, NULL),
('airport', 153, 'view', 'everyone', 0, 1, NULL),
('airport', 153, 'view', 'member', 0, 1, NULL),
('airport', 153, 'view', 'parent_member', 0, 1, NULL),
('airport', 153, 'view', 'registered', 0, 1, NULL),
('airport', 154, 'comment', 'everyone', 0, 1, NULL),
('airport', 154, 'comment', 'member', 0, 1, NULL),
('airport', 154, 'comment', 'parent_member', 0, 1, NULL),
('airport', 154, 'comment', 'registered', 0, 1, NULL),
('airport', 154, 'view', 'everyone', 0, 1, NULL),
('airport', 154, 'view', 'member', 0, 1, NULL),
('airport', 154, 'view', 'parent_member', 0, 1, NULL),
('airport', 154, 'view', 'registered', 0, 1, NULL),
('airport', 155, 'comment', 'everyone', 0, 1, NULL),
('airport', 155, 'comment', 'member', 0, 1, NULL),
('airport', 155, 'comment', 'parent_member', 0, 1, NULL),
('airport', 155, 'comment', 'registered', 0, 1, NULL),
('airport', 155, 'view', 'everyone', 0, 1, NULL),
('airport', 155, 'view', 'member', 0, 1, NULL),
('airport', 155, 'view', 'parent_member', 0, 1, NULL),
('airport', 155, 'view', 'registered', 0, 1, NULL),
('airport', 156, 'comment', 'everyone', 0, 1, NULL),
('airport', 156, 'comment', 'member', 0, 1, NULL),
('airport', 156, 'comment', 'parent_member', 0, 1, NULL),
('airport', 156, 'comment', 'registered', 0, 1, NULL),
('airport', 156, 'view', 'everyone', 0, 1, NULL),
('airport', 156, 'view', 'member', 0, 1, NULL),
('airport', 156, 'view', 'parent_member', 0, 1, NULL),
('airport', 156, 'view', 'registered', 0, 1, NULL),
('airport', 157, 'comment', 'everyone', 0, 1, NULL),
('airport', 157, 'comment', 'member', 0, 1, NULL),
('airport', 157, 'comment', 'parent_member', 0, 1, NULL),
('airport', 157, 'comment', 'registered', 0, 1, NULL),
('airport', 157, 'view', 'everyone', 0, 1, NULL),
('airport', 157, 'view', 'member', 0, 1, NULL),
('airport', 157, 'view', 'parent_member', 0, 1, NULL),
('airport', 157, 'view', 'registered', 0, 1, NULL),
('airport', 158, 'comment', 'everyone', 0, 1, NULL),
('airport', 158, 'comment', 'member', 0, 1, NULL),
('airport', 158, 'comment', 'parent_member', 0, 1, NULL),
('airport', 158, 'comment', 'registered', 0, 1, NULL),
('airport', 158, 'view', 'everyone', 0, 1, NULL),
('airport', 158, 'view', 'member', 0, 1, NULL),
('airport', 158, 'view', 'parent_member', 0, 1, NULL),
('airport', 158, 'view', 'registered', 0, 1, NULL),
('airport', 159, 'comment', 'everyone', 0, 1, NULL),
('airport', 159, 'comment', 'member', 0, 1, NULL),
('airport', 159, 'comment', 'parent_member', 0, 1, NULL),
('airport', 159, 'comment', 'registered', 0, 1, NULL),
('airport', 159, 'view', 'everyone', 0, 1, NULL),
('airport', 159, 'view', 'member', 0, 1, NULL),
('airport', 159, 'view', 'parent_member', 0, 1, NULL),
('airport', 159, 'view', 'registered', 0, 1, NULL),
('airport', 160, 'comment', 'everyone', 0, 1, NULL),
('airport', 160, 'comment', 'member', 0, 1, NULL),
('airport', 160, 'comment', 'parent_member', 0, 1, NULL),
('airport', 160, 'comment', 'registered', 0, 1, NULL),
('airport', 160, 'view', 'everyone', 0, 1, NULL),
('airport', 160, 'view', 'member', 0, 1, NULL),
('airport', 160, 'view', 'parent_member', 0, 1, NULL),
('airport', 160, 'view', 'registered', 0, 1, NULL),
('airport', 161, 'comment', 'everyone', 0, 1, NULL),
('airport', 161, 'comment', 'member', 0, 1, NULL),
('airport', 161, 'comment', 'parent_member', 0, 1, NULL),
('airport', 161, 'comment', 'registered', 0, 1, NULL),
('airport', 161, 'view', 'everyone', 0, 1, NULL),
('airport', 161, 'view', 'member', 0, 1, NULL),
('airport', 161, 'view', 'parent_member', 0, 1, NULL),
('airport', 161, 'view', 'registered', 0, 1, NULL),
('airport', 162, 'comment', 'everyone', 0, 1, NULL),
('airport', 162, 'comment', 'member', 0, 1, NULL),
('airport', 162, 'comment', 'parent_member', 0, 1, NULL),
('airport', 162, 'comment', 'registered', 0, 1, NULL),
('airport', 162, 'view', 'everyone', 0, 1, NULL),
('airport', 162, 'view', 'member', 0, 1, NULL),
('airport', 162, 'view', 'parent_member', 0, 1, NULL),
('airport', 162, 'view', 'registered', 0, 1, NULL),
('airport', 163, 'comment', 'everyone', 0, 1, NULL),
('airport', 163, 'comment', 'member', 0, 1, NULL),
('airport', 163, 'comment', 'parent_member', 0, 1, NULL),
('airport', 163, 'comment', 'registered', 0, 1, NULL),
('airport', 163, 'view', 'everyone', 0, 1, NULL),
('airport', 163, 'view', 'member', 0, 1, NULL),
('airport', 163, 'view', 'parent_member', 0, 1, NULL),
('airport', 163, 'view', 'registered', 0, 1, NULL),
('airport', 164, 'comment', 'everyone', 0, 1, NULL),
('airport', 164, 'comment', 'member', 0, 1, NULL),
('airport', 164, 'comment', 'parent_member', 0, 1, NULL),
('airport', 164, 'comment', 'registered', 0, 1, NULL),
('airport', 164, 'view', 'everyone', 0, 1, NULL),
('airport', 164, 'view', 'member', 0, 1, NULL),
('airport', 164, 'view', 'parent_member', 0, 1, NULL),
('airport', 164, 'view', 'registered', 0, 1, NULL),
('airport', 165, 'comment', 'everyone', 0, 1, NULL),
('airport', 165, 'comment', 'member', 0, 1, NULL),
('airport', 165, 'comment', 'parent_member', 0, 1, NULL),
('airport', 165, 'comment', 'registered', 0, 1, NULL),
('airport', 165, 'view', 'everyone', 0, 1, NULL),
('airport', 165, 'view', 'member', 0, 1, NULL),
('airport', 165, 'view', 'parent_member', 0, 1, NULL),
('airport', 165, 'view', 'registered', 0, 1, NULL),
('airport', 166, 'comment', 'everyone', 0, 1, NULL),
('airport', 166, 'comment', 'member', 0, 1, NULL),
('airport', 166, 'comment', 'parent_member', 0, 1, NULL),
('airport', 166, 'comment', 'registered', 0, 1, NULL),
('airport', 166, 'view', 'everyone', 0, 1, NULL),
('airport', 166, 'view', 'member', 0, 1, NULL),
('airport', 166, 'view', 'parent_member', 0, 1, NULL),
('airport', 166, 'view', 'registered', 0, 1, NULL),
('airport', 167, 'comment', 'everyone', 0, 1, NULL),
('airport', 167, 'comment', 'member', 0, 1, NULL),
('airport', 167, 'comment', 'parent_member', 0, 1, NULL),
('airport', 167, 'comment', 'registered', 0, 1, NULL),
('airport', 167, 'view', 'everyone', 0, 1, NULL),
('airport', 167, 'view', 'member', 0, 1, NULL),
('airport', 167, 'view', 'parent_member', 0, 1, NULL),
('airport', 167, 'view', 'registered', 0, 1, NULL),
('airport', 168, 'comment', 'everyone', 0, 1, NULL),
('airport', 168, 'comment', 'member', 0, 1, NULL),
('airport', 168, 'comment', 'parent_member', 0, 1, NULL),
('airport', 168, 'comment', 'registered', 0, 1, NULL),
('airport', 168, 'view', 'everyone', 0, 1, NULL),
('airport', 168, 'view', 'member', 0, 1, NULL),
('airport', 168, 'view', 'parent_member', 0, 1, NULL),
('airport', 168, 'view', 'registered', 0, 1, NULL),
('airport', 169, 'comment', 'everyone', 0, 1, NULL),
('airport', 169, 'comment', 'member', 0, 1, NULL),
('airport', 169, 'comment', 'parent_member', 0, 1, NULL),
('airport', 169, 'comment', 'registered', 0, 1, NULL),
('airport', 169, 'view', 'everyone', 0, 1, NULL),
('airport', 169, 'view', 'member', 0, 1, NULL),
('airport', 169, 'view', 'parent_member', 0, 1, NULL),
('airport', 169, 'view', 'registered', 0, 1, NULL),
('airport', 170, 'comment', 'everyone', 0, 1, NULL),
('airport', 170, 'comment', 'member', 0, 1, NULL),
('airport', 170, 'comment', 'parent_member', 0, 1, NULL),
('airport', 170, 'comment', 'registered', 0, 1, NULL),
('airport', 170, 'view', 'everyone', 0, 1, NULL),
('airport', 170, 'view', 'member', 0, 1, NULL),
('airport', 170, 'view', 'parent_member', 0, 1, NULL),
('airport', 170, 'view', 'registered', 0, 1, NULL),
('airport', 171, 'comment', 'everyone', 0, 1, NULL),
('airport', 171, 'comment', 'member', 0, 1, NULL),
('airport', 171, 'comment', 'parent_member', 0, 1, NULL),
('airport', 171, 'comment', 'registered', 0, 1, NULL),
('airport', 171, 'view', 'everyone', 0, 1, NULL),
('airport', 171, 'view', 'member', 0, 1, NULL),
('airport', 171, 'view', 'parent_member', 0, 1, NULL),
('airport', 171, 'view', 'registered', 0, 1, NULL),
('airport', 172, 'comment', 'everyone', 0, 1, NULL),
('airport', 172, 'comment', 'member', 0, 1, NULL),
('airport', 172, 'comment', 'parent_member', 0, 1, NULL),
('airport', 172, 'comment', 'registered', 0, 1, NULL),
('airport', 172, 'view', 'everyone', 0, 1, NULL),
('airport', 172, 'view', 'member', 0, 1, NULL),
('airport', 172, 'view', 'parent_member', 0, 1, NULL),
('airport', 172, 'view', 'registered', 0, 1, NULL),
('airport', 173, 'comment', 'everyone', 0, 1, NULL),
('airport', 173, 'comment', 'member', 0, 1, NULL),
('airport', 173, 'comment', 'parent_member', 0, 1, NULL),
('airport', 173, 'comment', 'registered', 0, 1, NULL),
('airport', 173, 'view', 'everyone', 0, 1, NULL),
('airport', 173, 'view', 'member', 0, 1, NULL),
('airport', 173, 'view', 'parent_member', 0, 1, NULL),
('airport', 173, 'view', 'registered', 0, 1, NULL),
('airport', 174, 'comment', 'everyone', 0, 1, NULL),
('airport', 174, 'comment', 'member', 0, 1, NULL),
('airport', 174, 'comment', 'parent_member', 0, 1, NULL),
('airport', 174, 'comment', 'registered', 0, 1, NULL),
('airport', 174, 'view', 'everyone', 0, 1, NULL),
('airport', 174, 'view', 'member', 0, 1, NULL),
('airport', 174, 'view', 'parent_member', 0, 1, NULL),
('airport', 174, 'view', 'registered', 0, 1, NULL),
('airport', 175, 'comment', 'everyone', 0, 1, NULL),
('airport', 175, 'comment', 'member', 0, 1, NULL),
('airport', 175, 'comment', 'parent_member', 0, 1, NULL),
('airport', 175, 'comment', 'registered', 0, 1, NULL),
('airport', 175, 'view', 'everyone', 0, 1, NULL),
('airport', 175, 'view', 'member', 0, 1, NULL),
('airport', 175, 'view', 'parent_member', 0, 1, NULL),
('airport', 175, 'view', 'registered', 0, 1, NULL),
('airport', 176, 'comment', 'everyone', 0, 1, NULL),
('airport', 176, 'comment', 'member', 0, 1, NULL),
('airport', 176, 'comment', 'parent_member', 0, 1, NULL),
('airport', 176, 'comment', 'registered', 0, 1, NULL),
('airport', 176, 'view', 'everyone', 0, 1, NULL),
('airport', 176, 'view', 'member', 0, 1, NULL),
('airport', 176, 'view', 'parent_member', 0, 1, NULL),
('airport', 176, 'view', 'registered', 0, 1, NULL),
('airport', 177, 'comment', 'everyone', 0, 1, NULL),
('airport', 177, 'comment', 'member', 0, 1, NULL),
('airport', 177, 'comment', 'parent_member', 0, 1, NULL),
('airport', 177, 'comment', 'registered', 0, 1, NULL),
('airport', 177, 'view', 'everyone', 0, 1, NULL),
('airport', 177, 'view', 'member', 0, 1, NULL),
('airport', 177, 'view', 'parent_member', 0, 1, NULL),
('airport', 177, 'view', 'registered', 0, 1, NULL),
('airport', 178, 'comment', 'everyone', 0, 1, NULL),
('airport', 178, 'comment', 'member', 0, 1, NULL),
('airport', 178, 'comment', 'parent_member', 0, 1, NULL),
('airport', 178, 'comment', 'registered', 0, 1, NULL),
('airport', 178, 'view', 'everyone', 0, 1, NULL),
('airport', 178, 'view', 'member', 0, 1, NULL),
('airport', 178, 'view', 'parent_member', 0, 1, NULL),
('airport', 178, 'view', 'registered', 0, 1, NULL),
('airport', 179, 'comment', 'everyone', 0, 1, NULL),
('airport', 179, 'comment', 'member', 0, 1, NULL),
('airport', 179, 'comment', 'parent_member', 0, 1, NULL),
('airport', 179, 'comment', 'registered', 0, 1, NULL),
('airport', 179, 'view', 'everyone', 0, 1, NULL),
('airport', 179, 'view', 'member', 0, 1, NULL),
('airport', 179, 'view', 'parent_member', 0, 1, NULL),
('airport', 179, 'view', 'registered', 0, 1, NULL),
('airport', 180, 'comment', 'everyone', 0, 1, NULL),
('airport', 180, 'comment', 'member', 0, 1, NULL),
('airport', 180, 'comment', 'parent_member', 0, 1, NULL),
('airport', 180, 'comment', 'registered', 0, 1, NULL),
('airport', 180, 'view', 'everyone', 0, 1, NULL),
('airport', 180, 'view', 'member', 0, 1, NULL),
('airport', 180, 'view', 'parent_member', 0, 1, NULL),
('airport', 180, 'view', 'registered', 0, 1, NULL),
('airport', 181, 'comment', 'everyone', 0, 1, NULL),
('airport', 181, 'comment', 'member', 0, 1, NULL),
('airport', 181, 'comment', 'parent_member', 0, 1, NULL),
('airport', 181, 'comment', 'registered', 0, 1, NULL),
('airport', 181, 'view', 'everyone', 0, 1, NULL),
('airport', 181, 'view', 'member', 0, 1, NULL),
('airport', 181, 'view', 'parent_member', 0, 1, NULL),
('airport', 181, 'view', 'registered', 0, 1, NULL),
('airport', 182, 'comment', 'everyone', 0, 1, NULL),
('airport', 182, 'comment', 'member', 0, 1, NULL),
('airport', 182, 'comment', 'parent_member', 0, 1, NULL),
('airport', 182, 'comment', 'registered', 0, 1, NULL),
('airport', 182, 'view', 'everyone', 0, 1, NULL),
('airport', 182, 'view', 'member', 0, 1, NULL),
('airport', 182, 'view', 'parent_member', 0, 1, NULL),
('airport', 182, 'view', 'registered', 0, 1, NULL),
('airport', 183, 'comment', 'everyone', 0, 1, NULL),
('airport', 183, 'comment', 'member', 0, 1, NULL),
('airport', 183, 'comment', 'parent_member', 0, 1, NULL),
('airport', 183, 'comment', 'registered', 0, 1, NULL),
('airport', 183, 'view', 'everyone', 0, 1, NULL),
('airport', 183, 'view', 'member', 0, 1, NULL),
('airport', 183, 'view', 'parent_member', 0, 1, NULL),
('airport', 183, 'view', 'registered', 0, 1, NULL),
('airport', 184, 'comment', 'everyone', 0, 1, NULL),
('airport', 184, 'comment', 'member', 0, 1, NULL),
('airport', 184, 'comment', 'parent_member', 0, 1, NULL),
('airport', 184, 'comment', 'registered', 0, 1, NULL),
('airport', 184, 'view', 'everyone', 0, 1, NULL),
('airport', 184, 'view', 'member', 0, 1, NULL),
('airport', 184, 'view', 'parent_member', 0, 1, NULL),
('airport', 184, 'view', 'registered', 0, 1, NULL),
('airport', 185, 'comment', 'everyone', 0, 1, NULL),
('airport', 185, 'comment', 'member', 0, 1, NULL),
('airport', 185, 'comment', 'parent_member', 0, 1, NULL),
('airport', 185, 'comment', 'registered', 0, 1, NULL),
('airport', 185, 'view', 'everyone', 0, 1, NULL),
('airport', 185, 'view', 'member', 0, 1, NULL),
('airport', 185, 'view', 'parent_member', 0, 1, NULL),
('airport', 185, 'view', 'registered', 0, 1, NULL),
('airport', 186, 'comment', 'everyone', 0, 1, NULL),
('airport', 186, 'comment', 'member', 0, 1, NULL),
('airport', 186, 'comment', 'parent_member', 0, 1, NULL),
('airport', 186, 'comment', 'registered', 0, 1, NULL),
('airport', 186, 'view', 'everyone', 0, 1, NULL),
('airport', 186, 'view', 'member', 0, 1, NULL),
('airport', 186, 'view', 'parent_member', 0, 1, NULL),
('airport', 186, 'view', 'registered', 0, 1, NULL),
('airport', 187, 'comment', 'everyone', 0, 1, NULL),
('airport', 187, 'comment', 'member', 0, 1, NULL),
('airport', 187, 'comment', 'parent_member', 0, 1, NULL),
('airport', 187, 'comment', 'registered', 0, 1, NULL),
('airport', 187, 'view', 'everyone', 0, 1, NULL),
('airport', 187, 'view', 'member', 0, 1, NULL),
('airport', 187, 'view', 'parent_member', 0, 1, NULL),
('airport', 187, 'view', 'registered', 0, 1, NULL),
('airport', 188, 'comment', 'everyone', 0, 1, NULL),
('airport', 188, 'comment', 'member', 0, 1, NULL),
('airport', 188, 'comment', 'parent_member', 0, 1, NULL),
('airport', 188, 'comment', 'registered', 0, 1, NULL),
('airport', 188, 'view', 'everyone', 0, 1, NULL),
('airport', 188, 'view', 'member', 0, 1, NULL),
('airport', 188, 'view', 'parent_member', 0, 1, NULL),
('airport', 188, 'view', 'registered', 0, 1, NULL),
('airport', 189, 'comment', 'everyone', 0, 1, NULL),
('airport', 189, 'comment', 'member', 0, 1, NULL),
('airport', 189, 'comment', 'parent_member', 0, 1, NULL),
('airport', 189, 'comment', 'registered', 0, 1, NULL),
('airport', 189, 'view', 'everyone', 0, 1, NULL),
('airport', 189, 'view', 'member', 0, 1, NULL),
('airport', 189, 'view', 'parent_member', 0, 1, NULL),
('airport', 189, 'view', 'registered', 0, 1, NULL),
('airport', 190, 'comment', 'everyone', 0, 1, NULL),
('airport', 190, 'comment', 'member', 0, 1, NULL),
('airport', 190, 'comment', 'parent_member', 0, 1, NULL),
('airport', 190, 'comment', 'registered', 0, 1, NULL),
('airport', 190, 'view', 'everyone', 0, 1, NULL),
('airport', 190, 'view', 'member', 0, 1, NULL),
('airport', 190, 'view', 'parent_member', 0, 1, NULL),
('airport', 190, 'view', 'registered', 0, 1, NULL),
('airport', 191, 'comment', 'everyone', 0, 1, NULL),
('airport', 191, 'comment', 'member', 0, 1, NULL),
('airport', 191, 'comment', 'parent_member', 0, 1, NULL),
('airport', 191, 'comment', 'registered', 0, 1, NULL),
('airport', 191, 'view', 'everyone', 0, 1, NULL),
('airport', 191, 'view', 'member', 0, 1, NULL),
('airport', 191, 'view', 'parent_member', 0, 1, NULL),
('airport', 191, 'view', 'registered', 0, 1, NULL),
('airport', 192, 'comment', 'everyone', 0, 1, NULL),
('airport', 192, 'comment', 'member', 0, 1, NULL),
('airport', 192, 'comment', 'parent_member', 0, 1, NULL),
('airport', 192, 'comment', 'registered', 0, 1, NULL),
('airport', 192, 'view', 'everyone', 0, 1, NULL),
('airport', 192, 'view', 'member', 0, 1, NULL),
('airport', 192, 'view', 'parent_member', 0, 1, NULL),
('airport', 192, 'view', 'registered', 0, 1, NULL),
('airport', 193, 'comment', 'everyone', 0, 1, NULL),
('airport', 193, 'comment', 'member', 0, 1, NULL),
('airport', 193, 'comment', 'parent_member', 0, 1, NULL),
('airport', 193, 'comment', 'registered', 0, 1, NULL),
('airport', 193, 'view', 'everyone', 0, 1, NULL),
('airport', 193, 'view', 'member', 0, 1, NULL),
('airport', 193, 'view', 'parent_member', 0, 1, NULL),
('airport', 193, 'view', 'registered', 0, 1, NULL),
('airport', 194, 'comment', 'everyone', 0, 1, NULL),
('airport', 194, 'comment', 'member', 0, 1, NULL),
('airport', 194, 'comment', 'parent_member', 0, 1, NULL),
('airport', 194, 'comment', 'registered', 0, 1, NULL),
('airport', 194, 'view', 'everyone', 0, 1, NULL),
('airport', 194, 'view', 'member', 0, 1, NULL),
('airport', 194, 'view', 'parent_member', 0, 1, NULL),
('airport', 194, 'view', 'registered', 0, 1, NULL),
('airport', 195, 'comment', 'everyone', 0, 1, NULL),
('airport', 195, 'comment', 'member', 0, 1, NULL),
('airport', 195, 'comment', 'parent_member', 0, 1, NULL),
('airport', 195, 'comment', 'registered', 0, 1, NULL),
('airport', 195, 'view', 'everyone', 0, 1, NULL),
('airport', 195, 'view', 'member', 0, 1, NULL),
('airport', 195, 'view', 'parent_member', 0, 1, NULL),
('airport', 195, 'view', 'registered', 0, 1, NULL),
('airport', 196, 'comment', 'everyone', 0, 1, NULL),
('airport', 196, 'comment', 'member', 0, 1, NULL),
('airport', 196, 'comment', 'parent_member', 0, 1, NULL),
('airport', 196, 'comment', 'registered', 0, 1, NULL),
('airport', 196, 'view', 'everyone', 0, 1, NULL),
('airport', 196, 'view', 'member', 0, 1, NULL),
('airport', 196, 'view', 'parent_member', 0, 1, NULL),
('airport', 196, 'view', 'registered', 0, 1, NULL),
('airport', 197, 'comment', 'everyone', 0, 1, NULL),
('airport', 197, 'comment', 'member', 0, 1, NULL),
('airport', 197, 'comment', 'parent_member', 0, 1, NULL),
('airport', 197, 'comment', 'registered', 0, 1, NULL),
('airport', 197, 'view', 'everyone', 0, 1, NULL),
('airport', 197, 'view', 'member', 0, 1, NULL),
('airport', 197, 'view', 'parent_member', 0, 1, NULL),
('airport', 197, 'view', 'registered', 0, 1, NULL),
('airport', 198, 'comment', 'everyone', 0, 1, NULL),
('airport', 198, 'comment', 'member', 0, 1, NULL),
('airport', 198, 'comment', 'parent_member', 0, 1, NULL),
('airport', 198, 'comment', 'registered', 0, 1, NULL),
('airport', 198, 'view', 'everyone', 0, 1, NULL),
('airport', 198, 'view', 'member', 0, 1, NULL),
('airport', 198, 'view', 'parent_member', 0, 1, NULL),
('airport', 198, 'view', 'registered', 0, 1, NULL),
('airport', 199, 'comment', 'everyone', 0, 1, NULL),
('airport', 199, 'comment', 'member', 0, 1, NULL),
('airport', 199, 'comment', 'parent_member', 0, 1, NULL),
('airport', 199, 'comment', 'registered', 0, 1, NULL),
('airport', 199, 'view', 'everyone', 0, 1, NULL),
('airport', 199, 'view', 'member', 0, 1, NULL),
('airport', 199, 'view', 'parent_member', 0, 1, NULL),
('airport', 199, 'view', 'registered', 0, 1, NULL),
('airport', 200, 'comment', 'everyone', 0, 1, NULL),
('airport', 200, 'comment', 'member', 0, 1, NULL),
('airport', 200, 'comment', 'parent_member', 0, 1, NULL),
('airport', 200, 'comment', 'registered', 0, 1, NULL),
('airport', 200, 'view', 'everyone', 0, 1, NULL),
('airport', 200, 'view', 'member', 0, 1, NULL),
('airport', 200, 'view', 'parent_member', 0, 1, NULL),
('airport', 200, 'view', 'registered', 0, 1, NULL),
('airport', 201, 'comment', 'everyone', 0, 1, NULL),
('airport', 201, 'comment', 'member', 0, 1, NULL),
('airport', 201, 'comment', 'parent_member', 0, 1, NULL),
('airport', 201, 'comment', 'registered', 0, 1, NULL),
('airport', 201, 'view', 'everyone', 0, 1, NULL),
('airport', 201, 'view', 'member', 0, 1, NULL),
('airport', 201, 'view', 'parent_member', 0, 1, NULL),
('airport', 201, 'view', 'registered', 0, 1, NULL),
('airport', 202, 'comment', 'everyone', 0, 1, NULL),
('airport', 202, 'comment', 'member', 0, 1, NULL),
('airport', 202, 'comment', 'parent_member', 0, 1, NULL),
('airport', 202, 'comment', 'registered', 0, 1, NULL),
('airport', 202, 'view', 'everyone', 0, 1, NULL),
('airport', 202, 'view', 'member', 0, 1, NULL),
('airport', 202, 'view', 'parent_member', 0, 1, NULL),
('airport', 202, 'view', 'registered', 0, 1, NULL),
('airport', 203, 'comment', 'everyone', 0, 1, NULL),
('airport', 203, 'comment', 'member', 0, 1, NULL),
('airport', 203, 'comment', 'parent_member', 0, 1, NULL),
('airport', 203, 'comment', 'registered', 0, 1, NULL),
('airport', 203, 'view', 'everyone', 0, 1, NULL),
('airport', 203, 'view', 'member', 0, 1, NULL),
('airport', 203, 'view', 'parent_member', 0, 1, NULL),
('airport', 203, 'view', 'registered', 0, 1, NULL),
('airport', 204, 'comment', 'everyone', 0, 1, NULL),
('airport', 204, 'comment', 'member', 0, 1, NULL),
('airport', 204, 'comment', 'parent_member', 0, 1, NULL),
('airport', 204, 'comment', 'registered', 0, 1, NULL),
('airport', 204, 'view', 'everyone', 0, 1, NULL),
('airport', 204, 'view', 'member', 0, 1, NULL),
('airport', 204, 'view', 'parent_member', 0, 1, NULL),
('airport', 204, 'view', 'registered', 0, 1, NULL),
('airport', 205, 'comment', 'everyone', 0, 1, NULL),
('airport', 205, 'comment', 'member', 0, 1, NULL),
('airport', 205, 'comment', 'parent_member', 0, 1, NULL),
('airport', 205, 'comment', 'registered', 0, 1, NULL),
('airport', 205, 'view', 'everyone', 0, 1, NULL),
('airport', 205, 'view', 'member', 0, 1, NULL),
('airport', 205, 'view', 'parent_member', 0, 1, NULL),
('airport', 205, 'view', 'registered', 0, 1, NULL),
('airport', 206, 'comment', 'everyone', 0, 1, NULL),
('airport', 206, 'comment', 'member', 0, 1, NULL),
('airport', 206, 'comment', 'parent_member', 0, 1, NULL),
('airport', 206, 'comment', 'registered', 0, 1, NULL),
('airport', 206, 'view', 'everyone', 0, 1, NULL),
('airport', 206, 'view', 'member', 0, 1, NULL),
('airport', 206, 'view', 'parent_member', 0, 1, NULL),
('airport', 206, 'view', 'registered', 0, 1, NULL),
('airport', 207, 'comment', 'everyone', 0, 1, NULL),
('airport', 207, 'comment', 'member', 0, 1, NULL),
('airport', 207, 'comment', 'parent_member', 0, 1, NULL),
('airport', 207, 'comment', 'registered', 0, 1, NULL),
('airport', 207, 'view', 'everyone', 0, 1, NULL),
('airport', 207, 'view', 'member', 0, 1, NULL),
('airport', 207, 'view', 'parent_member', 0, 1, NULL),
('airport', 207, 'view', 'registered', 0, 1, NULL),
('airport', 208, 'comment', 'everyone', 0, 1, NULL),
('airport', 208, 'comment', 'member', 0, 1, NULL),
('airport', 208, 'comment', 'parent_member', 0, 1, NULL),
('airport', 208, 'comment', 'registered', 0, 1, NULL),
('airport', 208, 'view', 'everyone', 0, 1, NULL),
('airport', 208, 'view', 'member', 0, 1, NULL),
('airport', 208, 'view', 'parent_member', 0, 1, NULL),
('airport', 208, 'view', 'registered', 0, 1, NULL),
('airport', 209, 'comment', 'everyone', 0, 1, NULL),
('airport', 209, 'comment', 'member', 0, 1, NULL),
('airport', 209, 'comment', 'parent_member', 0, 1, NULL),
('airport', 209, 'comment', 'registered', 0, 1, NULL),
('airport', 209, 'view', 'everyone', 0, 1, NULL),
('airport', 209, 'view', 'member', 0, 1, NULL),
('airport', 209, 'view', 'parent_member', 0, 1, NULL),
('airport', 209, 'view', 'registered', 0, 1, NULL),
('airport', 210, 'comment', 'everyone', 0, 1, NULL),
('airport', 210, 'comment', 'member', 0, 1, NULL),
('airport', 210, 'comment', 'parent_member', 0, 1, NULL),
('airport', 210, 'comment', 'registered', 0, 1, NULL),
('airport', 210, 'view', 'everyone', 0, 1, NULL),
('airport', 210, 'view', 'member', 0, 1, NULL),
('airport', 210, 'view', 'parent_member', 0, 1, NULL),
('airport', 210, 'view', 'registered', 0, 1, NULL),
('airport', 211, 'comment', 'everyone', 0, 1, NULL),
('airport', 211, 'comment', 'member', 0, 1, NULL),
('airport', 211, 'comment', 'parent_member', 0, 1, NULL),
('airport', 211, 'comment', 'registered', 0, 1, NULL),
('airport', 211, 'view', 'everyone', 0, 1, NULL),
('airport', 211, 'view', 'member', 0, 1, NULL),
('airport', 211, 'view', 'parent_member', 0, 1, NULL),
('airport', 211, 'view', 'registered', 0, 1, NULL),
('airport', 212, 'comment', 'everyone', 0, 1, NULL),
('airport', 212, 'comment', 'member', 0, 1, NULL),
('airport', 212, 'comment', 'parent_member', 0, 1, NULL),
('airport', 212, 'comment', 'registered', 0, 1, NULL),
('airport', 212, 'view', 'everyone', 0, 1, NULL),
('airport', 212, 'view', 'member', 0, 1, NULL),
('airport', 212, 'view', 'parent_member', 0, 1, NULL),
('airport', 212, 'view', 'registered', 0, 1, NULL),
('airport', 213, 'comment', 'everyone', 0, 1, NULL),
('airport', 213, 'comment', 'member', 0, 1, NULL),
('airport', 213, 'comment', 'parent_member', 0, 1, NULL),
('airport', 213, 'comment', 'registered', 0, 1, NULL),
('airport', 213, 'view', 'everyone', 0, 1, NULL),
('airport', 213, 'view', 'member', 0, 1, NULL),
('airport', 213, 'view', 'parent_member', 0, 1, NULL),
('airport', 213, 'view', 'registered', 0, 1, NULL),
('airport', 214, 'comment', 'everyone', 0, 1, NULL),
('airport', 214, 'comment', 'member', 0, 1, NULL),
('airport', 214, 'comment', 'parent_member', 0, 1, NULL),
('airport', 214, 'comment', 'registered', 0, 1, NULL),
('airport', 214, 'view', 'everyone', 0, 1, NULL),
('airport', 214, 'view', 'member', 0, 1, NULL),
('airport', 214, 'view', 'parent_member', 0, 1, NULL),
('airport', 214, 'view', 'registered', 0, 1, NULL),
('airport', 215, 'comment', 'everyone', 0, 1, NULL),
('airport', 215, 'comment', 'member', 0, 1, NULL),
('airport', 215, 'comment', 'parent_member', 0, 1, NULL),
('airport', 215, 'comment', 'registered', 0, 1, NULL),
('airport', 215, 'view', 'everyone', 0, 1, NULL),
('airport', 215, 'view', 'member', 0, 1, NULL),
('airport', 215, 'view', 'parent_member', 0, 1, NULL),
('airport', 215, 'view', 'registered', 0, 1, NULL),
('airport', 216, 'comment', 'everyone', 0, 1, NULL),
('airport', 216, 'comment', 'member', 0, 1, NULL),
('airport', 216, 'comment', 'parent_member', 0, 1, NULL),
('airport', 216, 'comment', 'registered', 0, 1, NULL),
('airport', 216, 'view', 'everyone', 0, 1, NULL),
('airport', 216, 'view', 'member', 0, 1, NULL),
('airport', 216, 'view', 'parent_member', 0, 1, NULL),
('airport', 216, 'view', 'registered', 0, 1, NULL),
('airport', 217, 'comment', 'everyone', 0, 1, NULL),
('airport', 217, 'comment', 'member', 0, 1, NULL),
('airport', 217, 'comment', 'parent_member', 0, 1, NULL),
('airport', 217, 'comment', 'registered', 0, 1, NULL),
('airport', 217, 'view', 'everyone', 0, 1, NULL),
('airport', 217, 'view', 'member', 0, 1, NULL),
('airport', 217, 'view', 'parent_member', 0, 1, NULL),
('airport', 217, 'view', 'registered', 0, 1, NULL),
('airport', 218, 'comment', 'everyone', 0, 1, NULL),
('airport', 218, 'comment', 'member', 0, 1, NULL),
('airport', 218, 'comment', 'parent_member', 0, 1, NULL),
('airport', 218, 'comment', 'registered', 0, 1, NULL),
('airport', 218, 'view', 'everyone', 0, 1, NULL),
('airport', 218, 'view', 'member', 0, 1, NULL),
('airport', 218, 'view', 'parent_member', 0, 1, NULL),
('airport', 218, 'view', 'registered', 0, 1, NULL),
('airport', 219, 'comment', 'everyone', 0, 1, NULL),
('airport', 219, 'comment', 'member', 0, 1, NULL),
('airport', 219, 'comment', 'parent_member', 0, 1, NULL),
('airport', 219, 'comment', 'registered', 0, 1, NULL),
('airport', 219, 'view', 'everyone', 0, 1, NULL),
('airport', 219, 'view', 'member', 0, 1, NULL),
('airport', 219, 'view', 'parent_member', 0, 1, NULL),
('airport', 219, 'view', 'registered', 0, 1, NULL),
('airport', 220, 'comment', 'everyone', 0, 1, NULL),
('airport', 220, 'comment', 'member', 0, 1, NULL),
('airport', 220, 'comment', 'parent_member', 0, 1, NULL),
('airport', 220, 'comment', 'registered', 0, 1, NULL),
('airport', 220, 'view', 'everyone', 0, 1, NULL),
('airport', 220, 'view', 'member', 0, 1, NULL),
('airport', 220, 'view', 'parent_member', 0, 1, NULL),
('airport', 220, 'view', 'registered', 0, 1, NULL),
('airport', 221, 'comment', 'everyone', 0, 1, NULL),
('airport', 221, 'comment', 'member', 0, 1, NULL),
('airport', 221, 'comment', 'parent_member', 0, 1, NULL),
('airport', 221, 'comment', 'registered', 0, 1, NULL),
('airport', 221, 'view', 'everyone', 0, 1, NULL),
('airport', 221, 'view', 'member', 0, 1, NULL),
('airport', 221, 'view', 'parent_member', 0, 1, NULL),
('airport', 221, 'view', 'registered', 0, 1, NULL),
('airport', 222, 'comment', 'everyone', 0, 1, NULL),
('airport', 222, 'comment', 'member', 0, 1, NULL),
('airport', 222, 'comment', 'parent_member', 0, 1, NULL),
('airport', 222, 'comment', 'registered', 0, 1, NULL),
('airport', 222, 'view', 'everyone', 0, 1, NULL),
('airport', 222, 'view', 'member', 0, 1, NULL),
('airport', 222, 'view', 'parent_member', 0, 1, NULL),
('airport', 222, 'view', 'registered', 0, 1, NULL),
('airport', 223, 'comment', 'everyone', 0, 1, NULL),
('airport', 223, 'comment', 'member', 0, 1, NULL),
('airport', 223, 'comment', 'parent_member', 0, 1, NULL),
('airport', 223, 'comment', 'registered', 0, 1, NULL),
('airport', 223, 'view', 'everyone', 0, 1, NULL),
('airport', 223, 'view', 'member', 0, 1, NULL),
('airport', 223, 'view', 'parent_member', 0, 1, NULL),
('airport', 223, 'view', 'registered', 0, 1, NULL),
('airport', 224, 'comment', 'everyone', 0, 1, NULL),
('airport', 224, 'comment', 'member', 0, 1, NULL),
('airport', 224, 'comment', 'parent_member', 0, 1, NULL),
('airport', 224, 'comment', 'registered', 0, 1, NULL),
('airport', 224, 'view', 'everyone', 0, 1, NULL),
('airport', 224, 'view', 'member', 0, 1, NULL),
('airport', 224, 'view', 'parent_member', 0, 1, NULL),
('airport', 224, 'view', 'registered', 0, 1, NULL),
('airport', 225, 'comment', 'everyone', 0, 1, NULL),
('airport', 225, 'comment', 'member', 0, 1, NULL),
('airport', 225, 'comment', 'parent_member', 0, 1, NULL),
('airport', 225, 'comment', 'registered', 0, 1, NULL),
('airport', 225, 'view', 'everyone', 0, 1, NULL),
('airport', 225, 'view', 'member', 0, 1, NULL),
('airport', 225, 'view', 'parent_member', 0, 1, NULL),
('airport', 225, 'view', 'registered', 0, 1, NULL),
('airport', 226, 'comment', 'everyone', 0, 1, NULL),
('airport', 226, 'comment', 'member', 0, 1, NULL),
('airport', 226, 'comment', 'parent_member', 0, 1, NULL),
('airport', 226, 'comment', 'registered', 0, 1, NULL),
('airport', 226, 'view', 'everyone', 0, 1, NULL),
('airport', 226, 'view', 'member', 0, 1, NULL),
('airport', 226, 'view', 'parent_member', 0, 1, NULL),
('airport', 226, 'view', 'registered', 0, 1, NULL),
('airport', 227, 'comment', 'everyone', 0, 1, NULL),
('airport', 227, 'comment', 'member', 0, 1, NULL),
('airport', 227, 'comment', 'parent_member', 0, 1, NULL),
('airport', 227, 'comment', 'registered', 0, 1, NULL),
('airport', 227, 'view', 'everyone', 0, 1, NULL),
('airport', 227, 'view', 'member', 0, 1, NULL),
('airport', 227, 'view', 'parent_member', 0, 1, NULL),
('airport', 227, 'view', 'registered', 0, 1, NULL),
('airport', 228, 'comment', 'everyone', 0, 1, NULL),
('airport', 228, 'comment', 'member', 0, 1, NULL),
('airport', 228, 'comment', 'parent_member', 0, 1, NULL),
('airport', 228, 'comment', 'registered', 0, 1, NULL),
('airport', 228, 'view', 'everyone', 0, 1, NULL),
('airport', 228, 'view', 'member', 0, 1, NULL),
('airport', 228, 'view', 'parent_member', 0, 1, NULL),
('airport', 228, 'view', 'registered', 0, 1, NULL),
('airport', 229, 'comment', 'everyone', 0, 1, NULL),
('airport', 229, 'comment', 'member', 0, 1, NULL),
('airport', 229, 'comment', 'parent_member', 0, 1, NULL),
('airport', 229, 'comment', 'registered', 0, 1, NULL),
('airport', 229, 'view', 'everyone', 0, 1, NULL),
('airport', 229, 'view', 'member', 0, 1, NULL),
('airport', 229, 'view', 'parent_member', 0, 1, NULL),
('airport', 229, 'view', 'registered', 0, 1, NULL),
('airport', 230, 'comment', 'everyone', 0, 1, NULL),
('airport', 230, 'comment', 'member', 0, 1, NULL),
('airport', 230, 'comment', 'parent_member', 0, 1, NULL),
('airport', 230, 'comment', 'registered', 0, 1, NULL),
('airport', 230, 'view', 'everyone', 0, 1, NULL),
('airport', 230, 'view', 'member', 0, 1, NULL),
('airport', 230, 'view', 'parent_member', 0, 1, NULL),
('airport', 230, 'view', 'registered', 0, 1, NULL),
('airport', 231, 'comment', 'everyone', 0, 1, NULL),
('airport', 231, 'comment', 'member', 0, 1, NULL),
('airport', 231, 'comment', 'parent_member', 0, 1, NULL),
('airport', 231, 'comment', 'registered', 0, 1, NULL),
('airport', 231, 'view', 'everyone', 0, 1, NULL),
('airport', 231, 'view', 'member', 0, 1, NULL),
('airport', 231, 'view', 'parent_member', 0, 1, NULL),
('airport', 231, 'view', 'registered', 0, 1, NULL),
('airport', 232, 'comment', 'everyone', 0, 1, NULL),
('airport', 232, 'comment', 'member', 0, 1, NULL),
('airport', 232, 'comment', 'parent_member', 0, 1, NULL),
('airport', 232, 'comment', 'registered', 0, 1, NULL),
('airport', 232, 'view', 'everyone', 0, 1, NULL),
('airport', 232, 'view', 'member', 0, 1, NULL),
('airport', 232, 'view', 'parent_member', 0, 1, NULL),
('airport', 232, 'view', 'registered', 0, 1, NULL),
('airport', 233, 'comment', 'everyone', 0, 1, NULL),
('airport', 233, 'comment', 'member', 0, 1, NULL),
('airport', 233, 'comment', 'parent_member', 0, 1, NULL),
('airport', 233, 'comment', 'registered', 0, 1, NULL),
('airport', 233, 'view', 'everyone', 0, 1, NULL),
('airport', 233, 'view', 'member', 0, 1, NULL),
('airport', 233, 'view', 'parent_member', 0, 1, NULL),
('airport', 233, 'view', 'registered', 0, 1, NULL),
('airport', 234, 'comment', 'everyone', 0, 1, NULL),
('airport', 234, 'comment', 'member', 0, 1, NULL),
('airport', 234, 'comment', 'parent_member', 0, 1, NULL),
('airport', 234, 'comment', 'registered', 0, 1, NULL),
('airport', 234, 'view', 'everyone', 0, 1, NULL),
('airport', 234, 'view', 'member', 0, 1, NULL),
('airport', 234, 'view', 'parent_member', 0, 1, NULL),
('airport', 234, 'view', 'registered', 0, 1, NULL),
('airport', 235, 'comment', 'everyone', 0, 1, NULL),
('airport', 235, 'comment', 'member', 0, 1, NULL),
('airport', 235, 'comment', 'parent_member', 0, 1, NULL),
('airport', 235, 'comment', 'registered', 0, 1, NULL),
('airport', 235, 'view', 'everyone', 0, 1, NULL),
('airport', 235, 'view', 'member', 0, 1, NULL),
('airport', 235, 'view', 'parent_member', 0, 1, NULL),
('airport', 235, 'view', 'registered', 0, 1, NULL),
('airport', 236, 'comment', 'everyone', 0, 1, NULL),
('airport', 236, 'comment', 'member', 0, 1, NULL),
('airport', 236, 'comment', 'parent_member', 0, 1, NULL),
('airport', 236, 'comment', 'registered', 0, 1, NULL),
('airport', 236, 'view', 'everyone', 0, 1, NULL),
('airport', 236, 'view', 'member', 0, 1, NULL),
('airport', 236, 'view', 'parent_member', 0, 1, NULL),
('airport', 236, 'view', 'registered', 0, 1, NULL),
('airport', 237, 'comment', 'everyone', 0, 1, NULL),
('airport', 237, 'comment', 'member', 0, 1, NULL),
('airport', 237, 'comment', 'parent_member', 0, 1, NULL),
('airport', 237, 'comment', 'registered', 0, 1, NULL),
('airport', 237, 'view', 'everyone', 0, 1, NULL),
('airport', 237, 'view', 'member', 0, 1, NULL),
('airport', 237, 'view', 'parent_member', 0, 1, NULL),
('airport', 237, 'view', 'registered', 0, 1, NULL),
('airport', 238, 'comment', 'everyone', 0, 1, NULL),
('airport', 238, 'comment', 'member', 0, 1, NULL),
('airport', 238, 'comment', 'parent_member', 0, 1, NULL),
('airport', 238, 'comment', 'registered', 0, 1, NULL),
('airport', 238, 'view', 'everyone', 0, 1, NULL),
('airport', 238, 'view', 'member', 0, 1, NULL),
('airport', 238, 'view', 'parent_member', 0, 1, NULL),
('airport', 238, 'view', 'registered', 0, 1, NULL),
('airport', 239, 'comment', 'everyone', 0, 1, NULL),
('airport', 239, 'comment', 'member', 0, 1, NULL),
('airport', 239, 'comment', 'parent_member', 0, 1, NULL),
('airport', 239, 'comment', 'registered', 0, 1, NULL),
('airport', 239, 'view', 'everyone', 0, 1, NULL),
('airport', 239, 'view', 'member', 0, 1, NULL),
('airport', 239, 'view', 'parent_member', 0, 1, NULL),
('airport', 239, 'view', 'registered', 0, 1, NULL),
('airport', 240, 'comment', 'everyone', 0, 1, NULL),
('airport', 240, 'comment', 'member', 0, 1, NULL),
('airport', 240, 'comment', 'parent_member', 0, 1, NULL),
('airport', 240, 'comment', 'registered', 0, 1, NULL),
('airport', 240, 'view', 'everyone', 0, 1, NULL),
('airport', 240, 'view', 'member', 0, 1, NULL),
('airport', 240, 'view', 'parent_member', 0, 1, NULL),
('airport', 240, 'view', 'registered', 0, 1, NULL),
('airport', 241, 'comment', 'everyone', 0, 1, NULL),
('airport', 241, 'comment', 'member', 0, 1, NULL),
('airport', 241, 'comment', 'parent_member', 0, 1, NULL),
('airport', 241, 'comment', 'registered', 0, 1, NULL),
('airport', 241, 'view', 'everyone', 0, 1, NULL),
('airport', 241, 'view', 'member', 0, 1, NULL),
('airport', 241, 'view', 'parent_member', 0, 1, NULL),
('airport', 241, 'view', 'registered', 0, 1, NULL),
('airport', 242, 'comment', 'everyone', 0, 1, NULL),
('airport', 242, 'comment', 'member', 0, 1, NULL),
('airport', 242, 'comment', 'parent_member', 0, 1, NULL),
('airport', 242, 'comment', 'registered', 0, 1, NULL),
('airport', 242, 'view', 'everyone', 0, 1, NULL),
('airport', 242, 'view', 'member', 0, 1, NULL),
('airport', 242, 'view', 'parent_member', 0, 1, NULL),
('airport', 242, 'view', 'registered', 0, 1, NULL),
('airport', 243, 'comment', 'everyone', 0, 1, NULL),
('airport', 243, 'comment', 'member', 0, 1, NULL),
('airport', 243, 'comment', 'parent_member', 0, 1, NULL),
('airport', 243, 'comment', 'registered', 0, 1, NULL),
('airport', 243, 'view', 'everyone', 0, 1, NULL),
('airport', 243, 'view', 'member', 0, 1, NULL),
('airport', 243, 'view', 'parent_member', 0, 1, NULL),
('airport', 243, 'view', 'registered', 0, 1, NULL),
('airport', 244, 'comment', 'everyone', 0, 1, NULL),
('airport', 244, 'comment', 'member', 0, 1, NULL),
('airport', 244, 'comment', 'parent_member', 0, 1, NULL),
('airport', 244, 'comment', 'registered', 0, 1, NULL),
('airport', 244, 'view', 'everyone', 0, 1, NULL),
('airport', 244, 'view', 'member', 0, 1, NULL),
('airport', 244, 'view', 'parent_member', 0, 1, NULL),
('airport', 244, 'view', 'registered', 0, 1, NULL),
('airport', 245, 'comment', 'everyone', 0, 1, NULL),
('airport', 245, 'comment', 'member', 0, 1, NULL),
('airport', 245, 'comment', 'parent_member', 0, 1, NULL),
('airport', 245, 'comment', 'registered', 0, 1, NULL),
('airport', 245, 'view', 'everyone', 0, 1, NULL),
('airport', 245, 'view', 'member', 0, 1, NULL),
('airport', 245, 'view', 'parent_member', 0, 1, NULL),
('airport', 245, 'view', 'registered', 0, 1, NULL),
('airport', 246, 'comment', 'everyone', 0, 1, NULL),
('airport', 246, 'comment', 'member', 0, 1, NULL),
('airport', 246, 'comment', 'parent_member', 0, 1, NULL),
('airport', 246, 'comment', 'registered', 0, 1, NULL),
('airport', 246, 'view', 'everyone', 0, 1, NULL),
('airport', 246, 'view', 'member', 0, 1, NULL),
('airport', 246, 'view', 'parent_member', 0, 1, NULL),
('airport', 246, 'view', 'registered', 0, 1, NULL),
('airport', 247, 'comment', 'everyone', 0, 1, NULL),
('airport', 247, 'comment', 'member', 0, 1, NULL),
('airport', 247, 'comment', 'parent_member', 0, 1, NULL),
('airport', 247, 'comment', 'registered', 0, 1, NULL),
('airport', 247, 'view', 'everyone', 0, 1, NULL),
('airport', 247, 'view', 'member', 0, 1, NULL),
('airport', 247, 'view', 'parent_member', 0, 1, NULL),
('airport', 247, 'view', 'registered', 0, 1, NULL),
('airport', 248, 'comment', 'everyone', 0, 1, NULL),
('airport', 248, 'comment', 'member', 0, 1, NULL),
('airport', 248, 'comment', 'parent_member', 0, 1, NULL),
('airport', 248, 'comment', 'registered', 0, 1, NULL),
('airport', 248, 'view', 'everyone', 0, 1, NULL);
INSERT INTO `engine4_authorization_allow` (`resource_type`, `resource_id`, `action`, `role`, `role_id`, `value`, `params`) VALUES
('airport', 248, 'view', 'member', 0, 1, NULL),
('airport', 248, 'view', 'parent_member', 0, 1, NULL),
('airport', 248, 'view', 'registered', 0, 1, NULL),
('airport', 249, 'comment', 'everyone', 0, 1, NULL),
('airport', 249, 'comment', 'member', 0, 1, NULL),
('airport', 249, 'comment', 'parent_member', 0, 1, NULL),
('airport', 249, 'comment', 'registered', 0, 1, NULL),
('airport', 249, 'view', 'everyone', 0, 1, NULL),
('airport', 249, 'view', 'member', 0, 1, NULL),
('airport', 249, 'view', 'parent_member', 0, 1, NULL),
('airport', 249, 'view', 'registered', 0, 1, NULL),
('airport', 250, 'comment', 'everyone', 0, 1, NULL),
('airport', 250, 'comment', 'member', 0, 1, NULL),
('airport', 250, 'comment', 'parent_member', 0, 1, NULL),
('airport', 250, 'comment', 'registered', 0, 1, NULL),
('airport', 250, 'view', 'everyone', 0, 1, NULL),
('airport', 250, 'view', 'member', 0, 1, NULL),
('airport', 250, 'view', 'parent_member', 0, 1, NULL),
('airport', 250, 'view', 'registered', 0, 1, NULL),
('airport', 251, 'comment', 'everyone', 0, 1, NULL),
('airport', 251, 'comment', 'member', 0, 1, NULL),
('airport', 251, 'comment', 'parent_member', 0, 1, NULL),
('airport', 251, 'comment', 'registered', 0, 1, NULL),
('airport', 251, 'view', 'everyone', 0, 1, NULL),
('airport', 251, 'view', 'member', 0, 1, NULL),
('airport', 251, 'view', 'parent_member', 0, 1, NULL),
('airport', 251, 'view', 'registered', 0, 1, NULL),
('airport', 252, 'comment', 'everyone', 0, 1, NULL),
('airport', 252, 'comment', 'member', 0, 1, NULL),
('airport', 252, 'comment', 'parent_member', 0, 1, NULL),
('airport', 252, 'comment', 'registered', 0, 1, NULL),
('airport', 252, 'view', 'everyone', 0, 1, NULL),
('airport', 252, 'view', 'member', 0, 1, NULL),
('airport', 252, 'view', 'parent_member', 0, 1, NULL),
('airport', 252, 'view', 'registered', 0, 1, NULL),
('airport', 253, 'comment', 'everyone', 0, 1, NULL),
('airport', 253, 'comment', 'member', 0, 1, NULL),
('airport', 253, 'comment', 'parent_member', 0, 1, NULL),
('airport', 253, 'comment', 'registered', 0, 1, NULL),
('airport', 253, 'view', 'everyone', 0, 1, NULL),
('airport', 253, 'view', 'member', 0, 1, NULL),
('airport', 253, 'view', 'parent_member', 0, 1, NULL),
('airport', 253, 'view', 'registered', 0, 1, NULL),
('airport', 254, 'comment', 'everyone', 0, 1, NULL),
('airport', 254, 'comment', 'member', 0, 1, NULL),
('airport', 254, 'comment', 'parent_member', 0, 1, NULL),
('airport', 254, 'comment', 'registered', 0, 1, NULL),
('airport', 254, 'view', 'everyone', 0, 1, NULL),
('airport', 254, 'view', 'member', 0, 1, NULL),
('airport', 254, 'view', 'parent_member', 0, 1, NULL),
('airport', 254, 'view', 'registered', 0, 1, NULL),
('airport', 255, 'comment', 'everyone', 0, 1, NULL),
('airport', 255, 'comment', 'member', 0, 1, NULL),
('airport', 255, 'comment', 'parent_member', 0, 1, NULL),
('airport', 255, 'comment', 'registered', 0, 1, NULL),
('airport', 255, 'view', 'everyone', 0, 1, NULL),
('airport', 255, 'view', 'member', 0, 1, NULL),
('airport', 255, 'view', 'parent_member', 0, 1, NULL),
('airport', 255, 'view', 'registered', 0, 1, NULL),
('airport', 256, 'comment', 'everyone', 0, 1, NULL),
('airport', 256, 'comment', 'member', 0, 1, NULL),
('airport', 256, 'comment', 'parent_member', 0, 1, NULL),
('airport', 256, 'comment', 'registered', 0, 1, NULL),
('airport', 256, 'view', 'everyone', 0, 1, NULL),
('airport', 256, 'view', 'member', 0, 1, NULL),
('airport', 256, 'view', 'parent_member', 0, 1, NULL),
('airport', 256, 'view', 'registered', 0, 1, NULL),
('airport', 257, 'comment', 'everyone', 0, 1, NULL),
('airport', 257, 'comment', 'member', 0, 1, NULL),
('airport', 257, 'comment', 'parent_member', 0, 1, NULL),
('airport', 257, 'comment', 'registered', 0, 1, NULL),
('airport', 257, 'view', 'everyone', 0, 1, NULL),
('airport', 257, 'view', 'member', 0, 1, NULL),
('airport', 257, 'view', 'parent_member', 0, 1, NULL),
('airport', 257, 'view', 'registered', 0, 1, NULL),
('airport', 258, 'comment', 'everyone', 0, 1, NULL),
('airport', 258, 'comment', 'member', 0, 1, NULL),
('airport', 258, 'comment', 'parent_member', 0, 1, NULL),
('airport', 258, 'comment', 'registered', 0, 1, NULL),
('airport', 258, 'view', 'everyone', 0, 1, NULL),
('airport', 258, 'view', 'member', 0, 1, NULL),
('airport', 258, 'view', 'parent_member', 0, 1, NULL),
('airport', 258, 'view', 'registered', 0, 1, NULL),
('airport', 259, 'comment', 'everyone', 0, 1, NULL),
('airport', 259, 'comment', 'member', 0, 1, NULL),
('airport', 259, 'comment', 'parent_member', 0, 1, NULL),
('airport', 259, 'comment', 'registered', 0, 1, NULL),
('airport', 259, 'view', 'everyone', 0, 1, NULL),
('airport', 259, 'view', 'member', 0, 1, NULL),
('airport', 259, 'view', 'parent_member', 0, 1, NULL),
('airport', 259, 'view', 'registered', 0, 1, NULL),
('airport', 260, 'comment', 'everyone', 0, 1, NULL),
('airport', 260, 'comment', 'member', 0, 1, NULL),
('airport', 260, 'comment', 'parent_member', 0, 1, NULL),
('airport', 260, 'comment', 'registered', 0, 1, NULL),
('airport', 260, 'view', 'everyone', 0, 1, NULL),
('airport', 260, 'view', 'member', 0, 1, NULL),
('airport', 260, 'view', 'parent_member', 0, 1, NULL),
('airport', 260, 'view', 'registered', 0, 1, NULL),
('airport', 261, 'comment', 'everyone', 0, 1, NULL),
('airport', 261, 'comment', 'member', 0, 1, NULL),
('airport', 261, 'comment', 'parent_member', 0, 1, NULL),
('airport', 261, 'comment', 'registered', 0, 1, NULL),
('airport', 261, 'view', 'everyone', 0, 1, NULL),
('airport', 261, 'view', 'member', 0, 1, NULL),
('airport', 261, 'view', 'parent_member', 0, 1, NULL),
('airport', 261, 'view', 'registered', 0, 1, NULL),
('airport', 262, 'comment', 'everyone', 0, 1, NULL),
('airport', 262, 'comment', 'member', 0, 1, NULL),
('airport', 262, 'comment', 'parent_member', 0, 1, NULL),
('airport', 262, 'comment', 'registered', 0, 1, NULL),
('airport', 262, 'view', 'everyone', 0, 1, NULL),
('airport', 262, 'view', 'member', 0, 1, NULL),
('airport', 262, 'view', 'parent_member', 0, 1, NULL),
('airport', 262, 'view', 'registered', 0, 1, NULL),
('airport', 263, 'comment', 'everyone', 0, 1, NULL),
('airport', 263, 'comment', 'member', 0, 1, NULL),
('airport', 263, 'comment', 'parent_member', 0, 1, NULL),
('airport', 263, 'comment', 'registered', 0, 1, NULL),
('airport', 263, 'view', 'everyone', 0, 1, NULL),
('airport', 263, 'view', 'member', 0, 1, NULL),
('airport', 263, 'view', 'parent_member', 0, 1, NULL),
('airport', 263, 'view', 'registered', 0, 1, NULL),
('airport', 264, 'comment', 'everyone', 0, 1, NULL),
('airport', 264, 'comment', 'member', 0, 1, NULL),
('airport', 264, 'comment', 'parent_member', 0, 1, NULL),
('airport', 264, 'comment', 'registered', 0, 1, NULL),
('airport', 264, 'view', 'everyone', 0, 1, NULL),
('airport', 264, 'view', 'member', 0, 1, NULL),
('airport', 264, 'view', 'parent_member', 0, 1, NULL),
('airport', 264, 'view', 'registered', 0, 1, NULL),
('airport', 265, 'comment', 'everyone', 0, 1, NULL),
('airport', 265, 'comment', 'member', 0, 1, NULL),
('airport', 265, 'comment', 'parent_member', 0, 1, NULL),
('airport', 265, 'comment', 'registered', 0, 1, NULL),
('airport', 265, 'view', 'everyone', 0, 1, NULL),
('airport', 265, 'view', 'member', 0, 1, NULL),
('airport', 265, 'view', 'parent_member', 0, 1, NULL),
('airport', 265, 'view', 'registered', 0, 1, NULL),
('airport', 266, 'comment', 'everyone', 0, 1, NULL),
('airport', 266, 'comment', 'member', 0, 1, NULL),
('airport', 266, 'comment', 'parent_member', 0, 1, NULL),
('airport', 266, 'comment', 'registered', 0, 1, NULL),
('airport', 266, 'view', 'everyone', 0, 1, NULL),
('airport', 266, 'view', 'member', 0, 1, NULL),
('airport', 266, 'view', 'parent_member', 0, 1, NULL),
('airport', 266, 'view', 'registered', 0, 1, NULL),
('airport', 267, 'comment', 'everyone', 0, 1, NULL),
('airport', 267, 'comment', 'member', 0, 1, NULL),
('airport', 267, 'comment', 'parent_member', 0, 1, NULL),
('airport', 267, 'comment', 'registered', 0, 1, NULL),
('airport', 267, 'view', 'everyone', 0, 1, NULL),
('airport', 267, 'view', 'member', 0, 1, NULL),
('airport', 267, 'view', 'parent_member', 0, 1, NULL),
('airport', 267, 'view', 'registered', 0, 1, NULL),
('airport', 268, 'comment', 'everyone', 0, 1, NULL),
('airport', 268, 'comment', 'member', 0, 1, NULL),
('airport', 268, 'comment', 'parent_member', 0, 1, NULL),
('airport', 268, 'comment', 'registered', 0, 1, NULL),
('airport', 268, 'view', 'everyone', 0, 1, NULL),
('airport', 268, 'view', 'member', 0, 1, NULL),
('airport', 268, 'view', 'parent_member', 0, 1, NULL),
('airport', 268, 'view', 'registered', 0, 1, NULL),
('airport', 269, 'comment', 'everyone', 0, 1, NULL),
('airport', 269, 'comment', 'member', 0, 1, NULL),
('airport', 269, 'comment', 'parent_member', 0, 1, NULL),
('airport', 269, 'comment', 'registered', 0, 1, NULL),
('airport', 269, 'view', 'everyone', 0, 1, NULL),
('airport', 269, 'view', 'member', 0, 1, NULL),
('airport', 269, 'view', 'parent_member', 0, 1, NULL),
('airport', 269, 'view', 'registered', 0, 1, NULL),
('airport', 270, 'comment', 'everyone', 0, 1, NULL),
('airport', 270, 'comment', 'member', 0, 1, NULL),
('airport', 270, 'comment', 'parent_member', 0, 1, NULL),
('airport', 270, 'comment', 'registered', 0, 1, NULL),
('airport', 270, 'view', 'everyone', 0, 1, NULL),
('airport', 270, 'view', 'member', 0, 1, NULL),
('airport', 270, 'view', 'parent_member', 0, 1, NULL),
('airport', 270, 'view', 'registered', 0, 1, NULL),
('airport', 271, 'comment', 'everyone', 0, 1, NULL),
('airport', 271, 'comment', 'member', 0, 1, NULL),
('airport', 271, 'comment', 'parent_member', 0, 1, NULL),
('airport', 271, 'comment', 'registered', 0, 1, NULL),
('airport', 271, 'view', 'everyone', 0, 1, NULL),
('airport', 271, 'view', 'member', 0, 1, NULL),
('airport', 271, 'view', 'parent_member', 0, 1, NULL),
('airport', 271, 'view', 'registered', 0, 1, NULL),
('airport', 272, 'comment', 'everyone', 0, 1, NULL),
('airport', 272, 'comment', 'member', 0, 1, NULL),
('airport', 272, 'comment', 'parent_member', 0, 1, NULL),
('airport', 272, 'comment', 'registered', 0, 1, NULL),
('airport', 272, 'view', 'everyone', 0, 1, NULL),
('airport', 272, 'view', 'member', 0, 1, NULL),
('airport', 272, 'view', 'parent_member', 0, 1, NULL),
('airport', 272, 'view', 'registered', 0, 1, NULL),
('airport', 273, 'comment', 'everyone', 0, 1, NULL),
('airport', 273, 'comment', 'member', 0, 1, NULL),
('airport', 273, 'comment', 'parent_member', 0, 1, NULL),
('airport', 273, 'comment', 'registered', 0, 1, NULL),
('airport', 273, 'view', 'everyone', 0, 1, NULL),
('airport', 273, 'view', 'member', 0, 1, NULL),
('airport', 273, 'view', 'parent_member', 0, 1, NULL),
('airport', 273, 'view', 'registered', 0, 1, NULL),
('airport', 274, 'comment', 'everyone', 0, 1, NULL),
('airport', 274, 'comment', 'member', 0, 1, NULL),
('airport', 274, 'comment', 'parent_member', 0, 1, NULL),
('airport', 274, 'comment', 'registered', 0, 1, NULL),
('airport', 274, 'view', 'everyone', 0, 1, NULL),
('airport', 274, 'view', 'member', 0, 1, NULL),
('airport', 274, 'view', 'parent_member', 0, 1, NULL),
('airport', 274, 'view', 'registered', 0, 1, NULL),
('airport', 275, 'comment', 'everyone', 0, 1, NULL),
('airport', 275, 'comment', 'member', 0, 1, NULL),
('airport', 275, 'comment', 'parent_member', 0, 1, NULL),
('airport', 275, 'comment', 'registered', 0, 1, NULL),
('airport', 275, 'view', 'everyone', 0, 1, NULL),
('airport', 275, 'view', 'member', 0, 1, NULL),
('airport', 275, 'view', 'parent_member', 0, 1, NULL),
('airport', 275, 'view', 'registered', 0, 1, NULL),
('airport', 276, 'comment', 'everyone', 0, 1, NULL),
('airport', 276, 'comment', 'member', 0, 1, NULL),
('airport', 276, 'comment', 'parent_member', 0, 1, NULL),
('airport', 276, 'comment', 'registered', 0, 1, NULL),
('airport', 276, 'view', 'everyone', 0, 1, NULL),
('airport', 276, 'view', 'member', 0, 1, NULL),
('airport', 276, 'view', 'parent_member', 0, 1, NULL),
('airport', 276, 'view', 'registered', 0, 1, NULL),
('airport', 277, 'comment', 'everyone', 0, 1, NULL),
('airport', 277, 'comment', 'member', 0, 1, NULL),
('airport', 277, 'comment', 'parent_member', 0, 1, NULL),
('airport', 277, 'comment', 'registered', 0, 1, NULL),
('airport', 277, 'view', 'everyone', 0, 1, NULL),
('airport', 277, 'view', 'member', 0, 1, NULL),
('airport', 277, 'view', 'parent_member', 0, 1, NULL),
('airport', 277, 'view', 'registered', 0, 1, NULL),
('airport', 278, 'comment', 'everyone', 0, 1, NULL),
('airport', 278, 'comment', 'member', 0, 1, NULL),
('airport', 278, 'comment', 'parent_member', 0, 1, NULL),
('airport', 278, 'comment', 'registered', 0, 1, NULL),
('airport', 278, 'view', 'everyone', 0, 1, NULL),
('airport', 278, 'view', 'member', 0, 1, NULL),
('airport', 278, 'view', 'parent_member', 0, 1, NULL),
('airport', 278, 'view', 'registered', 0, 1, NULL),
('airport', 279, 'comment', 'everyone', 0, 1, NULL),
('airport', 279, 'comment', 'member', 0, 1, NULL),
('airport', 279, 'comment', 'parent_member', 0, 1, NULL),
('airport', 279, 'comment', 'registered', 0, 1, NULL),
('airport', 279, 'view', 'everyone', 0, 1, NULL),
('airport', 279, 'view', 'member', 0, 1, NULL),
('airport', 279, 'view', 'parent_member', 0, 1, NULL),
('airport', 279, 'view', 'registered', 0, 1, NULL),
('airport', 280, 'comment', 'everyone', 0, 1, NULL),
('airport', 280, 'comment', 'member', 0, 1, NULL),
('airport', 280, 'comment', 'parent_member', 0, 1, NULL),
('airport', 280, 'comment', 'registered', 0, 1, NULL),
('airport', 280, 'view', 'everyone', 0, 1, NULL),
('airport', 280, 'view', 'member', 0, 1, NULL),
('airport', 280, 'view', 'parent_member', 0, 1, NULL),
('airport', 280, 'view', 'registered', 0, 1, NULL),
('airport', 281, 'comment', 'everyone', 0, 1, NULL),
('airport', 281, 'comment', 'member', 0, 1, NULL),
('airport', 281, 'comment', 'parent_member', 0, 1, NULL),
('airport', 281, 'comment', 'registered', 0, 1, NULL),
('airport', 281, 'view', 'everyone', 0, 1, NULL),
('airport', 281, 'view', 'member', 0, 1, NULL),
('airport', 281, 'view', 'parent_member', 0, 1, NULL),
('airport', 281, 'view', 'registered', 0, 1, NULL),
('airport', 282, 'comment', 'everyone', 0, 1, NULL),
('airport', 282, 'comment', 'member', 0, 1, NULL),
('airport', 282, 'comment', 'parent_member', 0, 1, NULL),
('airport', 282, 'comment', 'registered', 0, 1, NULL),
('airport', 282, 'view', 'everyone', 0, 1, NULL),
('airport', 282, 'view', 'member', 0, 1, NULL),
('airport', 282, 'view', 'parent_member', 0, 1, NULL),
('airport', 282, 'view', 'registered', 0, 1, NULL),
('airport', 283, 'comment', 'everyone', 0, 1, NULL),
('airport', 283, 'comment', 'member', 0, 1, NULL),
('airport', 283, 'comment', 'parent_member', 0, 1, NULL),
('airport', 283, 'comment', 'registered', 0, 1, NULL),
('airport', 283, 'view', 'everyone', 0, 1, NULL),
('airport', 283, 'view', 'member', 0, 1, NULL),
('airport', 283, 'view', 'parent_member', 0, 1, NULL),
('airport', 283, 'view', 'registered', 0, 1, NULL),
('airport', 284, 'comment', 'everyone', 0, 1, NULL),
('airport', 284, 'comment', 'member', 0, 1, NULL),
('airport', 284, 'comment', 'parent_member', 0, 1, NULL),
('airport', 284, 'comment', 'registered', 0, 1, NULL),
('airport', 284, 'view', 'everyone', 0, 1, NULL),
('airport', 284, 'view', 'member', 0, 1, NULL),
('airport', 284, 'view', 'parent_member', 0, 1, NULL),
('airport', 284, 'view', 'registered', 0, 1, NULL),
('airport', 285, 'comment', 'everyone', 0, 1, NULL),
('airport', 285, 'comment', 'member', 0, 1, NULL),
('airport', 285, 'comment', 'parent_member', 0, 1, NULL),
('airport', 285, 'comment', 'registered', 0, 1, NULL),
('airport', 285, 'view', 'everyone', 0, 1, NULL),
('airport', 285, 'view', 'member', 0, 1, NULL),
('airport', 285, 'view', 'parent_member', 0, 1, NULL),
('airport', 285, 'view', 'registered', 0, 1, NULL),
('airport', 286, 'comment', 'everyone', 0, 1, NULL),
('airport', 286, 'comment', 'member', 0, 1, NULL),
('airport', 286, 'comment', 'parent_member', 0, 1, NULL),
('airport', 286, 'comment', 'registered', 0, 1, NULL),
('airport', 286, 'view', 'everyone', 0, 1, NULL),
('airport', 286, 'view', 'member', 0, 1, NULL),
('airport', 286, 'view', 'parent_member', 0, 1, NULL),
('airport', 286, 'view', 'registered', 0, 1, NULL),
('airport', 287, 'comment', 'everyone', 0, 1, NULL),
('airport', 287, 'comment', 'member', 0, 1, NULL),
('airport', 287, 'comment', 'parent_member', 0, 1, NULL),
('airport', 287, 'comment', 'registered', 0, 1, NULL),
('airport', 287, 'view', 'everyone', 0, 1, NULL),
('airport', 287, 'view', 'member', 0, 1, NULL),
('airport', 287, 'view', 'parent_member', 0, 1, NULL),
('airport', 287, 'view', 'registered', 0, 1, NULL),
('airport', 288, 'comment', 'everyone', 0, 1, NULL),
('airport', 288, 'comment', 'member', 0, 1, NULL),
('airport', 288, 'comment', 'parent_member', 0, 1, NULL),
('airport', 288, 'comment', 'registered', 0, 1, NULL),
('airport', 288, 'view', 'everyone', 0, 1, NULL),
('airport', 288, 'view', 'member', 0, 1, NULL),
('airport', 288, 'view', 'parent_member', 0, 1, NULL),
('airport', 288, 'view', 'registered', 0, 1, NULL),
('airport', 289, 'comment', 'everyone', 0, 1, NULL),
('airport', 289, 'comment', 'member', 0, 1, NULL),
('airport', 289, 'comment', 'parent_member', 0, 1, NULL),
('airport', 289, 'comment', 'registered', 0, 1, NULL),
('airport', 289, 'view', 'everyone', 0, 1, NULL),
('airport', 289, 'view', 'member', 0, 1, NULL),
('airport', 289, 'view', 'parent_member', 0, 1, NULL),
('airport', 289, 'view', 'registered', 0, 1, NULL),
('airport', 290, 'comment', 'everyone', 0, 1, NULL),
('airport', 290, 'comment', 'member', 0, 1, NULL),
('airport', 290, 'comment', 'parent_member', 0, 1, NULL),
('airport', 290, 'comment', 'registered', 0, 1, NULL),
('airport', 290, 'view', 'everyone', 0, 1, NULL),
('airport', 290, 'view', 'member', 0, 1, NULL),
('airport', 290, 'view', 'parent_member', 0, 1, NULL),
('airport', 290, 'view', 'registered', 0, 1, NULL),
('airport', 291, 'comment', 'everyone', 0, 1, NULL),
('airport', 291, 'comment', 'member', 0, 1, NULL),
('airport', 291, 'comment', 'parent_member', 0, 1, NULL),
('airport', 291, 'comment', 'registered', 0, 1, NULL),
('airport', 291, 'view', 'everyone', 0, 1, NULL),
('airport', 291, 'view', 'member', 0, 1, NULL),
('airport', 291, 'view', 'parent_member', 0, 1, NULL),
('airport', 291, 'view', 'registered', 0, 1, NULL),
('airport', 292, 'comment', 'everyone', 0, 1, NULL),
('airport', 292, 'comment', 'member', 0, 1, NULL),
('airport', 292, 'comment', 'parent_member', 0, 1, NULL),
('airport', 292, 'comment', 'registered', 0, 1, NULL),
('airport', 292, 'view', 'everyone', 0, 1, NULL),
('airport', 292, 'view', 'member', 0, 1, NULL),
('airport', 292, 'view', 'parent_member', 0, 1, NULL),
('airport', 292, 'view', 'registered', 0, 1, NULL),
('airport', 293, 'comment', 'everyone', 0, 1, NULL),
('airport', 293, 'comment', 'member', 0, 1, NULL),
('airport', 293, 'comment', 'parent_member', 0, 1, NULL),
('airport', 293, 'comment', 'registered', 0, 1, NULL),
('airport', 293, 'view', 'everyone', 0, 1, NULL),
('airport', 293, 'view', 'member', 0, 1, NULL),
('airport', 293, 'view', 'parent_member', 0, 1, NULL),
('airport', 293, 'view', 'registered', 0, 1, NULL),
('airport', 294, 'comment', 'everyone', 0, 1, NULL),
('airport', 294, 'comment', 'member', 0, 1, NULL),
('airport', 294, 'comment', 'parent_member', 0, 1, NULL),
('airport', 294, 'comment', 'registered', 0, 1, NULL),
('airport', 294, 'view', 'everyone', 0, 1, NULL),
('airport', 294, 'view', 'member', 0, 1, NULL),
('airport', 294, 'view', 'parent_member', 0, 1, NULL),
('airport', 294, 'view', 'registered', 0, 1, NULL),
('airport', 295, 'comment', 'everyone', 0, 1, NULL),
('airport', 295, 'comment', 'member', 0, 1, NULL),
('airport', 295, 'comment', 'parent_member', 0, 1, NULL),
('airport', 295, 'comment', 'registered', 0, 1, NULL),
('airport', 295, 'view', 'everyone', 0, 1, NULL),
('airport', 295, 'view', 'member', 0, 1, NULL),
('airport', 295, 'view', 'parent_member', 0, 1, NULL),
('airport', 295, 'view', 'registered', 0, 1, NULL),
('airport', 296, 'comment', 'everyone', 0, 1, NULL),
('airport', 296, 'comment', 'member', 0, 1, NULL),
('airport', 296, 'comment', 'parent_member', 0, 1, NULL),
('airport', 296, 'comment', 'registered', 0, 1, NULL),
('airport', 296, 'view', 'everyone', 0, 1, NULL),
('airport', 296, 'view', 'member', 0, 1, NULL),
('airport', 296, 'view', 'parent_member', 0, 1, NULL),
('airport', 296, 'view', 'registered', 0, 1, NULL),
('airport', 297, 'comment', 'everyone', 0, 1, NULL),
('airport', 297, 'comment', 'member', 0, 1, NULL),
('airport', 297, 'comment', 'parent_member', 0, 1, NULL),
('airport', 297, 'comment', 'registered', 0, 1, NULL),
('airport', 297, 'view', 'everyone', 0, 1, NULL),
('airport', 297, 'view', 'member', 0, 1, NULL),
('airport', 297, 'view', 'parent_member', 0, 1, NULL),
('airport', 297, 'view', 'registered', 0, 1, NULL),
('airport', 298, 'comment', 'everyone', 0, 1, NULL),
('airport', 298, 'comment', 'member', 0, 1, NULL),
('airport', 298, 'comment', 'parent_member', 0, 1, NULL),
('airport', 298, 'comment', 'registered', 0, 1, NULL),
('airport', 298, 'view', 'everyone', 0, 1, NULL),
('airport', 298, 'view', 'member', 0, 1, NULL),
('airport', 298, 'view', 'parent_member', 0, 1, NULL),
('airport', 298, 'view', 'registered', 0, 1, NULL),
('airport', 299, 'comment', 'everyone', 0, 1, NULL),
('airport', 299, 'comment', 'member', 0, 1, NULL),
('airport', 299, 'comment', 'parent_member', 0, 1, NULL),
('airport', 299, 'comment', 'registered', 0, 1, NULL),
('airport', 299, 'view', 'everyone', 0, 1, NULL),
('airport', 299, 'view', 'member', 0, 1, NULL),
('airport', 299, 'view', 'parent_member', 0, 1, NULL),
('airport', 299, 'view', 'registered', 0, 1, NULL),
('airport', 300, 'comment', 'everyone', 0, 1, NULL),
('airport', 300, 'comment', 'member', 0, 1, NULL),
('airport', 300, 'comment', 'parent_member', 0, 1, NULL),
('airport', 300, 'comment', 'registered', 0, 1, NULL),
('airport', 300, 'view', 'everyone', 0, 1, NULL),
('airport', 300, 'view', 'member', 0, 1, NULL),
('airport', 300, 'view', 'parent_member', 0, 1, NULL),
('airport', 300, 'view', 'registered', 0, 1, NULL),
('airport', 301, 'comment', 'everyone', 0, 1, NULL),
('airport', 301, 'comment', 'member', 0, 1, NULL),
('airport', 301, 'comment', 'parent_member', 0, 1, NULL),
('airport', 301, 'comment', 'registered', 0, 1, NULL),
('airport', 301, 'view', 'everyone', 0, 1, NULL),
('airport', 301, 'view', 'member', 0, 1, NULL),
('airport', 301, 'view', 'parent_member', 0, 1, NULL),
('airport', 301, 'view', 'registered', 0, 1, NULL),
('airport', 302, 'comment', 'everyone', 0, 1, NULL),
('airport', 302, 'comment', 'member', 0, 1, NULL),
('airport', 302, 'comment', 'parent_member', 0, 1, NULL),
('airport', 302, 'comment', 'registered', 0, 1, NULL),
('airport', 302, 'view', 'everyone', 0, 1, NULL),
('airport', 302, 'view', 'member', 0, 1, NULL),
('airport', 302, 'view', 'parent_member', 0, 1, NULL),
('airport', 302, 'view', 'registered', 0, 1, NULL),
('airport', 303, 'comment', 'everyone', 0, 1, NULL),
('airport', 303, 'comment', 'member', 0, 1, NULL),
('airport', 303, 'comment', 'parent_member', 0, 1, NULL),
('airport', 303, 'comment', 'registered', 0, 1, NULL),
('airport', 303, 'view', 'everyone', 0, 1, NULL),
('airport', 303, 'view', 'member', 0, 1, NULL),
('airport', 303, 'view', 'parent_member', 0, 1, NULL),
('airport', 303, 'view', 'registered', 0, 1, NULL),
('airport', 304, 'comment', 'everyone', 0, 1, NULL),
('airport', 304, 'comment', 'member', 0, 1, NULL),
('airport', 304, 'comment', 'parent_member', 0, 1, NULL),
('airport', 304, 'comment', 'registered', 0, 1, NULL),
('airport', 304, 'view', 'everyone', 0, 1, NULL),
('airport', 304, 'view', 'member', 0, 1, NULL),
('airport', 304, 'view', 'parent_member', 0, 1, NULL),
('airport', 304, 'view', 'registered', 0, 1, NULL),
('airport', 305, 'comment', 'everyone', 0, 1, NULL),
('airport', 305, 'comment', 'member', 0, 1, NULL),
('airport', 305, 'comment', 'parent_member', 0, 1, NULL),
('airport', 305, 'comment', 'registered', 0, 1, NULL),
('airport', 305, 'view', 'everyone', 0, 1, NULL),
('airport', 305, 'view', 'member', 0, 1, NULL),
('airport', 305, 'view', 'parent_member', 0, 1, NULL),
('airport', 305, 'view', 'registered', 0, 1, NULL),
('airport', 306, 'comment', 'everyone', 0, 1, NULL),
('airport', 306, 'comment', 'member', 0, 1, NULL),
('airport', 306, 'comment', 'parent_member', 0, 1, NULL),
('airport', 306, 'comment', 'registered', 0, 1, NULL),
('airport', 306, 'view', 'everyone', 0, 1, NULL),
('airport', 306, 'view', 'member', 0, 1, NULL),
('airport', 306, 'view', 'parent_member', 0, 1, NULL),
('airport', 306, 'view', 'registered', 0, 1, NULL),
('airport', 307, 'comment', 'everyone', 0, 1, NULL),
('airport', 307, 'comment', 'member', 0, 1, NULL),
('airport', 307, 'comment', 'parent_member', 0, 1, NULL),
('airport', 307, 'comment', 'registered', 0, 1, NULL),
('airport', 307, 'view', 'everyone', 0, 1, NULL),
('airport', 307, 'view', 'member', 0, 1, NULL),
('airport', 307, 'view', 'parent_member', 0, 1, NULL),
('airport', 307, 'view', 'registered', 0, 1, NULL),
('airport', 308, 'comment', 'everyone', 0, 1, NULL),
('airport', 308, 'comment', 'member', 0, 1, NULL),
('airport', 308, 'comment', 'parent_member', 0, 1, NULL),
('airport', 308, 'comment', 'registered', 0, 1, NULL),
('airport', 308, 'view', 'everyone', 0, 1, NULL),
('airport', 308, 'view', 'member', 0, 1, NULL),
('airport', 308, 'view', 'parent_member', 0, 1, NULL),
('airport', 308, 'view', 'registered', 0, 1, NULL),
('airport', 309, 'comment', 'everyone', 0, 1, NULL),
('airport', 309, 'comment', 'member', 0, 1, NULL),
('airport', 309, 'comment', 'parent_member', 0, 1, NULL),
('airport', 309, 'comment', 'registered', 0, 1, NULL),
('airport', 309, 'view', 'everyone', 0, 1, NULL),
('airport', 309, 'view', 'member', 0, 1, NULL),
('airport', 309, 'view', 'parent_member', 0, 1, NULL),
('airport', 309, 'view', 'registered', 0, 1, NULL),
('airport', 310, 'comment', 'everyone', 0, 1, NULL),
('airport', 310, 'comment', 'member', 0, 1, NULL),
('airport', 310, 'comment', 'parent_member', 0, 1, NULL),
('airport', 310, 'comment', 'registered', 0, 1, NULL),
('airport', 310, 'view', 'everyone', 0, 1, NULL),
('airport', 310, 'view', 'member', 0, 1, NULL),
('airport', 310, 'view', 'parent_member', 0, 1, NULL),
('airport', 310, 'view', 'registered', 0, 1, NULL),
('airport', 311, 'comment', 'everyone', 0, 1, NULL),
('airport', 311, 'comment', 'member', 0, 1, NULL),
('airport', 311, 'comment', 'parent_member', 0, 1, NULL),
('airport', 311, 'comment', 'registered', 0, 1, NULL),
('airport', 311, 'view', 'everyone', 0, 1, NULL),
('airport', 311, 'view', 'member', 0, 1, NULL),
('airport', 311, 'view', 'parent_member', 0, 1, NULL),
('airport', 311, 'view', 'registered', 0, 1, NULL),
('airport', 312, 'comment', 'everyone', 0, 1, NULL),
('airport', 312, 'comment', 'member', 0, 1, NULL),
('airport', 312, 'comment', 'parent_member', 0, 1, NULL),
('airport', 312, 'comment', 'registered', 0, 1, NULL),
('airport', 312, 'view', 'everyone', 0, 1, NULL),
('airport', 312, 'view', 'member', 0, 1, NULL),
('airport', 312, 'view', 'parent_member', 0, 1, NULL),
('airport', 312, 'view', 'registered', 0, 1, NULL),
('airport', 313, 'comment', 'everyone', 0, 1, NULL),
('airport', 313, 'comment', 'member', 0, 1, NULL),
('airport', 313, 'comment', 'parent_member', 0, 1, NULL),
('airport', 313, 'comment', 'registered', 0, 1, NULL),
('airport', 313, 'view', 'everyone', 0, 1, NULL),
('airport', 313, 'view', 'member', 0, 1, NULL),
('airport', 313, 'view', 'parent_member', 0, 1, NULL),
('airport', 313, 'view', 'registered', 0, 1, NULL),
('airport', 314, 'comment', 'everyone', 0, 1, NULL),
('airport', 314, 'comment', 'member', 0, 1, NULL),
('airport', 314, 'comment', 'parent_member', 0, 1, NULL),
('airport', 314, 'comment', 'registered', 0, 1, NULL),
('airport', 314, 'view', 'everyone', 0, 1, NULL),
('airport', 314, 'view', 'member', 0, 1, NULL),
('airport', 314, 'view', 'parent_member', 0, 1, NULL),
('airport', 314, 'view', 'registered', 0, 1, NULL),
('airport', 315, 'comment', 'everyone', 0, 1, NULL),
('airport', 315, 'comment', 'member', 0, 1, NULL),
('airport', 315, 'comment', 'parent_member', 0, 1, NULL),
('airport', 315, 'comment', 'registered', 0, 1, NULL),
('airport', 315, 'view', 'everyone', 0, 1, NULL),
('airport', 315, 'view', 'member', 0, 1, NULL),
('airport', 315, 'view', 'parent_member', 0, 1, NULL),
('airport', 315, 'view', 'registered', 0, 1, NULL),
('airport', 316, 'comment', 'everyone', 0, 1, NULL),
('airport', 316, 'comment', 'member', 0, 1, NULL),
('airport', 316, 'comment', 'parent_member', 0, 1, NULL),
('airport', 316, 'comment', 'registered', 0, 1, NULL),
('airport', 316, 'view', 'everyone', 0, 1, NULL),
('airport', 316, 'view', 'member', 0, 1, NULL),
('airport', 316, 'view', 'parent_member', 0, 1, NULL),
('airport', 316, 'view', 'registered', 0, 1, NULL),
('airport', 317, 'comment', 'everyone', 0, 1, NULL),
('airport', 317, 'comment', 'member', 0, 1, NULL),
('airport', 317, 'comment', 'parent_member', 0, 1, NULL),
('airport', 317, 'comment', 'registered', 0, 1, NULL),
('airport', 317, 'view', 'everyone', 0, 1, NULL),
('airport', 317, 'view', 'member', 0, 1, NULL),
('airport', 317, 'view', 'parent_member', 0, 1, NULL),
('airport', 317, 'view', 'registered', 0, 1, NULL),
('airport', 318, 'comment', 'everyone', 0, 1, NULL),
('airport', 318, 'comment', 'member', 0, 1, NULL),
('airport', 318, 'comment', 'parent_member', 0, 1, NULL),
('airport', 318, 'comment', 'registered', 0, 1, NULL),
('airport', 318, 'view', 'everyone', 0, 1, NULL),
('airport', 318, 'view', 'member', 0, 1, NULL),
('airport', 318, 'view', 'parent_member', 0, 1, NULL),
('airport', 318, 'view', 'registered', 0, 1, NULL),
('airport', 319, 'comment', 'everyone', 0, 1, NULL),
('airport', 319, 'comment', 'member', 0, 1, NULL),
('airport', 319, 'comment', 'parent_member', 0, 1, NULL),
('airport', 319, 'comment', 'registered', 0, 1, NULL),
('airport', 319, 'view', 'everyone', 0, 1, NULL),
('airport', 319, 'view', 'member', 0, 1, NULL),
('airport', 319, 'view', 'parent_member', 0, 1, NULL),
('airport', 319, 'view', 'registered', 0, 1, NULL),
('airport', 320, 'comment', 'everyone', 0, 1, NULL),
('airport', 320, 'comment', 'member', 0, 1, NULL),
('airport', 320, 'comment', 'parent_member', 0, 1, NULL),
('airport', 320, 'comment', 'registered', 0, 1, NULL),
('airport', 320, 'view', 'everyone', 0, 1, NULL),
('airport', 320, 'view', 'member', 0, 1, NULL),
('airport', 320, 'view', 'parent_member', 0, 1, NULL),
('airport', 320, 'view', 'registered', 0, 1, NULL),
('airport', 321, 'comment', 'everyone', 0, 1, NULL),
('airport', 321, 'comment', 'member', 0, 1, NULL),
('airport', 321, 'comment', 'parent_member', 0, 1, NULL),
('airport', 321, 'comment', 'registered', 0, 1, NULL),
('airport', 321, 'view', 'everyone', 0, 1, NULL),
('airport', 321, 'view', 'member', 0, 1, NULL),
('airport', 321, 'view', 'parent_member', 0, 1, NULL),
('airport', 321, 'view', 'registered', 0, 1, NULL),
('airport', 322, 'comment', 'everyone', 0, 1, NULL),
('airport', 322, 'comment', 'member', 0, 1, NULL),
('airport', 322, 'comment', 'parent_member', 0, 1, NULL),
('airport', 322, 'comment', 'registered', 0, 1, NULL),
('airport', 322, 'view', 'everyone', 0, 1, NULL),
('airport', 322, 'view', 'member', 0, 1, NULL),
('airport', 322, 'view', 'parent_member', 0, 1, NULL),
('airport', 322, 'view', 'registered', 0, 1, NULL),
('airport', 323, 'comment', 'everyone', 0, 1, NULL),
('airport', 323, 'comment', 'member', 0, 1, NULL),
('airport', 323, 'comment', 'parent_member', 0, 1, NULL),
('airport', 323, 'comment', 'registered', 0, 1, NULL),
('airport', 323, 'view', 'everyone', 0, 1, NULL),
('airport', 323, 'view', 'member', 0, 1, NULL),
('airport', 323, 'view', 'parent_member', 0, 1, NULL),
('airport', 323, 'view', 'registered', 0, 1, NULL),
('airport', 324, 'comment', 'everyone', 0, 1, NULL),
('airport', 324, 'comment', 'member', 0, 1, NULL),
('airport', 324, 'comment', 'parent_member', 0, 1, NULL),
('airport', 324, 'comment', 'registered', 0, 1, NULL),
('airport', 324, 'view', 'everyone', 0, 1, NULL),
('airport', 324, 'view', 'member', 0, 1, NULL),
('airport', 324, 'view', 'parent_member', 0, 1, NULL),
('airport', 324, 'view', 'registered', 0, 1, NULL),
('airport', 325, 'comment', 'everyone', 0, 1, NULL),
('airport', 325, 'comment', 'member', 0, 1, NULL),
('airport', 325, 'comment', 'parent_member', 0, 1, NULL),
('airport', 325, 'comment', 'registered', 0, 1, NULL),
('airport', 325, 'view', 'everyone', 0, 1, NULL),
('airport', 325, 'view', 'member', 0, 1, NULL),
('airport', 325, 'view', 'parent_member', 0, 1, NULL),
('airport', 325, 'view', 'registered', 0, 1, NULL),
('airport', 326, 'comment', 'everyone', 0, 1, NULL),
('airport', 326, 'comment', 'member', 0, 1, NULL),
('airport', 326, 'comment', 'parent_member', 0, 1, NULL),
('airport', 326, 'comment', 'registered', 0, 1, NULL),
('airport', 326, 'view', 'everyone', 0, 1, NULL),
('airport', 326, 'view', 'member', 0, 1, NULL),
('airport', 326, 'view', 'parent_member', 0, 1, NULL),
('airport', 326, 'view', 'registered', 0, 1, NULL),
('airport', 327, 'comment', 'everyone', 0, 1, NULL),
('airport', 327, 'comment', 'member', 0, 1, NULL),
('airport', 327, 'comment', 'parent_member', 0, 1, NULL),
('airport', 327, 'comment', 'registered', 0, 1, NULL),
('airport', 327, 'view', 'everyone', 0, 1, NULL),
('airport', 327, 'view', 'member', 0, 1, NULL),
('airport', 327, 'view', 'parent_member', 0, 1, NULL),
('airport', 327, 'view', 'registered', 0, 1, NULL),
('airport', 328, 'comment', 'everyone', 0, 1, NULL),
('airport', 328, 'comment', 'member', 0, 1, NULL),
('airport', 328, 'comment', 'parent_member', 0, 1, NULL),
('airport', 328, 'comment', 'registered', 0, 1, NULL),
('airport', 328, 'view', 'everyone', 0, 1, NULL),
('airport', 328, 'view', 'member', 0, 1, NULL),
('airport', 328, 'view', 'parent_member', 0, 1, NULL),
('airport', 328, 'view', 'registered', 0, 1, NULL),
('airport', 329, 'comment', 'everyone', 0, 1, NULL),
('airport', 329, 'comment', 'member', 0, 1, NULL),
('airport', 329, 'comment', 'parent_member', 0, 1, NULL),
('airport', 329, 'comment', 'registered', 0, 1, NULL),
('airport', 329, 'view', 'everyone', 0, 1, NULL),
('airport', 329, 'view', 'member', 0, 1, NULL),
('airport', 329, 'view', 'parent_member', 0, 1, NULL),
('airport', 329, 'view', 'registered', 0, 1, NULL),
('airport', 330, 'comment', 'everyone', 0, 1, NULL),
('airport', 330, 'comment', 'member', 0, 1, NULL),
('airport', 330, 'comment', 'parent_member', 0, 1, NULL),
('airport', 330, 'comment', 'registered', 0, 1, NULL),
('airport', 330, 'view', 'everyone', 0, 1, NULL),
('airport', 330, 'view', 'member', 0, 1, NULL),
('airport', 330, 'view', 'parent_member', 0, 1, NULL),
('airport', 330, 'view', 'registered', 0, 1, NULL),
('airport', 331, 'comment', 'everyone', 0, 1, NULL),
('airport', 331, 'comment', 'member', 0, 1, NULL),
('airport', 331, 'comment', 'parent_member', 0, 1, NULL),
('airport', 331, 'comment', 'registered', 0, 1, NULL),
('airport', 331, 'view', 'everyone', 0, 1, NULL),
('airport', 331, 'view', 'member', 0, 1, NULL),
('airport', 331, 'view', 'parent_member', 0, 1, NULL),
('airport', 331, 'view', 'registered', 0, 1, NULL),
('airport', 332, 'comment', 'everyone', 0, 1, NULL),
('airport', 332, 'comment', 'member', 0, 1, NULL),
('airport', 332, 'comment', 'parent_member', 0, 1, NULL),
('airport', 332, 'comment', 'registered', 0, 1, NULL),
('airport', 332, 'view', 'everyone', 0, 1, NULL),
('airport', 332, 'view', 'member', 0, 1, NULL),
('airport', 332, 'view', 'parent_member', 0, 1, NULL),
('airport', 332, 'view', 'registered', 0, 1, NULL),
('airport', 333, 'comment', 'everyone', 0, 1, NULL),
('airport', 333, 'comment', 'member', 0, 1, NULL),
('airport', 333, 'comment', 'parent_member', 0, 1, NULL),
('airport', 333, 'comment', 'registered', 0, 1, NULL),
('airport', 333, 'view', 'everyone', 0, 1, NULL),
('airport', 333, 'view', 'member', 0, 1, NULL),
('airport', 333, 'view', 'parent_member', 0, 1, NULL),
('airport', 333, 'view', 'registered', 0, 1, NULL),
('airport', 334, 'comment', 'everyone', 0, 1, NULL),
('airport', 334, 'comment', 'member', 0, 1, NULL),
('airport', 334, 'comment', 'parent_member', 0, 1, NULL),
('airport', 334, 'comment', 'registered', 0, 1, NULL),
('airport', 334, 'view', 'everyone', 0, 1, NULL),
('airport', 334, 'view', 'member', 0, 1, NULL),
('airport', 334, 'view', 'parent_member', 0, 1, NULL),
('airport', 334, 'view', 'registered', 0, 1, NULL),
('airport', 335, 'comment', 'everyone', 0, 1, NULL),
('airport', 335, 'comment', 'member', 0, 1, NULL),
('airport', 335, 'comment', 'parent_member', 0, 1, NULL),
('airport', 335, 'comment', 'registered', 0, 1, NULL),
('airport', 335, 'view', 'everyone', 0, 1, NULL),
('airport', 335, 'view', 'member', 0, 1, NULL),
('airport', 335, 'view', 'parent_member', 0, 1, NULL),
('airport', 335, 'view', 'registered', 0, 1, NULL),
('airport', 336, 'comment', 'everyone', 0, 1, NULL),
('airport', 336, 'comment', 'member', 0, 1, NULL),
('airport', 336, 'comment', 'parent_member', 0, 1, NULL),
('airport', 336, 'comment', 'registered', 0, 1, NULL),
('airport', 336, 'view', 'everyone', 0, 1, NULL),
('airport', 336, 'view', 'member', 0, 1, NULL),
('airport', 336, 'view', 'parent_member', 0, 1, NULL),
('airport', 336, 'view', 'registered', 0, 1, NULL),
('airport', 337, 'comment', 'everyone', 0, 1, NULL),
('airport', 337, 'comment', 'member', 0, 1, NULL),
('airport', 337, 'comment', 'parent_member', 0, 1, NULL),
('airport', 337, 'comment', 'registered', 0, 1, NULL),
('airport', 337, 'view', 'everyone', 0, 1, NULL),
('airport', 337, 'view', 'member', 0, 1, NULL),
('airport', 337, 'view', 'parent_member', 0, 1, NULL),
('airport', 337, 'view', 'registered', 0, 1, NULL),
('airport', 338, 'comment', 'everyone', 0, 1, NULL),
('airport', 338, 'comment', 'member', 0, 1, NULL),
('airport', 338, 'comment', 'parent_member', 0, 1, NULL),
('airport', 338, 'comment', 'registered', 0, 1, NULL),
('airport', 338, 'view', 'everyone', 0, 1, NULL),
('airport', 338, 'view', 'member', 0, 1, NULL),
('airport', 338, 'view', 'parent_member', 0, 1, NULL),
('airport', 338, 'view', 'registered', 0, 1, NULL),
('airport', 339, 'comment', 'everyone', 0, 1, NULL),
('airport', 339, 'comment', 'member', 0, 1, NULL),
('airport', 339, 'comment', 'parent_member', 0, 1, NULL),
('airport', 339, 'comment', 'registered', 0, 1, NULL),
('airport', 339, 'view', 'everyone', 0, 1, NULL),
('airport', 339, 'view', 'member', 0, 1, NULL),
('airport', 339, 'view', 'parent_member', 0, 1, NULL),
('airport', 339, 'view', 'registered', 0, 1, NULL),
('airport', 340, 'comment', 'everyone', 0, 1, NULL),
('airport', 340, 'comment', 'member', 0, 1, NULL),
('airport', 340, 'comment', 'parent_member', 0, 1, NULL),
('airport', 340, 'comment', 'registered', 0, 1, NULL),
('airport', 340, 'view', 'everyone', 0, 1, NULL),
('airport', 340, 'view', 'member', 0, 1, NULL),
('airport', 340, 'view', 'parent_member', 0, 1, NULL),
('airport', 340, 'view', 'registered', 0, 1, NULL),
('airport', 341, 'comment', 'everyone', 0, 1, NULL),
('airport', 341, 'comment', 'member', 0, 1, NULL),
('airport', 341, 'comment', 'parent_member', 0, 1, NULL),
('airport', 341, 'comment', 'registered', 0, 1, NULL),
('airport', 341, 'view', 'everyone', 0, 1, NULL),
('airport', 341, 'view', 'member', 0, 1, NULL),
('airport', 341, 'view', 'parent_member', 0, 1, NULL),
('airport', 341, 'view', 'registered', 0, 1, NULL),
('airport', 342, 'comment', 'everyone', 0, 1, NULL),
('airport', 342, 'comment', 'member', 0, 1, NULL),
('airport', 342, 'comment', 'parent_member', 0, 1, NULL),
('airport', 342, 'comment', 'registered', 0, 1, NULL),
('airport', 342, 'view', 'everyone', 0, 1, NULL),
('airport', 342, 'view', 'member', 0, 1, NULL),
('airport', 342, 'view', 'parent_member', 0, 1, NULL),
('airport', 342, 'view', 'registered', 0, 1, NULL),
('airport', 343, 'comment', 'everyone', 0, 1, NULL),
('airport', 343, 'comment', 'member', 0, 1, NULL),
('airport', 343, 'comment', 'parent_member', 0, 1, NULL),
('airport', 343, 'comment', 'registered', 0, 1, NULL),
('airport', 343, 'view', 'everyone', 0, 1, NULL),
('airport', 343, 'view', 'member', 0, 1, NULL),
('airport', 343, 'view', 'parent_member', 0, 1, NULL),
('airport', 343, 'view', 'registered', 0, 1, NULL),
('airport', 344, 'comment', 'everyone', 0, 1, NULL),
('airport', 344, 'comment', 'member', 0, 1, NULL),
('airport', 344, 'comment', 'parent_member', 0, 1, NULL),
('airport', 344, 'comment', 'registered', 0, 1, NULL),
('airport', 344, 'view', 'everyone', 0, 1, NULL),
('airport', 344, 'view', 'member', 0, 1, NULL),
('airport', 344, 'view', 'parent_member', 0, 1, NULL),
('airport', 344, 'view', 'registered', 0, 1, NULL),
('airport', 345, 'comment', 'everyone', 0, 1, NULL),
('airport', 345, 'comment', 'member', 0, 1, NULL),
('airport', 345, 'comment', 'parent_member', 0, 1, NULL),
('airport', 345, 'comment', 'registered', 0, 1, NULL),
('airport', 345, 'view', 'everyone', 0, 1, NULL),
('airport', 345, 'view', 'member', 0, 1, NULL),
('airport', 345, 'view', 'parent_member', 0, 1, NULL),
('airport', 345, 'view', 'registered', 0, 1, NULL),
('airport', 346, 'comment', 'everyone', 0, 1, NULL),
('airport', 346, 'comment', 'member', 0, 1, NULL),
('airport', 346, 'comment', 'parent_member', 0, 1, NULL),
('airport', 346, 'comment', 'registered', 0, 1, NULL),
('airport', 346, 'view', 'everyone', 0, 1, NULL),
('airport', 346, 'view', 'member', 0, 1, NULL),
('airport', 346, 'view', 'parent_member', 0, 1, NULL),
('airport', 346, 'view', 'registered', 0, 1, NULL),
('airport', 347, 'comment', 'everyone', 0, 1, NULL),
('airport', 347, 'comment', 'member', 0, 1, NULL),
('airport', 347, 'comment', 'parent_member', 0, 1, NULL),
('airport', 347, 'comment', 'registered', 0, 1, NULL),
('airport', 347, 'view', 'everyone', 0, 1, NULL),
('airport', 347, 'view', 'member', 0, 1, NULL),
('airport', 347, 'view', 'parent_member', 0, 1, NULL),
('airport', 347, 'view', 'registered', 0, 1, NULL),
('airport', 348, 'comment', 'everyone', 0, 1, NULL),
('airport', 348, 'comment', 'member', 0, 1, NULL),
('airport', 348, 'comment', 'parent_member', 0, 1, NULL),
('airport', 348, 'comment', 'registered', 0, 1, NULL),
('airport', 348, 'view', 'everyone', 0, 1, NULL),
('airport', 348, 'view', 'member', 0, 1, NULL),
('airport', 348, 'view', 'parent_member', 0, 1, NULL),
('airport', 348, 'view', 'registered', 0, 1, NULL),
('airport', 349, 'comment', 'everyone', 0, 1, NULL),
('airport', 349, 'comment', 'member', 0, 1, NULL),
('airport', 349, 'comment', 'parent_member', 0, 1, NULL),
('airport', 349, 'comment', 'registered', 0, 1, NULL),
('airport', 349, 'view', 'everyone', 0, 1, NULL),
('airport', 349, 'view', 'member', 0, 1, NULL),
('airport', 349, 'view', 'parent_member', 0, 1, NULL),
('airport', 349, 'view', 'registered', 0, 1, NULL),
('airport', 350, 'comment', 'everyone', 0, 1, NULL),
('airport', 350, 'comment', 'member', 0, 1, NULL),
('airport', 350, 'comment', 'parent_member', 0, 1, NULL),
('airport', 350, 'comment', 'registered', 0, 1, NULL),
('airport', 350, 'view', 'everyone', 0, 1, NULL),
('airport', 350, 'view', 'member', 0, 1, NULL),
('airport', 350, 'view', 'parent_member', 0, 1, NULL),
('airport', 350, 'view', 'registered', 0, 1, NULL),
('airport', 351, 'comment', 'everyone', 0, 1, NULL),
('airport', 351, 'comment', 'member', 0, 1, NULL),
('airport', 351, 'comment', 'parent_member', 0, 1, NULL),
('airport', 351, 'comment', 'registered', 0, 1, NULL),
('airport', 351, 'view', 'everyone', 0, 1, NULL),
('airport', 351, 'view', 'member', 0, 1, NULL),
('airport', 351, 'view', 'parent_member', 0, 1, NULL),
('airport', 351, 'view', 'registered', 0, 1, NULL),
('airport', 352, 'comment', 'everyone', 0, 1, NULL),
('airport', 352, 'comment', 'member', 0, 1, NULL),
('airport', 352, 'comment', 'parent_member', 0, 1, NULL),
('airport', 352, 'comment', 'registered', 0, 1, NULL),
('airport', 352, 'view', 'everyone', 0, 1, NULL),
('airport', 352, 'view', 'member', 0, 1, NULL),
('airport', 352, 'view', 'parent_member', 0, 1, NULL),
('airport', 352, 'view', 'registered', 0, 1, NULL),
('airport', 353, 'comment', 'everyone', 0, 1, NULL),
('airport', 353, 'comment', 'member', 0, 1, NULL),
('airport', 353, 'comment', 'parent_member', 0, 1, NULL),
('airport', 353, 'comment', 'registered', 0, 1, NULL),
('airport', 353, 'view', 'everyone', 0, 1, NULL),
('airport', 353, 'view', 'member', 0, 1, NULL),
('airport', 353, 'view', 'parent_member', 0, 1, NULL),
('airport', 353, 'view', 'registered', 0, 1, NULL),
('airport', 354, 'comment', 'everyone', 0, 1, NULL),
('airport', 354, 'comment', 'member', 0, 1, NULL),
('airport', 354, 'comment', 'parent_member', 0, 1, NULL),
('airport', 354, 'comment', 'registered', 0, 1, NULL),
('airport', 354, 'view', 'everyone', 0, 1, NULL),
('airport', 354, 'view', 'member', 0, 1, NULL),
('airport', 354, 'view', 'parent_member', 0, 1, NULL),
('airport', 354, 'view', 'registered', 0, 1, NULL),
('airport', 355, 'comment', 'everyone', 0, 1, NULL),
('airport', 355, 'comment', 'member', 0, 1, NULL),
('airport', 355, 'comment', 'parent_member', 0, 1, NULL),
('airport', 355, 'comment', 'registered', 0, 1, NULL),
('airport', 355, 'view', 'everyone', 0, 1, NULL),
('airport', 355, 'view', 'member', 0, 1, NULL),
('airport', 355, 'view', 'parent_member', 0, 1, NULL),
('airport', 355, 'view', 'registered', 0, 1, NULL),
('airport', 356, 'comment', 'everyone', 0, 1, NULL),
('airport', 356, 'comment', 'member', 0, 1, NULL),
('airport', 356, 'comment', 'parent_member', 0, 1, NULL),
('airport', 356, 'comment', 'registered', 0, 1, NULL),
('airport', 356, 'view', 'everyone', 0, 1, NULL),
('airport', 356, 'view', 'member', 0, 1, NULL),
('airport', 356, 'view', 'parent_member', 0, 1, NULL),
('airport', 356, 'view', 'registered', 0, 1, NULL),
('airport', 357, 'comment', 'everyone', 0, 1, NULL),
('airport', 357, 'comment', 'member', 0, 1, NULL),
('airport', 357, 'comment', 'parent_member', 0, 1, NULL),
('airport', 357, 'comment', 'registered', 0, 1, NULL),
('airport', 357, 'view', 'everyone', 0, 1, NULL),
('airport', 357, 'view', 'member', 0, 1, NULL),
('airport', 357, 'view', 'parent_member', 0, 1, NULL),
('airport', 357, 'view', 'registered', 0, 1, NULL),
('airport', 358, 'comment', 'everyone', 0, 1, NULL),
('airport', 358, 'comment', 'member', 0, 1, NULL),
('airport', 358, 'comment', 'parent_member', 0, 1, NULL),
('airport', 358, 'comment', 'registered', 0, 1, NULL),
('airport', 358, 'view', 'everyone', 0, 1, NULL),
('airport', 358, 'view', 'member', 0, 1, NULL),
('airport', 358, 'view', 'parent_member', 0, 1, NULL),
('airport', 358, 'view', 'registered', 0, 1, NULL),
('airport', 359, 'comment', 'everyone', 0, 1, NULL),
('airport', 359, 'comment', 'member', 0, 1, NULL),
('airport', 359, 'comment', 'parent_member', 0, 1, NULL),
('airport', 359, 'comment', 'registered', 0, 1, NULL),
('airport', 359, 'view', 'everyone', 0, 1, NULL),
('airport', 359, 'view', 'member', 0, 1, NULL),
('airport', 359, 'view', 'parent_member', 0, 1, NULL),
('airport', 359, 'view', 'registered', 0, 1, NULL),
('airport', 360, 'comment', 'everyone', 0, 1, NULL),
('airport', 360, 'comment', 'member', 0, 1, NULL),
('airport', 360, 'comment', 'parent_member', 0, 1, NULL),
('airport', 360, 'comment', 'registered', 0, 1, NULL),
('airport', 360, 'view', 'everyone', 0, 1, NULL),
('airport', 360, 'view', 'member', 0, 1, NULL),
('airport', 360, 'view', 'parent_member', 0, 1, NULL),
('airport', 360, 'view', 'registered', 0, 1, NULL),
('airport', 361, 'comment', 'everyone', 0, 1, NULL),
('airport', 361, 'comment', 'member', 0, 1, NULL),
('airport', 361, 'comment', 'parent_member', 0, 1, NULL),
('airport', 361, 'comment', 'registered', 0, 1, NULL),
('airport', 361, 'view', 'everyone', 0, 1, NULL),
('airport', 361, 'view', 'member', 0, 1, NULL),
('airport', 361, 'view', 'parent_member', 0, 1, NULL),
('airport', 361, 'view', 'registered', 0, 1, NULL),
('airport', 362, 'comment', 'everyone', 0, 1, NULL),
('airport', 362, 'comment', 'member', 0, 1, NULL),
('airport', 362, 'comment', 'parent_member', 0, 1, NULL),
('airport', 362, 'comment', 'registered', 0, 1, NULL),
('airport', 362, 'view', 'everyone', 0, 1, NULL),
('airport', 362, 'view', 'member', 0, 1, NULL),
('airport', 362, 'view', 'parent_member', 0, 1, NULL),
('airport', 362, 'view', 'registered', 0, 1, NULL),
('airport', 363, 'comment', 'everyone', 0, 1, NULL),
('airport', 363, 'comment', 'member', 0, 1, NULL),
('airport', 363, 'comment', 'parent_member', 0, 1, NULL),
('airport', 363, 'comment', 'registered', 0, 1, NULL),
('airport', 363, 'view', 'everyone', 0, 1, NULL),
('airport', 363, 'view', 'member', 0, 1, NULL),
('airport', 363, 'view', 'parent_member', 0, 1, NULL),
('airport', 363, 'view', 'registered', 0, 1, NULL),
('airport', 364, 'comment', 'everyone', 0, 1, NULL),
('airport', 364, 'comment', 'member', 0, 1, NULL),
('airport', 364, 'comment', 'parent_member', 0, 1, NULL),
('airport', 364, 'comment', 'registered', 0, 1, NULL),
('airport', 364, 'view', 'everyone', 0, 1, NULL),
('airport', 364, 'view', 'member', 0, 1, NULL),
('airport', 364, 'view', 'parent_member', 0, 1, NULL),
('airport', 364, 'view', 'registered', 0, 1, NULL),
('airport', 365, 'comment', 'everyone', 0, 1, NULL),
('airport', 365, 'comment', 'member', 0, 1, NULL),
('airport', 365, 'comment', 'parent_member', 0, 1, NULL),
('airport', 365, 'comment', 'registered', 0, 1, NULL),
('airport', 365, 'view', 'everyone', 0, 1, NULL),
('airport', 365, 'view', 'member', 0, 1, NULL),
('airport', 365, 'view', 'parent_member', 0, 1, NULL),
('airport', 365, 'view', 'registered', 0, 1, NULL),
('airport', 366, 'comment', 'everyone', 0, 1, NULL),
('airport', 366, 'comment', 'member', 0, 1, NULL),
('airport', 366, 'comment', 'parent_member', 0, 1, NULL),
('airport', 366, 'comment', 'registered', 0, 1, NULL),
('airport', 366, 'view', 'everyone', 0, 1, NULL),
('airport', 366, 'view', 'member', 0, 1, NULL),
('airport', 366, 'view', 'parent_member', 0, 1, NULL),
('airport', 366, 'view', 'registered', 0, 1, NULL),
('airport', 367, 'comment', 'everyone', 0, 1, NULL),
('airport', 367, 'comment', 'member', 0, 1, NULL),
('airport', 367, 'comment', 'parent_member', 0, 1, NULL),
('airport', 367, 'comment', 'registered', 0, 1, NULL),
('airport', 367, 'view', 'everyone', 0, 1, NULL),
('airport', 367, 'view', 'member', 0, 1, NULL),
('airport', 367, 'view', 'parent_member', 0, 1, NULL),
('airport', 367, 'view', 'registered', 0, 1, NULL),
('airport', 368, 'comment', 'everyone', 0, 1, NULL),
('airport', 368, 'comment', 'member', 0, 1, NULL),
('airport', 368, 'comment', 'parent_member', 0, 1, NULL),
('airport', 368, 'comment', 'registered', 0, 1, NULL),
('airport', 368, 'view', 'everyone', 0, 1, NULL),
('airport', 368, 'view', 'member', 0, 1, NULL),
('airport', 368, 'view', 'parent_member', 0, 1, NULL),
('airport', 368, 'view', 'registered', 0, 1, NULL),
('airport', 369, 'comment', 'everyone', 0, 1, NULL),
('airport', 369, 'comment', 'member', 0, 1, NULL),
('airport', 369, 'comment', 'parent_member', 0, 1, NULL),
('airport', 369, 'comment', 'registered', 0, 1, NULL),
('airport', 369, 'view', 'everyone', 0, 1, NULL),
('airport', 369, 'view', 'member', 0, 1, NULL),
('airport', 369, 'view', 'parent_member', 0, 1, NULL),
('airport', 369, 'view', 'registered', 0, 1, NULL),
('airport', 370, 'comment', 'everyone', 0, 1, NULL),
('airport', 370, 'comment', 'member', 0, 1, NULL),
('airport', 370, 'comment', 'parent_member', 0, 1, NULL),
('airport', 370, 'comment', 'registered', 0, 1, NULL),
('airport', 370, 'view', 'everyone', 0, 1, NULL),
('airport', 370, 'view', 'member', 0, 1, NULL),
('airport', 370, 'view', 'parent_member', 0, 1, NULL),
('airport', 370, 'view', 'registered', 0, 1, NULL),
('airport', 371, 'comment', 'everyone', 0, 1, NULL),
('airport', 371, 'comment', 'member', 0, 1, NULL),
('airport', 371, 'comment', 'parent_member', 0, 1, NULL);
INSERT INTO `engine4_authorization_allow` (`resource_type`, `resource_id`, `action`, `role`, `role_id`, `value`, `params`) VALUES
('airport', 371, 'comment', 'registered', 0, 1, NULL),
('airport', 371, 'view', 'everyone', 0, 1, NULL),
('airport', 371, 'view', 'member', 0, 1, NULL),
('airport', 371, 'view', 'parent_member', 0, 1, NULL),
('airport', 371, 'view', 'registered', 0, 1, NULL),
('airport', 372, 'comment', 'everyone', 0, 1, NULL),
('airport', 372, 'comment', 'member', 0, 1, NULL),
('airport', 372, 'comment', 'parent_member', 0, 1, NULL),
('airport', 372, 'comment', 'registered', 0, 1, NULL),
('airport', 372, 'view', 'everyone', 0, 1, NULL),
('airport', 372, 'view', 'member', 0, 1, NULL),
('airport', 372, 'view', 'parent_member', 0, 1, NULL),
('airport', 372, 'view', 'registered', 0, 1, NULL),
('airport', 373, 'comment', 'everyone', 0, 1, NULL),
('airport', 373, 'comment', 'member', 0, 1, NULL),
('airport', 373, 'comment', 'parent_member', 0, 1, NULL),
('airport', 373, 'comment', 'registered', 0, 1, NULL),
('airport', 373, 'view', 'everyone', 0, 1, NULL),
('airport', 373, 'view', 'member', 0, 1, NULL),
('airport', 373, 'view', 'parent_member', 0, 1, NULL),
('airport', 373, 'view', 'registered', 0, 1, NULL),
('airport', 374, 'comment', 'everyone', 0, 1, NULL),
('airport', 374, 'comment', 'member', 0, 1, NULL),
('airport', 374, 'comment', 'parent_member', 0, 1, NULL),
('airport', 374, 'comment', 'registered', 0, 1, NULL),
('airport', 374, 'view', 'everyone', 0, 1, NULL),
('airport', 374, 'view', 'member', 0, 1, NULL),
('airport', 374, 'view', 'parent_member', 0, 1, NULL),
('airport', 374, 'view', 'registered', 0, 1, NULL),
('airport', 375, 'comment', 'everyone', 0, 1, NULL),
('airport', 375, 'comment', 'member', 0, 1, NULL),
('airport', 375, 'comment', 'parent_member', 0, 1, NULL),
('airport', 375, 'comment', 'registered', 0, 1, NULL),
('airport', 375, 'view', 'everyone', 0, 1, NULL),
('airport', 375, 'view', 'member', 0, 1, NULL),
('airport', 375, 'view', 'parent_member', 0, 1, NULL),
('airport', 375, 'view', 'registered', 0, 1, NULL),
('airport', 376, 'comment', 'everyone', 0, 1, NULL),
('airport', 376, 'comment', 'member', 0, 1, NULL),
('airport', 376, 'comment', 'parent_member', 0, 1, NULL),
('airport', 376, 'comment', 'registered', 0, 1, NULL),
('airport', 376, 'view', 'everyone', 0, 1, NULL),
('airport', 376, 'view', 'member', 0, 1, NULL),
('airport', 376, 'view', 'parent_member', 0, 1, NULL),
('airport', 376, 'view', 'registered', 0, 1, NULL),
('airport', 377, 'comment', 'everyone', 0, 1, NULL),
('airport', 377, 'comment', 'member', 0, 1, NULL),
('airport', 377, 'comment', 'parent_member', 0, 1, NULL),
('airport', 377, 'comment', 'registered', 0, 1, NULL),
('airport', 377, 'view', 'everyone', 0, 1, NULL),
('airport', 377, 'view', 'member', 0, 1, NULL),
('airport', 377, 'view', 'parent_member', 0, 1, NULL),
('airport', 377, 'view', 'registered', 0, 1, NULL),
('airport', 378, 'comment', 'everyone', 0, 1, NULL),
('airport', 378, 'comment', 'member', 0, 1, NULL),
('airport', 378, 'comment', 'parent_member', 0, 1, NULL),
('airport', 378, 'comment', 'registered', 0, 1, NULL),
('airport', 378, 'view', 'everyone', 0, 1, NULL),
('airport', 378, 'view', 'member', 0, 1, NULL),
('airport', 378, 'view', 'parent_member', 0, 1, NULL),
('airport', 378, 'view', 'registered', 0, 1, NULL),
('airport', 379, 'comment', 'everyone', 0, 1, NULL),
('airport', 379, 'comment', 'member', 0, 1, NULL),
('airport', 379, 'comment', 'parent_member', 0, 1, NULL),
('airport', 379, 'comment', 'registered', 0, 1, NULL),
('airport', 379, 'view', 'everyone', 0, 1, NULL),
('airport', 379, 'view', 'member', 0, 1, NULL),
('airport', 379, 'view', 'parent_member', 0, 1, NULL),
('airport', 379, 'view', 'registered', 0, 1, NULL),
('airport', 380, 'comment', 'everyone', 0, 1, NULL),
('airport', 380, 'comment', 'member', 0, 1, NULL),
('airport', 380, 'comment', 'parent_member', 0, 1, NULL),
('airport', 380, 'comment', 'registered', 0, 1, NULL),
('airport', 380, 'view', 'everyone', 0, 1, NULL),
('airport', 380, 'view', 'member', 0, 1, NULL),
('airport', 380, 'view', 'parent_member', 0, 1, NULL),
('airport', 380, 'view', 'registered', 0, 1, NULL),
('airport', 381, 'comment', 'everyone', 0, 1, NULL),
('airport', 381, 'comment', 'member', 0, 1, NULL),
('airport', 381, 'comment', 'parent_member', 0, 1, NULL),
('airport', 381, 'comment', 'registered', 0, 1, NULL),
('airport', 381, 'view', 'everyone', 0, 1, NULL),
('airport', 381, 'view', 'member', 0, 1, NULL),
('airport', 381, 'view', 'parent_member', 0, 1, NULL),
('airport', 381, 'view', 'registered', 0, 1, NULL),
('airport', 382, 'comment', 'everyone', 0, 1, NULL),
('airport', 382, 'comment', 'member', 0, 1, NULL),
('airport', 382, 'comment', 'parent_member', 0, 1, NULL),
('airport', 382, 'comment', 'registered', 0, 1, NULL),
('airport', 382, 'view', 'everyone', 0, 1, NULL),
('airport', 382, 'view', 'member', 0, 1, NULL),
('airport', 382, 'view', 'parent_member', 0, 1, NULL),
('airport', 382, 'view', 'registered', 0, 1, NULL),
('airport', 383, 'comment', 'everyone', 0, 1, NULL),
('airport', 383, 'comment', 'member', 0, 1, NULL),
('airport', 383, 'comment', 'parent_member', 0, 1, NULL),
('airport', 383, 'comment', 'registered', 0, 1, NULL),
('airport', 383, 'view', 'everyone', 0, 1, NULL),
('airport', 383, 'view', 'member', 0, 1, NULL),
('airport', 383, 'view', 'parent_member', 0, 1, NULL),
('airport', 383, 'view', 'registered', 0, 1, NULL),
('airport', 384, 'comment', 'everyone', 0, 1, NULL),
('airport', 384, 'comment', 'member', 0, 1, NULL),
('airport', 384, 'comment', 'parent_member', 0, 1, NULL),
('airport', 384, 'comment', 'registered', 0, 1, NULL),
('airport', 384, 'view', 'everyone', 0, 1, NULL),
('airport', 384, 'view', 'member', 0, 1, NULL),
('airport', 384, 'view', 'parent_member', 0, 1, NULL),
('airport', 384, 'view', 'registered', 0, 1, NULL),
('airport', 385, 'comment', 'everyone', 0, 1, NULL),
('airport', 385, 'comment', 'member', 0, 1, NULL),
('airport', 385, 'comment', 'parent_member', 0, 1, NULL),
('airport', 385, 'comment', 'registered', 0, 1, NULL),
('airport', 385, 'view', 'everyone', 0, 1, NULL),
('airport', 385, 'view', 'member', 0, 1, NULL),
('airport', 385, 'view', 'parent_member', 0, 1, NULL),
('airport', 385, 'view', 'registered', 0, 1, NULL),
('airport', 386, 'comment', 'everyone', 0, 1, NULL),
('airport', 386, 'comment', 'member', 0, 1, NULL),
('airport', 386, 'comment', 'parent_member', 0, 1, NULL),
('airport', 386, 'comment', 'registered', 0, 1, NULL),
('airport', 386, 'view', 'everyone', 0, 1, NULL),
('airport', 386, 'view', 'member', 0, 1, NULL),
('airport', 386, 'view', 'parent_member', 0, 1, NULL),
('airport', 386, 'view', 'registered', 0, 1, NULL),
('airport', 387, 'comment', 'everyone', 0, 1, NULL),
('airport', 387, 'comment', 'member', 0, 1, NULL),
('airport', 387, 'comment', 'parent_member', 0, 1, NULL),
('airport', 387, 'comment', 'registered', 0, 1, NULL),
('airport', 387, 'view', 'everyone', 0, 1, NULL),
('airport', 387, 'view', 'member', 0, 1, NULL),
('airport', 387, 'view', 'parent_member', 0, 1, NULL),
('airport', 387, 'view', 'registered', 0, 1, NULL),
('airport', 388, 'comment', 'everyone', 0, 1, NULL),
('airport', 388, 'comment', 'member', 0, 1, NULL),
('airport', 388, 'comment', 'parent_member', 0, 1, NULL),
('airport', 388, 'comment', 'registered', 0, 1, NULL),
('airport', 388, 'view', 'everyone', 0, 1, NULL),
('airport', 388, 'view', 'member', 0, 1, NULL),
('airport', 388, 'view', 'parent_member', 0, 1, NULL),
('airport', 388, 'view', 'registered', 0, 1, NULL),
('airport', 389, 'comment', 'everyone', 0, 1, NULL),
('airport', 389, 'comment', 'member', 0, 1, NULL),
('airport', 389, 'comment', 'parent_member', 0, 1, NULL),
('airport', 389, 'comment', 'registered', 0, 1, NULL),
('airport', 389, 'view', 'everyone', 0, 1, NULL),
('airport', 389, 'view', 'member', 0, 1, NULL),
('airport', 389, 'view', 'parent_member', 0, 1, NULL),
('airport', 389, 'view', 'registered', 0, 1, NULL),
('airport', 390, 'comment', 'everyone', 0, 1, NULL),
('airport', 390, 'comment', 'member', 0, 1, NULL),
('airport', 390, 'comment', 'parent_member', 0, 1, NULL),
('airport', 390, 'comment', 'registered', 0, 1, NULL),
('airport', 390, 'view', 'everyone', 0, 1, NULL),
('airport', 390, 'view', 'member', 0, 1, NULL),
('airport', 390, 'view', 'parent_member', 0, 1, NULL),
('airport', 390, 'view', 'registered', 0, 1, NULL),
('airport', 391, 'comment', 'everyone', 0, 1, NULL),
('airport', 391, 'comment', 'member', 0, 1, NULL),
('airport', 391, 'comment', 'parent_member', 0, 1, NULL),
('airport', 391, 'comment', 'registered', 0, 1, NULL),
('airport', 391, 'view', 'everyone', 0, 1, NULL),
('airport', 391, 'view', 'member', 0, 1, NULL),
('airport', 391, 'view', 'parent_member', 0, 1, NULL),
('airport', 391, 'view', 'registered', 0, 1, NULL),
('airport', 392, 'comment', 'everyone', 0, 1, NULL),
('airport', 392, 'comment', 'member', 0, 1, NULL),
('airport', 392, 'comment', 'parent_member', 0, 1, NULL),
('airport', 392, 'comment', 'registered', 0, 1, NULL),
('airport', 392, 'view', 'everyone', 0, 1, NULL),
('airport', 392, 'view', 'member', 0, 1, NULL),
('airport', 392, 'view', 'parent_member', 0, 1, NULL),
('airport', 392, 'view', 'registered', 0, 1, NULL),
('airport', 393, 'comment', 'everyone', 0, 1, NULL),
('airport', 393, 'comment', 'member', 0, 1, NULL),
('airport', 393, 'comment', 'parent_member', 0, 1, NULL),
('airport', 393, 'comment', 'registered', 0, 1, NULL),
('airport', 393, 'view', 'everyone', 0, 1, NULL),
('airport', 393, 'view', 'member', 0, 1, NULL),
('airport', 393, 'view', 'parent_member', 0, 1, NULL),
('airport', 393, 'view', 'registered', 0, 1, NULL),
('airport', 394, 'comment', 'everyone', 0, 1, NULL),
('airport', 394, 'comment', 'member', 0, 1, NULL),
('airport', 394, 'comment', 'parent_member', 0, 1, NULL),
('airport', 394, 'comment', 'registered', 0, 1, NULL),
('airport', 394, 'view', 'everyone', 0, 1, NULL),
('airport', 394, 'view', 'member', 0, 1, NULL),
('airport', 394, 'view', 'parent_member', 0, 1, NULL),
('airport', 394, 'view', 'registered', 0, 1, NULL),
('airport', 395, 'comment', 'everyone', 0, 1, NULL),
('airport', 395, 'comment', 'member', 0, 1, NULL),
('airport', 395, 'comment', 'parent_member', 0, 1, NULL),
('airport', 395, 'comment', 'registered', 0, 1, NULL),
('airport', 395, 'view', 'everyone', 0, 1, NULL),
('airport', 395, 'view', 'member', 0, 1, NULL),
('airport', 395, 'view', 'parent_member', 0, 1, NULL),
('airport', 395, 'view', 'registered', 0, 1, NULL),
('airport', 396, 'comment', 'everyone', 0, 1, NULL),
('airport', 396, 'comment', 'member', 0, 1, NULL),
('airport', 396, 'comment', 'parent_member', 0, 1, NULL),
('airport', 396, 'comment', 'registered', 0, 1, NULL),
('airport', 396, 'view', 'everyone', 0, 1, NULL),
('airport', 396, 'view', 'member', 0, 1, NULL),
('airport', 396, 'view', 'parent_member', 0, 1, NULL),
('airport', 396, 'view', 'registered', 0, 1, NULL),
('airport', 397, 'comment', 'everyone', 0, 1, NULL),
('airport', 397, 'comment', 'member', 0, 1, NULL),
('airport', 397, 'comment', 'parent_member', 0, 1, NULL),
('airport', 397, 'comment', 'registered', 0, 1, NULL),
('airport', 397, 'view', 'everyone', 0, 1, NULL),
('airport', 397, 'view', 'member', 0, 1, NULL),
('airport', 397, 'view', 'parent_member', 0, 1, NULL),
('airport', 397, 'view', 'registered', 0, 1, NULL),
('airport', 398, 'comment', 'everyone', 0, 1, NULL),
('airport', 398, 'comment', 'member', 0, 1, NULL),
('airport', 398, 'comment', 'parent_member', 0, 1, NULL),
('airport', 398, 'comment', 'registered', 0, 1, NULL),
('airport', 398, 'view', 'everyone', 0, 1, NULL),
('airport', 398, 'view', 'member', 0, 1, NULL),
('airport', 398, 'view', 'parent_member', 0, 1, NULL),
('airport', 398, 'view', 'registered', 0, 1, NULL),
('airport', 399, 'comment', 'everyone', 0, 1, NULL),
('airport', 399, 'comment', 'member', 0, 1, NULL),
('airport', 399, 'comment', 'parent_member', 0, 1, NULL),
('airport', 399, 'comment', 'registered', 0, 1, NULL),
('airport', 399, 'view', 'everyone', 0, 1, NULL),
('airport', 399, 'view', 'member', 0, 1, NULL),
('airport', 399, 'view', 'parent_member', 0, 1, NULL),
('airport', 399, 'view', 'registered', 0, 1, NULL),
('airport', 400, 'comment', 'everyone', 0, 1, NULL),
('airport', 400, 'comment', 'member', 0, 1, NULL),
('airport', 400, 'comment', 'parent_member', 0, 1, NULL),
('airport', 400, 'comment', 'registered', 0, 1, NULL),
('airport', 400, 'view', 'everyone', 0, 1, NULL),
('airport', 400, 'view', 'member', 0, 1, NULL),
('airport', 400, 'view', 'parent_member', 0, 1, NULL),
('airport', 400, 'view', 'registered', 0, 1, NULL),
('airport', 401, 'comment', 'everyone', 0, 1, NULL),
('airport', 401, 'comment', 'member', 0, 1, NULL),
('airport', 401, 'comment', 'parent_member', 0, 1, NULL),
('airport', 401, 'comment', 'registered', 0, 1, NULL),
('airport', 401, 'view', 'everyone', 0, 1, NULL),
('airport', 401, 'view', 'member', 0, 1, NULL),
('airport', 401, 'view', 'parent_member', 0, 1, NULL),
('airport', 401, 'view', 'registered', 0, 1, NULL),
('airport', 402, 'comment', 'everyone', 0, 1, NULL),
('airport', 402, 'comment', 'member', 0, 1, NULL),
('airport', 402, 'comment', 'parent_member', 0, 1, NULL),
('airport', 402, 'comment', 'registered', 0, 1, NULL),
('airport', 402, 'view', 'everyone', 0, 1, NULL),
('airport', 402, 'view', 'member', 0, 1, NULL),
('airport', 402, 'view', 'parent_member', 0, 1, NULL),
('airport', 402, 'view', 'registered', 0, 1, NULL),
('airport', 403, 'comment', 'everyone', 0, 1, NULL),
('airport', 403, 'comment', 'member', 0, 1, NULL),
('airport', 403, 'comment', 'parent_member', 0, 1, NULL),
('airport', 403, 'comment', 'registered', 0, 1, NULL),
('airport', 403, 'view', 'everyone', 0, 1, NULL),
('airport', 403, 'view', 'member', 0, 1, NULL),
('airport', 403, 'view', 'parent_member', 0, 1, NULL),
('airport', 403, 'view', 'registered', 0, 1, NULL),
('airport', 404, 'comment', 'everyone', 0, 1, NULL),
('airport', 404, 'comment', 'member', 0, 1, NULL),
('airport', 404, 'comment', 'parent_member', 0, 1, NULL),
('airport', 404, 'comment', 'registered', 0, 1, NULL),
('airport', 404, 'view', 'everyone', 0, 1, NULL),
('airport', 404, 'view', 'member', 0, 1, NULL),
('airport', 404, 'view', 'parent_member', 0, 1, NULL),
('airport', 404, 'view', 'registered', 0, 1, NULL),
('airport', 405, 'comment', 'everyone', 0, 1, NULL),
('airport', 405, 'comment', 'member', 0, 1, NULL),
('airport', 405, 'comment', 'parent_member', 0, 1, NULL),
('airport', 405, 'comment', 'registered', 0, 1, NULL),
('airport', 405, 'view', 'everyone', 0, 1, NULL),
('airport', 405, 'view', 'member', 0, 1, NULL),
('airport', 405, 'view', 'parent_member', 0, 1, NULL),
('airport', 405, 'view', 'registered', 0, 1, NULL),
('airport', 406, 'comment', 'everyone', 0, 1, NULL),
('airport', 406, 'comment', 'member', 0, 1, NULL),
('airport', 406, 'comment', 'parent_member', 0, 1, NULL),
('airport', 406, 'comment', 'registered', 0, 1, NULL),
('airport', 406, 'view', 'everyone', 0, 1, NULL),
('airport', 406, 'view', 'member', 0, 1, NULL),
('airport', 406, 'view', 'parent_member', 0, 1, NULL),
('airport', 406, 'view', 'registered', 0, 1, NULL),
('airport', 407, 'comment', 'everyone', 0, 1, NULL),
('airport', 407, 'comment', 'member', 0, 1, NULL),
('airport', 407, 'comment', 'parent_member', 0, 1, NULL),
('airport', 407, 'comment', 'registered', 0, 1, NULL),
('airport', 407, 'view', 'everyone', 0, 1, NULL),
('airport', 407, 'view', 'member', 0, 1, NULL),
('airport', 407, 'view', 'parent_member', 0, 1, NULL),
('airport', 407, 'view', 'registered', 0, 1, NULL),
('airport', 408, 'comment', 'everyone', 0, 1, NULL),
('airport', 408, 'comment', 'member', 0, 1, NULL),
('airport', 408, 'comment', 'parent_member', 0, 1, NULL),
('airport', 408, 'comment', 'registered', 0, 1, NULL),
('airport', 408, 'view', 'everyone', 0, 1, NULL),
('airport', 408, 'view', 'member', 0, 1, NULL),
('airport', 408, 'view', 'parent_member', 0, 1, NULL),
('airport', 408, 'view', 'registered', 0, 1, NULL),
('airport', 409, 'comment', 'everyone', 0, 1, NULL),
('airport', 409, 'comment', 'member', 0, 1, NULL),
('airport', 409, 'comment', 'parent_member', 0, 1, NULL),
('airport', 409, 'comment', 'registered', 0, 1, NULL),
('airport', 409, 'view', 'everyone', 0, 1, NULL),
('airport', 409, 'view', 'member', 0, 1, NULL),
('airport', 409, 'view', 'parent_member', 0, 1, NULL),
('airport', 409, 'view', 'registered', 0, 1, NULL),
('airport', 410, 'comment', 'everyone', 0, 1, NULL),
('airport', 410, 'comment', 'member', 0, 1, NULL),
('airport', 410, 'comment', 'parent_member', 0, 1, NULL),
('airport', 410, 'comment', 'registered', 0, 1, NULL),
('airport', 410, 'view', 'everyone', 0, 1, NULL),
('airport', 410, 'view', 'member', 0, 1, NULL),
('airport', 410, 'view', 'parent_member', 0, 1, NULL),
('airport', 410, 'view', 'registered', 0, 1, NULL),
('airport', 411, 'comment', 'everyone', 0, 1, NULL),
('airport', 411, 'comment', 'member', 0, 1, NULL),
('airport', 411, 'comment', 'parent_member', 0, 1, NULL),
('airport', 411, 'comment', 'registered', 0, 1, NULL),
('airport', 411, 'view', 'everyone', 0, 1, NULL),
('airport', 411, 'view', 'member', 0, 1, NULL),
('airport', 411, 'view', 'parent_member', 0, 1, NULL),
('airport', 411, 'view', 'registered', 0, 1, NULL),
('airport', 412, 'comment', 'everyone', 0, 1, NULL),
('airport', 412, 'comment', 'member', 0, 1, NULL),
('airport', 412, 'comment', 'parent_member', 0, 1, NULL),
('airport', 412, 'comment', 'registered', 0, 1, NULL),
('airport', 412, 'view', 'everyone', 0, 1, NULL),
('airport', 412, 'view', 'member', 0, 1, NULL),
('airport', 412, 'view', 'parent_member', 0, 1, NULL),
('airport', 412, 'view', 'registered', 0, 1, NULL),
('airport', 413, 'comment', 'everyone', 0, 1, NULL),
('airport', 413, 'comment', 'member', 0, 1, NULL),
('airport', 413, 'comment', 'parent_member', 0, 1, NULL),
('airport', 413, 'comment', 'registered', 0, 1, NULL),
('airport', 413, 'view', 'everyone', 0, 1, NULL),
('airport', 413, 'view', 'member', 0, 1, NULL),
('airport', 413, 'view', 'parent_member', 0, 1, NULL),
('airport', 413, 'view', 'registered', 0, 1, NULL),
('airport', 414, 'comment', 'everyone', 0, 1, NULL),
('airport', 414, 'comment', 'member', 0, 1, NULL),
('airport', 414, 'comment', 'parent_member', 0, 1, NULL),
('airport', 414, 'comment', 'registered', 0, 1, NULL),
('airport', 414, 'view', 'everyone', 0, 1, NULL),
('airport', 414, 'view', 'member', 0, 1, NULL),
('airport', 414, 'view', 'parent_member', 0, 1, NULL),
('airport', 414, 'view', 'registered', 0, 1, NULL),
('airport', 415, 'comment', 'everyone', 0, 1, NULL),
('airport', 415, 'comment', 'member', 0, 1, NULL),
('airport', 415, 'comment', 'parent_member', 0, 1, NULL),
('airport', 415, 'comment', 'registered', 0, 1, NULL),
('airport', 415, 'view', 'everyone', 0, 1, NULL),
('airport', 415, 'view', 'member', 0, 1, NULL),
('airport', 415, 'view', 'parent_member', 0, 1, NULL),
('airport', 415, 'view', 'registered', 0, 1, NULL),
('airport', 416, 'comment', 'everyone', 0, 1, NULL),
('airport', 416, 'comment', 'member', 0, 1, NULL),
('airport', 416, 'comment', 'parent_member', 0, 1, NULL),
('airport', 416, 'comment', 'registered', 0, 1, NULL),
('airport', 416, 'view', 'everyone', 0, 1, NULL),
('airport', 416, 'view', 'member', 0, 1, NULL),
('airport', 416, 'view', 'parent_member', 0, 1, NULL),
('airport', 416, 'view', 'registered', 0, 1, NULL),
('airport', 417, 'comment', 'everyone', 0, 1, NULL),
('airport', 417, 'comment', 'member', 0, 1, NULL),
('airport', 417, 'comment', 'parent_member', 0, 1, NULL),
('airport', 417, 'comment', 'registered', 0, 1, NULL),
('airport', 417, 'view', 'everyone', 0, 1, NULL),
('airport', 417, 'view', 'member', 0, 1, NULL),
('airport', 417, 'view', 'parent_member', 0, 1, NULL),
('airport', 417, 'view', 'registered', 0, 1, NULL),
('airport', 418, 'comment', 'everyone', 0, 1, NULL),
('airport', 418, 'comment', 'member', 0, 1, NULL),
('airport', 418, 'comment', 'parent_member', 0, 1, NULL),
('airport', 418, 'comment', 'registered', 0, 1, NULL),
('airport', 418, 'view', 'everyone', 0, 1, NULL),
('airport', 418, 'view', 'member', 0, 1, NULL),
('airport', 418, 'view', 'parent_member', 0, 1, NULL),
('airport', 418, 'view', 'registered', 0, 1, NULL),
('airport', 419, 'comment', 'everyone', 0, 1, NULL),
('airport', 419, 'comment', 'member', 0, 1, NULL),
('airport', 419, 'comment', 'parent_member', 0, 1, NULL),
('airport', 419, 'comment', 'registered', 0, 1, NULL),
('airport', 419, 'view', 'everyone', 0, 1, NULL),
('airport', 419, 'view', 'member', 0, 1, NULL),
('airport', 419, 'view', 'parent_member', 0, 1, NULL),
('airport', 419, 'view', 'registered', 0, 1, NULL),
('airport', 420, 'comment', 'everyone', 0, 1, NULL),
('airport', 420, 'comment', 'member', 0, 1, NULL),
('airport', 420, 'comment', 'parent_member', 0, 1, NULL),
('airport', 420, 'comment', 'registered', 0, 1, NULL),
('airport', 420, 'view', 'everyone', 0, 1, NULL),
('airport', 420, 'view', 'member', 0, 1, NULL),
('airport', 420, 'view', 'parent_member', 0, 1, NULL),
('airport', 420, 'view', 'registered', 0, 1, NULL),
('airport', 421, 'comment', 'everyone', 0, 1, NULL),
('airport', 421, 'comment', 'member', 0, 1, NULL),
('airport', 421, 'comment', 'parent_member', 0, 1, NULL),
('airport', 421, 'comment', 'registered', 0, 1, NULL),
('airport', 421, 'view', 'everyone', 0, 1, NULL),
('airport', 421, 'view', 'member', 0, 1, NULL),
('airport', 421, 'view', 'parent_member', 0, 1, NULL),
('airport', 421, 'view', 'registered', 0, 1, NULL),
('airport', 422, 'comment', 'everyone', 0, 1, NULL),
('airport', 422, 'comment', 'member', 0, 1, NULL),
('airport', 422, 'comment', 'parent_member', 0, 1, NULL),
('airport', 422, 'comment', 'registered', 0, 1, NULL),
('airport', 422, 'view', 'everyone', 0, 1, NULL),
('airport', 422, 'view', 'member', 0, 1, NULL),
('airport', 422, 'view', 'parent_member', 0, 1, NULL),
('airport', 422, 'view', 'registered', 0, 1, NULL),
('airport', 423, 'comment', 'everyone', 0, 1, NULL),
('airport', 423, 'comment', 'member', 0, 1, NULL),
('airport', 423, 'comment', 'parent_member', 0, 1, NULL),
('airport', 423, 'comment', 'registered', 0, 1, NULL),
('airport', 423, 'view', 'everyone', 0, 1, NULL),
('airport', 423, 'view', 'member', 0, 1, NULL),
('airport', 423, 'view', 'parent_member', 0, 1, NULL),
('airport', 423, 'view', 'registered', 0, 1, NULL),
('airport', 424, 'comment', 'everyone', 0, 1, NULL),
('airport', 424, 'comment', 'member', 0, 1, NULL),
('airport', 424, 'comment', 'parent_member', 0, 1, NULL),
('airport', 424, 'comment', 'registered', 0, 1, NULL),
('airport', 424, 'view', 'everyone', 0, 1, NULL),
('airport', 424, 'view', 'member', 0, 1, NULL),
('airport', 424, 'view', 'parent_member', 0, 1, NULL),
('airport', 424, 'view', 'registered', 0, 1, NULL),
('airport', 425, 'comment', 'everyone', 0, 1, NULL),
('airport', 425, 'comment', 'member', 0, 1, NULL),
('airport', 425, 'comment', 'parent_member', 0, 1, NULL),
('airport', 425, 'comment', 'registered', 0, 1, NULL),
('airport', 425, 'view', 'everyone', 0, 1, NULL),
('airport', 425, 'view', 'member', 0, 1, NULL),
('airport', 425, 'view', 'parent_member', 0, 1, NULL),
('airport', 425, 'view', 'registered', 0, 1, NULL),
('airport', 426, 'comment', 'everyone', 0, 1, NULL),
('airport', 426, 'comment', 'member', 0, 1, NULL),
('airport', 426, 'comment', 'parent_member', 0, 1, NULL),
('airport', 426, 'comment', 'registered', 0, 1, NULL),
('airport', 426, 'view', 'everyone', 0, 1, NULL),
('airport', 426, 'view', 'member', 0, 1, NULL),
('airport', 426, 'view', 'parent_member', 0, 1, NULL),
('airport', 426, 'view', 'registered', 0, 1, NULL),
('airport', 427, 'comment', 'everyone', 0, 1, NULL),
('airport', 427, 'comment', 'member', 0, 1, NULL),
('airport', 427, 'comment', 'parent_member', 0, 1, NULL),
('airport', 427, 'comment', 'registered', 0, 1, NULL),
('airport', 427, 'view', 'everyone', 0, 1, NULL),
('airport', 427, 'view', 'member', 0, 1, NULL),
('airport', 427, 'view', 'parent_member', 0, 1, NULL),
('airport', 427, 'view', 'registered', 0, 1, NULL),
('airport', 428, 'comment', 'everyone', 0, 1, NULL),
('airport', 428, 'comment', 'member', 0, 1, NULL),
('airport', 428, 'comment', 'parent_member', 0, 1, NULL),
('airport', 428, 'comment', 'registered', 0, 1, NULL),
('airport', 428, 'view', 'everyone', 0, 1, NULL),
('airport', 428, 'view', 'member', 0, 1, NULL),
('airport', 428, 'view', 'parent_member', 0, 1, NULL),
('airport', 428, 'view', 'registered', 0, 1, NULL),
('airport', 429, 'comment', 'everyone', 0, 1, NULL),
('airport', 429, 'comment', 'member', 0, 1, NULL),
('airport', 429, 'comment', 'parent_member', 0, 1, NULL),
('airport', 429, 'comment', 'registered', 0, 1, NULL),
('airport', 429, 'view', 'everyone', 0, 1, NULL),
('airport', 429, 'view', 'member', 0, 1, NULL),
('airport', 429, 'view', 'parent_member', 0, 1, NULL),
('airport', 429, 'view', 'registered', 0, 1, NULL),
('airport', 430, 'comment', 'everyone', 0, 1, NULL),
('airport', 430, 'comment', 'member', 0, 1, NULL),
('airport', 430, 'comment', 'parent_member', 0, 1, NULL),
('airport', 430, 'comment', 'registered', 0, 1, NULL),
('airport', 430, 'view', 'everyone', 0, 1, NULL),
('airport', 430, 'view', 'member', 0, 1, NULL),
('airport', 430, 'view', 'parent_member', 0, 1, NULL),
('airport', 430, 'view', 'registered', 0, 1, NULL),
('airport', 431, 'comment', 'everyone', 0, 1, NULL),
('airport', 431, 'comment', 'member', 0, 1, NULL),
('airport', 431, 'comment', 'parent_member', 0, 1, NULL),
('airport', 431, 'comment', 'registered', 0, 1, NULL),
('airport', 431, 'view', 'everyone', 0, 1, NULL),
('airport', 431, 'view', 'member', 0, 1, NULL),
('airport', 431, 'view', 'parent_member', 0, 1, NULL),
('airport', 431, 'view', 'registered', 0, 1, NULL),
('airport', 432, 'comment', 'everyone', 0, 1, NULL),
('airport', 432, 'comment', 'member', 0, 1, NULL),
('airport', 432, 'comment', 'parent_member', 0, 1, NULL),
('airport', 432, 'comment', 'registered', 0, 1, NULL),
('airport', 432, 'view', 'everyone', 0, 1, NULL),
('airport', 432, 'view', 'member', 0, 1, NULL),
('airport', 432, 'view', 'parent_member', 0, 1, NULL),
('airport', 432, 'view', 'registered', 0, 1, NULL),
('airport', 433, 'comment', 'everyone', 0, 1, NULL),
('airport', 433, 'comment', 'member', 0, 1, NULL),
('airport', 433, 'comment', 'parent_member', 0, 1, NULL),
('airport', 433, 'comment', 'registered', 0, 1, NULL),
('airport', 433, 'view', 'everyone', 0, 1, NULL),
('airport', 433, 'view', 'member', 0, 1, NULL),
('airport', 433, 'view', 'parent_member', 0, 1, NULL),
('airport', 433, 'view', 'registered', 0, 1, NULL),
('airport', 434, 'comment', 'everyone', 0, 1, NULL),
('airport', 434, 'comment', 'member', 0, 1, NULL),
('airport', 434, 'comment', 'parent_member', 0, 1, NULL),
('airport', 434, 'comment', 'registered', 0, 1, NULL),
('airport', 434, 'view', 'everyone', 0, 1, NULL),
('airport', 434, 'view', 'member', 0, 1, NULL),
('airport', 434, 'view', 'parent_member', 0, 1, NULL),
('airport', 434, 'view', 'registered', 0, 1, NULL),
('airport', 435, 'comment', 'everyone', 0, 1, NULL),
('airport', 435, 'comment', 'member', 0, 1, NULL),
('airport', 435, 'comment', 'parent_member', 0, 1, NULL),
('airport', 435, 'comment', 'registered', 0, 1, NULL),
('airport', 435, 'view', 'everyone', 0, 1, NULL),
('airport', 435, 'view', 'member', 0, 1, NULL),
('airport', 435, 'view', 'parent_member', 0, 1, NULL),
('airport', 435, 'view', 'registered', 0, 1, NULL),
('airport', 436, 'comment', 'everyone', 0, 1, NULL),
('airport', 436, 'comment', 'member', 0, 1, NULL),
('airport', 436, 'comment', 'parent_member', 0, 1, NULL),
('airport', 436, 'comment', 'registered', 0, 1, NULL),
('airport', 436, 'view', 'everyone', 0, 1, NULL),
('airport', 436, 'view', 'member', 0, 1, NULL),
('airport', 436, 'view', 'parent_member', 0, 1, NULL),
('airport', 436, 'view', 'registered', 0, 1, NULL),
('airport', 437, 'comment', 'everyone', 0, 1, NULL),
('airport', 437, 'comment', 'member', 0, 1, NULL),
('airport', 437, 'comment', 'parent_member', 0, 1, NULL),
('airport', 437, 'comment', 'registered', 0, 1, NULL),
('airport', 437, 'view', 'everyone', 0, 1, NULL),
('airport', 437, 'view', 'member', 0, 1, NULL),
('airport', 437, 'view', 'parent_member', 0, 1, NULL),
('airport', 437, 'view', 'registered', 0, 1, NULL),
('airport', 438, 'comment', 'everyone', 0, 1, NULL),
('airport', 438, 'comment', 'member', 0, 1, NULL),
('airport', 438, 'comment', 'parent_member', 0, 1, NULL),
('airport', 438, 'comment', 'registered', 0, 1, NULL),
('airport', 438, 'view', 'everyone', 0, 1, NULL),
('airport', 438, 'view', 'member', 0, 1, NULL),
('airport', 438, 'view', 'parent_member', 0, 1, NULL),
('airport', 438, 'view', 'registered', 0, 1, NULL),
('airport', 439, 'comment', 'everyone', 0, 1, NULL),
('airport', 439, 'comment', 'member', 0, 1, NULL),
('airport', 439, 'comment', 'parent_member', 0, 1, NULL),
('airport', 439, 'comment', 'registered', 0, 1, NULL),
('airport', 439, 'view', 'everyone', 0, 1, NULL),
('airport', 439, 'view', 'member', 0, 1, NULL),
('airport', 439, 'view', 'parent_member', 0, 1, NULL),
('airport', 439, 'view', 'registered', 0, 1, NULL),
('airport', 440, 'comment', 'everyone', 0, 1, NULL),
('airport', 440, 'comment', 'member', 0, 1, NULL),
('airport', 440, 'comment', 'parent_member', 0, 1, NULL),
('airport', 440, 'comment', 'registered', 0, 1, NULL),
('airport', 440, 'view', 'everyone', 0, 1, NULL),
('airport', 440, 'view', 'member', 0, 1, NULL),
('airport', 440, 'view', 'parent_member', 0, 1, NULL),
('airport', 440, 'view', 'registered', 0, 1, NULL),
('airport', 441, 'comment', 'everyone', 0, 1, NULL),
('airport', 441, 'comment', 'member', 0, 1, NULL),
('airport', 441, 'comment', 'parent_member', 0, 1, NULL),
('airport', 441, 'comment', 'registered', 0, 1, NULL),
('airport', 441, 'view', 'everyone', 0, 1, NULL),
('airport', 441, 'view', 'member', 0, 1, NULL),
('airport', 441, 'view', 'parent_member', 0, 1, NULL),
('airport', 441, 'view', 'registered', 0, 1, NULL),
('airport', 442, 'comment', 'everyone', 0, 1, NULL),
('airport', 442, 'comment', 'member', 0, 1, NULL),
('airport', 442, 'comment', 'parent_member', 0, 1, NULL),
('airport', 442, 'comment', 'registered', 0, 1, NULL),
('airport', 442, 'view', 'everyone', 0, 1, NULL),
('airport', 442, 'view', 'member', 0, 1, NULL),
('airport', 442, 'view', 'parent_member', 0, 1, NULL),
('airport', 442, 'view', 'registered', 0, 1, NULL),
('airport', 443, 'comment', 'everyone', 0, 1, NULL),
('airport', 443, 'comment', 'member', 0, 1, NULL),
('airport', 443, 'comment', 'parent_member', 0, 1, NULL),
('airport', 443, 'comment', 'registered', 0, 1, NULL),
('airport', 443, 'view', 'everyone', 0, 1, NULL),
('airport', 443, 'view', 'member', 0, 1, NULL),
('airport', 443, 'view', 'parent_member', 0, 1, NULL),
('airport', 443, 'view', 'registered', 0, 1, NULL),
('airport', 444, 'comment', 'everyone', 0, 1, NULL),
('airport', 444, 'comment', 'member', 0, 1, NULL),
('airport', 444, 'comment', 'parent_member', 0, 1, NULL),
('airport', 444, 'comment', 'registered', 0, 1, NULL),
('airport', 444, 'view', 'everyone', 0, 1, NULL),
('airport', 444, 'view', 'member', 0, 1, NULL),
('airport', 444, 'view', 'parent_member', 0, 1, NULL),
('airport', 444, 'view', 'registered', 0, 1, NULL),
('airport', 445, 'comment', 'everyone', 0, 1, NULL),
('airport', 445, 'comment', 'member', 0, 1, NULL),
('airport', 445, 'comment', 'parent_member', 0, 1, NULL),
('airport', 445, 'comment', 'registered', 0, 1, NULL),
('airport', 445, 'view', 'everyone', 0, 1, NULL),
('airport', 445, 'view', 'member', 0, 1, NULL),
('airport', 445, 'view', 'parent_member', 0, 1, NULL),
('airport', 445, 'view', 'registered', 0, 1, NULL),
('airport', 446, 'comment', 'everyone', 0, 1, NULL),
('airport', 446, 'comment', 'member', 0, 1, NULL),
('airport', 446, 'comment', 'parent_member', 0, 1, NULL),
('airport', 446, 'comment', 'registered', 0, 1, NULL),
('airport', 446, 'view', 'everyone', 0, 1, NULL),
('airport', 446, 'view', 'member', 0, 1, NULL),
('airport', 446, 'view', 'parent_member', 0, 1, NULL),
('airport', 446, 'view', 'registered', 0, 1, NULL),
('airport', 447, 'comment', 'everyone', 0, 1, NULL),
('airport', 447, 'comment', 'member', 0, 1, NULL),
('airport', 447, 'comment', 'parent_member', 0, 1, NULL),
('airport', 447, 'comment', 'registered', 0, 1, NULL),
('airport', 447, 'view', 'everyone', 0, 1, NULL),
('airport', 447, 'view', 'member', 0, 1, NULL),
('airport', 447, 'view', 'parent_member', 0, 1, NULL),
('airport', 447, 'view', 'registered', 0, 1, NULL),
('airport', 448, 'comment', 'everyone', 0, 1, NULL),
('airport', 448, 'comment', 'member', 0, 1, NULL),
('airport', 448, 'comment', 'parent_member', 0, 1, NULL),
('airport', 448, 'comment', 'registered', 0, 1, NULL),
('airport', 448, 'view', 'everyone', 0, 1, NULL),
('airport', 448, 'view', 'member', 0, 1, NULL),
('airport', 448, 'view', 'parent_member', 0, 1, NULL),
('airport', 448, 'view', 'registered', 0, 1, NULL),
('airport', 449, 'comment', 'everyone', 0, 1, NULL),
('airport', 449, 'comment', 'member', 0, 1, NULL),
('airport', 449, 'comment', 'parent_member', 0, 1, NULL),
('airport', 449, 'comment', 'registered', 0, 1, NULL),
('airport', 449, 'view', 'everyone', 0, 1, NULL),
('airport', 449, 'view', 'member', 0, 1, NULL),
('airport', 449, 'view', 'parent_member', 0, 1, NULL),
('airport', 449, 'view', 'registered', 0, 1, NULL),
('airport', 450, 'comment', 'everyone', 0, 1, NULL),
('airport', 450, 'comment', 'member', 0, 1, NULL),
('airport', 450, 'comment', 'parent_member', 0, 1, NULL),
('airport', 450, 'comment', 'registered', 0, 1, NULL),
('airport', 450, 'view', 'everyone', 0, 1, NULL),
('airport', 450, 'view', 'member', 0, 1, NULL),
('airport', 450, 'view', 'parent_member', 0, 1, NULL),
('airport', 450, 'view', 'registered', 0, 1, NULL),
('airport', 451, 'comment', 'everyone', 0, 1, NULL),
('airport', 451, 'comment', 'member', 0, 1, NULL),
('airport', 451, 'comment', 'parent_member', 0, 1, NULL),
('airport', 451, 'comment', 'registered', 0, 1, NULL),
('airport', 451, 'view', 'everyone', 0, 1, NULL),
('airport', 451, 'view', 'member', 0, 1, NULL),
('airport', 451, 'view', 'parent_member', 0, 1, NULL),
('airport', 451, 'view', 'registered', 0, 1, NULL),
('airport', 452, 'comment', 'everyone', 0, 1, NULL),
('airport', 452, 'comment', 'member', 0, 1, NULL),
('airport', 452, 'comment', 'parent_member', 0, 1, NULL),
('airport', 452, 'comment', 'registered', 0, 1, NULL),
('airport', 452, 'view', 'everyone', 0, 1, NULL),
('airport', 452, 'view', 'member', 0, 1, NULL),
('airport', 452, 'view', 'parent_member', 0, 1, NULL),
('airport', 452, 'view', 'registered', 0, 1, NULL),
('airport', 453, 'comment', 'everyone', 0, 1, NULL),
('airport', 453, 'comment', 'member', 0, 1, NULL),
('airport', 453, 'comment', 'parent_member', 0, 1, NULL),
('airport', 453, 'comment', 'registered', 0, 1, NULL),
('airport', 453, 'view', 'everyone', 0, 1, NULL),
('airport', 453, 'view', 'member', 0, 1, NULL),
('airport', 453, 'view', 'parent_member', 0, 1, NULL),
('airport', 453, 'view', 'registered', 0, 1, NULL),
('airport', 454, 'comment', 'everyone', 0, 1, NULL),
('airport', 454, 'comment', 'member', 0, 1, NULL),
('airport', 454, 'comment', 'parent_member', 0, 1, NULL),
('airport', 454, 'comment', 'registered', 0, 1, NULL),
('airport', 454, 'view', 'everyone', 0, 1, NULL),
('airport', 454, 'view', 'member', 0, 1, NULL),
('airport', 454, 'view', 'parent_member', 0, 1, NULL),
('airport', 454, 'view', 'registered', 0, 1, NULL),
('airport', 455, 'comment', 'everyone', 0, 1, NULL),
('airport', 455, 'comment', 'member', 0, 1, NULL),
('airport', 455, 'comment', 'parent_member', 0, 1, NULL),
('airport', 455, 'comment', 'registered', 0, 1, NULL),
('airport', 455, 'view', 'everyone', 0, 1, NULL),
('airport', 455, 'view', 'member', 0, 1, NULL),
('airport', 455, 'view', 'parent_member', 0, 1, NULL),
('airport', 455, 'view', 'registered', 0, 1, NULL),
('airport', 456, 'comment', 'everyone', 0, 1, NULL),
('airport', 456, 'comment', 'member', 0, 1, NULL),
('airport', 456, 'comment', 'parent_member', 0, 1, NULL),
('airport', 456, 'comment', 'registered', 0, 1, NULL),
('airport', 456, 'view', 'everyone', 0, 1, NULL),
('airport', 456, 'view', 'member', 0, 1, NULL),
('airport', 456, 'view', 'parent_member', 0, 1, NULL),
('airport', 456, 'view', 'registered', 0, 1, NULL),
('airport', 457, 'comment', 'everyone', 0, 1, NULL),
('airport', 457, 'comment', 'member', 0, 1, NULL),
('airport', 457, 'comment', 'parent_member', 0, 1, NULL),
('airport', 457, 'comment', 'registered', 0, 1, NULL),
('airport', 457, 'view', 'everyone', 0, 1, NULL),
('airport', 457, 'view', 'member', 0, 1, NULL),
('airport', 457, 'view', 'parent_member', 0, 1, NULL),
('airport', 457, 'view', 'registered', 0, 1, NULL),
('airport', 458, 'comment', 'everyone', 0, 1, NULL),
('airport', 458, 'comment', 'member', 0, 1, NULL),
('airport', 458, 'comment', 'parent_member', 0, 1, NULL),
('airport', 458, 'comment', 'registered', 0, 1, NULL),
('airport', 458, 'view', 'everyone', 0, 1, NULL),
('airport', 458, 'view', 'member', 0, 1, NULL),
('airport', 458, 'view', 'parent_member', 0, 1, NULL),
('airport', 458, 'view', 'registered', 0, 1, NULL),
('airport', 459, 'comment', 'everyone', 0, 1, NULL),
('airport', 459, 'comment', 'member', 0, 1, NULL),
('airport', 459, 'comment', 'parent_member', 0, 1, NULL),
('airport', 459, 'comment', 'registered', 0, 1, NULL),
('airport', 459, 'view', 'everyone', 0, 1, NULL),
('airport', 459, 'view', 'member', 0, 1, NULL),
('airport', 459, 'view', 'parent_member', 0, 1, NULL),
('airport', 459, 'view', 'registered', 0, 1, NULL),
('airport', 460, 'comment', 'everyone', 0, 1, NULL),
('airport', 460, 'comment', 'member', 0, 1, NULL),
('airport', 460, 'comment', 'parent_member', 0, 1, NULL),
('airport', 460, 'comment', 'registered', 0, 1, NULL),
('airport', 460, 'view', 'everyone', 0, 1, NULL),
('airport', 460, 'view', 'member', 0, 1, NULL),
('airport', 460, 'view', 'parent_member', 0, 1, NULL),
('airport', 460, 'view', 'registered', 0, 1, NULL),
('airport', 461, 'comment', 'everyone', 0, 1, NULL),
('airport', 461, 'comment', 'member', 0, 1, NULL),
('airport', 461, 'comment', 'parent_member', 0, 1, NULL),
('airport', 461, 'comment', 'registered', 0, 1, NULL),
('airport', 461, 'view', 'everyone', 0, 1, NULL),
('airport', 461, 'view', 'member', 0, 1, NULL),
('airport', 461, 'view', 'parent_member', 0, 1, NULL),
('airport', 461, 'view', 'registered', 0, 1, NULL),
('airport', 462, 'comment', 'everyone', 0, 1, NULL),
('airport', 462, 'comment', 'member', 0, 1, NULL),
('airport', 462, 'comment', 'parent_member', 0, 1, NULL),
('airport', 462, 'comment', 'registered', 0, 1, NULL),
('airport', 462, 'view', 'everyone', 0, 1, NULL),
('airport', 462, 'view', 'member', 0, 1, NULL),
('airport', 462, 'view', 'parent_member', 0, 1, NULL),
('airport', 462, 'view', 'registered', 0, 1, NULL),
('airport', 463, 'comment', 'everyone', 0, 1, NULL),
('airport', 463, 'comment', 'member', 0, 1, NULL),
('airport', 463, 'comment', 'parent_member', 0, 1, NULL),
('airport', 463, 'comment', 'registered', 0, 1, NULL),
('airport', 463, 'view', 'everyone', 0, 1, NULL),
('airport', 463, 'view', 'member', 0, 1, NULL),
('airport', 463, 'view', 'parent_member', 0, 1, NULL),
('airport', 463, 'view', 'registered', 0, 1, NULL),
('airport', 464, 'comment', 'everyone', 0, 1, NULL),
('airport', 464, 'comment', 'member', 0, 1, NULL),
('airport', 464, 'comment', 'parent_member', 0, 1, NULL),
('airport', 464, 'comment', 'registered', 0, 1, NULL),
('airport', 464, 'view', 'everyone', 0, 1, NULL),
('airport', 464, 'view', 'member', 0, 1, NULL),
('airport', 464, 'view', 'parent_member', 0, 1, NULL),
('airport', 464, 'view', 'registered', 0, 1, NULL),
('airport', 465, 'comment', 'everyone', 0, 1, NULL),
('airport', 465, 'comment', 'member', 0, 1, NULL),
('airport', 465, 'comment', 'parent_member', 0, 1, NULL),
('airport', 465, 'comment', 'registered', 0, 1, NULL),
('airport', 465, 'view', 'everyone', 0, 1, NULL),
('airport', 465, 'view', 'member', 0, 1, NULL),
('airport', 465, 'view', 'parent_member', 0, 1, NULL),
('airport', 465, 'view', 'registered', 0, 1, NULL),
('airport', 466, 'comment', 'everyone', 0, 1, NULL),
('airport', 466, 'comment', 'member', 0, 1, NULL),
('airport', 466, 'comment', 'parent_member', 0, 1, NULL),
('airport', 466, 'comment', 'registered', 0, 1, NULL),
('airport', 466, 'view', 'everyone', 0, 1, NULL),
('airport', 466, 'view', 'member', 0, 1, NULL),
('airport', 466, 'view', 'parent_member', 0, 1, NULL),
('airport', 466, 'view', 'registered', 0, 1, NULL),
('airport', 467, 'comment', 'everyone', 0, 1, NULL),
('airport', 467, 'comment', 'member', 0, 1, NULL),
('airport', 467, 'comment', 'parent_member', 0, 1, NULL),
('airport', 467, 'comment', 'registered', 0, 1, NULL),
('airport', 467, 'view', 'everyone', 0, 1, NULL),
('airport', 467, 'view', 'member', 0, 1, NULL),
('airport', 467, 'view', 'parent_member', 0, 1, NULL),
('airport', 467, 'view', 'registered', 0, 1, NULL),
('airport', 468, 'comment', 'everyone', 0, 1, NULL),
('airport', 468, 'comment', 'member', 0, 1, NULL),
('airport', 468, 'comment', 'parent_member', 0, 1, NULL),
('airport', 468, 'comment', 'registered', 0, 1, NULL),
('airport', 468, 'view', 'everyone', 0, 1, NULL),
('airport', 468, 'view', 'member', 0, 1, NULL),
('airport', 468, 'view', 'parent_member', 0, 1, NULL),
('airport', 468, 'view', 'registered', 0, 1, NULL),
('airport', 469, 'comment', 'everyone', 0, 1, NULL),
('airport', 469, 'comment', 'member', 0, 1, NULL),
('airport', 469, 'comment', 'parent_member', 0, 1, NULL),
('airport', 469, 'comment', 'registered', 0, 1, NULL),
('airport', 469, 'view', 'everyone', 0, 1, NULL),
('airport', 469, 'view', 'member', 0, 1, NULL),
('airport', 469, 'view', 'parent_member', 0, 1, NULL),
('airport', 469, 'view', 'registered', 0, 1, NULL),
('airport', 470, 'comment', 'everyone', 0, 1, NULL),
('airport', 470, 'comment', 'member', 0, 1, NULL),
('airport', 470, 'comment', 'parent_member', 0, 1, NULL),
('airport', 470, 'comment', 'registered', 0, 1, NULL),
('airport', 470, 'view', 'everyone', 0, 1, NULL),
('airport', 470, 'view', 'member', 0, 1, NULL),
('airport', 470, 'view', 'parent_member', 0, 1, NULL),
('airport', 470, 'view', 'registered', 0, 1, NULL),
('airport', 471, 'comment', 'everyone', 0, 1, NULL),
('airport', 471, 'comment', 'member', 0, 1, NULL),
('airport', 471, 'comment', 'parent_member', 0, 1, NULL),
('airport', 471, 'comment', 'registered', 0, 1, NULL),
('airport', 471, 'view', 'everyone', 0, 1, NULL),
('airport', 471, 'view', 'member', 0, 1, NULL),
('airport', 471, 'view', 'parent_member', 0, 1, NULL),
('airport', 471, 'view', 'registered', 0, 1, NULL),
('airport', 472, 'comment', 'everyone', 0, 1, NULL),
('airport', 472, 'comment', 'member', 0, 1, NULL),
('airport', 472, 'comment', 'parent_member', 0, 1, NULL),
('airport', 472, 'comment', 'registered', 0, 1, NULL),
('airport', 472, 'view', 'everyone', 0, 1, NULL),
('airport', 472, 'view', 'member', 0, 1, NULL),
('airport', 472, 'view', 'parent_member', 0, 1, NULL),
('airport', 472, 'view', 'registered', 0, 1, NULL),
('airport', 473, 'comment', 'everyone', 0, 1, NULL),
('airport', 473, 'comment', 'member', 0, 1, NULL),
('airport', 473, 'comment', 'parent_member', 0, 1, NULL),
('airport', 473, 'comment', 'registered', 0, 1, NULL),
('airport', 473, 'view', 'everyone', 0, 1, NULL),
('airport', 473, 'view', 'member', 0, 1, NULL),
('airport', 473, 'view', 'parent_member', 0, 1, NULL),
('airport', 473, 'view', 'registered', 0, 1, NULL),
('airport', 474, 'comment', 'everyone', 0, 1, NULL),
('airport', 474, 'comment', 'member', 0, 1, NULL),
('airport', 474, 'comment', 'parent_member', 0, 1, NULL),
('airport', 474, 'comment', 'registered', 0, 1, NULL),
('airport', 474, 'view', 'everyone', 0, 1, NULL),
('airport', 474, 'view', 'member', 0, 1, NULL),
('airport', 474, 'view', 'parent_member', 0, 1, NULL),
('airport', 474, 'view', 'registered', 0, 1, NULL),
('airport', 475, 'comment', 'everyone', 0, 1, NULL),
('airport', 475, 'comment', 'member', 0, 1, NULL),
('airport', 475, 'comment', 'parent_member', 0, 1, NULL),
('airport', 475, 'comment', 'registered', 0, 1, NULL),
('airport', 475, 'view', 'everyone', 0, 1, NULL),
('airport', 475, 'view', 'member', 0, 1, NULL),
('airport', 475, 'view', 'parent_member', 0, 1, NULL),
('airport', 475, 'view', 'registered', 0, 1, NULL),
('airport', 476, 'comment', 'everyone', 0, 1, NULL),
('airport', 476, 'comment', 'member', 0, 1, NULL),
('airport', 476, 'comment', 'parent_member', 0, 1, NULL),
('airport', 476, 'comment', 'registered', 0, 1, NULL),
('airport', 476, 'view', 'everyone', 0, 1, NULL),
('airport', 476, 'view', 'member', 0, 1, NULL),
('airport', 476, 'view', 'parent_member', 0, 1, NULL),
('airport', 476, 'view', 'registered', 0, 1, NULL),
('airport', 477, 'comment', 'everyone', 0, 1, NULL),
('airport', 477, 'comment', 'member', 0, 1, NULL),
('airport', 477, 'comment', 'parent_member', 0, 1, NULL),
('airport', 477, 'comment', 'registered', 0, 1, NULL),
('airport', 477, 'view', 'everyone', 0, 1, NULL),
('airport', 477, 'view', 'member', 0, 1, NULL),
('airport', 477, 'view', 'parent_member', 0, 1, NULL),
('airport', 477, 'view', 'registered', 0, 1, NULL),
('airport', 478, 'comment', 'everyone', 0, 1, NULL),
('airport', 478, 'comment', 'member', 0, 1, NULL),
('airport', 478, 'comment', 'parent_member', 0, 1, NULL),
('airport', 478, 'comment', 'registered', 0, 1, NULL),
('airport', 478, 'view', 'everyone', 0, 1, NULL),
('airport', 478, 'view', 'member', 0, 1, NULL),
('airport', 478, 'view', 'parent_member', 0, 1, NULL),
('airport', 478, 'view', 'registered', 0, 1, NULL),
('airport', 479, 'comment', 'everyone', 0, 1, NULL),
('airport', 479, 'comment', 'member', 0, 1, NULL),
('airport', 479, 'comment', 'parent_member', 0, 1, NULL),
('airport', 479, 'comment', 'registered', 0, 1, NULL),
('airport', 479, 'view', 'everyone', 0, 1, NULL),
('airport', 479, 'view', 'member', 0, 1, NULL),
('airport', 479, 'view', 'parent_member', 0, 1, NULL),
('airport', 479, 'view', 'registered', 0, 1, NULL),
('airport', 480, 'comment', 'everyone', 0, 1, NULL),
('airport', 480, 'comment', 'member', 0, 1, NULL),
('airport', 480, 'comment', 'parent_member', 0, 1, NULL),
('airport', 480, 'comment', 'registered', 0, 1, NULL),
('airport', 480, 'view', 'everyone', 0, 1, NULL),
('airport', 480, 'view', 'member', 0, 1, NULL),
('airport', 480, 'view', 'parent_member', 0, 1, NULL),
('airport', 480, 'view', 'registered', 0, 1, NULL),
('airport', 481, 'comment', 'everyone', 0, 1, NULL),
('airport', 481, 'comment', 'member', 0, 1, NULL),
('airport', 481, 'comment', 'parent_member', 0, 1, NULL),
('airport', 481, 'comment', 'registered', 0, 1, NULL),
('airport', 481, 'view', 'everyone', 0, 1, NULL),
('airport', 481, 'view', 'member', 0, 1, NULL),
('airport', 481, 'view', 'parent_member', 0, 1, NULL),
('airport', 481, 'view', 'registered', 0, 1, NULL),
('airport', 482, 'comment', 'everyone', 0, 1, NULL),
('airport', 482, 'comment', 'member', 0, 1, NULL),
('airport', 482, 'comment', 'parent_member', 0, 1, NULL),
('airport', 482, 'comment', 'registered', 0, 1, NULL),
('airport', 482, 'view', 'everyone', 0, 1, NULL),
('airport', 482, 'view', 'member', 0, 1, NULL),
('airport', 482, 'view', 'parent_member', 0, 1, NULL),
('airport', 482, 'view', 'registered', 0, 1, NULL),
('airport', 483, 'comment', 'everyone', 0, 1, NULL),
('airport', 483, 'comment', 'member', 0, 1, NULL),
('airport', 483, 'comment', 'parent_member', 0, 1, NULL),
('airport', 483, 'comment', 'registered', 0, 1, NULL),
('airport', 483, 'view', 'everyone', 0, 1, NULL),
('airport', 483, 'view', 'member', 0, 1, NULL),
('airport', 483, 'view', 'parent_member', 0, 1, NULL),
('airport', 483, 'view', 'registered', 0, 1, NULL),
('airport', 484, 'comment', 'everyone', 0, 1, NULL),
('airport', 484, 'comment', 'member', 0, 1, NULL),
('airport', 484, 'comment', 'parent_member', 0, 1, NULL),
('airport', 484, 'comment', 'registered', 0, 1, NULL),
('airport', 484, 'view', 'everyone', 0, 1, NULL),
('airport', 484, 'view', 'member', 0, 1, NULL),
('airport', 484, 'view', 'parent_member', 0, 1, NULL),
('airport', 484, 'view', 'registered', 0, 1, NULL),
('airport', 485, 'comment', 'everyone', 0, 1, NULL),
('airport', 485, 'comment', 'member', 0, 1, NULL),
('airport', 485, 'comment', 'parent_member', 0, 1, NULL),
('airport', 485, 'comment', 'registered', 0, 1, NULL),
('airport', 485, 'view', 'everyone', 0, 1, NULL),
('airport', 485, 'view', 'member', 0, 1, NULL),
('airport', 485, 'view', 'parent_member', 0, 1, NULL),
('airport', 485, 'view', 'registered', 0, 1, NULL),
('airport', 486, 'comment', 'everyone', 0, 1, NULL),
('airport', 486, 'comment', 'member', 0, 1, NULL),
('airport', 486, 'comment', 'parent_member', 0, 1, NULL),
('airport', 486, 'comment', 'registered', 0, 1, NULL),
('airport', 486, 'view', 'everyone', 0, 1, NULL),
('airport', 486, 'view', 'member', 0, 1, NULL),
('airport', 486, 'view', 'parent_member', 0, 1, NULL),
('airport', 486, 'view', 'registered', 0, 1, NULL),
('airport', 487, 'comment', 'everyone', 0, 1, NULL),
('airport', 487, 'comment', 'member', 0, 1, NULL),
('airport', 487, 'comment', 'parent_member', 0, 1, NULL),
('airport', 487, 'comment', 'registered', 0, 1, NULL),
('airport', 487, 'view', 'everyone', 0, 1, NULL),
('airport', 487, 'view', 'member', 0, 1, NULL),
('airport', 487, 'view', 'parent_member', 0, 1, NULL),
('airport', 487, 'view', 'registered', 0, 1, NULL),
('airport', 488, 'comment', 'everyone', 0, 1, NULL),
('airport', 488, 'comment', 'member', 0, 1, NULL),
('airport', 488, 'comment', 'parent_member', 0, 1, NULL),
('airport', 488, 'comment', 'registered', 0, 1, NULL),
('airport', 488, 'view', 'everyone', 0, 1, NULL),
('airport', 488, 'view', 'member', 0, 1, NULL),
('airport', 488, 'view', 'parent_member', 0, 1, NULL),
('airport', 488, 'view', 'registered', 0, 1, NULL),
('airport', 489, 'comment', 'everyone', 0, 1, NULL),
('airport', 489, 'comment', 'member', 0, 1, NULL),
('airport', 489, 'comment', 'parent_member', 0, 1, NULL),
('airport', 489, 'comment', 'registered', 0, 1, NULL),
('airport', 489, 'view', 'everyone', 0, 1, NULL),
('airport', 489, 'view', 'member', 0, 1, NULL),
('airport', 489, 'view', 'parent_member', 0, 1, NULL),
('airport', 489, 'view', 'registered', 0, 1, NULL),
('airport', 490, 'comment', 'everyone', 0, 1, NULL),
('airport', 490, 'comment', 'member', 0, 1, NULL),
('airport', 490, 'comment', 'parent_member', 0, 1, NULL),
('airport', 490, 'comment', 'registered', 0, 1, NULL),
('airport', 490, 'view', 'everyone', 0, 1, NULL),
('airport', 490, 'view', 'member', 0, 1, NULL),
('airport', 490, 'view', 'parent_member', 0, 1, NULL),
('airport', 490, 'view', 'registered', 0, 1, NULL),
('airport', 491, 'comment', 'everyone', 0, 1, NULL),
('airport', 491, 'comment', 'member', 0, 1, NULL),
('airport', 491, 'comment', 'parent_member', 0, 1, NULL),
('airport', 491, 'comment', 'registered', 0, 1, NULL),
('airport', 491, 'view', 'everyone', 0, 1, NULL),
('airport', 491, 'view', 'member', 0, 1, NULL),
('airport', 491, 'view', 'parent_member', 0, 1, NULL),
('airport', 491, 'view', 'registered', 0, 1, NULL),
('airport', 492, 'comment', 'everyone', 0, 1, NULL),
('airport', 492, 'comment', 'member', 0, 1, NULL),
('airport', 492, 'comment', 'parent_member', 0, 1, NULL),
('airport', 492, 'comment', 'registered', 0, 1, NULL),
('airport', 492, 'view', 'everyone', 0, 1, NULL),
('airport', 492, 'view', 'member', 0, 1, NULL),
('airport', 492, 'view', 'parent_member', 0, 1, NULL),
('airport', 492, 'view', 'registered', 0, 1, NULL),
('airport', 493, 'comment', 'everyone', 0, 1, NULL),
('airport', 493, 'comment', 'member', 0, 1, NULL),
('airport', 493, 'comment', 'parent_member', 0, 1, NULL),
('airport', 493, 'comment', 'registered', 0, 1, NULL),
('airport', 493, 'view', 'everyone', 0, 1, NULL),
('airport', 493, 'view', 'member', 0, 1, NULL),
('airport', 493, 'view', 'parent_member', 0, 1, NULL),
('airport', 493, 'view', 'registered', 0, 1, NULL),
('airport', 494, 'comment', 'everyone', 0, 1, NULL);
INSERT INTO `engine4_authorization_allow` (`resource_type`, `resource_id`, `action`, `role`, `role_id`, `value`, `params`) VALUES
('airport', 494, 'comment', 'member', 0, 1, NULL),
('airport', 494, 'comment', 'parent_member', 0, 1, NULL),
('airport', 494, 'comment', 'registered', 0, 1, NULL),
('airport', 494, 'view', 'everyone', 0, 1, NULL),
('airport', 494, 'view', 'member', 0, 1, NULL),
('airport', 494, 'view', 'parent_member', 0, 1, NULL),
('airport', 494, 'view', 'registered', 0, 1, NULL),
('airport', 495, 'comment', 'everyone', 0, 1, NULL),
('airport', 495, 'comment', 'member', 0, 1, NULL),
('airport', 495, 'comment', 'parent_member', 0, 1, NULL),
('airport', 495, 'comment', 'registered', 0, 1, NULL),
('airport', 495, 'view', 'everyone', 0, 1, NULL),
('airport', 495, 'view', 'member', 0, 1, NULL),
('airport', 495, 'view', 'parent_member', 0, 1, NULL),
('airport', 495, 'view', 'registered', 0, 1, NULL),
('airport', 496, 'comment', 'everyone', 0, 1, NULL),
('airport', 496, 'comment', 'member', 0, 1, NULL),
('airport', 496, 'comment', 'parent_member', 0, 1, NULL),
('airport', 496, 'comment', 'registered', 0, 1, NULL),
('airport', 496, 'view', 'everyone', 0, 1, NULL),
('airport', 496, 'view', 'member', 0, 1, NULL),
('airport', 496, 'view', 'parent_member', 0, 1, NULL),
('airport', 496, 'view', 'registered', 0, 1, NULL),
('airport', 497, 'comment', 'everyone', 0, 1, NULL),
('airport', 497, 'comment', 'member', 0, 1, NULL),
('airport', 497, 'comment', 'parent_member', 0, 1, NULL),
('airport', 497, 'comment', 'registered', 0, 1, NULL),
('airport', 497, 'view', 'everyone', 0, 1, NULL),
('airport', 497, 'view', 'member', 0, 1, NULL),
('airport', 497, 'view', 'parent_member', 0, 1, NULL),
('airport', 497, 'view', 'registered', 0, 1, NULL),
('airport', 498, 'comment', 'everyone', 0, 1, NULL),
('airport', 498, 'comment', 'member', 0, 1, NULL),
('airport', 498, 'comment', 'parent_member', 0, 1, NULL),
('airport', 498, 'comment', 'registered', 0, 1, NULL),
('airport', 498, 'view', 'everyone', 0, 1, NULL),
('airport', 498, 'view', 'member', 0, 1, NULL),
('airport', 498, 'view', 'parent_member', 0, 1, NULL),
('airport', 498, 'view', 'registered', 0, 1, NULL),
('airport', 499, 'comment', 'everyone', 0, 1, NULL),
('airport', 499, 'comment', 'member', 0, 1, NULL),
('airport', 499, 'comment', 'parent_member', 0, 1, NULL),
('airport', 499, 'comment', 'registered', 0, 1, NULL),
('airport', 499, 'view', 'everyone', 0, 1, NULL),
('airport', 499, 'view', 'member', 0, 1, NULL),
('airport', 499, 'view', 'parent_member', 0, 1, NULL),
('airport', 499, 'view', 'registered', 0, 1, NULL),
('airport', 500, 'comment', 'everyone', 0, 1, NULL),
('airport', 500, 'comment', 'member', 0, 1, NULL),
('airport', 500, 'comment', 'parent_member', 0, 1, NULL),
('airport', 500, 'comment', 'registered', 0, 1, NULL),
('airport', 500, 'view', 'everyone', 0, 1, NULL),
('airport', 500, 'view', 'member', 0, 1, NULL),
('airport', 500, 'view', 'parent_member', 0, 1, NULL),
('airport', 500, 'view', 'registered', 0, 1, NULL),
('airport', 501, 'comment', 'everyone', 0, 1, NULL),
('airport', 501, 'comment', 'member', 0, 1, NULL),
('airport', 501, 'comment', 'parent_member', 0, 1, NULL),
('airport', 501, 'comment', 'registered', 0, 1, NULL),
('airport', 501, 'view', 'everyone', 0, 1, NULL),
('airport', 501, 'view', 'member', 0, 1, NULL),
('airport', 501, 'view', 'parent_member', 0, 1, NULL),
('airport', 501, 'view', 'registered', 0, 1, NULL),
('airport', 502, 'comment', 'everyone', 0, 1, NULL),
('airport', 502, 'comment', 'member', 0, 1, NULL),
('airport', 502, 'comment', 'parent_member', 0, 1, NULL),
('airport', 502, 'comment', 'registered', 0, 1, NULL),
('airport', 502, 'view', 'everyone', 0, 1, NULL),
('airport', 502, 'view', 'member', 0, 1, NULL),
('airport', 502, 'view', 'parent_member', 0, 1, NULL),
('airport', 502, 'view', 'registered', 0, 1, NULL),
('airport', 503, 'comment', 'everyone', 0, 1, NULL),
('airport', 503, 'comment', 'member', 0, 1, NULL),
('airport', 503, 'comment', 'parent_member', 0, 1, NULL),
('airport', 503, 'comment', 'registered', 0, 1, NULL),
('airport', 503, 'view', 'everyone', 0, 1, NULL),
('airport', 503, 'view', 'member', 0, 1, NULL),
('airport', 503, 'view', 'parent_member', 0, 1, NULL),
('airport', 503, 'view', 'registered', 0, 1, NULL),
('airport', 504, 'comment', 'everyone', 0, 1, NULL),
('airport', 504, 'comment', 'member', 0, 1, NULL),
('airport', 504, 'comment', 'parent_member', 0, 1, NULL),
('airport', 504, 'comment', 'registered', 0, 1, NULL),
('airport', 504, 'view', 'everyone', 0, 1, NULL),
('airport', 504, 'view', 'member', 0, 1, NULL),
('airport', 504, 'view', 'parent_member', 0, 1, NULL),
('airport', 504, 'view', 'registered', 0, 1, NULL),
('airport', 505, 'comment', 'everyone', 0, 1, NULL),
('airport', 505, 'comment', 'member', 0, 1, NULL),
('airport', 505, 'comment', 'parent_member', 0, 1, NULL),
('airport', 505, 'comment', 'registered', 0, 1, NULL),
('airport', 505, 'view', 'everyone', 0, 1, NULL),
('airport', 505, 'view', 'member', 0, 1, NULL),
('airport', 505, 'view', 'parent_member', 0, 1, NULL),
('airport', 505, 'view', 'registered', 0, 1, NULL),
('airport', 506, 'comment', 'everyone', 0, 1, NULL),
('airport', 506, 'comment', 'member', 0, 1, NULL),
('airport', 506, 'comment', 'parent_member', 0, 1, NULL),
('airport', 506, 'comment', 'registered', 0, 1, NULL),
('airport', 506, 'view', 'everyone', 0, 1, NULL),
('airport', 506, 'view', 'member', 0, 1, NULL),
('airport', 506, 'view', 'parent_member', 0, 1, NULL),
('airport', 506, 'view', 'registered', 0, 1, NULL),
('airport', 507, 'comment', 'everyone', 0, 1, NULL),
('airport', 507, 'comment', 'member', 0, 1, NULL),
('airport', 507, 'comment', 'parent_member', 0, 1, NULL),
('airport', 507, 'comment', 'registered', 0, 1, NULL),
('airport', 507, 'view', 'everyone', 0, 1, NULL),
('airport', 507, 'view', 'member', 0, 1, NULL),
('airport', 507, 'view', 'parent_member', 0, 1, NULL),
('airport', 507, 'view', 'registered', 0, 1, NULL),
('airport', 508, 'comment', 'everyone', 0, 1, NULL),
('airport', 508, 'comment', 'member', 0, 1, NULL),
('airport', 508, 'comment', 'parent_member', 0, 1, NULL),
('airport', 508, 'comment', 'registered', 0, 1, NULL),
('airport', 508, 'view', 'everyone', 0, 1, NULL),
('airport', 508, 'view', 'member', 0, 1, NULL),
('airport', 508, 'view', 'parent_member', 0, 1, NULL),
('airport', 508, 'view', 'registered', 0, 1, NULL),
('airport', 509, 'comment', 'everyone', 0, 1, NULL),
('airport', 509, 'comment', 'member', 0, 1, NULL),
('airport', 509, 'comment', 'parent_member', 0, 1, NULL),
('airport', 509, 'comment', 'registered', 0, 1, NULL),
('airport', 509, 'view', 'everyone', 0, 1, NULL),
('airport', 509, 'view', 'member', 0, 1, NULL),
('airport', 509, 'view', 'parent_member', 0, 1, NULL),
('airport', 509, 'view', 'registered', 0, 1, NULL),
('airport', 510, 'comment', 'everyone', 0, 1, NULL),
('airport', 510, 'comment', 'member', 0, 1, NULL),
('airport', 510, 'comment', 'parent_member', 0, 1, NULL),
('airport', 510, 'comment', 'registered', 0, 1, NULL),
('airport', 510, 'view', 'everyone', 0, 1, NULL),
('airport', 510, 'view', 'member', 0, 1, NULL),
('airport', 510, 'view', 'parent_member', 0, 1, NULL),
('airport', 510, 'view', 'registered', 0, 1, NULL),
('airport', 511, 'comment', 'everyone', 0, 1, NULL),
('airport', 511, 'comment', 'member', 0, 1, NULL),
('airport', 511, 'comment', 'parent_member', 0, 1, NULL),
('airport', 511, 'comment', 'registered', 0, 1, NULL),
('airport', 511, 'view', 'everyone', 0, 1, NULL),
('airport', 511, 'view', 'member', 0, 1, NULL),
('airport', 511, 'view', 'parent_member', 0, 1, NULL),
('airport', 511, 'view', 'registered', 0, 1, NULL),
('airport', 512, 'comment', 'everyone', 0, 1, NULL),
('airport', 512, 'comment', 'member', 0, 1, NULL),
('airport', 512, 'comment', 'parent_member', 0, 1, NULL),
('airport', 512, 'comment', 'registered', 0, 1, NULL),
('airport', 512, 'view', 'everyone', 0, 1, NULL),
('airport', 512, 'view', 'member', 0, 1, NULL),
('airport', 512, 'view', 'parent_member', 0, 1, NULL),
('airport', 512, 'view', 'registered', 0, 1, NULL),
('airport', 513, 'comment', 'everyone', 0, 1, NULL),
('airport', 513, 'comment', 'member', 0, 1, NULL),
('airport', 513, 'comment', 'parent_member', 0, 1, NULL),
('airport', 513, 'comment', 'registered', 0, 1, NULL),
('airport', 513, 'view', 'everyone', 0, 1, NULL),
('airport', 513, 'view', 'member', 0, 1, NULL),
('airport', 513, 'view', 'parent_member', 0, 1, NULL),
('airport', 513, 'view', 'registered', 0, 1, NULL),
('airport', 514, 'comment', 'everyone', 0, 1, NULL),
('airport', 514, 'comment', 'member', 0, 1, NULL),
('airport', 514, 'comment', 'parent_member', 0, 1, NULL),
('airport', 514, 'comment', 'registered', 0, 1, NULL),
('airport', 514, 'view', 'everyone', 0, 1, NULL),
('airport', 514, 'view', 'member', 0, 1, NULL),
('airport', 514, 'view', 'parent_member', 0, 1, NULL),
('airport', 514, 'view', 'registered', 0, 1, NULL),
('airport', 515, 'comment', 'everyone', 0, 1, NULL),
('airport', 515, 'comment', 'member', 0, 1, NULL),
('airport', 515, 'comment', 'parent_member', 0, 1, NULL),
('airport', 515, 'comment', 'registered', 0, 1, NULL),
('airport', 515, 'view', 'everyone', 0, 1, NULL),
('airport', 515, 'view', 'member', 0, 1, NULL),
('airport', 515, 'view', 'parent_member', 0, 1, NULL),
('airport', 515, 'view', 'registered', 0, 1, NULL),
('airport', 516, 'comment', 'everyone', 0, 1, NULL),
('airport', 516, 'comment', 'member', 0, 1, NULL),
('airport', 516, 'comment', 'parent_member', 0, 1, NULL),
('airport', 516, 'comment', 'registered', 0, 1, NULL),
('airport', 516, 'view', 'everyone', 0, 1, NULL),
('airport', 516, 'view', 'member', 0, 1, NULL),
('airport', 516, 'view', 'parent_member', 0, 1, NULL),
('airport', 516, 'view', 'registered', 0, 1, NULL),
('airport', 517, 'comment', 'everyone', 0, 1, NULL),
('airport', 517, 'comment', 'member', 0, 1, NULL),
('airport', 517, 'comment', 'parent_member', 0, 1, NULL),
('airport', 517, 'comment', 'registered', 0, 1, NULL),
('airport', 517, 'view', 'everyone', 0, 1, NULL),
('airport', 517, 'view', 'member', 0, 1, NULL),
('airport', 517, 'view', 'parent_member', 0, 1, NULL),
('airport', 517, 'view', 'registered', 0, 1, NULL),
('airport', 518, 'comment', 'everyone', 0, 1, NULL),
('airport', 518, 'comment', 'member', 0, 1, NULL),
('airport', 518, 'comment', 'parent_member', 0, 1, NULL),
('airport', 518, 'comment', 'registered', 0, 1, NULL),
('airport', 518, 'view', 'everyone', 0, 1, NULL),
('airport', 518, 'view', 'member', 0, 1, NULL),
('airport', 518, 'view', 'parent_member', 0, 1, NULL),
('airport', 518, 'view', 'registered', 0, 1, NULL),
('airport', 519, 'comment', 'everyone', 0, 1, NULL),
('airport', 519, 'comment', 'member', 0, 1, NULL),
('airport', 519, 'comment', 'parent_member', 0, 1, NULL),
('airport', 519, 'comment', 'registered', 0, 1, NULL),
('airport', 519, 'view', 'everyone', 0, 1, NULL),
('airport', 519, 'view', 'member', 0, 1, NULL),
('airport', 519, 'view', 'parent_member', 0, 1, NULL),
('airport', 519, 'view', 'registered', 0, 1, NULL),
('airport', 520, 'comment', 'everyone', 0, 1, NULL),
('airport', 520, 'comment', 'member', 0, 1, NULL),
('airport', 520, 'comment', 'parent_member', 0, 1, NULL),
('airport', 520, 'comment', 'registered', 0, 1, NULL),
('airport', 520, 'view', 'everyone', 0, 1, NULL),
('airport', 520, 'view', 'member', 0, 1, NULL),
('airport', 520, 'view', 'parent_member', 0, 1, NULL),
('airport', 520, 'view', 'registered', 0, 1, NULL),
('airport', 521, 'comment', 'everyone', 0, 1, NULL),
('airport', 521, 'comment', 'member', 0, 1, NULL),
('airport', 521, 'comment', 'parent_member', 0, 1, NULL),
('airport', 521, 'comment', 'registered', 0, 1, NULL),
('airport', 521, 'view', 'everyone', 0, 1, NULL),
('airport', 521, 'view', 'member', 0, 1, NULL),
('airport', 521, 'view', 'parent_member', 0, 1, NULL),
('airport', 521, 'view', 'registered', 0, 1, NULL),
('airport', 522, 'comment', 'everyone', 0, 1, NULL),
('airport', 522, 'comment', 'member', 0, 1, NULL),
('airport', 522, 'comment', 'parent_member', 0, 1, NULL),
('airport', 522, 'comment', 'registered', 0, 1, NULL),
('airport', 522, 'view', 'everyone', 0, 1, NULL),
('airport', 522, 'view', 'member', 0, 1, NULL),
('airport', 522, 'view', 'parent_member', 0, 1, NULL),
('airport', 522, 'view', 'registered', 0, 1, NULL),
('airport', 523, 'comment', 'everyone', 0, 1, NULL),
('airport', 523, 'comment', 'member', 0, 1, NULL),
('airport', 523, 'comment', 'parent_member', 0, 1, NULL),
('airport', 523, 'comment', 'registered', 0, 1, NULL),
('airport', 523, 'view', 'everyone', 0, 1, NULL),
('airport', 523, 'view', 'member', 0, 1, NULL),
('airport', 523, 'view', 'parent_member', 0, 1, NULL),
('airport', 523, 'view', 'registered', 0, 1, NULL),
('airport', 524, 'comment', 'everyone', 0, 1, NULL),
('airport', 524, 'comment', 'member', 0, 1, NULL),
('airport', 524, 'comment', 'parent_member', 0, 1, NULL),
('airport', 524, 'comment', 'registered', 0, 1, NULL),
('airport', 524, 'view', 'everyone', 0, 1, NULL),
('airport', 524, 'view', 'member', 0, 1, NULL),
('airport', 524, 'view', 'parent_member', 0, 1, NULL),
('airport', 524, 'view', 'registered', 0, 1, NULL),
('airport', 525, 'comment', 'everyone', 0, 1, NULL),
('airport', 525, 'comment', 'member', 0, 1, NULL),
('airport', 525, 'comment', 'parent_member', 0, 1, NULL),
('airport', 525, 'comment', 'registered', 0, 1, NULL),
('airport', 525, 'view', 'everyone', 0, 1, NULL),
('airport', 525, 'view', 'member', 0, 1, NULL),
('airport', 525, 'view', 'parent_member', 0, 1, NULL),
('airport', 525, 'view', 'registered', 0, 1, NULL),
('airport', 526, 'comment', 'everyone', 0, 1, NULL),
('airport', 526, 'comment', 'member', 0, 1, NULL),
('airport', 526, 'comment', 'parent_member', 0, 1, NULL),
('airport', 526, 'comment', 'registered', 0, 1, NULL),
('airport', 526, 'view', 'everyone', 0, 1, NULL),
('airport', 526, 'view', 'member', 0, 1, NULL),
('airport', 526, 'view', 'parent_member', 0, 1, NULL),
('airport', 526, 'view', 'registered', 0, 1, NULL),
('airport', 527, 'comment', 'everyone', 0, 1, NULL),
('airport', 527, 'comment', 'member', 0, 1, NULL),
('airport', 527, 'comment', 'parent_member', 0, 1, NULL),
('airport', 527, 'comment', 'registered', 0, 1, NULL),
('airport', 527, 'view', 'everyone', 0, 1, NULL),
('airport', 527, 'view', 'member', 0, 1, NULL),
('airport', 527, 'view', 'parent_member', 0, 1, NULL),
('airport', 527, 'view', 'registered', 0, 1, NULL),
('airport', 528, 'comment', 'everyone', 0, 1, NULL),
('airport', 528, 'comment', 'member', 0, 1, NULL),
('airport', 528, 'comment', 'parent_member', 0, 1, NULL),
('airport', 528, 'comment', 'registered', 0, 1, NULL),
('airport', 528, 'view', 'everyone', 0, 1, NULL),
('airport', 528, 'view', 'member', 0, 1, NULL),
('airport', 528, 'view', 'parent_member', 0, 1, NULL),
('airport', 528, 'view', 'registered', 0, 1, NULL),
('airport', 529, 'comment', 'everyone', 0, 1, NULL),
('airport', 529, 'comment', 'member', 0, 1, NULL),
('airport', 529, 'comment', 'parent_member', 0, 1, NULL),
('airport', 529, 'comment', 'registered', 0, 1, NULL),
('airport', 529, 'view', 'everyone', 0, 1, NULL),
('airport', 529, 'view', 'member', 0, 1, NULL),
('airport', 529, 'view', 'parent_member', 0, 1, NULL),
('airport', 529, 'view', 'registered', 0, 1, NULL),
('airport', 530, 'comment', 'everyone', 0, 1, NULL),
('airport', 530, 'comment', 'member', 0, 1, NULL),
('airport', 530, 'comment', 'parent_member', 0, 1, NULL),
('airport', 530, 'comment', 'registered', 0, 1, NULL),
('airport', 530, 'view', 'everyone', 0, 1, NULL),
('airport', 530, 'view', 'member', 0, 1, NULL),
('airport', 530, 'view', 'parent_member', 0, 1, NULL),
('airport', 530, 'view', 'registered', 0, 1, NULL),
('airport', 531, 'comment', 'everyone', 0, 1, NULL),
('airport', 531, 'comment', 'member', 0, 1, NULL),
('airport', 531, 'comment', 'parent_member', 0, 1, NULL),
('airport', 531, 'comment', 'registered', 0, 1, NULL),
('airport', 531, 'view', 'everyone', 0, 1, NULL),
('airport', 531, 'view', 'member', 0, 1, NULL),
('airport', 531, 'view', 'parent_member', 0, 1, NULL),
('airport', 531, 'view', 'registered', 0, 1, NULL),
('airport', 532, 'comment', 'everyone', 0, 1, NULL),
('airport', 532, 'comment', 'member', 0, 1, NULL),
('airport', 532, 'comment', 'parent_member', 0, 1, NULL),
('airport', 532, 'comment', 'registered', 0, 1, NULL),
('airport', 532, 'view', 'everyone', 0, 1, NULL),
('airport', 532, 'view', 'member', 0, 1, NULL),
('airport', 532, 'view', 'parent_member', 0, 1, NULL),
('airport', 532, 'view', 'registered', 0, 1, NULL),
('airport', 533, 'comment', 'everyone', 0, 1, NULL),
('airport', 533, 'comment', 'member', 0, 1, NULL),
('airport', 533, 'comment', 'parent_member', 0, 1, NULL),
('airport', 533, 'comment', 'registered', 0, 1, NULL),
('airport', 533, 'view', 'everyone', 0, 1, NULL),
('airport', 533, 'view', 'member', 0, 1, NULL),
('airport', 533, 'view', 'parent_member', 0, 1, NULL),
('airport', 533, 'view', 'registered', 0, 1, NULL),
('airport', 534, 'comment', 'everyone', 0, 1, NULL),
('airport', 534, 'comment', 'member', 0, 1, NULL),
('airport', 534, 'comment', 'parent_member', 0, 1, NULL),
('airport', 534, 'comment', 'registered', 0, 1, NULL),
('airport', 534, 'view', 'everyone', 0, 1, NULL),
('airport', 534, 'view', 'member', 0, 1, NULL),
('airport', 534, 'view', 'parent_member', 0, 1, NULL),
('airport', 534, 'view', 'registered', 0, 1, NULL),
('airport', 535, 'comment', 'everyone', 0, 1, NULL),
('airport', 535, 'comment', 'member', 0, 1, NULL),
('airport', 535, 'comment', 'parent_member', 0, 1, NULL),
('airport', 535, 'comment', 'registered', 0, 1, NULL),
('airport', 535, 'view', 'everyone', 0, 1, NULL),
('airport', 535, 'view', 'member', 0, 1, NULL),
('airport', 535, 'view', 'parent_member', 0, 1, NULL),
('airport', 535, 'view', 'registered', 0, 1, NULL),
('airport', 536, 'comment', 'everyone', 0, 1, NULL),
('airport', 536, 'comment', 'member', 0, 1, NULL),
('airport', 536, 'comment', 'parent_member', 0, 1, NULL),
('airport', 536, 'comment', 'registered', 0, 1, NULL),
('airport', 536, 'view', 'everyone', 0, 1, NULL),
('airport', 536, 'view', 'member', 0, 1, NULL),
('airport', 536, 'view', 'parent_member', 0, 1, NULL),
('airport', 536, 'view', 'registered', 0, 1, NULL),
('airport', 537, 'comment', 'everyone', 0, 1, NULL),
('airport', 537, 'comment', 'member', 0, 1, NULL),
('airport', 537, 'comment', 'parent_member', 0, 1, NULL),
('airport', 537, 'comment', 'registered', 0, 1, NULL),
('airport', 537, 'view', 'everyone', 0, 1, NULL),
('airport', 537, 'view', 'member', 0, 1, NULL),
('airport', 537, 'view', 'parent_member', 0, 1, NULL),
('airport', 537, 'view', 'registered', 0, 1, NULL),
('airport', 538, 'comment', 'everyone', 0, 1, NULL),
('airport', 538, 'comment', 'member', 0, 1, NULL),
('airport', 538, 'comment', 'parent_member', 0, 1, NULL),
('airport', 538, 'comment', 'registered', 0, 1, NULL),
('airport', 538, 'view', 'everyone', 0, 1, NULL),
('airport', 538, 'view', 'member', 0, 1, NULL),
('airport', 538, 'view', 'parent_member', 0, 1, NULL),
('airport', 538, 'view', 'registered', 0, 1, NULL),
('airport', 539, 'comment', 'everyone', 0, 1, NULL),
('airport', 539, 'comment', 'member', 0, 1, NULL),
('airport', 539, 'comment', 'parent_member', 0, 1, NULL),
('airport', 539, 'comment', 'registered', 0, 1, NULL),
('airport', 539, 'view', 'everyone', 0, 1, NULL),
('airport', 539, 'view', 'member', 0, 1, NULL),
('airport', 539, 'view', 'parent_member', 0, 1, NULL),
('airport', 539, 'view', 'registered', 0, 1, NULL),
('airport', 540, 'comment', 'everyone', 0, 1, NULL),
('airport', 540, 'comment', 'member', 0, 1, NULL),
('airport', 540, 'comment', 'parent_member', 0, 1, NULL),
('airport', 540, 'comment', 'registered', 0, 1, NULL),
('airport', 540, 'view', 'everyone', 0, 1, NULL),
('airport', 540, 'view', 'member', 0, 1, NULL),
('airport', 540, 'view', 'parent_member', 0, 1, NULL),
('airport', 540, 'view', 'registered', 0, 1, NULL),
('airport', 541, 'comment', 'everyone', 0, 1, NULL),
('airport', 541, 'comment', 'member', 0, 1, NULL),
('airport', 541, 'comment', 'parent_member', 0, 1, NULL),
('airport', 541, 'comment', 'registered', 0, 1, NULL),
('airport', 541, 'view', 'everyone', 0, 1, NULL),
('airport', 541, 'view', 'member', 0, 1, NULL),
('airport', 541, 'view', 'parent_member', 0, 1, NULL),
('airport', 541, 'view', 'registered', 0, 1, NULL),
('airport', 542, 'comment', 'everyone', 0, 1, NULL),
('airport', 542, 'comment', 'member', 0, 1, NULL),
('airport', 542, 'comment', 'parent_member', 0, 1, NULL),
('airport', 542, 'comment', 'registered', 0, 1, NULL),
('airport', 542, 'view', 'everyone', 0, 1, NULL),
('airport', 542, 'view', 'member', 0, 1, NULL),
('airport', 542, 'view', 'parent_member', 0, 1, NULL),
('airport', 542, 'view', 'registered', 0, 1, NULL),
('airport', 543, 'comment', 'everyone', 0, 1, NULL),
('airport', 543, 'comment', 'member', 0, 1, NULL),
('airport', 543, 'comment', 'parent_member', 0, 1, NULL),
('airport', 543, 'comment', 'registered', 0, 1, NULL),
('airport', 543, 'view', 'everyone', 0, 1, NULL),
('airport', 543, 'view', 'member', 0, 1, NULL),
('airport', 543, 'view', 'parent_member', 0, 1, NULL),
('airport', 543, 'view', 'registered', 0, 1, NULL),
('airport', 544, 'comment', 'everyone', 0, 1, NULL),
('airport', 544, 'comment', 'member', 0, 1, NULL),
('airport', 544, 'comment', 'parent_member', 0, 1, NULL),
('airport', 544, 'comment', 'registered', 0, 1, NULL),
('airport', 544, 'view', 'everyone', 0, 1, NULL),
('airport', 544, 'view', 'member', 0, 1, NULL),
('airport', 544, 'view', 'parent_member', 0, 1, NULL),
('airport', 544, 'view', 'registered', 0, 1, NULL),
('airport', 545, 'comment', 'everyone', 0, 1, NULL),
('airport', 545, 'comment', 'member', 0, 1, NULL),
('airport', 545, 'comment', 'parent_member', 0, 1, NULL),
('airport', 545, 'comment', 'registered', 0, 1, NULL),
('airport', 545, 'view', 'everyone', 0, 1, NULL),
('airport', 545, 'view', 'member', 0, 1, NULL),
('airport', 545, 'view', 'parent_member', 0, 1, NULL),
('airport', 545, 'view', 'registered', 0, 1, NULL),
('airport', 546, 'comment', 'everyone', 0, 1, NULL),
('airport', 546, 'comment', 'member', 0, 1, NULL),
('airport', 546, 'comment', 'parent_member', 0, 1, NULL),
('airport', 546, 'comment', 'registered', 0, 1, NULL),
('airport', 546, 'view', 'everyone', 0, 1, NULL),
('airport', 546, 'view', 'member', 0, 1, NULL),
('airport', 546, 'view', 'parent_member', 0, 1, NULL),
('airport', 546, 'view', 'registered', 0, 1, NULL),
('airport', 547, 'comment', 'everyone', 0, 1, NULL),
('airport', 547, 'comment', 'member', 0, 1, NULL),
('airport', 547, 'comment', 'parent_member', 0, 1, NULL),
('airport', 547, 'comment', 'registered', 0, 1, NULL),
('airport', 547, 'view', 'everyone', 0, 1, NULL),
('airport', 547, 'view', 'member', 0, 1, NULL),
('airport', 547, 'view', 'parent_member', 0, 1, NULL),
('airport', 547, 'view', 'registered', 0, 1, NULL),
('airport', 548, 'comment', 'everyone', 0, 1, NULL),
('airport', 548, 'comment', 'member', 0, 1, NULL),
('airport', 548, 'comment', 'parent_member', 0, 1, NULL),
('airport', 548, 'comment', 'registered', 0, 1, NULL),
('airport', 548, 'view', 'everyone', 0, 1, NULL),
('airport', 548, 'view', 'member', 0, 1, NULL),
('airport', 548, 'view', 'parent_member', 0, 1, NULL),
('airport', 548, 'view', 'registered', 0, 1, NULL),
('airport', 549, 'comment', 'everyone', 0, 1, NULL),
('airport', 549, 'comment', 'member', 0, 1, NULL),
('airport', 549, 'comment', 'parent_member', 0, 1, NULL),
('airport', 549, 'comment', 'registered', 0, 1, NULL),
('airport', 549, 'view', 'everyone', 0, 1, NULL),
('airport', 549, 'view', 'member', 0, 1, NULL),
('airport', 549, 'view', 'parent_member', 0, 1, NULL),
('airport', 549, 'view', 'registered', 0, 1, NULL),
('airport', 550, 'comment', 'everyone', 0, 1, NULL),
('airport', 550, 'comment', 'member', 0, 1, NULL),
('airport', 550, 'comment', 'parent_member', 0, 1, NULL),
('airport', 550, 'comment', 'registered', 0, 1, NULL),
('airport', 550, 'view', 'everyone', 0, 1, NULL),
('airport', 550, 'view', 'member', 0, 1, NULL),
('airport', 550, 'view', 'parent_member', 0, 1, NULL),
('airport', 550, 'view', 'registered', 0, 1, NULL),
('airport', 551, 'comment', 'everyone', 0, 1, NULL),
('airport', 551, 'comment', 'member', 0, 1, NULL),
('airport', 551, 'comment', 'parent_member', 0, 1, NULL),
('airport', 551, 'comment', 'registered', 0, 1, NULL),
('airport', 551, 'view', 'everyone', 0, 1, NULL),
('airport', 551, 'view', 'member', 0, 1, NULL),
('airport', 551, 'view', 'parent_member', 0, 1, NULL),
('airport', 551, 'view', 'registered', 0, 1, NULL),
('airport', 552, 'comment', 'everyone', 0, 1, NULL),
('airport', 552, 'comment', 'member', 0, 1, NULL),
('airport', 552, 'comment', 'parent_member', 0, 1, NULL),
('airport', 552, 'comment', 'registered', 0, 1, NULL),
('airport', 552, 'view', 'everyone', 0, 1, NULL),
('airport', 552, 'view', 'member', 0, 1, NULL),
('airport', 552, 'view', 'parent_member', 0, 1, NULL),
('airport', 552, 'view', 'registered', 0, 1, NULL),
('airport', 553, 'comment', 'everyone', 0, 1, NULL),
('airport', 553, 'comment', 'member', 0, 1, NULL),
('airport', 553, 'comment', 'parent_member', 0, 1, NULL),
('airport', 553, 'comment', 'registered', 0, 1, NULL),
('airport', 553, 'view', 'everyone', 0, 1, NULL),
('airport', 553, 'view', 'member', 0, 1, NULL),
('airport', 553, 'view', 'parent_member', 0, 1, NULL),
('airport', 553, 'view', 'registered', 0, 1, NULL),
('airport', 554, 'comment', 'everyone', 0, 1, NULL),
('airport', 554, 'comment', 'member', 0, 1, NULL),
('airport', 554, 'comment', 'parent_member', 0, 1, NULL),
('airport', 554, 'comment', 'registered', 0, 1, NULL),
('airport', 554, 'view', 'everyone', 0, 1, NULL),
('airport', 554, 'view', 'member', 0, 1, NULL),
('airport', 554, 'view', 'parent_member', 0, 1, NULL),
('airport', 554, 'view', 'registered', 0, 1, NULL),
('airport', 555, 'comment', 'everyone', 0, 1, NULL),
('airport', 555, 'comment', 'member', 0, 1, NULL),
('airport', 555, 'comment', 'parent_member', 0, 1, NULL),
('airport', 555, 'comment', 'registered', 0, 1, NULL),
('airport', 555, 'view', 'everyone', 0, 1, NULL),
('airport', 555, 'view', 'member', 0, 1, NULL),
('airport', 555, 'view', 'parent_member', 0, 1, NULL),
('airport', 555, 'view', 'registered', 0, 1, NULL),
('airport', 556, 'comment', 'everyone', 0, 1, NULL),
('airport', 556, 'comment', 'member', 0, 1, NULL),
('airport', 556, 'comment', 'parent_member', 0, 1, NULL),
('airport', 556, 'comment', 'registered', 0, 1, NULL),
('airport', 556, 'view', 'everyone', 0, 1, NULL),
('airport', 556, 'view', 'member', 0, 1, NULL),
('airport', 556, 'view', 'parent_member', 0, 1, NULL),
('airport', 556, 'view', 'registered', 0, 1, NULL),
('airport', 557, 'comment', 'everyone', 0, 1, NULL),
('airport', 557, 'comment', 'member', 0, 1, NULL),
('airport', 557, 'comment', 'parent_member', 0, 1, NULL),
('airport', 557, 'comment', 'registered', 0, 1, NULL),
('airport', 557, 'view', 'everyone', 0, 1, NULL),
('airport', 557, 'view', 'member', 0, 1, NULL),
('airport', 557, 'view', 'parent_member', 0, 1, NULL),
('airport', 557, 'view', 'registered', 0, 1, NULL),
('airport', 558, 'comment', 'everyone', 0, 1, NULL),
('airport', 558, 'comment', 'member', 0, 1, NULL),
('airport', 558, 'comment', 'parent_member', 0, 1, NULL),
('airport', 558, 'comment', 'registered', 0, 1, NULL),
('airport', 558, 'view', 'everyone', 0, 1, NULL),
('airport', 558, 'view', 'member', 0, 1, NULL),
('airport', 558, 'view', 'parent_member', 0, 1, NULL),
('airport', 558, 'view', 'registered', 0, 1, NULL),
('airport', 559, 'comment', 'everyone', 0, 1, NULL),
('airport', 559, 'comment', 'member', 0, 1, NULL),
('airport', 559, 'comment', 'parent_member', 0, 1, NULL),
('airport', 559, 'comment', 'registered', 0, 1, NULL),
('airport', 559, 'view', 'everyone', 0, 1, NULL),
('airport', 559, 'view', 'member', 0, 1, NULL),
('airport', 559, 'view', 'parent_member', 0, 1, NULL),
('airport', 559, 'view', 'registered', 0, 1, NULL),
('airport', 560, 'comment', 'everyone', 0, 1, NULL),
('airport', 560, 'comment', 'member', 0, 1, NULL),
('airport', 560, 'comment', 'parent_member', 0, 1, NULL),
('airport', 560, 'comment', 'registered', 0, 1, NULL),
('airport', 560, 'view', 'everyone', 0, 1, NULL),
('airport', 560, 'view', 'member', 0, 1, NULL),
('airport', 560, 'view', 'parent_member', 0, 1, NULL),
('airport', 560, 'view', 'registered', 0, 1, NULL),
('airport', 561, 'comment', 'everyone', 0, 1, NULL),
('airport', 561, 'comment', 'member', 0, 1, NULL),
('airport', 561, 'comment', 'parent_member', 0, 1, NULL),
('airport', 561, 'comment', 'registered', 0, 1, NULL),
('airport', 561, 'view', 'everyone', 0, 1, NULL),
('airport', 561, 'view', 'member', 0, 1, NULL),
('airport', 561, 'view', 'parent_member', 0, 1, NULL),
('airport', 561, 'view', 'registered', 0, 1, NULL),
('airport', 562, 'comment', 'everyone', 0, 1, NULL),
('airport', 562, 'comment', 'member', 0, 1, NULL),
('airport', 562, 'comment', 'parent_member', 0, 1, NULL),
('airport', 562, 'comment', 'registered', 0, 1, NULL),
('airport', 562, 'view', 'everyone', 0, 1, NULL),
('airport', 562, 'view', 'member', 0, 1, NULL),
('airport', 562, 'view', 'parent_member', 0, 1, NULL),
('airport', 562, 'view', 'registered', 0, 1, NULL),
('airport', 563, 'comment', 'everyone', 0, 1, NULL),
('airport', 563, 'comment', 'member', 0, 1, NULL),
('airport', 563, 'comment', 'parent_member', 0, 1, NULL),
('airport', 563, 'comment', 'registered', 0, 1, NULL),
('airport', 563, 'view', 'everyone', 0, 1, NULL),
('airport', 563, 'view', 'member', 0, 1, NULL),
('airport', 563, 'view', 'parent_member', 0, 1, NULL),
('airport', 563, 'view', 'registered', 0, 1, NULL),
('airport', 564, 'comment', 'everyone', 0, 1, NULL),
('airport', 564, 'comment', 'member', 0, 1, NULL),
('airport', 564, 'comment', 'parent_member', 0, 1, NULL),
('airport', 564, 'comment', 'registered', 0, 1, NULL),
('airport', 564, 'view', 'everyone', 0, 1, NULL),
('airport', 564, 'view', 'member', 0, 1, NULL),
('airport', 564, 'view', 'parent_member', 0, 1, NULL),
('airport', 564, 'view', 'registered', 0, 1, NULL),
('airport', 565, 'comment', 'everyone', 0, 1, NULL),
('airport', 565, 'comment', 'member', 0, 1, NULL),
('airport', 565, 'comment', 'parent_member', 0, 1, NULL),
('airport', 565, 'comment', 'registered', 0, 1, NULL),
('airport', 565, 'view', 'everyone', 0, 1, NULL),
('airport', 565, 'view', 'member', 0, 1, NULL),
('airport', 565, 'view', 'parent_member', 0, 1, NULL),
('airport', 565, 'view', 'registered', 0, 1, NULL),
('airport', 566, 'comment', 'everyone', 0, 1, NULL),
('airport', 566, 'comment', 'member', 0, 1, NULL),
('airport', 566, 'comment', 'parent_member', 0, 1, NULL),
('airport', 566, 'comment', 'registered', 0, 1, NULL),
('airport', 566, 'view', 'everyone', 0, 1, NULL),
('airport', 566, 'view', 'member', 0, 1, NULL),
('airport', 566, 'view', 'parent_member', 0, 1, NULL),
('airport', 566, 'view', 'registered', 0, 1, NULL),
('airport', 567, 'comment', 'everyone', 0, 1, NULL),
('airport', 567, 'comment', 'member', 0, 1, NULL),
('airport', 567, 'comment', 'parent_member', 0, 1, NULL),
('airport', 567, 'comment', 'registered', 0, 1, NULL),
('airport', 567, 'view', 'everyone', 0, 1, NULL),
('airport', 567, 'view', 'member', 0, 1, NULL),
('airport', 567, 'view', 'parent_member', 0, 1, NULL),
('airport', 567, 'view', 'registered', 0, 1, NULL),
('airport', 568, 'comment', 'everyone', 0, 1, NULL),
('airport', 568, 'comment', 'member', 0, 1, NULL),
('airport', 568, 'comment', 'parent_member', 0, 1, NULL),
('airport', 568, 'comment', 'registered', 0, 1, NULL),
('airport', 568, 'view', 'everyone', 0, 1, NULL),
('airport', 568, 'view', 'member', 0, 1, NULL),
('airport', 568, 'view', 'parent_member', 0, 1, NULL),
('airport', 568, 'view', 'registered', 0, 1, NULL),
('airport', 569, 'comment', 'everyone', 0, 1, NULL),
('airport', 569, 'comment', 'member', 0, 1, NULL),
('airport', 569, 'comment', 'parent_member', 0, 1, NULL),
('airport', 569, 'comment', 'registered', 0, 1, NULL),
('airport', 569, 'view', 'everyone', 0, 1, NULL),
('airport', 569, 'view', 'member', 0, 1, NULL),
('airport', 569, 'view', 'parent_member', 0, 1, NULL),
('airport', 569, 'view', 'registered', 0, 1, NULL),
('airport', 570, 'comment', 'everyone', 0, 1, NULL),
('airport', 570, 'comment', 'member', 0, 1, NULL),
('airport', 570, 'comment', 'parent_member', 0, 1, NULL),
('airport', 570, 'comment', 'registered', 0, 1, NULL),
('airport', 570, 'view', 'everyone', 0, 1, NULL),
('airport', 570, 'view', 'member', 0, 1, NULL),
('airport', 570, 'view', 'parent_member', 0, 1, NULL),
('airport', 570, 'view', 'registered', 0, 1, NULL),
('airport', 571, 'comment', 'everyone', 0, 1, NULL),
('airport', 571, 'comment', 'member', 0, 1, NULL),
('airport', 571, 'comment', 'parent_member', 0, 1, NULL),
('airport', 571, 'comment', 'registered', 0, 1, NULL),
('airport', 571, 'view', 'everyone', 0, 1, NULL),
('airport', 571, 'view', 'member', 0, 1, NULL),
('airport', 571, 'view', 'parent_member', 0, 1, NULL),
('airport', 571, 'view', 'registered', 0, 1, NULL),
('airport', 572, 'comment', 'everyone', 0, 1, NULL),
('airport', 572, 'comment', 'member', 0, 1, NULL),
('airport', 572, 'comment', 'parent_member', 0, 1, NULL),
('airport', 572, 'comment', 'registered', 0, 1, NULL),
('airport', 572, 'view', 'everyone', 0, 1, NULL),
('airport', 572, 'view', 'member', 0, 1, NULL),
('airport', 572, 'view', 'parent_member', 0, 1, NULL),
('airport', 572, 'view', 'registered', 0, 1, NULL),
('airport', 573, 'comment', 'everyone', 0, 1, NULL),
('airport', 573, 'comment', 'member', 0, 1, NULL),
('airport', 573, 'comment', 'parent_member', 0, 1, NULL),
('airport', 573, 'comment', 'registered', 0, 1, NULL),
('airport', 573, 'view', 'everyone', 0, 1, NULL),
('airport', 573, 'view', 'member', 0, 1, NULL),
('airport', 573, 'view', 'parent_member', 0, 1, NULL),
('airport', 573, 'view', 'registered', 0, 1, NULL),
('airport', 574, 'comment', 'everyone', 0, 1, NULL),
('airport', 574, 'comment', 'member', 0, 1, NULL),
('airport', 574, 'comment', 'parent_member', 0, 1, NULL),
('airport', 574, 'comment', 'registered', 0, 1, NULL),
('airport', 574, 'view', 'everyone', 0, 1, NULL),
('airport', 574, 'view', 'member', 0, 1, NULL),
('airport', 574, 'view', 'parent_member', 0, 1, NULL),
('airport', 574, 'view', 'registered', 0, 1, NULL),
('airport', 575, 'comment', 'everyone', 0, 1, NULL),
('airport', 575, 'comment', 'member', 0, 1, NULL),
('airport', 575, 'comment', 'parent_member', 0, 1, NULL),
('airport', 575, 'comment', 'registered', 0, 1, NULL),
('airport', 575, 'view', 'everyone', 0, 1, NULL),
('airport', 575, 'view', 'member', 0, 1, NULL),
('airport', 575, 'view', 'parent_member', 0, 1, NULL),
('airport', 575, 'view', 'registered', 0, 1, NULL),
('airport', 576, 'comment', 'everyone', 0, 1, NULL),
('airport', 576, 'comment', 'member', 0, 1, NULL),
('airport', 576, 'comment', 'parent_member', 0, 1, NULL),
('airport', 576, 'comment', 'registered', 0, 1, NULL),
('airport', 576, 'view', 'everyone', 0, 1, NULL),
('airport', 576, 'view', 'member', 0, 1, NULL),
('airport', 576, 'view', 'parent_member', 0, 1, NULL),
('airport', 576, 'view', 'registered', 0, 1, NULL),
('airport', 577, 'comment', 'everyone', 0, 1, NULL),
('airport', 577, 'comment', 'member', 0, 1, NULL),
('airport', 577, 'comment', 'parent_member', 0, 1, NULL),
('airport', 577, 'comment', 'registered', 0, 1, NULL),
('airport', 577, 'view', 'everyone', 0, 1, NULL),
('airport', 577, 'view', 'member', 0, 1, NULL),
('airport', 577, 'view', 'parent_member', 0, 1, NULL),
('airport', 577, 'view', 'registered', 0, 1, NULL),
('airport', 578, 'comment', 'everyone', 0, 1, NULL),
('airport', 578, 'comment', 'member', 0, 1, NULL),
('airport', 578, 'comment', 'parent_member', 0, 1, NULL),
('airport', 578, 'comment', 'registered', 0, 1, NULL),
('airport', 578, 'view', 'everyone', 0, 1, NULL),
('airport', 578, 'view', 'member', 0, 1, NULL),
('airport', 578, 'view', 'parent_member', 0, 1, NULL),
('airport', 578, 'view', 'registered', 0, 1, NULL),
('airport', 579, 'comment', 'everyone', 0, 1, NULL),
('airport', 579, 'comment', 'member', 0, 1, NULL),
('airport', 579, 'comment', 'parent_member', 0, 1, NULL),
('airport', 579, 'comment', 'registered', 0, 1, NULL),
('airport', 579, 'view', 'everyone', 0, 1, NULL),
('airport', 579, 'view', 'member', 0, 1, NULL),
('airport', 579, 'view', 'parent_member', 0, 1, NULL),
('airport', 579, 'view', 'registered', 0, 1, NULL),
('airport', 580, 'comment', 'everyone', 0, 1, NULL),
('airport', 580, 'comment', 'member', 0, 1, NULL),
('airport', 580, 'comment', 'parent_member', 0, 1, NULL),
('airport', 580, 'comment', 'registered', 0, 1, NULL),
('airport', 580, 'view', 'everyone', 0, 1, NULL),
('airport', 580, 'view', 'member', 0, 1, NULL),
('airport', 580, 'view', 'parent_member', 0, 1, NULL),
('airport', 580, 'view', 'registered', 0, 1, NULL),
('airport', 581, 'comment', 'everyone', 0, 1, NULL),
('airport', 581, 'comment', 'member', 0, 1, NULL),
('airport', 581, 'comment', 'parent_member', 0, 1, NULL),
('airport', 581, 'comment', 'registered', 0, 1, NULL),
('airport', 581, 'view', 'everyone', 0, 1, NULL),
('airport', 581, 'view', 'member', 0, 1, NULL),
('airport', 581, 'view', 'parent_member', 0, 1, NULL),
('airport', 581, 'view', 'registered', 0, 1, NULL),
('airport', 582, 'comment', 'everyone', 0, 1, NULL),
('airport', 582, 'comment', 'member', 0, 1, NULL),
('airport', 582, 'comment', 'parent_member', 0, 1, NULL),
('airport', 582, 'comment', 'registered', 0, 1, NULL),
('airport', 582, 'view', 'everyone', 0, 1, NULL),
('airport', 582, 'view', 'member', 0, 1, NULL),
('airport', 582, 'view', 'parent_member', 0, 1, NULL),
('airport', 582, 'view', 'registered', 0, 1, NULL),
('airport', 583, 'comment', 'everyone', 0, 1, NULL),
('airport', 583, 'comment', 'member', 0, 1, NULL),
('airport', 583, 'comment', 'parent_member', 0, 1, NULL),
('airport', 583, 'comment', 'registered', 0, 1, NULL),
('airport', 583, 'view', 'everyone', 0, 1, NULL),
('airport', 583, 'view', 'member', 0, 1, NULL),
('airport', 583, 'view', 'parent_member', 0, 1, NULL),
('airport', 583, 'view', 'registered', 0, 1, NULL),
('airport', 584, 'comment', 'everyone', 0, 1, NULL),
('airport', 584, 'comment', 'member', 0, 1, NULL),
('airport', 584, 'comment', 'parent_member', 0, 1, NULL),
('airport', 584, 'comment', 'registered', 0, 1, NULL),
('airport', 584, 'view', 'everyone', 0, 1, NULL),
('airport', 584, 'view', 'member', 0, 1, NULL),
('airport', 584, 'view', 'parent_member', 0, 1, NULL),
('airport', 584, 'view', 'registered', 0, 1, NULL),
('airport', 585, 'comment', 'everyone', 0, 1, NULL),
('airport', 585, 'comment', 'member', 0, 1, NULL),
('airport', 585, 'comment', 'parent_member', 0, 1, NULL),
('airport', 585, 'comment', 'registered', 0, 1, NULL),
('airport', 585, 'view', 'everyone', 0, 1, NULL),
('airport', 585, 'view', 'member', 0, 1, NULL),
('airport', 585, 'view', 'parent_member', 0, 1, NULL),
('airport', 585, 'view', 'registered', 0, 1, NULL),
('airport', 586, 'comment', 'everyone', 0, 1, NULL),
('airport', 586, 'comment', 'member', 0, 1, NULL),
('airport', 586, 'comment', 'parent_member', 0, 1, NULL),
('airport', 586, 'comment', 'registered', 0, 1, NULL),
('airport', 586, 'view', 'everyone', 0, 1, NULL),
('airport', 586, 'view', 'member', 0, 1, NULL),
('airport', 586, 'view', 'parent_member', 0, 1, NULL),
('airport', 586, 'view', 'registered', 0, 1, NULL),
('airport', 587, 'view', 'everyone', 0, 1, NULL),
('airport', 587, 'view', 'member', 0, 1, NULL),
('airport', 587, 'view', 'registered', 0, 1, NULL),
('airport', 590, 'view', 'everyone', 0, 1, NULL),
('airport', 590, 'view', 'member', 0, 1, NULL),
('airport', 590, 'view', 'registered', 0, 1, NULL),
('airport', 591, 'view', 'everyone', 0, 1, NULL),
('airport', 591, 'view', 'member', 0, 1, NULL),
('airport', 591, 'view', 'registered', 0, 1, NULL),
('user', 1, 'comment', 'everyone', 0, 1, NULL),
('user', 1, 'comment', 'member', 0, 1, NULL),
('user', 1, 'comment', 'network', 0, 1, NULL),
('user', 1, 'comment', 'registered', 0, 1, NULL),
('user', 1, 'view', 'everyone', 0, 1, NULL),
('user', 1, 'view', 'member', 0, 1, NULL),
('user', 1, 'view', 'network', 0, 1, NULL),
('user', 1, 'view', 'registered', 0, 1, NULL),
('user', 2, 'comment', 'member', 0, 1, NULL),
('user', 2, 'comment', 'network', 0, 1, NULL),
('user', 2, 'comment', 'registered', 0, 1, NULL),
('user', 2, 'view', 'everyone', 0, 1, NULL),
('user', 2, 'view', 'member', 0, 1, NULL),
('user', 2, 'view', 'network', 0, 1, NULL),
('user', 2, 'view', 'registered', 0, 1, NULL),
('user', 3, 'comment', 'member', 0, 1, NULL),
('user', 3, 'comment', 'network', 0, 1, NULL),
('user', 3, 'comment', 'registered', 0, 1, NULL),
('user', 3, 'view', 'everyone', 0, 1, NULL),
('user', 3, 'view', 'member', 0, 1, NULL),
('user', 3, 'view', 'network', 0, 1, NULL),
('user', 3, 'view', 'registered', 0, 1, NULL),
('user', 9, 'comment', 'member', 0, 1, NULL),
('user', 9, 'comment', 'network', 0, 1, NULL),
('user', 9, 'comment', 'registered', 0, 1, NULL),
('user', 9, 'view', 'everyone', 0, 1, NULL),
('user', 9, 'view', 'member', 0, 1, NULL),
('user', 9, 'view', 'network', 0, 1, NULL),
('user', 9, 'view', 'registered', 0, 1, NULL),
('user', 12, 'comment', 'member', 0, 1, NULL),
('user', 12, 'comment', 'network', 0, 1, NULL),
('user', 12, 'comment', 'registered', 0, 1, NULL),
('user', 12, 'view', 'everyone', 0, 1, NULL),
('user', 12, 'view', 'member', 0, 1, NULL),
('user', 12, 'view', 'network', 0, 1, NULL),
('user', 12, 'view', 'registered', 0, 1, NULL),
('user', 18, 'comment', 'member', 0, 1, NULL),
('user', 18, 'comment', 'network', 0, 1, NULL),
('user', 18, 'comment', 'registered', 0, 1, NULL),
('user', 18, 'view', 'everyone', 0, 1, NULL),
('user', 18, 'view', 'member', 0, 1, NULL),
('user', 18, 'view', 'network', 0, 1, NULL),
('user', 18, 'view', 'registered', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_levels`
--

CREATE TABLE `engine4_authorization_levels` (
  `level_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('public','user','moderator','admin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `flag` enum('default','superadmin','public') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_authorization_levels`
--

INSERT INTO `engine4_authorization_levels` (`level_id`, `title`, `description`, `type`, `flag`) VALUES
(1, 'Superadmins', 'Users of this level can modify all of your settings and data.  This level cannot be modified or deleted.', 'admin', 'superadmin'),
(2, 'Admins', 'Users of this level have full access to all of your network settings and data.', 'admin', ''),
(3, 'Moderators', 'Users of this level may edit user-side content.', 'moderator', ''),
(4, 'Pilots', 'This is the default user level.  New users are assigned to it automatically.', 'user', 'default'),
(5, 'Public (Non Logged-in Visitors)', 'Settings for this level apply to users who have not logged in.', 'public', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_mapprofiletypelevels`
--

CREATE TABLE `engine4_authorization_mapprofiletypelevels` (
  `mapprofiletypelevel_id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `profile_type_id` int(11) NOT NULL,
  `member_level_id` int(11) NOT NULL,
  `member_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_authorization_permissions`
--

CREATE TABLE `engine4_authorization_permissions` (
  `level_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` tinyint(3) NOT NULL DEFAULT 0,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_authorization_permissions`
--

INSERT INTO `engine4_authorization_permissions` (`level_id`, `type`, `name`, `value`, `params`) VALUES
(1, 'activity', 'edit_time', 3, '0'),
(1, 'admin', 'view', 1, NULL),
(1, 'airport', 'auth_comment', 5, '[\"everyone\",\"registered\"]'),
(1, 'airport', 'auth_view', 5, '[\"everyone\",\"registered\"]'),
(1, 'airport', 'comment', 1, NULL),
(1, 'airport', 'view', 1, NULL),
(1, 'announcement', 'create', 1, NULL),
(1, 'announcement', 'delete', 2, NULL),
(1, 'announcement', 'edit', 2, NULL),
(1, 'announcement', 'view', 2, NULL),
(1, 'core_link', 'create', 1, NULL),
(1, 'core_link', 'delete', 2, NULL),
(1, 'core_link', 'view', 2, NULL),
(1, 'general', 'activity', 2, NULL),
(1, 'general', 'style', 2, NULL),
(1, 'messages', 'auth', 3, 'everyone'),
(1, 'messages', 'create', 1, NULL),
(1, 'messages', 'editor', 3, 'plaintext'),
(1, 'user', 'activity', 1, NULL),
(1, 'user', 'auth_comment', 5, '[\"registered\",\"network\",\"member\",\"owner\"]'),
(1, 'user', 'auth_view', 5, '[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),
(1, 'user', 'block', 1, NULL),
(1, 'user', 'comment', 2, NULL),
(1, 'user', 'commenthtml', 3, ''),
(1, 'user', 'coverphotoupload', 1, NULL),
(1, 'user', 'create', 1, NULL),
(1, 'user', 'delete', 2, NULL),
(1, 'user', 'description', 3, 'Users of this level can modify all of your settings and data.  This level cannot be modified or deleted.'),
(1, 'user', 'edit', 2, NULL),
(1, 'user', 'messages_editor', 3, 'plaintext'),
(1, 'user', 'quota', 3, '0'),
(1, 'user', 'search', 1, NULL),
(1, 'user', 'status', 1, NULL),
(1, 'user', 'style', 0, NULL),
(1, 'user', 'title', 3, 'Superadmins'),
(1, 'user', 'username', 0, NULL),
(1, 'user', 'view', 2, NULL),
(2, 'activity', 'edit_time', 3, '0'),
(2, 'admin', 'view', 1, NULL),
(2, 'airport', 'auth_comment', 5, '[\"everyone\",\"registered\"]'),
(2, 'airport', 'auth_view', 5, '[\"everyone\",\"registered\"]'),
(2, 'airport', 'comment', 1, NULL),
(2, 'airport', 'view', 1, NULL),
(2, 'announcement', 'create', 1, NULL),
(2, 'announcement', 'delete', 2, NULL),
(2, 'announcement', 'edit', 2, NULL),
(2, 'announcement', 'view', 2, NULL),
(2, 'core_link', 'create', 1, NULL),
(2, 'core_link', 'delete', 2, NULL),
(2, 'core_link', 'view', 2, NULL),
(2, 'general', 'activity', 2, NULL),
(2, 'general', 'style', 2, NULL),
(2, 'messages', 'auth', 3, 'everyone'),
(2, 'messages', 'create', 1, NULL),
(2, 'messages', 'editor', 3, 'plaintext'),
(2, 'user', 'activity', 1, NULL),
(2, 'user', 'auth_comment', 5, '[\"registered\",\"network\",\"member\",\"owner\"]'),
(2, 'user', 'auth_view', 5, '[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),
(2, 'user', 'block', 1, NULL),
(2, 'user', 'comment', 2, NULL),
(2, 'user', 'commenthtml', 3, ''),
(2, 'user', 'coverphotoupload', 1, NULL),
(2, 'user', 'create', 1, NULL),
(2, 'user', 'delete', 2, NULL),
(2, 'user', 'description', 3, 'Users of this level have full access to all of your network settings and data.'),
(2, 'user', 'edit', 2, NULL),
(2, 'user', 'messages_editor', 3, 'plaintext'),
(2, 'user', 'quota', 3, '0'),
(2, 'user', 'search', 1, NULL),
(2, 'user', 'status', 1, NULL),
(2, 'user', 'style', 0, NULL),
(2, 'user', 'title', 3, 'Admins'),
(2, 'user', 'username', 0, NULL),
(2, 'user', 'view', 2, NULL),
(3, 'activity', 'edit_time', 3, '0'),
(3, 'airport', 'auth_comment', 5, '[\"everyone\",\"registered\"]'),
(3, 'airport', 'auth_view', 5, '[\"everyone\",\"registered\"]'),
(3, 'airport', 'comment', 1, NULL),
(3, 'airport', 'view', 1, NULL),
(3, 'announcement', 'view', 1, NULL),
(3, 'core_link', 'create', 1, NULL),
(3, 'core_link', 'delete', 2, NULL),
(3, 'core_link', 'view', 2, NULL),
(3, 'general', 'activity', 2, NULL),
(3, 'general', 'style', 2, NULL),
(3, 'messages', 'auth', 3, 'everyone'),
(3, 'messages', 'create', 1, NULL),
(3, 'messages', 'editor', 3, 'plaintext'),
(3, 'user', 'activity', 1, NULL),
(3, 'user', 'auth_comment', 5, '[\"registered\",\"network\",\"member\",\"owner\"]'),
(3, 'user', 'auth_view', 5, '[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),
(3, 'user', 'block', 1, NULL),
(3, 'user', 'comment', 2, NULL),
(3, 'user', 'commenthtml', 3, ''),
(3, 'user', 'coverphotoupload', 1, NULL),
(3, 'user', 'create', 1, NULL),
(3, 'user', 'delete', 0, NULL),
(3, 'user', 'description', 3, 'Users of this level may edit user-side content.'),
(3, 'user', 'edit', 1, NULL),
(3, 'user', 'messages_editor', 3, 'plaintext'),
(3, 'user', 'quota', 3, '0'),
(3, 'user', 'search', 1, NULL),
(3, 'user', 'status', 1, NULL),
(3, 'user', 'style', 0, NULL),
(3, 'user', 'title', 3, 'Moderators'),
(3, 'user', 'username', 0, NULL),
(3, 'user', 'view', 2, NULL),
(4, 'activity', 'edit_time', 3, '0'),
(4, 'airport', 'auth_comment', 5, '[\"everyone\",\"registered\"]'),
(4, 'airport', 'auth_view', 5, '[\"everyone\",\"registered\"]'),
(4, 'airport', 'comment', 1, NULL),
(4, 'airport', 'view', 1, NULL),
(4, 'announcement', 'view', 1, NULL),
(4, 'core_link', 'create', 1, NULL),
(4, 'core_link', 'delete', 1, NULL),
(4, 'core_link', 'view', 1, NULL),
(4, 'general', 'style', 1, NULL),
(4, 'messages', 'auth', 3, 'none'),
(4, 'messages', 'create', 0, NULL),
(4, 'messages', 'editor', 3, 'plaintext'),
(4, 'user', 'auth_comment', 5, '[\"registered\",\"network\",\"member\",\"owner\"]'),
(4, 'user', 'auth_view', 5, '[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),
(4, 'user', 'block', 1, NULL),
(4, 'user', 'comment', 1, NULL),
(4, 'user', 'commenthtml', 3, ''),
(4, 'user', 'coverphotoupload', 0, NULL),
(4, 'user', 'create', 1, NULL),
(4, 'user', 'delete', 0, NULL),
(4, 'user', 'description', 3, 'This is the default user level.  New users are assigned to it automatically.'),
(4, 'user', 'edit', 1, NULL),
(4, 'user', 'messages_editor', 3, 'plaintext'),
(4, 'user', 'quota', 3, '1048576'),
(4, 'user', 'search', 1, NULL),
(4, 'user', 'status', 0, NULL),
(4, 'user', 'style', 0, NULL),
(4, 'user', 'title', 3, 'Pilots'),
(4, 'user', 'username', 0, NULL),
(4, 'user', 'view', 1, NULL),
(5, 'activity', 'edit_time', 3, '0'),
(5, 'announcement', 'view', 1, NULL),
(5, 'core_link', 'view', 1, NULL),
(5, 'messages', 'auth', 3, '0'),
(5, 'messages', 'create', 0, NULL),
(5, 'messages', 'editor', 3, '0'),
(5, 'user', 'description', 3, 'Settings for this level apply to users who have not logged in.'),
(5, 'user', 'title', 3, 'Public (Non Logged-in Visitors)'),
(5, 'user', 'view', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_adcampaigns`
--

CREATE TABLE `engine4_core_adcampaigns` (
  `adcampaign_id` int(11) UNSIGNED NOT NULL,
  `end_settings` tinyint(4) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `limit_view` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `limit_click` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `limit_ctr` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `network` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target_member` tinyint(4) NOT NULL DEFAULT 1,
  `views` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `clicks` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_adphotos`
--

CREATE TABLE `engine4_core_adphotos` (
  `adphoto_id` int(11) UNSIGNED NOT NULL,
  `ad_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_ads`
--

CREATE TABLE `engine4_core_ads` (
  `ad_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ad_campaign` int(11) UNSIGNED NOT NULL,
  `views` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `clicks` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `media_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html_code` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_allowemails`
--

CREATE TABLE `engine4_core_allowemails` (
  `allowemail_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_allowemails`
--

INSERT INTO `engine4_core_allowemails` (`allowemail_id`, `email`) VALUES
(14, '*@emirates.com'),
(15, '*@flydubai.com'),
(16, '*@isakovic.net');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_auth`
--

CREATE TABLE `engine4_core_auth` (
  `id` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `expires` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedemails`
--

CREATE TABLE `engine4_core_bannedemails` (
  `bannedemail_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_bannedemails`
--

INSERT INTO `engine4_core_bannedemails` (`bannedemail_id`, `email`) VALUES
(5, '');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedips`
--

CREATE TABLE `engine4_core_bannedips` (
  `bannedip_id` int(10) UNSIGNED NOT NULL,
  `start` varbinary(16) NOT NULL,
  `stop` varbinary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedusernames`
--

CREATE TABLE `engine4_core_bannedusernames` (
  `bannedusername_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_bannedusernames`
--

INSERT INTO `engine4_core_bannedusernames` (`bannedusername_id`, `username`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_bannedwords`
--

CREATE TABLE `engine4_core_bannedwords` (
  `bannedword_id` int(10) UNSIGNED NOT NULL,
  `word` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_banners`
--

CREATE TABLE `engine4_core_banners` (
  `banner_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `custom` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_banners`
--

INSERT INTO `engine4_core_banners` (`banner_id`, `name`, `module`, `title`, `body`, `photo_id`, `params`, `custom`) VALUES
(1, 'user', 'user', 'Connect with People', 'The world is a book. Those who do not connect with others miss many pages.', 0, '{\"label\":\"Invite\",\"route\":\"default\",\"routeParams\":{\"module\":\"invite\"}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_comments`
--

CREATE TABLE `engine4_core_comments` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `like_count` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_comments`
--

INSERT INTO `engine4_core_comments` (`comment_id`, `resource_type`, `resource_id`, `poster_type`, `poster_id`, `body`, `creation_date`, `params`, `like_count`) VALUES
(1, 'airport_expect', 2, 'user', 1, 'Test1', '2019-09-13 10:58:48', NULL, 1),
(2, 'airport_expect', 2, 'user', 1, 'Test2', '2019-09-13 10:58:53', NULL, 0),
(3, 'airport_threat', 60, 'user', 1, 'Test', '2019-09-13 14:21:08', NULL, 1),
(5, 'airport_expect', 2, 'user', 2, 'Test comment', '2019-09-19 10:48:46', NULL, 0),
(6, 'airport_threat', 60, 'user', 2, 'Test comment', '2019-09-19 10:54:42', NULL, 0),
(8, 'airport_expect', 2, 'user', 1, 'test', '2019-09-25 11:51:28', NULL, 0),
(10, 'airport_expect', 2, 'user', 1, 'test 4', '2019-09-25 12:09:19', NULL, 1),
(11, 'airport_threat', 60, 'user', 1, 'test 2', '2019-09-25 12:12:09', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_content`
--

CREATE TABLE `engine4_core_content` (
  `content_id` int(11) UNSIGNED NOT NULL,
  `page_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'widget',
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_content_id` int(11) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribs` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_content`
--

INSERT INTO `engine4_core_content` (`content_id`, `page_id`, `type`, `name`, `parent_content_id`, `order`, `params`, `attribs`) VALUES
(100, 1, 'container', 'main', NULL, 2, '[\"\"]', NULL),
(112, 1, 'widget', 'core.menu-logo', 100, 3, '{\"title\":\"\",\"name\":\"core.menu-logo\",\"logo\":\"public\\/admin\\/logo.png\",\"nomobile\":\"0\"}', NULL),
(113, 1, 'widget', 'core.menu-main', 100, 5, '{\"menuType\":\"vertical\",\"title\":\"\",\"nomobile\":\"0\",\"name\":\"core.menu-main\"}', NULL),
(200, 2, 'container', 'main', NULL, 1, '', NULL),
(210, 2, 'widget', 'core.menu-footer', 200, 2, '', NULL),
(211, 2, 'widget', 'core.menu-social-sites', 200, 3, '', NULL),
(215, 2, 'widget', 'user.login-or-signup-popup', 200, 999, '', NULL),
(300, 3, 'container', 'main', NULL, 2, '[\"\"]', NULL),
(312, 3, 'container', 'middle', 300, 6, '[\"\"]', NULL),
(400, 4, 'container', 'main', NULL, 2, '[\"\"]', NULL),
(412, 4, 'container', 'middle', 400, 6, '[\"\"]', NULL),
(500, 5, 'container', 'main', NULL, 2, '[\"\"]', NULL),
(510, 5, 'container', 'left', 500, 4, '[\"\"]', NULL),
(511, 5, 'container', 'middle', 500, 6, '[\"\"]', NULL),
(522, 5, 'widget', 'user.profile-friends-common', 510, 6, '{\"title\":\"Mutual Friends\"}', NULL),
(523, 5, 'widget', 'user.profile-info', 510, 7, '{\"title\":\"Member Info\"}', NULL),
(531, 5, 'widget', 'core.container-tabs', 511, 9, '{\"max\":\"6\"}', NULL),
(541, 5, 'widget', 'user.profile-fields', 531, 10, '{\"title\":\"Info\"}', NULL),
(542, 5, 'widget', 'user.profile-friends', 531, 11, '{\"title\":\"Friends\",\"titleCount\":true}', NULL),
(546, 5, 'widget', 'core.profile-links', 531, 12, '{\"title\":\"Links\",\"titleCount\":true}', NULL),
(547, 6, 'container', 'main', NULL, 1, NULL, NULL),
(548, 6, 'container', 'middle', 547, 2, NULL, NULL),
(549, 6, 'widget', 'core.content', 548, 1, NULL, NULL),
(550, 7, 'container', 'main', NULL, 1, NULL, NULL),
(551, 7, 'container', 'middle', 550, 2, NULL, NULL),
(552, 7, 'widget', 'core.content', 551, 1, NULL, NULL),
(553, 8, 'container', 'main', NULL, 1, NULL, NULL),
(554, 8, 'container', 'middle', 553, 2, NULL, NULL),
(555, 8, 'widget', 'core.content', 554, 1, NULL, NULL),
(556, 9, 'container', 'main', NULL, 2, NULL, NULL),
(557, 9, 'container', 'middle', 556, 2, NULL, NULL),
(558, 9, 'container', 'right', 556, 1, NULL, NULL),
(559, 9, 'widget', 'core.search-hashtags', 558, 1, NULL, NULL),
(560, 9, 'widget', 'core.hashtags-cloud', 558, 1, '{\"title\":\"Trending Hashtags\"}', NULL),
(561, 9, 'widget', 'activity.feed', 557, 3, '{\"title\":\"Trending Posts\"}', NULL),
(563, 10, 'container', 'main', NULL, 2, '[]', NULL),
(564, 10, 'container', 'middle', 563, 6, '[]', NULL),
(565, 10, 'widget', 'core.content', 564, 4, '[]', NULL),
(566, 11, 'container', 'main', NULL, 1, NULL, NULL),
(567, 11, 'container', 'middle', 566, 1, NULL, NULL),
(568, 11, 'widget', 'core.content', 567, 1, NULL, NULL),
(569, 12, 'container', 'main', NULL, 2, '[\"[]\"]', NULL),
(570, 12, 'container', 'middle', 569, 6, '[\"[]\"]', NULL),
(571, 12, 'widget', 'core.content', 570, 4, '[\"[]\"]', NULL),
(572, 13, 'container', 'main', NULL, 2, '[\"[]\"]', NULL),
(573, 13, 'container', 'middle', 572, 6, '[\"[]\"]', NULL),
(574, 13, 'widget', 'core.content', 655, 7, '[\"[]\"]', NULL),
(575, 14, 'container', 'main', NULL, 1, NULL, NULL),
(576, 14, 'container', 'middle', 575, 1, NULL, NULL),
(577, 14, 'widget', 'core.content', 576, 1, NULL, NULL),
(578, 15, 'container', 'top', NULL, 1, NULL, NULL),
(579, 15, 'container', 'main', NULL, 2, NULL, NULL),
(580, 15, 'container', 'middle', 578, 1, NULL, NULL),
(581, 15, 'container', 'middle', 579, 2, NULL, NULL),
(582, 15, 'widget', 'user.settings-menu', 580, 1, NULL, NULL),
(583, 15, 'widget', 'core.content', 581, 1, NULL, NULL),
(584, 16, 'container', 'top', NULL, 1, NULL, NULL),
(585, 16, 'container', 'main', NULL, 2, NULL, NULL),
(586, 16, 'container', 'middle', 584, 1, NULL, NULL),
(587, 16, 'container', 'middle', 585, 2, NULL, NULL),
(588, 16, 'widget', 'user.settings-menu', 586, 1, NULL, NULL),
(589, 16, 'widget', 'core.content', 587, 1, NULL, NULL),
(590, 17, 'container', 'top', NULL, 1, NULL, NULL),
(591, 17, 'container', 'main', NULL, 2, NULL, NULL),
(592, 17, 'container', 'middle', 590, 1, NULL, NULL),
(593, 17, 'container', 'middle', 591, 2, NULL, NULL),
(594, 17, 'widget', 'user.settings-menu', 592, 1, NULL, NULL),
(595, 17, 'widget', 'core.content', 593, 1, NULL, NULL),
(596, 18, 'container', 'top', NULL, 1, NULL, NULL),
(597, 18, 'container', 'main', NULL, 2, NULL, NULL),
(598, 18, 'container', 'middle', 596, 1, NULL, NULL),
(599, 18, 'container', 'middle', 597, 2, NULL, NULL),
(600, 18, 'widget', 'user.settings-menu', 598, 1, NULL, NULL),
(601, 18, 'widget', 'core.content', 599, 1, NULL, NULL),
(602, 19, 'container', 'top', NULL, 1, NULL, NULL),
(603, 19, 'container', 'main', NULL, 2, NULL, NULL),
(604, 19, 'container', 'middle', 602, 1, NULL, NULL),
(605, 19, 'container', 'middle', 603, 2, NULL, NULL),
(606, 19, 'widget', 'user.settings-menu', 604, 1, NULL, NULL),
(607, 19, 'widget', 'core.content', 605, 1, NULL, NULL),
(608, 20, 'container', 'top', NULL, 1, NULL, NULL),
(609, 20, 'container', 'main', NULL, 2, NULL, NULL),
(610, 20, 'container', 'middle', 608, 1, NULL, NULL),
(611, 20, 'container', 'middle', 609, 2, NULL, NULL),
(612, 20, 'widget', 'user.settings-menu', 610, 1, NULL, NULL),
(613, 20, 'widget', 'core.content', 611, 1, NULL, NULL),
(614, 21, 'container', 'top', NULL, 1, NULL, NULL),
(615, 21, 'container', 'main', NULL, 2, NULL, NULL),
(616, 21, 'container', 'middle', 614, 1, NULL, NULL),
(617, 21, 'container', 'middle', 615, 2, NULL, NULL),
(618, 21, 'container', 'right', 615, 1, NULL, NULL),
(619, 21, 'widget', 'core.banner', 616, 1, '{\"title\":\"\",\"name\":\"core.banner\",\"banner_id\":\"1\",\"nomobile\":\"0\"}', NULL),
(620, 21, 'widget', 'user.browse-menu', 616, 2, NULL, NULL),
(621, 21, 'widget', 'core.content', 617, 1, NULL, NULL),
(622, 21, 'widget', 'user.browse-search', 618, 1, NULL, NULL),
(623, 5, 'container', 'top', NULL, 1, '[\"[]\"]', NULL),
(624, 5, 'container', 'middle', 623, 6, '[\"[]\"]', NULL),
(625, 5, 'widget', 'user.cover-photo', 624, 3, '[\"[]\"]', NULL),
(626, 22, 'container', 'main', NULL, 1, NULL, NULL),
(627, 22, 'container', 'middle', 626, 1, NULL, NULL),
(628, 22, 'widget', 'core.content', 627, 1, NULL, NULL),
(629, 23, 'container', 'main', NULL, 1, NULL, NULL),
(630, 23, 'container', 'middle', 629, 1, NULL, NULL),
(631, 23, 'widget', 'core.content', 630, 2, NULL, NULL),
(632, 23, 'widget', 'messages.menu', 630, 1, NULL, NULL),
(633, 24, 'container', 'main', NULL, 1, NULL, NULL),
(634, 24, 'container', 'middle', 633, 1, NULL, NULL),
(635, 24, 'widget', 'core.content', 634, 2, NULL, NULL),
(636, 24, 'widget', 'messages.menu', 634, 1, NULL, NULL),
(637, 25, 'container', 'main', NULL, 1, NULL, NULL),
(638, 25, 'container', 'middle', 637, 1, NULL, NULL),
(639, 25, 'widget', 'core.content', 638, 2, NULL, NULL),
(640, 25, 'widget', 'messages.menu', 638, 1, NULL, NULL),
(641, 26, 'container', 'main', NULL, 1, NULL, NULL),
(642, 26, 'container', 'middle', 641, 1, NULL, NULL),
(643, 26, 'widget', 'core.content', 642, 2, NULL, NULL),
(644, 26, 'widget', 'messages.menu', 642, 1, NULL, NULL),
(645, 27, 'container', 'main', NULL, 1, NULL, NULL),
(646, 27, 'container', 'middle', 645, 1, NULL, NULL),
(647, 27, 'widget', 'core.content', 646, 2, NULL, NULL),
(648, 27, 'widget', 'messages.menu', 646, 1, NULL, NULL),
(649, 13, 'container', 'top', NULL, 1, '[\"[]\"]', NULL),
(650, 13, 'container', 'middle', 649, 6, '[\"[]\"]', NULL),
(652, 13, 'widget', 'core.html-block', 573, 9, '{\"title\":\"\",\"adminTitle\":\"\",\"data\":\"<h1>Follow your interest<\\/h1>\\r\\n<p>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.<\\/p>\",\"nomobile\":\"0\",\"name\":\"core.html-block\"}', NULL),
(653, 13, 'widget', 'core.menu-logo', 650, 3, '{\"title\":\"\",\"name\":\"core.menu-logo\",\"logo\":\"public\\/admin\\/logo.png\",\"nomobile\":\"0\"}', NULL),
(654, 13, 'widget', 'user.login-or-signup', 650, 4, '[\"[]\"]', NULL),
(655, 13, 'container', 'left', 572, 4, '[\"[]\"]', NULL),
(659, 12, 'widget', 'core.menu-logo', 570, 3, '{\"title\":\"\",\"name\":\"core.menu-logo\",\"logo\":\"public\\/admin\\/logo.png\",\"nomobile\":\"0\"}', NULL),
(661, 12, 'widget', 'core.html-block', 570, 5, '{\"title\":\"\",\"adminTitle\":\"\",\"data\":\"<div class=\\\"sd-login-account\\\">\\r\\n<div class=\\\"sd-login-container\\\">\\r\\n  <p>Don\'t have a ThreatForward ID ?<\\/p>\\r\\n   <a href=\\\"signup\\\">Create one for free<\\/a>\\r\\n <\\/div>\\r\\n<div class=\\\"sd-login-privacy\\\">\\r\\n  <p>By loggin in, you agree to the <a href=\\\"help\\/terms\\\" target=\\\"_blank\\\">Terms of use<\\/a> and <a href=\\\"help\\/privacy\\\"  target=\\\"_blank\\\">Privacy policy<\\/a><\\/p>\\r\\n\\r\\n<\\/div>\\r\\n<\\/div>\",\"nomobile\":\"0\",\"name\":\"core.html-block\"}', NULL),
(666, 1, 'widget', 'sd-mini-menu', 100, 2, '[\"[]\"]', NULL),
(673, 29, 'container', 'main', NULL, 2, '[\"[]\"]', NULL),
(674, 29, 'container', 'middle', 673, 6, '[\"[]\"]', NULL),
(678, 29, 'widget', 'airport.sd-map', 674, 3, '[\"[]\"]', NULL),
(679, 29, 'widget', 'airport.sd-threats', 674, 4, '{\"itemCountPerPage\":\"10\",\"title\":\"\",\"name\":\"airport.sd-threats\"}', NULL),
(680, 29, 'widget', 'airport.sd-past-incident-accidents', 674, 5, '{\"itemCountPerPage\":\"10\",\"title\":\"\",\"name\":\"airport.sd-past-incident-accidents\"}', NULL),
(681, 30, 'container', 'main', NULL, 2, '[\"[]\"]', NULL),
(682, 30, 'container', 'middle', 681, 6, '[\"[]\"]', NULL),
(683, 30, 'widget', 'core.comments', 682, 4, '{\"title\":\"Comments\"}', NULL),
(684, 4, 'widget', 'airport.home-page', 412, 3, '{\"itemCountPerPage\":\"10\"}', NULL),
(685, 31, 'container', 'main', NULL, 2, '[\"[]\"]', NULL),
(686, 31, 'container', 'middle', 685, 6, '[\"[]\"]', NULL),
(687, 31, 'widget', 'core.comments', 686, 4, '{\"title\":\"Comments\"}', NULL),
(688, 10, 'widget', 'core.menu-logo', 564, 3, '{\"title\":\"\",\"name\":\"core.menu-logo\",\"logo\":\"public\\/admin\\/logo.png\",\"nomobile\":\"0\"}', NULL),
(689, 10, 'widget', 'core.html-block', 564, 5, '{\"title\":\"\",\"adminTitle\":\"\",\"data\":\"<div class=\\\"sd-login-account\\\">\\r\\n<div class=\\\"sd-login-container\\\">\\r\\n  <p>Don\'t have a ThreatForward ID ?<\\/p>\\r\\n   <a href=\\\"signup\\\">Create one for free<\\/a>\\r\\n <\\/div>\\r\\n<div class=\\\"sd-login-privacy\\\">\\r\\n  <p>By loggin in, you agree to the <a href=\\\"help\\/terms\\\" target=\\\"_blank\\\">Terms of use<\\/a> and <a href=\\\"help\\/privacy\\\"  target=\\\"_blank\\\">Privacy policy<\\/a><\\/p>\\r\\n\\r\\n<\\/div>\\r\\n<\\/div>\",\"nomobile\":\"0\",\"name\":\"core.html-block\"}', NULL),
(690, 5, 'widget', 'airport.sd-profile-expects', 531, 13, '{\"title\":\"Expects\",\"name\":\"airport.sd-profile-expects\"}', NULL),
(691, 5, 'widget', 'airport.sd-profile-threats', 531, 14, '{\"title\":\"Threats\",\"name\":\"airport.sd-profile-threats\"}', NULL),
(692, 30, 'widget', 'core.content', 682, 3, '[]', NULL),
(693, 31, 'widget', 'core.content', 686, 3, '[]', NULL),
(699, 3, 'container', 'top', NULL, 1, '[\"[]\"]', NULL),
(700, 3, 'container', 'middle', 699, 6, '[\"[]\"]', NULL),
(701, 3, 'widget', 'core.menu-logo', 700, 3, '{\"title\":\"\",\"name\":\"core.menu-logo\",\"logo\":\"public\\/admin\\/logo.png\",\"nomobile\":\"0\"}', NULL),
(702, 3, 'widget', 'user.login-or-signup', 700, 4, '[\"[]\"]', NULL),
(705, 3, 'widget', 'sd-landing-page', 706, 7, '[\"[]\"]', NULL),
(706, 3, 'container', 'left', 300, 4, '[]', NULL),
(707, 3, 'widget', 'core.html-block', 312, 9, '{\"title\":\"\",\"adminTitle\":\"\",\"data\":\"<h1>Follow your interest<\\/h1>\\r\\n<p>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.<\\/p>\",\"nomobile\":\"0\",\"name\":\"core.html-block\"}', NULL),
(709, 1, 'widget', 'airport.header-search', 100, 4, '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_geotags`
--

CREATE TABLE `engine4_core_geotags` (
  `geotag_id` int(11) UNSIGNED NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_jobs`
--

CREATE TABLE `engine4_core_jobs` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `jobtype_id` int(10) UNSIGNED NOT NULL,
  `state` enum('pending','active','sleeping','failed','cancelled','completed','timeout') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `is_complete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `progress` decimal(5,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `started_date` datetime DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `priority` mediumint(9) NOT NULL DEFAULT 100,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `messages` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_jobtypes`
--

CREATE TABLE `engine4_core_jobtypes` (
  `jobtype_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `form` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `priority` mediumint(9) NOT NULL DEFAULT 100,
  `multi` tinyint(3) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_jobtypes`
--

INSERT INTO `engine4_core_jobtypes` (`jobtype_id`, `title`, `type`, `module`, `plugin`, `form`, `enabled`, `priority`, `multi`) VALUES
(1, 'Download File', 'file_download', 'core', 'Core_Plugin_Job_FileDownload', 'Core_Form_Admin_Job_FileDownload', 1, 100, 1),
(2, 'Upload File', 'file_upload', 'core', 'Core_Plugin_Job_FileUpload', 'Core_Form_Admin_Job_FileUpload', 1, 100, 1),
(3, 'Rebuild Activity Privacy', 'activity_maintenance_rebuild_privacy', 'activity', 'Activity_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(4, 'Rebuild Member Privacy', 'user_maintenance_rebuild_privacy', 'user', 'User_Plugin_Job_Maintenance_RebuildPrivacy', NULL, 1, 50, 1),
(5, 'Rebuild Network Membership', 'network_maintenance_rebuild_membership', 'network', 'Network_Plugin_Job_Maintenance_RebuildMembership', NULL, 1, 50, 1),
(6, 'Storage Transfer', 'storage_transfer', 'core', 'Storage_Plugin_Job_Transfer', 'Core_Form_Admin_Job_Generic', 1, 100, 1),
(7, 'Storage Cleanup', 'storage_cleanup', 'core', 'Storage_Plugin_Job_Cleanup', 'Core_Form_Admin_Job_Generic', 1, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_languages`
--

CREATE TABLE `engine4_core_languages` (
  `language_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fallback` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_languages`
--

INSERT INTO `engine4_core_languages` (`language_id`, `code`, `name`, `fallback`, `order`) VALUES
(1, 'en', 'English', 'en', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_likes`
--

CREATE TABLE `engine4_core_likes` (
  `like_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `poster_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_likes`
--

INSERT INTO `engine4_core_likes` (`like_id`, `resource_type`, `resource_id`, `poster_type`, `poster_id`) VALUES
(2, 'core_comment', 1, 'user', 2),
(3, 'airport_expect', 2, 'user', 2),
(4, 'airport_threat', 60, 'user', 2),
(5, 'core_comment', 3, 'user', 2),
(7, 'airport_expect', 2, 'user', 1),
(8, 'core_comment', 10, 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_links`
--

CREATE TABLE `engine4_core_links` (
  `link_id` int(11) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parent_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL,
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `view_count` mediumint(6) UNSIGNED NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT 1,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_listitems`
--

CREATE TABLE `engine4_core_listitems` (
  `listitem_id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_lists`
--

CREATE TABLE `engine4_core_lists` (
  `list_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `child_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `child_count` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_log`
--

CREATE TABLE `engine4_core_log` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `plugin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(2) NOT NULL DEFAULT 6,
  `priorityName` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INFO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_mail`
--

CREATE TABLE `engine4_core_mail` (
  `mail_id` int(11) UNSIGNED NOT NULL,
  `type` enum('system','zend') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(3) DEFAULT 100,
  `recipient_count` int(11) UNSIGNED DEFAULT 0,
  `recipient_total` int(10) NOT NULL DEFAULT 0,
  `creation_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_mail`
--

INSERT INTO `engine4_core_mail` (`mail_id`, `type`, `body`, `priority`, `recipient_count`, `recipient_total`, `creation_time`) VALUES
(1, 'system', 'a:2:{s:4:\"type\";s:21:\"notify_friend_request\";s:6:\"params\";a:13:{s:4:\"host\";s:18:\"threat-forward.com\";s:5:\"email\";s:13:\"test@test.com\";s:4:\"date\";i:1567676054;s:15:\"recipient_title\";s:6:\"SD Dev\";s:14:\"recipient_link\";s:10:\"/profile/2\";s:15:\"recipient_photo\";s:52:\"/public/user/04/14bdcd0136bd21d94223638f787c0b01.png\";s:12:\"sender_title\";s:5:\"Admin\";s:11:\"sender_link\";s:14:\"/profile/Admin\";s:12:\"sender_photo\";s:71:\"//application/modules/User/externals/images/nophoto_user_thumb_icon.png\";s:12:\"object_title\";s:6:\"SD Dev\";s:11:\"object_link\";s:10:\"/profile/2\";s:12:\"object_photo\";s:52:\"/public/user/04/14bdcd0136bd21d94223638f787c0b01.png\";s:18:\"object_description\";s:0:\"\";}}', 100, 1, 0, '2019-09-05 09:34:14'),
(2, 'system', 'a:2:{s:4:\"type\";s:22:\"notify_friend_accepted\";s:6:\"params\";a:13:{s:4:\"host\";s:18:\"threat-forward.com\";s:5:\"email\";s:15:\"mjmalik@msn.com\";s:4:\"date\";i:1567676164;s:15:\"recipient_title\";s:5:\"Admin\";s:14:\"recipient_link\";s:14:\"/profile/Admin\";s:15:\"recipient_photo\";s:71:\"//application/modules/User/externals/images/nophoto_user_thumb_icon.png\";s:12:\"sender_title\";s:6:\"SD Dev\";s:11:\"sender_link\";s:10:\"/profile/2\";s:12:\"sender_photo\";s:52:\"/public/user/04/14bdcd0136bd21d94223638f787c0b01.png\";s:12:\"object_title\";s:5:\"Admin\";s:11:\"object_link\";s:14:\"/profile/Admin\";s:12:\"object_photo\";N;s:18:\"object_description\";s:0:\"\";}}', 100, 1, 0, '2019-09-05 09:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_mailrecipients`
--

CREATE TABLE `engine4_core_mailrecipients` (
  `recipient_id` int(11) UNSIGNED NOT NULL,
  `mail_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_mailrecipients`
--

INSERT INTO `engine4_core_mailrecipients` (`recipient_id`, `mail_id`, `user_id`, `email`) VALUES
(1, 1, 2, NULL),
(2, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_mailtemplates`
--

CREATE TABLE `engine4_core_mailtemplates` (
  `mailtemplate_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vars` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_mailtemplates`
--

INSERT INTO `engine4_core_mailtemplates` (`mailtemplate_id`, `type`, `module`, `vars`) VALUES
(1, 'header', 'core', ''),
(2, 'footer', 'core', ''),
(3, 'header_member', 'core', ''),
(4, 'footer_member', 'core', ''),
(5, 'core_contact', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_name],[sender_email],[sender_link],[sender_photo],[message]'),
(6, 'core_verification', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),
(7, 'core_verification_password', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link],[password]'),
(8, 'core_welcome', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),
(9, 'core_welcome_password', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link],[password]'),
(10, 'notify_admin_user_signup', 'core', '[host],[email],[date],[recipient_title],[object_title],[object_link]'),
(11, 'core_lostpassword', 'core', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),
(12, 'notify_commented', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(13, 'notify_commented_commented', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(14, 'notify_liked', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(15, 'notify_liked_commented', 'activity', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(16, 'user_account_approved', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo]'),
(17, 'notify_friend_accepted', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(18, 'notify_friend_request', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(19, 'notify_friend_follow_request', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(20, 'notify_friend_follow_accepted', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(21, 'notify_friend_follow', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(22, 'notify_post_user', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(23, 'notify_tagged', 'user', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(24, 'notify_message_new', 'messages', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),
(25, 'invite', 'invite', '[host],[email],[sender_email],[sender_title],[sender_link],[sender_photo],[message],[object_link],[code]'),
(26, 'invite_code', 'invite', '[host],[email],[sender_email],[sender_title],[sender_link],[sender_photo],[message],[object_link],[code]'),
(27, 'payment_subscription_active', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(28, 'payment_subscription_cancelled', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(29, 'payment_subscription_expired', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(30, 'payment_subscription_overdue', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(31, 'payment_subscription_pending', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(32, 'payment_subscription_recurrence', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),
(33, 'payment_subscription_refunded', 'payment', '[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_menuitems`
--

CREATE TABLE `engine4_core_menuitems` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `submenu` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `custom` tinyint(1) NOT NULL DEFAULT 0,
  `order` smallint(6) NOT NULL DEFAULT 999
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_menuitems`
--

INSERT INTO `engine4_core_menuitems` (`id`, `name`, `module`, `label`, `plugin`, `params`, `menu`, `submenu`, `enabled`, `custom`, `order`) VALUES
(1, 'core_main_home', 'core', 'Home', 'User_Plugin_Menus', '{\"icon\":\"fa-home\"}', 'core_main', '', 1, 0, 1),
(2, 'core_sitemap_home', 'core', 'Home', '', '{\"route\":\"default\"}', 'core_sitemap', '', 1, 0, 1),
(3, 'core_footer_privacy', 'core', 'Privacy', '', '{\"route\":\"default\",\"module\":\"core\",\"controller\":\"help\",\"action\":\"privacy\"}', 'core_footer', '', 1, 0, 1),
(4, 'core_footer_terms', 'core', 'Terms of Service', '', '{\"route\":\"default\",\"module\":\"core\",\"controller\":\"help\",\"action\":\"terms\"}', 'core_footer', '', 1, 0, 2),
(5, 'core_footer_contact', 'core', 'Contact', '', '{\"route\":\"default\",\"module\":\"core\",\"controller\":\"help\",\"action\":\"contact\"}', 'core_footer', '', 1, 0, 3),
(6, 'core_mini_update', 'activity', 'Updates', 'Activity_Plugin_Menus', '', 'core_mini', '', 1, 0, 1),
(7, 'core_mini_admin', 'core', 'Admin', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 2),
(8, 'core_mini_profile', 'user', 'My Profile', 'User_Plugin_Menus', '', 'core_mini', 'user_settings', 1, 0, 3),
(9, 'core_mini_settings', 'user', 'Settings', 'User_Plugin_Menus', '', 'core_mini', '', 0, 0, 5),
(10, 'core_mini_auth', 'user', 'Auth', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 6),
(11, 'core_mini_signup', 'user', 'Signup', 'User_Plugin_Menus', '', 'core_mini', '', 1, 0, 7),
(12, 'core_admin_main_home', 'core', 'Home', '', '{\"route\":\"admin_default\"}', 'core_admin_main', '', 1, 0, 1),
(13, 'core_admin_main_manage', 'core', 'Manage', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_manage', 1, 0, 2),
(14, 'core_admin_main_settings', 'core', 'Settings', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_settings', 1, 0, 3),
(15, 'core_admin_main_plugins', 'core', 'Plugins', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_plugins', 1, 0, 4),
(16, 'core_admin_main_layout', 'core', 'Appearance', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_layout', 1, 0, 5),
(17, 'core_admin_main_ads', 'core', 'Ads', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_ads', 1, 0, 6),
(18, 'core_admin_main_stats', 'core', 'Stats', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_stats', 1, 0, 8),
(19, 'core_admin_main_manage_levels', 'core', 'Member Levels', '', '{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\"}', 'core_admin_main_manage', '', 1, 0, 2),
(20, 'core_admin_main_manage_networks', 'network', 'Networks', '', '{\"route\":\"admin_default\",\"module\":\"network\",\"controller\":\"manage\"}', 'core_admin_main_manage', '', 1, 0, 3),
(21, 'core_admin_main_manage_announcements', 'announcement', 'Announcements', '', '{\"route\":\"admin_default\",\"module\":\"announcement\",\"controller\":\"manage\"}', 'core_admin_main_manage', '', 1, 0, 4),
(22, 'core_admin_message_mail', 'core', 'Email All Members', '', '{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"message\",\"action\":\"mail\"}', 'core_admin_main_manage', '', 1, 0, 5),
(23, 'core_admin_main_manage_reports', 'core', 'Abuse Reports', '', '{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"report\"}', 'core_admin_main_manage', '', 1, 0, 6),
(24, 'core_admin_main_manage_packages', 'core', 'Packages & Plugins', '', '{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"packages\"}', 'core_admin_main_manage', '', 1, 0, 7),
(25, 'core_admin_main_settings_general', 'core', 'General Settings', '', '{\"route\":\"core_admin_settings\",\"action\":\"general\"}', 'core_admin_main_settings', '', 1, 0, 1),
(26, 'core_admin_main_settings_locale', 'core', 'Locale Settings', '', '{\"route\":\"core_admin_settings\",\"action\":\"locale\"}', 'core_admin_main_settings', '', 1, 0, 1),
(27, 'core_admin_main_settings_fields', 'fields', 'Profile Questions', '', '{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"fields\"}', 'core_admin_main_settings', '', 1, 0, 2),
(28, 'core_admin_main_wibiya', 'core', 'Wibiya Integration', '', '{\"route\":\"admin_default\", \"action\":\"wibiya\", \"controller\":\"settings\", \"module\":\"core\"}', 'core_admin_main_settings', '', 1, 0, 4),
(29, 'core_admin_main_settings_spam', 'core', 'Spam & Banning Tools', '', '{\"route\":\"core_admin_settings\",\"action\":\"spam\"}', 'core_admin_main_settings', '', 1, 0, 5),
(30, 'core_admin_main_settings_mailtemplates', 'core', 'Mail Templates', '', '{\"route\":\"admin_default\",\"controller\":\"mail\",\"action\":\"templates\"}', 'core_admin_main_settings', '', 1, 0, 6),
(31, 'core_admin_main_settings_mailsettings', 'core', 'Mail Settings', '', '{\"route\":\"admin_default\",\"controller\":\"mail\",\"action\":\"settings\"}', 'core_admin_main_settings', '', 1, 0, 7),
(32, 'core_admin_main_settings_performance', 'core', 'Performance & Caching', '', '{\"route\":\"core_admin_settings\",\"action\":\"performance\"}', 'core_admin_main_settings', '', 1, 0, 8),
(33, 'core_admin_main_settings_password', 'core', 'Admin Password', '', '{\"route\":\"core_admin_settings\",\"action\":\"password\"}', 'core_admin_main_settings', '', 1, 0, 9),
(34, 'core_admin_main_settings_tasks', 'core', 'Task Scheduler', '', '{\"route\":\"admin_default\",\"controller\":\"tasks\"}', 'core_admin_main_settings', '', 1, 0, 10),
(35, 'core_admin_main_settings_iframely', 'core', 'Iframely Integration', '', '{\"route\":\"admin_default\",\"controller\":\"iframely\"}', 'core_admin_main_settings', '', 1, 0, 11),
(36, 'core_admin_main_layout_content', 'core', 'Layout Editor', '', '{\"route\":\"admin_default\",\"controller\":\"content\"}', 'core_admin_main_layout', '', 1, 0, 1),
(37, 'core_admin_main_layout_themes', 'core', 'Theme Editor', '', '{\"route\":\"admin_default\",\"controller\":\"themes\"}', 'core_admin_main_layout', '', 1, 0, 2),
(38, 'core_admin_main_layout_files', 'core', 'File & Media Manager', '', '{\"route\":\"admin_default\",\"controller\":\"files\"}', 'core_admin_main_layout', '', 1, 0, 3),
(39, 'core_admin_main_layout_language', 'core', 'Language Manager', '', '{\"route\":\"admin_default\",\"controller\":\"language\"}', 'core_admin_main_layout', '', 1, 0, 4),
(40, 'core_admin_main_layout_menus', 'core', 'Menu Editor', '', '{\"route\":\"admin_default\",\"controller\":\"menus\"}', 'core_admin_main_layout', '', 1, 0, 5),
(41, 'core_admin_main_layout_banners', 'core', 'Banner Manager', '', '{\"route\":\"admin_default\",\"controller\":\"banners\"}', 'core_admin_main_layout', '', 1, 0, 6),
(42, 'core_admin_main_ads_manage', 'core', 'Manage Ad Campaigns', '', '{\"route\":\"admin_default\",\"controller\":\"ads\"}', 'core_admin_main_ads', '', 1, 0, 1),
(43, 'core_admin_main_ads_create', 'core', 'Create New Campaign', '', '{\"route\":\"admin_default\",\"controller\":\"ads\",\"action\":\"create\"}', 'core_admin_main_ads', '', 1, 0, 2),
(44, 'core_admin_main_ads_affiliate', 'core', 'SE Affiliate Program', '', '{\"route\":\"admin_default\",\"controller\":\"settings\",\"action\":\"affiliate\"}', 'core_admin_main_ads', '', 1, 0, 3),
(45, 'core_admin_main_ads_viglink', 'core', 'VigLink', '', '{\"route\":\"admin_default\",\"controller\":\"settings\",\"action\":\"viglink\"}', 'core_admin_main_ads', '', 1, 0, 4),
(46, 'core_admin_main_stats_statistics', 'core', 'Site-wide Statistics', '', '{\"route\":\"admin_default\",\"controller\":\"stats\"}', 'core_admin_main_stats', '', 1, 0, 1),
(47, 'core_admin_main_stats_url', 'core', 'Referring URLs', '', '{\"route\":\"admin_default\",\"controller\":\"stats\",\"action\":\"referrers\"}', 'core_admin_main_stats', '', 1, 0, 2),
(48, 'core_admin_main_stats_resources', 'core', 'Server Information', '', '{\"route\":\"admin_default\",\"controller\":\"system\"}', 'core_admin_main_stats', '', 1, 0, 3),
(49, 'core_admin_main_stats_logs', 'core', 'Log Browser', '', '{\"route\":\"admin_default\",\"controller\":\"log\",\"action\":\"index\"}', 'core_admin_main_stats', '', 1, 0, 3),
(50, 'core_admin_banning_general', 'core', 'Spam & Banning Tools', '', '{\"route\":\"core_admin_settings\",\"action\":\"spam\"}', 'core_admin_banning', '', 1, 0, 1),
(51, 'adcampaign_admin_main_edit', 'core', 'Edit Settings', '', '{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"ads\",\"action\":\"edit\"}', 'adcampaign_admin_main', '', 1, 0, 1),
(52, 'adcampaign_admin_main_manageads', 'core', 'Manage Advertisements', '', '{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"ads\",\"action\":\"manageads\"}', 'adcampaign_admin_main', '', 1, 0, 2),
(53, 'core_social_site_facebook', 'core', 'Facebook', '', '{\"uri\": \"\",\"target\":\"_blank\", \"icon\":\"fa-facebook\"}', 'core_social_sites', NULL, 0, 1, 1),
(54, 'core_social_site_twitter', 'core', 'Twitter', '', '{\"uri\": \"\",\"target\":\"_blank\", \"icon\":\"fa-twitter\"}', 'core_social_sites', NULL, 0, 1, 2),
(55, 'core_social_site_linkedin', 'core', 'Linkedin', '', '{\"uri\": \"\",\"target\":\"_blank\", \"icon\":\"fa-linkedin\"}', 'core_social_sites', NULL, 0, 1, 3),
(56, 'core_social_site_youtube', 'core', 'Youtube', '', '{\"uri\": \"\",\"target\":\"_blank\", \"icon\":\"fa-youtube\"}', 'core_social_sites', NULL, 0, 1, 4),
(57, 'core_social_site_googleplus', 'core', 'Google +', '', '{\"uri\": \"\",\"target\":\"_blank\", \"icon\":\"fa-google-plus\"}', 'core_social_sites', NULL, 0, 1, 5),
(58, 'core_social_site_pinterest', 'core', 'Pinterest', '', '{\"uri\": \"\",\"target\":\"_blank\", \"icon\":\"fa-pinterest\"}', 'core_social_sites', NULL, 0, 1, 6),
(59, 'authorization_admin_main_manage', 'authorization', 'View Member Levels', '', '{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\"}', 'authorization_admin_main', '', 1, 0, 1),
(60, 'authorization_admin_main_level', 'authorization', 'Member Level Settings', '', '{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\",\"action\":\"edit\"}', 'authorization_admin_main', '', 1, 0, 3),
(61, 'authorization_admin_level_main', 'authorization', 'Level Info', '', '{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\",\"action\":\"edit\"}', 'authorization_admin_level', '', 1, 0, 1),
(62, 'authorization_admin_main_level_mapprofiletype', 'authorization', 'Profile Types and Levels Mapping', '', '{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\",\"action\":\"manage-profile-type-mapping\"}', 'authorization_admin_main', '', 1, 0, 4),
(63, 'core_admin_main_settings_activity', 'activity', 'Activity Feed Settings', '', '{\"route\":\"admin_default\",\"module\":\"activity\",\"controller\":\"settings\",\"action\":\"index\"}', 'core_admin_main_settings', '', 1, 0, 4),
(64, 'core_admin_main_settings_notifications', 'activity', 'Default Email Notifications', '', '{\"route\":\"admin_default\",\"module\":\"activity\",\"controller\":\"settings\",\"action\":\"notifications\"}', 'core_admin_main_settings', '', 1, 0, 11),
(65, 'core_main_user', 'user', 'Members', '', '{\"route\":\"user_general\",\"action\":\"browse\",\"icon\":\"fa-user\"}', 'core_main', '', 0, 0, 4),
(66, 'core_sitemap_user', 'user', 'Members', '', '{\"route\":\"user_general\",\"action\":\"browse\"}', 'core_sitemap', '', 1, 0, 2),
(67, 'user_home_updates', 'user', 'View Recent Updates', '', '{\"route\":\"recent_activity\"}', 'user_home', '', 1, 0, 1),
(68, 'user_home_view', 'user', 'View My Profile', 'User_Plugin_Menus', '{\"route\":\"user_profile_self\"}', 'user_home', '', 1, 0, 2),
(69, 'user_home_edit', 'user', 'Edit My Profile', 'User_Plugin_Menus', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"profile\"}', 'user_home', '', 1, 0, 3),
(70, 'user_home_friends', 'user', 'Browse Members', '', '{\"route\":\"user_general\",\"controller\":\"index\",\"action\":\"browse\"}', 'user_home', '', 1, 0, 4),
(71, 'user_profile_edit', 'user', 'Edit Profile', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 1),
(72, 'user_profile_friend', 'user', 'Friends', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 3),
(73, 'user_profile_block', 'user', 'Block', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 4),
(74, 'user_profile_report', 'user', 'Report User', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 5),
(75, 'user_profile_admin', 'user', 'Admin Settings', 'User_Plugin_Menus', '', 'user_profile', '', 1, 0, 9),
(76, 'user_edit_profile', 'user', 'Personal Info', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"profile\"}', 'user_edit', '', 1, 0, 1),
(77, 'user_edit_photo', 'user', 'Edit My Photo', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"photo\"}', 'user_edit', '', 1, 0, 2),
(78, 'user_edit_style', 'user', 'Profile Style', 'User_Plugin_Menus', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"style\"}', 'user_edit', '', 1, 0, 3),
(79, 'user_delete_photos', 'user', 'Delete My Photos', 'User_Plugin_Menus', '', 'user_edit', '', 1, 0, 4),
(80, 'user_settings_general', 'user', 'General', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"general\"}', 'user_settings', '', 1, 0, 6),
(81, 'user_settings_privacy', 'user', 'Privacy', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"privacy\"}', 'user_settings', '', 1, 0, 7),
(82, 'user_settings_notifications', 'user', 'Notifications', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"notifications\"}', 'user_settings', '', 0, 0, 5),
(83, 'user_settings_password', 'user', 'Change Password', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"password\"}', 'user_settings', '', 1, 0, 10),
(84, 'user_settings_delete', 'user', 'Delete Account', 'User_Plugin_Menus::canDelete', '{\"route\":\"user_extended\", \"module\":\"user\", \"controller\":\"settings\", \"action\":\"delete\"}', 'user_settings', '', 1, 0, 11),
(85, 'core_admin_main_manage_members', 'user', 'Members', '', '{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"manage\"}', 'core_admin_main_manage', '', 1, 0, 1),
(86, 'core_admin_main_signup', 'user', 'Signup Process', '', '{\"route\":\"admin_default\", \"controller\":\"signup\", \"module\":\"user\"}', 'core_admin_main_settings', '', 1, 0, 3),
(87, 'core_admin_main_facebook', 'user', 'Facebook Integration', '', '{\"route\":\"admin_default\", \"action\":\"facebook\", \"controller\":\"settings\", \"module\":\"user\"}', 'core_admin_main_settings', '', 1, 0, 4),
(88, 'core_admin_main_twitter', 'user', 'Twitter Integration', '', '{\"route\":\"admin_default\", \"action\":\"twitter\", \"controller\":\"settings\", \"module\":\"user\"}', 'core_admin_main_settings', '', 1, 0, 4),
(89, 'core_admin_main_janrain', 'user', 'Janrain Integration', '', '{\"route\":\"admin_default\", \"action\":\"janrain\", \"controller\":\"settings\", \"module\":\"user\"}', 'core_admin_main_settings', '', 1, 0, 4),
(90, 'core_admin_main_settings_friends', 'user', 'Friendship Settings', '', '{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"friends\"}', 'core_admin_main_settings', '', 1, 0, 6),
(91, 'user_admin_banning_logins', 'user', 'Login History', '', '{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"logins\",\"action\":\"index\"}', 'core_admin_banning', '', 1, 0, 2),
(92, 'authorization_admin_level_user', 'user', 'Members', '', '{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"level\"}', 'authorization_admin_level', '', 1, 0, 2),
(93, 'core_mini_messages', 'messages', 'Messages', 'Messages_Plugin_Menus', '', 'core_mini', '', 0, 0, 4),
(94, 'user_profile_message', 'messages', 'Send Message', 'Messages_Plugin_Menus', '', 'user_profile', '', 1, 0, 2),
(95, 'authorization_admin_level_messages', 'messages', 'Messages', '', '{\"route\":\"admin_default\",\"module\":\"messages\",\"controller\":\"settings\",\"action\":\"level\"}', 'authorization_admin_level', '', 1, 0, 3),
(96, 'messages_main_inbox', 'messages', 'Inbox', '', '{\"route\":\"messages_general\",\"action\":\"inbox\"}', 'messages_main', '', 1, 0, 1),
(97, 'messages_main_outbox', 'messages', 'Sent Messages', '', '{\"route\":\"messages_general\",\"action\":\"outbox\"}', 'messages_main', '', 1, 0, 2),
(98, 'messages_main_compose', 'messages', 'Compose Message', '', '{\"route\":\"messages_general\",\"action\":\"compose\"}', 'messages_main', '', 1, 0, 3),
(99, 'user_settings_network', 'network', 'Networks', '', '{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"network\"}', 'user_settings', '', 1, 0, 8),
(100, 'core_main_invite', 'invite', 'Invite', 'Invite_Plugin_Menus::canInvite', '{\"route\":\"default\",\"module\":\"invite\",\"icon\":\"fa-envelope\"}', 'core_main', '', 1, 0, 3),
(101, 'user_home_invite', 'invite', 'Invite Your Friends', 'Invite_Plugin_Menus::canInvite', '{\"route\":\"default\",\"module\":\"invite\"}', 'user_home', '', 1, 0, 5),
(102, 'core_admin_main_settings_storage', 'core', 'Storage System', '', '{\"route\":\"admin_default\",\"module\":\"storage\",\"controller\":\"services\",\"action\":\"index\"}', 'core_admin_main_settings', '', 1, 0, 11),
(103, 'user_settings_payment', 'user', 'Subscription', 'Payment_Plugin_Menus', '{\"route\":\"default\", \"module\":\"payment\", \"controller\":\"settings\", \"action\":\"index\"}', 'user_settings', '', 1, 0, 9),
(104, 'core_admin_main_payment', 'payment', 'Billing', '', '{\"uri\":\"javascript:void(0);this.blur();\"}', 'core_admin_main', 'core_admin_main_payment', 1, 0, 7),
(105, 'core_admin_main_payment_transactions', 'payment', 'Transactions', '', '{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"index\",\"action\":\"index\"}', 'core_admin_main_payment', '', 1, 0, 1),
(106, 'core_admin_main_payment_settings', 'payment', 'Settings', '', '{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"settings\",\"action\":\"index\"}', 'core_admin_main_payment', '', 1, 0, 2),
(107, 'core_admin_main_payment_gateways', 'payment', 'Gateways', '', '{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"gateway\",\"action\":\"index\"}', 'core_admin_main_payment', '', 1, 0, 3),
(108, 'core_admin_main_payment_packages', 'payment', 'Plans', '', '{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"package\",\"action\":\"index\"}', 'core_admin_main_payment', '', 1, 0, 4),
(109, 'core_admin_main_payment_subscriptions', 'payment', 'Subscriptions', '', '{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"subscription\",\"action\":\"index\"}', 'core_admin_main_payment', '', 1, 0, 5),
(110, 'custom_110', 'core', 'Privacy', '', '{\"uri\":\"help\\/privacy\",\"icon\":\"fa fa-user-secret\"}', 'core_main', '', 1, 1, 5),
(111, 'custom_111', 'core', 'Terms', '', '{\"uri\":\"help\\/terms\",\"icon\":\"fa fa-sticky-note\"}', 'core_main', '', 1, 1, 6),
(112, 'custom_112', 'core', 'Contact', '', '{\"uri\":\"help\\/contact\",\"icon\":\"fa fa-address-book\"}', 'core_main', '', 1, 1, 7),
(113, 'custom_113', 'core', 'Logout', '', '{\"uri\":\"logout\",\"icon\":\"\",\"target\":\"\",\"enabled\":\"1\"}', 'user_settings', '', 1, 1, 12),
(115, 'custom_115', 'core', 'Messages', '', '{\"uri\":\"messages\\/inbox\",\"icon\":\"\",\"target\":\"\",\"enabled\":\"1\"}', 'user_settings', '', 1, 1, 3),
(119, 'airport_admin_main_manage', 'airport', 'Manage Airports', '', '{\"route\":\"admin_default\",\"module\":\"airport\",\"controller\":\"manage\"}', 'airport_admin_main', '', 1, 0, 1),
(120, 'core_admin_main_plugins_airport', 'airport', 'SD - Airports', '', '{\"route\":\"admin_default\",\"module\":\"airport\",\"controller\":\"manage\"}', 'core_admin_main_plugins', '', 1, 0, 999),
(121, 'custom_121', 'core', 'Notifications', '', '{\"uri\":\"activity\\/notifications\"}', 'user_settings', '', 1, 1, 4),
(122, 'airport_admin_main_level', 'airport', 'Member Level Settings', '', '{\"route\":\"admin_default\",\"module\":\"airport\",\"controller\":\"settings\",\"action\":\"level\"}', 'airport_admin_main', '', 0, 0, 2),
(124, 'user_settings_profile', 'user', 'My Profile', 'User_Plugin_Menus', '', 'user_settings', '', 1, 0, 1),
(125, 'custom_125', 'core', 'Edit profile', '', '{\"uri\":\"members\\/edit\\/profile\",\"icon\":\"\",\"target\":\"\",\"enabled\":\"1\"}', 'user_settings', '', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_menus`
--

CREATE TABLE `engine4_core_menus` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `type` enum('standard','hidden','custom') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'standard',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(3) NOT NULL DEFAULT 999
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_menus`
--

INSERT INTO `engine4_core_menus` (`id`, `name`, `type`, `title`, `order`) VALUES
(1, 'core_main', 'standard', 'Main Navigation Menu', 1),
(2, 'core_mini', 'standard', 'Mini Navigation Menu', 2),
(3, 'core_footer', 'standard', 'Footer Menu', 3),
(4, 'core_sitemap', 'standard', 'Sitemap', 4),
(5, 'core_social_sites', 'standard', 'Social Site Links Menu', 5),
(6, 'user_home', 'standard', 'Member Home Quick Links Menu', 999),
(7, 'user_profile', 'standard', 'Member Profile Options Menu', 999),
(8, 'user_edit', 'standard', 'Member Edit Profile Navigation Menu', 999),
(9, 'user_browse', 'standard', 'Member Browse Navigation Menu', 999),
(10, 'user_settings', 'standard', 'Member Settings Navigation Menu', 999),
(11, 'messages_main', 'standard', 'Messages Main Navigation Menu', 999);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_migrations`
--

CREATE TABLE `engine4_core_migrations` (
  `package` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `current` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_modules`
--

CREATE TABLE `engine4_core_modules` (
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('core','standard','extra') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'extra'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_modules`
--

INSERT INTO `engine4_core_modules` (`name`, `title`, `description`, `version`, `enabled`, `type`) VALUES
('activity', 'Activity', 'Activity', '4.10.4', 1, 'core'),
('airport', 'SD - Airports', 'SD - Airports', '4.10.3p6', 1, 'extra'),
('announcement', 'Announcements', 'Announcements', '4.10.4', 1, 'standard'),
('authorization', 'Authorization', 'Authorization', '4.10.4', 1, 'core'),
('core', 'Core', 'Core', '4.10.4', 1, 'core'),
('fields', 'Fields', 'Fields', '4.10.4', 1, 'core'),
('invite', 'Invite', 'Invite', '4.10.4', 1, 'standard'),
('messages', 'Messages', 'Messages', '4.10.4', 1, 'standard'),
('network', 'Networks', 'Networks', '4.10.4', 1, 'standard'),
('payment', 'Payment', 'Payment', '4.10.4', 1, 'standard'),
('storage', 'Storage', 'Storage', '4.10.4', 1, 'core'),
('user', 'Members', 'Members', '4.10.4', 1, 'core');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_nodes`
--

CREATE TABLE `engine4_core_nodes` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `signature` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_pages`
--

CREATE TABLE `engine4_core_pages` (
  `page_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `displayname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `custom` tinyint(1) NOT NULL DEFAULT 1,
  `fragment` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `levels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `provides` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `search` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_pages`
--

INSERT INTO `engine4_core_pages` (`page_id`, `name`, `displayname`, `url`, `title`, `description`, `keywords`, `custom`, `fragment`, `layout`, `levels`, `provides`, `view_count`, `search`) VALUES
(1, 'header', 'Site Header', NULL, '', '', '', 0, 1, '', NULL, 'header-footer', 0, 0),
(2, 'footer', 'Site Footer', NULL, '', '', '', 0, 1, '', NULL, 'header-footer', 0, 0),
(3, 'core_index_index', 'Landing Page', NULL, 'Landing Page', 'This is your site\'s landing page.', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(4, 'user_index_home', 'Member Home Page', NULL, 'Member Home Page', 'This is the home page for members.', '', 0, 0, '', NULL, 'viewer;no-subject', 0, 0),
(5, 'user_profile_index', 'Member Profile', NULL, 'Member Profile', 'This is a member\'s profile.', '', 0, 0, '', NULL, 'subject=user', 0, 0),
(6, 'core_help_contact', 'Contact Page', NULL, 'Contact Us', 'This is the contact page', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(7, 'core_help_privacy', 'Privacy Page', NULL, 'Privacy Policy', 'This is the privacy policy page', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(8, 'core_help_terms', 'Terms of Service Page', NULL, 'Terms of Service', 'This is the terms of service page', '', 0, 0, '', NULL, 'no-viewer;no-subject', 0, 0),
(9, 'core_hashtag_index', 'Hashtag Results Page', NULL, 'Hashtag Results Page', 'This page displays searched hashtags.', '', 0, 0, '', NULL, NULL, 0, 0),
(10, 'core_error_requireuser', 'Sign-in Required Page', NULL, 'Sign-in Required', '', '', 0, 0, '', NULL, NULL, 0, 0),
(11, 'core_search_index', 'Search Page', NULL, 'Search Results', '', '', 0, 0, '', NULL, NULL, 0, 0),
(12, 'user_auth_login', 'Sign-in Page', NULL, 'Sign-in', 'This is the site sign-in page.', '', 0, 0, 'default', NULL, NULL, 0, 0),
(13, 'user_signup_index', 'Sign-up Page', NULL, 'Sign-up', 'This is the site sign-up page.', '', 0, 0, 'default', NULL, NULL, 0, 0),
(14, 'user_auth_forgot', 'Forgot Password Page', NULL, 'Forgot Password', 'This is the site forgot password page.', '', 0, 0, '', NULL, NULL, 0, 0),
(15, 'user_settings_general', 'User General Settings Page', NULL, 'General', 'This page is the user general settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(16, 'user_settings_privacy', 'User Privacy Settings Page', NULL, 'Privacy', 'This page is the user privacy settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(17, 'user_settings_network', 'User Networks Settings Page', NULL, 'Networks', 'This page is the user networks settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(18, 'user_settings_notifications', 'User Notifications Settings Page', NULL, 'Notifications', 'This page is the user notification settings page.', '', 0, 0, '', NULL, NULL, 0, 0),
(19, 'user_settings_password', 'User Change Password Settings Page', NULL, 'Change Password', 'This page is the change password page.', '', 0, 0, '', NULL, NULL, 0, 0),
(20, 'user_settings_delete', 'User Delete Account Settings Page', NULL, 'Delete Account', 'This page is the delete accout page.', '', 0, 0, '', NULL, NULL, 0, 0),
(21, 'user_index_browse', 'Member Browse Page', NULL, 'Member Browse', 'This page show member lists.', '', 0, 0, '', NULL, NULL, 0, 0),
(22, 'invite_index_index', 'Invite Page', NULL, 'Invite', '', '', 0, 0, '', NULL, NULL, 0, 0),
(23, 'messages_messages_compose', 'Messages Compose Page', NULL, 'Compose', '', '', 0, 0, '', NULL, NULL, 0, 0),
(24, 'messages_messages_inbox', 'Messages Inbox Page', NULL, 'Inbox', '', '', 0, 0, '', NULL, NULL, 0, 0),
(25, 'messages_messages_outbox', 'Messages Outbox Page', NULL, 'Inbox', '', '', 0, 0, '', NULL, NULL, 0, 0),
(26, 'messages_messages_search', 'Messages Search Page', NULL, 'Search', '', '', 0, 0, '', NULL, NULL, 0, 0),
(27, 'messages_messages_view', 'Messages View Page', NULL, 'My Message', '', '', 0, 0, '', NULL, NULL, 0, 0),
(29, 'airport_profile_index', 'Airport Profile Page', NULL, '', '', '', 1, 0, '', NULL, 'no-subject', 0, 0),
(30, 'airport_expect_view', 'Airport Expect Profile Page', NULL, '', '', '', 1, 0, '', NULL, 'no-subject', 0, 0),
(31, 'airport_threat_view', 'Airport Threat Profile Page', NULL, '', '', '', 1, 0, '', NULL, 'no-subject', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_processes`
--

CREATE TABLE `engine4_core_processes` (
  `pid` int(10) UNSIGNED NOT NULL,
  `parent_pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `system_pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `started` int(10) UNSIGNED NOT NULL,
  `timeout` mediumint(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_referrers`
--

CREATE TABLE `engine4_core_referrers` (
  `host` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `query` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_referrers`
--

INSERT INTO `engine4_core_referrers` (`host`, `path`, `query`, `value`) VALUES
('brandnewblogs.com', '/', 'domain=threat-forward.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_reports`
--

CREATE TABLE `engine4_core_reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_routes`
--

CREATE TABLE `engine4_core_routes` (
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_search`
--

CREATE TABLE `engine4_core_search` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_search`
--

INSERT INTO `engine4_core_search` (`type`, `id`, `title`, `description`, `keywords`, `hidden`) VALUES
('user', 2, 'SD Dev', '', '', ''),
('airport', 587, 'Test Airport', 'test description 2', '', ''),
('airport_expect', 1, 'Lahore', '', '', ''),
('airport_expect', 2, 'Lahore', '', '', ''),
('airport_expect', 3, 'Lahore', '', '', ''),
('airport_expect', 4, 'Lahore', '', '', ''),
('airport_expect', 5, 'Lahore', '', '', ''),
('airport_threat', 1, 'Lahore', '', '', ''),
('airport_threat', 2, 'Lahore', '', '', ''),
('airport_threat', 3, 'Lahore', '', '', ''),
('airport_threat', 4, 'Lahore', '', '', ''),
('airport_threat', 5, 'Lahore', '', '', ''),
('airport_threat', 6, 'Lahore', '', '', ''),
('airport_threat', 7, 'Lahore', '', '', ''),
('airport_threat', 8, 'Lahore', '', '', ''),
('airport_threat', 9, 'Lahore', '', '', ''),
('airport_threat', 10, 'Lahore', '', '', ''),
('airport_threat', 11, 'Lahore', '', '', ''),
('airport_threat', 12, 'Lahore', '', '', ''),
('airport_threat', 13, 'Lahore', '', '', ''),
('airport_threat', 14, 'Lahore', '', '', ''),
('airport_threat', 15, 'Lahore', '', '', ''),
('airport_threat', 16, 'Lahore', '', '', ''),
('airport_threat', 17, 'Lahore', '', '', ''),
('airport_threat', 18, 'Lahore', '', '', ''),
('airport_threat', 19, 'Lahore', '', '', ''),
('airport_threat', 20, 'Lahore', '', '', ''),
('airport_threat', 21, 'Lahore', '', '', ''),
('airport_threat', 22, 'Lahore', '', '', ''),
('airport_threat', 23, 'Lahore', '', '', ''),
('airport_threat', 24, 'Lahore', '', '', ''),
('airport_threat', 25, 'Lahore', '', '', ''),
('airport_threat', 26, 'Lahore', '', '', ''),
('airport_threat', 27, 'Lahore', '', '', ''),
('airport_threat', 28, 'Lahore', '', '', ''),
('airport_threat', 29, 'Lahore', '', '', ''),
('airport_threat', 30, 'Lahore', '', '', ''),
('airport_threat', 31, 'Lahore', '', '', ''),
('airport_threat', 32, 'Lahore', '', '', ''),
('airport_threat', 33, 'Lahore', '', '', ''),
('airport_threat', 34, 'Lahore', '', '', ''),
('airport_threat', 35, 'Lahore', '', '', ''),
('airport_threat', 36, 'Lahore', '', '', ''),
('airport_threat', 37, 'Lahore', '', '', ''),
('airport_threat', 38, 'Lahore', '', '', ''),
('airport_threat', 39, 'Lahore', '', '', ''),
('airport_threat', 40, 'Lahore', '', '', ''),
('airport_threat', 41, 'Lahore', '', '', ''),
('airport_threat', 42, 'Lahore', '', '', ''),
('airport_threat', 43, 'Lahore', '', '', ''),
('airport_threat', 44, 'Lahore', '', '', ''),
('airport_threat', 45, 'Lahore', '', '', ''),
('airport_threat', 46, 'Lahore', '', '', ''),
('airport_threat', 47, 'Lahore', '', '', ''),
('airport_threat', 48, 'Lahore', '', '', ''),
('airport_threat', 49, 'Lahore', '', '', ''),
('airport_threat', 50, 'Lahore', '', '', ''),
('airport_threat', 51, 'Lahore', '', '', ''),
('airport_threat', 52, 'Lahore', '', '', ''),
('airport_threat', 53, 'Lahore', '', '', ''),
('airport_threat', 54, 'Lahore', '', '', ''),
('airport_threat', 55, 'Lahore', '', '', ''),
('airport_threat', 56, 'Lahore', '', '', ''),
('airport_threat', 57, 'Lahore', '', '', ''),
('airport_threat', 58, 'Lahore', '', '', ''),
('airport_threat', 59, 'Lahore', '', '', ''),
('airport_threat', 60, 'Lahore', '', '', ''),
('airport_threat', 61, 'Lahore', '', '', ''),
('airport_threat', 62, 'Lahore', '', '', ''),
('airport_threat', 63, 'Lahore', '', '', ''),
('user', 1, 'Mj Malik', '', '', ''),
('airport_threat', 64, 'Dubai', '', '', ''),
('airport_threat', 65, 'Dubai', '', '', ''),
('airport_threat', 66, 'Dubai', '', '', ''),
('airport_threat', 67, 'Dubai', '', '', ''),
('airport_threat', 68, 'Dubai', '', '', ''),
('airport_threat', 69, 'Dubai', '', '', ''),
('airport_threat', 70, 'Dubai', '', '', ''),
('airport_threat', 71, 'Dubai', '', '', ''),
('airport_threat', 72, 'Dubai', '', '', ''),
('airport_threat', 73, 'Dubai', '', '', ''),
('airport_threat', 74, 'Dubai', '', '', ''),
('airport_threat', 75, 'Dubai', '', '', ''),
('airport_threat', 76, 'Dubai', '', '', ''),
('airport_threat', 77, 'Dubai', '', '', ''),
('airport_threat', 78, 'Dubai', '', '', ''),
('airport_threat', 79, 'Dubai', '', '', ''),
('airport_threat', 80, 'Dubai', '', '', ''),
('airport_threat', 81, 'Dubai', '', '', ''),
('airport_threat', 82, 'Dubai', '', '', ''),
('airport_threat', 83, 'Dubai', '', '', ''),
('airport_threat', 84, 'Dubai', '', '', ''),
('airport_threat', 85, 'Dubai', '', '', ''),
('airport_threat', 86, 'Dubai', '', '', ''),
('airport_threat', 87, 'Dubai', '', '', ''),
('airport_threat', 88, 'Dubai', '', '', ''),
('airport_threat', 89, 'Dubai', '', '', ''),
('airport_threat', 90, 'Dubai', '', '', ''),
('airport_threat', 91, 'Dubai', '', '', ''),
('airport_threat', 92, 'Dubai', '', '', ''),
('airport_threat', 93, 'Dubai', '', '', ''),
('airport_threat', 94, 'Dubai', '', '', ''),
('airport_threat', 95, 'Dubai', '', '', ''),
('airport_threat', 96, 'Dubai', '', '', ''),
('airport_threat', 97, 'Dubai', '', '', ''),
('airport_threat', 98, 'Dubai', '', '', ''),
('airport_threat', 99, 'Dubai', '', '', ''),
('airport_threat', 100, 'Dubai', '', '', ''),
('airport_threat', 101, 'Dubai', '', '', ''),
('airport_threat', 102, 'Dubai', '', '', ''),
('airport_threat', 103, 'Dubai', '', '', ''),
('airport_threat', 104, 'Dubai', '', '', ''),
('airport_threat', 105, 'Dubai', '', '', ''),
('airport_threat', 106, 'Dubai', '', '', ''),
('airport_threat', 107, 'Dubai', '', '', ''),
('airport_threat', 108, 'Dubai', '', '', ''),
('airport_threat', 109, 'Dubai', '', '', ''),
('airport_threat', 110, 'Dubai', '', '', ''),
('airport_threat', 111, 'Dubai', '', '', ''),
('airport_threat', 112, 'Dubai', '', '', ''),
('airport_threat', 113, 'Dubai', '', '', ''),
('airport_threat', 114, 'Dubai', '', '', ''),
('airport_threat', 115, 'Dubai', '', '', ''),
('airport_threat', 116, 'Dubai', '', '', ''),
('airport_threat', 117, 'Dubai', '', '', ''),
('airport_threat', 118, 'Dubai', '', '', ''),
('airport_threat', 119, 'Dubai', '', '', ''),
('airport_threat', 120, 'Dubai', '', '', ''),
('airport_threat', 121, 'Dubai', '', '', ''),
('airport_threat', 122, 'Dubai', '', '', ''),
('airport_expect', 6, 'Dubai', '', '', ''),
('airport_threat', 123, 'Washington', '', '', ''),
('airport_threat', 124, 'Washington', '', '', ''),
('airport_threat', 125, 'Washington', '', '', ''),
('airport_threat', 126, 'Washington', '', '', ''),
('airport_threat', 127, 'Washington', '', '', ''),
('airport_threat', 128, 'Washington', '', '', ''),
('airport_threat', 129, 'Washington', '', '', ''),
('airport_threat', 130, 'Washington', '', '', ''),
('airport_threat', 131, 'Washington', '', '', ''),
('airport_threat', 132, 'Washington', '', '', ''),
('airport_threat', 133, 'Washington', '', '', ''),
('airport_threat', 134, 'Washington', '', '', ''),
('airport_threat', 135, 'Washington', '', '', ''),
('airport_threat', 136, 'Washington', '', '', ''),
('airport_threat', 137, 'Washington', '', '', ''),
('airport_threat', 138, 'Washington', '', '', ''),
('airport_threat', 139, 'Washington', '', '', ''),
('airport_threat', 140, 'Washington', '', '', ''),
('airport_threat', 141, 'Washington', '', '', ''),
('airport_threat', 142, 'Washington', '', '', ''),
('airport_threat', 143, 'Washington', '', '', ''),
('airport_threat', 144, 'Washington', '', '', ''),
('airport_threat', 145, 'Washington', '', '', ''),
('airport_threat', 146, 'Washington', '', '', ''),
('airport_threat', 147, 'Washington', '', '', ''),
('airport_threat', 148, 'Washington', '', '', ''),
('airport_threat', 149, 'Washington', '', '', ''),
('airport_threat', 150, 'Washington', '', '', ''),
('airport_threat', 151, 'Washington', '', '', ''),
('airport_threat', 152, 'Washington', '', '', ''),
('airport_threat', 153, 'Washington', '', '', ''),
('airport_threat', 154, 'Washington', '', '', ''),
('airport_threat', 155, 'Washington', '', '', ''),
('airport_threat', 156, 'Washington', '', '', ''),
('airport_threat', 157, 'Washington', '', '', ''),
('airport_threat', 158, 'Washington', '', '', ''),
('airport_threat', 159, 'Washington', '', '', ''),
('airport_threat', 160, 'Washington', '', '', ''),
('airport_threat', 161, 'Washington', '', '', ''),
('airport_threat', 162, 'Washington', '', '', ''),
('airport_threat', 163, 'Washington', '', '', ''),
('airport_threat', 164, 'Washington', '', '', ''),
('airport_threat', 165, 'Washington', '', '', ''),
('airport_threat', 166, 'Washington', '', '', ''),
('airport_threat', 167, 'Washington', '', '', ''),
('airport_threat', 168, 'Washington', '', '', ''),
('airport_threat', 169, 'Washington', '', '', ''),
('airport_threat', 170, 'Washington', '', '', ''),
('airport_threat', 171, 'Washington', '', '', ''),
('airport_threat', 172, 'Washington', '', '', ''),
('airport_threat', 173, 'Washington', '', '', ''),
('airport_threat', 174, 'Washington', '', '', ''),
('airport_threat', 175, 'Washington', '', '', ''),
('airport_threat', 176, 'Washington', '', '', ''),
('airport_threat', 177, 'Washington', '', '', ''),
('airport_threat', 178, 'Washington', '', '', ''),
('airport_threat', 179, 'Washington', '', '', ''),
('airport_threat', 180, 'Washington', '', '', ''),
('airport_threat', 181, 'Washington', '', '', ''),
('airport_threat', 185, 'Dubai', '', '', ''),
('airport_threat', 186, 'Honiara', '', '', ''),
('airport_threat', 187, 'Honiara', '', '', ''),
('airport_threat', 188, 'Honiara', '', '', ''),
('airport_threat', 189, 'Honiara', '', '', ''),
('airport_threat', 190, 'Honiara', '', '', ''),
('airport_threat', 191, 'Honiara', '', '', ''),
('airport_expect', 7, 'Lahore', '', '', ''),
('airport_expect', 8, 'Honiara', '', '', ''),
('airport_threat', 192, 'Lahore', '', '', ''),
('user', 3, 'Gal  Isakovic', '', '', ''),
('airport_threat', 193, 'Belgrade', '', '', ''),
('airport_threat', 194, 'Belgrade', '', '', ''),
('airport_threat', 195, 'Belgrade', '', '', ''),
('airport_threat', 196, 'Belgrade', '', '', ''),
('airport_threat', 197, 'Belgrade', '', '', ''),
('airport_threat', 198, 'Belgrade', '', '', ''),
('airport_threat', 199, 'Belgrade', '', '', ''),
('airport_threat', 200, 'Belgrade', '', '', ''),
('airport_threat', 201, 'Belgrade', '', '', ''),
('airport_threat', 202, 'Belgrade', '', '', ''),
('airport_threat', 203, 'Belgrade', '', '', ''),
('airport_threat', 204, 'Belgrade', '', '', ''),
('airport_threat', 205, 'Belgrade', '', '', ''),
('airport_threat', 206, 'Belgrade', '', '', ''),
('airport_threat', 207, 'Belgrade', '', '', ''),
('airport_threat', 208, 'Belgrade', '', '', ''),
('airport_threat', 209, 'Belgrade', '', '', ''),
('airport_threat', 210, 'Belgrade', '', '', ''),
('airport_threat', 211, 'Belgrade', '', '', ''),
('airport_threat', 212, 'Belgrade', '', '', ''),
('airport_threat', 213, 'Belgrade', '', '', ''),
('airport_threat', 214, 'Belgrade', '', '', ''),
('airport_threat', 215, 'Belgrade', '', '', ''),
('airport_threat', 216, 'Belgrade', '', '', ''),
('airport_threat', 217, 'Belgrade', '', '', ''),
('airport_threat', 218, 'Belgrade', '', '', ''),
('airport_threat', 219, 'Belgrade', '', '', ''),
('airport_threat', 220, 'Belgrade', '', '', ''),
('airport_threat', 221, 'Belgrade', '', '', ''),
('airport_threat', 222, 'Belgrade', '', '', ''),
('airport_threat', 223, 'Belgrade', '', '', ''),
('airport_threat', 224, 'Belgrade', '', '', ''),
('airport_threat', 225, 'Belgrade', '', '', ''),
('airport_threat', 226, 'Belgrade', '', '', ''),
('airport_threat', 227, 'Belgrade', '', '', ''),
('airport_threat', 228, 'Belgrade', '', '', ''),
('airport_threat', 229, 'Belgrade', '', '', ''),
('airport_threat', 230, 'Belgrade', '', '', ''),
('airport_threat', 231, 'Belgrade', '', '', ''),
('airport_threat', 232, 'Belgrade', '', '', ''),
('airport_threat', 233, 'Belgrade', '', '', ''),
('airport_threat', 234, 'Belgrade', '', '', ''),
('airport_threat', 235, 'Belgrade', '', '', ''),
('airport_threat', 236, 'Belgrade', '', '', ''),
('airport_threat', 237, 'Belgrade', '', '', ''),
('airport_threat', 238, 'Belgrade', '', '', ''),
('airport_threat', 239, 'Belgrade', '', '', ''),
('airport_threat', 240, 'Belgrade', '', '', ''),
('airport_threat', 241, 'Belgrade', '', '', ''),
('airport_threat', 242, 'Belgrade', '', '', ''),
('airport_threat', 243, 'Belgrade', '', '', ''),
('airport_threat', 244, 'Belgrade', '', '', ''),
('airport_threat', 245, 'Belgrade', '', '', ''),
('airport_threat', 246, 'Belgrade', '', '', ''),
('airport_threat', 247, 'Belgrade', '', '', ''),
('airport_threat', 248, 'Belgrade', '', '', ''),
('airport_threat', 249, 'Belgrade', '', '', ''),
('airport_threat', 250, 'Belgrade', '', '', ''),
('airport_threat', 251, 'Belgrade', '', '', ''),
('airport_threat', 252, 'Kabul', '', '', ''),
('airport_threat', 253, 'Kabul', '', '', ''),
('airport_threat', 254, 'Kabul', '', '', ''),
('airport_threat', 255, 'Kabul', '', '', ''),
('airport_threat', 256, 'Kabul', '', '', ''),
('airport_threat', 257, 'Kabul', '', '', ''),
('airport_threat', 258, 'Kabul', '', '', ''),
('airport_threat', 259, 'Kabul', '', '', ''),
('airport_threat', 260, 'Kabul', '', '', ''),
('airport_threat', 261, 'Kabul', '', '', ''),
('airport_threat', 262, 'Kabul', '', '', ''),
('airport_threat', 263, 'Kabul', '', '', ''),
('airport_threat', 264, 'Kabul', '', '', ''),
('airport_threat', 265, 'Kabul', '', '', ''),
('airport_threat', 266, 'Kabul', '', '', ''),
('airport_threat', 267, 'Kabul', '', '', ''),
('airport_threat', 268, 'Kabul', '', '', ''),
('airport_threat', 269, 'Kabul', '', '', ''),
('airport_threat', 270, 'Kabul', '', '', ''),
('airport_threat', 271, 'Kabul', '', '', ''),
('airport_threat', 272, 'Kabul', '', '', ''),
('airport_threat', 273, 'Kabul', '', '', ''),
('airport_threat', 274, 'Kabul', '', '', ''),
('airport_threat', 275, 'Kabul', '', '', ''),
('airport_threat', 276, 'Chicago', '', '', ''),
('airport_threat', 277, 'Chicago', '', '', ''),
('airport_threat', 278, 'Chicago', '', '', ''),
('airport_threat', 279, 'Chicago', '', '', ''),
('airport_threat', 280, 'Chicago', '', '', ''),
('airport_threat', 281, 'Chicago', '', '', ''),
('airport_threat', 282, 'Chicago', '', '', ''),
('airport_threat', 283, 'Chicago', '', '', ''),
('airport_threat', 284, 'Chicago', '', '', ''),
('airport_threat', 285, 'Chicago', '', '', ''),
('airport_threat', 286, 'Chicago', '', '', ''),
('airport_threat', 287, 'Chicago', '', '', ''),
('airport_threat', 288, 'Chicago', '', '', ''),
('airport_threat', 289, 'Chicago', '', '', ''),
('airport_threat', 290, 'Chicago', '', '', ''),
('airport_threat', 291, 'Chicago', '', '', ''),
('airport_threat', 292, 'Chicago', '', '', ''),
('airport_threat', 293, 'Chicago', '', '', ''),
('airport_threat', 294, 'Chicago', '', '', ''),
('airport_threat', 295, 'Chicago', '', '', ''),
('airport_threat', 296, 'Chicago', '', '', ''),
('airport_threat', 297, 'Chicago', '', '', ''),
('airport_threat', 298, 'Chicago', '', '', ''),
('airport_threat', 299, 'Chicago', '', '', ''),
('airport_threat', 300, 'Chicago', '', '', ''),
('airport_threat', 301, 'Chicago', '', '', ''),
('airport_threat', 302, 'Chicago', '', '', ''),
('airport_threat', 303, 'Chicago', '', '', ''),
('airport_threat', 304, 'Chicago', '', '', ''),
('airport_threat', 305, 'Chicago', '', '', ''),
('airport_threat', 306, 'Chicago', '', '', ''),
('airport_threat', 307, 'Chicago', '', '', ''),
('airport_threat', 308, 'Chicago', '', '', ''),
('airport_threat', 309, 'Chicago', '', '', ''),
('airport_threat', 310, 'Chicago', '', '', ''),
('airport_threat', 311, 'Chicago', '', '', ''),
('airport_threat', 312, 'Chicago', '', '', ''),
('airport_threat', 313, 'Chicago', '', '', ''),
('airport_threat', 314, 'Chicago', '', '', ''),
('airport_threat', 315, 'Chicago', '', '', ''),
('airport_threat', 316, 'Chicago', '', '', ''),
('airport_threat', 317, 'Chicago', '', '', ''),
('airport_threat', 318, 'Chicago', '', '', ''),
('airport_threat', 319, 'Chicago', '', '', ''),
('airport_threat', 320, 'Chicago', '', '', ''),
('airport_threat', 321, 'Chicago', '', '', ''),
('airport_threat', 322, 'Chicago', '', '', ''),
('airport_threat', 323, 'Chicago', '', '', ''),
('airport_threat', 324, 'Chicago', '', '', ''),
('airport_threat', 325, 'Chicago', '', '', ''),
('airport_threat', 326, 'Chicago', '', '', ''),
('airport_threat', 327, 'Chicago', '', '', ''),
('airport_threat', 328, 'Chicago', '', '', ''),
('airport_threat', 329, 'Chicago', '', '', ''),
('airport_threat', 330, 'Chicago', '', '', ''),
('airport_threat', 331, 'Chicago', '', '', ''),
('airport_threat', 332, 'Chicago', '', '', ''),
('airport_threat', 333, 'Chicago', '', '', ''),
('airport_expect', 14, 'Chicago', '', '', ''),
('airport_threat', 781, 'Chicago', '', '', ''),
('airport_threat', 780, 'Chicago', '', '', ''),
('airport_threat', 336, 'Keflavik', '', '', ''),
('airport_threat', 337, 'Keflavik', '', '', ''),
('airport_threat', 338, 'Keflavik', '', '', ''),
('airport_threat', 339, 'Keflavik', '', '', ''),
('airport_threat', 340, 'Keflavik', '', '', ''),
('airport_threat', 341, 'Keflavik', '', '', ''),
('airport_threat', 342, 'Keflavik', '', '', ''),
('airport_threat', 343, 'Keflavik', '', '', ''),
('airport_threat', 344, 'Keflavik', '', '', ''),
('airport_threat', 345, 'Keflavik', '', '', ''),
('airport_threat', 346, 'Keflavik', '', '', ''),
('airport_threat', 347, 'Keflavik', '', '', ''),
('airport_threat', 348, 'Keflavik', '', '', ''),
('airport_threat', 349, 'Keflavik', '', '', ''),
('airport_threat', 350, 'Keflavik', '', '', ''),
('airport_threat', 351, 'Keflavik', '', '', ''),
('airport_threat', 352, 'Keflavik', '', '', ''),
('airport_threat', 353, 'Keflavik', '', '', ''),
('airport_threat', 354, 'Keflavik', '', '', ''),
('airport_threat', 355, 'Keflavik', '', '', ''),
('airport_threat', 356, 'Keflavik', '', '', ''),
('airport_threat', 357, 'Keflavik', '', '', ''),
('airport_threat', 358, 'Keflavik', '', '', ''),
('airport_threat', 359, 'Keflavik', '', '', ''),
('airport_threat', 360, 'Keflavik', '', '', ''),
('airport_threat', 361, 'Keflavik', '', '', ''),
('airport_threat', 362, 'Keflavik', '', '', ''),
('airport_threat', 363, 'Keflavik', '', '', ''),
('airport_threat', 364, 'Keflavik', '', '', ''),
('airport_threat', 365, 'Keflavik', '', '', ''),
('airport_threat', 366, 'Keflavik', '', '', ''),
('airport_threat', 367, 'Keflavik', '', '', ''),
('airport_threat', 368, 'Keflavik', '', '', ''),
('airport_threat', 369, 'Keflavik', '', '', ''),
('airport_threat', 370, 'Keflavik', '', '', ''),
('airport_threat', 371, 'Keflavik', '', '', ''),
('airport_threat', 372, 'Keflavik', '', '', ''),
('airport_threat', 373, 'Keflavik', '', '', ''),
('airport_threat', 374, 'Keflavik', '', '', ''),
('airport_threat', 375, 'Keflavik', '', '', ''),
('airport_threat', 376, 'Keflavik', '', '', ''),
('airport_threat', 377, 'Keflavik', '', '', ''),
('airport_threat', 378, 'Keflavik', '', '', ''),
('airport_threat', 379, 'Keflavik', '', '', ''),
('airport_threat', 380, 'Keflavik', '', '', ''),
('airport_threat', 381, 'Keflavik', '', '', ''),
('airport_threat', 382, 'Keflavik', '', '', ''),
('airport_threat', 383, 'Keflavik', '', '', ''),
('airport_threat', 384, 'Keflavik', '', '', ''),
('airport_threat', 385, 'Keflavik', '', '', ''),
('airport_threat', 386, 'Keflavik', '', '', ''),
('airport_threat', 387, 'Keflavik', '', '', ''),
('airport_threat', 388, 'Keflavik', '', '', ''),
('airport_threat', 389, 'Keflavik', '', '', ''),
('airport_threat', 390, 'Keflavik', '', '', ''),
('airport_threat', 391, 'Keflavik', '', '', ''),
('airport_threat', 392, 'Keflavik', '', '', ''),
('airport_threat', 393, 'Keflavik', '', '', ''),
('airport_threat', 394, 'Keflavik', '', '', ''),
('airport_threat', 395, 'Capetown', '', '', ''),
('airport_threat', 396, 'Capetown', '', '', ''),
('airport_threat', 397, 'Capetown', '', '', ''),
('airport_threat', 398, 'Tokyo', '', '', ''),
('airport_threat', 399, 'Tokyo', '', '', ''),
('airport_threat', 400, 'Tokyo', '', '', ''),
('airport_threat', 401, 'Tokyo', '', '', ''),
('airport_threat', 402, 'Tokyo', '', '', ''),
('airport_threat', 403, 'Tokyo', '', '', ''),
('airport_threat', 404, 'Tokyo', '', '', ''),
('airport_threat', 405, 'Tokyo', '', '', ''),
('airport_threat', 406, 'Tokyo', '', '', ''),
('airport_threat', 407, 'Tokyo', '', '', ''),
('airport_threat', 408, 'Tokyo', '', '', ''),
('airport_threat', 409, 'Tokyo', '', '', ''),
('airport_threat', 410, 'Tokyo', '', '', ''),
('airport_threat', 411, 'Tokyo', '', '', ''),
('airport_threat', 412, 'Tokyo', '', '', ''),
('airport_threat', 413, 'Tokyo', '', '', ''),
('airport_threat', 414, 'Tokyo', '', '', ''),
('airport_threat', 415, 'Tokyo', '', '', ''),
('airport_threat', 416, 'Tokyo', '', '', ''),
('airport_threat', 417, 'Tokyo', '', '', ''),
('airport_threat', 418, 'Tokyo', '', '', ''),
('airport_threat', 419, 'Tokyo', '', '', ''),
('airport_threat', 420, 'Tokyo', '', '', ''),
('airport_threat', 421, 'Tokyo', '', '', ''),
('airport_threat', 422, 'Tokyo', '', '', ''),
('airport_threat', 423, 'Tokyo', '', '', ''),
('airport_threat', 424, 'Tokyo', '', '', ''),
('airport_threat', 425, 'Tokyo', '', '', ''),
('airport_threat', 426, 'Tokyo', '', '', ''),
('airport_threat', 427, 'Tokyo', '', '', ''),
('airport_threat', 428, 'Tokyo', '', '', ''),
('airport_threat', 429, 'Tokyo', '', '', ''),
('airport_threat', 430, 'Tokyo', '', '', ''),
('airport_threat', 431, 'Tokyo', '', '', ''),
('airport_threat', 432, 'Tokyo', '', '', ''),
('airport_threat', 433, 'Tokyo', '', '', ''),
('airport_threat', 434, 'Tokyo', '', '', ''),
('airport_threat', 435, 'Tokyo', '', '', ''),
('airport_threat', 436, 'Tokyo', '', '', ''),
('airport_threat', 437, 'Tokyo', '', '', ''),
('airport_threat', 438, 'Tokyo', '', '', ''),
('airport_threat', 439, 'Tokyo', '', '', ''),
('airport_threat', 440, 'Tokyo', '', '', ''),
('airport_threat', 441, 'Tokyo', '', '', ''),
('airport_threat', 442, 'Tokyo', '', '', ''),
('airport_threat', 443, 'Tokyo', '', '', ''),
('airport_threat', 444, 'Tokyo', '', '', ''),
('airport_threat', 445, 'Tokyo', '', '', ''),
('airport_threat', 446, 'Tokyo', '', '', ''),
('airport_threat', 447, 'Tokyo', '', '', ''),
('airport_threat', 448, 'Tokyo', '', '', ''),
('airport_threat', 449, 'Tokyo', '', '', ''),
('airport_threat', 450, 'Tokyo', '', '', ''),
('airport_threat', 451, 'Tokyo', '', '', ''),
('airport_threat', 452, 'Tokyo', '', '', ''),
('airport_threat', 453, 'Tokyo', '', '', ''),
('airport_threat', 454, 'Tokyo', '', '', ''),
('airport_threat', 455, 'Tokyo', '', '', ''),
('airport_threat', 456, 'Salalah', '', '', ''),
('airport_threat', 457, 'Salalah', '', '', ''),
('airport_threat', 458, 'Salalah', '', '', ''),
('airport_threat', 459, 'Salalah', '', '', ''),
('airport_threat', 460, 'Salalah', '', '', ''),
('airport_threat', 461, 'Madrid', '', '', ''),
('airport_threat', 462, 'Madrid', '', '', ''),
('airport_threat', 463, 'Madrid', '', '', ''),
('airport_threat', 464, 'Madrid', '', '', ''),
('airport_threat', 465, 'Madrid', '', '', ''),
('airport_threat', 466, 'Madrid', '', '', ''),
('airport_threat', 467, 'Madrid', '', '', ''),
('airport_threat', 468, 'Madrid', '', '', ''),
('airport_threat', 469, 'Madrid', '', '', ''),
('airport_threat', 470, 'Madrid', '', '', ''),
('airport_threat', 471, 'Madrid', '', '', ''),
('airport_threat', 472, 'Madrid', '', '', ''),
('airport_threat', 473, 'Madrid', '', '', ''),
('airport_threat', 474, 'Madrid', '', '', ''),
('airport_threat', 475, 'Madrid', '', '', ''),
('airport_threat', 476, 'Madrid', '', '', ''),
('airport_threat', 477, 'Madrid', '', '', ''),
('airport_threat', 478, 'Madrid', '', '', ''),
('airport_threat', 479, 'Madrid', '', '', ''),
('airport_threat', 480, 'Madrid', '', '', ''),
('airport_threat', 481, 'Madrid', '', '', ''),
('airport_threat', 482, 'Madrid', '', '', ''),
('airport_threat', 483, 'Madrid', '', '', ''),
('airport_threat', 484, 'Madrid', '', '', ''),
('airport_threat', 485, 'Madrid', '', '', ''),
('airport_threat', 486, 'Madrid', '', '', ''),
('airport_threat', 487, 'Madrid', '', '', ''),
('airport_threat', 488, 'Madrid', '', '', ''),
('airport_threat', 489, 'Madrid', '', '', ''),
('airport_threat', 490, 'Madrid', '', '', ''),
('airport_threat', 491, 'Madrid', '', '', ''),
('airport_threat', 492, 'Madrid', '', '', ''),
('airport_threat', 493, 'Madrid', '', '', ''),
('airport_threat', 494, 'Madrid', '', '', ''),
('airport_threat', 495, 'Madrid', '', '', ''),
('airport_threat', 496, 'Madrid', '', '', ''),
('airport_threat', 497, 'Madrid', '', '', ''),
('airport_threat', 498, 'Madrid', '', '', ''),
('airport_threat', 499, 'Madrid', '', '', ''),
('airport_threat', 500, 'Madrid', '', '', ''),
('airport_threat', 501, 'Madrid', '', '', ''),
('airport_threat', 502, 'Madrid', '', '', ''),
('airport_threat', 503, 'Madrid', '', '', ''),
('airport_threat', 504, 'Madrid', '', '', ''),
('airport_threat', 505, 'Madrid', '', '', ''),
('airport_threat', 506, 'Madrid', '', '', ''),
('airport_threat', 507, 'Madrid', '', '', ''),
('airport_threat', 508, 'Madrid', '', '', ''),
('airport_threat', 509, 'Madrid', '', '', ''),
('airport_threat', 510, 'Madrid', '', '', ''),
('airport_threat', 511, 'Madrid', '', '', ''),
('airport_threat', 512, 'Madrid', '', '', ''),
('airport_threat', 513, 'Madrid', '', '', ''),
('airport_threat', 514, 'Madrid', '', '', ''),
('airport_threat', 515, 'Madrid', '', '', ''),
('airport_threat', 516, 'Madrid', '', '', ''),
('airport_threat', 517, 'Madrid', '', '', ''),
('airport_threat', 518, 'Madrid', '', '', ''),
('airport_threat', 519, 'Ibiza', '', '', ''),
('airport_threat', 520, 'Ibiza', '', '', ''),
('airport_threat', 521, 'Ibiza', '', '', ''),
('airport_threat', 522, 'Ibiza', '', '', ''),
('airport_threat', 523, 'Ibiza', '', '', ''),
('airport_threat', 524, 'Ibiza', '', '', ''),
('airport_threat', 525, 'Ibiza', '', '', ''),
('airport_threat', 526, 'Ibiza', '', '', ''),
('airport_threat', 527, 'Ibiza', '', '', ''),
('airport_threat', 528, 'Ibiza', '', '', ''),
('airport_threat', 529, 'Ibiza', '', '', ''),
('airport_threat', 530, 'Ibiza', '', '', ''),
('airport_threat', 531, 'Ibiza', '', '', ''),
('airport_threat', 532, 'Ibiza', '', '', ''),
('airport_threat', 533, 'Ibiza', '', '', ''),
('airport_threat', 534, 'Ibiza', '', '', ''),
('airport_threat', 535, 'Ibiza', '', '', ''),
('airport_threat', 536, 'Ibiza', '', '', ''),
('airport_threat', 537, 'Ibiza', '', '', ''),
('airport_threat', 538, 'Ibiza', '', '', ''),
('airport_threat', 539, 'Ibiza', '', '', ''),
('airport_threat', 540, 'Ibiza', '', '', ''),
('airport_threat', 541, 'Ibiza', '', '', ''),
('airport_threat', 542, 'Ibiza', '', '', ''),
('airport_threat', 543, 'Ibiza', '', '', ''),
('airport_threat', 544, 'Ibiza', '', '', ''),
('airport_expect', 11, 'Dubai', '', '', ''),
('airport_threat', 545, 'Seychelles', '', '', ''),
('airport_threat', 546, 'Seychelles', '', '', ''),
('airport_threat', 547, 'Seychelles', '', '', ''),
('airport_threat', 548, 'Seychelles', '', '', ''),
('airport_threat', 549, 'Seychelles', '', '', ''),
('airport_threat', 550, 'Seychelles', '', '', ''),
('airport_threat', 551, 'Seychelles', '', '', ''),
('airport_expect', 12, 'Dubai', '', '', ''),
('airport_threat', 552, 'Newark', '', '', ''),
('airport_threat', 553, 'Newark', '', '', ''),
('airport_threat', 554, 'Newark', '', '', ''),
('airport_threat', 555, 'Newark', '', '', ''),
('airport_threat', 556, 'Newark', '', '', ''),
('airport_threat', 557, 'Newark', '', '', ''),
('airport_threat', 558, 'Newark', '', '', ''),
('airport_threat', 559, 'Newark', '', '', ''),
('airport_threat', 560, 'Newark', '', '', ''),
('airport_threat', 561, 'Newark', '', '', ''),
('airport_threat', 562, 'Newark', '', '', ''),
('airport_threat', 563, 'Newark', '', '', ''),
('airport_threat', 564, 'Newark', '', '', ''),
('airport_threat', 565, 'Newark', '', '', ''),
('airport_threat', 566, 'Newark', '', '', ''),
('airport_threat', 567, 'Newark', '', '', ''),
('airport_threat', 568, 'Newark', '', '', ''),
('airport_threat', 569, 'Newark', '', '', ''),
('airport_threat', 570, 'Newark', '', '', ''),
('airport_threat', 571, 'Newark', '', '', ''),
('airport_threat', 572, 'Newark', '', '', ''),
('airport_threat', 573, 'Newark', '', '', ''),
('airport_threat', 574, 'Newark', '', '', ''),
('airport_threat', 575, 'Newark', '', '', ''),
('airport_threat', 576, 'Newark', '', '', ''),
('airport_threat', 577, 'Newark', '', '', ''),
('airport_threat', 578, 'Newark', '', '', ''),
('airport_threat', 579, 'Newark', '', '', ''),
('airport_threat', 580, 'Newark', '', '', ''),
('airport_threat', 581, 'Newark', '', '', ''),
('airport_threat', 582, 'Newark', '', '', ''),
('airport_threat', 583, 'Newark', '', '', ''),
('airport_threat', 584, 'Newark', '', '', ''),
('airport_threat', 585, 'Newark', '', '', ''),
('airport_threat', 586, 'Newark', '', '', ''),
('airport_threat', 587, 'Newark', '', '', ''),
('airport_threat', 588, 'Newark', '', '', ''),
('airport_threat', 589, 'Newark', '', '', ''),
('airport_threat', 590, 'Newark', '', '', ''),
('airport_threat', 591, 'Newark', '', '', ''),
('airport_threat', 592, 'Newark', '', '', ''),
('airport_threat', 593, 'Newark', '', '', ''),
('airport_threat', 594, 'Newark', '', '', ''),
('airport_threat', 595, 'Newark', '', '', ''),
('airport_threat', 596, 'Newark', '', '', ''),
('airport_threat', 597, 'Newark', '', '', ''),
('airport_threat', 598, 'Newark', '', '', ''),
('airport_threat', 599, 'Newark', '', '', ''),
('airport_threat', 600, 'Newark', '', '', ''),
('airport_threat', 601, 'Newark', '', '', ''),
('airport_threat', 602, 'Newark', '', '', ''),
('airport_threat', 603, 'Newark', '', '', ''),
('airport_threat', 604, 'Newark', '', '', ''),
('airport_threat', 605, 'Newark', '', '', ''),
('airport_threat', 606, 'Newark', '', '', ''),
('airport_threat', 607, 'Newark', '', '', ''),
('airport_expect', 16, 'Lahore', '', '', ''),
('user', 9, 'Sd Dev 111', '', '', ''),
('user', 12, 'Daniel Rika', '', '', ''),
('airport_threat', 608, 'Ontario', '', '', ''),
('airport_threat', 609, 'Ontario', '', '', ''),
('airport_threat', 610, 'Ontario', '', '', ''),
('airport_threat', 611, 'Ontario', '', '', ''),
('airport_threat', 612, 'Ontario', '', '', ''),
('airport_threat', 613, 'Ontario', '', '', ''),
('airport_threat', 614, 'Ontario', '', '', ''),
('airport_threat', 615, 'Ontario', '', '', ''),
('airport_threat', 616, 'Ontario', '', '', ''),
('airport_threat', 617, 'Ontario', '', '', ''),
('airport_threat', 618, 'Ontario', '', '', ''),
('airport_threat', 619, 'Ontario', '', '', ''),
('airport_threat', 620, 'Ontario', '', '', ''),
('airport_threat', 621, 'Ontario', '', '', ''),
('airport_threat', 622, 'Ontario', '', '', ''),
('airport_threat', 623, 'Ontario', '', '', ''),
('airport_threat', 624, 'Ontario', '', '', ''),
('airport_threat', 625, 'Ontario', '', '', ''),
('airport_threat', 626, 'Ontario', '', '', ''),
('airport_threat', 627, 'Ontario', '', '', ''),
('airport_threat', 628, 'Ontario', '', '', ''),
('airport_threat', 629, 'Ontario', '', '', ''),
('airport_threat', 630, 'Ontario', '', '', ''),
('airport_threat', 631, 'Ontario', '', '', ''),
('airport_threat', 632, 'Ontario', '', '', ''),
('airport_threat', 633, 'Ontario', '', '', ''),
('airport_threat', 634, 'Ontario', '', '', ''),
('airport_threat', 635, 'Ontario', '', '', ''),
('airport_threat', 636, 'Ontario', '', '', ''),
('airport_threat', 637, 'Ontario', '', '', ''),
('airport_threat', 638, 'Ontario', '', '', ''),
('airport_threat', 639, 'Ontario', '', '', ''),
('airport_threat', 640, 'Ontario', '', '', ''),
('airport_threat', 641, 'Ontario', '', '', ''),
('airport_threat', 642, 'Ontario', '', '', ''),
('airport_threat', 643, 'Ontario', '', '', ''),
('airport_threat', 644, 'Ontario', '', '', ''),
('airport_threat', 645, 'Ontario', '', '', ''),
('airport_threat', 646, 'Ontario', '', '', ''),
('airport_threat', 647, 'Ontario', '', '', ''),
('airport_threat', 648, 'Ontario', '', '', ''),
('airport_threat', 649, 'Ontario', '', '', ''),
('airport_threat', 650, 'Ontario', '', '', ''),
('airport_threat', 656, 'Fort Lauderdale', '', '', ''),
('airport_threat', 657, 'Fort Lauderdale', '', '', ''),
('airport_threat', 658, 'Fort Lauderdale', '', '', ''),
('airport_threat', 659, 'Fort Lauderdale', '', '', ''),
('airport_threat', 660, 'Fort Lauderdale', '', '', ''),
('airport_threat', 661, 'Fort Lauderdale', '', '', ''),
('airport_threat', 662, 'Fort Lauderdale', '', '', ''),
('airport_threat', 663, 'Fort Lauderdale', '', '', ''),
('airport_threat', 664, 'Fort Lauderdale', '', '', ''),
('airport_threat', 665, 'Fort Lauderdale', '', '', ''),
('airport_threat', 666, 'Fort Lauderdale', '', '', ''),
('airport_threat', 667, 'Fort Lauderdale', '', '', ''),
('airport_threat', 668, 'Fort Lauderdale', '', '', ''),
('airport_threat', 669, 'Fort Lauderdale', '', '', ''),
('airport_threat', 670, 'Fort Lauderdale', '', '', ''),
('airport_threat', 671, 'Fort Lauderdale', '', '', ''),
('airport_threat', 672, 'Fort Lauderdale', '', '', ''),
('airport_threat', 673, 'Fort Lauderdale', '', '', ''),
('airport_threat', 674, 'Fort Lauderdale', '', '', ''),
('airport_threat', 675, 'Fort Lauderdale', '', '', ''),
('airport_threat', 676, 'Fort Lauderdale', '', '', ''),
('airport_threat', 677, 'Fort Lauderdale', '', '', ''),
('airport_threat', 678, 'Fort Lauderdale', '', '', ''),
('airport_threat', 679, 'Fort Lauderdale', '', '', ''),
('airport_threat', 680, 'Fort Lauderdale', '', '', ''),
('airport_threat', 681, 'Fort Lauderdale', '', '', ''),
('airport_threat', 682, 'Fort Lauderdale', '', '', ''),
('airport_threat', 683, 'Fort Lauderdale', '', '', ''),
('airport_threat', 684, 'Fort Lauderdale', '', '', ''),
('airport_threat', 685, 'Fort Lauderdale', '', '', ''),
('airport_threat', 686, 'Fort Lauderdale', '', '', ''),
('airport_threat', 687, 'Fort Lauderdale', '', '', ''),
('airport_threat', 688, 'Fort Lauderdale', '', '', ''),
('airport_threat', 689, 'Fort Lauderdale', '', '', ''),
('airport_threat', 690, 'Fort Lauderdale', '', '', ''),
('airport_threat', 691, 'Fort Lauderdale', '', '', ''),
('airport_threat', 692, 'Fort Lauderdale', '', '', ''),
('airport_threat', 693, 'Fort Lauderdale', '', '', ''),
('airport_threat', 694, 'Fort Lauderdale', '', '', ''),
('airport_threat', 695, 'Fort Lauderdale', '', '', ''),
('airport_threat', 696, 'Fort Lauderdale', '', '', ''),
('airport_threat', 697, 'Fort Lauderdale', '', '', ''),
('airport_threat', 698, 'Fort Lauderdale', '', '', ''),
('airport_threat', 699, 'Fort Lauderdale', '', '', ''),
('airport_threat', 700, 'Fort Lauderdale', '', '', ''),
('airport_threat', 701, 'Fort Lauderdale', '', '', ''),
('airport_threat', 702, 'Fort Lauderdale', '', '', ''),
('airport_threat', 703, 'Fort Lauderdale', '', '', ''),
('airport_threat', 704, 'Fort Lauderdale', '', '', ''),
('airport_threat', 705, 'Fort Lauderdale', '', '', ''),
('airport_threat', 706, 'Fort Lauderdale', '', '', ''),
('airport_threat', 707, 'Fort Lauderdale', '', '', ''),
('airport_threat', 708, 'Fort Lauderdale', '', '', ''),
('airport_threat', 709, 'Fort Lauderdale', '', '', ''),
('airport_threat', 710, 'Fort Lauderdale', '', '', ''),
('airport_threat', 711, 'Minneapolis St Paul', '', '', ''),
('airport_threat', 712, 'Minneapolis St Paul', '', '', ''),
('airport_threat', 713, 'Minneapolis St Paul', '', '', ''),
('airport_threat', 714, 'Toronto', '', '', ''),
('airport_threat', 715, 'Toronto', '', '', ''),
('airport_threat', 716, 'Toronto', '', '', ''),
('airport_threat', 717, 'Toronto', '', '', ''),
('airport_threat', 718, 'Toronto', '', '', ''),
('airport_threat', 719, 'Toronto', '', '', ''),
('airport_threat', 720, 'Toronto', '', '', ''),
('airport_threat', 721, 'Toronto', '', '', ''),
('airport_threat', 722, 'Toronto', '', '', ''),
('airport_threat', 723, 'Toronto', '', '', ''),
('airport_threat', 724, 'Toronto', '', '', ''),
('airport_threat', 725, 'Toronto', '', '', ''),
('airport_threat', 726, 'Toronto', '', '', ''),
('airport_threat', 727, 'Toronto', '', '', ''),
('airport_threat', 728, 'Toronto', '', '', ''),
('airport_threat', 729, 'Toronto', '', '', ''),
('airport_threat', 730, 'Toronto', '', '', ''),
('airport_threat', 731, 'Toronto', '', '', ''),
('airport_threat', 732, 'Toronto', '', '', ''),
('airport_threat', 733, 'Toronto', '', '', ''),
('airport_threat', 734, 'Toronto', '', '', ''),
('airport_threat', 735, 'Toronto', '', '', ''),
('airport_threat', 736, 'Toronto', '', '', ''),
('airport_threat', 737, 'Toronto', '', '', ''),
('airport_threat', 738, 'Toronto', '', '', ''),
('airport_threat', 739, 'Toronto', '', '', ''),
('airport_threat', 740, 'Toronto', '', '', ''),
('airport_threat', 741, 'Toronto', '', '', ''),
('airport_threat', 742, 'Toronto', '', '', ''),
('airport_threat', 743, 'Toronto', '', '', ''),
('airport_threat', 744, 'Toronto', '', '', ''),
('airport_threat', 745, 'Toronto', '', '', ''),
('airport_threat', 746, 'Toronto', '', '', ''),
('airport_threat', 747, 'Toronto', '', '', ''),
('airport_threat', 748, 'Toronto', '', '', ''),
('airport_threat', 749, 'Toronto', '', '', ''),
('airport_threat', 750, 'Toronto', '', '', ''),
('airport_threat', 751, 'Toronto', '', '', ''),
('airport_threat', 752, 'Toronto', '', '', ''),
('airport_threat', 753, 'Toronto', '', '', ''),
('airport_threat', 754, 'Toronto', '', '', ''),
('airport_threat', 755, 'Toronto', '', '', ''),
('airport_threat', 756, 'Toronto', '', '', ''),
('airport_threat', 757, 'Toronto', '', '', ''),
('airport_threat', 758, 'Toronto', '', '', ''),
('airport_threat', 759, 'Toronto', '', '', ''),
('airport_threat', 760, 'Toronto', '', '', ''),
('airport_threat', 761, 'Toronto', '', '', ''),
('airport_threat', 762, 'Toronto', '', '', ''),
('airport_threat', 763, 'Toronto', '', '', ''),
('airport_threat', 764, 'Toronto', '', '', ''),
('airport_threat', 765, 'Toronto', '', '', ''),
('airport_threat', 766, 'Toronto', '', '', ''),
('airport_threat', 767, 'Ljubljana', '', '', ''),
('airport_threat', 768, 'Ljubljana', '', '', ''),
('airport_threat', 769, 'Ljubljana', '', '', ''),
('airport_threat', 770, 'Ljubljana', '', '', ''),
('airport_threat', 771, 'Ljubljana', '', '', ''),
('airport_threat', 772, 'Ljubljana', '', '', ''),
('airport_threat', 773, 'Ljubljana', '', '', ''),
('airport_threat', 774, 'Ljubljana', '', '', ''),
('airport_threat', 775, 'Ljubljana', '', '', ''),
('airport_threat', 776, 'Ljubljana', '', '', ''),
('airport_threat', 777, 'Ljubljana', '', '', ''),
('airport_threat', 778, 'Ljubljana', '', '', ''),
('airport_threat', 779, 'Ljubljana', '', '', ''),
('airport_expect', 23, 'Chicago', '', '', ''),
('airport_expect', 24, 'Chicago', '', '', ''),
('airport_threat', 782, 'Chicago', '', '', ''),
('airport_threat', 783, 'Chicago', '', '', ''),
('airport_threat', 784, 'Chicago', '', '', ''),
('airport_threat', 785, 'Chicago', '', '', ''),
('airport_expect', 25, 'Chicago', '', '', ''),
('airport_expect', 26, 'Chicago', '', '', ''),
('airport_expect', 29, 'Chicago', '', '', ''),
('airport_threat', 786, 'Chicago', '', '', ''),
('airport_threat', 787, 'Mumbai', '', '', ''),
('airport_threat', 788, 'Mumbai', '', '', ''),
('airport_threat', 789, 'Mumbai', '', '', ''),
('airport_threat', 790, 'Mumbai', '', '', ''),
('airport_threat', 791, 'Mumbai', '', '', ''),
('airport_threat', 792, 'Mumbai', '', '', ''),
('airport_threat', 793, 'Mumbai', '', '', ''),
('airport_threat', 794, 'Mumbai', '', '', ''),
('airport_threat', 795, 'Mumbai', '', '', ''),
('airport_threat', 796, 'Mumbai', '', '', ''),
('airport_threat', 797, 'Mumbai', '', '', ''),
('airport_threat', 798, 'Mumbai', '', '', ''),
('airport_threat', 799, 'Mumbai', '', '', ''),
('airport_threat', 800, 'Mumbai', '', '', ''),
('airport_threat', 801, 'Mumbai', '', '', ''),
('airport_threat', 802, 'Mumbai', '', '', ''),
('airport_threat', 803, 'Mumbai', '', '', ''),
('airport_threat', 804, 'Mumbai', '', '', ''),
('airport_threat', 805, 'Mumbai', '', '', ''),
('airport_threat', 806, 'Mumbai', '', '', ''),
('airport_threat', 807, 'Mumbai', '', '', ''),
('airport_threat', 808, 'Mumbai', '', '', ''),
('airport_threat', 809, 'Mumbai', '', '', ''),
('airport_threat', 810, 'Mumbai', '', '', ''),
('airport_threat', 811, 'Mumbai', '', '', ''),
('airport_threat', 812, 'Mumbai', '', '', ''),
('airport_threat', 813, 'Mumbai', '', '', ''),
('airport_threat', 814, 'Mumbai', '', '', ''),
('airport_threat', 815, 'Mumbai', '', '', ''),
('airport_threat', 816, 'Mumbai', '', '', ''),
('airport_threat', 817, 'Mumbai', '', '', ''),
('airport_threat', 818, 'Mumbai', '', '', ''),
('airport_threat', 819, 'Mumbai', '', '', ''),
('airport_threat', 820, 'Mumbai', '', '', ''),
('airport_threat', 821, 'Mumbai', '', '', ''),
('airport_threat', 822, 'Mumbai', '', '', ''),
('airport_threat', 823, 'Mumbai', '', '', ''),
('airport_threat', 824, 'Mumbai', '', '', ''),
('airport_threat', 825, 'Mumbai', '', '', ''),
('airport_threat', 826, 'Mumbai', '', '', ''),
('airport_threat', 827, 'Mumbai', '', '', ''),
('airport_threat', 828, 'Mumbai', '', '', ''),
('airport_threat', 829, 'Mumbai', '', '', ''),
('airport_threat', 830, 'Mumbai', '', '', ''),
('airport_threat', 831, 'Mumbai', '', '', ''),
('airport_threat', 832, 'Mumbai', '', '', ''),
('airport_threat', 833, 'Mumbai', '', '', ''),
('airport_threat', 834, 'Mumbai', '', '', ''),
('airport_threat', 835, 'Mumbai', '', '', ''),
('airport_threat', 836, 'Mumbai', '', '', ''),
('airport_threat', 837, 'Mumbai', '', '', ''),
('airport_threat', 838, 'Mumbai', '', '', ''),
('airport_threat', 839, 'Mumbai', '', '', ''),
('airport_threat', 840, 'Mumbai', '', '', ''),
('airport_threat', 841, 'Mumbai', '', '', ''),
('airport_threat', 842, 'Sofia', '', '', ''),
('airport_threat', 843, 'Sofia', '', '', ''),
('airport_threat', 844, 'Sofia', '', '', ''),
('airport_threat', 845, 'Sofia', '', '', ''),
('airport_threat', 846, 'Sofia', '', '', ''),
('airport_threat', 847, 'Sofia', '', '', ''),
('airport_threat', 848, 'Sofia', '', '', ''),
('airport_threat', 849, 'Sofia', '', '', ''),
('airport_threat', 850, 'Sofia', '', '', ''),
('airport_threat', 851, 'Sofia', '', '', ''),
('airport_threat', 852, 'Sofia', '', '', ''),
('airport_threat', 853, 'Sofia', '', '', ''),
('airport_threat', 854, 'Sofia', '', '', ''),
('airport_threat', 855, 'Sofia', '', '', ''),
('airport_threat', 856, 'Sofia', '', '', ''),
('airport_threat', 857, 'Sofia', '', '', ''),
('airport_threat', 858, 'Sofia', '', '', ''),
('airport_threat', 859, 'Sofia', '', '', ''),
('airport_threat', 860, 'Sofia', '', '', ''),
('airport_threat', 861, 'Sofia', '', '', ''),
('airport_threat', 862, 'Sofia', '', '', ''),
('airport_threat', 863, 'Sofia', '', '', ''),
('airport_threat', 864, 'Sofia', '', '', ''),
('airport_threat', 865, 'Sofia', '', '', ''),
('airport_threat', 866, 'Sofia', '', '', ''),
('airport_threat', 867, 'Sofia', '', '', ''),
('airport_threat', 868, 'Sofia', '', '', ''),
('airport_threat', 869, 'Sofia', '', '', ''),
('airport_threat', 870, 'Sofia', '', '', ''),
('airport_threat', 871, 'Sofia', '', '', ''),
('airport_threat', 872, 'Sofia', '', '', ''),
('airport_threat', 873, 'Sofia', '', '', ''),
('airport_threat', 874, 'Sofia', '', '', ''),
('airport_threat', 875, 'Sofia', '', '', ''),
('airport_threat', 876, 'Sofia', '', '', ''),
('airport_threat', 877, 'Sofia', '', '', ''),
('airport_threat', 878, 'Sofia', '', '', ''),
('airport_threat', 879, 'Sofia', '', '', ''),
('airport_threat', 880, 'Sofia', '', '', ''),
('airport_threat', 881, 'Sofia', '', '', ''),
('airport_threat', 882, 'Sofia', '', '', ''),
('airport_threat', 883, 'Sofia', '', '', ''),
('airport_threat', 884, 'Sofia', '', '', ''),
('airport_threat', 885, 'Sofia', '', '', ''),
('airport_threat', 886, 'Sofia', '', '', ''),
('airport_threat', 887, 'Sofia', '', '', ''),
('airport_threat', 888, 'Sofia', '', '', ''),
('airport_threat', 889, 'Sofia', '', '', ''),
('airport_threat', 890, 'Sofia', '', '', ''),
('airport_threat', 891, 'Sofia', '', '', ''),
('airport_threat', 892, 'Sofia', '', '', ''),
('airport_threat', 893, 'Sofia', '', '', ''),
('airport_threat', 894, 'Sofia', '', '', ''),
('airport_threat', 895, 'Sofia', '', '', ''),
('airport_threat', 896, 'Sofia', '', '', ''),
('airport_threat', 897, 'Sofia', '', '', ''),
('airport_threat', 898, 'Sofia', '', '', ''),
('airport_threat', 899, 'Dhaka', '', '', ''),
('airport_threat', 900, 'Dhaka', '', '', ''),
('airport_threat', 901, 'Dhaka', '', '', ''),
('airport_threat', 902, 'Dhaka', '', '', ''),
('airport_threat', 903, 'Dhaka', '', '', ''),
('airport_threat', 904, 'Dhaka', '', '', ''),
('airport_threat', 905, 'Dhaka', '', '', ''),
('airport_threat', 906, 'Dhaka', '', '', ''),
('airport_threat', 907, 'Dhaka', '', '', ''),
('airport_threat', 908, 'Dhaka', '', '', ''),
('airport_threat', 909, 'Dhaka', '', '', ''),
('airport_threat', 910, 'Dhaka', '', '', ''),
('airport_threat', 911, 'Dhaka', '', '', ''),
('airport_threat', 912, 'Dhaka', '', '', ''),
('airport_threat', 913, 'Dhaka', '', '', ''),
('airport_threat', 914, 'Dhaka', '', '', ''),
('airport_threat', 915, 'Dhaka', '', '', ''),
('airport_threat', 916, 'Dhaka', '', '', ''),
('airport_threat', 917, 'Dhaka', '', '', ''),
('airport_threat', 918, 'Dhaka', '', '', ''),
('airport_threat', 919, 'Dhaka', '', '', ''),
('airport_threat', 920, 'Dhaka', '', '', ''),
('airport_threat', 921, 'Dhaka', '', '', ''),
('airport_threat', 922, 'Dhaka', '', '', ''),
('airport_threat', 923, 'Dhaka', '', '', ''),
('airport_threat', 924, 'Dhaka', '', '', ''),
('airport_threat', 925, 'Dhaka', '', '', ''),
('airport_threat', 926, 'Dhaka', '', '', ''),
('airport_threat', 927, 'Dhaka', '', '', ''),
('airport_threat', 928, 'Dhaka', '', '', ''),
('airport_threat', 929, 'Dhaka', '', '', ''),
('airport_threat', 930, 'Dhaka', '', '', ''),
('airport_threat', 931, 'Dhaka', '', '', ''),
('airport_threat', 932, 'Dhaka', '', '', ''),
('airport_threat', 933, 'Dhaka', '', '', ''),
('airport_threat', 934, 'Dhaka', '', '', ''),
('airport_threat', 935, 'Dhaka', '', '', ''),
('airport_threat', 936, 'Dhaka', '', '', ''),
('airport_threat', 937, 'Dhaka', '', '', ''),
('airport_threat', 938, 'Dhaka', '', '', ''),
('airport_threat', 939, 'Dhaka', '', '', ''),
('airport_threat', 940, 'Dhaka', '', '', ''),
('airport_threat', 941, 'Dhaka', '', '', ''),
('airport_threat', 942, 'Dhaka', '', '', ''),
('airport_threat', 943, 'Dhaka', '', '', ''),
('airport_threat', 944, 'Dhaka', '', '', ''),
('airport_threat', 945, 'Dhaka', '', '', ''),
('airport_threat', 946, 'Dhaka', '', '', ''),
('airport_threat', 947, 'Dhaka', '', '', ''),
('airport_threat', 948, 'Dhaka', '', '', ''),
('airport_threat', 949, 'Dhaka', '', '', ''),
('airport_threat', 950, 'Dhaka', '', '', ''),
('airport_threat', 951, 'Dhaka', '', '', ''),
('airport_threat', 952, 'Dhaka', '', '', ''),
('airport_threat', 953, 'Dhaka', '', '', ''),
('airport_threat', 954, 'Dhaka', '', '', ''),
('airport_threat', 955, 'Dhaka', '', '', ''),
('airport_threat', 956, 'Dhaka', '', '', ''),
('airport_threat', 957, 'Quito', '', '', ''),
('airport_threat', 958, 'Quito', '', '', ''),
('airport_threat', 959, 'Quito', '', '', ''),
('airport_threat', 960, 'Quito', '', '', ''),
('airport_threat', 961, 'Quito', '', '', ''),
('airport_threat', 962, 'Quito', '', '', ''),
('airport_threat', 963, 'Quito', '', '', ''),
('airport_threat', 964, 'Quito', '', '', ''),
('airport_threat', 965, 'Quito', '', '', ''),
('airport_threat', 966, 'Quito', '', '', ''),
('airport_threat', 967, 'Quito', '', '', ''),
('airport_threat', 968, 'Quito', '', '', ''),
('airport_threat', 969, 'Quito', '', '', ''),
('airport_threat', 970, 'Quito', '', '', ''),
('airport_threat', 971, 'Quito', '', '', ''),
('airport_threat', 972, 'Quito', '', '', ''),
('airport_threat', 973, 'Quito', '', '', ''),
('airport_threat', 974, 'Quito', '', '', ''),
('airport_threat', 975, 'Quito', '', '', ''),
('airport_threat', 976, 'Quito', '', '', ''),
('airport_threat', 977, 'Quito', '', '', ''),
('airport_threat', 978, 'Quito', '', '', ''),
('airport_threat', 979, 'Quito', '', '', ''),
('airport_threat', 980, 'Quito', '', '', ''),
('airport_threat', 981, 'Quito', '', '', ''),
('airport_threat', 982, 'Quito', '', '', ''),
('airport_threat', 983, 'Quito', '', '', ''),
('airport_threat', 984, 'Quito', '', '', ''),
('airport_threat', 985, 'Quito', '', '', ''),
('airport_threat', 986, 'Quito', '', '', ''),
('airport_threat', 987, 'Quito', '', '', ''),
('airport_threat', 988, 'Quito', '', '', ''),
('airport_threat', 989, 'Quito', '', '', ''),
('airport_threat', 990, 'Quito', '', '', ''),
('airport_threat', 991, 'Quito', '', '', ''),
('airport_threat', 992, 'Quito', '', '', ''),
('airport_threat', 993, 'Quito', '', '', ''),
('airport_threat', 994, 'Quito', '', '', ''),
('airport_threat', 995, 'Quito', '', '', ''),
('airport_threat', 996, 'Quito', '', '', ''),
('airport_threat', 997, 'Quito', '', '', ''),
('airport_threat', 998, 'Quito', '', '', ''),
('airport_threat', 999, 'Quito', '', '', ''),
('airport_threat', 1000, 'Quito', '', '', ''),
('airport_threat', 1001, 'Quito', '', '', ''),
('airport_threat', 1002, 'Quito', '', '', ''),
('airport_threat', 1003, 'Quito', '', '', ''),
('airport_threat', 1004, 'Quito', '', '', ''),
('airport_threat', 1005, 'Quito', '', '', ''),
('airport_threat', 1006, 'Quito', '', '', ''),
('airport_threat', 1007, 'Quito', '', '', ''),
('airport_threat', 1008, 'Quito', '', '', ''),
('airport_threat', 1009, 'Quito', '', '', ''),
('airport_threat', 1010, 'Quito', '', '', ''),
('airport_threat', 1011, 'Quito', '', '', ''),
('airport_threat', 1012, 'Quito', '', '', ''),
('airport_threat', 1013, 'Quito', '', '', ''),
('airport_threat', 1014, 'Beirut', '', '', ''),
('airport_threat', 1015, 'Beirut', '', '', ''),
('airport_threat', 1016, 'Beirut', '', '', ''),
('airport_threat', 1017, 'Beirut', '', '', ''),
('airport_threat', 1018, 'Beirut', '', '', ''),
('airport_threat', 1019, 'Beirut', '', '', ''),
('airport_threat', 1020, 'Beirut', '', '', ''),
('airport_threat', 1021, 'Beirut', '', '', ''),
('airport_threat', 1022, 'Beirut', '', '', ''),
('airport_threat', 1023, 'Beirut', '', '', ''),
('airport_threat', 1024, 'Beirut', '', '', ''),
('airport_threat', 1025, 'Beirut', '', '', ''),
('airport_threat', 1026, 'Beirut', '', '', ''),
('airport_threat', 1027, 'Beirut', '', '', ''),
('airport_threat', 1028, 'Beirut', '', '', ''),
('airport_threat', 1029, 'Beirut', '', '', ''),
('airport_threat', 1030, 'Beirut', '', '', ''),
('airport_threat', 1031, 'Beirut', '', '', ''),
('airport_threat', 1032, 'Beirut', '', '', ''),
('airport_threat', 1033, 'Beirut', '', '', ''),
('airport_threat', 1034, 'Beirut', '', '', ''),
('airport_threat', 1035, 'Beirut', '', '', ''),
('airport_threat', 1036, 'Beirut', '', '', ''),
('airport_threat', 1037, 'Beirut', '', '', ''),
('airport_threat', 1038, 'Beirut', '', '', ''),
('airport_threat', 1039, 'Beirut', '', '', ''),
('airport_threat', 1040, 'Beirut', '', '', ''),
('airport_threat', 1041, 'Beirut', '', '', ''),
('airport_threat', 1042, 'Beirut', '', '', ''),
('airport_threat', 1043, 'Beirut', '', '', ''),
('airport_threat', 1044, 'Beirut', '', '', ''),
('airport_threat', 1045, 'Beirut', '', '', ''),
('airport_threat', 1046, 'Beirut', '', '', ''),
('airport_threat', 1047, 'Tabriz', '', '', ''),
('airport_threat', 1048, 'Tabriz', '', '', ''),
('airport_threat', 1049, 'Tabriz', '', '', ''),
('airport_threat', 1050, 'Tabriz', '', '', ''),
('airport_threat', 1051, 'Tabriz', '', '', ''),
('airport_threat', 1052, 'Tabriz', '', '', ''),
('airport_threat', 1053, 'Tabriz', '', '', ''),
('airport_threat', 1054, 'Tabriz', '', '', ''),
('airport_threat', 1055, 'Tabriz', '', '', ''),
('airport_threat', 1056, 'Tabriz', '', '', ''),
('airport_threat', 1057, 'Tabriz', '', '', ''),
('airport_threat', 1058, 'Tabriz', '', '', ''),
('airport_threat', 1059, 'Tabriz', '', '', ''),
('airport_threat', 1060, 'Tabriz', '', '', ''),
('airport_threat', 1061, 'Tabriz', '', '', ''),
('airport_threat', 1062, 'Tabriz', '', '', ''),
('user', 18, 'gal isakovic', '', '', ''),
('airport', 139, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1063, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1064, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1065, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1066, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1067, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1068, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1069, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1070, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1071, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1072, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1073, 'Sharm El Sheikh', '', '', '');
INSERT INTO `engine4_core_search` (`type`, `id`, `title`, `description`, `keywords`, `hidden`) VALUES
('airport_threat', 1074, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1075, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1076, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1077, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1078, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1079, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1080, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1081, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1082, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1083, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1084, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1085, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1086, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1087, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1088, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1089, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1090, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1091, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1092, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1093, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1094, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1095, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1096, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1097, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1098, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1099, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1100, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1101, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1102, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1103, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1104, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1105, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1106, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1107, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1108, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1109, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1110, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1111, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1112, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1113, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1114, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1115, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1116, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1117, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1118, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1119, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1120, 'Sharm El Sheikh', '', '', ''),
('airport_threat', 1121, 'Rockford', '', '', ''),
('airport_threat', 1122, 'Rockford', '', '', ''),
('airport_threat', 1123, 'Rockford', '', '', ''),
('airport_threat', 1124, 'Rockford', '', '', ''),
('airport_threat', 1125, 'Rockford', '', '', ''),
('airport_threat', 1126, 'Rockford', '', '', ''),
('airport_threat', 1127, 'Rockford', '', '', ''),
('airport_threat', 1128, 'Rockford', '', '', ''),
('airport', 238, 'Bordeauz', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_serviceproviders`
--

CREATE TABLE `engine4_core_serviceproviders` (
  `serviceprovider_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `class` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_serviceproviders`
--

INSERT INTO `engine4_core_serviceproviders` (`serviceprovider_id`, `title`, `type`, `name`, `class`, `enabled`) VALUES
(1, 'MySQL', 'database', 'mysql', 'Engine_ServiceLocator_Plugin_Database_Mysql', 1),
(2, 'PDO MySQL', 'database', 'mysql_pdo', 'Engine_ServiceLocator_Plugin_Database_MysqlPdo', 1),
(3, 'MySQLi', 'database', 'mysqli', 'Engine_ServiceLocator_Plugin_Database_Mysqli', 1),
(4, 'File', 'cache', 'file', 'Engine_ServiceLocator_Plugin_Cache_File', 1),
(5, 'APC', 'cache', 'apc', 'Engine_ServiceLocator_Plugin_Cache_Apc', 1),
(6, 'Memcache', 'cache', 'memcached', 'Engine_ServiceLocator_Plugin_Cache_Memcached', 1),
(7, 'Simple', 'captcha', 'image', 'Engine_ServiceLocator_Plugin_Captcha_Image', 1),
(8, 'ReCaptcha', 'captcha', 'recaptcha', 'Engine_ServiceLocator_Plugin_Captcha_Recaptcha', 1),
(9, 'SMTP', 'mail', 'smtp', 'Engine_ServiceLocator_Plugin_Mail_Smtp', 1),
(10, 'Sendmail', 'mail', 'sendmail', 'Engine_ServiceLocator_Plugin_Mail_Sendmail', 1),
(11, 'GD', 'image', 'gd', 'Engine_ServiceLocator_Plugin_Image_Gd', 1),
(12, 'Imagick', 'image', 'imagick', 'Engine_ServiceLocator_Plugin_Image_Imagick', 1),
(13, 'Akismet', 'akismet', 'standard', 'Engine_ServiceLocator_Plugin_Akismet', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_services`
--

CREATE TABLE `engine4_core_services` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `profile` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'default',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_servicetypes`
--

CREATE TABLE `engine4_core_servicetypes` (
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `interface` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_servicetypes`
--

INSERT INTO `engine4_core_servicetypes` (`servicetype_id`, `title`, `type`, `interface`, `enabled`) VALUES
(1, 'Database', 'database', 'Zend_Db_Adapter_Abstract', 1),
(2, 'Cache', 'cache', 'Zend_Cache_Backend', 1),
(3, 'Captcha', 'captcha', 'Zend_Captcha_Adapter', 1),
(4, 'Mail Transport', 'mail', 'Zend_Mail_Transport_Abstract', 1),
(5, 'Image', 'image', 'Engine_Image_Adapter_Abstract', 1),
(6, 'Akismet', 'akismet', 'Zend_Service_Akismet', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_session`
--

CREATE TABLE `engine4_core_session` (
  `id` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_session`
--

INSERT INTO `engine4_core_session` (`id`, `modified`, `lifetime`, `data`, `user_id`) VALUES
('00c66a1b63a493500c0bd697402ac85f', 1567139663, 86400, '', NULL),
('00f4778c9c602271c1c1c1c6bc0e9e31', 1567086700, 86400, '', NULL),
('03990594e96ae5cb7882e12e62b74945', 1567084724, 86400, '', NULL),
('03eb64bdf6c879ce2e9930df7a3bcfd7', 1567084998, 86400, '', NULL),
('045218f613f3d8512ea8ff461588b721', 1569329936, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', 9),
('051d06d7f5b46b241b4cc730016f93dd', 1567144209, 86400, '', NULL),
('070be0dbae842cde8f03e8fca6932309', 1567088362, 86400, '', NULL),
('07393b82cac56beeb082ce30108a5951', 1567085460, 86400, 'redirectURL|s:7:\"/signup\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', 1),
('083b647124a3c482dd021144f1489561', 1567689907, 86400, 'redirectURL|s:25:\"/members/settings/general\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:2;}login_id|s:2:\"23\";twitter_lock|i:2;twitter_uid|b:0;', 2),
('08c1d3562beaca2281df326f03bc558d', 1567140902, 86400, '', NULL),
('0a5oi1nr6moakpgflg4bst01a2', 1567075853, 86400, '', NULL),
('0aa443dc900fa503cf6dde7e1ef23f98', 1567144570, 86400, '', NULL),
('0b75add742eb0dbcdba3413b1124a163', 1567140528, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('0c5ijt2u133gfl37fmqr0vuqg0', 1566987237, 86400, '', NULL),
('0c7rp5r5mb44m27lia196bqr96', 1567054448, 86400, '', NULL),
('0e480f3890b30d3e6a53db9a81f3abb3', 1567151048, 86400, '', NULL),
('0ganar3nbjsgs3bn413q18qau7', 1566996187, 86400, '', NULL),
('0hcdts1ij2ovqp6ah3un1ucuu2', 1566996640, 86400, '', NULL),
('0peivassmtrljctf70io1eenr0', 1566996520, 86400, '', NULL),
('0t9oc5ep4gij7d13p22s8b1b86', 1566989838, 86400, '', NULL),
('0tvvo4vp90j9sltamoceiafd83', 1566998248, 86400, '', NULL),
('1192ae18ba082895377b1e218b74fd62', 1569306885, 86400, 'redirectURL|s:11:\"/help/terms\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('13dgf9odguc0qp8patuu2q1v66', 1566997939, 86400, '', NULL),
('146948362fd63347d124300b82b0982a', 1568378991, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"32\";', 1),
('14o34njreg6qo55c3j0q6nc6m6', 1566998015, 86400, '', NULL),
('14uu87kungsgng51fakp54k0q2', 1567055326, 86400, '', NULL),
('15334a846be1a07de027e94f8029b32c', 1568695218, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('1572bqr6snb5ufiui8l3tvk0o1', 1566993293, 86400, '', NULL),
('159edde88e4350f945f16e8edd6d5cfe', 1567141085, 86400, '', NULL),
('15igmqp25uu3s957q6o97kgvr7', 1567074549, 86400, '', NULL),
('172f591340b21e7212b9e33eb08647cc', 1567415997, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"15\";__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567419597;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:2:{i:0;s:32:\"03522ba1ad9b06f90e8ecc2bc2a84bb9\";i:1;s:32:\"2970ea1f38be22e7cb85a7e3d47fc101\";}}twitter_lock|i:1;twitter_uid|b:0;', 1),
('1a55a1de546e003b3cfa541437a7207c', 1567145820, 86400, '', NULL),
('1b923c67697d6a9c4822da617d600a36', 1567085678, 86400, '', NULL),
('1btv4m661rasaogigpie8m3h56', 1566989227, 86400, '', NULL),
('1d3bb2ded47daba4e198fa44b53f669e', 1567148186, 86400, '', NULL),
('1fa565cbf2ff4fb71e3e1eff40cabf8c', 1567140308, 86400, '', NULL),
('1js8t19hk41ofcncdqsl2ufep2', 1567060469, 86400, '', NULL),
('1o61r9sk8u3d4nu99dbgro6851', 1566991397, 86400, '', NULL),
('1rf1v63v56rl651gem0bn82s06', 1567069564, 86400, '', NULL),
('1tsohmucf5ilcgvb4nk5l39db6', 1567061839, 86400, '', NULL),
('2113cc040aa2159734552227380680b4', 1567089490, 86400, '', NULL),
('21b41dd15276e3a700459ec07d78aef5', 1567143404, 86400, '', NULL),
('21bf94670d2909f578a04fc34c55de4d', 1567141697, 86400, '', NULL),
('22447a744cfb65621cc1eaaa1698adfc', 1569427245, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"98\";', 1),
('235a0a51892e931d6b3a8c7884aefd74', 1569311972, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:2;}login_id|s:2:\"75\";', 2),
('24b54cdaeee3a4494518e6d945e2b6fd', 1569391673, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('25794c2b759e11286a61e1d9c6511096', 1567139772, 86400, '', NULL),
('25afec39131ce0337bc3aea26cc8c447', 1567140492, 86400, '', NULL),
('292d8be2b4fcc5f7621567031a32673e', 1567088259, 86400, '', NULL),
('295c5d547af7faf955883aef81d98a26', 1567148361, 86400, '', NULL),
('2a99740d0492eb837b632147fe2564e8', 1567144249, 86400, 'redirectURL|s:6:\"/login\";', NULL),
('2a99d23704346fb38c306fd417b786f0', 1567140823, 86400, '', NULL),
('2d93685a6f1a0230d7fb52a23e7a8144', 1567141185, 86400, '', NULL),
('2e297r0k9kdr5ddemhj039dkk0', 1567069870, 86400, '', NULL),
('2f55d338f597224a246fa7c061b75988', 1567494310, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"16\";', 1),
('2ld27p8v7hd9h9gndoo21rs0u5', 1566986837, 86400, '', NULL),
('2otr3ftgpgmlq6if8937ti9840', 1566992105, 86400, '', NULL),
('2prhaabbntf46jprno56kjtt00', 1566987000, 86400, '', NULL),
('2s9hfdn4drde78b94d52ej24b3', 1567082794, 86400, '', NULL),
('2tl15gl3hoh3r8s6fpdtk7pl24', 1566997302, 86400, '', NULL),
('30815d749250ac1115eb7c4afd7b6d90', 1569443297, 86400, 'redirectURL|s:6:\"/login\";Payment_Plugin_Signup_Subscription|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:3;}login_id|s:3:\"102\";', 3),
('3189e7fddb1ec6342288bff060fbffaa', 1568897871, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"42\";', 1),
('337sn52c4jg7e2rhvktmfgm7d4', 1566998671, 86400, '', NULL),
('34d6341e68f909bad3d200b23f729b94', 1567140686, 86400, '', NULL),
('3646bd9b2a1260cb8ae882f32d0e0520', 1567150325, 86400, '', NULL),
('36cf7e84d7e3be308aa8d05032d4dd02', 1567085563, 86400, 'User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}redirectURL|s:20:\"/favicon.ico%3Fc=122\";', NULL),
('371bfa125f4451ad44915c1d19e96828', 1568986204, 86400, 'redirectURL|s:6:\"/login\";Zend_Auth|a:1:{s:7:\"storage\";i:2;}login_id|s:2:\"47\";twitter_lock|i:2;twitter_uid|b:0;', 2),
('38d2ojqlfd84mo12u0ca1v9b51', 1566992167, 86400, '', NULL),
('399f465bbbef7f35a00e898a8a0d6b6b', 1567085892, 86400, '', NULL),
('39ed73dd3035798ea75137d24acf042f', 1567603617, 86400, 'redirectURL|s:6:\"/login\";twitter_uid|b:0;User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"18\";', 1),
('3a6189b2b8cddf6445bfd2655f7a055c', 1567085563, 86400, 'redirectURL|s:6:\"/login\";', NULL),
('3af893668477b0461104135524445bd2', 1567145390, 86400, '', NULL),
('3d6591486080570f486bba3fadad24da', 1567147746, 86400, '', NULL),
('3de4cca89cda9a5c8493a991c9d58e6c', 1567086430, 86400, '', NULL),
('3kto30lrfr3pea5632migdkn53', 1566988830, 86400, '', NULL),
('3mgljd3r9lr96vrt6pif65uud1', 1567078426, 86400, '', NULL),
('3r1ob1a76udime170vhsnea046', 1567083225, 86400, '', NULL),
('3uotj5c4o8c6ntd5gvmir92245', 1567065286, 86400, '', NULL),
('418670aaac7d7be46d6d8e4d0035203b', 1567085563, 86400, 'User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}redirectURL|s:20:\"/favicon.ico%3Fc=122\";', NULL),
('42412e9972b0eb7c29dfd38a39debb83', 1567147282, 86400, '', NULL),
('43ioonr6dgaqvgedonf4cptc05', 1567077679, 86400, '', NULL),
('441edd289e26d4a984c6b4d81ec5ff82', 1567091594, 86400, '', NULL),
('459apapvf2n2fidrh9qaj5fda7', 1566993172, 86400, '', NULL),
('45enh4ego8q8fmt7lihud918o5', 1567065166, 86400, '', NULL),
('4651bcf5013966a68b3f9d63a69f72a4', 1567091616, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', 1),
('46dafefeeb0e0b5e1b8bdbc2f2822e37', 1569332774, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"72\";', 1),
('46fd4755db587acd3309b0743b899a7e', 1569403429, 86400, 'redirectURL|s:22:\"/?en4_maint_code=stars\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('46mhrdne5v3k75hdop3d3clce2', 1567081694, 86400, '', NULL),
('48d35bbd31ccd251c754715b3086e96b', 1569418001, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"88\";', 1),
('49d1730404ee83c2a6b9ccfe6a17e92e', 1567141882, 86400, '', NULL),
('4a78aac57508fec2f24c56cad2ea8e61', 1567147611, 86400, '', NULL),
('4ad849c0699e91ac1ed3ead58707a3f1', 1567149131, 86400, '', NULL),
('4bf637b152d0df84dec3d9fb087e3f96', 1567145759, 86400, '', NULL),
('4dc3id0420r6q1od4m2gak8h02', 1567057096, 86400, '', NULL),
('4e4d3f5780a10616b29a07e61e6fc5d9', 1567683928, 86400, 'redirectURL|s:6:\"/login\";twitter_uid|b:0;User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"22\";', 1),
('4e6387d132bbf379806ae09637396e22', 1567146186, 86400, '', NULL),
('4e6d8573cff006ff071b59f6592d2219', 1567143537, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"10\";', 1),
('4e845a4eb2e7e909cb9471801ea85d28', 1569331545, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('4f0d74ac8098923cd29595355aaff369', 1568384961, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"29\";', 1),
('4fr1den8j34sqltedcegvjfn02', 1567060374, 86400, '', NULL),
('4nm5sn2ltu3pmm9bpgh2pfokh6', 1567054141, 86400, '', NULL),
('4qjhcn5ls74l5rm1lsr2rijm34', 1566990174, 86400, '', NULL),
('5313feb72f923a40dc6d63b56908dbf9', 1567140999, 86400, '', NULL),
('5428353137ddc12ef5c9ce04173331d9', 1567145688, 86400, '', NULL),
('5630b71f05a44726a3cf6f388514e3bf', 1567158651, 86400, '', NULL),
('584bdeffcc0ab6e1c937e4d5d90c3d33', 1568380611, 86400, 'User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}redirectURL|s:6:\"/login\";Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"31\";', 1),
('5c01431bc261d18572c48eeaf40d2afe', 1567147347, 86400, '', NULL),
('5c6312679656aa7ae37089a73e9ccf72', 1569390700, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('5c83h54bagiu79h9nm7oqamri2', 1566991721, 86400, '', NULL),
('5ckn7utahgahioha2p6bpto234', 1567056061, 86400, '', NULL),
('5ebdda19cbd6958b89e3650ba78299b8', 1567148636, 86400, '', NULL),
('5ec785446fa515821c63f70dad2bfd38', 1569324562, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('5fb26dee1652f2e85287556d7deffefe', 1568724369, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"40\";', 1),
('5fb4548aded3ec0f1d147cd893e27007', 1569230988, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"63\";', 1),
('5rc0gfr27dherb72to9al0dil0', 1566998796, 86400, '', NULL),
('5tr6c28eio6n9puokg9o3v3gk7', 1567058062, 86400, '', NULL),
('5vtrukngf73q1lub3q7t0u5do3', 1567053207, 86400, '', NULL),
('60f230dba8211d27261085a6b78b0682', 1569245876, 86400, 'redirectURL|s:25:\"/members/settings/general\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"64\";Payment_Plugin_Signup_Subscription|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', 1),
('62td329ep66pnvf1sc4amid524', 1566996702, 86400, '', NULL),
('63vas39egj1lj3t047m2shsoi3', 1566995816, 86400, '', NULL),
('656c7456fcoepbs4edkdd24pn2', 1567081112, 86400, '', NULL),
('65b082ac37263cc740816f0ae76b4438', 1567158434, 86400, '', NULL),
('684046f15fcb0ced317ace9bfb0de230', 1568882004, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"43\";', 1),
('686203752ec71fe741d7e932a9b4cfe3', 1567158334, 86400, '', NULL),
('6873f0390dee627a8867716249ce33ff', 1567148896, 86400, '', NULL),
('6874a680d16430b1faa75e27f9555d19', 1567144449, 86400, '', NULL),
('68l5be57trepg4t851rf9dslt6', 1566995420, 86400, '', NULL),
('690b0a75249b924833dd18d235f1e217', 1567144940, 86400, '', NULL),
('6bb6a41273db72c4102a4693ed84b9d4', 1567086089, 86400, '', NULL),
('6edlpv6unnglrgubd7q1to5vk7', 1566990015, 86400, '', NULL),
('6fc4be056eaf0e5a7eb18f39e9f61300', 1567425225, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"14\";twitter_lock|i:1;twitter_uid|b:0;__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567427540;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:18:{i:0;s:32:\"5324512ce74d8717fb2658e0c95fd224\";i:1;s:32:\"bebb30ce96d87f7ff0ae5befcb74e6ec\";i:2;s:32:\"a78d0a42a1b4cf4d9e59d848e02764b4\";i:3;s:32:\"f50a3547426adba32ece7fc7a510e51d\";i:4;s:32:\"f1b010a130d05c7d0c81cea7c4fdd2d2\";i:5;s:32:\"4c8d8e0dce2a4a21b89d03754721f909\";i:6;s:32:\"b638d75e1af12e7f09c1c6647669ffa7\";i:7;s:32:\"2d8cfd65e25c4cfb37e83218afc45ee4\";i:8;s:32:\"79df33082d02da8b7b54c5e448429a2f\";i:9;s:32:\"f1180689b0ff75cf0f9cfbee0e3c4e08\";i:10;s:32:\"ed88be763f3ce95a77fb185f27c85f1d\";i:11;s:32:\"9300ae3a5d9b9ff0e7cc4c2ba27fe060\";i:12;s:32:\"c7aae035e83ce16a6a0f6f70e15a7099\";i:13;s:32:\"40108bc5f2f8b328c3455c1d328282fb\";i:14;s:32:\"00895567aa6ae3c5bbcb9c4ebabda5a2\";i:15;s:32:\"01e2214dc49250fcd2bfbb9c0b962ba8\";i:16;s:32:\"843e779b2f9a903a027bbde12690a549\";i:17;s:32:\"5fd797422fab6a118782db378228b95a\";}}', 1),
('6ff47c64e1780e2f719a449c623759bd', 1567143317, 86400, '', NULL),
('6tsgon0dnk2b3imqripsjipft1', 1567056818, 86400, '', NULL),
('6vecgfu4vo9m9m1lqljdivata0', 1566998218, 86400, 'redirectURL|s:21:\"/threat-forward/login\";__ZF|a:2:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567001779;}s:69:\"Zend_Form_Element_Hash_f541fd225156e0af7be3af42c46493fc95f96a1e_token\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1566998406;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:25:{i:0;s:32:\"856981c338d7e680a4220b1d820722f9\";i:1;s:32:\"fb1d3cc8d5dc35b08cb308f4f679d70a\";i:2;s:32:\"4d451791acdff15e185ce061108120e2\";i:3;s:32:\"643badb6b79aeaf87705498098036995\";i:4;s:32:\"5f9679d7db4842b9435f0cec155bd6f9\";i:5;s:32:\"d952bbf2ab92d7b48c1491fb67669800\";i:6;s:32:\"78f4282a3856dfc02727dbd653bec8b4\";i:7;s:32:\"c3566ea40088f1e51a669eff3e0651ac\";i:8;s:32:\"de27a611bb567676f9be5da95cda8c3a\";i:9;s:32:\"d22f7341e3070f0f1f3b8a1d1fb7b3d1\";i:10;s:32:\"93de67569bac8ceb6e96f6f2a1af8d3b\";i:11;s:32:\"d78866babcde2c172d1c13f6129dcfb6\";i:12;s:32:\"5570f7561811b546d9cbe5b5bd205c74\";i:13;s:32:\"5eacea0df5c92ce138ffddd2ffc20ae6\";i:14;s:32:\"88a0c17fe87008103a2c34a39e5d2c61\";i:15;s:32:\"2cc395c2f99ae033ed5dc70af0e992f3\";i:16;s:32:\"172f2a6586aab9699f02b3f8917c8bf8\";i:17;s:32:\"64aa62291c541da6c6d0d216b5e1b65c\";i:18;s:32:\"a75c2104b2b3e92c2c8d0c6e2232d56c\";i:19;s:32:\"42fa22b4ae34c5844dda2116632e43a3\";i:20;s:32:\"d216ae59e90c1e4d751203bdfa281299\";i:21;s:32:\"a102b403a6ed24cb420a0509261e8d61\";i:22;s:32:\"02739633e48b4380c0038a4ebfbc8305\";i:23;s:32:\"a0ce62c9b180a21bbd4d74611ff62c4b\";i:24;s:32:\"32cb252fdb47123bba855480a37e6ab0\";}}Zend_Form_Element_Hash_f541fd225156e0af7be3af42c46493fc95f96a1e_token|a:1:{s:4:\"hash\";s:32:\"4f41ed6bbce4ddd14e1a6a9c3f882f2d\";}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('704f304e82172aec883470923e4f69e2', 1569414162, 86400, 'redirectURL|s:22:\"/?en4_maint_code=stars\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', NULL),
('70a3628f58f5f75d013fafcc5e9939f8', 1567171242, 86400, 'redirectURL|s:7:\"/signup\";Zend_Auth|a:1:{s:7:\"storage\";i:2;}__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567174841;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:4:{i:0;s:32:\"a3615171958face4c908c99db0b52508\";i:1;s:32:\"6f5c616ddafe085d7e78c1510e8dc65b\";i:2;s:32:\"6692110ce18894526394699d1a12c889\";i:3;s:32:\"f9bd3da89513095561736224ef1283e9\";}}twitter_lock|i:2;twitter_uid|b:0;', 2),
('70khi6mglcahuvcbtg6tl1msg5', 1567054993, 86400, '', NULL),
('70mcrbu15rbdr87bbtm2dptef1', 1567060295, 86400, '', NULL),
('7166ad7021a90f8f8f33f116ace76b9b', 1567141300, 86400, '', NULL),
('72c49d6aea6a2236064fcd48857ec11a', 1567158802, 86400, '', NULL),
('72f50e8de3bc98e92f541b9b49652d0e', 1567142164, 86400, '', NULL),
('73b2351de04a71d402313c74d14297bb', 1567141406, 86400, '', NULL),
('7407597076f6d295ebf22fb6fb614c0c', 1567143995, 86400, '', NULL),
('7556625fb536405f05c35be208685fa9', 1567085264, 86400, '', NULL),
('75ftd99n78r4em1pr4ho6tpr34', 1567083500, 86400, '', NULL),
('763187b5333550dfe678f92de1f09a66', 1567085975, 86400, '', NULL),
('7637961260fe8b60b1f958b677455dad', 1567158736, 86400, '', NULL),
('778b94c4cd14cb8d41e9719ebb697634', 1567144119, 86400, '', NULL),
('77f3b92ba146d99dec08d6d68d40c06c', 1567169368, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:1:\"7\";twitter_lock|i:1;twitter_uid|b:0;', 1),
('79b31564f3deadc2463d74844c86b78a', 1567146340, 86400, '', NULL),
('7cd6d1d1c2ef291308e18ad90c0f715a', 1567149964, 86400, '', NULL),
('7e95c7d770064ea915bbfbf5db315666', 1567139575, 86400, '', NULL),
('7pggo3909b94jsasn5tq5v7104', 1567059412, 86400, '', NULL),
('7rsrkg54h83e9t6tqinkqbt386', 1567083384, 86400, '', NULL),
('7t2utlkhmohh9i1ol0phrj7r94', 1567083102, 86400, '', NULL),
('82u1uu5hn4segljn72raskpp84', 1566987477, 86400, '', NULL),
('847f175668f00b150d5815eb1bfa9dcb', 1569439514, 86400, 'redirectURL|s:1:\"/\";Signup_Confirm|a:3:{s:8:\"approved\";i:1;s:8:\"verified\";i:0;s:7:\"enabled\";i:0;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', 3),
('86f541803da33da284faa0f75f70d59e', 1567147414, 86400, '', NULL),
('88ad999095c0e00465bc6cd3ddcacc89', 1567146797, 86400, '', NULL),
('88b9ff08455f814fc61ca4ed18939703', 1569443628, 1209600, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:12;}login_id|s:3:\"103\";', 12),
('88qv0g1pdm7lerqilbtm9ckj43', 1567053727, 86400, '', NULL),
('891852ea1e6cd176a068ea470b6d88ef', 1567147952, 86400, '', NULL),
('89696809fc52a1a5a8923ce625fd1e82', 1567084587, 86400, '', NULL),
('8a926f0da450ca013624e6d19cfda956', 1567146066, 86400, '', NULL),
('8ccfc6aa0a0843277723421f66ea983e', 1567149301, 86400, '', NULL),
('8d2516a63f438471cb0f11a4d93734b8', 1567147686, 86400, '', NULL),
('8f256db0374f59c5c96cd823a61a0b14', 1567088362, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('8ffce501tmq7a7bid289on0c10', 1566993502, 86400, '', NULL),
('8mvntcvljcteajcfdpitshg431', 1567070732, 86400, '', NULL),
('8njehrn2dmbkkud5bkfunl4t96', 1566997182, 86400, '', NULL),
('8p7oo7505l4mgihh6qi2lr62k5', 1567054514, 86400, '', NULL),
('91ti6aqir4rq7b502afsj8f8n7', 1567079118, 86400, '', NULL),
('922b830fb9b2b89b374cdcbfc8775ec6', 1567146724, 86400, '', NULL),
('924895b7a9620bd058ea02148ce78686', 1567148055, 86400, '', NULL),
('935a1374371305370b2e1017c5fa64c8', 1567158494, 86400, '', NULL),
('938fimr62sd3s3r12dh3plcp63', 1567053399, 86400, '', NULL),
('9637e4cc6be3fbf44f80a01a05f4338b', 1567139466, 86400, '', NULL),
('96653648e44af977679f3b4e0f21dc6e', 1568640842, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"35\";twitter_lock|i:1;twitter_uid|b:0;', 1),
('96f0d264b716f6e4eac1c84533eec5ad', 1567145326, 86400, '', NULL),
('978120b00b96c0528117eb18d76f8ff2', 1567141559, 86400, '', NULL),
('97b701c8122fa372fef1b5109f05c436', 1568641043, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"39\";', 1),
('981df773928b4b5e0ec6cc2d60718099', 1567149496, 86400, '', NULL),
('991971535b8cb555e7dbe4e8b0ebbc5b', 1568179936, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"28\";', 1),
('99546plpv8ooogoo8mkg0ru4q3', 1567053003, 86400, '', NULL),
('9a6937b24c7b3d90b5a89356ac890325', 1567158494, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('9a884pf2emd78j7vpk1p27rjr3', 1567078605, 86400, '', NULL),
('9b56c7a41590c38d3e53d8bd1081dea2', 1567754979, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"27\";__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567758225;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:4:{i:0;s:32:\"2381e4ed3a5481aa64f098a80a8b1cb1\";i:1;s:32:\"0c832716831cf4a3eff4d5219db5e3b6\";i:2;s:32:\"bbb68e81f830e3c2679e946a8decc168\";i:3;s:32:\"f05fdc65e1362b2cbe0ac55d80cf0049\";}}twitter_lock|i:1;twitter_uid|b:0;', 1),
('9bijv6e8qdavbpr8c83r0l4d14', 1567083801, 86400, '', NULL),
('9c0ghjfv5iuirdmr2pa2cofvd3', 1567077745, 86400, '', NULL),
('9c226b4ae9deefb939d738ae83a19293', 1567142936, 86400, '', NULL),
('9d7fe173e05abe06fb2fa8545e34ddb7', 1567142851, 86400, '', NULL),
('9e9082594f9d6ab68e7bcb29153fbedd', 1567145095, 86400, '', NULL),
('9ektv4c8j7fibfbkaltchplu64', 1566991052, 86400, '', NULL),
('9gc4ojjjj96j89nilf1d6trja1', 1567057321, 86400, '', NULL),
('9ifqan0tu2fipnsb7p3glo8386', 1567055678, 86400, '', NULL),
('9ok5r7qs9u4vlebuifbtm7jum7', 1567082555, 86400, '', NULL),
('9qf6a0skhq1kk84h55r1cdgm94', 1567065044, 86400, '', NULL),
('a012dd625072d6fb04a730a25095b70e', 1567149583, 86400, '', NULL),
('a034223d8634d953a8d40322735e4ca5', 1567084935, 86400, '', NULL),
('a0b50977b1076f744afe05ed71e9c9a8', 1567089551, 86400, '', NULL),
('a1829fdf1c98ff814a5ff21825222a14', 1567144643, 86400, '', NULL),
('a3aai7m571pkquk1jgv0bgjlh3', 1567084000, 86400, '', NULL),
('a6fd2bde9283d7c55f8ae80adb49ec9c', 1567147101, 86400, '', NULL),
('a732fc6938dc094194382ab94adead7b', 1567148801, 86400, '', NULL),
('a84sq44cvl73b61t48jmqna7q4', 1566997487, 86400, '', NULL),
('a92gtp3s1m07ujja36q7tc9p43', 1566997422, 86400, '', NULL),
('a99c5aa2c4ba70cac1effecf6ffe9a38', 1567776917, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"25\";twitter_lock|i:1;twitter_uid|b:0;', 1),
('a9b2f9bc1acbef713393132520b0f01c', 1568900141, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"44\";', 1),
('aa2c8860281d3711e048451373910037', 1567147160, 86400, '', NULL),
('ac3140a04a4c457ab37ea5516b8fb97b', 1567753860, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"26\";__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567756966;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:2:{i:0;s:32:\"b0eeb02976de72a2d5a601d20da05752\";i:1;s:32:\"0b5cd7ead0ce6c0c5ddc70580641fa5a\";}}twitter_lock|i:1;twitter_uid|b:0;', 1),
('acfa1dbeefd579f975b3a06f5e6abf29', 1567147884, 86400, '', NULL),
('adabbkhu3q03bo5dj3f1o4beo0', 1567053128, 86400, '', NULL),
('adc9f7d1a7b6651b24b0109efe23aac4', 1567142661, 86400, '', NULL),
('ae19b53b44c422b8ec716b2ea2ac6051', 1567690117, 86400, 'User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}redirectURL|s:6:\"/login\";Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"24\";', 1),
('aqea31pktt8vkuqr8hvso155g0', 1567061647, 86400, '', NULL),
('aumjs36omidr475akjrekiqao4', 1566994968, 86400, '', NULL),
('av7cnobbj5bl12orgtg8rh2o50', 1567081407, 86400, '', NULL),
('avspnpr3q5t87jbf6e27e65ti1', 1566986766, 86400, '', NULL),
('b16991b4c32a90e134d503977e44b5eb', 1567148368, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"11\";__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567151484;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:11:{i:0;s:32:\"94dd20c510f5dca9c05b4cc5bc9ca09c\";i:1;s:32:\"460b5570ce35b9014b556c6c3658deaa\";i:2;s:32:\"40a6d25664fe53f18495b4058b09a7dd\";i:3;s:32:\"d8b1baad0b8469e892e5fdc4ae2b489b\";i:4;s:32:\"980dcc6c23db126f1be142c7d6b1821b\";i:5;s:32:\"d5c78df5086d4ca7739590e8810f022f\";i:6;s:32:\"6e32d84b3a662fd1cdad9168c867ad76\";i:7;s:32:\"61666f75ef9f254df38d59384b5a6ab3\";i:8;s:32:\"8564e5ea5d08fece8ec8f73f0e93c881\";i:9;s:32:\"aa4b76aeda6058715810ffc126936a0c\";i:10;s:32:\"863cfa20c7f79efb7d8c57439e6443da\";}}twitter_lock|i:1;twitter_uid|b:0;', 1),
('b3f9a6246dcb3ba205e49bca5c8c28f4', 1567150155, 86400, '', NULL),
('b4ad1937554105a7c29eda41d4ff49bb', 1569356415, 86400, 'redirectURL|s:1:\"/\";Payment_Plugin_Signup_Subscription|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Photo|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Invite|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', 3),
('b5a1b48b03a92378b0d2a798354d60a7', 1567142737, 86400, '', NULL),
('b7295365d13f34e72145c548e2123ccd', 1567084464, 86400, '', NULL),
('b953be6cf56cc0efc61efa131a53c0d4', 1567148968, 86400, '', NULL),
('bafqo7q403mdg7pa9n1nfkcag5', 1566988081, 86400, '', NULL),
('banpa3uqb1kifrms6k2m0840q5', 1566995575, 86400, '', NULL),
('bb2ad7d682189372e5f5665de964aa1f', 1567425226, 86400, 'redirectURL|s:13:\"/help/privacy\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('bd4fddc8f7d8eaecf05c7aa9049f30b6', 1567143713, 86400, '', NULL),
('be6861733ab2cc61d549f4060cea8306', 1569196737, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}', NULL),
('bg6as23bcg1vbn2dql8ie9g2u1', 1567055835, 86400, '', NULL),
('bgg46uv36njcm1r3lnocldd391', 1567061724, 86400, '', NULL),
('bjuq41logoj7flgch9tofmf1h2', 1567056643, 86400, '', NULL),
('bknp9duh57f1o007204sjmvhf6', 1567081297, 86400, '', NULL),
('btbhkquh22lp8u3k1pe24gj025', 1567060100, 86400, '', NULL),
('c1c2969b23442d49db5a8c9ddb3b0b4a', 1568378407, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"33\";', 1),
('c2b37be3159405fc375999b74fe5f3a3', 1567150232, 86400, '', NULL),
('c3177b5dbc4156bd200e1de81db7f784', 1568799060, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('c48bd583b55d1a072b6df09419ed5801', 1569426101, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"93\";', 1),
('c4a1e50942d6dae5a0b02ce1aa007624', 1569246017, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}Signup_Confirm|a:3:{s:8:\"approved\";i:1;s:8:\"verified\";i:0;s:7:\"enabled\";i:0;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', 9),
('c4f06e29e97a4900573c762af0f00487', 1567744689, 86400, 'User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}redirectURL|s:37:\"/pages/dashboard?en4_maint_code=stars\";', NULL),
('c783355c7098f12a5263c70af18a6fb9', 1567151281, 86400, '', NULL),
('c84c5cb9bc38a6ec49636d54a1265e1b', 1567149059, 86400, '', NULL),
('c891e9fb8066f68e21bd4fc3dcaa5bd0', 1569431780, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:12;}login_id|s:2:\"80\";', 12),
('c8fe60140f0a1c629a84b74c4a412769', 1567146962, 86400, '', NULL),
('c8tm9jlprtamoqe2hauapc9jm2', 1567059268, 86400, '', NULL),
('cb5ldoavr2tg3prdmnqrgn7kh4', 1567054650, 86400, '', NULL),
('cbbc4bfc42545708b262c89f726d7ea6', 1567142577, 86400, '', NULL),
('cc10kce98pthggkcb0bllboqu7', 1567064116, 86400, '', NULL),
('cc3ff789ed58ef639b9f86cee429a465', 1567147041, 86400, '', NULL),
('cc4446bcf9fd271f4b57347d4553e5d5', 1568889294, 86400, 'redirectURL|s:22:\"/?en4_maint_code=stars\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('cd1a899835a7dea8c5d0f8e1a26067f5', 1567144370, 86400, '', NULL),
('cdf6931578b4d0271fd6a5c867e979bd', 1567145891, 86400, '', NULL),
('ckkef0lv87rdeu0mqgg9akb894', 1567078812, 86400, '', NULL),
('cu7uu8s3lhqlf5gn7p7itus5g1', 1567065495, 86400, '', NULL),
('d0d9e3b9481d031452bfb673846fd91d', 1568986133, 86400, 'redirectURL|s:25:\"/members/settings/general\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"46\";twitter_lock|i:1;twitter_uid|b:0;', 1),
('d0ef7772b4c131aa63915821bb94baf0', 1569418254, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"85\";', 1),
('d267f1c66ab9084d37f81209b633dcac', 1569307735, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"73\";', 1),
('d292d4f948f6e30c5abc4545a924c3ba', 1567140010, 86400, '', NULL),
('d2c783545f6a7891c4bf51f4a9910569', 1567142352, 86400, '', NULL),
('d3683cb0b5c435eaed6ff9b5d4ef3b69', 1567149215, 86400, '', NULL),
('d4566594b61d84bdf90f9de267817a5c', 1567085460, 86400, '', NULL),
('d4be90c368ac7b8c687398d26e8fe73a', 1569307672, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"74\";', 1),
('d5acb31294188b4b0058506184679944', 1567141821, 86400, '', NULL),
('d5acbafec742bced19d67474f27272c1', 1567087106, 86400, '', NULL),
('d62c545d9b75b6024fd5961d29ab5774', 1569246728, 86400, 'redirectURL|s:25:\"/admin/core/settings/spam\";Signup_Confirm|a:3:{s:8:\"approved\";i:1;s:8:\"verified\";i:0;s:7:\"enabled\";i:0;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}', 4),
('d6e2181rnh34rtes4pljnjhuo1', 1567072733, 86400, '', NULL),
('d6ed9990e3d67d53ea5d32d70cbd6371', 1567085389, 86400, '', NULL),
('d8hmoosn7ucsipb2csuk3h1ps1', 1566991789, 86400, '', NULL),
('d8kv9ra1c2kfihes6trlaoope3', 1566989295, 86400, '', NULL),
('d9ipvu9kstbvlj4f5s9cfv6ui3', 1566998519, 86400, '', NULL),
('dc92699cdb27cbe06fa1ddb9b129c03c', 1568993576, 86400, 'redirectURL|s:13:\"/help/privacy\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('ddc0ad98047f371758a475d7d001ebe9', 1567140564, 86400, '', NULL),
('dgha9ttqt4avlpqo5co0h8aub2', 1566987361, 86400, '', NULL),
('dhqbumdid1gs4mq14qt357cu13', 1566988205, 86400, '', NULL),
('dj5q51vlrdc20ob5a47dln52t4', 1566992385, 86400, '', NULL),
('dscvfmsk5ak6r4s9n6rudhnpd4', 1567083995, 86400, 'redirectURL|s:21:\"/threat-forward/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:1:\"1\";twitter_lock|i:1;twitter_uid|b:0;', 1),
('e06b543dda3eb8b6a148ee3ba993420e', 1567138673, 86400, '', NULL),
('e0f16f8593da36322461dcd15a5acd70', 1567143478, 86400, '', NULL),
('e2388ebdf323cbf55c3ff5a7b32b2018', 1567085721, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:1:\"4\";', 1),
('e2a711d3bdb5fcb19e401911ea510df6', 1567143023, 86400, '', NULL),
('e33e046f3eea6f0f024bd20a710881f8', 1567085563, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('e61s10l8737ki177kr0uspdko1', 1566987114, 86400, '', NULL),
('e8dd362df15f1dfec643597c8ef97108', 1567144691, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('e94884f4738e4545bcec5633999450d5', 1567147505, 86400, '', NULL),
('e990ced845a01eb782010b5cc6c15e10', 1567123901, 86400, 'redirectURL|s:1:\"/\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('e9cc0af08f6f2190906314fce4884cc2', 1567144709, 86400, '', NULL),
('ea2f0fa28d1b41ab3fe1e6f69119e42c', 1567086250, 86400, '', NULL),
('ebd4bc6cecf624b6307cb03008652544', 1567086546, 86400, '', NULL),
('ebrgqfit0mpsuiqqvvckbdhe37', 1566995027, 86400, '', NULL),
('ebt9n1mogkd8q9trj60cqpppv7', 1566992660, 86400, '', NULL),
('ecsi0tvlv9q8b852bdvlmcs9f3', 1566990855, 86400, '', NULL),
('ed5cd656a8517d5092d6e9581bcc8652', 1567085563, 86400, '', NULL),
('ee47ece8992dc94cf0db69529d39e307', 1567158887, 86400, '', NULL),
('ee6spejuiaki63mb5aeiru7vi4', 1567081206, 86400, '', NULL),
('efc7f9f5598b4dd7010bb55ff2836795', 1566998921, 86400, 'Zend_Auth|a:1:{s:7:\"storage\";i:1;}twitter_lock|i:1;twitter_uid|b:0;Payment_Plugin_Signup_Subscription|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567002510;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:20:{i:0;s:32:\"10ad730f4a5e8f3ad051d2ecd9edc8c4\";i:1;s:32:\"968f365a4bb062dc007286a9507bd5e8\";i:2;s:32:\"a2f667372b63c178c0a142ab57389b16\";i:3;s:32:\"2b872225da6aa095f84ea9a4229ed3fb\";i:4;s:32:\"76559ec8026d372f7ceb35c4759f6e4f\";i:5;s:32:\"1c296a79615eff25596153b184bc9d52\";i:6;s:32:\"275abc7b635c0badb88395ad45946c2a\";i:7;s:32:\"df5a5b881fbba12f1fcb533b3cdaa148\";i:8;s:32:\"c483989f045a4aeab21371d0fb3e67ab\";i:9;s:32:\"4a5dbf2477c7e5b4a4ffa368111eef0c\";i:10;s:32:\"5e69fc92e476a9b5089d05074167d23c\";i:11;s:32:\"8a404ed433cb5d268a50a3a08a59d5be\";i:12;s:32:\"63c7fd283860d1f52b3a2693172609e4\";i:13;s:32:\"2a0dcfa3c6cddb94e00271aac7c5c511\";i:14;s:32:\"ce32343160fab33fb1b040b194f05063\";i:15;s:32:\"35e1303dcbdd7bb4b68a769bf646c674\";i:16;s:32:\"f4831d20c62f92ee33ee107c340ef0ad\";i:17;s:32:\"d0515990173b60acdecd3ae5fef527ca\";i:18;s:32:\"2bedfc5b350f7b3e17820df72a869f62\";i:19;s:32:\"4f3b71d24b25809624d1e813bdceed1d\";}}', 1),
('egodurhfifq5fc52hotpm2jd22', 1567059971, 86400, '', NULL),
('eik6rlo6ai4lv54bq2pbgcp2b5', 1567075785, 86400, '', NULL),
('ej9m9c7uagp74uj9fd4to410l6', 1567053642, 86400, '', NULL),
('elp3snji7bsp8b01lhhr17fod1', 1566991587, 86400, '', NULL),
('ens0tpho93hkjlm8smirhnav76', 1566998098, 86400, '', NULL),
('eqgispoq06hogjvd5jhnbr9b26', 1566995754, 86400, '', NULL),
('etbkaku7jb9iu4ajodlcns0102', 1567056182, 86400, '', NULL),
('f04c03q29r36a4rbcvm1afs1e1', 1567063253, 86400, '', NULL),
('f0e28ab263cd2ddcd7c8ff7350201372', 1568900204, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:2;}login_id|s:2:\"45\";', 2),
('f32ecde0ab4967796ec9cd88d815ea10', 1567139355, 86400, '', NULL),
('f3957d77d08645b5f155d3f326468496', 1567146895, 86400, '', NULL),
('f3ca051b815df81d6a0e021490cf451c', 1568699895, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', NULL),
('f437srd8a77137nmrk1h38ac47', 1567082867, 86400, '', NULL),
('f49c81d68b5df57fd6dec71cb90938f4', 1567123901, 86400, '', NULL),
('f6436d7918f511e8afefe42c7216cd2c', 1567146636, 86400, '', NULL),
('f7f2928ae4422dfe5bdbc9378627e4eb', 1567141906, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:1:\"9\";', 1),
('f8b57aad83c5e2f59959f50d9b21892c', 1567140157, 86400, '', NULL),
('f8d8dfee5d28ed90b188fd317ba1e3d5', 1569416785, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"87\";', 1),
('f981d998615ffeec3e005b4d787befb8', 1567150023, 86400, '', NULL),
('f9fbe21bf28635e2f3e69f1eafbb49f7', 1567142003, 86400, '', NULL),
('fa4288d70653ba3e4f7e1b5594418e34', 1567140759, 86400, '', NULL),
('fb859c35d1a6e17315a688b7cece965c', 1567158574, 86400, '', NULL),
('fbfoijpi9pk3leved5saj9vln5', 1567057419, 86400, '', NULL),
('feae4f180ce03ff4e70657303ffe4761', 1569391766, 86400, 'redirectURL|s:6:\"/login\";User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"84\";__ZF|a:1:{s:69:\"Zend_Form_Element_Hash_f541fd225156e0af7be3af42c46493fc95f96a1e_token\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1569391913;}}Zend_Form_Element_Hash_f541fd225156e0af7be3af42c46493fc95f96a1e_token|a:1:{s:4:\"hash\";s:32:\"92b18fc23b024d02c710d59b95802f44\";}', 1),
('fff973d25d332f6450a8a54282c0c30c', 1567148301, 86400, '', NULL),
('fmf39o39hv9rtrni8pvlal00i5', 1567056509, 86400, '', NULL),
('fsskjhqejc16ch9m47ha4nmb10', 1567077920, 86400, '', NULL),
('fu192suvdjt8f1686jf900nh22', 1567072960, 86400, '', NULL),
('fu3ueft2cus0ocj0sb4neohap0', 1567071045, 86400, '', NULL),
('fun1vndh1j3tmmghr5shj5orv1', 1566996065, 86400, '', NULL),
('gjuffm71cmft8lk30khnin8lj4', 1567063495, 86400, '', NULL),
('gqp0ebspbiaq0js0d6b2hcns31', 1567056446, 86400, '', NULL),
('gvqbuqt1nlmhs7n04m8ammget0', 1567071191, 86400, '', NULL),
('h107huaa5ilv2lt1kd0fmlbvv6', 1567055966, 86400, '', NULL),
('h4jovn58jfab4ataugarqfrcm1', 1566992326, 86400, '', NULL),
('hd88ud5k2sf1jsp6e6v6834t82', 1567078516, 86400, '', NULL),
('hh3e8jtq7chue9rivt39815n11', 1566993717, 86400, '', NULL),
('hhsueoi5gdmer5cg5tm2t7mem4', 1567079826, 86400, '', NULL),
('hkk0d3h7nfb7i6j03p0gce9nt4', 1567053273, 86400, '', NULL),
('hm8dinjon3cfnsvi4iknvpsam3', 1566989933, 86400, '', NULL),
('hmnpa5ki22e7ae51qqv6f3g8i0', 1566998181, 86400, '', NULL),
('hogo29vi63aldl7cta9pt2rll1', 1566996942, 86400, '', NULL),
('huirpbs0c5va0h372ek0k0hch5', 1566988320, 86400, '', NULL),
('hveap2f4nqamkece8o74m3ts94', 1566987602, 86400, '', NULL),
('i0dajoe8eamh7q8bb9662nfdk0', 1567071327, 86400, '', NULL),
('i6tse33aetsorul8rfvmbtscd3', 1567070245, 86400, '', NULL),
('ia4i25gmulrmr37m0p38fntr77', 1567080871, 86400, '', NULL),
('ieve4n9el9gtjq5jgt6ed4o8l2', 1566990601, 86400, '', NULL),
('ight15g7m0tg8kcheb2cbdc7g4', 1567070966, 86400, '', NULL),
('j0c8e9neehid0b3dlli3rtim90', 1567082670, 86400, '', NULL),
('j34b22h85if22nt5ieggt0r127', 1567060839, 86400, '', NULL),
('j7f897njveg255ofgcrh15uk86', 1567062317, 86400, '', NULL),
('jarujq3ulkijbbi7n2lbb60bb0', 1567061552, 86400, '', NULL),
('jf7ehku1nj49vvg57gv73ut0j0', 1567065405, 86400, '', NULL),
('jp22mdhc73lhbhjgus46t8ucj0', 1566990467, 86400, '', NULL),
('k6beonobn0d6i4ek8o50der953', 1567081630, 86400, '', NULL),
('k6gmdbs00n40seg55u940arjs7', 1567075689, 86400, '', NULL),
('k9a25ld8oio3tgqdtta38nrja4', 1566994630, 86400, '', NULL),
('kgdejb1m0gt9p4v62na1mg77m5', 1567081834, 86400, '', NULL),
('kgg0bpkequjt1ot9igba7b45o1', 1567077809, 86400, '', NULL),
('kmf2ng1ijl103h09j5aaarf3q4', 1567073110, 86400, '', NULL),
('kn3pgsbht7s2hofmebg1ambf77', 1567079520, 86400, '', NULL),
('kp80fgu3ce3sssn4sg0cb242l5', 1567070815, 86400, '', NULL),
('kqc53ru2niu6l6grjr3a8c95c1', 1567057163, 86400, '', NULL),
('kr0ih3njvknbpe95f76dbifng2', 1567082107, 86400, '', NULL),
('ku5jc45qcmvcf3hq2mtl6mrv67', 1567056269, 86400, '', NULL),
('l01gdiok05p5aqvv2d0ln8k3q7', 1566990753, 86400, '', NULL),
('l0n59b4pt8j72hht4vi3u837q0', 1567057483, 86400, '', NULL),
('l1chgjao221116dj0vna11n861', 1567076256, 86400, '', NULL),
('l7mf6s51tav1bi1bi3tmgi4i45', 1567062979, 86400, '', NULL),
('lb0ikevnh85elbb2eea5nq1g94', 1567083319, 86400, '', NULL),
('lbg7dafglvt9l5hgnr32vk0583', 1567063740, 86400, '', NULL),
('leullm1vkk11c1lbs6g2pdnh90', 1566990314, 86400, '', NULL),
('lfneriapig9v6t7ffhun93qov2', 1567063992, 86400, '', NULL),
('lldpmdfqap67kfch19u0npb7p4', 1566993618, 86400, '', NULL),
('lpg125up57rp0tupt4u92i9t67', 1567062242, 86400, '', NULL),
('m7gpb47j3sr05hdutai1169570', 1567070364, 86400, '', NULL),
('m9dpvhs9blm6nt339dkqt3erf1', 1567054387, 86400, '', NULL),
('macte8ptgp4uql3k4grv2u9pm7', 1567063554, 86400, '', NULL),
('mencuvnmqa5vekmta4oak01121', 1567072467, 86400, '', NULL),
('mfcp2chu9i2ao9nru7ab9qls40', 1566994814, 86400, '', NULL),
('mg2b9lg39uquotlahfhf35enf6', 1567082375, 86400, '', NULL),
('mlc3dohup36ruqk8dja0h9hdh6', 1566995888, 86400, '', NULL),
('mtdechcmrdp2nodbi1ttiuqht3', 1567056737, 86400, '', NULL),
('mto5us7gug1f8v6fralhhsjc27', 1566991659, 86400, '', NULL),
('mvirrv6cfcfin13s5qkvvi9fu1', 1566993005, 86400, '', NULL),
('n4div9p4htugl0hdjpfv97eov6', 1567073241, 86400, '', NULL),
('neglhcmdpdk1e883nhnpjo8193', 1566994533, 86400, '', NULL),
('nj0o8ibej3vjbvrmbg575eede4', 1567062397, 86400, '', NULL),
('nmk1jhpmb68p5nj7qsrflrr3k4', 1566991951, 86400, '', NULL),
('nqvhvm00hmrodntddpvr3apg46', 1567063334, 86400, '', NULL),
('nurukl3j4373rvr0atb3kahhl4', 1567057643, 86400, '', NULL),
('o24k2ve29k902vaf5stmm1tj91', 1566997785, 86400, '', NULL),
('o26qj3oemrce3o6gsks1jbqjm3', 1567053521, 86400, '', NULL),
('o4d1j14jfrj3qvp7jqinudkkk4', 1566998432, 86400, '', NULL),
('o927jkebmb8up74t3i5ksfq9i6', 1566991883, 86400, '', NULL),
('od5b2n243gcis46sgqnrif9sb5', 1566989728, 86400, '', NULL),
('ofbg06j5onubtqr4rjp0nd42j2', 1567082989, 86400, '', NULL),
('oigortthvu2j8kb7h0r2e6rg67', 1567079689, 86400, '', NULL),
('omp13q141glmmvd6sp88u3cdm1', 1566996395, 86400, '', NULL),
('os2jjr43lsfr3olq0f7oblaji0', 1567064466, 86400, '', NULL),
('pe0dv30b00rsmi6jisj3b09io2', 1567062700, 86400, '', NULL),
('pft0i01euig9phco8bho4foca2', 1567054715, 86400, '', NULL),
('pkh2n22m5fshbc0lco69jv7tq1', 1567085028, 86400, 'redirectURL|s:7:\"/signup\";__ZF|a:1:{s:17:\"ActivityFormToken\";a:1:{s:3:\"ENT\";i:1567085031;}}ActivityFormToken|a:1:{s:6:\"tokens\";a:2:{i:0;s:32:\"ac1f7269f00f89b29f88614ccb8a0fe6\";i:1;s:32:\"1082ff93d2e2f8a994971fd9dde8976b\";}}twitter_uid|b:0;User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}', 1),
('pp6pah4j6u3em6c0qgputf9j62', 1567081763, 86400, '', NULL),
('pvrt50lfp437pjmgknf4ukaog3', 1566987841, 86400, '', NULL),
('qf952jl4jaqjo9t11c6nhjutl3', 1566996823, 86400, '', NULL),
('qfo0kvfi9kvl6sge44hmo9b9s0', 1567059828, 86400, '', NULL),
('qgl5s80rd41f98ke9c6o5330i4', 1567063682, 86400, '', NULL),
('qi781avn6gfkdierld9kkc2ab0', 1567064919, 86400, '', NULL),
('qj03bm2p4j6mpisgdfaoocrhn5', 1567083623, 86400, '', NULL),
('qt6jsskvvst98446hmrqrbrt16', 1567054261, 86400, '', NULL),
('r1gpb7rfukv54gce8rfkbg3117', 1567055772, 86400, '', NULL),
('r9inbqpb4j0f8un7vmgbbmd840', 1566995692, 86400, '', NULL),
('rh08drd72dqbpdrin2ss6si6k2', 1567070037, 86400, '', NULL),
('rmelmjfn0cq03i0e4sl9c3pm17', 1566991156, 86400, '', NULL),
('rn7fup2u9lfkigia3r54rql0v6', 1566994697, 86400, '', NULL),
('roi6hqkf6vrpivdf79j3dsckq2', 1567069685, 86400, '', NULL),
('rqeu5t8035mit63to1s9voj366', 1566989648, 86400, '', NULL),
('rqqpafil6ajeqoj1g1mtkba1b2', 1566998311, 86400, '', NULL),
('rt0b9fr6gl5iafdii501e55jm4', 1567056921, 86400, '', NULL),
('rv20c27ludka8ppluac86kgq22', 1567058182, 86400, '', NULL),
('s7l6i3ps0r3ok53p6b91ukri82', 1566992546, 86400, '', NULL),
('sd6hr0slh5r382ksh42uctbef1', 1567076337, 86400, '', NULL),
('sdpr06i94h49ln73m4s9u8f924', 1566989585, 86400, '', NULL),
('shb2fcrhg288c98n53t4eubm82', 1567058443, 86400, '', NULL),
('sj2cd5llqtjf3s8m1s120or743', 1567064182, 86400, '', NULL),
('sj6four5q81u3b1mq9i9r23is6', 1566990081, 86400, '', NULL),
('sn16k204rnctjjan75uc3soft4', 1567060752, 86400, '', NULL),
('spm72mt5ib5sfcu92hmskfle83', 1567081963, 86400, '', NULL),
('sq6o2phcolgjcfn8dt3hklbob7', 1566991310, 86400, '', NULL),
('t4eqajja6dk8e32aqb5f6rvu33', 1566987721, 86400, '', NULL),
('tat9o35mejqkq8dpscgqprfl36', 1566997656, 86400, '', NULL),
('tglbq8fl8okvdeife518aa7ni0', 1566998912, 86400, '', NULL),
('to11kdln3cujem5kh910d7vdf3', 1567060536, 86400, '', NULL),
('u0srr7thgjn4j2dsnq7lna0mk5', 1566996308, 86400, '', NULL),
('u2416r570j9iprq6b8c9v3gl06', 1566997063, 86400, '', NULL),
('u5kiid71v5up65e7uo7ukeltu5', 1566993414, 86400, '', NULL),
('u9ocvcc0ah4p5tklr40gu53ft3', 1566992917, 86400, '', NULL),
('uj7pge78sihlgsuoqicu0pcl45', 1567079753, 86400, '', NULL),
('unkr8mjnuul9cl4u9atqqoi763', 1567082253, 86400, '', NULL),
('uob0tskta4imcvrpec84b3ist4', 1567069439, 86400, '', NULL),
('uvug3jekau4ehgccba4s6dvrv7', 1567078149, 86400, '', NULL),
('v2qnfap7cuu21ijtk7hc1lui95', 1567072844, 86400, '', NULL),
('v678im0kdr247s6eegtug4nov1', 1566987960, 86400, '', NULL),
('v6tj0fbf5o7koukbuv1uovpbp5', 1567071554, 86400, '', NULL),
('vmgr7a4ocmccp88gi6cdhdn1m5', 1567059690, 86400, '', NULL),
('vmqr3lsm0buvu7k1n6cgok6ta7', 1567054831, 86400, '', NULL),
('voqirjjt8bscker0pjj53mcpd2', 1567072086, 86400, '', NULL),
('vs67rtl8ftag9cjund6qvopor4', 1567078056, 86400, '', NULL),
('vu21uftr4rgfg36poetsume9u7', 1567058359, 86400, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_settings`
--

CREATE TABLE `engine4_core_settings` (
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_settings`
--

INSERT INTO `engine4_core_settings` (`name`, `value`) VALUES
('activity.composer.options.0', 'emoticons'),
('activity.composer.options.1', 'userTags'),
('activity.composer.options.2', 'hashtags'),
('activity.content', 'everyone'),
('activity.disallowed', 'N'),
('activity.filter', '1'),
('activity.length', '15'),
('activity.liveupdate', '120000'),
('activity.network.privacy', '2'),
('activity.publish', '1'),
('activity.userdelete', '1'),
('activity.userlength', '5'),
('activity.view.privacy.0', 'everyone'),
('activity.view.privacy.1', 'networks'),
('activity.view.privacy.2', 'friends'),
('activity.view.privacy.3', 'onlyme'),
('core.admin.mode', 'none'),
('core.admin.password', ''),
('core.admin.reauthenticate', '0'),
('core.admin.timeout', '600'),
('core.analytics.code', ''),
('core.doctype', 'HTML5'),
('core.facebook.enable', 'none'),
('core.facebook.key', ''),
('core.facebook.secret', ''),
('core.general.analytics', ''),
('core.general.browse', '0'),
('core.general.commenthtml', ''),
('core.general.includes', ''),
('core.general.notificationupdate', '120000'),
('core.general.portal', '1'),
('core.general.profile', '0'),
('core.general.quota', '0'),
('core.general.search', '0'),
('core.general.site.description', ''),
('core.general.site.keywords', ''),
('core.general.site.title', 'Threat Forward'),
('core.general.social.code', ''),
('core.general.staticBaseUrl', ''),
('core.iframely.host', 'socialengine'),
('core.license.email', 'email@domain.com'),
('core.license.key', '6395-8623-1575-0175'),
('core.license.statistics', '0'),
('core.locale.locale', 'en'),
('core.locale.timezone', 'Asia/Dubai'),
('core.log.adapter', 'file'),
('core.mail.contact', 'info@threat-forward.com'),
('core.mail.count', '25'),
('core.mail.enabled', '1'),
('core.mail.from', 'info@threat-forward.com'),
('core.mail.name', 'Threat-Forward'),
('core.mail.queueing', '0'),
('core.secret', 'f541fd225156e0af7be3af42c46493fc95f96a1e'),
('core.site.counter', '387'),
('core.site.creation', '2019-08-28 09:54:44'),
('core.site.title', 'Social Network'),
('core.spam.allowemails', ''),
('core.spam.censor', ''),
('core.spam.comment', '0'),
('core.spam.commenthtml', ''),
('core.spam.contact', '0'),
('core.spam.email.antispam.login', '1'),
('core.spam.email.antispam.signup', '1'),
('core.spam.invite', '0'),
('core.spam.ipbans', ''),
('core.spam.login', '0'),
('core.spam.recaptchaenabled', ''),
('core.spam.recaptchaprivate', ''),
('core.spam.recaptchapublic', ''),
('core.spam.signup', '0'),
('core.static.baseurl', ''),
('core.tasks.count', '1'),
('core.tasks.interval', '60'),
('core.tasks.jobs', '3'),
('core.tasks.key', '39f88dbf'),
('core.tasks.last', '1569443628'),
('core.tasks.mode', 'curl'),
('core.tasks.pid', ''),
('core.tasks.processes', '2'),
('core.tasks.time', '120'),
('core.tasks.timeout', '900'),
('core.thumbnails.icon.height', '48'),
('core.thumbnails.icon.mode', 'crop'),
('core.thumbnails.icon.width', '48'),
('core.thumbnails.main.height', '720'),
('core.thumbnails.main.mode', 'resize'),
('core.thumbnails.main.width', '720'),
('core.thumbnails.normal.height', '160'),
('core.thumbnails.normal.mode', 'resize'),
('core.thumbnails.normal.width', '140'),
('core.thumbnails.profile.height', '400'),
('core.thumbnails.profile.mode', 'resize'),
('core.thumbnails.profile.width', '200'),
('core.translate.adapter', 'csv'),
('core.twitter.enable', 'none'),
('core.twitter.key', ''),
('core.twitter.secret', ''),
('invite.allowCustomMessage', '1'),
('invite.fromEmail', ''),
('invite.fromName', ''),
('invite.max', '10'),
('invite.message', 'You are being invited to join our social network.'),
('invite.subject', 'Join Us'),
('payment.benefit', 'all'),
('payment.currency', 'USD'),
('payment.secret', 'ce497f6908c2ec065b0d80f4aab97b6c'),
('storage.service.mirrored.counter', '0'),
('storage.service.mirrored.index', '0'),
('storage.service.roundrobin.counter', '0'),
('user.friends.direction', '1'),
('user.friends.eligible', '0'),
('user.friends.lists', '1'),
('user.friends.verification', '1'),
('user.signup.adminemail', '1'),
('user.signup.approve', '1'),
('user.signup.checkemail', '1'),
('user.signup.enablewelcomeemail', '0'),
('user.signup.inviteonly', '0'),
('user.signup.photo', '0'),
('user.signup.random', '0'),
('user.signup.terms', '1'),
('user.signup.username', '0'),
('user.signup.verifyemail', '2'),
('user.support.links', '1');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_statistics`
--

CREATE TABLE `engine4_core_statistics` (
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_statistics`
--

INSERT INTO `engine4_core_statistics` (`type`, `date`, `value`) VALUES
('core.comments', '2019-09-13 10:00:00', 2),
('core.comments', '2019-09-13 14:00:00', 1),
('core.comments', '2019-09-19 10:00:00', 3),
('core.comments', '2019-09-22 17:00:00', 1),
('core.comments', '2019-09-25 11:00:00', 2),
('core.comments', '2019-09-25 12:00:00', 3),
('core.comments', '2019-09-25 13:00:00', 3),
('core.emails', '2019-09-19 10:00:00', 7),
('core.emails', '2019-09-19 11:00:00', 1),
('core.emails', '2019-09-20 10:00:00', 1),
('core.emails', '2019-09-22 20:00:00', 3),
('core.emails', '2019-09-22 23:00:00', 7),
('core.emails', '2019-09-23 09:00:00', 2),
('core.emails', '2019-09-25 11:00:00', 2),
('core.emails', '2019-09-25 12:00:00', 3),
('core.likes', '2019-09-19 10:00:00', 4),
('core.likes', '2019-09-19 11:00:00', 2),
('core.likes', '2019-09-19 12:00:00', 1),
('core.likes', '2019-09-25 12:00:00', 1),
('core.reports', '2019-09-25 06:00:00', 1),
('core.views', '2019-08-28 09:00:00', 1),
('core.views', '2019-08-28 10:00:00', 14),
('core.views', '2019-08-28 11:00:00', 20),
('core.views', '2019-08-28 12:00:00', 24),
('core.views', '2019-08-28 13:00:00', 11),
('core.views', '2019-08-29 04:00:00', 17),
('core.views', '2019-08-29 05:00:00', 20),
('core.views', '2019-08-29 06:00:00', 11),
('core.views', '2019-08-29 07:00:00', 26),
('core.views', '2019-08-29 09:00:00', 31),
('core.views', '2019-08-29 10:00:00', 19),
('core.views', '2019-08-29 11:00:00', 25),
('core.views', '2019-08-29 12:00:00', 24),
('core.views', '2019-08-29 13:00:00', 27),
('core.views', '2019-08-29 14:00:00', 10),
('core.views', '2019-08-29 15:00:00', 2),
('core.views', '2019-08-30 00:00:00', 1),
('core.views', '2019-08-30 04:00:00', 15),
('core.views', '2019-08-30 05:00:00', 47),
('core.views', '2019-08-30 06:00:00', 22),
('core.views', '2019-08-30 07:00:00', 32),
('core.views', '2019-08-30 09:00:00', 9),
('core.views', '2019-08-30 10:00:00', 35),
('core.views', '2019-08-30 11:00:00', 18),
('core.views', '2019-08-30 12:00:00', 10),
('core.views', '2019-08-30 13:00:00', 2),
('core.views', '2019-09-02 05:00:00', 6),
('core.views', '2019-09-02 06:00:00', 1),
('core.views', '2019-09-02 09:00:00', 19),
('core.views', '2019-09-02 10:00:00', 26),
('core.views', '2019-09-02 11:00:00', 11),
('core.views', '2019-09-03 07:00:00', 4),
('core.views', '2019-09-04 06:00:00', 1),
('core.views', '2019-09-04 11:00:00', 15),
('core.views', '2019-09-04 12:00:00', 8),
('core.views', '2019-09-04 13:00:00', 13),
('core.views', '2019-09-05 04:00:00', 3),
('core.views', '2019-09-05 06:00:00', 19),
('core.views', '2019-09-05 07:00:00', 6),
('core.views', '2019-09-05 08:00:00', 4),
('core.views', '2019-09-05 09:00:00', 25),
('core.views', '2019-09-05 10:00:00', 52),
('core.views', '2019-09-05 11:00:00', 27),
('core.views', '2019-09-05 12:00:00', 21),
('core.views', '2019-09-05 13:00:00', 10),
('core.views', '2019-09-06 04:00:00', 22),
('core.views', '2019-09-06 05:00:00', 20),
('core.views', '2019-09-06 06:00:00', 20),
('core.views', '2019-09-06 07:00:00', 38),
('core.views', '2019-09-06 10:00:00', 1),
('core.views', '2019-09-06 11:00:00', 7),
('core.views', '2019-09-06 12:00:00', 6),
('core.views', '2019-09-06 13:00:00', 10),
('core.views', '2019-09-11 05:00:00', 5),
('core.views', '2019-09-13 06:00:00', 3),
('core.views', '2019-09-13 10:00:00', 4),
('core.views', '2019-09-13 11:00:00', 23),
('core.views', '2019-09-13 12:00:00', 56),
('core.views', '2019-09-13 13:00:00', 12),
('core.views', '2019-09-13 14:00:00', 10),
('core.views', '2019-09-15 17:00:00', 18),
('core.views', '2019-09-15 18:00:00', 19),
('core.views', '2019-09-16 10:00:00', 3),
('core.views', '2019-09-16 11:00:00', 36),
('core.views', '2019-09-16 12:00:00', 71),
('core.views', '2019-09-16 13:00:00', 23),
('core.views', '2019-09-17 04:00:00', 12),
('core.views', '2019-09-17 05:00:00', 9),
('core.views', '2019-09-17 12:00:00', 2),
('core.views', '2019-09-17 13:00:00', 1),
('core.views', '2019-09-18 07:00:00', 4),
('core.views', '2019-09-18 09:00:00', 5),
('core.views', '2019-09-19 06:00:00', 2),
('core.views', '2019-09-19 07:00:00', 1),
('core.views', '2019-09-19 08:00:00', 5),
('core.views', '2019-09-19 09:00:00', 39),
('core.views', '2019-09-19 10:00:00', 75),
('core.views', '2019-09-19 11:00:00', 30),
('core.views', '2019-09-19 12:00:00', 42),
('core.views', '2019-09-19 13:00:00', 4),
('core.views', '2019-09-20 10:00:00', 60),
('core.views', '2019-09-20 11:00:00', 12),
('core.views', '2019-09-20 12:00:00', 21),
('core.views', '2019-09-20 13:00:00', 21),
('core.views', '2019-09-20 15:00:00', 12),
('core.views', '2019-09-22 17:00:00', 45),
('core.views', '2019-09-22 18:00:00', 6),
('core.views', '2019-09-22 19:00:00', 27),
('core.views', '2019-09-22 20:00:00', 20),
('core.views', '2019-09-22 21:00:00', 20),
('core.views', '2019-09-22 22:00:00', 24),
('core.views', '2019-09-22 23:00:00', 63),
('core.views', '2019-09-23 00:00:00', 10),
('core.views', '2019-09-23 01:00:00', 1),
('core.views', '2019-09-23 02:00:00', 3),
('core.views', '2019-09-23 08:00:00', 5),
('core.views', '2019-09-23 09:00:00', 44),
('core.views', '2019-09-23 10:00:00', 22),
('core.views', '2019-09-23 11:00:00', 22),
('core.views', '2019-09-23 12:00:00', 35),
('core.views', '2019-09-23 13:00:00', 52),
('core.views', '2019-09-23 14:00:00', 8),
('core.views', '2019-09-23 15:00:00', 5),
('core.views', '2019-09-23 18:00:00', 3),
('core.views', '2019-09-23 20:00:00', 2),
('core.views', '2019-09-24 04:00:00', 14),
('core.views', '2019-09-24 05:00:00', 31),
('core.views', '2019-09-24 06:00:00', 30),
('core.views', '2019-09-24 07:00:00', 24),
('core.views', '2019-09-24 08:00:00', 5),
('core.views', '2019-09-24 09:00:00', 28),
('core.views', '2019-09-24 10:00:00', 29),
('core.views', '2019-09-24 11:00:00', 44),
('core.views', '2019-09-24 12:00:00', 44),
('core.views', '2019-09-24 13:00:00', 15),
('core.views', '2019-09-24 17:00:00', 29),
('core.views', '2019-09-24 18:00:00', 11),
('core.views', '2019-09-24 19:00:00', 5),
('core.views', '2019-09-24 20:00:00', 9),
('core.views', '2019-09-25 04:00:00', 3),
('core.views', '2019-09-25 05:00:00', 25),
('core.views', '2019-09-25 06:00:00', 5),
('core.views', '2019-09-25 08:00:00', 12),
('core.views', '2019-09-25 09:00:00', 9),
('core.views', '2019-09-25 10:00:00', 11),
('core.views', '2019-09-25 11:00:00', 35),
('core.views', '2019-09-25 12:00:00', 55),
('core.views', '2019-09-25 13:00:00', 27),
('core.views', '2019-09-25 14:00:00', 24),
('core.views', '2019-09-25 15:00:00', 76),
('core.views', '2019-09-25 16:00:00', 3),
('core.views', '2019-09-25 17:00:00', 16),
('core.views', '2019-09-25 18:00:00', 1),
('core.views', '2019-09-25 19:00:00', 2),
('core.views', '2019-09-25 20:00:00', 2),
('messages.creations', '2019-09-20 10:00:00', 1),
('user.creations', '2019-08-30 11:00:00', 1),
('user.creations', '2019-09-22 17:00:00', 1),
('user.creations', '2019-09-22 23:00:00', 4),
('user.creations', '2019-09-23 09:00:00', 2),
('user.creations', '2019-09-23 10:00:00', 2),
('user.creations', '2019-09-23 13:00:00', 1),
('user.creations', '2019-09-25 14:00:00', 6),
('user.friendships', '2019-09-05 09:00:00', 1),
('user.logins', '2019-08-29 04:00:00', 1),
('user.logins', '2019-08-29 12:00:00', 1),
('user.logins', '2019-08-29 13:00:00', 3),
('user.logins', '2019-08-29 14:00:00', 1),
('user.logins', '2019-08-30 04:00:00', 2),
('user.logins', '2019-08-30 05:00:00', 2),
('user.logins', '2019-08-30 06:00:00', 1),
('user.logins', '2019-08-30 07:00:00', 1),
('user.logins', '2019-08-30 10:00:00', 1),
('user.logins', '2019-09-02 05:00:00', 1),
('user.logins', '2019-09-02 09:00:00', 1),
('user.logins', '2019-09-03 07:00:00', 1),
('user.logins', '2019-09-04 11:00:00', 2),
('user.logins', '2019-09-05 04:00:00', 1),
('user.logins', '2019-09-05 06:00:00', 2),
('user.logins', '2019-09-05 07:00:00', 1),
('user.logins', '2019-09-05 09:00:00', 1),
('user.logins', '2019-09-05 11:00:00', 1),
('user.logins', '2019-09-06 04:00:00', 1),
('user.logins', '2019-09-06 07:00:00', 2),
('user.logins', '2019-09-11 05:00:00', 1),
('user.logins', '2019-09-13 06:00:00', 1),
('user.logins', '2019-09-13 11:00:00', 2),
('user.logins', '2019-09-13 12:00:00', 2),
('user.logins', '2019-09-15 17:00:00', 1),
('user.logins', '2019-09-16 10:00:00', 1),
('user.logins', '2019-09-16 11:00:00', 1),
('user.logins', '2019-09-16 12:00:00', 1),
('user.logins', '2019-09-16 13:00:00', 2),
('user.logins', '2019-09-17 04:00:00', 1),
('user.logins', '2019-09-18 07:00:00', 1),
('user.logins', '2019-09-18 09:00:00', 1),
('user.logins', '2019-09-19 08:00:00', 1),
('user.logins', '2019-09-19 09:00:00', 1),
('user.logins', '2019-09-19 10:00:00', 1),
('user.logins', '2019-09-20 10:00:00', 2),
('user.logins', '2019-09-22 17:00:00', 2),
('user.logins', '2019-09-22 19:00:00', 2),
('user.logins', '2019-09-22 20:00:00', 1),
('user.logins', '2019-09-22 21:00:00', 1),
('user.logins', '2019-09-22 23:00:00', 1),
('user.logins', '2019-09-23 08:00:00', 1),
('user.logins', '2019-09-23 09:00:00', 3),
('user.logins', '2019-09-23 13:00:00', 3),
('user.logins', '2019-09-23 15:00:00', 1),
('user.logins', '2019-09-23 18:00:00', 1),
('user.logins', '2019-09-24 04:00:00', 1),
('user.logins', '2019-09-24 06:00:00', 2),
('user.logins', '2019-09-24 07:00:00', 1),
('user.logins', '2019-09-24 08:00:00', 1),
('user.logins', '2019-09-24 09:00:00', 1),
('user.logins', '2019-09-24 17:00:00', 2),
('user.logins', '2019-09-24 18:00:00', 1),
('user.logins', '2019-09-25 04:00:00', 1),
('user.logins', '2019-09-25 09:00:00', 1),
('user.logins', '2019-09-25 10:00:00', 1),
('user.logins', '2019-09-25 12:00:00', 3),
('user.logins', '2019-09-25 13:00:00', 1),
('user.logins', '2019-09-25 14:00:00', 2),
('user.logins', '2019-09-25 15:00:00', 7),
('user.logins', '2019-09-25 16:00:00', 1),
('user.logins', '2019-09-25 20:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_status`
--

CREATE TABLE `engine4_core_status` (
  `status_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_styles`
--

CREATE TABLE `engine4_core_styles` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL,
  `style` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_tagmaps`
--

CREATE TABLE `engine4_core_tagmaps` (
  `tagmap_id` int(11) UNSIGNED NOT NULL,
  `resource_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) UNSIGNED NOT NULL,
  `tagger_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tagger_id` int(11) UNSIGNED NOT NULL,
  `tag_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tag_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `extra` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_tags`
--

CREATE TABLE `engine4_core_tags` (
  `tag_id` int(11) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag_count` int(11) NOT NULL DEFAULT 0,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_tasks`
--

CREATE TABLE `engine4_core_tasks` (
  `task_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `timeout` int(11) UNSIGNED NOT NULL DEFAULT 60,
  `processes` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `semaphore` smallint(3) NOT NULL DEFAULT 0,
  `started_last` int(11) NOT NULL DEFAULT 0,
  `started_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `completed_last` int(11) NOT NULL DEFAULT 0,
  `completed_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `failure_last` int(11) NOT NULL DEFAULT 0,
  `failure_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `success_last` int(11) NOT NULL DEFAULT 0,
  `success_count` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_tasks`
--

INSERT INTO `engine4_core_tasks` (`task_id`, `title`, `module`, `plugin`, `timeout`, `processes`, `semaphore`, `started_last`, `started_count`, `completed_last`, `completed_count`, `failure_last`, `failure_count`, `success_last`, `success_count`) VALUES
(1, 'Job Queue', 'core', 'Core_Plugin_Task_Jobs', 5, 1, 0, 1567158887, 369, 1567158887, 369, 0, 0, 1567158887, 369),
(2, 'Background Mailer', 'core', 'Core_Plugin_Task_Mail', 15, 1, 0, 1567158887, 369, 1567158887, 369, 0, 0, 1567158887, 369),
(3, 'Cache Prefetch', 'core', 'Core_Plugin_Task_Prefetch', 300, 1, 0, 1567158651, 136, 1567158651, 136, 0, 0, 1567158651, 136),
(4, 'Statistics', 'core', 'Core_Plugin_Task_Statistics', 43200, 1, 0, 1567139466, 3, 1567139466, 3, 0, 0, 1567139466, 3),
(5, 'Log Rotation', 'core', 'Core_Plugin_Task_LogRotation', 7200, 1, 0, 1567158434, 10, 1567158434, 10, 0, 0, 1567158434, 10),
(6, 'Session Maintenance', 'core', 'Core_Plugin_Task_Cleanup', 86400, 1, 0, 1567073110, 2, 1567073110, 2, 0, 0, 1567073110, 2),
(7, 'Member Data Maintenance', 'user', 'User_Plugin_Task_Cleanup', 60, 1, 0, 1567158887, 219, 1567158887, 219, 0, 0, 1567158887, 219),
(8, 'Payment Maintenance', 'user', 'Payment_Plugin_Task_Cleanup', 43200, 1, 0, 1567139575, 3, 1567139575, 3, 0, 0, 1567139575, 3);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_core_themes`
--

CREATE TABLE `engine4_core_themes` (
  `theme_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_core_themes`
--

INSERT INTO `engine4_core_themes` (`theme_id`, `name`, `title`, `description`, `active`) VALUES
(5, 'insignia', 'Insignia', 'Insignia', 0),
(6, 'sdthreat-forward', 'SD Threat-Forward', 'SD Threat-Forward Theme', 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_invites`
--

CREATE TABLE `engine4_invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `send_request` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `new_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_messages_conversations`
--

CREATE TABLE `engine4_messages_conversations` (
  `conversation_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) UNSIGNED NOT NULL,
  `recipients` int(11) UNSIGNED NOT NULL,
  `modified` datetime NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `resource_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_messages_conversations`
--

INSERT INTO `engine4_messages_conversations` (`conversation_id`, `title`, `user_id`, `recipients`, `modified`, `locked`, `resource_type`, `resource_id`) VALUES
(1, 'subject', 2, 1, '2019-09-20 10:27:33', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_messages_messages`
--

CREATE TABLE `engine4_messages_messages` (
  `message_id` int(11) UNSIGNED NOT NULL,
  `conversation_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `attachment_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `attachment_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_messages_messages`
--

INSERT INTO `engine4_messages_messages` (`message_id`, `conversation_id`, `user_id`, `title`, `body`, `date`, `attachment_type`, `attachment_id`) VALUES
(1, 1, 2, 'subject', 'test message', '2019-09-20 10:27:33', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_messages_recipients`
--

CREATE TABLE `engine4_messages_recipients` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `conversation_id` int(11) UNSIGNED NOT NULL,
  `inbox_message_id` int(11) UNSIGNED DEFAULT NULL,
  `inbox_updated` datetime DEFAULT NULL,
  `inbox_read` tinyint(1) DEFAULT NULL,
  `inbox_deleted` tinyint(1) DEFAULT NULL,
  `outbox_message_id` int(11) UNSIGNED DEFAULT NULL,
  `outbox_updated` datetime DEFAULT NULL,
  `outbox_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_messages_recipients`
--

INSERT INTO `engine4_messages_recipients` (`user_id`, `conversation_id`, `inbox_message_id`, `inbox_updated`, `inbox_read`, `inbox_deleted`, `outbox_message_id`, `outbox_updated`, `outbox_deleted`) VALUES
(1, 1, 1, '2019-09-20 10:27:33', 1, 0, 0, NULL, 1),
(2, 1, NULL, NULL, 1, 1, 1, '2019-09-20 10:27:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_network_membership`
--

CREATE TABLE `engine4_network_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `resource_approved` tinyint(1) NOT NULL DEFAULT 0,
  `user_approved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_network_membership`
--

INSERT INTO `engine4_network_membership` (`resource_id`, `user_id`, `active`, `resource_approved`, `user_approved`) VALUES
(1, 1, 1, 1, 1),
(1, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_network_networks`
--

CREATE TABLE `engine4_network_networks` (
  `network_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `pattern` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `assignment` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_network_networks`
--

INSERT INTO `engine4_network_networks` (`network_id`, `title`, `description`, `field_id`, `pattern`, `member_count`, `hide`, `assignment`) VALUES
(1, 'Emirates Airlines', '', 13, '{\"type\":\"select\",\"value\":[\"4\"]}', 2, 0, 1),
(2, 'Qatar Airways', '', 13, '{\"type\":\"select\",\"value\":[\"5\"]}', 0, 0, 1),
(3, 'Flydubai', '', 13, '{\"type\":\"select\",\"value\":[\"6\"]}', 0, 0, 1),
(10, 'Air Arabia', '', 13, '{\"type\":\"select\",\"value\":[\"13\"]}', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_gateways`
--

CREATE TABLE `engine4_payment_gateways` (
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `config` mediumblob DEFAULT NULL,
  `test_mode` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_payment_gateways`
--

INSERT INTO `engine4_payment_gateways` (`gateway_id`, `title`, `description`, `enabled`, `plugin`, `config`, `test_mode`) VALUES
(1, '2Checkout', NULL, 0, 'Payment_Plugin_Gateway_2Checkout', NULL, 0),
(2, 'PayPal', NULL, 0, 'Payment_Plugin_Gateway_PayPal', NULL, 0),
(3, 'Testing', NULL, 0, 'Payment_Plugin_Gateway_Testing', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_orders`
--

CREATE TABLE `engine4_payment_orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `gateway_order_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `state` enum('pending','cancelled','failed','incomplete','complete') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'pending',
  `creation_date` datetime NOT NULL,
  `source_type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_packages`
--

CREATE TABLE `engine4_payment_packages` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `downgrade_level_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(16,2) UNSIGNED NOT NULL,
  `recurrence` int(11) UNSIGNED NOT NULL,
  `recurrence_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) UNSIGNED NOT NULL,
  `duration_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci NOT NULL,
  `trial_duration` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `trial_duration_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `signup` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `after_signup` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_products`
--

CREATE TABLE `engine4_payment_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `extension_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `extension_id` int(10) UNSIGNED DEFAULT NULL,
  `sku` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(16,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_subscriptions`
--

CREATE TABLE `engine4_payment_subscriptions` (
  `subscription_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `package_id` int(11) UNSIGNED NOT NULL,
  `status` enum('initial','trial','pending','active','cancelled','expired','overdue','refunded') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'initial',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `gateway_profile_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_payment_transactions`
--

CREATE TABLE `engine4_payment_transactions` (
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `state` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `gateway_parent_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_order_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `currency` char(3) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_chunks`
--

CREATE TABLE `engine4_storage_chunks` (
  `chunk_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_files`
--

CREATE TABLE `engine4_storage_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `parent_file_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `storage_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_major` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mime_minor` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_storage_files`
--

INSERT INTO `engine4_storage_files` (`file_id`, `parent_file_id`, `type`, `parent_type`, `parent_id`, `user_id`, `creation_date`, `modified_date`, `service_id`, `storage_path`, `extension`, `name`, `mime_major`, `mime_minor`, `size`, `hash`) VALUES
(1, NULL, NULL, 'user', 2, NULL, '2019-08-30 11:59:52', '2019-08-30 11:59:52', 1, 'public/user/01/ed0c3d842496290aad14416e5451d194.png', 'png', 'm_girl.png', 'image', 'png', 79117, '0f3fa0d03aeaceecc36b62a7f8ba0f47'),
(2, 1, 'thumb.profile', 'user', 2, 2, '2019-08-30 11:59:52', '2019-08-30 11:59:52', 1, 'public/user/02/13b2d8f0d7532beb80e5163915983448.png', 'png', 'ed0c3d842496290aad14416e5451d194.png', 'image', 'png', 205713, 'aac02c44f34dfc59c15fcfaecda1ff4c'),
(3, 1, 'thumb.normal', 'user', 2, NULL, '2019-08-30 11:59:53', '2019-08-30 11:59:53', 1, 'public/user/03/f6657586c6c8fad8c22137d157221041.png', 'png', 'n_girl.png', 'image', 'png', 39079, '9bd4edc76287a7c59ee725dae05af8bc'),
(4, 1, 'thumb.icon', 'user', 2, NULL, '2019-08-30 11:59:53', '2019-08-30 11:59:53', 1, 'public/user/04/14bdcd0136bd21d94223638f787c0b01.png', 'png', 's_girl.png', 'image', 'png', 5649, '53df17846e5fed7599c7b85c2119fe56'),
(5, NULL, NULL, 'user', 1, 1, '2019-09-05 10:59:05', '2019-09-05 10:59:05', 1, 'public/user/05/23e49168dee2e1cbc3d0a6d80a05d1ba.jpg', 'jpg', 'profile-picture-720x480_m.jpg', 'image', 'jpeg', 20780, '613d1cd9abfc05dbd694c4625c57161e'),
(6, 5, 'thumb.normal', 'user', 1, 1, '2019-09-05 10:59:05', '2019-09-05 10:59:05', 1, 'public/user/06/38e685ba364f630dc4b4f5ac58bf434c.jpg', 'jpg', 'profile-picture-720x480_in.jpg', 'image', 'jpeg', 8035, '3e454139fdf3afb74abe646023e8f601'),
(7, 5, 'thumb.large', 'user', 1, 1, '2019-09-05 10:59:05', '2019-09-05 10:59:05', 1, 'public/user/07/23e49168dee2e1cbc3d0a6d80a05d1ba.jpg', 'jpg', 'profile-picture-720x480_inl.jpg', 'image', 'jpeg', 20780, '613d1cd9abfc05dbd694c4625c57161e'),
(8, 5, 'thumb.icon', 'user', 1, 1, '2019-09-05 10:59:05', '2019-09-05 10:59:05', 1, 'public/user/08/b1eb0b1115a99abd8598b28ffdaed51d.jpg', 'jpg', 'profile-picture-720x480_is.jpg', 'image', 'jpeg', 1228, '827b2dcfe78ad27594610edfd5b871f0');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_mirrors`
--

CREATE TABLE `engine4_storage_mirrors` (
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_services`
--

CREATE TABLE `engine4_storage_services` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `config` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_storage_services`
--

INSERT INTO `engine4_storage_services` (`service_id`, `servicetype_id`, `config`, `enabled`, `default`) VALUES
(1, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_storage_servicetypes`
--

CREATE TABLE `engine4_storage_servicetypes` (
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `form` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_storage_servicetypes`
--

INSERT INTO `engine4_storage_servicetypes` (`servicetype_id`, `title`, `plugin`, `form`, `enabled`) VALUES
(1, 'Local Storage', 'Storage_Service_Local', 'Storage_Form_Admin_Service_Local', 1),
(2, 'Database Storage', 'Storage_Service_Db', 'Storage_Form_Admin_Service_Db', 0),
(3, 'Amazon S3', 'Storage_Service_S3', 'Storage_Form_Admin_Service_S3', 1),
(4, 'Virtual File System', 'Storage_Service_Vfs', 'Storage_Form_Admin_Service_Vfs', 1),
(5, 'Round-Robin', 'Storage_Service_RoundRobin', 'Storage_Form_Admin_Service_RoundRobin', 0),
(6, 'Mirrored', 'Storage_Service_Mirrored', 'Storage_Form_Admin_Service_Mirrored', 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_users`
--

CREATE TABLE `engine4_users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `photo_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `password` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `salt` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'auto',
  `language` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'en_US',
  `timezone` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'America/Los_Angeles',
  `search` tinyint(1) NOT NULL DEFAULT 1,
  `show_profileviewers` tinyint(1) NOT NULL DEFAULT 1,
  `level_id` int(11) UNSIGNED NOT NULL,
  `invites_used` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `extra_invites` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `creation_date` datetime NOT NULL,
  `creation_ip` varbinary(16) NOT NULL,
  `modified_date` datetime NOT NULL,
  `lastlogin_date` datetime DEFAULT NULL,
  `lastlogin_ip` varbinary(16) DEFAULT NULL,
  `update_date` int(11) DEFAULT NULL,
  `member_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `comment_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `like_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `coverphoto` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `coverphotoparams` varchar(265) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_privacy` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'everyone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_users`
--

INSERT INTO `engine4_users` (`user_id`, `email`, `username`, `displayname`, `photo_id`, `status`, `status_date`, `password`, `salt`, `locale`, `language`, `timezone`, `search`, `show_profileviewers`, `level_id`, `invites_used`, `extra_invites`, `enabled`, `verified`, `approved`, `creation_date`, `creation_ip`, `modified_date`, `lastlogin_date`, `lastlogin_ip`, `update_date`, `member_count`, `view_count`, `comment_count`, `like_count`, `coverphoto`, `coverphotoparams`, `view_privacy`) VALUES
(1, 'mjmalik@msn.com', 'Admin', 'Mj Malik', 5, NULL, NULL, '5cccf87040138cbbe0aefa5156500c26', '3524108', 'auto', 'en_US', 'Asia/Yekaterinburg', 1, 1, 1, 0, 0, 1, 1, 1, '2019-08-28 09:56:47', 0x32313330373036343333, '2019-09-15 17:59:26', '2019-09-25 15:42:02', 0x6e24ee52, NULL, 1, 2, 0, 0, 0, '{\"top\":0,\"left\":0}', 'everyone'),
(2, 'test@test.com', NULL, 'SD Dev', 1, NULL, NULL, '2d0d5f63c59c80d1bb98ed011f396e97', '6629847', 'English', 'English', 'Asia/Yekaterinburg', 1, 1, 4, 0, 0, 1, 1, 1, '2019-08-30 11:59:57', 0x6e24ee52, '2019-09-05 09:36:04', '2019-09-20 10:24:18', 0x67ff04f5, NULL, 1, 3, 0, 0, 0, NULL, 'everyone'),
(3, 'gal.isakovic@emirates.com', NULL, 'Gal  Isakovic', 0, NULL, NULL, '77593e18a51478794882e699d6d7e196', '9007632', 'English', 'English', 'Asia/Dubai', 1, 1, 1, 0, 0, 1, 1, 1, '2019-09-22 17:34:22', 0x2d389a9c, '2019-09-22 17:34:22', '2019-09-25 16:08:47', 0x1f0612f8, NULL, 0, 1, 0, 0, 0, NULL, 'everyone'),
(9, 'sajawalstarsdev@gmail.com', NULL, 'Sd Dev 111', 0, NULL, NULL, '06358f782e86ea96debc577f3a5c79da', '7650799', 'English', 'English', 'Asia/Dubai', 1, 1, 4, 0, 0, 1, 1, 1, '2019-09-23 09:47:44', 0x6e24ee52, '2019-09-23 09:50:02', '2019-09-24 09:04:31', 0x6e24ee52, NULL, 0, 0, 0, 0, 0, NULL, 'everyone'),
(12, 'Daniel@emirates.com', NULL, 'Daniel Rika', 0, NULL, NULL, '8b4bad8756dad8b2a174e1fad3fad80c', '9723965', 'English', 'English', 'Asia/Dubai', 1, 1, 4, 0, 0, 1, 1, 1, '2019-09-23 13:09:38', 0x68c2da25, '2019-09-23 13:09:38', '2019-09-25 20:28:44', 0x17599761, NULL, 0, 0, 0, 0, 0, NULL, 'everyone'),
(18, 'gal@isakovic.net', NULL, 'gal isakovic', 0, NULL, NULL, 'c385931f7842256f196e03171b5421ee', '1305180', 'English', 'English', 'Asia/Dubai', 1, 1, 4, 0, 0, 0, 0, 1, '2019-09-25 14:55:56', 0x1f0612f8, '2019-09-25 14:55:56', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 'everyone');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_block`
--

CREATE TABLE `engine4_user_block` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `blocked_user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_facebook`
--

CREATE TABLE `engine4_user_facebook` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `facebook_uid` bigint(20) UNSIGNED NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_maps`
--

CREATE TABLE `engine4_user_fields_maps` (
  `field_id` int(11) UNSIGNED NOT NULL,
  `option_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL,
  `order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_maps`
--

INSERT INTO `engine4_user_fields_maps` (`field_id`, `option_id`, `child_id`, `order`) VALUES
(0, 0, 1, 1),
(1, 1, 2, 1),
(1, 1, 3, 2),
(1, 1, 4, 3),
(1, 1, 13, 4),
(1, 1, 14, 9999);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_meta`
--

CREATE TABLE `engine4_user_fields_meta` (
  `field_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `display` tinyint(1) UNSIGNED NOT NULL,
  `publish` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `search` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `order` smallint(3) UNSIGNED NOT NULL DEFAULT 999,
  `config` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `validators` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filters` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_meta`
--

INSERT INTO `engine4_user_fields_meta` (`field_id`, `type`, `label`, `description`, `alias`, `required`, `display`, `publish`, `search`, `show`, `order`, `config`, `validators`, `filters`, `style`, `error`) VALUES
(1, 'profile_type', 'Profile Type', '', 'profile_type', 1, 0, 0, 2, 1, 999, '', NULL, NULL, NULL, NULL),
(2, 'heading', 'Personal Information', '', '', 0, 1, 0, 0, 0, 999, '[]', NULL, NULL, '', NULL),
(3, 'first_name', 'First Name', '', 'first_name', 1, 1, 0, 2, 0, 999, '[]', '[[\"StringLength\",false,[1,32]]]', NULL, '', ''),
(4, 'last_name', 'Last Name', '', 'last_name', 1, 1, 0, 2, 0, 999, '[]', '[[\"StringLength\",false,[1,32]]]', NULL, '', ''),
(13, 'select', 'Airline', '', '', 1, 1, 0, 1, 0, 999, '[]', NULL, NULL, '', ''),
(14, 'select', 'Rank', '', '', 1, 1, 0, 0, 0, 999, '[]', NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_options`
--

CREATE TABLE `engine4_user_fields_options` (
  `option_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT 999
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_options`
--

INSERT INTO `engine4_user_fields_options` (`option_id`, `field_id`, `label`, `order`) VALUES
(1, 1, 'Regular Member', 1),
(4, 13, 'Emirates Airlines', 1),
(5, 13, 'Qatar Airways', 5),
(6, 13, 'Flydubai ', 2),
(13, 13, 'Air Arabia', 999),
(14, 14, 'Captain', 999),
(15, 14, 'First Officer', 999);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_search`
--

CREATE TABLE `engine4_user_fields_search` (
  `item_id` int(11) UNSIGNED NOT NULL,
  `profile_type` smallint(11) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_13` enum('4','6','5','13') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_search`
--

INSERT INTO `engine4_user_fields_search` (`item_id`, `profile_type`, `first_name`, `last_name`, `field_13`) VALUES
(1, 1, 'Mj', 'Malik', '4'),
(2, 1, 'SD', 'Dev', NULL),
(3, 1, 'Gal ', 'Isakovic', '4');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_fields_values`
--

CREATE TABLE `engine4_user_fields_values` (
  `item_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `index` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `privacy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_fields_values`
--

INSERT INTO `engine4_user_fields_values` (`item_id`, `field_id`, `index`, `value`, `privacy`) VALUES
(1, 1, 0, '1', NULL),
(1, 3, 0, 'Mj', NULL),
(1, 4, 0, 'Malik', NULL),
(1, 13, 0, '4', 'everyone'),
(2, 1, 0, '1', NULL),
(2, 3, 0, 'SD', NULL),
(2, 4, 0, 'Dev', NULL),
(3, 1, 0, '1', NULL),
(3, 3, 0, 'Gal ', NULL),
(3, 4, 0, 'Isakovic', NULL),
(3, 13, 0, '4', NULL),
(9, 1, 0, '1', 'everyone'),
(9, 3, 0, 'Sd Dev', 'everyone'),
(9, 4, 0, '111', 'everyone'),
(12, 1, 0, '1', 'everyone'),
(12, 3, 0, 'Daniel', 'everyone'),
(12, 4, 0, 'Rika', 'everyone'),
(18, 1, 0, '1', 'everyone'),
(18, 3, 0, 'gal', 'everyone'),
(18, 4, 0, 'isakovic', 'everyone');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_forgot`
--

CREATE TABLE `engine4_user_forgot` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_janrain`
--

CREATE TABLE `engine4_user_janrain` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_listitems`
--

CREATE TABLE `engine4_user_listitems` (
  `listitem_id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) UNSIGNED NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_lists`
--

CREATE TABLE `engine4_user_lists` (
  `list_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int(11) UNSIGNED NOT NULL,
  `child_count` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_logins`
--

CREATE TABLE `engine4_user_logins` (
  `login_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varbinary(16) NOT NULL,
  `timestamp` datetime NOT NULL,
  `state` enum('success','no-member','bad-password','disabled','unpaid','third-party','v3-migration','unknown') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'unknown',
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_logins`
--

INSERT INTO `engine4_user_logins` (`login_id`, `user_id`, `email`, `ip`, `timestamp`, `state`, `source`, `active`) VALUES
(1, 1, 'mjmalik@msn.com', 0x7f000001, '2019-08-29 04:32:26', 'success', NULL, 1),
(2, 1, 'mjmalik@msn.com', 0x7f000001, '2019-08-29 12:21:14', 'success', NULL, 0),
(3, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-29 13:16:35', 'success', NULL, 0),
(4, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-29 13:35:12', 'success', NULL, 1),
(5, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-29 13:39:34', 'success', NULL, 0),
(6, 1, 'mjmalik@msn.com', 0x77a065c8, '2019-08-29 14:39:43', 'success', NULL, 0),
(7, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 04:29:18', 'success', NULL, 1),
(8, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 04:49:23', 'success', NULL, 0),
(9, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 05:06:16', 'success', NULL, 1),
(10, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 05:38:34', 'success', NULL, 1),
(11, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 06:15:58', 'success', NULL, 1),
(12, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 07:32:54', 'success', NULL, 0),
(13, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-08-30 10:06:38', 'success', NULL, 0),
(14, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-02 05:19:22', 'success', NULL, 1),
(15, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-02 09:17:31', 'success', NULL, 1),
(16, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-03 07:02:12', 'success', NULL, 1),
(17, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-04 11:02:01', 'success', NULL, 0),
(18, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-04 11:05:36', 'success', NULL, 1),
(19, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-05 04:37:36', 'success', NULL, 0),
(20, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-05 06:07:47', 'success', NULL, 1),
(21, 1, 'mjmalik@msn.com', 0x67ff0409, '2019-09-05 06:17:54', 'success', NULL, 1),
(22, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-05 07:51:22', 'success', NULL, 1),
(23, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-05 09:34:55', 'success', NULL, 1),
(24, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-05 11:46:21', 'success', NULL, 1),
(25, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-06 04:24:43', 'success', NULL, 1),
(26, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-06 07:01:38', 'success', NULL, 1),
(27, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-06 07:22:58', 'success', NULL, 1),
(28, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-11 05:29:20', 'success', NULL, 1),
(29, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-13 06:04:16', 'success', NULL, 1),
(30, 1, 'mjmalik@msn.com', 0x67ff0459, '2019-09-13 11:00:30', 'success', NULL, 1),
(31, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-13 11:20:42', 'success', NULL, 1),
(32, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-13 12:15:05', 'success', NULL, 1),
(33, 1, 'mjmalik@msn.com', 0x67ff0459, '2019-09-13 12:39:44', 'success', NULL, 1),
(34, 1, 'mjmalik@msn.com', 0x67ff04f7, '2019-09-15 17:26:41', 'success', NULL, 1),
(35, 1, 'mjmalik@msn.com', 0x67ff041d, '2019-09-16 10:57:22', 'success', NULL, 1),
(36, 1, 'mjmalik@msn.com', 0x67ff04fe, '2019-09-16 11:19:34', 'success', NULL, 0),
(37, 1, 'mjmalik@msn.com', 0x67ff04fe, '2019-09-16 12:39:18', 'success', NULL, 0),
(38, 1, 'mjmalik@msn.com', 0x67ff04fe, '2019-09-16 13:00:11', 'success', NULL, 0),
(39, 1, 'mjmalik@msn.com', 0x67ff04fe, '2019-09-16 13:04:02', 'success', NULL, 1),
(40, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-17 04:30:24', 'success', NULL, 1),
(41, 1, 'mjmalik@msn.com', 0x67ff04fb, '2019-09-18 07:02:03', 'success', NULL, 1),
(42, 1, 'mjmalik@msn.com', 0x67ff04fb, '2019-09-18 09:31:10', 'success', NULL, 1),
(43, 1, 'mjmalik@msn.com', 0x67ff042f, '2019-09-19 08:31:19', 'success', NULL, 1),
(44, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-19 09:04:15', 'success', NULL, 1),
(45, 1, 'mjmalik@msn.com', 0x67ff042f, '2019-09-19 10:38:23', 'success', NULL, 1),
(46, 1, 'mjmalik@msn.com', 0x67ff04f5, '2019-09-20 10:23:11', 'success', NULL, 1),
(47, 2, 'test@test.com', 0x67ff04f5, '2019-09-20 10:24:17', 'success', NULL, 1),
(48, 1, 'mjmalik@msn.com', 0x67ff0574, '2019-09-22 17:20:23', 'success', NULL, 1),
(49, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-22 17:55:26', 'success', NULL, 0),
(50, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-22 19:23:13', 'success', NULL, 0),
(51, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-22 19:25:21', 'success', NULL, 0),
(52, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-22 20:14:46', 'success', NULL, 0),
(53, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-22 21:32:39', 'success', NULL, 0),
(54, NULL, 'bobi@emirates.com', 0x2d389a9c, '2019-09-22 22:47:09', 'no-member', NULL, 0),
(55, NULL, 'bobi@emirates.com', 0x2d389a9c, '2019-09-22 22:47:15', 'no-member', NULL, 0),
(56, NULL, 'bobi@emirates.com', 0x2d389a9c, '2019-09-22 22:47:21', 'no-member', NULL, 0),
(57, NULL, 'test2@emirates.com', 0x2d389a9c, '2019-09-22 23:26:55', 'no-member', NULL, 0),
(58, NULL, 'test2@emirates.com', 0x2d389a9c, '2019-09-22 23:27:04', 'no-member', NULL, 0),
(59, 4, 'test2@hotmail.com', 0x2d389a9c, '2019-09-22 23:27:26', 'bad-password', NULL, 0),
(60, 4, 'test2@hotmail.com', 0x2d389a9c, '2019-09-22 23:27:32', 'bad-password', NULL, 0),
(61, 4, 'test2@hotmail.com', 0x2d389a9c, '2019-09-22 23:27:38', 'success', NULL, 0),
(62, 7, 'gal@isakovic.net', 0x2d389a9c, '2019-09-22 23:37:50', 'disabled', NULL, 0),
(63, 1, 'mjmalik@msn.com', 0x67ff040f, '2019-09-23 08:10:04', 'success', NULL, 1),
(64, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-23 09:04:45', 'success', NULL, 1),
(65, 8, 'sajawalstarsdev@gmail.com', 0x6e24ee52, '2019-09-23 09:21:53', 'success', NULL, 1),
(66, 9, 'sajawalstarsdev@gmail.com', 0x6e24ee52, '2019-09-23 09:50:12', 'success', NULL, 0),
(67, 3, 'gal.isakovic@emirates.com', 0x68c2da25, '2019-09-23 13:07:53', 'success', NULL, 0),
(68, 3, 'gal.isakovic@emirates.com', 0x68c2da25, '2019-09-23 13:10:36', 'success', NULL, 0),
(69, 1, 'mjmalik@msn.com', 0x67ff044f, '2019-09-23 13:41:43', 'success', NULL, 1),
(70, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-23 15:40:02', 'success', NULL, 0),
(71, 3, 'gal.isakovic@emirates.com', 0x2d389a9c, '2019-09-23 18:53:08', 'success', NULL, 0),
(72, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-24 04:44:53', 'success', NULL, 1),
(73, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-24 06:39:20', 'success', NULL, 1),
(74, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-24 06:41:19', 'success', NULL, 1),
(75, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-24 07:46:28', 'success', NULL, 1),
(76, 1, 'mjmalik@msn.com', 0x67ff0522, '2019-09-24 08:15:45', 'success', NULL, 0),
(77, 9, 'sajawalstarsdev@gmail.com', 0x6e24ee52, '2019-09-24 09:04:31', 'success', NULL, 0),
(78, NULL, 'gal.isakovic@cmail.nu', 0x1f0612f8, '2019-09-24 17:12:23', 'no-member', NULL, 0),
(79, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-24 17:12:59', 'bad-password', NULL, 0),
(80, 12, 'daniel@emirates.com', 0x4ade0e4a, '2019-09-24 17:12:59', 'success', NULL, 1),
(81, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-24 17:15:18', 'bad-password', NULL, 0),
(82, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-24 17:16:05', 'success', NULL, 0),
(83, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-24 18:48:58', 'success', NULL, 0),
(84, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 04:46:11', 'success', NULL, 1),
(85, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 09:07:39', 'success', NULL, 1),
(86, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 10:20:07', 'success', NULL, 0),
(87, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 12:16:52', 'success', NULL, 1),
(88, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 12:34:15', 'success', NULL, 1),
(89, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 12:46:57', 'success', NULL, 0),
(90, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 13:22:32', 'success', NULL, 0),
(91, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 14:38:52', 'success', NULL, 0),
(92, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 14:40:03', 'success', NULL, 0),
(93, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 15:01:16', 'success', NULL, 1),
(94, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 15:21:31', 'success', NULL, 0),
(95, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 15:22:14', 'success', NULL, 0),
(96, NULL, 'info@threat-forward.com', 0x1f0612f8, '2019-09-25 15:37:44', 'no-member', NULL, 0),
(97, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 15:37:56', 'success', NULL, 0),
(98, 1, 'mjmalik@msn.com', 0x6e24ee52, '2019-09-25 15:42:02', 'success', NULL, 1),
(99, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 15:42:38', 'bad-password', NULL, 0),
(100, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 15:42:47', 'success', NULL, 0),
(101, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 15:52:15', 'success', NULL, 0),
(102, 3, 'gal.isakovic@emirates.com', 0x1f0612f8, '2019-09-25 16:08:47', 'success', NULL, 1),
(103, 12, 'daniel@emirates.com', 0x17599761, '2019-09-25 20:28:44', 'success', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_membership`
--

CREATE TABLE `engine4_user_membership` (
  `resource_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `resource_approved` tinyint(1) NOT NULL DEFAULT 0,
  `user_approved` tinyint(1) NOT NULL DEFAULT 0,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_membership`
--

INSERT INTO `engine4_user_membership` (`resource_id`, `user_id`, `active`, `resource_approved`, `user_approved`, `message`, `description`) VALUES
(1, 2, 1, 1, 1, NULL, NULL),
(2, 1, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_online`
--

CREATE TABLE `engine4_user_online` (
  `ip` varbinary(16) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_online`
--

INSERT INTO `engine4_user_online` (`ip`, `user_id`, `active`) VALUES
(0x22dd910d, 0, '2019-08-30 09:48:13'),
(0xcebd902a, 0, '2019-08-30 09:54:47'),
(0x6e24ee52, 0, '2019-08-30 10:06:38'),
(0x6e24ee52, 2, '2019-08-30 11:59:58'),
(0x67ff0409, 0, '2019-09-05 06:17:54'),
(0x67ff0459, 0, '2019-09-13 11:00:30'),
(0x67ff04f7, 0, '2019-09-15 17:40:50'),
(0x67ff041d, 0, '2019-09-16 11:03:45'),
(0x67ff04fe, 0, '2019-09-16 11:19:34'),
(0x67ff04fb, 0, '2019-09-18 07:02:03'),
(0x67ff042f, 0, '2019-09-19 08:36:02'),
(0x805a151b, 0, '2019-09-19 09:07:11'),
(0x67ff042f, 2, '2019-09-19 11:41:34'),
(0x67ff04f5, 0, '2019-09-20 10:24:17'),
(0x67ff04f5, 2, '2019-09-20 10:57:03'),
(0x805a15db, 0, '2019-09-20 15:32:56'),
(0x67ff0574, 0, '2019-09-22 17:20:23'),
(0x2d389a9c, 0, '2019-09-22 17:34:22'),
(0x32ca9efa, 0, '2019-09-22 23:58:57'),
(0x67ff040f, 0, '2019-09-23 08:10:04'),
(0x68c2da25, 0, '2019-09-23 13:16:25'),
(0x67ff044f, 0, '2019-09-23 13:44:18'),
(0x67ff0522, 0, '2019-09-24 08:15:45'),
(0x4ade0e4a, 0, '2019-09-24 17:12:59'),
(0x4ade0e4a, 12, '2019-09-24 17:33:05'),
(0x1f0612f8, 0, '2019-09-24 17:34:32'),
(0xdea30bf3, 12, '2019-09-24 17:43:06'),
(0x6e24ee52, 1, '2019-09-25 16:00:45'),
(0x1f0612f8, 3, '2019-09-25 20:28:17'),
(0x17599761, 0, '2019-09-25 20:28:44'),
(0x17599761, 12, '2019-09-25 20:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_settings`
--

CREATE TABLE `engine4_user_settings` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_signup`
--

CREATE TABLE `engine4_user_signup` (
  `signup_id` int(11) UNSIGNED NOT NULL,
  `class` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT 999,
  `enable` smallint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_signup`
--

INSERT INTO `engine4_user_signup` (`signup_id`, `class`, `order`, `enable`) VALUES
(1, 'User_Plugin_Signup_Account', 1, 1),
(2, 'User_Plugin_Signup_Fields', 2, 0),
(3, 'User_Plugin_Signup_Photo', 3, 0),
(4, 'User_Plugin_Signup_Invite', 4, 0),
(5, 'Payment_Plugin_Signup_Subscription', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_twitter`
--

CREATE TABLE `engine4_user_twitter` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `twitter_uid` bigint(20) UNSIGNED NOT NULL,
  `twitter_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine4_user_verify`
--

CREATE TABLE `engine4_user_verify` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `engine4_user_verify`
--

INSERT INTO `engine4_user_verify` (`user_id`, `code`, `date`) VALUES
(9, '7ff4a377b21c37c1b5f97723ba4a8dfd', '2019-09-23 09:47:44'),
(18, '273914680607f304983896e49c1d91ce', '2019-09-25 14:55:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `engine4_activity_actions`
--
ALTER TABLE `engine4_activity_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `SUBJECT` (`subject_type`,`subject_id`),
  ADD KEY `OBJECT` (`object_type`,`object_id`);

--
-- Indexes for table `engine4_activity_actionsettings`
--
ALTER TABLE `engine4_activity_actionsettings`
  ADD PRIMARY KEY (`user_id`,`type`);

--
-- Indexes for table `engine4_activity_actiontypes`
--
ALTER TABLE `engine4_activity_actiontypes`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `engine4_activity_attachments`
--
ALTER TABLE `engine4_activity_attachments`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `type_id` (`type`,`id`);

--
-- Indexes for table `engine4_activity_comments`
--
ALTER TABLE `engine4_activity_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `resource_type` (`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_activity_likes`
--
ALTER TABLE `engine4_activity_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_activity_notifications`
--
ALTER TABLE `engine4_activity_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `LOOKUP` (`user_id`,`date`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `object` (`object_type`,`object_id`);

--
-- Indexes for table `engine4_activity_notificationsettings`
--
ALTER TABLE `engine4_activity_notificationsettings`
  ADD PRIMARY KEY (`user_id`,`type`);

--
-- Indexes for table `engine4_activity_notificationtypes`
--
ALTER TABLE `engine4_activity_notificationtypes`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `engine4_activity_stream`
--
ALTER TABLE `engine4_activity_stream`
  ADD PRIMARY KEY (`target_type`,`target_id`,`action_id`),
  ADD KEY `SUBJECT` (`subject_type`,`subject_id`,`action_id`),
  ADD KEY `OBJECT` (`object_type`,`object_id`,`action_id`);

--
-- Indexes for table `engine4_airport_airports`
--
ALTER TABLE `engine4_airport_airports`
  ADD PRIMARY KEY (`airport_id`);

--
-- Indexes for table `engine4_airport_expects`
--
ALTER TABLE `engine4_airport_expects`
  ADD PRIMARY KEY (`expect_id`);

--
-- Indexes for table `engine4_airport_threats`
--
ALTER TABLE `engine4_airport_threats`
  ADD PRIMARY KEY (`threat_id`);

--
-- Indexes for table `engine4_airport_votes`
--
ALTER TABLE `engine4_airport_votes`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `parent_type` (`parent_type`);

--
-- Indexes for table `engine4_announcement_announcements`
--
ALTER TABLE `engine4_announcement_announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_authorization_allow`
--
ALTER TABLE `engine4_authorization_allow`
  ADD PRIMARY KEY (`resource_type`,`resource_id`,`action`,`role`,`role_id`);

--
-- Indexes for table `engine4_authorization_levels`
--
ALTER TABLE `engine4_authorization_levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `engine4_authorization_mapprofiletypelevels`
--
ALTER TABLE `engine4_authorization_mapprofiletypelevels`
  ADD PRIMARY KEY (`mapprofiletypelevel_id`);

--
-- Indexes for table `engine4_authorization_permissions`
--
ALTER TABLE `engine4_authorization_permissions`
  ADD PRIMARY KEY (`level_id`,`type`,`name`);

--
-- Indexes for table `engine4_core_adcampaigns`
--
ALTER TABLE `engine4_core_adcampaigns`
  ADD PRIMARY KEY (`adcampaign_id`);

--
-- Indexes for table `engine4_core_adphotos`
--
ALTER TABLE `engine4_core_adphotos`
  ADD PRIMARY KEY (`adphoto_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `engine4_core_ads`
--
ALTER TABLE `engine4_core_ads`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ad_campaign` (`ad_campaign`);

--
-- Indexes for table `engine4_core_allowemails`
--
ALTER TABLE `engine4_core_allowemails`
  ADD PRIMARY KEY (`allowemail_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `engine4_core_auth`
--
ALTER TABLE `engine4_core_auth`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `expires` (`expires`);

--
-- Indexes for table `engine4_core_bannedemails`
--
ALTER TABLE `engine4_core_bannedemails`
  ADD PRIMARY KEY (`bannedemail_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `engine4_core_bannedips`
--
ALTER TABLE `engine4_core_bannedips`
  ADD PRIMARY KEY (`bannedip_id`),
  ADD UNIQUE KEY `start` (`start`,`stop`);

--
-- Indexes for table `engine4_core_bannedusernames`
--
ALTER TABLE `engine4_core_bannedusernames`
  ADD PRIMARY KEY (`bannedusername_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `engine4_core_bannedwords`
--
ALTER TABLE `engine4_core_bannedwords`
  ADD PRIMARY KEY (`bannedword_id`);

--
-- Indexes for table `engine4_core_banners`
--
ALTER TABLE `engine4_core_banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `engine4_core_comments`
--
ALTER TABLE `engine4_core_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `resource_type` (`resource_type`,`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_core_content`
--
ALTER TABLE `engine4_core_content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `page_id` (`page_id`,`order`);

--
-- Indexes for table `engine4_core_geotags`
--
ALTER TABLE `engine4_core_geotags`
  ADD PRIMARY KEY (`geotag_id`),
  ADD KEY `latitude` (`latitude`,`longitude`);

--
-- Indexes for table `engine4_core_jobs`
--
ALTER TABLE `engine4_core_jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `jobtype_id` (`jobtype_id`),
  ADD KEY `state` (`state`),
  ADD KEY `is_complete` (`is_complete`,`priority`,`job_id`);

--
-- Indexes for table `engine4_core_jobtypes`
--
ALTER TABLE `engine4_core_jobtypes`
  ADD PRIMARY KEY (`jobtype_id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `engine4_core_languages`
--
ALTER TABLE `engine4_core_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `engine4_core_likes`
--
ALTER TABLE `engine4_core_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `resource_type` (`resource_type`,`resource_id`),
  ADD KEY `poster_type` (`poster_type`,`poster_id`);

--
-- Indexes for table `engine4_core_links`
--
ALTER TABLE `engine4_core_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `owner` (`owner_type`,`owner_id`),
  ADD KEY `parent` (`parent_type`,`parent_id`);

--
-- Indexes for table `engine4_core_listitems`
--
ALTER TABLE `engine4_core_listitems`
  ADD PRIMARY KEY (`listitem_id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `engine4_core_lists`
--
ALTER TABLE `engine4_core_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `owner_type` (`owner_type`,`owner_id`);

--
-- Indexes for table `engine4_core_log`
--
ALTER TABLE `engine4_core_log`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `domain` (`domain`,`timestamp`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_core_mail`
--
ALTER TABLE `engine4_core_mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `engine4_core_mailrecipients`
--
ALTER TABLE `engine4_core_mailrecipients`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `engine4_core_mailtemplates`
--
ALTER TABLE `engine4_core_mailtemplates`
  ADD PRIMARY KEY (`mailtemplate_id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `engine4_core_menuitems`
--
ALTER TABLE `engine4_core_menuitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `LOOKUP` (`name`,`order`);

--
-- Indexes for table `engine4_core_menus`
--
ALTER TABLE `engine4_core_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `order` (`order`);

--
-- Indexes for table `engine4_core_migrations`
--
ALTER TABLE `engine4_core_migrations`
  ADD PRIMARY KEY (`package`);

--
-- Indexes for table `engine4_core_modules`
--
ALTER TABLE `engine4_core_modules`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `engine4_core_nodes`
--
ALTER TABLE `engine4_core_nodes`
  ADD PRIMARY KEY (`node_id`),
  ADD UNIQUE KEY `signature` (`signature`);

--
-- Indexes for table `engine4_core_pages`
--
ALTER TABLE `engine4_core_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `engine4_core_processes`
--
ALTER TABLE `engine4_core_processes`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `engine4_core_referrers`
--
ALTER TABLE `engine4_core_referrers`
  ADD PRIMARY KEY (`host`,`path`,`query`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `engine4_core_reports`
--
ALTER TABLE `engine4_core_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `category` (`category`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `read` (`read`);

--
-- Indexes for table `engine4_core_routes`
--
ALTER TABLE `engine4_core_routes`
  ADD PRIMARY KEY (`name`),
  ADD KEY `order` (`order`);

--
-- Indexes for table `engine4_core_search`
--
ALTER TABLE `engine4_core_search`
  ADD PRIMARY KEY (`type`,`id`);
ALTER TABLE `engine4_core_search` ADD FULLTEXT KEY `LOOKUP` (`title`,`description`,`keywords`,`hidden`);

--
-- Indexes for table `engine4_core_serviceproviders`
--
ALTER TABLE `engine4_core_serviceproviders`
  ADD PRIMARY KEY (`serviceprovider_id`),
  ADD UNIQUE KEY `type` (`type`,`name`);

--
-- Indexes for table `engine4_core_services`
--
ALTER TABLE `engine4_core_services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `type` (`type`,`profile`);

--
-- Indexes for table `engine4_core_servicetypes`
--
ALTER TABLE `engine4_core_servicetypes`
  ADD PRIMARY KEY (`servicetype_id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `engine4_core_session`
--
ALTER TABLE `engine4_core_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `engine4_core_settings`
--
ALTER TABLE `engine4_core_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `engine4_core_statistics`
--
ALTER TABLE `engine4_core_statistics`
  ADD PRIMARY KEY (`type`,`date`);

--
-- Indexes for table `engine4_core_status`
--
ALTER TABLE `engine4_core_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `engine4_core_styles`
--
ALTER TABLE `engine4_core_styles`
  ADD PRIMARY KEY (`type`,`id`);

--
-- Indexes for table `engine4_core_tagmaps`
--
ALTER TABLE `engine4_core_tagmaps`
  ADD PRIMARY KEY (`tagmap_id`),
  ADD KEY `resource_type` (`resource_type`,`resource_id`),
  ADD KEY `tagger_type` (`tagger_type`,`tagger_id`),
  ADD KEY `tag_type` (`tag_type`,`tag_id`);

--
-- Indexes for table `engine4_core_tags`
--
ALTER TABLE `engine4_core_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `text` (`text`);

--
-- Indexes for table `engine4_core_tasks`
--
ALTER TABLE `engine4_core_tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD UNIQUE KEY `plugin` (`plugin`),
  ADD KEY `module` (`module`),
  ADD KEY `started_last` (`started_last`);

--
-- Indexes for table `engine4_core_themes`
--
ALTER TABLE `engine4_core_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `engine4_invites`
--
ALTER TABLE `engine4_invites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipient` (`recipient`);

--
-- Indexes for table `engine4_messages_conversations`
--
ALTER TABLE `engine4_messages_conversations`
  ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `engine4_messages_messages`
--
ALTER TABLE `engine4_messages_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `CONVERSATIONS` (`conversation_id`,`message_id`);

--
-- Indexes for table `engine4_messages_recipients`
--
ALTER TABLE `engine4_messages_recipients`
  ADD PRIMARY KEY (`user_id`,`conversation_id`),
  ADD KEY `INBOX_UPDATED` (`user_id`,`conversation_id`,`inbox_updated`),
  ADD KEY `OUTBOX_UPDATED` (`user_id`,`conversation_id`,`outbox_updated`);

--
-- Indexes for table `engine4_network_membership`
--
ALTER TABLE `engine4_network_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`);

--
-- Indexes for table `engine4_network_networks`
--
ALTER TABLE `engine4_network_networks`
  ADD PRIMARY KEY (`network_id`),
  ADD KEY `assignment` (`assignment`);

--
-- Indexes for table `engine4_payment_gateways`
--
ALTER TABLE `engine4_payment_gateways`
  ADD PRIMARY KEY (`gateway_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `engine4_payment_orders`
--
ALTER TABLE `engine4_payment_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gateway_id` (`gateway_id`,`gateway_order_id`),
  ADD KEY `state` (`state`),
  ADD KEY `source_type` (`source_type`,`source_id`);

--
-- Indexes for table `engine4_payment_packages`
--
ALTER TABLE `engine4_payment_packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `engine4_payment_products`
--
ALTER TABLE `engine4_payment_products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `extension_type` (`extension_type`,`extension_id`);

--
-- Indexes for table `engine4_payment_subscriptions`
--
ALTER TABLE `engine4_payment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD UNIQUE KEY `gateway_id` (`gateway_id`,`gateway_profile_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `status` (`status`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `engine4_payment_transactions`
--
ALTER TABLE `engine4_payment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `type` (`type`),
  ADD KEY `state` (`state`),
  ADD KEY `gateway_transaction_id` (`gateway_transaction_id`),
  ADD KEY `gateway_parent_transaction_id` (`gateway_parent_transaction_id`);

--
-- Indexes for table `engine4_storage_chunks`
--
ALTER TABLE `engine4_storage_chunks`
  ADD PRIMARY KEY (`chunk_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `engine4_storage_files`
--
ALTER TABLE `engine4_storage_files`
  ADD PRIMARY KEY (`file_id`),
  ADD UNIQUE KEY `parent_file_id` (`parent_file_id`,`type`),
  ADD KEY `PARENT` (`parent_type`,`parent_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `engine4_storage_mirrors`
--
ALTER TABLE `engine4_storage_mirrors`
  ADD PRIMARY KEY (`file_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `engine4_storage_services`
--
ALTER TABLE `engine4_storage_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `engine4_storage_servicetypes`
--
ALTER TABLE `engine4_storage_servicetypes`
  ADD PRIMARY KEY (`servicetype_id`),
  ADD UNIQUE KEY `plugin` (`plugin`);

--
-- Indexes for table `engine4_users`
--
ALTER TABLE `engine4_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `EMAIL` (`email`),
  ADD UNIQUE KEY `USERNAME` (`username`),
  ADD KEY `MEMBER_COUNT` (`member_count`),
  ADD KEY `CREATION_DATE` (`creation_date`),
  ADD KEY `search` (`search`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `engine4_user_block`
--
ALTER TABLE `engine4_user_block`
  ADD PRIMARY KEY (`user_id`,`blocked_user_id`),
  ADD KEY `REVERSE` (`blocked_user_id`);

--
-- Indexes for table `engine4_user_facebook`
--
ALTER TABLE `engine4_user_facebook`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `facebook_uid` (`facebook_uid`);

--
-- Indexes for table `engine4_user_fields_maps`
--
ALTER TABLE `engine4_user_fields_maps`
  ADD PRIMARY KEY (`field_id`,`option_id`,`child_id`);

--
-- Indexes for table `engine4_user_fields_meta`
--
ALTER TABLE `engine4_user_fields_meta`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `engine4_user_fields_options`
--
ALTER TABLE `engine4_user_fields_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `engine4_user_fields_search`
--
ALTER TABLE `engine4_user_fields_search`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `profile_type` (`profile_type`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `field_13` (`field_13`);

--
-- Indexes for table `engine4_user_fields_values`
--
ALTER TABLE `engine4_user_fields_values`
  ADD PRIMARY KEY (`item_id`,`field_id`,`index`);

--
-- Indexes for table `engine4_user_forgot`
--
ALTER TABLE `engine4_user_forgot`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `engine4_user_janrain`
--
ALTER TABLE `engine4_user_janrain`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `engine4_user_listitems`
--
ALTER TABLE `engine4_user_listitems`
  ADD PRIMARY KEY (`listitem_id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `engine4_user_lists`
--
ALTER TABLE `engine4_user_lists`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `engine4_user_logins`
--
ALTER TABLE `engine4_user_logins`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `engine4_user_membership`
--
ALTER TABLE `engine4_user_membership`
  ADD PRIMARY KEY (`resource_id`,`user_id`),
  ADD KEY `REVERSE` (`user_id`);

--
-- Indexes for table `engine4_user_online`
--
ALTER TABLE `engine4_user_online`
  ADD PRIMARY KEY (`ip`,`user_id`),
  ADD KEY `LOOKUP` (`active`);

--
-- Indexes for table `engine4_user_settings`
--
ALTER TABLE `engine4_user_settings`
  ADD PRIMARY KEY (`user_id`,`name`);

--
-- Indexes for table `engine4_user_signup`
--
ALTER TABLE `engine4_user_signup`
  ADD PRIMARY KEY (`signup_id`);

--
-- Indexes for table `engine4_user_twitter`
--
ALTER TABLE `engine4_user_twitter`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `twitter_uid` (`twitter_uid`);

--
-- Indexes for table `engine4_user_verify`
--
ALTER TABLE `engine4_user_verify`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `engine4_activity_actions`
--
ALTER TABLE `engine4_activity_actions`
  MODIFY `action_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `engine4_activity_attachments`
--
ALTER TABLE `engine4_activity_attachments`
  MODIFY `attachment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_activity_comments`
--
ALTER TABLE `engine4_activity_comments`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_activity_likes`
--
ALTER TABLE `engine4_activity_likes`
  MODIFY `like_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_activity_notifications`
--
ALTER TABLE `engine4_activity_notifications`
  MODIFY `notification_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `engine4_airport_airports`
--
ALTER TABLE `engine4_airport_airports`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=592;

--
-- AUTO_INCREMENT for table `engine4_airport_expects`
--
ALTER TABLE `engine4_airport_expects`
  MODIFY `expect_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `engine4_airport_threats`
--
ALTER TABLE `engine4_airport_threats`
  MODIFY `threat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1129;

--
-- AUTO_INCREMENT for table `engine4_airport_votes`
--
ALTER TABLE `engine4_airport_votes`
  MODIFY `vote_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `engine4_announcement_announcements`
--
ALTER TABLE `engine4_announcement_announcements`
  MODIFY `announcement_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_authorization_levels`
--
ALTER TABLE `engine4_authorization_levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `engine4_authorization_mapprofiletypelevels`
--
ALTER TABLE `engine4_authorization_mapprofiletypelevels`
  MODIFY `mapprofiletypelevel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_adcampaigns`
--
ALTER TABLE `engine4_core_adcampaigns`
  MODIFY `adcampaign_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_adphotos`
--
ALTER TABLE `engine4_core_adphotos`
  MODIFY `adphoto_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_ads`
--
ALTER TABLE `engine4_core_ads`
  MODIFY `ad_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_allowemails`
--
ALTER TABLE `engine4_core_allowemails`
  MODIFY `allowemail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `engine4_core_bannedemails`
--
ALTER TABLE `engine4_core_bannedemails`
  MODIFY `bannedemail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `engine4_core_bannedips`
--
ALTER TABLE `engine4_core_bannedips`
  MODIFY `bannedip_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_bannedusernames`
--
ALTER TABLE `engine4_core_bannedusernames`
  MODIFY `bannedusername_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_core_bannedwords`
--
ALTER TABLE `engine4_core_bannedwords`
  MODIFY `bannedword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_banners`
--
ALTER TABLE `engine4_core_banners`
  MODIFY `banner_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_core_comments`
--
ALTER TABLE `engine4_core_comments`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `engine4_core_content`
--
ALTER TABLE `engine4_core_content`
  MODIFY `content_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=710;

--
-- AUTO_INCREMENT for table `engine4_core_jobs`
--
ALTER TABLE `engine4_core_jobs`
  MODIFY `job_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_jobtypes`
--
ALTER TABLE `engine4_core_jobtypes`
  MODIFY `jobtype_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `engine4_core_languages`
--
ALTER TABLE `engine4_core_languages`
  MODIFY `language_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_core_likes`
--
ALTER TABLE `engine4_core_likes`
  MODIFY `like_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `engine4_core_links`
--
ALTER TABLE `engine4_core_links`
  MODIFY `link_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_listitems`
--
ALTER TABLE `engine4_core_listitems`
  MODIFY `listitem_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_lists`
--
ALTER TABLE `engine4_core_lists`
  MODIFY `list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_log`
--
ALTER TABLE `engine4_core_log`
  MODIFY `message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_mail`
--
ALTER TABLE `engine4_core_mail`
  MODIFY `mail_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `engine4_core_mailrecipients`
--
ALTER TABLE `engine4_core_mailrecipients`
  MODIFY `recipient_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `engine4_core_mailtemplates`
--
ALTER TABLE `engine4_core_mailtemplates`
  MODIFY `mailtemplate_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `engine4_core_menuitems`
--
ALTER TABLE `engine4_core_menuitems`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `engine4_core_menus`
--
ALTER TABLE `engine4_core_menus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `engine4_core_nodes`
--
ALTER TABLE `engine4_core_nodes`
  MODIFY `node_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_pages`
--
ALTER TABLE `engine4_core_pages`
  MODIFY `page_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `engine4_core_reports`
--
ALTER TABLE `engine4_core_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_core_serviceproviders`
--
ALTER TABLE `engine4_core_serviceproviders`
  MODIFY `serviceprovider_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `engine4_core_services`
--
ALTER TABLE `engine4_core_services`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_servicetypes`
--
ALTER TABLE `engine4_core_servicetypes`
  MODIFY `servicetype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `engine4_core_status`
--
ALTER TABLE `engine4_core_status`
  MODIFY `status_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_tagmaps`
--
ALTER TABLE `engine4_core_tagmaps`
  MODIFY `tagmap_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_tags`
--
ALTER TABLE `engine4_core_tags`
  MODIFY `tag_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_core_tasks`
--
ALTER TABLE `engine4_core_tasks`
  MODIFY `task_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `engine4_core_themes`
--
ALTER TABLE `engine4_core_themes`
  MODIFY `theme_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `engine4_invites`
--
ALTER TABLE `engine4_invites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_messages_conversations`
--
ALTER TABLE `engine4_messages_conversations`
  MODIFY `conversation_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_messages_messages`
--
ALTER TABLE `engine4_messages_messages`
  MODIFY `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_network_networks`
--
ALTER TABLE `engine4_network_networks`
  MODIFY `network_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `engine4_payment_gateways`
--
ALTER TABLE `engine4_payment_gateways`
  MODIFY `gateway_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `engine4_payment_orders`
--
ALTER TABLE `engine4_payment_orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_payment_packages`
--
ALTER TABLE `engine4_payment_packages`
  MODIFY `package_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_payment_products`
--
ALTER TABLE `engine4_payment_products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_payment_subscriptions`
--
ALTER TABLE `engine4_payment_subscriptions`
  MODIFY `subscription_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_payment_transactions`
--
ALTER TABLE `engine4_payment_transactions`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_storage_chunks`
--
ALTER TABLE `engine4_storage_chunks`
  MODIFY `chunk_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_storage_files`
--
ALTER TABLE `engine4_storage_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `engine4_storage_services`
--
ALTER TABLE `engine4_storage_services`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engine4_storage_servicetypes`
--
ALTER TABLE `engine4_storage_servicetypes`
  MODIFY `servicetype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `engine4_users`
--
ALTER TABLE `engine4_users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `engine4_user_fields_meta`
--
ALTER TABLE `engine4_user_fields_meta`
  MODIFY `field_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `engine4_user_fields_options`
--
ALTER TABLE `engine4_user_fields_options`
  MODIFY `option_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `engine4_user_listitems`
--
ALTER TABLE `engine4_user_listitems`
  MODIFY `listitem_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_user_lists`
--
ALTER TABLE `engine4_user_lists`
  MODIFY `list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engine4_user_logins`
--
ALTER TABLE `engine4_user_logins`
  MODIFY `login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `engine4_user_signup`
--
ALTER TABLE `engine4_user_signup`
  MODIFY `signup_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
