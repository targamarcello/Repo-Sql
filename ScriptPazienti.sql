create database if not exists marcello_targa_clinica;

create table pazienti(
  id_paziente int primary key auto_increment,
  cognome varchar(50) not null,
  nome varchar(50) not null,
  data_nascita date,
  provincia char(10),
  codice_Asl varchar(10)
);

create table visite(
  id_visita int primary key auto_increment,
  data_visita date,
  peso decimal(5,2),
  pressione_min int,
  pressione_max int,
  glicemia decimal(5,2),
  id_paziente int,
  foreign key(id_paziente) references pazienti (id_paziente)
);
alter table visite add altezza int after peso;

insert into pazienti(cognome,nome,data_nascita,provincia,codice_Asl)
values
('Bianchi', 'Luca', '1985-04-10', 'Milano', 'ASL-MI01'),
('Rossi', 'Marco', '1990-07-23', 'Napoli', NULL),
('Verdi', 'Anna', '1978-12-01', 'Roma', 'ASL-RM05'),
('Neri', 'Giulia', '2000-02-14', 'Milano', 'ASL-MI03'),
('Esposito', 'Francesco', '1983-09-19', 'Napoli', 'ASL-NA07'),
('Conti', 'Marta', '1995-05-30', 'Roma', NULL);

insert into pazienti(cognome,nome,data_nascita,provincia,codice_Asl)
values
('Azzurri','Viola','2004-10-15','Pavia',NULL);

insert into pazienti(cognome,nome,data_nascita,provincia,codice_Asl)
values
('Conti','Carlo','2011-12-25','Como',NULL);

insert into visite(data_visita, peso,altezza,pressione_min,pressione_max,glicemia,id_paziente)
values
('2024-03-15', 70, 175, 80, 120, 95, 1),
('2024-06-10', 75, 175, 85, 125, 100, 1),
('2020-05-22', 92, 180, 95, 145, 112, 2),
('2020-11-03', 88, 178, 90, 135, 108, 5),
('2020-08-12', 89, 178, 85, 140, 115, 5),
('2025-01-09', 59, 160, 100, 150, 99, 3),
('2025-02-02', 65, 165, 85, 118, 100, 4),
('2025-09-05', 62, 165, 70, 110, 98, 4),
('2025-03-15', 58, 170, 95, 145, 85, 6);
update visite set id_paziente = NULL where id_visita = 4;

select nome,cognome, v.data_visita 
from pazienti p
inner join visite v -- non cambia assolutamente nulla dalla join base
on p.id_paziente = v.id_paziente;

-- Test della left join
select nome, cognome, v.data_visita 
from pazienti p
left join visite v
on p.id_paziente = v.id_paziente;

-- Test della right join
select nome, cognome, v.data_visita 
from pazienti p
right join visite v
on p.id_paziente = v.id_paziente;

-- Test di full join, purtroppo non funziona in mariaDB, però esiste nel manuale SQL
select nome, cognome, v.data_visita 
from pazienti p
full join visite v
on p.id_paziente = v.id_paziente;

-- Per riuscire a simulare la full join si deve unire left e right join
select nome, cognome, v.data_visita
from pazienti p
left join visite v
on p.id_paziente = v.id_paziente
UNION
select nome, cognome, v.data_visita 
from pazienti p
right join visite v
on p.id_paziente = v.id_paziente;

select count(v.data_visita )
from pazienti p
left join visite v
on p.id_paziente = v.id_paziente
UNION
select count(v.data_visita )
from pazienti p
right join visite v
on p.id_paziente = v.id_paziente;

-- Numero di visite senza pazienti
select count(v.data_visita) as visite_nulle
from pazienti p
right join visite v
on p.id_paziente = v.id_paziente 
where v.id_paziente is null;

-- Numero di pazienti senza visita
select count(*) as pazienti_senza_visite
from pazienti p
left join visite v
on p.id_paziente = v.id_paziente 
where v.id_visita  is null;



