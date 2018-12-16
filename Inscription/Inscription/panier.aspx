<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Panier.aspx.cs" Inherits="Inscription.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Panier</title>
    <style>
        .activity-card {
            width: 500px;

            border: 2px black solid;
            border-radius: 42px;
            padding: 30px;

            position: relative;
            min-width: 470px;
            height: 200px;
            margin-bottom: 18px !important;
        }

            .activity-card img {
                width: 130px;
                height: 130px;
                float: left;
                margin-right: 10px;
            }

        .search-activity input {
            text-align: center;
            border-radius: 500px !important;
            width: 115px;
        }

        .activity-card .btn {
            float:right;
            border-radius: 500px;
            position:absolute;
            bottom:18px;
            right:15px;
            margin: 0 20px 5px 10px;
        }
        .activity-btn-deinscription {
            right: 85px !important;
            background-color: rgb(220, 53, 69);
            color:white;
        }
        .activity-btn-voir {
            background-color: #117a8b;
        }
        .container{
            justify-content: center;
            display: flex;
            flex-wrap: wrap;
        }
    </style>
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
                    <%-- Table artificiel --%>
                    <div  id="GridAtelierInscrit" class="container" runat="server">                        
                    </div>                   
                        <asp:Button ClientIDMode="Static" ID="DoMyServerClick" runat="server" OnClick="PlusParticiper" CssClass="invisible"/>
                    <input type="text" ID="inputTextBox1" ClientIDMode="Static" runat="server" class="invisible"/>

                </ContentTemplate>
            </asp:UpdatePanel>            
        </div>
    </div>
    <script>
        $(".activity-btn-deinscription").click(function (e) {
            e.preventDefault();
            alert($(this).attr("name"));
            var text = $(this).attr("name").toString();
            $("#inputTextBox1").val(text);
            DoMyServerClick.click();
        });

    </script>
    <style>
        .DoMyServerClick_invisible{
            width:0px;
            height:0px;
            background-color:rgba(255,255,255,0);
        }
    </style>
</asp:Content>
