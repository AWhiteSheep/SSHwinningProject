create table Etudiant(
	Numero_Etudiant int primary key,
)
go
create table Etudiant_Atelier(
	Numero_Etudiant int foreign key references Etudiant(Numero_Etudiant),
	NumAtelier int foreign key references DonneesAteliers(NumAtelier)
)

alter table DonneesAteliers
add Max_Eleves int

create table Tags(
	[Description] varchar(25) primary key
)

create table Ateliers_Tags(
	NumAtelier int foreign key references DonneesAteliers(NumAtelier),
	[Description] varchar(25) foreign key references Tags([Description])
)
go
--création de la function
create function GetAllAteliersByTag(@Tags varchar(25))
returns @tableOfAtelierIDs table(NumAtelier int)
as begin
	insert into @tableOfAtelierIDs
	select t.NumAtelier from (select NumAtelier from Ateliers_Tags where [Description] Like '%'+@Tags+'%') t

	return
end

go

insert into Tags
values('Science'), ('Philosophie'), ('Économie'), ('L''humain'),('École')

insert into DonneesAteliers(contentTitle)
values('science'),('science_philo'),('humain_école_philo')

select * from DonneesAteliers

insert into Ateliers_Tags
values(5, 'Science'),(6, 'Science'),(6, 'Philosophie'),(7, 'L''humain'),(7, 'École'),(7, 'Philosophie')

select * from GetAllAteliersByTag('science')
select * from Ateliers_Tags

update DonneesAteliers
set posterPath = 'Images/bonding.jpg'
where NumAtelier = 4

update DonneesAteliers
set posterPath = 'Images/bustos.jpg', campus = 'GR'
where NumAtelier = 7

update DonneesAteliers
set posterPath = 'Images/earth.jpg'
where NumAtelier = 5

update DonneesAteliers
set posterPath = 'Images/science.jpg'
where NumAtelier = 6
