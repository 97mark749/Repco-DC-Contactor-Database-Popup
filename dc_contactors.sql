-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 12, 2022 at 08:47 PM
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
-- Database: `dc_contactors`
--

-- --------------------------------------------------------

--
-- Table structure for table `bulletin_7400blowout_coil_rating`
--

CREATE TABLE `bulletin_7400blowout_coil_rating` (
  `Symbol` varchar(0) DEFAULT NULL,
  `Value` int(3) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bulletin_7400blowout_coil_rating`
--

INSERT INTO `bulletin_7400blowout_coil_rating` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`) VALUES
(NULL, 15, 1, 0, 0, 0),
(NULL, 25, 1, 0, 0, 0),
(NULL, 50, 1, 0, 0, 0),
(NULL, 100, 0, 1, 0, 0),
(NULL, 150, 0, 0, 1, 0),
(NULL, 300, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bulletin_7400nema_Size`
--

CREATE TABLE `bulletin_7400nema_Size` (
  `Symbol` varchar(0) DEFAULT NULL,
  `Value` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bulletin_7400nema_Size`
--

INSERT INTO `bulletin_7400nema_Size` (`Symbol`, `Value`) VALUES
(NULL, 2),
(NULL, 3),
(NULL, 4),
(NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bulletin_7400power_pole_configuration`
--

CREATE TABLE `bulletin_7400power_pole_configuration` (
  `Symbol` varchar(0) DEFAULT NULL,
  `Value` varchar(3) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bulletin_7400power_pole_configuration`
--

INSERT INTO `bulletin_7400power_pole_configuration` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`) VALUES
(NULL, '1NC', 1, 1, 1, 1),
(NULL, '1NO', 1, 1, 1, 1),
(NULL, '2NO', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bulletin_7400type`
--

CREATE TABLE `bulletin_7400type` (
  `Symbol` varchar(2) NOT NULL,
  `Value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bulletin_7400type`
--

INSERT INTO `bulletin_7400type` (`Symbol`, `Value`) VALUES
('KD', 'Normally Open (KD)'),
('KS', 'Normally Closed (KS)');

-- --------------------------------------------------------

--
-- Table structure for table `bulletin_7400_contactors`
--

CREATE TABLE `bulletin_7400_contactors` (
  `Catalog_No` varchar(32) NOT NULL,
  `Series` varchar(16) NOT NULL,
  `NEMA_Size` int(1) NOT NULL,
  `Type` varchar(32) NOT NULL,
  `Blowout_Coil_Rating` int(3) NOT NULL,
  `Power_Pole_Configuration` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bulletin_7400_contactors`
--

INSERT INTO `bulletin_7400_contactors` (`Catalog_No`, `Series`, `NEMA_Size`, `Type`, `Blowout_Coil_Rating`, `Power_Pole_Configuration`) VALUES
('74U12', 'Bulletin 7400', 2, 'Normally Open (KD)', 50, '1NO'),
('74U121', 'Bulletin 7400', 2, 'Normally Closed (KS)', 50, '1NC'),
('74U121E', 'Bulletin 7400', 2, 'Normally Closed (KS)', 25, '1NC'),
('74U122', 'Bulletin 7400', 2, 'Normally Open (KD)', 50, '1NO'),
('74U12D', 'Bulletin 7400', 2, 'Normally Open (KD)', 15, '1NO'),
('74U12E', 'Bulletin 7400', 2, 'Normally Open (KD)', 25, '1NO'),
('74U13', 'Bulletin 7400', 3, 'Normally Open (KD)', 100, '1NO'),
('74U131', 'Bulletin 7400', 3, 'Normally Closed (KS)', 100, '1NC'),
('74U14', 'Bulletin 7400', 4, 'Normally Open (KD)', 150, '1NO'),
('74U141', 'Bulletin 7400', 4, 'Normally Closed (KS)', 150, '1NC'),
('74U15', 'Bulletin 7400', 5, 'Normally Open (KD)', 300, '1NO'),
('74U151', 'Bulletin 7400', 5, 'Normally Closed (KS)', 300, '1NC'),
('74U22', 'Bulletin 7400', 2, 'Normally Open (KD)', 50, '2NO'),
('74U22D', 'Bulletin 7400', 2, 'Normally Open (KD)', 15, '2NO'),
('74U22E', 'Bulletin 7400', 2, 'Normally Open (KD)', 25, '2NO');

-- --------------------------------------------------------

--
-- Table structure for table `c80auxiliary_contact_location`
--

CREATE TABLE `c80auxiliary_contact_location` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(64) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80auxiliary_contact_location`
--

INSERT INTO `c80auxiliary_contact_location` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
('A', 'Side Mounted - Right or Left', 1, 0, 0, 0, 0, 0, 0),
('B', 'Bottom Mounted (w/LH and/or RH Interlock)', 1, 1, 1, 1, 1, 1, 1),
('N', 'None', 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c80blowout_coil_rating`
--

CREATE TABLE `c80blowout_coil_rating` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(16) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80blowout_coil_rating`
--

INSERT INTO `c80blowout_coil_rating` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
('C', '5 AMP', 1, 0, 0, 0, 0, 0, 0),
('D', '10 AMP', 1, 0, 0, 0, 0, 0, 0),
('F', '25 AMP', 1, 0, 0, 0, 0, 0, 0),
('G', '50 AMP', 1, 0, 0, 0, 0, 0, 0),
('H', '100 AMP', 0, 1, 0, 0, 0, 0, 0),
('J', '150 AMP', 0, 0, 1, 0, 0, 0, 0),
('K', '300 AMP', 0, 0, 0, 1, 0, 0, 0),
('L', '600 AMP', 0, 0, 0, 0, 1, 0, 0),
('M', '810 AMP', 0, 0, 0, 0, 0, 1, 0),
('N', '1350 AMP', 0, 0, 0, 0, 0, 0, 1),
('X', 'None', 1, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c80coil_voltage`
--

CREATE TABLE `c80coil_voltage` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80coil_voltage`
--

INSERT INTO `c80coil_voltage` (`Symbol`, `Value`) VALUES
(1, '115V DC'),
(2, '230V DC'),
(4, '100V DC');

-- --------------------------------------------------------

--
-- Table structure for table `c80lh_auxiliary_contacts`
--

CREATE TABLE `c80lh_auxiliary_contacts` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(10) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80lh_auxiliary_contacts`
--

INSERT INTO `c80lh_auxiliary_contacts` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
(0, 'None', 1, 1, 1, 1, 1, 1, 1),
(1, '1NO', 1, 1, 1, 1, 1, 1, 1),
(2, '2NO', 1, 0, 0, 0, 0, 0, 0),
(3, '2NO-1NC', 1, 0, 0, 0, 0, 0, 0),
(4, '1NC', 0, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c80nema_size`
--

CREATE TABLE `c80nema_size` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80nema_size`
--

INSERT INTO `c80nema_size` (`Symbol`, `Value`) VALUES
('D', '2'),
('E', '3'),
('F', '4'),
('G', '5'),
('J', '6'),
('K', '6A'),
('W', '8');

-- --------------------------------------------------------

--
-- Table structure for table `c80power_pole_configuration`
--

CREATE TABLE `c80power_pole_configuration` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(3) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80power_pole_configuration`
--

INSERT INTO `c80power_pole_configuration` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
(1, '1NO', 1, 1, 1, 1, 1, 1, 1),
(2, '2NO', 1, 0, 0, 0, 0, 0, 0),
(4, '1NC', 1, 1, 1, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c80rh_auxiliary_contacts`
--

CREATE TABLE `c80rh_auxiliary_contacts` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(10) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80rh_auxiliary_contacts`
--

INSERT INTO `c80rh_auxiliary_contacts` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
(0, 'None', 1, 1, 1, 1, 1, 1, 1),
(1, '1NO', 1, 1, 1, 1, 1, 1, 1),
(2, '2NO', 1, 0, 0, 0, 0, 0, 0),
(3, '2NO-1NC', 1, 0, 0, 0, 0, 0, 0),
(4, '1NC', 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c80type_of_mounting`
--

CREATE TABLE `c80type_of_mounting` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(32) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80type_of_mounting`
--

INSERT INTO `c80type_of_mounting` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
(0, 'None', 1, 1, 1, 1, 1, 1, 1),
(1, 'Surface, Front of Panel', 1, 1, 1, 1, 1, 1, 1),
(3, 'Elevated, Front of Panel', 0, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c80_contactors`
--

CREATE TABLE `c80_contactors` (
  `Catalog_No` varchar(11) NOT NULL,
  `Series` varchar(3) NOT NULL,
  `NEMA_Size` varchar(2) NOT NULL,
  `Blowout_Coil_Rating` int(4) NOT NULL,
  `Power_Pole_Configuration` varchar(3) NOT NULL,
  `Coil_Voltage` varchar(7) NOT NULL,
  `Type_of_Mounting` varchar(32) NOT NULL,
  `Auxiliary_Contact_Location` varchar(64) NOT NULL,
  `LH_Auxiliary_Contacts` varchar(10) NOT NULL,
  `RH_Auxiliary_Contacts` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c80_contactors`
--

INSERT INTO `c80_contactors` (`Catalog_No`, `Series`, `NEMA_Size`, `Blowout_Coil_Rating`, `Power_Pole_Configuration`, `Coil_Voltage`, `Type_of_Mounting`, `Auxiliary_Contact_Location`, `LH_Auxiliary_Contacts`, `RH_Auxiliary_Contacts`) VALUES
('C80DC121A11', 'C80', '2', 5, '1NO', '230V DC', 'Surface, Front of Panel', 'Size 2 Side Mounted', '1NO', '1NO'),
('C80DC211B32', 'C80', '2', 5, '2NO', '115V DC', 'Surface, Front of Panel', 'Size 2 thr 8 Bottom Mounted w/LH and/or RH Interlock', '1NO-1NC', '2NO'),
('C80EH141A11', 'C80', '3', 100, '1NO', '1NC', 'Surface, Front of Panel', 'Size 2 Side Mounted', '1NO', '1NO'),
('C80EH423B44', 'C80', '3', 100, '1NC', '230V DC', 'Elevated, Front of Panel', 'Size 2 thru 8 Bottom Mounted w/LH and/or RH Interlock', '1NC', '1NC');

-- --------------------------------------------------------

--
-- Table structure for table `c82auxiliary_contact_location`
--

CREATE TABLE `c82auxiliary_contact_location` (
  `Symbol` char(1) CHARACTER SET utf8mb4 NOT NULL,
  `Value` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c82auxiliary_contact_location`
--

INSERT INTO `c82auxiliary_contact_location` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`) VALUES
('A', 'Side Mounted', 1, 0, 0, 0, 0, 0),
('B', 'Bottom Mounted w/LH and/or RH Interlock', 1, 1, 1, 1, 1, 1),
('N', 'None', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c82blowout_coil_rating`
--

CREATE TABLE `c82blowout_coil_rating` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(16) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c82blowout_coil_rating`
--

INSERT INTO `c82blowout_coil_rating` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`) VALUES
('C', '5 AMP', 1, 0, 0, 0, 0, 0),
('D', '10 AMP', 1, 0, 0, 0, 0, 0),
('F', '25 AMP', 1, 1, 0, 0, 0, 0),
('G', '50 AMP', 1, 1, 0, 0, 0, 0),
('H', '100 AMP', 0, 1, 0, 0, 0, 0),
('J', '150 AMP', 0, 0, 1, 0, 0, 0),
('K', '300 AMP', 0, 0, 0, 1, 0, 0),
('L', '600 AMP', 0, 0, 0, 0, 1, 0),
('M', '810 AMP', 0, 0, 0, 0, 0, 1),
('X', 'None', 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c82closing_coil_voltage`
--

CREATE TABLE `c82closing_coil_voltage` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c82closing_coil_voltage`
--

INSERT INTO `c82closing_coil_voltage` (`Symbol`, `Value`) VALUES
(1, '115V DC'),
(2, '230V DC');

-- --------------------------------------------------------

--
-- Table structure for table `c82hold_out_coil`
--

CREATE TABLE `c82hold_out_coil` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(64) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c82hold_out_coil`
--

INSERT INTO `c82hold_out_coil` (`Symbol`, `Value`) VALUES
(3, 'Capacitor Timed Acceleration'),
(5, 'H.O & Close Coil in Series X-Line Continuous Duty'),
(2, 'H.O. & Close Coil in Series X-Line Intermittent Duty'),
(1, 'Ltl Acceleration Across Line'),
(1, 'Ltl Acceleration on Starting Resistance'),
(2, 'Non-plug Main'),
(1, 'Plug Voltage Lock Out Contactor'),
(4, 'Rectifier Plugging Type');

-- --------------------------------------------------------

--
-- Table structure for table `c82lh_auxiliary_contacts`
--

CREATE TABLE `c82lh_auxiliary_contacts` (
  `Symbol` char(1) CHARACTER SET utf8mb4 NOT NULL,
  `Value` varchar(4) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c82lh_auxiliary_contacts`
--

INSERT INTO `c82lh_auxiliary_contacts` (`Symbol`, `Value`) VALUES
('0', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `c82nema_size`
--

CREATE TABLE `c82nema_size` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c82nema_size`
--

INSERT INTO `c82nema_size` (`Symbol`, `Value`) VALUES
('D', '2'),
('E', '3'),
('F', '4'),
('G', '5'),
('J', '6'),
('K', '6A');

-- --------------------------------------------------------

--
-- Table structure for table `c82power_pole_configuration`
--

CREATE TABLE `c82power_pole_configuration` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(3) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c82power_pole_configuration`
--

INSERT INTO `c82power_pole_configuration` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`) VALUES
(1, '1NO', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c82rh_auxiliary_contacts`
--

CREATE TABLE `c82rh_auxiliary_contacts` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c82rh_auxiliary_contacts`
--

INSERT INTO `c82rh_auxiliary_contacts` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`) VALUES
(0, 'None', 1, 1, 1, 1, 1, 1),
(1, '1NO', 0, 0, 0, 0, 0, 0),
(2, '2NO', 0, 0, 0, 0, 0, 0),
(3, '1NO-1NC', 0, 0, 0, 0, 0, 0),
(4, '1NC', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c82type_of_mounting`
--

CREATE TABLE `c82type_of_mounting` (
  `Symbol` int(1) NOT NULL,
  `Value` varchar(32) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c82type_of_mounting`
--

INSERT INTO `c82type_of_mounting` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`) VALUES
(0, 'None', 0, 1, 1, 1, 1, 0),
(1, 'Surface, Front of Panel', 11, 1, 1, 1, 1, 1),
(3, 'Elevated, Front of Panel', 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c82_contactors`
--

CREATE TABLE `c82_contactors` (
  `Catalog_No` varchar(32) NOT NULL,
  `Series` varchar(3) NOT NULL,
  `NEMA_Size` varchar(2) NOT NULL,
  `Blowout_Coil_Rating` varchar(4) NOT NULL,
  `Power_Pole_Configuration` varchar(3) NOT NULL,
  `Closing_Coil_Voltage` varchar(7) NOT NULL,
  `Type_of_Mounting` varchar(32) NOT NULL,
  `Hold_Out_Coil` varchar(64) NOT NULL,
  `Auxiliary_Contact_Location` varchar(64) NOT NULL,
  `LH_Auxiliary_Contacts` varchar(4) NOT NULL,
  `RH_Auxiliary_Contacts` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c82_contactors`
--

INSERT INTO `c82_contactors` (`Catalog_No`, `Series`, `NEMA_Size`, `Blowout_Coil_Rating`, `Power_Pole_Configuration`, `Closing_Coil_Voltage`, `Type_of_Mounting`, `Hold_Out_Coil`, `Auxiliary_Contact_Location`, `LH_Auxiliary_Contacts`, `RH_Auxiliary_Contacts`) VALUES
('C82DC1213A02', 'C82', '2', '5', '1NO', '230 VDC', 'Surface, Front of Panel', 'Elevated Mounting - Front Connected', 'Size 2 Sided Mounted', 'None', '2NO'),
('C82DH1111A02', 'C82', '2', '100', '1NO', '115V DC', 'Surface, Front of Panel', 'Surface Mounted - Front Connected', 'Size 2 Sided Mounted', 'None', '2NO'),
('C82EH1231B01', 'C82', '3', '100', '1NO', '230 VDC', 'Elevated, Front of Panel', 'Size 2 thru 8 Bottom Mounted w/L', 'Size 2 Sided Mounted', 'None', '1NO'),
('C82JL1131B03', 'C82', '6', '600', '1NO', '115V DC', 'Elevated, Front of Panel', 'Surface Mounted - Front Connected', 'Size 2 thru 8 Bottom Mounted w/LH and/or RH Interlock', 'None', '1NO-1NC');

-- --------------------------------------------------------

--
-- Table structure for table `contactor_numbers`
--

CREATE TABLE `contactor_numbers` (
  `Catalog_No` varchar(32) NOT NULL,
  `Manufacturer` text NOT NULL,
  `Series` varchar(64) NOT NULL,
  `Repco_Replacement_Link` longtext NOT NULL,
  `PDF_Location` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactor_numbers`
--

INSERT INTO `contactor_numbers` (`Catalog_No`, `Manufacturer`, `Series`, `Repco_Replacement_Link`, `PDF_Location`) VALUES
('74U12', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U121', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U121E', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U122', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U12D', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U12E', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U13', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U131', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U14', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U141', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U15', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U151', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U22', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U22D', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('74U22E', 'Clark', 'Bulletin 7400', 'http://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('912', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('913', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('914', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('915', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('916', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('920', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('921', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('923', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('924', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('925', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('926', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('932', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('933', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('934', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('935', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('936', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('944', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('945', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('952', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('988', 'BCH', 'Type 900 Mill Duty', 'https://www.repcoinc.com', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C80DC121A11', 'Cutler Hammer', 'C80', 'https://www.repcoinc.com/other/10923H11-Cutler-Hammer-Kit-PC0006-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C80DC211B32', 'Cutler Hammer', 'C80', 'https://www.repcoinc.com/other/119463-Cutler-Hammer-Mechanical-Interlock-PC0029-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C80EH141A11', 'Cutler Hammer', 'C80', 'https://www.repcoinc.com/other/12-235-Cutler-Hammer-Groove-Pins-PC0034-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C80EH423B44', 'Cutler Hammer', 'C80', 'https://www.repcoinc.com/other/13-1369-4-Cutler-Hammer-Shaft-7-PC0053-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C82DC1213A02', 'Cutler Hammer', 'C82', 'https://www.repcoinc.com/other/13-3186-1-Cutler-Hammer-Roll-Pin-PC0100-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C82DH1111A02', 'Cutler Hammer', 'C82', 'https://www.repcoinc.com/other/13-3883-3-Cutler-Hammer-Insulation-Assembly-PC0148-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C82EH1231B01', 'Cutler Hammer', 'C82', 'https://www.repcoinc.com/other/13-4762-Cutler-Hammer-Groove-Pins-PC0175-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('C82JL1131B03', 'Cutler Hammer', 'C82', 'https://www.repcoinc.com/other/13-734-Cutler-Hammer-Adjusting-Pin-PC0201-omsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A1B01XEA002XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A2B01XFA002XK', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A2C01FXA002XN', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A2C01FXA022XK', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/273A2425G1_Contactor_GE_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A2C02FXA022XK', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A2D01FFA002XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5637G1_General_Electric_Electrical_Contactor_DS303A3-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3A01GXA003XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3A01GXA021XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3B01XGA002XK', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3C01GXA002XN', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5614G1_Electrical_Contact_GE_DS303A1_DS303A2-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3C01GXA003XF', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3C01GXA003XJ', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A3D01GGA003XF', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A4A01HXA002XJ', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A4A01HXA002XL', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A4B01XHA002XF', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A4B01XHA003XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A5A01JXA002XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A5A01JXA003XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A5A01JXA010XF', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A5A01JXA022XH', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A5C01JXA003XG', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A6A01KXA003XG', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303A7A01LXA002XF', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303B2A01FXA013XK', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf'),
('DS303B3A01GXA002XF', 'General Electric', 'DS303', 'https://www.repcoinc.com/contacts/259A5562G1_General_Electric_Contactors_DS303A6_DS303A7-ecmsd.html', 'RC100003_1P_NO_Data_Sheet.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `ds303auxiliaries`
--

CREATE TABLE `ds303auxiliaries` (
  `id` int(5) NOT NULL,
  `Symbol` varchar(2) NOT NULL,
  `Value` varchar(64) NOT NULL,
  `Size_1` int(1) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_7` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303auxiliaries`
--

INSERT INTO `ds303auxiliaries` (`id`, `Symbol`, `Value`, `Size_1`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_7`) VALUES
(1, 'AF', '2NO - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(2, 'AG', '2NO - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(3, 'AH', '1NO/1NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(4, 'AJ', '1NO/1NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(5, 'AK', '2NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(6, 'AL', '2NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(7, 'DF', '2NO - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(8, 'DG', '2NO - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(9, 'DH', '1NO/1NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(10, 'DJ', '1NO/1NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(11, 'DK', '2NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(12, 'DL', '2NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(13, 'EF', '2NO - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 0, 0),
(14, 'EG', '2NO - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 0, 0),
(15, 'EH', '1NO/1NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 0, 0),
(16, 'EJ', '1NO/1NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 0, 0),
(17, 'EK', '2NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 0, 0),
(18, 'EL', '2NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 0, 0),
(19, 'XF', '2NO - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(20, 'XG', '2NO - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(21, 'XH', '1NO/1NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(22, 'XJ', '1NO/1NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(23, 'XK', '2NC - LEFT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(24, 'XL', '2NC - RIGHT HAND MOUNTING', 1, 1, 1, 1, 1, 1, 1),
(25, 'XM', '2NO (LEFT HAND MOUNTING) & 2NO (RIGHT HAND MOUNTING)', 0, 1, 1, 1, 1, 1, 1),
(26, 'XN', '2NO (LEFT HAND MOUNTING) & 1NO/1NC (RIGHT HAND MOUNTING)', 0, 1, 1, 1, 1, 1, 1),
(27, 'XP', '2NO (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 1, 1, 1, 1, 0, 0),
(28, 'XP', '1NO/1NC (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 0, 0, 1, 1),
(29, 'XR', '1NO/1NC (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 1, 1, 1, 1, 1, 1),
(30, 'XS', '2NC (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 1, 1, 1, 1, 1, 1),
(31, 'AN', '2NO (LEFT HAND MOUNTING) & 1NO/1NC (RIGHT HAND MOUNTING)', 0, 0, 1, 1, 1, 1, 1),
(32, 'AP', '2NO (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 1, 1, 1, 1, 1),
(33, 'AR', '1NO/1NC (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 1, 0, 0, 1, 1),
(34, 'AR', '2NO (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 0, 0),
(35, 'AS', '2NC (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 1, 1, 1, 1, 1),
(36, 'AM', '2NO (LEFT HAND MOUNTING) & 2NO (RIGHT HAND MOUNTING)', 0, 0, 1, 1, 1, 1, 1),
(37, 'DM', '2NO (LEFT HAND MOUNTING) & 2NO (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 1, 1),
(38, 'DN', '2NO (LEFT HAND MOUNTING) & 1NO/1NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 1, 1),
(39, 'DP', '2NO (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 1, 1),
(40, 'DR', '1NO/1NC (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 1, 1),
(41, 'DS', '2NC (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 1, 1),
(42, 'EM', '2NO (LEFT HAND MOUNTING) & 2NO (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 0, 0),
(43, 'EN', '2NO (LEFT HAND MOUNTING) & 1NO/1NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 0, 0),
(44, 'EP', '2NO (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 0, 0),
(45, 'ER', '1NO/1NC (RIGHT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 0, 0),
(46, 'ES', '2NC (LEFT HAND MOUNTING) & 2NC (RIGHT HAND MOUNTING)', 0, 0, 0, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ds303blowout_coil_rating`
--

CREATE TABLE `ds303blowout_coil_rating` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(16) NOT NULL,
  `Size_1` int(1) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_7` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303blowout_coil_rating`
--

INSERT INTO `ds303blowout_coil_rating` (`Symbol`, `Value`, `Size_1`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_7`) VALUES
('A', 'Less Blowout', 1, 1, 1, 1, 1, 1, 1),
('B', '2 AMP', 1, 0, 0, 0, 0, 0, 0),
('C', '5 AMP', 1, 1, 0, 0, 0, 0, 0),
('D', '10 AMP', 1, 1, 0, 0, 0, 0, 0),
('E', '25 AMP', 1, 1, 1, 0, 0, 0, 0),
('F', '50 AMP', 0, 1, 1, 1, 0, 0, 0),
('G', '100 AMP', 0, 0, 1, 1, 0, 0, 0),
('H', '150 AMP', 0, 0, 0, 1, 1, 0, 0),
('J', '300 AMP', 0, 0, 0, 0, 1, 0, 0),
('K', '600 AMP', 0, 0, 0, 0, 0, 1, 0),
('L', '900 AMP', 0, 0, 0, 0, 0, 0, 1),
('X', 'Pole Eliminated', 1, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ds303coil_voltage`
--

CREATE TABLE `ds303coil_voltage` (
  `ID` int(5) NOT NULL,
  `Symbol` varchar(4) NOT NULL,
  `Value` varchar(16) NOT NULL,
  `Size_1` int(1) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_7` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303coil_voltage`
--

INSERT INTO `ds303coil_voltage` (`ID`, `Symbol`, `Value`, `Size_1`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_7`) VALUES
(1, 'A002', '230/250 VDC', 1, 1, 1, 1, 1, 1, 1),
(2, 'A003', '115/120 VDC', 1, 1, 1, 1, 1, 1, 1),
(3, 'A004', '475/500 VDC', 1, 1, 1, 1, 1, 1, 1),
(4, 'A005', '550 VDC', 1, 1, 1, 1, 1, 1, 1),
(5, 'A006', '600 VDC', 1, 1, 1, 1, 1, 0, 0),
(6, 'A007', '6 VDC', 0, 0, 1, 0, 0, 0, 0),
(7, 'A008', '12 VDC', 1, 1, 1, 1, 1, 1, 1),
(8, 'A009', '18/20 VDC', 0, 1, 1, 1, 1, 1, 1),
(9, 'A010', '24 VDC', 1, 1, 1, 1, 1, 1, 1),
(10, 'A011', '28 VDC', 0, 1, 1, 1, 1, 1, 1),
(11, 'A012', '32 VDC', 1, 1, 1, 1, 1, 1, 1),
(12, 'A013', '38 VDC', 1, 1, 1, 1, 1, 0, 0),
(13, 'A014', '48/50 VDC', 1, 1, 1, 1, 1, 1, 1),
(14, 'A015', '55/60 VDC', 1, 0, 0, 0, 0, 0, 0),
(15, 'A016', '62/68 VDC', 1, 1, 1, 1, 1, 1, 1),
(16, 'A017', '74 VDC', 1, 1, 1, 1, 1, 0, 0),
(17, 'A018', '78 VDC', 1, 1, 1, 1, 1, 1, 1),
(18, 'A019', '80 VDC', 1, 0, 1, 0, 0, 0, 0),
(19, 'A020', '90 VDC', 1, 1, 1, 1, 1, 0, 0),
(20, 'A021', '100 VDC', 1, 1, 1, 1, 1, 1, 1),
(21, 'A022', '135 VDC', 0, 1, 1, 1, 1, 0, 0),
(22, 'A023', '150 VDC', 1, 1, 1, 1, 1, 1, 1),
(23, 'A024', '165 VDC', 0, 1, 1, 1, 1, 0, 0),
(24, 'A025', '180/190 VDC', 1, 1, 1, 1, 1, 1, 1),
(25, 'A026', '200 VDC', 0, 0, 1, 0, 0, 0, 0),
(27, 'A028', '300 VDC', 1, 1, 1, 1, 1, 1, 1),
(28, 'A029', '350 VDC', 1, 0, 0, 0, 0, 0, 0),
(29, 'A030', '380 VDC', 0, 1, 1, 1, 1, 0, 0),
(31, 'A027', '275 VDC', 1, 1, 1, 1, 1, 1, 1),
(35, 'A031', '440 VDC', 1, 0, 1, 0, 0, 1, 1),
(36, 'A032', '67 VDC', 0, 1, 1, 1, 1, 0, 0),
(37, 'A032', '13.6 VDC', 1, 0, 0, 0, 0, 0, 0),
(38, 'A032', '16 VDC', 0, 0, 0, 0, 0, 1, 1),
(39, 'A033', '36 VDC', 0, 0, 0, 0, 0, 1, 1),
(40, 'A033', '50 VDC', 0, 1, 1, 1, 1, 0, 0),
(41, 'A034', '600 VDC', 0, 1, 1, 1, 1, 0, 0),
(42, 'A034', '40 VDC', 0, 0, 0, 0, 0, 1, 1),
(43, 'A035', '120 VDC', 0, 1, 1, 1, 1, 0, 0),
(44, 'A035', '110 VDC', 0, 0, 0, 0, 0, 1, 1),
(45, 'A009', '15/20 VDC', 1, 0, 0, 0, 0, 0, 0),
(47, 'A502', '230/250 VDC', 1, 1, 1, 1, 1, 0, 0),
(48, 'A503', '115/120 VDC', 1, 1, 1, 1, 1, 0, 0),
(49, 'A650', '115 AC', 1, 0, 1, 0, 0, 1, 1),
(50, 'A651', '230 AC', 1, 0, 1, 0, 0, 1, 1),
(51, 'A652', '460 AC', 1, 0, 1, 0, 0, 1, 1),
(52, 'A653', '575 AC', 1, 0, 1, 0, 0, 1, 1),
(53, 'A654', '380 AC', 0, 0, 0, 0, 0, 1, 1),
(54, 'B002', '230/250 VDC', 1, 0, 0, 0, 0, 0, 0),
(55, 'B013', '38 VDC', 1, 1, 1, 1, 1, 0, 0),
(56, 'C013', '38 VDC', 1, 1, 1, 1, 1, 0, 0),
(57, 'C018', '78 VDC', 0, 1, 1, 1, 1, 0, 0),
(58, 'C019', '80 VDC', 1, 0, 0, 0, 0, 0, 0),
(59, 'J202', '230/250 VDC', 1, 1, 1, 1, 1, 0, 0),
(60, 'J203', '115/120 VDC', 1, 1, 1, 1, 1, 0, 0),
(61, 'J204', '90 VDC', 1, 0, 0, 0, 0, 0, 0),
(62, 'J204', '500 VDC', 0, 1, 1, 1, 1, 0, 0),
(63, 'J205', '62 VDC', 1, 0, 0, 0, 0, 0, 0),
(64, 'J205', '550/600 VDC', 0, 1, 1, 1, 1, 0, 0),
(65, 'J206', '90 VDC', 1, 0, 1, 0, 0, 0, 0),
(66, 'J207', '115/120 VDC', 1, 0, 0, 0, 0, 0, 0),
(67, 'J207', '62 VDC', 0, 0, 1, 0, 0, 0, 0),
(68, 'J208', '230/250 VDC', 1, 0, 0, 0, 0, 0, 0),
(69, 'J208', '115/120 VDC', 0, 0, 1, 0, 0, 0, 0),
(70, 'J209', '62 VDC', 0, 0, 1, 0, 0, 0, 0),
(71, 'J209', '150 VDC', 1, 0, 0, 0, 0, 0, 0),
(72, 'J210', '125 VDC', 1, 0, 0, 0, 0, 0, 0),
(73, 'J210', '48 VDC', 0, 0, 1, 0, 0, 0, 0),
(74, 'J211', '200 VDC', 0, 0, 1, 0, 0, 0, 0),
(75, 'J212', '150 VDC', 0, 0, 1, 0, 0, 0, 0),
(76, 'J213', '200 VDC', 0, 0, 1, 0, 0, 0, 0),
(77, 'J214', '275 VDC', 0, 0, 1, 0, 0, 0, 0),
(78, 'J215', '230/250 VDC', 0, 0, 1, 0, 0, 0, 0),
(79, 'J216', '200 VDC', 0, 0, 1, 0, 0, 0, 0),
(80, 'J217', '32 VDC', 0, 0, 1, 0, 0, 0, 0),
(81, 'J218', '90 VDC', 0, 0, 1, 0, 0, 0, 0),
(82, 'J219', '440 VDC', 0, 0, 1, 0, 1, 0, 0),
(83, 'J220', '78 VDC', 0, 0, 1, 0, 0, 0, 0),
(84, 'J221', '38 VDC', 0, 0, 1, 0, 0, 0, 0),
(85, 'G002', '230 VDC', 0, 1, 1, 1, 1, 0, 0),
(86, 'G003', '115 VDC', 0, 1, 1, 1, 1, 0, 0),
(87, 'G004', '500 VDC', 0, 1, 1, 1, 1, 0, 0),
(88, 'G006', '600 VDC', 0, 1, 1, 1, 1, 0, 0),
(89, 'G009', '18/20 VDC', 0, 1, 1, 1, 1, 0, 0),
(90, 'G010', '24 VDC', 0, 1, 1, 1, 1, 0, 0),
(91, 'G013', '38 VDC', 0, 1, 1, 1, 1, 0, 0),
(92, 'G015', '55/60 VDC', 0, 1, 1, 1, 1, 0, 0),
(93, 'G018', '78 VDC', 0, 1, 1, 1, 1, 0, 0),
(94, 'G020', '90 VDC', 0, 1, 1, 1, 1, 0, 0),
(95, 'G027', '275 VDC', 0, 1, 1, 1, 1, 0, 0),
(96, 'G028', '300 VDC', 0, 1, 1, 1, 1, 0, 0),
(97, 'G032', '20 VDC', 0, 1, 1, 1, 1, 0, 0),
(98, 'G033', '115 VDC', 0, 1, 1, 1, 1, 0, 0),
(99, 'G650', '115 AC', 0, 1, 1, 1, 1, 0, 0),
(100, 'G651', '230 AC', 0, 1, 1, 1, 0, 0, 0),
(101, 'G652', '460 AC', 0, 1, 1, 1, 0, 0, 0),
(102, 'G653', '575 AC', 0, 1, 1, 1, 0, 0, 0),
(103, 'G654', '380 AC', 0, 1, 1, 1, 1, 0, 0),
(104, 'J206', '62 VDC', 0, 1, 1, 1, 1, 0, 0),
(105, 'J207', '190 VDC', 0, 1, 1, 1, 1, 0, 0),
(106, 'J208', '90 VDC', 0, 1, 1, 1, 1, 0, 0),
(107, 'J209', '90 VDC', 0, 1, 1, 1, 1, 0, 0),
(108, 'J210', '78 VDC', 0, 1, 1, 1, 1, 0, 0),
(109, 'J211', '230/250 VDC', 0, 1, 1, 1, 1, 0, 0),
(110, 'J212', '230/250 VDC', 0, 1, 1, 1, 1, 0, 0),
(111, 'J213', '115/120 VDC', 0, 1, 1, 1, 1, 0, 0),
(112, 'J214', '115/120 VDC', 0, 1, 1, 1, 1, 0, 0),
(113, 'J215', '115/120 VDC', 0, 1, 1, 1, 1, 0, 0),
(114, 'J216', '230/250 VDC', 0, 1, 1, 1, 1, 0, 0),
(115, 'J217', '38 VDC', 0, 1, 1, 1, 1, 0, 0),
(116, 'J218', '200 VDC', 0, 1, 1, 1, 1, 0, 0),
(117, 'J219', '78 VDC', 0, 1, 1, 1, 1, 0, 0),
(118, 'J220', '190 VDC', 0, 1, 1, 1, 1, 0, 0),
(119, 'J221', '135 VDC', 0, 1, 1, 1, 1, 0, 0),
(120, 'J222', '62 VDC', 0, 1, 1, 1, 1, 0, 0),
(121, 'J223', '78 VDC', 0, 1, 1, 1, 1, 0, 0),
(122, 'J224', '600 VDC', 0, 1, 1, 1, 1, 0, 0),
(123, 'J225', '230/250 VDC', 0, 1, 1, 1, 1, 0, 0),
(124, 'J226', '230 VDC', 0, 1, 1, 1, 1, 0, 0),
(125, 'J227', '230/250 VDC', 0, 1, 1, 1, 1, 0, 0),
(126, 'J228', '90 VDC', 0, 1, 1, 1, 1, 0, 0),
(127, 'J229', '230/250 VDC', 0, 1, 1, 1, 1, 0, 0),
(128, 'J230', '144 VDC', 0, 1, 1, 1, 1, 0, 0),
(129, 'J231', '74 VDC', 0, 1, 1, 1, 1, 0, 0),
(130, 'A050', '1.42 AMPS', 0, 0, 1, 0, 0, 0, 0),
(131, 'A051', '2.86 AMPS', 0, 0, 1, 0, 0, 0, 0),
(132, 'A052', '1.95 AMPS', 0, 0, 1, 0, 0, 0, 0),
(133, 'A053', '6.40 AMPS', 0, 0, 1, 0, 0, 0, 0),
(134, 'A055', '0.40 AMPS', 0, 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ds303contact_pole_configuration`
--

CREATE TABLE `ds303contact_pole_configuration` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(32) NOT NULL,
  `Size_1` int(1) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_7` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303contact_pole_configuration`
--

INSERT INTO `ds303contact_pole_configuration` (`Symbol`, `Value`, `Size_1`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_7`) VALUES
('A', '1NO', 1, 1, 1, 1, 1, 1, 1),
('B', '1NC', 1, 1, 1, 1, 1, 0, 0),
('C', '2NO', 0, 1, 1, 1, 1, 0, 0),
('D', '1NO / 1NC', 1, 1, 1, 1, 1, 0, 0),
('E', '2NO / 1NC', 0, 1, 1, 1, 1, 0, 0),
('F', '2NO / 2NC', 0, 1, 1, 0, 0, 0, 0),
('G', '1NC WITH HOLDING COIL', 1, 1, 1, 1, 1, 0, 0),
('J', '1NO/1NC WITH HOLDING COIL', 1, 1, 1, 1, 1, 0, 0),
('K', '2NO/1NC WITH HOLDING COIL', 0, 1, 1, 1, 1, 0, 0),
('L', '2NO / 2NC WITH HOLDING COIL', 0, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ds303electromechanical_configuration`
--

CREATE TABLE `ds303electromechanical_configuration` (
  `Symbol` varchar(2) NOT NULL,
  `Value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303electromechanical_configuration`
--

INSERT INTO `ds303electromechanical_configuration` (`Symbol`, `Value`) VALUES
('01', 'Front Connected'),
('02', 'Back Connected');

-- --------------------------------------------------------

--
-- Table structure for table `ds303nc_blowout_coil_rating`
--

CREATE TABLE `ds303nc_blowout_coil_rating` (
  `Symbol` varchar(1) NOT NULL,
  `Value` varchar(16) NOT NULL,
  `Size_1` int(1) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_7` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303nc_blowout_coil_rating`
--

INSERT INTO `ds303nc_blowout_coil_rating` (`Symbol`, `Value`, `Size_1`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_7`) VALUES
('A', 'Less Blowout', 1, 1, 1, 1, 1, 1, 1),
('B', '2 Amp', 1, 0, 0, 0, 0, 0, 0),
('C', '5', 1, 1, 0, 0, 0, 0, 0),
('D', '10', 1, 1, 0, 0, 0, 0, 0),
('E', '25', 1, 1, 1, 0, 0, 0, 0),
('F', '50', 0, 1, 1, 1, 0, 0, 0),
('G', '100', 0, 0, 1, 1, 0, 0, 0),
('H', '150', 0, 0, 0, 1, 1, 0, 0),
('J', '300', 0, 0, 0, 0, 1, 0, 0),
('K', '600 AMP', 0, 0, 0, 0, 0, 1, 0),
('L', '900 AMP', 0, 0, 0, 0, 0, 0, 1),
('X', 'Pole Eliminated', 1, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ds303nema_size`
--

CREATE TABLE `ds303nema_size` (
  `Symbol` int(1) NOT NULL,
  `Value` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303nema_size`
--

INSERT INTO `ds303nema_size` (`Symbol`, `Value`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `ds303voltage`
--

CREATE TABLE `ds303voltage` (
  `Symbol` char(1) NOT NULL,
  `Value` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303voltage`
--

INSERT INTO `ds303voltage` (`Symbol`, `Value`) VALUES
('A', '600 Volts'),
('B', '1000 Volts');

-- --------------------------------------------------------

--
-- Table structure for table `ds303_contactors`
--

CREATE TABLE `ds303_contactors` (
  `Catalog_No` varchar(32) NOT NULL,
  `Series` varchar(5) NOT NULL,
  `Voltage` varchar(4) NOT NULL,
  `NEMA_Size` int(2) NOT NULL,
  `Contact_Pole_Configuration` varchar(32) NOT NULL,
  `Electromechanical_Configuration` text NOT NULL,
  `Blowout_Coil_Rating` varchar(20) NOT NULL,
  `NC_Blowout_Coil_Rating` varchar(20) NOT NULL,
  `Coil_Voltage` varchar(32) NOT NULL,
  `Auxiliaries` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ds303_contactors`
--

INSERT INTO `ds303_contactors` (`Catalog_No`, `Series`, `Voltage`, `NEMA_Size`, `Contact_Pole_Configuration`, `Electromechanical_Configuration`, `Blowout_Coil_Rating`, `NC_Blowout_Coil_Rating`, `Coil_Voltage`, `Auxiliaries`) VALUES
('DS303A1B01XEA002XH', 'DS303', '600 ', 1, 'NC', 'Front Connected', 'Pole Eliminated', '25', '230/250VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A2B01XFA002XK', 'DS303', '600 ', 2, 'NC', 'Front Connected', 'Pole Eliminated', '50', '230/250VDC', '2NC - LEFT HAND MOUNTING'),
('DS303A2C01FXA002XN', 'DS303', '600 ', 2, '2NO', 'Front Connected', '50', 'Pole Eliminated', '230/250VDC', ''),
('DS303A2C01FXA022XK', 'DS303', '600 ', 2, '2NO', 'Front Connected', '50', 'Pole Eliminated', '135VDC', '2NC - LEFT HAND MOUNTING'),
('DS303A2C02FXA022XK', 'DS303', '600 ', 2, '2NO', 'Back Connected', '50', 'Pole Eliminated', '135VDC', '2NC - LEFT HAND MOUNTING'),
('DS303A2D01FFA002XH', 'DS303', '600 ', 2, '1NO/1NC', 'Front Connected', '50', '50', '230/250VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A3A01GXA003XH', 'DS303', '600 ', 3, 'NO', 'Front Connected', '100', 'Pole Eliminated', '115/120VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A3A01GXA021XH', 'DS303', '600 ', 3, 'NO', 'Front Connected', '100', 'Pole Eliminated', '100VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A3B01XGA002XK', 'DS303', '600 ', 3, 'NC', 'Front Connected', 'Pole Eliminated', '100', '230/250VDC', '2NC - LEFT HAND MOUNTING'),
('DS303A3C01GXA002XN', 'DS303', '600 ', 3, '2NO', 'Front Connected', '100', 'Pole Eliminated', '230/250VDC', ''),
('DS303A3C01GXA003XF', 'DS303', '600 ', 3, '2NO', 'Front Connected', '100', 'Pole Eliminated', '115/120VDC', '2NO - LEFT HAND MOUNTING'),
('DS303A3C01GXA003XJ', 'DS303', '600 ', 3, '2NO', 'Front Connected', '100', 'Pole Eliminated', '115/120VDC', '1NO/1NC - RIGHT HAND MOUNTING'),
('DS303A3D01GGA003XF', 'DS303', '600 ', 3, '1NO/1NC', 'Front Connected', '100', '100', '115/120VDC', '2NO - LEFT HAND MOUNTING'),
('DS303A4A01HXA002XJ', 'DS303', '600 ', 4, 'NO', 'Front Connected', '150', 'Pole Eliminated', '230/250VDC', '1NO/1NC - RIGHT HAND MOUNTING'),
('DS303A4A01HXA002XL', 'DS303', '600 ', 4, 'NO', 'Front Connected', '150', 'Pole Eliminated', '230/250VDC', '2NC - RIGHT HAND MOUNTING'),
('DS303A4B01XHA002XF', 'DS303', '600 ', 4, 'NC', 'Front Connected', 'Pole Eliminated', '150', '230/250VDC', '2NO - LEFT HAND MOUNTING'),
('DS303A4B01XHA003XH', 'DS303', '600 ', 4, 'NC', 'Front Connected', 'Pole Eliminated', '150', '115/120VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A5A01JXA002XH', 'DS303', '600 ', 5, 'NO', 'Front Connected', '300', 'Pole Eliminated', '230/250VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A5A01JXA003XH', 'DS303', '600 ', 5, 'NO', 'Front Connected', '300', 'Pole Eliminated', '115/120VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A5A01JXA010XF', 'DS303', '600 ', 5, 'NO', 'Front Connected', '300', 'Pole Eliminated', '24VDC', '2NO - LEFT HAND MOUNTING'),
('DS303A5A01JXA022XH', 'DS303', '600 ', 5, 'NO', 'Front Connected', '300', 'Pole Eliminated', '135VDC', '1NO/1NC - LEFT HAND MOUNTING'),
('DS303A5C01JXA003XG', 'DS303', '600 ', 5, '2NO', 'Front Connected', '300', 'Pole Eliminated', '115/120VDC', '2NO - RIGHT HAND MOUNTING'),
('DS303A6A01KXA003XG', 'DS303', '600 ', 6, 'NO', 'Front Connected', '', 'Pole Eliminated', '115/120VDC', '2NO - RIGHT HAND MOUNTING'),
('DS303A7A01LXA002XF', 'DS303', '600 ', 7, 'NO', 'Front Connected', '', 'Pole Eliminated', '230/250VDC', '2NO - LEFT HAND MOUNTING'),
('DS303B2A01FXA013XK', 'DS303', '1000', 2, 'NO', 'Front Connected', '50', 'Pole Eliminated', '38VDC', '2NC - LEFT HAND MOUNTING'),
('DS303B3A01GXA002XF', 'DS303', '1000', 3, 'NO', 'Front Connected', '100', 'Pole Eliminated', '230/250VDC', '2NO - LEFT HAND MOUNTING');

-- --------------------------------------------------------

--
-- Table structure for table `series_tables`
--

CREATE TABLE `series_tables` (
  `Series_Name` varchar(32) NOT NULL,
  `Table_Name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `series_tables`
--

INSERT INTO `series_tables` (`Series_Name`, `Table_Name`) VALUES
('Bulletin 7400', 'bulletin_7400_contactors'),
('C80', 'c80_contactors'),
('C82', 'c82_contactors'),
('DS303', 'ds303_contactors'),
('Type 900 Mill Duty', 'type_900_mill_duty_contactors');

-- --------------------------------------------------------

--
-- Table structure for table `type_900_mill_dutyblowout_coil_rating`
--

CREATE TABLE `type_900_mill_dutyblowout_coil_rating` (
  `Symbol` int(11) DEFAULT NULL,
  `Value` int(11) NOT NULL,
  `Size_2` int(11) NOT NULL,
  `Size_3` int(11) NOT NULL,
  `Size_4` int(11) NOT NULL,
  `Size_5` int(11) NOT NULL,
  `Size_6` int(11) NOT NULL,
  `Size_6A` int(11) NOT NULL,
  `Size_8` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_900_mill_dutyblowout_coil_rating`
--

INSERT INTO `type_900_mill_dutyblowout_coil_rating` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
(NULL, 50, 1, 0, 0, 0, 0, 0, 0),
(NULL, 100, 0, 1, 0, 0, 0, 0, 0),
(NULL, 150, 0, 0, 1, 0, 0, 0, 0),
(NULL, 300, 0, 0, 0, 1, 0, 0, 0),
(NULL, 600, 0, 0, 0, 0, 1, 0, 0),
(NULL, 810, 0, 0, 0, 0, 0, 1, 0),
(NULL, 1350, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type_900_mill_dutymain_contact_arrangement`
--

CREATE TABLE `type_900_mill_dutymain_contact_arrangement` (
  `Symbol` int(11) DEFAULT NULL,
  `Value` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_900_mill_dutymain_contact_arrangement`
--

INSERT INTO `type_900_mill_dutymain_contact_arrangement` (`Symbol`, `Value`) VALUES
(NULL, '1NC'),
(NULL, '1NO'),
(NULL, '1NO ITL');

-- --------------------------------------------------------

--
-- Table structure for table `type_900_mill_dutypoles`
--

CREATE TABLE `type_900_mill_dutypoles` (
  `Symbol` int(11) DEFAULT NULL,
  `Value` int(1) NOT NULL,
  `Size_2` int(1) NOT NULL,
  `Size_3` int(1) NOT NULL,
  `Size_4` int(1) NOT NULL,
  `Size_5` int(1) NOT NULL,
  `Size_6` int(1) NOT NULL,
  `Size_6A` int(1) NOT NULL,
  `Size_8` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_900_mill_dutypoles`
--

INSERT INTO `type_900_mill_dutypoles` (`Symbol`, `Value`, `Size_2`, `Size_3`, `Size_4`, `Size_5`, `Size_6`, `Size_6A`, `Size_8`) VALUES
(NULL, 1, 1, 1, 1, 1, 1, 1, 1),
(NULL, 2, 1, 0, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `type_900_mill_dutysize`
--

CREATE TABLE `type_900_mill_dutysize` (
  `Symbol` int(11) DEFAULT NULL,
  `Value` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_900_mill_dutysize`
--

INSERT INTO `type_900_mill_dutysize` (`Symbol`, `Value`) VALUES
(NULL, '2'),
(NULL, '3'),
(NULL, '4'),
(NULL, '5'),
(NULL, '6'),
(NULL, '6A'),
(NULL, '8');

-- --------------------------------------------------------

--
-- Table structure for table `type_900_mill_duty_contactors`
--

CREATE TABLE `type_900_mill_duty_contactors` (
  `Catalog_No` varchar(16) NOT NULL,
  `Series` varchar(64) NOT NULL,
  `Size` varchar(2) NOT NULL,
  `Poles` int(1) NOT NULL,
  `Main Contact Arrangement` varchar(15) NOT NULL,
  `Blowout_Coil_Rating` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_900_mill_duty_contactors`
--

INSERT INTO `type_900_mill_duty_contactors` (`Catalog_No`, `Series`, `Size`, `Poles`, `Main Contact Arrangement`, `Blowout_Coil_Rating`) VALUES
('912', 'Type 900 Mill Duty', '2', 1, '1NO', 50),
('913', 'Type 900 Mill Duty', '3', 1, '1NO', 100),
('914', 'Type 900 Mill Duty', '4', 1, '1NO', 150),
('915', 'Type 900 Mill Duty', '5', 1, '1NO', 300),
('916', 'Type 900 Mill Duty', '6', 1, '1NO', 600),
('920', 'Type 900 Mill Duty', '6A', 1, '1NO', 810),
('921', 'Type 900 Mill Duty', '6A', 1, '1NO', 810),
('923', 'Type 900 Mill Duty', '3', 1, '1NC', 100),
('924', 'Type 900 Mill Duty', '4', 1, '1NC', 150),
('925', 'Type 900 Mill Duty', '5', 1, '1NC', 300),
('926', 'Type 900 Mill Duty', '6', 1, '1NC', 600),
('932', 'Type 900 Mill Duty', '2', 1, '1NO ITL', 50),
('933', 'Type 900 Mill Duty', '3', 1, '1NO ITL', 100),
('934', 'Type 900 Mill Duty', '4', 1, '1NO ITL', 150),
('935', 'Type 900 Mill Duty', '5', 1, '1NO ITL', 300),
('936', 'Type 900 Mill Duty', '6', 1, '1NO ITL', 600),
('944', 'Type 900 Mill Duty', '4', 2, '1NO ITL', 150),
('945', 'Type 900 Mill Duty', '5', 2, '1NO ITL', 300),
('952', 'Type 900 Mill Duty', '2', 2, '1NO ITL', 50),
('988', 'Type 900 Mill Duty', '8', 1, '1NO', 1350);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bulletin_7400blowout_coil_rating`
--
ALTER TABLE `bulletin_7400blowout_coil_rating`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `bulletin_7400nema_Size`
--
ALTER TABLE `bulletin_7400nema_Size`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `bulletin_7400power_pole_configuration`
--
ALTER TABLE `bulletin_7400power_pole_configuration`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `bulletin_7400type`
--
ALTER TABLE `bulletin_7400type`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `bulletin_7400_contactors`
--
ALTER TABLE `bulletin_7400_contactors`
  ADD PRIMARY KEY (`Catalog_No`);

--
-- Indexes for table `c80auxiliary_contact_location`
--
ALTER TABLE `c80auxiliary_contact_location`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80blowout_coil_rating`
--
ALTER TABLE `c80blowout_coil_rating`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80coil_voltage`
--
ALTER TABLE `c80coil_voltage`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80lh_auxiliary_contacts`
--
ALTER TABLE `c80lh_auxiliary_contacts`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80nema_size`
--
ALTER TABLE `c80nema_size`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80power_pole_configuration`
--
ALTER TABLE `c80power_pole_configuration`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80rh_auxiliary_contacts`
--
ALTER TABLE `c80rh_auxiliary_contacts`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80type_of_mounting`
--
ALTER TABLE `c80type_of_mounting`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c80_contactors`
--
ALTER TABLE `c80_contactors`
  ADD PRIMARY KEY (`Catalog_No`);

--
-- Indexes for table `c82auxiliary_contact_location`
--
ALTER TABLE `c82auxiliary_contact_location`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82blowout_coil_rating`
--
ALTER TABLE `c82blowout_coil_rating`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82closing_coil_voltage`
--
ALTER TABLE `c82closing_coil_voltage`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82hold_out_coil`
--
ALTER TABLE `c82hold_out_coil`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `c82lh_auxiliary_contacts`
--
ALTER TABLE `c82lh_auxiliary_contacts`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82nema_size`
--
ALTER TABLE `c82nema_size`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82power_pole_configuration`
--
ALTER TABLE `c82power_pole_configuration`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82rh_auxiliary_contacts`
--
ALTER TABLE `c82rh_auxiliary_contacts`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82type_of_mounting`
--
ALTER TABLE `c82type_of_mounting`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `c82_contactors`
--
ALTER TABLE `c82_contactors`
  ADD PRIMARY KEY (`Catalog_No`);

--
-- Indexes for table `contactor_numbers`
--
ALTER TABLE `contactor_numbers`
  ADD PRIMARY KEY (`Catalog_No`);

--
-- Indexes for table `ds303auxiliaries`
--
ALTER TABLE `ds303auxiliaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ds303blowout_coil_rating`
--
ALTER TABLE `ds303blowout_coil_rating`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `ds303coil_voltage`
--
ALTER TABLE `ds303coil_voltage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ds303contact_pole_configuration`
--
ALTER TABLE `ds303contact_pole_configuration`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `ds303electromechanical_configuration`
--
ALTER TABLE `ds303electromechanical_configuration`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `ds303nc_blowout_coil_rating`
--
ALTER TABLE `ds303nc_blowout_coil_rating`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `ds303nema_size`
--
ALTER TABLE `ds303nema_size`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `ds303voltage`
--
ALTER TABLE `ds303voltage`
  ADD PRIMARY KEY (`Symbol`);

--
-- Indexes for table `ds303_contactors`
--
ALTER TABLE `ds303_contactors`
  ADD PRIMARY KEY (`Catalog_No`);

--
-- Indexes for table `series_tables`
--
ALTER TABLE `series_tables`
  ADD PRIMARY KEY (`Series_Name`);

--
-- Indexes for table `type_900_mill_dutyblowout_coil_rating`
--
ALTER TABLE `type_900_mill_dutyblowout_coil_rating`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `type_900_mill_dutymain_contact_arrangement`
--
ALTER TABLE `type_900_mill_dutymain_contact_arrangement`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `type_900_mill_dutypoles`
--
ALTER TABLE `type_900_mill_dutypoles`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `type_900_mill_dutysize`
--
ALTER TABLE `type_900_mill_dutysize`
  ADD PRIMARY KEY (`Value`);

--
-- Indexes for table `type_900_mill_duty_contactors`
--
ALTER TABLE `type_900_mill_duty_contactors`
  ADD PRIMARY KEY (`Catalog_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ds303auxiliaries`
--
ALTER TABLE `ds303auxiliaries`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ds303coil_voltage`
--
ALTER TABLE `ds303coil_voltage`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
