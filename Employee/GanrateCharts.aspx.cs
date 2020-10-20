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

public partial class Employee_GanrateCharts : System.Web.UI.Page
{
    private SqlConnection con;
    private SqlCommand com;
    private string constr, query;
    private void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["ProjectManagementConnectionString"].ToString();
        con = new SqlConnection(constr);
        con.Open();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            Bindchart();
        }
    }

   
    private void Bindchart()
    {
        if (Session["EmpId"] == null)
        {
            Response.Redirect("../login.aspx");

        }
        else
        {
            connection();
            query = "select *from [Table] where EmpId=" + int.Parse(Session["EmpId"].ToString());//not recommended this i have written just for example,write stored procedure for security  
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
            //binding chart control  
            Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

            //Setting width of line  
            Chart1.Series[0].BorderWidth = 1;
            //setting Chart type   
            Chart1.Series[0].ChartType = SeriesChartType.Line;


            Chart2.Series[0].Points.DataBindXY(XPointMember, YPointMember);

            //Setting width of line  
            Chart2.Series[0].BorderWidth = 1;
            //setting Chart type   
            Chart2.Series[0].ChartType = SeriesChartType.Bar;



            Chart3.Series[0].Points.DataBindXY(XPointMember, YPointMember);

            //Setting width of line  
            Chart3.Series[0].BorderWidth = 1;
            //setting Chart type   
            Chart3.Series[0].ChartType = SeriesChartType.Pie;

            Chart4.Series[0].Points.DataBindXY(XPointMember, YPointMember);

            //Setting width of line  
            Chart4.Series[0].BorderWidth = 1;
            //setting Chart type   
            Chart4.Series[0].ChartType = SeriesChartType.Column;

            con.Close();
        }
    }
   
}