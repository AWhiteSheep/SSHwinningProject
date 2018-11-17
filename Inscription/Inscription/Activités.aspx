<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Activités.aspx.cs" Inherits="Inscription.WebForm3" %>
<asp:Content ID="ActHead" ContentPlaceHolderID="head" runat="server">
    <title>Activités</title>
    <link rel="stylesheet" href="Content/Activites.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
<%-- Page Web pour les activités --%>
    <div class="container search-activity">
        <div class="display-1" style="text-align:center;">Activité</div>
        <span class="text-search">Recherche par semaine</span>

        <span class="text-search">Recherche par tags</span>
        <hr />
    </div>
    <div class="row justify-content-md-center">
        <div class="activity-card">
            <img src="Images/Histoire.jpg" />
        </div>
    </div>
</asp:Content>
