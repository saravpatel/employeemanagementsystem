using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_ManageEvent : System.Web.UI.Page
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
            var data = from e in db.EventMasters
                       where id == e.Company_Id
                       select e;
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (txtEventName.Text == "")
            {
                Label2.Text = "Please Enter Event Name.....!";
                return;
            }
            if (txtEventName.Text != null)
            {
                Label2.Text = "";
            }

            if (txtEventDate.Text == "")
            {
                Label6.Text = "Please Enter Event Date.....!";
                return;
            }
            if (txtEventDate.Text != null)
            {
                Label6.Text = "";
            }
            int id = Convert.ToInt16(Session["Cid"].ToString());
            db.manage_eventmaster(0, Convert.ToDateTime(txtEventDate.Text), txtEventName.Text, id, 1);
            bindgrid();
            Response.Write("<script>alert('Data Inserted Successfully');</script>");

            txtEventName.Text = "";
            txtEventDate.Text = "";

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
            }
    
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        int EventId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["EventId"].ToString());
        db.manage_eventmaster(EventId,DateTime.Now,"",id,3);
        bindgrid();
    }

    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
       // Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label5"));
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label5"));
        TextBox txteventname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox txteventdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");

        db.manage_eventmaster(Convert.ToInt16(lblid.Text),Convert.ToDateTime(txteventdate.Text),txteventname.Text,id,2);
        GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string str = TextBox7.Text;
        SqlCommand cmd;
        SqlConnection con;
        DataSet ds;
        SqlDataAdapter da;



        int id = Convert.ToInt16(Session["Cid"]);
        con= new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ConnectionString);
        cmd = new SqlCommand("Select * From EventMaster WHERE EventName like '%"+str+"%' and [Company Id]="+id, con);
        da=new SqlDataAdapter(cmd);
        ds=new DataSet();
        da.Fill(ds);
        DataTable dt =new DataTable();
        dt=ds.Tables[0];
        int flag=0;
        for (int i=0;i<dt.Rows.Count;i++)
        {
            if(dt.Rows[i]["EventName"]!=null)
            {
                flag = 1;
                //break;
           }
        }
        if(flag==1)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
                
        }
        else
            {
                Response.Write("<script>alert('No record found');window.location.href='ManageEvent.aspx'</script>");
                //GridView1.DataSource = null;
                //GridView1.DataBind();
               // Response.Redirect("ManageEvent.aspx");
            }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageEvent.aspx");
    }
}
