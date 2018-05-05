using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class addcardetails : System.Web.UI.Page
    {
        carrentalEntities db = new carrentalEntities();
        string one, two, three, four;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString()!="Owner")
            {
                string m = "Access denied";
                Response.Redirect("login.aspx?" + m);
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            CompareValidator1.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");
            //CompareValidator2.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");

            
        }
        HttpPostedFile postedfile = null;
        carrequest cd = new carrequest();
       

        protected void add_Click1(object sender, EventArgs e)
        {
            one = sdate.Text;
            two = starttime.Text;
            three = edate.Text;
            four = endtime.Text;


            string mail = Session["loginid"].ToString();
            owner oo = db.owners.Where(x => x.email == mail).FirstOrDefault<owner>();
            string status = "pending";
            cd.carno = carno.Text;
            cd.color = color.Text;
            cd.brand = brand.Text;
            cd.model = model.Text;
            cd.capacity = Int32.Parse(capacity.Text);
            cd.mileage = Double.Parse(mileage.Text);
            cd.requeststatus = status;
            cd.rentprice = Int32.Parse(rentp.Text);
            cd.startdate = Convert.ToDateTime(one + " " + two);
            cd.enddate = Convert.ToDateTime(three + " " + four);
            cd.requeststatus = status;
            cd.oid = oo.oid;

            postedfile = carimage.PostedFile;
            string str = Path.GetFileName(postedfile.FileName);
            Stream stream = postedfile.InputStream;
            BinaryReader br = new BinaryReader(stream);
            br.ReadBytes((int)stream.Length);
            cd.carimage = "~/Cars_pic/" + str;
            postedfile.SaveAs(Server.MapPath("~/Cars_pic/") + str);
            db.carrequests.Add(cd);

            try
            {
                int n = db.SaveChanges();
                msg.Text = "Car request sent successfully";
                msg.ForeColor = System.Drawing.Color.Green;



            }
            catch (Exception err)
            {
                msg.Text = "Some Error Occured";
                msg.ForeColor = System.Drawing.Color.Red;

            }
        }
        protected void endtime_TextChanged(object sender, EventArgs e)
        {
            one = sdate.Text;
            two = starttime.Text;
            three = edate.Text;
            four = endtime.Text;
            DateTime dt1 = Convert.ToDateTime(one + " " + two);
            DateTime dt2 = Convert.ToDateTime(three + " " + four);
            TimeSpan ts = dt2.Subtract(dt1);
            double hr = ts.TotalHours;
            du.Text = hr.ToString();
            if (hr <= 0)
            {
                Response.Write("<script>alert('Enter a valid endtime');</script>");
                add.Visible = false;
               
                
            }
            else
            {
                add.Visible = true;
            }



        }



    }
}