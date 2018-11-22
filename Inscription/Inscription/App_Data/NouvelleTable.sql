update DonneesActivites
set NumActivite = 1

alter table DonneesActivites
alter column NumActivite int 

select * FRom DonneesActivites
select * from DonneesAteliers

create table DonneesAteliers(
	NumAtelier int identity primary key,
	contentTitle varchar(50),
	campus varchar(20),
	Salle varchar(40),
	contentInfo text,
	poster image,
	contentMain text,
	sommaire varchar(25)
)
insert into DonneesAteliers(contentTitle,campus,Salle,contentInfo,poster,contentMain,sommaire)
select a.contentTitle,a.Campus,a.Salle,a.contentInfo, a.poster,a.contentMain,a.TitreCoupOeil from DonneesActivites a