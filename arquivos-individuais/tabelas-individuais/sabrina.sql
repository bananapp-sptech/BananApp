/*
Nome: Sabrina de Sousa Toledo
RA 01261004
*/

CREATE DATABASE bananAPI;
USE bananAPI;

CREATE TABLE cadastroEmpresa (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
CNPJ CHAR(14) NOT NULL,
logadouro VARCHAR(50) NOT NULL,
estado CHAR(2),
CEP CHAR(8) NOT NULL,
email VARCHAR(50) NOT NULL,
senha VARCHAR(12), 
dtCadastro_empresa DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE cadastroEmpresa MODIFY COLUMN logadouro VARCHAR(100);

INSERT INTO cadastroEmpresa VALUES
(DEFAULT, 'Bandeirante Brasil', 35298762159832, 'Avenida dos Trabalhadores, 1500, Bairro Distrito Industrial, Municipio São José dos Pinhais', 'PR', 83055350, 'bandeirante.brasil@outlook.com', 'LKPO522*abc*', DEFAULT),
(DEFAULT, 'Entreposto Brasil', 56498203769853, 'Rua dos Fundidores, 1015, Bairro Parque Industrial, Município Campina', 'SP', 83055350, 'entrepostobrasil@outlook.com', '652Log*dpq*', DEFAULT);

INSERT INTO cadastroEmpresa VALUES
(DEFAULT, 'Distribuidora do Chicao', 14298763022159, 'Rodovia BR-101, Km 244, 3500, Bairro Polo Empresarial Sul, Município Joinville', 'SC', 83055350, 'distruibidora.do.chicao@outlook.com', 'BJ129S*cba*', DEFAULT),
(DEFAULT, 'Entreposto Master', 79850636812020, 'Avenida Industrial, 980, Bairro Distrito Industrial, Município Contagem', 'MG', 83055350, 'entrepostoMaster@outlook.com', 'JPO889A+loc-', DEFAULT),
(DEFAULT, 'Brasil Atacado', 35626526265295, 'Rua das Indústrias, 450, Bairro Distrito Industrial, Município Feira de Santana', 'BA', 83055350, 'brasilAtacado@outlook.com', 'LBQPO52%23c*', DEFAULT);

ALTER TABLE cadastroEmpresa RENAME COLUMN nome TO nomeEmpresa;
SELECT * FROM cadastroEmpresa;
SELECT estado FROM cadastroEmpresa;
SELECT * FROM cadastroEmpresa WHERE email LIKE 'E%';
SELECT * FROM cadastroEmpresa ORDER BY nomeEmpresa;


CREATE TABLE cadastroFuncionario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
CNPJEmpresa CHAR(14) NOT NULL,
matricula VARCHAR(20),
email VARCHAR(60) NOT NULL,
senha VARCHAR(12), 
dtCadastro_funcionario DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO cadastroFuncionario VALUES
(DEFAULT, 'Maria Clara dos Santos', '35298762159832', 639875, 'bandeirante.brasil-Maria.clara@outlook.com', 'ASPO1685*+', DEFAULT),
(DEFAULT, 'Paula Mendes', '56498203769853', 20256, 'paula-mendes.entrepostobrasil@outlook.com', 'MFKS551*?', DEFAULT);

INSERT INTO cadastroFuncionario VALUES
(DEFAULT, 'Chico Silva Costa', '14298763022159', NULL, 'distruibidora.do.chicao@outlook.com', 'JDOEWsaf4*+' , DEFAULT),
(DEFAULT, 'Leandro Velosos Mathias', '79850636812020', 5236463, 'Mathias-Veloso.entrepostoMaster@outlook.com', 'NSJA521*?', DEFAULT),
(DEFAULT, 'Erick de Jesus', '35626526265295', NULL, 'ErickJesus-brasilAtacado@outlook.com', '521idHDK*+', DEFAULT);

SELECT * FROM cadastroFuncionario;

UPDATE cadastroFuncionario SET matricula = 56582 WHERE id = 5;

SELECT id, matricula FROM cadastroFuncionario;

ALTER TABLE cadastroFuncionario RENAME COLUMN nome TO nomeFuncionario;

ALTER TABLE cadastroFuncionario ADD COLUMN cargo VARCHAR(20);

ALTER TABLE cadastroFuncionario ADD CONSTRAINT chkCargo CHECK (cargo IN ('Cargo de Gestão', 'Cargo Operacional'));

SELECT * FROM cadastroFuncionario;

UPDATE cadastroFuncionario SET cargo = 'Cargo de Gestão' WHERE id = 1;
UPDATE cadastroFuncionario SET cargo = 'Cargo Operacional' WHERE id = 2;
UPDATE cadastroFuncionario SET cargo = 'Cargo de Gestão' WHERE id = 3;
UPDATE cadastroFuncionario SET cargo = 'Cargo de Gestão' WHERE id = 4;
UPDATE cadastroFuncionario SET cargo = 'Cargo Operacional' WHERE id = 5;


CREATE TABLE temperatura (
id_temperatura INT PRIMARY KEY AUTO_INCREMENT,
numero_camara INT, 
temperatura DECIMAL(3,1),
dtCadastro_temperatura DATETIME DEFAULT CURRENT_TIMESTAMP
);

insert into temperatura (numero_camara, temperatura) values
(1, 24.0),
(2, 12.6),
(3, 15.6),
(4, 13.9),
(5, 14.2);

SELECT * FROM temperatura;

SELECT * FROM temperatura WHERE temperatura = 24;

SELECT id_temperatura, temperatura FROM temperatura WHERE temperatura <> 14.2;

SELECT numero_camara AS 'Número da Camara', temperatura AS 'Temperatura', dtCadastro_temperatura AS 'Data do Cadastro' FROM temperatura;

-- 
SELECT nomeEmpresa AS Nome, cnpj AS CNPJ, CEP AS CEP FROM cadastroEmpresa;

SELECT nomeFuncionario AS 'Nome do funcionário', CNPJEmpresa AS 'CNPJ', email AS 'E-mail cadastrado' FROM cadastroFuncionario;

SELECT concat('A camara ' , numero_camara, ' está com a temperatura ', temperatura) AS Relatório FROM temperatura;