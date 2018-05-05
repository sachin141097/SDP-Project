using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalSystem
{
    public partial class viewpayslip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Customer")
            {
                string s = "Access denied";
                Response.Redirect("login.aspx" + s);
            }

        }

        protected void view_Click(object sender, EventArgs e)
        {
            try
            {
                //string username = (string)Session["loginid"];
                string bookingid = Session["bookingid"].ToString();
                string startdate = Session["st_date"].ToString();
                string enddate = Session["ed_date"].ToString();
                string brand = Session["brand"].ToString();
                string model = Session["model"].ToString();
                string colour = Session["color"].ToString();
                string capacity=Session["capacity"].ToString();
                string mileage=Session["mileage"].ToString();
                string amount = Session["amount"].ToString();
                string carno = Session["carno"].ToString();
                string address = Session["address"].ToString();
                Phrase phrase = null;
                PdfPCell cell = null;
                PdfPTable table = null;
                BaseColor color = null;
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=PaymentSlip.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                table = new PdfPTable(2);
                table.HorizontalAlignment = Element.ALIGN_LEFT;
                table.SetWidths(new float[] { 0.3f, 1f });
                table.SpacingBefore = 20f;

                //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                cell = PhraseCell(new Phrase("PAYMENT SLIP\n\n\n", FontFactory.GetFont("Arial", 20, Font.UNDERLINE, new BaseColor(0, 0, 0))), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                table.AddCell(cell);
                string ss = "";
                ss += "Carno  :" + carno + "\n\n";
                ss += "Model  :" + model + "\n\n";
                ss += "Brand  :" + brand + "\n\n";
                ss += "Color  :" + colour + "\n\n";
                ss += "Capacity :" + capacity + "\n\n";
                ss += "Mileage :" + mileage + "\n\n";
                ss += "BookingId  :" +bookingid + "\n\n";
                ss += "Rent StartDate  :" + startdate + "\n\n";
                ss += "Rent EndDate  :" + enddate + "\n\n";
                ss += "Amount Paid  :" + amount + "\n\n";
                ss += "Address  :" + address + "\n\n";


                cell = PhraseCell(new Phrase(ss), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 30f;
                table.AddCell(cell);
                pdfDoc.Add(table);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();










            }
            catch (Exception err)
            {

            }
        }
        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = new BaseColor(255, 255, 255);
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            return cell;
        }
    }
}