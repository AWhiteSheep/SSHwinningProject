<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Calendrier.aspx.cs" Inherits="Inscription.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Calendrier.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Calendrier</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="display-1" style="text-align: center;">Calendrier</div>
    <%-- Source pour le calendrier flotant https://codepen.io/BradleyPJ/pen/LmpzNx --%>
    <!-- carouselExampleIndicators -->

    <div class="row justify-content-center" style="flex-wrap: unset;">
        <%-- recoit du serveur les activité dans des container --%>
        <div id="pageContainer" runat="server" class="row justify-content-center" style="flex-wrap: unset;"></div>
    </div>
    <!-- fin slider content -->


    <%-- boutton pour tout dérouler et pour monter vers le haut --%>
    <a class="goUp" style="position: fixed; bottom: 83px; right: 37px;"
        href="#">
        <div class="cl_add"
            style="background-color: #117a8b; color: white; transform: rotate(-90deg); padding: 8px 8px;">
            <i class="material-icons">arrow_forward</i>
        </div>
    </a>
    <%--    <div class="Magnifying" style="position:fixed;bottom:20px;right:30px;">
        <div class="cl_add" style="background-color:#117a8b;color:white;">
            <i class="fas fa-search-plus" style="vertical-align:middle;"></i>
        </div>
    </div>--%>
    <div style="height: 40px;"></div>
    <script>
        $(document).ready(function () {
            //$('.calendar_plan').click(function () {
            //    $(this).next('.calendar_events').toggleClass('collapse')
            //});
            ////lorsque le window size change l'événement se fait faire
            //$(window).resize(function () {
            //    //si le window est à la limite donné de collapse les calendars events pour que ce soit bien pour le mobil
            //    if ($(window).width() <= 1500) {
            //        $('.calendar_events').addClass('collapse');
            //    } else {
            //        $('.calendar_events').removeClass('collapse');
            //    }

            //}).resize();//Afin de vérifier au ready de la page

            //$('.Magnifying').click(function () {
            //    if ($(this).hasClass('activeMagnify')) {
            //        $('.calendar_events').addClass('collapse');
            //        $(this).removeClass('activeMagnify');
            //    }
            //    else {
            //        $('.calendar_events').removeClass('collapse');
            //        $(this).addClass('activeMagnify');
            //    }
            //});                                         
            //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            var numChild = $('.calendar_events').children().length;
            for (var i = 0; i < numChild; i++) {
                if (i % 2 == 0) {
                    $('.calendar_events').children(".event_item")[i].className += " event_item2";
                }
            }

        });


    </script>
</asp:Content>
