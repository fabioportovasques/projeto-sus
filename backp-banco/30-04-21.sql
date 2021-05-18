
SELECT * FROM `medico` ;

SELECT * FROM especialidade ;

SELECT * 
  FROM medico m
       INNER JOIN 
       especialidade_has_medico espec  
       ON 
       espec.especialidade_cod-especialidade = espec.medico_cod-medico;
       

SELECT especialidade_cod-especialidade AS especialidade FROM `agenda-ubs`  ;

SELECT 
* 
FROM especialidade espec 
inner join medico m 
on
espec.cod-especialidade = m.cod-medico
inner join especialidade_has_medico e
on
e.medico_cod-medico = m.cod-medico
inner join especialidade_has_medico e 
on espec.cod-especialidade = e.especialidade_cod-especialidade; 

/*
testes

*/



SELECT 
* 
FROM especialidade espec 
inner join medico m 
on
especialidade.cod-especialidade  = m.cod-medico
inner join especialidade_has_medico e
on
e.medico_cod-medico = m.cod-medico
inner join especialidade_has_medico es 
on especialidade.cod-especialidade = e.especialidade_cod-especialidade; 
