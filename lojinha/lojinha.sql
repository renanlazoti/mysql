/**
	Lojinha 
    @author Renan Lazoti
*/

create database lojinhars;

use lojinhars;

create table produtos (
	id int primary key auto_increment,
	nome varchar(255) not null,
    estoque int not null,
    valor decimal(10,2) not null
    );

show tables;

describe produtos;


    