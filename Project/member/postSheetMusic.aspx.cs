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
        if (Request.QueryString["custom_url"] != null)
        {
            UrlTxt.Text = Request.QueryString["custom_url"];
        }
    }
    protected void PostBtn_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            memberSheetMusic msm = new memberSheetMusic { smurl = UrlTxt.Text,smTitle=TitleTxt.Text,smDesc=DescriptionArea.Text,ownername=User.Identity.Name, createTime=System.DateTime.Now,likes=0};
            context.memberSheetMusics.Add(msm);
            context.SaveChanges();

            int nPId = msm.Id;
            UploadStatusLabel.Text = "Successfully added photot '" + msm.smTitle + "' to your collection";
            Response.Redirect("sheetMusicDetail.aspx?ownername=" + User.Identity.Name + "&smId=" + nPId);

        }
        //PhotoDAO dao = new PhotoDAO();
        //Photo photo = new Photo(UrlTxt.Text, User.Identity.Name, TitleTxt.Text, DescriptionArea.Text,0);
        //string uid = Page.User.Identity.Name;
        
        //int nPId = dao.insertPhotoInfo(photo);
        //UploadStatusLabel.Text = "Successfully added sheet music '" + photo.imgTitle+"' to your collectionn";
        //Response.Redirect("sheetMusicDetail.aspx?ownername=" + User.Identity.Name+"smId="+nPId);

    }

}