using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ManageCalander : System.Web.UI.Page
{
    public SqlConnection con;
    public SqlCommand com;
    public DataSet ds;
    public SqlDataAdapter da;
    public DateTime[] ar;
    public string[] ar1;
    public string constr, query;
    public void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ToString();
        con = new SqlConnection(constr);
        con.Open();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        connection();
        if (Session["Cid"] == null)
        {

            Response.Redirect("../login.aspx");
        }
        else
        {


            
            int id = Convert.ToInt16(Session["Cid"].ToString());
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
