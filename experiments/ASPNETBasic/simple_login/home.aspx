<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_simple_login_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="pull-right">
            <a href="protected/profile.aspx?profileOwner=<%=User.Identity.Name %>">Profile</a> | 
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </div>
        <h1>Home</h1>
    </div>
    </form>
</body>
</html>
