select * from DonneesActivites

update DonneesActivites
set contentMain = 'Les connaissances sur le cerveau permettenet de reconsid�rer plusieurs id�es re�ues sur notre identit� personnelle. D''o� viennent les similarit�s, mais aussi les grandes dif�rences entre les individus? Quel r�le joue la longue histoire �volutive qui a men� jusqu''� nous d�finir?'
where NumActivite = 'TEST'

update DonneesActivites
set TitreCoupOeil = 'Qu''est-ce que les neurosciences?'
where NumActivite = 'TEST'

alter table DonneesActivites
add TitreCoupOeil text