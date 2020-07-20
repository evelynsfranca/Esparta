#- Buscar os nomes de todos os alunos que frequentam alguma turma do professor 'JOAO PEDRO'.

select a.nome
from professor prof
inner join turma t on t.professor_id = prof.id
inner join aluno_turma a_t on a_t.turma_id = t.id
inner join aluno a on a_t.aluno_id = a.id
where prof.nome = 'Joao Pedro'; 


#- Buscar os dias da semana que tenham aulas da disciplina 'MATEMATICA'.

select t.dia_da_semana
from disciplina disc
inner join turma t on t.disciplina_id = disc.id
where disc.nome = 'Matematica';


#- Buscar todos os alunos que frequentem aulas de 'MATEMATICA' e também 'FISICA'.

select a.nome
from disciplina disc
inner join turma t on t.disciplina_id = disc.id
inner join aluno_turma a_t on a_t.turma_id = t.id
inner join aluno a on a_t.aluno_id = a.id
where disc.nome = 'Matematica'
and a.nome in (
	select a.nome
	from disciplina disc
	inner join turma t on t.disciplina_id = disc.id
	inner join aluno_turma a_t on a_t.turma_id = t.id
	inner join aluno a on a_t.aluno_id = a.id
	where disc.nome = 'Fisica'); 


#- Buscar as disciplinas que não tenham nenhuma turma.

select distinct disciplina.nome 
from disciplina 
where disciplina.id not in (select turma.disciplina_id from turma);


#- Buscar os alunos que frequentem aulas de 'MATEMATICA' exceto os que frequentem 'QUIMICA'.

select a.nome
from disciplina disc
inner join turma t on t.disciplina_id = disc.id 
inner join aluno_turma a_t on a_t.turma_id = t.id
inner join aluno a on a_t.aluno_id = a.id
where disc.nome = 'Matematica'
	and a.nome not in (
	select a.nome
	from turma t
	inner join disciplina disc on t.disciplina_id = disc.id 
	inner join aluno_turma a_t on a_t.turma_id = t.id
	inner join aluno a on a_t.aluno_id = a.id
	where disc.nome = 'Quimica'
);

#OBS 1: Como existe uma tabela para o relacionamento entre aluno e turma não vi necessidade de inserir o id do aluno na tabela turma, então não levei isso em consideração.
#OBS 2: Na tabela aluno_turma o id da turma está definido como varchar(45) enquanto na tabela turma o id está definido como int, o que pode gerar erro, então considerei como sendo int em ambas as tabelas.