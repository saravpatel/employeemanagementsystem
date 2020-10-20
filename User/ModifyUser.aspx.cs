using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ModifyUser : System.Web.UI.Page
{
    Bal b = new Bal();
    

    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();

            int id = Convert.ToInt16(Session["EmpId"].ToString());
            fillddl();
            DropDownDId.DataSource = db.manage_designationmaster(0, "", 4);
            DropDownDId.DataTextField = "Designation";
            DropDownDId.DataValueField = "DegId";
            DropDownDId.DataBind();
        }
    }

    private void filldata()
    {
        // int id = Convert.ToInt16(Session["EmpId"].ToString());
        // var data = from g in db.EmployeeMasters where g.EmpId==id select g;

        //DataTable dt = new DataTable();

        DataTable dt = new DataTable();
        if (Session["EmpId"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {

            int id = Convert.ToInt16(Session["EmpId"].ToString());
            b.EMPID = id;
            dt = b.select_user(b);

            txtFName.Text = dt.Rows[0]["FName"].ToString();
            txtMname.Text = dt.Rows[0]["MName"].ToString();
            txtLname.Text = dt.Rows[0]["LName"].ToString();
            txtAddress1.Text = dt.Rows[0]["Addres"].ToString();
            txtMno1.Text = dt.Rows[0]["MobileNo"].ToString();
            txtEmail1.Text = dt.Rows[0]["Email"].ToString();
            txtPass1.Text = dt.Rows[0]["Passwrd"].ToString();
            txtDob.Text = dt.Rows[0]["Dob"].ToString();
            txtJdate.Text = dt.Rows[0]["JoinDate"].ToString();

            //Add All fileds

        }

    }
    private void fillddl()
    {
        DropDownState1.DataSource = db.manage_state(0, "", 4);
        DropDownState1.DataTextField = "StateName";
        DropDownState1.DataValueField = "StateId";
        DropDownState1.DataBind();
        DropDownState1.Items.Insert(0, "--Select State--");
    }

    protected void DropDownState1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(DropDownState1.SelectedValue);
        var data = from d in db.CityMasters
                   where d.StateId == id
                   select d;
        DropDownCity1.DataSource = data;
        DropDownCity1.DataTextField = "CityName";
        DropDownCity1.DataValueField = "CityId";
        DropDownCity1.DataBind();
        DropDownCity1.Items.Insert(0, "--Select city--");


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt16(Session["EmpId"].ToString());
            int sid = Convert.ToInt16(DropDownState1.SelectedValue);
            int cid = Convert.ToInt16(DropDownCity1.SelectedValue);
            int degid = Convert.ToInt16(DropDownDId.SelectedValue);
            int coid = Convert.ToInt16(Session["Cid"].ToString());
            string path = @"~/img1/" + FileUpload1.PostedFile.FileName;

            if (FileUpload1.HasFile)
            {
                string path1 = @"~/img1/" + FileUpload1.PostedFile.FileName;
                FileUpload1.SaveAs(Server.MapPath(path1));

            }
            else
            {
                Response.Write("file not selected");
            }


            db.manage_employee(id, txtFName.Text, txtMname.Text, txtLname.Text, txtAddress1.Text, cid, sid, txtMno1.Text, txtEmail1.Text, txtPass1.Text, path, degid, txtDob.Text, txtJdate.Text, coid, 2);
            Response.Redirect("~/User/ManageUser.aspx");
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageUser.aspx");
    }
}
