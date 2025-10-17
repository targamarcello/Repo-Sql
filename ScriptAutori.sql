create table autori(
	codice int primary key,
	cf varchar(16)not null unique,
	cognome varchar(20) not null,
	nome varchar(20) not null,
	citta varchar(20) not null
);
insert into autori (codice, cf, cognome, nome, citta)
values(1,'RSSMRC98T11F839W', 'Rossi','Marco','Napoli'),(2,'VRDLGU02R08H501A', 'Verdi','Luigi','Roma');
