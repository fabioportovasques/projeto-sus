SELECT * FROM central_reguladora;
SELECT * FROM especialidade;
SELECT * FROM medico;
SELECT * FROM ubs;
SELECT * FROM unidade_executante;
SELECT * FROM especialidade_compoe_medico;
SELECT * FROM medico_atende_ubs;
SELECT * FROM agenda_ubs;
SELECT * FROM agenda_ue;
SELECT * FROM medico_atende_ubs;
SELECT * FROM usuario;


INSERT INTO usuario (usuario,senha,status) VALUES ("Gieder",
md5("224460"),"A");

INSERT INTO `central_reguladora` (`cod_cr`, `nome_cr`, `rua_cr`, `numero_rua_cr`, `bairro_cr`, `cidade_cr`, `email_cr`, `uf_cr`) VALUES
(1, 'teste', 'sete de setembro', '795', 'centro', 'Porto Alegre', 'teste@gmail.com', 'rs');

INSERT INTO `especialidade` (`cod_especialidade`, `nome_especialidade`, `descricao_especialidade`) VALUES
(1, 'neurologista', 'especialista que trata doenças no cérebro e medula espinhal'),
(2, 'Anestesiologia', 'é a especialidade médica que estuda e proporciona ausência ou alívio da dor'),
(3, 'Dermatologia', 'trata doenças da pele');



INSERT INTO `medico` (`cod_medico`, `nome_medico`, `sobrenome_medico`, `data_nascimento_medico`, `cpf_medico`, `rg_medico`, `crm_medico`, `rua_medico`, `numero_casa_medico`, `bairro_medico`, `cidade_medico`, `uf_medico`, `pais_medico`, `email_medico`) VALUES
(null, 'Joana', 'Castro', '1995-05-02 00:00:00', '43242', '64535345', '554ygg', 'Sete de setembro', 433, 'centro', 'Bagé', 'rs', 'Brasil','joana@gmail.com');


INSERT INTO `ubs` (`cod_ubs`, `nome_ubs`, `rua_ubs`, `numero_rua_ubs`, `bairro_ubs`, `cidade_ubs`, `email_ubs`, `uf_ubs`) VALUES
(NULL, 'UBS IVO FERRONATO', 'ponciano maciel maya giorgis', '2990', 'Ivo Ferronato', 'Bagé', 'ubs_ivo@gmail.com', 'rs');


INSERT INTO `unidade_executante` (`cod_ue`, `nome_ue`, `descricao_ue`, `rua_ue`, `numero_rua_ue`, `bairro_ue`, `cidade_ue`, `uf_ue`, `email_ue`, `central_reguladora_cod_cr`) VALUES
(1, 'posto A', 'Especializado em neurologia', 'tiradentes', 455, 'centro', 'Pelotas', 'rs', 'potoa@gmail.com', 1);




