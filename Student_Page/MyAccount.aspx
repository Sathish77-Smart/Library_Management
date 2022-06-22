<%@ Page Title="" Language="C#" MasterPageFile="~/Student_Page/Student.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="Library_Management.Student_Page.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 465px;
        }
    .style2
    {
        }
    .style3
    {
        text-align: right;
        color: Green;
        width: 200px;
    }
        .auto-style4 {
            width: 466px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" style="font-size:small">
        <tr>
            <td class="tblhead">
                MY ACCOUNT</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="Button12" runat="server" CssClass="btn" Text="VIEW ACCOUNT" Font-Size="Small"
                    onclick="Button12_Click" />
&nbsp;<asp:Button ID="Button13" runat="server" CssClass="btn" Text="EDIT ACCOUNT" Font-Size="Small"
                    onclick="Button13_Click" />
            &nbsp;<asp:Button ID="Button14" runat="server" CssClass="btn" Text="CHANGE PASSWORD" Font-Size="Small"
                    onclick="Button14_Click" />
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table align="center" class="style1" style="border: thin solid #009900">
                            <tr>
                                <td class="tblhead" colspan="2">
                                    MY Account Detail</td>
                            </tr>
                            <tr>
                                <td class="auto-style6" align="right" style="font-weight:bold">
                                    Name :</td>
                                <td align="center">
                                    <asp:Label ID="lblnam" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" align="right" style="font-weight:bold">
                                    Mobile :</td>
                                <td align="center">
                                    <asp:Label ID="lblmobile" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" align="right" style="font-weight:bold">
                                    Address :</td>
                                <td align="center">
                                    <asp:Label ID="lbladd" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" align="right" style="font-weight:bold">
                                    City :</td>
                                <td align="center">
                                    <asp:Label ID="lblcity" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" align="right" style="font-weight:bold">
                                    Pincode :</td>
                                <td align="center">
                                    <asp:Label ID="lblpincode" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" align="right" style="font-weight:bold">
                                    Email :
                                </td>
                                <td align="center">
                                    <asp:Label ID="lblemail" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table align="center" class="style1" style="border: thin solid #009900">
                            <tr>
                                <td class="tblhead" colspan="2">
                                    Edit Account Detail</td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black">
                                    Name :</td>
                                <td align="left">
                                    <asp:TextBox ID="txtname" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black">
                                    Mobile :</td>
                                <td align="left">
                                    <asp:TextBox ID="txtname0" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black">
                                    Address :</td>
                                <td align="left">
                                    <asp:TextBox ID="txtname1" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black">
                                    City :</td>
                                <td align="left">
                                    <asp:TextBox ID="txtname2" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black">
                                    Pincode :</td>
                                <td align="left">
                                    <asp:TextBox ID="txtname3" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black">
                                    Email :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtname4" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" style="font-weight:bold;color:black">
                                    &nbsp;</td>
                                <td align="left">
                                    <asp:Button ID="btnupdate" runat="server" CssClass="btn" Font-Size="Small" 
                                        onclick="btnupdate_Click" Text="UPDATE" Width="100px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <table style="border: thin solid #009900" class="auto-style4">
                            <tr>
                                <td class="tblhead" colspan="2">
                                    Change Password</td>
                            </tr>
                            <tr>
                                <td align="right" style="font-weight:bold;color:black">
                                    Enter New Password :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtpass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="font-weight:bold;color:black">
                                    Confirm - Password :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtcpass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td align="left">
                                    <asp:Button ID="Button15" runat="server" CssClass="btn" Font-Size="Small"
                                        Text="Change Password" onclick="Button15_Click" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td align="left">
                                    <asp:Label ID="Label1" runat="server" Font-Size="10pt" Text="Label"></asp:Label>
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
