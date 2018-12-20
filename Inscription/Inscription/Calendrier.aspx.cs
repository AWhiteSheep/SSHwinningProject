using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        AtelierDataDataContext context = new AtelierDataDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Au load updater le calendrier
            if(!IsPostBack)
                UploadFromServer();
        }

        void UploadFromServer()
        {
            //StartDate un date qui sera donné par la collaboratrice
            DateTime date = new DateTime(2019, 04, 20);

            //définition de la date de début
            int startDate = date.Date.DayOfYear;
            //boucle pour afficher 5 nouveaux calendrier
            for (int i = 0; i < 5; i++)
            {
                //Définni la date qui doit être process dans la base de donné
                DateTime dateToProcess = new DateTime(date.Date.Year, 1, 1).AddDays(startDate - 1);

                //Crée le container pour chaque jour de la semaine
                HtmlGenericControl calendar_fix = create_calendar_fix();
                //liste toute lesAtelier pour la journée 
                var listAtelierJourne1 = context.DonneesAteliers.Where(e => e.dateDebut == dateToProcess).ToList().OrderBy(e => e.dateDebut);

                //cré uncontainer pour les activités de la journé donné
                var divCalendar_Envent = CreateCalendar_Events();
                divCalendar_Envent.Controls.Add(new LiteralControl("<p class='ce_title'>Événement pour la journée</p>"));

                //pour chaque atelier dans la liste retourné pusher un nouveau event item avec l'atelier en question en paramètre
                foreach (var _atelier in listAtelierJourne1)
                {
                    divCalendar_Envent.Controls.Add(Create_Event_Item(_atelier));
                }

                //crée le plan de journé en haut 
                var Calendar_Plan = CreateCalendar_Plan(dateToProcess);

                var calendar_light = create_calendar_light();

                calendar_light.Controls.Add(Calendar_Plan);
                calendar_light.Controls.Add(divCalendar_Envent);

                calendar_fix.Controls.Add(calendar_light);


                pageContainer.Controls.Add(calendar_fix);

                startDate++;
            }

        }
        //cré la box qui fix la grandeur du calendrier dans page
        HtmlGenericControl create_calendar_fix()
        {
            HtmlGenericControl calendar_fix = new HtmlGenericControl("div");

            calendar_fix.Attributes.Add("class", "calendar-fix");

            return calendar_fix;
        }

       //& insert in Calendar event
        HtmlGenericControl create_calendar_light()
        {
            HtmlGenericControl calendar_light = new HtmlGenericControl("div");

            calendar_light.Attributes.Add("class", "calendar light");

            return calendar_light;
        }
        //création d'un événement selon l'atelier donné
        HtmlGenericControl Create_Event_Item(DonneesAteliers _atelier)
        {
            HtmlGenericControl event_item = new HtmlGenericControl("div");
            event_item.Attributes.Add("class", "event_item");
            HtmlGenericControl ei_Title = new HtmlGenericControl("div");
            ei_Title.Attributes.Add("class", "ei_Title");
            ei_Title.InnerText = _atelier.contentTitle;
            HtmlGenericControl ei_Copy = new HtmlGenericControl("div");
            ei_Copy.Attributes.Add("class", "ei_Copy");
            ei_Copy.InnerText = _atelier.HeureDebut?.ToString("hh\\:mm");

            event_item.Controls.Add(ei_Title);
            event_item.Controls.Add(ei_Copy);

            return event_item;
        }
        //Crée la balise d'évéenemt pour recevoir les event_item
        HtmlGenericControl CreateCalendar_Events()
        {
            HtmlGenericControl calendar_events = new HtmlGenericControl("div");

            calendar_events.Attributes.Add("class", "calendar_events");

            return calendar_events;
        }
        //crée le message en haut de chaque jour 
        HtmlGenericControl CreateCalendar_Plan(DateTime date)
        {
            HtmlGenericControl calendar_plan = new HtmlGenericControl("div");

            calendar_plan.Attributes.Add("class", "calendar_plan");

            HtmlGenericControl cl_title = new HtmlGenericControl("div");

            cl_title.Attributes.Add("class", "cl_title");

            calendar_plan.Controls.Add(cl_title);

            HtmlGenericControl cl_copy = new HtmlGenericControl("div");

            cl_copy.Attributes.Add("class", "cl_copy");

            cl_copy.InnerHtml = date.ToShortDateString();

            calendar_plan.Controls.Add(cl_copy);            


            return calendar_plan;
        }
    }
}