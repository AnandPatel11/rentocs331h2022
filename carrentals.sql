-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2022 at 06:46 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrentals`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Location_Id` int(11) NOT NULL DEFAULT 1,
  `Street_Number` int(11) DEFAULT NULL,
  `Street_Name` varchar(25) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Branch_State` char(2) DEFAULT NULL,
  `ZIP_CODE` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Location_Id`, `Street_Number`, `Street_Name`, `City`, `Branch_State`, `ZIP_CODE`) VALUES
(123, 24, 'Market St', 'Newark', 'NJ', '07056'),
(234, 17, 'Norfolk St', 'Newark', 'NJ', '07022'),
(345, 280, 'MLK Blvd', 'Newark', 'NJ', '07044'),
(456, 33, '42nd St', 'Manhattan', 'NY', '10011'),
(567, 10, 'Pond Ln', 'Piscataway', 'NJ', '08054');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `VIN` int(11) NOT NULL,
  `Car_Branch_Id` int(11) DEFAULT NULL,
  `Car_Model_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`VIN`, `Car_Branch_Id`, `Car_Model_Id`) VALUES
(12345678, 123, 1111),
(23456789, 234, 2222),
(34567891, 345, 3333),
(45678912, 456, 4444),
(56789123, 567, 5555);

-- --------------------------------------------------------

--
-- Table structure for table `car_class`
--

CREATE TABLE `car_class` (
  `Class_Id` int(11) NOT NULL,
  `Class_Name` varchar(20) NOT NULL,
  `Daily_Rate` double DEFAULT 60 CHECK (`Daily_Rate` > 0),
  `Weekly_Rate` double DEFAULT 450 CHECK (`Weekly_Rate` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_class`
--

INSERT INTO `car_class` (`Class_Id`, `Class_Name`, `Daily_Rate`, `Weekly_Rate`) VALUES
(1234, 'COMPACT', 36.06, 198.33),
(2345, 'INTERMEDIATE', 37.71, 207.41),
(3456, 'FULL SIZE', 40.43, 222.37),
(4567, 'SUV', 60.1, 330.55),
(5678, 'VAN', 106, 583);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Id` int(11) NOT NULL,
  `First_Name` varchar(25) NOT NULL,
  `Middle_Name` varchar(25) DEFAULT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `Licensing_State` char(2) DEFAULT NULL,
  `Licence_Number` varchar(20) DEFAULT NULL,
  `Card_Expiration_Month` int(11) DEFAULT NULL,
  `Card_Expiration_Year` int(11) DEFAULT NULL,
  `Card_Type` varchar(20) DEFAULT NULL,
  `Card_Number` char(16) DEFAULT NULL,
  `Street_Number` int(11) DEFAULT NULL,
  `Apartment_Number` varchar(10) DEFAULT NULL,
  `Street_Name` varchar(25) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Customer_State` char(2) DEFAULT NULL,
  `ZIP_CODE` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Id`, `First_Name`, `Middle_Name`, `Last_Name`, `Licensing_State`, `Licence_Number`, `Card_Expiration_Month`, `Card_Expiration_Year`, `Card_Type`, `Card_Number`, `Street_Number`, `Apartment_Number`, `Street_Name`, `City`, `Customer_State`, `ZIP_CODE`) VALUES
(36941468, 'Lionel', 'George', 'Messi', 'FL', 'L45844691285412', 5, 2026, 'Mastercard', '2364567812345612', 7, 'A', 'Goat Ln', 'Tampa Bay', 'Fl', '75986'),
(42341468, 'Mayer', 'Tom', 'Brady', 'NY', 'L12344691285412', 2, 2024, 'Mastercard', '5864567812345612', 11, 'P35', 'Market St', 'Manhattan', 'NY', '05422'),
(42398456, 'Richard', 'John', 'Smith', 'NJ', 'L12345671234567', 7, 2025, 'Visa', '1234567812345678', 567, 'H3', 'Towel Ln', 'Newark', 'NJ', '07154'),
(42398468, 'Price', 'Jack', 'Piers', 'NJ', 'L12345671285412', 11, 2026, 'Visa', '1234567812345612', 24, 'A2', 'Pond Ln', 'Orange', 'NJ', '07112'),
(98758468, 'Jay', 'Parth', 'Patel', 'NJ', 'L15565671285412', 11, 2027, 'Visa', '5963567812345612', 29, 'F5', 'Possumtown Rd', 'Edison', 'NJ', '08863');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `Model_Id` int(11) NOT NULL,
  `Model_Name` varchar(20) DEFAULT NULL,
  `Model_Make` varchar(20) DEFAULT NULL,
  `Model_Year` int(11) DEFAULT NULL CHECK (`Model_Year` >= 1950),
  `Model_Class_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`Model_Id`, `Model_Name`, `Model_Make`, `Model_Year`, `Model_Class_ID`) VALUES
(1111, 'VERSA', 'NISSAN', 2017, 1234),
(2222, 'COROLLA', 'TOYOTA', 2019, 2345),
(3333, 'FUSION', 'FORD', 2021, 3456),
(4444, 'SIENNA', 'TOYOTA', 2019, 4567),
(5555, 'EXPRESS', 'CHEVROLET', 2018, 5678);

-- --------------------------------------------------------

--
-- Table structure for table `rental_agreement`
--

CREATE TABLE `rental_agreement` (
  `Contract_Number` int(11) NOT NULL,
  `Car_VIN` int(11) DEFAULT NULL,
  `Contract_Reservation_Id` int(11) DEFAULT NULL,
  `Agreement_Status` varchar(20) DEFAULT 'NOT STARTED',
  `DateAndTime_In` timestamp NULL DEFAULT NULL,
  `DateAndTime_Out` timestamp NULL DEFAULT NULL,
  `Starting_Odometer_Reading` int(11) NOT NULL,
  `Ending_Odometer_Reading` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental_agreement`
--

INSERT INTO `rental_agreement` (`Contract_Number`, `Car_VIN`, `Contract_Reservation_Id`, `Agreement_Status`, `DateAndTime_In`, `DateAndTime_Out`, `Starting_Odometer_Reading`, `Ending_Odometer_Reading`) VALUES
(123456, 12345678, 11, 'COMPLETED', '2001-01-24 14:30:00', '2001-01-30 16:30:00', 25874, 27025),
(234567, 23456789, 13, 'COMPLETED', '2020-04-17 15:30:00', '2020-04-19 23:30:00', 35601, 35942),
(345678, 12345678, 10, 'ONGOING', '2022-11-05 11:30:00', NULL, 10587, NULL),
(456789, 34567891, 49, 'COMPLETED', '2022-01-08 20:00:00', '2022-01-11 20:30:00', 25987, 26251),
(567891, 45678912, 5, 'COMPLETED', '2020-10-14 12:30:00', '2020-10-16 14:30:00', 15578, 15932);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Reservation_ID` int(11) NOT NULL,
  `Reserving_Customer_Id` int(11) DEFAULT NULL,
  `Reservation_Branch_Id` int(11) DEFAULT NULL,
  `Vehicle_Class_Id` int(11) DEFAULT NULL,
  `Desired_DateAndTime_In` timestamp NULL DEFAULT NULL,
  `Desired_DateAndTime_Out` timestamp NULL DEFAULT NULL,
  `Reservation_Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Reservation_ID`, `Reserving_Customer_Id`, `Reservation_Branch_Id`, `Vehicle_Class_Id`, `Desired_DateAndTime_In`, `Desired_DateAndTime_Out`, `Reservation_Status`) VALUES
(5, 36941468, 456, 4567, '2020-10-14 12:30:00', '2020-10-16 13:30:00', 'COMPLETED'),
(10, 36941468, 123, 1234, '2022-11-05 11:30:00', '2022-11-25 14:30:00', 'MADE'),
(11, 42398456, 123, 1234, '2001-01-24 14:30:00', '2001-01-30 14:30:00', 'COMPLETED'),
(13, 42398468, 234, 5678, '2020-04-17 15:30:00', '2020-04-19 23:30:00', 'COMPLETED'),
(22, 42341468, 123, 1234, '2021-11-05 17:00:00', '2021-11-08 20:30:00', 'NO-SHOW'),
(34, 98758468, 123, 1234, '2018-04-13 09:30:00', '2018-04-13 12:15:00', 'COMPLETED'),
(49, 42341468, 345, 3456, '2022-01-08 20:00:00', '2022-01-11 20:30:00', 'COMPLETED');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `Password`) VALUES
('test123', 'test123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Location_Id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`VIN`),
  ADD KEY `BranchFK` (`Car_Branch_Id`),
  ADD KEY `ModelFK` (`Car_Model_Id`);

--
-- Indexes for table `car_class`
--
ALTER TABLE `car_class`
  ADD PRIMARY KEY (`Class_Id`),
  ADD UNIQUE KEY `Class_Name` (`Class_Name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`Model_Id`),
  ADD KEY `ModelClassFK` (`Model_Class_ID`);

--
-- Indexes for table `rental_agreement`
--
ALTER TABLE `rental_agreement`
  ADD PRIMARY KEY (`Contract_Number`),
  ADD KEY `RentalCarFK` (`Car_VIN`),
  ADD KEY `RentalReservationFK` (`Contract_Reservation_Id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_ID`),
  ADD KEY `ResBranchFK` (`Reservation_Branch_Id`),
  ADD KEY `ResClassFK` (`Vehicle_Class_Id`),
  ADD KEY `ResCustomerFK` (`Reserving_Customer_Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `BranchFK` FOREIGN KEY (`Car_Branch_Id`) REFERENCES `branch` (`Location_Id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ModelFK` FOREIGN KEY (`Car_Model_Id`) REFERENCES `model` (`Model_Id`) ON DELETE SET NULL;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `ModelClassFK` FOREIGN KEY (`Model_Class_ID`) REFERENCES `car_class` (`Class_Id`) ON DELETE SET NULL;

--
-- Constraints for table `rental_agreement`
--
ALTER TABLE `rental_agreement`
  ADD CONSTRAINT `RentalCarFK` FOREIGN KEY (`Car_VIN`) REFERENCES `car` (`VIN`) ON DELETE SET NULL,
  ADD CONSTRAINT `RentalReservationFK` FOREIGN KEY (`Contract_Reservation_Id`) REFERENCES `reservation` (`Reservation_ID`) ON DELETE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `ResBranchFK` FOREIGN KEY (`Reservation_Branch_Id`) REFERENCES `branch` (`Location_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ResClassFK` FOREIGN KEY (`Vehicle_Class_Id`) REFERENCES `car_class` (`Class_Id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ResCustomerFK` FOREIGN KEY (`Reserving_Customer_Id`) REFERENCES `customer` (`Customer_Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
