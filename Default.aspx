<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library_Management.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css"/>
    <script src="~/Scripts/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .style1
        {
            width: 100px;
        }
        #login{
            position: absolute;
            background-color: #5d8ef0;
            left: 40%;
            top: 10%;
            border: 1px solid #ccc;
            padding: 60px 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <h1 style="text-align:center;">LIBRARY MANAGEMENT</h1>
        <br />
    <div id="login" style="box-shadow: 0px 10px 20px rgba(198, 198, 198, 0.15);border-radius: 12px;">
        <table class="tbl">
            <tr>
                <td class="tblhead" style="text-align:center;font-weight:bold;font-size:larger" colspan="2">
                    Login</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lbl" runat="server" Font-Size="11px" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    UserName &nbsp;: &nbsp;</td>
                <td>
                    <asp:TextBox ID="txtuname" runat="server" CssClass="txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtuname" ErrorMessage="!!!" ForeColor="Red" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td class="lbl">
                    Password &nbsp;&nbsp;: &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtupass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtupass" ErrorMessage="!!!" ForeColor="Red" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:RadioButton ID="rdolibrary" runat="server" Checked="True" 
                        ForeColor="black" GroupName="a" Text="Librarian" />
&nbsp;<asp:RadioButton ID="rdosudent" runat="server" ForeColor="black" GroupName="a" 
                        Text="Student" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-sm btn-secondary" Text="Login" 
                        Width="80px" Font-Size="10pt" OnClick="Button1_Click"/>
                </td>
            </tr>
        </table>
    </div>
    
    </form>
</body>
</html>
