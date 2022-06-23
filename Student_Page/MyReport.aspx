<%@ Page Title="" Language="C#" MasterPageFile="~/Student_Page/Student.Master" AutoEventWireup="true" CodeBehind="MyReport.aspx.cs" Inherits="Library_Management.Student_Page.MyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 186px;
        }
        .auto-style3 {
            width: 180px;
            height: 50px;
        }
        .auto-style4 {
            text-align: right;
            color: black;
            width: 124px;
        }
        .auto-style5 {
            width: 176px;
        }
        .auto-style6 {
            width: 59%;
            height: 40px;
        }
        .auto-style7 {
            width: 581px;
        }
        .auto-style9 {
            width: 207px;
        }
        .auto-style10 {
            width: 366px;
            height: 205px;
        }
        .auto-style11 {
            width: 134px;
        }
        .auto-style12 {
            width: 279px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center" style="font-size:small">
    <tr>
        <td class="tblhead">
            PREVIOUS HISTORY OF BORROWED BOOKS</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="auto-style6" align="center" style="font-size:small">
                <tr>
                    <td class="lbl">
                        Select Branch :
                    </td>
                    <td class="auto-style3">
                            <asp:DropDownList ID="drpbranch" runat="server" CssClass="txt" 
                                AutoPostBack="True" onselectedindexchanged="drpbranch_SelectedIndexChanged">
                            </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                            Select
                            Student :
                        </td>
                    <td class="auto-style5"><asp:DropDownList ID="drpstudent" runat="server" CssClass="txt">
                            </asp:DropDownList>
                        </td>
                    <td>
                            &nbsp;<asp:Button ID="btnseach" runat="server" CssClass="btn" 
                                onclick="btnsearch_Click" Text="View" Font-Size="Small"/>
                    </td>
                </tr>
                </table>
        </td>
    </tr>
    <tr>
        <td align="center">
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            </td>
    </tr>
    <tr>
        <td>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table class="tbl" align="center">
                        <tr>
                            <td class="tblhead">
                                <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    Width="748px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                    onrowcommand="GridView1_RowCommand" style="text-align: center" align="center">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="BookName" HeaderText="BookName" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Qnt" />
                                        <asp:BoundField DataField="Available_Qty" HeaderText="Available" />
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
                            <td>
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
                                <table class="auto-style7" align="center">
                                    <tr>
                                        <td class="style5" colspan="2" style="font-size: small;font-weight:bold">
                                            Book Name :
                                            <asp:Label ID="lblbname" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9" rowspan="2">
                                            <asp:Image ID="Image2" runat="server" Height="200px" Width="205px" />
                                        </td>
                                        <td class="style8" valign="top">
                                            <table class="auto-style10">
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Autor :</td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblauthor" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Publication :
                                                    </td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblpub" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Branch :
                                                    </td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblbran" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Price :
                                                    </td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblprice" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        &nbsp;</td>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Total Quantity :
                                                    </td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Availabale Qnt :
                                                    </td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblaqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Rent Qnt :
                                                    </td>
                                                    <td class="auto-style12">
                                                        <asp:Label ID="lblrqnt" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold">
                                                        Detail :
                                                    </td>
                                                    <td class="auto-style12">
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
                            <td align="center">
                                <asp:Button ID="Button11" runat="server" CssClass="btn" 
                                    onclick="Button11_Click" Text="Back" Width="80px" Font-Size="Small"/>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </td>
    </tr>
</table>
</asp:Content>
