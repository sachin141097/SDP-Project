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
    public partial class viewcarrequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].ToString()!="DeliveryPerson")
            {
                string s = "Access denied";
                Response.Redirect("login.aspx" + s);
            }
            carrentalEntities db = new carrentalEntities();
            string mail = Session["loginid"].ToString();
            chauffer cc = db.chauffers.Where(x => x.email == mail).FirstOrDefault<chauffer>();
            int driverid = cc.did;
            booking bb = db.bookings.Where(x => x.did == driverid).FirstOrDefault<booking>();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT b.bookingid,b.cid,b.startdate,b.enddate FROM booking AS b where (b.startdate>=@dnow) AND b.did="+driverid+"", con);
                cmd.Parameters.AddWithValue("@dnow", DateTime.Now);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            carrentalEntities db = new carrentalEntities();
            int customerid = Int32.Parse(row.Cells[2].Text);

            customer cc = db.customers.Where(x => x.cid == customerid).FirstOrDefault<customer>();
            name.Text = cc.firstname;
            email.Text = cc.email;
            phone.Text = cc.mobileno;
            booking bb = db.bookings.Where(x => x.cid == customerid).FirstOrDefault<booking>();
            address.Text = bb.address;

        }
    }
}