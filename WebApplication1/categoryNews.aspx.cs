using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    public partial class categoryNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null != Request.QueryString["id"])
            {
                string szCategory = Request.QueryString["id"];
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                    conn.Open();
                    string szSelect = "SELECT * FROM News WHERE News.CategoryId = @id";
                    SqlCommand sqlSelect = new SqlCommand(szSelect, conn);
                    sqlSelect.Parameters.AddWithValue("@id", szCategory);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlSelect);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);


                    conn.Close();
                }
                catch (Exception) { }
            }

        }
    }
}