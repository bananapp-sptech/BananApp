-- PROJETO INDIVIDUAL BD 

CREATE DATABASE projetoPI;
USE projetoPI;
CREATE TABLE cadastrouser(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(60),
senha VARCHAR(30),
email VARCHAR(60),
dtCadastro DATETIME DEFAULT current_timestamp
);

INSERT INTO cadastrouser VALUES
(DEFAULT, 'Vinícius Guimarães', 'Senhateste123', 'vinicius.menezes@sptech.school', DEFAULT),
(DEFAULT, 'Betriz Reis', 'Senhatestepi', 'beatriz.reis@sptech.school', DEFAULT),
(DEFAULT, 'Oscar Gomes', 'ProjetodePI', 'oscar.gomes@sptech.school', DEFAULT),
(DEFAULT, 'Miguel Rodrigues', 'Miguel.sptech', 'miguel.rodrigues@sptech.school', DEFAULT),
(DEFAULT, 'Cláudio Frizzarini', 'ProfessordePI@@', 'claudio.frizzarini@sptech.school', DEFAULT),
(DEFAULT, 'Vivian Rodrigues ', 'ProfessordeBD', 'vivian.rodrigues@sptech.school', DEFAULT),
(DEFAULT, 'Luan Magno', 'monitordePI@@', 'claudio.frizzarini@sptech.school', DEFAULT);

SELECT * FROM cadastrouser;

SELECT senha AS 'dado sensivel', id_usuario FROM cadastrouser;

SELECT * FROM cadastrouser WHERE email LIKE '%@sptech.school%';

SELECT nome_usuario, email FROM cadastrouser WHERE senha LIKE '%teste%';


-- TABELA PARA CONTROLE DE TEMPERATURA

USE projetoPI;
CREATE TABLE controleTemperatura(
id_temperatura INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL(4,2),
horario DATETIME DEFAULT current_timestamp
);

INSERT INTO controleTemperatura (temperatura) VALUES (14.50);
INSERT INTO controleTemperatura (temperatura) VALUES (9.15);
INSERT INTO controleTemperatura (temperatura) VALUES (13.00);
INSERT INTO controleTemperatura (temperatura) VALUES (7.85);
INSERT INTO controleTemperatura (temperatura) VALUES (15.20);

INSERT INTO controleTemperatura (temperatura, horario) VALUES 
(12.50, '2024-09-06 08:00:00'),
(15.00, '2025-12-25 10:30:00'),
(18.80, '2019-03-15 13:00:00'),
(27.45, '2025-07-19 15:30:00'),
(24.10, '2026-03-06 18:00:00'),
(20.30, '2025-09-19 21:00:00');

SELECT * FROM controleTemperatura;

SELECT * FROM controleTemperatura ORDER BY temperatura ASC;

SELECT * FROM controleTemperatura ORDER BY horario DESC;

SELECT temperatura,
CASE  
	WHEN temperatura < 13 THEN 'TEMPERATURA ABAIXO DO IDEAL'
    WHEN temperatura >= 13 AND temperatura <= 15 THEN 'TEMPERATURA IDEAL'
    ELSE 'TEMPERATURA ACIMA DO IDEAL'
    END AS situacao
FROM controleTemperatura;

SELECT * FROM controleTemperatura WHERE temperatura >= 13 AND temperatura <= 15;


    









-- TABELA DE DISTRIBUIÇÃO (QUEM COMPROU AS BANANAS)
create table distribuicao (
id_distribuicao INT PRIMARY KEY AUTO_INCREMENT,
nome_entreposto VARCHAR(50),
estado CHAR(2),
qtd_lotes INT,
preco_lote DECIMAL(6,2),
recebedor VARCHAR(50)
);


INSERT INTO distribuicao VALUES
(DEFAULT, 'SEAGESP', 'SP', '5', '149.99', 'Sacolão'),
(DEFAULT, 'Entreposto de Minas Gerais', 'MG', '3', '147.39', 'Atacadão'),
(DEFAULT, 'Entreposto de Pouso Alegre', 'MG', '1', '184.44', 'Super Mercado BH'),
(DEFAULT, 'SEASA', 'RJ', '20', '122.90', 'Pão de açucar'),
(DEFAULT, 'Entreposto Amazonas', 'AM', '7', '133.00', 'Amazonas Super Mercado');

SELECT * FROM distribuicao WHERE recebedor like '%Mercado%';

SELECT nome_entreposto, estado, qtd_lotes FROM distribuicao WHERE preco_lote >= 140;

SELECT recebedor AS comprador, estado, preco_lote FROM distribuicao;

ALTER TABLE distribuicao ADD COLUMN dt_compra DATE;

UPDATE distribuicao SET dt_compra = '2019-12-25' WHERE id_distribuicao = 1;
UPDATE distribuicao SET dt_compra = '2026-10-04' WHERE id_distribuicao = 2;
UPDATE distribuicao SET dt_compra = '2025-07-01' WHERE id_distribuicao = 3;
UPDATE distribuicao SET dt_compra = '2024-01-22' WHERE id_distribuicao = 4;
UPDATE distribuicao SET dt_compra = '2026-02-28' WHERE id_distribuicao = 5;


ALTER TABLE distribuicao ADD CONSTRAINT chkestado
	CHECK(estado IN('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI','PR', 'RJ', 'RN', 'RO', 'RS', 'RR', 'SC','SE', 'SP', 'TO'));
    
SELECT * FROM distribuicao;










