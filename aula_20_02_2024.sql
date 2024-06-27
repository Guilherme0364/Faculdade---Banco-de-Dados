create database Banco_Empresa;
use Banco_Empresa;

create table Empregado(

	codigo int primary key, 
    nome varchar(20),
    telefone varchar(20),
    salario double

);

create table Dependente(
	
    codEmp int,
    codDep int, 
    nome varchar(20),
    
    primary key (codEmp, codDep),
    
    foreign key (codDep) references Empregado(codigo)

);

insert into Empregado values ('1', 'Solange', '94080 3010', '3000.0');

insert into Dependente (`codEmp`, `codDep`, `nome`) VALUES ('2', '1', 'Artur');
insert into Dependente (`codEmp`, `codDep`, `nome`) VALUES ('2', '2', 'Pedro');
insert into Dependente (`codEmp`, `codDep`, `nome`) VALUES ('3', '1', 'Marilia');
insert into Dependente (`codEmp`, `codDep`, `nome`) VALUES ('10', '1', 'Joana');


select * from Dependente;

# Mostrar os funcionarios e seus dependentes
select e.nome, d.nome from Empregado e, Dependente d where e.codigo = d.codEmp;

# Mostrar a quantidade de funcionarios
select count(codigo) from Empregado;

select e.nome, count(codDep) as "Quantidade de dependentes" from Empregado e inner join Dependente d on e.codigo = d.codEmp group by e.nome;

# Exibir o nome dos empregados que possuem salario superior a 3000
select e.nome, e.salario from Empregado e where e.salario > 3000;


