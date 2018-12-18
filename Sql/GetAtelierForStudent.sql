--création de la function
create function GetAllAteliersByStudent(@Etudiant varchar(25))
returns @tableOfAtelierIDs table(
	[NumAtelier]   INT NOT NULL,
    [contentTitle] VARCHAR (250) NOT NULL,
    [campus]       VARCHAR (50)  NULL,
    [Salle]        VARCHAR (70)  NULL,
    [contentInfo]  TEXT          NULL,
    [contentMain]  TEXT          NULL,
    [sommaire]     VARCHAR (25)  NULL,
    [dateDebut]    SMALLDATETIME NULL,
    [Max_Eleves]   INT           NULL,
    [posterPath]   VARCHAR (100) NULL,
    [HeureDebut]   TIME (7)      NULL,
    [HeureFin]     TIME (7)      NULL,
    [Conferencier] NVARCHAR (50) NULL
)
as begin
	insert into @tableOfAtelierIDs(	
	[NumAtelier],
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
    [Conferencier]
	)	
	select * from DonneesAteliers
		where NumAtelier in
		(select t.NumAtelier from (select NumAtelier from Etudiant_Atelier where Numero_Etudiant = @Etudiant) t)
	return
end
go

