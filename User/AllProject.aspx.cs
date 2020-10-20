using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_AllProject : System.Web.UI.Page
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
        if (Session["Cid"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {
            int id = Convert.ToInt16(Session["Cid"].ToString());
            var data = from a in db.AllProjects
                       where id == a.CompanyId
                       select a;

            GridView1.DataSource = data;//db.manage_Allproject(0,"",0,4);
            GridView1.DataBind();
        }
    }
    Bal b = new Bal();
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string pnm = txtpname.Text;
            int id = Convert.ToInt16(Session["Cid"].ToString());
            int s = b.check_project(pnm, id);

            if (s <= 0)
            {
                // int id = Convert.ToInt16(Session["Cid"].ToString());
                db.manage_Allproject(0, txtpname.Text, id, 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully');</script>");

            }
            else
            {
                Response.Write("<script>alert('Project Name Already Exist');</script>");
            }
            txtpname.Text = "";
       
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        } 
        
 }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
 
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        int PId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["PId"].ToString());
        db.manage_Allproject(PId, "",id, 3);
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2"));
        TextBox txtpname1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        db.manage_Allproject(int.Parse(lblid.Text),txtpname1.Text,id, 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
}