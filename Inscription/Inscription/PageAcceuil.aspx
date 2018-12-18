<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="PageAcceuil.aspx.cs" Inherits="Inscription.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Content/Acceuil.Master.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <%-- Javascripts --%>

    <title>Accueil
    </title>
    <style>
        .carousel-indicators .active {
            background-color: black !important;
        }

        .bot-indicator {
            padding-right: 1rem;
            text-align: right;
            background-color: white;
            height: 30px;
        }

            .bot-indicator a {
                padding: 1px 10px 1px 10px;
                margin: 0 14px;
                color: black;
            }

                .bot-indicator a:hover {
                    text-decoration: none;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <div class="banner-image">
        <img src="Images/LesterBPerson.jpg" />
        <img src="Images/instaSSH.jpg" />
        <img src="Images/science.jpg" />
        <img src="Images/SSH1.jpg" />
        <img src="Images/earth.jpg" />
        <img src="Images/SSH2.jpg" />
        <img src="Images/LisePayette.jpg" />
        <img src="Images/SSH3.jpg" />
        <img src="Images/team.jpg" />
        <img src="Images/SSH4.jpg" />
        <img src="Images/statue-3289791_640.jpg" />
        <img src="Images/bustos.jpg" />
        <img src="Images/canvas-1009232_640.jpg" />
        <img src="Images/guy-2617866_640.jpg" />
        <img src="Images/pyramids-2371501_1280.jpg" />
        <img src="Images/bonding.jpg" />
        <%-- REp --%>
        <img src="Images/LesterBPerson.jpg" />
        <img src="Images/science.jpg" />
        <img src="Images/rubik.jpg" />
        <img src="Images/LisePayette.jpg" />
        <img src="Images/team.jpg" />
        <img src="Images/statue-3289791_640.jpg" />
        <img src="Images/bustos.jpg" />
        <img src="Images/canvas-1009232_640.jpg" />
        <img src="Images/guy-2617866_640.jpg" />
        <img src="Images/pyramids-2371501_1280.jpg" />
        <img src="Images/bonding.jpg" />
        <img src="Images/hands-600497_640.jpg" />
    </div>
    <div style="text-align: center; height: 22px; background-color: #094569;">
        <%--        <div class="bot-indicator container" style="align-items: center; text-align: center; justify-content: center; display: inline-flex;">--%>
        <%-- Lien vers omnivox --%>
        <%--            <a style="" href="#">Date limites</a>
            <a style="" href="#">Présence</a>
            <a style="" href="#">Réglements</a>
            <a style="" href="#">Omnivox</a>
            <a style="" href="#">Omnivox</a>
            <a style="" href="#">Omnivox</a>--%>
        <%--        </div>--%>
    </div>
    <div class="acceuilBanner" style="margin: auto; position: relative;">
        <%-- Emplacement du titre si utilisé  --%>
        <%--<div class="acceuilTitle">SEMAINE DES SCIENCES HUMAINES</div>--%>
        <div class="col-md-3" style="max-width: 400px; position: absolute;">
            <div class="container-box" style="background-color: #ffffffbf; padding: 20px 30px;">
                <%-- Liens utiles qui mènera à des sites intéressant pour les élèves --%>
                <blockquote class="blockquote">
                    <p>“Le commencement de toutes les sciences, c’est l’étonnement de ce que les choses sont ce qu’elles sont.”</p>
                    <div style="text-align: right;">Aristote</div>
                </blockquote>
            </div>
        </div>

        <div class="display-3" style="padding: 30px 30px; background-color: rgba(128, 128, 128, .8); position: absolute; bottom: 0px; width: -webkit-fill-available;">La science humaine</div>
    </div>

    <%--    <div class="container">
            <%--<div class="col-md-8 Main-acceuil">
                <div class="h1">Message du jour!</div>
                On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).
                
                <%-- Insertion d'un carousel afin de présenté quelques photos d'années précédentes --%>
    <div class="row" style="padding-bottom: 15px; padding-top: 15px; background-color: rgb(3,116,156);">

        <%-- </div>--%>
        <div class="container">
            <%--                <div id="slider_content" class="carousel slide" data-ride="carousel" style="padding-top: 8px;">
                                      <!-- Indicators -->
                  <ul class="carousel-indicators">
                    <li data-target="#slider_content" data-slide-to="0" class="active" style="background-color:slategrey"></li>
                    <li data-target="#slider_content" data-slide-to="1" style="background-color:slategrey"></li>
                    <li data-target="#slider_content" data-slide-to="2" style="background-color:slategrey"></li>
                  </ul>--%>

            <%--                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="img-box">
                                <img class="d-block w-100" src="Images/Default/insta_gallery_1 (13).jpg" alt="First slide">
                            </div>
                            <h1>Qui sommes-nous?</h1>
                            <p>Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard. Si vous voulez utiliser un passage du Lorem Ipsum, vous devez être sûr qu'il n'y a rien d'embarrassant caché dans le texte. Tous les générateurs de Lorem Ipsum sur Internet tendent à reproduire le même extrait sans fin, ce qui fait de lipsum.com le seul vrai générateur de Lorem Ipsum. Iil utilise un dictionnaire de plus de 200 mots latins, en combinaison de plusieurs structures de phrases, pour générer un Lorem Ip</p>
                        </div>
                        <div class="carousel-item">
                            <div class="img-box">
                                <img class="d-block w-100" src="Images/Default/insta_gallery_1 (7).jpg" alt="Second slide">
                            </div>
                            <h1>Un invité</h1>
                            <p>jPlusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard. Si vous voulez utiliser un passage du Lorem Ipsum, vous devez être sûr qu'il n'y a rien d'embarrassant caché dans le texte. Tous les générateurs de Lorem Ipsum sur Internet tendent à reproduire le même extrait sans fin, ce qui fait de lipsum.com le seul vrai générateur de Lorem Ipsum. Iil utilise un dictionnaire de plus de 200 mots latins, en combinaison de plusieurs structures de phrases, pour générer un Lorem Ip</p>

                        </div>
                        <div class="carousel-item">
                            <div class="img-box">
                                <img class="d-block w-100" src="Images/Default/insta_gallery_2.jpg" alt="Third slide">
                            </div>
                            <h1>Spécial</h1>
                            <p>je suis Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard. Si vous voulez utiliser un passage du Lorem Ipsum, vous devez être sûr qu'il n'y a rien d'embarrassant caché dans le texte. Tous les générateurs de Lorem Ipsum sur Internet tendent à reproduire le même extrait sans fin, ce qui fait de lipsum.com le seul vrai générateur de Lorem Ipsum. Iil utilise un dictionnaire de plus de 200 mots latins, en combinaison de plusieurs structures de phrases, pour générer un Lorem Ip</p>

                        </div>
                    </div>--%>
            <%-- </div>--%>
        </div>
        <%--        </div>--%>
    </div>

</asp:Content>
