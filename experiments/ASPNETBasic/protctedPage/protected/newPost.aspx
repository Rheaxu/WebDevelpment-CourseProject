<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newPost.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_simple_login_protected_newPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Post</title>
    <link href="../../../../css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>New Post</h1>
        <asp:TextBox ID="titleTxtBx" CssClass="form-control" runat="server"/>
        <asp:TextBox ID="contentTxtBx" runat="server" TextMode="MultiLine" CssClass="form-control"/>
        <asp:Button ID="newPostBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Create New Post" OnClick="newPostBtn_Click"/>
        <a href="profile.aspx?profileOwner=<%=Request["profileOwner"] %>" class="btn btn-danger btn-block">Cancel</a>
    </div>
    </form>
</body>
</html>
