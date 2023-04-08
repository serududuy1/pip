-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2023 pada 12.01
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pesan_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_username` varchar(25) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(40) NOT NULL,
  `admin_level` varchar(15) NOT NULL,
  `admin_session` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_username`, `admin_password`, `admin_name`, `admin_level`, `admin_session`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin', 'agko96tihp6c3eq789sjaj452q');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_owner` varchar(100) NOT NULL,
  `bank_noaccount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_name`, `bank_owner`, `bank_noaccount`) VALUES
(3, 'Dki', 'Rico Giovani', '20423083633');

-- --------------------------------------------------------

--
-- Struktur dari tabel `facility`
--

CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL,
  `facility_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `facility`
--

INSERT INTO `facility` (`facility_id`, `facility_name`) VALUES
(15, 'AC'),
(16, 'TV'),
(17, 'Air Mineral'),
(18, 'Handuk'),
(19, 'Kamar Mandi air panas'),
(21, '1 Bed'),
(22, '2 Bed'),
(23, 'sofa Bed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL,
  `gallery_photo` varchar(355) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `gallery_name`, `gallery_photo`) VALUES
(17, '1', '1212856.jpeg'),
(18, '2', '6443073.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guest`
--

CREATE TABLE `guest` (
  `guest_username` varchar(100) NOT NULL,
  `guest_password` varchar(100) NOT NULL,
  `guest_name` varchar(35) NOT NULL,
  `guest_notelp` varchar(12) NOT NULL,
  `guest_address` varchar(255) NOT NULL,
  `guest_gender` enum('Pria','Wanita') NOT NULL,
  `guest_age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guest`
--

INSERT INTO `guest` (`guest_username`, `guest_password`, `guest_name`, `guest_notelp`, `guest_address`, `guest_gender`, `guest_age`) VALUES
('kibo', 'e10adc3949ba59abbe56e057f20f883e', 'riski', '08235162412', 'Jakarta', 'Pria', 29);

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas`
--

CREATE TABLE `identitas` (
  `identitas_id` int(3) NOT NULL,
  `identitas_website` varchar(250) NOT NULL,
  `identitas_deskripsi` text NOT NULL,
  `identitas_keyword` text NOT NULL,
  `identitas_alamat` varchar(250) NOT NULL,
  `identitas_notelp` char(20) NOT NULL,
  `identitas_favicon` varchar(250) NOT NULL,
  `identitas_author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identitas`
--

INSERT INTO `identitas` (`identitas_id`, `identitas_website`, `identitas_deskripsi`, `identitas_keyword`, `identitas_alamat`, `identitas_notelp`, `identitas_favicon`, `identitas_author`) VALUES
(1, 'Tidung Nirwana Cottage', 'Pulau Tidung adalah salah satu yang terpopuler di barisan pulau-pulau yang ada di Kepulauan Seribu. Namanya terkenal bukan hanya di kalangan wisatawan lokal, namun juga wisatawan manca negara. Pulau Tidung menawarkan sejumlah destinasi wisata yang membuatnya menjadi salah satu primadona di Kepulauan Seribu. Pulau ini cocok untuk semua kalangan – tua, muda, dan bahkan anak-anak.Tidung Nirwana Beach Cottage hadir untuk memberikan alternatif penginapan yang menekankan pada fasilitas kamar serta kualitas pelayanan untuk kepuasan tamu yang datang', 'reservasi, hotel, php, website', 'Pulau Tidung', '081234567890', '953120cropped-logo-tidung-6.png', 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` varchar(100) NOT NULL,
  `guest_username` varchar(100) NOT NULL,
  `invoice_photo` varchar(255) NOT NULL,
  `invoice_cancel` varchar(255) NOT NULL,
  `invoice_price` int(11) NOT NULL,
  `invoice_created` datetime NOT NULL DEFAULT current_timestamp(),
  `invoice_qty` int(11) NOT NULL,
  `invoice_pesan` varchar(255) NOT NULL,
  `invoice_status` varchar(100) NOT NULL,
  `invoice_payment` varchar(100) NOT NULL,
  `invoice_checkin` varchar(100) NOT NULL DEFAULT 'Belum Checkin',
  `invoice_checkout` varchar(100) NOT NULL DEFAULT 'Belum Checkout'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `guest_username`, `invoice_photo`, `invoice_cancel`, `invoice_price`, `invoice_created`, `invoice_qty`, `invoice_pesan`, `invoice_status`, `invoice_payment`, `invoice_checkin`, `invoice_checkout`) VALUES
('5aaiPyuc', 'kibo', '6641156.jpeg', '', 600000, '2023-02-27 22:18:11', 1, 'oke', 'done', 'Booking', 'Belum Checkin', 'Belum Checkout'),
('hCzAlOvi', 'kibo', '', 'Jadwal bentrok', 1000000, '2023-02-26 18:50:26', 2, 'oke', 'cancel', 'Booking', 'Belum Checkin', 'Belum Checkout'),
('IurNvknI', 'user', '', '', 500000, '2023-02-26 14:21:13', 1, 'oke', 'done', 'Booking', 'Belum Checkin', 'Belum Checkout'),
('NvQcRWrL', 'kibo', '', '', 600000, '2023-03-07 12:04:02', 1, 'oke', 'booking', 'Booking', 'Belum Checkin', 'Belum Checkout');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `roomtype_id` int(11) NOT NULL,
  `facility_id` varchar(100) NOT NULL,
  `room_people` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `room_price` int(11) NOT NULL,
  `room_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`room_id`, `roomtype_id`, `facility_id`, `room_people`, `room_no`, `room_price`, `room_photo`) VALUES
(25, 8, '15,16,17,18,21', 2, 1, 500000, '117299standard.jpeg'),
(26, 10, '15,16,17,18,22', 4, 2, 600000, '768307Family.jpeg'),
(27, 10, '15,16,17,18,22', 4, 3, 600000, '748118Family.jpeg'),
(28, 10, '15,16,17,18,22', 4, 4, 600000, '417311Family.jpeg'),
(29, 10, '15,16,17,18,22', 4, 5, 600000, '61982Family.jpeg'),
(30, 12, '15,16,17,18,19,21,23', 2, 6, 600000, '860969vip.jpeg'),
(31, 9, '15,16,17,18,21', 2, 7, 500000, '833131standard.jpeg'),
(32, 11, '15,16,17,18,22', 4, 8, 600000, '138419Family.jpeg'),
(33, 11, '15,16,17,18,22', 4, 9, 600000, '576860Family.jpeg'),
(34, 11, '15,16,17,18,22', 4, 9, 600000, '395095Family.jpeg'),
(35, 11, '15,16,17,18,22', 4, 11, 600000, '737633Family.jpeg'),
(36, 13, '15,16,17,18,19,21,23', 2, 12, 600000, '263011vip.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roomtype`
--

CREATE TABLE `roomtype` (
  `roomtype_id` int(11) NOT NULL,
  `roomtype_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `roomtype`
--

INSERT INTO `roomtype` (`roomtype_id`, `roomtype_name`) VALUES
(8, 'Standard'),
(9, 'Standard Lantai 2'),
(10, 'Family'),
(11, 'Family Lantai 2'),
(12, 'VIP '),
(13, 'VIP lantai 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slide`
--

CREATE TABLE `slide` (
  `slide_id` int(11) NOT NULL,
  `slide_name` varchar(100) NOT NULL,
  `slide_photo` varchar(355) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `slide`
--

INSERT INTO `slide` (`slide_id`, `slide_name`, `slide_photo`) VALUES
(9, '1', '5959641.jpeg'),
(10, '2', '5446912.jpeg'),
(11, '3', '5618613.jpeg'),
(12, '4', '5595874.jpeg'),
(13, '5', '2329765.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `room_id` varchar(100) NOT NULL,
  `transaction_qty` int(11) NOT NULL,
  `transaction_price` int(11) NOT NULL,
  `transaction_totalprice` int(11) NOT NULL,
  `transaction_status` varchar(100) NOT NULL,
  `transaction_created` datetime NOT NULL DEFAULT current_timestamp(),
  `transaction_checkin` datetime NOT NULL,
  `transaction_checkout` datetime NOT NULL,
  `transaction_day` int(11) NOT NULL,
  `transaction_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `invoice_id`, `room_id`, `transaction_qty`, `transaction_price`, `transaction_totalprice`, `transaction_status`, `transaction_created`, `transaction_checkin`, `transaction_checkout`, `transaction_day`, `transaction_updated`) VALUES
(30, 'IurNvknI', '1', 1, 500000, 500000, 'done', '2023-02-26 14:21:13', '2023-03-01 00:00:00', '2023-03-02 00:00:00', 1, '2023-02-27 14:09:38'),
(31, 'hCzAlOvi', '1', 2, 500000, 1000000, 'cancel', '2023-02-26 18:50:26', '2023-02-28 00:00:00', '2023-03-02 00:00:00', 2, '2023-02-26 18:52:16'),
(32, '5aaiPyuc', '2', 1, 600000, 600000, 'done', '2023-02-27 22:18:11', '2023-03-02 00:00:00', '2023-03-03 00:00:00', 1, '2023-02-27 22:22:04'),
(33, 'NvQcRWrL', '2', 1, 600000, 600000, 'booking', '2023-03-07 12:04:02', '2023-03-15 00:00:00', '2023-03-16 00:00:00', 1, '2023-03-07 12:04:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_username`);

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indeks untuk tabel `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indeks untuk tabel `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_username`);

--
-- Indeks untuk tabel `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`identitas_id`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indeks untuk tabel `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indeks untuk tabel `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`roomtype_id`);

--
-- Indeks untuk tabel `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `facility`
--
ALTER TABLE `facility`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `identitas`
--
ALTER TABLE `identitas`
  MODIFY `identitas_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `roomtype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `slide`
--
ALTER TABLE `slide`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
