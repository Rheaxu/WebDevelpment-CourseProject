<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Project_login" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.Configuration" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/>
    <!--link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/-->
    <link href="css/login.css" rel="stylesheet"/>
    <link href="css/styleproj.css" rel="stylesheet"/>
    <style>
        body {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>    
</head>
<body>
    <form id="loginForm" method="post" class="navbar-form navbar-right" role="search" runat="server">
        <div class="container">
        <asp:HyperLink ID="HyperLink1" CssClass="btn badge" NavigateUrl="home.aspx" class="button" runat="server">
            Go back to Home Page
        </asp:HyperLink>

        <div style="text-align:center">
        <br />
        <img src="http://www.aaanimations.com/penandink/welcomeoptimizedblack0dp.gif"/>
        <br /><br />
            <div style="text-align:center">
                <asp:Login
                    ID="Login1"
                    runat="server"
                    OnLoggingIn="Login1_LoggingIn1"
                    LoginButtonText="Login"
                    TitleText="Login"
                    UsernameRequiredErrorMessage="Username is required"
                    PasswordRequiredErrorMessage="Password is required"
                    DestinationPageUrl="~/Project/home.aspx"
                    DisplayRememberMe="False" TextLayout="TextOnTop">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LayoutTemplate>
                        <h1>Login</h1>
                        <asp:Label ID="UserNameLabel" CssClass="profileUsername" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Username is required" ToolTip="Username is required" ValidationGroup="Login1">*</asp:RequiredFieldValidator><br />
                        <asp:Label ID="PasswordLabel" CssClass="profileUsername" runat="server" AssociatedControlID="Password">Password:&nbsp;&nbsp;</asp:Label>
                        <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required" ToolTip="Password is required" ValidationGroup="Login1">*</asp:RequiredFieldValidator><br />
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal><br />
                        <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" Text="Login" ValidationGroup="Login1" />
                    </LayoutTemplate>
                    <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:Login>
            </div>
        <br />
        </div>
    </div>
    </form>

</body>
</html>
