create database BananAPI;
use BananAPI;

create table cadastro_empresa (
    id_empresa int primary key auto_increment,
    nome_empresa varchar(50) not null, 
    cnpj varchar(14) unique,
    endereco varchar(100) not null, 
    email_empresa varchar(40) unique constraint chkEmail check(email_empresa like '%@%'),
    senha_empresa varchar(20) not null,
    registro_cadastro_empresa datetime default current_timestamp
);

create table usuario (
    id_usuario int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) unique constraint chkEmail check(email_empresa like '%@%'),
    senha varchar(255) not null
);

create table camaras (
    id_camaras int primary key auto_increment,
    numero_camara int not null,
    setor varchar(50) not null
);

create table sensor (
    id_sensor int primary key auto_increment,
    modelo varchar(50) not null
);

create table leitura (
    id_leitura int primary key auto_increment,
    temperatura decimal(5,2),
    data_hora datetime default current_timestamp
);

insert into cadastro_empresa (nome_empresa, cnpj, endereco, email_empresa, senha_empresa, registro_cadastro_empresa) 
values 
('ceagesp - pavilhão banana', '62465103000101', 'av. dr. gastão vidigal, 1946', 'contato@ceagesp.gov.br', 'cea#2026', now()),
('frutecon maturação ltda', '12345678000199', 'rua das câmaras frias, 500', 'frutecon@frutecon.com.br', 'frut@matura', now()),
('horti distribuidora rio preto', '98765432000188', 'av. b. do rio branco, 10', 'sac@hortiriopreto.com', 'horti#2026', now()),
('climatizar bananas nanica', '11222333000144', 'distrito industrial, bloco b', 'gestao@climatiza.com', 'banan@123', now()),
('verde-ag logística agrária', '55444333000122', 'parque tecnológico, sala 04', 'admin@verdeagro.com', 'verde#agro', now());

insert into camaras (numero_camara, setor) 
values 
(101, 'climatização - banana nanica'),
(102, 'maturação controlada'),
(205, 'setor de conservação'),
(308, 'estocagem pós-colheita'),
(110, 'climatização - setor norte');