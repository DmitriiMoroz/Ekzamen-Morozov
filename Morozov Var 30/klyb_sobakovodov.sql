-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 19 2024 г., 09:18
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `klyb_sobakovodov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hozyain`
--

CREATE TABLE `hozyain` (
  `Id` int(11) NOT NULL,
  `Familia` varchar(50) NOT NULL,
  `Ima` varchar(50) NOT NULL,
  `Otchestvo` varchar(50) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Parol` varchar(50) NOT NULL,
  `Telefon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hozyain`
--

INSERT INTO `hozyain` (`Id`, `Familia`, `Ima`, `Otchestvo`, `Login`, `Parol`, `Telefon`) VALUES
(6, 'Морозов', 'Дмитрий', 'Алексеевич', 'morozov.dima2004@gmail.com', '2134dsgsd', '+79807014080'),
(7, 'Морозов', 'Дмитрий', 'Алексеевич', 'morozov.dima2004@gmail.com', '2134dsgsd', '+79807014080'),
(8, 'Морозов', 'Дмитрий', 'Алексеевич', 'morozov.dima2004@gmail.com', '2134dsgsd', '+79807014080'),
(9, 'Морозов', 'Дмитрий', 'Алексеевич', 'morozov.dima2004@gmail.com', '1243sad', '+79807014080'),
(10, 'Морозов', 'Дмитрий', 'Алексеевич', 'morozov.dima2004@gmail.com', '123412qqqq', '+79807014080'),
(11, 'Морозов', 'Дмитрий', 'Алексеевич', 'morozov.dima2004@gmail.com', '112dwg', '+79807014080');

-- --------------------------------------------------------

--
-- Структура таблицы `meropriyatie`
--

CREATE TABLE `meropriyatie` (
  `Id_mer` int(11) NOT NULL,
  `Nazvanie` varchar(50) NOT NULL,
  `Mesto` int(11) NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `poroda`
--

CREATE TABLE `poroda` (
  `Id porodi` int(11) NOT NULL,
  `Nazvanie` varchar(50) NOT NULL,
  `Opisanie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `sobaka`
--

CREATE TABLE `sobaka` (
  `Id` int(11) NOT NULL,
  `Klichka` varchar(50) NOT NULL,
  `data_rojdeniya` date NOT NULL,
  `id_hozyina` int(11) NOT NULL,
  `id porodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `ychastie`
--

CREATE TABLE `ychastie` (
  `Id` int(11) NOT NULL,
  `Mesto` int(11) NOT NULL,
  `Data` date NOT NULL,
  `id_sobaki` int(11) NOT NULL,
  `Id meropriyatiya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hozyain`
--
ALTER TABLE `hozyain`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- Индексы таблицы `meropriyatie`
--
ALTER TABLE `meropriyatie`
  ADD PRIMARY KEY (`Id_mer`);

--
-- Индексы таблицы `poroda`
--
ALTER TABLE `poroda`
  ADD PRIMARY KEY (`Id porodi`);

--
-- Индексы таблицы `sobaka`
--
ALTER TABLE `sobaka`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_hozyina` (`id_hozyina`,`id porodi`),
  ADD KEY `id porodi` (`id porodi`);

--
-- Индексы таблицы `ychastie`
--
ALTER TABLE `ychastie`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_sobaki` (`id_sobaki`,`Id meropriyatiya`),
  ADD KEY `Id meropriyatiya` (`Id meropriyatiya`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hozyain`
--
ALTER TABLE `hozyain`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `meropriyatie`
--
ALTER TABLE `meropriyatie`
  MODIFY `Id_mer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `poroda`
--
ALTER TABLE `poroda`
  MODIFY `Id porodi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sobaka`
--
ALTER TABLE `sobaka`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ychastie`
--
ALTER TABLE `ychastie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `meropriyatie`
--
ALTER TABLE `meropriyatie`
  ADD CONSTRAINT `meropriyatie_ibfk_1` FOREIGN KEY (`Id_mer`) REFERENCES `ychastie` (`Id meropriyatiya`);

--
-- Ограничения внешнего ключа таблицы `poroda`
--
ALTER TABLE `poroda`
  ADD CONSTRAINT `poroda_ibfk_1` FOREIGN KEY (`Id porodi`) REFERENCES `sobaka` (`id porodi`);

--
-- Ограничения внешнего ключа таблицы `sobaka`
--
ALTER TABLE `sobaka`
  ADD CONSTRAINT `sobaka_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `ychastie` (`id_sobaki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
