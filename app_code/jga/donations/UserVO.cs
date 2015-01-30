using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class UserVO
{
    public string username { set; get; }
    public string password { set; get; }
    public string email { set; get; }
    public string firstName { set; get; }
    public string lastName { set; get; }
    public DateTime dob { set; get; }
    public UserVO() {
        dob = DateTime.Now;
    }
    public UserVO(string username,string password,string email,string firstName,string lastName,DateTime dob) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
    }
}
