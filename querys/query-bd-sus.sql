/*
	Querys banco bd-sus

*/

/*
	Select entre a tabela medico e especialidade
*/

SELECT e.nome_especialidade AS 'Nome da especialidade', nome_medico,sobrenome_medico from
medico m
inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade
;