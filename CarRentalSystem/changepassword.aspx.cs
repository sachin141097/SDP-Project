using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userrole = Session["role"].ToString();
            string mesg;
            //Response.Write(userrole);
            if (Session["role"].ToString() == "guest")
            {
                mesg = "login+first";
                Response.Redirect("login.aspx?" + mesg);
            }

        }

        protected void get_Click(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            Login l = new Login();
            string pwd1 = pwd.Text;
            string pwd2 = cpwd.Text;
            string role = Session["role"].ToString();
            string loginid = Session["loginid"].ToString();
            var user = (from u in db.Logins where u.LoginId == loginid && u.Role==role select u).FirstOrDefault();

            if (pwd1!=pwd2)
            {
                // Response.Redirect("~/changepassword.aspx?msg=password+not+matched");
                msg.Text = "Password not matched";
                msg.ForeColor = System.Drawing.Color.Red;


            }
            else
            {
                user.Password = cpwd.Text;
                db.SaveChanges();
                msg.Text = "Password changed successfully";
                msg.ForeColor = System.Drawing.Color.Green;


            }
        }
    }
}