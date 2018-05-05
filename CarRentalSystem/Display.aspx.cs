using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new carrentalEntities();
            IQueryable<Cardetail> query;
            query = from i in db.Cardetails
                    select i;

            ListView1.DataSource = query.ToList();
            ListView1.DataBind();

        }

       }
}