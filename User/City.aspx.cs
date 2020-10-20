using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_City : System.Web.UI.Page
{
   DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
            DropDownStateid.DataSource = db.manage_state(0, "", 4);
            DropDownStateid.DataTextField = "StateName";
            DropDownStateid.DataValueField = "StateId";
            DropDownStateid.DataBind();
            DropDownStateid.Items.Insert(0, "--Select State--");
        }
    }

    public void bindgrid()
    {
        GridView1.DataSource = db.manage_city(0,"",0, 4);
        GridView1.DataBind();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (txtCity.Text == "")
            {
                Response.Write("<script>alert('Fill The Data...!');</script>");
            }
            else
            {
                db.manage_city(0, txtCity.Text, Convert.ToInt16(DropDownStateid.SelectedItem.Value), 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully...!');</script>");
            }
            txtCity.Text = "";

            //DropDownStateid.SelectedValue = "";

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
       
    }
 
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label4"));
        TextBox txtcname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        DropDownList dds = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
        db.manage_city(Convert.ToInt16(lblid.Text), txtcname.Text, Convert.ToInt16(dds.SelectedValue), 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
   
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
       
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
        DropDownList ddlstate = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1");
      //  var data = from d in db.StateMasters select d;
        ddlstate.DataSource = db.manage_state(0,"",4);
        ddlstate.DataTextField = "StateName";
        ddlstate.DataValueField = "StateId";
        ddlstate.DataBind();
        
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int CityId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["CityId"].ToString());
        db.manage_city(CityId,"",0,3);
  
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
}