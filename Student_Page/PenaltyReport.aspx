<%@ Page Title="" Language="C#" MasterPageFile="~/Student_Page/Student.Master" AutoEventWireup="true" CodeBehind="PenaltyReport.aspx.cs" Inherits="Library_Management.Student_Page.PenaltyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: 45pt;
            color: #003300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center" style="font-size:small">
    <tr>
        <td class="tblhead">
            PENATY REPORT</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="668px" AllowPaging="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Book_Name" HeaderText="BookName" />
                    <asp:BoundField DataField="Price" HeaderText="Price">
                    <ItemStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Penalty_Amt" HeaderText="Penalty Amt">
                    <ItemStyle Width="110px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Reason" HeaderText="Detail" />
                    <asp:BoundField DataField="Entry_Date" HeaderText="Date" />
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
</asp:Content>
