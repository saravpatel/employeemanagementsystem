using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_ManageDesignation : System.Web.UI.Page
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
        GridView1.DataSource = db.manage_designationmaster(0,"",4);
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtDesi.Text == "")
            {
                Response.Write("<script>alert('Fill The Data...!');</script>");
            }
            else
            {
                db.manage_designationmaster(0, txtDesi.Text, 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully...!');</script>");
            }
            txtDesi.Text = "";

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
     
    }


    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int DegId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["DegId"].ToString());
        db.manage_designationmaster(DegId, "", 3);
        bindgrid();
    }


    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2"));
        TextBox Designation = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        db.manage_designationmaster(int.Parse(lblid.Text),Designation.Text, 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    
}