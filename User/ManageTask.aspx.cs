using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ManageTask : System.Web.UI.Page
{

    DataClassesDataContext db = new DataClassesDataContext();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
            DropDownTask.Items.Insert(0, "--Select Name--");
            //DropDownTask.DataSource = db.manage_taskmaster(0, "", 0, "", 4);
            //DropDownTask.DataTextField = "TaskName";
            //DropDownTask.DataValueField = "TaskId";
            //DropDownTask.DataBind();
            filldata();
        }
    }
    public void filldata()
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        //var data = from a in db.AllProjects
        //           join p in db.ProjectMasters
        //           on a.Pid equals p.Pid
        //           join t in db.TaskMasters
        //           on p.ProjectId equals t.ProjectId
        //           where p.CompanyId == id
        //           select new {t.TaskId,t.TaskName,a.ProjectNameAll,t.StartDate,t.EndDate,t.TaskStatus,t.TaskDate };
        var data = from a in db.AllProjects
                   join p in db.ProjectMasters
                   on a.Pid equals p.Pid
                   where a.CompanyId==id
                   select new { a.ProjectNameAll, p.ProjectId };

        DropDownList1.DataSource = data; //db.manage_projectmaster(0, "", "", DateTime.Now, 0, DateTime.Now, DateTime.Now,id, 4);
        DropDownList1.DataTextField = "ProjectNameAll";
        DropDownList1.DataValueField = "ProjectId";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "--Select Name--");

        var data1 = from e in db.EmployeeMasters
                   where id == e.CompanyId
                   select e;
        DropDownList3.DataSource = data1;//db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",id, 4);
        DropDownList3.DataTextField = "FName";
        DropDownList3.DataValueField = "EmpId";
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, "--Select Name--");
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
            var data = from t in db.TaskMasters
                       join p in db.ProjectMasters on
                       t.ProjectId equals p.ProjectId
                       join a in db.AllProjects
                       on p.Pid equals a.Pid
                       join e in db.EmployeeMasters
                       on p.EmpId equals e.EmpId
                       where p.CompanyId == id

                       select new { t.TaskId, e.FName, t.TaskName, a.ProjectNameAll, t.StartDate, t.EndDate, t.TaskStatus, t.TaskDate };

            GridView1.DataSource = data;// db.manage_taskmaster11(0, "", 0, Convert.ToDateTime(DateTime.Now), Convert.ToDateTime(DateTime.Now), "", Convert.ToDateTime(DateTime.Now), 4);
            GridView1.DataBind();
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (txtSdate.Text == "")
            {
                lbls.Text = "Please Enter Start date.....!";
                return;
            }
            if (txtSdate.Text != null)
            {
                lbls.Text = "";
            }

            if (txtEdate.Text == "")
            {
                lble.Text = "Please Enter End Date.....!";
                return;
            }
            if (txtEdate.Text != null)
            {
                lble.Text = "";
            }
            if (TextBox7.Text == "")
            {
                lblt.Text = "Please Enter Task Date.....!";
                return;
            }
            if (TextBox7.Text != null)
            {
                lblt.Text = "";
            }

            db.manage_taskmaster11(0, DropDownTask.SelectedItem.Value, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToDateTime(txtSdate.Text), Convert.ToDateTime(txtEdate.Text), "Pending", Convert.ToDateTime(TextBox7.Text), Convert.ToInt16(DropDownList3.SelectedValue), 1);
            bindgrid();
            Response.Write("<script>alert('Data Inserted Successfully');</script>");

            txtEdate.Text = "";
            txtSdate.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            //DropDownList1.SelectedIndex = 0;
            //DropDownList3.SelectedIndex = 0;
            //DropDownTask.SelectedIndex = 0;


        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }

 }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int TaskId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["TaskId"].ToString());
        db.manage_taskmaster11(TaskId, "", 0, Convert.ToDateTime(DateTime.Now), Convert.ToDateTime(DateTime.Now), "", Convert.ToDateTime(DateTime.Now), 0, 3);
       bindgrid();

    }
   
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {

      
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
      // DropDownList ddle = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList2");
      //  DropDownList ddlp = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("DropDownList4");
        int id = Convert.ToInt16(Session["Cid"].ToString());
        var data = from t in db.TaskMasters
                   join p in db.ProjectMasters
                   on t.ProjectId equals p.ProjectId
                   join a in db.AllProjects
                   on p.Pid equals a.Pid
                   where id==p.CompanyId
                   select new { a.ProjectNameAll, p.ProjectId };
        //ddle.DataSource = db.manage_projectmaster(0, "", "", DateTime.Now, 0, DateTime.Now, DateTime.Now,id, 4);
       // ddle.DataSource = data;//db.manage_Allproject(0,"",id,4);
       // ddle.DataTextField = "ProjectNameAll";
       // ddle.DataValueField = "ProjectId";
       // ddle.DataBind();
       //ddle.Items.Insert(0, "--Select Name--");


       //var data1 = from e2 in db.EmployeeMasters
       //            where id == e2.CompanyId
       //            select e2;
       //ddlp.DataSource = data1;//db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",id, 4);
       //ddlp.DataTextField = "FName";
       //ddlp.DataValueField = "EmpId";
       //ddlp.DataBind();
       //ddlp.Items.Insert(0, "--Select Name--");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageTask.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //string str =TextBox7.Text;
        ////string PName = DropDownProject.SelectedItem.Text;
        //SqlCommand cmd;
        //SqlConnection con;
        //DataSet ds;
        //SqlDataAdapter da;

        //con= new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ConnectionString);
        //cmd = new SqlCommand("select t.*,p.* from TaskMaster t inner join ProjectMaster p on  p.ProjectId = t.ProjectId where t.TaskName= '" + TextBox8.Text + "'", con);
        //da=new SqlDataAdapter(cmd);
        //ds=new DataSet();
        //da.Fill(ds);
        //DataTable dt =new DataTable();
        //dt=ds.Tables[0];
        //if (dt.Rows.Count > 0)
        //{
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //}
        //else
        //{
        //    Response.Write("<script>alert('No record found');</script>");
        //    //GridView1.DataSource = null;
        //    //GridView1.DataBind();    
        //}
        //int flag=0;
        //for (int i=0;i<dt.Rows.Count;i++)
        //{
        //    if(dt.Rows[i]["TaskName"].ToString()==str)
        //    {
        //        flag = 1;
        //        break;
        //   }
        //}
        int id = Convert.ToInt16(Session["Cid"].ToString());
        var data2 = from t in db.TaskMasters
                   join p in db.ProjectMasters on
                   t.ProjectId equals p.ProjectId
                   join a in db.AllProjects
                   on p.Pid equals a.Pid
                   join e2 in db.EmployeeMasters
                   on p.EmpId equals e2.EmpId
                   where p.CompanyId == id && t.TaskName==TextBox8.Text

                   select new { t.TaskId, e2.FName, t.TaskName, a.ProjectNameAll, t.StartDate, t.EndDate, t.TaskStatus, t.TaskDate };
        if (data2.Count() > 0)
        {
            GridView1.DataSource = data2;
            GridView1.DataBind();
        }

        else
        {
            Response.Write("<script>alert('No record found');</script>");
            GridView1.DataSource = data2;
            Server.Transfer("ManageTask.aspx");
            //Response.Redirect("Project.aspx");
        }
        //if(flag==1)
        //{
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
                
        //}
        //else
        //    {
               
            //}
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2"));
        TextBox txtpname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        //TextBox txttsname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5");
        //DropDownList ddle = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList2"));
        TextBox txtSdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3"));
        TextBox txtEdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4"));
        int tid = Convert.ToInt16(lblid.Text);
        TaskMaster data = db.TaskMasters.Where(d=>d.TaskId==tid).FirstOrDefault();
        data.TaskName = txtpname.Text;
        data.StartDate =Convert.ToDateTime(txtSdate.Text);
        data.EndDate =Convert.ToDateTime(txtEdate.Text);
        db.SubmitChanges();
        GridView1.EditIndex = -1;
        bindgrid();
        //TextBox txtTdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6"));
        //DropDownList ddlp = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList4"));
        //db.manage_taskmaster11(Convert.ToInt16(lblid.Text), txtpname.Text, Convert.ToInt16(ddle.SelectedValue), Convert.ToDateTime(txtSdate.Text), Convert.ToDateTime(txtEdate.Text), txttsname.Text, Convert.ToDateTime(txtTdate.Text), Convert.ToInt16(ddlp.SelectedValue), 2);
        //GridView1.EditIndex = -1;
        //bindgrid();


    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int id =int.Parse(DropDownList1.SelectedValue);
        //ProjectMaster data = db.ProjectMasters.Where(x=>x.Pid == id).FirstOrDefault();
        //HiddenField1.Value = data.ProjectId.ToString();
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(DropDownList3.SelectedValue);
        var data = from d in db.ProjectMasters
                   join a in db.AllProjects
                   on d.Pid equals a.Pid
                   where d.EmpId== id
                   select new { a.ProjectNameAll, d.ProjectId };;
        DropDownList1.DataSource = data;
        DropDownList1.DataTextField = "ProjectNameAll";
        DropDownList1.DataValueField = "ProjectId";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "--Select Project--");
    }
}
