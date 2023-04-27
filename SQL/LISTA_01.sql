/*
Banco de Dados
Nome: Alexandre Sued Silva Sena
Matrícula: 11821EBI001
Data: 09/04
*/

create database lista_01;
create schema dataStroage;
-- drop database lista_01;
-- drop schema dataStroage;

create table lista_01.tbGradeSalario
(
	i_idSalario_tbGradeSalario int not null auto_increment,
    n_minSalario_tbGradeSalario numeric(6,2) not null,
    n_maxSalario_tbGradeSalario numeric(6,2) not null,
    i_fgAtivo_tbGradeSalario int not null,
    
	constraint pk_tb_departamento_id_departamento primary key (i_idSalario_tbGradeSalario)
);	

create table lista_01.tbDepartamento
(
	i_idDepartamento_tbDepartamento int not null auto_increment,
    s_nome_tbDepartamento varchar(60) not null,
    s_cidade_tbDepartamento varchar(40) not null,
    i_fgAtivo_tbDepartamento int not null,
    
	constraint pk_tb_departamento_id_departamento primary key (i_idDepartamento_tbDepartamento)
);

create table lista_01.tbFuncionario
(
	i_idFuncionario_tbFuncionario int not null auto_increment,
    s_nome_tbFuncionario varchar(60) not null,
    dt_nascimento_tbFuncionario date not null,
    n_salario_tbFuncionario numeric(6,2),
    s_cargo_tbFuncionario varchar(60) not null,
    i_fgAtivo_tbFuncionario int not null,
    i_idGerente_tbFuncionario int,
    i_idDepartamento_tbFuncionario  int not null,
    
	-- foreign key (i_idGerente_tbFuncionario) references lista_01.tbFuncionario (i_idFuncionario_tbFuncionario),
	foreign key (i_idDepartamento_tbFuncionario) references lista_01.tbDepartamento (i_idDepartamento_tbDepartamento),
	constraint pk_tb_funcionario_id_funcionario primary key (i_idFuncionario_tbFuncionario)
);
   
INSERT INTO lista_01.tbDepartamento (s_nome_tbDepartamento,
	s_cidade_tbDepartamento, i_fgAtivo_tbDepartamento)
VALUES 
	('Vendas', 'São Paulo', 1),
	('Desenvolvimento', 'São Paulo', 2),
	('Marketing', 'Rio de Janeiro', 3),
	('Recursos Humanos', 'Belo Horizonte', 4);

INSERT INTO lista_01.tbGradeSalario (n_minSalario_tbGradeSalario,
	n_maxSalario_tbGradeSalario,i_fgAtivo_tbGradeSalario)
VALUES 
	(1000.00, 2000.00, 1),
	(2001.00, 3000.00, 2),
	(3001.00, 4000.00, 3),
	(4001.00, 5000.00, 4),
	(5001.00, 6000.00, 5);

INSERT INTO lista_01.tbFuncionario (s_nome_tbFuncionario,
	dt_nascimento_tbFuncionario, n_salario_tbFuncionario, s_cargo_tbFuncionario,
    i_fgAtivo_tbFuncionario, i_idGerente_tbFuncionario, i_idDepartamento_tbFuncionario)
VALUES 
	('João', '1990-01-01', 5000.00, 'Gerente', 1, 1, 1),
	('Maria', '1995-05-10', 2500.00, 'Assistente', 2, 20, 1),
	('Pedro', '1988-12-20', 3500.00, 'Analista', 3, 3, 2),
	('Fernanda', '1998-03-15', 2000.00, 'Estagiário', 4, 14, 2),
    ('Ana', '1992-10-12', 2800.00, 'Assistente', 1, 5, 1),
	('Renato', '1993-07-05', 3200.00, 'Analista', 1, 56, 2),
	('Bruna', '1995-12-03', 1800.00, 'Estagiário', 1, 67, 2),
	('Gustavo', '1990-05-22', 5000.00, 'Gerente', 1, 78, 3),
	('Mariana', '1988-09-08', 4200.00, 'Coordenador', 1, 9, 3),
	('Felipe', '1997-02-28', 2200.00, 'Estagiário', 1, 10, 4),
	('Leticia', '1989-01-15', 6500.00, 'Diretor', 1, 101, 4),
	('Thiago', '1994-11-20', 3700.00, 'Analista', 1, 700, 4);


-- questão 4
select 
	i_idFuncionario_tbFuncionario as id_funcionario, 
	i_idDepartamento_tbFuncionario as id_departamento, 
	s_nome_tbFuncionario as nome, 
	s_cargo_tbFuncionario as cargo, 
	dt_nascimento_tbFuncionario as dt_nascimento, 
	n_salario_tbFuncionario as salario, 
	i_fgAtivo_tbFuncionario as fg_ativo
from
	lista_01.tbfuncionario;


-- questão 5
select 
	s_nome_tbFuncionario as nome, 
	s_cargo_tbFuncionario as cargo, 
    n_salario_tbFuncionario as salario
from
	lista_01.tbFuncionario
where
	n_salario_tbFuncionario NOT BETWEEN 1500.00 AND 5000.00;


-- questão 6
select
	s_nome_tbFuncionario as Funcionario,
	n_salario_tbFuncionario as Salário_Mensal
from 
	lista_01.tbfuncionario
where
	(n_salario_tbFuncionario > 1500.00) and (i_idDepartamento_tbFuncionario = 10 or i_idDepartamento_tbFuncionario = 3);


-- questao 7
/*  TESTES
insert into lista_01.tbFuncionario (s_nome_tbFuncionario,
	dt_nascimento_tbFuncionario, n_salario_tbFuncionario, s_cargo_tbFuncionario,
    i_fgAtivo_tbFuncionario, i_idGerente_tbFuncionario, i_idDepartamento_tbFuncionario)
values 
	('Ana', '1990-05-22', 5000.00, 'Gerente', 3, 27, 3);
    ('Roberto', '1985-11-30', 4500.00, 'Coordenador', 5, 7782, 3);
*/
select
	s_nome_tbFuncionario as Nome
from
	lista_01.tbFuncionario
where
	(i_idDepartamento_tbFuncionario = 3 and s_nome_tbFuncionario like '%A%A%') or i_idGerente_tbFuncionario = 7782;
