<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Project_home" %>

<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="description" content="Rotating Image Slider with jQuery & CSS3" />
    <meta name="keywords" content="jquery, rotation, slider, images, slideshow, autoplay, play, pause, css3" />
    <link rel="stylesheet" href="css/style9.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/styleproj.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link href='http://fonts.googleapis.com/css?family=Ceviche+One' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.transform-0.9.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.RotateImageMenu.js"></script>
    <title>Online Sheet Music Collection and Photo Gallery</title>     
    <style>
        body {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>
</head>
<body style="height: 100%">
    <form id="form1" runat="server">
        <div id="top">
            <div class="nav_header">
            <ul class="ca-menu">
                <li id="hm">
                    <a href="#">
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
                    <a href="sheetMusicGallery.aspx" target="_blank">
                        <span class="ca-icon">
                            <img id="strt" src="images/mnote2.jpg"/>
                        </span>
                        <div class="ca-content">
                            <h2 class="ca-main">Sheet Music</h2>
                            <h3 class="ca-sub">Explore!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="photoGallery.aspx" target="_blank">
                        <span class="ca-icon">
                            <img id="cat" src="images/Crayon_album_lg.png"/>
                        </span>
                        <div class="ca-content">
                            <h2 class="ca-main">Photo </h2>
                            <h3 class="ca-sub">Explore!</h3>
                        </div>
                    </a>
                </li>
                <asp:LoginView runat="server">
                    <LoggedInTemplate>
                        <li>
                            <a href="member/profile.aspx" target="_blank">
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
                    <a href="searchImg.aspx" target="_blank">
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
                        <img id="strt" src="http://www.iconarchive.com/download/i18314/iconshock/cms/gallery.ico"/>
                    </span>
                    <div class="ca-content">                       
                        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="home.aspx" />                                                
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
                        <span class="loginLabl"><a class="profileUsername" href="login.aspx" target="_blank">Log in</a></span><br />
                        <span class="loginLabl"><a class="profileUsername" href="register.aspx" target="_blank">Register</a></span>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <span class="loginLabl">Welcome</span><br />
                        <span class="loginLabl"><a class="profileUsername" href='member/profile.aspx?ownername=<%= User.Identity.Name %>' target="_blank"><%= User.Identity.Name%></a></span>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
        </div>

        <div style="text-align:center">
            <img id="welcome_banner" src="images/welcome_banner.png"/>
            <label id="website_name">Online Sheet Music Collection and Photo Gallery</label>
            <asp:LoginView runat="server" ID="welcomSignLoginview">
                <AnonymousTemplate>
                    <br /><br />
                    <span class="welcomesign">Please <a class="profileUsername" href="login.aspx" target="_blank">Login in</a> as a member</span><br />
                    <span class="welcomesign">Or <a class="profileUsername" href="register.aspx" target="_blank">Register</a> to be a member</span>
                </AnonymousTemplate>
            </asp:LoginView>
        </div>

		<link rel="shortcut icon" href="http://tympanus.net/Development/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="css/booknormalize.css"/>
		<link rel="stylesheet" type="text/css" href="css/bookdemo.css"/>
		<link rel="stylesheet" type="text/css" href="css/book.css"/>
		<script type="text/javascript" async="" src="js/ga.js"></script>
        <script src="js/bookmodernizr.custom.js"></script>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-7243260-2']);
            _gaq.push(['_trackPageview']);
            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
	    <link rel="stylesheet" type="text/css" href="css/bookdemoadpacks.css"/>
        <script id="_adpacks_projs" type="text/javascript" src="js/bookpro.js"></script>
        <style type="text/css" id="_om_css_global">
            ._om_hidden {
	            visibility: hidden;
            }

            ._om_seamlessframe {
	            width: 100%;
	            height: 100%;
	            border: 0;
	            padding: 0;
	            margin: 0;
	            background-color: transparent;
	            overflow: hidden;
            }
            form {
                background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
            }
            a.btn.search {
                margin-top:10px;
            }
            figcaption span {
                color:lightcoral;
            }
    </style>

        <script type="text/javascript" id="_bsaPRO_js" src="js/booksaved_resource" async="async"></script>
		<div class="container">
			<!-- Top Navigation -->
			<div class="component">
				<ul class="align">
					<li>
						<figure class="book">
						<!-- Front -->
							<ul class="hardcover_front">
								<li>
									<div class="coverDesign grey">
										<span class="ribbon" style="letter-spacing: 0.05em;">Ruiyu</span>
                                        <img src="images/mnote2.jpg" style="margin-top:30%" width="100" height="50"/>
                                        <span style="font-size: 2.0em;color:lightcoral">Sheet</span>
                                        <span style="font-size: 2.0em;color:lightcoral">Music</span>
									</div>
								</li>
								<li></li>
							</ul>
						<!-- Pages -->
							<ul class="page">
								<li></li>
								<li>
									<a class="btn" href="sheetMusicGallery.aspx" target="_blank">Collection</a>
									<a class="btn search" href="searchImg.aspx" target="_blank">Search</a>
								</li>
								<li>
								</li>
								<li></li>
								<li></li>
							</ul>
						<!-- Back -->
							<ul class="hardcover_back">
								<li></li>
								<li></li>
							</ul>
							<ul class="book_spine">
								<li></li>
								<li></li>
							</ul>
							<figcaption>
								<span>Collection: Click "Collection" in the book to explore our members' Sheet Music</span>
                                <span>Search: Click "Search" in the book to search your favorite Sheet Music</span>
							</figcaption>
						</figure>
					</li>
					<li>
						<figure class="book">

						<!-- Front -->
							<ul class="hardcover_front">
								<li>
									<div class="coverDesign grey">
										<span class="ribbon" style="letter-spacing: 0.05em;">Ruiyu</span>
                                        <img src="images/images-icon.png" style="margin-top:30%" width="100" height="70"/>
                                        <span style="font-size: 2.0em;color:lightcoral">Photo</span>
									</div>
								</li>
								<li></li>
							</ul>

						<!-- Pages -->

							<ul class="page">
								<li></li>
								<li>
									<a class="btn" href="photoGallery.aspx" target="_blank">Gallery</a>
                                    <br />
									<a class="btn search" href="searchImg.aspx" target="_blank">Search</a>
								</li>
								<li></li>
								<li></li>
								<li></li>
							</ul>

						<!-- Back -->

							<ul class="hardcover_back">
								<li></li>
								<li></li>
							</ul>
							<ul class="book_spine">
								<li></li>
								<li></li>
							</ul>
							<figcaption>
								<span>Collection: Click "Gallery" in the book to explore our members' photo</span>
                                <span>Search: Click "Search" in the book to search your favorite photo</span>
							</figcaption>
						</figure>
					</li>
				</ul>
			</div>
		</div><!-- /container -->
        <footer id="footer">
            <div class="footer_left">Copyright © Ruiyu Xu, 2014. All rights reserved.</div>
            <div class="footer_right">
                <div style="width: 400px; float: left;">
                    <ul class="social_links">
                        <li class="hover-shadow"><a href="http://www.linkedin.com/pub/ruiyu-xu/56/138/640/" target="_blank">Linkedin</a></li>
                    </ul>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>