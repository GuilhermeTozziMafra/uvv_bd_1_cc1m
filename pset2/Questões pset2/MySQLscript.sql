--- Questão 1 ---

select numero_departamento, round (avg(salario),2) as média_salarial from funcionario group by numero_departamento;

--- Questão 2 ---

select sexo, round (avg(salario),2) as média_salarial from funcionario  group by sexo;

--- Questão 3 ---

select concat(primeiro_nome, nome_meio, ultimo_nome) as nome_completo, data_nascimento, year(current_timestamp())-year(data_nascimento) as idade, salario, d.nome_departamento 
from funcionario f inner join departamento d on f.numero_departamento = d.numero_departamento ;

--- Questão 4 ---

select concat(primeiro_nome, nome_meio, ultimo_nome) as nome_completo, year(current_timestamp())-year(data_nascimento) as idade, salario 
from funcionario where salario * 1.20 < 35000 or salario * 1.15 >= 35000;

--- Questão 5 ---

select distinct f1.primeiro_nome as funcionarios, f2.primeiro_nome as gerentes, d.nome_departamento, f1.salario 
from funcionario f1
inner join funcionario f2 on (f1.cpf_supervisor = f2.cpf)
inner join departamento d on (f1.numero_departamento = d.numero_departamento)
order by nome_departamento, salario desc;

--- Questão 6 ---

select distinct concat(primeiro_nome, nome_meio, ultimo_nome) as nome_funcionario, numero_departamento, concat(d.nome_dependente, f.nome_meio, f.ultimo_nome) as nome_dependente, year(current_timestamp())-year(d.data_nascimento) as idade_dependente, if(d.sexo = "M","Masculino","Feminino") as sexo
from funcionario f, dependente
inner join dependente d where f.cpf = d.cpf_funcionario;

--- Questão 7 ---

select concat(f.primeiro_nome, f.nome_meio, f.ultimo_nome) as nome_completo, f.salario,  part.nome_departamento 
from funcionario as f inner join departamento part ON (part.numero_departamento = f.numero_departamento) left join dependente depart ON (depart.cpf_funcionario = f.cpf)
WHERE depart.nome_dependente IS null;

--- Questão 8 ---

select distinct numero_departamento, trabalha_em.numero_projeto, concat(f.primeiro_nome, f.nome_meio, f.ultimo_nome) as nome_funcionario,horas
from funcionario as f
inner join trabalha_em on f.cpf = trabalha_em.cpf_funcionario order by numero_departamento;

--- Questão 9 ---

select sum(t.horas) as horas_totais, nome_projeto, nome_departamento 
from trabalha_em t
inner join projeto p on p.numero_projeto = t.numero_projeto 
inner join departamento d on d.numero_departamento = p.numero_departamento 
where t.numero_projeto = t.numero_projeto
group by t.numero_projeto, p.nome_projeto, d.nome_departamento;

--- Questão 10 ---

select numero_departamento, round (avg(salario),2) as média_salarial from funcionario group by numero_departamento;

--- Questão 11 ---
select concat(f.primeiro_nome,' ', nome_meio,'.',ultimo_nome) as nome_funcionario, projeto.nome_projeto,(trabalha_em.horas * 50) as valor
from ((funcionario as f inner join trabalha_em on f.cpf = trabalha_em.cpf_funcionario) inner join projeto on projeto.numero_projeto = trabalha_em.numero_projeto);

--- Questão 12 ---

select concat(primeiro_nome, nome_meio, ultimo_nome) as funcionario, d.nome_departamento, p.nome_projeto
from departamento d inner join projeto p on (d.numero_departamento = p.numero_departamento) 
inner join trabalha_em t on (t.numero_projeto = p.numero_projeto) 
inner join funcionario f on (d.numero_departamento = f.numero_departamento) where t.horas is null;

--- Questão 14 ---

select f.numero_departamento, count(*) as qnt_empregados from funcionario f, departamento d
where f.numero_departamento = d.numero_departamento
group by f.numero_departamento;

--- Questão 15 ---
select distinct concat(f.primeiro_nome, f.nome_meio, f.ultimo_nome) as nome_completo, f.numero_departamento, p.nome_projeto
from funcionario f
inner join trabalha_em te on (f.cpf = te.cpf_funcionario)
left outer join projeto p on (p.numero_projeto = te.numero_projeto and f.cpf = te.cpf_funcionario and te.horas > 0)
order by nome_projeto;

