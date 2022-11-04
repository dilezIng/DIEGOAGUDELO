
<%@ Control Language="VB" AutoEventWireup="false" CodeFile="HojaVida.ascx.vb" Inherits="Support_Biomedicos_HojaVida" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


 <script language="javascript">

     function ShowModalPopup() {

         $find("Panel1_ModalPopupExtender").show();

     }

     function HideModalPopup() {

         $find("Panel1_ModalPopupExtender").hide();

     }

</script>
  
    
<style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    .style1
    {
        width: 100%;
    }
           
    .style2
    {
        width: 16%;
    }
           
    .auto-style1 {
        height: 133px;
    }
           
    </style>

 <table style="width: 1000px; font-family: tahoma; font-size: 10pt;">
    <tr>
                        <td style="width: 25%; text-align: right;">
                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
                            </asp:ScriptManager>
                            Dependencia:
                            <asp:DropDownList ID="ListDependenciasFil" runat="server" 
                                DataSourceID="DataListDependenciasFil" DataTextField="NombreDep" 
                                DataValueField="IdDependencia" AutoPostBack="True" Width="160px">
                            </asp:DropDownList>
                                <asp:SqlDataSource ID="DataListDependenciasFil" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                  SelectCommand="SELECT IdDependencia, CASE WHEN IdDependencia = 1 THEN 'Todos' ELSE NombreDependecia END AS NombreDep, NombreDependecia FROM Sis_HV_Dependencias ORDER BY NombreDependecia">
                                </asp:SqlDataSource>

                            <br />Tipo Equipo:
                            <asp:DropDownList ID="ListTipoEqFil" runat="server" 
                                DataSourceID="DataListTipoEqFil" DataTextField="NomTipEq" 
                                DataValueField="IdTipoEquipo" AutoPostBack="True" Width="160px">
                            </asp:DropDownList>
                                <asp:SqlDataSource ID="DataListTipoEqFil" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                  
                                SelectCommand="SELECT IdTipoEquipo, CASE WHEN IdTipoEquipo = 1 THEN 'Todos' ELSE NomTipoEquipo END AS NomTipEq FROM Sis_HV_TiposEquipo ORDER BY NomTipoEquipo">
                                </asp:SqlDataSource>

                        </td>
                        <td style="width: 25%">
                            Serial:
                            <asp:TextBox ID="TxtSerialEquipoFil" runat="server" AutoPostBack="True"></asp:TextBox>
                        </td>
                        <td style="width: 25%">
                            <asp:Button ID="BtnBuscarCompo" runat="server" 
                                Text="Buscar por Componente" />
                        </td>
                        <td style="width: 25%; text-align: right;">
                                <asp:Button ID="BtnEditarEq" runat="server" Text="Editar Datos" 
                                Visible="False" />
                            <asp:Button ID="BtnFinalizar" runat="server" 
                                Text="Finalizar Edición" Visible="False" />
                            <asp:Button ID="BtnMostrarNuevoEquipo" runat="server" 
                                Text="Agregar Nuevo Equipo" />
                        </td>
                    </tr>
    <tr>
                        <td colspan="2">
                            <asp:Label ID="LabelCantEquipos" runat="server" ForeColor="Gray"></asp:Label>

                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%; text-align: right;">
                            &nbsp;</td>
                    </tr>
    <tr>
        <td colspan="4" 
            style="border-top-style: solid; border-width: 1px; border-color: #C0C0C0">

                                           <asp:GridView ID="GridEquipos" 
                runat="server" AutoGenerateColumns="False" 
                                               DataKeyNames="IdEquipo" 
                DataSourceID="DataListEquipos" EmptyDataText="No hay equipos registrados." AllowSorting="True">
                                               <AlternatingRowStyle BackColor="#F0F0F0" />
                                               <Columns>
                                                   <asp:CommandField ShowSelectButton="True" />
                                                   <asp:BoundField DataField="IdEquipo" HeaderText="Id" 
                                                       InsertVisible="False" ReadOnly="True" SortExpression="IdEquipo" />
                                                   <asp:BoundField DataField="CodigoEquipo" HeaderText="Codigo" 
                                                       SortExpression="CodigoEquipo" />
                                                   <asp:BoundField DataField="Serial" HeaderText="Serial" 
                                                       SortExpression="Serial" />
                                                   <asp:BoundField DataField="NombreMarca" HeaderText="Marca" 
                                                       SortExpression="NombreMarca" />
                                                   <asp:BoundField DataField="NomTipoEquipo" HeaderText="Tipo" 
                                                       SortExpression="NomTipoEquipo" />
                                                   <asp:BoundField DataField="NombreEquipo" HeaderText="Nombre" 
                                                       SortExpression="NombreEquipo" />
                                                   <asp:BoundField DataField="NombrePunto" HeaderText="Punto - Lugar" 
                                                       SortExpression="NombrePunto" />
                                                   <asp:BoundField DataField="NombreDependecia" HeaderText="Dependecia" 
                                                       SortExpression="NombreDependecia" />
                                                   <asp:BoundField DataField="DireccionIP" HeaderText="IP" 
                                                       SortExpression="DireccionIP" />
                                                   <asp:CheckBoxField DataField="Activo" HeaderText="Activo" 
                                                       SortExpression="Activo" />
                                               </Columns>
                                           </asp:GridView>
                                <asp:SqlDataSource ID="DataListEquipos" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                    
                                    
                
                                               
                                               
                                               
                                               
                                               
                                               SelectCommand="SELECT Sis_HV_Equipos.IdEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_Marcas_1.NombreMarca, Sis_HV_Equipos.Activo, Sis_HV_Dependencias.NombreDependecia, Sis_HV_PuntosTrabajo.NombrePunto, CASE WHEN Sis_HV_PuntosTrabajo.IdDependencia IS NULL THEN 1 ELSE Sis_HV_PuntosTrabajo.IdDependencia END AS IdDependencia, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia RIGHT OUTER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_1 INNER JOIN Sis_HV_Equipos ON Sis_HV_Marcas_1.IdMarca = Sis_HV_Equipos.Marca INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1) OR (Sis_HV_UbicacionesEquipos.UbicacionActual IS NULL)">
                                </asp:SqlDataSource>

                                           <br />

            <asp:Panel ID="PanelFormEquipo" runat="server">
                <asp:Panel ID="PanelDatosEquipo" runat="server" GroupingText="Información Básica del Equipo" 
                    Visible="False" BackColor="#EBEBEB">
                    <table style="width: 100%">
                        <tr>
                            <td style="border: 1px solid #C0C0C0; width: 25%; ">
                                Id Equipo:
                                <asp:Label ID="LabelIdEquipo" runat="server" 
                                    style="font-weight: 700; font-size: 14pt"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                Tipo de Equipo:
                                <asp:DropDownList ID="ListTipoEquipo" runat="server" 
                                    DataSourceID="DataListTipoEquipo" DataTextField="NomTipoEquipo" 
                                    DataValueField="IdTipoEquipo" Width="120px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DataListTipoEquipo" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                    SelectCommand="SELECT [IdTipoEquipo], [NomTipoEquipo] FROM [Sis_HV_TiposEquipo] ORDER BY [NomTipoEquipo]">
                                </asp:SqlDataSource>
                            </td>
                            <td style="width: 25%">
                                Codigo:
                                <asp:TextBox ID="TextBoxCodigo" runat="server" MaxLength="20" 
                                    Width="140px"></asp:TextBox>
                            </td>
                            <td style="width: 25%; text-align: center;">
                                
                                <asp:CheckBox ID="CheckActivo" runat="server" Checked="True" Text="Activo" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Descripción:
                                <asp:TextBox ID="TextBoxDescripcion" runat="server" MaxLength="500" 
                                    Width="380px"></asp:TextBox>
                            </td>
                            <td style="width: 25%">
                                Marca:
                                <asp:DropDownList ID="ListMarcaEquipo" runat="server" 
                                    DataSourceID="DataListMarcaEquipo" DataTextField="NombreMarca" 
                                    DataValueField="IdMarca">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DataListMarcaEquipo" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                    SelectCommand="SELECT IdMarca, NombreMarca FROM Sis_HV_Marcas ORDER BY NombreMarca">
                                </asp:SqlDataSource>
                            </td>
                            <td style="width: 25%; text-align: left;">
                                Modelo:
                                <asp:TextBox ID="TextModeloEquipo" runat="server" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                Número Serial:
                                <asp:TextBox ID="TextBoxSerial" runat="server" MaxLength="50" 
                                    Width="140px"></asp:TextBox>
                            </td>
                            <td style="width: 25%">
                                MAC:
                                <asp:TextBox ID="TextBoxMAC" runat="server" MaxLength="17" Width="140px"></asp:TextBox>
                            </td>
                            <td style="width: 25%">
                                Fecha de Compra:
                                <asp:TextBox ID="TextFechaCompra" runat="server" Width="100px"></asp:TextBox>
                                <asp:MaskedEditExtender ID="TextFechaCompra_MaskedEditExtender" runat="server" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaCompra" 
                                    UserDateFormat="DayMonthYear" />
                                <asp:CalendarExtender ID="TextFechaCompra_CalendarExtender" runat="server" 
                                    TargetControlID="TextFechaCompra" />
                            </td>
                            <td style="width: 25%; text-align: right;">
                                <asp:Label ID="LabelTipoConexion" runat="server" style="font-weight: 700"></asp:Label>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width: 50%;">
                                Ubicación actual: 
                                <asp:Label ID="LabelUbicacion" runat="server" style="font-weight: 700"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                IP:
                                <asp:Label ID="Label_IP" runat="server" style="font-weight: 700"></asp:Label>
                            </td>
                            <td style="width: 25%; text-align: right;">
                                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar Datos" 
                                    Visible="False" />
                                <asp:Button ID="BtnAgregar" runat="server" Text="Crear Equipo" />
                                <asp:Button ID="BtnGuardarEq" runat="server" Text="Guardar Datos" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                
               
                <table style="width: 100%; font-family: tahoma; font-size: 10pt;">
                    <tr>
                        <td colspan="3" style="text-align: left;">
                            <asp:Literal ID="Literal1" runat="server" Text="Adjuntar Foto: " 
                                    Visible="False"></asp:Literal>
                                <asp:FileUpload ID="FileUpload2" runat="server" 
                                    Visible="False" />
                                &nbsp;
                                <asp:Button ID="BtnSubirArchivoEquipo" runat="server" Text="Adjuntar Foto" 
                                    Visible="False" />
                            <asp:Label ID="LabelNomFoto" runat="server"></asp:Label>
                            <asp:Label ID="LabelUploadEquipo" runat="server"></asp:Label>
                        </td>
                        <td style="width: 40%; text-align: right;">
                            <asp:Button ID="BtnMantenimeintos" runat="server" Text="Mantenimientos" />
                            <asp:Button ID="BtnUbicaciones" runat="server" Text="Ubicaciones" 
                                Visible="False" />
                            <asp:Button ID="BtnAgregarComponente" runat="server" Text="Agregar Componente" 
                                Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; vertical-align: top;" colspan="2">
                            <asp:DetailsView ID="VistaFotosEquipo" runat="server" AllowPaging="True" 
                                AutoGenerateRows="False" DataKeyNames="IdFotoEquipo" 
                                DataSourceID="DataListFotosEquipo" 
                                EmptyDataText="No se han anexado fotos del equipo." style="text-align: center" 
                                Width="100%" Visible="False">
                                <Fields>
                                    <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" 
                                        SortExpression="UrlFoto">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("UrlFoto") %>' 
                                                Width="100%" />
                                            <asp:Label ID="FechaInsercion" runat="server" 
                                                Text='<%# Eval("FechaInsercion") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="UrlFoto" 
                                                Mode="Edit" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="UrlFoto" 
                                                Mode="Insert" />
                                        </InsertItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <PagerStyle BackColor="#F0F0F0" HorizontalAlign="Center" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="DataListFotosEquipo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                SelectCommand="SELECT IdFotoEquipo, UrlFoto, IdEquipo, FechaInsercion FROM Sis_HV_FotosEquipos WHERE (IdEquipo = @IdEquipo) ORDER BY FechaInsercion DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="LabelIdEquipo" Name="IdEquipo" 
                                        PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 1px solid #CCCCCC; width: 50%; vertical-align: top;" 
                            colspan="2">
                            <asp:RadioButtonList ID="ListEstadoComponentes" runat="server" 
                                AutoPostBack="True" RepeatDirection="Horizontal" Visible="False">
                                <asp:ListItem Selected="True" Value="0">Instalados</asp:ListItem>
                                <asp:ListItem Value="1">Retirados o desinstalados</asp:ListItem>
                                <asp:ListItem Value="9">Todos</asp:ListItem>
                            </asp:RadioButtonList>
                            
                            <asp:Label ID="LabelCantCompo" runat="server" ForeColor="#006600"></asp:Label>
                            
                            <asp:GridView ID="GridComponentes" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="IdComponente,UrlFoto,Observaciones,Sustituido" DataSourceID="DataGridComponentes" 
                                Width="100%" EmptyDataText="No hay componentes" 
                                Visible="False" BorderColor="Silver">
                                <AlternatingRowStyle BackColor="#F0F0F0" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False" HeaderText="Estado">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandArgument="<%# Container.DataItemIndex %>" CommandName="Instalar" 
                                                ImageUrl='<%# Eval("urlSustituido") %>' Text="Instalado" 
                                                ToolTip="Instalado o Desinstalado" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NomTipoComponente" HeaderText="Componente" 
                                        SortExpression="NomTipoComponente" />
                                    <asp:BoundField DataField="Tamaño" HeaderText="Tam" ReadOnly="True" 
                                        SortExpression="Tamaño" />
                                    <asp:BoundField DataField="FechaInstalacion" DataFormatString="{0:d}" 
                                        HeaderText="Instalación" SortExpression="FechaInstalacion" />
                                    <asp:BoundField DataField="FechaSustitucion" DataFormatString="{0:d}" 
                                        HeaderText="Sustitución" SortExpression="FechaSustitucion" Visible="False" />
                                    <asp:BoundField DataField="NombreMarca" HeaderText="Marca" 
                                        SortExpression="NombreMarca" />
                                    <asp:TemplateField ShowHeader="False" HeaderText="Foto">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                                CommandName="Select" Height="60px" ImageUrl='<%# Eval("UrlFoto") %>' 
                                                ToolTip="Clic para agrandar" Width="80px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="DataGridComponentes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                
                                
                                
                                
                                
                                SelectCommand="SELECT Sis_HV_Componentes.IdComponente, Sis_HV_TiposComponentes.NomTipoComponente, Sis_HV_Componentes.Tamaño + N' ' + Sis_HV_UnidadesMedida.AbreviaturaUnidad AS Tamaño, Sis_HV_Componentes.FechaInstalacion, Sis_HV_Marcas.NombreMarca, CASE WHEN LEN(UrlFoto) = 0 THEN '~/images/Hardware.jpg' ELSE UrlFoto END AS UrlFoto, Sis_HV_Componentes.IdEquipo, Sis_HV_Componentes.Observaciones, CASE WHEN Sustituido = 0 THEN '~/images/cOk.jpg' ELSE '~/images/cUn.jpg' END AS urlSustituido, Sis_HV_Componentes.FechaSustitucion, Sis_HV_Componentes.Sustituido FROM Sis_HV_Componentes INNER JOIN Sis_HV_TiposComponentes ON Sis_HV_Componentes.IdTipo = Sis_HV_TiposComponentes.IdTipoComponente INNER JOIN Sis_HV_Marcas ON Sis_HV_Componentes.IdMarca = Sis_HV_Marcas.IdMarca INNER JOIN Sis_HV_UnidadesMedida ON Sis_HV_TiposComponentes.UnidadMedida = Sis_HV_UnidadesMedida.IdUnidadMedida WHERE (Sis_HV_Componentes.IdEquipo = @IdEquipo) AND (Sis_HV_Componentes.Sustituido = COALESCE (NULLIF (@Estado, 9), Sis_HV_Componentes.Sustituido))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="LabelIdEquipo" Name="IdEquipo" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ListEstadoComponentes" Name="Estado" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td ></td>
                        <td ></td>
                    </tr>
    </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td colspan="4">
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="145px" BackColor="White" BorderColor="White" BorderStyle="None" Height="26px" />
                <asp:ModalPopupExtender ID="BtnMostrar_ModalPopupExtender" runat="server"
                 BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True"
                    TargetControlID="BtnMostrar" PopupControlID="PanelModal">
                     </asp:ModalPopupExtender>
                <%--<asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="PanelAgregarComponente" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>--%>
                <asp:Panel ID="PanelModal" runat="server">
                    
                           <br />
                            <asp:Panel ID="PanelAgregarComponente" runat="server" BorderColor="#CCCCCC" 
                                BorderStyle="Solid" BorderWidth="1px" 
                    CssClass="modalPopup">
                                <table style="width: 563px">
                                    <tr>
                                        <td colspan="2" 
                                            
                                            
                                            
                                            style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12pt;">
                                            Agregar Componente</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            Tipo:</td>
                                        <td style="width: 80%">
                                            <asp:DropDownList ID="ListComponentes" runat="server" 
                                                DataSourceID="DataListComponentes" DataTextField="NomComponente" 
                                                DataValueField="IdTipoComponente" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="DataListComponentes" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                
                                                
                                                
                                                SelectCommand="SELECT Sis_HV_TiposComponentes.NomTipoComponente + N' (' + Sis_HV_UnidadesMedida.AbreviaturaUnidad + N')' AS NomComponente, Sis_HV_TiposComponentes.IdTipoComponente FROM Sis_HV_TiposComponentes INNER JOIN Sis_HV_UnidadesMedida ON Sis_HV_TiposComponentes.UnidadMedida = Sis_HV_UnidadesMedida.IdUnidadMedida WHERE (Sis_HV_TiposComponentes.Activo = 1) ORDER BY Sis_HV_TiposComponentes.NomTipoComponente">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            Marca:</td>
                                        <td style="width: 80%">
                                            <asp:DropDownList ID="ListMarcaCompo" runat="server" 
                                                datasourceid="DataListMarcaCompo" DataTextField="NombreMarca" 
                                                DataValueField="IdMarca">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="DataListMarcaCompo" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                
                                                
                                                SelectCommand="SELECT IdMarca, NombreMarca FROM Sis_HV_Marcas ORDER BY NombreMarca">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            Tamaño</td>
                                        <td style="width: 80%">
                                            <asp:TextBox ID="TextTamaño" runat="server" MaxLength="5" Width="50px"></asp:TextBox>
                                            &nbsp;<asp:Label ID="LabelTamaño" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            Fecha Instalación:
                                        </td>
                                        <td style="width: 80%">
                                            <asp:TextBox ID="TextFechaInstalacion" runat="server" Width="100px"></asp:TextBox>
                                            <asp:MaskedEditExtender ID="TextFechaInstalacion_MaskedEditExtender" 
                                                runat="server" Mask="99/99/9999" MaskType="Date" 
                                                TargetControlID="TextFechaInstalacion" UserDateFormat="DayMonthYear" />
                                            <asp:CalendarExtender ID="TextFechaInstalacion_CalendarExtender" runat="server" 
                                                TargetControlID="TextFechaInstalacion" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            Observaciones</td>
                                        <td style="width: 80%">
                                            <asp:TextBox ID="TextObservaciones" runat="server" MaxLength="4000" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            Adjuntar Foto:</td>
                                        <td style="width: 80%">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 80%">
                                            <asp:Button ID="BtnSubirArchivo" runat="server" Text="Adjuntar Foto" />
                                            <asp:Label ID="LabelUpload" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 20%;">
                                            &nbsp;</td>
                                        <td style="width: 80%">
                                            <asp:Image ID="ImagenCompo" runat="server" Height="300px" Width="100%" 
                                                Visible="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 80%">
                                            <asp:Button ID="BtnInsertarComponente" runat="server" Text="Guardar" />
                                            
                                            <br />
                                            
                                            </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <asp:Label ID="LabelMsgCompo" runat="server" 
                                                style="font-weight: 700; font-size: 12pt"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="PanelFotoCompo" runat="server" BackColor="White">
                                <asp:Image ID="ImagenCompoGrande" runat="server" Height="400px" /><br />
                                <asp:Label ID="LabelObsCompo" runat="server"></asp:Label>
                                <br />
                           </asp:Panel>
                           <asp:Panel ID="PanelUbicaciones" runat="server" BackColor="White" Width="100%">
                               <table style="width: 100%">
                                   <tr>
                                       <td colspan="4" 
                                           style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12pt; width: 100%;">
                                           UBICACIONES</td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="width: 50%; vertical-align: top;">
                                           <asp:GridView ID="GridUbicaciones" runat="server" AutoGenerateColumns="False" 
                                               DataKeyNames="IdUbicacion" DataSourceID="DataGridUbicaciones" Width="100%">
                                               <AlternatingRowStyle BackColor="#F0F0F0" />
                                               <Columns>
                                                   <asp:BoundField DataField="IdUbicacion" HeaderText="Id" InsertVisible="False" 
                                                       ReadOnly="True" SortExpression="IdUbicacion" />
                                                   <asp:BoundField DataField="NomPunto" HeaderText="Punto" ReadOnly="True" 
                                                       SortExpression="NomPunto" />
                                                   <asp:BoundField DataField="FechaInstalacion" DataFormatString="{0:d}" 
                                                       HeaderText="Fecha Instal" SortExpression="FechaInstalacion" />
                                                   <asp:BoundField DataField="NombreEquipo" HeaderText="Nombre" 
                                                       SortExpression="NombreEquipo" />
                                                   <asp:BoundField DataField="DireccionIP" HeaderText="IP" 
                                                       SortExpression="DireccionIP" />
                                                   <asp:CheckBoxField DataField="UbicacionActual" HeaderText="Activa" 
                                                       SortExpression="UbicacionActual" />
                                                   <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Edit.png" 
                                                       ShowSelectButton="True" />
                                               </Columns>
                                           </asp:GridView>
                                           <asp:SqlDataSource ID="DataGridUbicaciones" runat="server" 
                                               ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                               
                                               SelectCommand="SELECT Sis_HV_UbicacionesEquipos.IdUbicacion, Sis_HV_UbicacionesEquipos.IdEquipo, Sis_HV_PuntosTrabajo.NombrePunto + N' (' + Sis_HV_Dependencias.NombreDependecia + N')' AS NomPunto, Sis_HV_UbicacionesEquipos.FechaInstalacion, Sis_HV_UbicacionesEquipos.DireccionIP, Sis_HV_UbicacionesEquipos.UbicacionActual, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_PuntosTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo WHERE (Sis_HV_UbicacionesEquipos.IdEquipo = @IdEquipo)">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="LabelIdEquipo" Name="IdEquipo" 
                                                       PropertyName="Text" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>
                                           <asp:SqlDataSource ID="DataNov0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
                                       </td>
                                       <td colspan="2">
                                           <asp:Button ID="BtnNuevaUbicacion" runat="server" Text="Nueva Ubicación" />
                                           
                                           <asp:Panel ID="PanelNuevaUbicacion" runat="server" BorderColor="#999999" 
                                               BorderStyle="Solid" BorderWidth="1px" Visible="False">
                                               <table class="style1">
                                                   <tr>
                                                       <td style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold;" 
                                                           colspan="2">
                                                           <asp:Label ID="LblFormUbicaciones" runat="server"></asp:Label>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Dependencia:</td>
                                                       <td style="width: 50%;">
                                                           <asp:DropDownList ID="ListDependencias" runat="server" AutoPostBack="True" 
                                                               DataSourceID="DataListDependencias" DataTextField="NombreDependecia" 
                                                               DataValueField="IdDependencia">
                                                           </asp:DropDownList>
                                                           <asp:SqlDataSource ID="DataListDependencias" runat="server" 
                                                               ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                               InsertCommand="INSERT INTO Sis_HV_UbicacionesEquipos(IdEquipo, IdPuntoTrabajo, FechaInstalacion, Observaciones, FuncionarioEntrega, FuncionarioRecibe, NombreEquipo, DireccionIP) VALUES (123, 123, CONVERT (DATETIME, '2017-01-31 00:00:00', 102), N'abc', N'abc', N'abc', N'abc', N'abc')" 
                                                               SelectCommand="SELECT NombreDependecia, IdDependencia FROM Sis_HV_Dependencias ORDER BY NombreDependecia">
                                                           </asp:SqlDataSource>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Punto:</td>
                                                       <td style="width: 50%;">
                                                           <asp:DropDownList ID="ListPuntos" runat="server" datasourceid="DataListPuntos" 
                                                               DataTextField="NombrePunto" DataValueField="IdPuntoTrabajo">
                                                           </asp:DropDownList>
                                                           <asp:SqlDataSource ID="DataListPuntos" runat="server" 
                                                               ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                               SelectCommand="SELECT IdPuntoTrabajo, NombrePunto FROM Sis_HV_PuntosTrabajo WHERE (IdDependencia = @IdDependencia) ORDER BY NombrePunto">
                                                               <SelectParameters>
                                                                   <asp:ControlParameter ControlID="ListDependencias" Name="IdDependencia" 
                                                                       PropertyName="SelectedValue" />
                                                               </SelectParameters>
                                                           </asp:SqlDataSource>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Fecha de Instalación:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextFechaUbicacion" runat="server" Width="100px"></asp:TextBox>
                                                           <asp:MaskedEditExtender ID="TextFechaUbicacion_MaskedEditExtender" 
                                                               runat="server" Mask="99/99/9999" MaskType="Date" 
                                                               TargetControlID="TextFechaUbicacion" UserDateFormat="DayMonthYear" />
                                                           <asp:CalendarExtender ID="TextFechaUbicacion_CalendarExtender" runat="server" 
                                                               TargetControlID="TextFechaUbicacion" />
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Dirección IP:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextDireccionIP" runat="server" MaxLength="15"></asp:TextBox>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Dirección IP 2:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextDireccionIP2" runat="server" MaxLength="15"></asp:TextBox>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Tipo de&nbsp; Conexión de Red:</td>
                                                       <td style="width: 50%;">
                                                           <asp:DropDownList ID="ListTipoConexion" runat="server" 
                                                               datasourceid="DataListTipoConexion" DataTextField="NomTipoConexion" 
                                                               DataValueField="IdTipoConexion">
                                                           </asp:DropDownList>
                                                           <asp:SqlDataSource ID="DataListTipoConexion" runat="server" 
                                                               ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                               SelectCommand="SELECT IdTipoConexion, NomTipoConexion FROM Sis_HV_TiposConexionRed ORDER BY NomTipoConexion">
                                                               <SelectParameters>
                                                                   <asp:ControlParameter ControlID="ListDependencias" Name="IdDependencia" 
                                                                       PropertyName="SelectedValue" />
                                                               </SelectParameters>
                                                           </asp:SqlDataSource>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Nombre en la Red:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextNombreEnRed" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Observaciones:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextObsUbicacion" runat="server" MaxLength="4000" 
                                                               Width="200px"></asp:TextBox>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Entrego:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextUsEntrego" runat="server" Width="95%"></asp:TextBox>
                                                           <ajaxToolkit:AutoCompleteExtender ID="TextUsEntrego_AutoCompleteExtender" 
                                                               runat="server" ServiceMethod="BusqUsuario" TargetControlID="TextUsEntrego"></ajaxToolkit:AutoCompleteExtender>
                                                           <asp:Label ID="LabelIdUsEntrego" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Recibio:</td>
                                                       <td style="width: 50%;">
                                                           <asp:TextBox ID="TextUsRecibio" runat="server" Width="95%"></asp:TextBox>
                                                           <asp:AutoCompleteExtender ID="TextUsRecibio_AutoCompleteExtender" 
                                                               runat="server" BehaviorID="UsRecibio_AutoCompleteExtender" 
                                                               DelimiterCharacters="" ServiceMethod="BusqUsuario" ServicePath="" 
                                                               TargetControlID="TextUsRecibio"></asp:AutoCompleteExtender>
                                                           <asp:Label ID="LabelIdUsRecibio" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           Activa:</td>
                                                       <td style="width: 50%;">
                                                           <asp:CheckBox ID="CheckUbicacionActiva" runat="server" Checked="True" 
                                                               Enabled="False" />
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td style="width: 50%; text-align: right;">
                                                           &nbsp;</td>
                                                       <td style="width: 50%;">
                                                           <asp:Button ID="BtnGuardarUbicacion" runat="server" Text="Guardar Ubicación" />
                                                           <asp:Button ID="BtnActuUbicacion" runat="server" Text="Actualizar Ubicación" />
                                                       </td>
                                                   </tr>
                                               </table>
                                           </asp:Panel>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                   </tr>
                               </table>
                           </asp:Panel>
                    <asp:Panel ID="PanelBusqPorComponente" runat="server" BackColor="White" Width="100%">
                        <table style="width: 700px">
                                   <tr>
                                       <td colspan="4" 
                                           style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12pt; width: 100%;">
                                           BUSCAR POR EQUIPO POR DESCRIPCION DE COMPONENTE</td>
                                   </tr>
                                   <tr>
                                       <td colspan="2">
                                           Texto a buscar:
                                           <asp:TextBox ID="TxtBuscObservacion" runat="server" Width="204px"></asp:TextBox>
                                       </td>
                                       <td style="width: 25%;">
                                           <asp:CheckBox ID="CheckBuscCambiado" runat="server" Text="Cambiados" />
                                       </td>
                                       <td style="width: 25%;">
                                           <asp:Button ID="BtnBuscarDesc" runat="server" Text="Buscar Descripción" />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td colspan="4">
                                           <asp:GridView ID="GridBuscDescripcion" runat="server" 
                                               AutoGenerateColumns="False" DataKeyNames="IdEquipo" 
                                               DataSourceID="DataGridBuscDescripcion" Width="100%">
                                               <AlternatingRowStyle BackColor="#F0F0F0" />
                                               <Columns>
                                                   <asp:CommandField ShowSelectButton="True" />
                                                   <asp:BoundField DataField="IdEquipo" HeaderText="Id" InsertVisible="False" 
                                                       SortExpression="IdEquipo">
                                                   <ItemStyle Font-Bold="True" />
                                                   </asp:BoundField>
                                                   <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" 
                                                       SortExpression="Observaciones" />
                                                   <asp:BoundField DataField="NombreEquipo" HeaderText="Nombre Equipo" 
                                                       SortExpression="NombreEquipo" />
                                                   <asp:BoundField DataField="NomTipoEquipo" HeaderText="Tipo Equipo" 
                                                       SortExpression="NomTipoEquipo" />
                                                   <asp:BoundField DataField="MarcaEquipo" HeaderText="Marca Equipo" 
                                                       SortExpression="MarcaEquipo" />
                                                   <asp:BoundField DataField="Ubicacion" HeaderText="Ubicación" ReadOnly="True" 
                                                       SortExpression="Ubicacion" />
                                                   <asp:BoundField DataField="NomTipoComponente" HeaderText="Tipo Componente" 
                                                       SortExpression="NomTipoComponente" />
                                                   <asp:BoundField DataField="MarcaCompo" HeaderText="Marca Comp." 
                                                       SortExpression="MarcaCompo" />
                                                   <asp:CheckBoxField DataField="Sustituido" HeaderText="Cambiado" 
                                                       SortExpression="Sustituido" />
                                               </Columns>
                                           </asp:GridView>
                                           <asp:SqlDataSource ID="DataGridBuscDescripcion" runat="server" 
                                               ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                               SelectCommand="SELECT Sis_HV_Componentes.Observaciones, Sis_HV_Componentes.IdComponente, Sis_HV_Equipos.IdEquipo, Sis_HV_TiposEquipo.NomTipoEquipo, Sis_HV_PuntosTrabajo.NombrePunto + N' (' + Sis_HV_Dependencias.NombreDependecia + N')' AS Ubicacion, Sis_HV_TiposComponentes.NomTipoComponente, Sis_HV_Componentes.Sustituido, Sis_HV_Marcas_Compo.NombreMarca AS MarcaCompo, Sis_HV_Marcas_Equipo.NombreMarca AS MarcaEquipo, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_Equipos INNER JOIN Sis_HV_Componentes ON Sis_HV_Equipos.IdEquipo = Sis_HV_Componentes.IdEquipo INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_Equipos.IdEquipo = Sis_HV_UbicacionesEquipos.IdEquipo INNER JOIN Sis_HV_TiposComponentes ON Sis_HV_Componentes.IdTipo = Sis_HV_TiposComponentes.IdTipoComponente INNER JOIN Sis_HV_TiposEquipo ON Sis_HV_Equipos.TipoEquipo = Sis_HV_TiposEquipo.IdTipoEquipo INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_UbicacionesEquipos.IdPuntoTrabajo = Sis_HV_PuntosTrabajo.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia INNER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_Compo ON Sis_HV_Componentes.IdMarca = Sis_HV_Marcas_Compo.IdMarca INNER JOIN Sis_HV_Marcas AS Sis_HV_Marcas_Equipo ON Sis_HV_Equipos.Marca = Sis_HV_Marcas_Equipo.IdMarca WHERE (Sis_HV_Componentes.Observaciones LIKE N'%' + @Texto + N'%') AND (Sis_HV_UbicacionesEquipos.UbicacionActual = 1) AND (Sis_HV_Componentes.Sustituido = @Sustituido) ORDER BY Sis_HV_Equipos.IdEquipo">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="TxtBuscObservacion" Name="Texto" 
                                                       PropertyName="Text" />
                                                   <asp:ControlParameter ControlID="CheckBuscCambiado" Name="Sustituido" 
                                                       PropertyName="Checked" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                       <td style="width: 25%;">
                                           &nbsp;</td>
                                   </tr>
                               </table>
                        
                        </asp:Panel>
                           <asp:Panel ID="PanelMsg" runat="server" BackColor="White" BorderColor="#999999" 
                               BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="500px">
                               <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/IconoInfo.png" />
                               <br />
                               <asp:Label ID="LabelMsg" runat="server" style="font-size: 14pt"></asp:Label>
                           </asp:Panel>
                           <br />
                    <asp:Panel  ID="PanelHistory" runat="server" BorderColor="#CCCCCC" 
                                BorderStyle="Solid" BorderWidth="1px" 
                    CssClass="modalPopup">

    <table style="width: 563px">
                                    <tr>
                                       
                                            <td style="text-align: center; background-image: url('../../Images/Fondo01.jpg');">Historial Mantenimiento</td></tr>
                                            <tr> <td>
                                                <asp:GridView ID="GridEventos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DataGridView" EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" PageSize="300" Width="100%">
                                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                                    <Columns>
                                                       <asp:BoundField DataField="Evento" HeaderText="Evento" ItemStyle-Width="5%" SortExpression="Evento">
                                                      
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Solicito" HeaderText="Solicito" ItemStyle-Width="5%" SortExpression="Solicito">
                                                        <ItemStyle Width="30px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" HeaderStyle-Width="20px" ItemStyle-Width="30%" >
                                                        <HeaderStyle Width="20px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Responsable" HeaderText="Responsable" ItemStyle-Width="2%" SortExpression="Responsable" HeaderStyle-Width="3%" >
                                                        <ItemStyle Width="5px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Trabajo_Realizado" HeaderText="Trabajo_Realizado" SortExpression="Trabajo_Realizado" HeaderStyle-Width="30%">
                                                        <ItemStyle Width="100px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" HeaderStyle-Width="3%" >
                                                     
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Tipo_Mantenimiento" HeaderText="Tipo_Mantenimiento" ReadOnly="True" SortExpression="Tipo_Mantenimiento"  HeaderStyle-Width="5%">
                                                    
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="DataGridView" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Sis_HV_Historial.Id_Evento AS Evento, Sis_HV_Novedad.Id_Sol AS Solicito, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Id_Job AS Responsable, Sis_HV_Historial.Actividad AS Trabajo_Realizado, CASE WHEN Sis_HV_Historial.Estado = 4 THEN 'Aprobado' ELSE 'Pendiente' END AS Estado, (SELECT Tipo_Man FROM Sis_HV_TiposMantenimiento WHERE (Id = Sis_HV_Historial.Tipo_Man)) AS Tipo_Mantenimiento, DATEDIFF(Minute, Sis_HV_Novedad.Fech_Sol, Sis_HV_Historial.Fech_En) / 60 / 24 AS Días, DATEDIFF(Minute, Sis_HV_Novedad.Fech_Sol, Sis_HV_Historial.Fech_En) / 60 % 24 AS Horas FROM Sis_HV_Historial INNER JOIN Sis_HV_Equipos ON Sis_HV_Historial.Id_Equipo = Sis_HV_Equipos.Serial INNER JOIN Sis_HV_Novedad ON Sis_HV_Historial.Id_Evento = Sis_HV_Novedad.Id_Evento WHERE (Sis_HV_Equipos.IdEquipo = @LabelIdEquipo) ORDER BY Sis_HV_Novedad.Fech_Sol">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="LabelIdEquipo" Name="LabelIdEquipo" PropertyName="Text" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                                </tr>
                                      
        </table>
   <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                
                                
                InsertCommand="INSERT INTO Sis_HV_Equipos(CodigoEquipo, FechaCompra, Serial, Descripcion) VALUES (N'abc', CONVERT (DATETIME, '2003-01-02 00:00:00', 102), N'abc123', N'abc123')">
                            </asp:SqlDataSource>
        </asp:Panel>
    

                    <br />

                           <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                </asp:Panel>
                        </td>
    </tr>
    <tr>
        <td style="width: 25%">
                         
                        </td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
            &nbsp;</td>
    </tr>

    <tr> 
    <td colspan="4">
    
    
    </td>
    
    </tr>

    <tr> 
    <td colspan="4" class="auto-style1">
    
    
        
    
    </td>
    
    </tr>

    <tr> 
    <td colspan="4">
    
    
        &nbsp;</td>
    
    </tr>
</table>

