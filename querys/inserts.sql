SELECT * FROM central_reguladora;
SELECT * FROM especialidade;
SELECT * FROM medico;
SELECT * FROM ubs;
SELECT * FROM unidade_executante;

INSERT INTO `central_reguladora` (`cod_cr`, `nome_cr`, `rua_cr`, `numero_rua_cr`, `bairro_cr`, `cidade_cr`, `email_cr`, `uf_cr`) VALUES
(1, 'teste', 'sete de setembro', '795', 'centro', 'Porto Alegre', 'teste@gmail.com', 'rs');

INSERT INTO `especialidade` (`cod_especialidade`, `nome_especialidade`, `descricao_especialidade`) VALUES
(1, 'neurologista', 'especialista que trata doenças no cérebro e medula espinhal'),
(2, 'Anestesiologia', 'é a especialidade médica que estuda e proporciona ausência ou alívio da dor'),
(3, 'Dermatologia', 'trata doenças da pele');



INSERT INTO `medico` (`cod_medico`, `nome_medico`, `sobrenome_medico`, `data_nascimento_medico`, `cpf_medico`, `rg_medico`, `crm_medico`, `rua_medico`, `numero_casa_medico`, `bairro_medico`, `cidade_medico`, `uf_medico`, `pais_medico`, `email_medico`) VALUES
(1, 'Fernando ', 'Vasconcellos', '1987-11-17 00:00:00', '5345345345345', '54353453', '356ylop', 'marechal Deodoro', 323, 'centro', 'bagé', 'rs', 'Brasil', 'fernandovasconcellos@gmail.com'),
(2, 'Ana Paula', 'Conceição', '2002-05-02 00:00:00', '4534543', '53453453', '545yjj', 'General Osório', 469, 'centro', 'Pelotas', 'rs', 'Brasil', 'anapaula@gmail.com');


INSERT INTO `ubs` (`cod_ubs`, `nome_ubs`, `rua_ubs`, `numero_rua_ubs`, `bairro_ubs`, `cidade_ubs`, `email_ubs`, `uf_ubs`) VALUES
(1, 'centro social urbano', 'joaquim gasso borges', '300', 'Pedra Branca', 'Bagé', 'socialurbano@gmail.com', 'rs');

INSERT INTO `unidade_executante` (`cod_ue`, `nome_ue`, `descricao_ue`, `rua_ue`, `numero_rua_ue`, `bairro_ue`, `cidade_ue`, `uf_ue`, `email_ue`, `central_reguladora_cod_cr`) VALUES
(1, 'posto A', 'Especializado em neurologia', 'tiradentes', 455, 'centro', 'Pelotas', 'rs', 'potoa@gmail.com', 1);




