using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Leave : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();

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
            int empid = Convert.ToInt16(Session["EmpId"].ToString());
            var data = from e in db.EmployeeMasters
                       join f in db.LeaveMasters
                       on e.EmpId equals f.EmpId
                       where e.EmpId == empid
                       select new { f.LeaveId, f.LeaveReason, f.LeaveDate, f.StartLeaveDate, f.EndLeaveDate, f.LeaveStatus, e.FName };
            GridView1.DataSource = data;
            //   GridView1.DataSource = db.manage_leavemaster(0,"","",0,4);
            GridView1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Leave.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToDateTime(txtStartLdate.Text) < DateTime.Now)
            {
                Response.Write("<script>alert('Please enter proper date.....!');</script>");
                return;
            }
            LeaveMaster l = new LeaveMaster();
            l.LeaveReason = txtLreason.Text;
            l.LeaveDate = Convert.ToDateTime(txtLdate.Text);
            l.StartLeaveDate = Convert.ToDateTime(txtStartLdate.Text);
            l.EndLeaveDate = Convert.ToDateTime(txtEndLdate.Text);
            l.EmpId = Convert.ToInt16(Session["EmpId"].ToString());
            l.LeaveStatus = "Not Approve";
            db.LeaveMasters.InsertOnSubmit(l);
            db.SubmitChanges();
            //db.manage_leavemaster(0, txtLreason.Text, "Not Approve",, 1);
            bindgrid();
            Response.Write("<script>alert('Leave Request Sent Successfully');</script>");

            txtEndLdate.Text = "";
            txtLdate.Text = "";
            txtLreason.Text = "";
            txtStartLdate.Text = "";

        }


        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }

    }
}