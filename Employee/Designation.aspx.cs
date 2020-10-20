using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Designation : System.Web.UI.Page
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
                       join
                           d in db.DesignationMasters
                           on e.DegId equals d.DegId
                       where e.EmpId == empid
                       select new { d.DegId, d.Designation };
            GridView2.DataSource = data;
            GridView2.DataBind();
        }

    }    
}