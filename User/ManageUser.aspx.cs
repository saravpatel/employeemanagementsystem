using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.IO; 

public partial class User_ManageUser: System.Web.UI.Page
{

  DataClassesDataContext db = new DataClassesDataContext();


  protected void Page_Load(object sender, EventArgs e)
  {
      if (!IsPostBack)
      {
          bindgrid();
          fillddl();
          DropDownDId.DataSource = db.manage_designationmaster(0, "", 4);
          DropDownDId.DataTextField = "Designation";
          DropDownDId.DataValueField = "DegId";
          DropDownDId.DataBind();
          DropDownDId.Items.Insert(0,"--Select Designation--");
          DropDownCity1.Items.Insert(0, "--Select city--");
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
          var data = from e in db.EmployeeMasters
                     where id == e.CompanyId
                     select e;
          GridView1.DataSource = data;
          GridView1.DataBind();
      }
  }
    private void fillddl()
    {
        DropDownState1.DataSource = db.manage_state(0, "", 4);
        DropDownState1.DataTextField = "StateName";
        DropDownState1.DataValueField = "StateId";
        DropDownState1.DataBind();
        DropDownState1.Items.Insert(0, "--Select State--");
    }

    protected void DropDownState1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(DropDownState1.SelectedValue);
        var data = from d in db.CityMasters
                   where d.StateId == id
                   select d;
        DropDownCity1.DataSource = data;
        DropDownCity1.DataTextField = "CityName";
        DropDownCity1.DataValueField = "CityId";
        DropDownCity1.DataBind();
        DropDownCity1.Items.Insert(0, "--Select city--");


    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtFName.Text == "")
        {
            lblfname.Text = "Please Enter First Name..!";
            return;
        }
        if (txtFName.Text != null)
        {
            lblfname.Text = "";
        }

        //mname
        if (txtMname.Text == "")
        {
            lblmname.Text = "Please Enter Middel Name..!";
            return;
        }
        if (txtMname.Text != null)
        {
            lblmname.Text = "";
        }

        //lmane

        if (txtLname.Text == "")
        {
            lbllname.Text = "Please Enter Your last Name..!";
            return;
        }
        if (txtLname.Text != null)
        {
            lbllname.Text = "";
        }

        //Phone

        if (txtAddress1.Text == "")
        {
            lbladd.Text = "Please Enter Your Address..!";
            return;
        }
        if (txtAddress1.Text != null)
        {
            lbladd.Text = "";
        }

        //fax

        if (txtMno1.Text == "")
        {
            lblmo.Text = "Please Enter Your Mobaile Number..!";
            return;
        }
        if (txtMno1.Text != null)
        {
            lblmo.Text = "";
        }

        //Email
        if (txtEmail1.Text == "")
        {
            lblemail.Text = "Please Enter Your Email Address..!";
            return;
        }
        if (txtEmail1.Text != null)
        {
            lblemail.Text = "";
        }

        //webAddress

        if (txtPass1.Text == "")
        {
            lblpass.Text = "Please Enter Your Password..!";
            return;
        }
        if (txtPass1.Text != null)
        {
            lblpass.Text = "";
        }

        //txtEmps
        if (txtDob.Text == "")
        {
            lbldob.Text = "Please Enter Your fax Number..!";
            return;
        }
        if (txtDob.Text != null)
        {
            lbldob.Text = "";
        }
        //password

        if (txtJdate.Text == "")
        {
            lbljdate.Text = "Please Enter Your Password..!";
            return;
        }
        if (txtJdate.Text != null)
        {
            lbljdate.Text = "";
        }





        string Fname = "";
        string Mname = "";
        string Lname = "";
        string Address = "";
        string Mobile = "";
        string Email = "";
        string Passwrd = "";

        int id = Convert.ToInt16(Session["Cid"].ToString());
        string d = "";
        string d1 = "";
        int sid = Convert.ToInt16(DropDownState1.SelectedValue);
        int cid = Convert.ToInt16(DropDownCity1.SelectedValue);
        int degid = Convert.ToInt16(DropDownDId.SelectedValue);
        string dob = txtDob.Text;

        Fname = txtFName.Text;
        Mname = txtMname.Text;
        Lname = txtLname.Text;
        Address = txtAddress1.Text;
        Mobile = txtMno1.Text;
        Email = txtEmail1.Text;
        Passwrd = txtPass1.Text;


        string path = @"../img1/" + FileUpload1.PostedFile.FileName;

        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath(path));

        }
        else
        {
            Response.Write("file not selected");
        }

        string pt = @"img1/" + FileUpload1.FileName;

        SqlConnection cn = new SqlConnection(@"Data Source=SARAV-PC\SQLEXPRESS;Initial Catalog=ProjectManagement;Integrated Security=True");

            //SqlCommand cmd = new SqlCommand("insert into EmployeeMaster values('" + Fname + "','" + Mname + "','" + Lname + "','" + Addres + "','" + cid + "','" + sid + "','" + Mobile + "','" + Email + "','" + Passwrd + "','" + path + "','" + degid + "','" + dob + "','" + jdate + "')", cn);
            SqlCommand cmd = new SqlCommand("manage_employee1", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FName", Fname);
            cmd.Parameters.AddWithValue("@MName", Mname);
            cmd.Parameters.AddWithValue("@LName", Lname);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.Parameters.AddWithValue("@sid", sid);
            cmd.Parameters.AddWithValue("@MobileNo",Mobile);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@password", Passwrd);
            cmd.Parameters.AddWithValue("@Photo",pt );
            cmd.Parameters.AddWithValue("@DegId",degid );
            cmd.Parameters.AddWithValue("@Dob",dob );
            cmd.Parameters.AddWithValue("@Coid",id);


            //string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=emsystem7@gmail.com:ems@0000&senderID=TEST SMS&receipientno=" + txtMno1.Text + "&dcs=0&msgtxt=You are successfully registered your Username:: " + txtEmail1.Text + " and your password is::  " + txtPass1.Text + "&state=4";
            //WebRequest request = HttpWebRequest.Create(strUrl);
            //HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            //Stream s = (Stream)response.GetResponseStream();
            //StreamReader readStream = new StreamReader(s);
            //string dataString = readStream.ReadToEnd();
            //response.Close();
            //s.Close();
            //readStream.Close();
           

            cn.Open();
            try
            {

                cmd.ExecuteNonQuery();
                bindgrid();
                
                string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=jahanvi.kumpavat@tops-int.com:123456&senderID=TEST SMS&receipientno=" + txtMno1.Text + "&dcs=0&msgtxt=You are successfully registered your Username:: " + txtEmail1.Text + " and your password is::  " + txtPass1.Text + "&state=4";
                WebRequest request = HttpWebRequest.Create(strUrl);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream s = (Stream)response.GetResponseStream();
                StreamReader readStream = new StreamReader(s);
                string dataString = readStream.ReadToEnd();
                response.Close();
                s.Close();
                readStream.Close();
                Response.Write("<script>alert('Data Inserted Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Data Inserted Successfully');</script>");
            }
            cn.Close();
            //db.manage_employee(0,txtFName.Text, txtMname.Text, txtLname.Text, txtAddress1.Text, cid, sid, txtMno1.Text, txtEmail1.Text, txtPass1.Text, path,degid,Convert.ToDateTime(txtDob.Text),Convert.ToDateTime(txtJdate.Text), 1);


            txtAddress1.Text = "";
            txtDob.Text = "";
            txtEmail1.Text="";
            txtFName.Text = "";
            txtJdate.Text = "";
            txtLname.Text = "";
            txtMname.Text = "";
            txtMno1.Text = "";
            txtPass1.Text = "";
            


       
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int EmpId = int.Parse(GridView1.DataKeys[e.RowIndex].Values["EmpId"].ToString());
        int id = Convert.ToInt16(Session["Cid"].ToString());
        db.manage_employee(EmpId,"","","","",0,0,"","","","",0,"","",id,3);

        bindgrid();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Update")
        {
            int id = Convert.ToInt16(e.CommandArgument.ToString());
            Session["EmpId"] = id;
            Response.Redirect("ModifyUser.aspx");
        }
        
    }
   /* protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string str = TextBox7.Text;
        Response.Write(str);
        Response.Write("<script>alert('"+TextBox7.Text+"')</script>");

        var data = (from p in db.EmployeeMasters
                    where p.FName == TextBox7.Text
                    select p);
        if(data.Count()>0)
        {

            GridView1.DataSource = data;
            GridView1.DataBind();

        }
        else
        {            
            Response.Write("<script>alert('No record found');</script>");
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }*/
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        if (TextBox7.Text == "")
        {
            Response.Write("<script>alert('Please enter the Name');</script>");
        }
        else
        {


            string str = TextBox7.Text;
            SqlCommand cmd;
            SqlConnection con;
            DataSet ds;
            SqlDataAdapter da;
            int id = Convert.ToInt16(Session["Cid"].ToString());
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ConnectionString);
            cmd = new SqlCommand("Select * From EmployeeMaster WHERE FName='" + str + "' and CompanyId='" + id + "'", con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            int flag = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["FName"].ToString() == str)
                {
                    flag = 1;
                    break;
                }
            }
            if (flag == 1)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            else
            {
                Response.Write("<script>alert('No record found');</script>");
                //GridView1.DataSource = null;
                // GridView1.DataBind();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageUser.aspx");
    }
}
