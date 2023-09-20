/*
    Modelo Entidade e Relacionamento para estudo, projeto: [php-mvc] na unha.
*/

CREATE DATABASE php_mvc;

USE php_mvc;

CREATE TABLE perfil_usuario (
    id int(1) not null,
    nome varchar(100) not null,
    sigla varchar(3) not null,
    descricao varchar(255) not null,
    situacao int(1) default 1 comment "[1][ativa]; [0][inativa]",
    data_criacao datetime not null,
    primary key pk_usuario (id)
);

INSERT INTO perfil_usuario (id, nome, sigla, descricao, data_criacao) 
VALUES (1, 'Administrador(a)', 'ADM', 'Administrador(a): Tem acesso completo a todas as áreas da plataforma.', now()),
    (2, 'Gestor(a)', 'GES', 'Gestor(a): Tem acesso completo a todas as áreas da plataforma que o mesmo realiza a gestão.', now()),
    (3, 'Regulador(a)', 'REG', 'Regulador(a): Tem acesso a todas as áreas da plataforma, exceto exclusão de registros.', now()),
    (4, 'Convidado(a)', 'CON', 'Convidado(a): Tem acesso e limitação apenas para visualizações.', now());

CREATE TABLE usuario (
    id int auto_increment not null,
    perfil_usuario_id int not null default 2 comment "[2] usuário:gestor como perfil padrão",
    email varchar(255) not null,
    cpf varchar(15) not null,
    nome varchar(255) not null,
    senha varchar(255) not null,
    situacao int(1) default 1 comment "[1][ativa]; [0][inativa]",
    data_criacao datetime not null,
    ultimo_acesso datetime,
    exclusao int(1) default 0 comment "[1][exclusao-logica]; [0][nao-excluido]",
    data_exclusao datetime,
    primary key pk_usuario (id),
    foreign key fk_perfil_usuario_id (perfil_usuario_id) references perfil_usuario (id)
);

INSERT INTO usuario (email, cpf, nome, senha, data_criacao) VALUES ('123.123.123-40', 'naminhabio@mail', 'Naminhabio', md5('senha123'), now());

CREATE TABLE empresa (
    id int auto_increment not null,
    perfil_usuario_id int not null default 2 comment "[2] empresa:gestora como perfil padrão",
    email varchar(255) not null,
    cnpj varchar(19) not null,
    nome varchar(255) not null,
    razao varchar(255) not null,
    situacao int(1) not null default 1 comment "[1][ativa]; [0][inativa]",
    data_criacao datetime not null,
    exclusao int(1) default 0 comment "[1][exclusao-logica]; [0][nao-excluido]",
    data_exclusao datetime,
    primary key pk_empresa (id)
);

CREATE TABLE endereco (
    id int auto_increment not null,
    cpf_cnpj varchar(19) not null,
    cep varchar(10) not null,
    endereco varchar(255) not null,
    numero varchar(25) not null,
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    uf varchar(2) not null,
    pais varchar(255) not null,
    situacao int(1) default 1 comment "[1][ativa]; [0][inativa]",
    data_criacao datetime not null,
    exclusao int(1) default 0 comment "[1][exclusao-logica]; [0][nao-excluido]",
    data_exclusao datetime,
    primary key pk_endereco (id)
);

CREATE TABLE contato (
    id int auto_increment not null,
    cpf_cnpj varchar(19) not null,
    telefone varchar(20),
    whatsapp varchar(20),
    telegram varchar(20),
    linkedin varchar(255),
    instagram varchar(255),
    twitter varchar(255),
    tiktok varchar(255),
    facebook varchar(255),
    twitch varchar(255),
    onlyfans varchar(255),
    youtube varchar(255),
    vimeo varchar(255),
    github varchar(255),
    link_externo varchar(255),
    situacao int(1) default 1 comment "[1][ativa]; [0][inativa]",
    data_criacao datetime not null,
    exclusao int(1) default 0 comment "[1][exclusao-logica]; [0][nao-excluido]",
    data_exclusao datetime,
    primary key pk_endereco (id)
);
