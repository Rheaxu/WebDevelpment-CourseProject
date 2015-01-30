using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_member_mySheetMusicGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            string owner = Request["ownername"];
            if(owner == "" || owner == null)
            {
                owner = User.Identity.Name;
            }
            var msmObjList = (from s in context.memberSheetMusics where s.ownername == owner orderby s.likes descending select s).ToList();
            //var msmObjList = context.memberSheetMusics.OrderByDescending(p => p.likes).ToList();
            mySheetMusicRepeater.DataSource = msmObjList;
            mySheetMusicRepeater.DataBind();

        }
    }
}