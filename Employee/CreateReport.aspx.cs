using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_CreateReport : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindgrid();
            filldata();
        }
    }
    public void bindgrid()
    {
        if (Session["EmpId"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {
            int id = Convert.ToInt16(Session["EmpId"].ToString());
            var data = from f in db.Tables
                       where id == f.EmpId
                       select f;
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }

    public void filldata()
    {
         int id = Convert.ToInt16(Session["EmpId"].ToString());
        //DropDownEmp.DataSource = db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",0, 4);
        //DropDownEmp.DataTextField = "FName";
        //DropDownEmp.DataValueField = "EmpId";
        //DropDownEmp.DataBind();
        //DropDownEmp.Items.Insert(0, "--Select Name--");
         var data = from p in db.AllProjects
                    join e in db.ProjectMasters
                    on p.Pid equals e.Pid
                    where e.EmpId==id
                    select p;

         DropDownProject.DataSource = data;//db.manage_projectmaster(0, "", "", DateTime.Now, 0, DateTime.Now, DateTime.Now,0, 4);
        DropDownProject.DataTextField = "ProjectNameAll";
        DropDownProject.DataValueField = "Pid";
        DropDownProject.DataBind();
        DropDownProject.Items.Insert(0, "--Select Name--");
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Table d = new Table();
            int id = Convert.ToInt16(Session["EmpId"].ToString());
            d.Project_Completion = Convert.ToInt16(txtDes.Text);
            d.Month = DropDownList1.SelectedIndex;
            d.ProjectId = Convert.ToInt16(HiddenField1.Value);
            d.EmpId = id;
            db.Tables.InsertOnSubmit(d);
            db.SubmitChanges();
            Response.Write("<script>alert('Data Inserted Successfully');</script>");
            bindgrid();


            txtBname1.Text = "";
            txtDes.Text = "";
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        
    }
    protected void DropDownProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(DropDownProject.SelectedValue);
        ProjectMaster master = db.ProjectMasters.Where(m => m.Pid == id).FirstOrDefault();
        HiddenField1.Value = master.ProjectId.ToString();
        
    }
}