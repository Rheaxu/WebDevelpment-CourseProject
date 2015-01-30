<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_dao_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Login</h1>
        <asp:TextBox ID="LoginUsername" runat="server" CssClass="form-control" placeholder="Username"/>
        <asp:TextBox ID="LoginPassword" runat="server" CssClass="form-control" Placeholder="Password"/>
        <asp:Button ID="LoginBtn" runat="server" Text="Login" onclick="LoginBtn_Click" CssClass="btn btn-primary btn-block"/>
        <a href="register.aspx" class="btn btn-success btn-block">Register</a>

        <asp:Label ID="LoginError" runat="server"/>
    </div>
    </form>
</body>
</html>
