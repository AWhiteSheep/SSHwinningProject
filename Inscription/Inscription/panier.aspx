<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Panier.aspx.cs" Inherits="Inscription.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Panier</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="container" style="padding-top:25px;padding-bottom:20px;">
        <div class="h1">Récapitulatif</div>
            <div style="border:1.2px solid black;">
            <div class="row" style="background-color:black;color:white;margin:0 !important">
                <div class="col-12">Vos ateliers</div>
            </div>
    
            <div class="row">
                <div class="col-4">
                    <div class="h1">Geneviève Rioux</div>
                    <div class="h3">La mythologie grecque et l'identité</div>
                    <div class="h4">Lundi 16 avril 11h00</div>
                </div>
                <div class="col-6">
                    <div class="p-0">Les mythes, les dieux et les héros de la Grèce antique fascinent
                        l'Occident depuis toujours. Mais ces histoires qui font rêver les lecteurs
                        et les amateurs de cinéma jouaient un rôle bien précis chez les Grecs.
                        On sait en effet que la mythologie contribuait à transmettre les valeurs
                        qui étaient au centre de leur identité. Mais elle occupait également un
                        rôle fondamental dans la construction de cette identité...                     </div>
                    <small><b>Geneviève Rioux</b> est enseignante en histoire au cégep de l'Outaouais depuis 2008.
                    Elle s’intéresse à la mythologie</small>
                </div>
                <div class="col-2" style="margin:auto;">
                    <button class="btn alert-secondary" style="border-radius:150px;">Ne plus participer</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
