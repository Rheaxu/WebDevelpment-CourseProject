<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sheetMusicGallery.aspx.cs" Inherits="Project_sheetMusicGallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sheet Music Collection</title>
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
    <link href="css/form.css" rel="stylesheet" type="text/css" />    
    <link rel="stylesheet" type="text/css" href="css/elastistyle.css" />
    <link rel="stylesheet" type="text/css" href="css/imageDetail.css"/>
    <link rel="stylesheet" type="text/css" href="css/elastisdemo2.css"/>
    <link rel="stylesheet" type="text/css" href="css/elastislide2.css"/>
    <link rel="stylesheet" type="text/css" href="css/elastiscustom.css"/>
    <link rel="stylesheet" type="text/css" href="css/styleproj.css" />
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
                    <a href="#">
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
        <div class="container">
            <div>
                <a class="btn btn-info orange" href="member/mySheetMusicGallery.aspx?ownername=<%=User.Identity.Name %>" target="_blank">Go to My Collection</a>
            </div>
        </div>   
        
        <div class="container" style="text-align:center">
            <h1>Most popular Sheet Music</h1>
            <div class="container rg-image-wrapper viewer pre-scrollable">
                <div class="container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="popularth"><b>Title</b></th>
                                <th class="popularth"><b>Likes</b></th>
                                <th class="popularth"><b>Owername</b></th>
                                <th></th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="popularSMRepeater">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("smTitle") %>
                                        </td>
                                        <td>
                                            <%# Eval("likes") %>
                                        </td>
                                        <td>
                                            <a href='member/profile.aspx?ownername=<%# Eval("ownername") %>' target="_blank"><%# Eval("ownername") %></a>
                                        </td>
                                        <td><a href='sheetMusicPreview.aspx?custom_url=<%# Eval("smurl") %>' class="btn badge orange" target="_blank">Preview</a>
                                        <a href='member/sheetMusicDetail.aspx?ownername=<%# Eval("ownername") %>&smId=<%# Eval("Id") %>' class="badge blue btn" target="_blank">Detail</a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="container rg-image-wrapper viewer pre-scrollable">
                <div class="container">
                    <h2>All our members</h2>
                    <asp:Repeater runat="server" ID="memberRepeater">
                        <ItemTemplate>
                            <span><a href='member/profile.aspx?ownername=<%# Eval("username") %>' target="_blank"><%# Eval("username") %></a></span>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <br />
        <br />

    </form>
</body>
</html>
