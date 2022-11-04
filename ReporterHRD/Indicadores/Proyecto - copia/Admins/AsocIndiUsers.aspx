<%@ Page Title="Asociación de Indicadores y Usuarios" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="AsocIndiUsers.aspx.vb" Inherits="Indicadores_Proyecto_Admins_AsocIndiUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../../Images/Fondo01.jpg');" 
                >
                Asociar Indicadores y Usuarios</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">Por Indicador</asp:ListItem>
                    <asp:ListItem Value="1">Por Usuario</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                                    <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                        
                    ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>" 
                    InsertCommand="INSERT INTO Ind_IndiUsers(IdIndicador, IdUsuarioDG) VALUES (1, 2)">
                                    </asp:SqlDataSource>
                                </td>
        </tr>
        <tr >
            <td style="width: 100%" colspan="4" >
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td style="width: 34%; font-weight: bold; font-size: 14pt; color: #FFFFFF; background-image: url('../../../Images/Fondo01.jpg'); text-align: center;">
                                INDICADOR</td>
                            <td style="width: 33%; font-weight: bold; font-size: 14pt; color: #FFFFFF; background-image: url('../../../Images/Fondo01.jpg'); text-align: center;">
                                USUARIOS ASIGNADOS</td>
                            <td style="width: 33%; font-weight: bold; font-size: 14pt; color: #FFFFFF; background-image: url('../../../Images/Fondo01.jpg'); text-align: center;">
                                USUARIOS SIN ASIGNAR</td>
                        </tr>
                        <tr>
                            <td rowspan="2" 
                                style="width: 34%; font-size: 10pt; vertical-align: top;">
                                <asp:Panel ID="Panel2" runat="server" Height="600px" ScrollBars="Auto">
                                    <asp:RadioButtonList ID="ListIndicadores" runat="server" AutoPostBack="True" 
                                        DataSourceID="DataListIndicadores" DataTextField="CodNomIndicador" 
                                        DataValueField="IdIndicador" style="font-size: 10pt">
                                    </asp:RadioButtonList>
                                    <asp:SqlDataSource ID="DataListIndicadores" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                        SelectCommand="SELECT IdIndicador, CodIndicador + N' - ' + NomIndicador AS CodNomIndicador FROM Ind_Principal">
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                            <td colspan="2" 
                                
                                
                                style="font-weight: normal; font-size: 11pt; color: #FFFFFF; background-image: url('../../../Images/Fondo02.jpg'); text-align: justify;">
                                <asp:Label ID="LabelIndSeleccionado" runat="server" 
                                    style="font-weight: 700; font-size: 10pt"></asp:Label>
                                <br />
                                
                                <asp:Label ID="LabelDescIndSeleccionado" runat="server" style="font-size: 9pt"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 33%; vertical-align: top;">
                                <asp:Panel ID="Panel4" runat="server" Height="600px" ScrollBars="Auto">
                                    <asp:CheckBoxList ID="ListUsActivs" runat="server" style="font-size: 10pt">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="DataListUsActivs" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT OID AS IdUsuario, USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario, USUNOMBRE FROM GENUSUARIO WHERE (NOT (USUNOMBRE LIKE N'%MI%')) AND (NOT (USUNOMBRE LIKE N'%TRI%')) AND (USUESTADO = 1) AND (NOT (USUNOMBRE LIKE N'%AME%')) AND (NOT (USUNOMBRE LIKE N'%JET%')) ORDER BY LTRIM(USUDESCRI)">
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                            <td style="width: 33%; vertical-align: top;">
                                <asp:Panel ID="Panel3" runat="server" Height="600px" ScrollBars="Auto">
                                    <asp:CheckBoxList ID="ListUsuarios" runat="server" 
                                        DataSourceID="DataListUsuarios" DataTextField="NomUsuario" 
                                        DataValueField="IdUsuario" style="font-size: 10pt">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource ID="DataListUsuarios" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT OID AS IdUsuario, USUDESCRI + N' (' + USUNOMBRE + N')' AS NomUsuario, USUNOMBRE FROM GENUSUARIO WHERE (NOT (USUNOMBRE LIKE N'%MI%')) AND (NOT (USUNOMBRE LIKE N'%TRI%')) AND (USUESTADO = 1) AND (NOT (USUNOMBRE LIKE N'%AME%')) AND (NOT (USUNOMBRE LIKE N'%JET%')) ORDER BY LTRIM(USUDESCRI)">
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 34%; vertical-align: top;">
                                &nbsp;</td>
                            <td style="width: 33%; vertical-align: top; text-align: center;">
                                <asp:Button ID="BtnEliminar" runat="server" 
                                    Text="Eliminar Usuarios Seleccionados" />
                            </td>
                            <td style="width: 33%; vertical-align: top; text-align: center;">
                                <asp:Button ID="BtnAsignar" runat="server" 
                                    Text="Asignar Usuarios Seleccionados" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr >
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

