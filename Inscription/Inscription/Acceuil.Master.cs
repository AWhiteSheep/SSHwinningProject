using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inscription
{
    public partial class Acceuil : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                btnConnection.Visible = false;
            }
            else
            {
                btnConnection.Visible = true;
            }
        }
    }
}