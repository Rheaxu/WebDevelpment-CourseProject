<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Project_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="css/login.css" rel="stylesheet"/>
    <link href="css/jquery-ui.css" rel="stylesheet"/>
    <link href="css/styleproj.css" rel="stylesheet"/>
    <script src="js/jquery-ui.js"></script>
    <style>
        form {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
            width:100%;
        }
    </style> 
</head>
<body>
    <form id="registerForm" method="post" role="search" runat="server">

    <div class="container">
        <asp:HyperLink ID="HyperLink1" CssClass="btn badge" NavigateUrl="home.aspx" class="button" runat="server">
            Go back to Home Page
        </asp:HyperLink>
        <div style="text-align:center">
        <h1 class="profileUsername">
            Register
        </h1>
        <span class="profileUsername">As a member, you can create your own sheet music collection and photo gallery</span>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" ContinueDestinationPageUrl="home.aspx?createFolder=true">
                <CreateUserButtonStyle CssClass="btn btn-info text-center" />
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" >
                        <ContentTemplate>
                            <asp:Label CssClass="profileUsername" ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name: *</asp:Label><br />
                            <asp:TextBox CssClass="form-control" ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label CssClass="profileUsername" ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password: *</asp:Label><br />
                            <asp:TextBox CssClass="form-control" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label CssClass="profileUsername" ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password: *</asp:Label><br />
                            <asp:TextBox CssClass="form-control" ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            <br />
                            <asp:Label CssClass="profileUsername" ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail: *</asp:Label><br />
                            <asp:TextBox CssClass="form-control" ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label CssClass="profileUsername" ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question: *</asp:Label><br />
                            <asp:TextBox CssClass="form-control" ID="Question" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label CssClass="profileUsername" ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer: *</asp:Label><br />
                            <asp:TextBox CssClass="form-control" ID="Answer" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            <br />
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep runat="server" />
                </WizardSteps>
            </asp:CreateUserWizard>
            <br /><br /><br />
        </div>
    </div>
    </form>
</body>
</html>
