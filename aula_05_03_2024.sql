create database HistoricoEscolar;
use HistoricoEscolar;

create table Curso(
codCurso int primary key,
descricao varchar(40));

insert into Curso values
(1,"Engenharia de Software"),
(2,"Medicina"),
(3,"Direito"),
(4,"Administração"),
(5,"Publicidade");


create table Aluno(
ra varchar(10) primary key,
nome varchar(40),
status varchar(10),
codCurso int,
foreign key(codCurso) references Curso(codCurso) on delete restrict);


insert into Aluno values
("1234","Caio","Cursando",1),
("2345","Andre","Cursando",2),
("3456","Igor","Trancado",1),
("4567","Gustavo","Cursando",1),
("5678","Yago","Cursando",5);

create table Disciplina(
codDisc int primary key,
descricao varchar(40));

insert into Disciplina values
(1,"Algoritmos"),
(2,"Gestão de Projetos"),
(3,"Paradigmas"),
(4,"Banco de Dados"),
(5,"Marketing"),
(6,"Banco de Dados II");


create table Professor(
codProf int primary key,
nome varchar(40));

insert into Professor values
(10,"Adriana"),
(11,"Cristiane"),
(12,"Claudete"),
(13,"Tiago"),
(14,"Rogério");


create table Matricula(
matricula int auto_increment,
ra varchar(10),
codDisc int,
codProf int,
nota double(4,2),
faltas int,
situacao varchar(10),
primary key(matricula),
foreign key(ra) references Aluno(ra) on delete restrict,
foreign key(codDisc) references Disciplina(codDisc) on delete restrict,
foreign key(codProf) references Professor(codProf) on delete restrict);

insert into Matricula values
(null,"2345",1,12,10,1,"Aprovado"),
(null,"5678",4,10,8,4,"Reprovado"),
(null,"5678",1,11,2,4,"Reprovado"),
(null,"5678",2,12,3,4,"Reprovado"),
(null,"1234",2,14,5,5,"Aprovado"),
(null,"4567",5,11,8,4,"Aprovado"),
(null,"3456",3,13,9,3,"Aprovado"),
(null,"3456",6,10,7.5,0,"Aprovado");

# 1. Exibir o nome dos alunos que cursam Engenharia de Software
select c.descricao, a.nome from Curso c, Aluno a where a.codCurso = c.codCurso and c.descricao = "Engenharia de Software";

# 2. Exibir o nome dos alunos que cursam a disciplina Banco de Dados II
select a.nome, d.descricao from Aluno a inner join Matricula m on m.ra = a.ra inner join Disciplina d on d.codDisc = m.codDisc where d.descricao = "Banco de Dados II";

# 3. Exibir a quantidade de alunos matriculados no curso de Medicina
select count(a.ra) as "Quantidade de alunos matriculados" from Aluno a inner join Curso c on a.codCurso = c.codCurso where c.descricao = "Medicina";

# 4. Exibir a quantidade de alunos matriculados por curso
select c.descricao, count(a.ra) as "Quantidade de matrículas" from Aluno a inner join Curso c on a.codCurso = c.codCurso group by c.descricao;

# 5. Exibir os alunos que reprovaram na disciplina de Algoritmos
select a.nome, m.situacao from Disciplina d inner join Matricula m on d.codDisc = m.codDisc inner join Aluno a on a.ra = m.ra where m.situacao = "Reprovado" and d.descricao = "Algoritmos";

# 6. Exibir o nome do aluno, descrição do curso, a descrição das disciplinas cursadas com o nome do respectivo professor, nota, falta e situação
select a.nome, c.descricao, d.descricao