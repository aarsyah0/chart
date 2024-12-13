-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2024 pada 08.09
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Gas Elpiji'),
(2, 'Air Mineral');

-- --------------------------------------------------------

--
-- Struktur dari tabel `favorite_products`
--

CREATE TABLE `favorite_products` (
  `favorite_products_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `status` enum('Pending','Completed','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `status`, `order_date`) VALUES
(1, 1, 100000.00, 'Completed', '2023-01-15'),
(2, 2, 200000.00, 'Completed', '2023-02-15'),
(3, 3, 900000.00, 'Completed', '2023-03-20'),
(4, 4, 500000.00, 'Completed', '2023-04-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(5, 2, 40, 2),
(7, 3, 32, 20),
(8, 3, 37, 10),
(9, 3, 36, 10),
(10, 4, 34, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock`, `category_id`, `image_url`) VALUES
(1, 'Gas Elpiji 3kg', 'Tabung gas LPG 3 kg adalah wadah baja berbentuk silinder berwarna hijau muda yang digunakan untuk menyimpan gas cair. Kapasitasnya 3 kg dengan berat total sekitar 8 kg saat penuh. Dilengkapi katup otomatis dan segel keamanan, tabung ini memiliki pegangan untuk memudahkan pengangkutan. Umumnya digunakan untuk kebutuhan memasak rumah tangga', 20000.00, 200, 1, 'elpiji.jpeg'),
(2, 'Gas Elpiji 3kg + Tabung\r\n', 'Tabung gas LPG 3 kg adalah wadah baja berbentuk silinder berwarna hijau muda yang digunakan untuk menyimpan gas cair. Kapasitasnya 3 kg dengan berat total sekitar 8 kg saat penuh. Dilengkapi katup otomatis dan segel keamanan, tabung ini memiliki pegangan untuk memudahkan pengangkutan. Umumnya digunakan untuk kebutuhan memasak rumah tangga', 160000.00, 200, 1, 'elpiji.jpeg'),
(3, 'Air Mineral Aqua galon 19L ', 'Aqua galon adalah wadah air minum berbahan plastik bening berkapasitas 19 liter. Bentuknya silinder dengan leher sempit yang dilengkapi tutup kedap udara untuk menjaga kebersihan dan kualitas air. Galon ini biasa digunakan dengan dispenser atau secara manual untuk kebutuhan konsumsi air minum sehari-hari.', 20000.00, 50, 2, 'galon_aqua.jpeg'),
(4, 'Air Mineral Aqua galon 19L + Galon', 'Aqua galon adalah wadah air minum berbahan plastik bening berkapasitas 19 liter. Bentuknya silinder dengan leher sempit yang dilengkapi tutup kedap udara untuk menjaga kebersihan dan kualitas air. Galon ini biasa digunakan dengan dispenser atau secara manual untuk kebutuhan konsumsi air minum sehari-hari.', 60000.00, 50, 2, 'galon_aqua.jpeg'),
(5, 'Air Mineral Galon Le Minerale 19L', 'Le Minerale galon adalah wadah air minum berbahan plastik bening berkapasitas 19 liter. Berbeda dengan galon lain, Le Minerale menggunakan tutup ulir yang lebih rapat untuk menjaga kesegaran air mineralnya. Galon ini dirancang untuk dipasang pada dispenser atau digunakan manual sesuai kebutuhan konsumsi sehari-hari.', 24000.00, 25, 2, 'leminerale_galon.jpeg'),
(6, 'Air Mineral Galon Cleo 19L', 'Cleo galon adalah wadah air minum berbahan plastik transparan dengan kapasitas 19 liter. Galon ini memiliki tutup ulir rapat untuk menjaga kebersihan dan kualitas air. Dirancang untuk dipasang pada dispenser atau digunakan manual, Cleo dikenal dengan airnya yang diproses menggunakan teknologi ultra filtration.', 80000.00, 25, 2, 'cleo_galon.jpeg'),
(7, 'Air mineral Aqua Karton 600ml', 'Karton Aqua botol 600ml adalah kemasan berisi 24 botol air mineral Aqua masing-masing berkapasitas 600ml. Karton ini terbuat dari kardus kokoh untuk melindungi botol selama pengangkutan dan penyimpanan. Produk ini sering digunakan untuk kebutuhan konsumsi sehari-hari, acara, atau keperluan perjalanan.', 70000.00, 25, 2, 'Aqua600ml.jpeg'),
(8, 'Air mineral Aqua Karton 1,5 L', 'Karton Aqua botol 1.5L adalah kemasan berisi 12 botol air mineral Aqua, masing-masing berkapasitas 1.5 liter. Karton ini terbuat dari kardus kuat untuk melindungi botol selama pengangkutan dan penyimpanan. Cocok untuk konsumsi keluarga atau acara dengan kebutuhan air minum dalam jumlah besar.', 80000.00, 20, 2, 'Aquabesar.jpeg'),
(9, 'Air mineral Le Minerale Karton 1,5 L', 'Karton Le Minerale 1.5L adalah kemasan berisi 12 botol air mineral Le Minerale, masing-masing berkapasitas 1.5 liter. Karton ini terbuat dari kardus yang kuat untuk melindungi botol selama pengangkutan. Cocok untuk konsumsi keluarga atau acara dengan kebutuhan air min', 70000.00, 20, 2, 'Leminerale_Karton.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `transaction_status` enum('Pending','Completed','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` tinyint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
