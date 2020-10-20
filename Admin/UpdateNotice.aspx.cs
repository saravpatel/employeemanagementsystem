using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UpdateNotice : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    public string HostAdd, FromEmailID, Pass;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
            FromEmailID = ConfigurationManager.AppSettings["FromMail"].ToString();
            Pass = ConfigurationManager.AppSettings["Password"].ToString();

            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress(FromEmailID);
            mailMsg.Subject = "Your Remark.....";
            mailMsg.Body = "Your Remark is :=> " + " <h2>" + txtRemark.Text + "</h2>";
            mailMsg.IsBodyHtml = true;

            mailMsg.To.Add(new MailAddress(txtTo.Text.Trim()));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = HostAdd;
            smtp.UseDefaultCredentials = true;
            smtp.EnableSsl = true;
            NetworkCredential networkCred = new NetworkCredential();
            networkCred.UserName = mailMsg.From.Address;
            networkCred.Password = Pass;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCred;
            smtp.Port = 587;

            smtp.Send(mailMsg);
            //x.sendEmail(txtTo.Text, Convert.ToString(txtSubject.Text), Convert.ToString(txtMessage.Text));
            Response.Write("<script language='javascript'>alert('Remark Sent to Email Address')</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('" + ex.Message.ToString() + "')</script>");

        }
        txtRemark.Text = "";
        txtTo.Text = "";
    }
}