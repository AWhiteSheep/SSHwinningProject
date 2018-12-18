﻿using System;
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
            //Crée un bouton pour chaque entrée dans la table Tags de notre database, et l'ajoute à la page.
            foreach (var tag in AtelierDataContext.Tags)
            {
                HtmlInputButton newButton = CreateTagButton(tag);

                pnButtons.Controls.Add(newButton);

            }

            PopulateList();
        }
        

        public void btnEnleverChoix_Click(object sender, EventArgs e)
        {
            activeTags.Clear();

            foreach (var button in pnButtons.Controls.OfType<HtmlInputButton>())
            {
                button.Attributes["class"] = "btn choix-tag";
            }

            PopulateList();
        }

        //Prend en charge le remplissage de la liste des ateliers.
        private void PopulateList()
        {
            upSlotForServerHead.ContentTemplateContainer.Controls.Clear();
            List<DonneesAtelier> results = DataInterpretation.LookupTags(activeTags);

            var orderedResults = results.OrderBy(atelier => atelier.contentTitle);

            foreach (DonneesAtelier atelier in orderedResults)
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