using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_member_postPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["toAddImgUrl"] != null)
        {
            UrlTxt.Text = Request.QueryString["toAddImgUrl"];
        }
    }
    protected void PostBtn_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            memberPhoto mp = new memberPhoto { imgurl = UrlTxt.Text, imgTitle = TitleTxt.Text, imgDesc = DescriptionArea.Text, ownername = User.Identity.Name, createTime = System.DateTime.Now, likes = 0 };
            context.memberPhotos.Add(mp);
            context.SaveChanges();

            int nPId = mp.Id;
            UploadStatusLabel.Text = "Successfully added photot '" + mp.imgTitle + "' to your collection";
            Response.Redirect("photoDetail.aspx?ownername=" + User.Identity.Name + "&imgId=" + nPId);

        }
    }

    private bool isAllowedExtension(string extension)
    {
        if (extension==".jpg" || extension==".bmp" || extension==".gif" || extension==".png")
        {
            return true;
        }
        
        return false;
    }
}