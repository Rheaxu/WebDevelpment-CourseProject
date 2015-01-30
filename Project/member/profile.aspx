<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Project_profile" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <meta charset="UTF-8" />
    <meta name="description" content="Rotating Image Slider with jQuery & CSS3" />
    <meta name="keywords" content="jquery, rotation, slider, images, slideshow, autoplay, play, pause, css3" />
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <script src="../js/jquery-1.11.1.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <link rel="stylesheet" href="../css/style9.css" />
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link rel="stylesheet" href="../css/jquery-ui.css"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="../css/font-awesome.css" />
    <link href='http://fonts.googleapis.com/css?family=Ceviche+One' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css' />
    <link href="../css/masterpage.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../css/styleproj.css" />
    <link href="../css/css3button.css" rel="stylesheet" type="text/css" />
    <link href="../css/form.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" type="text/css" href="../css/elastistyle.css" />
    <link rel="stylesheet" type="text/css" href="../css/imageDetail.css"/>
    <script type="text/javascript">
        $(function () {
            console.log("setting the accordion");
            // Load the accordion
            $("#accordion").accordion();
            $("#accordion").accordion("option", "collapsible", true);
            var heightStyle = $("#accordion").accordion("option", "heightStyle");

            // Controls the height of the accordion and each panel.
            $("#accordion").accordion("option", "heightStyle", "content");
            // +/- Icons
            var icons = $("#accordion").accordion("option", "icons");
            // Load the appropriate icons in the panel
            $("#accordion").accordion("option", "icons", { "header": "ui-icon-plus", "activeHeader": "ui-icon-minus" });

            // Refresh the panel height dynamically
            $("#accordion").accordion("refresh");

        });
    </script>
    <style>
        form {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="profileScriptManager" runat="server"></asp:ScriptManager>
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
                    <a href="../photoGallery.aspx">
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
                        <span class="loginLabl"><a class="profileUsername" href='#'><%= User.Identity.Name%></a></span>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
        </div>

            <div class="container">
                <div class="rg-image-wrapper viewer">
                    <h1><asp:Label ID="profileOwnername" runat="server" CssClass="profileUsername">
                        </asp:Label>
                    </h1>
                    <div class="imageMetaData">
                        <asp:UpdatePanel ID="followBtnUpdate" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="followBtn" OnLoad="followBtn_Load" OnClick="followBtn_Click" runat="server"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <img class="icon-like" src="http://a2.mzstatic.com/us/r30/Purple4/v4/a7/67/b3/a767b33d-77a8-f73b-26f4-a33d5291167d/icon175x175.jpeg"/>
                                <asp:Label ID="followerCountLabel" runat="server"></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <img class="icon-like" src="http://cache1.asset-cache.net/xc/463191947.jpg?v=2&c=IWSAsset&k=2&d=Z6LiWVsPOCJCDRgR8-l1dFzPPVUN_C834GHGtjJUXDE1"/>
                                <asp:Label ID="followingCountlabel" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <hr />
                    </div>
                    <div id="accordion">
                          <asp:Repeater ID="ownerView" runat="server">
                                <ItemTemplate>
                                    <h3>Basic Information</h3>
                                    <div>
                                        <ul>
                                            <li>username: <%# Eval("username") %></li>
                                            <li>email: <%# Eval("email") %></li>
                                        </ul>
                                    </div>
                                    <h3>Sheet Music Collection</h3>
                                    <div>
                                        <ul>
                                            <li><a href='mySheetMusicGallery.aspx?ownername=<%# Eval("username") %>' target="_blank"><%# Eval("username") %>'s Sheet Music Collection</a></li>
                                        </ul>
                                     </div>
                                     <h3>Photo Gallery</h3>
                                     <div>
                                        <ul>
                                            <li><a href='myGallery.aspx?ownername=<%# Eval("username") %>' target="_blank"><%# Eval("username") %>'s Photo Gallery</a></li>
                                        </ul>
                                     </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <h3>Followers</h3>
                            <div>
                                <asp:Repeater ID="followerRepeater" runat="server">
                                    <ItemTemplate>
                                        <ul>
                                            <li><a href='profile.aspx?ownername=<%# Eval("follower") %>' target="_blank"><%# Eval("follower") %></a></li>
                                        </ul>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <h3>Followings</h3>
                            <div>
                                <asp:Repeater ID="followingRepeater" runat="server">
                                    <ItemTemplate>
                                        <ul>
                                            <li><a href='profile.aspx?ownername=<%# Eval("username") %>' target="_blank"><%# Eval("username") %></a></li>
                                        </ul>
                                    </ItemTemplate>
                                </asp:Repeater>
                             </div>
                            <h3>Liked Sheet Music</h3>
                            <div>
                                <asp:Repeater ID="favSMRepeater" runat="server">
                                    <ItemTemplate>
                                        <ul>
                                            <li><a href='sheetMusicDetail.aspx?ownername=<%# Eval("likeUsername") %>&smId=<%# Eval("likedSMId") %>' target="_blank"><%# Eval("likedSMTitle") %></a></li>
                                        </ul>
                                    </ItemTemplate>
                                </asp:Repeater>
                             </div>
                            <h3>Liked Photo</h3>
                            <div>
                                <asp:Repeater ID="favPRepeater" runat="server">
                                    <ItemTemplate>
                                        <ul>
                                            <li><a href='photoDetail.aspx?ownername=<%# Eval("likeUsername") %>&imgId=<%# Eval("likedImgId") %>' target="_blank"><%# Eval("likedImgTitle") %></a></li>
                                        </ul>
                                    </ItemTemplate>
                                </asp:Repeater>
                             </div>
                        </div>
                    <hr />
                </div>
            </div>
    
    </form>
</body>
</html>
