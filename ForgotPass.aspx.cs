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

public partial class ForgotPass : System.Web.UI.Page
{

    DataClassesDataContext db = new DataClassesDataContext();
    public string HostAdd, FromEmailID, Pass;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = string.Empty;
        string password = string.Empty;
        string constr = @"Data Source=SARAV-PC\SQLEXPRESS;Initial Catalog=ProjectManagement;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT FName, [Passwrd] FROM EmployeeMaster WHERE Email = @Email"))
            {
              cmd.Parameters.AddWithValue("@Email", TextBox1.Text.Trim());
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.Read())
                    {
                        username = sdr["FName"].ToString();
                        password = sdr["Passwrd"].ToString();
                    }
                }
                con.Close();
            }
        }

        try
        {
            HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
            FromEmailID = ConfigurationManager.AppSettings["FromMail"].ToString();
            Pass = ConfigurationManager.AppSettings["Password"].ToString();

            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress(FromEmailID);
            mailMsg.Subject = "Forget Password";
            mailMsg.Body = "Your Password is :=> " +" <h2>" + password +"</h2>";
            mailMsg.IsBodyHtml = true;

            mailMsg.To.Add(new MailAddress(TextBox1.Text.Trim()));

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
            Response.Write("<script language='javascript'>alert('Password Sent to your Email Address')</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('" + ex.Message.ToString() + "')</script>");
            

        }
    }
 }
