<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerformanceAppraisal2.aspx.cs" Inherits="PerfApp.PerformanceAppraisal2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Performance Appraisal</title>
    <script type="text/javascript" src="script.js"></script>

    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->
    <style type="text/css">
        .button_100 {
        }

               .CustomComboBoxStyle .ajax__combobox__textboxcontainer input{
    background-color:#F2F2F2;
    border:solid 1px #D4D4D4;
    border-right:none;
    }
        .CustomComboxStyle .ajax_buttonContainer button {
            background-color:#CACACA;
            border:solid 1px #B6B6B6;
        }
         .txtbox
        {
            background-color:#E4E4E4
        }
        .auto-style1 {
            width: 19%;
        }
        .auto-style2 {
            width: 30%;
        }
        .auto-style3 {
            width: 26%;
        }
        .auto-style4 {
            visibility: hidden;
            width: 920px;
        }
        .auto-style5 {
            width: 88%;
        }
       
        </style>
 
    <script>
        window.onload = function () {
            var lbl = document.getElementById('form1');
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
    <form id="form1" runat="server" style="height:100%">
        <AjaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server"></AjaxToolkit:ToolkitScriptManager>
        <script type="text/javascript">

            function Close() {
                var session = '<%=Session["isSaved"]%>';
                if (session == 0) {
                    var result = confirm("Closing Application without data will lead to loss of data. Kindlt Save/Submit before closing Press Ok to Close");
                    if (!result) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            }
        </script>
        <div class="grid_16 Appraisal_header">
            <table style="width: 100%;" border="0">
                <tr>
                    
                    <td width="80%" style="font-family:Verdana;font-size:14px" align="right">Welcome!<br /><asp:Label ID="name" runat="server" style="font-family:Verdana;font-size:14px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" Text="Log Out" OnClick="logout_Click" runat="server" style="font-family:Verdana;font-size:14px"/>
                    </td>
                     <td width="20%" >
                         <fieldset>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="RatingScale" runat="server" Text="Rating Scale" style="font-family:Verdana;font-size:14px" /></strong> 
                    <%--<Strong style="font-family:Verdana:font-size:14px" align="center">--%>
                         
                  <ul>
                      <li>5-->Extraordinary</li>
                      <li>4-->Exemplary+</li>
                      <li>3-->Exemplary</li>
                      <li>2-->Enabler+</li>
                      <li>1-->Enabler</li>
                  </ul>   
                
                </fieldset>
                
               
                <%--</Strong>--%>
                   
            </td>
                </tr>
                
                </table>
            </div>
                <br />
               
        <table  style="width: 100%">
                <tr>
                <td align="center" class="auto-style5">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" OnClick="btnSave_Click" ImageUrl="~/images/save.png" runat="server" Text="Save" Width="75px"/>
                    <asp:ImageButton ID="ImageButton2" OnClick="btnSubmit_Click" Enabled="false" ImageUrl="~/images/submit.png" runat="server" Text="Submit" Width="75px"/>
                    <asp:ImageButton ID="ImageButton3" OnClick="btnClose_Click" ImageUrl="~/images/close.png" OnClientClick="return Close();" runat="server" Text="Close" Width="75px"/>
                </td>
                   
            </tr>
        </table>                    
        <br />
       
        <strong style="font-size:larger;font-family:Verdana">Rate your score in the below areas<br />
        </strong>
        <table style="width: 1331px">
            <tr>
                            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Self-Rating</strong></td>
                <td class="auto-style3"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Assessor Rating</strong></td>
                <td style="font-family:Verdana"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reviewer Rating</strong></td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="auto-style28"><strong style="font-family:Verdana;font-size:14px">Skills</strong></td>
                <td class="auto-style31"></td>
                <th class="auto-style23" style="font-family:Verdana;font-size:14px">Rate</th>
                <th class="auto-style29" style="font-family:Verdana;font-size:14px">Comments</th>
                <th class="auto-style20" style="font-family:Verdana;font-size:14px">Rate</th>
                <th class="auto-style22" style="font-family:Verdana;font-size:14px">Comments</th>
                <th class="auto-style32" style="font-family:Verdana;font-size:14px">Rate</th>
                <th class="auto-style33" style="font-family:Verdana;font-size:14px">Comments</th>
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">New Skills Acquired</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
               <AjaxToolkit:ComboBox ID="Newskillacq0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana" CssClass="ajax__combobox__textboxcontainer"/>
                </th>
                <td class="auto-style33" style="vertical-align:top">


                    <asp:TextBox ID="Newskillacq1" TextMode="MultiLine" runat="server" CssClass="txtbox" style="font-family:Verdana" Width="161px"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="Newskillacq2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    
                    <asp:TextBox ID="Newskillacq3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="Newskillacq4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    
                    <asp:TextBox ID="Newskillacq5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" /></td>
               
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Skill Improvisation</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="SkillImprovisation0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    
                    <asp:TextBox ID="SkillImprovisation1" TextMode="MultiLine" runat="server" CssClass="txtbox"  Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="SkillImprovisation2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="SkillImprovisation3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="SkillImprovisation4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana" />
                </th>
                <td style="vertical-align:top">


                    <asp:TextBox ID="SkillImprovisation5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px"  style="font-family:Verdana" />
                </td>
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Innovative Thoughts / Solution Provided</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="InnovativeThoughts0" style="font-family:Verdana" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox ID="InnovativeThoughts1" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="InnovativeThoughts2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="InnovativeThoughts3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="InnovativeThoughts4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="InnovativeThoughts5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
            </tr>
            <tr>
                <td><strong style="font-family:Verdana;font-size:14px">Certification</strong></td>
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Certifications Achieved - Generic</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="CertificationsAchievedGeneric0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedGeneric1" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="CertificationsAchievedGeneric2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedGeneric3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="CertificationsAchievedGeneric4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedGeneric5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Certifications Achieved - Product</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="CertificationsAchievedProduct0" runat="server" Height="20px" Width="140px" style="font-family:Verdana" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedProduct1" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="CertificationsAchievedProduct2" runat="server" Height="20px" style="font-family:Verdana" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedProduct3" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana"/></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="CertificationsAchievedProduct4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" style="font-family:Verdana"/>
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedProduct5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Certifications Achieved - Management</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="CertificationsAchievedManagement0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Georgia" ID="CertificationsAchievedManagement1" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Georgia" ID="CertificationsAchievedManagement2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Georgia" ID="CertificationsAchievedManagement3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Georgia" ID="CertificationsAchievedManagement4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="CertificationsAchievedManagement5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td><strong style="font-family:Verdana;font-size:14px">Knowledge Enhancement</strong></td>
            </tr>
            <tr>
                <td style="font-family:Verdana:font-size:14px">Knowledge Sharing Sessions / Contribution</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="KnowledgeSharingSessions0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="KnowledgeSharingSessions1" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="KnowledgeSharingSessions2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="KnowledgeSharingSessions3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Georgia" ID="KnowledgeSharingSessions4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="KnowledgeSharingSessions5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">White Papers</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="WhitePapers0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="WhitePapers1" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="WhitePapers2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="WhitePapers3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="WhitePapers4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                   

                    
                    <asp:TextBox ID="WhitePapers5" TextMode="MultiLine" runat="server" CssClass="txtbox"  Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td><strong style="font-family:Verdana;font-size:14px">Soft Skills</strong></td>
            </tr>
            <tr>
                <td style="font-family:Verdana:font-size:14px">Self Motivating</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox ID="SelfMotivating0" style="font-family:Verdana" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="SelfMotivating1" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="SelfMotivating2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="SelfMotivating3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" AutoCompleteMode="SuggestAppend" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Georgia" ID="SelfMotivating4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="SelfMotivating5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Attitude</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Attitude0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="Attitude1" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Attitude2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="Attitude3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Attitude4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="Attitude5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Commitment</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Commitment0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th> 
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="Commitment1" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Commitment2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="Commitment3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Commitment4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="Commitment5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr>
                <td style="font-family:Verdana;font-size:14px">Communication</td>
                <td></td>
                <th class="auto-style34" style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Communication0" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td class="auto-style33" style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="Communication1" TextMode="MultiLine" CssClass="txtbox" Width="161px" runat="server" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Communication2" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox style="font-family:Verdana" ID="Communication3" TextMode="MultiLine" CssClass="txtbox" runat="server" Width="161px" /></td>
                <th style="vertical-align:top">
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="Communication4" runat="server" Height="20px" Width="140px" AutoCompleteMode="SuggestAppend" />
                </th>
                <td style="vertical-align:top">
                    

                    <asp:TextBox ID="Communication5" TextMode="MultiLine" runat="server" CssClass="txtbox" Width="161px" style="font-family:Verdana" />
                </td>
      
            </tr>
            <tr style="visibility:hidden">
                <td colspan="2"></td>
                <td>
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate total rating" OnClick="btnCalculate_Click"/>
                </td>
            </tr>
            <tr style="visibility:hidden">
                <td><strong style="font-family:Verdana;font-size:14px">Total Rating(In Percentage)</strong></td>
                <td></td>
                <th >
                    <asp:TextBox style="font-family:Verdana" ID="TotalRating0" CssClass="txtbox" Width="161px" runat="server" TextMode="MultiLine"  />
                </th>
                <td class="auto-style33">
                   </td>
                <th>
                    <asp:TextBox style="font-family:Verdana" ID="TotalRating2" CssClass="txtbox" Width="161px" runat="server" TextMode="MultiLine"  />
                </th>
                <td>
                   </td>
                <th>
                    <asp:TextBox style="font-family:Verdana" ID="TotalRating4" CssClass="txtbox" Width="161px" runat="server" TextMode="MultiLine" />
                </th>
            </tr>
        </table>
       
        <table style="width: 100%" border="0">
            <tr>
                <td style="width: 50%">
                    <table style="width: 100%">
                        <tr>
                            <td style="font-family:Verdana;font-size:14px">Date of Self Assessment
                            </td>
                            <td align="right">
                                <asp:TextBox style="font-family:Verdana" ID="DateSelfAssessment0" runat="server" CssClass="txtbox"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <AjaxToolkit:CalendarExtender runat="server" ID="Calendarextender1" TargetControlID="DateSelfAssessment0" Format="dd-MM-yyyy" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family:Verdana;font-size:14px">Date of Assessment Discussion
                            </td>
                            <td align="right">
                                <asp:TextBox ID="AssessmentDiscussion0" style="font-family:Verdana" runat="server" CssClass="txtbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <AjaxToolkit:CalendarExtender runat="server" ID="Calendarextender2" TargetControlID="AssessmentDiscussion0" Format="dd-MM-yyyy" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family:Verdana;font-size:14px">Date of Assessor Completion
                            </td>
                            <td align="right">
                                <asp:TextBox ID="AssessorCompletion0" style="font-family:Verdana" runat="server" CssClass="txtbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <AjaxToolkit:CalendarExtender runat="server" ID="Calendarextender3" TargetControlID="AssessorCompletion0" Format="dd-MM-yyyy" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family:Verdana;font-size:14px">Date of Finalization
                            </td>
                            <td align="right">
                                <asp:TextBox style="font-family:Verdana" ID="Finalization0" runat="server" CssClass="txtbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <AjaxToolkit:CalendarExtender  runat="server" ID="Calendarextender4" TargetControlID="Finalization0" Format="dd-MM-yyyy" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family:Verdana;font-size:14px"><strong> Self Assessment Phase:</strong> 01-Jun-12 to 10-Jun-12<br />
                    <strong> Completion of Assessor & Discussion Phase:</strong> 11-Jun-12 to 20-Jun-12<br />
                    <strong> Review & Appraisal Finalization Phase:</strong> 21-Jun-12 to 25-Jun-12

                </td>
            </tr>


        </table>
        <br />
       
        <table style="width: 100%" border="0">
            <tr>
                <td class="auto-style45"><strong style="font-family:Verdana;font-size:14px">Overall Rating</strong></td>
                <td class="auto-style31"></td>
                
            </tr>
            <tr>
                <td  style="font-family:Verdana;font-size:14px;width:35.5%">Self Assessment</td>
                <td>
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="SelfAssessment0" runat="server" Height="20px" Width="131px" AutoCompleteMode="SuggestAppend" />
                </td>
            </tr>
            <tr>
                <td class="auto-style44" style="font-family:Verdana;font-size:14px">Assessor Rating</td>
                <td>
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="AssessorRating0" runat="server" Height="20px" Width="131px" AutoCompleteMode="SuggestAppend" />
                </td>
            </tr>
            <tr>
                <td class="auto-style44" style="font-family:Verdana;font-size:14px">Finalized Rating</td>
                <td>
                    <AjaxToolkit:ComboBox style="font-family:Verdana" ID="FinalizedRating" runat="server" Height="20px" Width="131px" AutoCompleteMode="SuggestAppend" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <br />
                    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td>
            </tr>
        </table>
        <br />
        <table border="0">
            <tr>
                <td class="auto-style44" style="width:5%"><strong style="font-family:Verdana;font-size:14px">Recommended for Promotion</strong></td>
                <td style="width:7%"></td>
                <th class="auto-style48">
                    <asp:TextBox style="font-family:Verdana" ID="RecommendedforPromotion0" runat="server" CssClass="txtbox" /></th>
                
                <th class="auto-style47" style="font-family:Verdana;font-size:14px" >Weightage</th>
                <td class="auto-style46" align="right">
                    <asp:TextBox ID="Weightage0" style="font-family:Verdana" runat="server" CssClass="txtbox" /></td>
            </tr>
            <tr style="height: 15px"></tr>
            <tr>

                <td class="auto-style44" style="width:5%"><strong style="font-family:Verdana;font-size:14px">Reasons for not promoting</strong></td>
                <td>    </td>
                <td class="auto-style44" align="center">
                    <asp:TextBox ID="notpromoting0" style="font-family:Verdana" TextMode="MultiLine" runat="server"  CssClass="txtbox" Width="368px" /></td>
            </tr>
        </table>
        <br />
        <table style="width: 100%" border="0">
            <tr>
                <td align="center">
                    <asp:ImageButton ID="btnSave" OnClick="btnSave_Click" ImageUrl="~/images/save.png" runat="server" Text="Save" Width="75px"/>
                    <asp:ImageButton ID="btnSubmit" OnClick="btnSubmit_Click" Enabled="false" ImageUrl="~/images/submit.png" runat="server" Text="Submit" Width="75px"/>
                    <asp:ImageButton ID="btnClose" OnClick="btnClose_Click" ImageUrl="~/images/close.png" OnClientClick="return Close();" runat="server" Text="Close" Width="75px"/>
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
