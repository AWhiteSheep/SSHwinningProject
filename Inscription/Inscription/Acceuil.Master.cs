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
                btnShowLogin.InnerText = "Login"; 
            }
        }

        protected void ValidateUser(object sender, EventArgs e)
        {
            //Valider la connection de l'usager
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            int userId = 0;

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
            }
            else
            {
                lblMessage.Text = "Crédentiels invalides";
            }

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

    }
}