<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ImporValMedicamentos.aspx.vb" Inherits="Update_ImporValMedicamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Ruta del archivo:
    <asp:TextBox ID="TextBoxRuta" runat="server" Width="500px"></asp:TextBox>
    <br />
    Nombre de la hoja:
    <asp:TextBox ID="TextBoxHoja" runat="server" Width="200px"></asp:TextBox>
    <br />
    Campos:
    <asp:TextBox ID="TextBoxCampos" runat="server" Width="200px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Leer Archivo" />
&nbsp;<asp:Button ID="ButtonActualizar" runat="server" Text="Actualizar" />
    <br />
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:SqlDataSource ID="DataParaDinamica" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
        
        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

