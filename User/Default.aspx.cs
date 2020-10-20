using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    public SqlConnection con;
    public SqlCommand com;
    public DataSet ds;
    public SqlDataAdapter da;
    public DateTime[] ar;
    public string[] ar1;
    public string constr, query;

    DataClassesDataContext db = new DataClassesDataContext();

    public void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ToString();
        con = new SqlConnection(constr);
        con.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CAdmin"] == null)
        {
            Response.Redirect("../login.aspx");
        }
         connection();
        // int id = Convert.ToInt16(Session["EmpId"].ToString());
         int id = Convert.ToInt16(Session["Cid"].ToString());
         //int[] cids = convert((from asd in db.EventMasters select asd.Company_Id).ToArray());
        com = new SqlCommand("Select * from EventMaster where [Company Id]=" + id, con);
        da = new SqlDataAdapter(com); 
        ds = new DataSet();
        da.Fill(ds);
        ar = new DateTime[ds.Tables[0].Rows.Count];
        ar1 = new string[ds.Tables[0].Rows.Count];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ar[i] = Convert.ToDateTime(ds.Tables[0].Rows[i]["EventDate"].ToString());
            ar1[i] = ds.Tables[0].Rows[i]["EventName"].ToString();
        }

        if (!IsPostBack)
        {
            string cmm = System.DateTime.Now.ToString("MM");
            rep.DataSource = db.manage_newsmaster(0, "", int.Parse(Session["Cid"].ToString()),false, 4);//db.NewsMasters.ToList();
            rep.DataBind();
            SqlDataAdapter da2 = new SqlDataAdapter("select * from EmployeeMaster where Dob like '%-" + cmm + "-%' and CompanyId=" + id, con);
            DataTable dt1 = new DataTable();
            da2.Fill(dt1);
            Rptdob.DataSource = dt1;
            Rptdob.DataBind();

        }
    }
    
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date >= DateTime.Now.Date && e.Day.Date <= DateTime.Now.AddDays(30))
            e.Day.IsSelectable = true;
        else
            e.Day.IsSelectable = false;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (e.Day.Date == ar[i].Date)
            {
                e.Cell.Controls.Add(new LiteralControl("<br>" + ar1[i].ToString()));
                e.Cell.BackColor = Color.Lavender;
                e.Cell.BorderColor = Color.Blue;
                e.Cell.BorderStyle = BorderStyle.Solid;
                e.Cell.BorderWidth = 4;
            }
        }

    }
}