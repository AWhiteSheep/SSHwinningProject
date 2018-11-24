<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Contactez.aspx.cs" Inherits="Inscription.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="Scripts/formValidation.js"></script>
    <title>Contactez-Nous</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
        <div class="content-area" style="padding-top:10px;">
        <div class="container">
            <span class="h1 titre-contacter">
                Contactez nous
                <br />
            </span>
            <p>
                <strong>Questions? Pas certain pour quelque chose?</strong><br />
                On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle
            </p>
            <hr />
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <strong>Question pour branche programmation et sécurité?</strong><br />
                    <i class="material-icons" style="vertical-align:middle;">
                        local_phone
                    </i> <i>Contactez : </i>Sylvain Lacroix (888)999-7585<br />
                    <i class="material-icons" style="vertical-align:middle;">question_answer</i>
                    <i>Sinon par email? : </i>example@domain.xx
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <strong>Question pour branche réseau et cybersécurité?</strong><br />
                    <i class="material-icons" style="vertical-align:middle;">
                        local_phone
                    </i> <i>Contactez : </i>Jack Thomas (888)989-7585<br />
                    <i class="material-icons" style="vertical-align:middle;">question_answer</i>
                    <i>Sinon par email? : </i>example@domain.xx
                </div>
            </div>
            <hr />
            <span class="h3">
                Des Questions Générales?
            </span>
            <br /><br />
            <form id="contactForm" class="form">
                <div class="form-row">
                    <div class="form-group col-4">
                        <label class="form-text float-left">Nom</label>
                        <label class="form-text error-message float-right"></label>
                        <input type="text" class="form-control must-validate" aria-describedby="nameHelp" />
                        <small id="nameHelp" class="form-text text-muted">Nom et prénom doivent commencer par une majuscule</small>
                    </div>
                    <div class="form-group col-4">
                        <label class="form-text float-left">E-mail</label>
                        <label class="form-text error-message float-right"></label>
                        <input type="text" class="form-control must-validate" placeholder="name@domain.ext" />
                    </div>
                    <div class="form-group col-4">
                        <label class="form-text float-left">Téléphone</label>
                        <label class="form-text error-message float-right"></label>
                        <input type="text" class="form-control must-validate" placeholder="(123)456-7890" />
                    </div>
                </div>
                <div class="form-group" id="subject">
                    <label class="form-text float-left">Sujet</label>
                    <label class="form-text error-message float-right" id="subjectError"></label>
                    <input type="text" class="form-control must-validate" aria-describedby="subjectHelp" onkeypress="enforceMaxChars(event, 30)"
                           oninput="displayCharacterLimit(event, 30)" />
                    <small id="subjectHelp" class="form-text text-muted">30 caractères maximum</small>
                </div>
                <div class="form-group" id="message">
                    <label class="form-text float-left">Message</label>
                    <label class="form-text error-message float-right" id="messageError"></label>
                    <textarea class="form-control must-validate" aria-describedby="messageHelp" onkeypress="enforceMaxChars(event, 130)"
                              oninput="displayCharacterLimit(event, 130)"></textarea>
                    <small id="messageHelp" class="form-text text-muted">130 caractères maximum</small>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <button class="btn btn-primary" onclick="validateForm(); return false;">Envoyer</button>
                        <button class="btn btn-secondary" id="reset">Réinitialiser</button>
                        <label class=" form-text error-message"></label>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
