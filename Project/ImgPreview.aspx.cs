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
        smsize.Text = "Size: "+Request["width"]+" x "+Request["height"];
    }
    protected void addToGallery_Click(object sender, EventArgs e)
    {
        Response.Redirect("member/postPhoto.aspx?toAddImgUrl="+Request["imgUrl"]);
    }

    protected void loginToAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}