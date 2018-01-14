using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.editor
{
    public partial class editor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void idAddCategoryButton_Click(object sender, EventArgs e)
        {
            if (idCategoryTextbox.Text != "")
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                    conn.Open();
                    string category = idCategoryTextbox.Text.Trim();
                    idCategoryTextbox.Text = "";
                    string szQuery = "SELECT COUNT(*) FROM Categories WHERE Name=@name";
                    SqlCommand sqlQuery = new SqlCommand(szQuery, conn);
                    sqlQuery.Parameters.AddWithValue("@name", category);
                    int count = Convert.ToInt32(sqlQuery.ExecuteScalar());
                    if (0 == count)
                    {
                        Guid id = Guid.NewGuid();
                        string szInsert = "INSERT INTO Categories VALUES (@id, @name)";
                        SqlCommand sqlInsert = new SqlCommand(szInsert, conn);
                        sqlInsert.Parameters.AddWithValue("@id", id);
                        sqlInsert.Parameters.AddWithValue("@name", category);
                        int rows = sqlInsert.ExecuteNonQuery();
                        if (1 == rows)
                        {
                            error.Text = "good";
                        }
                        else
                        {
                            error.Text = "no good";
                        }
                    }
                    else
                    {
                        error.Text = "Deja";
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    error.Text = ex.ToString();
                }
            }
        }
    }
}