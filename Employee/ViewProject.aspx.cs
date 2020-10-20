using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_ViewProject : System.Web.UI.Page
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
            // int Cid = Convert.ToInt16(Session["CId"].ToString());
            var data = from e in db.EmployeeMasters
                       join p in db.ProjectMasters
                       on e.EmpId equals p.EmpId
                       join c in db.CompanyMasters
                       on e.CompanyId equals c.CompanyId
                       join a in db.AllProjects
                       on p.Pid equals a.Pid
                       where e.EmpId == empid
                       select new { a.ProjectNameAll, p.StartDate, p.Enddate };
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewProject.aspx");
    }
}