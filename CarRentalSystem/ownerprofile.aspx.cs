using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class ownerprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Owner")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
        }

        protected void datasource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}