using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_ManageLeave : System.Web.UI.Page
{
   DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
            //DropDownEmpLeave.DataSource = db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "", 4);
            //DropDownEmpLeave.DataTextField = "FName";
            //DropDownEmpLeave.DataValueField = "EmpId";
            //DropDownEmpLeave.DataBind();
        }
    }

    public void bindgrid()
    {
        if (Session["Cid"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {
            int id = Convert.ToInt16(Session["Cid"].ToString());
            var data = from e in db.EmployeeMasters
                       join f in db.LeaveMasters
                       on e.EmpId equals f.EmpId
                       where e.CompanyId == id
                       select new { f.LeaveId, f.LeaveReason, f.LeaveDate, f.StartLeaveDate, f.EndLeaveDate, f.LeaveStatus, e.FName };
            GridView1.DataSource = data;
            //   GridView1.DataSource = db.manage_leavemaster(0,"","",0,4);
            GridView1.DataBind();
        }
    }
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //var i = from p in db.EmployeeMasters where p.FName == DropDownEmpLeave.SelectedValue.ToString() select new { p.EmpId };
        //db.manage_leavemaster(0, txtLreason.Text,"Not Approve",Convert.ToInt16(DropDownEmpLeave.SelectedValue), 1);
        //bindgrid();
        //Response.Write("<script>alert('Data Inserted Successfully');</script>");
       
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int LeaveId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["LeaveId"].ToString());
        db.manage_leavemaster(LeaveId,"","",0,3);
        bindgrid();
    }

    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
         int id=Convert.ToInt16(Session["Cid"].ToString());
         var data = from p in db.EmployeeMasters
                    where id == p.CompanyId
                    select p;
        DropDownList ddle = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("ddle");
       // int id = Convert.ToInt16(Session["Cid"].ToString());
        ddle.DataSource = data;// db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "", id, 4);
        ddle.DataTextField = "FName";
        ddle.DataValueField = "EmpId";
        ddle.DataBind();


    }

    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1"));
        TextBox txtleave = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        DropDownList ddlstatus = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
        DropDownList ddle =(DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddle");

        db.manage_leavemaster(Convert.ToInt16(lblid.Text),txtleave.Text,ddlstatus.SelectedValue,Convert.ToInt16(ddle.SelectedValue), 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageLeave.aspx");
    }
}