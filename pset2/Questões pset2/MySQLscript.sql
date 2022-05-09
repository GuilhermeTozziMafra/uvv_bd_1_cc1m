--- Questão 1 ---
select numero_departamento, round (avg(salario),2) as média_salarial from funcionario group by numero_departamento;

--- Questão 2 ---
select sexo, round (avg(salario),2) as média_salarial from funcionario  group by sexo;

--- Questão 4 ---
select concat(primeiro_nome, nome_meio, ultimo_nome) as nome_completo, year(current_timestamp())-year(data_nascimento) as idade, salario from funcionario where salario * 1.20 < 35000 or salario * 1.15 >= 35000;

--- Questão 6 ---
select distinct concat(primeiro_nome, nome_meio, ultimo_nome) as nome_funcionario, numero_departamento, concat(d.nome_dependente, f.nome_meio, f.ultimo_nome) as nome_dependente, year(current_timestamp())-year(d.data_nascimento) as idade_dependente, if(d.sexo = "M","Masculino","Feminino") as sexo from funcionario f, dependente
inner join dependente d where f.cpf = d.cpf_funcionario;

--- Questão 10 ---
select numero_departamento, round (avg(salario),2) as média_salarial from funcionario group by numero_departamento;

