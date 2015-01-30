using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Experiments_experimentfiles_SQLdb_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        var loggedInUsername = username.Text;
        Session["loggedInUsername"] = loggedInUsername;
        Response.Redirect("profile.aspx?username=" + loggedInUsername);
    }
}