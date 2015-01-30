using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project_member_myGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        using (var context = new rheaxuEntities())
        {

            string Ownername = Request["ownername"].ToString();
            AuthUser authUserObj = context.AuthUsers.SingleOrDefault(authUser => authUser.username == Ownername);

            carouselRx.DataSource = authUserObj.memberPhotos.ToList();
            carouselRx.DataBind();



        }
    }
}