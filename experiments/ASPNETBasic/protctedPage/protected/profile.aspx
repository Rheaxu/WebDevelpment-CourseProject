<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_simple_login_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="pull-right">
            <a href="../home.aspx">Home</a> | 
            Profile | 
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </div>
        <h1>Profile</h1>
        <a href="newPost.aspx?authorUsername=<%=User.Identity.Name %>&profileOwner=<%=Request["profileOwner"] %>">Post New Article</a>
        <p>
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="articleOwnerUsername" HeaderText="articleOwnerUsername" SortExpression="articleOwnerUsername" />
                    <asp:BoundField DataField="articleAuthorUsername" HeaderText="articleAuthorUsername" SortExpression="articleAuthorUsername" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:rheaxuCS %>" 
                DeleteCommand="DELETE FROM [Articles] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Articles] ([title], [content], [date], [articleOwnerUsername], [articleAuthorUsername]) VALUES (@title, @content, @date, @articleOwnerUsername, @articleAuthorUsername)" 
                ProviderName="<%$ ConnectionStrings:rheaxuConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [Id], [title], [content], [date], [articleOwnerUsername], [articleAuthorUsername] FROM [Articles] WHERE articleOwnerUsername=@username" 
                UpdateCommand="UPDATE [Articles] SET [title] = @title, [content] = @content, [date] = @date, [articleOwnerUsername] = @articleOwnerUsername, [articleAuthorUsername] = @articleAuthorUsername WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="username" Type="String" QueryStringField="profileOwner"/>
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="articleOwnerUsername" Type="String" />
                    <asp:Parameter Name="articleAuthorUsername" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="articleOwnerUsername" Type="String" />
                    <asp:Parameter Name="articleAuthorUsername" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    </form>
</body>
</html>
