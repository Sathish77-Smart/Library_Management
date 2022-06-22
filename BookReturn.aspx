<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookReturn.aspx.cs" Inherits="Library_Management.BookReturn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .style1
    {
        width: 746px;
    }
        .style4
        {
            width: 717px;
            height: 276px;
        }
        .style5
        {
            font-weight: 700;
        }
        .style6
        {
            width: 216px;
        }
        .style8
        {
            height: 183px;
        }
        .style7
        {
            width: 452px;
            height: 222px;
        }
        .style14
        {
            text-align: right;
            color: Green;
            width: 136px;
        }
        .style15
        {
            text-align: right;
            color: Green;
            width: 158px;
        }
        .auto-style3 {
            text-align: right;
            color: black;
            width: 102px;
        }
        .auto-style4 {
            width: 119px;
        }
        .auto-style5 {
            text-align: right;
            color: Green;
            width: 123px;
        }
        .auto-style6 {
            width: 484px;
            height: 222px;
        }
        .auto-style7 {
            width: 356px;
        }
        .auto-style8 {
            width: 188px;
        }
        .auto-style9 {
            width: 850px;
        }
        .auto-style10 {
            height: 25px;
            width: 150px;
            border: solid 1px blue;
            background: #c3d1d9;
            margin-right: 59;
        }
        .auto-style11 {
            width: 155px;
        }
        .auto-style12 {
            text-align: right;
            color: black;
            width: 123px;
        }
        .auto-style13 {
            width: 123px;
        }
        .auto-style14 {
            width: 102px;
        }
        .auto-style15 {
            width: 703px;
            height: 276px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center" style="font-size:small">
        <tr>
            <td class="tblhead">
                BOOK RETURN FORM</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            <table class="auto-style9" align="center">
                <tr>
                    <td class="style3">
                        Select Branch :
                    </td>
                    <td class="style2">
                            <asp:DropDownList ID="drpbranch" runat="server" CssClass="auto-style10" 
                                AutoPostBack="True" onselectedindexchanged="drpbranch_SelectedIndexChanged">
                            </asp:DropDownList>
                    </td>
                    <td class="auto-style12">
                        Select 
                        Student :
                        </td>
                    <td class="auto-style11">
                            <asp:DropDownList ID="drpstudent" runat="server" CssClass="txt" 
                            AutoPostBack="True" 
                            onselectedindexchanged="drpstudent_SelectedIndexChanged">
                                
                            </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        Select Book :
                    </td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="drpbook" runat="server" CssClass="txt">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td></td>
                    <td  align="center" class="auto-style13">
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="Button12" runat="server" CssClass="btn" Font-size="Small"
                            onclick="Button12_Click" Text="SELECT" Width="100px" />
                    </td>
                    
                    <td class="auto-style14">

                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View2" runat="server">
                    <table class="tbl" align="center">
                        <tr>
                            <td class="tblhead">
                                View Book Detail </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="auto-style15" align="center">
                                    <tr>
                                        <td class="style5" colspan="2">
                                            Book Name :
                                            <asp:Label ID="lblbname" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:Image ID="Image2" runat="server" Height="211px" Width="207px" 
                                                BorderColor="#009933" BorderStyle="Dotted" BorderWidth="1px" />
                                        </td>
                                        <td class="style8" valign="top">
                                            <table class="auto-style6">
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Autor :</td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblauthor" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Publication :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblpub" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Branch :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblbran" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Price :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblprice" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        &nbsp;</td>
                                                    <td class="auto-style7">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Student Name:
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblstudent" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Days :</td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lbldays" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Issue Date :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblidate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5" style="font-size: small;color:black;font-weight:bold;">
                                                        Penalty Status :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblpanalty" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            &nbsp;</td>
                                        <td valign="top">
                                            <asp:Button ID="btnreturnbook" runat="server" CssClass="btn" 
                                                onclick="btnreturnbook_Click" Text="Return Book" Width="120px" Font-size="Small" />
                                            &nbsp;<asp:Label ID="lblbook" runat="server" Font-Size="10pt"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
