using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_State : System.Web.UI.Page
{
 
    DataClassesDataContext db = new DataClassesDataContext();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindgrid();
        }
    }

    public void bindgrid()
    {
        GridView1.DataSource = db.manage_state(0,"",4);
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtSname.Text == "")
            {
                Response.Write("<script>alert('Fill The Data...!');</script>");
            }
            else
            {
                db.manage_state(0, txtSname.Text, 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully...!');</script>");
            }
            txtSname.Text = "";

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
    
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label3"));
        TextBox txtsname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        db.manage_state(int.Parse(lblid.Text),txtsname.Text,2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int StateId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["StateId"].ToString());
        db.manage_state(StateId, "", 3);

    }
}