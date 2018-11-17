<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Activités.aspx.cs" Inherits="Inscription.WebForm3" %>
<asp:Content ID="ActHead" ContentPlaceHolderID="head" runat="server">
    <title>Activités</title>
    <link rel="stylesheet" href="Content/Activites.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
<%-- Page Web pour les activités --%>
    <div class="container search-activity">
        <div class="display-1" style="text-align:center;">Activité</div>
        <form class="form-inline mt-2 mt-md-0">
                <input class="form-control mr-sm-2" type="text"
                    placeholder="Rechercher" aria-label="Search" />
                <button class="btn btn-success my-2 my-sm-0" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        search with tags
        <hr />
    </div>
    <div class="row justify-content-md-center">
        <div class="activity-card">
            <img src="Images/Histoire.jpg" />
        </div>
    </div>
</asp:Content>
