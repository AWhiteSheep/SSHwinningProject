using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////Source du code pour la connection https://www.c-sharpcorner.com/UploadFile/ea3ed6/showing-some-data-in-Asp-Net-from-sql-server-database-using/
            //le ID de l'activité une variable est global à la solution qui déterminera se qui sera affiché sur la page --TODO
            string ActID = "TEST";

            //string pour la connection à la base de données
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;

            //Création d'une instance de SqlConnection qui pourra se connecter au serveur
            SqlConnection conn = new SqlConnection(connStr);

            //Query au serveur à la table d'activité pour les information pour l'activité voulu
            string sql = $"select * from DonneesActivites where NumActivite = '" +ActID+ "'";

            //Création d'une instance de SQlCommand qui format la commande afin que SQL puisse le lire
            SqlCommand cmd = new SqlCommand(sql, conn);

            //ouverture de la connection
            conn.Open();

            //Instanciation d'un reader afin de pouvoir lire l'information
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                //Source du code pour la lecture des données https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/retrieving-data-using-a-datareader
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lbTitle.Text = reader.GetString(1);
                        lbCampus.Text = reader.GetString(2);
                        lbSalle.Text = reader.GetString(3);
                        lbSmallInfo.Text = reader.GetString(4);
                        lbContentMain.Text = reader.GetString(6);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('oops');", true);
                }
            }

            conn.Close();


            //Connection à partir du form source: https://www.c-sharpcorner.com/article/create-a-sql-database-in-asp-net-web-form-using-visual-studio-2015-update-3/ aussi la création

        }

        protected void Unnamed1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}