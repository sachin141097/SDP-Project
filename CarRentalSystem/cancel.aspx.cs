using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class cancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false; 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            Label7.Visible = true;
            Label8.Visible = true;
            Label9.Visible = true;
            Label10.Visible = false;
            string s = Session["loginid"].ToString();
            carrentalEntities db = new carrentalEntities();
            customer cc = db.customers.Where(x => x.email == s).FirstOrDefault<customer>();
            int ci = cc.cid;
            int cid1=0, cid2=1;
            int bi = Int32.Parse(bid.Text.ToString());
          //  var q = from x in db.bookings where x.cid == ci select x;
            var p = from n in db.bookings where n.bookingid == bi  select n; 
          /*  if(q.Any())
            {
                foreach(var y in q)
                {
                    cid1 = y.cid;
                }
            }*/
            if(p.Any())
            {
                foreach(var z in p)
                {
                    cid2 = z.cid;
                }
            }
            if(ci==cid2)
            {
                if (p.Any())
                {
                    foreach (var y in p)
                    {



                        Label6.Text = y.carno.ToString();
                        Label7.Text = y.startdate.ToString();
                        Label8.Text = y.enddate.ToString();
                        Label9.Text = y.rentalamount.ToString();


                    }
                }
                
                }
            else
            {
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;

                Label10.Visible = true;
                Label10.Text = "Invalid booking id";
            }
        }
        

        protected void Button2_Click(object sender, EventArgs e)
        {

            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            int bookingid = Int32.Parse(bid.Text.ToString());
            carrentalEntities db = new carrentalEntities();
            DateTime dt = Convert.ToDateTime(Label7.Text);
            DateTime ct = DateTime.Now;
            TimeSpan t = dt.Subtract(ct);
            double hr = t.TotalHours;

            if (hr > 24)
            {
                booking b = db.bookings.Where(x => x.bookingid == bookingid).FirstOrDefault<booking>();

                var q2 = (from p in db.bookings where p.bookingid == bookingid select p).ToList();
                if (q2.Any())
                {
                    foreach (var i in q2.Where(w => w.bookingid == bookingid))
                    {
                        i.status = "cancelled";

                    }

                }
                string cno = Label6.Text;
                DateTime dt1 = Convert.ToDateTime(Label7.Text);
                DateTime dt2 = Convert.ToDateTime(Label8.Text);

                var s = (from y in db.carstatus
                         where y.carno == cno && y.startdate == dt1 && y.enddate == dt2
                         select y).FirstOrDefault();
                db.carstatus.Remove(s);
                db.SaveChanges();
                Response.Redirect("customerprofile.aspx");
                Label10.Visible = true;
            }
            else
            {
                Label10.Visible = true;
                Label10.Text = "Sorry you can't cancel the booking!!!";
                string m = "Sorry you can't cancel the booking!!!";

                Response.Redirect("timecheck.aspx?"+m);
            }
            /*string cno = Label6.Text;
            DateTime sd = Convert.ToDateTime(Label7.Text);
            DateTime ed = Convert.ToDateTime(Label8.Text);
            carstatu c = db.carstatus.Where(s => s.carno == cno && s.startdate == sd && s.enddate == ed).FirstOrDefault<carstatu>();
            db.carstatus.Remove(c);
            */


        }
    }
}
