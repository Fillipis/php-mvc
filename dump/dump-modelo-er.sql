-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: php_mvc
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;

CREATE TABLE `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` varchar(19) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `telegram` varchar(20) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitch` varchar(255) DEFAULT NULL,
  `onlyfans` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `vimeo` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `link_externo` varchar(255) DEFAULT NULL,
  `situacao` int(1) DEFAULT 1 COMMENT '[1][ativa]; [0][inativa]',
  `data_criacao` datetime NOT NULL,
  `exclusao` int(1) DEFAULT 0 COMMENT '[1][exclusao-logica]; [0][nao-excluido]',
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_usuario_id` int(11) NOT NULL DEFAULT 2 COMMENT '[2] empresa:gestora como perfil padrão',
  `email` varchar(255) NOT NULL,
  `cnpj` varchar(19) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `razao` varchar(255) NOT NULL,
  `situacao` int(1) NOT NULL DEFAULT 1 COMMENT '[1][ativa]; [0][inativa]',
  `data_criacao` datetime NOT NULL,
  `exclusao` int(1) DEFAULT 0 COMMENT '[1][exclusao-logica]; [0][nao-excluido]',
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` varchar(19) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `numero` varchar(25) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `situacao` int(1) DEFAULT 1 COMMENT '[1][ativa]; [0][inativa]',
  `data_criacao` datetime NOT NULL,
  `exclusao` int(1) DEFAULT 0 COMMENT '[1][exclusao-logica]; [0][nao-excluido]',
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `perfil_usuario`
--

DROP TABLE IF EXISTS `perfil_usuario`;

CREATE TABLE `perfil_usuario` (
  `id` int(1) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` varchar(3) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `situacao` int(1) DEFAULT 1 COMMENT '[1][ativa]; [0][inativa]',
  `data_criacao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perfil_usuario`
--

LOCK TABLES `perfil_usuario` WRITE;
INSERT INTO `perfil_usuario` VALUES (1,'Administrador(a)','ADM','Administrador(a): Tem acesso completo a todas as áreas da plataforma.',1,'2023-09-19 20:57:15'),(2,'Gestor(a)','GES','Gestor(a): Tem acesso completo a todas as áreas da plataforma que o mesmo realiza a gestão.',1,'2023-09-19 20:57:15'),(3,'Regulador(a)','REG','Regulador(a): Tem acesso a todas as áreas da plataforma, exceto exclusão de registros.',1,'2023-09-19 20:57:15'),(4,'Convidado(a)','CON','Convidado(a): Tem acesso e limitação apenas para visualizações.',1,'2023-09-19 20:57:15');
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_usuario_id` int(11) NOT NULL DEFAULT 2 COMMENT '[2] usuário:gestor como perfil padrão',
  `email` varchar(255) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `situacao` int(1) DEFAULT 1 COMMENT '[1][ativa]; [0][inativa]',
  `data_criacao` datetime NOT NULL,
  `ultimo_acesso` datetime DEFAULT NULL,
  `exclusao` int(1) DEFAULT 0 COMMENT '[1][exclusao-logica]; [0][nao-excluido]',
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perfil_usuario_id` (`perfil_usuario_id`),
  CONSTRAINT `fk_perfil_usuario_id` FOREIGN KEY (`perfil_usuario_id`) REFERENCES `perfil_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
INSERT INTO `usuario` VALUES (1,2,'suemail@mail','123.123.123-40','Seu Nome/Marca','6543210',1,'2023-09-19 20:59:11',NULL,0,NULL);
UNLOCK TABLES;

--
-- Dumping routines for database 'php_mvc'
--

-- Dump completed on 2023-09-19 21:01:19
