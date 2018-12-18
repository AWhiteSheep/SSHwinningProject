<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="AjoutAtelier.aspx.cs" Inherits="Inscription.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/AjoutAtelier.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('../Images/659444.jpg')
        }
        .nav>li>a {
             position: relative; 
             display: block; 
             padding: 10px 15px; 
             text-decoration: none;
        }
        .nav>li>a.active.show{
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }
        .nav-tabs>li.active.show>a:focus{
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }
        .nav-tabs>li>a:hover {
            cursor:pointer !important;
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }
        .container{
             padding-right: 0px !important; 
             padding-left: 0px !important; 
        }

        /*css pour table*/
        tr{
            border-radius: 7px;
            padding: 25px 30px;
            display: flex;
            justify-content: space-between;
            box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.1);
        }
        th{
            padding: 0 20px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            border: none;
            
        }
        td {
            padding: 0 20px;
            display: flex;
            padding: 10px 0;
            border: none;
        }
        td:before
        {
            color: #6C7A89;
            padding-right: 10px;
            content: attr(data-label);
            flex-basis: 50%;
            text-align: right;
        }
        
        .row-header{
            background-color: #094569ad;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        table{
            width:80%;
            border: none;
            margin: auto;
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
            <%-- La nav tabs controls --%>
            <ul class="nav nav-tabs container">
                <li><a data-toggle="tab" href="#FormulaireAtelier" class="active show">Ajouter un atelier</a></li>
                <li><a data-toggle="tab" href="#AtelierList">Les ateliers</a></li>
            </ul>
            <div class="tab-content">
                <%-- container pour le formulaire --%>
                <div id="FormulaireAtelier" class="container tab-pane fade in active show">
                    <div class="container-contact100">
                        <div class="wrap-contact100">
                            <div class="contact100-form validate-form">
                                <span class="contact100-form-title">Ajout Atelier</span>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txttitre" ID="ref_titre" runat="server" ErrorMessage="Le titre doit être entré" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer un nom d'atelier">
                                    <asp:TextBox ID="txttitre" runat="server" class="input100" type="text" name="titre" placeholder="Titre de l'atelier" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txt_Campus" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Le campus doit être entré" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer le campus">
                                    <asp:TextBox ID="txt_Campus" runat="server" class="input100" type="text" name="campus" placeholder="Campus" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txt_salle" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Le numéro de la salle doit être entré" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer la salle">
                                    <asp:TextBox ID="txt_salle" runat="server" class="input100" type="text" name="salle" placeholder="Numéro de salle" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_date" ID="RequiredFieldValidator3" runat="server" ErrorMessage="S'il vous plait entrer la date" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="txt_date" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Le format n'est pas le bon --> dd/mm/yyyy" ForeColor="Red" Display="Dynamic" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer la date">
                                    <asp:TextBox ID="txt_date" runat="server" class="input100" type="text" name="date" placeholder="Date" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_heure" ID="RequiredFieldValidator4" runat="server" ErrorMessage="S'il vous plait entrer l'heure" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_heure" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Le format n'est pas le bon --> 10:12" ForeColor="Red" ValidationExpression="^\d{1,2}:\d{2}$"></asp:RegularExpressionValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer l'heure">
                                    <asp:TextBox ID="txt_heure" runat="server" class="input100" type="text" name="heure" placeholder="Heure début" />
                                    <span class="focus-input100"></span>
                                </div>
                                <asp:RegularExpressionValidator ControlToValidate="txt_heure_fin" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Le format n'est pas le bon --> 10:12" ForeColor="Red" ValidationExpression="^\d{1,2}:\d{2}$"></asp:RegularExpressionValidator>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_heure_fin" ID="RequiredFieldValidator10" runat="server" ErrorMessage="S'il vous plait entrer l'heure de fin" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer l'heure de fin">
                                    <asp:TextBox ID="txt_heure_fin" runat="server" class="input100" type="text" name="heure" placeholder="Heure fin" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_elevemax" ID="RequiredFieldValidator5" runat="server" ErrorMessage="S'il vous plait entrer le nombre d'élève maximal" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_elevemax" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Le champ n'accepte que des chiffres" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer le nombre d'élève maximal">
                                    <asp:TextBox ID="txt_elevemax" runat="server" class="input100" type="text" name="elevemax" placeholder="Nombre élève maximal" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txt_conferencier" ID="RequiredFieldValidator6" runat="server" ErrorMessage="S'il vous plait entrer le nom du conférencier" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer le nom du conférencier">
                                    <asp:TextBox ID="txt_conferencier" runat="server" class="input100" type="text" name="conferencier" placeholder="Nom du conférencier" />
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Required field validator --%>
                                <asp:RequiredFieldValidator ControlToValidate="txt_Sommaire" ID="RequiredFieldValidator7" runat="server" ErrorMessage="S'il vous plait entrer un sommaire" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer un sommaire">
                                    <textarea id="txt_Sommaire" runat="server" class="input100" name="sommaire" placeholder="Sommaire"></textarea>
                                    <span class="focus-input100"></span>
                                </div>
                                <%-- Submit et si du côté serveur la page est valide de faire l'insertion dans la base de donnée --%>
                                <div class="container-contact100-form-btn">
                                    <button id="sumbit" runat="server" class="contact100-form-btn">
                                        <span>Ajouter
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- l'endroit avec la liste de tout les ateliers --%>
                <div id="AtelierList" class="container  tab-pane fade" style="background-color: rgba(242, 242, 242, .5);min-height: 81vh;">
                    <div id="PageTitle" class="display-4" style="text-align:center;padding: 26px;">Les ateliers</div>
                    <asp:GridView ID="gridViewAtelier" runat="server" AutoGenerateColumns="false" >  
                        <Columns>
                            <asp:BoundField DataField="contentTitle" HeaderText="Titre" ItemStyle-Width="150"/>  
                            <asp:BoundField DataField="campus" HeaderText="Campus" ItemStyle-Width="60" />  
                            <asp:BoundField DataField="Salle" HeaderText="Salle" ItemStyle-Width="60" />  
                            <asp:BoundField DataField="dateDebut" HeaderText="Date" ItemStyle-Width="20" />  
                            <asp:BoundField DataField="HeureDebut" HeaderText="Heure" ItemStyle-Width="20" />  
                            <asp:BoundField DataField="HeureFin" HeaderText="Heure fin" ItemStyle-Width="20" />  
                            <asp:BoundField DataField="Max_Eleves" HeaderText="Élève maximal" ItemStyle-Width="10" />  
                            <asp:BoundField DataField="Conferencier" HeaderText="Conférencier" ItemStyle-Width="50" />  
                            <asp:BoundField DataField="sommaire" HeaderText="Sommaire" ItemStyle-Width="150" />  
                        </Columns>
                    </asp:GridView>  
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%-- Panel pour option d'ajout d'un autre --%>

    <%-- La modal de bootstrap --%>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        //popup pour show que c'est bien entré 
        function ShowAjoutAdded() {
            $("#AtelierModal").modal("show");
        }
        //donner une option s'il veut ajouter un autre ou afficher tout les ateliers

        $(document).ready(function () {
            $("tbody").children().first().addClass("row-header");
        });
    </script>
</asp:Content>
