<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ImportarGlosasSaludcoop.aspx.vb" Inherits="Varios_ImportarGlosasSaludcoop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Button ID="BtnImportar" runat="server" Text="Importar" />
        &nbsp;
        <asp:Button ID="BtnImportar0" runat="server" Text="Consultar Archivo Excel" />
        &nbsp;&nbsp;
        <asp:Button ID="BtnImportar1" runat="server" Text="Importar Tabla Prinicpal" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
            SelectCommand="SELECT * FROM [z_DetalleGlosasSaludcoop]">
        </asp:SqlDataSource>
    </p>
    
    <p>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        </asp:RadioButtonList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="LblArchivo" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
    
</asp:Content>

