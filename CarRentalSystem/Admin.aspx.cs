using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"].ToString()!="Admin")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx"+msg);
            }

            carrentalEntities db = new carrentalEntities();
            string mail = Session["loginid"].ToString();
            admin aa = db.admins.Where(x => x.email == mail).FirstOrDefault<admin>();
            username_text.Text = aa.firstname;

        }
    }
}