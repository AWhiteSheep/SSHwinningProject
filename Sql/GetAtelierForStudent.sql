--création de la function
create function GetAllAteliersByStudent(@Etudiant int)
returns @tableOfAtelierIDs table(
	NumAtelier int, 
	[contentTitle] VARCHAR (50)  NULL,
    [campus]       VARCHAR (20)  NULL,
    [Salle]        VARCHAR (40)  NULL,
    [contentInfo]  TEXT          NULL,
    [contentMain]  TEXT          NULL,
    [sommaire]     VARCHAR (25)  NULL,
    [dateDebut]    SMALLDATETIME NULL,
    [Max_Eleves]   INT           NULL,
    [posterPath]   VARCHAR (100) NULL,
    [HeureDebut]   TIME (7)      NULL,
    [HeureFin]     TIME (7)      NULL,
	[conferencier] varchar(50)
)
as begin
	insert into @tableOfAtelierIDs(	
	NumAtelier, 
	[contentTitle],
    [campus],
    [Salle],
    [contentInfo],
    [contentMain],
    [sommaire],
    [dateDebut],
    [Max_Eleves],
    [posterPath],
    [HeureDebut],
    [HeureFin],
	[conferencier]
	)	
	select * from DonneesAteliers
		where NumAtelier in
		(select t.NumAtelier from (select NumAtelier from Etudiant_Atelier where Numero_Etudiant = @Etudiant) t)
	return
end
go

