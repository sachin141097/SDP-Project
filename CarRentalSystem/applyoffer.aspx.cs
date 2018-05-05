using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using ASPSnippets.SmsAPI;
using System.Net.Mail;

namespace CarRentalSystem
{
    public partial class bookcar : System.Web.UI.Page
    {
        carrentalEntities db = new carrentalEntities();
        int pay = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            int f=Int32.Parse(Session["pay"].ToString());
            pay = (int)f;
           // pay = 100;
            //Session["pay"] = pay;
            Label1.Text = pay.ToString();
          }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string s = TextBox1.Text;
            var a = from x in db.offers where x.promocode == s select x;
            if (a.Any())
            {
                var i = a.First();
                string check = (i.isonetime).ToString();
                int offerid = (i.offerid);
                string email = Session["loginid"].ToString();
                var cust = from x in db.customers where x.email == email select x;
                int cid = 0;
                foreach (var zi in cust)
                {
                    cid = zi.cid;
                }
                
                if (check == "1")
                {
                    var used = from y in db.offeruseds where y.cid == cid && y.offerid == offerid select y; 
                    if(!used.Any())
                    {
                        Response.Write("promocode applied");
                        offerused ou = new offerused();
                        // string email = Session["loginid"].ToString();
                        //string email = "dhruvinradadiya25@gmail.com";
                        var cuid = from z in db.customers where z.email == email select z;
                        var m = cuid.First();
                        ou.cid = Int32.Parse(m.cid.ToString());
                        ou.offerid = Int32.Parse(i.offerid.ToString());
                        //Response.Write(m.cid.ToString());
                        //Response.Write(i.offerid.ToString());
                        try
                        {
                            db.offeruseds.Add(ou);
                        }
                        catch(Exception)
                        {
                            Response.Write("hii");
                        }
                        db.SaveChanges();
                        string onbased = i.ofbased.ToString();
                        if (onbased == "percent")
                        {
                            int per = Int32.Parse(i.discountpercent.ToString());
                            pay = (int)(pay-(pay * per / 100));
                            Session["pay"] = pay.ToString();
                        }
                        else
                        {
                            int amount = Int32.Parse(i.discountamount.ToString());
                            pay = pay - amount;
                            Session["pay"] = pay.ToString();
                        }
                        Label1.Text = pay.ToString();
                    }
                    else
                    {
                        Label2.Text="you already used it";
                    }
                }
                else
                {
                    Label2.Text="no service available";
                    string onbased = i.ofbased.ToString();
                    if (onbased == "percent")
                    {
                        int per = Int32.Parse(i.discountpercent.ToString());
                        pay = (int)(pay - (pay * per / 100));
                        Session["pay"] = pay.ToString();
                    }
                    else
                    {
                        int amount = Int32.Parse(i.discountamount.ToString());
                        pay = pay - amount;
                        Session["pay"] = pay.ToString();
                    }
                    Label1.Text = pay.ToString();
                }
                
            }
            else
            {
                Label2.Text= "no promocode";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("payment.aspx");
        }
    }
}