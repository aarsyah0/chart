-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2024 pada 17.47
-- Versi server: 8.1.0
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_wsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `added_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(1, 5, 14, 3, '2024-11-18 04:42:26'),
(2, 5, 11, 6, '2024-11-06 04:43:17'),
(3, 5, 43, 12, '2024-11-23 10:28:53'),
(4, 2, 31, 1, '2024-11-23 11:35:05'),
(5, 2, 41, 1, '2024-11-23 11:35:29'),
(6, 2, 42, 1, '2024-11-23 11:35:31'),
(7, 2, 40, 1, '2024-11-23 11:35:35'),
(8, 3, 1, 1, '2024-11-24 23:51:02'),
(9, 3, 7, 2, '2024-11-25 01:38:31'),
(10, 3, 34, 2, '2024-11-25 03:43:44'),
(11, 3, 31, 3, '2024-11-25 03:48:40'),
(12, 3, 23, 2, '2024-11-25 03:49:46'),
(14, 3, 25, 1, '2024-11-25 03:51:00'),
(16, 3, 19, 5, '2024-11-25 03:55:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Kecil'),
(2, 'Sedang'),
(3, 'Besar'),
(4, 'Jumbo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `favorite_products`
--

CREATE TABLE `favorite_products` (
  `favorite_products_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `favorite_products`
--

INSERT INTO `favorite_products` (`favorite_products_id`, `user_id`, `product_id`) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 7),
(4, 5, 9),
(5, 5, 47),
(6, 5, 46),
(7, 5, 45),
(8, 5, 44),
(9, 5, 39),
(10, 5, 38),
(11, 2, 31),
(12, 2, 44),
(13, 2, 37),
(14, 2, 25),
(15, 3, 1),
(16, 3, 5),
(17, 3, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `level_detail`
--

CREATE TABLE `level_detail` (
  `level_id` tinyint NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `level_detail`
--

INSERT INTO `level_detail` (`level_id`, `level`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `status`, `order_date`) VALUES
(1, 1, 100000.00, 'Completed', '2023-01-15'),
(2, 2, 200000.00, 'Completed', '2023-02-15'),
(3, 3, 900000.00, 'Completed', '2023-03-20'),
(4, 4, 500000.00, 'Completed', '2023-04-10'),
(5, 5, 500000.00, 'Completed', '2023-05-05'),
(6, 1, 800000.00, 'Completed', '2023-06-15'),
(7, 2, 200000.00, 'Completed', '2023-07-10'),
(8, 3, 220000.00, 'Completed', '2023-08-20'),
(9, 4, 250000.00, 'Completed', '2023-09-12'),
(10, 5, 270000.00, 'Completed', '2023-10-10'),
(11, 1, 300000.00, 'Completed', '2023-11-01'),
(12, 2, 320000.00, 'Completed', '2023-12-15'),
(13, 3, 270000.00, 'Completed', '2024-01-10'),
(14, 4, 140000.00, 'Completed', '2024-02-22'),
(15, 5, 170000.00, 'Completed', '2024-03-13'),
(16, 1, 300000.00, 'Completed', '2024-04-05'),
(17, 2, 240000.00, 'Completed', '2024-05-25'),
(18, 3, 325000.00, 'Completed', '2024-06-11'),
(19, 4, 320000.00, 'Completed', '2024-07-15'),
(20, 5, 400000.00, 'Completed', '2024-08-19'),
(21, 1, 450000.00, 'Completed', '2024-09-12'),
(22, 2, 500000.00, 'Completed', '2024-10-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 7, 1),
(2, 1, 28, 2),
(3, 1, 6, 2),
(4, 2, 29, 5),
(5, 2, 40, 2),
(7, 3, 32, 20),
(8, 3, 37, 10),
(9, 3, 36, 10),
(10, 4, 34, 4),
(11, 5, 34, 4),
(12, 6, 18, 32),
(13, 7, 40, 4),
(14, 8, 29, 11),
(15, 9, 34, 2),
(16, 10, 3, 15),
(17, 11, 7, 10),
(18, 12, 6, 16),
(19, 13, 28, 6),
(20, 13, 32, 6),
(21, 13, 46, 3),
(22, 14, 6, 7),
(23, 15, 11, 10),
(24, 16, 6, 5),
(25, 16, 40, 4),
(26, 17, 8, 20),
(27, 18, 32, 16),
(28, 19, 6, 16),
(29, 20, 18, 16),
(30, 21, 18, 18),
(31, 22, 34, 1),
(32, 22, 42, 5),
(33, 22, 2, 5),
(34, 22, 18, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock`, `category_id`, `image_url`) VALUES
(1, 'Aurora Weave', 'Aurora Weave adalah sebuah keranjang multifungsi dengan desain anyaman yang memukau. Keranjang ini memiliki kombinasi warna ungu, merah muda, dan krem yang harmonis. Dengan pegangan transparan yang kokoh, Aurora Weave tidak hanya praktis untuk digunakan sehari-hari, tetapi juga menambah sentuhan estetika pada gayamu. Ukurannya yang jumbo membuatnya ideal untuk membawa berbagai barang, mulai dari belanjaan hingga perlengkapan piknik.', 27000.00, 29, 2, 'aurora-weave.jpg'),
(2, 'Azure Checkered Carryall', 'Azure Checkered Carryall adalah keranjang dengan desain yang unik dan menarik. Produk ini memiliki pola anyaman kotak-kotak berwarna biru dan putih yang memberikan kesan modern dan stylish. Dilengkapi dengan dua pegangan yang kuat dan nyaman, produk ini cocok untuk digunakan dalam berbagai kesempatan, baik untuk berbelanja, piknik, atau sekadar jalan-jalan. Penutup kancing di bagian atas membuat barang-barang di dalamnya tetap aman. Azure Checkered Carryall adalah pilihan sempurna bagi mereka yang mencari kombinasi antara fungsi dan gaya.', 25000.00, 26, 2, 'azure-checkered-carryall 1.jpg,azure-checkered-carryall 2.jpg'),
(3, 'Azure Woven', 'Azure Woven adalah produk kerajinan tangan yang dibuat dengan teknik anyaman menggunakan bahan plastik berwarna biru dan abu-abu. Produk ini memiliki desain kotak-kotak yang rapi dan simetris, dengan pegangan yang kuat dan nyaman untuk dibawa. Azure Woven cocok digunakan untuk berbagai keperluan sehari-hari seperti berbelanja atau membawa barang-barang pribadi. Desainnya yang unik dan warna yang menarik membuatnya menjadi pilihan yang stylish dan fungsional.', 18000.00, 21, 2, 'azure-woven.jpg'),
(4, 'Blooming Elegance', 'Blooming Elegance adalah sebuah keranjang tangan yang terbuat dari anyaman putih dengan desain yang elegan dan artistik. Keranjang ini dihiasi dengan motif bunga tulip berwarna-warni yang indah, serta beberapa kupu-kupu yang menambah kesan alami dan segar. Pegangan keranjang ini terbuat dari anyaman yang kuat dan nyaman untuk digenggam. Cocok untuk digunakan dalam berbagai kesempatan, baik untuk berbelanja, piknik, atau sekadar berjalan-jalan santai.', 32000.00, 15, 2, 'blooming-elegance.jpg'),
(5, 'Cane Checkerboard', 'Cane Checkerboard adalah keranjang serbaguna dengan desain kotak-kotak yang elegan dalam kombinasi warna coklat muda dan coklat tua. Keranjang ini dilengkapi dengan pegangan melingkar transparan yang nyaman untuk dibawa. Ukurannya yang cukup besar membuatnya ideal untuk berbagai keperluan seperti berbelanja atau piknik. Selain fungsional, desainnya yang stylish membuat kamu bisa membawa barang-barangmu dengan gaya.', 18000.00, 27, 3, 'cane-checkerboard.jpg'),
(6, 'Cembung Basket', 'Cembung Basket adalah keranjang multifungsi dengan pola kotak-kotak berwarna coklat dan krem. Keranjang ini memiliki dua pegangan melingkar yang kuat dan nyaman untuk memudahkan pengangkutan. Desainnya yang cembung memberikan kapasitas penyimpanan yang lebih besar, cocok untuk menyimpan berbagai barang rumah tangga seperti mainan, pakaian, atau peralatan lainnya. Keranjang ini tidak hanya praktis tetapi juga menambah estetika ruangan dengan tampilannya yang modern dan elegan.', 20000.00, 20, 3, 'cembung-basket-1.jpg,cembung-basket-2.jpg'),
(7, 'Charm Of Flamingo', 'Tas anyaman berwarna putih ini memiliki dua gambar flamingo merah muda yang tercetak di bagian depan. Tas ini dilengkapi dengan dua pegangan dan simpul dekoratif di bagian atas tengah. Latar belakang foto ini adalah dinding berpanel putih, dan tas tersebut diletakkan di atas alas anyaman bundar.', 30000.00, 12, 2, 'charm-of-flamingo.jpg'),
(8, 'Checker Elegance', 'Checker Elegance adalah aksesori bergaya klasik dengan motif kotak-kotak yang elegan, berwarna merah dan putih. Dilengkapi dengan dua pegangan melengkung yang kuat, item ini cocok untuk berbagai keperluan penyimpanan di rumah. Terbuat dari bahan plastik berkualitas tinggi, desain anyamannya tidak hanya menarik secara visual tetapi juga memberikan kekuatan dan daya tahan ekstra. Dengan kapasitas yang luas, Checker Elegance bisa digunakan untuk menyimpan mainan, pakaian, atau barang-barang lainnya, membuatnya menjadi pilihan praktis sekaligus stylish untuk menjaga kerapian rumah Anda.', 12000.00, 45, 3, 'checker-elegance.jpg'),
(9, 'Checker Hitam Putih', 'Tas dengan desain kotak-kotak hitam putih yang mencolok. Terbuat dari bahan anyaman, tas ini memiliki pegangan bundar unik dan kancing dekoratif di bagian atas. Terlihat kokoh dan stylish, cocok untuk penggunaan sehari-hari atau acara kasual.', 35000.00, 30, 3, 'checker-hitam-putih.jpg'),
(10, 'Cultural Carryall', 'Cultural Carryall adalah keranjang tangan yang elegan dan klasik, dibuat dengan teknik anyaman tradisional. Memiliki pola kotak-kotak dengan kombinasi warna coklat dan hitam, keranjang ini dilengkapi dengan pegangan transparan yang kuat dan nyaman. Cocok digunakan untuk berbagai keperluan sehari-hari, baik untuk berbelanja, bekerja, maupun acara santai. Desainnya yang unik dan artistik menjadikannya pilihan yang menarik bagi mereka yang menghargai seni dan budaya lokal.', 21000.00, 8, 2, 'cultural-carryall.jpg'),
(11, 'Diagonal Cekung Jember', 'Diagonal Slim Jember adalah keranjang multifungsi dengan desain modern dan elegan. Keranjang ini memiliki pegangan berwarna biru yang nyaman dan kuat, serta motif \"I ❤️ Jember\" yang menarik di bagian depan, lengkap dengan hiasan warna-warni yang mencerminkan keceriaan. Cocok untuk digunakan sebagai tempat penyimpanan atau aksesori fashion yang unik.', 17000.00, 25, 2, 'diagonal-cekung-jember.jpg'),
(12, 'Diagonal Chic Tote', 'Diagonal Chic Tote adalah tas tangan yang elegan dan unik dengan desain anyaman diagonal yang memadukan warna abu-abu, putih, dan oranye. Tas ini memiliki dua pegangan yang kuat dan nyaman. Desainnya yang menarik dan modern membuatnya cocok untuk berbagai kesempatan, baik untuk acara santai maupun formal. Tas ini juga dilengkapi dengan penutup anyaman yang aman, memastikan barang-barang di dalamnya tetap terlindungi. Dengan kapasitas yang cukup luas, Diagonal Chic Tote adalah pilihan sempurna untuk membawa barang-barang sehari-hari dengan gaya.', 33000.00, 23, 2, 'diagonal-chic-tote-1.jpg,diagonal-chic-tote-2.jpg'),
(13, 'Diagonal Slim Jember', 'Diagonal Slim Jember adalah keranjang multifungsi dengan desain modern dan elegan. Keranjang ini memiliki pegangan berwarna pink yang nyaman dan kuat, serta motif \"I ❤️ Jember\" yang menarik di bagian depan, lengkap dengan hiasan warna-warni yang mencerminkan keceriaan. Cocok untuk digunakan sebagai tempat penyimpanan atau aksesori fashion yang unik.', 17000.00, 25, 2, 'diagonal-slim-jember.jpg'),
(14, 'Eco Carryall', 'Eco Carryall adalah produk ramah lingkungan yang terbuat dari bahan daur ulang berkualitas tinggi. Desainnya yang elegan dan modern menampilkan pola anyaman yang rapi dan kuat, memberikan daya tahan yang luar biasa. Dilengkapi dengan pegangan transparan yang nyaman, Eco Carryall sangat cocok untuk digunakan dalam berbagai kesempatan, baik untuk berbelanja, piknik, atau kegiatan sehari-hari. Logo RS Paru Jember yang tercetak di bagian depan menambah nilai estetika sekaligus menunjukkan dukungan terhadap layanan kesehatan. Slogan \"Melayani dengan Hati\" mencerminkan komitmen terhadap pelayanan yang penuh kasih.', 13000.00, 10, 2, 'eco-carryall.jpg'),
(15, 'Eid Celebration Hamper', 'Eid Celebration Hamper adalah keranjang hadiah yang sempurna untuk merayakan Hari Raya Idul Fitri. Keranjang ini memiliki desain yang elegan serta dilengkapi dengan pita dan kartu ucapan \"Selamat Hari Raya Idul Fitri 1445 H\". Keranjang ini sangat cocok untuk diberikan kepada keluarga, teman, atau kolega sebagai tanda kasih dan kebersamaan di hari yang suci ini.', 18000.00, 7, 3, 'eid-celebration-hamper.jpg'),
(16, 'Geometric Metro Chic', 'Tas anyaman dengan warna hitam dan krem ini memiliki desain kotak-kotak dan motif geometris di bagian tengah. Tas ini dilengkapi dengan dua tali pegangan yang panjang dan kuat, serta kancing anyaman di bagian atas. Tas yang elegan ini cocok untuk berbagai kesempatan, dari kegiatan sehari-hari hingga acara khusus.', 23000.00, 18, 3, 'geometric-metro-chic.jpg'),
(17, 'Hijabi Collection', 'Serenity Weave adalah sebuah keranjang anyaman yang elegan dengan desain yang unik dan menarik. Keranjang ini memiliki pegangan panjang berwarna merah muda yang dikepang, memberikan sentuhan feminin dan lembut. Bagian badan keranjang terbuat dari anyaman plastik berwarna putih dengan aksen merah muda, menciptakan pola yang harmonis dan estetis. Di bagian depan keranjang, terdapat gambar seorang wanita berhijab yang sedang berjalan, membawa tas kecil di tangannya. Gambar ini memberikan kesan artistik dan personal pada keranjang. Size 25 x 5 x 26.', 30000.00, 10, 2, 'hijabi-collection-1.jpg,hijabi-collection-2.jpg,hijabi-collection-3.jpg'),
(18, 'Jali Abu Mini', 'Jali Abu Mini adalah keranjang tangan yang elegan dengan desain anyaman yang rapi dan modern. Keranjang ini memiliki pola kotak-kotak dengan kombinasi warna abu-abu dan putih yang menawan. Pegangan yang melingkar memberikan sentuhan klasik sekaligus memudahkan untuk dibawa. Cocok untuk berbagai kesempatan, baik untuk acara santai maupun formal. Keranjang ini juga dilengkapi dengan penutup anyaman yang unik, menambah keamanan dan estetika. Ideal untuk menyimpan barang-barang kecil atau sebagai aksesori fashion yang stylish.', 25000.00, 20, 1, 'jali-abu-mini.jpg'),
(19, 'Jali Mutiara', 'Produk ini adalah tas anyaman berwarna merah muda dengan pegangan yang terbuat dari manik-manik transparan. Tas ini memiliki motif kotak-kotak kecil berwarna-warni di bagian depan, termasuk warna putih, hijau, ungu, abu-abu, kuning, oranye, biru, coklat, dan merah. Tas ini dipajang di atas meja bundar dengan latar belakang dinding putih berpanel.', 35000.00, 38, 3, 'jali-mutiara.jpg'),
(20, 'Jali Rainbow Yellow', 'Jali Rainbow Yellow adalah sebuah keranjang tangan yang menawan dengan desain anyaman warna-warni yang ceria. Keranjang ini memiliki pegangan berwarna kuning cerah yang terbuat dari bahan yang kuat dan nyaman digenggam. Anyaman keranjang ini terdiri dari kombinasi warna pastel seperti kuning, putih, biru, hijau, dan ungu, menciptakan tampilan yang segar dan menarik. Cocok untuk digunakan dalam berbagai kesempatan, baik untuk berbelanja, piknik, atau sekadar jalan-jalan santai. Keranjang ini tidak hanya fungsional tetapi juga menambah sentuhan gaya pada penampilan kamu.', 45000.00, 45, 2, 'jali-rainbow-yellow.jpg'),
(21, 'Jember Embroidery Canvas', 'Jember Embroidery Canvas adalah produk berkualitas tinggi yang menampilkan desain bordir unik dan menarik. Dilengkapi dengan tali panjang yang nyaman, produk ini sangat praktis untuk dibawa ke mana saja. Di bagian depannya terdapat bordiran dengan tulisan \"I ❤️ Jember\" yang dikelilingi oleh lingkaran, serta gambar kepala rusa yang dihiasi ornamen warna-warni. Bordir yang rapi dan artistik ini memberikan kesan khas dan elegan, cocok digunakan untuk berbagai keperluan sehari-hari seperti berbelanja, jalan-jalan, atau sebagai hadiah istimewa. Terbuat dari bahan kanvas yang kuat dan tahan lama, Jember Embroidery Canvas tidak hanya fungsional tetapi juga stylish.', 35000.00, 24, 2, 'jember-embroidery-canvas.jpg'),
(22, 'Kanvas Bloom', 'Kanvas Bloom adalah produk kanvas yang elegan dan ramah lingkungan, dihiasi dengan motif bunga yang indah di bagian bawahnya. Dengan desain yang simpel namun menarik, tulisan \"I ❤️ Jember\" di bagian tengah yang dikelilingi oleh lingkaran hitam menambah kesan lokal dan spesial. Tali panjangnya memudahkan untuk dibawa ke mana saja, menjadikan Kanvas Bloom cocok untuk digunakan sehari-hari atau sebagai suvenir khas Jember. Produk ini tidak hanya fungsional tetapi juga menambah sentuhan artistik pada gaya kamu.', 35000.00, 24, 2, 'kanvas-bloom.jpg'),
(23, 'Lattice Chic', 'Lattice Chic adalah sebuah kerajinan tangan yang menampilkan desain anyaman dengan kombinasi warna pink, abu-abu, dan putih. Produk ini memiliki pegangan transparan yang elegan, memberikan sentuhan modern pada desain tradisional. Anyaman ini dibuat dengan pola kotak-kotak yang rapi dan simetris, menciptakan tampilan yang menarik dan unik. Cocok digunakan untuk berbagai kesempatan, baik formal maupun kasual, Lattice Chic tidak hanya fungsional tetapi juga menambah gaya pada penampilan kamu.', 18000.00, 21, 2, 'lattice-chic.jpg'),
(24, 'Lattice Luxe Tote', 'Lattice Luxe Tote adalah tas tangan yang elegan dengan desain anyaman kotak-kotak berwarna coklat dan hitam. Tas ini memiliki pegangan melengkung yang nyaman dan kokoh, serta penutup kancing di bagian atas untuk keamanan tambahan. Cocok untuk digunakan sehari-hari maupun acara khusus, tas ini menawarkan kombinasi sempurna antara gaya dan fungsi.', 17000.00, 40, 4, 'lattice-luxe-tote-1.jpg,lattice-luxe-tote-2.jpg'),
(25, 'Lavender Carryall', 'Lavender Carryall ini memiliki desain anyaman dengan warna ungu muda yang elegan. Dilengkapi dengan pegangan melingkar yang transparan, memberikan sentuhan modern dan unik. Ukurannya yang besar membuatnya ideal untuk membawa berbagai barang, baik untuk keperluan sehari-hari maupun saat berbelanja. Anyaman yang rapi dan bahan yang kuat memastikan daya tahan dan kenyamanan saat digunakan. Cocok untuk gaya kasual maupun semi-formal, Lavender Carryall ini adalah pilihan sempurna untuk menambah sentuhan gaya pada penampilan kamu.', 17000.00, 40, 4, 'lavender-carryall.jpg'),
(26, 'Lemon Weave Delight', 'Lemon Weave Delight adalah sebuah keranjang tangan yang terbuat dari anyaman pita plastik berwarna kuning cerah. Keranjang ini memiliki desain anyaman kotak-kotak yang rapi dan simetris, memberikan tampilan yang elegan dan modern. Pegangan keranjang ini terbuat dari bahan transparan dengan aksen garis kuning, menambah kesan unik dan menarik. Di bagian atas keranjang terdapat kancing berbentuk bola yang juga terbuat dari anyaman pita, berfungsi sebagai penutup yang praktis. Keranjang ini cocok digunakan untuk berbagai keperluan, seperti membawa barang belanjaan ringan, piknik, atau sebagai aksesori fashion yang stylish.', 12000.00, 30, 1, 'lemon-weave-delight.jpg'),
(27, 'Lurik Cantik', 'Lurik Cantik adalah sebuah keranjang multifungsi yang terbuat dari bahan plastik berkualitas bagus dengan desain anyaman yang elegan. Keranjang ini memiliki pegangan melingkar yang kokoh dan nyaman untuk digenggam. Warna dasar putih dengan aksen kotak-kotak kuning memberikan sentuhan ceria dan modern. Cocok digunakan untuk berbagai keperluan sehari-hari seperti berbelanja, piknik, atau sebagai penyimpanan barang-barang di rumah.', 12000.00, 37, 3, 'lurik-cantik.jpg'),
(28, 'Lurik Checker', 'Lurik Checker adalah produk kerajinan tangan yang terbuat dari bahan anyaman plastik dengan pola kotak-kotak berwarna cokelat dan krem. Produk ini memiliki pegangan transparan yang terbuat dari bahan plastik, memberikan kesan modern dan elegan. Setiap unit dilengkapi dengan penutup yang diikat dengan simpul, menambah keamanan dan estetika. Lurik Checker cocok digunakan untuk berbagai keperluan sehari-hari, seperti membawa barang belanjaan atau sebagai aksesori fashion yang unik. Produk ini tidak hanya fungsional tetapi juga menampilkan keindahan seni anyaman tradisional yang dipadukan dengan desain kontemporer.', 15000.00, 40, 3, 'lurik-checker.jpg'),
(29, 'Lurik Checkerboard', 'Lurik Checkerboard adalah keranjang bergaya klasik dengan motif kotak-kotak yang elegan. Keranjang ini memiliki dua tali anyaman yang kuat dan nyaman untuk dibawa. Desainnya yang unik dan artistik membuatnya cocok untuk berbagai kesempatan, baik formal maupun kasual. Dengan sentuhan alami dari anyaman dan warna netral, Lurik Checkerboard memberikan kesan yang chic dan timeless. Cocok untuk melengkapi gaya fashion sehari-hari atau sebagai hadiah istimewa untuk orang terdekat.', 20000.00, 33, 2, 'lurik-checkerboard.jpg'),
(30, 'Mosaic Carryall', 'Mosaic Carryall ini memiliki desain kotak-kotak berwarna-warni yang menarik, terdiri dari kombinasi warna biru, kuning, merah muda, hijau, dan oranye yang disusun secara bergantian dengan warna putih. Pegangan anyaman putih memberikan kesan elegan dan kokoh. Mosaic Carryall ini cocok untuk digunakan dalam berbagai kesempatan, baik untuk berbelanja maupun untuk kegiatan sehari-hari. Latar belakang menunjukkan lingkungan yang tampak seperti area produksi atau toko kerajinan, menambah kesan autentik dan handmade pada produk ini.', 55000.00, 26, 3, 'mosaic-carryall-1.jpg,mosaic-carryall-2.jpg'),
(31, 'Natural Harmony', 'Tas anyaman dengan kombinasi warna hijau, coklat, hitam, dan krem. Memiliki pola kotak-kotak dan dua tali pegangan yang juga dianyam dengan warna hijau dan hitam. Di bagian atas terdapat hiasan bunga kecil dari bahan yang sama. Tas ini memberikan kesan natural dan segar, cocok untuk digunakan dalam kegiatan sehari-hari maupun acara kasual.', 30000.00, 22, 1, 'natural-harmony.jpg'),
(32, 'Rainbow Kopasus', 'Rainbow Kopasus adalah keranjang dengan desain anyaman unik dan penuh warna. Keranjang ini menampilkan pola kotak-kotak dengan kombinasi warna merah, hijau, coklat, dan krem yang mencolok. Pegangan keranjang ini berbentuk melingkar dan transparan, memberikan sentuhan modern pada desain tradisional. Sangat cocok untuk berbagai keperluan sehari-hari seperti berbelanja atau piknik. Rainbow Kopasus tidak hanya fungsional tetapi juga menambah gaya pada penampilan kamu.', 15000.00, 32, 2, 'rainbow-kopasus.jpg'),
(33, 'Rattan Chic', 'Rattan Chic adalah sebuah aksesori bergaya yang terbuat dari anyaman rotan dengan pola geometris yang rapi dan elegan. Pegangan kayu melengkung memberikan sentuhan alami dan klasik, sementara aksen anyaman berwarna cokelat tua menambah kontras yang menarik. Desainnya yang kokoh dan artistik membuatnya cocok untuk berbagai kesempatan, baik formal maupun kasual. Rattan Chic tidak hanya fungsional tetapi juga menambah nilai estetika pada penampilan kamu.', 65000.00, 10, 1, 'rattan-chic-1.jpg,rattan-chic-2.jpg'),
(34, 'Rattan Elegance', 'Rattan Elegance adalah produk kerajinan tangan yang terbuat dari anyaman rotan berwarna coklat tua. Produk ini memiliki pegangan berbentuk lingkaran yang terbuat dari kayu berwarna coklat muda, memberikan kesan alami dan elegan. Pada bagian depan, terdapat dua hiasan berbentuk bunga yang terbuat dari pita rotan berwarna coklat muda, menambah sentuhan artistik. Selain itu, terdapat rantai logam berwarna perak yang berfungsi sebagai tali, memberikan kesan modern dan kontras yang menarik dengan bahan rotan. Produk ini cocok digunakan untuk berbagai kesempatan, baik formal maupun kasual, dan menambah nilai estetika pada penampilan kamu.', 125000.00, 15, 2, 'rattan-elegance.jpg'),
(35, 'Sakura Bloom', 'Sakura Bloom adalah sebuah kerajinan tangan yang terbuat dari anyaman plastik dengan pola kotak-kotak berwarna merah dan putih. Produk ini memiliki desain yang unik dengan tambahan pita-pita kecil berwarna merah muda yang menghiasi bagian atasnya. Pegangan dari produk ini juga terbuat dari bahan yang sama dengan warna merah muda yang serasi. Sakura Bloom tidak hanya menarik secara visual tetapi juga fungsional untuk digunakan sehari-hari.', 18000.00, 21, 2, 'sakura-bloom.jpg'),
(36, 'Sakura Weave', 'Sakura Weave adalah sebuah keranjang tangan yang elegan dengan desain anyaman kotak-kotak berwarna merah muda dan putih. Keranjang ini memiliki dua pegangan melengkung yang nyaman untuk dibawa. Terbuat dari bahan yang kuat dan tahan lama, Sakura Weave cocok untuk digunakan dalam berbagai kesempatan, baik untuk berbelanja maupun sebagai aksesori fashion. Desainnya yang unik dan menarik membuatnya menjadi pilihan yang sempurna bagi mereka yang mencari kombinasi antara gaya dan fungsi. Size 28 x 17 x 28.', 30000.00, 28, 3, 'sakura-weave-1.jpg,sakura-weave-2.jpg'),
(37, 'Serenity Weave', 'Serenity Weave adalah sebuah produk yang menampilkan desain anyaman dengan kombinasi warna biru muda dan ungu pastel yang elegan. Produk ini memiliki dua pegangan melengkung yang kokoh, memberikan kenyamanan saat dibawa. Anyaman yang rapi dan simetris menciptakan tampilan yang menarik dan modern, cocok untuk berbagai kesempatan. Size 28 x 17 x 28.', 30000.00, 28, 3, 'serenity-weave-1.jpg,serenity-weave-2.jpg'),
(38, 'Sling Bag Small', 'Sling Bag Small adalah keranjang modis dengan desain anyaman yang unik, menggabungkan warna kuning cerah dan hitam dalam pola kotak-kotak yang menarik. Ukurannya kecil, cocok untuk membawa barang-barang esensial sehari-hari. Tali selempangnya yang panjang dan fleksibel memudahkan untuk dikenakan di bahu atau disilangkan di tubuh. Penutupnya yang bertekstur dengan kancing pengunci memberikan sentuhan elegan dan keamanan tambahan. Cocok untuk berbagai kesempatan, dari acara santai hingga semi-formal.', 23000.00, 23, 1, 'sling-bag-small-1.jpg,sling-bag-small-2.jpg'),
(39, 'Sunflower Bliss', 'Sunflower Bliss adalah keranjang cantik yang terbuat dari anyaman plastik putih dengan desain bunga matahari yang cerah dan kupu-kupu yang indah. Keranjang ini memiliki pegangan melengkung yang kuat dan nyaman untuk dibawa. Desain bunga matahari yang besar dan penuh warna memberikan kesan ceria dan segar, sementara kupu-kupu yang terbang menambah sentuhan alam yang menenangkan. Cocok untuk digunakan sebagai keranjang belanja, penyimpanan, atau dekorasi rumah.', 28000.00, 10, 1, 'sunflower-bliss-1.jpg,sunflower-bliss-2.jpg,sunflower-bliss-3.jpg'),
(40, 'Tas Anyaman Biru Elegan', 'Tas anyaman dengan warna biru dan putih ini memiliki desain kotak-kotak yang menawan. Dilengkapi dengan dua pegangan yang nyaman dan kancing penutup di bagian atas, tas ini menawarkan kombinasi antara gaya dan fungsionalitas. Cocok untuk berbagai acara, mulai dari jalan-jalan santai hingga acara semi-formal.', 50000.00, 21, 4, 'tas-anyaman-biru-elegan.jpg'),
(41, 'Tas Anyaman Pita Harmoni', 'Tas anyaman dengan kombinasi warna putih dan oranye, dilengkapi dengan pita oranye yang diikat membentuk pola zigzag di bagian atas. Tas ini memiliki desain yang simpel namun menarik, cocok untuk digunakan dalam berbagai kesempatan, baik acara santai maupun semi-formal.', 17000.00, 28, 2, 'tas-anyaman-pita-harmoni.jpg'),
(42, 'Totebag Rainbow Tutup', 'Totebag Rainbow Tutup adalah keranjang multifungsi yang menampilkan desain anyaman kotak-kotak dengan kombinasi warna cerah seperti merah, hijau, biru, kuning, dan ungu. Dilengkapi dengan pegangan yang juga dianyam dalam warna-warna yang harmonis, tas ini memberikan kesan ceria dan menarik. Penutup kancing di bagian atas memastikan barang-barang di dalamnya tetap aman dan terjaga. Cocok untuk digunakan dalam berbagai kegiatan sehari-hari, mulai dari berbelanja hingga piknik, tas ini memberikan sentuhan gaya yang penuh warna.', 25000.00, 15, 3, 'totebag-rainbow-tutup-1.jpg,totebag-rainbow-tutup-2.jpg,totebag-rainbow-tutup-3.jpg'),
(43, 'Vibrant Market Basket', 'Keranjang belanja ini berwarna cerah yang terbuat dari bahan plastik dengan desain anyaman yang menarik. Keranjang pertama berwarna merah muda dengan aksen kotak-kotak hitam dan putih, sementara keranjang kedua berwarna hijau dengan aksen serupa. Kedua keranjang ini dilengkapi dengan pegangan yang kuat dan nyaman untuk dibawa, serta dihiasi dengan pita kecil yang menambah kesan elegan. Cocok digunakan untuk berbelanja atau membawa barang sehari-hari dengan gaya yang modis.', 18000.00, 22, 1, 'vibrant-market-basket.jpg'),
(44, 'Vibrant Mosaic', 'Vibrant Mosaic adalah keranjang multifungsi yang terbuat dari anyaman plastik dengan pola kotak-kotak berwarna-warni. Keranjang ini memiliki pegangan yang kuat dan fleksibel, memudahkan untuk dibawa ke mana saja. Desainnya yang unik dan menarik membuatnya cocok untuk berbagai keperluan, seperti membawa barang belanjaan, piknik, atau menyimpan barang-barang di rumah. Warna-warna yang digunakan dalam anyaman menciptakan tampilan yang estetis dan modern, menjadikannya tidak hanya fungsional tetapi juga dekoratif.', 15000.00, 17, 2, 'vibrant-mosaic-1.jpg,vibrant-mosaic-2.jpg'),
(45, 'Weave Delight', 'Weave Delight adalah produk kerajinan tangan yang memiliki desain yang elegan dengan motif kotak-kotak yang menarik perhatian. Produk ini dilengkapi dengan pegangan yang kuat dan nyaman, serta memiliki tulisan \"I ❤️ Jember\" yang menunjukkan kebanggaan lokal. Ideal untuk digunakan sehari-hari atau sebagai hadiah unik.', 35000.00, 33, 2, 'weave-delight-1.jpg,weave-delight-2.jpg'),
(46, 'Woven Delight', 'Woven Delight adalah sebuah produk kerajinan tangan yang terbuat dari bahan plastik dengan teknik anyaman yang rumit. Produk ini memiliki pola kotak-kotak berwarna-warni yang terdiri dari kombinasi warna merah, kuning, hijau, ungu, dan putih. Terdapat dua ukuran yang berbeda, dengan pegangan transparan yang kuat dan nyaman untuk dibawa. Woven Delight sangat cocok digunakan untuk berbagai keperluan sehari-hari seperti berbelanja atau piknik, memberikan sentuhan estetika yang menarik dan fungsionalitas yang tinggi. Produk ini juga menunjukkan keahlian pengrajin dalam menciptakan barang yang tidak hanya praktis tetapi juga artistik.', 30000.00, 33, 3, 'woven-delight-1.jpg,woven-delight-2.jpg,woven-delight-3.jpg'),
(47, 'Woven Elegance', 'Woven Elegance adalah sebuah produk kerajinan tangan yang menampilkan desain anyaman dengan kombinasi warna biru dan krem yang menarik. Produk ini memiliki dua pegangan melingkar yang kokoh, memberikan kenyamanan saat dibawa. Anyaman yang rapi dan simetris menciptakan pola kotak-kotak yang estetis dan modern. Cocok digunakan untuk berbagai keperluan sehari-hari, baik untuk berbelanja, piknik, atau sekadar sebagai aksesori fashion yang stylish.', 30000.00, 33, 4, 'woven-elegance.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_status` enum('Pending','Completed','Failed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` tinyint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `level`, `name`, `phone`, `address`) VALUES
(1, 'sfrnvndah', 'sfrnvndaah160824@gmail.com', 'SNH_160824', 2, '', '', ''),
(2, 'Nova', 'novan4810@gmail.com', 'nova', 2, '', '', ''),
(3, 'Safira', 'safira@gmail.com', 'safira', 2, '', '', ''),
(4, 'Safira Novanda', 'safiranovandahafizham@gmail.com', 'SNH', 2, '', '', ''),
(5, 'root', 'root@gmail.com', 'root', 2, 'Root', '08123456789', 'Jl. Root');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `cart_2` (`product_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD PRIMARY KEY (`favorite_products_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `level_detail`
--
ALTER TABLE `level_detail`
  ADD PRIMARY KEY (`level_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`,`product_id`),
  ADD KEY `order_2` (`product_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `review_2` (`product_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `order_id` (`order_id`,`user_id`),
  ADD KEY `transaction_1` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `level` (`level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `favorite_products`
--
ALTER TABLE `favorite_products`
  MODIFY `favorite_products_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD CONSTRAINT `favorite_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorite_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `review_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transaction_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `transaction_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `level` FOREIGN KEY (`level`) REFERENCES `level_detail` (`level_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
