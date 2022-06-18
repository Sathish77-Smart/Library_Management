<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Add_Branch.aspx.cs" Inherits="Library_Management.Add_Branch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 374px;
        }
        .auto-style6 {
            width: 265px;
        }
        .auto-style8 {
            text-align: right;
            color: black;
            width: 253px;
        }
        .auto-style9 {
        width: 253px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl">
        <tr>
            <td class="tblhead">
                ADD NEW BRANCH</td>
        </tr>
        <tr>
            <td>
                <table align="center" width="700">
                    <tr>
                        <td class="auto-style9">
                            &nbsp;</td>
                        <td class="auto-style6"> 
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            Branch Name :
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtpub" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtpub" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="btnadd" runat="server" CssClass="btn" Font-Size="Small"
                            Text="ADD" OnClick="btnadd_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            &nbsp;</td>
                        <td class="auto-style6">
                            <asp:Label ID="lblmsg" runat="server" CssClass="lbl" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" CssClass="auto-style5" ForeColor="#333333" GridLines="None" Width="450px" Font-Size="Small" AllowPaging="True" 
                    onrowupdating="GridView1_RowUpdating" onrowcancelingedit="GridView1_RowCancelingEdit" onrowediting="GridView1_RowEditing" onrowdeleting="GridView1_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CausesValidation="false" ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
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
