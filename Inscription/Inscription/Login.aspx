<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Inscription.Connexion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <meta http-equiv="Content-Type" content="width=device-width, initial-scale=1.0;text/html; charset=utf-8"/>--%>
    <%-- Section Link --%>
    <%-- css pour cette master --%>
    <link rel="stylesheet" href="Content/Inscription.Master.css" />

    <link rel="stylesheet" href="Content/bootstrap.css" />

    <link rel="stylesheet" href="Content/Connexion.css" />

    <%-- For special fonts --%>
    <link href='https://fonts.googleapis.com/css?family=Adamina' rel='stylesheet'>

    <%-- font pour les icons --%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    
    

    <%-- Scripts for bootstrap --%>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <title>Se Connecter</title>
</head>
<body class="login-body">
    <form id="frmCnx" runat="server">
        <div class="container login-container">
            <div class="row">
                <div class="col-md"></div>
                <div class="col-md-8">
                    <div class="card login-card">
                        <div class="card-title login-title">
                            Pour vous inscrire aux ateliers, veuillez entrer votre numéro d'étudiant et votre mot de passe Omnivox
                        </div>
                        <div class="card-body">
                            <img src="Images/logo.PNG" class="img-fluid login-img" />
                            <div class="container-fluid">
                                <asp:Login ID="login" runat="server" CssClass="login-input">

                                    <%--    !! Ne pas changer les ID. Elles sont nécéssaires au fonctionnement du contrôle Login !!
                                            LayoutTemplate personnalise le contrôle Login--%>

                                    <LayoutTemplate>
                                        <div class="form-group">
                                            <asp:TextBox ID="UserName" CssClass="form-control" placeholder="Numéro Étudiant" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="Password" CssClass="form-control" placeholder="Mot de passe Omnivox" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div><asp:CheckBox ID="RememberMe" Text="Rester Connecté" runat="server" CssClass="form-check" /></div>
                                        <div><asp:Button ID="Login" runat="server" Text="Connexion" CssClass="btn btn-dark" /></div>
                                        <div><asp:Label ID="FailureText" runat="server" Text="" CssClass="form-text"></asp:Label></div>
                                    </LayoutTemplate>
                                </asp:Login>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md"></div>
            </div>
        </div>
    </form>
</body>
</html>
