using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.admin
{
    public partial class manageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            idErrorLabelUpdate.Visible = false;
        }

        protected void idButtonUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            try
            {
                string user = idUsernameTextbox.Text.Trim();
                idUsernameTextbox.Text = "";
                conn.Open();

                string szCommand = "SELECT UserId FROM Users WHERE UserName=@user";
                SqlDataReader dataReader;
                SqlCommand sqlQueryCommand = new SqlCommand(szCommand, conn);
                sqlQueryCommand.Parameters.AddWithValue("@user", user);
                dataReader = sqlQueryCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    Guid userId = new Guid(dataReader[0].ToString());
                    Guid roleId = new Guid(DropDownList1.SelectedValue);
                    string szUpdate = "UPDATE UsersInRoles SET RoleId=@role WHERE UserId=@user";
                    SqlCommand sqlUpdateCommand = new SqlCommand(szUpdate, conn);
                    sqlUpdateCommand.Parameters.AddWithValue("@role", roleId);
                    sqlUpdateCommand.Parameters.AddWithValue("@user", userId);
                    int rows = sqlUpdateCommand.ExecuteNonQuery();
                    if (1 == rows)
                    {
                        idErrorLabelUpdate.Text = "User " + user + " has been updated!";
                        idErrorLabelUpdate.Visible = true;
                        GridView1.DataBind();
                    }
                    else
                    {
                        idErrorLabelUpdate.Text = "Failed to update " + user + "!";
                        idErrorLabelUpdate.Visible = true;
                    }
                }
                else
                {
                    idErrorLabelUpdate.Text = "User " + user + " does not exist!";
                    idErrorLabelUpdate.Visible = true;
                }

                conn.Close();
            }
            catch(Exception ex)
            {
                idErrorLabelUpdate.Text = ex.ToString();
                idErrorLabelUpdate.Visible = true;
                conn.Close();
            }
        }
    }
}