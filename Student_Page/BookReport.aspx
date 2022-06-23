<%@ Page Title="" Language="C#" MasterPageFile="~/Student_Page/Student.Master" AutoEventWireup="true" CodeBehind="BookReport.aspx.cs" Inherits="Library_Management.Student_Page.BookReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center" style="font-size:small">
        <tr>
            <td class="tblhead">
                MY BOOK REPORT</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btntaken" runat="server" CssClass="btn" Text="BORROW BOOK" Font-Size="Small"
                    onclick="btntaken_Click" />
&nbsp;<asp:Button ID="btnreturn" runat="server" CssClass="btn" Text="RETURN BOOK" Font-Size="Small"
                    onclick="btnreturn_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table align="center" class="style1">
                            <tr>
                                <td style="text-align:center">
                                    Borrow Book List -
                                    <asp:Label ID="lblb" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center" 
                                        Width="482px" AllowPaging="true">
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table align="center" class="style1">
                            <tr>
                                <td style="text-align:center">
                                    Return Book List -
                                    <asp:Label ID="lblr" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center" 
                                        Width="630px" AllowPaging="true">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                            <asp:BoundField DataField="Issue_Date" HeaderText="Issue Date" />
                                            <asp:BoundField DataField="return_Days" HeaderText="Days">
                                            <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Return_Date" HeaderText="Return Date" />
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
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
