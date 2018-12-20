create trigger OnDeleteAtelier on DonneesAteliers
instead of delete
as begin
	delete Ateliers_Tags
	where NumAtelier in (select NumAtelier from deleted)

	delete Etudiant_Atelier
	where NumAtelier in (select NumAtelier from deleted)
	
	delete DonneesAteliers
	where NumAtelier in (select NumAtelier from deleted)
end 

