<%@ Page Title="Cuentas Radicadas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="RadicacionCuentas.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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
           
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                
                INFORME DE
                
                RADICACION DE CUENTAS</td>
        </tr>
        <tr >
            <td style="font-size: 9pt;" colspan="2" >
                <asp:RadioButtonList ID="ListEstados" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True" Value="99">Todos</asp:ListItem>
                    <asp:ListItem Value="0">Registrado</asp:ListItem>
                    <asp:ListItem Value="1">Confirmado</asp:ListItem>
                    <asp:ListItem Value="2">Radicado Entidad</asp:ListItem>
                    <asp:ListItem Value="3">Anulado</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 20%" >
                Fecha Inicial:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            <td style="width: 30%; text-align: right;" >
                Fecha Final:
                <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" />
            </td>
        </tr>
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 16pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" >
                <asp:Label ID="LabelSubTitulo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                <asp:GridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdRadicacion" DataSourceID="DataPrincipal" 
                    Visible="False">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Resumen" ShowSelectButton="True" 
                            Visible="False" />
                        <asp:BoundField DataField="NumConsecutivo" HeaderText="Cons" 
                            SortExpression="NumConsecutivo" />
                        <asp:BoundField DataField="FechaDocumento" HeaderText="Fecha" 
                            SortExpression="FechaDocumento" DataFormatString="{0:d}" >
                        <ItemStyle Font-Size="9pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaRadicacion" DataFormatString="{0:d}" 
                            HeaderText="Fecha Rad" SortExpression="FechaRadicacion" />
                        <asp:BoundField DataField="DocTercero" HeaderText="DI Tercero" 
                            SortExpression="DocTercero" />
                        <asp:BoundField DataField="NomTercero" HeaderText="Tercero" 
                            SortExpression="NomTercero">
                            <ItemStyle Font-Size="9pt" />
                               </asp:BoundField>
                              <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" 
                            SortExpression="Cantidad" >

                        <ItemStyle Font-Size="9pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorRadicado" DataFormatString="${0:0}" 
                            HeaderText="Valor Radicado" SortExpression="ValorRadicado">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataPrincipal" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    SelectCommand="SELECT CRNDOCUME.CDCONSEC AS NumConsecutivo, COUNT(CRNRADFACD.CRDVALRAD) AS Cantidad, SUM(CRNRADFACD.CRDVALRAD) AS ValorRadicado, GENTERCER.TERNUMDOC AS DocTercero, GENTERCER.TERPRINOM + N' ' + GENTERCER.TERSEGNOM + N' ' + GENTERCER.TERPRIAPE + N' ' + GENTERCER.TERSEGAPE AS NomTercero, CRNRADFACD.CRFFECRAD AS FechaRadicacion, CRNRADFACC.CRFESTADO AS Estado, CRNDOCUME.CDFECDOC AS FechaDocumento, CRNRADFACC.OID AS IdRadicacion FROM CRNRADFACD INNER JOIN CRNRADFACC ON CRNRADFACD.CRNRADFACC = CRNRADFACC.OID INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID INNER JOIN GENTERCER ON CRNRADFACC.GENTERCER = GENTERCER.OID WHERE (CRNDOCUME.CDFECDOC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNRADFACC.CRFESTADO = COALESCE (NULLIF (@Estado, 99), CRNRADFACC.CRFESTADO)) GROUP BY CRNDOCUME.CDCONSEC, GENTERCER.TERNUMDOC, GENTERCER.TERPRINOM + N' ' + GENTERCER.TERSEGNOM + N' ' + GENTERCER.TERPRIAPE + N' ' + GENTERCER.TERSEGAPE, CRNRADFACC.CRFESTADO, CRNDOCUME.CDFECDOC, CRNRADFACC.OID, CRNRADFACD.CRFFECRAD">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListEstados" Name="Estado" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
            <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    Height="600px" ScrollBars="Vertical" Width="900px" GroupingText="123">
                    
                    <table style="width: 100%; font-family: tahoma;">
                        
                        </tr>
                            <td style="width: 90%; font-size: 10pt;">
                                <asp:GridView ID="GridResFactAnu" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="IdIngreso" DataSourceID="DataGridResFactAnu" PageSize="20">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="SFANUMFAC" HeaderText="No. Fact" 
                                            SortExpression="SFANUMFAC" />
                                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                                            SortExpression="AINCONSEC" />
                                        <asp:BoundField DataField="SFAFECFAC" HeaderText="Fecha Factura" 
                                            SortExpression="SFAFECFAC" />
                                        <asp:BoundField DataField="SFAFECANU" HeaderText="Fecha Anulación" 
                                            SortExpression="SFAFECANU" />
                                        <asp:BoundField DataField="SFATOTFAC" DataFormatString="${0:0}" 
                                            HeaderText="Total" SortExpression="SFATOTFAC">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFAVALPAC" DataFormatString="${0:0}" 
                                            HeaderText="Valor Paciente" SortExpression="SFAVALPAC">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GDENOMBRE" HeaderText="Entidad" 
                                            SortExpression="GDENOMBRE" />
                                        <asp:BoundField DataField="PACNUMDOC" HeaderText="DI. Paciente" 
                                            SortExpression="PACNUMDOC" />
                                        <asp:BoundField DataField="SFAJUSANU" HeaderText="Justificación" 
                                            SortExpression="SFAJUSANU" />
                                        <asp:CommandField SelectText="Ver Traza" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DataGridResFactAnu" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                    SelectCommand="SELECT SLNFACTUR.SFAFECANU, SLNFACTUR.GENUSUARIO1 AS IdUsFact, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAVALPAC, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINCONSEC, GENDETCON.GDENOMBRE, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAJUSANU, SLNFACTUR.SFANUMFAC, ADNINGRESO.OID AS IdIngreso FROM GENDETCON INNER JOIN ADNINGRESO ON GENDETCON.OID = ADNINGRESO.GENDETCON INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicial AND @FechaFinal) AND (SLNFACTUR.SFADOCANU = 1) AND (SLNFACTUR.GENUSUARIO1 = @IdUsuario) ORDER BY SLNFACTUR.SFAFECANU">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                                            PropertyName="Text" />
                                        <asp:Parameter Name="IdUsuario" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridTraza" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" 
                                    DataKeyNames="IdIngreso" DataSourceID="DataGridTraza" PageSize="20" 
                                    style="font-size: 9pt" Visible="False">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="SFANUMFAC" HeaderText="No. Fact" 
                                            SortExpression="SFANUMFAC" />
                                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                                            SortExpression="AINCONSEC" />
                                        <asp:BoundField DataField="UsFacturo" HeaderText="Us Facturo" 
                                            SortExpression="UsFacturo">
                                        <ItemStyle Font-Size="8pt" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFAFECFAC" HeaderText="Fecha Factura" 
                                            SortExpression="SFAFECFAC" />
                                        <asp:BoundField DataField="SFAFECANU" HeaderText="Fecha Anulación" 
                                            SortExpression="SFAFECANU">
                                        <ItemStyle Font-Bold="True" ForeColor="#CC0000" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFATOTFAC" DataFormatString="${0:0}" 
                                            HeaderText="Total" SortExpression="SFATOTFAC">
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFAVALPAC" DataFormatString="${0:0}" 
                                            HeaderText="Valor Paciente" SortExpression="SFAVALPAC">
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GDENOMBRE" HeaderText="Entidad" 
                                            SortExpression="GDENOMBRE" />
                                        <asp:BoundField DataField="PACNUMDOC" HeaderText="DI. Paciente" 
                                            SortExpression="PACNUMDOC" />
                                        <asp:BoundField DataField="SFAJUSANU" HeaderText="Motivo Anulación" 
                                            SortExpression="SFAJUSANU" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DataGridTraza" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                    SelectCommand="SELECT SLNFACTUR.SFAFECANU, SLNFACTUR.GENUSUARIO2 AS IdUsAnu, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAVALPAC, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINCONSEC, GENDETCON.GDENOMBRE, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAJUSANU, SLNFACTUR.SFANUMFAC, ADNINGRESO.OID AS IdIngreso, GENUSUARIO.USUDESCRI AS UsFacturo FROM GENDETCON INNER JOIN ADNINGRESO ON GENDETCON.OID = ADNINGRESO.GENDETCON INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO1 = GENUSUARIO.OID LEFT OUTER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.OID = @IdIngreso) ORDER BY SLNFACTUR.SFAFECANU">
                                    <SelectParameters>
                                        <asp:Parameter Name="IdIngreso" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td style="width: 10%; text-align: center; vertical-align: top;">
                                <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                                <br />
                                <asp:Button ID="BtnCerrarTraza" runat="server" Text="Cerrar Traza" 
                                    Visible="False" />
                                <br />
                            </td>
                    </table>
                    
                </asp:Panel>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                
                &nbsp;</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 20%" >
                &nbsp;</td>
            <td style="width: 30%" >
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

