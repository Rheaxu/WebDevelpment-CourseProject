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
        using (var context = new rheaxuEntities())
        {
            var msmObjList = context.memberSheetMusics.OrderByDescending(p => p.likes).ToList();
            popularSMRepeater.DataSource = msmObjList;
            popularSMRepeater.DataBind();

            memberRepeater.DataSource = context.AuthUsers.ToList();
            memberRepeater.DataBind();
        }
        
    }
    protected void addToCollection_Click(object sender, EventArgs e)
    {
        Response.Redirect("member/postPhoto.aspx?toAddImgUrl=" + Request["imgUrl"]);
    }

}