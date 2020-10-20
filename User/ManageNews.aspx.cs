using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class User_ManageNews : System.Web.UI.Page
{

   DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
            filldata();
        }
    }

    public void bindgrid()
    {
        // GridView1.DataSource = db.manage_newsmaster(0,"",0,true,4);
        if (Session["Cid"] == null)
        {
            Response.Redirect("../login.aspx");
        }

        else
        {


            int id = Convert.ToInt16(Session["Cid"].ToString());
            var data = from d in db.NewsMasters
                       join f in db.CompanyMasters
                       on d.CompanyId equals f.CompanyId
                       where d.CompanyId == id
                       select new { d.NewsId, d.News, d.NewsDate, f.CompanyName, d.Flag };
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
  public void  filldata()
    {

        DropDownCid.DataSource = db.manage_company1(0,"","",0,0,"","","","","","",0,0,"",4 );
        DropDownCid.DataTextField = "CompanyName";
        DropDownCid.DataValueField = "CompanyId";
        DropDownCid.DataBind();
        DropDownCid.Items.Insert(0, "--Select Name--");
    }

    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int NewsId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["NewId"].ToString());
        db.manage_newsmaster(NewsId,"",0,true,3);
        bindgrid();
    }

    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
        //DropDownList ddlnews = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1");
        //  var data = from d in db.StateMasters select d;
    //    ddlnews.DataSource = db.manage_newsmaster(0,"",0,true, 4);
    //    ddlnews.DataTextField = "News";
    //    ddlnews.DataValueField = "NewsId";
    //    ddlnews.DataBind();
    //
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtNews.Text == "")
            {

                Response.Write("<script>alert('Fill The News...!');</script>");
            }
            else if (txtNDate.Text == "")
            {
                Response.Write("<script>alert('Fill The NewsDate...!');</script>");
            }
            else
            {
                db.manage_newsmaster(0, txtNews.Text, Convert.ToInt16(DropDownCid.SelectedValue), true, 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully');</script>");
            }
            txtNews.Text = "";
            txtNDate.Text = "";
       
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        
        

       
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label6"));
        //DropDownList cid = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
        TextBox txtnews = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtnews");
        TextBox txtNDate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
        int tid = Convert.ToInt16(lblid.Text);
        NewsMaster data = db.NewsMasters.Where(d => d.NewsId == tid).FirstOrDefault();
        data.News = txtnews.Text;
        data.NewsDate = Convert.ToDateTime(txtNDate.Text);
       // data.EndDate = Convert.ToDateTime(txtEdate.Text);
        db.SubmitChanges();
        
        //db.manage_newsmaster(Convert.ToInt16(lblid.Text),txtnews.Text,Convert.ToInt16(cid.SelectedValue),true,2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
       // DropDownList cid = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList1");
 
       // cid.DataSource = db.manage_company1(0, "", "", 0, 0, "", "", "", "", "", "", 0, 0, "", 4);
       // cid.DataTextField = "CompanyName";
       //cid.DataValueField = "CompanyId";
       //cid.DataBind();
       // cid.Items.Insert(0, "--Select Name--");
        //DropDownList ddlnews = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("Dr");
        //  var data = from d in db.NewsMasters select d;
        //  ddlnews.DataSource = data;
        //ddlnews.DataTextField = "News";
        //ddlnews.DataValueField = "NewsId";
        //ddlnews.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int NewsId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["NewsId"].ToString());
        db.manage_newsmaster(NewsId,"",0,true,3);
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageNews.aspx");
    }
}