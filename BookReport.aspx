<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookReport.aspx.cs" Inherits="Library_Management.BookReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            background: #3f5ce0;
            color: #fff;
            text-align: center;
            font-weight: bold;
            height: 30px;
            background: #3f5ce0;
            width: 1199px;
        }
        .auto-style2 {
            width: 1199px;
        }
        .auto-style3 {
            background: #3f5ce0;
            color: #fff;
            text-align: center;
            font-weight: bold;
            height: 30px;
            background: #3f5ce0;
            width: 1216px;
        }
        .auto-style4 {
            width: 1216px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" style="font-size:small">
    <tr>
        <td class="auto-style1">
            VIEW BOOK</td>
    </tr>
    <tr>
        <td class="auto-style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <table class="style1" align="center">
                <tr>
                    <td class="style3">
                        Select Branch :
                        </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="150px"></asp:DropDownList>&nbsp;
                        </td>
                    <td>
                            <asp:Button ID="btnviewbranch" runat="server" Text="View" CssClass="btn"
                            onclick="btnviewbranch_Click" />
                    </td>
                    <td class="style2">
                        Select Publicaton :
                        </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" Width="150px"></asp:DropDownList>&nbsp;
                        </td>
                    <td>
                            <asp:Button ID="btnviewpublication" runat="server" CssClass="btn"
                            Text="View" onclick="btnviewpublication_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" align="center">
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table class="style1" align="center">
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" align="center">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    Width="794px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                    onrowcommand="GridView1_RowCommand" style="text-align: center" AllowPaging="true">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="BookName" HeaderText="BookName" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Qnt" />
                                        <asp:BoundField DataField="Available_Qty" HeaderText="Availabale" />
                                        <asp:BoundField DataField="Rent" HeaderText="Rent" />
                                        <asp:TemplateField HeaderText="View">
                                        <ItemTemplate>
                                        <asp:LinkButton runat="server"  ID="lnkview" Text="View" CommandArgument='<%#Eval("Id") %>' CssClass="lnk"></asp:LinkButton>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" 
                                        HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table class="tbl" align="center">
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
                                            <table class="style7">
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Autor :</td>
                                                    <td>
                                                        <asp:Label ID="lblauthor" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Publication :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblpub" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Branch :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblbran" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Price :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblprice" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Total Quantity :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Availabale Qnt :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblaqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Rent Qnt :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblrqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style11" style="font-size: small;font-weight:bold;">
                                                        Detail :</td>
                                                    <td>
                                                        <asp:Label ID="lbldetail" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style9" valign="top">
                                            <asp:Button ID="Button11" runat="server" CssClass="btn" 
                                                onclick="Button11_Click" Text="Back" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </td>
    </tr>
</table>
</asp:Content>
