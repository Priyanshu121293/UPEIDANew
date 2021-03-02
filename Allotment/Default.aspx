<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Allotment.Default" %>
<!DOCTYPE html>
<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">   

  <link rel="icon" href="images\upsidclogo.png" />
   <title>Uttar Pradesh Expressway Industrial Development Authority</title>
     <meta http-equiv="Page-Enter" content="Alpha(opacity=100)"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/CssManu.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/Footer.css" rel="stylesheet" />
    <style>
        
        .table1  td {
    padding-top: 1px;
    padding-bottom: 1px;
    
}
       
.buttonN {
    
  padding: 1px 10px;
  font-size: 12px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 5px;
  box-shadow: 0 2px #999;
}

.buttonN:hover {background-color: #3e8e41}

.buttonN:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.bg-mywhite {
            background:#fff;
        }

.performance-textdiv {
                        min-height: 111px;
    margin-top: 20px;
    padding: 0px 0 0 7px;
    font-weight: 500;
    color: #636262;
        }
        .performance-textdiv1 {
                        min-height: 250px;
    margin-top: 20px;
    padding: 0px 0 0 7px;
    font-weight: 500;
    color: #636262;
        }


#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}
        * {
            box-sizing: border-box;
        }
        .btn-primary {
        
            background-color: #f3cc48;
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffe034), to(#e4b306));
            border: 1px solid #e9bb0e;
            font-weight: 500;
            color: #000;
        }
        .dash {
            border: 0 none;
            border-top: 1px dashed #FFD200;
            background: none;
            height: 0;
        }

        .mySlides {
            display: none;
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* Caption text */

        .active {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fade {
            from {
                opacity: .4;
            }

            to {
                opacity: 1;
            }
        }

        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
            .text {
                font-size: 11px;
            }
        }
 @media screen and (min-width: 992px) {
            #myModal .modal-dialog {
                width: 600px;
                /* height: 300px; */
                margin-top: 11%;
            }
        }
        
              #ac-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, .6);
    z-index: 1001;
   
    
}
#popup {
    width: 880px;
    height:480px;
    background: #FFFFFF;
    border: 5px solid #000;
    border-radius: 25px;
    -moz-border-radius: 25px;
    -webkit-border-radius: 25px;
    box-shadow: #64686e 0px 0px 3px 3px;
    -moz-box-shadow: #64686e 0px 0px 3px 3px;
    -webkit-box-shadow: #64686e 0px 0px 3px 3px;
    position:relative;
    top: 150px;
    left: 375px;
    transition: width 2s;
}
.niveshmitra {
	padding: 26px 0 0 0;
	display: inline-block;
}
.niveshmitra a {
	font-size: 28px;
	color: #02486d;
	font-weight: bold;
	text-decoration: none !important;
}
.niveshmitra a:hover {
	text-decoration: none !important;
}
.up-logo {
    float: right;
}


    </style>

    
</head>
<body id="pagewrap">
 <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <form id="form1" runat="server">

             <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

 
        <div class="container">




            <div class="row">
                <div>
                    <div class="navbar-header  top-head-bg">
                        
                            <div class="col-md-9">
                                <a href="Default.aspx" class="navbar-brand" style="width:100%;">
                                <img class="img-responsive" src="images/logo-img/UPEIDA_Title.png"  /></a>
                            </div>
                           <div class="col-md-3">
<p class="niveshmitra"><a href="http://niveshmitra.up.nic.in/" target="_blank" rel="noopener" title="Official Website of Nivesh Mitra">Nivesh Mitra</a></p>
<div class="up-logo"><img class="img-responsive" src="images/logo-img/govt_up.png" alt="Image of Government of Uttar Pradesh, India" title="Government of Uttar Pradesh, India" tabindex="0"/></div>
</div>
                     

                    </div>
                </div>
                <div  class="clearfix"></div><div id="main_menu" runat="server"><% Response.WriteFile("top_mainmenu.aspx"); %></div></div>
            <div class="row default-top-header" id="SideDiv">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-8" style="margin-top: 15px">
                            <img class="img-responsive" src="images/Img1.jpg" style="height:314px;" />
                        </div>
                        <div class="col-md-4 well well-large offset4">
                            <div class="clearfix"></div>
                            <div class="form-group" style="border: 1px solid #ccc;padding: 20px;">
                                <div style="width: 210px">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Flow">
                                        <asp:ListItem Text="UPEIDA User &nbsp;&nbsp;&nbsp;" Value="1" Selected="True"></asp:ListItem>
                                  
                                    </asp:RadioButtonList>
                                </div>
                                <div class="input-group" style="margin-top: 10px">                              
                                    <asp:TextBox ID="txtUserName" CssClass="form-control margin-left-z" runat="server" Width="250px" Placeholder="Enter User Name" ToolTip="UserName"></asp:TextBox>
                                    <br />
                                </div>
                                <div class="input-group" style="margin-top: 10px">
                                    
                                    <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control margin-left-z" Placeholder="Enter Password" Width="250px"  ToolTip="Password" type="password"></asp:TextBox>

                                </div>
                                 <div class="input-group" style="margin-top: 10px">
                               
                                 <asp:TextBox ID="txtCode" runat="server" CssClass="form-control margin-left-z" Placeholder="Enter Captcha" Width="250px" ToolTip="Enter Captcha" AutoComplete="off"></asp:TextBox>

                                </div>
                                <div class="input-group" style="margin-top: 10px">
                                   <asp:Image ImageUrl="ghCaptcha.ashx" runat="server" ID="imgCaptcha" /> 
                                   
                                </div>
                                <div class="login-btn" style="margin-top: 10px">
                                    <asp:Button ID="btnLogin" runat="server" Width="80px" class="btn btn-primary ey-bg" style="margin-left:0;" Text="Login" OnClick="btnLogin_Click" OnClientClick="javascript:return ChkValidVal();" />
                                  
                                </div>
                                 <div>
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="#FC590A"></asp:Label>
                                </div>
                              
                                                     
                             
                            </div>



                        </div>
                    </div>
                    <div class="row">

                        
          <div class="col-md-12">
                            <marquee scrolldelay="10" direction="left" style="position:relative;padding: 12px 0;border:6px solid #d6d6d6;margin-top: 20px;">
                                <img src="images/Icon/new_red.gif" style="position:absolute;z-index:2;left: -34px;top: -3px;" alt="new img" />
                                 <p>UPEIDA Land Allotment service will now available only through nivesh mitra portal.</p>
                                
                            </marquee>

                        </div>
  <div class="clearfix"></div>
                        <div class="col-md-3"></div>
                    </div>
                    <div id="footer_id" runat="server"> <% Response.WriteFile("public_footer.aspx"); %> </div>  

                </div>

            </div>
        </div>

    </form>



    <script type="text/ecmascript">
        function ErrorClose() {
            var divError = document.getElementById("divError");
            divError.style.display = "none";
        }

        function ChkValidVal() {

            var user_email = document.getElementById("txtUserName");
            var user_password = document.getElementById("txtPwd");
            var IsvalidEmail = 1;

            if (user_email.value == "") {

                alert("Please User ID.")
                return false;
            }

            if (user_password.value == "") {
                alert("Please enter password.");
                return false;
            }
        }

    </script>
    <script type="text/javascript">
        $(function () {
            $("#nav .dropdown").hover(
                function () {
                    $('#products-menu.dropdown-menu', this).stop(true, true).fadeIn("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('#products-menu.dropdown-menu', this).stop(true, true).fadeOut("fast");
                    $(this).toggleClass('open');
                });
        });
        $(function () {
            $("#nav .dropdown1").hover(
                function () {
                    $('#products-menu1.dropdown-menu1', this).stop(true, true).fadeIn("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('#products-menu1.dropdown-menu1', this).stop(true, true).fadeOut("fast");
                    $(this).toggleClass('open');
                });
        });
     
    </script>
<script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}


</script>

</body>
</html>
