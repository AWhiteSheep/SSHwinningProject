using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        static string connStr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;

        public static AtelierDataDataContext AtelierDataContext = new AtelierDataDataContext(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _BindAtelierAndStudent();
            }
        }

        private void _BindAtelierAndStudent()
        {
            try
            {
                int res = 0 ;
                if (HttpContext.Current.User.Identity.Name != "Admin")
                    int.TryParse(HttpContext.Current.User.Identity.Name, out res);
                else //Temporaire to do
                    res = 1473192;
               
                var Atelier = AtelierDataContext.GetAllAteliersByStudent(res).ToList();

                for (int i = 0; i < Atelier.Count; i++)
                {
                    HtmlGenericControl pushingDiv = new HtmlGenericControl("div");
                    pushingDiv.Attributes.Add("class", "activity-card");

                    HtmlGenericControl imageDiv = new HtmlGenericControl("div");
                    imageDiv.Attributes.Add("class", "image-box");

                    HtmlGenericControl img = new HtmlGenericControl("img");
                    img.Attributes.Add("src", Atelier[i].posterPath);

                    HtmlGenericControl h4 = new HtmlGenericControl("div");
                    h4.Attributes.Add("class", "h4");

                    h4.InnerHtml = Atelier[i].contentTitle;

                    HtmlGenericControl p = new HtmlGenericControl("p");
                    p.InnerHtml = Atelier[i].sommaire;

                    HtmlGenericControl span = new HtmlGenericControl("span");
                    span.Attributes.Add("style", "float:right;");

                    //to add in span
                    HtmlGenericControl bInscription = new HtmlGenericControl("button");
                    bInscription.Attributes.Add("class", "btn activity-btn-inscription");
                    bInscription.InnerHtml = "Inscription";

                    HtmlGenericControl aLink = new HtmlGenericControl("a");
                    aLink.Attributes.Add("class", "btn activity-btn-voir");
                    aLink.Attributes.Add("href", $"Ateliers.aspx?id={Atelier[i].NumAtelier.ToString()}");
                    aLink.InnerHtml = "Plus...";

                    span.Controls.Add(bInscription);
                    span.Controls.Add(aLink);

                    imageDiv.Controls.Add(img);
                    imageDiv.Controls.Add(h4);
                    imageDiv.Controls.Add(p);
                    imageDiv.Controls.Add(span);

                    pushingDiv.Controls.Add(imageDiv);

                    //pushFromServer += @"<div class='image-box'>
                    //                            <img src = 'Images/Histoire.jpg'/>
                    //                            <div class='h4'>L'éducation gratuite!</div>
                    //                            <p>Vous êtes convoqués à venir nous joindre à une superbe preésentation magistral pour une éducation accessible à tous!</p>
                    //                            <span style = 'float:right;' ><button class='btn activity-btn-inscription'>Inscription</button><a href = 'Ateliers.aspx' class='btn activity-btn-voir'>Plus...</a></span>
                    //                            </div>";

                    GridAtelierInscrit.Controls.Add(pushingDiv);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}