-- Universidade do Minho
-- Engenharia Informática
-- Bases de Dados, 2023-2024
-- Linguagem SQL
-- Descrição de dados

-- Implementação do Sistemas de Bases de Dados para o caso de estudo "Agência de Detetives"
-- MAY 2024
-- grupo alguma coisa

DROP DATABASE IF EXISTS Agencia;
CREATE DATABASE Agencia;

-- Indicar a base de dados a utilizar
USE Agencia;


-- Criação da tabela Cliente
CREATE TABLE IF NOT EXISTS Cliente 
(
	ID INT NOT NULL AUTO_INCREMENT,
	Nome VARCHAR(45) NOT NULL,
	Distrito VARCHAR(30) NOT NULL,
	Localidade VARCHAR(45) NOT NULL,
	Rua VARCHAR(75) NOT NULL,
	CodPost INT(7) NOT NULL,
	EMAIL VARCHAR(45) NOT NULL,
		PRIMARY KEY (`ID`)
);

-- Criação da tabela Telemoveis
CREATE TABLE IF NOT EXISTS Telemoveis
(
	Telemovel INT NOT NULL,
    ID_Cliente INT NOT NULL,
		PRIMARY KEY (Telemovel),
        FOREIGN KEY (ID_Cliente)
			REFERENCES Cliente(ID)
);

-- Criação da tabela Caso
CREATE TABLE IF NOT EXISTS Caso
(
	ID INT NOT NULL AUTO_INCREMENT,
    Estado ENUM('Por Iniciar', 'Ativo', 'Em Espera', 'Concluido', 'Abandonado') NOT NULL,
    DtTimeRegisto DATETIME NOT NULL,
    DtTimeFecho DATETIME,
    ID_Cliente INT NOT NULL,
		PRIMARY KEY (ID),
        FOREIGN KEY (ID_Cliente)
			REFERENCES Cliente(ID)
);

-- Criação da tabela Detetive
CREATE TABLE IF NOT EXISTS Detetive
(
	ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
	Telemovel_Profissional CHAR(9) NOT NULL,
	Distrito VARCHAR(30) NOT NULL,
	Localidade VARCHAR(45) NOT NULL,
	Rua VARCHAR(75) NOT NULL,
	CodPost INT(7) NOT NULL,
		PRIMARY KEY (ID)
);

-- Criação da tabela Suspeito
CREATE TABLE IF NOT EXISTS Suspeito
(
	ID INT NOT NULL AUTO_INCREMENT,
	Relacionamento_com_vítima VARCHAR(30) NOT NULL,
	Culpado TINYINT(1) NOT NULL,
	Nome VARCHAR(75) NOT NULL,
	Cadastro TEXT NULL,
	Distrito VARCHAR(30) NOT NULL,
	Localidade VARCHAR(45) NOT NULL,
	Rua VARCHAR(75) NOT NULL,
	CodPost INT(7) NOT NULL,
	Caso_ID INT NOT NULL,
		PRIMARY KEY (ID),
        FOREIGN KEY (Caso_ID)
			REFERENCES Caso(ID)
);

-- Criação da tabela Vitima
CREATE TABLE IF NOT EXISTS Vitima
(
	ID INT NOT NULL AUTO_INCREMENT,
	Local_encontrada VARCHAR(75) NOT NULL,
	Nome VARCHAR(75) NOT NULL,
	Filiacao VARCHAR(150) NULL,
	Idade INT NULL,
	Sexo CHAR(1) NOT NULL,
	Etnia VARCHAR(30) NOT NULL,
	Ocupacao VARCHAR(45) NULL,
	Peso INT NOT NULL,
	Altura INT NOT NULL,
	Caso_ID INT NOT NULL,
		PRIMARY KEY (ID),
        FOREIGN KEY (Caso_ID)
			REFERENCES Caso(ID)
);

-- Criação da table Evidencia
CREATE TABLE IF NOT EXISTS Evidencia
(
	ID INT NOT NULL AUTO_INCREMENT,
	Locale VARCHAR(75) NULL,
	Descrição TEXT NOT NULL,
	Tipo ENUM('arma', 'acontecimento', 'fisico', 'texto') NOT NULL,
	Caso_ID INT NOT NULL,
		PRIMARY KEY (ID),
        FOREIGN KEY (Caso_ID)
			REFERENCES Caso(ID)
);

-- Criação da table DetetiveEstudaCaso
CREATE TABLE IF NOT EXISTS DetetiveEstudaCaso
(
	Detetive_ID INT NOT NULL,
	Caso_ID INT NOT NULL,
		PRIMARY KEY (Detetive_ID, Caso_ID),
		FOREIGN KEY (Detetive_ID)
			REFERENCES Detetive(ID),
		FOREIGN KEY (Caso_ID)
			REFERENCES Caso(ID)
);

-- Criação da table DetetiveInterrogaSuspeito
CREATE TABLE IF NOT EXISTS DetetiveInterrogaSuspeito
(
	Depoimento TEXT NOT NULL,
	DtTime_inicio DATETIME NOT NULL,
	Detetive_ID INT NOT NULL,
	Suspeito_ID INT NOT NULL,
		PRIMARY KEY (Detetive_ID, Suspeito_ID),
		FOREIGN KEY (Detetive_ID)
			REFERENCES Detetive(ID),
		FOREIGN KEY (Suspeito_ID)
			REFERENCES Suspeito(ID)
);