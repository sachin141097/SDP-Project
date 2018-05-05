using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Admin")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            if (!IsPostBack)
            {

            }
            Chart1.Visible = false;

        }
        private void GetEmployeeChartInfo(int month,int year)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT c.vehicleid as Name, COUNT(b.bookingid) AS Total  FROM booking AS b join cardata as c on b.carno = c.carno where b.month="+month +" AND b.year="+year+" GROUP BY c.vehicleid", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }

            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].ChartType = SeriesChartType.Column;
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            Chart1.ChartAreas["ChartArea1"].AxisX.Title = "Vehicle id";
            Chart1.ChartAreas["ChartArea1"].AxisY.Title = "no. of cars rented";
            // Chart1.Legends[0].Enabled = true;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Chart1.Visible = true;
            int month = Int32.Parse(TextBox1.Text);
            int year = Int32.Parse(TextBox2.Text);
            GetEmployeeChartInfo(month,year);

        }
    }
}