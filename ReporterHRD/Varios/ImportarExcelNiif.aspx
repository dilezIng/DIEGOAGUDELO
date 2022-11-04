<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ImportarExcelNiif.aspx.vb" Inherits="Varios_ImportarExcelNiif" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
            Ruta y nombre archivo:         <asp:TextBox ID="TextBox1" 
            runat="server" Width="762px"></asp:TextBox>
        <br />
            Nombre de la hoja:
        <asp:TextBox ID="TextBox2" runat="server" Width="201px"></asp:TextBox>
        <br />
        Campos (separados por comas):
        <asp:TextBox ID="TextBox3" runat="server" Width="560px"></asp:TextBox>
        &nbsp; filtro:
        <asp:TextBox ID="TextBox4" runat="server" Width="145px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Consultar archivo Excel" />
    
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
        
        ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DataParaDinamica" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
        
        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Text="Obtener Ruta" />
&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button3" runat="server" Text="Insertar Datos en Puente" 
        Enabled="False" />
    &nbsp;<asp:Button ID="Button5" runat="server" 
        Text="Insertar Datos en Produccion" Enabled="False" />
    &nbsp;<asp:Button ID="Button4" runat="server" Text="Actualizar Datos" />
    
&nbsp;&nbsp; 
    
</asp:Content>

