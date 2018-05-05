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
    public partial class viewfeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["role"].ToString() != "Admin")
            {
                string s = "Access denied";
                Response.Redirect("login.aspx" + s);
            }
            carrentalEntities db = new carrentalEntities();
            
            
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT b.cid,b.rating,b.fid,b.carno FROM feedback AS b" , con);
               // cmd.Parameters.AddWithValue("@dnow", DateTime.Now);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label1.Visible = false;
            TextBox1.Visible = false;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Visible = true;
            TextBox1.Visible = true;
            GridViewRow row = GridView1.SelectedRow;
            carrentalEntities db = new carrentalEntities();
            feedback f = new feedback();
            int feedbackid = Int32.Parse(row.Cells[3].Text);
            feedback cc = db.feedbacks.Where(x => x.fid == feedbackid).FirstOrDefault<feedback>();


            TextBox1.Text = cc.description;
            
        }
    }
}