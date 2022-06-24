<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Add_Student.aspx.cs" Inherits="Library_Management.Add_Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 471px;
            height: 415px;
        }
        .auto-style10 {
            width: 100%;
            border: solid 1px blue;
            background: #bce0f5;
            margin-left: 0px;
            margin-right: 0px;
        }
        .auto-style12 {
            width: 401px;
            height: 274px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table  class="auto-style10" style="font-size:small" align="center">
    <tr>
        <td class="tblhead">
            ADD NEW STUDENT</td>
    </tr>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="Panel1" runat="server">
            <table align="center">
                <tr>
                    <td class="lbl">
                        Student Name :</td>
                    <td>
                        <asp:TextBox ID="txtsname" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtsname" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    <td class="lbl">
                        Branch : </td>
                    <td>
                            <asp:DropDownList ID="drpbranch" runat="server" CssClass="txt">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="drpbranch" ErrorMessage="??" ForeColor="Red" 
                                 SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Gender&nbsp; : </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    
                    <td class="lbl">
                        Mobile : </td>
                    <td>
                        <asp:TextBox ID="txtmobile" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtmobile" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="txtmobile" ErrorMessage="??" ForeColor="Red" 
                            MaximumValue="9999999999" MinimumValue="1000000000" SetFocusOnError="True" 
                            Type="Double"></asp:RangeValidator>
                        </td>
                </tr>
                <tr>
                    <td class="lbl">
                        BirthDate : </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" TextMode="Date"></asp:TextBox>
                    </td>
                    <td class="lbl">
                        Address : </td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="lbl">
                        City : </td>
                    <td>
                        <asp:TextBox ID="txtcity" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td class="lbl">
                        Pincode : </td>
                    <td>
                        <asp:TextBox ID="txtpincode" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Photo : </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td class="lbl">
                        Email : </td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtemail" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtemail" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Password : </td>
                    <td>
                        <asp:TextBox ID="txtpass" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txtpass" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnadd" runat="server" CssClass="btn" Width="150px"
                            Text="ADD Student" Font-Size="Small" OnClick="btn_add_Click"/>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            
            </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <table align="center" class="auto-style12">
                            <tr>
                                <td class="tblhead" colspan="2">
                                    Edit Student Detail</td>
                            </tr>
            <asp:TextBox ID="lblid" runat="server" Visible="false"></asp:TextBox>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black;text-align:right">
                                    Name :</td>
                                <td align="center">
                                    <asp:TextBox ID="txtname" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black;text-align:right">
                                    Mobile :</td>
                                <td align="center">
                                    <asp:TextBox ID="txtname0" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black;text-align:right">
                                    Address :</td>
                                <td align="center">
                                    <asp:TextBox ID="txtname1" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black;text-align:right">
                                    City :</td>
                                <td align="center">
                                    <asp:TextBox ID="txtname2" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black;text-align:right">
                                    Pincode :</td>
                                <td align="center">
                                    <asp:TextBox ID="txtname3" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" style="font-weight:bold;color:black;text-align:right">
                                    Email :
                                </td>
                                <td align="center">
                                    <asp:TextBox ID="txtname4" runat="server" CssClass="txt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" style="font-weight:bold;color:black">
                                    &nbsp;</td>
                                <td align="left">
                                    <asp:Button ID="btnupdate" runat="server" CssClass="btn" Font-Size="Small" 
                                        Text="UPDATE" Width="100px" Onclick="btnupdate_Click"/>
                                    <asp:Button ID="Button1" CssClass="btn" Font-Size="Small" runat="server" Text="CANCEL" Onclick="btncancel_Click"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="lbludt" runat="server" ForeColor="Red"></asp:Label></td>
                            </tr>
                        </table>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1029px" AutoGenerateColumns="False" 
        AllowPaging="true"  align="center" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" AutoGenerateDeleteButton="true" AutoGenerateEditButton="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="Id" />  
                    <asp:BoundField HeaderText="Name" DataField="StudentName" />  
                    <asp:BoundField HeaderText="Branch" DataField="Branch" />  
                    <asp:BoundField HeaderText="DOB" DataField="DoB" />  
                    <asp:BoundField HeaderText="Mobile" DataField="Mobile" /> 
                    <asp:BoundField HeaderText="Email" DataField="Email" />  
                    <asp:BoundField HeaderText="City" DataField="City" />  
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
        </td>
    </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
</table>
</asp:Content>
