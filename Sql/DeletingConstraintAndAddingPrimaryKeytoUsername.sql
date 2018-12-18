
insert into DonneesAteliers(dateDebut)
values('2018-12-25')

delete from DonneesAteliers
where NumAtelier > 9

select * from Etudiant
select * from Etudiant_Atelier
select *from DonneesAteliers



EXEC sp_pkeys 'Etudiant'

alter table Etudiant
drop constraint PK__tmp_ms_x__C63E2EBFDBB93F0E

alter table Etudiant
add primary key(username)

create table Etudiant_Atelier(
	Numero_Etudiant varchar(25) foreign key references Etudiant(username) on delete cascade,
	NumAtelier int foreign key references DonneesAteliers(NumAtelier) on delete cascade
)

alter table Etudiant_Atelier
alter column Numero_Etudiant varchar(25) not null

alter table Etudiant_Atelier
alter column NumAtelier int not null

alter table Etudiant_Atelier
add primary key(Numero_Etudiant, NumAtelier)
