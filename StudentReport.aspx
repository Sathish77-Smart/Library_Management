<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentReport.aspx.cs" Inherits="Library_Management.StudentReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
    {
        width: 739px;
    }
        .style2
        {
            width: 202px;
        }
        .style3
        {
            text-align: right;
            color: Green;
            width: 157px;
        }
        .style4
        {
            width: 561px;
        }
    .style5
    {
        text-align: right;
        color: Green;
        width: 249px;
    }
        .auto-style1 {
            width: 206px;
        }
        .auto-style2 {
            width: 435px;
        }
        .auto-style3 {
            width: 820px;
        }
        .auto-style4 {
            width: 172px;
        }
        .auto-style5 {
            text-align: right;
            color: black;
            width: 137px;
        }
        .auto-style6 {
            width: 170px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style8 {
            width: 650px;
        }
        .auto-style10 {
            height: 26px;
            width: 90px;
        }
        .auto-style11 {
            width: 90px;
        }
        .auto-style12 {
            width: 3px;
        }
        .auto-style13 {
            height: 26px;
            width: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl" align="center">
    <tr>
        <td class="tblhead">
            STUDENT REPORT</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="auto-style3" align="center" style="font-size:small">
                <tr>
                    <td class="lbl">
                        Select Branch :
                    </td>
                    <td class="auto-style4">
                            <asp:DropDownList ID="drpbranch" runat="server" CssClass="txt" OnSelectedIndexChanged="drpbranch_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                    <!--<td>
                        <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn" Font-Size="Small" OnClick="drpbranch_SelectedIndexChanged"/>
                    </td>-->
                    <td class="auto-style5">
                            Student Name :
                        </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt"></asp:DropDownList> 
                        </td>
                    <td>
                            <asp:Button ID="btnseach" runat="server" CssClass="btn" Font-Size="Small"
                                onclick="btnseach_Click" Text="View" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center">
                                <asp:Label ID="lblmsg" runat="server" ForeColor="Red" ></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
                                <asp:MultiView ID="MultiView1" runat="server">
                                    <asp:View ID="View1" runat="server">
                                        <table class="tbl" style="border:none" align="center">
                                            <tr>
                                                <td class="tblhead">
                                                    <asp:Label ID="lbl" runat="server" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr >
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                                                        onrowcommand="GridView1_RowCommand" style="text-align: center" Width="748px" Font-Size="Small" AllowPaging="true"  align="center">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="StudentName" HeaderText="StudentName" />
                                                            <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                                            <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%#Eval("Id") %>' 
                                                                        CssClass="lnk" Text="View"></asp:LinkButton>
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
                                        </table>
                                    </asp:View>
                    <asp:View ID="View2" runat="server">
                    <table class="tbl" align="center" style="border:none">
                        <tr>
                            <td class="tblhead">
                                Student Detail </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="auto-style8" align="center">
                                    <tr>
                                        <td class="style5" colspan="2" style="font-weight:bold;text-align:center;font-size:small">
                                            Student ID :
                                            <asp:Label ID="lblid" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style5" colspan="2" style="font-weight:bold;text-align:center;font-size:small">
                                            Student Name :
                                            <asp:Label ID="lblname" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" rowspan="2">
                                            <asp:Image ID="Image2" runat="server" Height="211px" Width="183px" />
                                        </td>
                                        <td>
                                            <table class="auto-style2" style="font-size:small">
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        Mobile :</td>
                                                    <td>
                                                        <asp:Label ID="lblmobile" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        Address :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbladdress" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        City :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblcity" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        Pincode :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblpin" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        BirthDate :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbldob" runat="server" TextMode="date"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">
                                                        </td>
                                                    <td class="auto-style10" style="font-size: small;font-weight:bold;">
                                                        Branch :
                                                    </td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="lblbranch" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="auto-style7">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td> 
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        Email :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblemai" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style12">
                                                        &nbsp;</td>
                                                    <td class="auto-style11" style="font-size: small;font-weight:bold;">
                                                        Password :
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblpass" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style9" valign="top">
                                            <asp:Button ID="Button1" runat="server" CssClass="btn" Font-Size="Small" 
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
    <tr>
        <td>
                                &nbsp;</td>
    </tr>
</table>
</asp:Content>
