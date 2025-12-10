CREATE database CoachMaster;

use CoachMaster;

CREATE TABLE IF NOT EXISTS `Usuário` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nome` varchar(255) NOT NULL,
	`Email` varchar(255) NOT NULL,
	`Senha_hash` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Time` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_usuário` int NOT NULL,
	`Id_tecnico` int NOT NULL,
	`Nome` varchar(255) NOT NULL,
	`Data_de_ingresso` date NOT NULL,
	`Data_de_Saída` date NOT NULL,
	`Tempo_total_no_clube_em_Meses` int NOT NULL,
	`Jogos_pelo_clube` int NOT NULL,
	`Vitórias` int NOT NULL,
	`Empates` int NOT NULL,
	`Derrotas` int NOT NULL,
	`Aproveitamento` decimal(10,0) NOT NULL,
	`Gols_Marcados` int NOT NULL,
	`Gols_Sofridos` int NOT NULL,
	`Gols_Marcados/P/Jogo` decimal(10,0) NOT NULL,
	`Gols_Sofridos/P/Jogo` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Técnico` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_usuario` int NOT NULL,
	`Nome` varchar(255) NOT NULL,
	`Jogos` int NOT NULL,
	`Vitórias` int NOT NULL,
	`Empates` int NOT NULL,
	`Derrotas` int NOT NULL,
	`Aproveitamento` decimal(10,0) NOT NULL,
	`Gols_Marcados` int NOT NULL,
	`Gols_Sofridos` int NOT NULL,
	`Gols_Marcados/PJogo` int NOT NULL,
	`Gols_Sofridos/PJogo` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Temporada` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_técnico` int NOT NULL,
	`Id_Time` int NOT NULL,
	`Temporada` varchar(30) NOT NULL,
	`Jogos` int NOT NULL,
	`Vitórias` int NOT NULL,
	`Empates` int NOT NULL,
	`Derrotas` int NOT NULL,
	`Aproveitamento` decimal(10,0) NOT NULL,
	`Gols_Marcados` int NOT NULL,
	`Gols_Sofridos` int NOT NULL,
	`Gols_Marcados/PJogo` decimal(10,0) NOT NULL,
	`Gols_Sofidos/PJogo` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Jogador` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Técnico` int NOT NULL,
	`Jogos` int NOT NULL,
	`Gols` int NOT NULL,
	`Assistências` int NOT NULL,
	`Participações_em_gols` int NOT NULL,
	`PG/J` decimal(10,0) NOT NULL,
	`Nota_media_total` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Temporada_jogador` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_temporada` int NOT NULL,
	`Id_jogador` int NOT NULL,
	`Jogos` int NOT NULL,
	`Gols` int NOT NULL,
	`Assistências` int NOT NULL,
	`Particrpações_em_gol` int NOT NULL,
	`PG/J` decimal(10,0) NOT NULL,
	`Nota` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Jornalista` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_Usuário` int NOT NULL,
	`Nome` varchar(255) NOT NULL,
	`data_nascimento` date NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Notícia` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Temporada` int NOT NULL,
	`Id_jornalista` int NOT NULL,
	`Título` varchar(50) NOT NULL,
	`SubTítulo` varchar(100) NOT NULL,
	`Corpo_matéria` varchar(5000) NOT NULL,
	`Caminho_imagem1` varchar(50) NOT NULL,
	`Caminho_imagem2` varchar(50) NOT NULL,
	`Caminho_imagem3` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);


ALTER TABLE `Time` ADD CONSTRAINT `Time_fk1` FOREIGN KEY (`Id_usuário`) REFERENCES `Usuário`(`id`);

ALTER TABLE `Time` ADD CONSTRAINT `Time_fk2` FOREIGN KEY (`Id_tecnico`) REFERENCES `Técnico`(`id`);
ALTER TABLE `Técnico` ADD CONSTRAINT `Técnico_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuário`(`id`);
ALTER TABLE `Temporada` ADD CONSTRAINT `Temporada_fk1` FOREIGN KEY (`Id_técnico`) REFERENCES `Técnico`(`id`);

ALTER TABLE `Temporada` ADD CONSTRAINT `Temporada_fk2` FOREIGN KEY (`Id_Time`) REFERENCES `Time`(`id`);
ALTER TABLE `Jogador` ADD CONSTRAINT `Jogador_fk1` FOREIGN KEY (`Id_Técnico`) REFERENCES `Técnico`(`id`);
ALTER TABLE `Temporada_jogador` ADD CONSTRAINT `Temporada_jogador_fk1` FOREIGN KEY (`Id_temporada`) REFERENCES `Temporada`(`id`);

ALTER TABLE `Temporada_jogador` ADD CONSTRAINT `Temporada_jogador_fk2` FOREIGN KEY (`Id_jogador`) REFERENCES `Jogador`(`id`);
ALTER TABLE `Jornalista` ADD CONSTRAINT `Jornalista_fk1` FOREIGN KEY (`id_Usuário`) REFERENCES `Usuário`(`id`);
ALTER TABLE `Notícia` ADD CONSTRAINT `Notícia_fk1` FOREIGN KEY (`Id_Temporada`) REFERENCES `Temporada`(`id`);

ALTER TABLE `Notícia` ADD CONSTRAINT `Notícia_fk2` FOREIGN KEY (`Id_jornalista`) REFERENCES `Jornalista`(`id`);