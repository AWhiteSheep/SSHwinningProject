alter table Etudiant
add [m_Password] varchar(50) not null

insert into Etudiant
values(1473192, 'coffeeismain')

insert into Etudiant_Atelier
values
	(1473192, 4),
	(1473192, 5),
	(1473192, 6),
	(1473192, 7)

select * from DonneesAteliers

select * from GetAllAteliersByStudent(1473192)