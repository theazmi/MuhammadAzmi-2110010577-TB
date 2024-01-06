-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 03:36 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentalmobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_mobil`
--

CREATE TABLE `data_mobil` (
  `id_mobil` varchar(50) NOT NULL,
  `nama_mobil` varchar(50) NOT NULL,
  `merek_mobil` varchar(50) NOT NULL,
  `no_plat` varchar(50) NOT NULL,
  `harga_mobil` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_mobil`
--

INSERT INTO `data_mobil` (`id_mobil`, `nama_mobil`, `merek_mobil`, `no_plat`, `harga_mobil`, `status`) VALUES
('MBL042946', 'Toyotaa', 'Ayla', 'DA5566RF', '100000', 'Tidak Ready'),
('MBL362004', 'Honda', 'Civic', 'DA4590TG', '500000', 'READY'),
('MBL972114', 'Toyota', 'Avanza', 'DA5555RF', '100000', 'READY');

-- --------------------------------------------------------

--
-- Table structure for table `data_penyewa`
--

CREATE TABLE `data_penyewa` (
  `no_ktp` varchar(50) NOT NULL,
  `nama_penyewa` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `jenkel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_penyewa`
--

INSERT INTO `data_penyewa` (`no_ktp`, `nama_penyewa`, `alamat`, `no_hp`, `jenkel`) VALUES
('6308400614280545', 'ANDI', 'BANJARMASIN', '0899778866', 'Laki-Laki'),
('6308785903660841', 'Ana', 'Martapura', '084141212312', 'Laki-Laki');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` varchar(50) NOT NULL,
  `no_ktp` varchar(50) NOT NULL,
  `id_mobil` varchar(50) NOT NULL,
  `lama_sewa` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `no_ktp`, `id_mobil`, `lama_sewa`, `harga`, `total`) VALUES
('RNTL45572201', '6308785903660841', 'MBL362004', '5', '500000', '2500000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_mobil`
--
ALTER TABLE `data_mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `data_penyewa`
--
ALTER TABLE `data_penyewa`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_mobil` (`id_mobil`),
  ADD KEY `no_ktp` (`no_ktp`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_mobil`) REFERENCES `data_mobil` (`id_mobil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`no_ktp`) REFERENCES `data_penyewa` (`no_ktp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
