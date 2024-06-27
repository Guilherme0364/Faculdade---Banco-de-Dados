create database aula_29_02_2024;
use aula_29_02_2024;

create table Universidade(
nome varchar(30) primary key
);

create table Aluno(
	RA varchar(7) primary key,
	nome varchar(30),     
    status varchar(30)
);

create table Curso(
	codCurso int primary key,
    nome varchar(30)
);

create table Disciplina (
	nomeDisciplina varchar(30),
    codDisciplina int primary key,
    codProfessor int,
    foreign key (codProfessor) references Professor(codProfessor)	    
);

create table Professor(
	codProfessor int primary key,
    nome varchar(30)
);

create table Matricula (
	idMatricula int,
    RA varchar(7),
    codCurso int, 
    ano int, 
    semestre int,
    status varchar(30),
    
    primary key (idMatricula, RA),
    
    foreign key (codCurso) references Curso (codCurso),
    foreign key (RA) references Aluno (RA)    
);

create table DiscMatricula(
	idMatricula int auto_increment,
    codDisciplina int,
    codProfessor int, 
    notas double,
    faltas int, 
    situacao varchar(30),
    
    primary key (idMatricula, codDisciplina, codProfessor),
    
    foreign key (idMatricula) references Matricula (idMatricula),
    foreign key (codDisciplina) references Disciplina (codDisciplina),
    foreign key (codProfessor) references Professor (codProfessor)
);

INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('23134-6', 'Guilherme', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('45654-7', 'Thiago', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('97895-4', 'Rafael', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('23497-4', 'Raphael', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('61321-4', 'Ronaldo', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('64654-9', 'Paula', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('61564-6', 'Anna Julia', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('32465-4', 'Marcela', 'Ativo');
INSERT INTO `aula_29_02_2024`.`Aluno` (`RA`, `nome`, `status`) VALUES ('33435-6', 'João ', 'Ativo');

INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('1', 'Cristiane ');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('2', 'Adriana ');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('3', 'Matheus ');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('4', 'Rogerio');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('5', 'Pedro');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('6', 'Marcos');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('7', 'Patricia');
INSERT INTO `aula_29_02_2024`.`Professor` (`codProfessor`, `nome`) VALUES ('8', 'Miguel');

INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Engenharia de Software', '1', '1');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Banco de Dados', '2', '2');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Programação Mobile', '3', '3');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Anatomia Humana', '4', '4');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Algoritmos', '5', '5');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Patologia', '6', '6');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Tecnologias Web', '7', '7');
INSERT INTO `aula_29_02_2024`.`Disciplina` (`nomeDisciplina`, `codDisciplina`, `codProfessor`) VALUES ('Inteligência Artificial', '8', '8');




select * from Aluno;