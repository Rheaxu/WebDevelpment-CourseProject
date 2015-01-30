<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_donation2_Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Users</h1>
        <h2>List Existing Users</h2>
        <ul>
        <asp:Repeater ID="AllUsersRepeater" runat="server">
            <ItemTemplate>
                <!--This item template is running on the asp server side. 
                    The np-repeat is running on the client, it is angular framework-->
                <li>
                    <span><%# Eval("username") %></span>
                    <span><%# Eval("email") %></span>
                    <span><%# Eval("firstName") %></span>
                    <span><%# Eval("lastName") %></span>
                </li> 
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <h2>Create New User</h2>
        <asp:TextBox ID="UsernameTxtBx" runat="server" placeholder="Username"/><br />
        <asp:TextBox ID="PasswordTxtBx" runat="server" placeholder="Password"/><br />
        <asp:TextBox ID="FirstNameTxtBx" runat="server" placeholder="First Name"/><br />
        <asp:TextBox ID="LastNameTxtBx" runat="server" placeholder="Last Name"/><br />
        <asp:TextBox ID="EmailTxtBx" runat="server" placeholder="Email" /><br />
        <asp:Button ID="CreateNewUserBtn" runat="server" Text="Create" OnClick="CreateNewUserBtn_Click" />

    </div>
    </form>
</body>
</html>
