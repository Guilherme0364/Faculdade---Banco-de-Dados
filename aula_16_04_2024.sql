create database aula_16_04;
use aula_16_04;

create table Funcionario(
	idFunc int primary key, 
    nome varchar(40),
    codD int,
    salario numeric(10.2),
    foreign key (codD) references Departamento (codD)
);

create table Departamento(
	codD int primary key, 
    descricao varchar(30), 
    total_sal numeric(10.2)
);

insert into Departamento values(1, "Tecnologia", 0),(2, "Contabilidade", 0);

delimiter $$ 
create trigger Ex1 after insert on Funcionario for each row begin 
		if new.codD is not null then 
			update Departamento set total_sal = total_sal + new.salario where codD = new.codD;
		end if;
	end;    
$$
delimiter ; 

delimiter &&
create trigger Ex2 before insert on Funcionario for each row begin 
		if new.salario is null then 
			set new.salario = 1420;
        end if;
	end;
&& 
delimiter ; 

delimiter %%
create trigger verifica_salario before update on Funcionario for each row begin
		if new.salario > old.salario * 1.05 then 
			set new.salario = old.salario * 1.05;
		end if;
	end
%%
delimiter ; 

insert into Funcionario values (11, "Ronaldo", 2, null);

select * from Funcionario;
select * from Departamento;