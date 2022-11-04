<%@ Page Title="Certificados" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Certificados.aspx.vb" Inherits="PaginaBase" %>

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
            


             <table style="width:30%;">
                 <tr>
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="2"><strong>CERTIFICADOS DE LIQUIDACION
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
                      <asp:BoundField DataField="User Ingreso" HeaderText="User Ingreso" SortExpression="User Ingreso" />
                      <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" ReadOnly="True" />
                      <asp:BoundField DataField="Tipo Ingreso" HeaderText="Tipo Ingreso" ReadOnly="True" SortExpression="Tipo Ingreso" />
                      <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                      <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" ReadOnly="True" />
                      <asp:BoundField DataField="Cama" HeaderText="Cama" ReadOnly="True" SortExpression="Cama" />
                      <asp:BoundField DataField="Indicaciòn" HeaderText="Indicaciòn" SortExpression="Indicaciòn" ReadOnly="True" />
                      <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                      <asp:BoundField DataField="Fecha Folio" HeaderText="Fecha Folio" SortExpression="Fecha Folio" />
                      <asp:BoundField DataField="Autorizaciones" HeaderText="Autorizaciones" ReadOnly="True" SortExpression="Autorizaciones" />
                      <asp:BoundField DataField="Fecha Autorizaciones" HeaderText="Fecha Autorizaciones" SortExpression="Fecha Autorizaciones" />
                      <asp:BoundField DataField="Farmacia" HeaderText="Farmacia" SortExpression="Farmacia" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Farmacia" HeaderText="Fecha Farmacia" SortExpression="Fecha Farmacia" />
                      <asp:BoundField DataField="Enfermeria" HeaderText="Enfermeria" SortExpression="Enfermeria" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Enfermeria" HeaderText="Fecha Enfermeria" SortExpression="Fecha Enfermeria" />
                      <asp:BoundField DataField="Medicina" HeaderText="Medicina" SortExpression="Medicina" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Medicina" HeaderText="Fecha Medicina" SortExpression="Fecha Medicina" />
                      <asp:BoundField DataField="Med-Enf" HeaderText="Med-Enf" SortExpression="Med-Enf" ReadOnly="True" />
                      <asp:BoundField DataField="Epicirisis" HeaderText="Epicirisis" ReadOnly="True" SortExpression="Epicirisis" />
                      <asp:BoundField DataField="Fecha Epicirisis" HeaderText="Fecha Epicirisis" ReadOnly="True" SortExpression="Fecha Epicirisis" />
                      <asp:BoundField DataField="Medico Epicirisis" HeaderText="Medico Epicirisis" SortExpression="Medico Epicirisis" ReadOnly="True" />
                      <asp:BoundField DataField="Egreso" HeaderText="Egreso" SortExpression="Egreso" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha Egreso" HeaderText="Fecha Egreso" ReadOnly="True" SortExpression="Fecha Egreso" />
                      <asp:BoundField DataField="User Egreso" HeaderText="User Egreso" ReadOnly="True" SortExpression="User Egreso" />
                      <asp:BoundField DataField="Fecha Factura" HeaderText="Fecha Factura" ReadOnly="True" SortExpression="Fecha Factura" />
                      <asp:BoundField DataField="Est Fac" HeaderText="Est Fac" ReadOnly="True" SortExpression="Est Fac" />
                      <asp:BoundField DataField="User Factura" HeaderText="User Factura" ReadOnly="True" SortExpression="User Factura" />
                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, G5.USUNOMBRE AS 'User Ingreso', CASE WHEN ADNINGRESO.AINESTADO = 0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO = 1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO = 2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO = 3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO = 4 THEN 'Cerrado' END AS Estado, CASE WHEN ADNINGRESO.AINTIPING = 1 THEN 'Ambulatorio' WHEN ADNINGRESO.AINTIPING = 2 THEN 'Hospitalario' END AS 'Tipo Ingreso', GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, CASE WHEN HCACODIGO IS NULL THEN 'Urgencias' ELSE HCACODIGO END AS Cama, CASE WHEN HCNINDMED.HCITIPIND = 5 THEN 'Salida' END AS Indicaciòn, HCNFOLIO.HCNUMFOL AS Folio, HCNFOLIO.HCFECFOL AS 'Fecha Folio', (SELECT '(' + G5.USUNOMBRE + ') ' + G5.USUDESCRI AS Expr1 FROM GENUSUARIO WHERE (ADNINGRESO.OID = SLNCERLIQ.GENUSUARIO1)) AS 'Autorizaciones', SLNCERLIQ.SCLFECAUT AS 'Fecha Autorizaciones', (SELECT '(' + USUNOMBRE + ') ' + USUDESCRI AS Expr1 FROM GENUSUARIO AS G3 WHERE (OID = SLNCERLIQ.GENUSUARIO3)) AS 'Farmacia', SLNCERLIQ.SCLFECFAR AS 'Fecha Farmacia', (SELECT '(' + USUNOMBRE + ') ' + USUDESCRI AS Expr1 FROM GENUSUARIO AS G2 WHERE (OID = SLNCERLIQ.GENUSUARIO2)) AS 'Enfermeria', SLNCERLIQ.SCLFECENF AS 'Fecha Enfermeria', (SELECT '(' + USUNOMBRE + ') ' + USUDESCRI AS Expr1 FROM GENUSUARIO AS G4 WHERE (OID = SLNCERLIQ.GENUSUARIO4)) AS 'Medicina', SLNCERLIQ.SCLFModelos_CitasMedicas_eCMED_8047729A AS 'Fecha Medicina', ABS(DATEDIFF(MI, SLNCERLIQ.SCLFECENF, SLNCERLIQ.SCLFModelos_CitasMedicas_eCMED_8047729A)) AS 'Med-Enf', (SELECT HCECONSEC FROM HCNEPICRI WHERE (ADNINGRESO = ADNINGRESO.OID)) AS Epicirisis, (SELECT HCEFECDOC FROM HCNEPICRI AS HCNEPICRI_2 WHERE (ADNINGRESO = ADNINGRESO.OID)) AS 'Fecha Epicirisis', (SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT GENMEDICO FROM HCNEPICRI AS HCNEPICRI_1 WHERE (ADNINGRESO = ADNINGRESO.OID)))) AS 'Medico Epicirisis', (SELECT ADENUMEGR FROM ADNEGRESO WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Egreso, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)) AS 'Fecha Egreso', (SELECT USUNOMBRE FROM GENUSUARIO AS GENUSUARIO_1 WHERE (OID = (SELECT GEENUSUARIO FROM ADNEGRESO AS ADNEGRESO_1 WHERE (ADNINGRESO.ADNEGRESO = OID)))) AS 'User Egreso', (SELECT TOP (1) SFAFECFAC FROM SLNFACTUR WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS 'Fecha Factura', (SELECT TOP (1) CASE WHEN SFADOCANU = 0 THEN 'Ok' ELSE 'Anulada' END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS 'Est Fac', (SELECT TOP (1) CASE WHEN SLNFACTUR_1.SFADOCANU = 0 THEN 'Genero ' + (SELECT GENUSUARIO.USUNOMBRE FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO1) ELSE 'Anulo ' + (SELECT GENUSUARIO.USUDESCRI FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO2) END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS 'User Factura' FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN GENUSUARIO AS G5 ON ADNINGRESO.GEENUSUARIO = G5.OID LEFT OUTER JOIN SLNCERLIQ ON ADNINGRESO.OID = SLNCERLIQ.ADNINGRESO LEFT OUTER JOIN HPNDEFCAM ON HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID LEFT OUTER JOIN HCNINDMED ON HCNFOLIO.OID = HCNINDMED.HCNFOLIO WHERE (HCNFOLIO.HCFECFOL BETWEEN @p0 AND @p1 + ' 23:59:59') AND (ADNINGRESO.AINURGCON NOT IN (1)) AND (ADNINGRESO.AINESTADO IN (0, 1, 3)) AND (ADNINGRESO.AINTIPING = 2) AND ((SELECT TOP (1) HCNFOLIO_2.OID FROM HCNFOLIO AS HCNFOLIO_2 LEFT OUTER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO WHERE (HCNFOLIO_2.ADNINGRESO = ADNINGRESO.OID) AND (HCNINDMED_2.HCITIPIND = 5) ORDER BY HCNFOLIO_2.OID DESC) = HCNFOLIO.OID) ORDER BY RIGHT (HPNDEFCAM.HCACODIGO, 2), cama, Ingreso DESC">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>