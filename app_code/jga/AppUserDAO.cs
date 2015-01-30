using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for AppUserDAO
/// </summary>
/// Data Access Object
public class AppUserDAO
{
    protected static readonly string connectionString = ConfigurationManager.ConnectionStrings["rheaxuCS"].ToString();
    //string connectionString = "Data Source=mssql2005.development.ccs.neu.edu;Initial Catalog=rheaxu;integrated security=True;Persist Security Info=True";
    //string connectionString = "Data Source=127.0.0.1;Initial Catalog=rheaxu;Persist Security Info=True;User ID=rheaxu;Password=qGF8FeUu";
    public AppUserDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public AppUser findByUsername(string username)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        string sql = "select * from AuthUsers where username=@username";
        SqlCommand command = new SqlCommand(sql, connection);
        SqlParameter usernameParam = new SqlParameter("@username", username);
        command.Parameters.Add(usernameParam);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            string password = reader["password"].ToString();
            string email = reader["email"].ToString();
            string firstName = reader["firstName"].ToString();
            string lastName = reader["lastName"].ToString();
            string question = reader["question"].ToString();
            string answer = reader["answer"].ToString();
            AppUser appUser = new AppUser(username, password, email,question,answer);
            return appUser;
        }

        connection.Close();

        return null;
    }

    public AppUser findByUsernameAndPassword(string username, string password)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        string sql = "select * from AuthUsers where username=@username and password=@password";
        SqlCommand command = new SqlCommand(sql, connection);
        SqlParameter usernameParam = new SqlParameter("@username", username);
        SqlParameter passwordParam = new SqlParameter("@password", password);
        command.Parameters.Add(usernameParam);
        command.Parameters.Add(passwordParam);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            username = reader["username"].ToString();
            password = reader["password"].ToString();
            string email = reader["email"].ToString();
            string question = reader["question"].ToString();
            string answer = reader["answer"].ToString();
            AppUser appUser = new AppUser(username, password, email,question,answer);
            return appUser;
        }

        connection.Close();

        return null;
    }

    public void updateAppUser(string username,AppUser appUser)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        string sql = "update AuthUsers set email=@email, "+
                    "question=@question,answer=@answer where username=@username";
        SqlCommand command = new SqlCommand(sql, connection);
        SqlParameter usernameParam = new SqlParameter("@username", appUser.username);
        SqlParameter passwordParam = new SqlParameter("@password", appUser.password);
        SqlParameter emailParam = new SqlParameter("@email", appUser.email);
        SqlParameter questionParam = new SqlParameter("@question", appUser.question);
        SqlParameter answerParam = new SqlParameter("@answer", appUser.answer);
        command.Parameters.Add(usernameParam);
        command.Parameters.Add(passwordParam);
        command.Parameters.Add(emailParam);
        command.Parameters.Add(questionParam);
        command.Parameters.Add(answerParam);
        command.ExecuteNonQuery();
        connection.Close();
    }

    public void createAppUser(AppUser appUser)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        string sql = "insert into AuthUsers (username,password,email,question,answer) "+
                    "values (@username, @password, @email,@question,@answer)";
        SqlCommand command = new SqlCommand(sql,connection);
        SqlParameter usernameParam = new SqlParameter("@username", appUser.username);
        SqlParameter passwordParam = new SqlParameter("@password", appUser.password);
        SqlParameter emailParam = new SqlParameter("@email", appUser.email);
        SqlParameter questionParam = new SqlParameter("@question", appUser.question);
        SqlParameter answerParam = new SqlParameter("@answer", appUser.answer);
        command.Parameters.Add(usernameParam);
        command.Parameters.Add(passwordParam);
        command.Parameters.Add(emailParam);
        command.Parameters.Add(questionParam);
        command.Parameters.Add(answerParam);
        command.ExecuteNonQuery();
        connection.Close();
    }
}