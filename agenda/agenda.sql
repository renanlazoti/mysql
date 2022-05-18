/**
	Agenda de contatos 
    @author Renan Lazoti
*/

-- Verificar banco de dados
show databases;

-- Criar um novo banco de dados
create database teste;
create database agendarenan;

-- Deletar um banco de dados
drop database teste;

-- Selecionar um banco de dados
use agendarenan;

-- Criando uma tabela
-- int -> tipo de dados - números inteiros
-- decimal(10,2) -> tipo de dados - números não inteiros
-- (10,2) 10 digitos com 2 casas decimais
-- primary key (transforma o campo em chave primária)
-- auto_increment (geração de uma numeração automática)
-- varchar(255) -> tipo de dados - string, caixa de texto (com variação)
-- char(255) -> tipo de dados String (sem variação), oculpa menos espaço que o varchar
-- (255) -> máximo de caracteres
-- not null (obrigatório o preenchimento)
 
create table contatos (
	id int primary key auto_increment,
    nome varchar(255) not null, 
    fone varchar(255) not null,
    email varchar(255)
    );
    
-- verificar tabelas do banco
show tables;

-- descrever a tabela
describe contatos;

-- adicionando uma coluna(campo) a tabela
alter table contatos add column obs varchar(255);
alter table contatos add column fone2 varchar(255);

-- adicionando uma coluna(campo) a tabela após um campo
alter table contatos add column cel varchar(255) after fone;

-- modificando uma propriedade da coluna(campo) da tabela
alter table contatos modify column cel varchar(255) not null;

-- excluir uma coluna(campo) da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos; 