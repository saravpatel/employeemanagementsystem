using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_ManageTask : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        //    DropDownTask.Items.Insert(0, "--Select Name--");
            //DropDownTask.DataSource = db.manage_taskmaster(0, "", 0, "", 4);
            //DropDownTask.DataTextField = "TaskName";
            //DropDownTask.DataValueField = "TaskId";
            //DropDownTask.DataBind();
            filldata();
            bindgrid();
        }

    }
    public void filldata()
    {
        if (Session["EmpId"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {

            int id = Convert.ToInt16(Session["EmpId"].ToString());
            //var data = from a in db.AllProjects
            //           join p in db.ProjectMasters
            //           on a.Pid equals p.Pid
            //           join t in db.TaskMasters
            //           on p.ProjectId equals t.ProjectId
            //           where p.CompanyId == id
            //           select new {t.TaskId,t.TaskName,a.ProjectNameAll,t.StartDate,t.EndDate,t.TaskStatus,t.TaskDate };
            var data = from a in db.AllProjects

                       select new { a.ProjectNameAll, a.Pid };

            //DropDownList1.DataSource = data; //db.manage_projectmaster(0, "", "", DateTime.Now, 0, DateTime.Now, DateTime.Now,id, 4);
            //DropDownList1.DataTextField = "ProjectNameAll";
            //DropDownList1.DataValueField = "Pid";
            //DropDownList1.DataBind();
            //DropDownList1.Items.Insert(0, "--Select Name--");
        }
    }
    public void bindgrid()
    {
        int id = Convert.ToInt16(Session["EmpId"].ToString());
        var data = from t in db.TaskMasters
                   join p in db.ProjectMasters on
                   t.ProjectId equals p.ProjectId
                   join a in db.AllProjects
                   on p.Pid equals a.Pid
                   where p.EmpId == id
                   select new {t.TaskId,t.TaskName,a.ProjectNameAll,t.StartDate,t.EndDate,t.TaskStatus,t.TaskDate,id};

        GridView1.DataSource = data; //db.manage_taskmaster11(0, "", 0, Convert.ToDateTime(DateTime.Now), Convert.ToDateTime(DateTime.Now), "", Convert.ToDateTime(DateTime.Now), 4);
        GridView1.DataBind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageTask.aspx");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int TaskId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["TaskId"].ToString());
        db.manage_taskmaster11(TaskId, "", 0, Convert.ToDateTime(""), Convert.ToDateTime(""), "", Convert.ToDateTime(""), 0,3);
        bindgrid();
    }
    

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
        DropDownList ddle = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList2");
        int id = Convert.ToInt16(Session["EmpId"].ToString());
        var data = from t in db.TaskMasters
                   join p in db.ProjectMasters
                   on t.ProjectId equals p.ProjectId
                   join a in db.AllProjects
                   on p.Pid equals a.Pid
                   where id==p.EmpId
                   select new { a.ProjectNameAll, p.ProjectId };
        ddle.DataSource = data;// db.manage_projectmaster(0, "", "", DateTime.Now, 0, DateTime.Now, DateTime.Now,0, 4);
        //ddle.DataSource = data;//db.manage_Allproject(0,"",id,4);

        ddle.DataTextField = "ProjectNameAll";
        ddle.DataValueField = "ProjectId";
        ddle.DataBind();
        ddle.Items.Insert(0, "--Select Name--");
        
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2"));
        TextBox txtpname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        TextBox txttsname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5");
        DropDownList ddle = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList2"));
        TextBox txtSdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3"));
        TextBox txtEdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4"));
        TextBox txtTdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6"));
        db.manage_taskmaster11(Convert.ToInt16(lblid.Text),txtpname.Text,Convert.ToInt16(ddle.SelectedValue), Convert.ToDateTime(txtSdate.Text), Convert.ToDateTime(txtEdate.Text), txttsname.Text, Convert.ToDateTime(txtTdate.Text),Convert.ToInt32(Session["EmpId"]),2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
}