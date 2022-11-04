<%@ Page Title="ATENCION EN URGENCIAS" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ATENCIONURGENCIAS.aspx.vb" Inherits="PaginaBase" %>

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
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="6"><strong>Tiempo Estancia en Urgencias
                         <asp:Label ID="LabelFechaFin" runat="server" Visible="false"></asp:Label>
                         </strong></td>
                 </tr>
                 <tr>
                     <td class="auto-style11">Fecha Inicial:<asp:TextBox ID="TextFechaIni0" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaIni0_MaskedEditExtender" runat="server" InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni0" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaIni0_CalendarExtender" runat="server" TargetControlID="TextFechaIni0" />
                     </td>
                     <td class="auto-style8">
                         &nbsp;</td>
                     <td class="auto-style6"></td>
                     <td class="auto-style6"></td>
                     <td class="auto-style6"></td>
                     <td class="auto-style6">
                         &nbsp;</td>
                 </tr>
                 <tr  >
                     <td class="auto-style11" >Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" TargetControlID="TextFechaFin" />
                     </td>
                     <td class="auto-style10">
                         &nbsp;</td>
                     <td class="auto-style7"></td>
                     <td class="auto-style7"></td>
                     <td class="auto-style7"></td>
                     <td class="auto-style7">
                         <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" />
                     </td>
                 </tr>



 
    
              <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="Small">
                  <Columns>
				  <asp:BoundField DataField="Triage" HeaderText="Triage" SortExpression="Triage" />
<asp:BoundField DataField="Fech_Triage" HeaderText="Fech_Triage" SortExpression="Fech_Triage" />
<asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
<asp:BoundField DataField="Fech_Ingreso" HeaderText="Fech_Ingreso" SortExpression="Fech_Ingreso" />
<asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
<asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" />
<asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
<asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
<asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
<asp:BoundField DataField="Fecha_Egreso" HeaderText="Fecha_Egreso" SortExpression="Fecha_Egreso" />
<asp:BoundField DataField="Tiempo_en_Urg(Dias)" HeaderText="Tiempo_en_Urg(Dias)" SortExpression="Tiempo_en_Urg(Dias)" />
<asp:BoundField DataField="Tiempo_en_Urg(Horas)" HeaderText="Tiempo_en_Urg(Horas)" SortExpression="Tiempo_en_Urg(Horas)" />
<asp:BoundField DataField="Tiempo_en_Urg(Min)" HeaderText="Tiempo_en_Urg(Min)" SortExpression="Tiempo_en_Urg(Min)" />
<asp:BoundField DataField="Tiempo_en_Urg(Mintotal)" HeaderText="Tiempo_en_Urg(Mintotal)" SortExpression="Tiempo_en_Urg(Mintotal)" />
                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand=" SELECT DISTINCT HCNTRIAGE.HCNCLAURGTR AS Triage,  HCNTRIAGE.HCTFECTRI AS Fech_Triage,
 ADNINGRESO.AINCONSEC AS Ingreso,  ADNINGRESO.AINFECING AS Fech_Ingreso,  GENPACIEN.PACNUMDOC AS Documento, 
 GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad,
 GENDETCON.GDECODIGO AS Regimen , GEENENTADM.ENTNOMBRE AS Entidad, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Fecha_Egreso,
  ABS(DATEDIFF(mi, HCNTRIAGE.HCTFECTRI, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)))/ 1440) AS 'Tiempo_en_Urg(Dias)',
   ABS(DATEDIFF(mi, HCNTRIAGE.HCTFECTRI, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)))/ 60 % 24) AS 'Tiempo_en_Urg(Horas)',
     ABS(DATEDIFF(MI, HCNTRIAGE.HCTFECTRI, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)))%60) AS 'Tiempo_en_Urg(Min)',
 ABS(DATEDIFF(MINUTE, HCNTRIAGE.HCTFECTRI, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)))) AS 'Tiempo_en_Urg(Mintotal)'
FROM ADNINGRESO 
INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID 
INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID 
INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON ADNINGRESO.OID = HCNFOLIO_1.ADNINGRESO 
INNER JOIN HCNTIPHIS ON HCNFOLIO_1.HCNTIPHIS = HCNTIPHIS.OID 
INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO_1.GENESPECI = GENESPECI_1.OID 
INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID 
INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON =GENDETCON.OID  
INNER JOIN HCNINDMED ON HCNFOLIO_1.HCNINDMED = HCNINDMED.OID AND HCNFOLIO_1.OID = HCNINDMED.HCNFOLIO
WHERE (ADNINGRESO.AINURGCON = 0)  AND (HCNFOLIO_1.HCNTIPHIS in( 1,79)) AND (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1+' 23:59:00')  ORDER BY Ingreso">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>