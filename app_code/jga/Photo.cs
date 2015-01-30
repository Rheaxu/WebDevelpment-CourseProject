using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Photo
/// </summary>
public class Photo
{

    public string imgUrl { set; get; }
    public string ownername { set; get; }
    public string imgTitle { set; get; }
    public string imgDesc { set; get; }
    public int likes { set; get; }
	public Photo(string imgUrl,string ownername,string imgTitle,string imgDesc,int likes)
	{
        this.imgUrl = imgUrl;
        this.ownername = ownername;
        this.imgTitle = imgTitle;
        this.imgDesc = imgDesc;
        this.likes = likes;
	}

    public Photo() { }
}