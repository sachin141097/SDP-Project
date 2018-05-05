using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string msg="Access denied";
            if(Session["role"].ToString()!="Admin")
            {
                Response.Redirect("login.aspx?" + msg);
            }
        }
    }
}