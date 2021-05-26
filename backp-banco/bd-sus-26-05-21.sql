-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 26/05/2021 às 09:05
-- Versão do servidor: 8.0.24
-- Versão do PHP: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd-sus`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda_ubs`
--

CREATE TABLE `agenda_ubs` (
  `cod_agenda` int NOT NULL,
  `data_agendamento` datetime NOT NULL,
  `hora_agendamento` varchar(45) NOT NULL,
  `num_fichas` int NOT NULL,
  `status_agenda` char(1) NOT NULL,
  `especialidade_cod_especialidade` int NOT NULL,
  `ubs_cod_ubs` int NOT NULL,
  `medico_cod_medico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `agenda_ubs`
--

INSERT INTO `agenda_ubs` (`cod_agenda`, `data_agendamento`, `hora_agendamento`, `num_fichas`, `status_agenda`, `especialidade_cod_especialidade`, `ubs_cod_ubs`, `medico_cod_medico`) VALUES
(1, '2021-05-19 00:00:00', '10:00', 20, 'I', 1, 1, 2),
(3, '2021-05-20 00:00:00', '10:00', 10, 'A', 4, 2, 1),
(4, '2021-02-20 00:00:00', '10:00', 20, 'A', 3, 3, 3),
(5, '2021-05-24 00:00:00', '15:00', 15, 'A', 5, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda_ubs_possui_consulta`
--

CREATE TABLE `agenda_ubs_possui_consulta` (
  `agenda_ubs_cod_agenda` int NOT NULL,
  `consulta_cod_consulta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda_ue`
--

CREATE TABLE `agenda_ue` (
  `cod_agenda` int NOT NULL,
  `data_agendamento` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `hora_agendamento` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `num_fichas` int DEFAULT NULL,
  `status_agenda` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `unidade_executante_cod_ue` int NOT NULL,
  `unidade_executante_central_reguladora_cod_cr` int NOT NULL,
  `medico_cod_medico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `central_reguladora`
--

CREATE TABLE `central_reguladora` (
  `cod_cr` int NOT NULL,
  `nome_cr` varchar(100) DEFAULT NULL,
  `rua_cr` varchar(45) DEFAULT NULL,
  `numero_rua_cr` varchar(45) DEFAULT NULL,
  `bairro_cr` varchar(45) DEFAULT NULL,
  `cidade_cr` varchar(45) DEFAULT NULL,
  `email_cr` varchar(45) DEFAULT NULL,
  `uf_cr` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `central_reguladora`
--

INSERT INTO `central_reguladora` (`cod_cr`, `nome_cr`, `rua_cr`, `numero_rua_cr`, `bairro_cr`, `cidade_cr`, `email_cr`, `uf_cr`) VALUES
(1, 'teste', 'sete de setembro', '795', 'centro', 'Porto Alegre', 'teste@gmail.com', 'rs');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `cod_consulta` int NOT NULL,
  `fichas_disponiveis` int DEFAULT NULL,
  `paciente_cod_pac` int NOT NULL,
  `especialidade_cod_especialidade` int NOT NULL,
  `medico_cod_medico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `cod_especialidade` int NOT NULL,
  `nome_especialidade` varchar(60) CHARACTER SET latin1 COLLATE latin1_german2_ci NOT NULL,
  `descricao_especialidade` varchar(100) CHARACTER SET latin1 COLLATE latin1_german2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Fazendo dump de dados para tabela `especialidade`
--

INSERT INTO `especialidade` (`cod_especialidade`, `nome_especialidade`, `descricao_especialidade`) VALUES
(1, 'neurologista', 'especialista que trata doenças no cérebro e medula espinhal'),
(2, 'Anestesiologia', 'é a especialidade médica que estuda e proporciona ausência ou alívio da dor'),
(3, 'Dermatologia', 'trata doenças da pele'),
(4, 'clinico geral', 'realiza avaliação clinica no paciente'),
(5, 'ginecologista', 'trata a saúde do aparelho reprodutor feminino');

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade_compoe_medico`
--

CREATE TABLE `especialidade_compoe_medico` (
  `especialidade_cod_especialidade` int NOT NULL,
  `medico_cod_medico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Fazendo dump de dados para tabela `especialidade_compoe_medico`
--

INSERT INTO `especialidade_compoe_medico` (`especialidade_cod_especialidade`, `medico_cod_medico`) VALUES
(4, 1),
(1, 2),
(3, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

CREATE TABLE `exame` (
  `cod_exame` int NOT NULL,
  `nome_exame` varchar(80) COLLATE latin1_general_ci DEFAULT NULL,
  `descricao_exame` tinytext COLLATE latin1_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `cod_medico` int NOT NULL,
  `nome_medico` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `sobrenome_medico` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `data_nascimento_medico` datetime DEFAULT NULL,
  `cpf_medico` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `rg_medico` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `crm_medico` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `rua_medico` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `numero_casa_medico` int DEFAULT NULL,
  `bairro_medico` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_medico` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `uf_medico` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `pais_medico` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email_medico` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `senha` varchar(32) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `medico`
--

INSERT INTO `medico` (`cod_medico`, `nome_medico`, `sobrenome_medico`, `data_nascimento_medico`, `cpf_medico`, `rg_medico`, `crm_medico`, `rua_medico`, `numero_casa_medico`, `bairro_medico`, `cidade_medico`, `uf_medico`, `pais_medico`, `email_medico`, `senha`) VALUES
(1, 'Fernando ', 'Vasconcellos', '1987-11-17 00:00:00', '5345345345345', '54353453', '356ylop', 'marechal Deodoro', 323, 'centro', 'bagé', 'rs', 'Brasil', 'fernandovasconcellos@gmail.com', NULL),
(2, 'Ana Paula', 'Conceição', '2002-05-02 00:00:00', '4534543', '53453453', '545yjj', 'General Osório', 469, 'centro', 'Pelotas', 'rs', 'Brasil', 'anapaula@gmail.com', NULL),
(3, 'Joana', 'Castro', '1995-05-02 00:00:00', '43242', '64535345', '554ygg', 'Sete de setembro', 433, 'centro', 'Bagé', 'rs', 'Brasil', 'joana@gmail.com', NULL),
(4, 'fred', 'alves', '1980-03-01 00:00:00', '6456466', '54645', 'hhh555', '', NULL, NULL, NULL, NULL, NULL, 'fred@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico_atende_ubs`
--

CREATE TABLE `medico_atende_ubs` (
  `medico_cod_medico` int NOT NULL,
  `ubs_cod_ubs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `medico_atende_ubs`
--

INSERT INTO `medico_atende_ubs` (`medico_cod_medico`, `ubs_cod_ubs`) VALUES
(1, 1),
(2, 1),
(4, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `cod_pac` int NOT NULL,
  `nome_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sobrenome_pac` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `data_nascimento_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cpf_pac` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rg_pac` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rua_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `bairro_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `cep_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `uf_pac` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `pais_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telefone1_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `telefone2_pac` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `cartao_sus` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `numero_casa` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `sexo_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `senha` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `ubs_cod_ubs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `paciente`
--

INSERT INTO `paciente` (`cod_pac`, `nome_pac`, `sobrenome_pac`, `data_nascimento_pac`, `cpf_pac`, `rg_pac`, `rua_pac`, `bairro_pac`, `cidade_pac`, `cep_pac`, `uf_pac`, `pais_pac`, `email_pac`, `telefone1_pac`, `telefone2_pac`, `cartao_sus`, `numero_casa`, `sexo_pac`, `senha`, `ubs_cod_ubs`) VALUES
(2, 'fabio', 'vasques', '17111987', '02041884070', '1096853931', 'kjhkhk', 'khjkhjk', 'bage', '8080', 'rs', 'brasil', 'hghjgjh@ghjgjh', '8989080', '89080', '8908080', '890', 'masculino', NULL, 1),
(3, 'gieder', 'loreto', '1987-11-17', '9098098', '8978897', 'hhih', 'hihiu', 'iuhiu', NULL, 'rs', 'brasil', 'gieder@gmail.com', NULL, NULL, '78798', '7879', NULL, NULL, 1),
(4, 'teste', 'teste', '1987-11-17', '89908', '879711', '77', 'hiuhiu', 'ihh', NULL, 'rs', 'uihiuh', 'dewdw@gmail.com', NULL, NULL, '987897', '777', NULL, NULL, 1),
(11, 'teste1', 'teste1', '', '798789', '89887', '', '', '', NULL, '', '', 'fwfwe2WE2@dwdwed', NULL, NULL, '798798', '', NULL, NULL, 1),
(12, 'teste6', 'teste6', '', '534535', '43243', '', '', '', NULL, '', '', NULL, NULL, NULL, '4234234', '', NULL, NULL, 1),
(13, 'teste8', 'teste8', '', '123456', '434', '', '', '', '', '', '', 'erge@ere', '', '', '423', NULL, '', '123', 1),
(14, 'teste9', 'teste9', '', '1234', '6876', '', '', '', '', '', '', 'tetgyt@yytyt', '', '', '6786', NULL, '', '202cb962ac59075b964b07152d234b70', 1),
(15, 'teste10', 'teste10', '', '12345', '7798', '', '', '', '', '', '', 'yuguy@yuguygyu', '', '', '7979', NULL, '', '202cb962ac59075b964b07152d234b70', 1),
(16, 'teste11', 'wqeqwe', '', '5678', '31231', '', '', '', '3232', '', '', 'erwe@wdweqw', '', '', '323123', NULL, '', '202cb962ac59075b964b07152d234b70', 1),
(18, 'teste12', 'teste12', '', '3443444222', '434343', '', '', '', '', '', '', 'teste@gmail.com', '', '', '6687678', NULL, '', '202cb962ac59075b964b07152d234b70', 1),
(20, 'rwerew', 'werwr', '', '109', '4343', '', '', '', '', '', '', 'rwe@eerer', '', '', '43', NULL, '', '2000f6325dfc4fc3201fc45ed01c7a5d', 1),
(21, 'teste13', 'teste13', '', '90', '34242', '', '', '', '', '', '', 'teste13@gmail.com', '', '', '2323', NULL, '', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente_encaminha_unidade_executante`
--

CREATE TABLE `paciente_encaminha_unidade_executante` (
  `paciente_cod_pac` int NOT NULL,
  `unidade_executante_cod_ue` int NOT NULL,
  `descricao_exame` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente_realiza_exame`
--

CREATE TABLE `paciente_realiza_exame` (
  `paciente_cod_pac` int NOT NULL,
  `exame_cod_exame` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissao`
--

CREATE TABLE `permissao` (
  `cod_permissao` int NOT NULL,
  `usuario` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `recurso` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `permissao`
--

INSERT INTO `permissao` (`cod_permissao`, `usuario`, `recurso`) VALUES
(1, 'fabio', 'cad-medico.php');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ubs`
--

CREATE TABLE `ubs` (
  `cod_ubs` int NOT NULL,
  `nome_ubs` varchar(100) DEFAULT NULL,
  `rua_ubs` varchar(45) DEFAULT NULL,
  `numero_rua_ubs` varchar(45) DEFAULT NULL,
  `bairro_ubs` varchar(45) DEFAULT NULL,
  `cidade_ubs` varchar(45) DEFAULT NULL,
  `email_ubs` varchar(45) DEFAULT NULL,
  `uf_ubs` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `ubs`
--

INSERT INTO `ubs` (`cod_ubs`, `nome_ubs`, `rua_ubs`, `numero_rua_ubs`, `bairro_ubs`, `cidade_ubs`, `email_ubs`, `uf_ubs`) VALUES
(1, 'centro social urbano', 'joaquim gasso borges', '300', 'Pedra Branca', 'Bagé', 'socialurbano@gmail.com', 'rs'),
(2, 'ubs Malafaia', 'Malafaia', '987', 'Industrial 1', 'Bagé', 'ubs_malafaia@gmail.com', 'rs'),
(3, 'UBS IVO FERRONATO', 'ponciano maciel maya giorgis', '2990', 'Ivo Ferronato', 'Bagé', 'ubs_ivo@gmail.com', 'rs');

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_executante`
--

CREATE TABLE `unidade_executante` (
  `cod_ue` int NOT NULL,
  `nome_ue` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `descricao_ue` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `rua_ue` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `numero_rua_ue` int DEFAULT NULL,
  `bairro_ue` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_ue` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `uf_ue` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email_ue` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `central_reguladora_cod_cr` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `unidade_executante`
--

INSERT INTO `unidade_executante` (`cod_ue`, `nome_ue`, `descricao_ue`, `rua_ue`, `numero_rua_ue`, `bairro_ue`, `cidade_ue`, `uf_ue`, `email_ue`, `central_reguladora_cod_cr`) VALUES
(1, 'posto A', 'Especializado em neurologia', 'tiradentes', 455, 'centro', 'Pelotas', 'rs', 'potoa@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_executante_compoe_medico`
--

CREATE TABLE `unidade_executante_compoe_medico` (
  `unidade_executante_cod_ue` int NOT NULL,
  `medico_cod_medico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_executante_realiza_exame`
--

CREATE TABLE `unidade_executante_realiza_exame` (
  `unidade_executante_cod_ue` int NOT NULL,
  `exame_cod_exame` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `cod_user` int NOT NULL,
  `usuario` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `senha` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `status` char(2) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`cod_user`, `usuario`, `senha`, `status`) VALUES
(1, 'fabio', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 'A'),
(7, 'Gieder', 'e10adc3949ba59abbe56e057f20f883e', 'A'),
(8, 'teste', 'e10adc3949ba59abbe56e057f20f883e', 'I'),
(9, 'teste1', '224460', NULL),
(10, 'teste2', '44234234', 'A'),
(11, 'teste3', '224460', 'A'),
(12, 'teste4', '123456', 'A'),
(13, 'teste5', '6ee7a7f22c4024cef59d25be2365a5a7', 'A'),
(14, 'teste6', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 'A'),
(15, 'teste7', 'e10adc3949ba59abbe56e057f20f883e', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_contem_permissao`
--

CREATE TABLE `usuario_contem_permissao` (
  `usuario_cod_user` int NOT NULL,
  `permissao_cod_permissao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `agenda_ubs`
--
ALTER TABLE `agenda_ubs`
  ADD PRIMARY KEY (`cod_agenda`,`especialidade_cod_especialidade`,`ubs_cod_ubs`,`medico_cod_medico`),
  ADD KEY `fk_agenda_especialidade1_idx` (`especialidade_cod_especialidade`),
  ADD KEY `fk_agenda_ubs1_idx` (`ubs_cod_ubs`),
  ADD KEY `fk_agenda_ubs_medico1_idx` (`medico_cod_medico`);

--
-- Índices de tabela `agenda_ubs_possui_consulta`
--
ALTER TABLE `agenda_ubs_possui_consulta`
  ADD PRIMARY KEY (`agenda_ubs_cod_agenda`,`consulta_cod_consulta`),
  ADD KEY `fk_agenda_ubs_has_consulta_consulta1_idx` (`consulta_cod_consulta`),
  ADD KEY `fk_agenda_ubs_has_consulta_agenda_ubs1_idx` (`agenda_ubs_cod_agenda`);

--
-- Índices de tabela `agenda_ue`
--
ALTER TABLE `agenda_ue`
  ADD PRIMARY KEY (`cod_agenda`,`unidade_executante_cod_ue`,`unidade_executante_central_reguladora_cod_cr`,`medico_cod_medico`),
  ADD KEY `fk_agenda-ue_unidade-executante1_idx` (`unidade_executante_cod_ue`,`unidade_executante_central_reguladora_cod_cr`),
  ADD KEY `fk_agenda_ue_medico1_idx` (`medico_cod_medico`);

--
-- Índices de tabela `central_reguladora`
--
ALTER TABLE `central_reguladora`
  ADD PRIMARY KEY (`cod_cr`),
  ADD UNIQUE KEY `nome-ubs_UNIQUE` (`nome_cr`);

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`cod_consulta`,`paciente_cod_pac`,`especialidade_cod_especialidade`,`medico_cod_medico`),
  ADD KEY `fk_consulta_paciente1_idx` (`paciente_cod_pac`),
  ADD KEY `fk_consulta_especialidade1_idx` (`especialidade_cod_especialidade`),
  ADD KEY `fk_consulta_medico1_idx` (`medico_cod_medico`);

--
-- Índices de tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`cod_especialidade`);

--
-- Índices de tabela `especialidade_compoe_medico`
--
ALTER TABLE `especialidade_compoe_medico`
  ADD PRIMARY KEY (`especialidade_cod_especialidade`,`medico_cod_medico`),
  ADD KEY `fk_especialidade_has_medico_medico1_idx` (`medico_cod_medico`),
  ADD KEY `fk_especialidade_has_medico_especialidade1_idx` (`especialidade_cod_especialidade`);

--
-- Índices de tabela `exame`
--
ALTER TABLE `exame`
  ADD PRIMARY KEY (`cod_exame`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`cod_medico`),
  ADD UNIQUE KEY `cpf-medico_UNIQUE` (`cpf_medico`),
  ADD UNIQUE KEY `crm-medico_UNIQUE` (`crm_medico`);

--
-- Índices de tabela `medico_atende_ubs`
--
ALTER TABLE `medico_atende_ubs`
  ADD PRIMARY KEY (`medico_cod_medico`,`ubs_cod_ubs`),
  ADD KEY `fk_medico_has_ubs_ubs1_idx` (`ubs_cod_ubs`),
  ADD KEY `fk_medico_has_ubs_medico1_idx` (`medico_cod_medico`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cod_pac`,`ubs_cod_ubs`),
  ADD UNIQUE KEY `rg-pac_UNIQUE` (`rg_pac`),
  ADD UNIQUE KEY `cpf-pac_UNIQUE` (`cpf_pac`),
  ADD UNIQUE KEY `cartao_sus_UNIQUE` (`cartao_sus`),
  ADD KEY `fk_paciente_ubs1_idx` (`ubs_cod_ubs`);

--
-- Índices de tabela `paciente_encaminha_unidade_executante`
--
ALTER TABLE `paciente_encaminha_unidade_executante`
  ADD PRIMARY KEY (`paciente_cod_pac`,`unidade_executante_cod_ue`),
  ADD UNIQUE KEY `descricao_exame_UNIQUE` (`descricao_exame`),
  ADD KEY `fk_paciente_has_unidade-executante_unidade-executante1_idx` (`unidade_executante_cod_ue`),
  ADD KEY `fk_paciente_has_unidade-executante_paciente1_idx` (`paciente_cod_pac`);

--
-- Índices de tabela `paciente_realiza_exame`
--
ALTER TABLE `paciente_realiza_exame`
  ADD PRIMARY KEY (`paciente_cod_pac`,`exame_cod_exame`),
  ADD KEY `fk_paciente_has_exame_exame1_idx` (`exame_cod_exame`),
  ADD KEY `fk_paciente_has_exame_paciente1_idx` (`paciente_cod_pac`);

--
-- Índices de tabela `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`cod_permissao`);

--
-- Índices de tabela `ubs`
--
ALTER TABLE `ubs`
  ADD PRIMARY KEY (`cod_ubs`),
  ADD UNIQUE KEY `nome-ubs_UNIQUE` (`nome_ubs`);

--
-- Índices de tabela `unidade_executante`
--
ALTER TABLE `unidade_executante`
  ADD PRIMARY KEY (`cod_ue`,`central_reguladora_cod_cr`),
  ADD KEY `fk_unidade-executante_central-reguladora1_idx` (`central_reguladora_cod_cr`);

--
-- Índices de tabela `unidade_executante_compoe_medico`
--
ALTER TABLE `unidade_executante_compoe_medico`
  ADD PRIMARY KEY (`unidade_executante_cod_ue`,`medico_cod_medico`),
  ADD KEY `fk_unidade_executante_has_medico_medico1_idx` (`medico_cod_medico`),
  ADD KEY `fk_unidade_executante_has_medico_unidade_executante1_idx` (`unidade_executante_cod_ue`);

--
-- Índices de tabela `unidade_executante_realiza_exame`
--
ALTER TABLE `unidade_executante_realiza_exame`
  ADD PRIMARY KEY (`unidade_executante_cod_ue`,`exame_cod_exame`),
  ADD KEY `fk_unidade_executante_has_exame_exame1_idx` (`exame_cod_exame`),
  ADD KEY `fk_unidade_executante_has_exame_unidade_executante1_idx` (`unidade_executante_cod_ue`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_user`);

--
-- Índices de tabela `usuario_contem_permissao`
--
ALTER TABLE `usuario_contem_permissao`
  ADD PRIMARY KEY (`usuario_cod_user`,`permissao_cod_permissao`),
  ADD KEY `fk_usuario_has_permissao_permissao1_idx` (`permissao_cod_permissao`),
  ADD KEY `fk_usuario_has_permissao_usuario1_idx` (`usuario_cod_user`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `agenda_ubs`
--
ALTER TABLE `agenda_ubs`
  MODIFY `cod_agenda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `agenda_ue`
--
ALTER TABLE `agenda_ue`
  MODIFY `cod_agenda` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `central_reguladora`
--
ALTER TABLE `central_reguladora`
  MODIFY `cod_cr` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `cod_consulta` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `cod_especialidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `exame`
--
ALTER TABLE `exame`
  MODIFY `cod_exame` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `cod_medico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `cod_pac` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de tabela `permissao`
--
ALTER TABLE `permissao`
  MODIFY `cod_permissao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `ubs`
--
ALTER TABLE `ubs`
  MODIFY `cod_ubs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `unidade_executante`
--
ALTER TABLE `unidade_executante`
  MODIFY `cod_ue` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `agenda_ubs`
--
ALTER TABLE `agenda_ubs`
  ADD CONSTRAINT `fk_agenda_especialidade1` FOREIGN KEY (`especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`),
  ADD CONSTRAINT `fk_agenda_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`),
  ADD CONSTRAINT `fk_agenda_ubs_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`);

--
-- Restrições para tabelas `agenda_ubs_possui_consulta`
--
ALTER TABLE `agenda_ubs_possui_consulta`
  ADD CONSTRAINT `fk_agenda_ubs_has_consulta_agenda_ubs1` FOREIGN KEY (`agenda_ubs_cod_agenda`) REFERENCES `agenda_ubs` (`cod_agenda`),
  ADD CONSTRAINT `fk_agenda_ubs_has_consulta_consulta1` FOREIGN KEY (`consulta_cod_consulta`) REFERENCES `consulta` (`cod_consulta`);

--
-- Restrições para tabelas `agenda_ue`
--
ALTER TABLE `agenda_ue`
  ADD CONSTRAINT `fk_agenda-ue_unidade-executante1` FOREIGN KEY (`unidade_executante_cod_ue`,`unidade_executante_central_reguladora_cod_cr`) REFERENCES `unidade_executante` (`cod_ue`, `central_reguladora_cod_cr`),
  ADD CONSTRAINT `fk_agenda_ue_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`);

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_consulta_especialidade1` FOREIGN KEY (`especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`),
  ADD CONSTRAINT `fk_consulta_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`),
  ADD CONSTRAINT `fk_consulta_paciente1` FOREIGN KEY (`paciente_cod_pac`) REFERENCES `paciente` (`cod_pac`);

--
-- Restrições para tabelas `especialidade_compoe_medico`
--
ALTER TABLE `especialidade_compoe_medico`
  ADD CONSTRAINT `fk_especialidade_has_medico_especialidade1` FOREIGN KEY (`especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`),
  ADD CONSTRAINT `fk_especialidade_has_medico_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`);

--
-- Restrições para tabelas `medico_atende_ubs`
--
ALTER TABLE `medico_atende_ubs`
  ADD CONSTRAINT `fk_medico_has_ubs_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`),
  ADD CONSTRAINT `fk_medico_has_ubs_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`);

--
-- Restrições para tabelas `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_paciente_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`);

--
-- Restrições para tabelas `paciente_encaminha_unidade_executante`
--
ALTER TABLE `paciente_encaminha_unidade_executante`
  ADD CONSTRAINT `fk_paciente_has_unidade-executante_paciente1` FOREIGN KEY (`paciente_cod_pac`) REFERENCES `paciente` (`cod_pac`),
  ADD CONSTRAINT `fk_paciente_has_unidade-executante_unidade-executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`);

--
-- Restrições para tabelas `paciente_realiza_exame`
--
ALTER TABLE `paciente_realiza_exame`
  ADD CONSTRAINT `fk_paciente_has_exame_exame1` FOREIGN KEY (`exame_cod_exame`) REFERENCES `exame` (`cod_exame`),
  ADD CONSTRAINT `fk_paciente_has_exame_paciente1` FOREIGN KEY (`paciente_cod_pac`) REFERENCES `paciente` (`cod_pac`);

--
-- Restrições para tabelas `unidade_executante`
--
ALTER TABLE `unidade_executante`
  ADD CONSTRAINT `fk_unidade-executante_central-reguladora1` FOREIGN KEY (`central_reguladora_cod_cr`) REFERENCES `central_reguladora` (`cod_cr`);

--
-- Restrições para tabelas `unidade_executante_compoe_medico`
--
ALTER TABLE `unidade_executante_compoe_medico`
  ADD CONSTRAINT `fk_unidade_executante_has_medico_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`),
  ADD CONSTRAINT `fk_unidade_executante_has_medico_unidade_executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`);

--
-- Restrições para tabelas `unidade_executante_realiza_exame`
--
ALTER TABLE `unidade_executante_realiza_exame`
  ADD CONSTRAINT `fk_unidade_executante_has_exame_exame1` FOREIGN KEY (`exame_cod_exame`) REFERENCES `exame` (`cod_exame`),
  ADD CONSTRAINT `fk_unidade_executante_has_exame_unidade_executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`);

--
-- Restrições para tabelas `usuario_contem_permissao`
--
ALTER TABLE `usuario_contem_permissao`
  ADD CONSTRAINT `fk_usuario_has_permissao_permissao1` FOREIGN KEY (`permissao_cod_permissao`) REFERENCES `permissao` (`cod_permissao`),
  ADD CONSTRAINT `fk_usuario_has_permissao_usuario1` FOREIGN KEY (`usuario_cod_user`) REFERENCES `usuario` (`cod_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
