using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class displaycar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void datalist1_itemcommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName=="viewdetail")
            {
                String s = e.CommandArgument.ToString();
                Response.Redirect("viewcardetails.aspx?carno="+s);
            }
        }


        /*protected void image1_click(object sender,ImageClickEventArgs e)
{
    Response.Redirect("first.aspx");
}*/
    }
}