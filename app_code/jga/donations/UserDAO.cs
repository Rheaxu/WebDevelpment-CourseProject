using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserDAO
/// </summary>
public class UserDAO
{
	public UserDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<UserVO> findAllUsers() 
    {
        List<UserVO> users = new List<UserVO>();

        string sql = "select * from [User]";

        SqlConnection connection = new SqlConnection("Data Source=127.0.0.1;Initial Catalog=rheaxu;Persist Security Info=True;User ID=rheaxu;Password=qGF8FeUu");
        connection.Open();

        SqlCommand command = new SqlCommand(sql, connection);
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read()) {
            string username = reader["username"].ToString();
            string password = reader["password"].ToString();
            string email = reader["email"].ToString();
            string firstName = reader["firstName"].ToString();
            string lastName = reader["lastName"].ToString();
            DateTime dob = Convert.ToDateTime(reader["dob"]);

            UserVO user = new UserVO(username, password, email, firstName, lastName, dob);
            users.Add(user);
        }

        connection.Close();
        return users;
    }

    public void create(UserVO newUser)
    {
        string sql = "INSERT INTO [User] (username, password,email,firstName,lastName,dob) VALUES(@username,@password,@email,@firstName,@lastName,@dob)";

        SqlConnection connection = new SqlConnection("Data Source=127.0.0.1;Initial Catalog=rheaxu;Persist Security Info=True;User ID=rheaxu;Password=qGF8FeUu");
        connection.Open();

        SqlCommand command = new SqlCommand(sql, connection);
        SqlParameter usernameParam = new SqlParameter("@username", newUser.username);
        SqlParameter passwordParam = new SqlParameter("@password", newUser.password);
        SqlParameter emailParam = new SqlParameter("@email", newUser.email);
        SqlParameter firstNameParam = new SqlParameter("@firstName", newUser.firstName);
        SqlParameter lastNameParam = new SqlParameter("@lastName", newUser.lastName);
        SqlParameter dobParam = new SqlParameter("@dob", newUser.dob);
        command.Parameters.Add(usernameParam);
        command.Parameters.Add(passwordParam);
        command.Parameters.Add(emailParam);
        command.Parameters.Add(firstNameParam);
        command.Parameters.Add(lastNameParam);
        command.Parameters.Add(dobParam);
        command.ExecuteNonQuery();
        
        connection.Close();
    }
}