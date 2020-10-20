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

public partial class Employee_Default : System.Web.UI.Page
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
        connection();
        if (Session["EmpId"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        else
        {

            //int id = Convert.ToInt16(Session["EmpId"].ToString());
            int id = Convert.ToInt16(Session["EmpId"].ToString());
            //int[] cids = convert((from asd in db.EventMasters select asd.Company_Id).ToArray());
            com = new SqlCommand("select e.EventName,e.EventDate from EventMaster e inner join  EmployeeMaster em on e.[Company Id]=em.CompanyId where em.EmpId=" + id, con);
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
                int id2 = Convert.ToInt16(Session["Cid"].ToString());
                int id1 = Convert.ToInt16(Session["EmpId"].ToString());
                var data = from n in db.NewsMasters
                           join f in db.EmployeeMasters
                           on n.CompanyId equals f.CompanyId
                           where f.EmpId == id1
                           select new { n.News };
                rep.DataSource = data;//db.NewsMasters.ToList();
                rep.DataBind();

                string cmm = System.DateTime.Now.ToString("MM");
                rep.DataSource = db.manage_newsmaster(0, "", int.Parse(Session["Cid"].ToString()), false, 4);//db.NewsMasters.ToList();
                rep.DataBind();
                SqlDataAdapter da2 = new SqlDataAdapter("select * from EmployeeMaster where Dob like '%-" + cmm + "-%' and CompanyId=" + id2, con);
                DataTable dt1 = new DataTable();
                da2.Fill(dt1);
                Rptdob.DataSource = dt1;
                Rptdob.DataBind();
            }
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