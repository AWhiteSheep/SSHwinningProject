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
using Inscription.Utils;


namespace Inscription
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        //string pour la connection à la base de données
        static string connStr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;

        public static AtelierDataDataContext AtelierDataContext = new AtelierDataDataContext(connStr);

        public static SqlConnection conn = new SqlConnection(connStr);

        private static List<string> activeTags = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            foreach (var tag in AtelierDataContext.Tags)
            {
                HtmlInputButton newButton = CreateTagButton(tag);
                pnButtons.Controls.Add(newButton);

            }

            PopulateList();
        }
        

        public void btnEnleverChoix_Click(object sender, EventArgs e)
        {

        }

        private void PopulateList()
        {
            upSlotForServerHead.ContentTemplateContainer.Controls.Clear();

            foreach (DonneesAtelier atelier in DataInterpretation.LookupTags(activeTags))
            {
                upSlotForServerHead.ContentTemplateContainer.Controls.Add(DataInterpretation.CreateInfoPanel(atelier));
            }
        }

        private HtmlInputButton CreateTagButton(Tags tag)
        {
            HtmlInputButton button = new HtmlInputButton()
            {
                Value = tag.Description
            };

            button.Name = "btn";

            button.Attributes.Add("class", "btn choix-tag");

            button.ServerClick += tagbtn_Click;

            

            return button;
        }

        private void tagbtn_Click(object sender, EventArgs e)
        {
            var button = (HtmlInputButton)sender;

            if (activeTags.Contains(button.Value))
            {
                activeTags.Remove(button.Value);
                button.Attributes["class"] = "btn choix-tag";
            }
            else
            {
                activeTags.Add(button.Value);

                button.Attributes["class"] = "btn choix-tag tag-active";
            }

            PopulateList();
        }
    }
}