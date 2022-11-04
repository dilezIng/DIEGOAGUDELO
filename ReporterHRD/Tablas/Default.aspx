<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Tablas_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"
            
            
            ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %> timeout=300"
            ProviderName="Expression: DbBridgeConnectionString" 
            InsertCommand="INSERT INTO Observaciones(Observacion) VALUES (N'Prueba')">
        </asp:SqlDataSource>
    
    </div>
        <asp:Button ID="Button1" runat="server" Text="Ejecutar Consulta" Font-Bold="True" ForeColor="#CC0000" />&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Insertar" Enabled="False" />&nbsp;
        <asp:Button ID="Button3" runat="server" Text="Delete" Visible="False" />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
    <asp:CheckBox ID="CheckBox1" runat="server" Text="Consulta Select" 
        Visible="False" />
    <br />
        <asp:TextBox ID="TextConsulta" runat="server" Height="401px" TextMode="MultiLine"
            Width="677px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="671px" 
        
        Text="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\DbBridge.mdf;Integrated Security=True;User Instance=True"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        Visible="False">
    </asp:GridView>
    <br />
    <br />
    </form>
</body>
</html>
