<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IssueBook.aspx.cs" Inherits="Library_Management.IssueBook" %>
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
        }
        .style9
        {
            height: 48px;
        }
        .style13
        {
            height: 27px;
            color: #000066;
            font-size: small;
        }
        .style14
        {
            text-align: right;
            color: Green;
            width: 136px;
        }
        .style15
        {
            height: 49px;
        }
        .auto-style1 {
            width: 123px;
        }
        .auto-style2 {
            width: 6px;
        }
        .auto-style3 {
            width: 130px;
        }
        .auto-style4 {
            text-align: right;
            color: black;
            width: 192px;
        }
        .auto-style5 {
            width: 192px;
        }
        .auto-style6 {
            width: 452px;
            height: 216px;
        }
        .auto-style7 {
            width: 310px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl">
    <tr>
        <td class="tblhead">
            BOOK ISSUE FORM</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="style1" align="center" style="font-size:small;">
                <tr>
                    <td class="lbl">
                        Select Publication :
                        </td>
                    <td class="auto-style3">
                            <asp:DropDownList ID="drppublication" runat="server" CssClass="txt" 
                            AutoPostBack="True" 
                            onselectedindexchanged="drppublication_SelectedIndexChanged">
                                
                            </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        Select Book :
                    </td>
                    <td>
                        <asp:DropDownList ID="drpbook" runat="server" CssClass="txt">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="Button12" runat="server" CssClass="btn" Font-Size="small" 
                            onclick="Button12_Click" Text="SELECT" Width="100px" />
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
                    <table class="tbl">
                        <tr>
                            <td class="tblhead">
                                View Book Detail </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style4" align="center">
                                    <tr>
                                        <td class="style5" colspan="2" style="font-weight:bold;">
                                            Book Name :
                                            <asp:Label ID="lblbname" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style6" rowspan="2">
                                            <asp:Image ID="Image2" runat="server" Height="211px" Width="207px" />
                                        </td>
                                        <td class="style8" valign="top">
                                            <table class="auto-style6" style="font-size:small;">
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Author :</td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblauthor" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Publication :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblpub" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Branch :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblbran" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Price :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblprice" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        &nbsp;</td>
                                                    <td class="auto-style7">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Total Quantity :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Availabale Qnt :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblaqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Rent Qnt :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblrqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        &nbsp;</td>
                                                    <td class="" style="font-size: small;font-weight:bold;">
                                                        Detail :</td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lbldetail" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-top: 2px solid green; border-bottom: thin solid #00D500; font-weight: 700;" 
                                class="style13" align="center">
                                Select Student Detail for Issue Book&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblissue" runat="server" ForeColor="Red"></asp:Label>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="Days in Digit" ForeColor="Red" 
                                    MaximumValue="999999999" MinimumValue="0" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                                &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="1 to 10 allowed" ForeColor="Red" 
                                    MaximumValue="10" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15" align="center" style="font-size:small">
                                Select Branch :
                                <asp:DropDownList ID="drpbranch" runat="server" AutoPostBack="True" 
                                    CssClass="txt" onselectedindexchanged="drpbranch_SelectedIndexChanged" 
                                    Width="120px">
                                </asp:DropDownList>
                                &nbsp;Select Student :
                                <asp:DropDownList ID="drpstudent" runat="server" CssClass="txt" Width="120px">
                                </asp:DropDownList>
                                &nbsp;Days :<asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="50px" Height="20px"></asp:TextBox>
&nbsp;<asp:Button ID="btnissue" runat="server" CssClass="btn" onclick="btnissue_Click" Text="Book Issue" Font-Size="small"
                                    Width="100px" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </td>
    </tr>
</table>
</asp:Content>
