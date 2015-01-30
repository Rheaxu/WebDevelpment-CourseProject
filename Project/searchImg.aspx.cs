using System;
using edu.neu.ccis.rasala;
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
        dlSearch1.DataSource = dt;
        dlSearch1.DataBind();
    }

    protected void btnSearchSM_Click(object sender, EventArgs e)
    {
        string searchBasicURL = "http://api.musescore.com/services/rest/score.xml?oauth_consumer_key=fRWBMQeNaqrBfnckEjfbkH4634jtidSy&text=";
        string searchTxt = TextBox1.Text;
        string searchURL = searchBasicURL + searchTxt;

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("custom_url", typeof(string)));
        dt.Columns.Add(new DataColumn("title", typeof(string)));
        string data = SimpleProxy.GetResponseContent(searchURL);
        StringReader sReader = new StringReader(data);
        XmlReader reader = XmlReader.Create(sReader);
        bool read_customurl = true;
        bool read_title = true;
        DataRow dr = dt.NewRow();
        while(reader.Read())
        {
            if (!reader.IsStartElement() && reader.Name.ToString() == "score") {
                dt.Rows.Add(dr);
                read_customurl = true;
                read_title = true;
                dr = dt.NewRow();
                continue;
            }
            if (reader.IsStartElement())
            {
                string eleName = reader.Name.ToString();
                if (eleName == "custom_url" && read_customurl)
                {
                    string curl = reader.ReadString();
                    read_customurl = false;
                    dr["custom_url"] = curl;
                }
                if (eleName == "title" && read_title)
                {
                    string title = reader.ReadString();
                    read_title = false;
                    dr["title"] = title;
                }
            }
        } 
        dlSearch2.DataSource = dt;
        dlSearch2.DataBind();
    }
    
    protected void addToGallery_Click_img(object sender, EventArgs e)
    {
        //Response.Redirect("member/postPhoto.aspx?toAddImgUrl="+dlSearch.d);
    }

    protected void addToGallery_Click_music(object sender, EventArgs e)
    { 
        //
    }
    protected void dlSearch2_DataBinding(object sender, EventArgs e)
    {
        smdiv.Style.Clear();
    }
    protected void dlSearch1_DataBinding(object sender, EventArgs e)
    {
        imgdiv.Style.Clear();
    }

}