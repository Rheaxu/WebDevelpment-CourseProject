<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wall.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_Wall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Wall</h1>
        <a href="post.aspx?ownerUsername=<%=Request["ownerUsername"] %>" class="btn btn-primary btn-block">Post to this wall</a>
        <p>
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="ownerUsername" HeaderText="ownerUsername" SortExpression="ownerUsername" />
                    <asp:BoundField DataField="authorUsername" HeaderText="authorUsername" SortExpression="authorUsername" />
                    <asp:HyperLinkField DataNavigateUrlFields="authorUsername" DataNavigateUrlFormatString="profile.aspx?username={0}" DataTextField="authorUsername" DataTextFormatString="{0}" HeaderText="Authors" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:cs5610 %>" 
                DeleteCommand="DELETE FROM [Post] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Post] ([Id], [title], [content], [date], [ownerUsername], [authorUsername]) VALUES (@Id, @title, @content, @date, @ownerUsername, @authorUsername)" 
                ProviderName="<%$ ConnectionStrings:cs5610.ProviderName %>" 
                SelectCommand="SELECT [Id], [title], [content], [date], [ownerUsername], [authorUsername] FROM [Post] WHERE ownerUsername=@owner and authorUsername is not NULL" 
                UpdateCommand="UPDATE [Post] SET [title] = @title, [content] = @content, [date] = @date, [ownerUsername] = @ownerUsername, [authorUsername] = @authorUsername WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="owner" Type="String" QueryStringField="ownerUsername"/>
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="ownerUsername" Type="String" />
                    <asp:Parameter Name="authorUsername" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="ownerUsername" Type="String" />
                    <asp:Parameter Name="authorUsername" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </p>
    </div>
    </form>
</body>
</html>
