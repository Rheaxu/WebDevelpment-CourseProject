using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Experiments_experimentfiles_SQLdb_donation2_Users : System.Web.UI.Page
{
    UserDAO dao = new UserDAO();

    protected void Page_Load(object sender, EventArgs e)
    {
        List<UserVO> users = dao.findAllUsers();
        AllUsersRepeater.DataSource = users;
        AllUsersRepeater.DataBind();
    }
    protected void CreateNewUserBtn_Click(object sender, EventArgs e)
    {
        string username = UsernameTxtBx.Text;
        string password = PasswordTxtBx.Text;
        string email = EmailTxtBx.Text;
        string firName = FirstNameTxtBx.Text;
        string lastName = LastNameTxtBx.Text;

        UserVO user = new UserVO(username, password, email, firName, lastName, DateTime.Now);
        dao.create(user);

    }
}