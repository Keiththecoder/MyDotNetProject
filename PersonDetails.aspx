\]<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonDetails.aspx.cs" Inherits="DotNetProject.PersonDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Person Details</title>
    <script type="text/javascript" language="javascript">
function DeleteConfirmation()
{
 if (confirm("Are you sure,you want to delete selected records ?")==true)
 return true;
 else
 return false;
        }

        function ClearTextboxes()
        {
            document.getElementById('<%=insertid.ClientID%>').value = '';
            document.getElementById('<%=insertname.ClientID%>').value = ''; 
            document.getElementById('<%=insertlocation.ClientID %>').value = '';           
            return true;
        }
        
      
</script>
    <style type="text/css">
        .auto-style1 {
            width: 64%;
            height: 184px;
            background-color: #FFFF99;
        }
        .auto-style2 {
            width: 266px;
        }
        .auto-style3 {
            background-color: #FFFFCC;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <h1 class="auto-style3">Person Details Sample Database:</h1>
    <form id="form1" runat="server">
        <div class="auto-style5">

            <div class="auto-style4">

            &nbsp;<br />
            <br />
&nbsp;</div>
            <asp:GridView ID="GridView1" runat="server" 
                             AllowPaging="True" 
                             DataSourceID="SqlDataSource1" 
                             AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
<Columns>
    <asp:TemplateField HeaderText="Select">
    <ItemTemplate>
    <asp:CheckBox ID="chkSelect" runat="server" 
                  AutoPostBack="true" 
             OnCheckedChanged="chkSelect_CheckedChanged"/>
    </ItemTemplate>
    
    </asp:TemplateField>
    <asp:BoundField DataField="ID" HeaderText="ID" 
                                   SortExpression="ID"/>
                                   
    <asp:TemplateField HeaderText="Name" 
                       SortExpression="Name">
    <ItemTemplate>
    <asp:TextBox ID="txtName" runat="server" 
                 Text='<%# Bind("Name") %>' ReadOnly="true" 
                 ForeColor="Blue" BorderStyle="none" 
                 BorderWidth="0px" >
    </asp:TextBox>
    </ItemTemplate>
    </asp:TemplateField>
    
    <asp:TemplateField HeaderText="Location" 
                       SortExpression="Location">
    <ItemTemplate>
    <asp:TextBox ID="txtLocation" runat="server" 
                 Text='<%# Bind("Location") %>' 
                 ReadOnly="true" ForeColor="Blue" 
                 BorderStyle="none" BorderWidth="0px">
    </asp:TextBox>
    </ItemTemplate>
    </asp:TemplateField>
</Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>


        
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Details WHERE (ID = @ID)" SelectCommand="SELECT [ID], [Name], [Location] FROM [Details]" UpdateCommand="UPDATE [Details] SET [Name] = @Name, 
              [Location] = @Location WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Location" />
                    <asp:Parameter Name="ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            Insert Data into the Table:<br />
            <br />
            <table class="auto-style1" border="1">
                <tr>
                    <td class="auto-style2">ID:</td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="insertid" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name:</td>
                    <td>&nbsp;<asp:TextBox ID="insertname" runat="server"></asp:TextBox>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Location:</td>
                    <td>&nbsp;<asp:TextBox ID="insertlocation" runat="server"></asp:TextBox>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


        
<asp:Button ID="btnUpdate" runat="server" 
            OnClick="btnUpdate_Click" Text="Update" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
<asp:Button ID="btnDelete" runat="server" 
            OnClick="btnDelete_Click" 
            OnClientClick="return DeleteConfirmation();"  
            Text="Delete" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Clear" runat="server" Text="Clear All " OnClientClick="return ClearTextboxes();" />
            <br />
            <br />


        
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">Signout</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
        </div>
    </form>
</body>
</html>
