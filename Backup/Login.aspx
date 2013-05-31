<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PerfApp.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>
    <script type="text/javascript" src="script.js"></script>

    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->
    <style type="text/css">
        .button_100 {}
        .txtbox
        {
            background-color:#E4E4E4
        }

         html, body {
    height: 100%;
    margin: 0;
    padding: 0; 
}

#container {
    min-height: 100%;
    width: 100%; 
}
    </style>

    <script>
        window.onload = function() 
        {
            var lbl = document.getElementById('container');
            if (navigator.userAgent.indexOf("Firefox") != -1)
                lbl.style.background = "-moz-linear-gradient(top,  #ccc,  #000)";
            else if (navigator.userAgent.indexOf("Chrome") != -1)
                lbl.style.background = "-webkit-gradient(linear, left top, left bottom, from(#ccc), to(#000))";
            else if (navigator.userAgent.indexOf("MSIE") != -1)
                lbl.style.filter = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#cccccc', endColorstr='#000000');";
        };
    </script>
</head>
<body>
    <form id="container" runat="server" style="height:100%;" >
    <script type="text/javascript" >
        function CheckEmpty()
        {
            if (document.getElementById("<%= UserNameTextBox.ClientID %>").value == "" || document.getElementById("<%= PasswordTextBox.ClientID %>").value == "") {
                document.getElementById("<%= error.ClientID %>").innerHTML = "Please Enter Username and Password";
                return false;
            }
        }
    </script>

    

    <div class="grid_16 login_page_header">
        <div align="center">
            <asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <br />
       
    </div>
    <div  align="center" >
        
        <table border="0" >
            <tr>
                <td style="height:60px"></td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="font-weight:bold;font-family:Verdana">Sign In to Your Account</td>
            </tr>
            <tr>
                <td style="height:20px"
            </tr>
            <tr>
                <td>
                    <asp:Label CssClass="" ID="UserNameTextBoxLabel" AssociatedControlID="UserNameTextBox"
                    runat="server" Text="User Name"  style="font-family:Verdana" ForeColor="White"/> <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="txtbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label CssClass="" ID="PasswordTextBoxLabel" AssociatedControlID="PasswordTextBox"
                    runat="server" Text="Password" style="font-family:Verdana" ForeColor="White"/><asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="error" runat="server" ForeColor="Red"  Font-Bold="true"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:ImageButton CssClass="button_100" ID="LoginButton" runat="server" 
                OnClick="LoginButton_Click" Height="39px" OnClientClick="return CheckEmpty();"  width="105px" ImageUrl="~/images/login.png" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:LinkButton ID="btnForgot" runat="server" OnClick="btnForgot_Click" Text="Forgot Password?"/>
                 </td>
            </tr>
        </table>

        </div>
    </form>
</body>
</html>
