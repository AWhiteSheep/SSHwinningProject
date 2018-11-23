<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Calendrier.aspx.cs" Inherits="Inscription.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Calendrier.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Calendrier</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="display-1" style="text-align:center;">Calendrier</div>
    <%-- Source pour le calendrier flotant https://codepen.io/BradleyPJ/pen/LmpzNx --%>
            <!-- carouselExampleIndicators -->
        <div id="slider_content" class="carousel slide" data-ride="carousel" data-interval="false">
            <ol class="carousel-indicators">
                <li data-target="#slider_content" data-slide-to="0" class="active"></li>
                <li data-target="#slider_content" data-slide-to="1"></li>
                <li data-target="#slider_content" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <%-- ------------------------------------------------------------------ --%>
                                <%-- Calendrier de Gabrielle-Roy --%>
                    <%-- ------------------------------------------------------------------ --%>
                    <div class="h1" style="margin-left:10%;">Gabrielle-Roy</div>
                    <div class="row justify-content-center" style="padding-right: 50px;">
        <%-- Calendrier 1 --%>
        <div class="col-md-2 calendar-fix">
            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
            <div class="calendar light">
                <%--<div class="calendar_header">
                  <h1 class = "header_title">Journée 1</h1>
                  <p class="header_copy"> Plan de la journée</p>
                </div>--%>
                <div class="calendar_plan">
                  <div class="cl_plan">
                    <div class="cl_title">Journée 1</div>
                    <div class="cl_copy">20 Avril 2019</div>
<%--                    <div class="cl_add">
                       <%-- class de font awesome --%>
<%--                      <i class="fas fa-plus"></i>
                    </div>--%>
                    <div class="cl_derouler">Dérouler</div>
                  </div>
                </div>
                <div class="calendar_events">
                  <p class="ce_title">Événement pour la journée</p>
                   <%-- ---------------------------------------------- --%>
                  <div class="event_item">
                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                    <div class="ei_Dot dot_active"></div>
                    <div class="ei_Title">10:30 am</div>
                    <div class="ei_Copy">La science neurologique</div>
                  </div>
                   <%-- ---------------------------------------------- --%>

                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">12:00 pm</div>
                    <div class="ei_Copy">La biologie comme tel</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">13:00 pm</div>
                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">14:30 am</div>
                    <div class="ei_Copy">Penser comme son prochain</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">15:30 am</div>
                    <div class="ei_Copy">Baque de sable</div>
                  </div>
                </div>
              </div>
        </div>
        <%-- Fin du calendrier--%>
        <%-- Calendrier 1 --%>
        <div class="col-md-2 calendar-fix">
            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
            <div class="calendar light">
                <%--<div class="calendar_header">
                  <h1 class = "header_title">Journée 1</h1>
                  <p class="header_copy"> Plan de la journée</p>
                </div>--%>
                <div class="calendar_plan">
                  <div class="cl_plan">
                    <div class="cl_title">Journée 1</div>
                    <div class="cl_copy">20 Avril 2019</div>
                     <div class="cl_derouler">Dérouler</div>
                  </div>
                </div>
                <div class="calendar_events">
                  <p class="ce_title">Événement pour la journée</p>
                  <div class="event_item">
                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                    <div class="ei_Dot dot_active"></div>
                    <div class="ei_Title">10:30 am</div>
                    <div class="ei_Copy">La science neurologique</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">12:00 pm</div>
                    <div class="ei_Copy">La biologie comme tel</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">13:00 pm</div>
                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">14:30 am</div>
                    <div class="ei_Copy">Penser comme son prochain</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">15:30 am</div>
                    <div class="ei_Copy">Baque de sable</div>
                  </div>
                </div>
              </div>
        </div>
        <%-- Fin du calendrier--%>
        <%-- Calendrier 1 --%>
        <div class="col-md-2 calendar-fix">
            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
            <div class="calendar light">
                <%--<div class="calendar_header">
                  <h1 class = "header_title">Journée 1</h1>
                  <p class="header_copy"> Plan de la journée</p>
                </div>--%>
                <div class="calendar_plan">
                  <div class="cl_plan">
                    <div class="cl_title">Journée 1</div>
                    <div class="cl_copy">20 Avril 2019</div>
                      <div class="cl_derouler">Dérouler</div>
                  </div>
                </div>
                <div class="calendar_events">
                  <p class="ce_title">Événement pour la journée</p>
                  <div class="event_item">
                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                    <div class="ei_Dot dot_active"></div>
                    <div class="ei_Title">10:30 am</div>
                    <div class="ei_Copy">La science neurologique</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">12:00 pm</div>
                    <div class="ei_Copy">La biologie comme tel</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">13:00 pm</div>
                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">14:30 am</div>
                    <div class="ei_Copy">Penser comme son prochain</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">15:30 am</div>
                    <div class="ei_Copy">Baque de sable</div>
                  </div>
                </div>
              </div>
        </div>
        <%-- Fin du calendrier--%>
        <%-- Calendrier 1 --%>
        <div class="col-md-2 calendar-fix">
            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
            <div class="calendar light">
                <%--<div class="calendar_header">
                  <h1 class = "header_title">Journée 1</h1>
                  <p class="header_copy"> Plan de la journée</p>
                </div>--%>
                <div class="calendar_plan">
                  <div class="cl_plan">
                    <div class="cl_title">Journée 1</div>
                    <div class="cl_copy">20 Avril 2019</div>
                      <div class="cl_derouler">Dérouler</div>
                  </div>
                </div>
                <div class="calendar_events">
                  <p class="ce_title">Événement pour la journée</p>
                  <div class="event_item">
                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                    <div class="ei_Dot dot_active"></div>
                    <div class="ei_Title">10:30 am</div>
                    <div class="ei_Copy">La science neurologique</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">12:00 pm</div>
                    <div class="ei_Copy">La biologie comme tel</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">13:00 pm</div>
                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">14:30 am</div>
                    <div class="ei_Copy">Penser comme son prochain</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">15:30 am</div>
                    <div class="ei_Copy">Baque de sable</div>
                  </div>
                </div>
              </div>
        </div>
        <%-- Fin du calendrier--%>
        <%-- Calendrier 1 --%>
        <div class="col-md-2 calendar-fix">
            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
            <div class="calendar light">
                <%--<div class="calendar_header">
                  <h1 class = "header_title">Journée 1</h1>
                  <p class="header_copy"> Plan de la journée</p>
                </div>--%>
                <div class="calendar_plan">
                  <div class="cl_plan">
                    <div class="cl_title">Journée 1</div>
                    <div class="cl_copy">20 Avril 2019</div>
                      <div class="cl_derouler">Dérouler</div>
                  </div>
                </div>
                <div class="calendar_events">
                  <p class="ce_title">Événement pour la journée</p>
                  <div class="event_item">
                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                    <div class="ei_Dot dot_active"></div>
                    <div class="ei_Title">10:30 am</div>
                    <div class="ei_Copy">La science neurologique</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">12:00 pm</div>
                    <div class="ei_Copy">La biologie comme tel</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">13:00 pm</div>
                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">14:30 am</div>
                    <div class="ei_Copy">Penser comme son prochain</div>
                  </div>
                  <div class="event_item">
                    <div class="ei_Dot"></div>
                    <div class="ei_Title">15:30 am</div>
                    <div class="ei_Copy">Baque de sable</div>
                  </div>
                </div>
              </div>
        </div>
        <%-- Fin du calendrier--%>
    </div>
                </div>
                <div class="carousel-item">
                    <%-- ------------------------------------------------------------------ --%>
                                <%-- Calendrier de Felix leclerc --%>
                    <%-- ------------------------------------------------------------------ --%>
                    <div class="h1" style="margin-left:10%;">Félix Leclerc</div>
                    <div class="row justify-content-center" style="padding-right: 50px;">
                        <%-- Calendrier 1 --%>
                        <div class="col-md-2 calendar-fix">
                            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
                            <div class="calendar light">
                                <%--<div class="calendar_header">
                                  <h1 class = "header_title">Journée 1</h1>
                                  <p class="header_copy"> Plan de la journée</p>
                                </div>--%>
                                <div class="calendar_plan">
                                  <div class="cl_plan">
                                    <div class="cl_title">Journée 1</div>
                                    <div class="cl_copy">20 Avril 2019</div>
                <%--                    <div class="cl_add">
                                       <%-- class de font awesome --%>
                <%--                      <i class="fas fa-plus"></i>
                                    </div>--%>
                                    <div class="cl_derouler">Dérouler</div>
                                  </div>
                                </div>
                                <div class="calendar_events">
                                  <p class="ce_title">Événement pour la journée</p>
                                   <%-- ---------------------------------------------- --%>
                                  <div class="event_item">
                                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                                    <div class="ei_Dot dot_active"></div>
                                    <div class="ei_Title">10:30 am</div>
                                    <div class="ei_Copy">La science neurologique</div>
                                  </div>
                                   <%-- ---------------------------------------------- --%>

                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">12:00 pm</div>
                                    <div class="ei_Copy">La biologie comme tel</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">13:00 pm</div>
                                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">14:30 am</div>
                                    <div class="ei_Copy">Penser comme son prochain</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">15:30 am</div>
                                    <div class="ei_Copy">Baque de sable</div>
                                  </div>
                                </div>
                              </div>
                        </div>
                        <%-- Fin du calendrier--%>
                        <%-- Calendrier 1 --%>
                        <div class="col-md-2 calendar-fix">
                            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
                            <div class="calendar light">
                                <%--<div class="calendar_header">
                                  <h1 class = "header_title">Journée 1</h1>
                                  <p class="header_copy"> Plan de la journée</p>
                                </div>--%>
                                <div class="calendar_plan">
                                  <div class="cl_plan">
                                    <div class="cl_title">Journée 1</div>
                                    <div class="cl_copy">20 Avril 2019</div>
                                     <div class="cl_derouler">Dérouler</div>
                                  </div>
                                </div>
                                <div class="calendar_events">
                                  <p class="ce_title">Événement pour la journée</p>
                                  <div class="event_item">
                                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                                    <div class="ei_Dot dot_active"></div>
                                    <div class="ei_Title">10:30 am</div>
                                    <div class="ei_Copy">La science neurologique</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">12:00 pm</div>
                                    <div class="ei_Copy">La biologie comme tel</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">13:00 pm</div>
                                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">14:30 am</div>
                                    <div class="ei_Copy">Penser comme son prochain</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">15:30 am</div>
                                    <div class="ei_Copy">Baque de sable</div>
                                  </div>
                                </div>
                              </div>
                        </div>
                        <%-- Fin du calendrier--%>
                        <%-- Calendrier 1 --%>
                        <div class="col-md-2 calendar-fix">
                            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
                            <div class="calendar light">
                                <%--<div class="calendar_header">
                                  <h1 class = "header_title">Journée 1</h1>
                                  <p class="header_copy"> Plan de la journée</p>
                                </div>--%>
                                <div class="calendar_plan">
                                  <div class="cl_plan">
                                    <div class="cl_title">Journée 1</div>
                                    <div class="cl_copy">20 Avril 2019</div>
                                      <div class="cl_derouler">Dérouler</div>
                                  </div>
                                </div>
                                <div class="calendar_events">
                                  <p class="ce_title">Événement pour la journée</p>
                                  <div class="event_item">
                                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                                    <div class="ei_Dot dot_active"></div>
                                    <div class="ei_Title">10:30 am</div>
                                    <div class="ei_Copy">La science neurologique</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">12:00 pm</div>
                                    <div class="ei_Copy">La biologie comme tel</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">13:00 pm</div>
                                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">14:30 am</div>
                                    <div class="ei_Copy">Penser comme son prochain</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">15:30 am</div>
                                    <div class="ei_Copy">Baque de sable</div>
                                  </div>
                                </div>
                              </div>
                        </div>
                        <%-- Fin du calendrier--%>
                        <%-- Calendrier 1 --%>
                        <div class="col-md-2 calendar-fix">
                            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
                            <div class="calendar light">
                                <%--<div class="calendar_header">
                                  <h1 class = "header_title">Journée 1</h1>
                                  <p class="header_copy"> Plan de la journée</p>
                                </div>--%>
                                <div class="calendar_plan">
                                  <div class="cl_plan">
                                    <div class="cl_title">Journée 1</div>
                                    <div class="cl_copy">20 Avril 2019</div>
                                      <div class="cl_derouler">Dérouler</div>
                                  </div>
                                </div>
                                <div class="calendar_events">
                                  <p class="ce_title">Événement pour la journée</p>
                                  <div class="event_item">
                                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                                    <div class="ei_Dot dot_active"></div>
                                    <div class="ei_Title">10:30 am</div>
                                    <div class="ei_Copy">La science neurologique</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">12:00 pm</div>
                                    <div class="ei_Copy">La biologie comme tel</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">13:00 pm</div>
                                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">14:30 am</div>
                                    <div class="ei_Copy">Penser comme son prochain</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">15:30 am</div>
                                    <div class="ei_Copy">Baque de sable</div>
                                  </div>
                                </div>
                              </div>
                        </div>
                        <%-- Fin du calendrier--%>
                        <%-- Calendrier 1 --%>
                        <div class="col-md-2 calendar-fix">
                            <%-- un box shadow sert à faire un distinciation avec les autres cadre --%>
                            <div class="calendar light">
                                <%--<div class="calendar_header">
                                  <h1 class = "header_title">Journée 1</h1>
                                  <p class="header_copy"> Plan de la journée</p>
                                </div>--%>
                                <div class="calendar_plan">
                                  <div class="cl_plan">
                                    <div class="cl_title">Journée 1</div>
                                    <div class="cl_copy">20 Avril 2019</div>
                                      <div class="cl_derouler">Dérouler</div>
                                  </div>
                                </div>
                                <div class="calendar_events">
                                  <p class="ce_title">Événement pour la journée</p>
                                  <div class="event_item">
                                    <%-- Selon le border radius on round les côtés pour que ca ressemble a un disque --%>
                                    <div class="ei_Dot dot_active"></div>
                                    <div class="ei_Title">10:30 am</div>
                                    <div class="ei_Copy">La science neurologique</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">12:00 pm</div>
                                    <div class="ei_Copy">La biologie comme tel</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">13:00 pm</div>
                                    <div class="ei_Copy">L'être humain <br> @Iinvité spécial</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">14:30 am</div>
                                    <div class="ei_Copy">Penser comme son prochain</div>
                                  </div>
                                  <div class="event_item">
                                    <div class="ei_Dot"></div>
                                    <div class="ei_Title">15:30 am</div>
                                    <div class="ei_Copy">Baque de sable</div>
                                  </div>
                                </div>
                              </div>
                        </div>
                        <%-- Fin du calendrier--%>
                    </div>
                </div>
        </div>
            <%-- Boutton afin de selectionner quelle campus on devrait afficher --%>
        <div class="bouton-control-slider">
            <a class="slider_precedent" href="#slider_content" role="button" data-slide="prev" 
                style="position:fixed; top:50%;left:10px;margin:auto !important;">
                <div class="cl_add" style="background-color:#6c757d;padding: 9px 9px;">
                    <i class="material-icons">arrow_back</i>    
                </div>
            </a>
            <a class="slider_suivant" href="#slider_content" role="button" data-slide="next" 
                style="position:fixed;top:50%;right:10px;">
                <div class="cl_add" style="background-color:#6c757d;padding: 9px 9px;">
                    <i class="material-icons">arrow_forward</i>
                </div>
            </a>
        </div>
        </div>
        <!-- fin slider content -->


    <%-- boutton pour tout dérouler et pour monter vers le haut --%>
    <a class="goUp" style="position:fixed;bottom:20px;right: 77px;" href="#">
        <div class="cl_add" 
            style="background-color:#117a8b;color:white;transform:rotate(-90deg);padding: 8px 8px;">
            <i class="material-icons">arrow_forward</i>
        </div>
    </a>
    <div class="Magnifying" style="position:fixed;bottom:20px;right:30px;">
        <div class="cl_add" style="background-color:#117a8b;color:white;">
            <i class="fas fa-search-plus" style="vertical-align:middle;"></i>
        </div>
    </div>
    <div style="height:40px;"></div>

    <script>
        $(document).ready(function () {
            $('.calendar_plan').click(function () {
                $(this).next('.calendar_events').toggleClass('collapse')
            });
            //lorsque le window size change l'événement se fait faire
            $(window).resize(function () {
                //si le window est à la limite donné de collapse les calendars events pour que ce soit bien pour le mobil
                if ($(window).width() <= 1500) {
                    $('.calendar_events').addClass('collapse');
                } else {
                    $('.calendar_events').removeClass('collapse');
                }

            }).resize();//Afin de vérifier au ready de la page

            $('.Magnifying').click(function () {
                if ($(this).hasClass('activeMagnify')) {
                    $('.calendar_events').addClass('collapse');
                    $(this).removeClass('activeMagnify');
                }
                else {
                    $('.calendar_events').removeClass('collapse');
                    $(this).addClass('activeMagnify');
                }
            });                                         
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
