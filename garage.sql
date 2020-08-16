-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2020 at 02:23 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garage`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT 1,
  `comment` varchar(60) DEFAULT NULL,
  `id_customer` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `id_mechanic` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `id_service` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `date`, `status`, `comment`, `id_customer`, `id_car`, `id_mechanic`, `time`, `id_service`) VALUES
(18, '2020-08-16', 1, '', 2, 1, 19, '08:00:00', 1),
(19, '2020-08-16', 2, '', 2, 2, 20, '08:00:00', 2),
(20, '2020-08-16', 3, '', 2, 4, 21, '08:00:00', 3),
(21, '2020-08-16', 6, '', 2, 2, 22, '08:00:00', 4),
(22, '2020-08-16', 1, '', 2, 2, 22, '10:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `appstatus`
--

CREATE TABLE `appstatus` (
  `id` int(11) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appstatus`
--

INSERT INTO `appstatus` (`id`, `status`) VALUES
(1, 'Booked'),
(2, 'In service'),
(3, 'Fixed'),
(4, 'Collected'),
(5, 'Unrepairable'),
(6, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `license` varchar(9) NOT NULL,
  `vehicle_type` varchar(15) NOT NULL,
  `maker` varchar(15) NOT NULL,
  `model` varchar(15) NOT NULL,
  `engine_type` varchar(15) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `license`, `vehicle_type`, `maker`, `model`, `engine_type`, `userId`) VALUES
(1, '20D12345', 'CAR', 'TOYOTA', 'Corolla', 'PETROL', 2),
(2, '20C12345', 'CAR', 'TOYOTA', 'Corolla', 'PETROL', 2),
(4, '20C12346', 'CAR', 'TOYOTA', 'Corolla', 'PETROL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hour`
--

CREATE TABLE `hour` (
  `hour` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hour`
--

INSERT INTO `hour` (`hour`) VALUES
('08:00'),
('09:00'),
('10:00'),
('11:00'),
('12:00'),
('13:00'),
('14:00'),
('15:00'),
('16:00');

-- --------------------------------------------------------

--
-- Table structure for table `invoiceproduct`
--

CREATE TABLE `invoiceproduct` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantItem` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_appointment` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `customerName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `date`, `id_employee`, `id_appointment`, `total`, `customerName`) VALUES
(44, '2020-08-16', 1, 20, 195, 'Ana Santos');

-- --------------------------------------------------------

--
-- Table structure for table `invoiceservice`
--

CREATE TABLE `invoiceservice` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1594343431),
('m200710_020203_create_table_products', 1594346897),
('m200710_025408_create_table_cars', 1597089836),
('m200803_173234_create_table_users', 1596562589),
('m200803_181329_create_table_userType', 1596481145),
('m200803_190305_create_table_appointments', 1596482512),
('m200803_192346_create_table_invoices', 1597337553),
('m200806_133746_alter_table_appointments', 1596723051),
('m200806_175946_alter_table_appointments', 1597346427),
('m200811_185345_create_table_app_status', 1597172248),
('m200813_111216_create_table_services', 1597317652),
('m200813_165750_create_table_invoiceProduct', 1597339980),
('m200813_172737_create_table_invoiceService', 1597343812),
('m200814_214441_create_table_hours', 1597441959);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` smallint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `quantity`) VALUES
(12, 'Air freshener', '8.90', 120),
(13, 'Car Steering Wheel Lock', '22.90', 30),
(14, 'Fire Extinguishers', '8.90', 130),
(15, 'First Aid Kit', '24.90', 230),
(16, 'Floor mat', '18.90', 13),
(17, 'Car Steering Wheel Cover', '21.90', 34),
(18, 'S Style Diesel Fuel Can and Sp', '5.50', 55),
(19, 'S Style Unleaded Petrol Can an', '7.20', 89),
(20, 'Autosol Metal Polish', '34.00', 56),
(21, 'Power Sonic 12v Battery', '45.90', 12),
(22, 'Motorcycle Adjustable Fork Sea', '21.90', 9),
(23, 'Fox Part V-Brake Brake Set', '27.60', 7),
(24, 'Universal 7/8\" Motorcycle Clut', '14.50', 89),
(25, 'Pirelli Cinturato P7 - 205/55R', '51.60', 40),
(26, 'Bridgestone Potenza RE 050', '92.70', 67),
(27, 'Car Inner Tube Straight Shrada', '12.90', 56),
(28, 'FLAMEER Alloy 7 inch Wheel Rim', '15.90', 8),
(29, 'Yaris 14\" Wheel Trim 5 Spoke S', '45.00', 32),
(30, 'Dilwe RC Car Wheel Hub, 4 Pcs', '48.90', 65),
(31, 'Scuffs by Rimblades Alloy Whee', '29.90', 34),
(32, 'Alloy Wheel Paint Chip resista', '12.90', 34),
(33, 'Goodyear Flexo 75513 Wheel Tri', '30.45', 12),
(34, 'Metal Cleaner Polishing', '9.00', 67),
(35, 'Autosol 0401A 250ml Liquid Chr', '7.00', 6),
(36, 'Autoglym Super Resin Polish', '14.55', 4),
(37, 'CarPlan Demon Spray On Shine C', '5.60', 50),
(38, 'Kit + Cleaner + Oil', '12.10', 9),
(39, 'Air Con Bomb Cleaner Sanitiser', '18.90', 15),
(40, 'Variosan sink stopper', '7.45', 81),
(41, 'Fluid for Head Gaskets & Cylin', '15.40', 41),
(42, 'Cylinder Head Gasket', '12.70', 4),
(43, 'Engine Valve Cover Gasket Set', '9.90', 76),
(44, 'Valve Cover Cylinder Head Cove', '42.90', 9),
(45, 'Automatic Auto Transmission Ge', '7.80', 39),
(46, 'Turbo Exhaust Air Pressure Sen', '21.40', 43),
(47, 'Cover for Electric Window Cont', '12.90', 45),
(48, 'Wastegate Actuator 03L198716', '43.00', 32),
(49, 'DPF Sensor Diesel Particulate ', '24.90', 43),
(50, 'Mass Air Flow Sensor Cleaner', '19.60', 21),
(51, 'Knock Sensor', '8.50', 65),
(52, 'Transit Parts Transit Cranksha', '32.50', 3),
(53, 'Transmission Fluid Dipstick Re', '7.20', 21);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'Interim Service', '250.00'),
(2, 'Major Service', '400.00'),
(3, 'Repair/Fault', '150.00'),
(4, 'Major Repair', '520.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `password` varchar(64) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `userType` int(11) NOT NULL DEFAULT 3,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `firstName`, `surname`, `password`, `birthday`, `email`, `phone`, `userType`, `status`) VALUES
(1, 'admin', 'admin', 'dfgFh/hdnQNzA', '0000-00-00', 'admin@gers.com', '31423445', 1, 1),
(2, 'Ana', 'Santos', 'dfgFh/hdnQNzA', '1980-05-12', 'ana@gmail.com', '08198765', 3, 1),
(7, 'cct', 'college', 'dfgFh/hdnQNzA', '1983-11-20', 'cct@cct.com', '08198762', 1, 1),
(19, 'Ken', 'CCT', 'dfgFh/hdnQNzA', '1987-02-01', 'ken@cct.com', '08112345678', 2, 1),
(20, 'John', 'CCT', 'dfgFh/hdnQNzA', '1978-05-02', 'john@cct.com', '08309834567', 2, 1),
(21, 'Paul', 'CCT', 'dfgFh/hdnQNzA', '1987-09-09', 'paul@cct.com', '0830984576', 2, 1),
(22, 'Grace', 'CCT', 'dfgFh/hdnQNzA', '1979-09-12', 'grace@cct.com', '08198709876', 2, 1),
(23, 'Marie', 'CCT', 'dfgFh/hdnQNzA', '1989-09-09', 'marie@cct.com', '08923498765', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'admin'),
(2, 'mechanic'),
(3, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_customer` (`id_customer`),
  ADD KEY `fk_id_car` (`id_car`),
  ADD KEY `fk_id_mechanic` (`id_mechanic`),
  ADD KEY `fk_app_serv` (`id_service`);

--
-- Indexes for table `appstatus`
--
ALTER TABLE `appstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license` (`license`),
  ADD KEY `fk_car_user` (`userId`);

--
-- Indexes for table `hour`
--
ALTER TABLE `hour`
  ADD PRIMARY KEY (`hour`);

--
-- Indexes for table `invoiceproduct`
--
ALTER TABLE `invoiceproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_invoice` (`id_invoice`),
  ADD KEY `fk_id_product` (`id_product`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_appointment` (`id_appointment`),
  ADD KEY `fk_id_employee` (`id_employee`);

--
-- Indexes for table `invoiceservice`
--
ALTER TABLE `invoiceservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoiceService_invoice` (`id_invoice`),
  ADD KEY `fk_invoiceService_service` (`id_service`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_id_userType` (`userType`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `appstatus`
--
ALTER TABLE `appstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoiceproduct`
--
ALTER TABLE `invoiceproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `invoiceservice`
--
ALTER TABLE `invoiceservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_app_serv` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `fk_id_car` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`),
  ADD CONSTRAINT `fk_id_customer` FOREIGN KEY (`id_customer`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `fk_id_mechanic` FOREIGN KEY (`id_mechanic`) REFERENCES `users` (`userId`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_car_user` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `invoiceproduct`
--
ALTER TABLE `invoiceproduct`
  ADD CONSTRAINT `fk_id_invoice` FOREIGN KEY (`id_invoice`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `fk_id_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_id_appointment` FOREIGN KEY (`id_appointment`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `fk_id_employee` FOREIGN KEY (`id_employee`) REFERENCES `users` (`userId`);

--
-- Constraints for table `invoiceservice`
--
ALTER TABLE `invoiceservice`
  ADD CONSTRAINT `fk_invoiceService_invoice` FOREIGN KEY (`id_invoice`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `fk_invoiceService_service` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_id_userType` FOREIGN KEY (`userType`) REFERENCES `usertype` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
