using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Data.Linq;

public partial class Project_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /**AppUser appUser = (AppUser)Session["loggedInAppUser"];
        if (IsPostBack && appUser!=null)
        {
            Console.Write("The username is" + appUser.username);
            Label1.Text = User.Identity.Name;
        }
        else
        {
            Label1.Text = "";
        }**/
        string loggedInUsername = Page.User.Identity.Name;
        if (loggedInUsername != null)
        { 
        Session["loggedInAppUsername"] = loggedInUsername;
        }
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Label1.Text = Page.User.Identity.Name;
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session.Abandon();
    }
}