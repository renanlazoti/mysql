/**
	Lojinha
    @author Renan Lazoti
    @version 1.0
*/

create database lojinhalazoti;
use lojinhalazoti;
create table produtos(
	id int primary key auto_increment,
    produto varchar(255) not null,
    setor varchar(255) not null,
    quantidade int not null,
    valor decimal(10,2)
);
describe produtos;

insert into produtos (produto, setor, quantidade, valor)
values ('Fone Razer Kraken X','Periféricos',160,'199,90'); 

insert into produtos (produto, setor, quantidade, valor)
values ('Processador Intel Core i5','Hardware',85,'889,90');

insert into produtos (produto, setor, quantidade, valor)
values ('Samsung Galaxy S20 FE','SmartPhones',23,'2.099,00');

insert into produtos (produto, setor, quantidade, valor)
values ('Cadeira Gamer Corsair T1','Cadeiras',2,'1.899,90');

insert into produtos (produto, setor, quantidade, valor)
values ('Smart TV LG 43 4K UHD','TV',170,'2041.55');

insert into produtos (produto, setor, quantidade, valor)
values ('Xbox Series S','Consoles','106','2149.00');

select * from produtos;

select produto as Produto, setor as Setor, quantidade as Quantidade, valor as Preço from produtos order by produto;

update produtos set valor='1899.90' where id =4;

update produtos set valor='2099.00' where id=3;

delete from produtos where id=6;