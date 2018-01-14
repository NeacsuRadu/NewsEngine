using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication1
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void idCreateUserWizard_CreatedUser(object sender, EventArgs e)
        {
            if (!Roles.RoleExists("User"))
            {       
                Roles.CreateRole("User");
            }
            Roles.AddUserToRole(idCreateUserWizard.UserName, "User");
        }
    }
}