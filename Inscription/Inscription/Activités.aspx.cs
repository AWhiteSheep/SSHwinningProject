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

        private bool SearchInRun = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Crée un bouton pour chaque entrée dans la table Tags de notre database, et l'ajoute à la page.
            foreach (var tag in AtelierDataContext.Tags)
            {
                HtmlInputButton newButton = CreateTagButton(tag);

                if (newButton.Value == "Gabrielle-Roy" || newButton.Value == "Félix-Leclerc")
                {
                    pnCampusTags.Controls.Add(newButton);
                }

                else { pnTags.Controls.Add(newButton); }

            }

            PopulateList();

            Page.SaveStateComplete += RefreshButtons;
        }

        private void RefreshButtons(object sender, EventArgs e)
        {
            PopulateList();
        }

        public void btnEnleverChoix_Click(object sender, EventArgs e)
        {
            activeTags.Clear();

            foreach (var button in pnTags.Controls.OfType<HtmlInputButton>())
            {
                button.Attributes["class"] = "btn choix-tag";
            }

            PopulateList();
        }

        //Prend en charge le remplissage de la liste des ateliers.
        private void PopulateList()
        {
            upSlotForServerHead.ContentTemplateContainer.Controls.Clear();

            List<DonneesAteliers> results = new List<DonneesAteliers>();

            if (txtSearch.Text != "")
            {
                List<DonneesAteliers> TitleReturn = DataInterpretation.CheckForInTitle(txtSearch.Text);

                foreach (var item in TitleReturn)
                {
                    //add all with query in title
                    results.Add(item);
                }
            }
            else
            {
                SearchInRun = false;
            }

            results.AddRange(DataInterpretation.LookupTags(activeTags, SearchInRun));

            var orderedResults = results.OrderBy(atelier => atelier.dateDebut);

            foreach (DonneesAteliers atelier in orderedResults)
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
            SearchInRun = false;

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

        protected void ServerRecherche_Click(object sender, EventArgs e)
        {
            if(txtSearch.Text != "")
            {
                SearchInRun = true;
                PopulateList();
            }
            else
            {
                SearchInRun = false;
            }
        }
    }
}