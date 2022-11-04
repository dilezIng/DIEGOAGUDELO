<%@ Page Title="Servicios" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="FacturasySaldo.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

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
       .auto-style7 {
           height: 26px;
       }
       .auto-style8 {
           font-size: medium;
       }
       .auto-style9 {
        font-size: x-large;
    }
       .auto-style10 {
           width: 69%;
       }
       .auto-style12 {
           text-align: center;
       }
       .auto-style13 {
           width: 50%;
       }
       </style>
</head>
     <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
                </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
       <ProgressTemplate>
            
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
              </ContentTemplate>
        </asp:UpdatePanel>



             <table class="auto-style10">
                 <tr>
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="2">
                         <h1><span class="auto-style9">Resumen Facturación</span><strong>
                         <asp:Label ID="Label2" runat="server" CssClass="auto-style9"></asp:Label>
                         </strong></h1>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style7" colspan="2">Fecha Inicial:<asp:TextBox ID="TextFechaIni0" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaIni0_MaskedEditExtender" runat="server" InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni0" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaIni0_CalendarExtender" runat="server" TargetControlID="TextFechaIni0" />
                         &nbsp; Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" TargetControlID="TextFechaFin" />
                         
                         
                         &nbsp;&nbsp; <strong>
                         <asp:Label ID="Label1" runat="server" CssClass="auto-style8"></asp:Label>
                         &nbsp;<asp:Button ID="Button1" runat="server" Text="Resumen" />
                         </strong>
                         
                         
                     </td>
                 </tr>
                 <tr  >
                     <td class="auto-style7" colspan="2" > &nbsp;&nbsp;
                         &nbsp;</td>
                 </tr>

 <tr>
                     <td class="auto-style13">
                

 
    
             
                         <div class="auto-style12">
                             <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataFACTURADO" Font-Names="TAHOMA" Font-Size="Large" Width="317px">
                                 <Columns>
                                     <asp:BoundField DataField="INGRESO POR" HeaderText="INGRESO POR" ReadOnly="True" SortExpression="INGRESO POR" />
                                     <asp:BoundField DataField="FACTURADO" HeaderText="FACTURADO" ReadOnly="True" SortExpression="FACTURADO" DataFormatString="{0:N}" />
                                 </Columns>
                                 <HeaderStyle Font-Names="TAHOMA" Font-Size="large" />
                             </asp:GridView>
                         </div>
                         <span class="auto-style9"><strong>Total: $</strong> </span>
                         <asp:Label ID="Label5" runat="server" CssClass="auto-style9"></asp:Label>
                         <br />
                

 
    
             
                     </td>
      <td class="auto-style7">
                         <div class="auto-style12">
                         <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="Large" Font-Names="TAHOMA" Width="317px"    >
                  <Columns>
                      <asp:BoundField DataField="INGRESO POR" HeaderText="INGRESO POR" SortExpression="INGRESO POR" ReadOnly="True" />
                      <asp:BoundField DataField="SIN FACTURAR" HeaderText="SIN FACTURAR" SortExpression="SIN FACTURAR" ReadOnly="True" DataFormatString="{0:N}" />
                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="large" />
             </asp:GridView>
                         </div>
                         <div class="auto-style12">
                         <span class="auto-style9"><strong>Total: $</strong> </span>
                         <asp:Label ID="Label4" runat="server" CssClass="auto-style9" ></asp:Label>
                         <br />
                         </div>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <br />
                         <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataFACTURADO" Palette="Excel">
                             <Series>
                                 <asp:Series Name="Series1" ChartType="Pie" ChartArea="ChartArea1" IsVisibleInLegend="False" XValueMember="INGRESO POR" YValueMembers="FACTURADO">
                                 </asp:Series>
                             </Series>
                             <ChartAreas>
                                 <asp:ChartArea Name="ChartArea1" AlignmentOrientation="All">
                                 </asp:ChartArea>
                             </ChartAreas>
                         </asp:Chart>
                         <br />
                         <br />
                     </td>
                     <td>
                         <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1">
                             <Series>
                                 <asp:Series ChartType="Pie" Name="Series1" XValueMember="INGRESO POR" YValueMembers="SIN FACTURAR">
                                 </asp:Series>
                             </Series>
                             <ChartAreas>
                                 <asp:ChartArea Name="ChartArea1">
                                 </asp:ChartArea>
                             </ChartAreas>
                         </asp:Chart>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td colspan="2"> <strong>
                         <asp:Label ID="Label3" runat="server" CssClass="auto-style8" Text="Ing. Diego A."></asp:Label>
                         </strong>
                      
                         
                         <br />
                     </td>
                 </tr>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT CASE WHEN ADNINGRESO.AINURGCON &lt; 0 THEN 'Ninguno' WHEN ADNINGRESO.AINURGCON = 0 THEN 'Urgencias' WHEN ADNINGRESO.AINURGCON = 1 THEN 'Cons Externa' WHEN ADNINGRESO.AINURGCON = 2 THEN 'Nacido HRD' WHEN ADNINGRESO.AINURGCON = 3 THEN 'Remitido' WHEN ADNINGRESO.AINURGCON = 4 THEN 'Hosp Urg' WHEN ADNINGRESO.AINURGCON = 5 THEN 'Hospitalización' WHEN ADNINGRESO.AINURGCON &gt; 9 THEN 'Cirugia' END AS 'INGRESO POR', CAST(SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS DECIMAL(10 , 0)) AS 'SIN FACTURAR' FROM SLNSERPRO INNER JOIN ADNINGRESO ON SLNSERPRO.ADNINGRES1 = ADNINGRESO.OID INNER JOIN SLNORDSER ON SLNSERPRO.SLNORDSER1 = SLNORDSER.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID LEFT OUTER JOIN SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON SLNSERPRO.OID = SLNSERHOJ.OID LEFT OUTER JOIN SLNPROHOJ RIGHT OUTER JOIN INNMSUMPA ON SLNPROHOJ.OID = INNMSUMPA.SLNPROHOJ ON SLNSERPRO.OID = SLNPROHOJ.OID WHERE (SLNORDSER.SOSESTADO &lt; 2) AND (SLNSERPRO.SERAPLPRO = 0) AND (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1+' 23:59') AND (ADNINGRESO.AINESTADO IN (0, 3)) and 1=1 GROUP BY ADNINGRESO.AINURGCON">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataFACTURADO" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT CASE WHEN ADNINGRESO.AINURGCON < 0 THEN 'Ninguno' WHEN ADNINGRESO.AINURGCON = 0 THEN 'Urgencias' WHEN ADNINGRESO.AINURGCON = 1 THEN 'Cons Externa' WHEN ADNINGRESO.AINURGCON = 2 THEN 'Nacido HRD' WHEN ADNINGRESO.AINURGCON = 3 THEN 'Remitido' WHEN ADNINGRESO.AINURGCON = 4 THEN 'Hosp Urg' WHEN ADNINGRESO.AINURGCON = 5 THEN 'Hospitalización' WHEN ADNINGRESO.AINURGCON > 9 THEN 'Cirugia' END AS 'INGRESO POR', CAST(SUM(SLNFACTUR.SFATOTFAC) AS DECIMAL(10 , 0)) AS FACTURADO FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @p0 AND @p1 + ' 23:59') AND (SLNFACTUR.SFADOCANU = 0) AND (SFATIPDOC = 1) GROUP BY ADNINGRESO.AINURGCON">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataEntidad" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="
SELECT  
 CAST(sum( SLNSERPRO.SERVALPRO *  SLNSERPRO.SERCANTID)AS DECIMAL(10 , 0)) AS 'SIN FACTURAR'
 FROM SLNSERPRO
  INNER JOIN ADNINGRESO ON SLNSERPRO.ADNINGRES1 = ADNINGRESO.OID 
  INNER JOIN SLNORDSER ON  SLNSERPRO.SLNORDSER1 = SLNORDSER.OID
  INNER JOIN GENPACIEN ON  ADNINGRESO.GENPACIEN =GENPACIEN.OID 
INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID 
LEFT OUTER JOIN SLNSERHOJ 
RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON  SLNSERPRO.OID = SLNSERHOJ.OID
LEFT OUTER JOIN SLNPROHOJ 
RIGHT OUTER JOIN INNMSUMPA ON SLNPROHOJ.OID= INNMSUMPA.SLNPROHOJ ON  SLNSERPRO.OID = SLNPROHOJ.OID
  where 
  SLNORDSER.SOSESTADO &lt;2
 aND SLNSERPRO.SERAPLPRO=0
  and   (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 )
AND  ADNINGRESO.AINESTADO in(0,3)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataFACTOTAL" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT CAST(SUM(SLNFACTUR.SFATOTFAC)AS DECIMAL(10 , 0))
 
  FROM SLNFACTUR
  INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO=ADNINGRESO.OID
WHERE SLNFACTUR.SFAFECFAC BETWEEN @p0 AND @p1  +' 23:59'
AND SFADOCANU=0">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     &nbsp;</caption>



 
    

</asp:Content>