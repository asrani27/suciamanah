-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for suci
CREATE DATABASE IF NOT EXISTS `suci` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `suci`;

-- Dumping structure for table suci.jawaban
CREATE TABLE IF NOT EXISTS `jawaban` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `peserta_id` int(11) unsigned DEFAULT NULL,
  `soal_id` int(11) unsigned DEFAULT NULL,
  `jawaban` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `peserta_id_jawaban` (`peserta_id`) USING BTREE,
  KEY `soal_id_jawaban` (`soal_id`) USING BTREE,
  CONSTRAINT `jawaban_ibfk_1` FOREIGN KEY (`peserta_id`) REFERENCES `peserta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jawaban_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.jawaban: ~0 rows (approximately)
/*!40000 ALTER TABLE `jawaban` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawaban` ENABLE KEYS */;

-- Dumping structure for table suci.jurusan
CREATE TABLE IF NOT EXISTS `jurusan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.jurusan: ~6 rows (approximately)
/*!40000 ALTER TABLE `jurusan` DISABLE KEYS */;
INSERT INTO `jurusan` (`id`, `nama`, `kode`) VALUES
	(4, 'Teknik Komputer dan Jaringan', '002'),
	(5, 'Otomatisasi dan tata kelola perkantoran (OTKP)', '001'),
	(6, 'Akuntansi dan Keuangan Lembaga (AKL)', '003'),
	(8, 'Bisnis Konstruksi dan Properti', '004'),
	(9, 'Desain Permodelan dan Informasi Bangunan', '005'),
	(10, 'Tata Busana', '006');
/*!40000 ALTER TABLE `jurusan` ENABLE KEYS */;

-- Dumping structure for table suci.kajur
CREATE TABLE IF NOT EXISTS `kajur` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jurusan_id` int(11) DEFAULT NULL,
  `nama_kajur` varchar(255) DEFAULT NULL,
  `tgl_menjabat` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.kajur: ~6 rows (approximately)
/*!40000 ALTER TABLE `kajur` DISABLE KEYS */;
INSERT INTO `kajur` (`id`, `jurusan_id`, `nama_kajur`, `tgl_menjabat`) VALUES
	(3, 4, 'Sunito, S.Pd', '2019-02-01'),
	(4, 5, 'Cristanty, S.Pd', '2018-01-03'),
	(5, 6, 'Debora Anna, S.Pd', '2019-12-02'),
	(6, 8, 'Bagas, S.Pd', '2018-12-01'),
	(7, 9, 'Muhamad Abdi, S.Pd', '2019-12-04'),
	(8, 10, 'Sherina, S.Pd', '2020-05-02');
/*!40000 ALTER TABLE `kajur` ENABLE KEYS */;

-- Dumping structure for table suci.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.kategori: ~6 rows (approximately)
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` (`id`, `nama`) VALUES
	(2, 'OTKP'),
	(7, 'AKL'),
	(8, 'Teknik Komputer dan Jaringan'),
	(9, 'Bisnis Konstruksi dan Properti'),
	(10, 'Tata Busana'),
	(11, 'Desain Permodelan dan Informasi Bangunan');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;

-- Dumping structure for table suci.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table suci.peserta
CREATE TABLE IF NOT EXISTS `peserta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(255) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(11) unsigned DEFAULT NULL,
  `mulai` datetime DEFAULT NULL,
  `selesai` datetime DEFAULT NULL,
  `selesai_ujian` char(1) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `jkel` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `test` int(1) unsigned DEFAULT NULL,
  `nisn` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `alamat` text,
  `ayah` varchar(255) DEFAULT NULL,
  `ibu` varchar(255) DEFAULT NULL,
  `jurusan_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_peserta` (`user_id`) USING BTREE,
  CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.peserta: ~12 rows (approximately)
/*!40000 ALTER TABLE `peserta` DISABLE KEYS */;
INSERT INTO `peserta` (`id`, `nomor`, `nik`, `nama`, `telp`, `created_at`, `updated_at`, `user_id`, `mulai`, `selesai`, `selesai_ujian`, `tgl`, `jurusan`, `jkel`, `file`, `email`, `test`, `nisn`, `tgl_lahir`, `tempat_lahir`, `alamat`, `ayah`, `ibu`, `jurusan_id`) VALUES
	(55, NULL, '1234500000123456', 'Wahyu Pedana', NULL, '2022-06-19 14:02:02', '2022-06-19 14:02:02', NULL, NULL, NULL, NULL, '2003-12-01', NULL, 'L', NULL, NULL, NULL, '1001', NULL, 'murutuwu', 'murutuwu', 'Isur', 'Inur', 4),
	(56, NULL, '1234500000987655', 'Cintya', NULL, '2022-06-19 14:03:47', '2022-06-19 14:03:47', NULL, NULL, NULL, NULL, '2003-01-02', NULL, 'P', NULL, NULL, NULL, '1002', NULL, 'Muara Teweh', 'hayaping', 'gilbert', 'Sanisa', 4),
	(57, NULL, '1234500000457734', 'Sella', NULL, '2022-06-19 14:05:31', '2022-06-19 14:05:31', NULL, NULL, NULL, NULL, '2003-02-04', NULL, 'P', NULL, NULL, NULL, '1003', NULL, 'magantis', 'Magantis', 'Anto', 'Siti', 5),
	(58, NULL, '1234500000984236', 'Ira Handayani', NULL, '2022-06-19 14:07:11', '2022-06-19 14:07:11', NULL, NULL, NULL, NULL, '2003-02-02', NULL, 'P', NULL, NULL, NULL, '1005', NULL, 'Matabu', 'Matabu', 'Ijul', 'Imas', 5),
	(59, NULL, '1234500000453672', 'seril annisa', NULL, '2022-06-19 14:08:35', '2022-06-19 14:08:35', NULL, NULL, NULL, NULL, '2003-10-10', NULL, 'P', NULL, NULL, NULL, '1004', NULL, 'Buntok', 'Magantis', 'Ferdi', 'marisa', 6),
	(60, NULL, '1234500000123645', 'Fendi', NULL, '2022-06-19 14:11:42', '2022-06-19 14:11:42', NULL, NULL, NULL, NULL, '2003-03-03', NULL, 'L', NULL, NULL, NULL, '1006', NULL, 'Tamiang layang', 'Murutuwu', 'Faisal', 'Lisa', 6),
	(61, NULL, '1234500000986432', 'Fujianti', NULL, '2022-06-19 14:13:38', '2022-06-19 14:13:38', NULL, NULL, NULL, NULL, '2003-02-01', NULL, 'P', NULL, NULL, NULL, '1007', NULL, 'Matabu', 'Magantis', 'Fadli', 'Vanessa', 10),
	(62, NULL, '1234500000654783', 'Vanny', NULL, '2022-06-19 14:15:01', '2022-06-19 14:15:28', NULL, NULL, NULL, NULL, '2003-06-07', NULL, 'P', NULL, NULL, NULL, '1008', NULL, 'ampah', 'Tamiang layang', 'harto', 'mardiana', 9),
	(63, NULL, '1234500000587342', 'ishaq', NULL, '2022-06-19 14:16:56', '2022-06-19 14:16:56', NULL, NULL, NULL, NULL, '2003-11-02', NULL, 'L', NULL, NULL, NULL, '1009', NULL, 'kota baru', 'Magantis', 'karjo', 'jannah', 9),
	(64, NULL, '1234500000827457', 'Andi', NULL, '2022-06-19 14:18:24', '2022-06-19 14:18:24', NULL, NULL, NULL, NULL, '2003-05-09', NULL, 'L', NULL, NULL, NULL, '1010', NULL, 'Tauluh', 'Matabu', 'udin', 'maya', 10),
	(65, NULL, '1234500000539282', 'awaludin', NULL, '2022-06-19 14:20:25', '2022-06-19 14:20:25', NULL, NULL, NULL, NULL, '2003-09-10', NULL, 'L', NULL, NULL, NULL, '1011', NULL, 'Desa Dorong', 'Desa Dorong', 'saprudin', 'inar', 8),
	(66, NULL, '1234500000294657', 'Ferdy Gusro', NULL, '2022-06-19 14:22:07', '2022-06-19 14:22:07', NULL, NULL, NULL, NULL, '2004-03-04', NULL, 'L', NULL, NULL, NULL, '1012', NULL, 'Jakarta', 'tamiang layang', 'Frans Aditya', 'Febry', 8);
/*!40000 ALTER TABLE `peserta` ENABLE KEYS */;

-- Dumping structure for table suci.projur
CREATE TABLE IF NOT EXISTS `projur` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jurusan_id` int(11) DEFAULT NULL,
  `kajur_id` int(11) DEFAULT NULL,
  `deskripsi` text,
  `prospek` text,
  `prestasi` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.projur: ~6 rows (approximately)
/*!40000 ALTER TABLE `projur` DISABLE KEYS */;
INSERT INTO `projur` (`id`, `jurusan_id`, `kajur_id`, `deskripsi`, `prospek`, `prestasi`) VALUES
	(4, 4, 3, 'jurusan ini mempelajari tentang cara merakit komputer, melakukan pemeliharaan perangkat keras dan lunak, sampai memasang jaringan', '-', 'juara 2 tingkat provinsi'),
	(5, 5, 4, 'mempelajari segala jenis kegiatan perkantoran, mulai dari pembukuan, pengarsipan, hingga public relations', '-', '-'),
	(6, 6, 5, 'jurusan yang berhubungfan dengan angka dan hitung menghitung keuangan', '-', '-'),
	(7, 8, 6, 'jurusan yang mempelajari tentang bangunan, manajemen pelaksnaan bangunan, dan ilmu ukur tanah atau survey pemetaan', '-', '-'),
	(8, 9, 7, 'mempelajari dan mengasah keahlian teknik mengambar bangunan secara manualmaupun menggunakan software', '-', '-'),
	(9, 10, 8, 'mempelajari bidang pembuatan busana dalam pengelolaan dan penyelenggaraan usaha busana serta mampu berkompetisi dalam mengembangkan sikap profesional dalam bidang busana', '-', '-');
/*!40000 ALTER TABLE `projur` ENABLE KEYS */;

-- Dumping structure for table suci.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'superadmin', '2020-12-23 23:17:35', '2020-12-23 23:17:35'),
	(2, 'peserta', '2021-09-10 22:44:52', '2021-09-10 22:44:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table suci.role_users
CREATE TABLE IF NOT EXISTS `role_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `role_users_user_id_role_id_unique` (`user_id`,`role_id`) USING BTREE,
  KEY `role_users_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.role_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` (`user_id`, `role_id`) VALUES
	(1, 1),
	(56, 2);
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;

-- Dumping structure for table suci.soal
CREATE TABLE IF NOT EXISTS `soal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) unsigned DEFAULT NULL,
  `pertanyaan` text,
  `pil_a` text,
  `pil_b` text,
  `pil_c` text,
  `pil_d` text,
  `kunci` char(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kategori_id_soal` (`kategori_id`) USING BTREE,
  CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.soal: ~10 rows (approximately)
/*!40000 ALTER TABLE `soal` DISABLE KEYS */;
INSERT INTO `soal` (`id`, `kategori_id`, `pertanyaan`, `pil_a`, `pil_b`, `pil_c`, `pil_d`, `kunci`, `created_at`, `updated_at`) VALUES
	(103, 2, '<p>apa yang sesuai dengan jurusan OTKP?</p>', '<p>menjadi Admin pada suatu kantor</p>', '<p>membawa material bangunan</p>', '<p>mendesain bangunan</p>', '<p>menghitung uang</p>', 'A', '2022-06-19 14:25:17', '2022-06-19 14:25:17'),
	(104, 7, '<p>apa yang sesuai dengan Jurusan AKL.....</p>', '<p>mendata masyarakat</p>', '<p>menghitung keuangan</p>', '<p>menghitung lebar bangunan</p>', '<p>merakit komputer</p>', 'B', '2022-06-19 14:30:08', '2022-06-19 14:30:08'),
	(105, 8, '<p>berikut ini yang sesuai dengan jurusan TKJ</p>', '<p>menghitung banyak semen</p>', '<p>menghitung keuangan</p>', '<p>mengukur kain</p>', '<p>merakit dan menginstall software</p>', 'D', '2022-06-19 14:32:21', '2022-06-19 14:50:06'),
	(106, 9, '<p>berikut ini yang sesuai dengan jurusan ini adalah...</p>', '<p>peregangan sendi</p>', 'menghitung ukuran gedung', '<p>menghitung komposisi untuk membuat cor beton</p>', '<p>mengukur kain</p>', 'C', '2022-06-19 14:35:32', '2022-06-19 14:35:32'),
	(107, 10, 'yang sesuai jurusan tata busana adalah', '<p>mengetik 10 jari</p>', '<p>menghitung keuangan kantor</p>', '<p>merakit PC</p>', '<p>mengolah pola kain<br></p>', 'D', '2022-06-19 14:37:54', '2022-06-19 14:37:54'),
	(108, 11, '<p>apa yang sesuai dengan jurusan desain permodelan dan informasi bangunan....</p>', '<p>mendesain bangunan, merancang bangunan, membuat indah dilihat</p>', '<p>mencetak paving</p>', '<p>menginstall software komputer</p>', '<p>mendesain baju</p>', 'A', '2022-06-19 14:43:57', '2022-06-19 14:43:57'),
	(109, 2, 'apakah mengetik 10 jari itu penting untuk jurusan otkp?', '<p>ya, penting</p>', '<p>tidak</p>', '<p>tidak perlu</p>', '<p>bukan</p>', 'A', '2022-06-19 14:45:40', '2022-06-19 14:45:40'),
	(110, 8, 'yang termasuk dalam perangkat keras komputer', '<p>buku office</p>', '<p>gunting zigzag</p>', '<p>harddisk</p>', '<p>sekop</p>', 'C', '2022-06-19 14:47:40', '2022-06-19 14:47:40'),
	(111, 10, '<p>dalam tata busana penggaris untuk pola bahu berbentuk</p>', '<p>panjang</p>', '<p>bundar</p>', '<p>segitiga</p>', '<p>lurus dan berbentuk L</p>', 'D', '2022-06-19 14:52:08', '2022-06-19 14:52:08'),
	(112, 9, '<p>mengaduk semen akan lebih mudah jika menggunakan</p>', '<p>mesin molen</p>', '<p>sekop</p>', '<p>cangkul</p>', '<p>kuas</p>', 'A', '2022-06-19 14:53:25', '2022-06-19 14:53:25');
/*!40000 ALTER TABLE `soal` ENABLE KEYS */;

-- Dumping structure for table suci.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_username_unique` (`username`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'superadmin', NULL, 'superadmin', '2022-06-19 12:02:46', '$2y$10$EWvbqYJVXAtHOlyX/IR9bOQ7EvE2yQ05gBxZmiFX.BkUYiyo8XHtS', 'R46494xbqbqr3GathfEv2lbKtUSgkkj1Baz3rb3YCPiDmBYAu0vtZaCClt60', '2022-06-19 12:02:46', '2022-06-19 12:02:46'),
	(56, 'adi', NULL, '1111111111111111', '2022-06-19 12:04:56', '$2y$10$gBE4ghOjspJOMWCtwawtWe079UvWasJAtqqb.1IfxdoQpfXm4HO7u', 'HJXRjlcirtuH1n4nnNDvSzRx7xickUTZoUYtSyAnXVLna55K3hIoZfVkM09p', '2022-06-19 12:04:56', '2022-06-19 12:04:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table suci.waktu
CREATE TABLE IF NOT EXISTS `waktu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `durasi` int(11) unsigned DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table suci.waktu: ~1 rows (approximately)
/*!40000 ALTER TABLE `waktu` DISABLE KEYS */;
INSERT INTO `waktu` (`id`, `durasi`, `tanggal_mulai`, `tanggal_selesai`) VALUES
	(1, 525610, '2022-02-06 08:30:00', '2023-02-06 08:40:00');
/*!40000 ALTER TABLE `waktu` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
