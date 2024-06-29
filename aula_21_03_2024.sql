create database empresa2;
use empresa2;

create table Departamento(
idDepartamento int primary key,
descricao varchar(40),
local varchar(40));

create table Empregados(
idEmpregados int primary key,
nome varchar (50),
salario double (10,2),
dpto int,
foreign key(dpto) references Departamento(idDepartamento) on delete set null on update set null);

create table Telefone(
idEmpregados int,
fone varchar(15),
primary key(idEmpregados,fone));

insert into Departamento values(1, "Vendas", "São João");
insert into Departamento values(2, "RH", "São Paulo");
insert into Departamento values(3, "Engenharia", "Rio");
insert into Departamento values(4, "Tecnologia", "São Paulo");

insert into Empregados values(1, "Jose", 3000,1);
insert into Empregados values(2, "Pedro", 500,2);
insert into Empregados values(3, "Jaime", 3000,3);
insert into Empregados values(4, "Paulo", 3200,1);
insert into Empregados values(5, "André", 5000,2);
insert into Empregados values(6, "João", 5000,1);

insert into Telefone values(1, "98112-4040");
insert into Telefone values(1, "99989-3234");
insert into Telefone values(3, "36231429");
insert into Telefone values(5, "94999-2121");


# Recuperar o nome e salário de todos os empregados que trabalham no mesmo departamento que o JOSE trabalha. 
select e.nome, e.salario from Empregados e where dpto in (select dpto from Empregados e where e.nome = "Jose");

# Obter o nome dos empregados que não possuem telefone
select e.nome from Empregados e where idEmpregados not in (select idEmpregados from Telefone);

# Listar o nome dos empregados que ganham o maior salário
select e.nome, e.salario from Empregados e where salario = (select max(salario) from Empregados);

# Recuperar o nome e salário de todos os empregados que ganham mais do que a média salarial da empresa.
select e.nome, e.salario from Empregados e where salario > (select avg(salario) from Empregados);

# Recuperar o nome, número do departamento e salário de todos os empregados que trabalham no departamento situado no RIO ou no departamento denominado VENDAS. 


# Exibir o nome e telefone de todos os empregados que trabalham no departamento de vendas.
select nome, fone from Empregados e left join Telefone t on e.idEmpregados = t.idEmpregados where dpto in (select idDepartamento from Departamento where descricao = "vendas");

# Recuperar o número do departamento e sua média salarial. Devem ser recuperados apenas os departamentos cuja média salarial é maior do que a média salarial do departamento número 3. 
select dpto, avg(salario) from Empregados group by dpto having avg(salario) > (select avg(salario) from Empregados where dpto = 3);

# Criar uma view para exibir o nome do funcionario e o nome do departamento em que trabalha


# Mostrar o nome do departamento e a quantidade de funcionários alocadas neste departamento
select descricao, (select count(idEmpregados) from Empregados e where d.idDepartamento = e.dpto) as quantidade from Departamento d;

# Exibir o nome do funcionario, nome do departamento e a quantidade de telefones que ele possui

