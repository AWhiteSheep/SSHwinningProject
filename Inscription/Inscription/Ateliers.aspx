<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Ateliers.aspx.cs" Inherits="Inscription.WebForm4" %>

<%-- ----------------------------------------------------------------------------------------- --%>
<%-- Connection avec la base sql selon la commande donnée --%>
<asp:Content ID="SQL" ContentPlaceHolderID="SQLconnection" runat="server">
<%--    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringToDonneesActivite %>" OnSelecting="Unnamed1_Selecting" SelectCommand="SELECT * FROM [DonneesActivites]"></asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringToDonneesActivite %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [DonneesActivites]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                     <div class="h3">
                         <asp:Label ID="lbTitleCoupOeil" runat="server" Text="Label"></asp:Label></div>
                    <p>
                        <%-- Petite description de ce que c'est --%>
                        <asp:Label ID="lbSmallInfo" runat="server" Text="Label"></asp:Label>
                    </p>
                    <hr />
                    <form runat="server">
                        <div class="h3">Quand?</div>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                        <hr />
                        <%-- Content Holder pour le titre de la session --%>
                        <div class="h3">Où?</div>
                            <span style="color:aquamarine !important">    <a href="#">
                                <asp:Label ID="lbCampus" runat="server" Text="Label"></asp:Label></a>
                                </span> -     <asp:Label ID="lbSalle" runat="server" Text="Label"></asp:Label>
                        <hr />
                        <div class="box-btn-inscription">
                            <%-- Boutton d'inscription --%>
                            <button class="btn btn-success btnSincrire">S'inscrire</button>
                        </div>                
                    </form>

                </div>
                    </div>
                <%-- Section du bas --%>
                <div class="row">
                    <div class="col-md-2 Share-box">
                        <span class="Main-Share">PARTAGER</span><br />
                        <i class="fab fa-facebook"></i><br/>
                        <i class="fab fa-instagram"></i>
                    </div>
                    <div class="col-md-10 description-box">
                        <h1>Description</h1>
                        <asp:Label ID="lbContentMain" runat="server" Text="Label"></asp:Label>

                    </div>
                </div>

            </div>
        </div>

</asp:Content>
