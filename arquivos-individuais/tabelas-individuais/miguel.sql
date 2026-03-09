CREATE DATABASE projetoPI;
USE projetoPI;

CREATE TABLE Cadastro ( 
id INT PRIMARY KEY auto_increment,
nome VARCHAR (20),
nameUser VARCHAR (20) UNIQUE,
senha VARCHAR(20),
email VARCHAR(40) UNIQUE, 
dtCadastro DATETIME DEFAULT current_timestamp); 

INSERT INTO Cadastro VALUES 
(DEFAULT, 'Miguel', 'MiguelCarvalho', 'senhaforte', 'miguel@email.com', default),
(DEFAULT, 'Anne', 'AnneAraujo', 'senhadificil', 'anne@email.com', default),
(DEFAULT, 'Daniel', 'DanielCarvalho', 'senhafacil', 'daniel@email.com', default), 
(DEFAULT, 'Érica', 'ÉricaCarvalho', 'senhaforte', 'erica@email.com', default),
(DEFAULT, 'Gabriel', 'gcarvalhoz', 'semsenha1', 'gabriel@email.com', default),
(DEFAULT, 'Isabela', 'IsabelAyumi' , 'fortesenha', 'isabela@email.com', default); 

SELECT * FROM Cadastro; 

SELECT * FROM Cadastro
WHERE nameUser LIKE 'AnneAraujo';

SELECT nome FROM Cadastro
WHERE nome LIKE 'A%'; 

UPDATE Cadastro
SET email = 'anneass@email.com'
WHERE id = 2; 

CREATE TABLE CadastroEmpresa 
(id INT PRIMARY KEY auto_increment,
nomeEmpresa VARCHAR(30),
senha VARCHAR (15),
email VARCHAR(40),
CNPJ CHAR(18) UNIQUE, 
dtCadastro DATETIME DEFAULT current_timestamp); 

ALTER TABLE CadastroEmpresa
MODIFY COLUMN CNPJ VARCHAR (18); 

INSERT INTO CadastroEmpresa VALUES
(default, 'EcoBin', 'senhaEco', 'ecobin@email.com', '12.345.678/0001-90', default),
(default, 'VarejoBananas', 'banana223', 'Varejistasbanana@email.com', '12.355.678/0001-90', default);

SELECT nomeEmpresa FROM CadastroEmpresa;

SELECT * FROM CadastroEmpresa;

CREATE TABLE entreposto (
id INT PRIMARY KEY, 
nome VARCHAR(20),
qtdCamaras INT, 
qtdSensor INT) ; 

INSERT INTO entreposto VALUES
(1, 'Entreposto do Tião', 20, 20),
(2, 'Entreposto BH', 10, 10),
(3, 'Entreposto do Acre', 8, 8),
(4, 'Entreposto RJ', 20, 15),
(5, 'Entreposto da Anne', 50, 50);

SELECT * FROM entreposto
WHERE qtdCamaras > 15;

SELECT * FROM entreposto
WHERE qtdCamaras < 18;

SELECT * FROM entreposto
WHERE qtdSensor > 15;

SELECT * FROM entreposto
WHERE id = 3;

SELECT * FROM entreposto
WHERE id <> 3;

UPDATE entreposto
SET qtdSensor = 20
WHERE id = 4;

DELETE from entreposto
WHERE id = 5 ;

TRUNCATE TABLE entreposto; 









