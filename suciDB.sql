/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : ujianonline

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 19/06/2022 12:10:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jawaban
-- ----------------------------
DROP TABLE IF EXISTS `jawaban`;
CREATE TABLE `jawaban`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `peserta_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `soal_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `jawaban` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peserta_id_jawaban`(`peserta_id`) USING BTREE,
  INDEX `soal_id_jawaban`(`soal_id`) USING BTREE,
  CONSTRAINT `jawaban_ibfk_1` FOREIGN KEY (`peserta_id`) REFERENCES `peserta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jawaban_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jawaban
-- ----------------------------
INSERT INTO `jawaban` VALUES (6, 54, 101, 'A', '2022-06-19 12:04:42', '2022-06-19 12:04:42');
INSERT INTO `jawaban` VALUES (7, 54, 102, 'C', '2022-06-19 12:04:45', '2022-06-19 12:04:45');

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'AKUNTANSI', '001');
INSERT INTO `jurusan` VALUES (2, 'MANAJEMEN', '002');

-- ----------------------------
-- Table structure for kajur
-- ----------------------------
DROP TABLE IF EXISTS `kajur`;
CREATE TABLE `kajur`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jurusan_id` int(11) NULL DEFAULT NULL,
  `nama_kajur` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_menjabat` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kajur
-- ----------------------------
INSERT INTO `kajur` VALUES (2, 2, 'dsgfdgfh', '2022-06-01');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (2, 'Kewarganegaraan');
INSERT INTO `kategori` VALUES (3, 'Bahasa Indonesia');
INSERT INTO `kategori` VALUES (5, 'Matematika');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for peserta
-- ----------------------------
DROP TABLE IF EXISTS `peserta`;
CREATE TABLE `peserta`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(11) UNSIGNED NULL DEFAULT NULL,
  `mulai` datetime NULL DEFAULT NULL,
  `selesai` datetime NULL DEFAULT NULL,
  `selesai_ujian` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl` date NULL DEFAULT NULL,
  `jurusan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jkel` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `test` int(1) UNSIGNED NULL DEFAULT NULL,
  `nisn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ayah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ibu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jurusan_id` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_peserta`(`user_id`) USING BTREE,
  CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of peserta
-- ----------------------------
INSERT INTO `peserta` VALUES (54, NULL, '1111111111111111', 'adi1', NULL, '2022-06-19 10:48:44', '2022-06-19 12:04:50', 56, NULL, NULL, '1', '2022-06-13', NULL, 'L', NULL, NULL, NULL, '2221', NULL, 'kjh1', 'hkb1', 'Aldi1', 'Siti1', 2);

-- ----------------------------
-- Table structure for projur
-- ----------------------------
DROP TABLE IF EXISTS `projur`;
CREATE TABLE `projur`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jurusan_id` int(11) NULL DEFAULT NULL,
  `kajur_id` int(11) NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `prospek` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `prestasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projur
-- ----------------------------
INSERT INTO `projur` VALUES (4, 2, 2, '1', '1', '1');
INSERT INTO `projur` VALUES (5, 1, 2, 'sdf', 'dfg', 'gh');

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  UNIQUE INDEX `role_users_user_id_role_id_unique`(`user_id`, `role_id`) USING BTREE,
  INDEX `role_users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_users
-- ----------------------------
INSERT INTO `role_users` VALUES (1, 1);
INSERT INTO `role_users` VALUES (56, 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'superadmin', '2020-12-23 23:17:35', '2020-12-23 23:17:35');
INSERT INTO `roles` VALUES (2, 'peserta', '2021-09-10 22:44:52', '2021-09-10 22:44:52');

-- ----------------------------
-- Table structure for soal
-- ----------------------------
DROP TABLE IF EXISTS `soal`;
CREATE TABLE `soal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `pertanyaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pil_a` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pil_b` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pil_c` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pil_d` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kunci` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kategori_id_soal`(`kategori_id`) USING BTREE,
  CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of soal
-- ----------------------------
INSERT INTO `soal` VALUES (101, 5, '<p>10 - 9 =</p>', '<p>1</p>', '<p>2</p>', '<p>3</p>', '<p>4</p>', 'A', '2022-06-19 12:02:07', '2022-06-19 12:02:07');
INSERT INTO `soal` VALUES (102, 5, '<p>10 * 2 sama dengan</p>', '<p>20</p>', '<p>30</p>', '<p>40</p>', '<p>50</p>', 'A', '2022-06-19 12:02:34', '2022-06-19 12:02:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'superadmin', NULL, 'superadmin', '2022-06-19 12:02:46', '$2y$10$EWvbqYJVXAtHOlyX/IR9bOQ7EvE2yQ05gBxZmiFX.BkUYiyo8XHtS', 'R46494xbqbqr3GathfEv2lbKtUSgkkj1Baz3rb3YCPiDmBYAu0vtZaCClt60', '2022-06-19 12:02:46', '2022-06-19 12:02:46');
INSERT INTO `users` VALUES (56, 'adi', NULL, '1111111111111111', '2022-06-19 12:04:56', '$2y$10$gBE4ghOjspJOMWCtwawtWe079UvWasJAtqqb.1IfxdoQpfXm4HO7u', 'HJXRjlcirtuH1n4nnNDvSzRx7xickUTZoUYtSyAnXVLna55K3hIoZfVkM09p', '2022-06-19 12:04:56', '2022-06-19 12:04:56');

-- ----------------------------
-- Table structure for waktu
-- ----------------------------
DROP TABLE IF EXISTS `waktu`;
CREATE TABLE `waktu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `durasi` int(11) UNSIGNED NULL DEFAULT NULL,
  `tanggal_mulai` datetime NULL DEFAULT NULL,
  `tanggal_selesai` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of waktu
-- ----------------------------
INSERT INTO `waktu` VALUES (1, 525610, '2022-02-06 08:30:00', '2023-02-06 08:40:00');

SET FOREIGN_KEY_CHECKS = 1;
