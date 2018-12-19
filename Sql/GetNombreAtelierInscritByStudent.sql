--création de la function
create function GetNombreAtelierInscritByStudent(@Etudiant varchar(25))
returns int
as begin
	declare @nombre int

	select @nombre = count(NumAtelier) from Etudiant_Atelier
	where Numero_Etudiant = @Etudiant

	return @nombre
end
go
