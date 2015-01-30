using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Experiments_experimentfiles_SQLdb_simple_login_protected_newPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void newPostBtn_Click(object sender, EventArgs e)
    {
        string title = titleTxtBx.Text;
        string content = contentTxtBx.Text;
        string authorUsername = Request["authorUsername"];
        string ownerUsername = User.Identity.Name;

        SqlConnection connection = new SqlConnection("Data Source=127.0.0.1;Initial Catalog=rheaxu;Persist Security Info=True;User ID=rheaxu;Password=qGF8FeUu");
        connection.Open();

        string sql = "insert into articles (title,content,articleOwnerUsername,articleAuthorUsername) values (@title, @content,@ownerUsername,@authorUsername)";
        SqlCommand command = new SqlCommand(sql,connection);
        SqlParameter titleParam = new SqlParameter("title",title);
        SqlParameter contentParam = new SqlParameter("content", content);
        SqlParameter authorUsernameParam = new SqlParameter("authorUsername", authorUsername);
        SqlParameter ownerUsernameParam = new SqlParameter("ownerUsername", ownerUsername);
        command.Parameters.Add(titleParam);
        command.Parameters.Add(contentParam);
        command.Parameters.Add(authorUsernameParam);
        command.Parameters.Add(ownerUsernameParam);
        command.ExecuteNonQuery();
        connection.Close();

        Response.Redirect("profile.aspx?profileOwner="+ownerUsername);
    }
}