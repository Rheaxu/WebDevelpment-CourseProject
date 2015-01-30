using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_login : System.Web.UI.Page
{
    AppUserDAO dao = new AppUserDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        string searchTxt = Request["searchTxt"];
        if (searchTxt != null && searchTxt != "")
        {
            Login1.DestinationPageUrl = "searchImg.aspx?searchTxt=" + searchTxt;
        }
    }

    protected void Login1_LoggingIn1(object sender, LoginCancelEventArgs e)
    {
        string username = Login1.UserName;
        string password = Login1.Password;
        AppUser appUser = dao.findByUsernameAndPassword(username, password);
        if (appUser != null)
        {
            Session["loggedInAppUser"] = appUser;
        }
    }
}