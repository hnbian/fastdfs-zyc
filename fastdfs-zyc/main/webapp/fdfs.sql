/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.40.51
 Source Server Type    : MySQL
 Source Server Version : 50161
 Source Host           : 192.168.40.51
 Source Database       : fdfs

 Target Server Type    : MySQL
 Target Server Version : 50161
 File Encoding         : utf-8

 Date: 09/13/2012 16:33:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbdownloadfilerecord`
-- ----------------------------
DROP TABLE IF EXISTS `tbdownloadfilerecord`;
CREATE TABLE `tbdownloadfilerecord` (
  `id` varchar(255) NOT NULL,
  `accessCount` bigint(20) NOT NULL,
  `fileId` varchar(255) DEFAULT NULL,
  `src_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbdownloadfilerecord`
-- ----------------------------
BEGIN;
INSERT INTO `tbdownloadfilerecord` VALUES ('4028a8e739bd41140139bd420d2a0000', '2', '/group1/M00/00/00/wKgoM1BE2-WhZVKOAAEMrV4kDUM856.jpg', '192.168.40.50'), ('4028a8e739bd41140139bd4223230001', '4', '/group1/M00/00/00/wKgoM1BE1RTT_L6JAAFHsYiUkzI460.jpg', '192.168.40.50'), ('4028a8e739bd41140139bd4229ca0002', '2', '/group1/M00/00/00/wKgoMlBE1ReS6bpSAAE0lkXGXJQ206.gif', '192.168.40.50'), ('4028a8e739bd41140139bd422c2c0003', '4', '/group1/M00/00/00/wKgoM1BE2-WhZVKOAAEMrV4kDUM856.jpg', '192.168.40.51'), ('4028a8e739bd41140139bd422ff50004', '2', '/group1/M00/00/00/wKgoM1BE1RTT_L6JAAFHsYiUkzI460.jpg', '192.168.40.51'), ('4028a8e739bd41140139bd4230df0005', '2', '/group1/M00/00/00/wKgoM1BE1S2yZGp1AAEMrV4kDUM901.jpg', '192.168.40.51'), ('4028a8e739bd41140139bd4231c90006', '2', '/group1/M00/00/00/wKgoMlBE20HykjhaAAEMrV4kDUM163.jpg', '192.168.40.51'), ('4028a8e739bd41140139bd4232d30007', '2', '/group1/M00/00/00/wKgoMlBE3AyzjOQzAAAt9DxlN_c2498.js', '192.168.40.51'), ('4028a8e739bd41140139bd42342b0008', '2', '/group1/M00/00/00/wKgoM1BFT1zQQXs-AABVROEPP7A60.html', '192.168.40.51');
COMMIT;

-- ----------------------------
--  Table structure for `tbfile`
-- ----------------------------
DROP TABLE IF EXISTS `tbfile`;
CREATE TABLE `tbfile` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `MD5` varchar(255) DEFAULT NULL COMMENT 'md5',
  `article_id` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `file_id` varchar(255) DEFAULT NULL COMMENT '文件id 带group',
  `file_name` varchar(255) DEFAULT NULL COMMENT '原文件名',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `fileSize` bigint(20) NOT NULL COMMENT '大小',
  `fileDownLoadCount` int(11) NOT NULL COMMENT '下载次数',
  `srcIpAddr` varchar(255) DEFAULT NULL COMMENT '上传文件ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8

-- ----------------------------
--  Records of `tbfile`
-- ----------------------------
BEGIN;
INSERT INTO `tbfile` VALUES (1, '4c0a53d20a53b7046582930be20d97cb', NULL, '2012-09-04 00:05:08', 'group1/M00/00/00/wKgoM1BE1RTT_L6JAAFHsYiUkzI460.jpg', '5.jpg', 'jpg', '83889', '0', NULL),
(2, 'a013e0264420806db90c820ff6b5eeb8', NULL, '2012-09-04 00:05:30', 'group1/M00/00/00/wKgoMlBE1ReS6bpSAAE0lkXGXJQ206.gif', '20.gif', 'gif', '78998', '0', NULL),
(3, '1ad2d38acaaa14ea28cc70f9bd04b5a7', NULL, '2012-09-04 00:05:34', 'group1/M00/00/00/wKgoM1BE1S2yZGp1AAEMrV4kDUM901.jpg', '16.jpg', 'jpg', '68781', '0', NULL),
(4, '1ad2d38acaaa14ea28cc70f9bd04b5a7', NULL, '2012-09-04 00:31:47', 'group1/M00/00/00/wKgoMlBE20HykjhaAAEMrV4kDUM163.jpg', '16.jpg', 'jpg', '68781', '0', NULL),
(5, '1ad2d38acaaa14ea28cc70f9bd04b5a7', NULL, '2012-09-04 00:34:14', 'group1/M00/00/00/wKgoM1BE2-WhZVKOAAEMrV4kDUM856.jpg', '16.jpg', 'jpg', '68781', '0', NULL),
(6, '4804e397c748e20a55d14283d7861ab1', NULL, '2012-09-04 00:35:10', 'group1/M00/00/00/wKgoMlBE3AyzjOQzAAAt9DxlN_c2498.js', 'indexdata.js', 'js', '11764', '0', NULL),
(7, '4804e397c748e20a55d14283d7861ab1', NULL, '2012-09-04 00:35:22', 'group1/M00/00/00/wKgoM1BE3Cmi7KtBAAAt9DxlN_c5029.js', 'indexdata.js', 'js', '11764', '0', NULL),
(8, '6b49611b8b395edb89c04b8678b8c89b', NULL, '2012-09-04 00:35:57', 'group1/M00/00/00/wKgoMlBE3DqzzPsKAgHgUFnIGxg197.zip', 'bi.zip', 'zip', '33677392', '0', NULL),
(9, 'be5fa315cc1a442ea690d0d2570bf41e', NULL, '2012-09-04 00:40:02', 'group1/M00/00/00/wKgoM1BE3UKQ0EHHAAP3eJCErFg033.pdf', 'FastDFS.pdf', 'pdf', '259960', '0', NULL),
(10, 'be5fa315cc1a442ea690d0d2570bf41e', NULL, '2012-09-04 00:40:12', 'group1/M00/00/00/wKgoMlBE3TmRvGwKAAP3eJCErFg755.pdf', 'FastDFS.pdf', 'pdf', '259960', '0', NULL);

COMMIT;

-- ----------------------------
--  Table structure for `tbgroup`
-- ----------------------------
DROP TABLE IF EXISTS `tbgroup`;
CREATE TABLE `tbgroup` (
  `id` varchar(255) NOT NULL,
  `activeCount` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `currentTrunkFileId` int(11) NOT NULL,
  `currentWriteServer` int(11) NOT NULL,
  `freeMB` bigint(20) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `storageCount` int(11) NOT NULL,
  `storageHttpPort` int(11) NOT NULL,
  `storagePort` int(11) NOT NULL,
  `storePathCount` int(11) NOT NULL,
  `subdirCountPerPath` int(11) NOT NULL,
  `trunkFreeMB` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbgroupday`
-- ----------------------------
DROP TABLE IF EXISTS `tbgroupday`;
CREATE TABLE `tbgroupday` (
  `id` varchar(255) NOT NULL,
  `activeCount` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `currentTrunkFileId` int(11) NOT NULL,
  `currentWriteServer` int(11) NOT NULL,
  `freeMB` bigint(20) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `storageCount` int(11) NOT NULL,
  `storageHttpPort` int(11) NOT NULL,
  `storagePort` int(11) NOT NULL,
  `storePathCount` int(11) NOT NULL,
  `subdirCountPerPath` int(11) NOT NULL,
  `trunkFreeMB` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbgrouphour`
-- ----------------------------
DROP TABLE IF EXISTS `tbgrouphour`;
CREATE TABLE `tbgrouphour` (
  `id` varchar(255) NOT NULL,
  `activeCount` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `currentTrunkFileId` int(11) NOT NULL,
  `currentWriteServer` int(11) NOT NULL,
  `freeMB` bigint(20) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `storageCount` int(11) NOT NULL,
  `storageHttpPort` int(11) NOT NULL,
  `storagePort` int(11) NOT NULL,
  `storePathCount` int(11) NOT NULL,
  `subdirCountPerPath` int(11) NOT NULL,
  `trunkFreeMB` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbstorage`
-- ----------------------------
DROP TABLE IF EXISTS `tbstorage`;
CREATE TABLE `tbstorage` (
  `id` varchar(255) NOT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `curStatus` varchar(255) DEFAULT NULL,
  `currentWritePath` int(11) NOT NULL,
  `domainName` varchar(255) DEFAULT NULL,
  `freeMB` bigint(20) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `ifTrunkServer` tinyint(1) NOT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `lastHeartBeatTime` datetime DEFAULT NULL,
  `lastSourceUpdate` datetime DEFAULT NULL,
  `lastSyncUpdate` datetime DEFAULT NULL,
  `lastSyncedTimestamp` datetime DEFAULT NULL,
  `mem` float NOT NULL,
  `srcIpAddr` varchar(255) DEFAULT NULL,
  `storageHttpPort` int(11) NOT NULL,
  `storagePort` int(11) NOT NULL,
  `storePathCount` int(11) NOT NULL,
  `subdirCountPerPath` int(11) NOT NULL,
  `successAppendBytes` bigint(20) NOT NULL,
  `successAppendCount` bigint(20) NOT NULL,
  `successCreateLinkCount` bigint(20) NOT NULL,
  `successDeleteCount` bigint(20) NOT NULL,
  `successDeleteLinkCount` bigint(20) NOT NULL,
  `successDownloadCount` bigint(20) NOT NULL,
  `successDownloadloadBytes` bigint(20) NOT NULL,
  `successFileOpenCount` bigint(20) NOT NULL,
  `successFileReadCount` bigint(20) NOT NULL,
  `successFileWriteCount` bigint(20) NOT NULL,
  `successGetMetaCount` bigint(20) NOT NULL,
  `successModifyBytes` bigint(20) NOT NULL,
  `successModifyCount` bigint(20) NOT NULL,
  `successSetMetaCount` bigint(20) NOT NULL,
  `successSyncInBytes` bigint(20) NOT NULL,
  `successSyncOutBytes` bigint(20) NOT NULL,
  `successTruncateCount` bigint(20) NOT NULL,
  `successUploadBytes` bigint(20) NOT NULL,
  `successUploadCount` bigint(20) NOT NULL,
  `totalAppendBytes` bigint(20) NOT NULL,
  `totalAppendCount` bigint(20) NOT NULL,
  `totalCreateLinkCount` bigint(20) NOT NULL,
  `totalDeleteCount` bigint(20) NOT NULL,
  `totalDeleteLinkCount` bigint(20) NOT NULL,
  `totalDownloadCount` bigint(20) NOT NULL,
  `totalDownloadloadBytes` bigint(20) NOT NULL,
  `totalFileOpenCount` bigint(20) NOT NULL,
  `totalFileReadCount` bigint(20) NOT NULL,
  `totalFileWriteCount` bigint(20) NOT NULL,
  `totalGetMetaCount` bigint(20) NOT NULL,
  `totalMB` bigint(20) NOT NULL,
  `totalModifyBytes` bigint(20) NOT NULL,
  `totalModifyCount` bigint(20) NOT NULL,
  `totalSetMetaCount` bigint(20) NOT NULL,
  `totalSyncInBytes` bigint(20) NOT NULL,
  `totalSyncOutBytes` bigint(20) NOT NULL,
  `totalTruncateCount` bigint(20) NOT NULL,
  `totalUploadBytes` bigint(20) NOT NULL,
  `totalUploadCount` bigint(20) NOT NULL,
  `upTime` datetime DEFAULT NULL,
  `uploadPriority` int(11) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK82E5BC4D222966B3` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbstorageday`
-- ----------------------------
DROP TABLE IF EXISTS `tbstorageday`;
CREATE TABLE `tbstorageday` (
  `id` varchar(255) NOT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `curStatus` varchar(255) DEFAULT NULL,
  `currentWritePath` int(11) NOT NULL,
  `domainName` varchar(255) DEFAULT NULL,
  `freeMB` bigint(20) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `ifTrunkServer` tinyint(1) NOT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `lastHeartBeatTime` datetime DEFAULT NULL,
  `lastSourceUpdate` datetime DEFAULT NULL,
  `lastSyncUpdate` datetime DEFAULT NULL,
  `lastSyncedTimestamp` datetime DEFAULT NULL,
  `mem` float NOT NULL,
  `srcIpAddr` varchar(255) DEFAULT NULL,
  `storageHttpPort` int(11) NOT NULL,
  `storagePort` int(11) NOT NULL,
  `storePathCount` int(11) NOT NULL,
  `subdirCountPerPath` int(11) NOT NULL,
  `successAppendBytes` bigint(20) NOT NULL,
  `successAppendCount` bigint(20) NOT NULL,
  `successCreateLinkCount` bigint(20) NOT NULL,
  `successDeleteCount` bigint(20) NOT NULL,
  `successDeleteLinkCount` bigint(20) NOT NULL,
  `successDownloadCount` bigint(20) NOT NULL,
  `successDownloadloadBytes` bigint(20) NOT NULL,
  `successFileOpenCount` bigint(20) NOT NULL,
  `successFileReadCount` bigint(20) NOT NULL,
  `successFileWriteCount` bigint(20) NOT NULL,
  `successGetMetaCount` bigint(20) NOT NULL,
  `successModifyBytes` bigint(20) NOT NULL,
  `successModifyCount` bigint(20) NOT NULL,
  `successSetMetaCount` bigint(20) NOT NULL,
  `successSyncInBytes` bigint(20) NOT NULL,
  `successSyncOutBytes` bigint(20) NOT NULL,
  `successTruncateCount` bigint(20) NOT NULL,
  `successUploadBytes` bigint(20) NOT NULL,
  `successUploadCount` bigint(20) NOT NULL,
  `totalAppendBytes` bigint(20) NOT NULL,
  `totalAppendCount` bigint(20) NOT NULL,
  `totalCreateLinkCount` bigint(20) NOT NULL,
  `totalDeleteCount` bigint(20) NOT NULL,
  `totalDeleteLinkCount` bigint(20) NOT NULL,
  `totalDownloadCount` bigint(20) NOT NULL,
  `totalDownloadloadBytes` bigint(20) NOT NULL,
  `totalFileOpenCount` bigint(20) NOT NULL,
  `totalFileReadCount` bigint(20) NOT NULL,
  `totalFileWriteCount` bigint(20) NOT NULL,
  `totalGetMetaCount` bigint(20) NOT NULL,
  `totalMB` bigint(20) NOT NULL,
  `totalModifyBytes` bigint(20) NOT NULL,
  `totalModifyCount` bigint(20) NOT NULL,
  `totalSetMetaCount` bigint(20) NOT NULL,
  `totalSyncInBytes` bigint(20) NOT NULL,
  `totalSyncOutBytes` bigint(20) NOT NULL,
  `totalTruncateCount` bigint(20) NOT NULL,
  `totalUploadBytes` bigint(20) NOT NULL,
  `totalUploadCount` bigint(20) NOT NULL,
  `upTime` datetime DEFAULT NULL,
  `uploadPriority` int(11) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAC95482F4CFC637F` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbstoragehour`
-- ----------------------------
DROP TABLE IF EXISTS `tbstoragehour`;
CREATE TABLE `tbstoragehour` (
  `id` varchar(255) NOT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `curStatus` varchar(255) DEFAULT NULL,
  `currentWritePath` int(11) NOT NULL,
  `domainName` varchar(255) DEFAULT NULL,
  `freeMB` bigint(20) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `ifTrunkServer` tinyint(1) NOT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `lastHeartBeatTime` datetime DEFAULT NULL,
  `lastSourceUpdate` datetime DEFAULT NULL,
  `lastSyncUpdate` datetime DEFAULT NULL,
  `lastSyncedTimestamp` datetime DEFAULT NULL,
  `mem` float NOT NULL,
  `srcIpAddr` varchar(255) DEFAULT NULL,
  `storageHttpPort` int(11) NOT NULL,
  `storagePort` int(11) NOT NULL,
  `storePathCount` int(11) NOT NULL,
  `subdirCountPerPath` int(11) NOT NULL,
  `successAppendBytes` bigint(20) NOT NULL,
  `successAppendCount` bigint(20) NOT NULL,
  `successCreateLinkCount` bigint(20) NOT NULL,
  `successDeleteCount` bigint(20) NOT NULL,
  `successDeleteLinkCount` bigint(20) NOT NULL,
  `successDownloadCount` bigint(20) NOT NULL,
  `successDownloadloadBytes` bigint(20) NOT NULL,
  `successFileOpenCount` bigint(20) NOT NULL,
  `successFileReadCount` bigint(20) NOT NULL,
  `successFileWriteCount` bigint(20) NOT NULL,
  `successGetMetaCount` bigint(20) NOT NULL,
  `successModifyBytes` bigint(20) NOT NULL,
  `successModifyCount` bigint(20) NOT NULL,
  `successSetMetaCount` bigint(20) NOT NULL,
  `successSyncInBytes` bigint(20) NOT NULL,
  `successSyncOutBytes` bigint(20) NOT NULL,
  `successTruncateCount` bigint(20) NOT NULL,
  `successUploadBytes` bigint(20) NOT NULL,
  `successUploadCount` bigint(20) NOT NULL,
  `totalAppendBytes` bigint(20) NOT NULL,
  `totalAppendCount` bigint(20) NOT NULL,
  `totalCreateLinkCount` bigint(20) NOT NULL,
  `totalDeleteCount` bigint(20) NOT NULL,
  `totalDeleteLinkCount` bigint(20) NOT NULL,
  `totalDownloadCount` bigint(20) NOT NULL,
  `totalDownloadloadBytes` bigint(20) NOT NULL,
  `totalFileOpenCount` bigint(20) NOT NULL,
  `totalFileReadCount` bigint(20) NOT NULL,
  `totalFileWriteCount` bigint(20) NOT NULL,
  `totalGetMetaCount` bigint(20) NOT NULL,
  `totalMB` bigint(20) NOT NULL,
  `totalModifyBytes` bigint(20) NOT NULL,
  `totalModifyCount` bigint(20) NOT NULL,
  `totalSetMetaCount` bigint(20) NOT NULL,
  `totalSyncInBytes` bigint(20) NOT NULL,
  `totalSyncOutBytes` bigint(20) NOT NULL,
  `totalTruncateCount` bigint(20) NOT NULL,
  `totalUploadBytes` bigint(20) NOT NULL,
  `totalUploadCount` bigint(20) NOT NULL,
  `upTime` datetime DEFAULT NULL,
  `uploadPriority` int(11) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE615C3B1C92024B7` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbuser`
-- ----------------------------
DROP TABLE IF EXISTS `tbuser`;
CREATE TABLE `tbuser` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `psword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbuser`
-- ----------------------------
BEGIN;
INSERT INTO `tbuser` VALUES ('4028a809398b076901398b0d0b070020', 'admin', '2', '123456'), ('4028a80939beb9000139bebebaeb001e', '123456', '1', '123456');
COMMIT;

-- ----------------------------
--  Table structure for `tbwarningdata`
-- ----------------------------
DROP TABLE IF EXISTS `tbwarningdata`;
CREATE TABLE `tbwarningdata` (
  `id` varchar(255) NOT NULL,
  `wdCpu` varchar(255) DEFAULT NULL,
  `wdFreeMB` bigint(20) NOT NULL,
  `wdGroupName` varchar(255) DEFAULT NULL,
  `wdIpAddr` varchar(255) DEFAULT NULL,
  `wdMem` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbwarningdata`
-- ----------------------------
BEGIN;
INSERT INTO `tbwarningdata` VALUES ('4028a8e7399e94eb01399e9897cd0015', '3', '5', null, '192.168.40.53', '3'), ('4028a8e7399e94eb01399e98706f0014', '3', '45450', null, '192.168.40.51', '3');
COMMIT;

-- ----------------------------
--  Table structure for `tbwarninguser`
-- ----------------------------
DROP TABLE IF EXISTS `tbwarninguser`;
CREATE TABLE `tbwarninguser` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbwarninguser`
-- ----------------------------
BEGIN;
INSERT INTO `tbwarninguser` VALUES ('ff80808139b3345d0139b405791e048f', 'jing.zhang@vivame.cn', '张静', '999999999999999999999999');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
