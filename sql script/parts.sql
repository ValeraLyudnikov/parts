-- База данных: `test`
--
USE test;
-- --------------------------------------------------------

--
-- Структура таблицы `parts`
--
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts`(
  `id` int(10) UNSIGNED NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `necessity` tinyint(1) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `parts`
--

INSERT INTO `parts` (`id`, `part_name`, `necessity`, `quantity`) VALUES
(1, 'Материнская плата Supermicro X10DRH-C', 1, 12),
(2, 'Процессор Intel Core i9-7960X', 1, 7),
(3, 'Процессор Intel Core i7-6700K', 1, 4),
(4, 'Материнская плата Asus WS C422\r\n', 1, 2),
(5, 'Бумага А4', 0, 10),
(6, 'Степлер', 0, 12),
(7, 'SSD Samsung 860 Evo-Series 4TB', 1, 3),
(8, 'Блок питания Aerocool Gold Miner 1600W', 1, 2),
(9, 'Шариковая ручка', 0, 34),
(10, 'Корпус DeepCool QuadStellar', 1, 2),
(11, 'Ножницы', 0, 2),
(12, 'Пенопласт', 0, 12),
(13, 'Видеокарта Gigabyte PCI-Ex GeForce GTX 1080 Ti', 1, 12),
(14, 'Видеокарта Palit PCI-Ex GeForce GTX 1080 Ti', 1, 7),
(15, 'Принтер Canon', 0, 5),
(16, 'Материнская плата Asus Maximus IX Extreme', 1, 2),
(17, 'Стабилизатор напряжения Укртехнология Norma НСН-9000', 0, 1),
(18, 'Мышь Lenovo Y Precision USB Black', 0, 6),
(19, 'Оптический привод Asus DVD±R/RW USB 2.0 ', 0, 16),
(20, 'Жесткий диск Western Digital Blue 500GB 5400rpm 64МB', 1, 4),
(21, 'Видеокарта INNO3D PCI-Ex GeForce GTX1060 Compact 6GB GDDR5', 1, 8),
(22, 'Оперативная память G.Skill DDR4-4000 32768MB PC4-32000', 1, 5),
(23, 'Маршрутизатор Cisco SB 2921', 0, 0),
(24, 'Коммутатор Cisco Catalyst 3850 (WS-C3850-48T-S)', 0, 9),
(25, 'Клавиатура беспроводная 2E KS 101 Slim Black', 0, 89),
(26, 'Беспроводной геймпад Logitech F710 PC Black/Silver', 0, 24),
(27, 'ТВ-тюнер EvroMedia USB Hybrid Volar HD', 0, 17),
(28, 'EnerGenie Inverter 1000 VA LCD (EG-HI-PS1000-01)', 0, 8),
(29, 'Реобас Scythe Kaze Master Flat II 5.25\" Black', 0, 19),
(30, 'Процессор Intel Core i7-8700K 3.7GHz/8GT/s/12MB', 1, 7),
(31, 'Kingston DataTraveler SE9 16GB (DTSE9H/16GB)', 0, 96);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `part_name` (`part_name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;