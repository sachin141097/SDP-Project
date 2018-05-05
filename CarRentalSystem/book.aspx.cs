using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class book1 : System.Web.UI.Page
    {
        SqlConnection myconn;
        SqlCommand cmd;
        int available,mo,yr;
        DateTime dt1, dt2;
        string one, two, three, four;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            myconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            cmd = new SqlCommand();
            cmd.Connection = myconn;
            myconn.Open();
            string q = "SELECT c.carno, c.vehicleid,c.carimage AS carimage, v.color, v.model AS model, v.brand AS brand, v.capacity AS capacity, v.mileage AS mileage, v.quantity AS quantity,v.priceperday AS priceperday FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE (v.vehicleid=" + Request.QueryString["vehicleid"] + ")";
            cmd.CommandText = q;
            SqlDataReader rdr = cmd.ExecuteReader();
            
            while(rdr.Read())
            {
                model1.Text = rdr["model"].ToString();
                brand1.Text = rdr["brand"].ToString();
                vid.Text = rdr["vehicleid"].ToString();
                available = Int32.Parse(rdr["quantity"].ToString());
                rprice.Text = rdr["priceperday"].ToString();

            }
            myconn.Close();
            sdate.Text = Session["sdate"].ToString();
            edate.Text = Session["edate"].ToString();
            stime.Text = Session["stime"].ToString();
            etime.Text = Session["etime"].ToString();
            duration.Text = Session["duration"].ToString();
            int r = Int32.Parse(rprice.Text);
            int du = Int32.Parse(duration.Text);
            int total = r * du;
            ppay.Text = total.ToString();
            DateTime dd1 = Convert.ToDateTime(sdate.Text.ToString());
            DateTime dd2 = Convert.ToDateTime(edate.Text.ToString());
             mo = dd1.Month;
            yr = dd1.Year;
            month.Text = mo.ToString();
            year.Text = yr.ToString();

            if (IsPostBack)
            {
                DateTime d1 = Convert.ToDateTime(sdate.Text.ToString());
                DateTime d2 = Convert.ToDateTime(edate.Text.ToString());
                DateTime curr = DateTime.Today;
               
                DateTime start = Convert.ToDateTime(sdate.Text.Trim(), new CultureInfo("en-GB"));
                DateTime end = Convert.ToDateTime(edate.Text.Trim(), new CultureInfo("en-GB"));
                int re = DateTime.Compare(d1, curr);
                int re1 = DateTime.Compare(d2, curr);
                if(re<0 || re1<0)
                {
                    msg.Text = "enter valid date";
                    msg.ForeColor = System.Drawing.Color.Red;


                }
                 one = sdate.Text;
                two = stime.Text;
                 three = edate.Text;
                 four = etime.Text;
                 dt1 = Convert.ToDateTime(one + " " + two);
                 dt2 = Convert.ToDateTime(three + " " + four);
                TimeSpan ts = dt2.Subtract(dt1);
                double hr = ts.TotalHours;
                
               // du.Text = hr.ToString();


                //double result = (d2 - d1).TotalDays + 1;
               // duration.Text = hr.ToString();
               

            }




        }

        protected void book_Click(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            booking b = new booking();
            cardata cd = new cardata();
            string mail = Session["loginid"].ToString();
            int custid;
            var q = from i in db.customers where i.email == mail select i;
            if(q.Any())
            {
                foreach(var i in q)
                {
                   b.cid = i.cid;
                }
            }
            DateTime d1= Convert.ToDateTime(Session["startdate"].ToString());
            DateTime d2 = Convert.ToDateTime(Session["enddate"].ToString());
            // var a = ((from x in db.carstatus where ((d1 >= x.startdate) && (d1 <= x.enddate)) || ((d2 >= x.startdate) && (d2 <= x.enddate)) select x.did));

            //var ab = (from y in db.chauffers select y.did).ToList();
            //var ans = ab.Except(a);
            //Response.Write(ans);
            string check = "SELECT did FROM chauffer  WHERE did NOT IN(SELECT did FROM carstatus AS cs WHERE ((@d1 >= cs.startdate) AND (@d1 <= cs.enddate)) OR ((@d2 >= cs.startdate) AND (@d2 <= cs.enddate)) )";
            cmd.Parameters.AddWithValue("@d1", Convert.ToDateTime(Session["startdate"].ToString()));
            cmd.Parameters.AddWithValue("@d2", Convert.ToDateTime(Session["enddate"].ToString()));
            myconn.Open();
            cmd.CommandText = check;
            SqlDataReader rdr = cmd.ExecuteReader();
            int driverid=0;
            while(rdr.Read())
            {
                driverid = Int32.Parse(rdr["did"].ToString());
                break;

            }
            //Response.Write(driverid);
            b.startdate = Convert.ToDateTime(one + " " + two);
            b.enddate= Convert.ToDateTime(three+" "+four);
            b.rentalamount = Int32.Parse(ppay.Text.ToString());
            //b.type = "Rent";
            b.carno = Session["carno"].ToString();
            b.did = driverid;
            b.month = mo;
            b.year = yr;
            b.address = address.Text;
            db.bookings.Add(b);
            string no = Session["carno"].ToString();


            /*  var q2 = (from p in db.cardatas where p.carno == no select p).ToList();
              if(q2.Any())
              {
                  foreach(var i in q2.Where(w=>w.carno==no))
                  {
                      //i.status = "booked";

                  }
              }*/
            carstatu cr = new carstatu();
            cr.carno = Session["carno"].ToString();
            cr.startdate = Convert.ToDateTime(one + " " + two);
            cr.enddate= Convert.ToDateTime(three + " " + four);
            cr.status = "booked";
            cr.did = driverid;
            db.carstatus.Add(cr);

            db.SaveChanges();
            double tot = Double.Parse(ppay.Text);
            Session["pay"] = (int)tot;
            int id = (from record in db.bookings orderby record.bookingid descending select record.bookingid).First();
            //for generating payslip
            Session["bookingid"] = id.ToString();
            booking bb = db.bookings.Where(x => x.bookingid == id).FirstOrDefault<booking>();
            Session["st_date"] = bb.startdate.ToString();
            Session["ed_date"] = bb.enddate.ToString();
            Session["carno"] = bb.carno.ToString();
            cardata cx = db.cardatas.Where(y => y.carno == bb.carno.ToString()).FirstOrDefault<cardata>();
            int ve_id = cx.vehicleid;
            vehicle vv = db.vehicles.Where(yy => yy.vehicleid == ve_id).FirstOrDefault<vehicle>();
            Session["model"] = vv.model.ToString();
            Session["brand"] = vv.brand.ToString();
            Session["color"] = vv.color.ToString();
            Session["capacity"] = vv.capacity.ToString();
            Session["mileage"] = vv.mileage.ToString();
            Session["address"] = bb.address.ToString();

            
            Response.Redirect("applyoffer.aspx");

        }

       
    }
}