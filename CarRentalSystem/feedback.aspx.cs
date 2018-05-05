using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class feedback1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString()!="Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            string s = Session["loginid"].ToString();
            carrentalEntities db = new carrentalEntities();
            var c = from x in db.customers where x.email == s select x;
            foreach (var x in c)
            {
                cid.Text = x.cid.ToString();
            }
            int i = Int32.Parse(cid.Text);
            var d = from x in db.bookings where x.cid == i select x;
            foreach(var x in d)
            {
                cno.Text = x.carno.ToString();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            feedback f = new feedback();
            f.carno = cno.Text.ToString();
            f.cid = Int32.Parse(cid.Text);
            f.rating = DropDownList1.SelectedItem.Text;
            f.description = review.Text;
            db.feedbacks.Add(f);
            db.SaveChanges();
            Response.Redirect("customerprofile.aspx");
        }
    }
}