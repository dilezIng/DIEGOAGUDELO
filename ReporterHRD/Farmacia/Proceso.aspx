<%@ Page Title="TRAZA INGRESO" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Proceso.aspx.vb" Inherits="PaginaBase" %>

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
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="6"><strong>PROCESO DESDE EL INGRESO HASTA LA FACTURACION</strong></td>
                 </tr>
                 <tr>
                     <td class="auto-style11">Fecha Inicial:</td>
                     <td class="auto-style8">
                        <asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear" InputDirection="RightToLeft">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
                     </td>
                     <td class="auto-style6"></td>
                     <td class="auto-style6"></td>
                     <td class="auto-style6"></td>
                     <td class="auto-style6"></td>
                 </tr>
                 <tr  >
                     <td class="auto-style11" >Fecha Final:</td>
                     <td class="auto-style10">
                       <asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
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
                      <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha_Ingreso" SortExpression="Fecha_Ingreso" />
                      <asp:BoundField DataField="Usuario_Egreso" HeaderText="Usuario_Ingreso" SortExpression="Usuario_Egreso" />
                      <asp:BoundField DataField="Ingreso_Por" HeaderText="Ingreso_Por" ReadOnly="True" SortExpression="Ingreso_Por" />
                      <asp:BoundField DataField="Clase_Ingreso" HeaderText="Clase_Ingreso" ReadOnly="True" SortExpression="Clase_Ingreso" />
                      <asp:BoundField DataField="Fech_Hospitalización" HeaderText="Fech_Hospitalización" SortExpression="Fech_Hospitalización" />
                      <asp:BoundField DataField="Epicirisis" HeaderText="Epicirisis" ReadOnly="True" SortExpression="Epicirisis" />
                      <asp:BoundField DataField="Fecha_Epicirisis" HeaderText="Fecha_Epicirisis" ReadOnly="True" SortExpression="Fecha_Epicirisis" />
                      <asp:BoundField DataField="MED_Epicirisis" HeaderText="MED_Epicirisis" ReadOnly="True" SortExpression="MED_Epicirisis" />
                      <asp:BoundField DataField="Egreso" HeaderText="Egreso" ReadOnly="True" SortExpression="Egreso" />
                      <asp:BoundField DataField="Fecha_Egreso" HeaderText="Fecha_Egreso" ReadOnly="True" SortExpression="Fecha_Egreso" />
                      <asp:BoundField DataField="Usuario_Egreso1" HeaderText="Usuario_Egreso1" ReadOnly="True" SortExpression="Usuario_Egreso1" />
                      <asp:BoundField DataField="FACTURA" HeaderText="FACTURA" ReadOnly="True" SortExpression="FACTURA" />
                      <asp:BoundField DataField="Fecha_FACTURA" HeaderText="Fecha_FACTURA" ReadOnly="True" SortExpression="Fecha_FACTURA" />
                      <asp:BoundField DataField="ESTADO_FACTURA" HeaderText="ESTADO_FACTURA" ReadOnly="True" SortExpression="ESTADO_FACTURA" />
                      <asp:BoundField DataField="Obseravaciones" HeaderText="Obseravaciones" SortExpression="Obseravaciones" />
                      <asp:BoundField DataField="USARIO_FACTURA" HeaderText="USARIO_FACTURA" ReadOnly="True" SortExpression="USARIO_FACTURA" />
                      <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                      <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                      <asp:BoundField DataField="Entidad" HeaderText="Entidad" ReadOnly="True" SortExpression="Entidad" />
                  </Columns>
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, ADNINGRESO.AINFECING AS Fecha_Ingreso, GENUSUARIO_1.USUDESCRI AS Usuario_Egreso, CASE WHEN ADNINGRESO.AINURGCON &lt; 0 THEN 'Ninguno' WHEN ADNINGRESO.AINURGCON = 0 THEN 'Urgencias' WHEN ADNINGRESO.AINURGCON = 1 THEN 'Cons Externa' WHEN ADNINGRESO.AINURGCON = 2 THEN 'Nacido HRD' WHEN ADNINGRESO.AINURGCON = 3 THEN 'Remitido' WHEN ADNINGRESO.AINURGCON = 4 THEN 'Hosp Urg' WHEN ADNINGRESO.AINURGCON = 5 THEN 'Hospitalización' WHEN ADNINGRESO.AINURGCON &gt; 9 THEN 'Cirugia' END AS Ingreso_Por, CASE WHEN ADNINGRESO.AINTIPING = 1 THEN 'Ambulatorio' WHEN ADNINGRESO.AINTIPING = 2 THEN 'Hospitalario' END AS Clase_Ingreso, ADNINGRESO.AINFECHOS AS Fech_Hospitalización, (SELECT HCECONSEC FROM HCNEPICRI WHERE (ADNINGRESO = ADNINGRESO.OID)) AS Epicirisis, (SELECT HCEFECDOC FROM HCNEPICRI AS HCNEPICRI_2 WHERE (ADNINGRESO = ADNINGRESO.OID)) AS Fecha_Epicirisis, (SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT GENMEDICO FROM HCNEPICRI AS HCNEPICRI_1 WHERE (ADNINGRESO = ADNINGRESO.OID)))) AS MED_Epicirisis, (SELECT ADENUMEGR FROM ADNEGRESO WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Egreso, (SELECT ADEFECSAL FROM ADNEGRESO AS ADNEGRESO_2 WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Fecha_Egreso, (SELECT USUDESCRI FROM GENUSUARIO WHERE (OID = (SELECT GEENUSUARIO FROM ADNEGRESO AS ADNEGRESO_1 WHERE (ADNINGRESO.ADNEGRESO = OID)))) AS Usuario_Egreso, (SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS FACTURA, (SELECT TOP (1) SFAFECFAC FROM SLNFACTUR AS SLNFACTUR_3 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS Fecha_FACTURA, (SELECT TOP (1) CASE WHEN SLNFACTUR_2.SFADOCANU = 0 THEN 'Ok' ELSE 'Anulada' END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS ESTADO_FACTURA, ADNINGRESO.AINOBSERV AS Obseravaciones, (SELECT TOP (1) CASE WHEN SLNFACTUR_1.SFADOCANU = 0 THEN 'Genero ' + (SELECT GENUSUARIO.USUDESCRI FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO1) ELSE 'Anulo ' + (SELECT GENUSUARIO.USUDESCRI FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO2) END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS USARIO_FACTURA, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' AS Entidad FROM GENPACIEN INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENESPECI ON HCNFOLIO.GENESPECI = GENESPECI.OID INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICO = GENMEDICO_1.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON ADNINGRESO.GEENUSUARIO = GENUSUARIO_1.OID WHERE (ADNINGRESO.AINFECING BETWEEN @f1 AND @f2 + ' 23:59:59') ORDER BY Ingreso_Por DESC">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni" Name="f1" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="f2" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>