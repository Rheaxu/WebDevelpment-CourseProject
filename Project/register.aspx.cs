using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegisterBtn_Click1(object sender, EventArgs e)
    {
        //string username = Username.Text;
        //string password = Password.Text;
        //string password2 = Password.Text;
        //if (username == "" || username == null)
        //{
        //    ErrorLabel.Text = "Username is required";
        //    return;
        //}
        //if (password == "" || password == null)
        //{
        //    ErrorLabel.Text = "Password is required";
        //    return;
        //}
        //if (password != password2)
        //{
        //    ErrorLabel.Text = "Password must be the same";
        //    return;
        //}

        //AppUser appUser = new AppUser(username, password, "", "", "");
        //dao.createAppUser(appUser);

        //Session["loggedInAppUser"] = appUser;

        //Response.Redirect("profile.aspx?username=" + username);
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string username = CreateUserWizard1.UserName;
        string password = CreateUserWizard1.Password;
        string email = CreateUserWizard1.Email;
        string question = CreateUserWizard1.Question;
        string answer = CreateUserWizard1.Answer;

        AppUser appUser = new AppUser(username, password, email, question, answer);
        AppUserDAO dao = new AppUserDAO();
        dao.createAppUser(appUser);
    }
}