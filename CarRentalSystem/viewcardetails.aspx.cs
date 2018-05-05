using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class CarDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Response.Write("hello world");
            // string check = Request.QueryString["carno"].ToString();
            //Response.Write(check);
            
            
                Session["carno"] = Request.QueryString["carno"].ToString();
            

        }
        protected void datalist1_itemcommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "book")
            {
                String s = e.CommandArgument.ToString();
                Response.Redirect("book.aspx?vehicleid=" + s);
            }

        }
    }
}