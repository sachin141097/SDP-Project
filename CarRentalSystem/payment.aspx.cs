using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class payment1 : System.Web.UI.Page
    {
        carrentalEntities db = new carrentalEntities();
        int pay = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["role"].ToString() != "Customer")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
            int f = Int32.Parse(Session["pay"].ToString());
            Session["pay"] = f;
            pay = (int)f;
           // pay = 100;
            Label6.Text = pay.ToString();
            if (IsPostBack)
            {
                if (DropDownList1.SelectedItem.Value == "card")
                {
                    Label2.Visible = true;
                    Label3.Visible = true;
                    Label4.Visible = false;
                    cardno.Visible = true;
                    cardname.Visible = true;
                    phoneno.Visible = false;
                }
                if (DropDownList1.SelectedItem.Value == "paytm")
                {
                    Label2.Visible = false;
                    Label3.Visible = false;
                    Label4.Visible = true;
                    phoneno.Visible = true;
                    cardno.Visible = false;
                    cardname.Visible = false;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button2.Visible = true;
            otp.Visible = true;
            Button3.Visible = true;
            string otpl = string.Empty;
            otpl = GenerateOTP();
            //Label1.Text = otpl;
            Session["otp"] = otpl;
            SendOTP(otpl);
            otp.Visible = true;
            Button2.Visible = true;
            Button3.Visible = true;
        }
        protected string GenerateOTP()
        {
            //string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            //string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "1234567890";
            string characters = numbers;
            //characters += alphabets + small_alphabets + numbers;
            string otpl = string.Empty;
            int length = 6;

            for (int i = 0; i < length; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    character = characters.ToCharArray()[index].ToString();
                } while (otpl.IndexOf(character) != -1);
                otpl += character;
            }
            return otpl;
        }
        protected void SendOTP(string otpl)
        {
            string sendr = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];

            //var em = from u in db.Logins where u.LoginId == Session["loginid"] select u;
            //string Email = "abhivachhani8@gmail.com";
            string Email = Session["loginid"].ToString();
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(sendr);
                mail.To.Add(new MailAddress(Email));
                mail.Subject = "payment verification";
                mail.Body = "Otp is" + otpl;
                SmtpClient smtp = new SmtpClient(server, 587);
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential(sendr, "Qtnsqc16");
                smtp.Send(mail);
                //Response.Write(mail.Body);
            }
            catch (Exception)
            { }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string otpl = string.Empty;
            otpl = GenerateOTP();
            //Label1.Text = otpl;
            Session["otp"] = otpl;
            SendOTP(otpl);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string otpl = "";
            otpl = (Session["otp"]).ToString();
            int bid = Int32.Parse(Session["bookingid"].ToString());

            
            if (otp.Text == otpl)
            {
                //Response.Write("otp matched");
                payment p = new payment();
                p.amountpaid = Int32.Parse(Label6.Text);
                p.bookingid = Int32.Parse(Session["bookingid"].ToString());
                //p.bookingid = 0;
                p.paymentmode = DropDownList1.SelectedItem.Text;
                p.nameoncard = cardname.Text;
                p.cardno = (cardno.Text);
                p.phone = phoneno.Text;
                p.date = DateTime.Now;
                db.payments.Add(p);
                db.SaveChanges();
                Label7.Text = "payment done succesfully";
                booking bb = db.bookings.Where(x => x.bookingid ==bid).FirstOrDefault<booking>();
                Session["amount"] = Int32.Parse(Label6.Text);
                Session["address"] = bb.address.ToString();
                Response.Redirect("viewpayslip.aspx");
                
            }
            else
            {
                Label7.Text = "otp doesn't matched";
                //Response.Write("error");
            }
        }

        protected void cardno_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedItem.Text == "card")
            {
                Label2.Visible = true;
                Label3.Visible = true;
                Label4.Visible = false;
                cardno.Visible = true;
                cardname.Visible = true;
                phoneno.Visible = false;
            }
            else
            {
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = true;
                cardno.Visible = false;
                cardname.Visible = false;
                phoneno.Visible = true;
            }
        }
    }
}