using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class temp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            var cars = (from u in db.Cardetails
                       let vehicleid = from x in db.vehicles
                                       select  x.vehicleid
                       select u);
            ListBox l1=new ListBox();
            foreach(var i in cars)
            {
                l1.Items.Add(i.carno);
                Response.Write(i.carno+"\n");
            }
            PlaceHolder1.Controls.Add(l1);
        }
    }
}