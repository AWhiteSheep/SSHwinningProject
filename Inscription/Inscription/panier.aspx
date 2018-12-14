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
                <%-- script manager --%>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <%-- UpdatePanel --%>
            <asp:UpdatePanel ID="UpdatePanelAtelierInscrit" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <%-- GridView --%>
                    <div  id="GridAtelierInscrit" runat="server">
                        
                    </div>                    
                </ContentTemplate>
            </asp:UpdatePanel>            
        </div>
    </div>
</asp:Content>
