-- Script Individual: BananAPI

create database bananapi;
use bananapi;

create table camara_fria (
    id_camara int auto_increment primary key,
    nome varchar(50),
    capacidade_kg decimal(10,2),
    temperatura_ideal decimal(4,2)
);

create table lote_banana (
    id_lote int auto_increment primary key,
    variedade varchar(50),
    quantidade_kg decimal(10,2),
    data_entrada datetime
);

create table registro_temperatura (
    id_registro int auto_increment primary key,
    temperatura decimal(4,2),
    umidade decimal(5,2),
    data_hora datetime
);

insert into camara_fria (nome, capacidade_kg, temperatura_ideal) values
('Camara A', 10000, 13.5),
('Camara B', 8000, 14.0),
('Camara C', 12000, 13.0);

insert into lote_banana (variedade, quantidade_kg, data_entrada) values
('Nanica', 5000, '2026-03-01 08:00:00'),
('Nanica', 3000, '2026-03-02 09:30:00'),
('Prata', 2000, '2026-03-03 10:00:00');

insert into registro_temperatura (temperatura, umidade, data_hora) values
(13.6, 85, '2026-03-01 08:00:00'),
(15.2, 82, '2026-03-01 12:00:00'),
(14.1, 80, '2026-03-02 09:30:00'),
(12.8, 88, '2026-03-03 10:00:00');

select nome as Camara,
       capacidade_kg as Capacidade,
       temperatura_ideal as Temp_Ideal
from camara_fria;

select variedade, quantidade_kg
from lote_banana
where variedade like 'Nani%';

select temperatura, data_hora
from registro_temperatura
where temperatura > 14;

select temperatura as Temperatura,
       data_hora as Momento
from registro_temperatura
order by temperatura desc;

select variedade, quantidade_kg
from lote_banana
where quantidade_kg > 2500;
    