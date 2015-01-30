<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photoDetail.aspx.cs" Inherits="Project_member_photoDetail" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Photo Detail</title>
    <meta charset="UTF-8" />
    <meta name="description" content="Rotating Image Slider with jQuery & CSS3" />
    <meta name="keywords" content="jquery, rotation, slider, images, slideshow, autoplay, play, pause, css3" />
    <link rel="stylesheet" href="../css/style9.css" />
    <link rel="stylesheet" href="../css/bootstrap.css" />
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
    <style>
        form {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>
</head>   
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="imgDetailScriptManager" runat="server"></asp:ScriptManager>
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
        <!--Finish navigation bar-->

        <div class="container rg-image-wrapper viewer">
            <asp:Repeater ID="detailimgRepeater" runat="server">
                <ItemTemplate>
                    <div class="container basic-info">
                        <span>Title: <%# Eval("imgTitle") %></span>
                        <br />
                        <span>Author: 
                            <a href='myGallery.aspx?ownername=<%# Eval("ownername") %>'>
                                <%# Eval("ownername") %>
                            </a>
                        </span>
                        <br />
                        <span>Create Time: <%# Eval("createTime") %></span>
                        <br />
                        <span>Description: <%# Eval("imgDesc") %></span>
                        <br />
                    </div>
                    <hr />
                    <div class="imageMetaData">
                        <div>
                            <asp:UpdatePanel ID="likeBtnUpdate" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="likeBtn" OnLoad="likeBtn_Load" OnClick="likeBtn_Click" runat="server"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img class="icon-like" src="http://img2.wikia.nocookie.net/__cb20131106162838/shipping/images/b/b1/Flying_Heart_Icon.png"/>
                                    <asp:Label ID="likeCountLabel" runat="server"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
            
                    
                    <div class="imgDisplay" style="text-align:center">
                        <asp:Image CssClass="detailImg" ID="detailImg" runat="server" ImageUrl='<%# Eval("imgurl") %>'/>
                     </div>
                    <div class="container">
                        <asp:LinkButton ID="addToGallery" CssClass="pull-left btn blue badge" runat="server" Text="Add to my Gallery" OnClick="addToGallery_Click" />
                    </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="container">
                    <label>Members who like this photo:</label><br />
                    <asp:Repeater runat="server" ID="likeUserRepeater">
                        <ItemTemplate>
                            <a href='profile.aspx?ownername=<%# Eval("username") %>' target="_blank"><%# Eval("username") %></a>&nbsp;&nbsp;&nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <hr />
                <div class="container commentDiv">
                    <asp:UpdatePanel runat="server" UpdateMode="Always" ID="cmntUpdatePanel">
                        <ContentTemplate>
                            <asp:TextBox ID="CmntTextArea" TextMode="MultiLine" CssClass="cmntTextArea" PlaceHolder="Add Comment Here" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="AddCmntBtn" CssClass="btn btn-info btn-sm" OnClick="AddCmntBtn_Click" runat="server" Text="Add Comment"/>
                            <br />
                            <div class="container">
                                <asp:Label runat="server" ID="CmntCountLabel"></asp:Label>
                                <hr />
                                <asp:Repeater runat="server" ID="cmntRepeater">
                                    <ItemTemplate>
                                        <span><a href='profile.aspx?ownername=<%# Eval("username")%>' target="_blank"><%# Eval("username") %></a>&nbsp;&nbsp;&nbsp;<%# Eval("createTime") %></span>
                                        <div class="container">
                                            <p>
                                                <%# Eval("comment") %>
                                            </p>
                                        </div>
                                        <hr />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                
            </div>
    <br />
        <br />
    </form>
</body>
</html>
