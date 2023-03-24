-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Mar 2023 pada 04.41
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_name`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ban_list`
--

CREATE TABLE `ban_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ban_reason` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `banned_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat_room`
--

CREATE TABLE `chat_room` (
  `room_id` int(11) NOT NULL,
  `room_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `room_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `owner` int(11) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `chat_room`
--

INSERT INTO `chat_room` (`room_id`, `room_name`, `room_description`, `owner`, `created_time`) VALUES
(1, 'roomtest', 'testroom', 2, '2023-03-24 00:33:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sent_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `room_id`, `message`, `sent_time`) VALUES
(1, 3, 1, 'test', '2023-03-24 00:41:00'),
(2, 2, 1, 'apa anj', '2023-03-24 04:08:09'),
(3, 3, 1, 'hoi', '2023-03-24 04:16:12'),
(4, 2, 1, 'bang bang', '2023-03-24 04:16:34'),
(5, 3, 1, 'p', '2023-03-24 04:40:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_join`
--

CREATE TABLE `request_join` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_member`
--

CREATE TABLE `room_member` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `join_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `room_member`
--

INSERT INTO `room_member` (`id`, `user_id`, `room_id`, `join_date`) VALUES
(1, 3, 1, '2023-03-24 00:40:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `profilePicture` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `session` text NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `joinned_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `profilePicture`, `username`, `password`, `session`, `admin`, `verified`, `joinned_time`) VALUES
(1, 'Vy', 'Nghia ', 'https://nghia.org/project/chat/assets/img/default.jpg', 'vynghia', '1151985611', '36abd83f011d92b06c801c99f1884c6c', 1, 0, '2019-07-05 20:52:10'),
(2, 'rifqil', 'khanif ', 'data:image/jpeg;base64,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', 'rifqilkhanif', 'batagorG30po', '673c313aa93d57957f29f002e5dd8fe1', 0, 0, '2023-03-24 00:31:26'),
(3, 'rjdndjsjs', 'rjdndjsjs ', 'https://cdn130.picsart.com/318381621277201.jpg', 'rjdndjsjs', 'rjdndjsjs', '5a3a22adb5edb84b4b2b88a172e52694', 0, 0, '2023-03-24 00:39:38');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ban_list`
--
ALTER TABLE `ban_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `request_join`
--
ALTER TABLE `request_join`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `room_member`
--
ALTER TABLE `room_member`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ban_list`
--
ALTER TABLE `ban_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `request_join`
--
ALTER TABLE `request_join`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `room_member`
--
ALTER TABLE `room_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
