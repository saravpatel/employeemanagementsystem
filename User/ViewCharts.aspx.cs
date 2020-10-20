using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class User_ViewCharts : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Cid"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        if (!IsPostBack)
        {
            filldata();
        }
    }
    private SqlConnection con;
    private SqlCommand com;
    private string constr, query;
    private void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ToString();
        con = new SqlConnection(constr);
        con.Open();
    }
   
    public void filldata()
    {
        int id = Convert.ToInt16(Session["Cid"].ToString());
        var data = from e in db.EmployeeMasters
                   where id == e.CompanyId
                   select e;
        ddc.DataSource = data;//db.manage_employee(0, "", "", "", "", 0, 0, "", "", "", "", 0, "", "",id, 4);
        ddc.DataTextField = "FName";
        ddc.DataValueField = "EmpId";
        ddc.DataBind();
        ddc.Items.Insert(0, "--Select Name--");
    }
    protected void ddc_SelectedIndexChanged(object sender, EventArgs e)
    {
        connection();
        query = "select *from [Table] where EmpId=" + int.Parse(ddc.SelectedValue);//not recommended this i have written just for example,write stored procedure for security  
        // query = "select *from [Table] where EmpId=27";//not recommended this i have written just for example,write stored procedure for security  
        com = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        DataTable ChartData = ds.Tables[0];

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Month"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Project_Completion"]);


        }
        Chart4.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Chart4.Series[0].BorderWidth = 1;
        //setting Chart type   
        Chart4.Series[0].ChartType = SeriesChartType.Column;

        con.Close();
    }
}