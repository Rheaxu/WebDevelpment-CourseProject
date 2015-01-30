<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_dao_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <style>
        .error {
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <h1>
        <a href="login.aspx" class="btn btn-danger">Back</a>
        Register
    </h1>
        <asp:TextBox ID="RegisterUsername" runat="server" CssClass="form-control" placeholder="Username"/>
        <asp:TextBox ID="RegisterPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"/>
        <asp:TextBox ID="RegisterPassword2" runat="server" CssClass="form-control" placeholder="Password Validation" TextMode="Password"/>
        <asp:Button ID="RegisterBtn" Text="Register" runat="server" OnClick="RegisterBtn_Click" CssClass="btn btn-primary btn-block"/>
        <asp:Label ID="RegisterError" runat="server" CssClass="error"/>
    </div>
    </form>
</body>
</html>
