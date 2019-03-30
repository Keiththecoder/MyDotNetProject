<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="DotNetProject.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            width: 72%;
        }
        .auto-style3 {
            width: 193px;
        }
        .auto-style4 {
            width: 193px;
            height: 34px;
        }
        .auto-style5 {
            height: 34px;
            width: 934px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            width: 934px;
        }
        .newStyle1 {
            font-family: Arial;
            background-color: #99CCFF;
        }
        .auto-style8 {
            width: 193px;
            height: 36px;
        }
        .auto-style9 {
            width: 934px;
            height: 36px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 style="text-align: center">User Registration:</h2>
        <h3 style="text-align: center" class="auto-style1"><span class="auto-style1">Enter Your Details:</span></h3>
        <table bgcolor="#FFFFCC" class="auto-style2">
            <tr>
                <td class="auto-style3">Name :</td>
                <td class="auto-style7">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="username" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Username: </td>
                <td class="auto-style5">&nbsp;<asp:TextBox ID="name" runat="server"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Password: </td>
                <td class="auto-style7">&nbsp;<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Confirm Password: </td>
                <td class="auto-style7">&nbsp;
            <asp:TextBox ID="confirmpassword" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmpassword" ErrorMessage="Passwords Don't Match"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;Mobile No:&nbsp;</td>
                <td class="auto-style7">&nbsp;<asp:TextBox ID="mobileno" runat="server"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Email ID: </td>
                <td class="auto-style5">&nbsp;<asp:TextBox ID="emailid" runat="server"></asp:TextBox>
                    &nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailid" ErrorMessage="Please Enter a Valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;Address: &nbsp;</td>
                <td class="auto-style5">&nbsp;<asp:TextBox ID="address" runat="server"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Age: </td>
                <td class="auto-style9">&nbsp;<asp:TextBox ID="age" runat="server"></asp:TextBox>
                    &nbsp;
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="age" ErrorMessage="Age Should Be Between 18 to 80" MaximumValue="80" MinimumValue="18"></asp:RangeValidator>
                </td>
            </tr>
        </table>
        <p>
            &nbsp; Status:
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
        <p class="auto-style6">
            <asp:Button ID="Button1" runat="server" Text="Create User " OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" BorderStyle="Outset" NavigateUrl="~/Default.aspx">Go To Login Page</asp:HyperLink>
        </p>
        <p>
            &nbsp;&nbsp;
        </p>
        <p class="auto-style6">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p class="auto-style1">
            &nbsp;&nbsp;
        </p>
        <p class="auto-style1">
            &nbsp;
&nbsp;
        </p>
        <p class="auto-style1">
            &nbsp;
&nbsp;
            </p>
        <p class="auto-style1">
            &nbsp;&nbsp;
&nbsp;
        </p>
        <p class="auto-style1">
            &nbsp;
&nbsp;
            </p>
        <p class="auto-style1">
            &nbsp;
&nbsp;
        </p>
        <p class="auto-style1">
            &nbsp;
&nbsp;
            </p>
        <p class="auto-style1">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        <p>
            &nbsp;</p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </form>
</body>
</html>
