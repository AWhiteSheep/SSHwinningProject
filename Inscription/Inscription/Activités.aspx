<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Activités.aspx.cs" Inherits="Inscription.WebForm3" %>

<%-- Le content place holder pour le head afin d'ajouter le css dédié pour la page --%>
<asp:Content ID="ActHead" ContentPlaceHolderID="head" runat="server">
    <title>Activités</title>

    <%-- Ajout du css pour la page Activité --%>
    <link rel="stylesheet" href="Content/Activites.css" />
</asp:Content>

<%-- le content place holder pour le body qui ajoute de l'information dans la page autre que la master --%>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <%-- Page Web pour les activités --%>
    <%-- Script manager pour le ajax --%>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container search-activity">
            <div class="display-1" style="text-align: center;">Ateliers</div>
            <hr />
            <asp:UpdatePanel ID="doCommand" runat="server">
                <%-- Le boutton est clické celui-ci enlêve  --%>
                <ContentTemplate>
                    <button class="btn choix-jour" id="J1" value="16" runat="server" ClientIDMode="static" onclick="btnChoix-jour_Click">Journée 1</button> 
                    <button class="btn choix-jour" id="J2" value="17" runat="server" ClientIDMode="static">Journée 2</button>
                    <button class="btn choix-jour" id="J3" value="18" runat="server" ClientIDMode="static">Journée 3</button>
                    <button class="btn choix-jour" id="J4" value="19" runat="server" ClientIDMode="static">Journée 4</button>
                    <button class="btn choix-jour" id="J5" value="20" runat="server" ClientIDMode="static">Journée 5</button>
                    <br />
                    <Button class="btn effacer-tag" id="tag_enlever" runat="server" ClientIDMode="static"><i class="fa fa-times-circle"></i></Button>
                    <%--<asp:Button class="btn choix-tag" ID="tag_science" runat="server" ClientIDMode="static" onclick="btnChoixTags_Click">science</asp:Button>--%>
                    <asp:Button class="btn choix-tag" ID="tagScience" runat="server"   ClientIDMode="static" Text="science" onclick="btnChoixTags_Click" />
                    <asp:button class="btn choix-tag" id="tagPhilosophie" runat="server" ClientIDMode="static" onclick="btnChoixTags_Click" text="philosophie" />
                    <asp:button class="btn choix-tag" id="tagEconomie" runat="server" ClientIDMode="static" onclick="btnChoixTags_Click" Text="economie"></asp:button>
                    <asp:button class="btn choix-tag" id="tagHumain" runat="server" ClientIDMode="static" onclick="btnChoixTags_Click" Text="humain"/>
                    <asp:button class="btn choix-tag" id="tagEcole" runat="server" ClientIDMode="static" onclick="btnChoixTags_Click" Text="école" />

                </ContentTemplate>
            </asp:UpdatePanel>


            <hr />
        </div>
        <div class="row justify-content-md-center">
            <asp:UpdatePanel ID="upSlotForServerHead" ClientIDMode="Static" runat="server">
            </asp:UpdatePanel>
        </div>
    <%-- Script mis a fin de page afin de load soit plus efficace --%>
    <script>
        <%-- Jquery afin de toggle la class de boutton activé, afin de savoir à l'usager laquelles des journées il  a choisi --%>
        $(document).ready(function () {
            //Événement click des boutons avec la class de choix-jour
            $(".choix-jour").click(function () {
                //enlève la class jour-active de tous les éléments avec la classe choix jour en excluant celui qui activé l'évenement
                $(".choix-jour").not(this).removeClass("jour-active"); //Enlève de tous les autres boutons la classe jour-active 
                //Pour celui qui à activé l'événement il toggle la class jour-active, de cette façon nous pouvons l'enlever s'il la class lui appartient
                $(this).toggleClass("jour-active");

            });

            //Événement click des boutons avec la class de choix-tag
            $(".choix-tag").click(function () {
                $(this).toggleClass("tag-active");
            });

            //Événement click des boutons avec la class de choix-tag
            $(".effacer-tag").click(function () {
                $(".choix-tag").removeClass("tag-active");
            });
        });
    </script>
</asp:Content>
