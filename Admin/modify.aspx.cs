using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_modify : System.Web.UI.Page
{
    Bal b = new Bal();
   DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SAdmin"] != null)
        {
            if (!IsPostBack)
            {
                filldata();
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

   
  
    protected void DropDownState_SelectedIndexChanged1(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(DropDownState.SelectedValue);
        var data = from d in db.CityMasters
                   where d.StateId == id
                   select d;
        DropDownCity.DataSource = data;
        DropDownCity.DataTextField = "CityName";
        DropDownCity.DataValueField = "CityId";
        DropDownCity.DataBind();
        DropDownState.Items.Insert(0, "--Select city--");
    }
    public void filldata()
    {
        DataTable dt = new DataTable();
        int id = Convert.ToInt16(Session["CompanyId"].ToString());
        b.COMPANYID = id;
        dt = b.select_company(b);

        txtCname.Text = dt.Rows[0]["CompanyName"].ToString();
        txtAddress.Text = dt.Rows[0]["Addres"].ToString();
        txtMob.Text = dt.Rows[0]["MobileNo"].ToString();
        txtPhone.Text = dt.Rows[0]["Phone"].ToString();
        txtFax.Text = dt.Rows[0]["FaxNo"].ToString();
        txtEmail.Text = dt.Rows[0]["Email"].ToString();
        txtWebAdd.Text = dt.Rows[0]["Website"].ToString();
        txtEmps.Text = dt.Rows[0]["EmpStrenght"].ToString();
        TextBox1.Text = dt.Rows[0]["pwd"].ToString();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt16(Session["CompanyId"]);
            int sid = Convert.ToInt16(DropDownState.SelectedValue);
            int cid = Convert.ToInt16(DropDownCity.SelectedValue);
            int comptypeid = Convert.ToInt16(DropDownCTypeId.SelectedValue);

            string path = @"~/img1/" + FileUpload1.PostedFile.FileName;

            if (FileUpload1.HasFile)
            {
                string path1 = @"~/img1/" + FileUpload1.PostedFile.FileName;
                FileUpload1.SaveAs(Server.MapPath(path1));

            }
            else
            {
                Response.Write("file not selected");
            }

            db.manage_company1(id, txtCname.Text, txtAddress.Text, cid, sid, txtMob.Text, txtPhone.Text, txtFax.Text, txtEmail.Text, txtWebAdd.Text, path, Convert.ToInt16(txtEmps.Text), comptypeid, Label1.Text, 2);
            Response.Redirect("~/Admin/Default.aspx");

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
    }
}