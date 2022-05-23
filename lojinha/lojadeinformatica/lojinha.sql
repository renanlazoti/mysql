/**
	Lojinha
    @author Renan Lazoti
    @version 1.0
*/

create database lojinhalazoti;
use lojinhalazoti;

-- timestamp default current_timestamp (data e hora automática)
-- date (tipo de dados relacionados a data YYYYMMDD)
create table produtos(
	id int primary key auto_increment,
    barcode varchar(255), -- codigo de barras
    produto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp, -- data de cadastro
    dataval date, -- data de validade
    setor varchar(255) not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
	custo decimal(10,2) not null,
    lucro decimal(10,2),
    venda decimal(10,2)
);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('1234567890','Pasta Térmica','Pasta térmica Silver','Rise',
20240523,'coolers',458,20,'UN','Prateleira 3',8.90,100,17.80);

describe produtos;

select * from produtos;

select produto as Produto, setor as Setor, quantidade as Quantidade, valor as Preço from produtos order by produto;

update produtos set valor='1899.90' where id =4;

update produtos set valor='2099.00' where id=3;

delete from produtos where id=6;

create table usuarios (
	idusu int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique, -- unique não permite valores duplicados (exemplo: não vai conseguir criar um login com o nome de usuario)
    senha varchar(255) not null,
    perfil varchar(255) not null
);

describe usuarios;

-- para inserir uma senha com criptografia, usamos md5()
insert into usuarios(usuario,login,senha,perfil)
values ('Administrador','admin',md5('admin'),'admin');

insert into usuarios(usuario,login,senha,perfil)
values ('Renan','eors',md5('123456'),'user');

select * from usuarios; 

-- Acessando o sistema pela tela de login
-- and (função lógica onde todos as condições devem ser verdadeiras)

select * from usuarios where login='admin' and senha=md5('admin');