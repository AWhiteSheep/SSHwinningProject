using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SendMessage();
        }

        void SendMessage()
        {
            //Permet à l'application d'nvoyer des emails, set le host et le port que nous allons utiliser
            SmtpClient client  = new SmtpClient();
            //Set la sécurisation de la connection --> obligatoire pour gmail afin de sécuriser la connection
            client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Port = 587;

            //setup l'authentification pour le gmaail
            System.Net.NetworkCredential cred = new System.Net.NetworkCredential("ateliercegep@gmail.com", "admincegepatelier123");
            //set pour que le client connecté utilise les cred de l'admin
            client.UseDefaultCredentials = false;
            client.Credentials = cred;

            //Cération du message
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("ateliercegep@gmail.com");
            msg.To.Add(new MailAddress("yanharc@gmail.com"));

            msg.Subject = "This is a test Email subject";
            msg.IsBodyHtml = true;
            msg.Body = string.Format("<html><head></head><body><b>Test HTML Email</b></body>");

            try
            {
                client.Send(msg);
            }
            catch
            {

            }

            //source pour l'envoie d'un nouveau message https://stackoverflow.com/questions/4559011/sending-asp-net-email-through-gmail
        }
    }
}