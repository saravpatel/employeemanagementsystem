using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_AskBugs : System.Web.UI.Page
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

    public void filldata()
    {
       // int id = Convert.ToInt16(Session["Cid"].ToString());
        //DropDownEmpBug.DataSource = db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",0, 4);
        //DropDownEmpBug.DataTextField = "FName";
        //DropDownEmpBug.DataValueField = "EmpId";
        //DropDownEmpBug.DataBind();
        //DropDownEmpBug.Items.Insert(0, "--Select Name--");

        int id = Convert.ToInt16(Session["EmpId"].ToString());
        var data = from e in db.TaskMasters
                   //join t in db.TaskMasters
                   //on e.EmpId equals t.EmpId
                   where id==e.EmpId
                   select e;
        DropDownTaskBug.DataSource = data;//db.manage_taskmaster11(0, "", 0, Convert.ToDateTime(DateTime.Now), Convert.ToDateTime(DateTime.Now), "", Convert.ToDateTime(DateTime.Now),id, 4);
        DropDownTaskBug.DataTextField = "TaskName";
        DropDownTaskBug.DataValueField = "TaskId";
        DropDownTaskBug.DataBind();
        DropDownTaskBug.Items.Insert(0, "--Select Name--");
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
            var data = from b in db.BugMasters
                       join e in db.EmployeeMasters
                       on b.EmpId equals e.EmpId
                       join t in db.TaskMasters
                       on b.TaskId equals t.TaskId
                       where id == b.EmpId
                       select new { b.BugId, b.BugName, e.FName, t.TaskName, b.Solution };
            GridView1.DataSource = data;// db.manage_bug(0, "", 0, 0, "", 4);
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2"));
        //TextBox txtbname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        //DropDownList dde = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownEmpBug");
        //DropDownList ddt = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownTaskBug");

        //db.manage_bug(Convert.ToInt16(lblid.Text), txtbname.Text, 0, 0,"", 2);
        //GridView1.EditIndex = -1;
        //bindgrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //int BugId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["BugId"].ToString());
        //db.manage_bug(BugId, "", 0, 0, "", 3);

    }

  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt16(Session["EmpId"].ToString());
            db.manage_bug(0, txtBname.Text, id, Convert.ToInt16(DropDownTaskBug.SelectedValue), "Pending", 1);
            bindgrid();
            Response.Write("<script>alert('Data Inserted Successfully');</script>");

            txtBdate.Text = "";
            txtBname.Text = "";
            txtBname1.Text = "";
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AskBugs.aspx");
    }
}