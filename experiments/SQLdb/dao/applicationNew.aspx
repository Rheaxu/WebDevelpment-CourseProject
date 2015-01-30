<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicationNew.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_dao_applicationNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>New Application</h1>
        <asp:TextBox ID="NewAppName" runat="server" CssClass="form-control" placeholder="Name"/>
        <asp:TextBox ID="NewAppUrl" runat="server" CssClass="form-control" placeholder="Url"/>
        <asp:TextBox ID="NewAppGenre" runat="server" CssClass="form-control" placeholder="Genre"/>
        <asp:HiddenField ID="NewAppDeveloperUsername" runat="server"/>
        <asp:Button ID="NewAppAddBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Add"/>
    </div>
    </form>
</body>
</html>
