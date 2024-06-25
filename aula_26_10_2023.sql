create database CompanhiaArea;
use CompanhiaArea;

create table CompanhiaAerea(

	idCompanhia int primary key,
    descricao varchar(40),
	pais varchar(20) 

);

create table Piloto(

	idPiloto int primary key,
    nomePiloto varchar(40),
    salario double,
    gratificacao double,
    companhia int,
    
    foreign key (companhia) references CompanhiaAerea (idCompanhia)

);

create table Aeroporto(

	idAeroporto int primary key,
    nomeAeroporto varchar(100), 
    cidade varchar(20),
    pais varchar(20)

);

create table Voo(

	idVoo varchar(20) primary key,
    aeroportoOrigem int,
    aeroportoDestino int, 
    dataVoo date, 
    hora varchar(10),
    companhia int, 
    piloto int,
    
    foreign key (aeroportoOrigem) references Aeroporto (idAeroporto),
    foreign key (aeroportoDestino) references Aeroporto (idAeroporto),    
	foreign key (companhia) references CompanhiaAerea (idCompanhia),
    foreign key (piloto) references Piloto (idPiloto)

);

INSERT INTO CompanhiaAerea (idCompanhia, descricao, pais) VALUES
(1, 'Gol', 'Brasil'),
(2, 'Azul', 'Brasil'),
(3, 'Latam Airlines Brasil', 'Brasil'),
(4, 'Latam Airlines Equador', 'Equador'),
(5, 'American Airlines', 'EUA');

INSERT INTO Piloto (idPiloto, nomePiloto, Salario, Gratificacao, Companhia) VALUES
(10, 'João Pedro Lopes', 12000, 1400, 3),
(11, 'Anderson Frisanco', 8300, 1800, 1),
(12, 'Cristiano Pereira', 9800, 1400, 3),
(13, 'José Antonio Silva', 10000, 2200, 2),
(14, 'Maycon Roberto Noronha', 7500, 1800, 1),
(15, 'Eugenio dos Santos', 12000, 1400, 3);

INSERT INTO Aeroporto (idAeroporto, nomeAeroporto, Cidade, Pais) VALUES
(100, 'Aeroporto Internacional de Florianópolis – Hercílio Luz', 'Florianópolis', 'Brasil'),
(101, 'Aeroporto Internacional de São Paulo – Guarulhos', 'Guarulhos', 'Brasil'),
(102, 'Aeroporto Internacional de Campinas – Viracopos', 'Campinas', 'Brasil'),
(103, 'Aeroporto Internacional de Natal – Governador Aluízio Alves', 'Natal', 'Brasil'),
(104, 'Aeroporto Internacional de Miami', 'Miami', 'EUA'),
(105, 'Aeroporto Internacional John F. Kennedy', 'Nova Iorque', 'EUA'),
(106, 'Aeroporto Internacional de São Francisco', 'São Francisco', 'EUA');

INSERT INTO Voo (idVoo, companhia, aeroportoOrigem, aeroportoDestino, dataVoo, hora, piloto) VALUES
('JJ2345', 3, 101, 105, '2023-08-22', '12:10:00', 12),
('TY2225', 2, 102, 104, '2023-08-23', '22:45:00', 13),
('HQ5432', 2, 101, 100, '2023-08-22', '20:15:00', 13),
('JJ3344', 3, 102, 103, '2023-08-21', '18:05:00', 12),
('JJ2355', 3, 101, 106, '2023-08-22', '06:10:00', 15),
('DQ1325', 5, 101, 105, '2023-08-22', '06:12:00', 10),
('NR6787', 1, 105, 100, '2023-08-22', '10:09:00', 14);

select * from CompanhiaArea, Piloto, Aeroporto, Voo;

# Exibir os dados dos voos com destino a Miami
select v.* from Voo v inner join Aeroporto a on v.aeroportoDestino = a.idAeroporto where a.cidade = "Miami";

# Exibir o código dos voos da Companhia Azul
select v.idVoo from Voo v inner join CompanhiaAerea c on v.companhia = c.idCompanhia where descricao = "Azul";

# Exibir o código dos voos com pouso no Aeroporto de Viracopos
select v.idVoo from Voo v inner join Aeroporto a on v.aeroportoDestino = a.idAeroporto where nomeAeroporto like "%Viracopos";

# Exibir o código dos voos que possuem a letra Q na segunda posição
select v.idVoo from Voo v where v.idVoo like "_Q%";

# Exibir o Nome do Piloto, salário, nome da Companhia aérea e código dos Voos
select v.idVoo, p.nomePiloto, p.salario, comp.descricao from Piloto p inner join Voo v on p.idPiloto = v.piloto 
inner join companhiaAerea comp on comp.idCompanhia = p.Companhia;

# Apagar a coluna país da tabela companhiaAerea 
alter table CompanhiaAerea drop pais; 

# Apagar os voos com data 22/08/2023
delete from Voo where dataVoo = "2023-08-02";

# Exibir a quant
select count(idVoo) from Voo v inner join Piloto p on v.piloto = p.piloto inner join Aeroporto a on v.aeroportoOrigem = a.idAeroporto
where nomePiloto like "Maycon %" and cidade = "Campinas";




