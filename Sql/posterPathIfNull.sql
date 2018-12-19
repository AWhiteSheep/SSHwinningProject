select * from DonneesAteliers

update DonneesAteliers
set posterPath = 'Images/default-thumb.png'
where posterPath is null