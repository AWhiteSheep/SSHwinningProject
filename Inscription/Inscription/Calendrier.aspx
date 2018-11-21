<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Calendrier.aspx.cs" Inherits="Inscription.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Calendrier.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="display-1" style="text-align:center;">Calendrier</div>
    <%-- Source pour le calendrier flotant https://codepen.io/BradleyPJ/pen/LmpzNx --%>
    <div class="row justify-content-center">
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
                    <div class="cl_add">
                       <%-- class de font awesome --%>
                      <i class="fas fa-plus"></i>
                    </div>
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
                    <div class="cl_add">
                       <%-- class de font awesome --%>
                      <i class="fas fa-plus"></i>
                    </div>
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
                    <div class="cl_add">
                       <%-- class de font awesome --%>
                      <i class="fas fa-plus"></i>
                    </div>
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
                    <div class="cl_add">
                       <%-- class de font awesome --%>
                      <i class="fas fa-plus"></i>
                    </div>
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
                    <div class="cl_add">
                       <%-- class de font awesome --%>
                      <i class="fas fa-plus"></i>
                    </div>
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
</asp:Content>
