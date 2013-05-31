﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PerfApp.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Forgot Password</title>
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
        
        container
         {
            width:100%;
            height:100%;
        }
        fieldset {
border: 2px solid #575757;
border-radius: 8px;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;

} 

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
        }
         .auto-style4 {
             font-family: Verdana, Geneva, Tahoma, sans-serif;
         }
    </style>
</head>
<body style="height:100%;background-color:#E8E8E8">
    <form id="form1" runat="server" style="width:100%;height:100%;" >
        <script>
            function Empty() {
                var newPwd = document.getElementById("<%= emailAddress.ClientID %>").value;
                if (newPwd == "") {
                    document.getElementById("<%= lblError.ClientID %>").innerHTML = "Please Enter the email address";
                    return false;
                }
                else {
                    document.getElementById("<%= lblError.ClientID %>").innerHTML = "";
                    return true;
                }
            }
        </script>
         <div class="grid_16 login_page_header">
        <div align="left">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server"/>
        </div>
        <fieldset style="margin-left: 150px;width:1000px;height:410px; margin-bottom:500px; margin-top: 0px;background-color:white"  >
    <table style="width:100%" border="0">
        <tr>
            <td colspan="2" align="center">
                <strong> 
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                Please Enter your Email Id to Reset the password</strong>
            </td>
        </tr>
        <tr>
            <td style="height:15px"></td>
        </tr>
        <tr>
            <td align="right" style="font-family:Verdana" >
                E-mail Address
               
         
               
            </td>
            <td>
                <asp:TextBox ID="emailAddress" runat="server" CssClass="gradient_effect"/>
            </td>
        </tr>
        <tr>
           
            <td colspan="2" align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:ImageButton ID="btnSend" OnClick="btnSend_Click" ImageUrl="~/images/submit.png" OnClientClick="return Empty();" runat="server" Width="75px"/>
            </td>
        </tr>
    </table>
            </fieldset>
    </form>
</body>
</html>
