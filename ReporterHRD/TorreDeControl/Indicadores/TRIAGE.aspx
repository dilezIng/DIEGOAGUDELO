<%@ Page Title="Certificados" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="TRIAGE.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/EnEspera.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
  <script language="javascript">

      function ShowModalPopup() {

          $find("Panel1_ModalPopupExtender").show();

      }

      function HideModalPopup() {

          $find("Panel1_ModalPopupExtender").hide();

      }

</script>
   <style type="text/css">
    .style8
    {
        height: 19px;
    }
       .style13
       {
           width: 243px;
           text-align: right;
       }
       .style14
       {
           width: 359px;
       }
       .style15
       {
           width: 513px;
       }
       .style16
       {
           width: 323px;
       }
       .style17
       {
           width: 139px;
       }
       .style18
       {
           height: 34px;
       }
       .style19
       {
           height: 33px;
       }
       .auto-style1 {
         
           text-align: center;
        color: #FFFFFF;
        font-size: x-large;
    }
       .auto-style6 {
           margin-bottom: 11px;
       }
       .auto-style7 {
           height: 26px;
       }
       .auto-style8 {
           width: 256px;
       }
       .auto-style10 {
           height: 26px;
           width: 256px;
       }
       .auto-style11 {
           height: 26px;
           width: 145px;
       }
   </style>
</head>
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
   <asp:Button ID="BtnExportar" runat="server" Text="Exportar a Excel" />
                     &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            


             <table style="width:100%;">
                 <tr>
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="2"><strong>Tiempos Triage - Ultimo folio<asp:Label ID="LabelFechaFin" runat="server" Visible="false"></asp:Label>
                         </strong></td>
                 </tr>
                 <tr>
                     <td class="auto-style11">Fecha Inicial:<asp:TextBox ID="TextFechaIni0" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaIni0_MaskedEditExtender" runat="server" InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni0" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaIni0_CalendarExtender" runat="server" TargetControlID="TextFechaIni0" />
                     </td>
                     <td class="auto-style8">
                         &nbsp;</td>
                 </tr>
                 <tr  >
                     <td class="auto-style11" >Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" TargetControlID="TextFechaFin" />
                         <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" />
                     </td>
                     <td class="auto-style10">
                         &nbsp;</td>
                 </tr>



 
    
              <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="Small">
                  <AlternatingRowStyle BackColor="#EEEEFE" />
                  <Columns>
                      <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                      <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha Ingreso" />
                      <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                      <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" ReadOnly="True" />
                      <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" ReadOnly="True" />
                   
                      <asp:BoundField DataField="Fecha Digiturno" HeaderText="Fecha Digiturno" SortExpression="Fecha Digiturno" />
                      <asp:BoundField DataField="Triage" HeaderText="Triage" SortExpression="Triage" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Triage" HeaderText="Fecha Triage" SortExpression="Fecha Triage" />
                      <asp:BoundField DataField="DIG-TRI" HeaderText="DIG-TRI" ReadOnly="True" SortExpression="DIG-TRI" />
                      <asp:BoundField DataField="Medico Triage" HeaderText="Medico Triage" SortExpression="Medico Triage" />
                      <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" ReadOnly="True" />
                      <asp:BoundField DataField="Medico Consulta" HeaderText="Medico_FOLIO_1" SortExpression="Medico Consulta" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Inicia Folio" HeaderText="Fecha_Inicio_FOLIO_1" SortExpression="Fecha Inicia Folio" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha confirma Folio" HeaderText="Fecha_confirma_FOLIO_1" SortExpression="Fecha confirma Folio" ReadOnly="True" />
                      <asp:BoundField DataField="TRI-CON1" HeaderText="TRI-FOL1" ReadOnly="True" SortExpression="TRI-CON1" />
					 
					        <asp:BoundField DataField="Ultimo_Medico" HeaderText="Ultimo_Medico" SortExpression="Ultimo_Medico" ReadOnly="True" />
                      <asp:BoundField DataField="Fech_Ultimo_folio" HeaderText="Fech_Ultimo_folio" SortExpression="Fech_Ultimo_folio" ReadOnly="True" />
               
                      <asp:BoundField DataField="FOL1-FOLN" HeaderText="FOL1-FOLN" ReadOnly="True" SortExpression="FOL1-FOLN" />
					 
					 
					 
					 
					 
                      <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                      <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
					                       <asp:BoundField DataField="codDX" HeaderText="codDX" SortExpression="codDX" />
										    <asp:BoundField DataField="dx" HeaderText="dx" SortExpression="DX" />
                   

			   </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, CASE WHEN ADNINGRESO.AINESTADO = 0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO = 1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO = 2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO = 3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO = 4 THEN 'Cerrado' END AS Estado, ADNINGRESO.AINFECING AS 'Fecha Ingreso', GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS 'Edad', HCNCONTRDT.HCCFECTUR AS 'Fecha Digiturno', CASE WHEN HCNTRIAGE.HCNCLAURGTR = 6 THEN 5 ELSE HCNTRIAGE.HCNCLAURGTR END AS Triage, HCNTRIAGE.HCTFECTRI AS 'Fecha Triage', ABS(DATEDIFF(MINUTE, HCNCONTRDT.HCCFECTUR, HCNTRIAGE.HCTFECTRI)) AS 'DIG-TRI', GENMEDICO.GMENOMCOM AS 'Medico Triage', MIN(HCNFOLIO.HCNUMFOL) AS Folio, (SELECT GENMEDHC.GMENOMCOM FROM HCNFOLIO AS HC INNER JOIN GENMEDICO AS GENMEDHC ON HC.GENMEDICOA = GENMEDHC.OID WHERE (HC.HCNUMFOL = MIN(HCNFOLIO.HCNUMFOL)) AND (HC.ADNINGRESO = ADNINGRESO.OID)) AS 'Medico Consulta',ABS(DATEDIFF(MINUTE, HCNTRIAGE.HCTFECTRI, (SELECT HCFECFOLI FROM HCNFOLIO AS HC WHERE (HCNUMFOL = MIN(HCNFOLIO.HCNUMFOL)) AND (ADNINGRESO = ADNINGRESO.OID)))) AS 'TRI-CON1', (SELECT HCFECFOLI FROM HCNFOLIO AS HC WHERE (HCNUMFOL = MIN(HCNFOLIO.HCNUMFOL)) AND (ADNINGRESO = ADNINGRESO.OID)) AS 'Fecha Inicia Folio', (SELECT HCNFECCONF FROM HCNFOLIO AS HC WHERE (HCNUMFOL = MIN(HCNFOLIO.HCNUMFOL)) AND (ADNINGRESO = ADNINGRESO.OID)) AS 'Fecha confirma Folio',(SELECT GMENOMCOM FROM GENMEDICO AS GENMEDICO_1 WHERE (OID = (SELECT TOP (1) HCNFOLIO_4.GENMEDICOA FROM HCNFOLIO AS HCNFOLIO_4 INNER JOIN HCNDIAPAC AS HCNDIAPAC_4 ON HCNFOLIO_4.OID = HCNDIAPAC_4.HCNFOLIO WHERE (HCNFOLIO_4.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_4.OID DESC))) AS Ultimo_Medico,  (SELECT TOP (1) HCNFOLIO_2.HCNFECCONF FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNDIAPAC AS HCNDIAPAC_2 ON HCNFOLIO_2.OID = HCNDIAPAC_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC) AS Fech_Ultimo_folio, ABS(DATEDIFF(MINUTE, (SELECT HCFECFOLI FROM HCNFOLIO AS HC WHERE (HCNUMFOL = MIN(HCNFOLIO.HCNUMFOL)) AND (ADNINGRESO = ADNINGRESO.OID)),(SELECT TOP (1) HCNFOLIO_2.HCNFECCONF FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNDIAPAC AS HCNDIAPAC_2 ON HCNFOLIO_2.OID = HCNDIAPAC_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_2.OID DESC))) AS 'FOL1-FOLN',GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen,(SELECT  GENDIAGNO.DIACODIGO FROM GENDIAGNO WHERE GENDIAGNO.OID =HCNTRIAGE.GENDIAGNO1) AS codDX,(SELECT DIANOMBRE FROM GENDIAGNO WHERE GENDIAGNO.OID =HCNTRIAGE.GENDIAGNO1) AS DX  FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID LEFT OUTER JOIN HCNCONTRDT ON HCNTRIAGE.HCNCONTRDT = HCNCONTRDT.OID LEFT OUTER JOIN GENMEDICO ON HCNTRIAGE.GENMEDICO = GENMEDICO.OID INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:00') and adningreso.ADNCENATE=1 GROUP BY HCNCONTRDT.HCCTTURNO, HCNCONTRDT.HCCFECTUR, HCNTRIAGE.HCNCLAURGTR, HCNTRIAGE.HCTFECTRI, GENMEDICO.GMENOMCOM, ADNINGRESO.AINCONSEC, ADNINGRESO.AINESTADO, ADNINGRESO.AINFECING, GENPACIEN.PACNUMDOC, GENPACIEN.PACPRINOM, GENPACIEN.PACSEGNOM, GENPACIEN.PACPRIAPE, GENPACIEN.PACSEGAPE, GENPACIEN.GPAFECNAC, GEENENTADM.ENTNOMBRE, GENDETCON.GDECODIGO, ADNINGRESO.OID, HCTOBSERV ,HCNTRIAGE.HCTMOTCON,HCNTRIAGE.GENDIAGNO1 ORDER BY 'Medico Consulta',Triage">
                      
					  <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>