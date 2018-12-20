using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using Inscription.Utils;
using testingDS;
using System.Collections.Specialized;

namespace Inscription
{
    public partial class Acceuil : System.Web.UI.MasterPage
    {
        AtelierDataDataContext context = new AtelierDataDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                btnShowLogin.InnerText = HttpContext.Current.User.Identity.Name;
                //btnShowLogin.

            }
            else
            {
                btnShowLogin.InnerText = "Se connecter"; 
            }

            UpdateBadgeAtelier();
            Page.SaveStateComplete += RefreshButtons;

        }

        protected void ValidateUser(object sender, EventArgs e)
        {
            //Valider la connection de l'usager
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            int userId = 0;

            //string pour la chaine de page current
            string CurrentPage = HttpContext.Current.Request.Url.AbsoluteUri;

            string Connection = "";

            if (DirectoryEnvironment.ValidateUser(username, password))
            {

                if (context.Etudiant.SingleOrDefault(etudiant => etudiant.username == username) == null)
                {
                    Etudiant newStudent = new Etudiant()
                    {
                        username = username
                    };

                    context.Etudiant.InsertOnSubmit(newStudent);
                    context.SubmitChanges();
                }
                
                FormsAuthentication.SetAuthCookie(username, true);
                btnShowLogin.InnerText = username;
                UpdateBadgeAtelier();

                Connection = "Validated";

                //lblAfterLogin.Text = "Vous êtes maintenant connecté!";
                //lblAfterLogin.Attributes.Add("style", "background-color:green;border-color:green;padding:10px;"); 
            }
            else
            {
                Connection = "Failed";
                lblMessage.Text = "Les entrés sont invalides!";
                //lblAfterLogin.Text = "Certaines entrées sont invalides!";
                //lblAfterLogin.Attributes.Add("style", "background-color:red;border-color:red;padding:10px;");
            }

            Response.Redirect(CurrentPage + "?Connection=" + Connection);

            //string constr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;
            //Connection à la base de données
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    //Command qui appelle la procédure qui est sauvegardé côt. serveur
            //    using (SqlCommand cmd = new SqlCommand("Validate_User"))
            //    {
            //        //Set le type de commande
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        //Ajout des différentes valeurs
            //        cmd.Parameters.AddWithValue("@Username", username);
            //        cmd.Parameters.AddWithValue("@Password", password);
            //        //Ajoute le para^`etre de la connection
            //        cmd.Connection = con;
            //        //ouvre
            //        con.Open();
            //        //Éxecution
            //        userId = Convert.ToInt32(cmd.ExecuteScalar());
            //        con.Close();
            //    }
            //    //SElon le cas
            //    switch (userId)
            //    {
            //        //Si retourne -1 le match est mauvais
            //        case -1:
            //            dvMessage.Visible = true;
            //            lblMessage.Text = "Username and/or password is incorrect.";
            //            break;

            //        default:
            //            FormsAuthentication.SetAuthCookie(username, chkRememberMe.Checked);
            //            btnShowLogin.InnerText = username;
            //            break;
            //    }
            //}
        }//https://www.aspsnippets.com/Articles/Responsive-Login-Form-inside-Bootstrap-Modal-Popup-in-ASPNet.aspx
        //Source pour la belle procédure
        protected void LogOut(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Page.Response.Redirect("PageAcceuil.aspx");
            }
        }

        private void RefreshButtons(object sender, EventArgs e)
        {
            UpdateBadgeAtelier();
        }

        protected void UpdateBadgeAtelier()
        {
            //sil'usager est loger
            if (this.Page.User.Identity.IsAuthenticated)
            {
                //Ajouter l'attribut class avec badge + data-badge afin d'uppdater le nombre d'atelier que l'usager participe maintenant
                linkToPanier.Attributes.Add("class", "badge-atelier");

                //calcule le nombre total d'atelier qu'il est inscrit par uyne fonction SQL
                int nData = (int)context.GetNombreAtelierInscritByStudent(HttpContext.Current.User.Identity.Name);

                //Ajoute l'attribut data
                linkToPanier.Attributes.Add("data-badge", nData.ToString());
            }
            else
            {
                //Faire certain de clear la class et le data
                linkToPanier.Attributes.Remove("class");
                linkToPanier.Attributes.Remove("data-badge");
            }
        }

    }
}