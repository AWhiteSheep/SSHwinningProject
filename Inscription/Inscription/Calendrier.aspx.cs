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
            UploadFromServer();
        }

        void UploadFromServer()
        {
            //StartDate
            DateTime date = new DateTime(2019, 04, 20);

            int startDate = date.Date.DayOfYear;

            for (int i = 0; i < 5; i++)
            {
                DateTime dateToProcess = new DateTime(date.Date.Year, 1, 1).AddDays(startDate - 1);

                HtmlGenericControl calendar_fix = create_calendar_fix();

                var listAtelierJourne1 = context.DonneesAteliers.Where(e => e.dateDebut == dateToProcess).ToList();

                var divCalendar_Envent = CreateCalendar_Events();
                divCalendar_Envent.Controls.Add(new LiteralControl("<p class='ce_title'>Événement pour la journée</p>"));

                foreach (var _atelier in listAtelierJourne1)
                {
                    divCalendar_Envent.Controls.Add(Create_Event_Item(_atelier));
                }

                var Calendar_Plan = CreateCalendar_Plan(dateToProcess);

                var calendar_light = create_calendar_light();

                calendar_light.Controls.Add(Calendar_Plan);
                calendar_light.Controls.Add(divCalendar_Envent);

                calendar_fix.Controls.Add(calendar_light);


                pageContainer.Controls.Add(calendar_fix);

                startDate++;
            }

        }

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

        HtmlGenericControl CreateCalendar_Events()
        {
            HtmlGenericControl calendar_events = new HtmlGenericControl("div");

            calendar_events.Attributes.Add("class", "calendar_events");

            return calendar_events;
        }

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