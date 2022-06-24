<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Add_Publication.aspx.cs" Inherits="Library_Management.Add_Publication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 265px;
        }
        .auto-style8 {
            text-align: right;
            color: black;
            width: 271px;
        }
        .auto-style9 {
            width: 271px;
        }
        .auto-style10 {
            width: 100%;
            border: solid 1px blue;
            background: #bce0f5;
            margin-left: 0px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style10" style="font-size:small">
        <tr>
            <td class="tblhead">
                ADD NEW PUBLICATION
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="add_panel" runat="server">
                <table align="center" width="700">
                    <tr>
                        <td class="auto-style9">
                            &nbsp;</td>
                        <td class="auto-style6"> 
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            Publication Name :
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
            </asp:Panel>
                <asp:Panel ID="edit_panel" runat="server" Visible="false">
                <table align="center" width="700">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            Publication Id : </td>
                        <td class="auto-style6"> 
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" Width="200px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" CssClass="btn" Font-Size="Small"
                            Text="UPDATE" OnClick="Update_Click"/></td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            Enter Publication Name :
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtpub" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" CssClass="btn" Font-Size="Small"
                            Text="CANCEL" OnClick="Cancel_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            &nbsp;</td>
                        <td class="auto-style6">
                            <asp:Label ID="Label1" runat="server" CssClass="lbl" ForeColor="Black"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
                </td>
        </tr>
        <tr>
            <td>
                <table width="700" align="center">
                    <tr align="center">
                        <td>
                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="516px" AutoGenerateColumns="false" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" OnRowEditing="GridView1_RowEditing" Font-Size="Small" AllowPaging="true">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="Publication" DataField="Publication_name" />   
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
            </td>
        </tr>
        
    </table>
                
    
</asp:Content>
