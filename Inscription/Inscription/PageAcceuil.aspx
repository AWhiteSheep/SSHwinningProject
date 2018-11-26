<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="PageAcceuil.aspx.cs" Inherits="Inscription.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Content/Acceuil.Master.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>
        Accueil
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <div class="acceuilBanner">
        <%-- Emplacement du titre si utilisé  --%>
        <%--<div class="acceuilTitle">SEMAINE DES SCIENCES HUMAINES</div>--%>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3" style="padding-left:10px;">
                <div class="container-box">
                    <%-- Liens utiles qui mènera à des sites intéressant pour les élèves --%>
                    <div class="h3">LIENS UTILES</div>
                    <ul>
                        <%-- TODO ajouter les liens --%>
                        <li><a href="https://cegepoutaouais.omnivox.ca">Omnivox</a></li>
                        <li><a>Album</a></li>
                        <li><a>FAQ</a></li>
                        <li><a>Login</a></li>                        
                    </ul>
                </div>
            </div>
            <div class="col-md-8 Main-acceuil">
                <div class="h1">Message du jour!</div>
                On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).
                
                <%-- Insertion d'un carousel afin de présenté quelques photos d'années précédentes --%>
                        <!-- carouselExampleIndicators -->
        <div id="slider_content" class="carousel slide" data-ride="carousel" style="padding-top:20px;">
            <div class="carousel-inner">
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
            </div>
        </div>
        <div class="bouton-control-slider" style="padding-top:2px;">
            <a class="slider_precedent" href="#slider_content" role="button" data-slide="prev" style="border-radius:10px;"> 
                <i class="material-icons">arrow_back</i>
            </a>
            <a class="slider_suivant" href="#slider_content" role="button" data-slide="next" style="border-radius:10px;float:right;">
                <i class="material-icons">arrow_forward</i>
            </a>
        </div>
                
            </div>            
        </div>
    </div>
    
</asp:Content>
