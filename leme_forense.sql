-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 25-Nov-2023 às 06:06
-- Versão do servidor: 5.7.36
-- versão do PHP: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `leme_forense`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `data_nascimento`, `telefone`, `ativo`, `created_at`, `updated_at`) VALUES
(1, 'Maria Sara Chaves Valentin de Cardozo', '098.018.779-60', '1954-03-06', '(41) 99988-7766', 1, '2023-11-24 03:11:16', '2023-11-24 18:55:29'),
(2, 'João da Silva', '098.018.779-60', '1998-10-12', NULL, 0, '2023-11-24 04:23:03', '2023-11-25 07:07:44'),
(3, 'Eugênio Kevin Abreu Filho', '393.958.989-68', '2023-06-17', '(41) 97856-5423', 1, '2023-11-24 05:17:35', '2023-11-24 18:55:45'),
(4, 'Alberto Rodrigo Branco de Maia', '123.456.789-00', '1996-11-02', '(41) 99769-7260', 1, '2023-11-24 18:08:37', '2023-11-24 18:13:35'),
(5, 'Junior Nilton Bonilha Marques', '369.258.147-12', '2023-11-20', '(41) 3245-3901', 1, '2023-11-24 18:12:18', '2023-11-25 01:18:16'),
(6, 'João Mariano Matos', '123.123.123-12', '2019-10-15', NULL, 1, '2023-11-24 18:16:05', '2023-11-24 18:51:59'),
(7, 'Maria de Lourdes Martins de Almeida', '018.854.151-55', '2023-11-07', '(41) 99988-7766', 1, '2023-11-25 01:14:16', '2023-11-25 01:14:16'),
(8, 'Emanuely Carvalho', '888.888.888-88', '1999-03-01', '(41) 99999-9999', 1, '2023-11-25 07:05:00', '2023-11-25 07:07:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_23_174621_create_sessions_table', 1),
(7, '2023_11_23_234758_create_clientes_table', 1),
(8, '2023_11_24_000117_create_pedidos_table', 1),
(9, '2023_11_24_000458_create_pedidos_imagem_table', 1),
(10, '2023_11_24_000637_create_pedido_status_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `produto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data` datetime NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `pedido_status_id` int(11) NOT NULL,
  `ativo` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `produto`, `valor`, `data`, `cliente_id`, `pedido_status_id`, `ativo`, `created_at`, `updated_at`) VALUES
(28, 'Apple iPhone 15 Pro (128 GB) - 001', '6000.00', '2023-11-25 20:08:00', 8, 1, 1, '2023-11-25 07:09:47', '2023-11-25 07:12:16'),
(29, 'Apple iPhone 15 Pro (128 GB) - 002', '4990.00', '2023-06-20 17:15:00', 4, 2, 1, '2023-11-25 07:12:57', '2023-11-25 07:18:28'),
(30, 'Apple iPhone 15 Pro (128 GB) - 003', '3250.00', '2023-04-13 21:35:00', 3, 3, 1, '2023-11-25 07:14:08', '2023-11-25 07:14:22'),
(31, 'Apple iPhone 15 Pro (128 GB) - 004', '2775.00', '2023-10-13 13:14:00', 5, 1, 1, '2023-11-25 07:15:06', '2023-11-25 07:15:06'),
(32, 'Apple iPhone 15 Pro (128 GB) - 005', '1149.90', '2023-09-19 21:16:00', 7, 1, 1, '2023-11-25 07:16:40', '2023-11-25 07:16:40'),
(33, 'Apple iPhone 15 Pro (128 GB) - 006', '3499.00', '2023-11-25 01:17:00', 1, 1, 0, '2023-11-25 07:17:33', '2023-11-25 07:17:48'),
(34, 'Apple iPhone 15 Pro (128 GB) - 007', '3848.00', '2023-09-27 11:18:00', 5, 2, 1, '2023-11-25 07:18:16', '2023-11-25 07:18:41');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_imagem`
--

CREATE TABLE `pedidos_imagem` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `img` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capa` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pedidos_imagem`
--

INSERT INTO `pedidos_imagem` (`id`, `pedido_id`, `img`, `capa`, `created_at`, `updated_at`) VALUES
(12, 28, '21d6f9054cebfba19146f02e0a30c3c9.jpg', '21d6f9054cebfba19146f02e0a30c3c9.jpg', '2023-11-25 07:09:48', '2023-11-25 07:11:36'),
(13, 29, 'eb1614ba3d01057ff88a8550d5d9c5d8.webp', 'eb1614ba3d01057ff88a8550d5d9c5d8.webp', '2023-11-25 07:12:57', '2023-11-25 07:12:57'),
(14, 31, '8da14fa3e6e3f0f8b3eb7779ef469f74.jpg', '8da14fa3e6e3f0f8b3eb7779ef469f74.jpg', '2023-11-25 07:15:06', '2023-11-25 07:15:06'),
(15, 32, 'afd269180f4e9f368997b03de74cf563.jpg', 'afd269180f4e9f368997b03de74cf563.jpg', '2023-11-25 07:16:40', '2023-11-25 07:16:40'),
(16, 34, 'be6c966aace8bc856e5aec1644653f0e.jpg', 'be6c966aace8bc856e5aec1644653f0e.jpg', '2023-11-25 07:18:16', '2023-11-25 07:18:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_status`
--

CREATE TABLE `pedido_status` (
  `id` int(11) NOT NULL,
  `descricao` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pedido_status`
--

INSERT INTO `pedido_status` (`id`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 'Solicitado', NULL, NULL),
(2, 'Concluído', NULL, NULL),
(3, 'Cancelado', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('939B4MjR9KvvKRQdm1I79I0nz9TqlTbKh3EmS25l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTlo4QzdtNHZ1QmFhZGNtSkpCV29pdnpOc2VuVk5lalVUOGlZRjV6cyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3BhaW5lbC9wZWRpZG9zL2xpc3RhciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1700886024),
('eAPOhmviM43flaS75Eu42Kcmd9pD9SCHPmpaZ23p', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaGt2dHdSem41ZTZUaU9xbHpmRGpHazFxeTFCZEZGMzdNNnRNS0lZUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWluZWwiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1700892383);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Juan', 'juan@teste.com.br', NULL, '$2y$12$m5HlV5t6nSK9RWAMcuIIPONYTOxap4grC7HAxY8mLhxhoEWEJGOe6', NULL, NULL, NULL, 'dnWGUab9bJAYq6DV9vmDCdH0Y4KDc5tgXuLJ5BpdfPbEhpHHIVzXBjDXfl0K', NULL, NULL, '2023-11-24 03:08:21', '2023-11-24 03:08:21');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes` (`cliente_id`),
  ADD KEY `fk_status` (`pedido_status_id`);

--
-- Índices para tabela `pedidos_imagem`
--
ALTER TABLE `pedidos_imagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_imagem` (`pedido_id`);

--
-- Índices para tabela `pedido_status`
--
ALTER TABLE `pedido_status`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `pedidos_imagem`
--
ALTER TABLE `pedidos_imagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `pedido_status`
--
ALTER TABLE `pedido_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`pedido_status_id`) REFERENCES `pedido_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedidos_imagem`
--
ALTER TABLE `pedidos_imagem`
  ADD CONSTRAINT `fk_imagem` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
