using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_member_photoGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var context = new rheaxuEntities())
        {
            memberRepeater.DataSource = context.AuthUsers.ToList();
            memberRepeater.DataBind();

            var mpObjList = context.memberPhotos.OrderByDescending(p => p.likes).ToList();
            popular_repeater.DataSource = mpObjList;
            popular_repeater.DataBind();
        }
    }
}