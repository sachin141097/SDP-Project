using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CarRentalSystem
{
    public partial class check : System.Web.UI.Page
    {
        SqlConnection myconn;
        SqlCommand cmd;
               

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        protected void datalist1_itemcommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewdetail")
            {
                String s = e.CommandArgument.ToString();

                Response.Redirect("viewcardetails.aspx?carno=" + s);
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}