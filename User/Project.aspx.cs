using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Default2 : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    Bal b = new Bal();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindgrid();
            filldata();

        }
    }
    public void filldata()
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        var data1 = from a in db.AllProjects
                    
                    where id == a.CompanyId
                    select a;
        DropDownProject.DataSource = data1;//db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",id, 4);
        DropDownProject.DataTextField = "ProjectNameAll";
        DropDownProject.DataValueField = "Pid";
        DropDownProject.DataBind();
        DropDownProject.Items.Insert(0, "--Select Name--");


        var data = from e in db.EmployeeMasters
                   where id == e.CompanyId
                   select e;
        DropDownEmp.DataSource = data;//db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",id, 4);
        DropDownEmp.DataTextField = "FName";
        DropDownEmp.DataValueField = "EmpId";
        DropDownEmp.DataBind();
        DropDownEmp.Items.Insert(0, "--Select Name--");

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
            //var data = from e in db.EmployeeMasters
            //           join f in db.ProjectMasters
            //           on e.EmpId equals f.EmpId
            //           join p in db.AllProjects
            //           on e.CompanyId equals p.CompanyId
            //           where f.CompanyId == id
            //           select new { f.ProjectId, p.ProjectNameAll, f.Discription, f.ProjectDate, e.FName, f.StartDate, f.Enddate };
            var data = from a in db.AllProjects
                       join p in db.ProjectMasters
                       on a.Pid equals p.Pid
                       join e in db.EmployeeMasters
                       on p.EmpId equals e.EmpId
                       where e.CompanyId == id
                       select new { p.ProjectId, a.ProjectNameAll, p.Discription, p.ProjectDate, e.FName, p.StartDate, p.Enddate };
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (txtDes.Text == "")
            {
                lbldes.Text = "Please Enter Discription..!";
                return;
            }
            if (txtDes.Text != null)
            {
                lbldes.Text = "";
            }


            //sdate
            if (txtSdate.Text == "")
            {
                lblsdate.Text = "Please Enter Start Date..!";
                return;
            }
            if (txtSdate.Text != null)
            {
                lblsdate.Text = "";
            }
            //edate
            if (txtEdate.Text == "")
            {
                lbledate.Text = "Please Enter End Date..!";
                return;
            }
            if (txtEdate.Text != null)
            {
                lbledate.Text = "";
            }

            //pdate
            if (txtPdate.Text == "")
            {
                lblpdate.Text = "Please Enter Project Date..!";
                return;
            }
            if (txtPdate.Text != null)
            {
                lblpdate.Text = "";
            }


            int id = Convert.ToInt16(Session["Cid"].ToString());
            ProjectMaster p = new ProjectMaster();
            p.Discription = txtDes.Text;
            p.ProjectDate = Convert.ToDateTime(txtPdate.Text);

            p.StartDate = Convert.ToDateTime(txtSdate.Text);
            p.Enddate = Convert.ToDateTime(txtEdate.Text);
            p.EmpId = Convert.ToInt16(DropDownEmp.SelectedValue);


            p.No_Of_Days = 0;
            p.CompanyId = id;
            p.Pid = Convert.ToInt16(DropDownProject.SelectedValue);
            db.ProjectMasters.InsertOnSubmit(p);
            db.SubmitChanges();
            // db.manage_projectmaster(0, DropDownProject.SelectedValue.ToString(), txtDes.Text, Convert.ToDateTime(txtPdate.Text), Convert.ToInt16(DropDownEmp.SelectedValue), Convert.ToDateTime(txtSdate.Text), Convert.ToDateTime(txtEdate.Text), id, 1);
            bindgrid();
            Response.Write("<script>alert('Data Inserted Successfully');</script>");

            txtDes.Text = "";
            txtEdate.Text = "";
            txtPdate.Text = "";
            txtSdate.Text = "";

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
            }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {

        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();


        int id = Convert.ToInt16(Session["Cid"].ToString());
        //var data1 = from a in db.AllProjects

        //           where id == a.CompanyId
        //           select a.ProjectNameAll;
        var data1 = from a in db.AllProjects
                   
                   where a.CompanyId == id
                   select new { a.Pid, a.ProjectNameAll };
        DropDownList ddlp = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("ddlp");
        ddlp.DataSource = data1;// db.manage_Allproject(0, "", id, 4);
        ddlp.DataTextField = "ProjectNameAll";
        ddlp.DataValueField = "Pid";
        ddlp.DataBind();
        

        DropDownList ddle = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("ddle");
        var data = from e1 in db.EmployeeMasters
                   where id == e1.CompanyId
                   select e1;
        // int id = Convert.ToInt16(Session["Cid"].ToString());
        ddle.DataSource = data;//db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "", id, 4);
        ddle.DataTextField = "Fname";
        ddle.DataValueField = "EmpId";
        ddle.DataBind();
        //DropDownEmp.Items.Insert(0, "--Select Name--");
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label8"));
        DropDownList ddlp = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlp");
        TextBox txtdes = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox txtpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        DropDownList ddle = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddle");
        TextBox txtsdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");
        TextBox txtedate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5");
        int id = Convert.ToInt16(Session["Cid"].ToString());

        //AllProject p = new AllProject();
        //p.ProjectNameAll = ddlp.SelectedItem.Text;
        //db.SubmitChanges();

        SqlConnection cn = new SqlConnection(@"Data Source=SARAV-PC\SQLEXPRESS;Initial Catalog=ProjectManagement;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("update ProjectMaster set Pid=" + ddlp.SelectedValue + " where ProjectId=" + lblid.Text , cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        db.manage_projectmaster(Convert.ToInt16(lblid.Text), txtdes.Text, Convert.ToDateTime(txtpdate.Text), Convert.ToInt16(ddle.SelectedValue), Convert.ToDateTime(txtsdate.Text), Convert.ToDateTime(txtedate.Text), id, Convert.ToInt16(ddlp.SelectedValue), 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        int ProjectId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["ProjectId"].ToString());
        int id = Convert.ToInt16(Session["Cid"].ToString());
        //ProjectMaster p = new ProjectMaster();
        var data = db.ProjectMasters.Single(a => a.ProjectId == ProjectId);
        db.ProjectMasters.DeleteOnSubmit(data);
        db.SubmitChanges();


        //db.manage_projectmaster(ProjectId,Convert.ToString(0), "", DateTime.Now, 0, DateTime.Now, DateTime.Now, id, 3);
        bindgrid();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt16(GridView1.DataKeys[0].Value);
        // db.manage_projectmaster(ID, DropDownProject.SelectedValue, txtDes.Text, Convert.ToInt16(DropDownEmp.SelectedValue), 2);
        bindgrid();
        Response.Write("<script>alert('Data Updated Successfully');</script>");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Button1.Visible = false;
            Button2.Visible = true;
            Button3.Visible = true;


        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //string str = TextBox7.Text;
        //string PName = DropDownProject.SelectedItem.Text;
        //SqlCommand cmd;
        //SqlConnection con;
        //DataSet ds;
        //SqlDataAdapter da;

        //con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ConnectionString);
        //cmd = new SqlCommand("select p.*,e.* from ProjectMaster p,EmployeeMaster e where e.EmpId = p.EmpId and p.ProjectName = '" + TextBox7.Text + "'", con);
        //da = new SqlDataAdapter(cmd);
        //ds = new DataSet();
        //da.Fill(ds);
        //DataTable dt = new DataTable();
        //dt = ds.Tables[0];
        //int flag = 0;
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    if (dt.Rows[i]["ProjectName"].ToString() == str)
        //    {
        //        flag = 1;
        //        break;
        //    }
        //}
        //if (flag == 1)
        //{
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();

        //}
        //else
        //{
        //    Response.Write("<script>alert('No record found');</script>");
        //    //GridView1.DataSource = ;
        //    Response.Redirect("AssignProject.aspx");
        //}
        int id = Convert.ToInt16(Session["Cid"].ToString());
        var data1 = from e1 in db.EmployeeMasters
                   join f in db.ProjectMasters
                   on e1.EmpId equals f.EmpId
                   join p in db.AllProjects
                   on e1.CompanyId equals p.CompanyId
                   where f.CompanyId == id && p.ProjectNameAll == TextBox7.Text
                   select new { f.ProjectId, p.ProjectNameAll, f.Discription, f.ProjectDate, e1.FName, f.StartDate, f.Enddate };
        if (data1.Count() > 0)
        {
            GridView1.DataSource = data1;
            GridView1.DataBind();
        }

        else
        {
           Response.Write("<script>alert('No record found');</script>");
           GridView1.DataSource = data1;
           Server.Transfer("Project.aspx");
          //Response.Redirect("Project.aspx");
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
    }
    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }
}                                                                                                                                    