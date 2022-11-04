<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Roles.aspx.vb" Inherits="UserAdmin_Roles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Roles</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Crear Role" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="RoleName" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="RoleId" HeaderText="Id" SortExpression="RoleId" />
                <asp:BoundField DataField="RoleName" HeaderText="Nombre del Role" 
                    SortExpression="RoleName" />
            </Columns>
            <SelectedRowStyle BackColor="#FF66CC" />
        </asp:GridView>
        <br />
        <asp:Button ID="Button2" runat="server" Enabled="False" Text="Eliminar Role" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi" 
		
            ProviderName="System.Data.SqlClient" 
            
            SelectCommand="SELECT RoleId, RoleName FROM vw_aspnet_Roles ORDER BY RoleName">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
