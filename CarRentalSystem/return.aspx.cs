using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class _return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "DeliveryPerson")
            {
                string s = "Access denied";
                Response.Redirect("login.aspx?" + s);
            }
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
        }
        double total = 0;
        string carno = "";
        DateTime startdate;
        DateTime enddate;
        protected void Button1_Click(object sender, EventArgs e)
        {

            Label8.Visible = true;
            Label9.Visible = true;
            Label10.Visible = true;
            Label11.Visible = true;
            string loginid = Session["loginid"].ToString();
            carrentalEntities db = new carrentalEntities();
            chauffer cc = db.chauffers.Where(x => x.email == loginid).FirstOrDefault<chauffer>();
            int cid = cc.did;
            int id = Int32.Parse(bookingid.Text);
            var getdata = from x in db.bookings where x.bookingid == id && x.did==cid select x;

            if (getdata.Any())
            {
                var a = getdata.First();
                carno = a.carno;
                startdate = a.startdate;
                enddate = a.enddate;
                int pay = a.rentalamount;
                Label3.Text = carno;
                Label4.Text = startdate.ToString();
                Label5.Text = enddate.ToString();
                Label6.Text = pay.ToString();
                
                DateTime actenddate = DateTime.Now;
                TimeSpan ts = actenddate.Subtract(enddate);
                double hr = ts.TotalHours;
                var vid = from p in db.cardatas where p.carno == carno select p;
                int vehicle = 0;
                if (vid.Any())
                {
                    foreach (var y in vid)
                    {
                        vehicle = y.vehicleid;
                    }
                }

                var rent = from z in db.vehicles where z.vehicleid == vehicle select z;
                int renthr = 0;
                if (rent.Any())
                {
                    foreach (var y in rent)
                    {
                        renthr = y.priceperday;
                    }
                }


                total = renthr * hr * 1.05;

                int t = (int)total;
                if (t >= 0) {
                    Label7.Text = t.ToString(); }
                else
                {

                    Label7.Visible = false;
                }
            }
            else
            {
                Response.Write("Enter valid booking id");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {   
            carrentalEntities db = new carrentalEntities();
            int id = Int32.Parse(bookingid.Text);
            DateTime actenddate = DateTime.Now;
            // Session["pay"] = t.ToString();
            carno = Label3.Text;

            booking b = new booking();
            TimeSpan ts = actenddate.Subtract(enddate);
            double hr = ts.TotalHours;
            var vid = from p in db.cardatas where p.carno == carno select p;
            int vehicle = 0;
            if (vid.Any())
            {
                foreach (var y in vid)
                {
                    vehicle = y.vehicleid;
                }
            }

            var rent = from z in db.vehicles where z.vehicleid == vehicle select z;
            int renthr = 0;
            if (rent.Any())
            {
                foreach (var y in rent)
                {
                    renthr = y.priceperday;
                }
            }

            
          //  total = renthr * hr * 1.05;
           // int t = (int)total;

           

            var q2 = (from p in db.bookings where p.bookingid == id select p).ToList();
            if (q2.Any())
            {
                foreach (var i in q2.Where(w => w.bookingid == id))
                {
                    i.status = "returned";
                    i.actualenddate = actenddate;
                    i.penaltyamount = Int32.Parse(Label7.Text);
                }

            }
        
        string cno = Label3.Text.ToString();
            DateTime dt1 = Convert.ToDateTime(Label4.Text.ToString());
            DateTime dt2 = Convert.ToDateTime(Label5.Text.ToString());
            var x = (from y in db.carstatus where y.carno == cno && y.startdate == dt1 && y.enddate == dt2
                         select y).FirstOrDefault();
                 db.carstatus.Remove(x);
                 db.SaveChanges();
            
            string msg = "car returned successfully!!";

            Response.Redirect("chaufferprofile.aspx?"+msg);
                
            

    
        }

        
    }
       
        }

        
    
