/*
	Querys banco bd-sus

*/

/*
	Select entre a tabela medico e especialidade
*/

SELECT e.cod_especialidade, e.nome_especialidade AS 'Nome da especialidade',m.cod_medico, 
nome_medico,sobrenome_medico,m.crm_medico,m.cpf_medico,e.descricao_especialidade
from
medico m
inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade
;

/*
	Select entre a tabela medico e UBS
*/
SELECT m.cod_medico, m.nome_medico,sobrenome_medico, 
m.cidade_medico, u.cod_ubs, u.bairro_ubs,
u.nome_ubs AS 'lOCAL DE ATENDIMENTO'
from
medico m
inner join medico_atende_ubs me on m.cod_medico = me.medico_cod_medico
inner join ubs u on u.cod_ubs = me.ubs_cod_ubs
;

/*
	Select entre a tabela agenda_ubs e UBS
*/
SELECT 
nome_especialidade,m.nome_medico, u.nome_ubs,u.bairro_ubs,
a.data_agendamento,a.hora_agendamento,a.num_fichas
 from 
agenda_ubs a 
inner join ubs u on u.cod_ubs = a.ubs_cod_ubs
inner join especialidade e on e.cod_especialidade = a.especialidade_cod_especialidade
inner join medico m on m.cod_medico = a.medico_cod_medico
;




