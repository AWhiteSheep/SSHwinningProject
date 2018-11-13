<%@ Page Title="" Language="C#" MasterPageFile="~/Inscription.Master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="Inscription.WebForm1" %>

<asp:Content ID="SQL" ContentPlaceHolderID="SQLconnection" runat="server">
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringToDonneesActivite %>" OnSelecting="Unnamed1_Selecting" SelectCommand="SELECT * FROM [DonneesActivites]"></asp:SqlDataSource>
</asp:Content>


<asp:Content ID="contentTitle" ContentPlaceHolderID="CHevent_title" runat="server">
    <asp:Label ID="lbTitle" runat="server" Text=""></asp:Label>
</asp:Content>

<asp:Content ID="contentLienVers" ContentPlaceHolderID="CHLienVersLocation" runat="server">
    <a href="#">
        <asp:Label ID="lbCampus" runat="server" Text="Label"></asp:Label></a>
</asp:Content>
<asp:Content ID="contentInfoLocation" ContentPlaceHolderID="CHinFoLocation" runat="server">
    <asp:Label ID="lbSalle" runat="server" Text="Label"></asp:Label>
</asp:Content>

<asp:Content ID="contentInfo" ContentPlaceHolderID="CHinfoSupplementaire" runat="server">
    <asp:Label ID="lbSmallInfo" runat="server" Text="Label"></asp:Label>
</asp:Content>


<asp:Content ID="contentIMG" ContentPlaceHolderID="CHimagePoster" runat="server">
    <img src="Images/Histoire.jpg" alt="L'histoire le sait"/>
</asp:Content>

<asp:Content ID="contentMain" ContentPlaceHolderID="MainContent" runat="server">   
    <asp:Label ID="lbContentMain" runat="server" Text="Label"></asp:Label>
</asp:Content>
