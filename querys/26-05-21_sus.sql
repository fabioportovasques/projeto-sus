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
SELECT * FROM permissao;
SELECT * FROM paciente;

INSERT INTO usuario( nome_user,sobrenome_user,data_nascimento_user,cpf_user,rg_user,rua_user,bairro_user,cidade_user,cep_user,
                    uf_user,pais_user,email_user,telefone1_user,telefone2_user,cartao_sus,numero_casa,sexo_user,senha,ubs_cod_ubs,status) VALUES (
"Gieder3","Loreto","1987-11-17","15","0987455","joaquim gasso borges","pedra branca","bagé","9641884070",
"rs","Brasil","fabioportovasques321@gmail.com","53999367651","","4234324666545","841","m",md5("224460"),'1',"A"
);


/*
	Select entre a tabela medico e especialidade
*/

SELECT e.cod_especialidade, e.nome_especialidade AS 'Nome da especialidade',m.cod_medico, 
m.crm_medico,e.descricao_especialidade
from
medico m
inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade
;

/*
	Select entre a tabela medico e usuario
*/

SELECT 
*
from 
usuario u 
inner join medico m on m.usuario_cod_user = u.cod_user
;

/*
	Select entre a tabela paciente e usuario
*/

SELECT 
*
from 
usuario u 
inner join paciente pac on pac.usuario_cod_user = u.cod_user
;


/*
	Select entre a tabela medico e especialidade
*/

SELECT e.cod_especialidade, e.nome_especialidade ,u.nome_user,
e.descricao_especialidade
from
medico m 
inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade
inner join usuario u on  u.cod_user = m.usuario_cod_user
;

/*
	 agenda + UBS + medico + Especialidades
*/

	SELECT a.hora_agendamento,a.num_fichas,user.nome_user AS 'nome do medico',
	a.data_agendamento,u.cod_ubs, u.bairro_ubs,e.nome_especialidade,
	u.nome_ubs AS 'lOCAL DE ATENDIMENTO'
	from
	medico m 
	inner join medico_atende_ubs me on m.cod_medico = me.medico_cod_medico
	inner join ubs u on u.cod_ubs = me.ubs_cod_ubs
	inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
	inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade
	inner join agenda_ubs a on a.cod_agenda = espec.especialidade_cod_especialidade
	inner join usuario user on  user.cod_user = m.usuario_cod_user
	where cod_ubs='1' AND status_agenda ="a"
	;
/*
	teste query que traz o campo numero de fichas disponiveis
*/

SELECT a.num_fichas
from
medico m 
inner join medico_atende_ubs me on m.cod_medico = me.medico_cod_medico
inner join ubs u on u.cod_ubs = me.ubs_cod_ubs
inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade

inner join agenda_ubs a on a.cod_agenda = espec.especialidade_cod_especialidade


;


