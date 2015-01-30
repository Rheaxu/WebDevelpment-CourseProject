<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link href="../../../../bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <h1>Profile</h1>
        <h2><%=Request["username"] %></h2>
        <a href="Wall.aspx?ownerUsername=<%=Request["username"] %>" class="btn btn-primary">Wall</a>
        <a href="search.aspx?ownerUsername=<%=Request["username"] %>" class="btn btn-success btn-block">Search</a>
        <p>
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                    <asp:CheckBoxField DataField="sponsor" HeaderText="sponsor" SortExpression="sponsor" />
                    <asp:CheckBoxField DataField="sponsored" HeaderText="sponsored" SortExpression="sponsored" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:cs5610 %>" 
                DeleteCommand="DELETE FROM [User] WHERE [username] = @username" 
                InsertCommand="INSERT INTO [User] ([username], [password], [email], [firstName], [lastName], [dob], [sponsor], [sponsored]) VALUES (@username, @password, @email, @firstName, @lastName, @dob, @sponsor, @sponsored)" ProviderName="<%$ ConnectionStrings:cs5610.ProviderName %>" 
                SelectCommand="SELECT [username], [password], [email], [firstName], [lastName], [dob], [sponsor], [sponsored] FROM [User] WHERE username=@username" 
                UpdateCommand="UPDATE [User] SET [password] = @password, [email] = @email, [firstName] = @firstName, [lastName] = @lastName, [dob] = @dob, [sponsor] = @sponsor, [sponsored] = @sponsored WHERE [username] = @username">
                <SelectParameters>
                    <asp:QueryStringParameter Name="username" Type="String" QueryStringField="username" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="dob" Type="DateTime" />
                    <asp:Parameter Name="sponsor" Type="Boolean" />
                    <asp:Parameter Name="sponsored" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="dob" Type="DateTime" />
                    <asp:Parameter Name="sponsor" Type="Boolean" />
                    <asp:Parameter Name="sponsored" Type="Boolean" />
                    <asp:Parameter Name="username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </p>
    </div>
    </form>
</body>
</html>
