<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PerfApp.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Log In</title>
    <script type="text/javascript" src="script.js"></script>
    <link href="css/cupertino/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
    <style type="text/css">
        .button_100 {
            margin-left: 0px;
        }
        .txtbox
        {
            background-color:#CACACA;
            border:solid 1px #B6B6B6;
           
        }
         
        html, body {
            height: 100%;
            padding: 0;
            border: 0;
        }
        fieldset {
            border:medium;
        }
         
        container
         {
            width:100%;
            height:100%;
        }
          input.twitterStyleTextbox {

border: 1px solid #c4c4c4;

    width: 180px;

    height: 17px;

    font-size: 12px;

    padding: 4px 4px 4px 4px;

    border-radius: 4px;

    -moz-border-radius: 4px;

    -webkit-border-radius: 4px;

box-shadow: 0px 0px 8px #d9d9d9;

-moz-box-shadow: 0px 0px 8px #d9d9d9;

-webkit-box-shadow: 0px 0px 8px #d9d9d9;

}

 input.twitterStyleTextbox:focus 
 {

    outline: none;

    border: 1px solid #7bc1f7;

    box-shadow: 0px 0px 8px #00008B;

    -moz-box-shadow: 0px 0px 8px #7bc1f7;

    -webkit-box-shadow: 0px 0px 8px #7bc1f7;

 }​

 

           .gradient_effect {
            border: solid 1px #B6B6B6;
            background: rgb(224,224,224); /* Old browsers */
            background: -moz-linear-gradient(top, rgb(224,224,224) 0%, rgb(255,255,255) 40%, rgb(255,255,255) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(224,224,224)), color-stop(40%,rgb(255,255,255)), color-stop(100%,rgb(255,255,255))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* IE10+ */
            background: linear-gradient(to bottom, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#E0E0E0', endColorstr='#FFFFFF',GradientType=0 ); /* IE6-9 */
            border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-style:inset;border-top-left-radius:5px;border-top-right-radius:5px;
        }
    </style>
    
     
</head>
<body style="height:100%;background-color:#E8E8E8">
    <form id="container" runat="server" style="width:100%;" >
    <script type="text/javascript" >
        function CheckEmpty() {
            if (document.getElementById("<%= UserNameTextBox.ClientID %>").value == "" || document.getElementById("<%= PasswordTextBox.ClientID %>").value == "") {
                document.getElementById("<%= error.ClientID %>").innerHTML = "Please enter<br /> Username & Password";
                return false;
            }
        }
       

        $("#LoginButton").button();
        $("#UserNameTextBox").focus(function () {

            $(this).css('outline', 'yellow solid thin');

        });
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="grid_16 login_page_header">
        <div align="left">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server"/>
        </div>
        <br />
       
    </div>
        <ajaxToolkit:DropShadowExtender ID="DropShadowExtender1" runat="server"
    TargetControlID="Panel2" 
    Opacity=".8" 
    Rounded="true"
    TrackPosition="true" />
        <fieldset style="margin-left: 150px;width:1000px;height:410px; margin-bottom:500px; margin-top: 0px;background-color:white" id="Panel2" runat="server" ><br /><br /><br />
        <ajaxToolkit:DropShadowExtender ID="dse" runat="server"
    TargetControlID="Panel1" 
    Opacity=".8" 
    Rounded="true"
    TrackPosition="true" />
           
  <fieldset style="width: 350px; margin-left: 340px;margin-top:20px;background-color:#CAD6F7" align="center" id="Panel1" runat="server">   <div  >
         <table border="0" align="center">
            <tr>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="font-weight:bold;font-family:Verdana" >Sign In to your account</td>
            </tr>
            <tr>
                <td style="height:20px">
            </tr>
            <tr>
                <td>
                    <asp:Label CssClass="" ID="UserNameTextBoxLabel" AssociatedControlID="UserNameTextBox"
                    runat="server" Text="Username"  style="font-family:Verdana"/><asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="twitterStyleTextbox" BorderStyle="Inset" ForeColor="#000000"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label CssClass="" ID="PasswordTextBoxLabel" AssociatedControlID="PasswordTextBox"
                    runat="server" Text="Password" style="font-family:Verdana"/><asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="twitterStyleTextbox" BorderStyle="Inset" ForeColor="#000000"></asp:TextBox>
                </td>
                
            </tr>
          <tr><td></td>
                <td><a href="ForgotPassword.aspx">Forgot Password?</a> </td>
               
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label ID="error" runat="server" ForeColor="Red"  Font-Bold="true"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    <asp:Button  ID="LoginButton" runat="server" 
                OnClick="LoginButton_Click" Height="34px" OnClientClick="return CheckEmpty();" Text="Sign In"  width="100px"  />
                </td>
            </tr>
       </table>

        </div></fieldset> </fieldset>
    </form>
</body>
</html>
