<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sheetMusicPreview.aspx.cs" Inherits="Project_sheetMusicGallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sheet Music Preview</title>
    <meta charset="UTF-8" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="Rotating Image Slider with jQuery & CSS3" />
    <meta name="keywords" content="jquery, rotation, slider, images, slideshow, autoplay, play, pause, css3" />
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0"/>
    <link rel="stylesheet" href="css/style9.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link href='http://fonts.googleapis.com/css?family=Ceviche+One' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
    <link href="css/masterpage.css" rel="stylesheet" type="text/css" />
    <link href="css/css3button.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/style1.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/styleproj.css" />
    <link href="css/form.css" rel="stylesheet" type="text/css" />    
    <link rel="stylesheet" type="text/css" href="css/elastistyle.css" />
    <link rel="stylesheet" type="text/css" href="css/imageDetail.css"/>
    <link rel="stylesheet" type="text/css" href="css/elastisdemo2.css"/>
    <link rel="stylesheet" type="text/css" href="css/elastislide2.css"/>
    <link rel="stylesheet" type="text/css" href="css/elastiscustom.css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.transform-0.9.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.RotateImageMenu.js"></script>    
    <script src="js/modernizr.custom.17475.js"></script></head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/oembed.js"></script>
    <style>
        form {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <div class="nav_header">
            <ul class="ca-menu">
                <li id="hm">
                    <a href="home.aspx" target="_blank">
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
                            <h2 class="ca-main">Photo</h2>
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


        <br />
        <div class="container">
            <script type="text/javascript">
                $(document).ready(function () {
                    //Any score url can be used, http://musescore.com/score/XXX http://musescore.com/node/XXX http://mus.cr/YYY etc...
                    var custom_url = getQueryVariable("custom_url");
                    $("#sheetmusic").oembed(custom_url /*,{maxWidth: 1024}*/);
                });
                function getQueryVariable(v)
                {
                    var query = window.location.search.substring(1);
                    var vars = query.split("&");
                    for (var i = 0; i < vars.length; i++) {
                        var pair = vars[i].split("=");
                        if (pair[0] == v) { return pair[1];}
                    }
                    return "";
                }
            </script>
            <div class="container">
                <div class="container rg-image-wrapper viewer">
                    <div class="content">
                        <div><asp:Label runat="server" ID="smtitle"></asp:Label></div>
                        <br />
                        <asp:LoginView runat="server">
                            <AnonymousTemplate>
                                <asp:LinkButton ID="loginToAdd" CssClass="pull-left btn badge" runat="server" Text="Want to add to my Sheet Music Collection? Please Login" OnClick="loginToAdd_Click" />
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <asp:LinkButton ID="addToCollection" CssClass="pull-left btn blue badge" runat="server" Text="Add to my Sheet Music Collectionn" OnClick="addToCollectionn_Click" />
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </div>
                    <hr />
                    <div id="sheetmusic"></div>
                </div>
            </div>
        </div>
        <br />
        <br />

    </form>
</body>
</html>
