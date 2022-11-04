<%@ Page Title="Resolución 025" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Res025.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
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
                </ContentTemplate>
    </asp:UpdatePanel>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Resolución 025</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style="border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                Facturas&nbsp;&nbsp;
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
                Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
                <td style="width: 25%; font-size: 9pt; text-align: center;" >
                <asp:Button ID="BtnExportar" runat="server" 
                    Text="Exportar a Excel" />
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
            <td style="width: 25%; text-align: right;" >
                
            </td>
        </tr>
        <tr >
            <td colspan="2" 
                style="border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                Traslados&nbsp;&nbsp;
                Fecha Inicial:<asp:TextBox ID="TextFechaIniTras" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIniTras" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="TextFechaIniTras">
                </asp:CalendarExtender> &nbsp;
                Fecha Final:<asp:TextBox ID="TextFechaFinTras" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFinTras" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    TargetControlID="TextFechaFinTras">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFinTraslado" runat="server" Visible="False"></asp:Label></td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="IdERP" HeaderText="IdERP" 
                            SortExpression="IdERP" ReadOnly="True" />
                        <asp:BoundField DataField="NumIdEPS" HeaderText="NumIdEPS" 
                            SortExpression="NumIdEPS" />
                        <asp:BoundField DataField="NumIdERP" HeaderText="NumIdERP" 
                            SortExpression="NumIdERP" ReadOnly="True" />
                        <asp:BoundField DataField="PrefijoFact" HeaderText="PrefijoFact" 
                            SortExpression="PrefijoFact" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NumFactura" HeaderText="NumFactura" 
                            SortExpression="NumFactura" ReadOnly="True" />
                        <asp:BoundField DataField="ValorFactura" 
                            HeaderText="ValorFactura" SortExpression="ValorFactura" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaEmisionFact" HeaderText="FechaEmisionFact" 
                            SortExpression="FechaEmisionFact" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaRadicacionFact" HeaderText="FechaRadicacionFact" 
                            SortExpression="FechaRadicacionFact" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorGlosaAceptada" HeaderText="ValorGlosaAceptada" 
                            ReadOnly="True" SortExpression="ValorGlosaAceptada" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorGlosaPendiente" 
                            HeaderText="ValorGlosaPendiente" ReadOnly="True" 
                            SortExpression="ValorGlosaPendiente" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TipoGiro" HeaderText="TipoGiro" ReadOnly="True" 
                            SortExpression="TipoGiro" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorGiro" HeaderText="ValorGiro" ReadOnly="True" 
                            SortExpression="ValorGiro" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TipoCumplimiento" HeaderText="TipoCumplimiento" 
                            ReadOnly="True" SortExpression="TipoCumplimiento" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaGiro" HeaderText="FechaGiro" ReadOnly="True" 
                            SortExpression="FechaGiro" />
                        <asp:BoundField DataField="ModalidadContrato" HeaderText="ModalidadContrato" 
                            ReadOnly="True" SortExpression="ModalidadContrato" />
                        <asp:BoundField DataField="TipoRegimen" HeaderText="TipoRegimen" 
                            SortExpression="TipoRegimen" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorDiario" HeaderText="ValorDiario" 
                            ReadOnly="True" SortExpression="ValorDiario" />
                        <asp:BoundField DataField="MesLMA" HeaderText="MesLMA" ReadOnly="True" 
                            SortExpression="MesLMA" />
                        <asp:BoundField DataField="CodMunicpio" HeaderText="CodMunicpio" 
                            ReadOnly="True" SortExpression="CodMunicpio" />
                        <asp:BoundField DataField="DescContratosAnteriores" 
                            HeaderText="DescContratosAnteriores" ReadOnly="True" 
                            SortExpression="DescContratosAnteriores" />
                        <asp:BoundField DataField="NumCuota" HeaderText="NumCuota" ReadOnly="True" 
                            SortExpression="NumCuota" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT 'NI' AS IdERP, GENTERCER.TERNUMDOC AS NumIdEPS, '891855438' AS NumIdERP, CONVERT (char(4), SLNFACTUR.SFANUMFAC) AS PrefijoFact, SUBSTRING(SLNFACTUR.SFANUMFAC, 5, 10) AS NumFactura, CONVERT (decimal(11 , 0), SLNFACTUR.SFATOTFAC) AS ValorFactura, CONVERT (char(10), SLNFACTUR.SFAFECFAC, 105) AS FechaEmisionFact, CONVERT (char(10), CRNDOCUME.CDFECDOC, 105) AS FechaRadicacionFact, (SELECT SUM(CONVERT (decimal(11 , 0), CRNTRAOBJD.CTDVALOBJ)) AS ValorAceptado FROM CRNCXC INNER JOIN CRNRECOBJC ON CRNCXC.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD WHERE (CRNCXC.SLNFACTUR = SLNFACTUR.OID)) AS ValorGlosaAceptada, (SELECT SUM(CRNRECOBJD_1.CROVALOBJ) AS ValorPendiente FROM CRNCXC AS CRNCXC_2 INNER JOIN CRNRECOBJC AS CRNRECOBJC_1 ON CRNCXC_2.OID = CRNRECOBJC_1.CRNCXC INNER JOIN CRNRECOBJD AS CRNRECOBJD_1 ON CRNRECOBJC_1.OID = CRNRECOBJD_1.CRNRECOBJC INNER JOIN CRNTRAOBJD AS CRNTRAOBJD_1 ON CRNRECOBJD_1.OID = CRNTRAOBJD_1.CRNRECOBJD LEFT OUTER JOIN SLNSERPRO ON CRNRECOBJD_1.SLNSERPRO = SLNSERPRO.OID WHERE (CRNCXC_2.SLNFACTUR = SLNFACTUR.OID)) AS ValorGlosaPendiente, '1' AS TipoGiro, CONVERT (decimal(11 , 0), CRNMTRASL.CMTNVALOR) AS ValorGiro, '1' AS TipoCumplimiento, CONVERT (char(10), CRNCTRASL.CCTFECTRA, 105) AS FechaGiro, '2' AS ModalidadContrato, CASE WHEN GDETIPREG = 1 THEN 2 ELSE CASE WHEN GDETIPREG = 2 THEN 1 ELSE CASE WHEN GDETIPREG = 3 OR GDETIPREG = 4 THEN 4 ELSE 3 END END END AS TipoRegimen, '' AS ValorDiario, '' AS MesLMA, '' AS CodMunicpio, '' AS DescContratosAnteriores, '' AS NumCuota FROM ADNINGRESO INNER JOIN GENDETCON INNER JOIN SLNFACTUR ON GENDETCON.OID = SLNFACTUR.GENDETCON ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO RIGHT OUTER JOIN GENTERCER INNER JOIN CRNCXC AS CRNCXC_1 INNER JOIN CRNRADFACD INNER JOIN CRNRADFACC ON CRNRADFACD.CRNRADFACC = CRNRADFACC.OID INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID ON CRNCXC_1.OID = CRNRADFACD.CRNCXC ON GENTERCER.OID = CRNCXC_1.GENTERCER ON SLNFACTUR.OID = CRNRADFACD.SLNFACTUR LEFT OUTER JOIN CRNMTRASL INNER JOIN CRNCTRASL ON CRNMTRASL.CRNCTRASL = CRNCTRASL.OID ON CRNCXC_1.OID = CRNMTRASL.CRNCXC WHERE (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (CRNRADFACC.CRFESTADO &lt;&gt; 3) AND (GENTERCER.TERNUMDOC = N'900298372' OR GENTERCER.TERNUMDOC = N'891800213' OR GENTERCER.TERNUMDOC = N'891180008' OR GENTERCER.TERNUMDOC = N'804002105' OR GENTERCER.TERNUMDOC = N'800249241' OR GENTERCER.TERNUMDOC = N'832000760' OR GENTERCER.TERNUMDOC = N'811004055' OR GENTERCER.TERNUMDOC = N'900156264' OR GENTERCER.TERNUMDOC = N'830074184' OR GENTERCER.TERNUMDOC = N'800140949' OR GENTERCER.TERNUMDOC = N'860066942' OR GENTERCER.TERNUMDOC = N'899999107' OR GENTERCER.TERNUMDOC = N'805000427' OR GENTERCER.TERNUMDOC = N'805001157' OR GENTERCER.TERNUMDOC = N'800251440' OR GENTERCER.TERNUMDOC = N'830003564' OR GENTERCER.TERNUMDOC = N'800130907' OR GENTERCER.TERNUMDOC = N'830028288' OR GENTERCER.TERNUMDOC = N'830039670' OR GENTERCER.TERNUMDOC = N'900801209' OR GENTERCER.TERNUMDOC = N'800251440' OR GENTERCER.TERNUMDOC = N'800251440' OR GENTERCER.TERNUMDOC = N'800176413') OR (SLNFACTUR.SFADOCANU = 0) AND (SLNFACTUR.SFAFECFAC &gt; CONVERT (DATETIME, '2017-01-01 00:00:00', 102)) AND (CRNRADFACC.CRFESTADO &lt;&gt; 3) AND (GENTERCER.TERNUMDOC = N'900298372' OR GENTERCER.TERNUMDOC = N'891800213' OR GENTERCER.TERNUMDOC = N'891180008' OR GENTERCER.TERNUMDOC = N'804002105' OR GENTERCER.TERNUMDOC = N'800249241' OR GENTERCER.TERNUMDOC = N'832000760' OR GENTERCER.TERNUMDOC = N'811004055' OR GENTERCER.TERNUMDOC = N'900156264' OR GENTERCER.TERNUMDOC = N'830074184' OR GENTERCER.TERNUMDOC = N'800140949' OR GENTERCER.TERNUMDOC = N'860066942' OR GENTERCER.TERNUMDOC = N'899999107' OR GENTERCER.TERNUMDOC = N'805000427' OR GENTERCER.TERNUMDOC = N'805001157' OR GENTERCER.TERNUMDOC = N'800251440' OR GENTERCER.TERNUMDOC = N'830003564' OR GENTERCER.TERNUMDOC = N'800130907' OR GENTERCER.TERNUMDOC = N'830028288' OR GENTERCER.TERNUMDOC = N'830039670' OR GENTERCER.TERNUMDOC = N'900801209' OR GENTERCER.TERNUMDOC = N'800251440' OR GENTERCER.TERNUMDOC = N'800251440' OR GENTERCER.TERNUMDOC = N'800176413') AND (CRNCTRASL.CCTFECTRA BETWEEN @FechaInicioTr AND @FechaFinTr) ORDER BY SLNFACTUR.SFAFECFAC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaIniTras" Name="FechaInicioTr" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFinTraslado" Name="FechaFinTr" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

