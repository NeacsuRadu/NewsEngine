using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void buttonRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/register.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/user.aspx");
        }

        protected void idManageNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/editor/editor.aspx");
        }

        protected void idManageUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/manageRoles.aspx");
        }
    }
}