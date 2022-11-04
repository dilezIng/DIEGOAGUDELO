<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CreacionMasivaUsuarios.aspx.vb" Inherits="UserAdmin_CreacionMasivaUsuarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 49%;
        }
        .style2
        {
            width: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="IdIndiUsers" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="IdUsuarioDG" HeaderText="IdUsuarioDG" 
                                SortExpression="IdUsuarioDG" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="vertical-align: top">
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
            SelectCommand="SELECT * FROM [Ind_IndiUsers]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
