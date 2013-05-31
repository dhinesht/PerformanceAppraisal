<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Performance Appraisal.aspx.cs" Inherits="PerfApp.Performance_Appraisal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <title>Performance Appraisal</title>
    <script type="text/javascript" src="script.js"></script>
    <link href="css/cupertino/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->

    <style type="text/css">
        .ui-datepicker { width: 12em; padding: .2em .2em 0; display: none; }
.ui-datepicker table {width: 100%; font-size: .7em; border-collapse: collapse; margin:0 0 .4em; }
        .txtbox
        {
             border: solid 1px #B6B6B6;
            background: rgb(224,224,224); /* Old browsers */
            background: -moz-linear-gradient(top, rgb(224,224,224) 0%, rgb(255,255,255) 40%, rgb(255,255,255) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(224,224,224)), color-stop(40%,rgb(255,255,255)), color-stop(100%,rgb(255,255,255))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* IE10+ */
            background: linear-gradient(to bottom, rgb(224,224,224) 0%,rgb(255,255,255) 40%,rgb(255,255,255) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#E0E0E0', endColorstr='#FFFFFF',GradientType=0 ); /* IE6-9 */
       border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-style:outset;border-top-left-radius:5px;border-top-right-radius:5px;
        }
        
        .auto-style2 {
            width: 1329px;
        }
        .auto-style4 {
            height: 29px;
            width: 319px;
        }
        .auto-style5 {
            width: 319px;
        }
        .auto-style6 {
            height: 10px;
            width: 319px;
        }
        .auto-style8 {
            width: 128px;
        }
        fieldset {
border: 2px solid #575757;
border-radius: 8px;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;

} 
        html, body {
    height: 100%;
    margin: 0;
    padding: 0; 
}
        .classname {
       -moz-box-shadow:inset -2px 2px 25px -4px #dbd0db;
       -webkit-box-shadow:inset -2px 2px 25px -4px #dbd0db;
       box-shadow:inset -2px 2px 25px -4#dbd0db;
       background-color:#161694;
       -moz-border-radius:6px;
       -webkit-border-radius:6px;
       border-radius:6px;
       border:5px solid #1a34b8;
       display:inline-block;
       color:#f2e9f2;
       font-family:Arial Black;
       font-size:17px;
       font-weight:bold;
       padding:6px 26px;
       text-decoration:none;
}.classname:hover {
       background-color:#4ed6e0;
}.classname:active {
       position:relative;
       top:1px;
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
 
#container {
    min-height: 100%;
    width: 100%; 
}
        .auto-style9 {
            text-decoration: underline;
        }
        </style>

   <script >
       window.onload = function () {
           var lbl = document.getElementById('container');
           if (navigator.userAgent.indexOf("Firefox") != -1)
               lbl.style.background = "-moz-linear-gradient(top,  #FFFFFF,  #92ABEF)";
           else if (navigator.userAgent.indexOf("Chrome") != -1)
               lbl.style.background = "-webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#92ABEF))";
           else if (navigator.userAgent.indexOf("MSIE") != -1)
               lbl.style.filter = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFFFFF', endColorstr='#92ABEF');";
       };


    </script>
    
</head>
<body>
    <form id="container" runat="server" style="background-color:#98AFC7">
        <script type="text/javascript">

            function Close() {
                var session = '<%=Session["isSaved"]%>';
            if (session == 0) {
                var result = confirm("Continue Application without saving data will lead to loss of data. Kindly Save/Submit before continue. Press Ok to Continue");
                if (!result) {
                    return false;
                }
                else {
                    return true;
                }
            }
            }
            $("#ImageButton1").button();
            $("#ImageButton2").button();
            $("#ImageButton3").button();
            $("#btnSave").button();
            $("#btnSubmit").button();
            $("#btnClose").button();
            $(function () {
                $("#DateofJoiningTextBox").datepicker();
                
            });
            $(function () {
                $("#ToTextBox").datepicker();
                
            });
            $(function () {
                $("#FromTextBox").datepicker();

            });
            //$(function () {
            //    $("#ToTextBox").datepicker();
            //});

        </script>
        <script>
            function isValidDate(date) {
                var doj = document.getElementById("<%= DateofJoiningTextBox.ClientID %>").value;
                var from = document.getElementById("<%= FromTextBox.ClientID %>").value;
                var to = document.getElementById("<%= ToTextBox.ClientID %>").value;
                var matchesdoj = /^(\d{2})[-\/](\d{2})[-\/](\d{4})$/.exec(date);
                var matchesf = /^(\d{2})[-\/](\d{2})[-\/](\d{4})$/.exec(date);
                var matchest = /^(\d{2})[-\/](\d{2})[-\/](\d{4})$/.exec(date);
                if (matchesdoj == null) return false;
                if (matchesf == null) return false;
                if (matchest == null) return false;
                return true;
            }
        </script>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <table border="0" style="width:100%">
            <tr><td><asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server"/></td><td style="width:20%"></td>
                
                <td align="center" >
                    <asp:Button ID="ImageButton1"  OnClick="BtnSave_Click" runat="server" Text="Save" Width="75px"/>
                    <asp:Button ID="ImageButton2"   OnClick="BtnSubmit_Click" Enabled="false" runat="server" Text="Submit" Width="75px"/>
                    <asp:Button ID="ImageButton3"  OnClick="Next_Click" OnClientClick="return Close();" runat="server" Text="Continue" Width="75px"/>
                </td>
                
                <td style="font-family:Verdana;width:40%;color:darkblue" align="right" >
                    Welcome! <asp:Label ID="name" runat="server" style="color:darkblue"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" Text="Log Out" OnClick="logout_Click" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        
       <fieldset style="margin-left:200px;margin-right:200px;border-color:darkblue;background-color:#CAD6F7">
        <div align="center" style="text-decoration:underline;color:darkblue"><strong style="font-family:Verdana;font-size:14pt;color:darkblue" >Perfomance Appraisal for the year 2011-12 and Objective Setting for 2012-13</strong> </div> 
         <br /><br />
        <table   border="0" style="width: 525px" align="center">
            <tr>
                <td colspan="2">
                    <asp:Label ID="NameTextBoxLabel" AssociatedControlID="NameTextBox" runat="server" Text="Name" style="font-weight:500; font-family:Verdana;color:darkblue" />
                    <td ></td>
                </td>  <td style="width:40%" align="right"> <asp:TextBox BorderStyle="Inset" CssClass="twitterStyleTextbox" ForeColor="#000000" ID="NameTextBox" runat="server" style="width:180px"/>
                    </td>
                
               
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="DateofJoining" AssociatedControlID="DateofJoiningTextBox" runat="server" Text="Date of Joining" style="font-weight:500; font-family:Verdana;color:darkblue"/>
                </td>
                <td></td>
                <td width="50%" align="right">   
                    <asp:TextBox ID="DateofJoiningTextBox" style="font-family:verdana;border-color:darkblue" BorderStyle="Inset" runat="server"  CssClass="twitterStyleTextbox" Height="16px" Width="180px" Enabled="false"/>
                </td>
                
            </tr>
            
            <tr>
                <td >
                    <asp:Label ID="AppraiserLabel" AssociatedControlID="AppraiserTextBox" runat="server" Text="Appraiser" style="font-weight:500; font-family:Verdana;color:darkblue"/>
                </td>
                <td>
                    <asp:TextBox ID="AppraiserTextBox" runat="server" CssClass="twitterStyleTextbox" align="right" Height="16px" BorderStyle="Inset" Enabled="false" Width="170px" style="font-family:verdana;border-color:darkblue"/>
                </td>
           
            
                <td style="width:20%" align="right">
                    <asp:Label ID="ReviewerLabel" AssociatedControlID="ReviewerTextBox" runat="server" Text="Reviewer" style="font-weight:500; font-family:Verdana;color:darkblue" />
                </td>
                <td align="right">
                    <asp:TextBox ID="ReviewerTextBox" runat="server" CssClass="twitterStyleTextbox" Height="16px" width="180px" BorderStyle="Inset" Enabled="false" style="font-family:verdana;border-color:darkblue"/>
                </td>
            </tr>
            <tr>
                <td ></td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <asp:Label ID="AppraisalPeriodLabel" runat="server" Text="Appraisal Period:" style="font-weight:500; font-family:Verdana;color:darkblue"/>
                </td>
                
                
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="Fromlabel" AssociatedControlID="FromTextBox"  runat="server" Text="From" style="font-weight:500; font-family:Verdana;color:darkblue" />
                </td>
                <td>
                    <asp:TextBox ID="FromTextBox" runat="server" CssClass="twitterStyleTextbox" Height="16px" width="170px" BorderStyle="Inset" style="font-family:verdana;border-color:darkblue"/>
                </td>
            
                <td align="right">
                    <asp:Label ID="Tolabel" AssociatedControlID="ToTextBox" runat="server" Text="To" style="font-weight:500; font-family:Verdana;color:darkblue" />
                </td>
                <td class="auto-style8" align="right">
                    <asp:TextBox ID="ToTextBox" runat="server" CssClass="twitterStyleTextbox" BorderStyle="Inset" Width="180px" Height="16px" style="font-family:verdana;border-color:darkblue"/>
                </td>
            </tr>
            <tr>
                
                <td>
                    <asp:Label ID="Label1"  runat="server" Text="Role" style="font-weight:500; font-family:Verdana;color:darkblue"/>
                </td>
                <td align="right">
                    <asp:TextBox ID="Role" runat="server" style="font-family:Verdana;width:170px;border-color:darkblue" CssClass="twitterStyleTextbox" BorderStyle="Inset" Enabled="false"/>
                </td>
            </tr>
        </table>
        <div align="center" style="background-color:#CAD6F7"><br />
            <asp:Label ID="StateyourunderstandingonprimeresponsibilitiesasyourroleLabel" runat="server" Text="State your understanding on prime responsibilities as your role" style="font-weight:500; font-family:Verdana;color:darkblue"/><br />
            <br />
            <asp:TextBox ID="Understanding" TextMode="MultiLine" runat="server" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" Height="119px" Width="524px" style="font-family:Verdana;border-color:darkblue" CssClass="txtbox"/>
            <br />
            <br />
        </div>
        <div align="center" style="background-color:#CAD6F7">
            <asp:Label ID="AdditionalResponsibilitiesUndertakenLabel" runat="server" Text="Additional Responsibilities Undertaken" style="font-weight:500; font-family:Verdana;color:darkblue"/><br />
            <br />
            <asp:TextBox ID="Responsibility" TextMode="MultiLine" runat="server" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" Height="119px" Width="524px" style="font-family:Verdana;border-color:darkblue" CssClass="txtbox"/>
        </div>
        <br /></fieldset><br /><br /><br />
        <table border="0" style="width:100%">
        <div>
            <tr><td style="width:40%"></td>
                <td align="left" >
                    <asp:Button ID="btnSave"  OnClick="BtnSave_Click" runat="server" Text="Save" Width="75px"/>
                    <asp:Button ID="btnSubmit" Enabled="false" OnClick="BtnSubmit_Click" runat="server" Text="Submit" Width="75px"/>
                    <asp:Button ID="btnClose"  OnClick="Next_Click" OnClientClick="return Close();" runat="server" CssClass="button" Text="Continue" Width="75px"/>
                </td>
            </tr>
        </div>
        </table>
    </form>
</body>
</html>
