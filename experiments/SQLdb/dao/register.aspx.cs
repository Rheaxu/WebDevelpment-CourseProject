using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Experiments_experimentfiles_SQLdb_dao_register : System.Web.UI.Page
{
    //DeveloperDAO dao = new DeveloperDAO();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        /*string username = RegisterUsername.Text;
        string password = RegisterPassword.Text;
        string password2 = RegisterPassword2.Text;
        if (username == "" || username == null)
        {
            RegisterError.Text = "Username is required";
            return;
        }
        if (password == "" || password == null)
        {
            RegisterError.Text = "Password is required";
            return;
        }
        if (password != password2)
        {
            RegisterError.Text = "Password must be the same";
            return;
        }

        Developer developer = new Developer(username, password, "", "", "");
        dao.createDeveloper(developer);

        Session["loggedInDeveloper"] = developer;

        Response.Redirect("profile.aspx?");*/
    }
}