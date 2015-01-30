using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using Google.API.Search;
using System.Data;
using System.Xml;

public partial class Project_searchImg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dlSearch.DataSource = null;
            dlSearch.DataBind();
            TextBox1.Text = "";
        }
        string searchTxt = Request["searchTxt"];
        if (searchTxt != null && searchTxt != "")
        {
            TextBox1.Text = searchTxt;
        }
    }

    protected void btnSearchPhoto_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("Title", typeof(string)));  
        dt.Columns.Add(new DataColumn("OriginalContextUrl", typeof(string)));
        dt.Columns.Add(new DataColumn("Width",typeof(int)));
        dt.Columns.Add(new DataColumn("Height",typeof(int)));
        dt.Columns.Add(new DataColumn("Url", typeof(string)));
        GimageSearchClient client = new GimageSearchClient("www.c-sharpcorner.com");
        IList<IImageResult> results = client.Search(TextBox1.Text, 30);
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
    }

    protected void btnSearchSM_Click(object sender, EventArgs e)
    {
        string searchBasicURL = "http://api.musescore.com/services/rest/score?oauth_consumer_key=fRWBMQeNaqrBfnckEjfbkH4634jtidSy&text=";
        string searchTxt = TextBox1.Text;
        string searchURL = searchBasicURL + searchTxt;

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("MSuid", typeof(Int32)));
        dt.Columns.Add(new DataColumn("MSsid", typeof(Int32)));
        dt.Columns.Add(new DataColumn("MSurl", typeof(string)));
        dt.Columns.Add(new DataColumn("Title", typeof(string)));

        var request = (HttpWebRequest)WebRequest.Create(searchURL);
        var response = (HttpWebResponse)request.GetResponse();
        
        var receiveStream = response.GetResponseStream();
        //var mySourceDoc = new XmlDocument();
        //mySourceDoc.Load(receiveStream);
        receiveStream.Close();

        
        XmlReader reader = XmlReader.Create(receiveStream);
        reader.MoveToContent();
        while(reader.Read())
        {
            if (reader.IsStartElement())
            {
                DataRow dr = dt.NewRow();
                switch (reader.Name.ToString())
                { 
                    case "id":
                        int MSsid = Convert.ToInt32(reader.ReadString());
                        dr["MSsid"] = MSsid;
                        Console.WriteLine("MSsid " + MSsid);
                        break;
                    case "uri":
                        string MSurl = reader.ReadString();
                        dr["MSurl"] = MSurl;
                        Console.WriteLine("MSurl " + MSurl);
                        break;
                    case "uid":
                        int MSuid = Convert.ToInt32(reader.ReadString());
                        dr["MSuid"] = MSuid;
                        Console.WriteLine("MSuid " + MSuid);
                        break;
                    case "title":
                        string title = reader.ToString();
                        dr["Title"] = title;
                        Console.WriteLine("title " + title);
                        break;
                }
                dt.Rows.Add(dr);
            }
        }
        dlSearch.DataSource = dt;
        dlSearch.DataBind();
    }
    
    protected void addToGallery_Click(object sender, EventArgs e)
    {
        //Response.Redirect("member/postPhoto.aspx?toAddImgUrl="+dlSearch.d);
    }
    protected void loginToAdd_Click(object sender, EventArgs e)
    {
        string searchTxt = TextBox1.Text;
        Response.Redirect("login.aspx?searchTxt=" + searchTxt);
    }
}