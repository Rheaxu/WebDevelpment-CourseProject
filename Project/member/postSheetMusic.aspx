<%@ Page Language="C#" AutoEventWireup="true" CodeFile="postSheetMusic.aspx.cs" Inherits="Project_member_postPhoto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="description" content="Rotating Image Slider with jQuery & CSS3" />
    <meta name="keywords" content="jquery, rotation, slider, images, slideshow, autoplay, play, pause, css3" />
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/style9.css" />
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/styleproj.css" />
    <link rel="stylesheet" href="../css/font-awesome.css" />
    <link href='http://fonts.googleapis.com/css?family=Ceviche+One' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
    <link href="../css/css3button.css" rel="stylesheet" type="text/css" />
    <link href="../css/form.css" rel="stylesheet" type="text/css" />    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.transform-0.9.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.RotateImageMenu.js"></script>
    <title>Post Sheet Music</title>
    <script type="text/javascript">
        function textCounter(field, countfield, maxlimit) {
            if (field.value.length > maxlimit)
                field.value = field.value.substring(0, maxlimit);
            else
                countfield.value = (maxlimit - field.value.length);
        }

    </script>
    <style>
        form {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" />                                                
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

        <div class="form">
            <h1 class="form-title">
                Add Sheet Music to my Collection
            </h1>
            <p class="border-bottom">
                <asp:Label ID="Label5" runat="server">
                    In order to better serve other users, please fill the following information for your work.
                </asp:Label>
            </p>
            <asp:Panel ID="Output" runat="server" Visible="false">
                <asp:Label ID="Label7" runat="server" Text="Label">Add sheet music succeeded!</asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server">Click here to see</asp:HyperLink>
            </asp:Panel>
            <div class="error">
                <div>
                    <asp:RequiredFieldValidator ID="UrlTxtValidation" runat="server" ControlToValidate="UrlTxt"
                        Display="Dynamic" ErrorMessage="Please enter the sheet music url."></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:RegularExpressionValidator ID="TitleTxtValidation" runat="server" ErrorMessage="Title field has wrong format of input."
                        ControlToValidate="TitleTxt" ValidationExpression="^[a-zA-Z0-9'.\s]{1,50}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="TitleTxtRequiredValidation" runat="server" ControlToValidate="TitleTxt"
                        Display="Dynamic" ErrorMessage="Work Title should not be empty."></asp:RequiredFieldValidator>
                </div>
            </div>
            <p>
                <label>
                    URL
                    <asp:Label ID="Label4" runat="server" Text="Enter the url of the sheet music"></asp:Label>
                </label>
                <asp:TextBox ID="UrlTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <label>
                    Title
                    <asp:Label ID="Label3" runat="server" Text="Give your work a title"></asp:Label>
                </label>
                <asp:TextBox ID="TitleTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <label>
                    Description
                    <asp:Label ID="Label6" runat="server" Text="Please briefly descripe your work in 200 characters."></asp:Label>
                </label>
                <asp:TextBox id="DescriptionArea" class="descArea" TextMode="MultiLine" onkeyup="textCounter(DescriptionArea,this.form.remLen,200);"
                    onkeydown="textCounter(DescriptionArea,this.form.remLen,200);" runat="server" cols="40" rows="5"></asp:TextBox>
                <span><input class="counterLabel" style="width:auto" readonly="readonly" type="text" name="remLen" size="3" maxlength="3" value="200"/> characters left</span>
            </p>
            
            <p>
                <asp:Button ID="PostBtn" CssClass="button orange" runat="server" OnClick="PostBtn_Click" Text="Post"/>          
            </p>
        <p>
            <asp:Label ID="UploadStatusLabel" runat="server"></asp:Label>
        </p>
        </div>
     <br />   
     <br />   
    </form>
</body>
</html>
