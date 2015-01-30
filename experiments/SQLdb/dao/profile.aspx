<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_dao_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <a href="login.aspx" class="pull-right">Logout</a>
        <h1>Profile</h1>
        <asp:TextBox ID="ProfileUsername" runat="server" CssClass="form-control" />
        <asp:TextBox ID="ProfilePassword" runat="server" CssClass="form-control" />
        <asp:TextBox ID="ProfilePassword2" runat="server" CssClass="form-control" />
        <asp:TextBox ID="ProfileEmail" runat="server"  CssClass="form-control"/>
        <asp:TextBox ID="ProfileFirstName" runat="server" CssClass="form-control" />
        <asp:TextBox ID="ProfileLastName" runat="server" CssClass="form-control" />
        <asp:Button ID="ProfileUpdateBtn" runat="server" Text="Update" CssClass="btn btn-primary btn-block" OnClick="ProfileUpdateBtn_Click" />
        <a href="applications.aspx" class="btn btn-warning btn-block">Applications</a>
    </div>
    </form>
</body>
</html>
