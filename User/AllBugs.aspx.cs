using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_AllBugs : System.Web.UI.Page
{
  DataClassesDataContext db = new DataClassesDataContext();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           bindgrid();
           // filldata();
        }
    }

    /*public void filldata()
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        DropDownEmpId.DataSource = db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",id, 4);
        DropDownEmpId.DataTextField = "FName";
        DropDownEmpId.DataValueField = "EmpId";
        DropDownEmpId.DataBind();
        DropDownEmpId.Items.Insert(0, "--Select Name--");


        DropDownTaskId.DataSource = db.manage_taskmaster11(0, "", 0, Convert.ToDateTime(DateTime.Now), Convert.ToDateTime(DateTime.Now), "", Convert.ToDateTime(DateTime.Now), 4);
        DropDownTaskId.DataTextField = "TaskName";
        DropDownTaskId.DataValueField = "TaskId";
        DropDownTaskId.DataBind();
        DropDownTaskId.Items.Insert(0, "--Select Name--");
    }*/
    public void bindgrid()
    {
        if (Session["Cid"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {
            int id = Convert.ToInt16(Session["Cid"].ToString());
            var data = from b in db.BugMasters
                       join t in db.TaskMasters on b.TaskId equals t.TaskId
                       join e in db.EmployeeMasters on b.EmpId equals e.EmpId
                       join c in db.CompanyMasters on e.CompanyId equals c.CompanyId
                       where e.CompanyId == id
                       select new { b.BugId, b.BugName, e.FName, t.TaskId, t.TaskName, b.BugDate, b.Solution, e.EmpId };
            //  var data =db.manage_bug(0, "", 0, 0, "", 4);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
   
   /* protected void Button1_Click1(object sender, EventArgs e)
    {
        db.manage_bug(0, txtBname.Text, Convert.ToInt16(DropDownEmpId.SelectedValue), Convert.ToInt16(DropDownTaskId.SelectedValue), txtSol.Text, 1);
        bindgrid();
        Response.Write("<script>alert('Data Inserted Successfully');</script>");

    }*/
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label6"));
        Label lblname = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label8"));
        Label lblemp = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label9"));
        Label lbltask = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label10"));
        Label lbldate = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label11"));
        TextBox txtsolname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        //DropDownList dde = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownEmpId");
        //DropDownList ddt = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownTaskId");
        //BugMaster b = new BugMaster();
        //b.BugId = int.Parse(lblid.Text);
        //b.Solution = txtsolname.Text;
        //db.SubmitChanges();
        
        db.manage_bug(Convert.ToInt16(lblid.Text),lblname.Text,Convert.ToInt16(lblemp.Text),Convert.ToInt16(lbltask.Text),txtsolname.Text , 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int BugId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["BugId"].ToString());
        db.manage_bug(BugId, "", 0, 0, "", 3);
        bindgrid();
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
             string str =TextBox7.Text;
       
             SqlCommand cmd;
             SqlConnection con;
             DataSet ds;
             SqlDataAdapter da;

             con= new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ConnectionString);
             cmd = new SqlCommand("select b.*,e.*,t.* from BugMaster b inner join EmployeeMaster e on e.EmpId = b.EmpId  inner join TaskMaster t on t.TaskId = b.TaskId  where b.BugName = '" + TextBox7.Text + "' ", con);
     
        //cmd=new SqlCommand("Select * From BugMaster WHERE BugName='"+str+"'",con);
             da=new SqlDataAdapter(cmd);
             ds=new DataSet();
             da.Fill(ds);
             DataTable dt =new DataTable();
             dt=ds.Tables[0];
             int flag=0;
             for (int i=0;i<dt.Rows.Count;i++)
             {
                 if(dt.Rows[i][Convert.ToString("BugName")].ToString()==str)
                 {
                     flag = 1;
                     break;
                }
             }
             if(flag==1)
             {
                 GridView1.DataSource = dt;
                 GridView1.DataBind();
                
             }
             else
                 {
                     Response.Write("<script>alert('No record found');</script>");
                     GridView1.DataSource = null;
                     GridView1.DataBind();
                 }
         }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllBugs.aspx");
    }
}  