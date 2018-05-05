using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class addchauffer : System.Web.UI.Page
    {
        string pass;
        protected void Page_Load(object sender, EventArgs e)
        {
            string msg = "Access denied";
            if(Session["role"].ToString()!="Admin")
            {
                Response.Redirect("login.aspx?" + msg);
            }
        }
        private string GetStr()
        {
            var chars = "0123456789";
            var stringChars = new char[4];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString;
        }
        private void sendmail(string subject)
        {
            //pass = GetStr();
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            carrentalEntities db = new carrentalEntities();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            mail.To.Add(new MailAddress(email.Text));
            mail.Subject = subject;
            mail.Body = "Your loginid is your email and your password is:" + Session["pwd"].ToString();
            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "Qtnsqc16");
            smtp.Send(mail);
        }


        protected void add_Click(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            chauffer c = new chauffer();
            Login l = new Login();
            pass = GetStr();
            Session["pwd"] = pass.ToString();
            c.firstname = firstname.Text;
            c.lastname = lastname.Text;
            c.licenseno = licenceno.Text;
            c.address = address.Text;
            c.salary = Int32.Parse(salry.Text);
            c.email = email.Text;
            c.phone = mobileno.Text;
            string r = "DeliveryPerson";
            l.Role = r;
            l.LoginId = email.Text;
            l.Password = pass;
            db.Logins.Add(l);
            db.chauffers.Add(c);


            //db.SaveChanges();


            try
            {
                int n = db.SaveChanges();
               sendmail("Successfully registered");
                msg.Text = "Successfully registered";
                msg.ForeColor = System.Drawing.Color.Green;



            }
            catch (Exception err)
            {
                //msg.Text = "Some Error Occured";
                // msg.ForeColor = System.Drawing.Color.Red;
                Response.Write(err);

            }


        }

        protected void reset_Click(object sender, EventArgs e)
        {
            firstname.Text = "";
            lastname.Text = "";
            salry.Text = "";
            licenceno.Text = "";
            address.Text = "";
            email.Text = "";
            mobileno.Text = "";
        }
    }
}