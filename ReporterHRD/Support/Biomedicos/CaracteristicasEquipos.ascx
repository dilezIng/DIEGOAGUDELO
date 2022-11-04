<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CaracteristicasEquipos.ascx.vb" Inherits="Sistemas_Bitacora_PMP_CarcteristicasEquipos" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>

<table style="width: 1000px; font-family: tahoma; font-size: 10pt;">
    <tr>
        <td colspan="2" style="width: 50%; vertical-align: top">
            <asp:GridView ID="GridViewComponentes" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="IdTipoComponente" 
                DataSourceID="DataGridComponentes">
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="IdTipoComponente" HeaderText="Id" 
                        InsertVisible="False" ReadOnly="True" SortExpression="IdTipoComponente" />
                    <asp:TemplateField HeaderText="Nombre" SortExpression="NomTipoComponente">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" 
                                Text='<%# Bind("NomTipoComponente") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NomTipoComponente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" 
                        SortExpression="Activo" />
                    <asp:TemplateField HeaderText="Unidad" SortExpression="AbreviaturaUnidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ListUnidadesMedida" runat="server" 
                                DataSourceID="DataListUnidMedida" DataTextField="NomUnidad" 
                                DataValueField="IdUnidadMedida" SelectedValue='<%# Bind("UnidadMedida") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DataListUnidMedida" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                SelectCommand="SELECT IdUnidadMedida, NomUnidad + N'(' + AbreviaturaUnidad + N')' AS NomUnidad FROM Sis_HV_UnidadesMedida ORDER BY NomUnidad">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("AbreviaturaUnidad") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                            <asp:SqlDataSource ID="DataGridComponentes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                
                                
                SelectCommand="SELECT Sis_HV_TiposComponentes.IdTipoComponente, Sis_HV_TiposComponentes.NomTipoComponente, Sis_HV_TiposComponentes.Activo, Sis_HV_UnidadesMedida.AbreviaturaUnidad, Sis_HV_TiposComponentes.UnidadMedida FROM Sis_HV_TiposComponentes INNER JOIN Sis_HV_UnidadesMedida ON Sis_HV_TiposComponentes.UnidadMedida = Sis_HV_UnidadesMedida.IdUnidadMedida WHERE (Sis_HV_TiposComponentes.IdTipoComponente &gt; 1)" 
                InsertCommand="INSERT INTO Sis_HV_TiposComponentes(NomTipoComponente, Activo, UnidadMedida) VALUES (@NomTipoComponente, @Activo, @UnidadMedida)" 
                UpdateCommand="UPDATE Sis_HV_TiposComponentes SET NomTipoComponente = @NomTipoComponente, Activo = @Activo, UnidadMedida = @UnidadMedida WHERE (IdTipoComponente = @IdTipoComponente)">
                                <InsertParameters>
                                    <asp:Parameter Name="NomTipoComponente" />
                                    <asp:Parameter Name="Activo" />
                                    <asp:Parameter Name="UnidadMedida" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="NomTipoComponente" />
                                    <asp:Parameter Name="Activo" />
                                    <asp:Parameter Name="UnidadMedida" />
                                    <asp:Parameter Name="IdTipoComponente" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
        <td colspan="2" style="width: 50%; vertical-align: top">

            <asp:Button ID="BtnNueva" runat="server" Text="Nueva Categoria" />

      
            <asp:Panel ID="FormComponente" runat="server" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Visible="False">
                <table class="style1">
                    <tr>
                        <td colspan="2" 
                            style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;">
                            COMPONENTES
                            <asp:Label ID="LabelEstadoForm" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            Id:</td>
                        <td style="width: 50%">
                            <asp:Label ID="LabelIdComponente" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            Nombre:</td>
                        <td style="width: 50%">
                            <asp:TextBox ID="TextNomComponente" runat="server" MaxLength="50" Width="98%" 
                                AutoCompleteType="Disabled"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            Unidad de Medida:</td>
                        <td style="width: 50%">
                            <asp:DropDownList ID="ListUnidadesMedida" runat="server" 
                                DataSourceID="DataListUnidadesMedida" DataTextField="NomUnidad" 
                                DataValueField="IdUnidadMedida">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DataListUnidadesMedida" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                
                                SelectCommand="SELECT IdUnidadMedida, NomUnidad + N'(' + AbreviaturaUnidad + N')' AS NomUnidad FROM Sis_HV_UnidadesMedida ORDER BY NomUnidad">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            Estado:</td>
                        <td style="width: 50%">
                            <asp:CheckBox ID="CheckEstado" runat="server" Text="Activo" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right;">
                            <asp:Label ID="LabelMsg" runat="server" 
                                style="font-weight: 700; color: #FF0000" Visible="False"></asp:Label>
                        </td>
                        <td style="width: 50%">
                            <asp:Button ID="BtnGuardarComponente" runat="server" Text="Agregar" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td style="width: 25%">
                            <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                            </asp:SqlDataSource>
                        </td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
    </tr>
</table>

