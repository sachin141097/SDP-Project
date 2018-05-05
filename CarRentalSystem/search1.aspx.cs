using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class search1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text == "price")
            {
                DataList1.DataSource = priceds;
                DataList1.DataBind();
            }
            else if (DropDownList1.SelectedItem.Text == "model")
            {
                DataList1.DataSource = modelds;
                DataList1.DataBind();

            }
            else if (DropDownList1.SelectedItem.Text == "mileage")
            {
                DataList1.DataSource = mileageds;
                DataList1.DataBind();
            }
            else if (DropDownList1.SelectedItem.Text == "capacity")
            {
                DataList1.DataSource = capacityds;
                DataList1.DataBind();
            }
        }
        /*protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text == "price")
            {
                sellprice.Visible = true;
                model.Visible = false;
                capacity.Visible = false;
                mileage.Visible = false;

            }
            else if (DropDownList1.SelectedItem.Text == "model")
            {
                sellprice.Visible = false;
                model.Visible = true;
                capacity.Visible = false;
                mileage.Visible = false;

            }
            else if (DropDownList1.SelectedItem.Text == "capacity")
            {
                sellprice.Visible = false;
                model.Visible = false;
                capacity.Visible = true;
                mileage.Visible = false;

            }
            else if (DropDownList1.SelectedItem.Text == "mileage")
            {
                sellprice.Visible = false;
                model.Visible = false;
                capacity.Visible = false;
                mileage.Visible = true;

            }
        }*/

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
    