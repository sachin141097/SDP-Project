using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class addoffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString()!="Admin")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            if(ofbase.SelectedItem.Text=="Amount")
            {
                amt.Visible = true;
                per.Visible = false;
                pt.Visible = false;
                at.Visible = true;

            }
            else if(ofbase.SelectedItem.Text=="Percentage")
            {
                amt.Visible = false;
                per.Visible = true;
                pt.Visible = true;
                at.Visible = false;

            }

        }

        
        protected void button1_Click(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            offer o = new offer();
            o.promocode = promo.Text;
            o.description = desc.Text;
            o.isonetime = Int32.Parse(ison.SelectedItem.Value);
            o.ofbased = ofbase.SelectedItem.Text;
            if (ofbase.SelectedItem.Text == "Percentage")
            {
                o.discountpercent = Int32.Parse(per.Text);
                o.discountamount = 0;
            }
            else if(ofbase.SelectedItem.Text=="Amount")
            {
                o.discountamount = Int32.Parse(amt.Text);
                o.discountpercent = 0;


            }
            db.offers.Add(o);
            db.SaveChanges();
            msg.Text = "offer added successfuly";

        }
    }
}