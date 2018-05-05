using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class DeliveryPerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "DeliveryPerson")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            // Response.Write("Hello delivery person");
        }
    }
}