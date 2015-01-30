<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchImg.aspx.cs" Inherits="Project_searchImg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Img</title>
    <meta charset="UTF-8" />
    <link href='http://fonts.googleapis.com/css?family=Ceviche+One' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
    <link href="../../css/experimentcss.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <h1>Experiment: Google Search Image API</h1>
        <p>This experiment is related to my project. It uses the google image
            search API.
            <br />
            We need to import the google api
        </p>
        <pre class="snippet">
using Google.API.Search;
        </pre>
        <p>
            In the behinde code, we need to generate a table to store the search result
        </p>
        <pre class="snippet">
DataSet ds = new DataSet();
DataTable dt = new DataTable();
dt.Columns.Add(new DataColumn("Title", typeof(string)));  
dt.Columns.Add(new DataColumn("OriginalContextUrl", typeof(string)));
dt.Columns.Add(new DataColumn("Width",typeof(int)));
dt.Columns.Add(new DataColumn("Height",typeof(int)));
dt.Columns.Add(new DataColumn("Url", typeof(string)));
        </pre>
        <p>The method for search is:</p>
        <pre class="snippet">
GimageSearchClient client = new GimageSearchClient("www.c-sharpcorner.com");
IList&lt;IImageResult> results = client.Search(TextBox1.Text, 30);
        </pre>
        <p>
            Store the search result to the data base
        </p>
        <pre class="snippet">
foreach (IImageResult result in results)
{
    DataRow dr = dt.NewRow();
    dr["Title"] = result.Title.ToString();
    dr["OriginalContextUrl"] = result.OriginalContextUrl;
    dr["Width"] = Convert.ToInt32(result.Width);
    dr["Height"] = Convert.ToInt32(result.Height); 
    dr["Url"] = result.Url;
    dt.Rows.Add(dr);
} 
dlSearch.DataSource = dt;
dlSearch.DataBind();
        </pre>
        <p><b>Now type the content you want to search and click the "Search Image" Button</b></p>
        <hr />
        <div>

        </div>
        <div class="container search-box">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Search Image" Width="300px"></asp:TextBox>
            <asp:Button ID="btnSearchPhoto" CssClass="blue" runat="server" Text="Search Image" OnClick="btnSearchPhoto_Click" />
            <br />
        </div>
        <br />
        <div class="container viewer rg-image-wrapper pre-scrollable">
            <asp:Repeater ID="dlSearch" runat="server">     
              <ItemTemplate>
                  <table class="table">
                      <tr>
                          <td><asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%#Eval("Url") %>'><img class="center-block" src='<%#Eval("Url") %>' width="200" height="100"/></asp:HyperLink></td>
                          <td >
                              <asp:LinkButton ID="titleLink" runat="server" Text='<%# Eval("title") %>'></asp:LinkButton>
                              <br />
                          </td>
                      </tr>
                  </table>            
                <br />
            </ItemTemplate> 
            <FooterTemplate>
                <asp:Label Visible='<%#bool.Parse((dlSearch.Items.Count==0).ToString())%>' runat="server"
                    ID="lblNoRecord" Text="No Record Found!"></asp:Label>
            </FooterTemplate>
            </asp:Repeater>
        </div>
        <hr />
        <h2>Source</h2>
        <a href="../../../fileview/Default.aspx?~/experiments/Search_API/GoogleSearchImg/searchImg.aspx" target="_blank">HTML</a>
        <br />
        <a href="../../../fileview/Default.aspx?~/experiments/Search_API/GoogleSearchImg/searchImg.aspx.cs" target="_blank">Behinde Code</a>
        <h3>Reference</h3>
        <a href="http://www.c-sharpcorner.com/UploadFile/29d7e0/google-image-search-in-asp-net/" target="_blank">Google Image Search In ASP.NET</a>
        <br />  

    </form>
</body>
</html>
