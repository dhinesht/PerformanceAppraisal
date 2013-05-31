<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfappraisal.aspx.cs" Inherits="PerfApp.Perfappraisal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <script type="text/javascript" src="script.js"></script>
    <link href="css/cupertino/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
   
    <style type="text/css">

        fieldset {
border: 2px solid #575757;
border-radius: 8px;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;

} 
        .ui-datepicker { width: 10em; padding: .2em .2em 0; display: none; }
.ui-datepicker table {width: 100%; font-size: .7em; border-collapse: collapse; margin:0 0 .3em; }
       
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

 

        
            
    </style>
    <title></title>
    <script>
        window.onload = function () {
            var lbl = document.getElementById('form1');
            if (navigator.userAgent.indexOf("Firefox") != -1)
                lbl.style.background = "-moz-linear-gradient(top,  #FFFFFF,  #92ABEF)";
            else if (navigator.userAgent.indexOf("Chrome") != -1)
                lbl.style.background = "-webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#92ABEF))";
            else if (navigator.userAgent.indexOf("MSIE") != -1)
                lbl.style.filter = "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFFFFF', endColorstr='#92ABEF');";
        };
        $("#ImageButton1").button();
        $("#ImageButton2").button();
        $("#ImageButton3").button();
        $("#btnSave").button();
        $("#btnSubmit").button();
        $("#btnClose").button();
        $("#mylabel").mouseover(function () {
            $(this).text($(this).data('replace'));
        });
        $(function () {
            $("#LearningPurchasing1").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#SkillImprovisation2").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#Formulatingthedesignforhandling0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#OraclePreSales0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#OCPINV0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#CertificationsToBeAchievedManagement2").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#PrepartaionofIndepth0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#ImplementationconsiderationforINV0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#TeamBuilding0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#HighlyPositive0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#CustomerDelight0").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#Communication2").datepicker({ dateFormat: 'dd-mm-yy' });
            

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <table border="0" style="width:100%">
            <tr><td><asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server"/></td><td style="width:20%"></td>
                
                <td align="center" >
                    <asp:Button ID="ImageButton1"  runat="server" Text="Save" Width="75px"/>
                    <asp:Button ID="ImageButton2"   runat="server" Text="Submit" Width="75px"/>
                    <asp:Button ID="ImageButton3"  runat="server" Text="Continue" Width="75px"/>
                </td>
                
                <td style="font-family:Verdana;width:40%;color:darkblue" align="right" >
                    Welcome! <asp:Label ID="name" runat="server" style="color:darkblue"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" Text="Log Out" runat="server" />
                </td>
            </tr>
        </table>
  <table width="100%"><tr>
       
            <td style="font-family:Verdana;font-weight:bold;color:darkblue;text-decoration:underline;text-decoration-color:darkblue" colspan="4" align="right"><label id="mylabel" 
       title="Set your targets and discuss with Assessor" 
       data-replace="Set your targets and discuss with Assessor">Info</label></td>
        </tr></table>
       <fieldset style="border-color:darkblue">  <table border="0" width="100%" cellspacing="0">
              
        <tr>
            <td  style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" >Skills</td>
            <td style="font-family:Verdana;color:white;font-weight:bold;background-color:darkblue" align="center">What new Skills you would like to Acquire and Improvise- Provide your inputs</td>
           <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Description</td>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Targetted Timeline</td>
 </tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">New Skill To be Acquired</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Newskillacq1" CssClass="twitterStyleTextbox"  Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">Learning Purchasing Contracts and Sourcing </td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="LearningPurchasing1" CssClass="twitterStyleTextbox"  Width="161px" runat="server" /></td>

        </tr>
         <tr>
            <td style="font-family:Verdana;color:darkblue">Skill Improvisation</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="SkillImprovisation0" CssClass="twitterStyleTextbox"  Width="161px" runat="server" /></td>
             <td align="center"><asp:TextBox Style="font-family: Verdana" ID="SkillImprovisation1" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="SkillImprovisation2" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Innovative Thoughts / Solution Provided</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="InnovativeThoughts0" TextMode="MultiLine" CssClass="twitterStyleTextbox"  Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">1. Formulating the design for handling disposal of scrap / Excess materials in  governement organizations<br />

2. Issuance of Materials if budget available for that department.</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Formulatingthedesignforhandling0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr></table></fieldset>
      <table>  <tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr></table>
       <fieldset style="border-color:darkblue"><table width="100%" cellspacing="0"> <tr>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue">Certification</td>
            <td style="font-family:Verdana;color:white;background-color:darkblue;font-weight:bold" align="center">What are the Certifications that you are planning to Acquire</td>
           <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Description</td>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Targetted Timeline</td>
  </tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Certifications To Be Achieved - Generic</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" CssClass="twitterStyleTextbox" ID="CertificationsToBeAchievedGeneric0"  Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">Oracle Pre Sales</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" CssClass="twitterStyleTextbox" ID="OraclePreSales0"  Width="161px" runat="server" /></td>

        </tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Certifications To Be Achieved - Product</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="CertificationsToBeAchievedproduct0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">OCP-INV and PO</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="OCPINV0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Certifications To Be Achieved - Management</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="CertificationsToBeAchievedManagement0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="CertificationsToBeAchievedManagement1" Width="161px" CssClass="twitterStyleTextbox" runat="server" /></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="CertificationsToBeAchievedManagement2"  Width="161px" CssClass="twitterStyleTextbox" runat="server" /></td>

        </tr></table></fieldset>
            <table> <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr></table>
    <fieldset style="border-color:darkblue"> <table width="100%" cellspacing="0">  <tr>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue">Knowledge Enhancement</td>
            <td align="center" style="font-family:Verdana;color:white;background-color:darkblue;font-weight:bold">How would you contribute towards Knowledge Management</td>
       <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Description</td>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Targetted Timeline</td>
   </tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Knowledge Sharing Sessions / Contribution</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" CssClass="twitterStyleTextbox" ID="KnowledgeSharingSessions0"  Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">Prepartaion of Indepth training material for INV and PUR.</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" CssClass="twitterStyleTextbox" ID="PrepartaionofIndepth0"  Width="161px" runat="server" /></td>

        </tr>
         <tr>
            <td style="font-family:Verdana;color:darkblue">White Papers to be Published</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="WhitePapers0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
                          <td align="center" style="font-family:Verdana;color:darkblue">Implementation consideration for INV and PO in Govt Organizations</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="ImplementationconsiderationforINV0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr></table></fieldset>
            <table> <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr></table>
      <fieldset style="border-color:darkblue"><table width="100%" cellspacing="0">   <tr>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue">Soft Skills</td>
            <td align="center" style="font-family:Verdana;color:white;background-color:darkblue;font-weight:bold">What are your plans towards improving your areas below</td>
      <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Description</td>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue" align="center">Targetted Timeline</td>
   </tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr>
      <tr>
            <td style="font-family:Verdana;color:darkblue">Self Motivating</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="SelfMotivating0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">Team Building and Motivating members</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="TeamBuilding0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Attitude</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Attitude0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">Highly Positive and result oriented</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="HighlyPositive0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Commitment</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Commitment0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
                          <td style="font-family:Verdana;color:darkblue" align="center">Customer Delight</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="CustomerDelight0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr>
        <tr>
            <td style="font-family:Verdana;color:darkblue">Communication</td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Communication0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Communication1" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Communication2" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>

        </tr></table></fieldset>
       <table>      <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr></table>
    <fieldset style="border-color:darkblue"> <table width="100%" cellspacing="0">    <tr>
            <td style="font-family:Verdana;font-weight:bold;color:white;background-color:darkblue">Other Areas</td>
            <td style="font-family:Verdana;color:white;background-color:darkblue;font-weight:bold" align="center">Provide your input on any other improvements that you would target </td>
           
        </tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td></tr>
             <tr><td></td><td></td><td></td><td></td></tr>
        <tr>
            <td></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Provideyourinput0" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            
        </tr>
        <tr>
            <td></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Provideyourinput1" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
           
        </tr>
        <tr>
            <td></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Provideyourinput2" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            
        </tr>
        <tr>
            <td></td>
            <td align="center"><asp:TextBox Style="font-family: Verdana" ID="Provideyourinput3" CssClass="twitterStyleTextbox" Width="161px" runat="server" /></td>
            
        </tr>
    </table></fieldset><br /><br />
        <table style="width: 100%" border="0">
            <tr>
                <td align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="75px" />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Width="75px" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" Width="75px" />
                </td>
            </tr>
            
        </table>
    </form>
</body>
</html>
