-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 19/07/2020 às 02:28
-- Versão do servidor: 5.7.30-0ubuntu0.16.04.1
-- Versão do PHP: 7.0.33-0ubuntu0.16.04.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `databasee`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `backup_points` int(11) NOT NULL DEFAULT '0',
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `guild_points_stats` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `premium_points`, `backup_points`, `guild_points`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `vote`, `guild_points_stats`) VALUES
(1, '1', '356a192b7913b04c54574d18c28d46e6395428ab', '', 65535, 0, '', '0', 0, 0, 1, 0, 0, 0, '', 0, '', '', 99999, '', 0, 0, 0, 0, 'unknown', 0, 0, 0),
(10, '10', '10', '', 0, 0, '', 'KWIAW4-WDWA', 0, 0, 1, 0, 0, 0, '', 0, '', '', 99999, '', 0, 1595134955, 2147483647, 0, '', 0, 0, 0),
(1708, 'baiak', '6850fa141d2fe1c41bb37e03a65ca70562f6ae70', '', 0, 0, '', 'DWDW-432DW', 0, 0, 1, 0, 0, 0, '', 0, '', '', 99999, '', 0, 1595136080, 2147483647, 0, '', 0, 0, 0);

--
-- Gatilhos `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_storage`
--

CREATE TABLE `account_storage` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auction_system`
--

CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip, 2 - player, 3 - account, 4 - notation',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip - ip address, player - player_id, account - account_id, notation - account_id',
  `param` int(10) UNSIGNED NOT NULL COMMENT 'ip - mask, player - type (1 - report, 2 - lock, 3 - ban), account - player, notation - player',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL DEFAULT '-1',
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comprovante`
--

CREATE TABLE `comprovante` (
  `id` int(11) NOT NULL,
  `nome` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `metodo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8_unicode_ci NOT NULL,
  `valor` float(10,2) NOT NULL,
  `anexo` text COLLATE utf8_unicode_ci NOT NULL,
  `motivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mpcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picpaycode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypalcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dtt_players`
--

CREATE TABLE `dtt_players` (
  `id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `team` int(5) NOT NULL,
  `ip` bigint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `dtt_players`
--

INSERT INTO `dtt_players` (`id`, `pid`, `team`, `ip`) VALUES
(1, 269369115, 1, 1685173672),
(2, 269344834, 0, 361891667),
(3, 269345877, 1, 1966238899),
(4, 269214493, 0, 1695690441),
(5, 269291093, 1, 1102687493),
(6, 269386324, 0, 356770481),
(7, 269405195, 1, 848569777),
(8, 269268718, 0, 3743382154);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dtt_results`
--

CREATE TABLE `dtt_results` (
  `id` int(11) NOT NULL,
  `frags_blue` int(11) NOT NULL,
  `frags_red` int(11) NOT NULL,
  `towers_blue` int(11) NOT NULL,
  `towers_red` int(11) NOT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `hora` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `world_id`, `value`) VALUES
('', 0, '320'),
('123123', 0, '-1'),
('12380', 0, 'hydra'),
('12381', 0, '43'),
('12382', 0, '42'),
('140121', 0, '0'),
('140122', 0, '0'),
('15421', 0, '1577935354'),
('180400', 0, '0'),
('20010', 0, '11'),
('20330', 0, '7'),
('4', 0, '0'),
('5', 0, '0'),
('72000', 0, '0'),
('72001', 0, '0'),
('722340', 0, 'atime: 1578374331, guid: Kobylarcyak Kobylar, a'),
('722341', 0, 'atime: 1578409097, guid: Faaelz, a'),
('722342', 0, 'atime: 1578396886, guid: Kobylarcykena, a'),
('722343', 0, 'atime: 1578405815, guid: Kobylarcyak Kobylar, a'),
('722344', 0, 'atime: 1576309906, guid: Aloezista, a'),
('722345', 0, 'atime: 1576980233, guid: Pally Top, a'),
('722346', 0, 'atime: 1576517639, guid: Undead Freelove, a'),
('722347', 0, 'atime: 1576517552, guid: Rodrigo, a'),
('722348', 0, 'atime: 1578400823, guid: Saazsmuka, a'),
('722349', 0, 'atime: 1576516853, guid: GOD Stayrone, a'),
('722351', 0, 'a1: Limpe, 2: Account Manager, a'),
('722362', 0, '-1'),
('722363', 0, 'atime: 1576516853, guid: GOD Stayrone, a'),
('722364', 0, 'atime: 1576516853, guid: GOD Stayrone, a'),
('722365', 0, 'atime: 1576520982, guid: Tetsat, a'),
('722366', 0, 'atime: 1576516853, guid: GOD Stayrone, a'),
('722367', 0, 'atime: 1578389583, guid: Graves Is My Main, a'),
('722368', 0, 'atime: 1578396426, guid: Saazsmuka, a'),
('722369', 0, 'atime: 1576516853, guid: GOD Stayrone, a'),
('722370', 0, 'atime: 1576705208, guid: GOD Stayrone, a'),
('722374', 0, '1'),
('722375', 0, '-1'),
('722376', 0, '9'),
('722377', 0, '1'),
('722378', 0, '2020'),
('722385', 0, '20'),
('722387', 0, '0'),
('722401', 0, '1578393961'),
('722403', 0, '1578406205'),
('722404', 0, '1578250819'),
('722410', 0, '1'),
('722411', 0, '0'),
('722413', 0, '49'),
('722414', 0, '49'),
('722504', 0, '1578030438'),
('722511', 0, '1595135890'),
('722520', 0, '1581539247'),
('722536', 0, '1578407617'),
('722608', 0, '-1'),
('722609', 0, '-1'),
('722610', 0, '-1'),
('722611', 0, '-1'),
('722612', 0, '-1'),
('722613', 0, '-1'),
('722614', 0, '-1'),
('722615', 0, '-1'),
('722641', 0, '-1'),
('722653', 0, '2'),
('722659', 0, '-1'),
('722660', 0, '-1'),
('722661', 0, '-1'),
('722670', 0, '-1'),
('722672', 0, '0'),
('722673', 0, '0'),
('722692', 0, '-1'),
('722693', 0, '-1'),
('722694', 0, '-1'),
('722695', 0, '-1'),
('722696', 0, '-1'),
('722697', 0, '-1'),
('725080', 0, '0'),
('725081', 0, '0'),
('73010', 0, '0'),
('73011', 0, '0'),
('735040', 0, '0'),
('735041', 0, '0'),
('74020', 0, '0'),
('74021', 0, '0'),
('745040', 0, '0'),
('745041', 0, '0'),
('75030', 0, '0'),
('75031', 0, '0'),
('755040', 0, '0'),
('755041', 0, '0'),
('76040', 0, '0'),
('76041', 0, '0'),
('77050', 0, '0'),
('77051', 0, '0'),
('78060', 0, '0'),
('78061', 0, '0'),
('79070', 0, '0'),
('79071', 0, '0'),
('80080', 0, '0'),
('80081', 0, '0'),
('81090', 0, '0'),
('81091', 0, '0'),
('82100', 0, '0'),
('82101', 0, '0'),
('822066', 0, '0'),
('823300', 0, '55'),
('823301', 0, 'Rodrigo'),
('83110', 0, '0'),
('83111', 0, '0'),
('84120', 0, '0'),
('84121', 0, '0'),
('85130', 0, '0'),
('85131', 0, '0'),
('86140', 0, '0'),
('86141', 0, '0'),
('87771', 0, '-1'),
('87775', 0, '0'),
('87776', 0, '0'),
('87777', 0, '0'),
('87778', 0, '0'),
('921320', 0, 'a1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, a'),
('921321', 0, 'a1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, a'),
('921322', 0, 'a1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, a'),
('921323', 0, 'a1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, a'),
('bossSys', 0, '-1'),
('Chicken', 0, '142'),
('Flamingo', 0, '143'),
('Parrot', 0, '114'),
('Penguin', 0, '153');

-- --------------------------------------------------------

--
-- Estrutura para tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `real_castle` int(11) NOT NULL DEFAULT '0',
  `last_execute_points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_kills`
--

CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `payment` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guild_kills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `enemy_kills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `doors` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `beds` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isprotected` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `limit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_history`
--

CREATE TABLE `login_history` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mercadopagox`
--

CREATE TABLE `mercadopagox` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `forma` varchar(100) NOT NULL,
  `valor` int(11) NOT NULL,
  `ped_ref` varchar(200) NOT NULL,
  `id_mercado` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `ativado` int(11) NOT NULL DEFAULT '0',
  `pontos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `monster_boost`
--

CREATE TABLE `monster_boost` (
  `id` int(11) NOT NULL,
  `monster` varchar(255) NOT NULL DEFAULT '0',
  `loot` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `monster_boost`
--

INSERT INTO `monster_boost` (`id`, `monster`, `loot`, `exp`, `date`) VALUES
(1, 'Warlock', 39, 32, '2019-12-29 21:16:57'),
(2, 'Dragon Lord', 46, 39, '2019-12-29 21:21:59'),
(3, 'Draken Elite', 34, 38, '2019-12-29 23:38:22'),
(4, 'Frost Dragon', 35, 45, '2019-12-29 23:43:48'),
(5, 'Demon', 41, 42, '2019-12-30 00:02:27'),
(6, 'Dawnfire Asura', 42, 38, '2019-12-30 00:04:06'),
(7, 'Dragon Lord', 36, 35, '2019-12-30 00:07:05'),
(8, 'Hellhound', 40, 34, '2019-12-30 00:25:24'),
(9, 'Draken Abomination', 43, 48, '2019-12-30 00:41:44'),
(10, 'Demon', 37, 48, '2019-12-30 00:47:28'),
(11, 'Skeleton Elite Warrior', 49, 30, '2019-12-30 01:09:40'),
(12, 'Grim Reaper', 42, 48, '2019-12-30 01:14:11'),
(13, 'Fury', 35, 45, '2019-12-30 01:23:07'),
(14, 'Fury', 41, 32, '2019-12-30 02:16:18'),
(15, 'Demon', 30, 43, '2019-12-30 03:25:12'),
(16, 'Hydra', 36, 49, '2019-12-30 03:58:12'),
(17, 'Grim Reaper', 32, 34, '2019-12-30 04:37:12'),
(18, 'Medusa', 42, 31, '2019-12-30 08:35:25'),
(19, 'Dawnfire Asura', 33, 30, '2019-12-30 23:50:30'),
(20, 'Serpent Spawn', 50, 38, '2019-12-31 00:24:22'),
(21, 'Undead Dragon', 49, 47, '2019-12-31 02:30:38'),
(22, 'Dragon Lord', 36, 45, '2019-12-31 03:10:53'),
(23, 'Skeleton Elite Warrior', 37, 33, '2019-12-31 03:16:52'),
(24, 'Midnight Asura', 31, 42, '2019-12-31 03:20:12'),
(25, 'Hydra', 31, 45, '2019-12-31 08:35:19'),
(26, 'Grim Reaper', 39, 41, '2019-12-31 19:40:00'),
(27, 'Draken Abomination', 38, 46, '2019-12-31 20:45:55'),
(28, 'Warlock', 38, 31, '2019-12-31 21:30:40'),
(29, 'Demon', 43, 37, '2019-12-31 21:39:05'),
(30, 'Grim Reaper', 49, 37, '2020-01-01 08:35:19'),
(31, 'Skeleton Elite Warrior', 30, 50, '2020-01-01 15:19:41'),
(32, 'Serpent Spawn', 43, 31, '2020-01-01 15:24:56'),
(33, 'Behemoth', 33, 36, '2020-01-01 19:55:39'),
(34, 'Undead Dragon', 35, 49, '2020-01-01 21:00:02'),
(35, 'Behemoth', 44, 41, '2020-01-01 22:39:40'),
(36, 'Demon', 35, 49, '2020-01-01 23:21:07'),
(37, 'Frost Dragon', 41, 37, '2020-01-01 23:58:22'),
(38, 'Midnight Asura', 41, 31, '2020-01-02 00:33:01'),
(39, 'Skeleton Elite Warrior', 35, 50, '2020-01-02 00:57:43'),
(40, 'Midnight Asura', 41, 32, '2020-01-02 01:24:55'),
(41, 'Medusa', 31, 45, '2020-01-02 01:28:28'),
(42, 'Draken Abomination', 36, 49, '2020-01-02 01:35:43'),
(43, 'Draken Abomination', 44, 34, '2020-01-02 01:41:51'),
(44, 'Midnight Asura', 35, 32, '2020-01-02 02:25:35'),
(45, 'Fury', 50, 44, '2020-01-02 02:57:41'),
(46, 'Dragon Lord', 43, 34, '2020-01-02 02:58:12'),
(47, 'Fury', 36, 50, '2020-01-02 03:17:12'),
(48, 'Undead Dragon', 47, 50, '2020-01-02 03:18:28'),
(49, 'Behemoth', 44, 42, '2020-01-02 03:21:06'),
(50, 'Warlock', 48, 38, '2020-01-02 03:24:16'),
(51, 'Midnight Asura', 37, 30, '2020-01-02 03:26:23'),
(52, 'Warlock', 43, 49, '2020-01-02 03:27:28'),
(53, 'Fury', 46, 45, '2020-01-02 03:31:57'),
(54, 'Dragon Lord', 48, 39, '2020-01-02 08:35:19'),
(55, 'Skeleton Elite Warrior', 49, 47, '2020-01-03 00:06:24'),
(56, 'Skeleton Elite Warrior', 44, 46, '2020-01-03 03:57:22'),
(57, 'Ghastly Dragon', 30, 47, '2020-01-03 08:35:19'),
(58, 'Fury', 37, 37, '2020-01-03 13:58:55'),
(59, 'Hydra', 35, 44, '2020-01-04 08:35:19'),
(60, 'Draken Elite', 38, 43, '2020-01-05 08:35:19'),
(61, 'Draken Elite', 30, 31, '2020-01-05 14:14:04'),
(62, 'Midnight Asura', 42, 50, '2020-01-05 15:16:37'),
(63, 'Fury', 35, 48, '2020-01-05 15:26:55'),
(64, 'Medusa', 36, 44, '2020-01-05 15:29:14'),
(65, 'Hellhound', 36, 34, '2020-01-05 15:55:32'),
(66, 'Behemoth', 31, 45, '2020-01-05 15:58:29'),
(67, 'Draken Elite', 46, 49, '2020-01-05 16:06:04'),
(68, 'Behemoth', 38, 38, '2020-01-05 16:07:04'),
(69, 'Skeleton Elite Warrior', 43, 37, '2020-01-05 17:57:55'),
(70, 'Draken Elite', 46, 49, '2020-01-05 18:30:19'),
(71, 'Draken Abomination', 41, 34, '2020-01-05 18:31:42'),
(72, 'Skeleton Elite Warrior', 37, 30, '2020-01-05 18:45:19'),
(73, 'Ghastly Dragon', 44, 30, '2020-01-05 22:53:22'),
(74, 'Dragon Lord', 45, 36, '2020-01-06 01:06:06'),
(75, 'Dawnfire Asura', 39, 42, '2020-01-06 03:27:08'),
(76, 'Warlock', 43, 43, '2020-01-06 08:35:19'),
(77, 'Draken Elite', 41, 34, '2020-01-06 15:01:23'),
(78, 'Ghastly Dragon', 41, 49, '2020-01-06 22:00:12'),
(79, 'Ghastly Dragon', 35, 42, '2020-01-06 22:12:59'),
(80, 'Warlock', 41, 35, '2020-01-06 22:22:24'),
(81, 'Dawnfire Asura', 50, 41, '2020-01-06 22:37:33'),
(82, 'Dawnfire Asura', 39, 40, '2020-01-06 22:59:06'),
(83, 'Grim Reaper', 50, 46, '2020-01-06 23:14:02'),
(84, 'Undead Dragon', 45, 30, '2020-01-06 23:22:40'),
(85, 'Dragon Lord', 42, 33, '2020-01-06 23:34:53'),
(86, 'Undead Dragon', 31, 45, '2020-01-06 23:35:26'),
(87, 'Grim Reaper', 46, 35, '2020-01-06 23:41:54'),
(88, 'Frost Dragon', 38, 39, '2020-01-07 00:48:03'),
(89, 'Warlock', 43, 32, '2020-01-07 01:14:30'),
(90, 'Demon', 42, 41, '2020-01-07 01:15:38'),
(91, 'Draken Elite', 40, 37, '2020-01-07 01:23:04'),
(92, 'Behemoth', 46, 43, '2020-01-07 01:31:43'),
(93, 'Frost Dragon', 46, 45, '2020-01-07 01:32:28'),
(94, 'Dawnfire Asura', 42, 33, '2020-01-07 01:33:18'),
(95, 'Warlock', 39, 50, '2020-01-07 02:25:21'),
(96, 'Skeleton Elite Warrior', 34, 35, '2020-01-07 02:26:02'),
(97, 'Warlock', 49, 38, '2020-01-07 02:42:32'),
(98, 'Warlock', 39, 42, '2020-01-07 02:56:49'),
(99, 'Grim Reaper', 33, 40, '2020-01-07 04:01:54'),
(100, 'Hydra', 30, 46, '2020-01-07 08:35:27'),
(101, 'Hydra', 44, 42, '2020-01-07 15:06:16'),
(102, 'Hydra', 44, 42, '2020-01-07 15:17:03'),
(103, 'Hydra', 44, 42, '2020-01-07 15:24:41'),
(104, 'Hydra', 44, 42, '2020-01-07 15:41:16'),
(105, 'Hydra', 44, 42, '2020-01-08 03:46:58'),
(106, 'Hydra', 44, 42, '2020-01-08 03:57:10'),
(107, 'Hydra', 44, 42, '2020-01-09 00:30:52'),
(108, 'Hydra', 44, 42, '2020-01-09 03:08:54'),
(109, 'Hydra', 44, 42, '2020-01-11 02:56:54'),
(110, 'Hydra', 44, 42, '2020-01-12 12:26:44'),
(111, 'Hydra', 44, 42, '2020-01-12 12:35:12'),
(112, 'Hydra', 44, 42, '2020-02-11 20:06:24'),
(113, 'Hydra', 44, 42, '2020-02-12 06:48:23'),
(114, 'Hydra', 44, 42, '2020-02-12 18:26:54'),
(115, 'Hydra', 44, 42, '2020-02-12 19:25:20'),
(116, 'Hydra', 43, 42, '2020-07-19 03:37:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `most_powerful_guilds`
--

CREATE TABLE `most_powerful_guilds` (
  `id` int(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `frags` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `most_powerful_guilds`
--

INSERT INTO `most_powerful_guilds` (`id`, `name`, `frags`) VALUES
(16, 'Teste One', 5),
(17, 'Teste Two', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paypal`
--

CREATE TABLE `paypal` (
  `id` int(11) NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` double(9,2) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Waiting',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `picpay`
--

CREATE TABLE `picpay` (
  `id` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `valor` double(9,2) NOT NULL,
  `pontos` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `link` varchar(7000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `lookmount` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `stamina` bigint(20) UNSIGNED NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `broadcasting` tinyint(4) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL DEFAULT '',
  `viewers` int(1) NOT NULL DEFAULT '0',
  `ip` varchar(17) NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `guildjoin` int(11) NOT NULL,
  `sbw_points` bigint(255) NOT NULL DEFAULT '0',
  `bounty` int(11) NOT NULL DEFAULT '0',
  `frags` int(11) NOT NULL DEFAULT '0',
  `frags_all` int(11) NOT NULL DEFAULT '0',
  `hide_equips` int(11) NOT NULL DEFAULT '0',
  `hide_admin` int(11) NOT NULL DEFAULT '0',
  `auction_balance` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `lookmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `signature`, `broadcasting`, `castDescription`, `viewers`, `ip`, `offlinetraining_time`, `offlinetraining_skill`, `guildjoin`, `sbw_points`, `bounty`, `frags`, `frags_all`, `hide_equips`, `hide_admin`, `auction_balance`) VALUES
(1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 126, 62, 7, '', 400, 0, 1595136107, 2637247935, 0, 0, 0, 0, '', 0, 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '0', 43200, -1, 0, 0, 0, 0, 0, 0, 1, 0),
(2191, 'Adm M', 0, 6, 1708, 8, 2, 185, 185, 4200, 68, 76, 78, 39, 332, 0, 0, 0, 35, 35, 0, 100, 1, 124, 59, 7, '', 435, 1, 1595133191, 1595133191, 1, 0, 0, 0, '', 1595136221, 31, 0, 0, 151200000, 2, 60, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '0', 43200, -1, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Gatilhos `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`, `serial`) VALUES
(2189, 1, 101, 7458, 1, '', 'SQJTJ-M11F7-T649N-HILPE'),
(2189, 2, 102, 2173, 1, 0x8001000700636861726765730201000000, 'SVN5Z-GUSPG-0JVU3-GI56M'),
(2189, 3, 103, 10521, 1, '', 'E1HJY-6PJG4-YY1NS-26PWW'),
(2189, 4, 104, 7463, 1, '', 'UV5RR-90YG5-MJVSR-VNIG5'),
(2189, 5, 105, 7460, 1, '', 'N5SPT-NHO23-0XZHQ-GRPGW'),
(2189, 6, 106, 7735, 1, '', 'KRHHL-020TK-46QYL-9B4NE'),
(2189, 7, 107, 7464, 1, '', '8Y1W5-SEM8J-KHC4Z-M3QXM'),
(2189, 8, 108, 2641, 1, '', 'ZQTRE-GQQ9F-T63V4-0E7XN'),
(2189, 103, 109, 2789, 50, 0x0f32, 'R7TSZ-IGS03-GCVYS-Y58RF'),
(2189, 103, 110, 2160, 10, 0x0f0a, 'CMBHK-4GZD3-CTBUO-1E6UP'),
(2189, 103, 111, 7590, 1, 0x0f01, 'YCQJZ-LJ6UC-B9OBF-0GWYU'),
(2189, 103, 112, 2268, 0, 0x0f00, 'OZEOV-4QBYM-PYNI7-DSSKO'),
(2189, 103, 113, 7620, 1, 0x0f01, '6KMJK-3U3OI-M272S-4UK4J'),
(2190, 1, 101, 7458, 1, '', 'S2MVQ-D0T74-XUBCN-2COH2'),
(2190, 2, 102, 2173, 1, 0x8001000700636861726765730201000000, 'SH8DJ-9XBED-684T5-WVGF5'),
(2190, 3, 103, 10521, 1, '', '9F19G-QDH4J-LL2I1-NSNNV'),
(2190, 4, 104, 7463, 1, '', 'PUSUD-YSB40-52EU1-V0FFF'),
(2190, 5, 105, 7460, 1, '', 'NPQQ9-G3Q5S-OVCIF-R70RZ'),
(2190, 6, 106, 7735, 1, '', '9X4OT-T96XD-0M42E-2J7UD'),
(2190, 7, 107, 7464, 1, '', '18X2R-FUNEB-PO0IE-TDCOC'),
(2190, 8, 108, 2641, 1, '', 'RNNKR-3OZYK-3OH2S-06CNL'),
(2190, 103, 109, 2789, 50, 0x0f32, 'PEYOL-2JNGW-O9MDU-35KR6'),
(2190, 103, 110, 2160, 10, 0x0f0a, 'TVVZN-PCU4O-6IR68-E0HQR'),
(2190, 103, 111, 7590, 1, 0x0f01, 'FGPQU-LI1VZ-8EWTG-98H6D'),
(2190, 103, 112, 2268, 0, 0x0f00, '71KZ8-U3JDI-ZHZQX-V25LY'),
(2190, 103, 113, 7620, 1, 0x0f01, '6J2S2-J3BPX-EXZZM-XVEIX');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL,
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(2190, 0, 10, 0),
(2190, 1, 10, 0),
(2190, 2, 10, 0),
(2190, 3, 10, 0),
(2190, 4, 10, 0),
(2190, 5, 10, 0),
(2190, 6, 10, 0),
(2191, 0, 10, 0),
(2191, 1, 10, 0),
(2191, 2, 10, 0),
(2191, 3, 10, 0),
(2191, 4, 10, 0),
(2191, 5, 10, 0),
(2191, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_statements`
--

CREATE TABLE `player_statements` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(2189, '19387', '0'),
(2189, '25950', '-1'),
(2189, '45503', '0'),
(2189, '45504', '0'),
(2189, '67708', '1'),
(2189, '722362', '-1'),
(2189, '722384', '-1'),
(2189, 'broadcast', '-1'),
(2189, 'lootch', '-1'),
(2190, '19387', '0'),
(2190, '25950', '-1'),
(2190, '45503', '0'),
(2190, '45504', '0'),
(2190, '67708', '1'),
(2190, '722362', '-1'),
(2190, '722384', '-1'),
(2190, 'broadcast', '-1'),
(2190, 'lootch', '-1'),
(2191, '19387', '0'),
(2191, '25950', '-1'),
(2191, '45503', '0'),
(2191, '45504', '0'),
(2191, '666', '1595136197'),
(2191, '722362', '-1'),
(2191, '722384', '-1'),
(2191, 'broadcast', '1'),
(2191, 'broadcast_start', '1595136192'),
(2191, 'lootch', '-1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `real_castle`
--

CREATE TABLE `real_castle` (
  `guild_name` varchar(255) DEFAULT NULL,
  `guild_id` int(11) NOT NULL DEFAULT '0',
  `tomorrow` varchar(255) NOT NULL DEFAULT '0',
  `world_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `real_castle`
--

INSERT INTO `real_castle` (`guild_name`, `guild_id`, `tomorrow`, `world_id`) VALUES
('Nenhuma GUILD', -1, '9/1/2020', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '44'),
('encryption', '2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(1, 0, 'Welcome to The OTX Server!'),
(2, 0, 'Welcome to the Yurots Server!'),
(3, 0, 'Bem vindo ao Baiak-Secret, sua aventura vai começar!'),
(4, 0, 'Bem vindo ao Baiak-Wars, sua aventura vai começar!'),
(5, 0, 'Bem vindo ao BaiakPvP, sua aventura vai começar!'),
(6, 0, 'Bem vindo ao RealBaiak, sua aventura vai começar!');

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `snowballwar`
--

CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `snowballwar`
--

INSERT INTO `snowballwar` (`id`, `name`, `score`, `data`, `hora`) VALUES
(16, 'Leonardo', 30, '11/12/19', '12:12:00'),
(17, 'Kpeta', 37, '12/12/19', '21:12:00'),
(18, 'Mogosd', 26, '06/01/20', '21:12:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(2445, 0, 0x5e9828980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2445, 0, 0x5e9829980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2445, 0, 0x619827980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2445, 0, 0x61982e980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2446, 0, 0x6a9827980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2446, 0, 0x6798289807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2446, 0, 0x6798299807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2446, 0, 0x6a982e980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2447, 0, 0x739827980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2447, 0, 0x709828980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2447, 0, 0x709829980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2447, 0, 0x73982e980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2448, 0, 0x5e98329807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2448, 0, 0x5e98339807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2448, 0, 0x61983a980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2448, 0, 0x629838980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2449, 0, 0x679832980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2449, 0, 0x679833980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2449, 0, 0x6a983a980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2449, 0, 0x6b9838980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2450, 0, 0x709832980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2450, 0, 0x709833980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2450, 0, 0x73983a980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2450, 0, 0x749838980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303230303020676f6c6420636f696e732e00, ''),
(2451, 0, 0x5e983f980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2451, 0, 0x61983e980701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(2451, 0, 0x5e9840980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2452, 0, 0x67983f980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2452, 0, 0x6a983e980701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(2452, 0, 0x679840980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2453, 0, 0x70983f9807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2453, 0, 0x73983e980701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(2453, 0, 0x7098409807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2454, 0, 0x7b9835980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373230303020676f6c6420636f696e732e00, ''),
(2454, 0, 0x84982d980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2454, 0, 0x84982e980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2455, 0, 0x7a9806980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2455, 0, 0x7a9807980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2455, 0, 0x7c980a980701000000bd048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323230303020676f6c6420636f696e732e00, ''),
(2455, 0, 0x8498069807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2455, 0, 0x8498079807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2455, 0, 0x83980a980701000000bd048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323230303020676f6c6420636f696e732e00, ''),
(2455, 0, 0x82980f980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2455, 0, 0x809811980701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323230303020676f6c6420636f696e732e00, ''),
(2455, 0, 0x829810980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2456, 0, 0x73980b980701000000c3048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(2456, 0, 0x77980a980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2456, 0, 0x77980b980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2457, 0, 0x739807980701000000c3048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(2457, 0, 0x7798069807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2457, 0, 0x7798079807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2458, 0, 0x6f980e980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2458, 0, 0x6f980f980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2458, 0, 0x71980d980701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(2459, 0, 0x6c9806980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2459, 0, 0x6c9807980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2459, 0, 0x6f9806980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2459, 0, 0x6f9807980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2459, 0, 0x6e980a980701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(2460, 0, 0x66980f9807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2460, 0, 0x6698109807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2460, 0, 0x699810980701000000c3048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203530303020676f6c6420636f696e732e00, ''),
(2461, 0, 0x66980c980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2461, 0, 0x66980d980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2461, 0, 0x69980d980701000000c3048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203530303020676f6c6420636f696e732e00, ''),
(2462, 0, 0x669809980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2462, 0, 0x66980a980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2462, 0, 0x69980a980701000000c3048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203530303020676f6c6420636f696e732e00, ''),
(2463, 0, 0x6698069807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2463, 0, 0x6698079807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2463, 0, 0x699807980701000000c3048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203530303020676f6c6420636f696e732e00, ''),
(2464, 0, 0x5598109807010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2464, 0, 0x5598119807010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2464, 0, 0x5c9811980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e00, ''),
(2464, 0, 0x5e9814980701000000bc048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e00, ''),
(2464, 0, 0x619817980701000000c3048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e00, ''),
(2465, 0, 0x55981a980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2465, 0, 0x55981b980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2465, 0, 0x5c981c980701000000ba048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e00, ''),
(2465, 0, 0x5e981e980701000000bc048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e00, ''),
(2465, 0, 0x619821980701000000c3048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e00, ''),
(2466, 0, 0x4c982d980701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2466, 0, 0x4c982e980701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2466, 0, 0x52982b980701000000bd048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373730303020676f6c6420636f696e732e00, ''),
(2466, 0, 0x589829980701000000c3048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373730303020676f6c6420636f696e732e00, ''),
(2467, 0, 0x4c9837980701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2467, 0, 0x4c9838980701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2467, 0, 0x589833980701000000c3048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373730303020676f6c6420636f696e732e00, ''),
(2467, 0, 0x529835980701000000bc048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332343637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373730303020676f6c6420636f696e732e00, ''),
(2830, 0, 0x870b680b0701000000e7288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373730303020676f6c6420636f696e732e00, ''),
(2830, 0, 0x870b6a0b0801000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2830, 0, 0x870b6b0b0801000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2830, 0, 0x890b6a0b0701000000f0288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373730303020676f6c6420636f696e732e00, ''),
(2830, 0, 0x890b6a0b0801000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2830, 0, 0x890b6b0b0801000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2830, 0, 0x8d0b6f0b0801000000f0288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373730303020676f6c6420636f696e732e00, ''),
(2830, 0, 0x900b6e0b0801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2830, 0, 0x900b6f0b0801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2831, 0, 0x930b690b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2831, 0, 0x930b6a0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2831, 0, 0x9a0b690b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2831, 0, 0x9a0b6a0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2831, 0, 0x940b700b0701000000fa288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(2831, 0, 0x970b700b0701000000e7288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(2831, 0, 0x9a0b700b0701000000fa288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(2832, 0, 0x960b5e0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2832, 0, 0x960b5f0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2832, 0, 0x920b620b070100000022288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323830303020676f6c6420636f696e732e00, ''),
(2832, 0, 0x950b610b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323830303020676f6c6420636f696e732e00, ''),
(2832, 0, 0x950b630b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323830303020676f6c6420636f696e732e00, ''),
(2832, 0, 0x960b640b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2832, 0, 0x960b650b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2833, 0, 0x750b770b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2833, 0, 0x750b780b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2833, 0, 0x7b0b7a0b070100000022288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(2834, 0, 0x7f0b7a0b070100000022288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(2834, 0, 0x850b7b0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2834, 0, 0x870b7b0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2834, 0, 0x850b7c0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2834, 0, 0x870b7c0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2835, 0, 0x810b510b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2835, 0, 0x810b520b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2835, 0, 0x820b510b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2835, 0, 0x820b520b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2835, 0, 0x890b530b07010000002b198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(2835, 0, 0x890b540b0701000000f6138001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(2835, 0, 0x890b550b07010000002b198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(2836, 0, 0x810b510b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2836, 0, 0x810b520b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2836, 0, 0x820b500b06010000002a198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(2836, 0, 0x820b510b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2836, 0, 0x820b520b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2836, 0, 0x850b500b06010000002a198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(2836, 0, 0x870b510b06010000002b198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(2836, 0, 0x870b530b0601000000f6138001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(2836, 0, 0x870b550b06010000002b198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(2837, 0, 0x950b530b060100000024288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2837, 0, 0x920b540b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2837, 0, 0x920b550b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2838, 0, 0x9c0b530b060100000024288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2838, 0, 0x990b540b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2838, 0, 0x990b550b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2839, 0, 0xa30b530b060100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2839, 0, 0xa00b540b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2839, 0, 0xa00b550b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2840, 0, 0x920b4b0b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2840, 0, 0x920b4c0b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2840, 0, 0x930b4f0b060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2840, 0, 0x950b4f0b060100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2840, 0, 0x970b4f0b060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2841, 0, 0x990b4b0b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2841, 0, 0x990b4c0b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2841, 0, 0x9c0b4f0b060100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2842, 0, 0xa00b4b0b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2842, 0, 0xa00b4c0b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2842, 0, 0xa10b4f0b060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2842, 0, 0xa30b4f0b060100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2842, 0, 0xa50b4f0b060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2842, 0, 0xa60b4d0b060100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2843, 0, 0x8b0b480b07010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313330303020676f6c6420636f696e732e00, ''),
(2843, 0, 0x810b4c0b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2843, 0, 0x810b4d0b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2843, 0, 0x830b4c0b0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2843, 0, 0x830b4d0b0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2843, 0, 0x8b0b4d0b07010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313330303020676f6c6420636f696e732e00, ''),
(2844, 0, 0x920b4b0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2844, 0, 0x920b4c0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2844, 0, 0x930b4f0b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2844, 0, 0x950b4f0b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2844, 0, 0x970b4f0b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2845, 0, 0x990b4b0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2845, 0, 0x990b4c0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2845, 0, 0x9a0b4f0b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2845, 0, 0x9c0b4f0b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2845, 0, 0x9e0b4f0b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2846, 0, 0xa00b4b0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2846, 0, 0xa00b4c0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2846, 0, 0xa10b4f0b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2846, 0, 0xa30b4f0b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2846, 0, 0xa50b4f0b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2846, 0, 0xa60b4d0b070100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2847, 0, 0x930b530b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2847, 0, 0x950b530b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2847, 0, 0x970b530b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2847, 0, 0x920b540b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2847, 0, 0x920b550b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2848, 0, 0x9a0b530b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2848, 0, 0x9c0b530b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2848, 0, 0x9e0b530b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2848, 0, 0x990b540b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2848, 0, 0x990b550b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2849, 0, 0xa10b530b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2849, 0, 0xa30b530b070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2849, 0, 0xa50b530b070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(2849, 0, 0xa00b540b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2849, 0, 0xa00b550b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2851, 0, 0x420b390b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2851, 0, 0x420b3a0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2851, 0, 0x490b3a0b0701000000741b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(2851, 0, 0x440b3c0b0701000000731b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(2851, 0, 0x460b3c0b0701000000ee1a8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(2852, 0, 0x420b400b0701000000731b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2852, 0, 0x430b400b0701000000ee1a8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2852, 0, 0x440b400b0701000000731b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2852, 0, 0x450b430b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2852, 0, 0x450b440b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2853, 0, 0x3b0b430b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2853, 0, 0x3c0b400b0701000000731b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2853, 0, 0x3d0b400b0701000000ee1a8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2853, 0, 0x3b0b440b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2856, 0, 0x3c0b380b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2856, 0, 0x3c0b390b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2856, 0, 0x3c0b3c0b0701000000731b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2856, 0, 0x3e0b3c0b0701000000ee1a8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2856, 0, 0x400b3c0b0701000000731b8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2857, 0, 0x3b0b350b0701000000f71a8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202756656e6f6d20486f75736520233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(2857, 0, 0x400b330b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2857, 0, 0x400b340b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3099, 0, 0x7400c70007010000003c198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027506f727420686f7065272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3099, 0, 0x7100c9000701000000d90d8001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027506f727420686f7065272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3099, 0, 0x7100cb0007010000003d198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027506f727420686f7065272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3100, 0, 0x7100ce000701000000d90d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3100, 0, 0x7100d00007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3101, 0, 0x7b00c9000701000000d90d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3101, 0, 0x7b00cb0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3102, 0, 0x7b00ce000701000000d90d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3102, 0, 0x7900d10007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3102, 0, 0x7b00d00007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3103, 0, 0x8400c70007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3103, 0, 0x8700c70007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3103, 0, 0x8200ca0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3103, 0, 0x8900c9000701000000d90d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3103, 0, 0x8900cb0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3104, 0, 0x8200cf0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3104, 0, 0x8900ce000701000000d90d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3104, 0, 0x8400d10007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3104, 0, 0x8700d10007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3104, 0, 0x8900d00007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7c00da0006010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7c00da0007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7900dc0006010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7900df0006010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7900dc0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7900dd000701000000d80d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7900de0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7e00dc0006010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7e00df0006010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7e00dc0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7e00df0007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3105, 0, 0x7c00e00006010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3105, 0, 0x7c00e00007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3106, 0, 0x8200de0007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3106, 0, 0x8500de0007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3106, 0, 0x8300e2000701000000cf0d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3106, 0, 0x8400e20007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8a00de0007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8e00de0007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8800e00007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8b00e20007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8c00e2000701000000cf0d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8d00e20007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3107, 0, 0x8f00e00007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3108, 0, 0x7f00d90007010000003d198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3108, 0, 0x8100d6000701000000d00d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3108, 0, 0x8300d60007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3108, 0, 0x8200db0007010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f706539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3109, 0, 0x8600d6000701000000d00d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3109, 0, 0x8800d60007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3109, 0, 0x8700db0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3110, 0, 0x8b00d6000701000000d00d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3110, 0, 0x8d00d60007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3110, 0, 0x8c00db0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3110, 0, 0x8e00d90007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3111, 0, 0x9600d50007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3111, 0, 0x9300d8000701000000d80d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3111, 0, 0x9300d90007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3111, 0, 0x9600da0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3111, 0, 0x9800d80007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3112, 0, 0x9300e7000701000000d80d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3112, 0, 0x9600e50007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3112, 0, 0x9800e70007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3112, 0, 0x9600ea0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3112, 0, 0x9800e90007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8d00e70006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8c00e70007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8d00e7000701000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8e00e70007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8a00e90006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8a00eb0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8a00ea0007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8f00e90006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8f00eb0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8f00ea0007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8d00ec0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3113, 0, 0x8d00ec0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3114, 0, 0x6a00e30007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3114, 0, 0x6d00e30007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3114, 0, 0x6800e5000701000000d80d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3114, 0, 0x6a00e80007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3114, 0, 0x6d00e80007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3115, 0, 0x7200e30007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3115, 0, 0x7500e5000701000000d80d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3115, 0, 0x7500e70007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3115, 0, 0x7200e80007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6b00da0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6c00da000701000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6d00da0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6800dd0007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6f00dc0007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6f00df0007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6b00e10007010000003a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3116, 0, 0x6d00e10007010000003a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x5f00d60007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x5f00d7000701000000d80d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x5f00d80007010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x6400d60006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x6100d80006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x6300d80006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3117, 0, 0x6200da0007010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3118, 0, 0x6b00c4000701000000da0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3119, 0, 0x7400ca0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3119, 0, 0x7100ce0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3119, 0, 0x7300d00006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3119, 0, 0x7500d0000601000000d00d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3120, 0, 0x7900ca0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3120, 0, 0x7b00ce0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3120, 0, 0x7800d0000601000000d00d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3120, 0, 0x7a00d00006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3121, 0, 0x8900ce000601000000d90d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3121, 0, 0x8400d10006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3121, 0, 0x8700d10006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3121, 0, 0x8900d00006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3122, 0, 0x8900c9000601000000d90d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3122, 0, 0x8900cb0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3123, 0, 0x8600df000601000000d90d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3123, 0, 0x8800df000601000000d90d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3123, 0, 0x8400e20006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3123, 0, 0x8700e0000601000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3123, 0, 0x8b00e20006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3123, 0, 0x8c00e00006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3124, 0, 0x7f00da0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3124, 0, 0x8200d8000601000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3124, 0, 0x8200dc0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3125, 0, 0x8600d80006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3125, 0, 0x8700d8000601000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3125, 0, 0x8800d80006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3125, 0, 0x8700dc0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3126, 0, 0x8b00d80006010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f70653237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3126, 0, 0x8c00d8000601000000cf0d8001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f70653237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3126, 0, 0x8d00d80006010000003c198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027506f727420686f70653237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3127, 0, 0x9600d50006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3127, 0, 0x9300d80006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3127, 0, 0x9600da000601000000d00d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3127, 0, 0x9800d80006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3128, 0, 0x6900de000601000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3128, 0, 0x6d00de000601000000cf0d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3128, 0, 0x6f00dc0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3128, 0, 0x6a00e00006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3128, 0, 0x6d00e10006010000003a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3128, 0, 0x6f00e00006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3129, 0, 0x8500be0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3129, 0, 0x8700bc0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3129, 0, 0x8a00bc0006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3129, 0, 0x8b00be0006010000003d198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3129, 0, 0x8700c00006010000003c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3129, 0, 0x8a00c0000601000000d00d8001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027506f727420686f70653330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3130, 0, 0xca09b30006010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(3130, 0, 0xca09b30007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(3130, 0, 0xc609b4000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3130, 0, 0xc609b5000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3130, 0, 0xc809b60006010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(3130, 0, 0xc809b60007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(3131, 0, 0xcd09bb0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3131, 0, 0xd209b600070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3131, 0, 0xd609bb0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3131, 0, 0xd209be0007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3131, 0, 0xd509bc000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3131, 0, 0xd509bd000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3132, 0, 0xdc09b60007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3132, 0, 0xe309b2000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3132, 0, 0xe309b3000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3132, 0, 0xe409b60007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3132, 0, 0xe109ba0007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3133, 0, 0xec09b10007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3133, 0, 0xef09b2000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3133, 0, 0xef09b3000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3133, 0, 0xe809b60007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3133, 0, 0xec09ba0007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3133, 0, 0xf009b60007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3134, 0, 0xef09a9000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3134, 0, 0xef09aa000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3134, 0, 0xe809ac0007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343130303020676f6c6420636f696e732e00, ''),
(3135, 0, 0xdc09ac0007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383230303020676f6c6420636f696e732e00, ''),
(3135, 0, 0xe309a9000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3135, 0, 0xe309aa000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3135, 0, 0xe009af0006010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383230303020676f6c6420636f696e732e00, ''),
(3135, 0, 0xe009af0007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383230303020676f6c6420636f696e732e00, ''),
(3135, 0, 0xe409ac0006010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383230303020676f6c6420636f696e732e00, ''),
(3135, 0, 0xe409ac0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383230303020676f6c6420636f696e732e00, ''),
(3136, 0, 0xe3099e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3136, 0, 0xe3099f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3136, 0, 0xe309a100070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3137, 0, 0xef099e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3137, 0, 0xef099f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3138, 0, 0xfb099e000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3138, 0, 0xfb099f000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3138, 0, 0xf9099d0007010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323330303020676f6c6420636f696e732e00, ''),
(3138, 0, 0xfb099e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3138, 0, 0xfb099f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3138, 0, 0xf409a30007010000006f188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323330303020676f6c6420636f696e732e00, ''),
(3138, 0, 0xfc09a30007010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323330303020676f6c6420636f696e732e00, ''),
(3138, 0, 0xf809a70007010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323330303020676f6c6420636f696e732e00, ''),
(3139, 0, 0xdd0993000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3139, 0, 0xdd0994000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3139, 0, 0xde099500070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3139, 0, 0xe409960007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3139, 0, 0xe0099900070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3139, 0, 0xe109990007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3140, 0, 0xed0993000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3140, 0, 0xed0994000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3140, 0, 0xed099500070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3140, 0, 0xea09990007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3140, 0, 0xeb099900070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3141, 0, 0xf10993000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3141, 0, 0xf10994000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3141, 0, 0xf2099600070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3141, 0, 0xf5099900070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3142, 0, 0x0c0a7e0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3142, 0, 0x080a810007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3142, 0, 0x090a8100070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3143, 0, 0x140a8500070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3143, 0, 0x150a850007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3144, 0, 0x1d0a830007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(3144, 0, 0x1a0a8500070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(3145, 0, 0x1b0a8b0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3145, 0, 0x120a8d0007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3145, 0, 0x120a8e0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3145, 0, 0x190a8d00070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3145, 0, 0x150a910007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3145, 0, 0x1a0a910007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3146, 0, 0x0b0a870007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3146, 0, 0x0d0a86000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3146, 0, 0x0d0a87000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3146, 0, 0x0e0a890007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3146, 0, 0x0a0a8c00070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3146, 0, 0x0b0a8c0007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3147, 0, 0x1f0a8a0007010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3147, 0, 0x260a8a0007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3147, 0, 0x230a8d0007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3148, 0, 0x1f0a950007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383130303020676f6c6420636f696e732e00, ''),
(3148, 0, 0x230a9100070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383130303020676f6c6420636f696e732e00, ''),
(3148, 0, 0x200a96000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3148, 0, 0x200a97000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3148, 0, 0x270a950006010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383130303020676f6c6420636f696e732e00, ''),
(3148, 0, 0x260a96000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3148, 0, 0x260a97000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3148, 0, 0x270a950007010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383130303020676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3148, 0, 0x230a980006010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383130303020676f6c6420636f696e732e00, ''),
(3148, 0, 0x230a980007010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383130303020676f6c6420636f696e732e00, ''),
(3149, 0, 0x36050e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3149, 0, 0x36050f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3149, 0, 0x39050f0207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363130303020676f6c6420636f696e732e00, ''),
(3149, 0, 0x370512020701000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363130303020676f6c6420636f696e732e00, ''),
(3149, 0, 0x380510020701000000d2048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363130303020676f6c6420636f696e732e00, ''),
(3149, 0, 0x3c05120207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363130303020676f6c6420636f696e732e00, ''),
(3149, 0, 0x3c0513020701000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363130303020676f6c6420636f696e732e00, ''),
(3149, 0, 0x360514020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3149, 0, 0x360515020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3149, 0, 0x3905160207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363130303020676f6c6420636f696e732e00, ''),
(3150, 0, 0x2d050e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3150, 0, 0x2d050f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3150, 0, 0x2e050d0207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3150, 0, 0x2e050e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3150, 0, 0x2e050f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3150, 0, 0x32050d0207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3150, 0, 0x300511020701000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3150, 0, 0x3405110207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3150, 0, 0x320515020701000000d7048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3151, 0, 0x300511020601000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3151, 0, 0x310513020601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3151, 0, 0x320513020601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3151, 0, 0x3405110206010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3151, 0, 0x310514020601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3151, 0, 0x320514020601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3151, 0, 0x3205150206010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3152, 0, 0x2a051a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3152, 0, 0x2a051b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3152, 0, 0x2d051b0207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3152, 0, 0x29051e020701000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3152, 0, 0x2b051f0207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3152, 0, 0x2c051c020701000000d2048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x30051e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3153, 0, 0x30051f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3153, 0, 0x31051d020701000000d2048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x32051d0207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x310521020601000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x3305220206010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x3205220207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x3405210206010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3153, 0, 0x3405210207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3154, 0, 0x20051b020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3154, 0, 0x21051a02070100000040198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3154, 0, 0x22051b020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3154, 0, 0x20051c020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3154, 0, 0x22051c020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3154, 0, 0x23051c0207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3154, 0, 0x23051e0207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3154, 0, 0x23051f020701000000d5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3154, 0, 0x2305200207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3155, 0, 0x1e051e02060100000037198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343430303020676f6c6420636f696e732e00, ''),
(3155, 0, 0x1f051c020601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3155, 0, 0x1f051d020601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3155, 0, 0x20051b020601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3155, 0, 0x21051b020601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3155, 0, 0x23051c02060100000037198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343430303020676f6c6420636f696e732e00, ''),
(3155, 0, 0x210521020601000000d7048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343430303020676f6c6420636f696e732e00, ''),
(3155, 0, 0x22052102060100000036198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343430303020676f6c6420636f696e732e00, ''),
(3155, 0, 0x23052002060100000037198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343430303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x3e0502020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3156, 0, 0x3e0503020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3156, 0, 0x3f05070206010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x4105030206010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x4105030207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x400506020601000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x400507020701000000d7048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x4105070207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3156, 0, 0x4205060207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x3b05030206010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x3a0502020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3157, 0, 0x3a0503020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3157, 0, 0x3b05030207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x380506020601000000cf048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x3a05070206010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x3b05050206010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x3805070207010000003e198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x390507020701000000d7048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3157, 0, 0x3b05050207010000003f198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1c050d0206010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1c050d020701000000d7048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1d050d0207010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1b0511020601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3158, 0, 0x1b0512020601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3158, 0, 0x1c05130206010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1d0513020601000000d7048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1c0513020701000000d7048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1a05150207010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3158, 0, 0x1b0516020701000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3158, 0, 0x1c0516020701000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3159, 0, 0x20050d020701000000d7048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3159, 0, 0x21050d02070100000040198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3159, 0, 0x1f0511020601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3159, 0, 0x1f0512020601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3159, 0, 0x2005130206010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3159, 0, 0x210511020601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3159, 0, 0x210512020601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3159, 0, 0x2205110206010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3159, 0, 0x2105130207010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3159, 0, 0x2205100207010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3160, 0, 0x15050e020701000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3160, 0, 0x1305110207010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3160, 0, 0x1505120206010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3160, 0, 0x1705110206010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3160, 0, 0x150511020701000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3160, 0, 0x15051202070100000040198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3160, 0, 0x160511020701000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3160, 0, 0x17051102070100000041198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3161, 0, 0x0f05050207010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3161, 0, 0x0e050a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3161, 0, 0x0e050b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3161, 0, 0x0f050a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3161, 0, 0x0f050b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3161, 0, 0x120507020701000000d5048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3161, 0, 0x1205090207010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3162, 0, 0x130500020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3162, 0, 0x130501020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3162, 0, 0x1605010207010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3162, 0, 0x1405050206010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3162, 0, 0x150504020601000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3162, 0, 0x150505020701000000d7048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3162, 0, 0x1605050207010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3162, 0, 0x1705040207010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e00, ''),
(3163, 0, 0x1605f7010701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3163, 0, 0x1905f7010701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3163, 0, 0x1605f9010601000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373330303020676f6c6420636f696e732e00, ''),
(3163, 0, 0x1605f8010701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3163, 0, 0x1805fa010701000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373330303020676f6c6420636f696e732e00, ''),
(3163, 0, 0x1905f8010701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3163, 0, 0x1605fe0107010000003e198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373330303020676f6c6420636f696e732e00, ''),
(3163, 0, 0x1805fc010601000000d0048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373330303020676f6c6420636f696e732e00, ''),
(3163, 0, 0x1805fe010701000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373330303020676f6c6420636f696e732e00, ''),
(3163, 0, 0x1a05fc0107010000003f198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373330303020676f6c6420636f696e732e00, ''),
(3164, 0, 0x28050202080100000041198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3164, 0, 0x210505020801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3164, 0, 0x210506020801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3164, 0, 0x220505020801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3164, 0, 0x220506020801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3164, 0, 0x270504020801000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3165, 0, 0x2b0504020801000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3165, 0, 0x300505020801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3165, 0, 0x300506020801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3165, 0, 0x310505020801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3165, 0, 0x310506020801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3166, 0, 0x2b05fd010801000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3166, 0, 0x3005fb010801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3166, 0, 0x3105fb010801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3166, 0, 0x3005fc010801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3166, 0, 0x3105fc010801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3167, 0, 0x2105fb010801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3167, 0, 0x2205fb010801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3167, 0, 0x2105fc010801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3167, 0, 0x2205fc010801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3167, 0, 0x2705fd010801000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3168, 0, 0x290507020801000000d7048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027416c27647275686e20486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3168, 0, 0x230508020801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3168, 0, 0x230509020801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3168, 0, 0x2f0508020801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3168, 0, 0x2f0509020801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3169, 0, 0x270bce0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3169, 0, 0x250bd00b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3169, 0, 0x250bd50b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3169, 0, 0x260bd40b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3169, 0, 0x260bd50b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3169, 0, 0x290bd40b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3169, 0, 0x290bd50b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3170, 0, 0x2d0bce0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3170, 0, 0x2f0bd00b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3170, 0, 0x2b0bd40b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3170, 0, 0x2b0bd50b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3170, 0, 0x2e0bd40b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3170, 0, 0x2e0bd50b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3170, 0, 0x2f0bd50b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3171, 0, 0x260bd70b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3171, 0, 0x2e0bd70b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3171, 0, 0x260bd80b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3171, 0, 0x2a0bdb0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3171, 0, 0x2e0bd80b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3171, 0, 0x2f0bd90b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3172, 0, 0x340bd30b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3172, 0, 0x310bd60b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3172, 0, 0x310bd90b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3172, 0, 0x320bd90b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3172, 0, 0x320bda0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3172, 0, 0x340bdb0b070100000026198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3172, 0, 0x350bd90b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3172, 0, 0x350bda0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3172, 0, 0x360bd80b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3173, 0, 0x3d0bd30b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3173, 0, 0x3f0bd60b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3173, 0, 0x3a0bd80b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3173, 0, 0x3b0bd90b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3173, 0, 0x3b0bda0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3173, 0, 0x3d0bdb0b070100000026198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3173, 0, 0x3e0bd90b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3173, 0, 0x3e0bda0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3173, 0, 0x3f0bd90b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3174, 0, 0x460bce0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3174, 0, 0x410bd10b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3174, 0, 0x420bd10b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3174, 0, 0x420bd20b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3174, 0, 0x440bd10b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3174, 0, 0x440bd20b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3174, 0, 0x4a0bd10b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3175, 0, 0x420bd60b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3175, 0, 0x420bd70b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3175, 0, 0x440bd60b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3175, 0, 0x440bd70b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3175, 0, 0x410bd80b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3175, 0, 0x450bdb0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3175, 0, 0x4a0bd80b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3176, 0, 0x400bc60b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3176, 0, 0x470bc50b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3176, 0, 0x470bc60b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3176, 0, 0x490bc50b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3176, 0, 0x490bc60b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3176, 0, 0x4a0bc70b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3176, 0, 0x400bc80b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3176, 0, 0x450bca0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3177, 0, 0x460bbc0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333330303020676f6c6420636f696e732e00, ''),
(3177, 0, 0x4a0bbf0b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333330303020676f6c6420636f696e732e00, ''),
(3177, 0, 0x470bc00b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3177, 0, 0x470bc10b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3177, 0, 0x490bc00b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3177, 0, 0x490bc10b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3178, 0, 0x3a0bbf0b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3178, 0, 0x3b0bbd0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3178, 0, 0x3b0bbe0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3178, 0, 0x3d0bbd0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3178, 0, 0x3d0bbe0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3178, 0, 0x3f0bbc0b070100000026198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3178, 0, 0x3c0bc30b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3178, 0, 0x3f0bc20b070100000026198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3179, 0, 0x310bbf0b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3179, 0, 0x340bbc0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3179, 0, 0x360bbf0b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3179, 0, 0x320bc10b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3179, 0, 0x320bc20b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3179, 0, 0x340bc30b070100000026198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3180, 0, 0x2b0bbb0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3180, 0, 0x250bbe0b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3180, 0, 0x260bbe0b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3180, 0, 0x260bbf0b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3180, 0, 0x2f0bbe0b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3181, 0, 0x260bc30b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3181, 0, 0x290bc30b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3181, 0, 0x250bc40b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3181, 0, 0x260bc40b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3181, 0, 0x290bc40b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3181, 0, 0x250bc90b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3181, 0, 0x280bca0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3182, 0, 0x2b0bc30b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3182, 0, 0x2e0bc30b0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3182, 0, 0x2b0bc40b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3182, 0, 0x2e0bc40b0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3182, 0, 0x2f0bc40b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3182, 0, 0x2d0bca0b0701000000c5048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3182, 0, 0x2f0bc90b070100000027198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3183, 0, 0x990bef0a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3183, 0, 0x9a0bed0a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3183, 0, 0x9a0bee0a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3183, 0, 0x9d0bec0a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3183, 0, 0xa50bef0a070100000003068001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3184, 0, 0xa90bef0a070100000003068001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3184, 0, 0xb20bec0a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3184, 0, 0xb40bed0a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3184, 0, 0xb40bee0a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3184, 0, 0xb50bef0a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3185, 0, 0xab0be30a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353330303020676f6c6420636f696e732e00, ''),
(3185, 0, 0xa80be70a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353330303020676f6c6420636f696e732e00, ''),
(3185, 0, 0xa90be40a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3185, 0, 0xa90be50a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3185, 0, 0xab0be40a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3185, 0, 0xab0be50a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3185, 0, 0xae0be90a070100000024288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353330303020676f6c6420636f696e732e00, ''),
(3185, 0, 0xb20be30a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353330303020676f6c6420636f696e732e00, ''),
(3185, 0, 0xb40be70a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353330303020676f6c6420636f696e732e00, ''),
(3186, 0, 0x9e0be40a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3186, 0, 0x9e0be50a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3186, 0, 0xa30be40a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3186, 0, 0xa30be50a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3186, 0, 0xa40be70a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3186, 0, 0xa10be90a070100000024288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3187, 0, 0x970be40a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3187, 0, 0x970be50a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3187, 0, 0x9c0be40a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3187, 0, 0x9c0be50a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3187, 0, 0x9a0be90a070100000024288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3188, 0, 0xb80bea0a070100000022288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3188, 0, 0xbd0beb0a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3188, 0, 0xbe0beb0a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3188, 0, 0xbb0bed0a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3188, 0, 0xbd0bec0a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3189, 0, 0xbb0be10a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3189, 0, 0xbd0be20a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3189, 0, 0xbd0be30a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3189, 0, 0xb80be40a070100000022288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3189, 0, 0xbe0be40a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3190, 0, 0xa90bda0a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3190, 0, 0xa90bdb0a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3190, 0, 0xab0bda0a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3190, 0, 0xab0bdb0a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3190, 0, 0xac0bd90a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373930303020676f6c6420636f696e732e00, ''),
(3190, 0, 0xa80bdd0a070100000022288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373930303020676f6c6420636f696e732e00, ''),
(3190, 0, 0xac0be00a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373930303020676f6c6420636f696e732e00, ''),
(3191, 0, 0xa90bd10a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3191, 0, 0xa90bd20a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3191, 0, 0xac0bd00a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3191, 0, 0xa80bd40a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3191, 0, 0xac0bd60a070100000024288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3191, 0, 0xb00bd40a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3192, 0, 0xb90bd00a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3192, 0, 0xbb0bd10a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3192, 0, 0xbb0bd20a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3192, 0, 0xb40bd40a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3192, 0, 0xb90bd60a070100000024288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3192, 0, 0xbc0bd40a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xb60bc70a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3193, 0, 0xb80bc60a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xb80bc70a0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3193, 0, 0xbd0bc60a07010000001a288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xb50bc80a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xb50bcb0a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xb60bc80a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3193, 0, 0xb80bc80a0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3193, 0, 0xbf0bc80a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xbf0bcb0a07010000001b288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3193, 0, 0xbe0bcc0a070100000024288001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343330303020676f6c6420636f696e732e00, ''),
(3194, 0, 0xeb030604070100000021288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333730303020676f6c6420636f696e732e00, ''),
(3194, 0, 0xeb030c04070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333730303020676f6c6420636f696e732e00, ''),
(3194, 0, 0xf1030604070100000021288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333730303020676f6c6420636f696e732e00, ''),
(3194, 0, 0xf2030804070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333730303020676f6c6420636f696e732e00, ''),
(3194, 0, 0xf203090407010000001e288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333730303020676f6c6420636f696e732e00, ''),
(3194, 0, 0xf0030c04070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333730303020676f6c6420636f696e732e00, ''),
(3195, 0, 0xec031804070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343430303020676f6c6420636f696e732e00, ''),
(3195, 0, 0xf2031304070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343430303020676f6c6420636f696e732e00, ''),
(3195, 0, 0xf203140407010000001e288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343430303020676f6c6420636f696e732e00, ''),
(3195, 0, 0xf0031804070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343430303020676f6c6420636f696e732e00, ''),
(3196, 0, 0xf2031f0407010000001e288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e00, ''),
(3196, 0, 0xf6031e04070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e00, ''),
(3196, 0, 0xf6031f0407010000001e288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e00, ''),
(3196, 0, 0xf0032204070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e00, ''),
(3196, 0, 0xf4032204070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e00, ''),
(3197, 0, 0xfb031b04070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0xfe031904070100000021288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0xff031904070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0xfb031e04070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0xfd031f04070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0x02041b04070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0x01041f04070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3197, 0, 0x02041e04070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x06041b04070100000019288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x09041904070100000018288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x0e041904070100000018288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x0f041904070100000021288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x06041f04070100000019288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x0c041d0407010000001e288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x11041b04070100000019288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x11041f04070100000019288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x09042004070100000018288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3198, 0, 0x0f042004070100000018288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353630303020676f6c6420636f696e732e00, ''),
(3199, 0, 0x15041b04070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3199, 0, 0x18041904070100000020288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3199, 0, 0x19041904070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3199, 0, 0x15042004070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3199, 0, 0x18042104070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3200, 0, 0x1c041904070100000020288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3200, 0, 0x1d041904070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3200, 0, 0x1f041b04070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3200, 0, 0x1d042104070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3200, 0, 0x1f042004070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x18040a04070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x1d040a04070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x15040d0407010000001d288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x15040e04070100000019288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x1a040c0407010000001e288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x1f040d04070100000019288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x18041204070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x1a04100407010000001e288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x1d041204070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3201, 0, 0x1f041004070100000019288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3202, 0, 0x1504ff0307010000001e288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3202, 0, 0x1804fd03070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3202, 0, 0x1a04ff0307010000001e288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3202, 0, 0x1d04fd03070100000018288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3202, 0, 0x1f04ff03070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3202, 0, 0x15040004070100000019288001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202756697020486f757365204958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3203, 0, 0x15040304070100000019288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652058272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e00, ''),
(3203, 0, 0x1504040407010000001e288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652058272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e00, ''),
(3203, 0, 0x18040604070100000018288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652058272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e00, ''),
(3203, 0, 0x1d040604070100000018288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652058272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e00, ''),
(3203, 0, 0x1f040404070100000019288001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202756697020486f7573652058272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e00, ''),
(3204, 0, 0x0c04f303070100000021288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365205849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353130303020676f6c6420636f696e732e00, ''),
(3204, 0, 0x0f04f903070100000021288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365205849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353130303020676f6c6420636f696e732e00, ''),
(3204, 0, 0x1404f303070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365205849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353130303020676f6c6420636f696e732e00, ''),
(3204, 0, 0x1104f503070100000021288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365205849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353130303020676f6c6420636f696e732e00, ''),
(3204, 0, 0x1404f703070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365205849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353130303020676f6c6420636f696e732e00, ''),
(3204, 0, 0x1004f903070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f757365205849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353130303020676f6c6420636f696e732e00, ''),
(3205, 0, 0xfe03f60307010000001e288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3205, 0, 0xfc03f903070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3205, 0, 0x0404f403070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3205, 0, 0x0104f903070100000020288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3205, 0, 0x0204f903070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3205, 0, 0x0404f803070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3206, 0, 0xed03fb0307010000001e288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652058494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363030303020676f6c6420636f696e732e00, ''),
(3206, 0, 0xeb03ff03070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652058494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363030303020676f6c6420636f696e732e00, ''),
(3206, 0, 0xf103f803070100000021288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652058494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363030303020676f6c6420636f696e732e00, ''),
(3206, 0, 0xf303fb0307010000001e288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652058494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363030303020676f6c6420636f696e732e00, ''),
(3206, 0, 0xf103fd03070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652058494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363030303020676f6c6420636f696e732e00, ''),
(3206, 0, 0xf303fc03070100000019288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202756697020486f7573652058494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363030303020676f6c6420636f696e732e00, ''),
(3207, 0, 0xed03d603070100000021288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(3207, 0, 0xee03d603070100000018288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(3207, 0, 0xf103d003070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(3207, 0, 0xf103d403070100000019288001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202756697020486f75736520584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353730303020676f6c6420636f696e732e00, ''),
(3211, 0, 0x9c0047000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303030303020676f6c6420636f696e732e00, ''),
(3211, 0, 0x9e00470007010000008d158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3211, 0, 0x9b004c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3211, 0, 0x9b004d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3211, 0, 0x9f004e000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303030303020676f6c6420636f696e732e00, ''),
(3211, 0, 0xa00047000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303030303020676f6c6420636f696e732e00, ''),
(3211, 0, 0xa1004c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3211, 0, 0xa1004d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3212, 0, 0xaa0048000701000000b7148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313530303020676f6c6420636f696e732e00, ''),
(3212, 0, 0xac0049000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3212, 0, 0xac004a000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3212, 0, 0xa6004c0007010000008b158001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343130303020676f6c6420636f696e732e00, ''),
(3212, 0, 0xad004c000701000000b8148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313530303020676f6c6420636f696e732e00, ''),
(3212, 0, 0xaa0050000701000000b7148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313530303020676f6c6420636f696e732e00, ''),
(3213, 0, 0x9c0053000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383530303020676f6c6420636f696e732e00, ''),
(3213, 0, 0x9f0050000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383530303020676f6c6420636f696e732e00, ''),
(3213, 0, 0x9d0054000701000000891e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3213, 0, 0x9e00540007010000008a1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3213, 0, 0x9f0055000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383530303020676f6c6420636f696e732e00, ''),
(3213, 0, 0xa200530007010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3214, 0, 0x9d003e000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3214, 0, 0x9d003f000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3214, 0, 0x9d003f000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3214, 0, 0x9b0042000601000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393030303020676f6c6420636f696e732e00, ''),
(3214, 0, 0x9b0042000701000000d5238001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(3214, 0, 0x9e0040000601000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393030303020676f6c6420636f696e732e00, ''),
(3214, 0, 0x9d0040000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3214, 0, 0x9e0040000701000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393030303020676f6c6420636f696e732e00, ''),
(3215, 0, 0xb3003f000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3215, 0, 0xb7003d000701000000e6048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3215, 0, 0xbb003f000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3215, 0, 0xb50041000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3215, 0, 0xb90041000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3216, 0, 0xb400350007010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3216, 0, 0xb400360007010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3216, 0, 0xb60034000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323030303020676f6c6420636f696e732e00, ''),
(3216, 0, 0xb90034000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323030303020676f6c6420636f696e732e00, ''),
(3216, 0, 0xbb0037000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323030303020676f6c6420636f696e732e00, ''),
(3216, 0, 0xb70039000701000000e6048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3217, 0, 0xbf003e000701000000b8148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3217, 0, 0xbf003f0007010000008b158001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3217, 0, 0xc0003c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3217, 0, 0xc0003d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3217, 0, 0xc8003f000701000000b8148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3217, 0, 0xbf0040000701000000b8148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3218, 0, 0xbf0046000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3218, 0, 0xbf00470007010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3218, 0, 0xbf0048000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3218, 0, 0xc00044000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3218, 0, 0xc00045000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3219, 0, 0xbf0035000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130363530303020676f6c6420636f696e732e00, ''),
(3219, 0, 0xbf00360007010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373130303020676f6c6420636f696e732e00, ''),
(3219, 0, 0xbf0037000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130363530303020676f6c6420636f696e732e00, ''),
(3219, 0, 0xc00032000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3219, 0, 0xc00033000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3219, 0, 0xc80036000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130363530303020676f6c6420636f696e732e00, ''),
(3220, 0, 0xbf002f000701000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(3220, 0, 0xbf00300007010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363930303020676f6c6420636f696e732e00, ''),
(3220, 0, 0xc20026000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3220, 0, 0xc20027000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3221, 0, 0xb90026000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3221, 0, 0xb90027000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3221, 0, 0xbc002e000701000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00, ''),
(3221, 0, 0xbd002e0007010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363330303020676f6c6420636f696e732e00, ''),
(3222, 0, 0xaf0029000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00, ''),
(3222, 0, 0xb00026000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3222, 0, 0xb00027000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3222, 0, 0xb30025000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00, ''),
(3222, 0, 0xb4002e0007010000008d158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363330303020676f6c6420636f696e732e00, ''),
(3222, 0, 0xb5002e000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00, ''),
(3223, 0, 0xad0036000701000000891e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3223, 0, 0xae00360007010000008a1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3223, 0, 0xa6003b0007010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353930303020676f6c6420636f696e732e00, ''),
(3223, 0, 0xaf003b000701000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383530303020676f6c6420636f696e732e00, ''),
(3223, 0, 0xab003f000701000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383530303020676f6c6420636f696e732e00, ''),
(3224, 0, 0xab0033000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3224, 0, 0xa400350007010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3224, 0, 0xa40036000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3224, 0, 0xab0034000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3225, 0, 0xa4002f000701000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3225, 0, 0xab002e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3225, 0, 0xab002f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3225, 0, 0xa400300007010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3225, 0, 0xa40031000701000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3226, 0, 0x9c0025000701000000871e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3226, 0, 0x9c0026000701000000881e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3226, 0, 0x9f002a000701000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00, ''),
(3226, 0, 0xa0002a0007010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3226, 0, 0xa1002a000701000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00, ''),
(3227, 0, 0xa50027000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3227, 0, 0xa4002b0007010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343130303020676f6c6420636f696e732e00, ''),
(3227, 0, 0xa50028000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3227, 0, 0xac002a000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313530303020676f6c6420636f696e732e00, ''),
(3228, 0, 0x91002b0007010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e00, ''),
(3228, 0, 0x97002b000701000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3228, 0, 0x94002e000701000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3228, 0, 0x96002c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3228, 0, 0x96002d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3229, 0, 0x880022000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3229, 0, 0x880023000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3229, 0, 0x8a00270007010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3229, 0, 0x8b0027000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e00, ''),
(3230, 0, 0x92002a0006010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3230, 0, 0x96002c000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3230, 0, 0x96002d000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3230, 0, 0x97002c000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313030303020676f6c6420636f696e732e00, ''),
(3231, 0, 0x9300270006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3231, 0, 0x960028000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3231, 0, 0x960029000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3231, 0, 0x970028000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363530303020676f6c6420636f696e732e00, ''),
(3232, 0, 0x8d0022000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3232, 0, 0x8d0023000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3232, 0, 0x8c00240006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3232, 0, 0x9100250006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3233, 0, 0x9100250005010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3233, 0, 0x930026000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3233, 0, 0x930027000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3233, 0, 0x940024000501000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363530303020676f6c6420636f696e732e00, ''),
(3233, 0, 0x9400250005010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3234, 0, 0x9600280005010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3234, 0, 0x97002b000501000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e00, ''),
(3234, 0, 0x92002c000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3234, 0, 0x92002d000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3235, 0, 0x9400280004010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e00, ''),
(3235, 0, 0x950028000401000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373530303020676f6c6420636f696e732e00, ''),
(3235, 0, 0x94002e000401000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373530303020676f6c6420636f696e732e00, ''),
(3236, 0, 0x990028000401000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3236, 0, 0x9a00280004010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3236, 0, 0x9b002e000401000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3237, 0, 0x9a00260004010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3237, 0, 0x9e0024000401000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3238, 0, 0x920024000401000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e00, ''),
(3238, 0, 0x9200250004010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3239, 0, 0x9c0025000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3239, 0, 0x9c0026000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3239, 0, 0x9d002a000601000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383530303020676f6c6420636f696e732e00, ''),
(3239, 0, 0x9e002a0006010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3239, 0, 0x9f002a000601000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383530303020676f6c6420636f696e732e00, ''),
(3240, 0, 0xa10025000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3240, 0, 0xa10026000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3240, 0, 0xa2002a000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343030303020676f6c6420636f696e732e00, ''),
(3240, 0, 0xa3002a0006010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3240, 0, 0xa4002a000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343030303020676f6c6420636f696e732e00, ''),
(3241, 0, 0xa60028000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3241, 0, 0xa60029000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3241, 0, 0xac002b000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3241, 0, 0xa5002c0006010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e00, ''),
(3242, 0, 0xa5002f0006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3242, 0, 0xa50030000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3242, 0, 0xa60030000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3242, 0, 0xa60031000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3242, 0, 0xac0030000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3243, 0, 0xa50034000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3243, 0, 0xa500350006010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e00, ''),
(3243, 0, 0xa50036000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3243, 0, 0xa60036000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3243, 0, 0xa60037000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3244, 0, 0xaf003a000601000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037393530303020676f6c6420636f696e732e00, ''),
(3244, 0, 0xa6003c000601000000cf238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353330303020676f6c6420636f696e732e00, ''),
(3244, 0, 0xab003f000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023585858564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037393530303020676f6c6420636f696e732e00, ''),
(3244, 0, 0xad003d000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3244, 0, 0xad003e000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3244, 0, 0xae003d000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3244, 0, 0xae003e000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3245, 0, 0xb00026000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3245, 0, 0xb00027000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3245, 0, 0xb30026000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3245, 0, 0xb30027000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3245, 0, 0xb1002e000601000000b7148001000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3245, 0, 0xb2002e0006010000008d158001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358585856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3246, 0, 0xb70028000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3246, 0, 0xb70029000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3246, 0, 0xba0028000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3246, 0, 0xba0029000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3246, 0, 0xb8002e0006010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3246, 0, 0xb9002e000601000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235858584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3247, 0, 0xbd002e0006010000008d158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e00, ''),
(3247, 0, 0xc10026000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3247, 0, 0xc10027000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3248, 0, 0xbf002f0006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c49272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363730303020676f6c6420636f696e732e00, ''),
(3248, 0, 0xc30026000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3248, 0, 0xc30027000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3248, 0, 0xc8002b000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c49272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130303530303020676f6c6420636f696e732e00, ''),
(3249, 0, 0xbf00330006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e00, ''),
(3249, 0, 0xc70033000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3249, 0, 0xc80033000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363530303020676f6c6420636f696e732e00, ''),
(3249, 0, 0xc70034000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3250, 0, 0xbf0038000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037303530303020676f6c6420636f696e732e00, ''),
(3250, 0, 0xbf00390006010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3250, 0, 0xc70036000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3250, 0, 0xc70037000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3250, 0, 0xc80039000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037303530303020676f6c6420636f696e732e00, ''),
(3251, 0, 0xbf00400006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343730303020676f6c6420636f696e732e00, ''),
(3251, 0, 0xbf0041000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037303530303020676f6c6420636f696e732e00, ''),
(3251, 0, 0xc70041000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3251, 0, 0xc70042000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3251, 0, 0xc80040000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037303530303020676f6c6420636f696e732e00, ''),
(3252, 0, 0xbf00460006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c56272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3252, 0, 0xbf0047000601000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c56272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3252, 0, 0xc70044000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3252, 0, 0xc70045000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3252, 0, 0xc80047000601000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c56272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3253, 0, 0xb7003b000601000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323530303020676f6c6420636f696e732e00, ''),
(3253, 0, 0xb3003e000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323530303020676f6c6420636f696e732e00, ''),
(3253, 0, 0xbb003e0006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3253, 0, 0xbb003f000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323530303020676f6c6420636f696e732e00, ''),
(3253, 0, 0xb70041000601000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323530303020676f6c6420636f696e732e00, ''),
(3254, 0, 0xbb0036000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323030303020676f6c6420636f696e732e00, ''),
(3254, 0, 0xbb00370006010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3254, 0, 0xb70039000601000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323030303020676f6c6420636f696e732e00, ''),
(3255, 0, 0x97003b0006010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c56494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313230303020676f6c6420636f696e732e00, ''),
(3255, 0, 0x9b0039000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3255, 0, 0x9b003a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3255, 0, 0x97003c00060100000031198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c56494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383030303020676f6c6420636f696e732e00, ''),
(3256, 0, 0x91003a000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3256, 0, 0x91003b000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3256, 0, 0x93003d000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333530303020676f6c6420636f696e732e00, ''),
(3256, 0, 0x93003e0006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584c4958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3257, 0, 0x9200370006010000008d158001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203630303020676f6c6420636f696e732e00, ''),
(3258, 0, 0x8a0039000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3258, 0, 0x8a003a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3258, 0, 0x8b0039000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3258, 0, 0x8b003a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3258, 0, 0x8c003f0006010000008d158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c49272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3259, 0, 0x850036000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3259, 0, 0x850037000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3259, 0, 0x890036000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3259, 0, 0x890037000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3259, 0, 0x840038000601000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c4949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303030303020676f6c6420636f696e732e00, ''),
(3259, 0, 0x8400390006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c4949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3260, 0, 0x8a00340006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3260, 0, 0x8b0036000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3260, 0, 0x8b0037000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3261, 0, 0x82003c0006010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c4956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3261, 0, 0x82003d000601000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c4956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303030303020676f6c6420636f696e732e00, ''),
(3261, 0, 0x7f0040000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3261, 0, 0x7f0041000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3261, 0, 0x800042000601000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c4956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303030303020676f6c6420636f696e732e00, ''),
(3262, 0, 0x7f0038000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3262, 0, 0x7f0039000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3262, 0, 0x820035000601000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c56272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353530303020676f6c6420636f696e732e00, ''),
(3262, 0, 0x8200360006010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c56272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e00, ''),
(3262, 0, 0x820037000601000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c56272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353530303020676f6c6420636f696e732e00, ''),
(3263, 0, 0x7b003b000601000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3263, 0, 0x7c003b0006010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3263, 0, 0x78003f000601000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3263, 0, 0x790040000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3263, 0, 0x790041000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3263, 0, 0x7b0042000601000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3263, 0, 0x7d0040000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3263, 0, 0x7d0041000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3264, 0, 0x7a0034000601000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363530303020676f6c6420636f696e732e00, ''),
(3264, 0, 0x7b00340006010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3264, 0, 0x7c0034000601000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363530303020676f6c6420636f696e732e00, ''),
(3264, 0, 0x7d0035000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3264, 0, 0x7d0036000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3264, 0, 0x7c0038000601000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363530303020676f6c6420636f696e732e00, ''),
(3265, 0, 0x7a0036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3265, 0, 0x7a0037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3265, 0, 0x7d0036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3265, 0, 0x7d0037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3265, 0, 0x7c00380005010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c56494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3265, 0, 0x7d0038000501000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c56494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313030303020676f6c6420636f696e732e00, ''),
(3266, 0, 0x79003d000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3266, 0, 0x79003e000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3266, 0, 0x7c003d0005010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c4958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3267, 0, 0x7d003f0005010000008d158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3267, 0, 0x7f003f000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3267, 0, 0x7d0042000501000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313030303020676f6c6420636f696e732e00, ''),
(3267, 0, 0x7f0040000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3268, 0, 0x7f0036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3268, 0, 0x7f0037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3268, 0, 0x820036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3268, 0, 0x820037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3268, 0, 0x8100380005010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3269, 0, 0x80003c0005010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3269, 0, 0x810040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3269, 0, 0x810041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3269, 0, 0x830042000501000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393030303020676f6c6420636f696e732e00, ''),
(3269, 0, 0x840040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3269, 0, 0x840041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3270, 0, 0x840036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3270, 0, 0x840037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3270, 0, 0x870036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3270, 0, 0x870037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3270, 0, 0x8500380005010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3271, 0, 0x88003a0005010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3271, 0, 0x860040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3271, 0, 0x860041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3271, 0, 0x880042000501000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393030303020676f6c6420636f696e732e00, ''),
(3271, 0, 0x890040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3271, 0, 0x890041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3272, 0, 0x8c003a0005010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3272, 0, 0x8b0040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3272, 0, 0x8b0041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3272, 0, 0x8c0042000501000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e00, ''),
(3272, 0, 0x8e0040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3272, 0, 0x8e0041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3273, 0, 0x8b0034000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3273, 0, 0x8b0035000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3273, 0, 0x8f0034000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3273, 0, 0x8f0035000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3273, 0, 0x8e00380005010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3274, 0, 0x9300380005010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313030303020676f6c6420636f696e732e00, ''),
(3275, 0, 0x91003c0005010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e00, ''),
(3275, 0, 0x900040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3275, 0, 0x900041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3275, 0, 0x910042000501000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393530303020676f6c6420636f696e732e00, ''),
(3275, 0, 0x920040000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3275, 0, 0x920041000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3276, 0, 0x94003f000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3276, 0, 0x96003f0005010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203630303020676f6c6420636f696e732e00, ''),
(3276, 0, 0x940040000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3276, 0, 0x950042000501000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393030303020676f6c6420636f696e732e00, ''),
(3277, 0, 0x97003e0005010000008b158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3277, 0, 0x9d003f000501000000871e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3277, 0, 0x9b0042000501000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3277, 0, 0x9d0040000501000000881e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3277, 0, 0x9e0040000501000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3278, 0, 0x97003b0005010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c585849272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3278, 0, 0x9b003a000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3278, 0, 0x9b003b000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3279, 0, 0x9b0036000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3279, 0, 0x9b0037000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3279, 0, 0x9700380005010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58584949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3280, 0, 0x7e00450006010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3280, 0, 0x7c0049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3280, 0, 0x7c004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3280, 0, 0x7d004b000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3280, 0, 0x800049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3280, 0, 0x80004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3281, 0, 0x830045000601000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373030303020676f6c6420636f696e732e00, ''),
(3281, 0, 0x8400450006010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58584956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3281, 0, 0x820049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3281, 0, 0x82004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3281, 0, 0x850049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3281, 0, 0x85004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3282, 0, 0x8900450006010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3282, 0, 0x8a0045000601000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c585856272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3282, 0, 0x870049000601000000871e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3282, 0, 0x87004a000601000000881e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3282, 0, 0x8a0049000601000000f20b1058eb07008002000b006465736372697074696f6e0131000000596f75207265636f676e697a652054797273656e75732e20486520776173206b696c6c6564206279204f6c642054656f2e08006465636179696e670202000000170000000000, ''),
(3282, 0, 0x8b0049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3282, 0, 0x8b004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3283, 0, 0x8d0049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3283, 0, 0x8d004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3283, 0, 0x9000450006010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333330303020676f6c6420636f696e732e00, ''),
(3283, 0, 0x930049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3283, 0, 0x93004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3283, 0, 0x940048000601000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393530303020676f6c6420636f696e732e00, ''),
(3293, 0, 0x7f002c0007010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3293, 0, 0x83002e000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313030303020676f6c6420636f696e732e00, ''),
(3293, 0, 0x84002c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3293, 0, 0x84002d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3293, 0, 0x85002c000701000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858585649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313030303020676f6c6420636f696e732e00, ''),
(3294, 0, 0x7f00270007010000008b158001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c585858564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3294, 0, 0x840027000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3294, 0, 0x840028000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3295, 0, 0x760025000701000000871e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3295, 0, 0x760026000701000000881e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3295, 0, 0x7c00280007010000008b158001000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c58585856494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3296, 0, 0x75002b000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3296, 0, 0x75002c000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3296, 0, 0x79002f0007010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323730303020676f6c6420636f696e732e00, ''),
(3296, 0, 0x7a002f000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3296, 0, 0x7c002d000701000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234c5858584958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303530303020676f6c6420636f696e732e00, ''),
(3297, 0, 0x700025000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3297, 0, 0x700026000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3297, 0, 0x710029000701000000b7148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363530303020676f6c6420636f696e732e00, ''),
(3297, 0, 0x7200290007010000008d158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353130303020676f6c6420636f696e732e00, ''),
(3298, 0, 0x58002b000701000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584349272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3298, 0, 0x53002c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3298, 0, 0x53002d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3298, 0, 0x55002e0007010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584349272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353830303020676f6c6420636f696e732e00, ''),
(3298, 0, 0x57002c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3298, 0, 0x57002d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3299, 0, 0x4d002c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3299, 0, 0x4d002d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3299, 0, 0x4f002e0007010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353830303020676f6c6420636f696e732e00, ''),
(3299, 0, 0x50002e000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3299, 0, 0x51002c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3299, 0, 0x51002d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3300, 0, 0x4c00320007010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353830303020676f6c6420636f696e732e00, ''),
(3300, 0, 0x4a0037000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3300, 0, 0x4e0037000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3300, 0, 0x4f0036000701000000b8148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3300, 0, 0x4a0038000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3300, 0, 0x4c0039000701000000b7148001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3300, 0, 0x4e0038000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3301, 0, 0x4600320007010000008d158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353830303020676f6c6420636f696e732e00, ''),
(3301, 0, 0x440037000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3301, 0, 0x480037000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3301, 0, 0x440038000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3301, 0, 0x460039000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3301, 0, 0x480038000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3302, 0, 0x3d0036000701000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3302, 0, 0x3e0037000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3302, 0, 0x3e0038000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3302, 0, 0x4000320007010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353830303020676f6c6420636f696e732e00, ''),
(3302, 0, 0x420037000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3302, 0, 0x400039000701000000b7148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3302, 0, 0x420038000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3303, 0, 0x56001b0007010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358435649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353830303020676f6c6420636f696e732e00, ''),
(3303, 0, 0x51001c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3303, 0, 0x51001d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3303, 0, 0x53001e000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358435649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038373030303020676f6c6420636f696e732e00, ''),
(3304, 0, 0x5e001a000701000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(3304, 0, 0x5e001b0007010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363930303020676f6c6420636f696e732e00, ''),
(3304, 0, 0x5f001c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3304, 0, 0x5f001d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3304, 0, 0x6a0017000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3304, 0, 0x6b0017000701000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(3304, 0, 0x6500180007010000008b158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363930303020676f6c6420636f696e732e00, ''),
(3304, 0, 0x6a0018000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3304, 0, 0x62001e000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(3304, 0, 0x66001c000701000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520235843564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x5c000e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3305, 0, 0x5c000f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3305, 0, 0x5d000d000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x61000d000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x62000e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3305, 0, 0x62000f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3305, 0, 0x5b00120007010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x5d00100007010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x5f0014000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x6100100007010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e00, ''),
(3305, 0, 0x620012000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3305, 0, 0x620013000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3305, 0, 0x630012000701000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023584356494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(3306, 0, 0x51000d000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333530303020676f6c6420636f696e732e00, ''),
(3306, 0, 0x53000e000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3306, 0, 0x53000f000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3306, 0, 0x4a0011000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3306, 0, 0x4a0012000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3306, 0, 0x4d00120007010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3306, 0, 0x540011000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333530303020676f6c6420636f696e732e00, ''),
(3306, 0, 0x5400120007010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343930303020676f6c6420636f696e732e00, ''),
(3306, 0, 0x510015000701000000b7148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202358434958272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333530303020676f6c6420636f696e732e00, ''),
(3307, 0, 0x450027000701000000b7148001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303030303020676f6c6420636f696e732e00, ''),
(3307, 0, 0x4600270007010000008d158001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3307, 0, 0x480025000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3307, 0, 0x480026000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3308, 0, 0x48001d000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3308, 0, 0x48001e000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3308, 0, 0x4300200007010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234349272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e00, ''),
(3308, 0, 0x430021000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234349272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3308, 0, 0x490020000701000000b8148001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234349272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333530303020676f6c6420636f696e732e00, ''),
(3309, 0, 0x3f00210007010000008d158001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023434949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3309, 0, 0x40001f000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3309, 0, 0x41001f000701000000b8148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023434949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323530303020676f6c6420636f696e732e00, ''),
(3309, 0, 0x400020000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3310, 0, 0x3a001f000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3310, 0, 0x3900230007010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3310, 0, 0x3a0020000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3310, 0, 0x390024000701000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3312, 0, 0x9700370006010000008b158001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f75736520234356272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313030303020676f6c6420636f696e732e00, ''),
(3313, 0, 0x940036000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3313, 0, 0x940037000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3313, 0, 0x950039000701000000d5238001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20486f7573652023435649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3314, 0, 0x660023000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3314, 0, 0x6100260006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(3314, 0, 0x660024000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3314, 0, 0x670026000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323030303020676f6c6420636f696e732e00, ''),
(3314, 0, 0x610028000601000000b8148001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323030303020676f6c6420636f696e732e00, ''),
(3314, 0, 0x6700280006010000008b158001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027426169616b20486f757365202343564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343830303020676f6c6420636f696e732e00, ''),
(3315, 0, 0x7d004f000601000000f30b1058500c008002000b006465736372697074696f6e0139000000596f75207265636f676e697a6520576f6e64657266756c706c617965722e20486520776173206b696c6c6564206279204e6c76786c66797a2e08006465636179696e670202000000170000000000, ''),
(3315, 0, 0x7e004e0006010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3315, 0, 0x7b0053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3315, 0, 0x7b0054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3315, 0, 0x800053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3315, 0, 0x800054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3316, 0, 0x83004e000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333030303020676f6c6420636f696e732e00, ''),
(3316, 0, 0x84004e0006010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323230303020676f6c6420636f696e732e00, ''),
(3316, 0, 0x820053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3316, 0, 0x850053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3316, 0, 0x820054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3316, 0, 0x850054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3317, 0, 0x89004e0006010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e00, ''),
(3317, 0, 0x870053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3317, 0, 0x8b0053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3317, 0, 0x870054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3317, 0, 0x8b0054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3318, 0, 0x8f004e000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303030303020676f6c6420636f696e732e00, ''),
(3318, 0, 0x90004e0006010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3318, 0, 0x91004e000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303030303020676f6c6420636f696e732e00, ''),
(3318, 0, 0x8d0053000601000000871e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3318, 0, 0x8d0054000601000000881e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3318, 0, 0x930053000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3318, 0, 0x940051000601000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303030303020676f6c6420636f696e732e00, ''),
(3318, 0, 0x930054000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3319, 0, 0x6b0048000701000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3319, 0, 0x6f004a000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3319, 0, 0x6f004b000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3319, 0, 0x6c004d000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343530303020676f6c6420636f696e732e00, ''),
(3320, 0, 0x61004c000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3320, 0, 0x61004d000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3320, 0, 0x63004c00070100000030198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343030303020676f6c6420636f696e732e00, ''),
(3320, 0, 0x65004c000701000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3321, 0, 0x6200500007010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3321, 0, 0x650052000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3321, 0, 0x650053000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3322, 0, 0x6c0050000701000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3322, 0, 0x6f0052000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3322, 0, 0x6f0053000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3323, 0, 0x570052000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3323, 0, 0x570053000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3323, 0, 0x5b00500007010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3324, 0, 0x57004b000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3324, 0, 0x57004c000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3324, 0, 0x5b004e0007010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3325, 0, 0x6a004e000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3325, 0, 0x6a004f000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3325, 0, 0x70004e000601000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313030303020676f6c6420636f696e732e00, ''),
(3325, 0, 0x6a0052000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3325, 0, 0x6a0053000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3325, 0, 0x700050000601000000ce238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3325, 0, 0x700052000601000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313030303020676f6c6420636f696e732e00, ''),
(3326, 0, 0x6a0049000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3326, 0, 0x6a004a000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3326, 0, 0x6a0049000601000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3326, 0, 0x6a004a000601000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3326, 0, 0x6b004b000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373030303020676f6c6420636f696e732e00, ''),
(3326, 0, 0x6e00480006010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333830303020676f6c6420636f696e732e00, ''),
(3327, 0, 0x6100490006010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3327, 0, 0x61004a0006010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3327, 0, 0x61004e000601000000130700, ''),
(3327, 0, 0x64004c000601000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e00, ''),
(3328, 0, 0x6100510006010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3328, 0, 0x6100520006010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3328, 0, 0x640050000601000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3328, 0, 0x630054000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313030303020676f6c6420636f696e732e00, ''),
(3329, 0, 0x5c004b000601000000740610ffffffff00, ''),
(3329, 0, 0x57004c000601000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3329, 0, 0x57004d000601000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3329, 0, 0x5b004c000601000000730610ffffffff00, ''),
(3329, 0, 0x5c004c0006010000004e0610ffffffff00, ''),
(3329, 0, 0x5c004d000601000000720610ffffffff00, ''),
(3329, 0, 0x5d004c000601000000750610ffffffff00, ''),
(3329, 0, 0x5e004e000601000000ce238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3330, 0, 0x570051000601000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3330, 0, 0x570052000601000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3330, 0, 0x5e0050000601000000ce238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3330, 0, 0x58005400060100000030198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038323530303020676f6c6420636f696e732e00, ''),
(3331, 0, 0x7d0047000701000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3331, 0, 0x7b004b000701000000871e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3331, 0, 0x7b004c000701000000881e10ffffffff8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3332, 0, 0x8600470007010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3332, 0, 0x84004b000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3332, 0, 0x84004c000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3333, 0, 0x8e0047000701000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323430303020676f6c6420636f696e732e00, ''),
(3333, 0, 0x8c004b000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3333, 0, 0x8c004c000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3334, 0, 0x960047000701000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3334, 0, 0x97004b000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3334, 0, 0x97004c000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3335, 0, 0x91004f0007010000008d158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3335, 0, 0x97004f000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3335, 0, 0x940053000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3335, 0, 0x970050000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3335, 0, 0x940054000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3336, 0, 0xa10049000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3336, 0, 0xa1004a000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3336, 0, 0xa0004c000601000000ce238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e00, ''),
(3337, 0, 0x96004d0006010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3337, 0, 0x9b004e000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3337, 0, 0x9b004f000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3337, 0, 0x9c004e000601000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3337, 0, 0x9c004f000601000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3337, 0, 0x9b0050000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313030303020676f6c6420636f696e732e00, ''),
(3338, 0, 0x47004b000701000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3338, 0, 0x47004c000701000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3338, 0, 0x48004e000701000000d0238001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3339, 0, 0x470052000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3339, 0, 0x470053000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3339, 0, 0x4900500007010000008d158001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3339, 0, 0x480054000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323030303020676f6c6420636f696e732e00, ''),
(3340, 0, 0x4b004b000701000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3340, 0, 0x4b004c000701000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3340, 0, 0x4c004e000701000000d0238001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3340, 0, 0x4e004d0007010000001a0700, ''),
(3341, 0, 0x4b00520007010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3341, 0, 0x4b00530007010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3341, 0, 0x4d0050000701000000d0238001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3342, 0, 0x47004c000601000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3342, 0, 0x47004d000601000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3342, 0, 0x4c004c000601000000ce238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3343, 0, 0x4700510006010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3343, 0, 0x4700520006010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3343, 0, 0x4c00530006010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e00, ''),
(3344, 0, 0x470052000501000000871e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3344, 0, 0x470053000501000000881e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3344, 0, 0x4a00500005010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3344, 0, 0x4b005400050100000030198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323530303020676f6c6420636f696e732e00, ''),
(3345, 0, 0x47004b000501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3345, 0, 0x47004c000501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3345, 0, 0x4a004e0005010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313530303020676f6c6420636f696e732e00, ''),
(3346, 0, 0x4d004d000501000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e00, ''),
(3346, 0, 0x51004b000501000000831e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3346, 0, 0x51004c000501000000841e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3346, 0, 0x52004d00050100000031198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393530303020676f6c6420636f696e732e00, ''),
(3347, 0, 0x4d0051000501000000d0238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e00, ''),
(3347, 0, 0x5100520005010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3347, 0, 0x5100530005010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3347, 0, 0x52005200050100000031198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393530303020676f6c6420636f696e732e00, ''),
(3348, 0, 0x480043000601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3348, 0, 0x4c00430006010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3348, 0, 0x480044000601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3348, 0, 0x480045000601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3348, 0, 0x480046000601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3348, 0, 0x4a0047000601000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313030303020676f6c6420636f696e732e00, ''),
(3348, 0, 0x4c0046000601000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313030303020676f6c6420636f696e732e00, ''),
(3349, 0, 0x4a003d000601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3349, 0, 0x4a003e000601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3349, 0, 0x4b003d000601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3349, 0, 0x4b003e000601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3349, 0, 0x4c003f000601000000b8148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373030303020676f6c6420636f696e732e00, ''),
(3349, 0, 0x4c00410006010000008b158001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3350, 0, 0x4a0042000701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3350, 0, 0x4a0043000701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3350, 0, 0x4b0042000701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3350, 0, 0x4b0043000701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3350, 0, 0x4a0047000701000000b7148001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373030303020676f6c6420636f696e732e00, ''),
(3350, 0, 0x4c0046000701000000ce238001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e00, ''),
(3351, 0, 0x8f0024000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3351, 0, 0x8f0025000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3351, 0, 0x92002500080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3352, 0, 0x8f0020000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3352, 0, 0x8f0021000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3352, 0, 0x92002100080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3353, 0, 0x8f001c000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3353, 0, 0x8f001d000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3353, 0, 0x92001d00080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3354, 0, 0x8f0018000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3354, 0, 0x8f0019000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3354, 0, 0x92001900080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3355, 0, 0x96001900080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3355, 0, 0x990018000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3355, 0, 0x990019000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3356, 0, 0x96001d00080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3356, 0, 0x99001c000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3356, 0, 0x99001d000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3357, 0, 0x96002100080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3357, 0, 0x990020000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3357, 0, 0x990021000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3358, 0, 0x96002500080100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3358, 0, 0x990024000801000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3358, 0, 0x990025000801000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3359, 0, 0x8f0024000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3359, 0, 0x8f0025000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3359, 0, 0x92002500090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3360, 0, 0x8f0020000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3360, 0, 0x8f0021000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3360, 0, 0x92002100090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3361, 0, 0x8f001c000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3361, 0, 0x8f001d000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3361, 0, 0x92001d00090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3362, 0, 0x8f0018000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3362, 0, 0x8f0019000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3362, 0, 0x92001900090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3363, 0, 0x96001900090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3363, 0, 0x990018000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3363, 0, 0x990019000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3364, 0, 0x96001d00090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3364, 0, 0x99001c000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3364, 0, 0x99001d000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3365, 0, 0x96002100090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3365, 0, 0x990020000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3365, 0, 0x990021000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3366, 0, 0x96002500090100000036188001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303020676f6c6420636f696e732e00, ''),
(3366, 0, 0x990024000901000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3366, 0, 0x990025000901000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3367, 0, 0x9400100009010000003918800200030061696402d90b00000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333333637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343630303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4509de0c060100000024198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4609de0c0601000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4509e20c060100000064068001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4809e10c060100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4009e40c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3368, 0, 0x4009e50c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3368, 0, 0x4109e60c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4609e60c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3368, 0, 0x4809e50c060100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e00, ''),
(3369, 0, 0x4009e30c0701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3369, 0, 0x4109e30c0701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3369, 0, 0x4809e00c070100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3369, 0, 0x4809e20c0701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3369, 0, 0x4009e50c0701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3369, 0, 0x4109e50c0701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3369, 0, 0x4309e50c0701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3369, 0, 0x4409e60c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3709ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3370, 0, 0x3709ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3370, 0, 0x3709ed0c0701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3909ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3370, 0, 0x3909ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3370, 0, 0x3b09ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3370, 0, 0x3b09ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3370, 0, 0x3809ec0c0701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3c09ed0c060100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3c09ee0c070100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3709f00c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3709f00c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3b09f00c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3370, 0, 0x3a09f00c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x2d09ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3371, 0, 0x2d09ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3371, 0, 0x2f09ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3371, 0, 0x2f09ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3371, 0, 0x2d09ed0c0701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x2e09ec0c0701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x3109ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3371, 0, 0x3109ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3371, 0, 0x3209ed0c060100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x3209ee0c070100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x2d09f00c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x2d09f00c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x3109f00c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3371, 0, 0x3009f00c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3372, 0, 0x2609ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3372, 0, 0x2609ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3372, 0, 0x2609ed0c0701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3372, 0, 0x2709ec0c0701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3372, 0, 0x2809ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3372, 0, 0x2809ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3372, 0, 0x2a09ec0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3372, 0, 0x2a09ed0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3372, 0, 0x2609f00c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3372, 0, 0x2609f00c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3372, 0, 0x2a09f00c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3372, 0, 0x2909f00c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3373, 0, 0x2009f00c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3373, 0, 0x2109f00c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3374, 0, 0x1909f00c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3374, 0, 0x1b09f00c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2909d70c0601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2a09d70c0601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2509da0c0601000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2609d80c0601000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2609db0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2609db0c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2709d90c0701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2809db0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2909d90c0601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2a09d90c0601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2a09db0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2b09d80c070100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2b09d90c0701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2609dc0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2609de0c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2709dd0c0701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3375, 0, 0x2809dc0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2a09dc0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3375, 0, 0x2b09dd0c070100000027198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3376, 0, 0x1b09d80c07010000001c288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e00, ''),
(3376, 0, 0x1f09d80c07010000001c288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e00, ''),
(3376, 0, 0x1c09dd0c0701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3376, 0, 0x1d09dd0c0701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3376, 0, 0x1d09de0c07010000001a288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e00, ''),
(3376, 0, 0x2109da0c07010000001f288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e00, ''),
(3376, 0, 0x2109de0c07010000001a288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e00, ''),
(3377, 0, 0x1509d60c070100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3377, 0, 0x1009db0c070100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3377, 0, 0x1309db0c070100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3377, 0, 0x1509d80c0701000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3377, 0, 0x1509da0c070100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1209de0c0701000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1509de0c060100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1509de0c0701000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1509df0c070100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x0f09e10c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3378, 0, 0x0f09e20c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3378, 0, 0x1109e30c060100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1209e00c0601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1009e30c070100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1509e20c060100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1409e00c0701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1409e30c070100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3378, 0, 0x1509e20c070100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353530303020676f6c6420636f696e732e00, ''),
(3379, 0, 0x3809ad0c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3379, 0, 0x3809ae0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3379, 0, 0x3c09af0c06010000001b288001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3379, 0, 0x3c09af0c07010000001b288001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3379, 0, 0x3b09b20c06010000001a288001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3379, 0, 0x3909b20c07010000001a288001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3379, 0, 0x3b09b20c0701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e00, ''),
(3380, 0, 0x3909ab0c07010000001a288001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3380, 0, 0x3c09a80c07010000001b288001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3380, 0, 0x3c09aa0c0701000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3381, 0, 0x2809af0c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3381, 0, 0x2609b00c0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3381, 0, 0x2609b10c0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3381, 0, 0x2909b20c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3382, 0, 0x2609a90c0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3382, 0, 0x2609aa0c0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3382, 0, 0x2809ac0c0701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3383, 0, 0x2b09a90c0701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3383, 0, 0x2c09a90c0701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3383, 0, 0x2d09ac0c0701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3384, 0, 0x3109a90c0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3384, 0, 0x3109aa0c0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3384, 0, 0x3309ac0c0701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3385, 0, 0x3309af0c0701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3385, 0, 0x3209b20c070100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3385, 0, 0x3409b00c0701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3385, 0, 0x3409b10c0701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3386, 0, 0x2609a90c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3386, 0, 0x2609aa0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3386, 0, 0x2809ac0c0601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3387, 0, 0x2809af0c0601000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(3387, 0, 0x2609b00c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3387, 0, 0x2609b10c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3387, 0, 0x2909b20c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3388, 0, 0x3309af0c0601000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3388, 0, 0x3209b20c060100000026198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303020676f6c6420636f696e732e00, ''),
(3388, 0, 0x3409b00c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3388, 0, 0x3409b10c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3389, 0, 0x2b09a90c0601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3389, 0, 0x2c09a90c0601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3389, 0, 0x2d09ac0c0601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313430303020676f6c6420636f696e732e00, ''),
(3390, 0, 0x3109a90c0601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3390, 0, 0x3109aa0c0601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3390, 0, 0x3309ac0c0601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313130303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3a09db0c0501000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3709dc0c0401000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3391, 0, 0x3709de0c0401000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3391, 0, 0x3809dc0c0401000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3391, 0, 0x3809de0c0401000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3391, 0, 0x3909df0c040100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3809df0c050100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3a09df0c0501000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3c09df0c040100000026198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3d09dd0c040100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3391, 0, 0x3d09dd0c050100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3392, 0, 0x0309db0c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393730303020676f6c6420636f696e732e00, ''),
(3392, 0, 0x0409dd0c0401000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0509dd0c0401000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0409dc0c0501000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0409dd0c0501000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0709dc0c0601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0709dd0c0601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0809dc0c0601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3392, 0, 0x0809dd0c0601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3393, 0, 0xfc08d00c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3393, 0, 0xfc08d30c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3393, 0, 0xf608d40c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3393, 0, 0xf608d50c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3393, 0, 0xf908d50c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373030303020676f6c6420636f696e732e00, ''),
(3394, 0, 0x0809cf0c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e00, ''),
(3394, 0, 0x0909d10c060100000066068001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e00, ''),
(3394, 0, 0x0a09d20c0601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3394, 0, 0x0b09d20c0601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3395, 0, 0x0909ca0c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e00, ''),
(3395, 0, 0x0b09c90c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3395, 0, 0x0b09ca0c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3395, 0, 0x0809cc0c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e00, ''),
(3396, 0, 0xf808c90c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3396, 0, 0xf808ca0c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3396, 0, 0xfb08cc0c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e00, ''),
(3397, 0, 0xef08c90c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3397, 0, 0xef08ca0c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3397, 0, 0xf108cb0c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3397, 0, 0xf308cd0c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3398, 0, 0xe708c30c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3398, 0, 0xe708c40c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3398, 0, 0xe708c70c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3398, 0, 0xe908c40c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3398, 0, 0xe908c70c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3398, 0, 0xed08c60c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3398, 0, 0xe708c80c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3398, 0, 0xea08c90c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343030303020676f6c6420636f696e732e00, ''),
(3399, 0, 0xf108be0c0601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3399, 0, 0xf208be0c0601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3399, 0, 0xf308c10c060100000064068001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3399, 0, 0xf308c40c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3400, 0, 0xe708c30c0501000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3400, 0, 0xe708c40c0501000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3400, 0, 0xe808c50c0501000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3400, 0, 0xeb08c60c0501000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e00, ''),
(3401, 0, 0xfd08be0c0601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3401, 0, 0xfd08bf0c0601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3401, 0, 0xf908c00c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3401, 0, 0xfb08c20c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3401, 0, 0xfe08c20c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e00, ''),
(3402, 0, 0x0909be0c0501000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3402, 0, 0x0909bf0c0501000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3402, 0, 0x0409c10c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3402, 0, 0x0709c20c0601000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3402, 0, 0x0809c30c0601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3402, 0, 0x0909c00c0601000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353430303020676f6c6420636f696e732e00, ''),
(3402, 0, 0x0909c30c0601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3403, 0, 0x38099f0c0701000000cf0d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3404, 0, 0x3d099f0c0701000000cf0d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, ''),
(3405, 0, 0x3a099d0c0601000000d80d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202747656e67696120486f75736520233338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e00, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `top_killers`
--

CREATE TABLE `top_killers` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `patente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `top_mining`
--

CREATE TABLE `top_mining` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `lvl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `top_mining`
--

INSERT INTO `top_mining` (`player_id`, `exp`, `lvl`) VALUES
(1612, 15511, '3'),
(1648, 12062, '3'),
(1096, 14189, '3'),
(1086, 13393, '3'),
(1598, 15010, '3'),
(1687, 11853, '3'),
(1199, 12281, '3'),
(1868, 13269, '3'),
(1095, 12413, '3'),
(1085, 14026, '3'),
(2037, 11332, '3'),
(1871, 13127, '3'),
(1870, 13154, '3'),
(1632, 11799, '3'),
(1463, 12249, '3'),
(1700, 11394, '3'),
(1869, 13189, '3'),
(1650, 11879, '3'),
(1604, 14784, '3'),
(1088, 9457, '2'),
(2068, 9525, '2'),
(2076, 6162, '2'),
(2080, 6505, '2'),
(1038, 7160, '2'),
(1014, 7032, '2'),
(1018, 6342, '2'),
(1482, 8728, '2'),
(1022, 6442, '2'),
(1021, 6253, '2'),
(993, 8033, '2'),
(2081, 6450, '2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `woe`
--

CREATE TABLE `woe` (
  `id` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `woe`
--

INSERT INTO `woe` (`id`, `started`, `guild`, `breaker`, `time`) VALUES
(1, 1554768325, 1, 7, 1552276120);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_featured_article`
--

CREATE TABLE `z_featured_article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT '1',
  `post_icon_id` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `z_network_box`
--

INSERT INTO `z_network_box` (`id`, `network_name`, `network_link`) VALUES
(1, 'facebook', 'BaiakWars');

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`id`, `date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1, 1480371820, 1, 1, 'Bem-Vindo ao Gesior 2012 Edited by Natanael Beckman!', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `z_ots_guildcomunication`
--

INSERT INTO `z_ots_guildcomunication` (`id`, `name`, `type`, `action`, `param1`, `param2`, `param3`, `param4`, `param5`, `param6`, `param7`, `delete_it`) VALUES
(96, 'Maria Luiiza', 'login', 'give_item', '7893', '1', '', '', 'item', 'Light Mage Boots', '', 1),
(291, 'Midnight Asura', 'login', 'give_item', '7414', '1', '', '', 'item', 'Alpha Staff', '', 1),
(293, 'Midnight Asura', 'login', 'give_item', '7893', '1', '', '', 'item', 'Light Mage Boots', '', 1),
(375, 'Mete Ficha', 'login', 'give_item', '7366', '1', '', '', 'item', 'Light Star', '', 1),
(377, 'Mete Ficha', 'login', 'give_item', '2644', '1', '', '', 'item', 'Light Pally Boots', '', 1),
(378, 'Mete Ficha', 'login', 'give_item', '2644', '1', '', '', 'item', 'Light Pally Boots', '', 1),
(645, 'Blitz Maluko', 'login', 'give_item', '7414', '1', '', '', 'item', 'Alpha Staff', '', 1),
(646, 'Blitz Maluko', 'login', 'give_item', '7893', '1', '', '', 'item', 'Light Mage Boots', '', 1),
(649, 'Rod Master', 'login', 'give_item', '7414', '1', '', '', 'item', 'Alpha Staff', '', 1),
(650, 'Rod Master', 'login', 'give_item', '7893', '1', '', '', 'item', 'Light Mage Boots', '', 1),
(659, 'Rod Master', 'login', 'give_item', '7366', '1', '', '', 'item', 'Light Star', '', 1),
(660, 'Rod Master', 'login', 'give_item', '2644', '1', '', '', 'item', 'Light Pally Boots', '', 1),
(706, 'Mete Ficha', 'login', 'give_item', '8293', '1', '', '', 'item', 'Alpha Axe', '', 1),
(707, 'Mete Ficha', 'login', 'give_item', '7891', '1', '', '', 'item', 'Light Kina Boots', '', 1),
(752, 'Is Returns', 'login', 'give_item', '8929', '1', '', '', 'item', 'Alpha Club', '', 1),
(753, 'Is Returns', 'login', 'give_item', '7891', '1', '', '', 'item', 'Light Kina Boots', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `z_polls`
--

INSERT INTO `z_polls` (`id`, `question`, `end`, `start`, `answers`, `votes_all`) VALUES
(1, 'Teste', 1576794489, 1576708089, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `looktype` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `z_shopguild_offer`
--

INSERT INTO `z_shopguild_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`, `looktype`) VALUES
(21, 1, 7414, 1, 0, 0, 'item', '680-700', 'Alpha Staff', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_history_pacc`
--

CREATE TABLE `z_shop_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_history_sell`
--

CREATE TABLE `z_shop_history_sell` (
  `from_account` int(11) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_category` int(11) NOT NULL,
  `offer_new` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_ticket`
--

CREATE TABLE `z_ticket` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `registered` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `z_ticket`
--

INSERT INTO `z_ticket` (`account`, `type`, `status`, `text`, `id`, `subject`, `priority`, `reply`, `who`, `uid`, `tag`, `registered`) VALUES
('1109', 1, 1, 'O cliente próprio esta com debug', 1, 'Debug', 3, 0, 0, 68, 4, 0),
('609', 1, 1, 'quero recuperar meus pontos do reset passado', 2, 'RECUPERAR MEUS POINTS', 3, 0, 0, 67, 5, 0),
('609', 1, 1, 'Gostaria de recuperar meus pontos nos quais donatei antes de resetar.\r\nDonatei 50 reais no MERCADO PAGO, confira lá a transação com: VINKEOG ou Kevin.', 1, 'recuperar meus points', 3, 0, 0, 66, 5, 0),
('613', 1, 1, 'morri no boss ta quest wand por conta do jogo cair', 1, 'morri no final da quest', 3, 0, 0, 69, 2, 0),
('1242', 1, 4, 'estou tentando transfeir pelo celular para sua conta do brasil, nao estou conseguindo fala que a agencia ta errada  meu banco e bradesco\r\nme ajude ai', 1, 'DONATAR', 3, 0, 0, 70, 5, 0),
('1635', 1, 3, 'ID da transação: 90J76280LC885273B     \r\n\r\nValor 100 $', 1, 'donate , reset passado troquei ideia e o adm rodrigo me deu 390 pontos . espero que nesse aconteça o mesmo, pois sempre ajudei o server .', 3, 0, 0, 71, 5, 0),
('1046', 1, 3, 'EVOLUX', 1, 'DONATE', 3, 0, 0, 72, 5, 0),
('1242', 2, 4, 'Como assim amigo?', 1, '', 0, 1, 1, 73, 0, 0),
('1635', 2, 3, 'anexa na aba accountmanagement', 1, '', 0, 1, 1, 74, 0, 0),
('1046', 2, 3, 'anexa na aba accountmanagement', 1, '', 0, 1, 1, 75, 0, 0);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Índices de tabela `auction_system`
--
ALTER TABLE `auction_system`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Índices de tabela `comprovante`
--
ALTER TABLE `comprovante`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `dtt_players`
--
ALTER TABLE `dtt_players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices de tabela `dtt_results`
--
ALTER TABLE `dtt_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices de tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `kill_id` (`kill_id`);

--
-- Índices de tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`);

--
-- Índices de tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`);

--
-- Índices de tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_kills_ibfk_1` (`war_id`),
  ADD KEY `guild_kills_ibfk_2` (`death_id`),
  ADD KEY `guild_kills_ibfk_3` (`guild_id`);

--
-- Índices de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Índices de tabela `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Índices de tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Índices de tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`);

--
-- Índices de tabela `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

--
-- Índices de tabela `login_history`
--
ALTER TABLE `login_history`
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices de tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `mercadopagox`
--
ALTER TABLE `mercadopagox`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_mercado` (`id_mercado`);

--
-- Índices de tabela `monster_boost`
--
ALTER TABLE `monster_boost`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Índices de tabela `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `picpay`
--
ALTER TABLE `picpay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`ref`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`);

--
-- Índices de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `kill_id` (`kill_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_statements`
--
ALTER TABLE `player_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Índices de tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Índices de tabela `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Índices de tabela `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Índices de tabela `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`);

--
-- Índices de tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices de tabela `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `house_id` (`house_id`,`world_id`);

--
-- Índices de tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Índices de tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices de tabela `woe`
--
ALTER TABLE `woe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `z_featured_article`
--
ALTER TABLE `z_featured_article`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices de tabela `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_news_tickers`
--
ALTER TABLE `z_news_tickers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shop_history_pacc`
--
ALTER TABLE `z_shop_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_ticket`
--
ALTER TABLE `z_ticket`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1709;
--
-- AUTO_INCREMENT de tabela `auction_system`
--
ALTER TABLE `auction_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `comprovante`
--
ALTER TABLE `comprovante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
--
-- AUTO_INCREMENT de tabela `dtt_players`
--
ALTER TABLE `dtt_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de tabela `dtt_results`
--
ALTER TABLE `dtt_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `mercadopagox`
--
ALTER TABLE `mercadopagox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `monster_boost`
--
ALTER TABLE `monster_boost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT de tabela `paypal`
--
ALTER TABLE `paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT de tabela `picpay`
--
ALTER TABLE `picpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2192;
--
-- AUTO_INCREMENT de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `player_statements`
--
ALTER TABLE `player_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
