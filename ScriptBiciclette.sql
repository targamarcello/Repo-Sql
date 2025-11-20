create database marcello_targa_biciclette;

create table marche(
	id_marca int auto_increment primary key,
	nome varchar(30),
	città varchar(30)
	);
create table esemplari(
	id_prodotto int auto_increment primary key,
	id_marca int,
	codice_modello varchar(40),
	nome_modello varchar(40),
	tipo varchar(40),
	colore varchar(30),
	dimensione varchar(30),
	foreign key(id_marca) references marche (id_marca)
);

insert into marche(nome, città)
values
('Bianchi', 'Milano'),
('Campagnolo', 'Vicenza'),
('Colnago', 'Cambiago'),
('Olmo', 'Savona'),
('Gios', 'Torino'),
('Bianchi', 'Roma'),
('Colnago', 'Bergamo'),
('Olmo', 'Genova'),
('Campagnolo', 'Padova'),
('Gios', 'Torino');

insert into esemplari(id_marca,codice_modello,nome_modello,tipo, colore,dimensione )
values
(1, 'b100', 'Sprint', 'corsa', 'blu', 'M'),
(1, 'b101', 'Sprint', 'corsa', 'rosso', 'L'),
(1, 'b102', 'Via Nirone', 'turismo', 'rosso', 'M'),
(1, 'b103', 'Aquila', 'tandem', 'bianco', 'XL'),
(1, 'b104', 'Oltre', 'corsa', 'nero', 'L'),
(2, 'c200', 'Turis', 'turismo', 'verde', 'L'),
(2, 'c201', 'Ventura', 'sport', 'giallo', 'M'),
(2, 'c202', 'ProRide', 'sport', 'rosso', 'L'),
(2, 'c203', 'City Tour', 'turismo', 'argento', 'S'),
(2, 'c204', 'Sprint', 'turismo', 'rosso', 'M'),
(3, 'co300', 'Twin', 'tandem', 'rosso', 'XL'),
(3, 'co301', 'Master', 'corsa', 'nero', 'L'),
(3, 'co302', 'Dream', 'turismo', 'bianco', 'M'),
(3, 'co303', 'Arte', 'sport', 'blu', 'M'),
(3, 'co304', 'Arte', 'sport', 'rosso', 'S'),
(4, 'o400', 'Graziella', 'turismo', 'rosso', 'S'),
(4, 'o401', 'Urban', 'turismo', 'bianco', 'M'),
(4, 'o402', 'Graziella', 'turismo', 'rosso', 'S'),
(4, 'o403', 'Racing One', 'corsa', 'rosso', 'M'),
(4, 'o404', 'Graziella', 'turismo', 'verde', 'S'),
(5, 'g500', 'Speedy', 'sport', 'nero', 'M'),
(5, 'g501', 'Compact Pro', 'corsa', 'azzurro', 'L'),
(5, 'g502', 'Aerolite', 'turismo', 'rosso', 'S'),
(5, 'g503', 'Explorer', 'mountain', 'verde', 'L'),
(5, 'g504', 'Compact Pro', 'corsa', 'rosso', 'M'),
(6, 'b200', 'Sprint', 'corsa', 'blu', 'M'),
(7, 'co400', 'Twin', 'tandem', 'rosso', 'XL'),
(8, 'o405', 'Graziella', 'turismo', 'rosso', 'S'),
(9, 'c205', 'ProRide', 'sport', 'rosso', 'L'),
(10, 'g505', 'Speedy', 'sport', 'nero', 'M');

-- Elencare tutti i tipi di biciclette
select distinct tipo from esemplari;

-- Elencare tutte le biciclette prodotte da 'Campagnolo' di tipo 'turismo'
select *
from esemplari e 
join marche m on e.id_marca = m.id_marca 
where m.nome like 'Campagnolo' and e.tipo like 'turismo';

-- Elencare tutte le biciclette prodotte da 'Bianchi' e 'Colnago' di tipo da corsa e tandem
select *
from esemplari e
join marche m on e.id_marca = m.id_marca
where m.nome in ('Bianchi','Colnago') and
e.tipo in('corsa','tandem');

-- Elencare tutti i produttori che hanno prodotto almeno una bicicletta di tipo 'rampichino' e 'sport'
select distinct *
from marche m 
join esemplari e on m.id_marca  = e.id_marca
where e.tipo in ('rampichino','sport');

-- Elencare tutte le biciclette prodotte dai produttori 'Gios' e 'Olmo'
select *
from esemplari e 
join marche m on e.id_marca = m.id_marca 
where m.nome in ('Gios','Olmo');

-- Elencare tutti i produttori che hanno prodotto biciclette con codice che inizia per 'h' e 'e'
select *
from esemplari e
join marche m on e.id_marca = m.id_marca
where e.codice_modello like 'h%' or e.codice_modello like 'e%';

-- Elencare tutte le biciclette rosse modelo 'Graziella' prodotte da 'Olmo'
select *
from esemplari e
join marche m on e.id_marca = m.id_marca
where m.nome = 'Olmo'
and e.nome_modello = 'Graziella'
and e.colore = 'rosso';

-- Elencare tutte le marche con le rispettive biciclette prodotte
select m.nome as Marca, e.nome_modello as Modello
from marche m
join esemplari e on m.id_marca = e.id_marca 
order by m.nome;

-- Elencare quanti modella ha la marca 'Bianchi'
select count(*) as numero_modelli
from esemplari
where id_marca = 1;

-- Elencare il modello con la dimensione più piccola
select min(dimensione) as dimensione_piccola
from esemplari;

-- Elencare il modello con la dimensione più grande
select max(dimensione) as dimensione_grande
from esemplari;

-- Esempio group by
select id_marca, count(*) as numero_modelli
from esemplari
group by id_marca;
