<%@ Page Title="Suministro a Paciente por Almacén" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Medica_control.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


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
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Solicitud Medicamentos Paciente + EPS</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                &nbsp;
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
            <td style="width: 30%; text-align: right;" >
                
                Medicamento:<asp:DropDownList ID="ListMedicamentos" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="OID">
                </asp:DropDownList>
                &nbsp;</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
		   <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" > </asp:BoundField>
                        <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" > </asp:BoundField>
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" ReadOnly="True" > </asp:BoundField>
						        <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" SortExpression="TELEFONO" ReadOnly="True" > </asp:BoundField>
                        <asp:BoundField DataField="Nombre  Medicamento" HeaderText="Nombre  Medicamento" SortExpression="Nombre  Medicamento" > </asp:BoundField> 
						<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" > </asp:BoundField>
						<asp:BoundField DataField="COD_Dx" HeaderText="COD_Dx" SortExpression="COD_Dx" />
						<asp:BoundField DataField="Dx" HeaderText="Dx" SortExpression="Dx" />
						<asp:BoundField DataField="Tipo_Dx" HeaderText="Tipo_Dx" SortExpression="Tipo_Dx" />
                        <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" >                        </asp:BoundField>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" > </asp:BoundField>
                        <asp:BoundField DataField="Cant" HeaderText="Cant" SortExpression="Cant" > </asp:BoundField>
                        <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" SortExpression="Medico" />
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />
                        <asp:BoundField DataField="Bloque" HeaderText="Bloque" ReadOnly="True" SortExpression="Bloque" />
                        <asp:BoundField DataField="Sitio" HeaderText="Sitio" ReadOnly="True" SortExpression="Sitio" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT OID, N'' + IPRCODIGO + ' ' + IPRDESCOR AS Nombre FROM INNPRODUC WHERE (IPRDESCOR LIKE '%CASPOFUNGINA%') OR (IPRDESCOR like '%CEFTRIAXONA%')  or (IPRDESCOR LIKE '%CEFTRIAZONA POLVO PARA RECONSTITUIR 1g %') OR (IPRDESCOR LIKE '%CEFEPIME POLVO PARA RECONSTITUIR 1 G%') OR (IPRDESCOR LIKE '%CIPROFLOXACINA  100 mg/10ml CLORHIDRATO  SOLUCION INYECTABLE DE BASE%') OR (IPRDESCOR LIKE '%CIPROFLOXACINA CLORHIDRATO TABLETA  500mg DE BASE%') OR (IPRDESCOR LIKE '%ERTAPEN%') OR (IPRDESCOR LIKE '%LINEZOLID%') OR (IPRDESCOR LIKE '%MEROPENEM  1G POLVO PARA RECONSTITUIR%') OR (IPRDESCOR LIKE '%MEROPENEM 500 mg POLVO ESTÉRIL PARA INYECCIÓN%') OR (IPRDESCOR LIKE '%DIPIRONA SODICA  SOLUCION INYECTABLE 1g/2ml%') OR (IPRDESCOR LIKE '%TIGECICLINA%') OR (IPRDESCOR LIKE '%PIPERACILINA TAZOBACTAM%') OR (IPRDESCOR LIKE '%VANCOMICINA CLORHIDRATO POLVO PARA  RECONSTITUIR 500mg DE BASE%') OR (IPRDESCOR LIKE '%GENTAMICINA (SULFATO)  SOLUCION INYECTABLE 80mg/2ml %') OR (IPRDESCOR LIKE '%AMPICILINA+SULBACTAM 250mg/5ml SUSPENSION ORAL%') OR (IPRDESCOR LIKE '%AMPICILINA SODICA +SULBACTAM SODICO POLVO PARA RECONSTITUIR 1g + 0.5g%') ORDER BY IPRDESCOR"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Identificacion, GENPACIENT.PACTELEFONO AS TELEFONO, GENPACIEN.PACPRINOM + '  ' + GENPACIEN.PACSEGNOM + '  ' + GENPACIEN.PACPRIAPE + '  ' + GENPACIEN.PACSEGAPE AS Paciente, INNPRODUC.IPRDESCOR AS 'Nombre  Medicamento', INNPRODUC.IPRCODIGO AS Codigo,GENDIAGNO.DIACODIGO AS COD_Dx,GENDIAGNO.DIANOMBRE AS Dx,CASE WHEN HCNDIAPAC.HCPDIAPRIN = 1 THEN 'PRINCIPAL' ELSE 'OTRO' END Tipo_Dx, HCNMEDPAC.HCSFECSOL AS 'Fecha Solicitud', HCNFOLIO.HCNUMFOL AS Folio, HCNMEDPAC.HCSCANTI AS Cant, HCNMEDPAC.HCSOBSERV AS Observacion, GENMEDICO_1.GMENOMCOM AS Medico, (SELECT GEEDESCRI FROM GENESPECI WHERE (OID = GENESPMED.ESPECIALIDADES)) AS Especialidad, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNGRUPOS.HGRCODIGO FROM HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNGRUPOS.OID = HPNDEFCAM.HPNGRUPOS WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Bloque, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Sitio, GEENENTADM.ENTNOMBRE AS Entidad FROM HCNMEDPAC INNER JOIN INNPRODUC ON HCNMEDPAC.INNPRODUC = INNPRODUC.OID INNER JOIN HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN AND HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENESPMED ON GENMEDICO_1.OID = GENESPMED.MEDICOS INNER JOIN HCNDIAPAC ON HCNFOLIO.OID =HCNDIAPAC.HCNFOLIO  INNER JOIN GENPACIENT ON GENPACIEN.GENPACIENT=GENPACIENT.OID     INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO=GENDIAGNO.OID WHERE (HCNMEDPAC.HCSFECSOL BETWEEN @p0 AND @p1) AND  (IPRDESCOR like '%CASPOFUNGINA%'   or  IPRDESCOR like '%VALVULA CONTORNEADA PRESION MEDIA%'   or IPRDESCOR like '%DISPOSITIVO INTRAUTERINO%' or   IPRDESCOR like '%ETONOGESTREL 68mg IMPLANTE SUBDERMICO TRES AÑOS%'  or   IPRDESCOR like '%LEVONORGESTREL IMPLANTE SUBDERMICO 4 AÑOS%' or   IPRDESCOR like '%CEFTRIAXONA%'  or   IPRDESCOR like '%CEFEPIME%'  or   IPRDESCOR like '%CIPROFLOXACINO%' OR (IPRDESCOR LIKE '%DIPIRONA SODICA  SOLUCION INYECTABLE 1g/2ml%') or   IPRDESCOR like '%ERTAPENEM%'  or   IPRDESCOR like '%CIPROFLOXACINA%'or   IPRDESCOR like '%LINEZOLID%'or   IPRDESCOR like '%MEROPENEM%' or   IPRDESCOR like '%TIGECICLINA%' or   IPRDESCOR like '%PIPERACILINA%' or IPRDESCOR like '%vancomicina%' OR IPRDESCOR LIKE '%AZTREONAM 1 g POLVO ESTÉRIL PARA INYECCIÓN%')    ORDER BY 'Fecha Solicitud'"                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="p1" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListMedicamentos" Name="IdMed" PropertyName="SelectedValue" />
                        
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

