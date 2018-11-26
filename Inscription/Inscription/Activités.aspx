<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Activités.aspx.cs" Inherits="Inscription.WebForm3" %>

<%-- Le content place holder pour le head afin d'ajouter le css dédié pour la page --%>
<asp:Content ID="ActHead" ContentPlaceHolderID="head" runat="server">
    <title>Activités</title>

    <%-- Ajout du css pour la page Activité --%>
    <link rel="stylesheet" href="Content/Activites.css" />
</asp:Content>

<%-- le content place holder pour le body qui ajoute de l'information dans la page autre que la master --%>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
<%-- Page Web pour les activités --%>

    <div class="container search-activity">
        <div class="display-1" style="text-align:center;">Ateliers</div>
        <hr />
        <%-- Le boutton est clické celui-ci enlêve  --%>
        <button class="btn choix-jour" id="J1" value="16">Journée 1</button>
        <button class="btn choix-jour" id="J2" value="17">Journée 2</button>
        <button class="btn choix-jour" id="J3" value="18">Journée 3</button>
        <button class="btn choix-jour" id="J4" value="19">Journée 4</button>
        <button class="btn choix-jour" id="J5" value="20">Journée 5</button>
        <br />
        <button class="btn effacer-tag" id="tag_enlever"><i class="fa fa-times-circle"></i></button>
        <button class="btn choix-tag" id="tag_science">science</button>
        <button class="btn choix-tag" id="tag_philosophie">philosophie</button>
        <button class="btn choix-tag" id="tag_economie">economie</button>
        <button class="btn choix-tag" id="tag_humain">l'humain</button>
        <button class="btn choix-tag" id="tag_ecole">école</button>

        <hr />
    </div>
    <div class="row justify-content-md-center">
        <div class="activity-card">
            <div class="image-box">
                <img src="Images/Histoire.jpg" />
                <div class="h4">L'éducation gratuite!</div>
                <p>Vous êtes convoqués à venir nous joindre à une superbe preésentation magistral pour une éducation accessible à tous!</p>
                <span style="float:right;"><button class="btn activity-btn-inscription">Inscription</button><a href="Ateliers.aspx" class="btn activity-btn-voir">Plus...</a></span>
            </div>            
        </div>
    </div>

    <%-- Script mis a fin de page afin de load soit plus efficace --%>
    <script>
        <%-- Jquery afin de toggle la class de boutton activé, afin de savoir à l'usager laquelles des journées il  a choisi --%>
        $(document).ready(function () {
            //Événement click des boutons avec la class de choix-jour
            $(".choix-jour").click(function () {
                //enlève la class jour-active de tous les éléments avec la classe choix jour en excluant celui qui activé l'évenement
                $(".choix-jour").not(this).removeClass("jour-active"); //Enlève de tous les autres boutons la classe jour-active 
                //Pour celui qui à activé l'événement il toggle la class jour-active, de cette façon nous pouvons l'enlever s'il la class lui appartient
                $(this).toggleClass("jour-active");

                //Événement click pour envoyé une demande par ajax, pour rechercher selon le jour
                if ($(this).hasClass("jour-active")) {
                    var journee = (this).innerHTML;
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            //Quoi faire lorsque la réponse du serveur est prête.
                            //todo script qui change, avec l'aide de innerHtml, le contenu de l'endroit placé dans le html
                            document.getElementById("txtHint").innerHTML = this.responseText;
                        }
                    };

                    //Ouvre la connection en metant une sting qui dictera quoi chercher
                    xmlhttp.open("GET", "Je Ne sais quoi.asp?q=" + journee, true);

                    //Envoie la demande 
                    xmlhttp.send();
                }

            });

            //Événement click des boutons avec la class de choix-tag
            $(".choix-tag").click(function () {
                $(this).toggleClass("tag-active");
            });

            //Événement click des boutons avec la class de choix-tag
            $(".effacer-tag").click(function () {
                $(".choix-tag").removeClass("tag-active");
            });
        });
    </script>
</asp:Content>
