create database Empresas;
use Empresas;

create table Cliente(
	cod_cli int primary key,
    nome_cli varchar(40),
    rua varchar(40),
    cidade varchar(40),
    cep char(8),
    uf varchar(40)
);

create table Pedido(
num_ped int primary key,
prazo_entr int,
cod_cli int,
cod_vend int,
foreign key (cod_cli) references Cliente(cod_cli),
foreign key (cod_vend) references Vendedor(cod_vend)
);

create table Produto(
cod_prod int primary key,
unid_prod char(3),
desc_prod varchar(20),
val_unit decimal(9,2)
);

create table Item_Pedido(
num_ped int,
cod_prod int,
qtd_ped int,
primary key(num_ped, cod_prod),
foreign key(num_ped) references Pedido(num_ped),
foreign key(cod_prod) references Produto(cod_prod)
);

create table Vendedor(
cod_vend int primary key,
nome_vend varchar(40),
saldo_fixo decimal(9,2)
);

-- Inserir dados na tabela Cliente
INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (1, 'Cliente 1', 'Rua 1', 'Cidade 1', '12345678', 'UF1');

INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (2, 'Cliente 2', 'Rua 2', 'Cidade 2', '23456789', 'UF2');

INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (3, 'Cliente 3', 'Rua 3', 'Cidade 3', '34567890', 'UF3');

INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (4, 'João', 'Rua João', 'Cidade João', '12345000', 'JN');

-- Inserir dados na tabela Pedido
INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (1, 7, 1, 1);

INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (2, 5, 2, 2);

INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (3, 10, 3, 1);

INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (4, 22, 4, 1);

-- Inserir dados na tabela Produto
INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (1, 'UNI', 'Produto 1', 10.99);

INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (2, 'CX', 'Produto 2', 25.50);

INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (3, 'KG', 'Produto 3', 5.75);

INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (4, 'KG', 'Produto 4', 9.75);

-- Inserir dados na tabela Item_Pedido
INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (1, 1, 3);

INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (2, 2, 2);

INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (3, 3, 5);

INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (4, 4, 33);

-- Inserir dados na tabela Vendedor
INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (1, 'Vendedor 1', 5000.00);

INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (2, 'Vendedor 2', 7000.00);

INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (3, 'Vendedor 3', 6000.00);

INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (4, 'Vendedor 4', 9000.00);

#2)
select Pedido.num_ped, Produto.desc_prod, Vendedor.nome_vend 
from Pedido inner join Vendedor on Pedido.cod_vend = Vendedor.cod_vend
inner join Item_Pedido on Pedido.num_ped = Item_Pedido.num_ped
inner join Produto on Item_Pedido.cod_prod = Produto.cod_prod;

#3) Exibir o nome dos vendedores que possuem pedidos com prazo de entrega de 7 dias
select Vendedor.nome_vend from Pedido inner join Vendedor on Pedido.cod_vend and prazo_entr = 7;

#4) Exibir os clientes de "São João" que compraram "Notebook"
select c.* from Cliente c inner join Pedido p on c.cod_cli = p.cod_cli inner join Item_pedido i on p.num_ped = i.num_ped 
inner join Produto pd on pd.cod_prod = i.cod_prod where desc_prod = "Produto 3" and cidade = "Cidade 3";

#5) Exibir o numero do pedido e o valor a pagar pelo pedido, considerar o valor unitario e a quantidade
select i.num_ped, sum(val_unit * qtd_ped) as "Valor total dos pedidos" from Item_pedido i inner join Produto pd on i.cod_prod = pd.cod_prod group by num_ped;

#6) Encontrar a quantidade de pedidos agrupados por cidade de origem
select cidade, count(num_ped) as "Número total de pedidos" from Pedido inner join Cliente on Pedido.cod_cli = Cliente.cod_cli group by cidade;

#7) Encontrar vendedores que venderam "Notebook" 
select nome_vend from Vendedor v inner join Pedido p on v.cod_vend = p.cod_vend inner join Item_Pedido i on i.num_ped = p.num_ped 
inner join Produto on Produto.cod_prod = i.cod_prod and Produto.desc_prod = "Produto 1";

#8) Encontrar o nome dos clientes que possuem pelo menos 7 pedidos
select c.nome_cli, count(p.num_ped) from Pedido p inner join Cliente c on p.cod_cli = c.cod_cli group by p.cod_cli having count(p.num_ped) >= 1;
 
#10) Exibir o nome do Cliente e o nome do Vendedor que vendeu para esses clientes
select c.nome_cli, v.nome_vend from Cliente c inner join Pedido p on c.cod_cli = p.cod_cli inner join Vendedor v on p.cod_vend = v.cod_vend order by nome_vned asc;

# "___" corresponde a qualquer String com exatamente 3 caracteres
# "___%" corresponde a qualquer String com pelo menos 3 caracteres