-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Set-2016 às 01:55
-- Versão do servidor: 5.5.50
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gomoku`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sexo` char(1) NOT NULL,
  `comentarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `sigla` char(4) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id`, `nome`, `sigla`, `descricao`) VALUES
(1, 'SI', 'SI', 'SI'),
(2, 'Ciência da Computação', 'IE18', 'Bacharelado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogada`
--

CREATE TABLE `jogada` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_partida` int(11) NOT NULL,
  `linha` int(11) NOT NULL,
  `coluna` int(11) NOT NULL,
  `data_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jogada`
--

INSERT INTO `jogada` (`id`, `id_user`, `id_partida`, `linha`, `coluna`, `data_hora`) VALUES
(97, 12, 42, 0, 0, '2016-09-21 22:14:33'),
(98, 11, 42, 0, 14, '2016-09-21 22:15:18'),
(99, 12, 42, 1, 0, '2016-09-21 22:15:44'),
(100, 11, 42, 1, 14, '2016-09-21 22:15:51'),
(101, 12, 42, 2, 0, '2016-09-21 22:15:55'),
(102, 11, 42, 2, 14, '2016-09-21 22:16:01'),
(103, 12, 42, 3, 0, '2016-09-21 22:16:05'),
(104, 11, 42, 3, 14, '2016-09-21 22:16:13'),
(105, 12, 42, 4, 0, '2016-09-21 22:16:18'),
(106, 12, 42, 4, 0, '2016-09-21 22:17:40'),
(107, 12, 42, 4, 0, '2016-09-21 22:20:19'),
(108, 12, 42, 4, 0, '2016-09-21 22:22:05'),
(109, 12, 42, 4, 0, '2016-09-21 22:23:20'),
(110, 12, 44, 0, 0, '2016-09-21 22:46:58'),
(111, 11, 44, 0, 5, '2016-09-21 22:47:12'),
(112, 12, 44, 1, 1, '2016-09-21 22:47:19'),
(113, 11, 44, 1, 6, '2016-09-21 22:47:26'),
(114, 12, 44, 2, 2, '2016-09-21 22:47:33'),
(115, 11, 44, 2, 7, '2016-09-21 22:47:52'),
(116, 12, 44, 3, 3, '2016-09-21 22:47:57'),
(117, 11, 44, 3, 8, '2016-09-21 22:48:03'),
(118, 12, 44, 4, 4, '2016-09-21 22:48:08'),
(119, 11, 44, 4, 9, '2016-09-21 22:48:22'),
(120, 12, 44, 5, 5, '2016-09-21 22:48:44'),
(121, 12, 45, 0, 0, '2016-09-21 23:16:54'),
(122, 11, 45, 0, 1, '2016-09-21 23:17:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1471640935),
('m130524_201442_init', 1471640940);

-- --------------------------------------------------------

--
-- Estrutura da tabela `partida`
--

CREATE TABLE `partida` (
  `id` int(11) NOT NULL,
  `id_user_1` int(11) NOT NULL,
  `id_user_2` int(11) DEFAULT NULL,
  `vencedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `partida`
--

INSERT INTO `partida` (`id`, `id_user_1`, `id_user_2`, `vencedor`) VALUES
(42, 12, 11, 12),
(44, 12, 11, 12),
(45, 12, 11, NULL),
(46, 11, 12, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `id_curso`) VALUES
(8, 'LarissaFabiola', 'sFB4lqaJ67zffrpQ9xWA3FnlbRE6SK8i', '$2y$13$UzZpyiQ04E8skhp0c6hcnelLZxKqI/E6MVZPcohH2SG2NokvEbghq', NULL, 'larissafabiola051@gmail.com', 10, 1474410667, 1474410667, 1),
(9, 'pvfrota', 'cQAc0ZJG4Cr-M_Ek6Grgjs_awRuKZyAM', '$2y$13$d8DQ/iCts9fM2.DVJB.R0.RUQuobmutMpdI.ZmV9I26WBcXUQDLXS', NULL, 'pvfrota@gmail.com', 10, 1474413797, 1474413797, 1),
(10, 'l.felipesouza', 'OfToV_5dCUi0R6XZi4ZUv8AEiw3_rCcj', '$2y$13$R1xHpLBRHQ//S8kVV3zouuBMZ5rKbNhhKPcctlET1QprvDZ2BEARm', NULL, 'l.felipesouza21@gmail.com', 10, 1474430211, 1474430211, 1),
(11, 'Teste', '9wiFiEEpc7TVt-MgvuYuJhWfHqGgqlea', '$2y$13$Tor9A8BTClVx2bdZsO6w2.7.N6ITxMmEPSo40jE8dz1PELo3XCu2a', NULL, 'teste@gmail.com', 10, 1474487064, 1474487064, 1),
(12, 'lfmsufam', '3_Y59m5hX5smY_PiD5LS8n9ceX2zwx1S', '$2y$13$dcwtcrXe39wfC1xfSuvSWeeGL4VAcLRNUnYV7psK7UMiO4HwMd7Ym', NULL, 'lfms@icomp.ufam.edu.br', 10, 1474487321, 1474487321, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jogada`
--
ALTER TABLE `jogada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_partida` (`id_partida`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_1` (`id_user_1`),
  ADD KEY `id_user_2` (`id_user_2`),
  ADD KEY `vencedor` (`vencedor`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD KEY `fk_curso` (`id_curso`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jogada`
--
ALTER TABLE `jogada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `jogada`
--
ALTER TABLE `jogada`
  ADD CONSTRAINT `fk_partida` FOREIGN KEY (`id_partida`) REFERENCES `partida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `fk_user1` FOREIGN KEY (`id_user_1`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_user2` FOREIGN KEY (`id_user_2`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_vencedor` FOREIGN KEY (`vencedor`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_curso_idx` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
