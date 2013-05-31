<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerformanceAppraisal3.aspx.cs" Inherits="PerfApp.PerformanceAppraisal3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Performance Appraisal</title>
   <link type="text/css" rel="Stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />

<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.5.js"></script> 

     <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/jquery-ui.js"></script><link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />


    <link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
    
    <style>
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

        html, body {
            height: 754px;
            margin: 0;
            padding: 0;
        }
        

        #container {
            min-height: 100%;
            width: 100%;
        }

        .auto-style1 {
            width: 26%;
        }
        .ui-button { margin-left: -1px;height:33px; }

       .ui-button-icon-only .ui-button-text { padding: 0em; }

       .ui-autocomplete-input {height:15px; width:180px; margin: 0; padding: 0.48em 0 0.47em 0.45em; font-size:medium }

 

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
                <script>

                    //function optionSelected(selectedValue) {

                    //    document.title = selectedValue;

                    //}



                    (function ($) {

                        $.widget("ui.combobox", {

                            _create: function () {

                                var self = this,

                                           select = this.element.hide(),

                                           selected = select.children(":selected"),

                                           value = selected.val() ? selected.text() : "";

                                var input = this.input = $("<input>")

                                           .insertAfter(select)

                                           .val(value)

                                           .autocomplete({

                                               delay: 0,

                                               minLength: 0,

                                               source: function (request, response) {

                                                   var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");

                                                   response(select.children("option").map(function () {

                                                       var text = $(this).text();

                                                       if (this.value && (!request.term || matcher.test(text)))

                                                           return {

                                                               label: text.replace(

                                                                                    new RegExp(

                                                                                           "(?![^&;]+;)(?!<[^<>]*)(" +

                                                                                           $.ui.autocomplete.escapeRegex(request.term) +

                                                                                           ")(?![^<>]*>)(?![^&;]+;)", "gi"

                                                                                    ), "<strong>$1</strong>"),

                                                               value: text,

                                                               option: this

                                                           };

                                                   }));

                                               },

                                               select: function (event, ui) {

                                                   ui.item.option.selected = true;

                                                   self._trigger("selected", event, {

                                                       item: ui.item.option

                                                   });

                                                   //JK

                                                   //optionSelected(ui.item.option.value);



                                               },

                                               change: function (event, ui) {

                                                   if (!ui.item) {

                                                       var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),

                                                                       valid = false;

                                                       select.children("option").each(function () {

                                                           if ($(this).text().match(matcher)) {

                                                               this.selected = valid = true;

                                                               return false;

                                                           }

                                                       });

                                                       if (!valid) {

                                                           // remove invalid value, as it didn't match anything

                                                           $(this).val("");

                                                           select.val("");

                                                           input.data("autocomplete").term = "";

                                                           return false;

                                                       }

                                                   }

                                               }

                                           })

                                           .addClass("ui-widget ui-widget-content ui-corner-left");



                                input.data("autocomplete")._renderItem = function (ul, item) {

                                    return $("<li></li>")

                                                  .data("item.autocomplete", item)

                                                  .append("<a>" + item.label + "</a>")

                                                   .appendTo(ul);

                                };



                                this.button = $("<button type='button'>&nbsp;</button>")

                                           .attr("tabIndex", -1)

                                           .attr("title", "Show All Items")

                                           .insertAfter(input)

                                           .button({

                                               icons: {

                                                   primary: "ui-icon-triangle-1-s"

                                               },

                                               text: false

                                           })

                                           .removeClass("ui-corner-all")

                                           .addClass("ui-corner-right ui-button-icon")

                                           .click(function () {

                                               // close if already visible

                                               if (input.autocomplete("widget").is(":visible")) {

                                                   input.autocomplete("close");

                                                   return;

                                               }



                                               // pass empty string as value to search for, displaying all results

                                               input.autocomplete("search", "");

                                               input.focus();

                                           });

                            },



                            destroy: function () {

                                this.input.remove();

                                this.button.remove();

                                this.element.show();

                                $.Widget.prototype.destroy.call(this);

                            }

                        });

                    })(jQuery);



                    $(function () {

                        $('.drop').combobox();

                      
                    });
                            


                           
                        </script>
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
        </script>
                       <table border="0">
                                    <tr>
                                        <td align="left">
                                            
                                            <asp:Image ID="Image1" ImageUrl="~/images/logo_transsys.png" runat="server" /></td>
                                        <td style="width: 15%"></td>

                                        <td align="right" style="width: 41%">

                                            <asp:Button ID="ImageButton1" OnClick="btnSave_Click" runat="server" Text="Save" Width="75px" />
                                            <asp:Button ID="ImageButton2" OnClick="btnSubmit_Click" Enabled="false" runat="server" Text="Submit" Width="75px" />
                                            <asp:Button ID="ImageButton3" OnClick="btnClose_Click" OnClientClick="return Close();" runat="server" Text="Continue" Width="75px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        </td>
                                        <td style="width: 40%;font-family:Verdana;color:darkblue" align="right" >Welcome!&nbsp;<asp:Label ID="name" runat="server" style="font-family:Verdana;color:darkblue"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="logout" Text="Log Out" OnClick="logout_Click" runat="server" />
                                        </td>
                                    </tr>
                           <tr><td style="height:75px"></td></tr>
<tr><td></td></tr>                                  <tr><td></td><td width="10%"></td><td align="left" style="width:30%;color:darkblue"><strong style="font-family:Verdana">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td><td ><strong style="font-family:Verdana;color:darkblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td><td style="width: 15%"></td><td style="width:5%"></td></tr>
                                </table>
                            
                   <table id="container" style="width: 100%; margin-top: 0px;" border="0">
       
                        <tr>
                                
                            <td align="center">
                                <asp:GridView ID="ProjectGrid" runat="server" OnRowDataBound="ProjectGrid_RowDataBound" AutoGenerateColumns="False" OnRowCreated="ProjectGrid_RowCreated" Height="150px"
                                    Width="100%" Font-Names="Verdana" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">

                                    <AlternatingRowStyle BackColor="#F7F7F7" />

                                    <Columns>

                                        <asp:BoundField DataField="Name" HeaderText="Criteria Name" ControlStyle-Width="150px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Names="verdana" ItemStyle-Width="20%">
                                            <ControlStyle Font-Names="verdana" Width="150px"></ControlStyle>

                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CriteriaId" Visible="false" />


                                        <asp:TemplateField HeaderText="Self-Rate" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Names="verdana" ItemStyle-Wrap="true" ItemStyle-Width="20%">

                                            <ItemTemplate>

                                                <asp:DropDownList ID="SelfRating" runat="server" AutoCompleteMode="SuggestAppend" CssClass="drop"></asp:DropDownList>

                                            </ItemTemplate>

                                            <ControlStyle Font-Names="verdana"></ControlStyle>

                                            <ItemStyle VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Self-Comment" ControlStyle-Font-Names="verdana" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="SelfComment" CssClass="txtbox" TextMode="MultiLine" Height="60px" Width="180px" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/>
                                            </ItemTemplate>

                                            <ControlStyle Font-Names="verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Appraiser-Rate" ItemStyle-VerticalAlign="Middle" ControlStyle-Font-Names="verdana" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="AppraiserRating" runat="server" AutoCompleteMode="SuggestAppend" CssClass="drop"></asp:DropDownList>
                                            </ItemTemplate>

                                            <ControlStyle Font-Names="verdana"></ControlStyle>

                                            <ItemStyle VerticalAlign="Middle"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Appraiser-Comment" ControlStyle-Font-Names="verdana" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="AppraiserComment" TextMode="MultiLine" runat="server" CssClass="txtbox" Height="60px" Width="180px" Enabled="false" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/>
                                            </ItemTemplate>

                                            <ControlStyle Font-Names="verdana"></ControlStyle>

<ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
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
                        <tr>
                            <td>
                                <table border="0" style="width:100%" id="Reviwer" runat="server">
                                    <tr>
                                        <td style="width:28%;font-family:Verdana"></td>
                                        <td style="width:12%;font-family:Verdana" align="center">Reviewer Rating
                                        </td>
                                        <td style="width:10%">
                                            <asp:DropDownList ID="ReviewerRating" runat="server" Width="180px" CssClass="drop"/>
                                        </td>
                                        <td style="width:12%;font-family:Verdana" align="center">Reviewer Comment
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="txtbox" ID="ReviewerComment" Width="185px" runat="server" TextMode="MultiLine" BackColor="#99CC00" BorderColor="#336633" BorderStyle="Inset" ForeColor="#000000"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td  style="width:80%" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <strong>
                                    <asp:Label ID="OtherComments" runat="server" Style="font-family: Verdana" Text="Additional appraisar comment" /></strong>
                                <br />

                            </td>
                        </tr>
                        <tr>
                            <td style="width:80%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="OtherTextBox" runat="server" TextMode="MultiLine" Width="50.5%" CssClass="txtbox" />
                            </td>
                        </tr><tr><td style="height:80px"></td></tr>
                        <tr>
                            <td align="center" >
                                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Save" Width="75px" />
                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" Enabled="false" runat="server" Text="Submit" Width="75px" />
                                <asp:Button ID="btnClose" OnClick="btnClose_Click" OnClientClick="return Close();" runat="server" Text="Continue" Width="75px" />
                            </td>

                        </tr>
                    </table>

                
    </form>
</body>
</html>
