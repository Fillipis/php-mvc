/*
    Modelo Entidade e Relacionamento para estudo, projeto: [php-mvc] na unha.
*/

CREATE DATABASE php_mvc;

USE php_mvc;

CREATE TABLE empresa (
    id int auto_increment not null,
    cnpj varchar(40) not null,
    nome varchar(255) not null,
    razao varchar(255) not null,
    endereco varchar(255) not null,
    telefone varchar(40) not null,
    email varchar(255) not null,
    situacao int(1) not null default 1 comment "[1][ativa]; [0][inativa]",
    primary key pk_empresa (id)
);

CREATE TABLE cargo (
    id int auto_increment not null,
    nome varchar(255) not null,
    nivel int(1) not null comment "[0][trainer]; [1][junior]; [2][pleno]; [3][senior]",
    descricao_nivel varchar(255) not null,
    situacao int(1) not null default 1 comment "[1][ativa]; [0][inativa]",
    primary key pk_cargo (id)
);

CREATE TABLE funcionario (
    id int auto_increment not null,
    empresa_id int not null,
    cargo_id int not null,
    email varchar(255) not null,
    nome varchar(255) not null,
    sobrenome varchar(255) not null,
    situacao int(1) not null default 1 comment "[1][ativa]; [0][inativa]",
    primary key pk_funcionario (id),
    foreign key fk_empresa (empresa_id) references empresa (id),
    foreign key fk_cargo (cargo_id) references cargo (id)
);