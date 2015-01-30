<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchImg.aspx.cs" Inherits="Project_searchImg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
    <meta charset="UTF-8" />
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.transform-0.9.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.RotateImageMenu.js"></script>        
    <style>
        body,form {
            background-image: url('http://static.web-backgrounds.net/uploads/2011/04/bg13_preview_big.jpg');
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="searchManager" runat="server"></asp:ScriptManager>
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
                    <a href="#">
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

    <div>
        <asp:UpdatePanel ID="searchResult" runat="server">
            <ContentTemplate>
        <div class="container search-box">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Search" Width="300px"></asp:TextBox>
            <asp:Button ID="btnSearchPhoto" CssClass="blue" runat="server" Text="Search Image" OnClick="btnSearchPhoto_Click" />
            <asp:Button ID="btnSearchSM" CssClass="blue" runat="server" Text="Search Sheet Music" OnClick="btnSearchSM_Click" />
            <br />
        </div>
        <script>
            function show_imgdiv() {
                console.log("In show img div")
                document.getElementById("imgdiv").style.display = "block";

            }
            function show_smdiv() {
                console.log("In show music div")
                document.getElementById("smdiv").style.display = "block";
            }
        </script>
        <br />
        
        <div class="container viewer rg-image-wrapper pre-scrollable" runat="server" id="smdiv" style="display:none">
            <asp:Repeater ID="dlSearch2" runat="server" OnDataBinding="dlSearch2_DataBinding">
                <ItemTemplate>
                    <table class="table">
                        <tr>
                            <td><asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl='<%#Eval("custom_url") %>'><%# Eval("title") %></asp:HyperLink></td>
                            <td>
                                <asp:LinkButton ID="previewBtn" CssClass=" btn badge orange" runat="server" Text="Preview" onClientClick='<%# String.Format("javascript:return openPreviewSM(\"{0}\", \"{1}\")", Eval("custom_url").ToString(), Eval("title").ToString()) %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <script>
            function openPreviewSM(smurl,title) {
                var url = "sheetMusicPreview.aspx?custom_url=" + smurl+"&title="+title;
                window.open(url,"_blank")
            }
        </script>
        <div class="container viewer rg-image-wrapper pre-scrollable" runat="server" id="imgdiv" style="display:none">
            <asp:Repeater ID="dlSearch1" runat="server" OnDataBinding="dlSearch1_DataBinding">     
              <ItemTemplate>
                  <table class="table">
                      <tr>
                          <td><asp:Label ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%#Eval("Url") %>'><img class="center-block" src='<%#Eval("Url") %>' width="200" height="100"/></asp:Label></td>
                          <td >
                              <asp:LinkButton ID="titleLink" runat="server" Target="_blank"  OnClientClick='<%# String.Format("javascript:return addToMyGallery(\"{0}\")", Eval("Url").ToString()) %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                              <br />
                              <asp:Label ID="sizeLabel" runat="server">Size: <%# Eval("Width") %> x <%# Eval("Height") %></asp:Label>
                              <br />
                              <asp:LinkButton ID="previewBtnImg" CssClass=" btn badge orange" runat="server" Text="Preview" onClientClick='<%# String.Format("javascript:return openPreviewImg(\"{0}\", \"{1}\", \"{2}\")", Eval("Url").ToString(), Eval("Width").ToString(), Eval("Height").ToString()) %>' />
                          </td>
                      </tr>
                  </table>            
                <br />
            </ItemTemplate> 
            <FooterTemplate>
                <asp:Label Visible='<%#bool.Parse((dlSearch1.Items.Count==0).ToString())%>' runat="server"
                    ID="lblNoRecord" Text="No Record Found!"></asp:Label>
            </FooterTemplate>
            </asp:Repeater>
        </div>
            <script>
                function openPreviewImg(imgUrl, width,height) {
                    var url = "ImgPreview.aspx?"+"imgUrl=" + imgUrl + "&width="+width+"&height="+height;
                    window.open(url, "_blank")
                }
            </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
        <br />
        <br />
        <br />

    </form>
</body>
</html>
