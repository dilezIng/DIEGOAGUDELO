<%@ Page Title="Auditoria de Historias Clinicas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="MedicosFolios.aspx.vb" Inherits="PaginaBase" %>

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
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
                AUDITORIA DE HISTORIAS CLINICAS (Por Profesional)</td>
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
   <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
            </td>
        </tr>
        <tr style="vertical-align: top">
            <td style="width: 25%; font-size: 9pt;" >
            <asp:Panel ID="Panel2" runat="server" Height="700px" ScrollBars="Vertical" 
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px">
                <asp:Label ID="LabelCantProfs" runat="server" ForeColor="#0066FF" 
                    style="font-weight: 700; font-size: 10pt"></asp:Label>
                <asp:RadioButtonList ID="ListMedicos" runat="server" 
                    DataSourceID="DataListMedicos" DataTextField="NomUsuario" 
                    DataValueField="IdUsuario" AutoPostBack="True">
                </asp:RadioButtonList>
                <asp:SqlDataSource ID="DataListMedicos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    SelectCommand="SELECT GENUSUARIO_1.USUDESCRI + N' (' + GENUSUARIO_1.USUNOMBRE + N')' AS NomUsuario, GENUSUARIO_1.OID AS IdUsuario FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON GENMEDICO_1.GENUSUARIO = GENUSUARIO_1.OID WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicial AND @FechaFinal) GROUP BY GENUSUARIO_1.USUDESCRI + N' (' + GENUSUARIO_1.USUNOMBRE + N')', GENUSUARIO_1.OID ORDER BY NomUsuario" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                    </asp:Panel>
            </td>
            <td style="font-size: 10pt; vertical-align: top; width: 75%;" colspan="3" >
                <asp:Label ID="LabelProfesional" runat="server" ForeColor="#0066FF" 
                    style="font-weight: 700; font-size: 14pt"></asp:Label>
                <br />
                <asp:GridView ID="GridFoliosMedico" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DataGridFoliosMedico" AllowSorting="True" 
                    EmptyDataText="No existen registros para el filtro seleccionado.">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:TemplateField HeaderText="Tipo Folio" SortExpression="NomTipoFolio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NomTipoFolio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CodTipoFolio") %>' 
                                    ToolTip='<%# Eval("NomTipoFolio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HCNUMFOL" HeaderText="No. Folio" 
                            SortExpression="HCNUMFOL" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha Creación" 
                            SortExpression="FechaCreacion" />
                        <asp:BoundField DataField="FechaGrabacion" HeaderText="Fecha Grabación" 
                            SortExpression="FechaGrabacion" />
                        <asp:BoundField DataField="FechaConfirmacion" HeaderText="Fecha Confirmación" 
                            SortExpression="FechaConfirmacion" />
                        <asp:BoundField DataField="Minutos" HeaderText="Min" SortExpression="Minutos">
                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HCACODIGO" HeaderText="Lugar" 
                            SortExpression="HCACODIGO" />
                        <asp:BoundField DataField="DocPaciente" HeaderText="D.I. Paciente" 
                            SortExpression="DocPaciente" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" 
                            SortExpression="Paciente" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridFoliosMedico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    SelectCommand="SELECT HCNFOLIO.OID, HCNTIPHIS.HCCODIGO AS CodTipoFolio, GENUSUARIO_1.OID AS IdUsuario, HCNFOLIO.HCFECFOLI AS FechaCreacion, HCNFOLIO.HCFECFOL AS FechaGrabacion, HCNFOLIO.HCNFECCONF AS FechaConfirmacion, CASE WHEN HCACODIGO IS NULL THEN CASE WHEN AINURGCON = 1 THEN 'Consulta Externa' ELSE 'Urgencias' END ELSE HCACODIGO END AS HCACODIGO, GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM + N' ' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE AS Paciente, HCNFOLIO.HCNUMFOL, HPNGRUPOS.HGRCODIGO AS NomServicio, HCNTIPHIS.HCNOMBRE AS NomTipoFolio, DATEDIFF(minute, HCNFOLIO.HCFECFOLI, HCNFOLIO.HCNFECCONF) AS Minutos FROM HCNTIPHIS INNER JOIN HCNFOLIO ON HCNTIPHIS.OID = HCNFOLIO.HCNTIPHIS INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON GENMEDICO_1.GENUSUARIO = GENUSUARIO_1.OID INNER JOIN GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID LEFT OUTER JOIN HPNDEFCAM INNER JOIN HPNESTANC ON HPNDEFCAM.OID = HPNESTANC.HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID INNER JOIN HPNTIPOCA ON HPNDEFCAM.HPNTIPOCA = HPNTIPOCA.OID ON ADNINGRESO.OID = HPNESTANC.ADNINGRES AND HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicial AND @FechaFinal) AND (GENUSUARIO_1.OID = @IdUsuario) ORDER BY FechaCreacion" 
                    
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListMedicos" Name="IdUsuario" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="DataGridFoliosMedico0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    SelectCommand="SELECT HCNFOLIO.OID, HCNTIPHIS.HCCODIGO AS CodTipoFolio, GENUSUARIO_1.OID AS IdUsuario, HCNFOLIO.HCFECFOLI AS FechaCreacion, HCNFOLIO.HCFECFOL AS FechaGrabacion, HCNFOLIO.HCNFECCONF AS FechaConfirmacion, CASE WHEN HCACODIGO IS NULL THEN CASE WHEN AINURGCON = 1 THEN 'Consulta Externa' ELSE 'Urgencias' END ELSE HCACODIGO END AS HCACODIGO, GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM + N' ' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE AS Paciente, HCNFOLIO.HCNUMFOL, HPNGRUPOS.HGRCODIGO AS NomServicio, HCNTIPHIS.HCNOMBRE AS NomTipoFolio, DATEDIFF(minute, HCNFOLIO.HCFECFOLI, HCNFOLIO.HCNFECCONF) AS Minutos FROM HCNTIPHIS INNER JOIN HCNFOLIO ON HCNTIPHIS.OID = HCNFOLIO.HCNTIPHIS INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON GENMEDICO_1.GENUSUARIO = GENUSUARIO_1.OID INNER JOIN GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID LEFT OUTER JOIN HPNDEFCAM INNER JOIN HPNESTANC ON HPNDEFCAM.OID = HPNESTANC.HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID INNER JOIN HPNTIPOCA ON HPNDEFCAM.HPNTIPOCA = HPNTIPOCA.OID ON ADNINGRESO.OID = HPNESTANC.ADNINGRES AND HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicial AND @FechaFinal) AND (GENUSUARIO_1.OID = @IdUsuario) ORDER BY FechaCreacion" 
                    
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListMedicos" Name="IdUsuario" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
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

