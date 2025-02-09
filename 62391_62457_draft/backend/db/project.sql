-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 12 юни 2022 в 22:46
-- Версия на сървъра: 10.4.24-MariaDB
-- Версия на PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `project`
--

-- --------------------------------------------------------

--
-- Структура на таблица `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `lectorEmail` varchar(255) NOT NULL,
  `roomNum` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `rooms`
--

INSERT INTO `rooms` (`id`, `date`, `start`, `end`, `lectorEmail`, `roomNum`) VALUES
(1, '2022-06-22', '00:00:08', '00:00:08', 'franceva@uni-sofia', '\"200'),
(2, '2022-06-16', '00:00:08', '00:00:08', 'franceva@uni-sofia', '200'),
(3, '0000-00-00', '00:00:08', '00:00:08', 'franceva@uni-sofia', '200'),
(4, '0000-00-00', '00:00:08', '00:00:08', 'franceva@uni-sofia', '200'),
(5, '0000-00-00', '00:00:08', '00:00:08', 'franceva@uni-sofia', '200'),
(6, '0000-00-00', '00:00:08', '00:00:08', 'franceva@uni-sofia', '200'),
(7, '2022-06-16', '00:00:08', '00:00:08', 'franceva@uni-sofia', '120');

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('lector','student') NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`firstName`, `lastName`, `email`, `password`, `type`) VALUES
('Nadezhda', 'Frantseva', 'franceva@uni-sofia', '$2y$10$5QWn00j0QRkVFgfqJcmSQefaoefX6H1.Wt84Te1UzMREytDFKSvru', 'lector'),
('Nadezhda', 'Frantseva', 'franceva@uni-sofia.b', '$2y$10$CMo.fFlUDjZSXk0fPBi47eucfuyXPciqfIVfbdgnWvY8IxgMwxmHe', 'student'),
('Nadezhda', 'Frantseva', 'franceva@uni-sofia.bg', '$2y$10$W.8idn3/P/3gVhzA3VaBGOy6e3F2QgerA4nKred1zKu4FvcKyX46W', 'student'),
('oa@uni-sofia.bg', 'Nadezhda', 'Frantseva', '$2y$10$1mdx88y3lzhLFQE6Jcq0mOOLxIPKoVYwEGDDrHldD6vlNF/ndFS6e', 'student'),
('Petar', 'Petrov', 'pepi.petrov@gmail.com', '$2y$10$neyFZyvFNaF2s70vTxOne.3aZW/xSlg2SO.ehrgX0slqJHNZ9bRAm', 'student'),
('Nadezhda', 'Frantseva', 'ss@uni-sofia.bg', '$2y$10$XJuL3UKA8yFk384.b8lBB.v2l/AHT9zkNlCNNa9fVJo6BQ/lqLv3a', 'lector'),
('Nadezhda', 'Frantseva', 'www@uni-sofia.bg', '$2y$10$ovKW5BjebxEoNpAxQhgAUOO.CmBVPN3pZfobmVT4tZNtn.iAme6CO', 'student'),
('Nadezhda', 'Frantseva', 'wwwww@uni-sofia.bg', '$2y$10$0m1x5pvsEwMnNyVALTpXSOLH68a2WLUFRBdiCfaoh7hkzqj07di6i', 'student'),
('Nadezhda', 'Frantseva', 'wwwwww@uni-sofia.bg', '$2y$10$BVb4tNE9OBu5B1Y6GJ0TXOfceY6/AypSFTSy28MnfJIEo6Q5AESri', 'student');

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD KEY `firstName` (`firstName`),
  ADD KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
