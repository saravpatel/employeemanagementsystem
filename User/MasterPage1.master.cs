using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetNoStore();
        Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        if (Session["CAdmin"] != null && Session["Cid"] != null && Session["pic"] != null && Session["Cname"] !=null)
        {
            img1.ImageUrl = Session["pic"].ToString();
            Label1.Text = "Welcome" + " " + Session["Cname"].ToString();
        }
        else
        {
            Response.Redirect("../login.aspx");
        }
    }
}
