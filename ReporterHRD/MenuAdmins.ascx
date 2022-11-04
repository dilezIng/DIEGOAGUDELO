<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuAdmins.ascx.vb" Inherits="WebUserControl" %>
<asp:Menu ID="Menu1" runat="server" BackColor="Red" Font-Bold="True" 
    Font-Names="Tahoma" Font-Size="10pt" ForeColor="White" Orientation="Horizontal" 
    style="text-align: right">
    <DynamicHoverStyle BackColor="#CC3300" />
    <DynamicMenuItemStyle BackColor="Red" />
    <Items>
        <asp:MenuItem Selectable="False" Text="Opciones" Value="Opciones">
            <asp:MenuItem NavigateUrl="~/Update/DescoEpicri.aspx" 
                Text="Desconfirmar Epicrisis" Value="Desconfirmar Epicrisis"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Update/HomologarHCs.aspx" 
                Text="Homologar Historias Clinicas" Value="Homologar Historias Clinicas">
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Update/CambiarDocumento.aspx" 
                Text="Actualizar Datos de Pacientes" Value="Actualizar Datos de Pacientes">
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Varios/FirmasMedicos/Firma.aspx" Text="Subir Firma" Value="Subir Firma"></asp:MenuItem>
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/Sistemas/Bitacora_PMP/PaginaBase.aspx" 
            Text="Hojas de Vida Equipos" Value="Hojas de Vida Equipos"></asp:MenuItem>
    </Items>
</asp:Menu>

