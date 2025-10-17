create table libri(
	isbn varchar(13) primary key,
	titolo varchar(20) not null,
	autore varchar(20) not null,
	argomento varchar(40) not null,
	editore varchar(20)not null,
	anno date not null,
	edizione int not null
);
insert into libri (isbn, titolo, autore, argomento, editore, anno, edizione)
values ('9788806222154', 'Il nome della rosa', 'Umberto Eco', 'Romanzo storico', 'Bompiani', '1980-09-01', 1),
('9788807900143', 'Se questo è un uomo', 'Primo Levi', 'Memoriale storico', 'Einaudi', '1947-01-01', 1),
('9788807019401', 'L’amica geniale', 'Elena Ferrante', 'Narrativa contemporanea', 'Edizioni E/O', '2011-10-01', 1);