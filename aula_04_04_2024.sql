create database aulanormalizacao;
use aulanormalizacao;

create table Instituicao(
	id int auto_increment primary key,
    nome varchar(30)
);

create table Curso(
	id int primary key, 
    nome varchar(30),
    idInstituicao int,
    
    foreign key (idInstituicao) references Instituicao(id)
);

create table Disciplina(
	id int primary key,
    idCurso int, 
    idProfessor int,
    nome varchar(30),
    
    foreign key (idCurso) references Curso(id),
    foreign key (idProfessor) references Professor(id)
);

create table Aluno(
	nome varchar(30),
    ra varchar(6) primary key,
    estado varchar(10),
    idCurso int,
    
    foreign key (idCurso) references Curso(id)
);

create table Historico(
	id int primary key,
	ano year,
	nota float(2,1),
    falta int, 
    situacao varchar(30),
    idAluno varchar(6),
    idDisciplina int,
    
    foreign key (idAluno) references Aluno(ra),
    foreign key (idDisciplina) references Disciplina(id)
);

create table Professor(
	id int primary key,
    nome varchar(30)
);

create table Projeto(
	id int primary key, 
    cargaHorario int, 
	idAluno varchar(30),
    
    foreign key (idAluno) references Aluno(ra)
);



