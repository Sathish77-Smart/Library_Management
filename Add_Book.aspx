<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Add_Book.aspx.cs" Inherits="Library_Management.Add_Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 345px;
        }
        .auto-style10 {
            width: 100%;
            border: solid 1px blue;
            background: #bce0f5;
            margin-left: 0px;
            margin-right: 0px;
        }
        .auto-style13 {
            text-align: left;
            width: 236px;
        }
        .auto-style14 {
            text-align: center;
            width: 159px;
        }
        .auto-style15 {
            text-align: right;
            color: black;
            width: 159px;
        }
        .auto-style17 {
            text-align: right;
            color: black;
            width: 223px;
        }
        .auto-style18 {
            width: 223px;
        }
        .auto-style19 {
            text-align: right;
            color: black;
            width: 223px;
            height: 34px;
        }
        .auto-style20 {
            text-align: left;
            width: 236px;
            height: 34px;
        }
        .auto-style21 {
            text-align: right;
            color: black;
            width: 159px;
            height: 34px;
        }
        .auto-style22 {
            width: 345px;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style10" style="font-size:small">
        <tr>
            <td class="tblhead">
                ADD NEW BOOK</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="add_panel" runat="server">
                <table align="center">
                    <tr>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style13"> 
                            &nbsp;</td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td class="auto-style6"> 
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            Book Name :
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="txtpub" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtpub" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style15">
                            Book Details :
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            Author Name :
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            Publication :
                        </td>
                        <td class="auto-style6">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="100px"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            Branch :
                        </td>
                        <td class="auto-style13">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="100px"></asp:DropDownList>
                        </td>
                        <td class="auto-style15">
                            Price :
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            Quantity :
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style15">
                            Picture :
                        </td>
                        <td class="auto-style6">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style13">
                            <asp:Label ID="lblmsg" runat="server" CssClass="lbl" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style14" style="text-align:left">
                            <asp:Button ID="Button5" runat="server" CssClass="btn" Font-Size="Small"
                            Text="ADD" width="75px" OnClick="btn_add_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style13"> 
                            &nbsp;</td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td class="auto-style6"> 
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="edit_panel" runat="server" Visible="false">
                <table align="center">
                    <tr>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style13"> 
                            &nbsp;</td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td class="auto-style6"> 
                            &nbsp;</td>
                    </tr>
                    <!--<tr>
                        <td class="auto-style17">
                            Book Id :
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="txt" Width="200px" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>-->
                    <asp:TextBox ID="bookid" runat="server" CssClass="txt" Width="200px" ReadOnly="true" Visible="false"></asp:TextBox>
                    <tr>
                        <td class="auto-style19">
                            Book Name :
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtpub" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style21">
                            Book Details :
                        </td>
                        <td class="auto-style22">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            Author Name :
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">
                            Price :
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <!--<tr>
                        <td class="auto-style17">
                            Branch :
                        </td>
                        <td class="auto-style13">
                            <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                        </td>
                        
                    </tr>-->
                    <tr>
                        <td class="auto-style17">
                            Quantity :
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <!--<td class="auto-style15">
                            Picture :
                        </td>
                        <td class="auto-style6">
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                        </td>-->
                    </tr>
                    <tr>
                        <td></td>
                        <td class="auto-style13" style="text-align:right">
                            <asp:Button ID="Button2" runat="server" CssClass="btn" Font-Size="Small"
                            Text="UPDATE"/></td>
                        </td>
                        <td class="auto-style14">
                            <asp:Button ID="Button3" runat="server" CssClass="btn" Font-Size="Small"
                            Text="CANCEL"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style13"> 
                            <asp:Label ID="lblscs" runat="server" ForeColor="Green"></asp:Label></td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td class="auto-style6"> 
                            &nbsp;</td>
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
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="812px" AllowPaging="true" 
                                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true"> 
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="Id" DataField="Id" />  
                                    <asp:BoundField HeaderText="Book Name" DataField="BookName" />  
                                    <asp:BoundField HeaderText="Details" DataField="BookDetails" />  
                                    <asp:BoundField HeaderText="Author" DataField="AuthorName" />  
                                    <asp:BoundField HeaderText="Publication" DataField="Publication" /> 
                                    <asp:BoundField HeaderText="Branch" DataField="Branch" />  
                                    <asp:BoundField HeaderText="Price" DataField="Price" />  
                                    <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
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
    <div id="dialog" style="display: none">
</div>
</asp:Content>
