-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 04/06/2021 às 10:12
-- Versão do servidor: 8.0.24
-- Versão do PHP: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sus`
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
(1, '2021-05-26 00:00:00', '15:00', 20, 'A', 1, 1, 1);

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
  `data_agendamento` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `hora_agendamento` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `num_fichas` int DEFAULT NULL,
  `status_agenda` char(2) COLLATE latin1_general_ci DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `cod_consulta` int NOT NULL,
  `fichas_disponiveis` int DEFAULT NULL,
  `especialidade_cod_especialidade` int NOT NULL,
  `medico_cod_medico` int NOT NULL,
  `usuario_cod_user` int NOT NULL,
  `usuario_ubs_cod_ubs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `cod_especialidade` int NOT NULL,
  `nome_especialidade` varchar(60) COLLATE latin1_german2_ci NOT NULL,
  `descricao_especialidade` varchar(100) COLLATE latin1_german2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Fazendo dump de dados para tabela `especialidade`
--

INSERT INTO `especialidade` (`cod_especialidade`, `nome_especialidade`, `descricao_especialidade`) VALUES
(1, 'clicico geral', 'teste');

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
(1, 1);

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
  `crm_medico` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario_cod_user` int NOT NULL,
  `usuario_ubs_cod_ubs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `medico`
--

INSERT INTO `medico` (`cod_medico`, `crm_medico`, `usuario_cod_user`, `usuario_ubs_cod_ubs`) VALUES
(4, NULL, 40, 1),
(5, NULL, 41, 1),
(6, NULL, 44, 1),
(7, NULL, 46, 1),
(8, NULL, 50, 1),
(9, NULL, 52, 1),
(1, '231rrr333', 3, 1),
(2, '435gg5', 14, 1);

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
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `cod_pac` int NOT NULL,
  `usuario_cod_user` int NOT NULL,
  `usuario_ubs_cod_ubs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `paciente`
--

INSERT INTO `paciente` (`cod_pac`, `usuario_cod_user`, `usuario_ubs_cod_ubs`) VALUES
(3, 4, 1),
(4, 5, 1),
(5, 7, 1),
(6, 11, 1),
(7, 15, 1),
(8, 16, 1),
(9, 36, 1),
(10, 37, 1),
(11, 38, 1),
(12, 39, 1),
(16, 42, 1),
(17, 43, 1),
(18, 45, 1),
(19, 47, 1),
(20, 48, 1),
(21, 49, 1),
(22, 51, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente_encaminha_unidade_executante`
--

CREATE TABLE `paciente_encaminha_unidade_executante` (
  `paciente_cod_pac` int NOT NULL,
  `unidade_executante_cod_ue` int NOT NULL
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
  `usuario` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `recurso` varchar(80) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
(1, 'centro social urbano', 'joaquim gasso borges', '687', 'pedra branca', 'bagé', 'centro social urbano', 'rs');

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_executante`
--

CREATE TABLE `unidade_executante` (
  `cod_ue` int NOT NULL,
  `nome_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `descricao_ue` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `rua_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_rua_ue` int DEFAULT NULL,
  `bairro_ue` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `uf_ue` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `email_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `central_reguladora_cod_cr` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  `nome_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `sobrenome_user` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `data_nascimento_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cpf_user` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rg_user` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rua_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cep_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `uf_user` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `pais_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `email_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone1_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone2_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cartao_sus` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `numero_casa` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `sexo_user` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `senha` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ubs_cod_ubs` int NOT NULL,
  `status` char(1) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`cod_user`, `nome_user`, `sobrenome_user`, `data_nascimento_user`, `cpf_user`, `rg_user`, `rua_user`, `bairro_user`, `cidade_user`, `cep_user`, `uf_user`, `pais_user`, `email_user`, `telefone1_user`, `telefone2_user`, `cartao_sus`, `numero_casa`, `sexo_user`, `senha`, `ubs_cod_ubs`, `status`) VALUES
(3, 'gieder', 'loreto', '1980-12-01', '123456', '34234', '', '', '', '', '', '', NULL, NULL, NULL, '43424', NULL, NULL, '123456', 1, NULL),
(4, 'teste', 'teste', '', '123', '12123', '', '', '', '', '', '', NULL, NULL, '', '23', '23', '', '123', 1, NULL),
(5, 'fabio', 'vasques', '1988-11-17', '02041884070', '1096853931', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '96418260', 'RS', 'Brasil', 'fabioportovasques@gmail.com', '53999975310', '53999367651', '423432', '841', 'masculino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'A'),
(7, 'teste', 'teste', NULL, '123456789', '123', NULL, NULL, NULL, NULL, 'rs', 'brasil', NULL, NULL, NULL, '77686', NULL, NULL, '224460', 1, 'A'),
(11, 'teste2', 'teste2', '1987-11-17', '12345678', '1096853931433', 'joaquim gasso borges', 'pedra branca', 'bagé', '9641884070', 'rs', 'Brasil', 'fabioportovasques321@gmail.com', '53999367651', '', '4234324545', '841', 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'A'),
(12, 'Gieder 2', 'Loreto', '1987-11-17', '12', '109685393154', 'joaquim gasso borges', 'pedra branca', 'bagé', '9641884070', 'rs', 'Brasil', 'fabioportovasques321@gmail.com', '53999367651', '', '4234324666', '841', 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'A'),
(14, 'Gieder3', 'Loreto', '1987-11-17', '15', '0987455', 'joaquim gasso borges', 'pedra branca', 'bagé', '9641884070', 'rs', 'Brasil', 'fabioportovasques321@gmail.com', '53999367651', '', '4234324666545', '841', 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'A'),
(15, 'teste3', 'teste3', '1987-11-17', '900', '098745543', 'joaquim gasso borges', 'pedra branca', 'bagé', '9641884070', 'rs', 'Brasil', 'fabioportovasques321@gmail.com', '53999367651', '', '4234324', '841', 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'A'),
(16, 'teste4', 'teste4', '1987-11-17', '901', '09874345543', 'joaquim gasso borges', 'pedra branca', 'bagé', '9641884070', 'rs', 'Brasil', 'fabioportovasques321@gmail.com', '53999367651', '', '423432334', '841', 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'A'),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(23, 'teste5', 'teste5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(24, 'rwrwr', 'rwerwer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(25, 'werwer', 'rwerwr', '2021-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(26, 'erwe', 'rewrwe', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', NULL, 1, NULL),
(27, 'erewr', 'rewrwe', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '45', NULL, 'f', NULL, 1, NULL),
(28, 'erewrew', 'rwerw', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '687678', '78687678', '99', NULL, 'f', NULL, 1, NULL),
(29, 'eqweq', 'ewqeqw', '', NULL, NULL, NULL, NULL, 'Bagé', NULL, NULL, NULL, NULL, '8798798', '8797897', '8754', NULL, 'm', NULL, 1, NULL),
(30, 'ewqeq', 'ewqe', '', NULL, NULL, 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', NULL, 'RS', NULL, NULL, '7978', '87979', '3432', NULL, 'm', NULL, 1, NULL),
(31, 'hkjhkj', 'hjkhkj', '1987-11-17', '24', '98097987876', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '24', 'RS', 'brasil', NULL, '987987', '8789789', '786875564412', NULL, 'm', NULL, 1, NULL),
(32, 'rwer', 'rwrwe\'\'', '1987-11-17', '111', '87987', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '111', 'RS', 'brasil', NULL, '98787', '7868768', '111', NULL, 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, NULL),
(33, 'teste6', 'teste6', '0987-11-17', '666', '666', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '666', 'RS', 'basil', NULL, '787979', '7978', '666', NULL, 'm', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(34, 'teste7', 'teste7', '1990-11-17', '777', '777', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '777', 'RS', 'brasil', NULL, '879879', '897897', '777', NULL, 'f', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(35, 'teste8', 'teste8', '1987-11-17', '999', '999', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '999', 'RS', 'brasil', NULL, '7787', '8789789', '999', NULL, 'f', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(36, 'teste9', 'teste9', '1987-11-17', '222', '222', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '222', 'RS', 'brasil', NULL, '880989', '980890', '222', NULL, 'f', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(37, 'teste10', 'teste10', '19871-11-17', '444', '4444', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '444', 'RS', 'brasil', NULL, '809890', '980089', '444', NULL, '7678', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(38, 'teste11', 'teste11', '', '33333', '333', '', '', 'Hulha Negra', '33333', 'RS', 'brasil', NULL, '', '', '33333', NULL, '', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(39, 'teste12', 'teste12', '1987-11-17', '99999', '99999', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '99999', 'RS', 'brasil', NULL, '98089', '908980', '99999', NULL, 'masculino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(40, 'teste13', 'teste13', '1987-11-17', '444444', '444444', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '444444', 'RS', 'brasil', NULL, '77678678', '678678', '444444', NULL, 'f', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(41, 'Natcheli', 'vasques', '1991-02-22', '101010', '67686787868', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '101010', 'RS', 'brasil', NULL, '53999975310', '8798789', '08788888', NULL, 'femenino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(42, 'Caleb Joaquim', 'José Campos', '1986-12-18', '73771355060', '9000000000', 'Rua Miguel Centena', 'Habitar Brasil', 'Bagé', '73771355060', 'RS', 'brasil', 'caleb@gmail.com', '7797987', '9878979', '879797000', NULL, 'masculino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(43, 'Geraldo Miguel ', 'Anderson Cardoso', '', '51478392240', '0000', 'Rua Fernando Lopes', 'Graças', 'Recife', '51478392240', 'PE', 'brasil', 'ewrwrw@ertr', '', '', '0000', NULL, '', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(44, 'Paulo ', 'Ruan Assunção', '', '21892619024', '0000000000', 'Rua 18 A', 'Vila Bela Vista', 'Rio Claro', '21892619024', 'SP', 'brasil', 'paulo@gmail.com', '', '', '000000000', NULL, '', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(45, 'Tomás Roberto ', 'Augusto Fernandes', '', '66104070027', '888888', 'Avenida São Judas', 'São Judas', 'Bagé', '66104070027', 'RS', 'brasil', 'augustofernandes@gmail.com', '789789', '89789789', '888888', NULL, 'maculino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(46, 'Márcia Alessandra ', 'Rosa de Paula', '', '70493243100', '000', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '70493243100', 'RS', 'brasil', 'rosaPaula@gmail.com', '97987', '789789', '000', NULL, '', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(47, 'Theo Felipe ', 'Gabriel Duarte', '', '09972600173', '151515', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '09972600173', 'RS', 'brasil', 'GabrielDuarte@gmail.com', '', '', '151515', NULL, 'femenino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(48, 'Ian Isaac ', 'Porto', '', '82974676863', '000777', 'Rodovia do Sol 5000', 'Jockey de Itaparica', 'Vila Velha', '82974676863', 'ES', 'brasil', 'Porto@gmail.com', '889890', '09809809', '999777', NULL, 'masculino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(49, 'Luiza Elaine', ' Nogueira', '', '14421220647', '656565', 'Rua Joaquim Gasso', 'Pedras Brancas', 'Bagé', '14421220647', 'RS', 'brasil', 'Nogueira@gmail.com', '87667', '68678', '656565', NULL, 'femenino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(50, 'Bruno ', 'Cláudio Ferreira', '1984-11-17', '10307301800', '202020', '', '', 'Hulha Negra', '10307301800', 'RS', 'brasil', 'ferreira@hotmail.com', '880890', '809890', '202020', NULL, 'masculino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(51, 'Mariah', ' Ester Assunção', '', '25423690625', '878787', 'Alameda SD-05', 'Aeroporto', 'Boa Vista', '25423690625', 'RR', 'brasil', 'ester@gmail.com', '78798', '89789789', '878787', NULL, '', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a'),
(52, 'Jennifer Agatha', ' Aline Souza', '1990-11-17', '34063623971', '0878787', 'Quadra E-3', 'Planalto de Monteserra The', 'Parnaíba', '34063623971', 'PI', 'brasil', 'jennifer@gmail.com', '8628437943', '86998906504', '087087', NULL, 'femenino', '6e63aa9f23a7ff9ff9b1f4f3a0a3f1e9', 1, 'a');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_contem_permissao`
--

CREATE TABLE `usuario_contem_permissao` (
  `usuario_cod_user` int NOT NULL,
  `permissao_cod_permissao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_encaminha_unidade_executante`
--

CREATE TABLE `usuario_encaminha_unidade_executante` (
  `usuario_cod_user` int NOT NULL,
  `unidade_executante_cod_ue` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_realiza_exame`
--

CREATE TABLE `usuario_realiza_exame` (
  `usuario_cod_user` int NOT NULL,
  `exame_cod_exame` int NOT NULL
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
  ADD PRIMARY KEY (`cod_consulta`,`especialidade_cod_especialidade`,`medico_cod_medico`,`usuario_cod_user`,`usuario_ubs_cod_ubs`),
  ADD KEY `fk_consulta_especialidade1_idx` (`especialidade_cod_especialidade`),
  ADD KEY `fk_consulta_medico1_idx` (`medico_cod_medico`),
  ADD KEY `fk_consulta_usuario1_idx` (`usuario_cod_user`,`usuario_ubs_cod_ubs`);

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
  ADD PRIMARY KEY (`cod_medico`,`usuario_cod_user`,`usuario_ubs_cod_ubs`),
  ADD UNIQUE KEY `usuario_cod_user` (`usuario_cod_user`),
  ADD UNIQUE KEY `crm-medico_UNIQUE` (`crm_medico`),
  ADD KEY `fk_medico_usuario1_idx` (`usuario_cod_user`,`usuario_ubs_cod_ubs`);

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
  ADD PRIMARY KEY (`cod_pac`,`usuario_cod_user`,`usuario_ubs_cod_ubs`),
  ADD UNIQUE KEY `usuario_cod_user` (`usuario_cod_user`),
  ADD KEY `fk_paciente_usuario1_idx` (`usuario_cod_user`,`usuario_ubs_cod_ubs`);

--
-- Índices de tabela `paciente_encaminha_unidade_executante`
--
ALTER TABLE `paciente_encaminha_unidade_executante`
  ADD PRIMARY KEY (`paciente_cod_pac`,`unidade_executante_cod_ue`),
  ADD KEY `fk_paciente_has_unidade_executante_unidade_executante1_idx` (`unidade_executante_cod_ue`),
  ADD KEY `fk_paciente_has_unidade_executante_paciente1_idx` (`paciente_cod_pac`);

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
  ADD PRIMARY KEY (`cod_user`,`ubs_cod_ubs`),
  ADD UNIQUE KEY `cartao_sus_UNIQUE` (`cartao_sus`),
  ADD UNIQUE KEY `rg-pac_UNIQUE` (`rg_user`),
  ADD UNIQUE KEY `cpf-pac_UNIQUE` (`cpf_user`),
  ADD KEY `fk_paciente_ubs1_idx` (`ubs_cod_ubs`);
ALTER TABLE `usuario` ADD FULLTEXT KEY `rg_user` (`rg_user`);
ALTER TABLE `usuario` ADD FULLTEXT KEY `rg_user_2` (`rg_user`);

--
-- Índices de tabela `usuario_contem_permissao`
--
ALTER TABLE `usuario_contem_permissao`
  ADD PRIMARY KEY (`usuario_cod_user`,`permissao_cod_permissao`),
  ADD KEY `fk_usuario_has_permissao_permissao1_idx` (`permissao_cod_permissao`),
  ADD KEY `fk_usuario_has_permissao_usuario1_idx` (`usuario_cod_user`);

--
-- Índices de tabela `usuario_encaminha_unidade_executante`
--
ALTER TABLE `usuario_encaminha_unidade_executante`
  ADD PRIMARY KEY (`usuario_cod_user`,`unidade_executante_cod_ue`),
  ADD KEY `fk_usuario_has_unidade_executante_unidade_executante1_idx` (`unidade_executante_cod_ue`),
  ADD KEY `fk_usuario_has_unidade_executante_usuario1_idx` (`usuario_cod_user`);

--
-- Índices de tabela `usuario_realiza_exame`
--
ALTER TABLE `usuario_realiza_exame`
  ADD PRIMARY KEY (`usuario_cod_user`,`exame_cod_exame`),
  ADD KEY `fk_usuario_has_exame_exame1_idx` (`exame_cod_exame`),
  ADD KEY `fk_usuario_has_exame_usuario1_idx` (`usuario_cod_user`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `agenda_ubs`
--
ALTER TABLE `agenda_ubs`
  MODIFY `cod_agenda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `agenda_ue`
--
ALTER TABLE `agenda_ue`
  MODIFY `cod_agenda` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `central_reguladora`
--
ALTER TABLE `central_reguladora`
  MODIFY `cod_cr` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `cod_consulta` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `cod_especialidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `exame`
--
ALTER TABLE `exame`
  MODIFY `cod_exame` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `cod_medico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `cod_pac` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de tabela `permissao`
--
ALTER TABLE `permissao`
  MODIFY `cod_permissao` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ubs`
--
ALTER TABLE `ubs`
  MODIFY `cod_ubs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `unidade_executante`
--
ALTER TABLE `unidade_executante`
  MODIFY `cod_ue` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
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
  ADD CONSTRAINT `fk_consulta_usuario1` FOREIGN KEY (`usuario_cod_user`,`usuario_ubs_cod_ubs`) REFERENCES `usuario` (`cod_user`, `ubs_cod_ubs`);

--
-- Restrições para tabelas `especialidade_compoe_medico`
--
ALTER TABLE `especialidade_compoe_medico`
  ADD CONSTRAINT `fk_especialidade_has_medico_especialidade1` FOREIGN KEY (`especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`),
  ADD CONSTRAINT `fk_especialidade_has_medico_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`);

--
-- Restrições para tabelas `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `fk_medico_usuario1` FOREIGN KEY (`usuario_cod_user`,`usuario_ubs_cod_ubs`) REFERENCES `usuario` (`cod_user`, `ubs_cod_ubs`);

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
  ADD CONSTRAINT `fk_paciente_usuario1` FOREIGN KEY (`usuario_cod_user`,`usuario_ubs_cod_ubs`) REFERENCES `usuario` (`cod_user`, `ubs_cod_ubs`);

--
-- Restrições para tabelas `paciente_encaminha_unidade_executante`
--
ALTER TABLE `paciente_encaminha_unidade_executante`
  ADD CONSTRAINT `fk_paciente_has_unidade_executante_paciente1` FOREIGN KEY (`paciente_cod_pac`) REFERENCES `paciente` (`cod_pac`),
  ADD CONSTRAINT `fk_paciente_has_unidade_executante_unidade_executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`);

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
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_paciente_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`);

--
-- Restrições para tabelas `usuario_contem_permissao`
--
ALTER TABLE `usuario_contem_permissao`
  ADD CONSTRAINT `fk_usuario_has_permissao_permissao1` FOREIGN KEY (`permissao_cod_permissao`) REFERENCES `permissao` (`cod_permissao`),
  ADD CONSTRAINT `fk_usuario_has_permissao_usuario1` FOREIGN KEY (`usuario_cod_user`) REFERENCES `usuario` (`cod_user`);

--
-- Restrições para tabelas `usuario_encaminha_unidade_executante`
--
ALTER TABLE `usuario_encaminha_unidade_executante`
  ADD CONSTRAINT `fk_usuario_has_unidade_executante_unidade_executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`),
  ADD CONSTRAINT `fk_usuario_has_unidade_executante_usuario1` FOREIGN KEY (`usuario_cod_user`) REFERENCES `usuario` (`cod_user`);

--
-- Restrições para tabelas `usuario_realiza_exame`
--
ALTER TABLE `usuario_realiza_exame`
  ADD CONSTRAINT `fk_usuario_has_exame_exame1` FOREIGN KEY (`exame_cod_exame`) REFERENCES `exame` (`cod_exame`),
  ADD CONSTRAINT `fk_usuario_has_exame_usuario1` FOREIGN KEY (`usuario_cod_user`) REFERENCES `usuario` (`cod_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
