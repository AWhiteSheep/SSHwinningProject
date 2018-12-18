﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
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
            if (!Page.IsPostBack)
            {
                gridViewAtelier.DataSource = GetAtelierRecord();
                gridViewAtelier.DataBind();
            }
            hiddenMessage.Attributes.Add("class", "hiddenMessage");

            //sumbit.ServerClick += AtelierCreation_Click;
        }

        protected void AtelierCreation_Click(object sender, EventArgs e)
        {
            //validation de la page
            if (Page.IsValid)
            {
                bool reussi = true;
                try
                {
                    string sysFormat = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
                    //Cération d'un nouvel atelier
                    var Atelier = new DonneesAtelier();
                    Atelier.contentTitle = txttitre.Text;
                    Atelier.campus = txt_Campus.Text;
                    Atelier.Salle = txt_salle.Text;
                    var adsf = DateTime.Now.ToString();
                    Atelier.dateDebut = DateTime.ParseExact(txt_date.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    Atelier.HeureDebut = TimeSpan.Parse(txt_heure.Text);
                    Atelier.HeureFin = TimeSpan.Parse(txt_heure_fin.Text);
                    Atelier.Max_Eleves = int.Parse(txt_elevemax.Text);
                    Atelier.Conferencier = txt_conferencier.Text;
                    AtelierDataContext.DonneesAteliers.InsertOnSubmit(Atelier); // un submit un pending
                    AtelierDataContext.SubmitChanges(); // de dataContext

                }
                catch (Exception)
                {
                    reussi = false;
                    throw;
                }

                if (reussi)
                {
                    hiddenMessage.Attributes.Remove("class");
                }
                //lblSuccess.Text = $"L'ajout de l'atelier {txttitre.Text} à réussi!";
                else
                {
                    //lblSuccess.Text = $"L'ajout de l'atelier {txttitre.Text} n'a pas réussi...";
                    hiddenMessage.Attributes.Add("class", "hiddenMessage");

                }
            }
        }

        public List<DonneesAtelier> GetAtelierRecord()
        {
            var AllAtelier = (from a in AtelierDataContext.DonneesAteliers
                              select a).ToList();
            
            return AllAtelier;
        }

        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)gridViewAtelier.Rows[e.RowIndex];
                var lbldeleteid = row.Cells[0].Text;

                var Atelier = AtelierDataContext.DonneesAteliers.Single(a => a.NumAtelier == int.Parse(lbldeleteid));

                AtelierDataContext.DonneesAteliers.DeleteOnSubmit(Atelier);
                AtelierDataContext.SubmitChanges();
                gvbind();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                FormulaireAtelier.Attributes.Remove("class");
                FormulaireAtelier.Attributes.Add("class", "container tab-pane fade in");
                AtelierList.Attributes.Remove("class");
                AtelierList.Attributes.Add("class", "container  tab-pane fade in active show");

                TheFormulaire.Attributes.Remove("class");
                ListAteler.Attributes.Add("class", "active show");
            }
        }

        void gvbind()
        {
            gridViewAtelier.DataSource = GetAtelierRecord();
            gridViewAtelier.DataBind();
        }

        protected void gridViewAtelier_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}