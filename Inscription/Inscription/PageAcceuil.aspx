<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="PageAcceuil.aspx.cs" Inherits="Inscription.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Content/Acceuil.Master.css" />
    <title>
        Acceuil
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <div class="acceuilBanner">
        <%-- Emplacement du titre  --%>
        <div class="acceuilTitle">SEMAINE DES SCIENCES HUMAINES</div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="container-box">
                    <%-- Liens utiles qui mènera à des sites intéressant pour les élèves --%>
                    <div class="h3">LIENS UTILES</div>
                    <ul>
                        <%-- TODO ajouter les liens --%>
                        <li><a href="https://cegepoutaouais.omnivox.ca">Omnivox</a></li>
                        <li><a>Album</a></li>
                        <li><a>FAQ</a></li>
                        <li><a>Activite</a></li>
                        <li><a>Login</a></li>                        
                    </ul>
                </div>
            </div>
            <div class="col-md-8 Main-acceuil">
                <div class="h1">Message du jour!</div>
                On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).


            </div>
        </div>
    </div>
    
</asp:Content>
