using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection myconn;
        SqlCommand cmd;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                myconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                cmd = new SqlCommand();
                cmd.Connection = myconn;
                myconn.Open();
                DateTime starttime = Convert.ToDateTime(Session["startdate"].ToString());
                DateTime endtime = Convert.ToDateTime(Session["enddate"].ToString());
                string query = "SELECT c.carno, c.vehicleid, c.carimage, c.isfor, c.sellprice, v.color, v.model, v.brand, v.capacity, v.mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid";

                cmd.CommandText = query;
                SqlDataAdapter myad = new SqlDataAdapter(query, myconn);
                DataSet ds = new DataSet();
                myad.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                myconn.Close();
            }

        }
        protected void datalist1_itemcommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewdetail")
            {
                String s = e.CommandArgument.ToString();
                
                Response.Redirect("viewcardetails.aspx?carno=" + s);
            }
        }

    }
}