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
using System.Data.Linq.SqlClient;

namespace Inscription.Utils
{
    /// <summary>
    /// Classe utilitaire qui prend en charge les requêtes à la BD et la transformation des résultats en éléments affichables.
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
            //Création des éléments HTML qui affichent des données simples.

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
            subscriptionLine.Attributes.Add("class", "subscriptionLine");
            int numSubs = context.Etudiant_Atelier.Count(sub => sub.NumAtelier == row.NumAtelier);
            int maxSubs = row.Max_Eleves.HasValue? row.Max_Eleves.Value : 0;


            //Création du bouton qui prend en charge la souscription.
            HtmlInputButton btnInscription;

            //Détermine si l'usager est connecté.
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string username = HttpContext.Current.User.Identity.Name;

                string numUser = context.Etudiant.SingleOrDefault(etudiant => etudiant.username == username)
                                                .username;

                //Si SingleOrDefault ne ramène pas Null, l'étudiant est inscrit
                bool userAlreadySubscribed = context.Etudiant_Atelier.SingleOrDefault(entry => entry.Numero_Etudiant == numUser.ToString() 
                                                                                            && entry.NumAtelier == row.NumAtelier) 
                                                                                            != null;
                

                //Si aucune place restante, et l'utilisateur n'est pas deja inscrit, on crée un bouton
                //"Complet"
                if (numSubs >= maxSubs && !userAlreadySubscribed)
                {
                    btnInscription = new HtmlInputButton()
                    {
                        Value = "Complet"
                    };

                    btnInscription.Attributes.Add("class", "btn btn-secondary");
                }            

                //Si l'utilisateur est déjà inscrit à cet atelier, on crée un bouton désinscription.
                //La méthode Unsubscribe est attachée à son événement ServerClick.
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

                //Sinon, un bouton pour l'inscription est créé. La méthode Subscribe prend en charge son evénement ServerClick.
                else
                {
                    btnInscription = new HtmlInputButton()
                    {
                        Value = "S'inscrire",
                        ID = row.NumAtelier.ToString()
                    };

                    btnInscription.ServerClick += Subscribe;
                    btnInscription.Attributes.Add("class", "btn btn-success");
                }
                body.Controls.Add(btnInscription);
            }

            //Si l'usager n'est pas connecté, un bouton connexion est créé. Ce bouton reçoit par l'entremise de JQuery
            //une méthode qui affiche le Modal de connexion.
            else
            {
                btnInscription = new HtmlInputButton()
                {
                    Value = "Connexion"
                };

                btnInscription.Attributes.Add("class", "btn btn-secondary btn-login");
            }            

            //Affiche le nombre de places restantes et le nombre de places maximum.
            HtmlGenericControl subsDisplay = new HtmlGenericControl("span")
            {
                InnerText = $"\t  {maxSubs - numSubs} / {maxSubs} places disponibles"
            };

            subscriptionLine.Controls.Add(subsDisplay);
            subscriptionLine.Controls.Add(btnInscription);            

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

            //Si aucune tag choisie, retourne tout.
            if (tags.Count == 0)
            {
                output = context.DonneesAteliers.ToList();
            } 


            //Sinon, ajoute tous les ateliers possédant cette tag dans output.
            foreach(string tag in tags)
            {
                var queryResults = context.GetAllAteliersByTag(tag);

                foreach (var result in queryResults)
                {
                    output.Add(context.DonneesAteliers.Single(a => a.NumAtelier == result.NumAtelier));
                }
            }

            //Puisque les ateliers peuvent avoir plusieurs tag, on fait un Distinct() pour éviter les doublons.

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

            //Les numéros d'ateliers auxquels l'étudiant est inscrit.
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

        //Méthode de hash qui serait utilisée pour cacher les mots de passe si on doit
        //en fin de compte créer notre propre système de comptes utilisateurs.
        public static byte[] ComputeHash(string input)
        {
            SHA256 hasher = SHA256.Create();

            return (hasher.ComputeHash(Encoding.UTF8.GetBytes(input)));
        }

        /// <summary>
        /// Assigne l'utilisateur courant à l'atelier représenté par l'ID du bouton cliqué.
        /// La souscription est réflétée dans la BD.
        /// </summary>
        /// <param name="sender">Bouton cliqué. Son ID correspond au numéro de l'atelier choisi dans la BD.</param>
        public static void Subscribe(object sender, EventArgs e)
        {
            HtmlInputButton button = (HtmlInputButton)sender;

            //Recherche d'un numéro étudiant à partir de l'utilisateur authentifié.
            string user = HttpContext.Current.User.Identity.Name;
            string numEtudiant = context.Etudiant.SingleOrDefault(etudiant => etudiant.username == user)
                                                            .username;

            //Ce if sert principalement à la détection d'erreurs. Le ID du bouton est assigné
            //programmatiquement, alors il devrait toujours parser. Si le programme assigne le ID faussement et celui-ci ne parse pas,
            //nous saurons immédiatement d'où vient l'erreur.
            if (int.TryParse(button.ID, out int numAtelier))
            {
                Etudiant_Atelier newEntry = new Etudiant_Atelier()
                {
                    Numero_Etudiant = numEtudiant,
                    NumAtelier = numAtelier
                };

                context.Etudiant_Atelier.InsertOnSubmit(newEntry);

                context.SubmitChanges();
            }
            else
            {
                throw new System.ArgumentException($"int.Parse() Could not parse {button.ID} on {button.ToString()}.")
                {
                    Source = button.ID
                };
            }
        }

        /// <summary>
        /// Prend en charge la désinscription d'un atelier. L'identité de l'étudiant provient du contexte HTTP,
        /// et l'identité de l'atelier provient de l'ID du bouton cliqué.
        /// </summary>
        /// <param name="sender">Bouton cliqué. Son ID correspond au numéro de l'atelier choisi dans la BD.</param>
        /// <param name="e"></param>
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

        /// <summary>
        /// Méthode d'extension qui permet de filtrer une liste d'ateliers selon une chaîne de recherche entrée par l'utilisateur.
        /// La recherche est faite dans le titre de l'atelier et le nom du/de la conférencier/ère.
        /// </summary>
        /// <param name="ateliers">La liste d'ateliers à filtrer.</param>
        /// <param name="query">La chaîne de recherche.</param>
        /// <returns>La liste d'ateliers filtrée selon la recherche</returns>
        public static List<DonneesAteliers> SearchFor(this List<DonneesAteliers> ateliers, string query)
        {
            //Filtre ateliers en utilisant la méthode String.Contains()
            var toDisplay = ateliers.Where(t => t.contentTitle.ToLower().Contains($"{query.ToLower()}")).ToList();

            toDisplay.AddRange(ateliers.Where(t => t.Conferencier.ToLower().Contains($"{query.ToLower()}")));

            return toDisplay;
        }
    }
}