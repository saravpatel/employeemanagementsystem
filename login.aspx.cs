using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            fillddl();
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            DropDownList4.Items.Insert(0, "--Select Category--");
        }
    }

    private void fillddl()
    {
        DropDownList1.DataSource = db.manage_state(0, "", 4);
        DropDownList1.DataTextField = "StateName";
        DropDownList1.DataValueField = "StateId";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "--Select State--");

        DropDownList3.DataSource = db.manage_companytypemaster(0, "", 4);
        DropDownList3.DataTextField = "CompanyType";
        DropDownList3.DataValueField = "CompanytypeId";
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, "--Select type--");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int id = Convert.ToInt16(DropDownList1.SelectedValue);
        var data = from d in db.CityMasters
                   where d.StateId == id
                   select d;
        DropDownList2.DataSource = data;
        //DropDownList2.DataSource = db.manage_city(0, "",Convert.ToInt16(DropDownList1.SelectedValue), 4);
        DropDownList2.DataTextField = "CityName";
        DropDownList2.DataValueField = "CityId";
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, "--Select City--");
   
    }
    Bal b = new Bal();
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            string path = @"~/img1/" + FileUpload1.PostedFile.FileName;
            FileUpload1.SaveAs(Server.MapPath(path));
            ////var data = from obj in db.CompanyMasters
            ////           where obj.Email == TextBox3.Text
            ////           select obj;

            string email = TextBox3.Text;
            DataTable dt = b.select_emailcompany(email);
            if (dt.Rows.Count>0)
            {
                //Response.Write("<script>alert('you have already Registed');</script>");
                Label1.Visible = true;


            }
            else
            {

                db.manage_company1(0, TextBox1.Text, TextBox2.Text, Convert.ToInt16(DropDownList2.SelectedValue), Convert.ToInt16(DropDownList1.SelectedValue), TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox3.Text, TextBox12.Text, path, Convert.ToInt16(TextBox4.Text), Convert.ToInt16(DropDownList3.SelectedValue), TextBox7.Text, 1);
                //Response.Write("<script>alert('succesfully registaration');</script>");
                ScriptManager.RegisterStartupScript(Page,this.GetType(), "msg" ,"<script>alert('succesfully registaration');window.location.href='login.aspx'</script>",false);
               // Server.Transfer("login.aspx");
            }
      
        }
        catch (Exception ex)
        {

            //Response.Write("<script>alert('Somthing is Wrong');</script>");
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "msg", "<script>alert('Somthing is Wrong');window.location.href='login.aspx'</script>", false);
        }
               
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox5.Text == "")
        {
            Label4.Visible = true;
        }
        else if (TextBox6.Text == "")
        {
            Label5.Visible = true;
        }
        else
        {
            if (DropDownList4.SelectedIndex == 1)
            {
                var data = (from sa in db.Admins
                            where sa.AdminName == TextBox5.Text
                              && sa.AdminPassword == TextBox6.Text
                            select sa);

                //Admin a=db.Admins.Where(a=>a.AdminName==)

                if (data.Count() > 0)
                {
                    Session["SAdmin"] = TextBox5.Text;

                    Response.Redirect("~/Admin/Default.aspx");

                }
                else
                {
                    Label2.Visible = true;
                }
            }

            else if (DropDownList4.SelectedIndex == 2)
            {
                var data = (from sa in db.CompanyMasters
                            where sa.Email == TextBox5.Text
                              && sa.pwd == TextBox6.Text
                            select sa);
                //Admin a=db.Admins.Where(a=>a.AdminName==)

                if (data.Count() > 0)
                {
                    Session["CAdmin"] = TextBox5.Text;

                    foreach (var item in data)
                    {
                        Session["Cid"] = item.CompanyId;
                        Session["Cname"] = item.CompanyName;
                        Session["pic"] = item.Photo;

                    }
                    Response.Redirect("~/User/Default.aspx");

                }
                else
                {
                    Label2.Visible = true;
                }
            }

            else if (DropDownList4.SelectedIndex == 3)
            {
                //var data = (from sa in db.EmployeeMasters
                //            where sa.Email == TextBox5.Text
                //              && sa.Passwrd == TextBox6.Text
                //            select sa);

                //Admin a=db.Admins.Where(a=>a.AdminName==)


                string s = TextBox5.Text;
                string s1 = TextBox6.Text;
                var master = from sa in db.EmployeeMasters
                             where sa.Email == TextBox5.Text
                          && sa.Passwrd == TextBox6.Text

                             select new { sa.EmpId, sa.Email, sa.FName, sa.CompanyId }; // db.EmployeeMasters.Where(g => g.Email == s && g.Passwrd==s1).SingleOrDefault();

                List<EmployeeMaster> li = new List<EmployeeMaster>();
                foreach (var item in master)
                {
                    Session["EmpId"] = item.EmpId;
                    Session["EmpName"] = item.FName;
                    Session["Cid"] = item.CompanyId;
                    // Session["Epic"]=item.
                }
                if (master.Count() > 0)
                {
                    Session["Emp"] = TextBox5.Text;

                    Response.Redirect("~/Employee/Default.aspx");

                }
                else
                {
                    Label2.Visible = true;

                }
            }
            else
            {
                Label3.Visible = true;
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        TextBox6.TextMode = TextBoxMode.SingleLine;
    }
}