using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for PhotoDAO
/// </summary>
public class PhotoDAO
{
    protected static readonly string connectionString = ConfigurationManager.ConnectionStrings["rheaxuCS"].ToString();

	public PhotoDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<Photo> findPhotosByOwnername(string ownername)
    {
        List<Photo> photoList = new List<Photo>();

        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string sqlStr = "SELECT * FROM photos WHERE ownername=@Ownername";
        SqlCommand cmd = new SqlCommand(sqlStr, conn);
        SqlParameter OwnernameParam = new SqlParameter("@Ownername", ownername);
        cmd.Parameters.Add(OwnernameParam);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            string imgUrl = reader["imgUrl"].ToString();
            string imgTitle = reader["imgTitle"].ToString();
            string imgDesc = reader["desc"].ToString();
            int likes = Convert.ToInt32(reader["likes"]);
            photoList.Add(new Photo(imgUrl, ownername, imgTitle, imgDesc,likes));
        }
        conn.Close();
        return photoList;
    }

    public int insertPhotoInfo(Photo photo)
    {
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string sqlStr = "INSERT INTO memberPhotos (imgUrl,ownername,imgTitle,imgDesc,likes) VALUES (@imgUrl,@ownername,@imgTitle,@imgDesc,@likes)";
        SqlCommand cmd = new SqlCommand(sqlStr, conn);
        SqlParameter urlParam = new SqlParameter("@imgUrl", photo.imgUrl);
        SqlParameter ownernameParam = new SqlParameter("@ownername", photo.ownername);
        SqlParameter titleParam = new SqlParameter("@imgTitle", photo.imgTitle);
        SqlParameter descParam = new SqlParameter("@imgDesc", photo.imgDesc);
        SqlParameter likesParam = new SqlParameter("@likes", photo.likes);
        cmd.Parameters.Add(urlParam);
        cmd.Parameters.Add(ownernameParam);
        cmd.Parameters.Add(titleParam);
        cmd.Parameters.Add(descParam);
        cmd.Parameters.Add(likesParam);
        int lastInsetedId = (int)cmd.ExecuteScalar();
        conn.Close();

        return lastInsetedId;
    }
}