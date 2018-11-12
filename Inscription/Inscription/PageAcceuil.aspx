<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="PageAcceuil.aspx.cs" Inherits="Inscription.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Content/Acceuil.Master.css" />
    <title>
        Acceuil
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <div class="acceuilBanner">
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="container-box">
                    <div class="h3">LIENS UTILES</div>
                    <ul>
                        <li>Omnivox</li>
                        <li>Album</li>
                        <li>FAQ</li>
                        <li>Meilleur site de vaches</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="h1">Bienvenue dans le site de la science humaine!</div>
            </div>
        </div>
    </div>
    
</asp:Content>
