create database aula_30_04_2024;
use aula_30_04_2024;

create table Cliente(
	codCliente int primary key,
    nome varchar(30),
    dataNascimento varchar(10),
    cpf varchar(15)
);

create table Pedido(
	codPedido int primary key, 
    codCliente int, 
    dataPedido varchar(10), 
    nf int,
    valorTotal int, 
    
    foreign key (codCliente) references Cliente(codCliente)
);

create table Produto(
	codProduto int primary key,
    descricao varchar(30),
    preco int, 
    quantidade int
);

create table ItemPedido(
	codPedido int, 
    codProduto int, 
    valorUnitario int, 
    quantidade int,
    
    primary key(codPedido, codProduto),
    foreign key (codPedido) references Pedido (codPedido),
    foreign key (codProduto) references Produto (codProduto)
);


-- Inserir clientes
INSERT INTO Cliente (codCliente, nome, dataNascimento, cpf) VALUES
(1, 'João Silva', '1990-05-15', '123.456.789-00'),
(2, 'Maria Santos', '1985-10-20', '987.654.321-00'),
(3, 'Ana Oliveira', '1988-07-12', '333.333.333-33'),
(4, 'Pedro Santos', '1995-03-25', '444.444.444-44'),
(5, 'Juliana Costa', '1980-11-08', '555.555.555-55');

-- Inserir produtos
INSERT INTO Produto (codProduto, descricao, preco, quantidade) VALUES
(101, 'Produto A', 50, 100),
(102, 'Produto B', 100, 80),
(103, 'Produto C', 70, 120),
(104, 'Produto D', 90, 150),
(105, 'Produto E', 120, 70);

-- Inserir pedidos
INSERT INTO Pedido (codPedido, codCliente, dataPedido, nf, valorTotal) VALUES
(1, 1, '2024-04-01', 1001, 500),
(2, 2, '2024-04-02', 1002, 700),
(3, 3, '2024-04-05', 1003, 350),
(4, 4, '2024-04-10', 1004, 600),
(5, 5, '2024-04-15', 1005, 450);

-- Inserir itens de pedido
INSERT INTO ItemPedido (codPedido, codProduto, valorUnitario, quantidade) VALUES
(1, 101, 50, 2),
(1, 102, 100, 3),
(2, 103, 70, 4),
(2, 104, 90, 2),
(3, 101, 35, 2),
(3, 103, 50, 4),
(4, 102, 120, 3),
(4, 104, 80, 2),
(5, 101, 45, 3),
(5, 104, 90, 2);

# Cria uma trigger que caso o cliente não tenha cpf, adicionar um feiot somente de números 9
delimiter | 
create trigger cpf 
	before insert on cliente 
    for each row begin 	
		if (new.cpf is null) then 
			set new.cpf = "999.999.999-99";
		end if;
	end;
|
delimiter ; 
                        
INSERT INTO Cliente (codCliente, nome, dataNascimento) VALUES
(6, 'Guilherme Dias', '1990-05-15');
            
select * from Cliente;
            
            
# Criar uma trigger para caso o cliente exlcuir um pedido, os itens dos pedidos serem excluidos também
delimiter /
create trigger carrinho 
	before delete on pedido 
    for each row begin 
		delete from ItemPedido where codPedido = old.codPedido;
	end
/
delimiter / 



