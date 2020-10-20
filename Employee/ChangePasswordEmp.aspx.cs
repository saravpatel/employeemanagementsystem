using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_ChangePasswordEmp : System.Web.UI.Page
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
            string s = Session["Emp"].ToString();
            //var data = (from p in db.EmployeeMasters
            //            where p.Email == Session["Emp"].ToString()
            //            select new { p.Passwrd }).SingleOrDefault();
            List<EmployeeMaster> li = db.EmployeeMasters.Where(a => a.Email == s).ToList();


            if (txtOldPass.Text == li[0].Passwrd)
            {
                if (txtNewPass.Text == txtConPass.Text)
                {
                    db.manage_pwd(s, txtNewPass.Text, 3);
                    Label3.Visible = true;
                    Session.Abandon();
                    Response.Redirect("../login.aspx");
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


            txtConPass.Text = "";
            txtNewPass.Text = "";
            txtOldPass.Text = "";

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePasswordEmp.aspx");
    }
}