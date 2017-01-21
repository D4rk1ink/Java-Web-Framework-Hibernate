-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2016 at 03:26 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminId` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminId`, `Email`, `Password`, `LastLogin`, `FirstName`, `LastName`, `Phone`) VALUES
('1920000000000', 'admin@mail.com', '1234', NULL, 'FirstName', 'LastName', '0900000000');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookId` int(7) NOT NULL,
  `BookName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CategoryId` varchar(10) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookId`, `BookName`, `CategoryId`, `Note`) VALUES
(3, 'The Art of Movement', '11', NULL),
(4, 'Ansel Adams 2017 Wall Calendar', '11', NULL),
(5, 'Slim Aarons: Women', '11', NULL),
(6, 'The Food Lab: Better Home Cooking Through Science', '12', NULL),
(7, 'Cravings: Recipes for All the Food You Want to Eat', '12', NULL),
(8, 'Six of Crows', '13', NULL),
(9, 'The Last Star: The Final Book of The 5th Wave', '13', NULL),
(10, 'A Knight of the Seven Kingdoms', '13', NULL),
(11, 'Naruto', '16', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryId` int(5) NOT NULL,
  `CategoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `CategoryName`) VALUES
(11, 'Arts & Photography'),
(12, 'Cookbooks, Food & Wine'),
(13, 'Science Fiction & Fantasy'),
(15, 'History'),
(16, 'Cartoon');

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `ChapterId` int(10) NOT NULL,
  `BookId` int(7) NOT NULL,
  `No` int(5) DEFAULT NULL,
  `Price` double(5,2) DEFAULT NULL,
  `Quantity` int(5) DEFAULT NULL,
  `ChapterName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`ChapterId`, `BookId`, `No`, `Price`, `Quantity`, `ChapterName`) VALUES
(1000000069, 3, 1, 36.10, 51, 'The Art of Movement'),
(1000000070, 4, 1, 14.77, 100, 'Ansel Adams 2017 Wall Calendar'),
(1000000071, 5, 1, 18.49, 80, 'Slim Aarons: Women'),
(1000000072, 6, 1, 27.55, 100, 'The Food Lab: Better Home Cooking Through Science No.1'),
(1000000073, 6, 1, 27.55, 100, 'The Food Lab: Better Home Cooking Through Science No.2'),
(1000000074, 7, 1, 15.99, 30, 'Cravings: Recipes for All the Food You Want to Eat'),
(1000000075, 8, 1, 5.07, 100, 'Six of Crows: Book 1'),
(1000000076, 8, 2, 5.07, 100, 'Six of Crows: Book 2'),
(1000000077, 8, 3, 5.07, 100, 'Six of Crows: Book 3'),
(1000000078, 9, 1, 10.99, 100, 'The Last Star: The Final Book of The 5th Wave'),
(1000000079, 10, 1, 15.99, 100, 'A Knight of the Seven Kingdoms'),
(1000000080, 11, 1, 21.50, 100, 'Naruto No.1'),
(1000000081, 11, 2, 20.50, 200, 'Naruto No.2');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `UserId` varchar(20) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `Email` varchar(15) NOT NULL,
  `Level` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `UserId` varchar(20) NOT NULL,
  `ChapterId` int(10) NOT NULL,
  `Quantity` int(2) NOT NULL,
  `DateRental` date NOT NULL,
  `RentalId` int(10) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `UserId` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminId`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`ChapterId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`RentalId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookId` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `ChapterId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000082;
--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `RentalId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
