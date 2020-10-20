using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Change_Password : System.Web.UI.Page
{
    DataClassesDataContext db=new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["SAdmin"]!=null)
       {
           Label1.Visible = false;
           Label2.Visible = false;
           Label3.Visible = false;
       }

          else
       {
           Response.Redirect("../login.aspx");
       }

            
        
    }  
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string s = Session["SAdmin"].ToString();
            //var data=from p in  
            //         db.Admins where p.AdminName ==s
            //            select new {p.AdminPassword}

            List<Admin> li = db.Admins.Where(a => a.AdminName == s).ToList();
            if (txtOldPass.Text == li[0].AdminPassword)
            {
                if (txtNewPass.Text == txtConPass.Text)
                {
                    db.manage_pwd(s, txtNewPass.Text, 1);
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
        try
        {
            Response.Redirect("Change Password.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            
        }
        
    }
}