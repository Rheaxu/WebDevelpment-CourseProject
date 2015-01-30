using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Experiments_experimentfiles_SQLdb_dao_profile : System.Web.UI.Page
{
    //DeveloperDAO dao = new DeveloperDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (!IsPostBack)    // if this is the first time do this, load everything from db
        {
            Developer developer = (Developer)Session["loggedInDeveloper"];

            ProfileUsername.Text = developer.username;
            ProfileEmail.Text = developer.email;
            ProfileFirstName.Text = developer.firstName;
            ProfileLastName.Text = developer.lastName;

        }*/
    }
    protected void ProfileUpdateBtn_Click(object sender, EventArgs e)
    {
        /*string username = ProfileUsername.Text;
        string email = ProfileEmail.Text;
        string firstName = ProfileFirstName.Text;
        string lastName = ProfileLastName.Text;
        Developer developer = new Developer(username, "", email, firstName, lastName);

        Session["loggedInDeveloper"] = developer;

        dao.updateDeveloper(username,developer);*/
    }
}