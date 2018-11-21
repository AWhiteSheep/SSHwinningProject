select * from DonneesActivites

update DonneesActivites
set contentMain = 'Les connaissances sur le cerveau permettenet de reconsidérer plusieurs idées reçues sur notre identité personnelle. D''où viennent les similarités, mais aussi les grandes diférences entre les individus? Quel rôle joue la longue histoire évolutive qui a mené jusqu''à nous définir?'
where NumActivite = 'TEST'

update DonneesActivites
set TitreCoupOeil = 'Qu''est-ce que les neurosciences?'
where NumActivite = 'TEST'

alter table DonneesActivites
add TitreCoupOeil text