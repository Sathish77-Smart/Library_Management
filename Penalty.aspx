<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Penalty.aspx.cs" Inherits="Library_Management.Penalty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 747px;
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
        .style16
        {
            text-align: right;
            color: Green;
            width: 153px;
        }
        .auto-style2 {
            width: 485px;
            height: 222px;
        }
        .auto-style3 {
            text-align: right;
            color: Green;
            width: 132px;
        }
        .auto-style4 {
            width: 949px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center" style="font-size:small">
        <tr>
            <td class="tblhead">
                PENALTY FORM</td>
        </tr>
        <tr>
            <td>
                <table class="auto-style4" align="center">
                    <tr>
                        <td class="style3">
                        Select Branch :
                    </td>
                    <td class="style2">
                            <asp:DropDownList ID="drpbranch" runat="server" CssClass="txt" 
                                AutoPostBack="True" onselectedindexchanged="drpbranch_SelectedIndexChanged">
                            </asp:DropDownList>
                    </td>
                        <td class="lbl">
                            Select User for Penalty :</td>
                        <td>
                            <asp:DropDownList ID="drpstudent" runat="server" CssClass="txt" 
                                AutoPostBack="True" onselectedindexchanged="drpstudent_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="lbl">
                            Select&nbsp; Book :
                        </td>
                        <td>
                            <asp:DropDownList ID="drpbook" runat="server" CssClass="txt">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="Button12" runat="server" CssClass="btn" 
                                onclick="Button12_Click" Text="Select" Width="70px"  Font-size="Small"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblmsg" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View2" runat="server">
                    <table class="tbl" align="center" style="border:none;">
                        <tr>
                            <td class="tblhead">
                                View Book Detail </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style4" align="center">
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
                                            <table class="auto-style2">
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Autor :</td>
                                                    <td>
                                                        <asp:Label ID="lblauthor" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Publication :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblpub" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Branch :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblbran" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Price :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblprice" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Student Name:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblstudent" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Days :</td>
                                                    <td>
                                                        <asp:Label ID="lbldays" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Issue Date :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblidate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Penalty Status :&nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblpanalty" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Penalty Amount :</td>
                                                    <td>
                                                        <asp:TextBox ID="txtpenalty" runat="server" CssClass="txt" Width="80px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        Reason :
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtdetail" runat="server" CssClass="txt" Height="40px" 
                                                            TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style3" style="font-size: small;color:black;font-weight:bold;">
                                                        &nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="btnpaypanalty" runat="server" CssClass="btn" 
                                                            onclick="btnpaypenalty_Click" Text="Pay Now" Width="90px" Font-size="Small" />
                                                        <asp:Label ID="lblpay" runat="server" Font-Size="10pt"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
