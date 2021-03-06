﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        static string connStr = ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString;

        public static AtelierDataDataContext AtelierDataContext = new AtelierDataDataContext(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(HttpContext.Current.User.Identity.Name == "0785024")
            {
                Response.Redirect("AjoutAtelier.aspx");
            }else if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                _BindAtelierAndStudent();
            }
        }

        private void _BindAtelierAndStudent()
        {
            try
            {
                string res = HttpContext.Current.User.Identity.Name;
                //if (HttpContext.Current.User.Identity.Name != "Admin")
                //    int.TryParse(HttpContext.Current.User.Identity.Name, out res);
                //else //Temporaire to do
                //    res = 1473192;
               
                var Atelier = AtelierDataContext.GetAllAteliersByStudent(res).ToList();

                for (int i = 0; i < Atelier.Count; i++)
                {
                    HtmlGenericControl pushingDiv = new HtmlGenericControl("div");
                    pushingDiv.Attributes.Add("class", "activity-card");

                    HtmlGenericControl img = new HtmlGenericControl("img");
                    img.Attributes.Add("src", Atelier[i].posterPath);

                    HtmlGenericControl h4 = new HtmlGenericControl("div");
                    h4.Attributes.Add("class", "h4");

                    h4.InnerHtml = Atelier[i].contentTitle;

                    HtmlGenericControl p = new HtmlGenericControl("p");
                    p.InnerHtml = Atelier[i].sommaire;

                    //HtmlButton bInscription = new HtmlButton();
                    //bInscription.Attributes.Add("class", "btn activity-btn-deinscription");
                    //bInscription.Attributes.Add("name", $"{Atelier[i].NumAtelier.ToString()}");
                    //bInscription.InnerHtml = "Ne plus participer";

                    HtmlInputButton bInscription = new HtmlInputButton()
                    {
                        Value = "Ne plus participer",
                       
                    };

                    bInscription.Attributes.Add("AtelierKey", ((int)Atelier[i].NumAtelier).ToString());

                    bInscription.Attributes.Add("class", "btn activity-btn-deinscription");

                    bInscription.ServerClick += PlusParticiper_Click;

                    bInscription.CausesValidation = false;

                    HtmlGenericControl aLink = new HtmlGenericControl("a");
                    aLink.Attributes.Add("class", "btn activity-btn-voir");
                    aLink.Attributes.Add("href", $"Ateliers.aspx?id={Atelier[i].NumAtelier.ToString()}");
                    aLink.InnerHtml = "Plus...";

                    pushingDiv.Controls.Add(img);
                    pushingDiv.Controls.Add(h4);
                    pushingDiv.Controls.Add(p);
                    pushingDiv.Controls.Add(bInscription);
                    pushingDiv.Controls.Add(aLink);
                    //pushFromServer += @"<div class='image-box'>
                    //                            <img src = 'Images/Histoire.jpg'/>
                    //                            <div class='h4'>L'éducation gratuite!</div>
                    //                            <p>Vous êtes convoqués à venir nous joindre à une superbe preésentation magistral pour une éducation accessible à tous!</p>
                    //                            <span style = 'float:right;' ><button class='btn activity-btn-inscription'>Inscription</button><a href = 'Ateliers.aspx' class='btn activity-btn-voir'>Plus...</a></span>
                    //                            </div>";

                    GridAtelierInscrit.Controls.Add(pushingDiv);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void PlusParticiper_Click(object sender, EventArgs e)
        {
            HtmlInputButton theSender = (HtmlInputButton)sender;
            string value = theSender.Attributes["AtelierKey"];

            string idStudent = "";
            if (HttpContext.Current.User.Identity.Name == "" || HttpContext.Current.User.Identity.Name == "Admin")
            {
                idStudent = "1473192";
            }
            else
            {
                idStudent = HttpContext.Current.User.Identity.Name;
            }

            if (idStudent != "")
            {
                var Atelier = AtelierDataContext.Etudiant_Atelier.Single(ea => ea.NumAtelier == int.Parse(value) && ea.Numero_Etudiant == idStudent);

                AtelierDataContext.Etudiant_Atelier.DeleteOnSubmit(Atelier);
                AtelierDataContext.SubmitChanges();

                _BindAtelierAndStudent();
            }
        }
    }
}