<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PuntosTrabajo.ascx.vb" Inherits="Sistemas_Bitacora_PMP_PuntosTrabajo" %>
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
                DataKeyNames="IdPuntoTrabajo" DataSourceID="DataGridPuntosTrabajo">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="IdPuntoTrabajo" HeaderText="Id" ReadOnly="True" 
                        SortExpression="IdPuntoTrabajo" />
                    <asp:BoundField DataField="NombrePunto" HeaderText="Nombre Punto" 
                        SortExpression="NombrePunto" />
                    <asp:TemplateField HeaderText="Dependecia" SortExpression="NombreDependecia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ListBloquesGrid" runat="server" 
                                DataSourceID="DataListBloques" DataTextField="NombreDependecia" 
                                DataValueField="IdDependencia" 
                                SelectedValue='<%# Bind("IdDependencia") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DataListBloquesGrid" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                SelectCommand="SELECT IdDependencia, NombreDependecia FROM Sis_HV_Dependencias ORDER BY NombreDependecia">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NombreDependecia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataGridPuntosTrabajo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                SelectCommand="SELECT Sis_HV_PuntosTrabajo.IdPuntoTrabajo, Sis_HV_PuntosTrabajo.NombrePunto, Sis_HV_PuntosTrabajo.IdDependencia, Sis_HV_Dependencias.NombreDependecia FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia ORDER BY Sis_HV_PuntosTrabajo.NombrePunto" 
                UpdateCommand="UPDATE Sis_HV_PuntosTrabajo SET NombrePunto = @NombrePunto, IdDependencia = @IdDependencia WHERE (IdPuntoTrabajo = @IdPuntoTrabajo)">
                <UpdateParameters>
                    <asp:Parameter Name="NombrePunto" />
                    <asp:Parameter Name="IdDependencia" />
                    <asp:Parameter Name="IdPuntoTrabajo" />
                </UpdateParameters>
            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                            </asp:SqlDataSource>
        </td>
        <td style="width: 50%; vertical-align: top;" colspan="2">
            <asp:Button ID="BtnNuevoPunto" runat="server" Text="Crear Punto" />
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
                            Bloque o Dependencia</td>
                        <td style="width: 50%">
                            <asp:DropDownList ID="ListBloques" runat="server" 
                                DataSourceID="DataListBloques" DataTextField="NombreDependecia" 
                                DataValueField="IdDependencia">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DataListBloques" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                SelectCommand="SELECT IdDependencia, NombreDependecia FROM Sis_HV_Dependencias ORDER BY NombreDependecia">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            <asp:Label ID="LabelMsg" runat="server"></asp:Label>
                        </td>
                        <td style="width: 50%">
                            <asp:Button ID="BtnNuevoPunto0" runat="server" Text="Agregar Punto" />
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


