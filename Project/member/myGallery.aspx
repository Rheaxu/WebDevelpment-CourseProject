<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myGallery.aspx.cs" Inherits="Project_member_myGallery" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member's Photo Gallery</title>
    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/> 
    <meta name="description" content="Responsive Image Gallery with jQuery" />
    <meta name="keywords" content="jquery, carousel, image gallery, slider, responsive, flexible, fluid, resize, css3" />
	<meta name="author" content="Codrops" />
    <link rel="stylesheet" href="../css/style9.css" />
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link rel="stylesheet" href="../css/font-awesome.css" />
    <link href='http://fonts.googleapis.com/css?family=Ceviche+One' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css' />
    <link href="../css/masterpage.css" rel="stylesheet" type="text/css" />
    <link href="../css/css3button.css" rel="stylesheet" type="text/css" />
    <link href="../css/form.css" rel="stylesheet" type="text/css" />    
    <link rel="stylesheet" type="text/css" href="../css/elastisdemo.css" />
    <link rel="stylesheet" type="text/css" href="../css/elastistyle.css" />
	<link rel="stylesheet" type="text/css" href="../css/elastislide.css" />    
    <style>
		.es-carousel ul{
			display:block;
		}
        form,body {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../css/styleproj.css" />
    <script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
			<div class="rg-image-wrapper">
				{{if itemsCount > 1}}
					<div class="rg-image-nav">
						<a href="#" class="rg-image-nav-prev">Previous Image</a>
						<a href="#" class="rg-image-nav-next">Next Image</a>
					</div>
				{{/if}}
				<div class="rg-image"></div>
				<div class="rg-loading"></div>
				<div class="rg-caption-wrapper">
					<div class="rg-caption" style="display:none;">
						<p></p>
					</div>
				</div>
			</div>
		</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="top">
            <div class="nav_header">
            <ul class="ca-menu">
                <li id="hm">
                    <a href="../home.aspx" target="_blank">
                        <span class="ca-icon">
                            <img id="home" src="http://www.clker.com/cliparts/8/9/d/c/11954227511327162950tomas_arad_home.svg.hi.png"/>
                        </span>
                        <div class="ca-content">
                            <h2 class="ca-main">Home</h2>
                            <h3 class="ca-sub">Welcome!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="../sheetMusicGallery.aspx" target="_blank">
                        <span class="ca-icon">
                            <img id="strt" src="../images/mnote2.jpg"/>
                        </span>
                        <div class="ca-content">
                            <h2 class="ca-main">Sheet Music</h2>
                            <h3 class="ca-sub">Explore!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="../photoGallery.aspx" target="_blank">
                        <span class="ca-icon">
                            <img id="cat" src="../images/Crayon_album_lg.png"/>
                        </span>
                        <div class="ca-content">
                            <h2 class="ca-main">Photo</h2>
                            <h3 class="ca-sub">Explore!</h3>
                        </div>
                    </a>
                </li>
                <asp:LoginView runat="server">
                    <LoggedInTemplate>
                        <li>
                            <a href="profile.aspx" target="_blank">
                                <span class="ca-icon">
                                    <img id="tut" src="http://4.bp.blogspot.com/-A_dIFdbdr-U/VCm7FlPC49I/AAAAAAAADic/HY1xvD5XnxY/s1600/yazar%2Bcizer.png"/>
                                </span>
                                <div class="ca-content">
                                    <h2 class="ca-main">My Profile</h2>
                                    <h3 class="ca-sub">Go!</h3>
                                </div>
                            </a>
                        </li>
                    </LoggedInTemplate>
                </asp:LoginView>              
                <li id="searchImg_nav">
                    <a href="../searchImg.aspx" target="_blank">
                        <span class="ca-icon">
                            <img id="abt" src="http://www.rfsafetysolutions.com/Images/search_Sherlock.gif"/>
                        </span>
                        <div class="ca-content">
                            <h2 class="ca-main">Search</h2>
                            <h3 class="ca-sub">Go!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <span class="ca-icon">
                        <img id="log" src="http://www.iconarchive.com/download/i18314/iconshock/cms/gallery.ico"/>
                    </span>
                    <div class="ca-content">                       
                        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect"/>                                                
                        <asp:LoginView ID="LoginView1" runat="server">
                        </asp:LoginView>                                                
                    </div>
                </li>
            </ul>
                </div>
            <!--img id="stave" src="../images/my_pic/mnote2.jpg"/-->
            <div class="label_header pull-right">
                <br />
                <asp:LoginView runat="server" ID="headerLbl_loginview">
                    <AnonymousTemplate>
                        <span class="loginLabl"><a class="profileUsername" href="../login.aspx" target="_blank">Log in</a></span><br />
                        <span class="loginLabl"><a class="profileUsername" href="../register.aspx" target="_blank">Register</a></span>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <span class="loginLabl">Welcome</span><br />
                        <span class="loginLabl"><a class="profileUsername" href='profile.aspx?ownername=<%= User.Identity.Name %>' target="_blank"><%= User.Identity.Name%></a></span>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
        </div>

        <div class="container">
			
			<div class="content">
				<h1 class="profileUsername"><a class="profileUsername" href='profile.aspx?ownername=<%= Request["ownername"] %>' target="_blank"><%=Request["ownername"] %></a>'s Gallery</h1>
				<div id="rg-gallery" class="rg-gallery">
					<div class="rg-thumbs">
						<!-- Elastislide Carousel Thumbnail Viewer -->
						<div class="es-carousel-wrapper">
							<div class="es-nav">
								<span class="es-nav-prev">Previous</span>
								<span class="es-nav-next">Next</span>
							</div>
							<div class="es-carousel">
								<ul>
                                    <asp:Repeater ID="carouselRx" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <a href='<%# Eval("imgUrl") %>'>
                                                    <img src='<%# Eval("imgUrl") %>' data-large='<%# Eval("imgUrl") %>' data-imgid='<%# Eval("Id") %>' alt="image01" data-description='<%# Eval("imgDesc") %>'/>
                                                </a>
                                            </li>
                                        </ItemTemplate>
								    </asp:Repeater>
                                </ul>
							</div>
						</div>
						<!-- End Elastislide Carousel Thumbnail Viewer -->
					</div><!-- rg-thumbs -->
				</div><!-- rg-gallery -->
			</div><!-- content -->
		</div><!-- container -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	    <script type="text/javascript" src="../js/jquery.tmpl.min.js"></script>
	    <script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
	    <script type="text/javascript" src="../js/jquery.elastislide.js"></script>
	    <script type="text/javascript" src="../js/gallery.js"></script>
    </div>
        <br />
        <br />

    </form>
</body>
</html>
