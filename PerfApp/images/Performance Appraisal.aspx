<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Performance Appraisal.aspx.cs" Inherits="PerfApp.Performance_Appraisal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Performance Appraisal</title>
    <script type="text/javascript" src="script.js"></script>

    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->
    <style type="text/css">
        .auto-style2 {
            width: 319px;
        }
        .auto-style4 {
            width: 121px;
        }
        .auto-style5 {
            height: 10px;
            width: 121px;
        }
        .auto-style6 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
        }
        .auto-style7 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: medium;
        }
        .auto-style8 {
            font-weight: normal;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
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
        <div style="margin-right: 0px">
            <div id="Div1" />
                <span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong class="auto-style8">Perfomance Appraisal for the year 2011-12 and Objective Setting for 2012-13</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br class="auto-style7" />
                <span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome!&nbsp;&nbsp;</span><asp:Label ID="name" runat="server" CssClass="auto-style7" />
                <span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><asp:LinkButton ID="logout" Text="Log Out" OnClick="logout_Click" runat="server" CssClass="auto-style7" />
                <br />
                   
        
                    
        </div>
        <div style="width:100%" align="center"><asp:Button ID="btnSave0" OnClick="btnSave_Click" runat="server" Text="Save"/><asp:Button ID="btnSubmit0" OnClick="btnSubmit_Click" runat="server" Text="Submit"/><asp:Button ID="btnClose0" OnClick="btnNext_Click" runat="server" Text="Continue"/>
           </div>
        <fieldset style="width: 447px">
            <br />
        <table>
            
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:Label ID="NameTextBoxLabel" AssociatedControlID="NameTextBox" runat="server" Text="Name" CssClass="auto-style6" />
                </td>
              
                <td colspan="2">
                    <asp:TextBox align="right" ID="NameTextBox" runat="server" Width="130px" />
                </td>
            </tr>
          
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:Label ID="DateofJoining" AssociatedControlID="DateofJoiningTextBox" runat="server" Text="Date of Joining" CssClass="auto-style6" />
                </td>
                <td colspan="2">
                    <asp:TextBox align="right" ID="DateofJoiningTextBox"  runat="server"  Width="130px" /><ajaxtoolkit:calendarextender runat="server" ID="calExtender1" Format="dd/MM/yyyy" TargetControlID="DateofJoiningTextBox"/>
                </td>
            </tr>
            </table>
            </fieldset>
        <br />
            <br />
        <fieldset style="width: 447px">
            <br />
        <table>
          
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="AppraiserLabel" AssociatedControlID="AppraiserTextBox" runat="server" Text="Appraiser" CssClass="auto-style6" />
                </td>
                <td>
                    <asp:TextBox ID="AppraiserTextBox" runat="server"  Width="130px" />
                </td>
           
            
                <td>
                    <asp:Label ID="ReviewerLabel" AssociatedControlID="ReviewerTextBox" runat="server" Text="Reviewer" CssClass="auto-style6" />
                </td>
                <td>
                    <asp:TextBox ID="ReviewerTextBox" runat="server"  Width="130px" style="margin-left: 0px" />
                </td>
            </tr>
            
            <tr>
                <td class="auto-style4">
                    <br />
                    <asp:Label ID="AppraisalPeriodLabel" runat="server" Text="Appraisal Period" CssClass="auto-style6" />
                    <br />
                </td>
            </tr>
            
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Fromlabel" AssociatedControlID="FromTextBox"  runat="server"   Text="From" CssClass="auto-style6" />
                </td>
                <td>
                    <asp:TextBox ID="FromTextBox" runat="server" Width="130px" /><ajaxtoolkit:calendarextender runat="server" ID="Calendarextender1" TargetControlID="FromTextBox" Format="dd/MM/yyyy"/>
                </td>
            
                <td>
                    <asp:Label ID="Tolabel" AssociatedControlID="ToTextBox" runat="server" Text="To" CssClass="auto-style6" />
                </td>
                <td>
                    <asp:TextBox ID="ToTextBox" runat="server" Width="130px" /><ajaxtoolkit:calendarextender runat="server" ID="Calendarextender2" TargetControlID="ToTextBox" Format="dd/MM/yyyy"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
            </tr>
       
     </table>
            </fieldset><br />
            <br />
        <fieldset style="width: 447px">
            <br />
         <table>
             <tr><td class="auto-style6">   State your understanding on prime responsibilities as your role</td></tr>
             <tr><td> <asp:TextBox ID="sg" runat="server" Width="432px" TextMode="MultiLine"  /></td></tr>
        
          <tr><td class="auto-style6"> Additional Responsibilities Undertaken</td></tr>
          <tr><td>  <asp:TextBox ID="Res" TextMode="MultiLine" runat="server"  Width="431px" /></td></tr>
                
           
           
       

         
            </table>
        </fieldset>
            <br />
            <br />
                   
        
                     <div style="width:100%" align="center"><asp:Button ID="Button1" OnClick="btnSave_Click" runat="server" Text="Save"/><asp:Button ID="Button2" OnClick="btnSubmit_Click" runat="server" Text="Submit"/><asp:Button ID="Button3" OnClick="btnNext_Click" runat="server" Text="Continue"/>
           </div>
    </form>
</body>
</html>
