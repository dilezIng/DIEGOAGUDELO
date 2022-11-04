<%@ Page Title="Resumen Glosas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="SegGlosas.aspx.vb" Inherits="PaginaBase" %>

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
                
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                SEGUIMIENTO DE GLOSAS POR ENTIDAD</td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                <asp:RadioButtonList ID="ListIngsFacts" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True" Enabled="False" 
                    Visible="False">
                    <asp:ListItem Selected="True" Value="0">Facturas</asp:ListItem>
                    <asp:ListItem Value="1">Ingresos</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%; font-size: 9pt;" >
                <asp:RadioButtonList ID="ListAnuBloq" runat="server" 
                    RepeatDirection="Horizontal" Visible="False">
                    <asp:ListItem Value="3" Selected="True">Bloqueados</asp:ListItem>
                    <asp:ListItem Value="2">Anulados</asp:ListItem>
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
            <td style="font-size: 9pt;" colspan="4" >
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="Nit" HeaderText="Nit" 
                            SortExpression="Nit" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Nomentidad" HeaderText="Entidad" 
                            SortExpression="Nomentidad" ReadOnly="True" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" 
                            SortExpression="Regimen" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="GlosaInicial" HeaderText="G.Inicial" 
                            SortExpression="GlosaInicial" DataFormatString="${0:N0}" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ratificado" HeaderText="Ratificada" 
                            SortExpression="Ratificado" ReadOnly="True" DataFormatString="${0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalRadicado" HeaderText="T. Radicado" 
                            SortExpression="TotalRadicado" ReadOnly="True" DataFormatString="${0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RespondidaPrimeraVez" HeaderText="Resp.P.Vez" 
                            SortExpression="RespondidaPrimeraVez" ReadOnly="True" 
                            DataFormatString="${0:N0}"  >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Conciliada" HeaderText="Conciliada" 
                            ReadOnly="True" SortExpression="Conciliada" DataFormatString="${0:N0}"  >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalGestionada" HeaderText="T.Gestionada" ReadOnly="True" 
                            SortExpression="TotalGestionada" DataFormatString="${0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT        GENTERCER.TERNUMDOC AS Nit, GENTERCER.TERPRINOM + N' ' + GENTERCER.TERSEGNOM + N' ' + GENTERCER.TERPRIAPE + N' ' + GENTERCER.TERSEGAPE AS Nomentidad, 
                         CASE WHEN GDETIPREG = 1 THEN 'Contributivo' WHEN GDETIPREG = 2 THEN 'Susidiado' WHEN GDETIPREG = 3 THEN 'Excepcion' WHEN GDETIPREG = 4 THEN 'Especial' WHEN GDETIPREG = 2 THEN 'No Asegurado' ELSE 'Ninguno'
                          END AS Regimen, GENDETCON_1.GDETIPREG, SUM(CRNRECOBJD_1.CROVALOBJ) AS GlosaInicial,
                             (SELECT        CASE WHEN SUM(CRNRECOBJD.CROVALOBJ) IS NULL THEN 0 ELSE SUM(CRNRECOBJD.CROVALOBJ) END AS ValObjetado
                               FROM            CRNRECOBJC INNER JOIN
                                                         CRNCXC ON CRNRECOBJC.CRNCXC = CRNCXC.OID INNER JOIN
                                                         CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN
                                                         GENDETCON ON CRNCXC.GENDETCON = GENDETCON.OID INNER JOIN
                                                         GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID
                               WHERE        (CRNRECOBJC.CROFECOBJ BETWEEN @FechaInicio AND @FechaFin) AND (GENCONTRA.GENTERCER1 = GENCONTRA_1.GENTERCER1) AND (CRNRECOBJC.CROOBSERV LIKE N'%RATIFICADA%')) AS Ratificado, 
                         CASE WHEN SUM(CRNRECOBJD_1.CROVALOBJ) IS NULL THEN 0 ELSE SUM(CRNRECOBJD_1.CROVALOBJ) END +
                             (SELECT        CASE WHEN SUM(CRNRECOBJD_2.CROVALOBJ) IS NULL THEN 0 ELSE SUM(CRNRECOBJD_2.CROVALOBJ) END AS ValObjetado
                               FROM            CRNRECOBJC AS CRNRECOBJC_2 INNER JOIN
                                                         CRNCXC AS CRNCXC_2 ON CRNRECOBJC_2.CRNCXC = CRNCXC_2.OID INNER JOIN
                                                         CRNRECOBJD AS CRNRECOBJD_2 ON CRNRECOBJC_2.OID = CRNRECOBJD_2.CRNRECOBJC INNER JOIN
                                                         GENDETCON AS GENDETCON_2 ON CRNCXC_2.GENDETCON = GENDETCON_2.OID INNER JOIN
                                                         GENCONTRA AS GENCONTRA_2 ON GENDETCON_2.GENCONTRA1 = GENCONTRA_2.OID
                               WHERE        (CRNRECOBJC_2.CROFECOBJ BETWEEN @FechaInicio AND @FechaFin) AND (GENCONTRA_2.GENTERCER1 = GENCONTRA_1.GENTERCER1) AND (CRNRECOBJC_2.CROOBSERV LIKE N'%RATIFICADA%')) 
                         AS TotalRadicado,
                             (SELECT        SUM(CRNRECOBJD_3.CROVALOBJ) AS Expr1
                               FROM            CRNTRAOBJC INNER JOIN
                                                         CRNTRAOBJD ON CRNTRAOBJC.OID = CRNTRAOBJD.CRNTRAOBJC INNER JOIN
                                                         CRNRECOBJC AS CRNRECOBJC_3 ON CRNTRAOBJC.CRNRECOBJC = CRNRECOBJC_3.OID INNER JOIN
                                                         CRNCXC AS CRNCXC_3 ON CRNRECOBJC_3.CRNCXC = CRNCXC_3.OID INNER JOIN
                                                         GENDETCON AS GENDETCON_3 ON CRNCXC_3.GENDETCON = GENDETCON_3.OID INNER JOIN
                                                         GENCONTRA AS GENCONTRA_3 ON GENDETCON_3.GENCONTRA1 = GENCONTRA_3.OID INNER JOIN
                                                         CRNDOCUME ON CRNTRAOBJC.OID = CRNDOCUME.OID INNER JOIN
                                                         CRNRECOBJD AS CRNRECOBJD_3 ON CRNTRAOBJD.CRNRECOBJD = CRNRECOBJD_3.OID
                               WHERE        (GENCONTRA_3.GENTERCER1 = GENCONTRA_1.GENTERCER1) AND (CASE WHEN CTOOBSERV LIKE N'%ACTA%' THEN 1 ELSE 0 END = 0) AND (CRNDOCUME.CDFECDOC BETWEEN @FechaInicio AND 
                                                         @FechaFin) AND (GENDETCON_3.GDETIPREG = GENDETCON_1.GDETIPREG)) AS RespondidaPrimeraVez,
                             (SELECT        SUM(CRNRECOBJD_4.CROVALOBJ) AS Expr1
                               FROM            CRNTRAOBJC AS CRNTRAOBJC_1 INNER JOIN
                                                         CRNTRAOBJD AS CRNTRAOBJD_1 ON CRNTRAOBJC_1.OID = CRNTRAOBJD_1.CRNTRAOBJC INNER JOIN
                                                         CRNRECOBJC AS CRNRECOBJC_4 ON CRNTRAOBJC_1.CRNRECOBJC = CRNRECOBJC_4.OID INNER JOIN
                                                         CRNCXC AS CRNCXC_4 ON CRNRECOBJC_4.CRNCXC = CRNCXC_4.OID INNER JOIN
                                                         GENDETCON AS GENDETCON_4 ON CRNCXC_4.GENDETCON = GENDETCON_4.OID INNER JOIN
                                                         GENCONTRA AS GENCONTRA_4 ON GENDETCON_4.GENCONTRA1 = GENCONTRA_4.OID INNER JOIN
                                                         CRNDOCUME AS CRNDOCUME_1 ON CRNTRAOBJC_1.OID = CRNDOCUME_1.OID INNER JOIN
                                                         CRNRECOBJD AS CRNRECOBJD_4 ON CRNTRAOBJD_1.CRNRECOBJD = CRNRECOBJD_4.OID
                               WHERE        (GENCONTRA_4.GENTERCER1 = GENCONTRA_1.GENTERCER1) AND (CRNDOCUME_1.CDFECDOC BETWEEN @FechaInicio AND @FechaFin) AND (CRNTRAOBJC_1.CTOOBSERV LIKE N'%ACTA%') AND 
                                                         (GENDETCON_4.GDETIPREG = GENDETCON_1.GDETIPREG)) AS Conciliada,
                             (SELECT        SUM(CRNRECOBJD_5.CROVALOBJ) AS Expr1
                               FROM            CRNTRAOBJC AS CRNTRAOBJC_2 INNER JOIN
                                                         CRNTRAOBJD AS CRNTRAOBJD_2 ON CRNTRAOBJC_2.OID = CRNTRAOBJD_2.CRNTRAOBJC INNER JOIN
                                                         CRNRECOBJC AS CRNRECOBJC_5 ON CRNTRAOBJC_2.CRNRECOBJC = CRNRECOBJC_5.OID INNER JOIN
                                                         CRNCXC AS CRNCXC_5 ON CRNRECOBJC_5.CRNCXC = CRNCXC_5.OID INNER JOIN
                                                         GENDETCON AS GENDETCON_5 ON CRNCXC_5.GENDETCON = GENDETCON_5.OID INNER JOIN
                                                         GENCONTRA AS GENCONTRA_5 ON GENDETCON_5.GENCONTRA1 = GENCONTRA_5.OID INNER JOIN
                                                         CRNDOCUME AS CRNDOCUME_2 ON CRNTRAOBJC_2.OID = CRNDOCUME_2.OID INNER JOIN
                                                         CRNRECOBJD AS CRNRECOBJD_5 ON CRNTRAOBJD_2.CRNRECOBJD = CRNRECOBJD_5.OID
                               WHERE        (GENCONTRA_5.GENTERCER1 = GENCONTRA_1.GENTERCER1) AND (CRNDOCUME_2.CDFECDOC BETWEEN @FechaInicio AND @FechaFin) AND (GENDETCON_5.GDETIPREG = GENDETCON_1.GDETIPREG)) 
                         AS TotalGestionada
FROM            CRNRECOBJC AS CRNRECOBJC_1 INNER JOIN
                         CRNCXC AS CRNCXC_1 ON CRNRECOBJC_1.CRNCXC = CRNCXC_1.OID INNER JOIN
                         CRNRECOBJD AS CRNRECOBJD_1 ON CRNRECOBJC_1.OID = CRNRECOBJD_1.CRNRECOBJC INNER JOIN
                         GENDETCON AS GENDETCON_1 ON CRNCXC_1.GENDETCON = GENDETCON_1.OID INNER JOIN
                         GENCONTRA AS GENCONTRA_1 INNER JOIN
                         GENTERCER ON GENCONTRA_1.GENTERCER1 = GENTERCER.OID ON GENDETCON_1.GENCONTRA1 = GENCONTRA_1.OID INNER JOIN
                         SLNFACTUR ON CRNCXC_1.SLNFACTUR = SLNFACTUR.OID
WHERE        (CRNRECOBJC_1.CROFECOBJ BETWEEN @FechaInicio AND @FechaFin) AND (CASE WHEN CROOBSERV LIKE N'%RATIFICADA%' THEN 1 ELSE 0 END = 0)
GROUP BY GENTERCER.TERNUMDOC, GENTERCER.TERPRINOM + N' ' + GENTERCER.TERSEGNOM + N' ' + GENTERCER.TERPRIAPE + N' ' + GENTERCER.TERSEGAPE, GENDETCON_1.GDETIPREG, GENCONTRA_1.GENTERCER1
ORDER BY Nomentidad">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                &nbsp;</td>
            <td style="width: 25%; font-size: 9pt;" >
                &nbsp;</td>
            <td style="width: 20%" >
                &nbsp;</td>
            <td style="width: 30%; text-align: right;" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 16pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" >
                <asp:Label ID="LabelSubTitulo" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                &nbsp;</td>
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
                    Height="600px" ScrollBars="Vertical" Width="900px" GroupingText="Oxigeno">
                    
                    <table style="width: 100%; font-family: tahoma;">
                        
                        </tr>
                            <tr>
                                <td style="width: 90%; font-size: 10pt;">
                                    <asp:GridView ID="GridDetRegEnf" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="DataGridDetRegEnf" PageSize="20">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="HCRHORREG" HeaderText="Hora Registro" 
                                                SortExpression="HCRHORREG" />
                                            <asp:BoundField DataField="NomActividad" HeaderText="Actividad" 
                                                SortExpression="NomActividad" />
                                            <asp:BoundField DataField="HCAOBSERV" HeaderText="Observaciones" 
                                                SortExpression="HCAOBSERV" />
                                            <asp:BoundField DataField="USUDESCRI" HeaderText="Usuario" 
                                                SortExpression="USUDESCRI" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataGridDetRegEnf" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT ADNINGRESO.AINCONSEC, HCNACTENFD.OID, HCNACTENFD.GENMEDICO, HCNACTENFD.HCRHORREG, HCNACTENFD.HCNACTENF, HCNACTENFD.HCAOBSERV, HCNACTENFD.OptimisticLockField, HCNACTENFD.HCAHORFIN, HCNACTENFD.HCALITXMIN, GENMEDICO.GMETARPRO, GENUSUARIO.USUDESCRI, ADNINGRESO.OID AS Expr1, CASE WHEN HCTIPACT = 38 THEN 'Canula nasal' WHEN HCTIPACT = 39 THEN 'Ventury' WHEN HCTIPACT = 40 THEN 'Hood' WHEN HCTIPACT = 41 THEN 'Traqueostomia' WHEN HCTIPACT = 42 THEN 'Aspiración Secreciؚón' WHEN HCTIPACT = 43 THEN 'Tubo Orotraqueal' WHEN HCTIPACT = 44 THEN 'Ventilación Mecánica' WHEN HCTIPACT = 45 THEN 'Otros' WHEN HCTIPACT = 67 THEN 'CPAP' END AS NomActividad FROM ADNINGRESO INNER JOIN HCNREGENF ON ADNINGRESO.OID = HCNREGENF.ADNINGRESO INNER JOIN HCNACTENF ON HCNREGENF.OID = HCNACTENF.HCNREGENF INNER JOIN HCNACTENFD ON HCNACTENF.OID = HCNACTENFD.HCNACTENF INNER JOIN GENMEDICO ON HCNACTENFD.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE (ADNINGRESO.OID = 0) AND (HCNACTENF.HCTIPACT = 67 OR HCNACTENF.HCTIPACT = 38 OR HCNACTENF.HCTIPACT = 39 OR HCNACTENF.HCTIPACT = 40 OR HCNACTENF.HCTIPACT = 41 OR HCNACTENF.HCTIPACT = 42 OR HCNACTENF.HCTIPACT = 43 OR HCNACTENF.HCTIPACT = 44 OR HCNACTENF.HCTIPACT = 45) ORDER BY HCNACTENFD.HCRHORREG">
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 10%; text-align: center; vertical-align: top;">
                                    <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                                    <br />
                                    <asp:Button ID="BtnCerrarTraza" runat="server" Text="Cerrar Traza" 
                                        Visible="False" />
                                    <br />
                                </td>
                        </tr>
                        </table>
                   
                    
                </asp:Panel>
                 <%--</table>--%>
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

