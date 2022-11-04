<%@ Page Title="Consumo Promedio y Kardex" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ConsProm_Kardex.aspx.vb" Inherits="PaginaBase" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <script language="javascript"> 

function ShowModalPopup()

{

    $find("Panel1_ModalPopupExtender").show();

}

function HideModalPopup()

{

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
           
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">

                </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
       <ProgressTemplate>
             <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 15000px; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1500px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
<%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                Kardex e Inventario Valorizado</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:Label ID="LabelSubTitulo" runat="server" Text="Periodo: "></asp:Label>
                <asp:DropDownList ID="ListMeses" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                <asp:DropDownList ID="ListBodegas" runat="server" AutoPostBack="True" 
                    Visible="False">
                    <asp:ListItem Value="2">Farmacia Principal</asp:ListItem>
                    <asp:ListItem Value="4">Bodega Farmacia</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 25%" >
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td style="width: 25%" >
                
                <asp:Button ID="Button1" runat="server" Text="Ver Inventario" />
                
            </td>
            <td style="width: 25%" >
                <asp:Button ID="ButtonExcel" runat="server" Text="Exportar a Excel" 
                    Enabled="False" Visible="False" />
            </td>
        </tr>
        <tr >
            <td style="width: 75%; font-size: 9pt;" colspan="3" >
                <asp:GridView ID="GridProductos" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdProducto,NomProducto" DataSourceID="DataGridProductos" 
                    AllowPaging="True" PageSize="50">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="IdProducto" HeaderText="IdProducto" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IdProducto" 
                            Visible="False" />
                        <asp:BoundField DataField="CodProducto" HeaderText="Código" 
                            SortExpression="CodProducto" />
                        <asp:BoundField DataField="NomProducto" HeaderText="Producto" ReadOnly="True" 
                            SortExpression="NomProducto" />
                        <asp:BoundField DataField="ISPSONSUPROM" HeaderText="Cons Prom" 
                            SortExpression="ISPSONSUPROM">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Entradas 02">
                            <ItemTemplate>
                                <asp:Label ID="LabelEntrada02" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salidas 02">
                            <ItemTemplate>
                                <asp:Label ID="LabelSalida02" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Existencias 02">
                            <ItemTemplate>
                                <asp:Label ID="LabelExist02" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Image" CommandName="Ver02" HeaderText="Kx02" 
                            ImageUrl="~/Images/BtnLupa.png">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                        <asp:TemplateField HeaderText="Entradas 50">
                            <ItemTemplate>
                                <asp:Label ID="LabelEntrada50" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salidas 50">
                            <ItemTemplate>
                                <asp:Label ID="LabelSalida50" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Existencias 50">
                            <ItemTemplate>
                                <asp:Label ID="LabelExist50" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Image" CommandName="Ver50" HeaderText="Kx50" 
                            ImageUrl="~/Images/BtnLupa.png" Text="Botón">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridProductos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>">
                </asp:SqlDataSource>
     
                                <asp:GridView ID="GridInventario" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="DataGridInventario" 
                                    
                    EmptyDataText="NO HAY MOVIMIENTOS EN EL PERIODO SELECCIONADO" 
                    Visible="False" DataKeyNames="IPRCODIGO,IPRDESCOR">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="IPRCODIGO" HeaderText="Codigo" 
                                            SortExpression="IPRCODIGO" />
                                        <asp:BoundField DataField="IPRDESCOR" HeaderText="Producto" 
                                            SortExpression="IPRDESCOR" />
                                        <asp:BoundField DataField="ILSCODIGO" HeaderText="Lote" 
                                            SortExpression="ILSCODIGO" >
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ILSFECVEN" HeaderText="Fecha Ven" 
                                            SortExpression="ILSFECVEN" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="IFICANTID" HeaderText="Cantidad" 
                                            SortExpression="IFICANTID" DataFormatString="{0:N0}" >
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Costo Promedio">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelCostProm" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ValorUltimaCompra" DataFormatString="{0:N0}" 
                                            HeaderText="Val Ult Compra" SortExpression="ValorUltimaCompra">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:ButtonField ButtonType="Image" CommandName="VerDetalle" 
                                            ImageUrl="~/Images/BtnLupa.png" Text="Botón" />
                                        <asp:BoundField DataField="ConsPromedio" HeaderText="Consumo Prom" 
                                            SortExpression="ConsPromedio">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ValorVenta" DataFormatString="{0:N0}" 
                                            HeaderText="Precio Venta Directa" SortExpression="ValorVenta">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="500" DataFormatString="{0:N0}" 
                                            HeaderText="Tarifa 500" SortExpression="500">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="501" DataFormatString="{0:N0}" 
                                            HeaderText="Tarifa 501" SortExpression="501">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerSettings Position="TopAndBottom" />
                                </asp:GridView>
                <asp:SqlDataSource ID="DataGridInventario" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    
                    
                    
                    
                    SelectCommand="SELECT INNPRODUC_1.IPRCODIGO, INNPRODUC_1.IPRULCOPE AS CostoPromedio, INNPRODUC_1.IPRDESCOR, INNLOTSER.ILSCODIGO, INNLOTSER.ILSFECVEN, INNFISICO.IFICANTID, INNFISICO.INNALMACE, INNSTOPRO.ISPSONSUPROM AS ConsPromedio, INNPRODUC_1.IPRULCOPE AS ValorUltimaCompra, INNPRODUC_1.IPRPREVPE AS ValorVenta, (SELECT TOP (1) INNMANTAR_1.IMTVALPRO FROM INNPROEPS AS INNPROEPS_1 INNER JOIN INNMANTAR AS INNMANTAR_1 ON INNPROEPS_1.OID = INNMANTAR_1.INNPROEPS WHERE (INNMANTAR_1.IMTFECFIN &gt; CONVERT (DATETIME, '2017-12-30 00:00:00', 102)) AND (INNPROEPS_1.GENMANUAL = 5) AND (INNPROEPS_1.INNPRODUC = INNPRODUC_1.OID)) AS [500], (SELECT TOP (1) INNMANTAR_1.IMTVALPRO FROM INNPROEPS AS INNPROEPS_1 INNER JOIN INNMANTAR AS INNMANTAR_1 ON INNPROEPS_1.OID = INNMANTAR_1.INNPROEPS WHERE (INNMANTAR_1.IMTFECFIN &gt; CONVERT (DATETIME, '2017-12-30 00:00:00', 102)) AND (INNPROEPS_1.GENMANUAL = 20) AND (INNPROEPS_1.INNPRODUC = INNPRODUC_1.OID)) AS [501] FROM INNFISICO INNER JOIN INNLOTSER ON INNFISICO.INNLOTSER = INNLOTSER.OID INNER JOIN INNPRODUC AS INNPRODUC_1 ON INNFISICO.INNPRODUC = INNPRODUC_1.OID LEFT OUTER JOIN INNSTOPRO ON INNPRODUC_1.OID = INNSTOPRO.IPRPRODUC WHERE (INNFISICO.INNALMACE = @IdAlmacen) AND (INNFISICO.IFICANTID &gt; 0) ORDER BY INNFISICO.INNALMACE, INNPRODUC_1.IPRDESCOR">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBodegas" Name="IdAlmacen" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 25%; vertical-align: top;" >
                
               
                
                &nbsp;</td>

        </tr>
        <tr>
            <td colspan="4" style="width: 100%; font-size: 9pt;">
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    Height="700px" ScrollBars="Vertical" Width="1100px">
                    <table style="width: 100%; font-family: tahoma;" >

                    <tr >
            <td style="border: 1px solid #CCCCCC; width: 50%; background-color: #F0F0F0; color: #3366CC;" 
                            colspan="2" >
                <asp:Label ID="LabelMedicamento" runat="server" 
                    style="font-weight: 700; font-size: 11pt"></asp:Label>
                        </td>
            <td style="width: 25%" >
                <asp:Label ID="LabelCodProducto" runat="server"></asp:Label>
                        </td>
            <td style="width: 25%" >
                <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                        </td>
        </tr>

                        <tr>
                            <td style="width: 25%">
                                <asp:Label ID="LabelCantMovs" runat="server"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                &nbsp;</td>
                            <td style="width: 25%">
                                &nbsp;</td>
                            <td style="width: 25%">
                                &nbsp;</td>
                        </tr>

                        <tr>
                            <td colspan="3" style="width: 75%">
                                <asp:GridView ID="GridMovimientos" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="IdKardex,IDTIPDOC" DataSourceID="DataGridMovimientos" 
                                    EmptyDataText="NO HAY MOVIMIENTOS EN EL PERIODO SELECCIONADO">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="FechaDocumento" HeaderText="Fecha Doc" 
                                            SortExpression="FechaDocumento" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="CodLote" HeaderText="Lote" 
                                            SortExpression="CodLote" />
                                        <asp:BoundField DataField="FechaVencimiento" DataFormatString="{0:d}" 
                                            HeaderText="Fecha Venc" SortExpression="FechaVencimiento" />
                                        <asp:TemplateField HeaderText="Movimiento">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelTipoMov" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IDCONSEC" HeaderText="Documento" 
                                            SortExpression="IDCONSEC" />
                                        <asp:BoundField DataField="TERNUMDOC" HeaderText="Tercero" 
                                            SortExpression="TERNUMDOC" >
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Entrada" HeaderText="Entrada" 
                                            SortExpression="Entrada" DataFormatString="{0:N0}" ReadOnly="True" >
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Salida" DataFormatString="{0:N0}" 
                                            HeaderText="Salida" ReadOnly="True" SortExpression="Salida">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Existencias" DataFormatString="{0:N0}" 
                                            HeaderText="Existencias" SortExpression="Existencias">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CostoPromedio" DataFormatString="{0:N0}" 
                                            HeaderText="Costo Prom" SortExpression="CostoPromedio">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerSettings Position="TopAndBottom" />
                                </asp:GridView>
                                <asp:Localize ID="Localize2" runat="server"></asp:Localize>
                                <asp:SqlDataSource ID="DataGridMovimientos" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                    
                                    SelectCommand="SELECT  INKD201706.OID as IdKardex, INKD201706.INKFECHA AS FechaDocumento, INNLOTSER.ILSCODIGO AS CodLote, INNLOTSER.ILSFECVEN AS FechaVencimiento, INNDOCUME.IDTIPDOC, INNDOCUME.IDCONSEC, GENTERCER.TERNUMDOC, CASE WHEN INKTIPMOV = 0 THEN INKCANTID ELSE 0 END AS Entrada, CASE WHEN INKTIPMOV = 1 THEN INKCANTID ELSE 0 END AS Salida,  INKD201706.INKCANANTP AS Existencias, INKD201706.INKCOSPROM as CostoPromedio FROM INKD201706 INNER JOIN INNDOCUME ON INKD201706.INNDOCUME = INNDOCUME.OID INNER JOIN INNLOTSER ON INKD201706.INNLOTSER = INNLOTSER.OID LEFT OUTER JOIN GENTERCER ON INKD201706.GENTERCER = GENTERCER.OID WHERE (INKD201706.INNALMACE = 2) AND (INKD201706.INNPRODUC = 737)">
                                </asp:SqlDataSource>
                             
                                <asp:GridView ID="GridDetalleCompra" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="IdEntradaProducto" DataSourceID="DataGridDetalleCompra" 
                                    EmptyDataText="NO HAY MOVIMIENTOS EN EL PERIODO SELECCIONADO">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="IdEntradaProducto" HeaderText="Id" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="IdEntradaProducto" />
                                        <asp:BoundField DataField="IDCONSEC" HeaderText="Documento" 
                                            SortExpression="IDCONSEC" />
                                        <asp:BoundField DataField="IDFECDOC" DataFormatString="{0:d}" 
                                            HeaderText="Fecha Doc" SortExpression="IDFECDOC">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" 
                                            SortExpression="Proveedor" />
                                        <asp:BoundField DataField="IDDCANTID" DataFormatString="{0:N0}" 
                                            HeaderText="Cant" SortExpression="IDDCANTID">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IMCVALUNI" DataFormatString="{0:N0}" 
                                            HeaderText="Val Unit" SortExpression="IMCVALUNI">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerSettings Position="TopAndBottom" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="DataGridDetalleCompra" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                    SelectCommand="SELECT INNMCOMPR.OID AS IdEntradaProducto, GENTERCERP.GPRNOMBRE AS Proveedor, INNMCOMPR.IDDCANTID, INNMCOMPR.IMCVALUNI, INNDOCUME.IDCONSEC, INNDOCUME.IDFECDOC FROM INNCCOMPR INNER JOIN INNMCOMPR ON INNCCOMPR.OID = INNMCOMPR.INNCCOMPR INNER JOIN INNPRODUC ON INNMCOMPR.INNPRODUC = INNPRODUC.OID INNER JOIN INNDOCUME ON INNCCOMPR.OID = INNDOCUME.OID INNER JOIN GENTERCERP ON INNCCOMPR.GENTERCERP = GENTERCERP.OID WHERE (INNPRODUC.IPRCODIGO = @CodProducto) AND (INNDOCUME.IDESTADO = 1) ORDER BY IdEntradaProducto DESC">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="LabelCodProducto" Name="CodProducto" 
                                            PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <br />
                             
                            </td>

                            <td style="width: 25%">
                                &nbsp;</td>
                        </tr>

                    </table>


                <br />
                </asp:Panel>
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

