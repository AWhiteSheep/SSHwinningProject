<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="AjoutAtelier.aspx.cs" Inherits="Inscription.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/AjoutAtelier.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('../Images/659444.jpg')
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
            <div class="container">
                <div class="container-contact100">

                    <div class="wrap-contact100">
                        <div class="contact100-form validate-form">
                            <span class="contact100-form-title">Ajout Atelier
                            </span>
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
                            <asp:RequiredFieldValidator ControlToValidate="txt_date" ID="RequiredFieldValidator3" runat="server" ErrorMessage="S'il vous plait entrer la date" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ControlToValidate="txt_date" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Le format n'est pas le bon --> 12/30/2002" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$"></asp:RegularExpressionValidator>
                            <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer la date">
                                <asp:TextBox ID="txt_date" runat="server" class="input100" type="text" name="date" placeholder="Date" />
                                <span class="focus-input100"></span>
                            </div>
                            <%-- Required field validator --%>
                            <asp:RequiredFieldValidator ControlToValidate="txt_heure" ID="RequiredFieldValidator4" runat="server" ErrorMessage="S'il vous plait entrer l'heure" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ControlToValidate="txt_heure" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Le format n'est pas le bon --> 10:12:34" ForeColor="Red" ValidationExpression="^\s*-?(\d*\.)?([0-2])?[0-9]:([0-5])?[0-9]:([0-5])?[0-9](\.[0-9]{1,7})?\s*$"></asp:RegularExpressionValidator>
                            <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer l'heure">
                                <asp:TextBox ID="txt_heure" runat="server" class="input100" type="text" name="heure" placeholder="Heure début" />
                                <span class="focus-input100"></span>
                            </div>
                            <asp:RegularExpressionValidator ControlToValidate="txt_heure_fin" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Le format n'est pas le bon --> 10:12:34" ForeColor="Red" ValidationExpression="^\s*-?(\d*\.)?([0-2])?[0-9]:([0-5])?[0-9]:([0-5])?[0-9](\.[0-9]{1,7})?\s*$"></asp:RegularExpressionValidator>
                            <%-- Required field validator --%>
                            <asp:RequiredFieldValidator ControlToValidate="txt_heure_fin" ID="RequiredFieldValidator10" runat="server" ErrorMessage="S'il vous plait entrer l'heure de fin" ForeColor="Red"></asp:RequiredFieldValidator>
                            <div class="wrap-input100 validate-input" data-validate="S'il vous plait entrer l'heure de fin">
                                <asp:TextBox ID="txt_heure_fin" runat="server" class="input100" type="text" name="heure" placeholder="Heure fin" />
                                <span class="focus-input100"></span>
                            </div>
                            <%-- Required field validator --%>
                            <asp:RequiredFieldValidator ControlToValidate="txt_elevemax" ID="RequiredFieldValidator5" runat="server" ErrorMessage="S'il vous plait entrer le nombre d'élève maximal" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ControlToValidate="txt_elevemax" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Le champ n'accepte que des chiffres" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
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
                                <button ID="sumbit" runat="server" class="contact100-form-btn">
                                    <span>Ajouter
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
