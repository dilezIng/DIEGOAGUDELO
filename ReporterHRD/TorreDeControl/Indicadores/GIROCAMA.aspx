<%@ Page Title="GIRO CAMA" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="GIROCAMA.aspx.vb" Inherits="PaginaBase" %>

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
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="6"><strong>GIRO CAMA<asp:Label ID="LabelFechaFin" runat="server" Visible="false"></asp:Label>
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
				  <asp:BoundField DataField="CAMA" HeaderText="CAMA" SortExpression="CAMA" />
<asp:BoundField DataField="UTILIZADA" HeaderText="UTILIZADA" SortExpression="UTILIZADA" />
<asp:BoundField DataField="Libre" HeaderText="Libre" SortExpression="Libre" />

<asp:BoundField DataField="TOTAL_PERIODO" HeaderText="TOTAL_PERIODO" SortExpression="TOTAL_PERIODO" />

                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="  SELECT  HPNDEFCAM.HCACODIGO AS CAMA,SUM(DATEDIFF(MI, HPNESTANC.HESFECING, HPNESTANC.HESFECSAL)) AS UTILIZADA,
 (DATEDIFF(mi, @p0,@p1+ ' 23:59:00'))-SUM(DATEDIFF(mi, HPNESTANC.HESFECING, HPNESTANC.HESFECSAL)) AS Libre ,(DATEDIFF(mi, @p0,@p1+ ' 23:59:00')) AS TOTAL_PERIODO
FROM  HPNESTANC INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM=HPNDEFCAM.OID
INNER JOIN HPNSUBGRU ON HPNDEFCAM.HPNSUBGRU=HPNSUBGRU.OID
 where     (HPNESTANC.HESFECING BETWEEN @p0 AND @p1+ ' 23:59:00') and  (HPNESTANC.HESFECSAL < @p1+ ' 23:59:00')
 group by HPNDEFCAM.HCACODIGO,HPNSUBGRU.HSUNOMBRE
 order by HPNSUBGRU.HSUNOMBRE  ">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </caption>



 
    
              </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>