create database Empresa;
use Empresa;

create table Cliente(
cod_cli int primary key,
nome_cli varchar(40),
endereco varchar(40),
cidade varchar(40));

create table Vendedor(
cod_vend int primary key,
nome_vend varchar(40),
salario decimal(9,2));

create table produto(
cod_prod int primary key,
desc_prod varchar(30),
unid_prod varchar(3),
val_unit decimal(9,2));

create table pedido(
num_ped int auto_increment primary key,
data_entr date,
cod_cli int,
cod_vend int,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_vend) references Vendedor (cod_vend));

create table ItemPedido(
num_ped int,

cod_prod int,
qtde_ped int,

preco numeric(9,2),
primary key(num_ped, cod_prod),
foreign key(num_ped) references Pedido (num_ped),
foreign key(cod_prod) references Produto (cod_prod));

select * from Cliente;
insert into Cliente values (1, "Alberto", "Rua das Flores, 100", "São Paulo");
insert into Cliente values (2, "Solange", "Av. São Pedro, 420", "São Paulo");
insert into Cliente values (3, "Marcelo", "Rua Jacob Bitar, 1190", "Jacareí");

select * from vendedor;
insert into Vendedor values(200, "Fernando", 1200);
insert into Vendedor values(210, "Gabriel",1400);
insert into Vendedor values(220, "Carlos", 1200);

select * from Produto;
insert into Produto values(11, "Bombom","un", 1.30);
insert into Produto values(12, "Cereja","kg", 45);
insert into Produto values(13, "Bolacha", "pct", 2.90);
insert into Produto values(14, "Pão", "un", 0.50);

select * from pedido;
insert into Pedido values (null, "2024-02-10",2,220);  
insert into Pedido values (null, "2024-03-14",1,210);  
insert into Pedido values (null, "2024-03-18",2,200);
insert into Pedido values (null, "2024-02-15",3, 220);

select * from itemPedido;
insert into itemPedido values (2,11,3, null);
insert into itemPedido values (2,13,1, null);
insert into itemPedido values(3,14,5, null); 
insert into itemPedido values(4,13,2, null); 

/*1.	Criar uma view para exibir a quantidade de pedidos do cliente Alberto.*/
create view PedidosAlberto as select count(num_ped) as "Quantidade de pedidos" from Pedido p inner join Cliente c on p.cod_cli = c.cod_cli where c.nome_cli = "Alberto";
select *  from PedidosAlberto;

/* 2.	Criar uma view para exibir o numero do pedido, a descrição dos produtos e o nome do vendedor de todos os pedidos.*/
create view Pedidos as select i.num_ped, pd.desc_prod, v.nome_vend from Pedido p inner join itemPedido i on p.num_ped = i.num_ped inner join Produto pd on i.cod_prod = pd.cod_prod 
inner join Vendedor v on p.cod_vend = v.cod_vend;
select * from Pedidos;

/* 3.	Criar uma view para exibir o nome dos vendedores que possuem pedidos a serem entregues */
create view VendedorPedido as select v.nome_vend, data_entr from Vendedor v inner join Pedido p on v.cod_vend = p.cod_vend where p.data_entr > current_date();
select * from VendedorPedido;

/* 4.	Criar uma view para encontrar a quantidade de pedidos agrupados por cidade de origem.*/
create view PedidosCidades as select  count(p.num_ped) as "Quantidade de pedidos por cidade", c.cidade from Pedido p inner join Cliente c on p.cod_cli = c.cod_cli group by c.cidade;
select * from PedidosCidades;

/* 5.	Criar uma view para encontrar o nome dos clientes que possuem pelo menos 7 pedidos */
create view SetePedidos as select c.nome_cli from Cliente c inner join Pedido p on c.cod_cli = p.cod_cli inner join ItemPedido i on i.num_ped = p.num_ped where i.qtde_ped >= 7;
select * from SetePedidos;
drop view SetePedidos;

/* 6.	Criar uma view Encontrar o nome dos clientes que possuem pedidos com mais de 3 itens vendidos. Obs. Eliminar os clientes duplicados. */
create view TresItens as select c.nome_cli from Cliente c inner join Pedido p on c.cod_cli = p.cod_cli inner join ItemPedido i on i.num_ped = p.num_ped group by c.nome_cli, p.num_ped having count(i.cod_prod);
select * from TresItens;