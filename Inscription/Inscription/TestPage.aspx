<%@ Page Title="" Language="C#" MasterPageFile="~/Inscription.Master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="Inscription.WebForm1" %>


<asp:Content ID="contentTitle" ContentPlaceHolderID="CHevent_title" runat="server">
    L'Histoire le sait
</asp:Content>

<asp:Content ID="contentLienVers" ContentPlaceHolderID="CHLienVersLocation" runat="server">
    <a href="#">Cégep Outaouais</a>
</asp:Content>
<asp:Content ID="contentInfoLocation" ContentPlaceHolderID="CHinFoLocation" runat="server">
    Salle Auditoriaum
</asp:Content>

<asp:Content ID="contentInfo" ContentPlaceHolderID="CHinfoSupplementaire" runat="server">
    Venez assister à la conférence de Bruno Dubuc le vendredi 20 avril au campus Gabrielle-Roy qui nous parlera des neurosciences 🙂
</asp:Content>


<asp:Content ID="contentIMG" ContentPlaceHolderID="CHimagePoster" runat="server">
    <img src="Images/Histoire.jpg" alt="L'histoire le sait"/>
</asp:Content>

<asp:Content ID="contentMain" ContentPlaceHolderID="MainContent" runat="server">   
</asp:Content>
