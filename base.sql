-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2024 at 12:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `base`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `email`, `password`) VALUES
('admin', 'admin123@gmail.com', 'admin123'),
('management', 'manage123@gmail.com', 'manage123'),
('management', 'manage123@gmail.com', 'manage123'),
('maggie', 'maggie@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `name`, `quantity`, `reorder_level`) VALUES
(2, 'Ibuprofen', 150, 30),
(3, 'Paracetamol', 200, 50),
(4, 'Antibiotic A', 50, 10),
(6, 'dettol', 3, 0),
(7, 'dettol', 3, 0),
(8, 'Ibuprofen', 150, 30),
(9, 'Ibuprofen', 150, 30),
(10, 'Cetrizen', 100, 32),
(11, 'Cetrizen', 100, 32),
(12, 'Cetrizen', 100, 32);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `customer_name`, `order_date`, `total_amount`, `status`) VALUES
(1, 'Harshini', '2024-09-10', 123.45, 'Pending'),
(2, 'Anusri', '2024-09-11', 67.89, 'Shipped'),
(3, 'Vishnu', '2024-09-11', 200.00, 'Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

CREATE TABLE `manage` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manage`
--

INSERT INTO `manage` (`id`, `customer_name`, `order_date`, `total_amount`, `status`) VALUES
(1, 'Harshini', '2024-09-10', 100.00, 'Delivered'),
(2, 'Anusri', '2024-09-01', 150.00, 'Pending'),
(3, 'Vishnu', '2024-09-02', 200.50, 'Shipped'),
(4, 'Maggi', '2024-09-03', 95.75, 'Delivered'),
(5, 'Teja', '2024-09-04', 120.00, 'Cancelled'),
(6, 'Deepika', '2024-09-05', 175.25, 'Pending'),
(7, 'Pavani', '2024-09-05', 75.25, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `ord`
--

CREATE TABLE `ord` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  `actions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ord`
--

INSERT INTO `ord` (`id`, `customer_name`, `order_date`, `total_amount`, `status`, `actions`) VALUES
(1, 'Harshini', '2024-09-11', 200.00, 'Shipped', '');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(10) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `user_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `product_name`, `quantity`, `price`, `user_email`) VALUES
(1, 'Paracetmol', 50, 100, 'harshinigunji8008@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `order_id` int(10) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`order_id`, `product_name`, `quantity`, `price`) VALUES
(1, 'Paracermol', 1, 100),
(2, 'Aspirin\r\nIbuprofen', 1, 117);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`full_name`, `email`, `phone`, `address`, `total`) VALUES
('Harshini', 'harshinigunji8008@gmail.com', '8143819090', 'Chennai', 100),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 51),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 17),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 47),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 7),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 7),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 7),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 7),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 7),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 10),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 10),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 10),
('Harshini Gunji', 'harshinigunji8008@gmail.com', '0814381376', 'Sriperumbudur,Thandalam,Chennai', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orderstable`
--

CREATE TABLE `orderstable` (
  `id` int(10) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstable`
--

INSERT INTO `orderstable` (`id`, `full_name`, `email`, `phone`, `address`, `payment_method`, `date_created`) VALUES
(1, 'Harshini', 'harshinigunji8008@gmail.com', 814381909, 'Chennai', 'Cash On Delivery', '2024-09-08'),
(2, 'Anusri', 'anusri@gmail.com', 975267520, 'Urban Apartments', 'PayPal', '2024-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 50, 100);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `brand` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `dose` varchar(250) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_base64` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `brand`, `name`, `description`, `dose`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`, `image_base64`) VALUES
(1, 1, 'Disprol', 'Paracetamol', 'acetaminophen - Pain reliever and fever reducer.', '500mg', 100.00, 'images/para.jpg', 1, 0, '2024-09-02 17:25:38', '2024-09-10 17:25:38', NULL),
(2, 2, ' penicillin antibiotic', 'Amoxicillin', 'Antibiotic for bacterial infections.', '20-40mg', 62.45, 'images/amoxi.jpg', 1, 0, '2024-09-02 17:32:16', '2024-09-10 17:32:16', NULL),
(3, 2, 'Pain Reliever', 'Ibuprofen', 'Nonsteroidal anti-inflammatory drug used for pain relief.', '200mg', 15.99, 'images/ibu.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(4, 2, 'Acetylsalicylic', 'Aspirin', 'Blood thinner and pain reliever - acetylsalicylic acid.', '300 to 650 mg', 101.00, 'images/aspi.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(5, 3, 'Paracetamol', 'Tylenol', 'Used for pain relief and fever reduction.', '500 mg', 12.99, 'images/tylenol.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(6, 4, 'Ibuprofen', 'Advil', 'Nonsteroidal anti-inflammatory drug used to reduce fever, pain, and inflammation.', '200 mg', 18.75, 'images/advil.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(7, 5, 'Cetirizine', 'Zyrtec', 'Antihistamine used to relieve allergy symptoms.', '10 mg', 22.50, 'images/zyrtec.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(8, 2, 'Loratadine', 'Claritin', 'Antihistamine for relief from allergy symptoms.', '10 mg', 21.00, 'images/claritin.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(9, 3, 'Naproxen', 'Aleve', 'Nonsteroidal anti-inflammatory drug for pain relief and reduction of inflammation.', '220 mg', 14.99, 'images/aleve.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(10, 6, 'Diphenhydramine', 'Benadryl', 'Antihistamine for relieving allergy symptoms and cold symptoms.', '25 mg/5 ml', 8.99, 'images/benadryl.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(11, 6, 'Guaifenesin', 'Mucinex', 'Expectorant for relieving chest congestion.', '100 mg/5 ml', 14.99, 'images/mucinex.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(14, 8, 'Omeprazole', 'Prilosec', 'Proton pump inhibitor used to treat gastroesophageal reflux disease (GERD).', '20 mg', 22.00, 'images/prilosec.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(15, 8, 'Loperamide', 'Imodium', 'Anti-diarrheal medication.', '2 mg', 11.50, 'images/imodium.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(16, 9, 'Neosporin', 'Neosporin Ointment', 'Topical antibiotic ointment for minor cuts, scrapes, and burns.', '15 g', 10.50, 'images/neosporin.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(17, 9, 'Hydrocortisone', 'Cortizone-10', 'Anti-itch ointment used for relief from skin irritation and rashes.', '30 g', 7.99, 'images/cortizone.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL),
(18, 10, 'Bacitracin', 'Bacitracin Ointment', 'Topical antibiotic ointment for preventing infection in minor cuts and wounds.', '10 g', 5.75, 'images/bacitracin.jpg', 1, 0, '2024-09-10 12:00:00', '2024-09-10 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`) VALUES
('Harshini', 'harshinigunji8008@gmail.com', 'Harshu'),
('Vishnu', 'vishnu@gmail.com', '$2y$10$7Jp03ycx4V8rSHLdfqVi9.lachS8mnCsui.7uro6u3QOJBPQlXMt6'),
('priya', 'priya123@gmail.com', '$2y$10$Zz5ICtb8jvPMiWbPRmCU8upG1DQbOOOCkwtbGHi5Tn3heBbQRDxYS'),
('harshu', 'harshu@gmail.com', '$2y$10$4fDODf5E.KUyZGBE/O/L3uRMue4yPk2Y5qKCAqRzicsMNnooAFSBO'),
('harshu', 'Harshu@gmail.com', 'Harshu'),
('vishnu', 'vishnu@gmail.com', 'penguin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage`
--
ALTER TABLE `manage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ord`
--
ALTER TABLE `ord`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manage`
--
ALTER TABLE `manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ord`
--
ALTER TABLE `ord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
