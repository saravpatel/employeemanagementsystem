using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dal
/// </summary>
public class Dal
{
    public SqlConnection con = new SqlConnection(@"Data Source=SARAV-PC\SQLEXPRESS;Initial Catalog=ProjectManagement;Integrated Security=True");
    public SqlCommand cmd;
    public SqlDataAdapter da;
    public DataTable DT;
	public Dal()
	{
		//
		// TODO: Add constructor logic here
		//
	}



}

class manageuser :Dal
{
    public DataTable select_user(Bal b)
    {
        da = new SqlDataAdapter("select * from EmployeeMaster where EmpId=@id",con);
        da.SelectCommand.Parameters.AddWithValue("@id",b.EMPID);
        DT= new DataTable();
        da.Fill(DT);
        return DT;



    }
    public DataTable select_project(Bal b)
    {
        da = new SqlDataAdapter("select * from ProjectMaster where ProjectId=@id", con);
        da.SelectCommand.Parameters.AddWithValue("@id", b.projectId);
        DT = new DataTable();
        da.Fill(DT);
        return DT;



    }
    public int check_project(string pnm,int id)
    {
        con.Open();
        cmd = new SqlCommand("select count(ProjectNameAll) from AllProject p inner join ProjectMaster pp on p.Pid =pp.Pid inner join CompanyMaster c on c.CompanyId=pp.CompanyId where p.ProjectNameAll=@p and c.CompanyId=@c", con);
        cmd.Parameters.AddWithValue("@p", pnm);
        cmd.Parameters.AddWithValue("@c", id);

        int n = Convert.ToInt16(cmd.ExecuteScalar());
        con.Close();
        return n;
    }

    internal DataTable select_company(Bal b)
    {
        da = new SqlDataAdapter("select * from CompanyMaster where CompanyId=@id", con);
        da.SelectCommand.Parameters.AddWithValue("@id", b.COMPANYID);
        DT = new DataTable();
        da.Fill(DT);
        return DT;
    }
}

class managecompany :Dal
{
    public DataTable select_emailcompany(string email)
    {
        da = new SqlDataAdapter("select * from CompanyMaster where Email=@id", con);
        da.SelectCommand.CommandType = CommandType.Text;
        da.SelectCommand.Parameters.AddWithValue("@id",email);
        DT = new DataTable();
        da.Fill(DT);
        return DT;



    }
    //public DataTable select_company(Bal b)
    //{

        
    //}
}