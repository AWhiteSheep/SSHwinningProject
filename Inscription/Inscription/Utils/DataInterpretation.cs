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
        public static AtelierDataDataContext context = new AtelierDataDataContext();

        /// <summary>
        /// Crée un élément HTML qui sert de représentation brève d'un atelier.
        /// </summary>
        /// <param name="row">
        /// Un objet DonneesAtelier qui représente une rangée de la table DonneesAtelier
        /// </param>
        /// <returns>
        /// Un contrôle HTML Div prêt à être affiché.
        /// </returns>
        public static HtmlGenericControl CreateInfoPanel(DonneesAteliers row)
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
                + row.HeureDebut?.ToString(@"hh\:mm")
            };

            

            data.Attributes.Add("class", "mb-0 smallInfo");
            data.Attributes.Add("style", "clear:both");

            data.InnerText = data.InnerText.ToUpper();

            panel.Controls.Add(img);

            body.Controls.Add(title);
            body.Controls.Add(summary);
            body.Controls.Add(data);

            HtmlGenericControl subscriptionLine = new HtmlGenericControl("div");

            int numSubs = context.Etudiant_Atelier.Count(sub => sub.NumAtelier == row.NumAtelier);
            int maxSubs = row.Max_Eleves.HasValue? row.Max_Eleves.Value : 0;

            HtmlInputButton btnInscription;

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string username = HttpContext.Current.User.Identity.Name;

                string numUser = context.Etudiant.SingleOrDefault(etudiant => etudiant.username == username)
                                                .username;

                //Si SingleOrDefault ne ramène pas Null, l'étudiant est inscrit
                bool userAlreadySubscribed = context.Etudiant_Atelier.SingleOrDefault(entry => entry.Numero_Etudiant == numUser.ToString() 
                                                                                            && entry.NumAtelier == row.NumAtelier) 
                                                                                            != null;
                

                //Si aucune place restante, et l'utilisateur n'est pas deja inscrit...
                if (numSubs >= maxSubs && !userAlreadySubscribed)
                {
                    btnInscription = new HtmlInputButton()
                    {
                        Value = "Complet"
                    };

                    btnInscription.Attributes.Add("class", "btn btn-secondary");
                }            

                //Si l'utilisateur est déjà inscrit à cet atelier...
                else if (userAlreadySubscribed)
                {
                    btnInscription = new HtmlInputButton()
                    {
                        Value = "Désinscription",
                        ID = row.NumAtelier.ToString()
                    };
                    btnInscription.ServerClick += Unsubscribe;
                    btnInscription.Attributes.Add("class", "btn btn-danger float-md-left");
                }

                else
                {
                    btnInscription = new HtmlInputButton()
                    {
                        Value = "S'inscrire",
                        ID = row.NumAtelier.ToString()
                    };

                    btnInscription.ServerClick += Subscribe;
                    btnInscription.Attributes.Add("class", "btn btn-success float-md-left");
                }
                body.Controls.Add(btnInscription);
            }
            else
            {
                btnInscription = new HtmlInputButton()
                {
                    Value = "Connexion"
                };

                btnInscription.Attributes.Add("class", "btn btn-secondary btn-login");
            }            

            HtmlGenericControl subsDisplay = new HtmlGenericControl("span")
            {
                InnerText = $"\t  {maxSubs - numSubs} / {maxSubs} places disponibles"
            };

            subscriptionLine.Controls.Add(btnInscription);
            subscriptionLine.Controls.Add(subsDisplay);

            body.Controls.Add(subscriptionLine);
            panel.Controls.Add(body);
            return panel;
        }

        /// <summary>
        /// Retourne une liste de toutes les conférences portant les tags demandées.
        /// </summary>
        /// <param name="tags">Les tags à rechercher</param>
        /// <returns>Une liste d'objets DonneesAtelier</returns>
        public static List<DonneesAteliers> LookupTags(List<string> tags)
        {
            List<DonneesAteliers> output = new List<DonneesAteliers>();

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
        public static List<DonneesAteliers> LookupStudent(int studentNum)
        {
            List<DonneesAteliers> output = new List<DonneesAteliers>();

            List<int> nums = context.Etudiant_Atelier.Where(ea => ea.Numero_Etudiant == studentNum.ToString())
                                                     .Select(ea => ea.NumAtelier)
                                                     .ToList();

            output = context.DonneesAteliers.Where(a => nums.Contains(a.NumAtelier)).ToList();

            return output;
        }

        public static Etudiant GetStudent(string userName)
        {
            return context.Etudiant.SingleOrDefault(e => e.username == userName);
        }

        public static byte[] ComputeHash(string input)
        {
            SHA256 hasher = SHA256.Create();

            return (hasher.ComputeHash(Encoding.UTF8.GetBytes(input)));
        }

        public static void Subscribe(object sender, EventArgs e)
        {
            HtmlInputButton button = (HtmlInputButton)sender;
            string user = HttpContext.Current.User.Identity.Name;

            time

            string numEtudiant = context.Etudiant.SingleOrDefault(etudiant => etudiant.username == user)
                                                            .username;

            if (int.TryParse(button.ID, out int numAtelier))
            {
                Etudiant_Atelier newEntry = new Etudiant_Atelier()
                {
                    Numero_Etudiant = numEtudiant,
                    NumAtelier = numAtelier
                };

                context.Etudiant_Atelier.InsertOnSubmit(newEntry);

                context.SubmitChanges();
                button.Value = "Succès";
            }
        }

        public static void Unsubscribe(object sender, EventArgs e)
        {
            HtmlInputButton button = (HtmlInputButton)sender;
            string user = HttpContext.Current.User.Identity.Name;


            if (int.TryParse(button.ID, out int numAtelier))
            {
                Etudiant_Atelier toDelete = context.Etudiant_Atelier.SingleOrDefault(ea => ea.Numero_Etudiant == user
                                                                                                            && ea.NumAtelier == numAtelier);

                context.Etudiant_Atelier.DeleteOnSubmit(toDelete);

                context.SubmitChanges();
                button.Value = "Succès";
            }
        }
    }
}