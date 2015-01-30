using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_profile : System.Web.UI.Page
{
    AppUserDAO dao = new AppUserDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        { 
            string ownername = Request["ownername"];
            if (ownername == "" || ownername == null)
            {
                ownername = User.Identity.Name;
                
            }
            profileOwnername.Text = ownername + "'s Profile";
            var followers = (from s in context.follows where s.username == ownername select s).ToList();
            int followerCount = followers.Count();
            var followings = (from s in context.follows where s.follower == ownername select s).ToList();
            int followingCount = followings.Count();
            followerCountLabel.Text = followerCount.ToString() + " followers";
            followingCountlabel.Text = followingCount.ToString() + " followings";
            followerRepeater.DataSource = followers;
            followerRepeater.DataBind();
            followingRepeater.DataSource = followings;
            followingRepeater.DataBind();
            List<AuthUser> ownerList = new List<AuthUser>();
            var owner = (from s in context.AuthUsers where s.username == ownername select s).FirstOrDefault();
            ownerList.Add(owner);
            ownerView.DataSource = ownerList;
            ownerView.DataBind();

            var likedSmObjList = (from s in context.userLikeSms join p in context.memberSheetMusics on s.smId equals p.Id where s.username == ownername select new {likeUsername = s.username,likedSMId = s.smId, likedSMTitle = p.smTitle}).ToList();
            var likedPObjList = (from s in context.userLikeImgs join p in context.memberPhotos on s.photoId equals p.Id where s.username == ownername select new {likeUsername = s.username,likedImgId = s.photoId,likedImgTitle = p.imgTitle} ).ToList();
            favSMRepeater.DataSource = likedSmObjList;
            favPRepeater.DataSource = likedPObjList;
            favPRepeater.DataBind();
            favSMRepeater.DataBind();
        }
    }

    protected void followBtn_Click(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string followTxt = followBtn.Text;
            string ownername = Request["ownername"];
            if (followTxt == "Follow")
            {
                follow f = new follow {username = ownername, follower = User.Identity.Name };
                context.follows.Add(f);
                context.SaveChanges();
                followBtn.CssClass = "orange btn-sm";
                followBtn.Text = "Unfollow";
            }
            else
            {
                var f = (from s in context.follows where s.username == ownername && s.follower == User.Identity.Name select s).FirstOrDefault();
                context.follows.Remove(f);
                context.SaveChanges();
                followBtn.CssClass = "blue btn-sm";
                followBtn.Text = "Follow";
            }

            var follows = (from s in context.follows where s.username == ownername select s).Count();
            followerCountLabel.Text = follows.ToString() + " followers";
        }
    }
    protected void followBtn_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string visitorname = User.Identity.Name;
            string ownername = Request["ownername"];
            var f = (from s in context.follows where s.username == ownername && s.follower == visitorname select s).FirstOrDefault();
            followBtn.Visible = true;

            if (f == null)
            {
                followBtn.CssClass = "blue btn-sm";
                followBtn.Text = "Follow";
            }
            else
            {
                followBtn.CssClass = "orange btn-sm";
                followBtn.Text = "Unfollow";
            }
        }
    }
}