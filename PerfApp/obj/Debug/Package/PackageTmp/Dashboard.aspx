<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PerfApp.Dashboard" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head id="Head1" runat="server">

    <meta charset="utf-8" />
 

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script>
        $(function () {
            $("#tabs1").tabs();
        });

        $(function () {
            $("#tabs2").tabs();
        });

        $(function () {
            $("#tabs3").tabs();
        });

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
    <style>
         html, body {
    height: 100%;
    margin: 0;
    padding: 0; 
}

#form1 {
    min-height: 100%;
    width: 100%; 
}
    </style>
    <title></title>
    <script type="text/javascript" src="script.js"></script>

    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="styles/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="styles/style.ie7.css" type="text/css" media="screen" /><![endif]-->

   

</head>
<body>
    <form id="form1" runat="server" style="height:100%">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table style="width: 100%;" border="0">
            <tr>
                <td>
                    <asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server" /></td>
                <td width="80%" style="font-family: Verdana; font-size: 14px" align="Right">Welcome!&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="name" runat="server" Style="font-family: Verdana; font-size: 14px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" OnClick="logout_Click" Text="Log Out" runat="server" Style="font-family: Verdana; font-size: 14px" />
                </td>
            </tr>
        </table>
        <table id="container" border="0" style="width:100%;height:inherit"><tr><td>
        
        <div id="tabs1" runat="server" style="width:70%" align="center">
            <ul>
                <li><a href="#tabs-1">Appraiser</a></li>
            </ul>
            <table id="tabs-1" style="width:100%">
                <tr>
                    <td style="background-color: lightsteelblue">
                        <asp:GridView ID="AppGrid" runat="server" AutoGenerateColumns="false" OnRowDataBound="AppGrid_RowDataBound">

                            <Columns>
                                <asp:BoundField DataField="Emp_Id" HeaderText="Employee Id" />
                                <asp:BoundField DataField="Name" HeaderText="Employee Name" />
                                <asp:BoundField DataField="AppPeriod" HeaderText="Appraisal Period" />
                                <asp:BoundField DataField="AppStatus" HeaderText="Appraisal Status" />
                                <asp:TemplateField HeaderText="Review">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnReview1" Text="Review" OnClick="BtnReview_Click" runat="server" ForeColor="Red" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
            <br />
            <ajaxToolkit:DropShadowExtender ID="DropShadowExtender1" runat="server"
    TargetControlID="RevGrid" 
    Opacity=".8" 
    Rounded="true"
    TrackPosition="true" />
        <div id="tabs2" runat="server" style="width:70%" align="center">
            <ul>
                <li><a href="#tabs-2">Reviewer</a></li>
            </ul>
            <table id="tabs-2">
                <tr>
                    <td style="background-color: lightsteelblue">
                        <asp:GridView ID="RevGrid" runat="server" AutoGenerateColumns="false" OnRowDataBound="RevGrid_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Emp_Id" HeaderText="Employee Id" />
                                <asp:BoundField DataField="Name" HeaderText="Employee Name" />
                                <asp:BoundField DataField="AppPeriod" HeaderText="Appraisal Period" />
                                <asp:BoundField DataField="AppStatus" HeaderText="Appraisal Status" />
                                <asp:TemplateField HeaderText="Review">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnReview2" OnClick="BtnReview_Click" runat="server" Text="Review" ForeColor="Red" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
            <br />
        <div id="tabs3" runat="server" style="width:70%" align="center">
            <ul>
                <li><a href="#tabs-3">Self</a></li>
            </ul>
            <table id="tabs-3">

                <tr>
                    <td style="background-color: lightsteelblue">
                        <asp:GridView ID="SelfGrid" runat="server" AutoGenerateColumns="false" OnRowDataBound="SelfGrid_RowDataBound">
                            <EmptyDataTemplate>
                                You have submitted your Appraisal form. Your review will be updated soon.
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:BoundField DataField="Emp_Id" HeaderText="Employee Id" />
                                <asp:BoundField DataField="Name" HeaderText="Employee Name" />
                                <asp:BoundField DataField="AppPeriod" HeaderText="Appraisal Period" />
                                <asp:BoundField DataField="AppStatus" HeaderText="Appraisal Status" />
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnReview" OnClick="BtnReview_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>

            </table>
        </div>
            </td></tr></table>
    </form>
</body>
</html>

