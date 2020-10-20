using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Bal
/// </summary>
public class Bal
{
    manageuser u = new manageuser();
    managecompany om = new managecompany();
	public Bal()
	{
		//
		// TODO: Add constructor logic here
		//

       
	}
    public int EMPID { get; set; }
    public int projectId { get; set; }
    public int COMPANYID { get; set; }

    public DataTable select_user(Bal b)
    {
      return  u.select_user(b);
    }
    public DataTable select_project(Bal b)
    {
        return u.select_project(b);
    }
    public DataTable select_emailcompany(string email)
    {
        return om.select_emailcompany(email);
    }
    public int check_project(string pnm,int id)
    {
        return u.check_project(pnm,id);
    }
    public DataTable select_company(Bal b)
    {
        return u.select_company(b);
    }
}