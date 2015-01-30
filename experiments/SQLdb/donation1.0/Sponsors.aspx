<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sponsors.aspx.cs" Inherits="Experiments_SQLdb_Sponsors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Sponsors</h1>
        <p class="table">

            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

        </p>
    <p>

        
        <asp:GridView 
            CssClass="table"
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="Id" 
            DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs5610 %>" 
            SelectCommand="SELECT * FROM [Sponsor]" 
            DeleteCommand="DELETE FROM [Sponsor] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Sponsor] ([firstName], [lastName], [email], [username], [password]) VALUES (@firstName, @lastName, @email, @username, @password)" 
            UpdateCommand="UPDATE [Sponsor] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [username] = @username, [password] = @password WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>

        </asp:SqlDataSource>

    </p>
    </div>
    </form>
</body>
</html>
