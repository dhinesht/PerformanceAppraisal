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
                <td width="80%" style="font-family: Verdana;color:darkblue; font-size: 14px" align="Right">Welcome!&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="name" runat="server" Style="font-family: Verdana; font-size: 14px;color:darkblue" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" OnClick="logout_Click" Text="Log Out" runat="server" Style="font-family: Verdana; font-size: 14px" />
                </td>
            </tr>
        </table>
        <table id="container" border="0" style="width:100%;height:inherit"><tr><td>
        
        <div id="tabs1" runat="server" style="width:100%" align="center">
            <ul>
                <li><a href="#tabs-1" style="background-color: #EFFCFD;font-family:Verdana;color:darkblue">Appraiser</a></li>
            </ul>
            <table id="tabs-1" style="width:100%;background-color:#CED9F8" >
                <tr>
                    <td style="background-color: #EFFCFD">
                        <asp:GridView ID="AppGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="AppGrid_RowDataBound" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">

                            <AlternatingRowStyle BackColor="#F7F7F7" />

                            <Columns>
                                <asp:BoundField DataField="Emp_Id" HeaderText="Employee Id" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Names="Verdana" >
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Employee Name" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AppPeriod" HeaderText="Appraisal Period" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AppStatus" HeaderText="Appraisal Status" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Appraisal Edit" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnReview" OnClick="BtnReview_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>


<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Objective Edit" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnObj" OnClick="BtnObj_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>
                                    </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
        <div id="tabs2" runat="server" style="width:100%;background-color:#CED9F8" align="center">
            <ul>
                <li><a href="#tabs-2" style="background-color: #EFFCFD;font-family:Verdana">Reviewer</a></li>
            </ul>
            <table id="tabs-2">
                <tr>
                    <td style="background-color: #EFFCFD">
                        <asp:GridView ID="RevGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="RevGrid_RowDataBound" width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="Emp_Id" HeaderText="Employee Id" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Employee Name" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AppPeriod" HeaderText="Appraisal Period" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AppStatus" HeaderText="Appraisal Status" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                               <asp:TemplateField HeaderText="Appraisal Edit" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnReview" OnClick="BtnReview_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>


<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Objective Edit" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnObj" OnClick="BtnObj_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>
                                    </asp:TemplateField>

                            </Columns>

                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />

                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
            <br />
        <div id="tabs3" runat="server" style="width:100%" align="center">
            <ul>
                <li><a href="#tabs-3" style="background-color: #EFFCFD;font-family:Verdana">Self</a></li>
            </ul>
            <table id="tabs-3" style="background-color: #CED9F8">

                <tr>
                    <td style="background-color: #EFFCFD">
                        <asp:GridView ID="SelfGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="SelfGrid_RowDataBound" Width="100%" BackColor="#CED9F8" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                            <EmptyDataTemplate>
                               <strong style="color:darkblue">You have submitted your Appraisal form. Your review will be updated soon.</strong>
                            </EmptyDataTemplate>
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="Emp_Id" HeaderText="Employee Id" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Employee Name" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AppPeriod" HeaderText="Appraisal Period" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AppStatus" HeaderText="Appraisal Status" ItemStyle-Width="20%" ControlStyle-Font-Names="Verdana" ItemStyle-HorizontalAlign="Center">
<ControlStyle Font-Names="Verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Appraisal Edit" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnReview" OnClick="BtnReview_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>


<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Objective Edit" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnObj" OnClick="BtnObj_Click" runat="server" Text="Edit" ForeColor="Red" />
                                    </ItemTemplate>
                                    </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        </asp:GridView>
                    </td>
                </tr>

            </table>
        </div>
            </td></tr></table>
    </form>
</body>
</html>

