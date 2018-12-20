<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="AjoutAtelier.aspx.cs" Inherits="Inscription.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/AjoutAtelier.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('../Images/659444.jpg')
        }

        .nav > li > a {
            position: relative;
            display: block;
            padding: 10px 15px;
            text-decoration: none;
        }

            .nav > li > a.active.show {
                color: #555;
                cursor: default;
                background-color: #fff;
                border: 1px solid #ddd;
                border-bottom-color: transparent;
            }

        .nav-tabs > li.active.show > a:focus {
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }

        .nav-tabs > li > a:hover {
            cursor: pointer !important;
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }

        .container {
            padding-right: 0px !important;
            padding-left: 0px !important;
        }

        /*css pour table*/
        tr {
            border-radius: 7px;
            padding: 25px 30px;
            justify-content: space-between;
            box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.1);
        }

            tr:hover {
                background-color: rgba(251, 88, 88, 0.78);
            }

        th {
            font-size: 14px;
            text-transform: uppercase;
            border: none;
        }

        td {

                padding: 10px 5px;
            border: none;
        }

            td:before {
                color: #6C7A89;
            }

        td>a{
            color:navy;
        }
        .row-header {
            background-color: #094569ad;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        table {
            border: none;
            margin: auto;
                background-color: aliceblue;
        }

        #contentBody_hiddenMessage {
            width: 400px;
            border: 1px solid #D8D8D8;
            padding: 10px;
            border-radius: 5px;
            font-family: Arial;
            font-size: 11px;
            text-transform: uppercase;
            background-color: rgb(236, 255, 216);
            color: green;
            text-align: center;
            margin-top: 30px !important;
            margin: auto;
        }

        .hiddenMessage {
            display: none;
        }

        .modal-br {
            padding-bottom: 2px;
        }

        .btn.choix-tag{
            border-radius: 50px;
            margin: 10px 5px;
            padding: 5px;
        }

        .btn.tag-active {
            background-color: darkorange;
        }
       #contentBody_DateEvent{
            position: absolute;
            border-collapse: collapse;
            right: 28px;
            top: 36px;
            z-index: 41;
        }
    </style>
    <title>Ajouter Atelier</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script src="Scripts/jquery-3.0.0.js"></script>
            <script src="Scripts/bootstrap.js"></script>

            <%-- La nav tabs controls --%>
            <ul class="nav nav-tabs container">
                <li><a id="TheFormulaire" runat="server" clientidmode="static" data-toggle="tab" href="#contentBody_FormulaireAtelier" class="active show">Ajouter un atelier</a></li>
                <li><a id="ListAteler" runat="server" clientidmode="static" data-toggle="tab" href="#contentBody_AtelierList">Les ateliers</a></li>
            </ul>
            <div class="tab-content">
                <%-- container pour le formulaire --%>
                <div id="FormulaireAtelier" runat="server" class="container tab-pane fade in active show">
                    <div class="container-contact100">
                        <div class="wrap-contact100">
                            <div class="contact100-form validate-form">
                                <span class="contact100-form-title">Ajout Atelier</span>
                                <div id="hiddenMessage" class="hiddenMessage" runat="server">Vous avez bien entré un nouveau atelier!</div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txttitre" ID="ref_titre" runat="server" ErrorMessage="Le titre doit être entré" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer un nom d'atelier">
                                    <asp:TextBox ID="txttitre" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="titre" placeholder="Titre de l'atelier" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_Campus" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Le campus doit être entré" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer le campus">
                                    <asp:TextBox ID="txt_Campus" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="campus" placeholder="Campus" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_salle" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Le numéro de la salle doit être entré" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer la salle">
                                    <asp:TextBox ID="txt_salle" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="salle" placeholder="Numéro de salle" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_date" ID="RequiredFieldValidator3" runat="server" ErrorMessage="S'il vous plait entrer la date" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="txt_date" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Le format n'est pas le bon --> dd/mm/yyyy" ForeColor="Red" Display="Dynamic" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
                                <div class="wrap-input100 validate-input" style="position:relative;    display: inline-flex;z-index: 2;" data-validate="S'il vous plait entrer la date">
                                    <asp:TextBox ID="txt_date" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="date" placeholder="Date" style="display:unset !important"/><asp:ImageButton ID="ibtnDate" ClientIDMode="Static" runat="server" ImageUrl="~/Images/calendaricon.png" Height="32px" OnClick="ibtnDepart_Click" CausesValidation="False" style="float:right;"/>
                                    <asp:Calendar ID="DateEvent" runat="server" Visible="False" OnSelectionChanged="DateEvent_SelectionChanged" ></asp:Calendar>
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_heure" ID="RequiredFieldValidator4" runat="server" ErrorMessage="S'il vous plait entrer l'heure" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_heure" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Le format n'est pas le bon --> 10:12" ForeColor="Red" ValidationExpression="^\d{1,2}:\d{2}$"></asp:RegularExpressionValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer l'heure">
                                    <asp:TextBox ID="txt_heure" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="heure" placeholder="Heure début" />
                                    <span class="focus-input100"></span>
                                </div>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_heure_fin" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Le format n'est pas le bon --> 10:12" ForeColor="Red" ValidationExpression="^\d{1,2}:\d{2}$"></asp:RegularExpressionValidator>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_heure_fin" ID="RequiredFieldValidator10" runat="server" ErrorMessage="S'il vous plait entrer l'heure de fin" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer l'heure de fin">
                                    <asp:TextBox ID="txt_heure_fin" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="heure" placeholder="Heure fin" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_elevemax" ID="RequiredFieldValidator5" runat="server" ErrorMessage="S'il vous plait entrer le nombre d'élève maximal" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_elevemax" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Le champ n'accepte que des chiffres" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer le nombre d'élève maximal">
                                    <asp:TextBox ID="txt_elevemax" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="elevemax" placeholder="Nombre élève maximal" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_conferencier" ID="RequiredFieldValidator6" runat="server" ErrorMessage="S'il vous plait entrer le nom du conférencier" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer le nom du conférencier">
                                    <asp:TextBox ID="txt_conferencier" ClientIDMode="Static" ToValidate runat="server" class="input100" type="text" name="conferencier" placeholder="Nom du conférencier" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txt_Sommaire" ID="RequiredFieldValidator7" runat="server" ErrorMessage="S'il vous plait entrer un sommaire" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer un sommaire">
                                    <textarea id="txt_Sommaire" clientidmode="Static" tovalidate runat="server" class="input100" name="sommaire" placeholder="Sommaire"></textarea>
                                    <span class="focus-input100"></span>
                                </div>
                                <div class="text-center">
                                    Choisir les mots clé pertinents à cet atelier
                                </div>
                                <asp:Panel ID="pnTags" runat="server"></asp:Panel>



                                <%-- Ajout d'image upload --%>
                                <asp:FileUpload ID="ImageUpload" runat="server" />

                                <%-- Submit et si du côté serveur la page est valide de faire l'insertion dans la base de donnée --%>
                                <div class="container-contact100-form-btn">
                                    <button id="ajouter" onclick="ShowModal();" class="contact100-form-btn">
                                        <span>Ajouter
                                        </span>
                                    </button>
                                    <button id="clear" class="contact100-form-btn-clear" causesvalidation="false">
                                        <span>clear
                                        </span>
                                    </button>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>

                <%-- l'endroit avec la liste de tout les ateliers --%>
                <div id="AtelierList" runat="server" class="container  tab-pane fade" style="background-color: rgba(242, 242, 242, .5); min-height: 81vh;">
                    <div id="PageTitle" class="display-4" style="text-align: center; padding: 26px;">Les ateliers</div>

                    <asp:GridView ID="gridViewAtelier" runat="server" AutoGenerateColumns="false"
                        OnRowDeleting="RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="NumAtelier" HeaderText="ID" />
                            <asp:BoundField DataField="contentTitle" HeaderText="Titre" />
                            <asp:BoundField DataField="campus" HeaderText="Campus" />
                            <asp:BoundField DataField="Salle" HeaderText="Salle" />
                            <asp:BoundField DataField="dateDebut" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"/>
                            <asp:BoundField DataField="HeureDebut" HeaderText="Heure" DataFormatString="{0:hh\:mm}"/>
                            <asp:BoundField DataField="HeureFin" HeaderText="Heure_fin" DataFormatString="{0:hh\:mm}"/>
                            <asp:BoundField DataField="Max_Eleves" HeaderText="Max" />
                            <asp:BoundField DataField="Conferencier" HeaderText="Conférencier" />
                            <asp:CommandField ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>


                </div>
            </div>
            <script>
                function ShowModal(e) {
                    if (Page_ClientValidate("")) {
                        $("#AtelierModal").modal('show');
                    }
                    else { alert("Invalide");}
                    return false;
                }

                $("#contentBody_hiddenMessage").click(function () {
                    $(this).attr("class", "hiddenMessage");
                });
            </script>
            <div class="modal fade ModalLoginPage" id="AtelierModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <%-- Le header --%>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title" id="ModalTitle">Login</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <asp:Label ID="lblSuccess" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <%-- Au boutton click demande au serveur pour ajouter l'atelier!!!!!!!! :))))))) yayayyyayay --%>
                            <%-- Débute un postBackTrigger pour un file upload --%>
                            <asp:Button ID="btnSubmit" ClientIDMode="Static" Text="Ajouter" runat="server" Class="btn btn-primary" CausesValidation="false" OnClick="AtelierCreation_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Changer</button>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>

    <%-- Panel pour option d'ajout d'un autre --%>
    <div class="modal fade ModalLoginPage" id="UpdateAtelier" tabindex="-1" role="dialog" aria-labelledby="ModalTitle"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <%-- Le header --%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <asp:TextBox ID="txtID" ClientIDMode="Static" runat="server"></asp:TextBox>
                </div>
                <div class="modal-body">
                    <div class="container">
                        Titre:
                        <asp:TextBox ID="txtAtelierTitle" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox><br class="modal-br" />
                        Campus:
                        <asp:TextBox ID="txtCampus" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox><br class="modal-br" />
                        Salle:
                        <asp:TextBox ID="txtSalle" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox><br class="modal-br" />
                        Date:
                        <asp:TextBox ID="txtDate" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox><br class="modal-br" />
                        Heure:
                        <asp:TextBox ID="txtHeure" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox><br class="modal-br" />
                        Heure fin:
                        <asp:TextBox ID="txtHeureFin" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox><br class="modal-br" />
                        Élève max:
                        <asp:TextBox ID="txteleveMax" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox><br class="modal-br" />
                        Conférencier:
                        <asp:TextBox ID="txtconferencier" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <%-- Au boutton click demande au serveur pour ajouter l'atelier!!!!!!!! :))))))) yayayyyayay --%>
                    <asp:Button ID="btnModifier" Text="Modifier" runat="server" OnClick="Update" Class="btn btn-primary" CausesValidation="false"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Canceler
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%-- La modal de bootstrap --%>
    <script>
                //popup pour show que c'est bien entré 
                //function ShowAjoutAdded() {
                //    $("#AtelierModal").modal('show');
                //}

                //donner une option s'il veut ajouter un autre ou afficher tout les ateliers

        $("tr").click(function () {
            if (this.getAttribute("class") == null && !$("#TheFormulaire").hasClass("active show")) {
                        //insertion de toute les informations qui sont modifiable
                        document.getElementById("txtAtelierTitle").value = $(this).children().eq(1).text();
                        document.getElementById("txtCampus").value = $(this).children().eq(2).text();
                        document.getElementById("txtSalle").value = $(this).children().eq(3).text();
                        document.getElementById("txtDate").value = $(this).children().eq(4).text();
                        document.getElementById("txtHeure").value = $(this).children().eq(5).text();
                        document.getElementById("txtHeureFin").value = $(this).children().eq(6).text();
                        document.getElementById("txteleveMax").value = $(this).children().eq(7).text();
                        document.getElementById("txtconferencier").value = $(this).children().eq(8).text();
                        document.getElementById("txtID").value = $(this).children().eq(0).text();
                        $("#UpdateAtelier").modal('show');
                    }
                });

                $("#clear").click(function (e) {

                    $("input[ToValidate]").each(function () {
                        $(this).val('');
                    });
                    $("textarea[ToValidate]").each(function () {
                        $(this).val('');
                    });
                    return false;

                });

                $(document).ready(function () {
                    //$("tbody").children().first().addClass("row-header");
                    $("td>a").click(function (e) {
                        e.stopPropagation();
                    });
                });
    </script>
</asp:Content>
