using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class carrequests : System.Web.UI.Page
    {
        SqlConnection myconn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Admin")
            {
                string msg = "Access denied";
                Response.Redirect("login.aspx?" + msg);
            }
        }
        string no, brand1, color1, model1, choice1, image, res;
        int capacity1 ,sellp,id,rentp,owid;
        double mileage1;
        carrentalEntities db = new carrentalEntities();
        string update,email;
        


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            
            //car c = new car();
            cardata cd = new cardata();
            vehicle v = new vehicle();
         no = row.Cells[1].Text;
            brand1 = row.Cells[3].Text;
             model1 = row.Cells[4].Text;
             color1 = row.Cells[5].Text;
            capacity1 = Int32.Parse(row.Cells[6].Text);
           mileage1 = Double.Parse(row.Cells[7].Text);
            rentp = Int32.Parse(row.Cells[8].Text);
            image = row.Cells[9].Text;
            owid = Int32.Parse(row.Cells[13].Text);

             res = row.Cells[10].Text;
            carno.Text = no;
            brand.Text = brand1;
            model.Text = model1;
            color.Text = color1;
            capacity.Text = row.Cells[6].Text;
            mileage.Text = row.Cells[7].Text;
            rentprice.Text = row.Cells[8].Text;
            carimage.Text = image;
            sdate.Text = row.Cells[11].Text;
            edate.Text = row.Cells[12].Text;
            ownid.Text = row.Cells[13].Text;
           


           

        }
        private void sendmail(string subject)
        {
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            int owid3 = Int32.Parse(ownid.Text);
            
            carrentalEntities db = new carrentalEntities();
            owner oo = db.owners.Where(x => x.oid == owid3).FirstOrDefault<owner>();
            string emailid = oo.email;
            //Response.Write(emailid);

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            mail.To.Add(new MailAddress(emailid));
            mail.Subject = subject;
            mail.Body = "Your Car Request has been accepted.Your Carno:" + carno.Text.ToString();
            mail.Body += "Offered rentprice:" + rentprice.Text.ToString();

            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "Qtnsqc16");
            smtp.Send(mail);
        }



        protected void add_Click(object sender, EventArgs e)
        {
            string brand2 = brand.Text;
            string model2 = model.Text;
            string color2 = color.Text;
            int capacity2 = Int32.Parse(capacity.Text);
            double mileage2 = Double.Parse(mileage.Text);
            string no2 = carno.Text;
            string image2 = carimage.Text;
            int sp2 = Int32.Parse(rentprice.Text);
            int oid2 = Int32.Parse(ownid.Text);
            vehicle v = new vehicle();
            v.brand = brand2;
            v.model = model2;
            v.color = color2;
            v.capacity = capacity2;
            v.mileage = mileage2;
           // v.carno = no2;
            myconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            cmd = new SqlCommand();
            cmd.Connection = myconn;
            myconn.Open();
            update = "update vehicle set quantity=quantity+" + 1 + "where model=@model and brand=@brand and color=@color";
            cmd.Parameters.AddWithValue("@model", model2);
            cmd.Parameters.AddWithValue("@brand", brand2);
            cmd.Parameters.AddWithValue("@color", color2);
            
           // myconn.Open();
            cmd.CommandText = update;
            int r = cmd.ExecuteNonQuery();
            if (r == 0)
            {
                string insert = "insert into vehicle (color,model,brand,capacity,mileage,quantity,priceperday) values(@color2,@model2,@brand2,@capacity2,@mileage2,@quantity2,@priceperday2)";
                cmd.Parameters.AddWithValue("@color2",color2);
                cmd.Parameters.AddWithValue("@model2", model2);
                cmd.Parameters.AddWithValue("@brand2", brand2);
                cmd.Parameters.AddWithValue("@capacity2", capacity2);
                cmd.Parameters.AddWithValue("@mileage2", mileage2);
                //cmd.Parameters.AddWithValue("@capacit", capacity2);
                cmd.Parameters.AddWithValue("@quantity2", 1);
                cmd.Parameters.AddWithValue("@priceperday2", pph.Text);



                cmd.CommandText = insert;
                cmd.ExecuteNonQuery();
                myconn.Close();

                id = (from record in db.vehicles orderby record.vehicleid descending select record.vehicleid).First();
                cardata cd = new cardata();
                cd.carimage = image2;
                cd.rentprice = sp2;
                cd.carno = no2;
                cd.vehicleid = id;
                cd.startdate = Convert.ToDateTime(sdate.Text.ToString());
                cd.enddate = Convert.ToDateTime(edate.Text.ToString());
                cd.oid = oid2;
                db.cardatas.Add(cd);
                db.SaveChanges();
                try
                {
                    sendmail("Your car request has been accepted");
                }
                catch(Exception exp)
                {
                    Response.Write(exp);
                }


            }
            else
            {
                id = (from record in db.vehicles where  record.brand==brand2 && record.model==model2 && record.color==color2 select record.vehicleid).First();
                cardata cd = new cardata();
                cd.carimage = image2;
                cd.rentprice = sp2;
                cd.carno = no2;
                cd.vehicleid = id;
                cd.startdate = Convert.ToDateTime(sdate.Text.ToString());
                cd.enddate = Convert.ToDateTime(edate.Text.ToString());
                cd.oid = oid2;

                db.cardatas.Add(cd);
                db.SaveChanges();
                try
                {
                    sendmail("Your car request has been accepted");
                }
                catch (Exception exp)
                {
                    Response.Write(exp);
                }



            }

            /* var vid=from x in db.vehicles where x.carno==cd.carno select x.vehicleid;
    vlid = int.Parse(vid.ToString());
    */






        }
    }
}