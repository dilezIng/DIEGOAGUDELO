<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TipoEquipos.ascx.vb" Inherits="Sistemas_Bitacora_PMP_TipoEquipos" %>
<style type="text/css">
    .style1
    {
        width: 50%;
        height: 26px;
    }
</style>
<table style="width: 1000px; font-family: tahoma; font-size: 10pt;">
    <tr>
        <td style="width: 50%; vertical-align: top;" colspan="2">
            <asp:GridView ID="GridPuntosTrabajo" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdTipoEquipo" DataSourceID="DataGridTipoEquipos">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="IdTipoEquipo" HeaderText="IdTipoEquipo" ReadOnly="True" 
                        SortExpression="IdTipoEquipo" InsertVisible="False" />
                    <asp:BoundField DataField="NomTipoEquipo" HeaderText="NomTipoEquipo" 
                        SortExpression="NomTipoEquipo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataGridTipoEquipos" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                SelectCommand="SELECT IdTipoEquipo, NomTipoEquipo FROM Sis_HV_TiposEquipo" 
                UpdateCommand="UPDATE Sis_HV_TiposEquipo SET NomTipoEquipo = @NombrePunto WHERE (IdTipoEquipo = @IdPuntoTrabajo)">
                <UpdateParameters>
                    <asp:Parameter Name="NombrePunto" />
                  
                    <asp:Parameter Name="IdPuntoTrabajo" />
                </UpdateParameters>
            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
        </td>
        <td style="width: 50%; vertical-align: top;" colspan="2">
            <asp:Button ID="BtnNuevoPunto" runat="server" Text="Crear Tipo Equipo" />
            <asp:Panel ID="PanelNuevoPunto" runat="server" Visible="False">
                
                <table style="width: 100%">
                    <tr>
                        <td colspan="2" 
                            style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;">
                            NUEVO PUNTO DE TRABAJO
                            <asp:Label ID="LabelEstadoForm" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            Id:</td>
                        <td style="width: 50%">
                            <asp:Label ID="LabelIdPunto" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" style="text-align: right;">
                            Nombre Punto:</td>
                        <td class="style1">
                            <asp:TextBox ID="TextNomPunto" runat="server" MaxLength="50" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            a</td>
                        <td style="width: 50%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            <asp:Label ID="LabelMsg" runat="server"></asp:Label>
                        </td>
                        <td style="width: 50%">
                            <asp:Button ID="BtnNuevoPunto0" runat="server" Text="Agregar Tipo Equipo" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            &nbsp;</td>
                        <td style="width: 50%">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
    </tr>
</table>


