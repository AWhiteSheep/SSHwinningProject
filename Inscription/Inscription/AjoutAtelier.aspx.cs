using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        //Connection à la base de données
        static string connStr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;
        public static AtelierDataDataContext AtelierDataContext = new AtelierDataDataContext(connStr);


        protected void Page_Load(object sender, EventArgs e)
        {
            sumbit.ServerClick += AtelierCreation_Click;
        }

        protected void AtelierCreation_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var Atelier = new DonneesAtelier();
                Atelier.contentTitle = txttitre.Text;
                Atelier.campus = txt_Campus.Text;
                Atelier.Salle = txt_salle.Text;
                Atelier.dateDebut = Convert.ToDateTime(txt_date.Text);
                Atelier.HeureDebut = TimeSpan.Parse(txt_heure.Text);
                Atelier.HeureFin = TimeSpan.Parse(txt_heure_fin.Text);
                Atelier.Max_Eleves = int.Parse(txt_elevemax.Text);
                Atelier.Conferencier = txt_conferencier.Text;
                AtelierDataContext.DonneesAteliers.InsertOnSubmit(Atelier); // un submit un pending
                AtelierDataContext.SubmitChanges(); // de dataContext
            }
        }
    }
}