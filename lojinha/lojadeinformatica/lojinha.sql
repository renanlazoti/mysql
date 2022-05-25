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

alter table produtos modify column barcode varchar(255) unique;

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('1234567890','Pasta Térmica','Pasta térmica Silver','Rise',
20210523,'Coolers',458,20,'UN','Prateleira 3',8.90,100,17.80);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('2222222222','AMD Ryzen 5 4600G', 'Cachê 11MB, 3.7GHz (4.2GHz Max Turbo), AM4, Vídeo Integrado','AMD','Hardwares',10,40,'UN','Prateleira 24',946.90,50,1420.35);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('3333333333','Playstation 5','Console Sony','Sony','Consoles',17,35,'UN','Prateleira 52',4499.90,70,7649.83);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('4444444444','Cartucho de Tinta','Hp 29875, 667, 2ml, Tri-Color','HP',20200320,'Impressora',26,8,'UN','Prateleira 48',49.90,100,99.80);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('5555999921','Fita para Rotulador','M231 12mm Preto sobre Branco','Brother',20181224,'Impressora',69,10,'UN','Prateleira 49',59.20,80,106.56);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('5500505051','Samsung Smart TV 43','Processador Crystal 4K, Tela sem limites','Samsung','Tvs',180,26,'UN','Prateleira 105',2299.00,69,3885.31);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('0505050500','Headset Gamer Sem Fio','G533 7.1 Dolby Surround','Logitech','Periféricos',490,36,'UN','Prateleira 150',549.90,100,1099.80);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('0129458055','Memória Corsair Vengeance','LPX, 8GB, 2666MHz, DDR4','Corsair','Hardwares',288,37,'UN','Prateleira 251',214.90,90,408.31);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('2292992929','Smartphone Samsung Galaxy A33','5G, 6GB RAM, 128GB, Octa Core','Samsung','SmartPhones',5,1,'UN','Prateleira 106',2249.10,100,4498.20);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values
('9292929292','Cadeira Gamer','Com Almofadas, Reclinável','Husky','Cadeiras',42,10,'UN','Prateleira 502',1079.90,77,1911.42);

describe produtos;

select * from produtos;

select produto as Produto, setor as Setor, quantidade as Quantidade, valor as Preço from produtos order by produto;

drop table produtos;

delete from produtos where id=3;

-- Inventário do estoque (patrimônio)
-- sum() função de soma no banco de dados
select sum(estoque * custo) as total from produtos;

-- relatório de reposição de estoque 1
select * from produtos where estoque < estoquemin;

-- relatório de reposição de estoque 2
-- date_format() função usada para formatar a data
-- %d/%m/%Y dd/mm/aaaa | %d/%m/%y dd/mm/aa

select id as ID,produto as Produto,
date_format(dataval,'%d/%m/%Y') as Data_Validade,estoque as Estoque,estoquemin as Estoque_Mínimo
from produtos where estoque < estoquemin;

-- relatório de validade produtos 1
select id as ID, produto as Produto, 
date_format(dataval,'%d/%m/%Y') as Data_Validade 
from produtos;

-- relatório de validade de produtos 2
-- datediff() calcula a diferença em dias
-- curldate() obtéma data atual
select id as ID, produto as Produto, 
date_format(dataval,'%d/%m/%Y') as Data_Validade,
datediff(dataval,curdate()) as dias_restantes
from produtos;

-- Acessando o sistema pela tela de login
-- and (função lógica onde todas as condições devem ser verdade
select * from usuarios where login='admin' and senha=md5('admin');

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    cpf varchar(255) unique,
    email varchar(255),
    marketing varchar(255) not null,
    cep varchar(255),
    endereco varchar(255),
    numero varchar(255),
    complemento varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(2)
);

describe clientes;

alter table clientes add column nascimento date not null after nome; 

select * from clientes;

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Renan Lazoti',20040731,11954968772,52255522302,'renanlazoti@gmail.com','Sim',03544010,'rua cachoeiro do itapemirim',24,'Apartamento','Patriarca','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Dimitri Saraiva',20031224,11950280735,2282084298,'dimitri2005@gmail.com','Não',02022020,'rua Tuiuti',322,'Uma avenida','Tatuapé','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Maria Fiori',20030422,1192989892,8935289329,'fiorimaria@gmail.com','Não',020202049,'rua Pedro Carlos',245,'Condominio','Jardim Robru','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Fernando Miranda',20040216,11048935298,12049192444,'mirandinhafer@gmail.com','Sim',02140045,'rua Boca de grave',155,'Apartamento','Jardim Marola','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Guilherme Ramires',20040223,112853918532,2189153898,'guiramires@bol.com','Não',23893518,'rua dos Jogadô',215,'Estadio','Jardim Neymá','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Gustavo Rene',20030702,118291482194,9821348214,'gustarole@gmail.com','Sim',214893894,'rua Pau com Rodas',354,'Pista de Skate','Jardim Tony Hawk', 'São Paulo','SP');

update clientes set fone=194892899 where idcli =3;

delete from clientes where idcli =6;

select nome as Nome, fone as Fone, email as Email from clientes;

select nome as Nome, date_format(nascimento,'%d/%m/%Y') as Aniversário from clientes;

select email from clientes where marketing=('Sim');

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