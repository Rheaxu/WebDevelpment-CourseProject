using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Experiments_experimentfiles_SQLdb_dao_login : System.Web.UI.Page
{
    DeveloperDAO dao = new DeveloperDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        /*string username = LoginUsername.Text;
        string password = LoginPassword.Text;
        LoginError.Text = "";

        Developer developer = dao.findByUsernameAndPassword(username, password);

        if (developer == null)
        {
            LoginError.Text = "No such user exist";
            return;
        }

        Session["loggedInDeveloper"] = developer;
        Response.Redirect("profile.aspx");*/
    }
}