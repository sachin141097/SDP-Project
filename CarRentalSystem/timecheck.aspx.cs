using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class timecheck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString()!="Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            CompareValidator1.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");
            //CompareValidator2.ValueToCompare = Convert.ToDateTime(sdate.Text.ToString()).ToString();
            //Response.Write(DateTime.Now);
            

            
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            string one = sdate.Text;
            string two = stime.Text;
            string three = edate.Text;
            string four = etime.Text;
            DateTime dt1 = Convert.ToDateTime(one + " " + two);
            DateTime dt2 = Convert.ToDateTime(three + " " + four);
            TimeSpan ts = dt2.Subtract(dt1);
            double hr = ts.TotalHours;
            Session["startdate"] = dt1.ToString();
            Session["enddate"] = dt2.ToString();
            Session["sdate"] = sdate.Text.ToString();
            Session["edate"] = edate.Text.ToString();
            Session["stime"] = stime.Text.ToString();
            Session["etime"] = etime.Text.ToString();
            Session["duration"] = hr.ToString();
            Response.Redirect("check.aspx");

        }

        protected void etime_TextChanged(object sender, EventArgs e)
        {
            string one = sdate.Text;
            string two = stime.Text;
            string three = edate.Text;
            string four = etime.Text;
            DateTime dt1 = Convert.ToDateTime(one + " " + two);
            //DateTime dnow = DateTime.Now;
            //TimeSpan tsnow = dnow.Subtract(dt1);
            //double hr1 = tsnow.TotalHours;
            DateTime dt2 = Convert.ToDateTime(three + " " + four);
            TimeSpan ts = dt2.Subtract(dt1);
            double hr = ts.TotalHours;

            
            du.Text = hr.ToString();
            if(hr<=0)
            {
                Response.Write("<script>alert('Enter a valid endtime');</script>");
                Button1.Visible = false;
            }
            else
            {
                Button1.Visible = true;
            }

        }

        protected void stime_TextChanged(object sender, EventArgs e)
        {
            string one = sdate.Text;
            string two = stime.Text;
            DateTime dt1 = Convert.ToDateTime(one + " " + two);
            DateTime dnow = DateTime.Now;
            TimeSpan tsnow = dt1.Subtract(dnow);
            double hr1 = tsnow.TotalHours;
           // Response.Write(hr1);
            if (hr1 < 0)
            {
                Response.Write("<script>alert('Enter a valid starttime');</script>");

                Button1.Visible = false;
            }
            else
            {
                Button1.Visible = true;

            }




        }
    }
}