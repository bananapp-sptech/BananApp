create database BananAPI;
use BananAPI;

-- Tabela para Cadastro de Usuário no Site Institucional
create table cadastro_usuario (
id_usuario int primary key auto_increment,
nome_empresa varchar(50) not null, 
cnpj_empresa char(14) not null unique,
nome_completo varchar(50) not null,
cpf char(11) not null unique,
cargo_usuario varchar(40) not null,
email_usuario varchar(40) not null,
senha_usuario varchar(20) not null,
registro_cadastro_usuario datetime default current_timestamp
);

-- Tabela para Identificação das Câmaras de Resfriamento
create table camaras (
id_camaras int primary key auto_increment,
numero_camara int not null,
setor varchar(50)
);

-- Tabela para Identificação dos Sensores
create table sensor (
id_sensor int primary key auto_increment,
modelo_sensor varchar(50),
numero_camara int 
);

-- Tabela para Registro dos Dados de Temperatura
create table temperatura (
id_temperatura int primary key auto_increment,
numero_camara int, 
temperatura decimal(3,1),
datahora_temperatura datetime
);

-- Tabela para Registro de Distribuição
create table distribuicao (
id_distribuicao int primary key auto_increment,
nome_entreposto varchar(50),
estado char(2),
qtd_lotes int,
preco_lote decimal (5,2),
remetente varchar(50)
);

-- Insert & Select
-- TABELA CADASTRO USUARIOS 

insert into cadastro_usuario value
(default, 'CEAGESP', 35298762159832, 'Ana Beatriz Cavalcanti', '32198405021', 'Operador de Câmara Fria', 'anab.cavalcanti@email.com', 'anab87B6*', default);
insert into cadastro_usuario value
(default, 'CEASA', 56498203769853, 'Marcos Vinícius Oliveira', '65412398075', 'Técnico em Refrigeração', 'mvinicius.oliveira@email.com', 'mvini7#xa', default);
insert into cadastro_usuario value
(default, 'Entreposto MG', 14298763022159, 'Letícia Guimarães Rosa', '98765432109', 'Responsável Técnico', 'leticia.grosa@email.com', 'let@5874', default);
insert into cadastro_usuario value
(default, 'bananasTop', 79850636812020, 'Adriana Lima de Souza', '76545609812', 'Responsável Técnica', 'Adriana.Lima@bananaTop.com', 'Adriana987@1', default);
insert into cadastro_usuario value
(default, 'entrepostoBrasileiro', 35626526265295, 'Maria Cristina Mendes', '98767895609', 'Operadora de camara fria', 'Maria.Cristina@entrepostoBrasil.com', 'Maria387Cristina*?', default);

select * from cadastro_usuario;
select nome_empresa, cnpj_empresa, nome_completo, cpf, email_usuario from cadastro_usuario;
update cadastro_usuario set email_usuario = 'adriana.Lima@bananatoop.com' where id_usuario = 4;
select nome_empresa as 'Nome da empresa', nome_completo as 'Nome do funcionário', 
	cnpj_empresa as 'CNPJ', cpf as 'CPF', cargo_usuario as 'Cargo do funcionário', 
    email_usuario as 'E-mail do funcionário' FROM cadastro_usuario;
select nome_completo, email_usuario from cadastro_usuario;

-- TABELA CADASTRO CAMARAS 
insert into camaras values
(default, 101, 'Docas Climatizadas'),
(default, 102, 'Maturação Controlada'),
(default, 205, 'Setor de Conservação'),
(default, 308, 'Estocagem Pós-Colheita'),
(default, 110, 'Climatização - Setor Norte');

select * from camaras;
select setor from camaras where numero_camara >= 200;
select numero_camara from camaras where setor like '%a';
select numero_camara as 'Número da camara', setor as 'Setor da camara' FROM camaras;

-- TABELA SENSOR
insert into sensor values
(default, 'LM35', 15),
(default, 'DHT11', 05),
(default, 'PT100', 18),
(default, 'DHT22', 29),
(default, 'H3711', 07);

select * from sensor;
select * from sensor where numero_camara > 18;
select modelo_sensor from sensor;
select * from sensor order by numero_camara;
select id_sensor as 'id', modelo_sensor as 'Modelo do sensor', numero_camara as 'Número da câmara' from sensor;


-- TABELA TEMPERATURA 
insert into temperatura (numero_camara, temperatura, datahora_temperatura) values
(1, 14.7, curtime()),
(2, 14.8, curtime()),
(3, 13.2, curtime()),
(4, 13.9, curtime()),
(5, 14.2, curtime());

select * from temperatura;
select temperatura from temperatura where id_temperatura = 3;
select numero_camara, temperatura from temperatura;
select * from temperatura where temperatura > 14;
select id_temperatura as 'id', numero_camara as 'Número da câmara', 
temperatura as 'Temperatura', datahora_temperatura as 'Data do registro' from temperatura;

SELECT id_temperatura AS 'id', numero_camara AS 'Número da câmara', 
temperatura AS 'Temperatura', datahora_temperatura AS 'Data do registro',
CASE  
WHEN temperatura < 13 THEN 'Risco chilling injury.' 
WHEN temperatura >= 24 THEN 'Risco de maturação precoce.'
ELSE 'Temperatura Ideal' 
END AS 'Alerta de temperatura' FROM temperatura;


-- TABELA DISTRIBUIÇÃO
insert into distribuicao values
(default, 'SEAGESP', 'SP', '5', '149.99', 'Sacolão'),
(default, 'Entreposto de Minas Gerais', 'MG', '3', '147.39', 'Atacadão'),
(default, 'Entreposto de Pouso Alegre', 'MG', '1', '184.44', 'Super Mercado BH'),
(default, 'SEASA', 'RJ', '20', '122.90', 'Pão de açucar'),
(default, 'Entreposto Amazonas', 'AM', '7', '133.00', 'Amazonas Super Mercado');

update distribuicao set qtd_lotes = 30 where id_distribuicao = 2;
update distribuicao set qtd_lotes = 25 where id_distribuicao = 4;

alter table distribuicao add constraint chkEstado check(estado in('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 
'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI','PR', 'RJ', 'RN', 'RO', 'RS', 'RR', 'SC','SE', 'SP', 'TO'));

alter table distribuicao add column data_cadastro datetime default current_timestamp;
select * from distribuicao;
select * from distribuicao where remetente like '%Mercado%';
select nome_entreposto as 'Nome do entreposto', estado as 'Estado', qtd_lotes as 'Quantidade de lotes' from distribuicao where preco_lote >= 140;
select id_distribuicao as 'id', nome_entreposto as 'Nome do entreposto', 
	estado as 'Estado', qtd_lotes as 'Quantidade de lotes', preco_lote as 'Preço do lote', 
  remetente as 'Remetente', data_cadastro as 'Data do cadastro' from distribuicao;



