USE `projetolm_desktop`;

#Criando Tabelas!!!

CREATE TABLE `pessoa`(
	`id_pessoa` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(55),
    `email` VARCHAR(65) UNIQUE NOT NULL,
    `cpf` VARCHAR(15) UNIQUE NOT NULL,
    `situacao` CHAR(2),	
    `senha` VARCHAR(255) NOT NULL -- Para armazenar hash de senha com segurança
); 

CREATE TABLE `funcionario`(
    `id_funcionario` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `matricula` VARCHAR(10) UNIQUE NOT NULL,
    `id_pessoa` INT NOT NULL,
    FOREIGN KEY(`id_pessoa`) REFERENCES `pessoa`(`id_pessoa`)
);

CREATE TABLE `administrador`(
    `id_administrador` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `matricula` VARCHAR(10) UNIQUE NOT NULL,
    `id_pessoa` INT NOT NULL,
    FOREIGN KEY(`id_pessoa`) REFERENCES `pessoa`(`id_pessoa`)   
);

CREATE TABLE `assinante`(
    `id_assinante` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pessoa` INT NOT NULL,
    FOREIGN KEY(`id_pessoa`) REFERENCES `pessoa`(`id_pessoa`)   
);

CREATE TABLE `livros`(
    `id_livros` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(40) NOT NULL,
    `visualizacao` INT NOT NULL,
    `categoria` VARCHAR(30),
    `autor` VARCHAR(50),
    `nome_arquivo` VARCHAR(100) NOT NULL -- Nome do arquivo armazenado para acesso online
);

CREATE TABLE `livros_favoritos`(
	`id_livros_favoritos` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`id_pessoa` INT NOT NULL,
	`id_livros` INT NOT NULL,
        FOREIGN KEY(`id_pessoa`) REFERENCES `pessoa`(`id_pessoa`),
        FOREIGN KEY(`id_livros`) REFERENCES `livros`(`id_livros`)
	);


