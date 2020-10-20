using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SAdmin"] != null)
        {
            //img1.ImageUrl = Session["pic"].ToString();
            
            if (!IsPostBack)
            {
                bindgrid();
                fillddl();
                DropDownCTypeId.DataSource = db.manage_companytypemaster(0, "", 4);
                DropDownCTypeId.DataTextField = "CompanyType";
                DropDownCTypeId.DataValueField = "CompanytypeId";
                DropDownCTypeId.DataBind();

            }
        }
        else
        {
            Response.Redirect("../login.aspx");
        }
        
    }

private void fillddl()
{
    DropDownState.DataSource = db.manage_state(0, "", 4);
    DropDownState.DataTextField = "StateName";
    DropDownState.DataValueField = "StateId";
    DropDownState.DataBind();
    DropDownState.Items.Insert(0, "--Select State--");
}

    public void bindgrid()
    {
        GridView1.DataSource = db.manage_company1(0,"","",0,0,"","","","","","",0,0,"",4);
        GridView1.DataBind();
    }
    
   
   /* protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
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
    }*/
    protected void DropDownState_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id=Convert.ToInt16(DropDownState.SelectedValue);
        var data = from d in db.CityMasters
                   where d.StateId==id
                   select d;
        DropDownCity.DataSource=data;
        DropDownCity.DataTextField = "CityName";
        DropDownCity.DataValueField = "CityId";
        DropDownCity.DataBind();
        DropDownCity.Items.Insert(0, "--Select city--");


    }
    Bal b = new Bal();
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCname.Text == "")
            {
                lblcname.Text = "Please Enter Company Name First..!";
                return;
            }
            if (txtCname.Text != null)
            {
                lblcname.Text = "";
            }

            //Address
            if (txtAddress.Text == "")
            {
                lbladd.Text = "Please Enter Your Address..!";
                return;
            }
            if (txtAddress.Text != null)
            {
                lbladd.Text = "";
            }

            //Mobaile

            if (txtMob.Text == "")
            {
                lblmob.Text = "Please Enter Your Mobaile Number..!";
                return;
            }
            if (txtMob.Text != null)
            {
                lblmob.Text = "";
            }

            //Phone

            if (txtPhone.Text == "")
            {
                lblphn.Text = "Please Enter Your Phone Number..!";
                return;
            }
            if (txtPhone.Text != null)
            {
                lblphn.Text = "";
            }

            //fax

            if (txtFax.Text == "")
            {
                lblfax.Text = "Please Enter Your fax Number..!";
                return;
            }
            if (txtFax.Text != null)
            {
                lblfax.Text = "";
            }

            //Email
            if (txtEmail.Text == "")
            {
                lblemail.Text = "Please Enter Your Email Address..!";
                return;
            }
            if (txtEmail.Text != null)
            {
                lblemail.Text = "";
            }

            //webAddress

            if (txtWebAdd.Text == "")
            {
                lblweb.Text = "Please Enter Your Web Adrress..!";
                return;
            }
            if (txtWebAdd.Text != null)
            {
                lblweb.Text = "";
            }

            //txtEmps
            if (txtEmps.Text == "")
            {
                lblem.Text = "Please Enter Your fax Number..!";
                return;
            }
            if (txtEmps.Text != null)
            {
                lblem.Text = "";
            }
            //password

            if (TextBox1.Text == "")
            {
                lblpass.Text = "Please Enter Your Password..!";
                return;
            }
            if (TextBox1.Text != null)
            {
                lblpass.Text = "";
            }





            int sid = Convert.ToInt16(DropDownState.SelectedValue);
            int cid = Convert.ToInt16(DropDownCity.SelectedValue);
            int comptypeid = Convert.ToInt16(DropDownCTypeId.SelectedValue);

            string path = @"~/img1/" + FileUpload1.PostedFile.FileName;
            string email = txtEmail.Text;
            DataTable dt = b.select_emailcompany(email);
            if (FileUpload1.HasFile)
            {
                string path1 = @"~/img1/" + FileUpload1.PostedFile.FileName;
                FileUpload1.SaveAs(Server.MapPath(path1));

            }
            else
            {
                Response.Write("file not selected");
            }
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('you have already Registed');</script>");
                //Label1.Visible = true;


            }
            else
            {
                db.manage_company1(0, txtCname.Text, txtAddress.Text, cid, sid, txtMob.Text, txtPhone.Text, txtFax.Text, txtEmail.Text, txtWebAdd.Text, path, Convert.ToInt16(txtEmps.Text), cid, TextBox1.Text, 1);
                bindgrid();
                Response.Write("<script>alert('Data Inserted Successfully');</script>");


                txtAddress.Text = "";
                txtCname.Text = "";
                txtEmail.Text = "";
                txtEmps.Text = "";
                txtFax.Text = "";
                txtMob.Text = "";
                txtPhone.Text = "";
                txtWebAdd.Text = "";
            }
           
            

        }

        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }

    }   
    
    /*protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        Label lblid = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label3"));
        TextBox txtcname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        db.manage_city(int.Parse(lblid.Text), txtCity.Text, int.Parse(DropDownStateid.SelectedItem.Text), 2);
        GridView1.EditIndex = -1;
        bindgrid();
    }*/
    
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="up")
        {
            int id = Convert.ToInt16(e.CommandArgument.ToString());
            Session["CompanyId"] = id;
            Response.Redirect("modify.aspx");
        }
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string str =TextBox7.Text;
        //string PName = DropDownProject.SelectedItem.Text;
        SqlCommand cmd;
        SqlConnection con;
        DataSet ds;
        SqlDataAdapter da;

        con= new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ConnectionString);
        cmd = new SqlCommand("select * from CompanyMaster where CompanyName = '" + TextBox7.Text + "'", con);
        da=new SqlDataAdapter(cmd);
        ds=new DataSet();
        da.Fill(ds);
        DataTable dt =new DataTable();
        dt=ds.Tables[0];
        int flag=0;
        for (int i=0;i<dt.Rows.Count;i++)
        {
            if(dt.Rows[i]["CompanyName"].ToString()==str)
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
                //GridView1.DataSource = ;
                bindgrid();
                GridView1.DataBind();
            }
    }
    
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid(); 
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
        //int  = int.Parse(GridView1.DataKeys[e.RowIndex].Values["EventId"].ToString());
        db.manage_company1(id, "", "", 0, 0, "", "", "", "", "", "", 0, 0, "", 3);
        bindgrid();
    }
}

