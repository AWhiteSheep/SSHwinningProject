<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Activités.aspx.cs" Inherits="Inscription.WebForm3" %>

<%-- Le content place holder pour le head afin d'ajouter le css dédié pour la page --%>
<asp:Content ID="ActHead" ContentPlaceHolderID="head" runat="server">
    <title>Activités</title>
    <style>
        .search-txtBox {
            border-radius: 50px 0px 0px 50px !important;
        }

        .search-container {
            margin: auto;
            white-space: nowrap;
        }

        .my-form-control {
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            width: 60% !important;
        }

            .my-form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #80bdff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

        #contentBody_ServerRecherche {
            vertical-align: unset !important;
            margin: 0px;
            margin-left: -5px;
            border-radius: 0 50px 50px 0;
            border-color: #28a744 !important;
        }

        #contentBody_doCommand {
            position: relative;
        }

        .btn.effacer-tag {
            position: absolute;
            left: 0;
        }

        .media-body {
        }

            .media-body > input {
                position: absolute;
                bottom: 10px;
                right: 20px;
                box-sizing: unset !important;
                float:right;
            }

            .media-body > p.mb-0.smallInfo {
                position: absolute;
                top: 10px;
                right: 20px;
            }

        div.info-panel {
            min-height: 111px;
            position: relative;
        }
        div.subscriptionLine{
            position:absolute;
            right:0;
        }
        div.subscriptionLine>span{
            margin-right:5px;
        }
    </style>
    <%-- Ajout du css pour la page Activité --%>
    <link rel="stylesheet" href="Content/Activites.css" />
</asp:Content>

<%-- le content place holder pour le body qui ajoute de l'information dans la page autre que la master --%>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <%-- Page Web pour les activités --%>
    <%-- Script manager pour le ajax --%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container search-activity">
        <div class="display-1" style="text-align: center;font-family: 'Time New Roman';">Ateliers</div>
        <asp:UpdatePanel ID="doCommand" runat="server">
            <%-- Le boutton est clické celui-ci enlêve  --%>
            <ContentTemplate>
                <div class="search-container">
                    <asp:TextBox ID="txtSearch" class="my-form-control search-txtBox" runat="server"
                         placeholder="Rechercher" aria-label="Search"></asp:TextBox>
<%--                        <i class="fas fa-search" style="padding: 0px 5px;"></i>--%>
                    <asp:Button ID="ServerRecherche" class="btn btn-success my-2 my-sm-0" style="border-color: black" runat="server" Text="Rechercher" OnClick="ServerRecherche_Click" />
                </div>
                <%--                    <button class="btn choix-jour" id="J1" value="16" runat="server" ClientIDMode="static" onclick="btnChoix-jour_Click">Journée 1</button> 
                    <button class="btn choix-jour" id="J2" value="17" runat="server" ClientIDMode="static">Journée 2</button>
                    <button class="btn choix-jour" id="J3" value="18" runat="server" ClientIDMode="static">Journée 3</button>
                    <button class="btn choix-jour" id="J4" value="19" runat="server" ClientIDMode="static">Journée 4</button>
                    <button class="btn choix-jour" id="J5" value="20" runat="server" ClientIDMode="static">Journée 5</button>
                    <br />--%>
                <button class="btn effacer-tag" id="tag_enlever" runat="server" onserverclick="btnEnleverChoix_Click" clientidmode="static"><i class="fa fa-times-circle"></i></button>
                <%--<asp:Button class="btn choix-tag" ID="tag_science" runat="server" ClientIDMode="static" onclick="btnChoixTags_Click">science</asp:Button>--%>
                <asp:Panel ID="pnTags" runat="server"></asp:Panel>
                <hr style="width:50%" />
                <asp:Panel ID="pnCampusTags" runat="server"></asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="container align-content-md-center justify-content-md-center info-display" style="min-height: 85vh;">
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

        function ResetTags() {
            $(".tag-active").removeClass("tag-active");
        }
    </script>
</asp:Content>
