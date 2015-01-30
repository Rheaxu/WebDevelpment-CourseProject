using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AppUser
/// </summary>
public class AppUser
{
    public string username { set; get; }
    public string email { set; get; }
    public string password { set; get; }
    public string question { set; get; }
    public string answer { set; get; }
	public AppUser(string username,string password,string email,string question,string answer)
	{
        this.username = username;
        this.password = password;
        this.email = email;
        this.question = question;
        this.answer = answer;
	}
    public AppUser()
    { 
    
    }
}