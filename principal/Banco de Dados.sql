create database BananApp;
use BananApp;

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
insert cadastro_usuario value
(default, 'CEAGESP', 'Ana Beatriz Cavalcanti', '32198405021', 'Operador de Câmara Fria', 'anab.cavalcanti@email.com', 'anab87B6');
insert cadastro_usuario value
(default, 'CEASA', 'Marcos Vinícius Oliveira', '65412398075', 'Técnico em Refrigeração', 'mvinicius.oliveira@email.com', 'mvini7#xa');
insert cadastro_usuario value
(default, 'Entreposto MG', 'Letícia Guimarães Rosa', '98765432109', 'Responsável Técnico', 'leticia.grosa@email.com', 'let@5874');
insert cadastro_usuario value
(default, 'bananasTop', 'Adriana Lima de Souza', '76545609812', 'Responsável Técnica', 'Adriana.Lima@bananaTop.com', 'Adriana987@1', default);
insert cadastro_usuario value
(default, entrepostoBrasileiro, 'Maria Cristina Mendes', '98767895609', 'Operadora de camara fria', 'Maria.Cristina@entrepostoBrasil.com', 'Maria387Cristina*?', default);

select * from cadastro_usuário;
select nome_empresa, cnpj_empresa, nome_completo, cpf, email_usuario FROM cadastro usuário;
update cadastro_usuario set email = 'adriana.Lima@bananatoop.com' where id = 5;
select nome_empresa as 'Nome da empresa', nome_completo as 'Nome do funcionário',
 cnpj_empresa as 'CNPJ', cpf as CPF, cargo_usuário as 'Cargo do funcionário', 
 email_usuario as 'E-mail do funcionário' FROM cadastro usuário;
select * from camaras;
select nome_completo, email_usuario from cadastro_usuario;
select registro_cadastro_funcionario from cadastro_usuario;

-- TABELA CADASTRO CAMARAS 
insert into camaras values
(default, 101, 'Docas Climatizadas'),
(default, 102, 'Maturação Controlada'),
(default, 205, 'Setor de Conservação'),
(default, 308, 'Estocagem Pós-Colheita'),
(default, 110, 'Climatização - Setor Norte');

select setor where numero_camara >= 200;
select numero_camara where setor like '%a';
select * from camaras;
select numero_camara as 'Número da camara', setor as 'Setor da camara' FROM camaras;
ALTER TABLE distribuicao ADD COLUMN data_cadastro DATETIME DEFAULT current_timestamp;

-- TABELA SENSOR
insert into sensor values
(default, 'LM35', 15),
(default, 'DHT11', 05),
(default, 'PT100', 18),
(default, 'DHT22', 29),
(default, 'H3711', 07);

select * from sensor where numero_camara > 18;
select modelo_sensor from sensor;
select * from sensor;
select * from sensor order by numero_camara;
select id_sensor as 'id', modelo_sensor as 'Modelo do sensor', numero_camara as 'Número da câmara' from sensor;
alter table distribuição add column data_cadastro DATETIME DEFAULT current_timestamp;

-- TABELA TEMPERATURA 
insert into temperatura (numero_camara, temperatura, datahora_temperatura) values
(1, 14.7, curtime()),
(2, 14.8, curtime()),
(3, 13.2, curtime()),
(4, 13.9, curtime()),
(5, 14.2, curtime());

select temperatura from temperatura where id_temperatura = 3;
select numero_camara, temperatura from temperatura;
select * from temperatura where temperatura > 14;
select * from temperatura;
select id_temperatura as 'id', numero_camara as 'Número da câmara', temperatura as 'Temperatura', datahora_temperatura as 'Data do registro' from temperatura;

-- TABELA DISTRIBUIÇÃO
insert into distribuicao values
(default, 'SEAGESP', 'SP', '5', '149.99', 'Sacolão'),
(default, 'Entreposto de Minas Gerais', 'MG', '3', '147.39', 'Atacadão'),
(default, 'Entreposto de Pouso Alegre', 'MG', '1', '184.44', 'Super Mercado BH'),
(default, 'SEASA', 'RJ', '20', '122.90', 'Pão de açucar'),
(default, 'Entreposto Amazonas', 'AM', '7', '133.00', 'Amazonas Super Mercado');

update distribuicao set dt_compra = '2019-12-25' where id_distribuicao = 1;
update distribuicao set dt_compra = '2026-10-04' where id_distribuicao = 2;
update distribuicao set dt_compra = '2025-07-01' where id_distribuicao = 3;
update distribuicao set dt_compra = '2024-01-22' where id_distribuicao = 4;
update distribuicao set dt_compra = '2026-02-28' where id_distribuicao = 5;


alter table distribuicao add constraint chkEstado check(estado in('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 
'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI','PR', 'RJ', 'RN', 'RO', 'RS', 'RR', 'SC','SE', 'SP', 'TO'));

select * from distribuicao;
alter table distribuição add column data_cadastro DATETIME DEFAULT current_timestamp;
select * from distribuicao where recebedor like '%Mercado%';
select nome_entreposto, estado, qtd_lotes from distribuicao where preco_lote >= 140;
select id_distribuicao as 'id', nome_entreposto as 'Nome do entreposto', estado as 'Estado', qtd_lotes as 'Quantidade de lotes', 
preco_lote as 'Preço do lote', recebedor as 'Recebedor', data_cadastro as 'Data do cadastro' FROM distruibuicao;





