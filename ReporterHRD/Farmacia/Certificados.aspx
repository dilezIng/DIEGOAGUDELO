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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>




             <table style="width:30%;">
                 <tr>
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="6"><strong>CERTIFICADOS DE LIQUIDACION</strong></td>
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
                     <td class="auto-style6"></td>
                 </tr>
                 <tr  >
                     <td class="auto-style11" >Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" TargetControlID="TextFechaFin" />
                     </td>
                     <td class="auto-style10">
                <asp:Label ID="LabelFechaFin" runat="server" Visible="false"></asp:Label>
                     </td>
                     <td class="auto-style7"></td>
                     <td class="auto-style7"></td>
                     <td class="auto-style7"></td>
                     <td class="auto-style7">
                         <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" />
                     </td>
                 </tr>



 
    
              <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="X-Small">
                  <Columns>
                      <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                      <asp:BoundField DataField="Fecha Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha Ingreso" />
                      <asp:BoundField DataField="User Ing" HeaderText="User Ing" SortExpression="User Ing" />
                      <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                      <asp:BoundField DataField="IngresoPor" HeaderText="IngresoPor" ReadOnly="True" SortExpression="IngresoPor" />
                      <asp:BoundField DataField="Tipo_Ingreso" HeaderText="Tipo_Ingreso" SortExpression="Tipo_Ingreso" ReadOnly="True" />
                      <asp:BoundField DataField="User Auto" HeaderText="User Auto" ReadOnly="True" SortExpression="User Auto" />
                      <asp:BoundField DataField="Fecha Autorizaciones" HeaderText="Fecha Autorizaciones" SortExpression="Fecha Autorizaciones" />
                      <asp:BoundField DataField="User Enf" HeaderText="User Enf" ReadOnly="True" SortExpression="User Enf" />
                      <asp:BoundField DataField="Fecha Enfermeria" HeaderText="Fecha Enfermeria" SortExpression="Fecha Enfermeria" />
                      <asp:BoundField DataField="User Farm" HeaderText="User Farm" ReadOnly="True" SortExpression="User Farm" />
                      <asp:BoundField DataField="Fecha Farmacia" HeaderText="Fecha Farmacia" SortExpression="Fecha Farmacia" />
                      <asp:BoundField DataField="User Med" HeaderText="User Med" ReadOnly="True" SortExpression="User Med" />
                      <asp:BoundField DataField="Fecha Medicina" HeaderText="Fecha Medicina" SortExpression="Fecha Medicina" />
                      <asp:BoundField DataField="Epicirisis" HeaderText="Epicirisis" ReadOnly="True" SortExpression="Epicirisis" />
                      <asp:BoundField DataField="Medico Epicirisis" HeaderText="Medico Epicirisis" SortExpression="Medico Epicirisis" ReadOnly="True" />
                      <asp:BoundField DataField="Fecha_Epicirisis" HeaderText="Fecha_Epicirisis" ReadOnly="True" SortExpression="Fecha_Epicirisis" />
                      <asp:BoundField DataField="Egreso" HeaderText="Egreso" SortExpression="Egreso" ReadOnly="True" />
                      <asp:BoundField DataField="User Egreso" HeaderText="User Egreso" ReadOnly="True" SortExpression="User Egreso" />
                      <asp:BoundField DataField="Fecha_Egreso" HeaderText="Fecha_Egreso" ReadOnly="True" SortExpression="Fecha_Egreso" />
                      <asp:BoundField DataField="Factura" HeaderText="Factura" ReadOnly="True" SortExpression="Factura" />
                      <asp:BoundField DataField="User Factura" HeaderText="User Factura" ReadOnly="True" SortExpression="User Factura" />
                      <asp:BoundField DataField="Fecha Factura" HeaderText="Fecha Factura" ReadOnly="True" SortExpression="Fecha Factura" />
                      <asp:BoundField DataField="Estado1" HeaderText="Estado1" SortExpression="Estado1" ReadOnly="True" />
                      <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, ADNINGRESO.AINFECING AS 'Fecha Ingreso', G5.USUNOMBRE AS 'User Ing', CASE WHEN ADNINGRESO.AINESTADO = 0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO = 1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO = 2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO = 3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO = 4 THEN 'Cerrado' END AS Estado, CASE WHEN ADNINGRESO.AINURGCON &lt; 0 THEN 'Ninguno' WHEN ADNINGRESO.AINURGCON = 0 THEN 'Urgencias' WHEN ADNINGRESO.AINURGCON = 1 THEN 'Cons Externa' WHEN ADNINGRESO.AINURGCON = 2 THEN 'Nacido HRD' WHEN ADNINGRESO.AINURGCON = 3 THEN 'Remitido' WHEN ADNINGRESO.AINURGCON = 4 THEN 'Hosp Urg' WHEN ADNINGRESO.AINURGCON = 5 THEN 'Hospitalización' WHEN ADNINGRESO.AINURGCON &gt; 9 THEN 'Cirugia' END AS IngresoPor, CASE WHEN ADNINGRESO.AINTIPING = 1 THEN 'Ambulatorio' WHEN ADNINGRESO.AINTIPING = 2 THEN 'Hospitalario' END AS Tipo_Ingreso, (SELECT USUNOMBRE FROM GENUSUARIO WHERE (OID = SLNCERLIQ.GENUSUARIO1)) AS 'User Auto', SLNCERLIQ.SCLFECAUT AS 'Fecha Autorizaciones', (SELECT USUNOMBRE FROM GENUSUARIO AS G2 WHERE (OID = SLNCERLIQ.GENUSUARIO2)) AS 'User Enf', SLNCERLIQ.SCLFECENF AS 'Fecha Enfermeria', (SELECT USUNOMBRE FROM GENUSUARIO AS G3 WHERE (OID = SLNCERLIQ.GENUSUARIO3)) AS 'User Farm', SLNCERLIQ.SCLFECFAR AS 'Fecha Farmacia', (SELECT USUNOMBRE FROM GENUSUARIO AS G4 WHERE (OID = SLNCERLIQ.GENUSUARIO4)) AS 'User Med', SLNCERLIQ.SCLFModelos_CitasMedicas_eCMED_8047729A AS 'Fecha Medicina', (SELECT HCECONSEC FROM HCNEPICRI WHERE (ADNINGRESO = ADNINGRESO.OID)) AS Epicirisis, (SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT GENMEDICO FROM HCNEPICRI AS HCNEPICRI_1 WHERE (ADNINGRESO = ADNINGRESO.OID)))) AS 'Medico Epicirisis', (SELECT HCEFECDOC FROM HCNEPICRI AS HCNEPICRI_2 WHERE (ADNINGRESO = ADNINGRESO.OID)) AS Fecha_Epicirisis, (SELECT ADENUMEGR FROM ADNEGRESO WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Egreso, (SELECT USUNOMBRE FROM GENUSUARIO AS GENUSUARIO_1 WHERE (OID = (SELECT GEENUSUARIO FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)))) AS 'User Egreso', (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_3 WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Fecha_Egreso, (SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS Factura, (SELECT TOP (1) CASE WHEN SLNFACTUR_1.SFADOCANU = 0 THEN 'Genero ' + (SELECT GENUSUARIO.USUNOMBRE FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO1) ELSE 'Anulo ' + (SELECT GENUSUARIO.USUNOMBRE FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO2) END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS 'User Factura', (SELECT TOP (1) SFAFECFAC FROM SLNFACTUR AS SLNFACTUR_3 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS 'Fecha Factura', (SELECT TOP (1) CASE WHEN SLNFACTUR_2.SFADOCANU = 0 THEN 'Ok' ELSE 'Anulada' END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS 'Estado', ADNINGRESO.AINOBSERV AS Observaciones FROM SLNCERLIQ INNER JOIN ADNINGRESO ON SLNCERLIQ.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENUSUARIO AS G5 ON ADNINGRESO.GEENUSUARIO = G5.OID WHERE ((SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_1 WHERE (ADNINGRESO.ADNEGRESO = OID)) BETWEEN @p0 AND @p1 + ' 23:59:59')">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>