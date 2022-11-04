<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="SolTerapia.aspx.vb" Inherits="SolTerapia" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



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
           
    .auto-style1 {
        text-align: left;
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
                >Solicitud de Terapias y Gases</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style1" >
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
                
            </td>
            <td style="width: 30%; text-align: left;" rowspan="2" >
                
                Solicitud:<asp:DropDownList ID="ListMedicamentos" runat="server" DataSourceID="SqlDataSource1" DataTextField="Solicitud" DataValueField="Codigo">
                    <asp:ListItem Selected="True" Value="4285">LEVONORGESTREL IMPLANTE SUBDERMICO 5 AÑOS</asp:ListItem>
                </asp:DropDownList>
                &nbsp;</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" rowspan="2" >
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Buscar" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT SIPCODIGO AS Codigo, SIPNOMBRE AS Solicitud, SIPESTADO FROM GENSERIPS WHERE (SIPNOMBRE LIKE '%ESTIMULACION TEMPRANA SESION %' OR SIPNOMBRE LIKE '%GASES ARTERIALES %' OR SIPNOMBRE LIKE 'TERAPIA OCUPACIONAL%') AND (SIPESTADO = 'True') OR (SIPNOMBRE LIKE 'INHALOTERAPIA SESION NEBULIZACION ULTRASONICO O PRESION POSITIVA INTERMITENTE') AND (SIPESTADO = 1) AND (SIPESTADO = 'True') OR (SIPNOMBRE LIKE 'TERAPIA DE REHABILITACION%') AND (SIPESTADO = 'True') OR (SIPNOMBRE LIKE 'TERAPIA DEL LENGUAJE%') AND (SIPESTADO = 'True') OR (SIPNOMBRE LIKE 'TERAPIA FISICA%') AND (SIPESTADO = 'True') OR (SIPNOMBRE LIKE 'TERAPIA FONOAUDIOLOGICA INTEGRAL SOD%') AND (SIPESTADO = 'True') OR (SIPNOMBRE LIKE 'TERAPIA RESPIRATORIA%') AND (SIPESTADO = 'True') ORDER BY Solicitud"></asp:SqlDataSource>
            </td>
            
        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style1" >
                Fecha Final:&nbsp; <asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender></td>
            
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
                  >
                    <AlternatingRowStyle BackColor="#F0F0F0" /> <Columns>
                         <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Documento" HeaderText="Documento" 
                            SortExpression="Documento" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" 
                            SortExpression="Fecha Solicitud" >
                        </asp:BoundField>
                        <asp:BoundField DataField="N Fol" HeaderText="N Fol" 
                            SortExpression="N Fol" >
                        </asp:BoundField>

                         <asp:BoundField DataField="Bloque" HeaderText="Bloque" 
                            SortExpression="Bloque" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Sitio" HeaderText="Sitio" 
                            SortExpression="Sitio" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" 
                            SortExpression="Solicitud" >
                        </asp:BoundField>
                         <asp:BoundField DataField="SIPCODIGO" HeaderText="SIPCODIGO" SortExpression="SIPCODIGO" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE + ' ' + GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM AS Paciente, HCNSOLPNQX.HCSFECSOL AS 'Fecha Solicitud', HCNFOLIO.HCNUMFOL AS 'N Fol', CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNGRUPOS.HGRCODIGO FROM HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNGRUPOS.OID = HPNDEFCAM.HPNGRUPOS WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Bloque, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Sitio, GENSERIPS.SIPNOMBRE AS Solicitud, GENSERIPS.SIPCODIGO FROM ULTIMA_TERAPIA INNER JOIN HCNSOLPNQX ON HCNSOLPNQX.HCNFOLIO = ULTIMA_TERAPIA.Ult_Ter INNER JOIN ADNINGRESO ON ADNINGRESO.OID = HCNSOLPNQX.ADNINGRESO INNER JOIN GENPACIEN ON GENPACIEN.OID = ADNINGRESO.GENPACIEN INNER JOIN GENSERIPS ON GENSERIPS.OID = HCNSOLPNQX.GENSERIPS INNER JOIN HCNFOLIO ON HCNSOLPNQX.HCNFOLIO = HCNFOLIO.OID WHERE (ADNINGRESO.AINESTADO = 0) AND ((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (SLNFACTUR = HCNSOLPNQX.OID)) IS NULL) AND ((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) IS NULL) AND (HCNSOLPNQX.HCSFECSOL BETWEEN @p0 AND @p1 + ' 23:59:59') AND (GENSERIPS.SIPCODIGO = @codigo) ORDER BY 'Fecha Solicitud' DESC"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListMedicamentos" Name="codigo" 
                            PropertyName="SelectedValue" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS 'Documento', GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE + ' ' + GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM AS 'Paciente', HCNSOLEXA.HCSFECSOL AS 'Fecha Solicitud', HCNFOLIO.HCNUMFOL AS 'N Fol', CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNGRUPOS.HGRCODIGO FROM HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNGRUPOS.OID = HPNDEFCAM.HPNGRUPOS WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Bloque, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Sitio, GENSERIPS.SIPNOMBRE FROM HCNSOLEXA INNER JOIN HCNFOLIO ON HCNSOLEXA.HCNFOLIO = HCNFOLIO.OID INNER JOIN ADNINGRESO ON ADNINGRESO.OID = HCNSOLEXA.ADNINGRESO INNER JOIN GENPACIEN ON GENPACIEN.OID = ADNINGRESO.GENPACIEN INNER JOIN GENSERIPS ON GENSERIPS.OID = HCNSOLEXA.GENSERIPS WHERE (ADNINGRESO.AINESTADO = 0) AND (GENSERIPS.SIPCODIGO = @COD2) AND (HCNSOLEXA.HCSFECSOL BETWEEN @p0 AND @p1 + ' 23:59:59') AND ((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) IS NULL) ORDER BY 'Fecha Solicitud' DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMedicamentos" Name="COD2" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                   <br />
                
                
                   <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                  >
                    <AlternatingRowStyle BackColor="#F0F0F0" /> 
                       <Columns>
                           <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                           <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                           <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                           <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                           <asp:BoundField DataField="N Fol" HeaderText="N Fol" SortExpression="N Fol" />
                           <asp:BoundField DataField="Bloque" HeaderText="Bloque" ReadOnly="True" SortExpression="Bloque" />
                           <asp:BoundField DataField="Sitio" HeaderText="Sitio" ReadOnly="True" SortExpression="Sitio" />
                           <asp:BoundField DataField="SIPNOMBRE" HeaderText="SIPNOMBRE" SortExpression="SIPNOMBRE" />
                       </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td>
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


