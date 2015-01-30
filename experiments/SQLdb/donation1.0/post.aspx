<%@ Page Language="C#" AutoEventWireup="true" CodeFile="post.aspx.cs" Inherits="Experiments_experimentfiles_SQLdb_post" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="../../../css/jquery-ui.css" rel="stylesheet"/>
    <script src="../../../../javascript/jquery-1.11.1.js"></script>
    <script src="../../../../javascript/jquery-ui.js"></script>
    <script>
        $(function () {
            $(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <h1>New Post</h1>
            <p>

                <asp:DetailsView OnItemInserted="DetailsView1_ItemInserted" CssClass="table" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="50px" Width="125px" DefaultMode="Insert">
                    <Fields>
                        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                        <asp:TemplateField HeaderText="content" SortExpression="content">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox TextMode="MultiLine" ID="TextBox1" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("content") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" ControlStyle-CssClass="datepicker" HeaderText="date" SortExpression="date" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>

                <asp:SqlDataSource 
                    ID="SqlDataSource1" 
                    runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cs5610 %>" 
                    DeleteCommand="DELETE FROM [Post] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Post] ([title], [content], [date], [ownerUsername], [authorUsername]) VALUES (@title, @content, @date, @ownerUsername, @authorUsername)" 
                    ProviderName="<%$ ConnectionStrings:cs5610.ProviderName %>" 
                    SelectCommand="SELECT [Id], [title], [content], [date], [ownerUsername], [authorUsername] FROM [Post]" 
                    UpdateCommand="UPDATE [Post] SET [title] = @title, [content] = @content, [date] = @date, [ownerUsername] = @ownerUsername, [authorUsername] = @authorUsername WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="content" Type="String" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:QueryStringParameter Name="ownerUsername" Type="String" QueryStringField="ownerUsername"/>
                        <asp:SessionParameter Name="authorUsername" Type="String" SessionField="loggedInUsername" />
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
