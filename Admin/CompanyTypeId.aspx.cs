using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CompanyTypeId : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
            Label4.Visible = false;
           
        }
    }

    public void bindgrid()
    {
        GridView1.DataSource = db.manage_companytypemaster(0,"",4);
        GridView1.DataBind();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        try
        {
            if (txtctname.Text == "")
            {
                Label4.Visible = true;
            }
            else
            {


                db.manage_companytypemaster(0, txtctname.Text, 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully');</script>");
            }
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int companytypeid = int.Parse(GridView1.DataKeys[e.RowIndex].Values["CompanyTypeId"].ToString());
        db.manage_companytypemaster(companytypeid, "", 3);

        bindgrid();
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2"));
        TextBox txtctname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        db.manage_companytypemaster(Convert.ToInt16(lblid.Text), txtctname.Text, 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {

        GridView1.EditIndex = -1;
        bindgrid();
    }
}