using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_member_photoDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            int imgId = Convert.ToInt32(Request["imgId"]);
            memberPhoto mPhotoObj = context.memberPhotos.SingleOrDefault(mPhoto => mPhoto.Id == imgId);

            List<memberPhoto> mPhotoObjList = new List<memberPhoto>();
            mPhotoObjList.Add(mPhotoObj);

            detailimgRepeater.DataSource = mPhotoObjList;
            detailimgRepeater.DataBind();
            var likes = (from s in context.userLikeImgs where s.photoId == imgId select s).Count();
            likeCountLabel.Text = "Likes: " + likes.ToString();

            List<photoComment> pCmntObjList = (from s in context.photoComments where s.pId == imgId orderby s.createTime descending select s).ToList();
            CmntCountLabel.Text = pCmntObjList.Count() + " comments for this photo";
            cmntRepeater.DataSource = pCmntObjList;
            cmntRepeater.DataBind();

            var likeUsersList = (from s in context.userLikeImgs where s.photoId == imgId select s).ToList();
            likeUserRepeater.DataSource = likeUsersList;
            likeUserRepeater.DataBind();
        }
        
    }

    protected void likeBtn_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string likeTxt = likeBtn.Text;
            int imgId = Convert.ToInt32(Request["imgId"]);
            if (likeTxt == "Like")
            {
                userLikeImg uli = new userLikeImg { photoId = imgId, username = User.Identity.Name };
                context.userLikeImgs.Add(uli);
                memberPhoto mpObj = (from p in context.memberPhotos where p.Id == imgId select p).FirstOrDefault();
                mpObj.likes += 1;
                context.SaveChanges();
                likeBtn.CssClass = "orange btn-sm";
                likeBtn.Text = "Unlike";
            }
            else
            {
                string visitorname = User.Identity.Name;
                //userLikeImg uli = context.userLikeImgs.SingleOrDefault(visitor => visitor.username == visitorname);
                var uli = (from s in context.userLikeImgs where s.username == visitorname && s.photoId == imgId select s).FirstOrDefault();
                context.userLikeImgs.Remove(uli);
                memberPhoto mpObj = (from p in context.memberPhotos where p.Id == imgId select p).FirstOrDefault();
                mpObj.likes -= 1;
                context.SaveChanges();
                likeBtn.CssClass = "blue btn-sm";
                likeBtn.Text = "Like";
            }

            var likes = (from s in context.userLikeImgs where s.photoId == imgId select s).Count();
            likeCountLabel.Text = "Likes: " + likes.ToString();
        }
    }

    protected void likeBtn_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string visitorname = User.Identity.Name;
            int imgId = Convert.ToInt32(Request["imgId"]);
            var uli = (from s in context.userLikeImgs where s.username == visitorname && s.photoId == imgId select s).FirstOrDefault();
            likeBtn.Visible = true;
            
            if (uli == null)
            {
                likeBtn.CssClass = "blue btn-sm";
                likeBtn.Text = "Like";
            }
            else
            {
                likeBtn.CssClass = "orange btn-sm";
                likeBtn.Text = "Unlike";
            }
            
        }
    }
    protected void AddCmntBtn_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string cmntUsername = User.Identity.Name;
            DateTime cmntCreateTime = DateTime.Now;
            int cmntPId = Convert.ToInt32(Request["imgId"]);
            string cmnt = CmntTextArea.Text;
            photoComment pcmnt = new photoComment { pId = cmntPId, username = cmntUsername, createTime = cmntCreateTime, comment = cmnt };
            context.photoComments.Add(pcmnt);
            context.SaveChanges();
        }
        Response.Redirect(Request.RawUrl);
    }

    protected void addToGallery_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        { 
            int imgId = Convert.ToInt32(Request["imgId"]);
            memberPhoto pObj = (from s in context.memberPhotos where s.Id == imgId select s).FirstOrDefault();
            string imgUrl = pObj.imgurl;
            Response.Redirect("postPhoto.aspx?toAddImgUrl=" + imgUrl);

        }
    }
}