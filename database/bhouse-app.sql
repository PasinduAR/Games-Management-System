-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 03:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bhouse-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gameName` varchar(255) NOT NULL,
  `developer` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cid`, `gid`, `uid`, `gameName`, `developer`, `price`, `total_price`) VALUES
(42, 16, 3, 'Dead Island 2', 'Deep Silver Studios', 450, 450),
(43, 15, 3, 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', 350, 350),
(44, 16, 3, 'Dead Island 2', 'Deep Silver Studios', 450, 450),
(45, 15, 3, 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', 350, 350),
(46, 17, 3, 'Dead Island 2', 'Deep Silver Studios', 123, 123),
(47, 15, 3, 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', 350, 350),
(48, 20, 1, 'The Last of Us Part 01', 'Deep Silver Studios', 2000, 2000),
(49, 17, 1, 'Dead Island 2', 'Deep Silver Studios', 123, 123);

-- --------------------------------------------------------

--
-- Table structure for table `game_dtls`
--

CREATE TABLE `game_dtls` (
  `gameId` int(11) NOT NULL,
  `gamename` varchar(255) NOT NULL,
  `developer` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `gameCategory` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_dtls`
--

INSERT INTO `game_dtls` (`gameId`, `gamename`, `developer`, `price`, `gameCategory`, `status`, `photo`, `email`) VALUES
(1, 'The Last of Us Part 01', 'Naughty Dog ', '22.53', 'New', 'Active', 'The-Last-Of-Us-Part-1-Cover-Art.jpg', 'admin'),
(6, 'Assassin\'s Creed Mirage', ' Ubisoft, Ubisoft Bordeaux', '35.06', 'New', 'Active', 'Assassins-Creed-Mirage-Cover-Art.jpg', 'admin'),
(15, 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350', 'New', 'Active', 'The-Lord-of-the-Rings-Gollum-Cover-Art.jpg', 'admin'),
(16, 'Dead Island 2', 'Deep Silver Studios', '450', 'New', 'Active', 'Dead-Island-2-Buy-Cover-Art.jpg', 'admin'),
(17, 'Dead Island 2', 'Deep Silver Studios', '123', 'New', 'Active', 'Dead-Island-2-Buy-Cover-Art.jpg', 'admin'),
(18, 'Dead Island 2', 'Naughty Dog 2', '2000', 'Old', 'Active', 'Star-Wars-Jedi-Survivors-Cover-Art.jpg', 'pasindu123@gmail.com'),
(19, 'The Last of Us Part 01', '', '', 'Choose...', 'Choose...', '', 'admin'),
(20, 'The Last of Us Part 01', 'Deep Silver Studios', '2000', 'New', 'Active', 'Mortal-Kombat-1-Cover-Art.jpg', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `game_order`
--

CREATE TABLE `game_order` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `developer` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_order`
--

INSERT INTO `game_order` (`id`, `order_id`, `user_name`, `email`, `address`, `phone`, `game_name`, `developer`, `price`, `payment`) VALUES
(19, 'GAME-ORD-00636', 'Pasindu', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(20, 'GAME-ORD-00603', 'Pasindu', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD'),
(21, 'GAME-ORD-0048', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(22, 'GAME-ORD-0046', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD'),
(23, 'GAME-ORD-00653', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(24, 'GAME-ORD-0048', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(25, 'GAME-ORD-00839', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD'),
(26, 'GAME-ORD-00550', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(27, 'GAME-ORD-0014', 'Pasindu', 'mahelchandupa1013@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD'),
(28, 'GAME-ORD-00512', '0785240365', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(29, 'GAME-ORD-00724', '0785240365', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD'),
(30, 'GAME-ORD-00699', '0785240365', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '450.0', 'COD'),
(31, 'GAME-ORD-00447', '0785240365', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD'),
(32, 'GAME-ORD-00654', '0785240365', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'Dead Island 2', 'Deep Silver Studios', '123.0', 'COD'),
(33, 'GAME-ORD-0088', '0785240365', 'pasindu123@gmail.com', 'damasak Stores,8th Mile Post,hanayapalama,Aralaganwila,Polonnaruwa,Polonnaruwa,Polonnaruwa,51098', '0785240365', 'The Lord of the Rings: Gollum', 'Daedalic Entertainment', '350.0', 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phno` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phno`, `password`, `address`, `landmark`, `city`, `state`, `pincode`) VALUES
(1, 'Pasindu', 'pasindu123@gmail.com', '0783456700', '123', NULL, NULL, NULL, NULL, NULL),
(3, 'Akalanka', 'pasindu123@gmail.com2', '0783456700', '123', NULL, NULL, NULL, NULL, NULL),
(4, 'pasiya', 'pasiya123@gmail.com', '0784523300', '123', NULL, NULL, NULL, NULL, NULL),
(5, 'mahelchandupa1013@gmail.com', 'mahelchandupa1013@gmail.com', '0783456700', '12345', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `game_dtls`
--
ALTER TABLE `game_dtls`
  ADD PRIMARY KEY (`gameId`);

--
-- Indexes for table `game_order`
--
ALTER TABLE `game_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `game_dtls`
--
ALTER TABLE `game_dtls`
  MODIFY `gameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `game_order`
--
ALTER TABLE `game_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
