using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (DropDownList1.SelectedItem.Text == "Customer")
            {
                licno.Visible = true;
                licenceno.Visible = true;
            }
            else if (DropDownList1.SelectedItem.Text == "Owner")
            {
                licno.Visible = false;
                licenceno.Visible = false;
            }
        }
        private void sendmail(string subject)
        {
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            carrentalEntities db = new carrentalEntities();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            mail.To.Add(new MailAddress(email.Text));
            mail.Subject = subject;
            mail.Body = "Your loginid is your email and your password is:"+pwd.Text;
            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "Qtnsqc16");
            smtp.Send(mail);
        }



        protected void add_Click(object sender, EventArgs e)
        {
            carrentalEntities db = new carrentalEntities();
            string role=DropDownList1.SelectedItem.Text;
            customer c = new customer();
            string fname = firstname.Text;
            string lname = lastname.Text;
            string mno = (mobileno.Text);
            string mail = email.Text;
            string license = licenceno.Text;
            string add = address.Text;
            if(DropDownList1.SelectedItem.Text=="Customer")
            {
                
                //Login l = new Login();
                var already = from x in db.Logins
                              where x.LoginId == email.Text && x.Role==role
                              select x;
                int count = 0;
                foreach (var a in already)
                {
                    count++;
                }


                if (count > 0)
                {
                    msg.Text = "You Have Already Registered, Please Login!!";
                    msg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                else
                {
                    Login l = new Login();
                    l.Role = DropDownList1.SelectedItem.Text.ToString();
                    l.LoginId = email.Text.ToString();
                    l.Password = pwd.Text;
                   c.email = email.Text;
                    c.firstname = fname;
                    c.lastname = lname;
                    c.licenceno = license;
                    c.address = add;
                    c.mobileno = mno;
                    db.customers.Add(c);
                    db.Logins.Add(l);
                    try
                    {
                        int n = db.SaveChanges();
                        sendmail("Successfully registered");
                        msg.Text = "Successfully registered";
                        msg.ForeColor = System.Drawing.Color.Green;



                    }
                    catch (Exception err)
                    {
                        msg.Text = "Some Error Occured";
                        msg.ForeColor = System.Drawing.Color.Red;

                    }

                }


               


            }
            else if(DropDownList1.SelectedItem.Text=="Owner")
            {
                var already = from x in db.Logins
                              where x.LoginId == email.Text && x.Role == role
                              select x;
                int count = 0;
                foreach (var a in already)
                {
                    count++;
                }


                if (count > 0)
                {
                    msg.Text = "You Have Already Registered, Please Login!!";
                    msg.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    Login p = new Login();
                    owner o = new owner();
                     p.Role = DropDownList1.SelectedItem.Text.ToString();
                    p.LoginId = email.Text.ToString();
                    p.Password = pwd.Text;
                    o.email = email.Text;
                    o.firstname = fname;
                    o.lastname = lname;
                    o.address = add;
                    o.phone = mno;
                    db.owners.Add(o);
                    db.Logins.Add(p);
                }
                try
                {
                    int k = db.SaveChanges();
                    sendmail("Successfully registered");
                    msg.Text = "Successfully registered";
                    msg.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception err)
                {
                    msg.Text = "Some Error Occured";
                    msg.ForeColor = System.Drawing.Color.Red;

                }


            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            firstname.Text = " ";
            lastname.Text = "";
            mobileno.Text = "";
            email.Text = "";
            address.Text = "";
            pwd.Text = "";
            

        }
    }
}