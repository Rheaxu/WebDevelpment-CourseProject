using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_member_sheetMusicDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            int smId = Convert.ToInt32(Request["smId"]);
            memberSheetMusic msmObj = context.memberSheetMusics.SingleOrDefault(mSM => mSM.Id == smId);

            List<memberSheetMusic> msmObjList = new List<memberSheetMusic>();
            msmObjList.Add(msmObj);

            detailsmRepeater.DataSource = msmObjList;
            detailsmRepeater.DataBind();
            var likes = (from s in context.userLikeSms where s.smId == smId select s).Count();
            likeCountLabel.Text = "Likes: " + likes.ToString();

            List<sheetMusicComment> pCmntObjList = (from s in context.sheetMusicComments where s.smId == smId orderby s.createTime descending select s).ToList();
            CmntCountLabel.Text = pCmntObjList.Count() + " comments for this sheet music";
            cmntRepeater.DataSource = pCmntObjList;
            cmntRepeater.DataBind();

            var likeUsersList = (from s in context.userLikeSms where s.smId ==smId select s).ToList();
            likeUserRepeater.DataSource = likeUsersList;
            likeUserRepeater.DataBind();
        }
    }

    protected void likeBtn_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string likeTxt = likeBtn.Text;
            int smId = Convert.ToInt32(Request["smId"]);
            if (likeTxt == "Like")
            {
                userLikeSm uli = new userLikeSm { smId = smId, username = User.Identity.Name };
                context.userLikeSms.Add(uli);
                memberSheetMusic msmObj = (from p in context.memberSheetMusics where p.Id == smId select p).FirstOrDefault();
                msmObj.likes += 1;
                context.SaveChanges();
                likeBtn.CssClass = "orange btn-sm";
                likeBtn.Text = "Unlike";
            }
            else
            {
                string visitorname = User.Identity.Name;
                //userLikeImg uli = context.userLikeImgs.SingleOrDefault(visitor => visitor.username == visitorname);
                var uli = (from s in context.userLikeSms where s.username == visitorname && s.smId == smId select s).FirstOrDefault();
                context.userLikeSms.Remove(uli);
                memberSheetMusic msmObj = (from p in context.memberSheetMusics where p.Id == smId select p).FirstOrDefault();
                msmObj.likes -= 1;
                context.SaveChanges();
                likeBtn.CssClass = "blue btn-sm";
                likeBtn.Text = "Like";
            }

            var likes = (from s in context.userLikeSms where s.smId == smId select s).Count();
            likeCountLabel.Text = "Likes: " + likes.ToString();
        }
    }

    protected void likeBtn_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string visitorname = User.Identity.Name;
            int smId = Convert.ToInt32(Request["smId"]);
            var uli = (from s in context.userLikeSms where s.username == visitorname && s.smId == smId select s).FirstOrDefault();
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
            int cmntPId = Convert.ToInt32(Request["smId"]);
            string cmnt = CmntTextArea.Text;
            sheetMusicComment pcmnt = new sheetMusicComment { smId = cmntPId, username = cmntUsername, createTime = cmntCreateTime, comment = cmnt };
            context.sheetMusicComments.Add(pcmnt);
            context.SaveChanges();
        }
        Response.Redirect(Request.RawUrl);
    }
    protected void addToGallery_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        { 
            int smId = Convert.ToInt32(Request["smId"]);
            memberSheetMusic msmObj = (from s in context.memberSheetMusics where s.Id == smId select s).FirstOrDefault();
            string custom_url = msmObj.smurl;
            Response.Redirect("postSheetMusic.aspx?custom_url=" + custom_url);
        }
    }
}