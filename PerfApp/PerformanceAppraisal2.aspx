<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerformanceAppraisal2.aspx.cs" Inherits="PerfApp.PerformanceAppraisal2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
     <script type="text/javascript" src="script.js"></script>
    <link href="css/cupertino/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <link type="text/css" rel="Stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />

<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.5.js"></script> 

     <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/jquery-ui.js"></script><link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />


    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    
    <title>Performance Appraisal</title>
    
    <script type="text/javascript" src="script.js"></script>

    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->
    <style type="text/css">
        .button_100 {
        }
        fieldset {
border: 2px solid #575757;
border-radius: 8px;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;

} 
        .CustomComboBoxStyle .ajax__combobox__textboxcontainer input {
            background-color: #F2F2F2;
            border: solid 1px #D4D4D4;
            border-right: none;
        }

        .CustomComboxStyle .ajax_buttonContainer button {
            border: solid 1px #B6B6B6;
        }
        .ui-datepicker { width: 12em; padding: .2em .2em 0; display: none; }
.ui-datepicker table {width: 100%; font-size: .7em; border-collapse: collapse; margin:0 0 .4em; }

        #accordion .ui-accordion-header a {  
        color: #fff;  
        line-height: 42px;  
        display: block;  
        font-size: 12pt;  
        width: 100%;  
        text-indent: 10px;  
    }  
            
       
        .txtbox {
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

        
        .ajax__myTab .ajax__tab_header { font-family: verdana; font-size: 16px; border-bottom: solid 1px #aaaaaa } 
.ajax__myTab .ajax__tab_outer { padding-right: 2px; height: 20px; background-color: #C0C0C0; margin-right: 1px; border-right: solid 2px #666666; border-top: solid 1px #999999 } 
.ajax__myTab .ajax__tab_inner { padding-left: 3px; background-color: #CAD6F7; }
 .ajax__myTab .ajax__tab_tab { height: 16px; padding: 4px; margin: 0; } 
 .ajax__myTab .ajax__tab_hover .ajax__tab_outer { background-color: #cccccc }
  .ajax__myTab .ajax__tab_hover .ajax__tab_inner { background-color: #cccccc }
   .ajax__myTab .ajax__tab_hover .ajax__tab_tab { background-color:azure; } 
   .ajax__myTab .ajax__tab_active .ajax__tab_outer { background-color: #fff; border-left: solid 1px #999999; }
    .ajax__myTab .ajax__tab_active .ajax__tab_inner { background-color:#fff; } 
    .ajax__myTab .ajax__tab_active .ajax__tab_tab { }
     .ajax__myTab .ajax__tab_body { font-family: verdana; font-size: 11pt; color: red; border: 0px solid #000000; padding: 6px; background-color: #ffffff; }
        .auto-style1 {
            width: 59%;
            height: 38px;
        }
        .auto-style2 {
            height: 38px;
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
    </style>
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
    </script>

</head>

<body>
    <form id="form1" runat="server" style="height: 100%">
        <AjaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server"></AjaxToolkit:ToolkitScriptManager>
        <script type="text/javascript">

            function Close() {
                var session = '<%=Session["isSaved"]%>';
                if (session == 0) {
                    var result = confirm("Closing Application without saving data will lead to loss of data. Kindly Save/Submit before closing. Press Ok to Close");
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
                $("#DateSelfAssessment0").datepicker();

            });
            $(function () {
                $("#AssessmentDiscussion0").datepicker();

            });
            $(function () {
                $("#AssessorCompletion0").datepicker();

            });
            $(function () {
                $("#Finalization0").datepicker();
                $("#accordion").accordion();
            });
           
        </script>
        <div class="grid_16 Appraisal_header">
            <table border="0">
                <tr>
                    <td>
                        <asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server" /></td>
                    <td style="width: 25%" />

                    <td style="width: 25%" align="center">
                        <asp:Button ID="ImageButton1" OnClick="btnSave_Click" runat="server" Text="Save" Width="75px" />
                        <asp:Button ID="ImageButton2" OnClick="btnSubmit_Click" runat="server" Text="Submit" Width="75px" />
                        <asp:Button ID="ImageButton3" OnClick="btnClose_Click" OnClientClick="return Close();" runat="server" Text="Close" Width="75px" />
                    </td>
                    <td style="font-family: Verdana; font-size: 14px; width: 50%;color:darkblue" align="right">Welcome!&nbsp;<asp:Label ID="name" runat="server" Style="font-family: Verdana; font-size: 14px;color:darkblue" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" Text="Log Out" OnClick="logout_Click" runat="server" Style="font-family: Verdana; font-size: 14px" /></td>

                </tr>
            </table>
           <fieldset style="color:darkblue;border-color:darkblue;margin-right:50%"> <legend align="left" style="font-family:Verdana;font-size:20px;font-weight:500;text-decoration:underline;font-weight:900;color:darkblue;text-decoration-color:darkblue">Rating Scale</legend><table>
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Extraordinary - 5;" style="font-family:Verdana;font-size:15px"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Exemplary+ - 4;" style="font-family:Verdana;font-size:15px"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Exemplary - 3;" style="font-family:Verdana;font-size:15px"/>&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label4" runat="server" Text="Enabler+ - 2;" style="font-family:Verdana;font-size:15px" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Enabler - 1." style="font-family:Verdana;font-size:15px"/>

                    </td>
                     </tr>
            </table></fieldset>
            <br />
           
        </div>
        <br />



        <strong style="font-size: larger; font-family: Verdana;color:darkblue;text-decoration:underline;text-decoration-color:darkblue">Rate your score in the below areas<br />
        </strong>
        <table style="width: 1331px">
            <tr>
            </tr>
        </table><br />
        <div id="accordion">
            <h3>Skills</h3>
                    <div>
                        <p>
                    <table border="0" style="width: 100%; background-color: #CAD6F7" id="tabs-1">
                        <tr>
                            <td></td>
                            
                            <td colspan="2" align="center" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Self</td>
                            <td colspan="2" align="center" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Assessor</td>
                        </tr>

                        <tr>
                            
                            <td></td>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Rate</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Comments</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Rate</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Comments</th>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">New Skills Acquired</td>
                            
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="Newskillacq0" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" Style="font-family: Verdana" CssClass="ajax__combobox__textboxcontainer" />
                            </th>

                            <td align="center">

                                <asp:TextBox ID="Newskillacq1" TextMode="MultiLine" runat="server" CssClass="txtbox" Style="font-family: Verdana" Width="161px" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="Newskillacq2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" Style="font-family: Verdana" />
                            </th>
                            <td align="center">

                                <asp:TextBox ID="Newskillacq3"  TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Skill Improvisation</td>
                            
                            <th class="auto-style34" style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="SkillImprovisation0" runat="server" AutoCompleteMode="SuggestAppend" Style="font-family: Verdana" Width="150px" />
                            </th>
                            <td align="center">

                                <asp:TextBox ID="SkillImprovisation1" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="SkillImprovisation2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" Style="font-family: Verdana" />
                            </th>
                            <td align="center">

                                <asp:TextBox ID="SkillImprovisation3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Innovative Thoughts / Solution Provided</td>
                            
                            <th class="auto-style34" style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="InnovativeThoughts0" Style="font-family: Verdana" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </th>
                            <td align="center">
                                <asp:TextBox ID="InnovativeThoughts1" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="InnovativeThoughts2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" Style="font-family: Verdana" />
                            </th>
                            <td align="center">
                                <asp:TextBox ID="InnovativeThoughts3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
                        </tr>
                    </table>
                            </p>
                        </div>
                <h3>Certifications</h3>
                    <div>
                        <p>
                    <table style="width: 100%; background-color: #CAD6F7" id="tabs-2" border="0">
                        <tr>
                            
                            <td style="width: 29%"></td>
                            <td colspan="2" align="center" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Self</td>
                            <td colspan="2" align="center" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Assessor</td>

                        </tr>
                        <tr>
                            <td></td>
                            
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Rate</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Comments</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Rate</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Comments</th>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Certifications Achieved - Generic</td>
                            
                            <th class="auto-style34" style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="CertificationsAchievedGeneric0" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </th>
                            <td align="center">
                                <asp:TextBox ID="CertificationsAchievedGeneric1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" /></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="CertificationsAchievedGeneric2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" Style="font-family: Verdana" />
                            </th>
                            <td align="center">
                                <asp:TextBox ID="CertificationsAchievedGeneric3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" /></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Certifications Achieved - Product</td>
                            
                            <th class="auto-style34" style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="CertificationsAchievedProduct0" runat="server" Width="150px" Style="font-family: Verdana" AutoCompleteMode="SuggestAppend" />
                            </th>
                            <td align="center">
                                <asp:TextBox ID="CertificationsAchievedProduct1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" /></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="CertificationsAchievedProduct2" runat="server" Style="font-family: Verdana" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </th>
                            <td align="center">
                                <asp:TextBox ID="CertificationsAchievedProduct3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" runat="server" CssClass="txtbox" Width="161px" Style="font-family: Verdana" /></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Certifications Achieved - Management</td>
                            
                            <th class="auto-style34" style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="CertificationsAchievedManagement0" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </th>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="CertificationsAchievedManagement1" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="CertificationsAchievedManagement2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </th>
                            <td align="center">
                                <asp:TextBox Style="font-family: Georgia" ID="CertificationsAchievedManagement3" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                        </tr>
                    </table>
                            </p>
                        </div>
               <h3>Knowledge Enhancement</h3>
                    <div>
                        <p>
                    <table style="width: 100%; background-color: #CAD6F7" id="tabs-3" border="0">

                        <tr>
                            
                            <td style="width: 29.2%"></td>
                            <td colspan="2" align="center" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Self</td>
                            <td colspan="2" align="center" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Assessor</td>

                        </tr>
                        <tr>
                            
                            <td style="width: 8.3%"></td>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Rate</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Comments</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Rate</th>
                            <th style="font-family: Verdana; font-size: 14px;color:darkblue">Comments</th>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Knowledge Sharing Sessions / Contribution</td>
                            
                            <th style="vertical-align: top" align="center">

                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="KnowledgeSharingSessions0" runat="server" Width="150px" />
                            </th>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="KnowledgeSharingSessions1" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="KnowledgeSharingSessions2" runat="server" Width="150px" />
                            </th>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="KnowledgeSharingSessions3" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">White Papers</td>
                            
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="WhitePapers0" runat="server" Width="150px" />
                            </th>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="WhitePapers1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" runat="server" Width="161px" /></td>
                            <th style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="WhitePapers2" runat="server" Width="150px" />
                            </th>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="WhitePapers3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" runat="server" Width="161px" /></td>
                        </tr>
                    </table></p></div>
                <h3>Soft Skills</h3>
                    <div>
                        <p>
                    <table border="0" style="width: 100%; background-color: #CAD6F7" id="tabs-4">
                        <tr>
                            <td style="width: 12%"></td>
                            <td></td>
                            <th colspan="2" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Self</th>
                            <th colspan="2" style="font-family: Verdana; font-weight: 600;font-size:17px;color:darkblue">Assessor</th>

                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="font-family: Verdana; font-size: 14px; font-weight: 600;color:darkblue" align="center">Rate</td>
                            <td style="font-family: Verdana; font-size: 14px; font-weight: 600;color:darkblue" align="center">Comments</td>
                            <td style="font-family: Verdana; font-size: 14px; font-weight: 600;color:darkblue" align="center">Rate</td>
                            <td style="font-family: Verdana; font-size: 14px; font-weight: 600;color:darkblue" align="center">Comments</td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Self Motivating</td>
                            <td style="width: 17%"></td>
                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox ID="SelfMotivating0" Style="font-family: Verdana" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="SelfMotivating1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" Width="161px" runat="server" /></td>
                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="SelfMotivating2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="SelfMotivating3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" runat="server" Width="161px" AutoCompleteMode="SuggestAppend" /></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue" colspan="2">Attitude</td>

                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="Attitude0" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="Attitude1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" Width="161px" runat="server" /></td>
                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="Attitude2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="Attitude3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" runat="server" Width="161px" /></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue" colspan="2">Commitment</td>

                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="Commitment0" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="Commitment1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" Width="161px" runat="server" /></td>
                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana; font-weight: 200" ID="Commitment2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="Commitment3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" runat="server" Width="161px" /></td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue" colspan="2">Communication</td>

                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="Communication0" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="Communication1" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" Width="161px" runat="server" /></td>
                            <td style="vertical-align: top" align="center">
                                <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="Communication2" runat="server" Width="150px" AutoCompleteMode="SuggestAppend" />
                            </td>
                            <td align="center">
                                <asp:TextBox Style="font-family: Verdana" ID="Communication3" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" runat="server" Width="161px" /></td>
                        </tr>
                    </table>
                            </p>
                        </div>
               </div>
        <br />
        <table border="0" style="width: 100%" id="reviewerTable" runat="server">
            <tr>
                <td>Reviewer Rating
                </td>
                <td style="width: 5.25%"></td>
                <td align="center">
                    <AjaxToolkit:ComboBox ID="ReviewerRating" runat="server" Width="158px" />
                </td>
                <td>Reviewer Comment
                </td>
                <td align="center">
                    <asp:TextBox ID="ReviewerComment" runat="server"  BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox"/>
                </td>
            </tr>
            <tr hidden="true">
                <td style="width: 20%"><strong style="font-family: Verdana; font-size: 14px;color:darkblue">Total Rating(In Percentage)</strong></td>

                <td align="right" style="width: 25%">
                    <asp:TextBox Style="font-family: Verdana" ID="TotalRating0" CssClass="txtbox" Width="161px" runat="server" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" />
                </td>

                <td align="right" style="width: 26.5%">
                    <asp:TextBox Style="font-family: Verdana" ID="TotalRating2" CssClass="txtbox" Width="161px" runat="server" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/>
                </td>

                <td align="right">
                    <asp:TextBox Style="font-family: Verdana" ID="TotalRating4" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" CssClass="txtbox" Width="161px" runat="server" TextMode="MultiLine" />
                </td>
                <td style="width: 2.6%"></td>
            </tr>
        </table>
        <table style="width: 100%" border="0">
            <tr>
                
                <td style="width: 49.5%">
                    <table style="width: 100%" border="0">
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px; color:darkblue" class="auto-style1">Date of Self Assessment
                            </td>
                            <td class="auto-style2"></td>
                            <td align="left" class="auto-style2">
                                <asp:TextBox Style="font-family: Verdana" ID="DateSelfAssessment0" runat="server" CssClass="twitterStyleTextbox" Height="30px" Width="175px" BorderColor="#336633" BorderStyle="Inset" />
                              

                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Date of Assessment Discussion
                            </td>
                            <td style="width:5.3%"></td>
                            <td align="left">
                                <asp:TextBox ID="AssessmentDiscussion0" BorderStyle="Inset" ForeColor="#000000" Style="font-family: Verdana" runat="server" CssClass="twitterStyleTextbox" Height="30px" Width="175px" />
                               
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Date of Assessor Completion
                            </td>
                            <td></td>
                            <td align="left">
                                <asp:TextBox ID="AssessorCompletion0" BorderStyle="Inset" ForeColor="#000000" Style="font-family: Verdana" runat="server" CssClass="twitterStyleTextbox" Height="30px" Width="175px" />
                              
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Verdana; font-size: 14px;color:darkblue">Date of Finalization
                            </td>
                            <td></td>
                            <td align="left">
                                <asp:TextBox Style="font-family: Verdana" ID="Finalization0" BorderStyle="Inset" ForeColor="#000000" runat="server" CssClass="twitterStyleTextbox" Height="30px" Width="175px" />
                               
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family: Verdana; font-size: 14px;color:darkblue" border="1">Self Assessment Phase: 01-Jun-12 to 10-Jun-12<br />
                    Completion of Assessor & Discussion Phase: 11-Jun-12 to 20-Jun-12<br />
                    Review & Appraisal Finalization Phase: 21-Jun-12 to 25-Jun-12

                </td>
            </tr>


        </table>
        <br />

        <table style="width: 100%" border="0">
            <tr>
                
                <td style="width: 10%"><strong style="font-family: Verdana; font-size: 14px;width:30%;color:darkblue">Overall Rating</strong></td><td style="width:5.3%"></td>
                <td></td>
                

            </tr>
            <tr>
                
                <td style="font-family: Verdana; font-size: 14px;color:darkblue">Self Assessment</td>
                <td style="width:21.4%"></td>
                <td>
                    <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="SelfAssessment0" runat="server" Width="152px" AutoCompleteMode="SuggestAppend" />
                </td>
            </tr>
            <tr>
                
                <td style="font-family: Verdana; font-size: 14px;color:darkblue">Assessor Rating</td>
                <td></td>
                <td>
                    <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="AssessorRating0" runat="server" Width="152px" AutoCompleteMode="SuggestAppend" />
                </td>
            </tr>
            <tr>
                
                <td style="font-family: Verdana; font-size: 14px;color:darkblue">Finalized Rating</td>
                <td></td>
                <td>
                    <AjaxToolkit:ComboBox Style="font-family: Verdana" ID="FinalizedRating" runat="server" Width="152px" AutoCompleteMode="SuggestAppend" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <table border="0" id="Promotion" runat="server">
            <tr>
                <td class="auto-style44" style="width: 5%"><strong style="font-family: Verdana; font-size: 14px;color:darkblue">Recommended for Promotion</strong></td>
                <td style="width: 17%"></td>
                <th class="auto-style48">
                    <asp:TextBox Style="font-family: Verdana" ID="RecommendedforPromotion0" runat="server" CssClass="txtbox" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></th>

                <th class="auto-style47" style="font-family: Verdana; font-size: 14px;color:darkblue">Weightage</th>
                <td style="width: 20%"></td>
                <td class="auto-style46" style="width: 16%">
                    <asp:TextBox ID="Weightage0" Style="font-family: Verdana" runat="server" CssClass="txtbox" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/></td>
            </tr>
            <tr style="height: 15px"></tr>
            <tr>

                <td  style="width: 5%"><strong style="font-family: Verdana; font-size: 14px;color:darkblue">Reasons for not promoting</strong></td>
                <td></td>
                <td  align="center">
                    <asp:TextBox ID="notpromoting0" Style="font-family: Verdana" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="160px" /></td>
            </tr>
        </table>
        <br />
        <table style="width: 100%" border="0">
            <tr>
                <td align="center">
                    <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Save" Width="75px" />
                    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" Width="75px" />
                    <asp:Button ID="btnClose" OnClick="btnClose_Click" OnClientClick="return Close();" runat="server" Text="Close" Width="75px" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="Finish" runat="server" ForeColor="Red" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

