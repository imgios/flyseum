-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 17, 2018 at 03:40 PM
-- Server version: 8.0.11
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flyseum`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `useremail` varchar(255) DEFAULT NULL,
  `flightid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `useremail`, `flightid`) VALUES
(1, 'admin@flyseum.org', 3);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `departure` varchar(45) NOT NULL DEFAULT 'roma',
  `destination` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `dateDeparture` datetime NOT NULL,
  `dateArrival` datetime NOT NULL,
  `passengers` int(10) NOT NULL DEFAULT '0',
  `maxPassengers` int(10) NOT NULL DEFAULT '200',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `departure`, `destination`, `company`, `dateDeparture`, `dateArrival`, `passengers`, `maxPassengers`, `price`) VALUES
(1, 'roma', 'amsterdam', 'easyjet', '2021-08-15 10:20:00', '2018-08-15 12:30:00', 0, 200, '0.00'),
(2, 'roma', 'cracovia', 'ryanair', '2021-07-31 12:30:00', '2018-07-31 15:00:00', 0, 200, '0.00'),
(3, 'roma', 'dortmund', 'alitalia', '2021-09-10 06:00:00', '2018-09-10 08:10:00', 0, 200, '0.00'),
(4, 'roma', 'parigi', 'airparis', '2021-10-18 20:20:00', '2018-10-18 21:55:00', 0, 200, '0.00'),
(5, 'roma', 'amsterdam', 'airfrank', '2021-09-10 11:20:00', '2018-09-10 12:58:00', 0, 200, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `role` varchar(5) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `name`, `surname`, `telephone`, `role`) VALUES
('admin@flyseum.org', 'flyseum123', 'Giosuè', 'Sulipano', '1234567890', 'admin'),
('trapanatore@kenya.it', 'testing123', 'Giovanni', 'Paolino', NULL, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `usrbooking`
--

CREATE TABLE `usrbooking` (
  `id` int(11) NOT NULL,
  `type` char(2) NOT NULL DEFAULT 'ar',
  `useremail` varchar(255) NOT NULL,
  `goflightid` int(11) NOT NULL,
  `backflightid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usrbooking`
--

INSERT INTO `usrbooking` (`id`, `type`, `useremail`, `goflightid`, `backflightid`) VALUES
(1, 'ao', 'admin@flyseum.org', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_1_idx` (`useremail`),
  ADD KEY `fk_cart_2_idx` (`flightid`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `usrbooking`
--
ALTER TABLE `usrbooking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usrbooking_1_idx` (`useremail`),
  ADD KEY `fk_usrbooking_2_idx` (`goflightid`),
  ADD KEY `fk_usrbooking_3_idx` (`backflightid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usrbooking`
--
ALTER TABLE `usrbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_1` FOREIGN KEY (`useremail`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `fk_cart_2` FOREIGN KEY (`flightid`) REFERENCES `flight` (`id`);

--
-- Constraints for table `usrbooking`
--
ALTER TABLE `usrbooking`
  ADD CONSTRAINT `fk_usrbooking_1` FOREIGN KEY (`useremail`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `fk_usrbooking_2` FOREIGN KEY (`goflightid`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `fk_usrbooking_3` FOREIGN KEY (`backflightid`) REFERENCES `flight` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;