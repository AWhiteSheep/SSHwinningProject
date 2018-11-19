<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Activités.aspx.cs" Inherits="Inscription.WebForm3" %>
<asp:Content ID="ActHead" ContentPlaceHolderID="head" runat="server">
    <title>Activités</title>
    <link rel="stylesheet" href="Content/Activites.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
<%-- Page Web pour les activités --%>
    <div class="container search-activity">
        <div class="display-1" style="text-align:center;">Activités</div>
        <hr />
        <button class="btn choix-jour" id="J1">Journée 1</button>
        <button class="btn choix-jour" id="J2">Journée 2</button>
        <button class="btn choix-jour" id="J3">Journée 3</button>
        <button class="btn choix-jour" id="J4">Journée 4</button>
        <button class="btn choix-jour" id="J5">Journée 5</button>
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
                <button class="btn activity-btn-inscription">Inscription</button><a href="TestPage.aspx" class="btn activity-btn-voir">Plus...</a>
            </div>            
        </div>
    </div>
    <script>
        <%-- Jquery afin de toggle la class de boutton activé, afin de savoir à l'usager laquelles des journées il  a choisi --%>
        $(document).ready(function () {
            //Événement click des boutons avec la class de choix-jour
            $(".choix-jour").click(function () {
                $(".choix-jour").not(this).removeClass("jour-active"); //Enlève de tous les autres boutons la classe jour-active 
                $(this).toggleClass("jour-active");
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
