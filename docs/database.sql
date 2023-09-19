/*
    Modelo Entidade e Relacionamento para estudo, projeto: [php-mvc] na unha.
*/

CREATE DATABASE php_mvc;

USE php_mvc;

CREATE TABLE empresa (
    id int auto_increment not null,
    email varchar(255) not null,
    cnpj varchar(40) not null,
    nome varchar(255) not null,
    razao varchar(255) not null,
    cep varchar(10) not null,
    endereco varchar(255) not null,
    bairro varchar(255) not null,
    numero varchar(25) not null,
    cidade varchar(255) not null,
    uf varchar(2) not null,
    pais varchar(255) not null,
    telefone varchar(20),
    whatsapp varchar(20),
    telegram varchar(20),
    situacao int(1) not null default 1 comment "[1][ativa]; [0][inativa]",
    primary key pk_empresa (id)
);

CREATE TABLE cargo (
    id int auto_increment not null,
    nome varchar(255) not null,
    nivel int(1) not null comment "[1][treinir]; [2][junior]; [3][pleno]; [4][senior]; [5][lider]",
    descricao varchar(255) not null,
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