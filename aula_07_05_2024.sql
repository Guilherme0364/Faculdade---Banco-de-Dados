create database aula_07_05_24;
use aula_07_05_24;


# Criar uma procedure que permitar criar uma string co os números de 1 a 5 separados por virugla
delimiter / 
create procedure ex_while()
begin 
	declare x int;
    declare str varchar(30);
    
	set x = 1;
    set str = "";
    while x <= 5 do
		set str = concat(str,x,','); -- Irá concatenar os elementos da strig (x) separados por virgula
        set x = x+1;
        end while;
	select str;
end;
/
delimiter ; 

call ex_while;


delimiter /
create procedure ex_loop(limite int) -- Tipo de valor (in/out) não declarado é considerado como in
begin 
	declare contador int default 0;
	loop_teste: loop 
		set contador = contador + 1; 
        set soma = soma + contador;
        if contador >= limite then
			leave loop_teste;
		end if;
	end loop;
    select soma;
end;
/ 
delimiter ; 

call ex_loop(10);


delimiter /
create procedure ex_loop2()
begin 
	declare x int;
    declare str varchar(30);
    set x = 1;
    set str = "";
		loopTeste: loop
			if x > 10 then 
				leave loopTeste;
			end if;
            
            set x = x + 1;
            if(x mod 2 != 0) then 
				iterate loopTeste;
			else
				set str = concat(str,x,',');
                end if;
			end loop;
            select str;
		end loop;
	end