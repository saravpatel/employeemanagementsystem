using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ChangePasswordAdmin : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string s = Session["CAdmin"].ToString();
            //var data = (from p in
            //                db.CompanyMasters
            //            where p.Email == Session["CAdmin"].ToString()
            //            select new { p.pwd }).SingleOrDefault();

            List<CompanyMaster> li = db.CompanyMasters.Where(a => a.Email == s).ToList();
            if (txtOldPass1.Text == li[0].pwd)
            {
                if (txtNewPass1.Text == txtConPass1.Text)
                {
                    db.manage_pwd(s, txtNewPass1.Text, 2);
                    Label3.Visible = true;
                    Session.Abandon();
                    Response.Redirect("../login.aspx");
                    //Response.Write("<script>alert(Your password is changed Succesfully...!);</script>");
                }
                else
                {
                    Label2.Visible = true;
                }
            }
            else
            {
                Label1.Visible = true;
            }

            txtConPass1.Text = "";
            txtNewPass1.Text = "";
            txtOldPass1.Text = "";
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePasswordAdmin.aspx");
    }
}