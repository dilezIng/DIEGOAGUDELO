<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MarcasEquipos.ascx.vb" Inherits="Sistemas_Bitacora_PMP_PuntosTrabajo" %>
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
            <asp:GridView ID="GridMarcas" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IdMarca" DataSourceID="DataGridMarcas">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="IdMarca" HeaderText="Id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="IdMarca" />
                    <asp:BoundField DataField="NombreMarca" HeaderText="Nombre" 
                        SortExpression="NombreMarca" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataGridMarcas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                SelectCommand="SELECT IdMarca, NombreMarca FROM Sis_HV_Marcas ORDER BY NombreMarca" 
                
                UpdateCommand="UPDATE Sis_HV_Marcas SET NombreMarca = @NombreMarca WHERE (IdMarca = @IdMarca)">
                <UpdateParameters>
                    <asp:Parameter Name="NombreMarca" />
                    <asp:Parameter Name="IdMarca" />
                </UpdateParameters>
            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                            </asp:SqlDataSource>
        </td>
        <td style="width: 50%; vertical-align: top;" colspan="2">
            <asp:Button ID="BtnFormNuevaMarca" runat="server" Text="Crear Marca" />
            <asp:Panel ID="PanelNuevoPunto" runat="server" Visible="False">
                
                <table style="width: 100%">
                    <tr>
                        <td colspan="2" 
                            style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;">
                            NUEVA MARCA
                            <asp:Label ID="LabelEstadoForm" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            Id:</td>
                        <td style="width: 50%">
                            <asp:Label ID="LabelIdMarca" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" style="text-align: right;">
                            Nombre Marca:</td>
                        <td class="style1">
                            <asp:TextBox ID="TextNomMarca" runat="server" MaxLength="30" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            <asp:Label ID="LabelMsg" runat="server"></asp:Label>
                        </td>
                        <td style="width: 50%">
                            <asp:Button ID="BtnNuevaMarca" runat="server" Text="Agregar Marca" />
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


