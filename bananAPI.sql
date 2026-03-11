CREATE TABLE sensor (
  IdSensor INT PRIMARY KEY AUTO_INCREMENT,
  Temperatura INT,
  CONSTRAINT chkTemperatura CHECK (Temperatura BETWEEN 12 AND 16),
  DataChecagem DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(255) NOT NULL,
  data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sensor (Temperatura) VALUES (13);
INSERT INTO sensor (Temperatura) VALUES (15);
INSERT INTO sensor (Temperatura) VALUES (12);
INSERT INTO sensor (Temperatura) VALUES (14);
INSERT INTO sensor (Temperatura) VALUES (16);

INSERT INTO usuario (nome, email, senha) VALUES ('João Silva', 'joao@example.com', 'senha123');
INSERT INTO usuario (nome, email, senha) VALUES ('Maria Oliveira', 'maria@example.com', 'password456');
INSERT INTO usuario (nome, email, senha) VALUES ('Pedro Santos', 'pedro@example.com', 'abc123');