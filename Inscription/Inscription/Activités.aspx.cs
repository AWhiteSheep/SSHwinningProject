using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace Inscription
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        //string pour la connection à la base de données
        static string connStr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;

        public static AtelierDataDataContext AtelierDataContext = new AtelierDataDataContext(connStr);

        public static SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < AtelierDataContext.DonneesAteliers.ToList().Count && i < 5; i++)
            {

                var Atelier = AtelierDataContext.DonneesAteliers.ToList()[i];

                HtmlGenericControl pushingDiv = new HtmlGenericControl("div");
                pushingDiv.Attributes.Add("class", "activity-card");

                HtmlGenericControl imageDiv = new HtmlGenericControl("div");
                imageDiv.Attributes.Add("class", "image-box");

                HtmlGenericControl img = new HtmlGenericControl("img");
                img.Attributes.Add("src", Atelier.posterPath);

                HtmlGenericControl h4 = new HtmlGenericControl("div");
                h4.Attributes.Add("class", "h4");

                h4.InnerHtml = AtelierDataContext.DonneesAteliers.ToList()[i].contentTitle;

                HtmlGenericControl p = new HtmlGenericControl("p");
                p.InnerHtml = Atelier.sommaire;

                HtmlGenericControl span = new HtmlGenericControl("span");
                span.Attributes.Add("style", "float:right;");

                //to add in span
                HtmlGenericControl bInscription = new HtmlGenericControl("button");
                bInscription.Attributes.Add("class", "btn activity-btn-inscription");
                bInscription.InnerHtml = "Inscription";

                HtmlGenericControl aLink = new HtmlGenericControl("a");
                aLink.Attributes.Add("class", "btn activity-btn-voir");
                aLink.Attributes.Add("href", "Ateliers.aspx");
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

                upSlotForServerHead.ContentTemplateContainer.Controls.Add(pushingDiv);
            }
            
        }

        static List<int> AllAtelierID = new List<int>();
        List<Button> TagSelected = new List<Button>();

        public void btnChoixTags_Click(object sender, EventArgs e)
        {



            Button theButton = (sender as Button);
            theButton.Attributes.Add("style", "background-color:red");
            TagSelected.Add(theButton);



            upSlotForServerHead.ContentTemplateContainer.Controls.Clear();

            var AllAtelier = AtelierDataContext.GetAllAteliersByTag(theButton.Text).ToList();

            for (int i = 0; i < AllAtelier.Count; i++)
            {
                
                int atelierID = (int)AllAtelier[i].NumAtelier;

                if (!AllAtelierID.Contains(atelierID))
                    AllAtelierID.Add(atelierID);

            }


            var AtelierWithTag = AtelierDataContext.DonneesAteliers.Where(o => AllAtelierID.Contains(o.NumAtelier));
                      

            for (int i = 0; i < AtelierWithTag.ToList().Count && i < 5; i++)
            {

                var Atelier = AtelierWithTag.ToList()[i];

                HtmlGenericControl pushingDiv = new HtmlGenericControl("div");
                pushingDiv.Attributes.Add("class", "activity-card");

                HtmlGenericControl imageDiv = new HtmlGenericControl("div");
                imageDiv.Attributes.Add("class", "image-box");

                HtmlGenericControl img = new HtmlGenericControl("img");
                img.Attributes.Add("src", Atelier.posterPath);

                HtmlGenericControl h4 = new HtmlGenericControl("div");
                h4.Attributes.Add("class", "h4");

                h4.InnerHtml = Atelier.contentTitle;

                HtmlGenericControl p = new HtmlGenericControl("p");
                p.InnerHtml = Atelier.sommaire;

                HtmlGenericControl span = new HtmlGenericControl("span");
                span.Attributes.Add("style", "float:right;");

                //to add in span
                HtmlGenericControl bInscription = new HtmlGenericControl("button");
                bInscription.Attributes.Add("class", "btn activity-btn-inscription");
                bInscription.InnerHtml = "Inscription";

                HtmlGenericControl aLink = new HtmlGenericControl("a");
                aLink.Attributes.Add("class", "btn activity-btn-voir");
                aLink.Attributes.Add("href", "Ateliers.aspx");
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

                upSlotForServerHead.ContentTemplateContainer.Controls.Add(pushingDiv);
            }

            
        }

        public void btnEnleverChoix_Click(object sender, EventArgs e)
        {

        }


    }
}