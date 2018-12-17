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
using System.Security.Cryptography;
using System.Text;

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

            img.Attributes.Add("class", "align-self-start mr-3 img-thumbnail");

            HtmlGenericControl body = new HtmlGenericControl("div");

            body.Attributes.Add("class", "media-body");

            HtmlGenericControl title = new HtmlGenericControl("h4")
            {
                InnerText = row.contentTitle
            };

            title.Attributes.Add("class", "mt-0");

            HtmlGenericControl summary = new HtmlGenericControl("h5") { InnerText = row.sommaire};

            HtmlGenericControl data = new HtmlGenericControl("p")
            {
                InnerText = row.Conferencier + " | " + row.campus + " | " + row.Salle + " | " + row.dateDebut?.ToShortDateString() + " | "
                + row.dateDebut?.ToShortTimeString()
            };

            data.Attributes.Add("class", "mb-0");

            data.InnerText = data.InnerText.ToUpper();

            panel.Controls.Add(img);

            body.Controls.Add(title);
            body.Controls.Add(summary);
            body.Controls.Add(data);

            panel.Controls.Add(body);
            return panel;
        }

        /// <summary>
        /// Retourne une liste de toutes les conférences portant les tags demandées.
        /// </summary>
        /// <param name="tags">Les tags à rechercher</param>
        /// <returns>Une liste d'objets DonneesAtelier</returns>
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

        /// <summary>
        /// Retourne toutes les conférences auxquelles l'étudiant spécifié est inscrit.
        /// </summary>
        /// <param name="studentNum">Le numéro de l'étudiant</param>
        /// <returns>Une liste d'objets DonneesAtelier</returns>
        public static List<DonneesAtelier> LookupStudent(int studentNum)
        {
            List<DonneesAtelier> output = new List<DonneesAtelier>();
            AtelierDataDataContext context = new AtelierDataDataContext();

            List<int> nums = context.Etudiant_Ateliers.Where(ea => ea.Numero_Etudiant == studentNum)
                                                     .Select(ea => ea.NumAtelier.Value)
                                                     .ToList();

            output = context.DonneesAteliers.Where(a => nums.Contains(a.NumAtelier)).ToList();

            return output;
        }

        public static Etudiant GetStudent(string userName)
        {
            AtelierDataDataContext context = new AtelierDataDataContext();

            return context.Etudiants.SingleOrDefault(e => e.username == userName);
        }

        public static byte[] ComputeHash(string input)
        {
            SHA256 hasher = SHA256.Create();

            return (hasher.ComputeHash(Encoding.UTF8.GetBytes(input)));
        }
    }
}