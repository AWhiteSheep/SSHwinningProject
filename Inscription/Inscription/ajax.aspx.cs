using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;

namespace Inscription
{
    public partial class ajax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string request = Request["Action"];
            if (request != null && request.Trim() != "")
            {
                if (request == nameof(SortByDay) && Request["Day"] != null && Request["Day"].Trim() != "")
                {
                    if (int.TryParse(Request["Day"], out int day))
                    {
                        SortByDay(day);
                    }
                    else
                    {
                        throw new System.Exception("Program failed at parsing day argument");
                    }
                } 
            }
        }

        public void SortByDay(int day)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringToDonneesActivite"].ConnectionString);
            connection.Open();
            SqlDataReader reader;
            SqlCommand command = new SqlCommand($"SELECT * FROM DonneesAteliers WHERE DATEPART(day, dateDebut) = {day}", connection);

            reader = command.ExecuteReader();
        }
    }
}