create database aula05_10;
use aula05_10;

create table Produto(

	id int primary key,
    nome varchar(20),
    fabricante varchar(20),
    quantidade int, 
    valor int,
    tipo varchar(10)

);

select * from Produto;

INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('1', 'Playstation 5 ', 'Sony', '100', '4000', 'Console');
INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('2', 'I7 16 RAM 500GB', 'Dell', '200', '6000', 'Notebook');
INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('3', 'Xbox One X ', 'Microsoft ', '350', '3900', 'Console');
INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('4', 'Iphone 15', 'Apple', '50', '11000', 'Celular');
INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('5', 'Galaxy S22', 'Samsumg', '100', '4000', 'Celular');
INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('6', 'I5 16 RAM 500GB', 'Dell', '48', '3800', 'Notebook');
INSERT INTO `aula05_10`.`Produto` (`id`, `nome`, `fabricante`, `quantidade`, `valor`, `tipo`) VALUES ('7', 'Galaxy S20', 'Samsumg', '120', '3100', 'Celular');

/* Usado para saber a média de uma variável */
select avg(valor) from Produto;
select avg(quantidade) from Produto;

/* Retorna o número de registros */
select count(*) from Produto;

/* Recupera o valor máximo de uma coluna */
select max(quantidade) from Produto;

/* Recupera o valor mínimo de uma coluna */
select min(valor) from Produto;

/* Obtém a soma de valores de uma coluna */
select sum(valor) from Produto;

/* Exibir o número de produtos em estoque agrupados pelo tipo 
   Neste caso, usamos o group by para agrupar dados de forma conjunta com as funções agregadas
   */
select tipo, sum(quantidade) from Produto group by tipo;

/* Exibir a quantidade em estoque de acordo com o tipo de o fabricante */
select tipo, fabricante, sum(quantidade) as Total from Produto group by tipo, fabricante;

select tipo, sum(quantidade) from Produto group by tipo having sum(quantidade)>300;
