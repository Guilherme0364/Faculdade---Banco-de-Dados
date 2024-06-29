create database aula02_05;
use aula02_05;

create table Disciplina(
	codDisciplina int AUTO_INCREMENT primary key,
	nomeDisciplina varchar(45)
);

create table aluno(
	codAluno int AUTO_INCREMENT primary key,
	nomeAluno varchar(45),
	cpfAluno varchar(45)
);

CREATE TABLE Notas (
    codNota INT AUTO_INCREMENT PRIMARY KEY,
    codAluno INT,
    codDisciplina INT,
    nota FLOAT,
    FOREIGN KEY (codDisciplina) REFERENCES Disciplina (codDisciplina),
    FOREIGN KEY (codAluno) REFERENCES Aluno (codAluno)
);


# Criar uma procedure para inserir dados na tabela Disciplina, a procedure deverá receber o nome da disciplina por parâmetro.
delimiter / 
create procedure inserir1(codDisciplina int, nomeDisciplina varchar(45))
begin 
	if((codDisciplina != '') and (nomeDisciplina != '')) then
		insert into Disciplina values (codDisciplina, nomeDisciplina);
	else
		select "Código e nome da disciplinas não podem ser valores nulos" as msg;
	end if;
end;
/ 
delimiter ; 
call inserir1(1, "Software");
select * from disciplina;


# Criar uma procedure para inserir dados na tabela Aluno, a procedure deverá receber o nome do Aluno e cpf do Aluno por parâmetro
delimiter /
create procedure inserir2(codAluno int, nomeAluno varchar(45), cpfAluno varchar(45))
begin 
	if((codAluno != '') and (nomeAluno != '')) then
		insert into Aluno values (codAluno, nomeAluno, cpfAluno);
	else
		select "Código e nome do aluno não podem ser valores nulos" as msg;
	end if;
end;
/ 
delimiter ;
call inserir2(1, "Guilherme", "13283566630");
select * from aluno;


# Criar uma procedure para inserir dados na tabela Nota, a procedure deverá receber o código do aluno, código da disciplina e a nota por parâmetro.
delimiter /
create procedure inserir3(codNota int, codAluno int, codDisciplina int, nota float)
begin 
	if((codNota != '') and (codAluno != '')) then
		insert into Notas values (codNota, codAluno, codDisciplina, nota);
	else
		select "Código da nota e código do aluno não podem ser valores nulos" as msg;
	end if;
end;
/ 
delimiter ;
drop procedure inserir3;
call inserir2(null, 5, 5, 10.0);
select * from Notas;


# Criar uma procedure para listar o nome de todas as disciplinas 
delimiter /
create procedure lista1()
begin 
	select * from disciplina;
end;
/ 
delimiter ; 
call lista1();


# Criar uma procedure para contar e retornar a quantidade de disciplinas cadastradas
delimiter / 
create procedure contagem1()
begin 
	select count(*) as "Quantidade de disciplinas cadastradas" from disciplina;
end;
/ 
delimiter ; 
call contagem1();


# Criar uma procedure que exiba a médias das notas de um determinado Aluno, a procedure deverá receber por parâmetro o código do aluno
delimiter / 
create procedure exibir1(codAluno int) 
begin 
	select avg(nota) from Notas n inner join Aluno a on a.codAluno = n.codAluno;
end;
/
delimiter ; 
call exibir1(1);


