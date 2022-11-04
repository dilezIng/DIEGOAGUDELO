<%@ Page Title="38925 SALA DE OBSERVACION II NIVEL" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="38925.aspx.vb" Inherits="PaginaBase" %>

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
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="6"><strong>38925 SALA DE OBSERVACION II NIVEL
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



 
    
              <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="X-Small">
                  <Columns>
                      <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
<asp:BoundField DataField="Fecha solicitud" HeaderText="Fecha solicitud" SortExpression="Fecha solicitud" />
<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
<asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
<asp:BoundField DataField="ValorUnitario" HeaderText="ValorUnitario" SortExpression="ValorUnitario" />
<asp:BoundField DataField="Candtidad" HeaderText="Candtidad" SortExpression="Candtidad" />
<asp:BoundField DataField="ValorTotServicio" HeaderText="ValorTotServicio" SortExpression="ValorTotServicio" />
<asp:BoundField DataField="Valor Entidad" HeaderText="Valor Entidad" SortExpression="Valor Entidad" />
<asp:BoundField DataField="Valor Paciente" HeaderText="Valor Paciente" SortExpression="Valor Paciente" />
<asp:BoundField DataField="Procedimiento" HeaderText="Procedimiento" SortExpression="Procedimiento" />
<asp:BoundField DataField="DocPaciente" HeaderText="DocPaciente" SortExpression="DocPaciente" />
<asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" />
<asp:BoundField DataField="Reg" HeaderText="Reg" SortExpression="Reg" />
<asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
<asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
<asp:BoundField DataField="FACTURA" HeaderText="FACTURA" SortExpression="FACTURA" />
<asp:BoundField DataField="VALOR" HeaderText="VALOR" SortExpression="VALOR" />
<asp:BoundField DataField="Fecha_FACTURA" HeaderText="Fecha_FACTURA" SortExpression="Fecha_FACTURA" />
<asp:BoundField DataField="ESTADO_Factura" HeaderText="ESTADO_Factura" SortExpression="ESTADO_Factura" />
                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, SLNORDSER.SOSFECORD AS 'Fecha solicitud', GENSERIPS.SIPCODIGO AS Codigo, RTRIM(GENSERIPS.SIPNOMBRE) AS Nombre,  CONVERT(decimal(11, 0),  SLNSERPRO.SERVALPRO)  AS ValorUnitario,  CAST(SLNSERPRO.SERCANTID AS DECIMAL(10 , 0))AS Candtidad, CONVERT(decimal(11, 0), SLNSERPRO.SERVALENT *  SLNSERPRO.SERCANTID) AS ValorTotServicio, CAST(SLNSERPRO.SERVALENT AS DECIMAL(10 , 0)) as 'Valor Entidad', CAST(SLNSERPRO.SERVALPAC AS DECIMAL(10 , 0)) as 'Valor Paciente', case when SLNSERPRO.SERAPLPRO=1 then 'Si' else 'No' end as 'Procedimiento', GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, SUBSTRING ( GENDETCON.GDECODIGO ,1 , 3 ) as Reg, GENDETCON.GDECODIGO AS Regimen, GENDETCON.GDENOMBRE AS Entidad, (SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY SLNFACTUR.OID DESC) AS FACTURA, CAST((SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS Expr1 FROM SLNSERPRO INNER JOIN ADNINGRESO AS INGRESO ON SLNSERPRO.ADNINGRES1 = INGRESO.OID INNER JOIN SLNORDSER ON SLNSERPRO.SLNORDSER1 = SLNORDSER.OID INNER JOIN GENPACIEN ON INGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON INGRESO.GENDETCON = GENDETCON.OID LEFT OUTER JOIN SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON SLNSERPRO.OID = SLNSERHOJ.OID LEFT OUTER JOIN SLNPROHOJ RIGHT OUTER JOIN INNMSUMPA ON SLNPROHOJ.OID = INNMSUMPA.SLNPROHOJ ON SLNSERPRO.OID = SLNPROHOJ.OID LEFT OUTER JOIN INNPRODUC ON INNMSUMPA.INNPRODUC = INNPRODUC.OID WHERE (INGRESO.OID = ADNINGRESO.OID) AND (SLNORDSER.SOSESTADO < 2) AND (SLNSERPRO.SERAPLPRO = 0)) AS DECIMAL(10 , 0)) AS VALOR, (SELECT TOP (1) SFAFECFAC FROM SLNFACTUR AS SLNFACTUR_3 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS Fecha_FACTURA,  (SELECT TOP (1) CASE WHEN SLNFACTUR_2.SFADOCANU = 0 THEN 'Ok' ELSE 'Anulada' END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS ESTADO_Factura FROM  SLNORDSER RIGHT OUTER join SLNSERPRO ON SLNORDSER.OID = SLNSERPRO.SLNORDSER1 RIGHT OUTER JOIN SLNSERHOJ ON  SLNSERPRO.OID = SLNSERHOJ.OID RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID  INNER JOIN ADNINGRESO ON SLNSERPRO.ADNINGRES1=ADNINGRESO.OID INNER JOIN GENPACIEN ON  ADNINGRESO.GENPACIEN =GENPACIEN.OID INNER JOIN GENDETCON ON SLNSERPRO.GENDETCON1 = GENDETCON.OID  WHERE (SLNSERPRO.SERFECSER BETWEEN @p0 AND @p1 + ' 23:59:59') and GENSERIPS.SIPCODIGO='38925' and ADNINGRESO.ADNCENATE=1 ">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>