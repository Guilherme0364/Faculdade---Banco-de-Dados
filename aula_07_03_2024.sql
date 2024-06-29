create database aula_07_03_2024;
use aula_07_03_2024;

create table Funcionario(
	idFunc int primary key,
    nomeF varchar(30),
    sexo varchar(1),
    salario double, 
    idDepto int, 
        
    foreign key (idDepto) references Departamento(idDepto)
);

create table Departamento(
	idDepto int primary key, 
    nomeD varchar(30)
);

insert into Departamento values 
(1, 'Tecnologia'),
(2, 'Compras'),
(3, 'RH'),
(4, 'Vendas');

insert into Funcionario values
('10', 'Antonio', 'M', 2000, 2), 
('11', 'Solange', 'F', 3500, 1),
('12', 'Pedro', 'M', 3800, 1),
('13', 'Cristina', 'F', 1700, 4);


create view FuncDepto(nome_Funcionario, nome_Departamento) as select nomeF, nomeD from Funcionario f, Departamento d where f.idDepto = d.idDepto;

create view Exemplo2 (nome_Departamento, numero_Funcionario, TotalSalario) as select nomeD, count(*), sum(salario) from Funcionario f, Departamento D where f.idDepto = d.idDepto group by nomeD;
