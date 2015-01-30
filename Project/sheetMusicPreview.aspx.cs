using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_sheetMusicGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        smtitle.Text = Request["title"];
    }
    protected void addToCollectionn_Click(object sender, EventArgs e)
    {
        Response.Redirect("member/postSheetMusic.aspx?custom_url=" + Request["custom_url"]);
    }
    protected void loginToAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}