using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class forgot : System.Web.UI.Page
    {
        string pwd, unm;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void get_Click(object sender, EventArgs e)
        {
            string sendr = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            string role = DropDownList1.SelectedItem.Text;

            string s = Email.Text.Trim().ToString();
            carrentalEntities c = new carrentalEntities();
            var k = (from u in c.Logins where u.LoginId == s && u.Role==role select u);
            var user = (from u in c.Logins where u.LoginId == s && u.Role==role select u).FirstOrDefault();
            foreach (var i in k)
            {

                pwd = i.Password.ToString();
                //unm = i.Username.ToString();
            }
            if (user == null)
            {
                //Response.Write("hello");
                msg.Text = "User not exist";
                msg.Visible = true;



            }
            else
            {
                try
                {
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress(sendr);

                    mail.To.Add(new MailAddress(Email.Text.ToString()));
                    mail.Subject = "your Login credentials";
                    mail.Body = "Your LoginId is your email" + " " + "Your Password is:" + pwd;



                    SmtpClient smtp = new SmtpClient(server, 587);
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Credentials = new System.Net.NetworkCredential(sendr, "Qtnsqc16");
                    smtp.Send(mail);
                    Response.Redirect("~/login.aspx?msg=mail+sent");

                    Response.Write(mail.Body);
                }
                catch (Exception err)
                {
                    //Response.Write(err);
                    msg.Text = "Mail not sent try again";
                    msg.Visible = true;
                }
            }
        }
    }
}






              
     