<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../bootstrap/css/bootstrap.css" rel="stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">
        <!--The frame will automatically stay on the same page-->
        <!--the method="post" in form tag submits the input value but won't post it in url-->
        <div class="container">
            <h1>Login</h1>
            <asp:TextBox CssClass="form-control" ID="username" runat="server"></asp:TextBox>
            <asp:Button OnClick="submit_Click" CssClass="btn btn-primary btn-block" Text="Login" ID="submit" runat="server"/>
            <!--input name="username" class="form-control"/-->
            <!--The input use the name="username" to generate a name value pair in the url-->
        </div>
    </form>
</body>
</html>
