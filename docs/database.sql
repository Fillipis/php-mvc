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

CREATE TABLE usuario (
    id int auto_increment not null,
    email varchar(255) not null,
    nome varchar(255) not null,
    senha varchar(255) not null,
    data_criacao date not null,
    hora_criacao varchar(8) not null,
    data_acesso date,
    hora_acesso varchar(8),
    situacao int(1) default 1 comment "[1][ativa]; [0][inativa]",
    primary key pk_usuario (id)
);

INSERT INTO usuario (email, nome, senha, data_criacao, hora_criacao) VALUES ('seu@mail', 'Seu Nome', md5('senha123'), '2022-12-12', '00:00:00');