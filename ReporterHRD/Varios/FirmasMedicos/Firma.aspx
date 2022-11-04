<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Firma.aspx.vb" Inherits="Varios_FirmasMedicos_Firma" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;">
        <tr>
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; background-color: #006098; color: #FFFFFF;">
                Actualizar Firma y Foto de Usuarios<asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                Buscar Usuario:&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="75%"></asp:TextBox>
                <asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" 
                    ServiceMethod="BusqUsuario" TargetControlID="TextBox1">
                </asp:AutoCompleteExtender>
            </td>
            <td colspan="2">
                <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" />
&nbsp;
                <asp:Label ID="LblIdUser" runat="server" 
                    style="font-weight: 700; color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">Anexar Firma</asp:ListItem>
                    <asp:ListItem Value="1">Anexar Foto</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%">
    <asp:Button ID="Button1" runat="server" Text="Descargar" Enabled="False" />
            </td>
            <td style="width: 25%">
<asp:FileUpload ID="FileUpload1" runat="server" Enabled="False" />
            </td>
            <td style="width: 25%">
<asp:Button ID="Button2" runat="server" Text="Subir Imagen" Enabled="False" />
            </td>
            <td style="width: 25%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Image ID="ImgFirma" runat="server" Visible="False" />
            </td>
        </tr>
    </table>
<br />
<asp:Label ID="Label1" runat="server"></asp:Label>
<br />
<br />
<asp:Image ID="Image2" runat="server" />
</asp:Content>

