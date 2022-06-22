<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IssueReport.aspx.cs" Inherits="Library_Management.IssueReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
    {
        width: 739px;
    }
        .style3
        {
            text-align: right;
            color: Green;
            width: 157px;
        }
        .style2
        {
            width: 202px;
        }
        .auto-style2 {
            width: 186px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center" style="font-size:small">
        <tr>
            <td class="tblhead">
                ISSUE BOOK REPORT</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            <table class="style1" align="center">
                <tr>
                    <td class="lbl">
                        Select Branch :
                    </td>
                    <td class="auto-style2">
                            <asp:DropDownList ID="drpbranch" runat="server" CssClass="txt" 
                                AutoPostBack="True" onselectedindexchanged="drpbranch_SelectedIndexChanged">
                            </asp:DropDownList>
                    </td>
                    <td class="lbl">
                            Select
                            Student :
                        </td>
                    <td><asp:DropDownList ID="drpstudent" runat="server" CssClass="txt">
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
                            <asp:Label ID="lbl" runat="server" ForeColor="Red"></asp:Label>
                    </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center" 
                                        Width="750px" align="center" Font-Size="Small" AllowPaging="true">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                            <asp:BoundField DataField="Issue_Date" HeaderText="Issue Date" />
                                            <asp:BoundField DataField="Return_Days" HeaderText="Days" />
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
                <br />
                                </td>
        </tr>
    </table>
</asp:Content>
