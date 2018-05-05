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
    public partial class viewbookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString()!="Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            carrentalEntities db = new carrentalEntities();
            string mail = Session["loginid"].ToString();
            customer cc = db.customers.Where(x => x.email == mail).FirstOrDefault<customer>();
            int customerid = cc.cid;
            booking bb = db.bookings.Where(x => x.cid == customerid).FirstOrDefault<booking>();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT b.bookingid,b.carno,b.startdate,b.enddate,b.rentalamount,b.did FROM booking AS b where b.cid=" + customerid + "", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            address.Visible = false;
            addr.Visible = false;




        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            carrentalEntities db = new carrentalEntities();
            int bookid = Int32.Parse(row.Cells[1].Text);
            booking bb = db.bookings.Where(x => x.bookingid == bookid).FirstOrDefault<booking>();
            address.Text = bb.address;
            address.Visible = true;
            addr.Visible = true;

        }
    }
}