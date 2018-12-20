<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Ateliers.aspx.cs" Inherits="Inscription.WebForm4" %>

<%-- ----------------------------------------------------------------------------------------- --%>
<%-- Connection avec la base sql selon la commande donnée --%>
<asp:Content ID="SQL" ContentPlaceHolderID="SQLconnection" runat="server">
<%--    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringToDonneesActivite %>" OnSelecting="Unnamed1_Selecting" SelectCommand="SELECT * FROM [DonneesActivites]"></asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringToDonneesActivite %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [DonneesActivites]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Atelier</title>
</asp:Content>


<%-- ----------------------------------------------------------------------------------------- --%>
<%-- Content du body --%>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
            <div class="container-fluid">
            <div class="Main">
                <div class="row">
                <div class="col-md-7 event-media">                    
                    <%-- Content holder pour l'image --%>
                    <img src="Images/Histoire.jpg" alt="L'histoire le sait"/>
                    <div class="display-4 Banner-title">
                        <%-- Label à l'intérieur duquel nous mettons le titre --%>
                        <asp:Label ID="lbTitle" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-md-5 top-right">
                        <div id="h3When" class="h1" runat="server">Quand?</div><br />
                        <div id="h0Heure" class="h4" runat="server">Heure</div>
                        <hr />
                        <%-- Content Holder pour le titre de la session --%>
                        <div id="h3Campus" runat="server" class="h3">Où?</div>
                         
                        <asp:Label ID="lbSalle" runat="server" Text="Label"></asp:Label>                        <hr />
                        <div class="box-btn-inscription" id="btnCommand" runat="server"><%--btnSincrire--%>
                            <%-- Boutton d'inscription --%>
                        </div>                

                </div>
                    </div>
                <%-- Section du bas --%>
                <div class="row">
                    <div class="col-md-2 Share-box">
                        <span class="Main-Share">PARTAGER</span><br />
                        <img src="Images/Efacebook.PNG" style="height: 57px; padding-top:5px;"/>
                        <br />
                        <img src="Images/EInstagram.PNG" style="height: 65px; padding-top:5px;"/>
                    </div>
                    <div class="col-md-10 description-box">
                        <h1>Description</h1>
                        <asp:Label ID="lbContentMain" runat="server" Text="Label"></asp:Label>

                    </div>
                </div>

            </div>
        </div>

</asp:Content>
