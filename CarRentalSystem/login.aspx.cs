using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class hi : System.Web.UI.Page
    {
        static bool idflag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                idflag = false;
                msg.Text = "";
            }
            if(Session["role"].ToString()=="Admin")
            {
                Response.Redirect("Admin.aspx");
            }
            else if(Session["role"].ToString()=="Owner")
            {
                Response.Redirect("ownerprofile.aspx");
            }
            else if(Session["role"].ToString()=="Customer")
            {
                Response.Redirect("Customer.aspx");
            }
            else if(Session["role"].ToString()=="DeliveryPerson")
            {
                Response.Redirect("chaufferprofile.aspx");
            }
            
        }

        protected void login_Click(object sender, EventArgs e)
        {
            string loginid = uname.Text;
            string password = pwd.Text;
            string role = DropDownList1.SelectedItem.Text;
            if (uname.Text == "" || pwd.Text == "")
            {
                msg.Text = "All details are mandatory.";
                msg.ForeColor = System.Drawing.Color.Red;

                return;
            }
            else
            {
                ExampleCaptcha.UserInputID = CaptchaCodeTextBox.ClientID;
                if (IsPostBack)
                {
                    bool isHuman = ExampleCaptcha.Validate(CaptchaCodeTextBox.Text);
                    CaptchaCodeTextBox.Text = null;
                    if (!isHuman)
                    {
                        msg.Text = "Incorrect Captcha.";
                        msg.ForeColor = System.Drawing.Color.Red;

                    }
                    else
                    {
                        try
                        {
                            carrentalEntities db = new carrentalEntities();
                            if (!idflag)
                            {
                                var q = from i in db.Logins where i.LoginId == loginid && i.Role == role && i.Password == password select i;
                                if (q.Any())
                                {
                                    foreach (var i in q)
                                    {
                                        Session["role"] = i.Role;
                                        Session["loginid"] = i.LoginId;
                                    }
                                    if (Session["role"].ToString() == "Admin")
                                    {
                                        Response.Redirect("Admin.aspx");
                                    }
                                    else if (Session["role"].ToString() == "Customer")
                                    {
                                        Response.Redirect("timecheck.aspx");
                                    }
                                    else if (Session["role"].ToString() == "Owner")
                                    {
                                        Response.Redirect("ownerprofile.aspx");
                                    }
                                    else if (Session["role"].ToString() == "DeliveryPerson")
                                    {
                                        Response.Redirect("chaufferprofile.aspx");
                                    }




                                }
                                else
                                {
                                    msg.Text = "Incorrect Credentials. Please try again.";
                                    msg.ForeColor = System.Drawing.Color.Red;


                                }
                            }

                        }
                        catch (Exception ex)
                        {
                            msg.Text = "Exception";
                            msg.ForeColor = System.Drawing.Color.Red;

                        }
                    }
                }



            }
        }
    }
}