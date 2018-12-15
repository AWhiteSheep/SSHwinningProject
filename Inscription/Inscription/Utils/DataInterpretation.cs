using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Data;
using System.Reflection;
using System.Linq.Expressions;
using System.ComponentModel;
using static Inscription.AtelierDataDataContext;
using System.Web.UI.HtmlControls;

namespace Inscription.Utils
{
    /// <summary>
    /// Classe utilitaire qui prend en charge les requêtes à la BD et la transformation des résultats en éléments HTML.
    /// </summary>
    public static class DataInterpretation
    {
        /// <summary>
        /// Crée un élément HTML qui sert de représentation brève d'un atelier.
        /// </summary>
        /// <param name="row">
        /// Un objet DonneesAtelier qui représente une rangée de la table DonneesAtelier
        /// </param>
        /// <returns>
        /// Un contrôle HTML Div prêt à être affiché.
        /// </returns>
        public static HtmlGenericControl CreateInfoPanel(DonneesAtelier row)
        {
            HtmlGenericControl panel = new HtmlGenericControl("div");

            panel.Attributes.Add("class", "info-panel");

            HtmlImage img = new HtmlImage
            {
                Src = row.posterPath
            };

            HtmlGenericControl title = new HtmlGenericControl("h2")
            {
                InnerText = row.contentTitle
            };

            HtmlGenericControl summary = new HtmlGenericControl("h3") { InnerText = row.sommaire};

            HtmlGenericControl data = new HtmlGenericControl("div")
            {
                InnerText = row.Conferencier + " | " + row.campus + " | " + row.Salle + " | " + row.dateDebut?.ToShortDateString() + " | "
                + row.dateDebut?.ToShortTimeString()
            };

            data.InnerText = data.InnerText.ToUpper();

            panel.Controls.Add(img);
            panel.Controls.Add(title);
            panel.Controls.Add(summary);
            panel.Controls.Add(data);

            return panel;
        }

        public static List<DonneesAtelier> LookupTags(List<string> tags)
        {
            List<DonneesAtelier> output = new List<DonneesAtelier>();
            AtelierDataDataContext context = new AtelierDataDataContext();

            if (tags.Count == 0)
            {
                output = context.DonneesAteliers.ToList();
            } 

            foreach(string tag in tags)
            {
                var queryResults = context.GetAllAteliersByTag(tag);

                foreach (var result in queryResults)
                {
                    output.Add(context.DonneesAteliers.Single(a => a.NumAtelier == result.NumAtelier));
                }
            }

            output = output.Distinct().ToList();

            return output;
        }
    }
}