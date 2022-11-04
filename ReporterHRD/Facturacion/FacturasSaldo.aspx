<%@ Page Title="Servicios" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="FacturasSaldo.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
       .auto-style6 {
           margin-bottom: 11px;
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
            
              </ContentTemplate>
        </asp:UpdatePanel>



             <table style="width:30%;">
                 <tr>
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="2"><strong>Facturas Saldo
                         <asp:Label ID="Label2" runat="server" CssClass="auto-style9"></asp:Label>
                         </strong></td>
                 </tr>
                 <tr>
                     <td class="auto-style7">Fecha Inicial:<asp:TextBox ID="TextFechaIni0" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaIni0_MaskedEditExtender" runat="server" InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni0" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaIni0_CalendarExtender" runat="server" TargetControlID="TextFechaIni0" />
                         &nbsp; Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                         <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                         <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" TargetControlID="TextFechaFin" />
                         
                         
                         &nbsp;&nbsp; <strong>
                         <asp:Label ID="Label1" runat="server" CssClass="auto-style8"></asp:Label>
                         </strong>
                         
                         
                     </td>
                     <td class="auto-style6"></td>
                 </tr>
                 <tr  >
                     <td class="auto-style7" > Entidad:
                         <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataEntidad" DataTextField="GDENOMBRE" DataValueField="GDENOMBRE" >
                             <asp:ListItem> </asp:ListItem>
                         </asp:DropDownList>
                         &nbsp;
                         <asp:Button ID="BtnConsulta" runat="server" Text="Entidad" />
                         &nbsp;<asp:Button ID="Button1" runat="server" Text="Todas" />
                         <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
                     </td>
                     <td class="auto-style7">
                         &nbsp;</td>
                 </tr>



 
    
              <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="X-Small"  >
                  <Columns>
                      <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                      <asp:BoundField DataField="Nit" HeaderText="Nit" SortExpression="Nit" />
                      <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                      <asp:BoundField DataField="NumFactura" HeaderText="NumFactura" SortExpression="NumFactura" />
                      <asp:BoundField DataField="Radicacion" HeaderText="Radicacion" SortExpression="Radicacion" />
                      <asp:BoundField DataField="Fecha_Factura" HeaderText="Fecha_Factura" SortExpression="Fecha_Factura" />
                      <asp:BoundField DataField="Total_Factura" HeaderText="Total_Factura" SortExpression="Total_Factura" />
                      <asp:BoundField DataField="Abonado" HeaderText="Abonado" SortExpression="Abonado" ReadOnly="True" />
                      <asp:BoundField DataField="Saldo" HeaderText="Saldo" SortExpression="Saldo" />
                  </Columns>
                  <HeaderStyle Font-Names="TAHOMA" Font-Size="Small" />
             </asp:GridView>
                 <tr>
                     <td> <strong>
                         <asp:Label ID="Label3" runat="server" CssClass="auto-style8" Text="Ing. Diego A."></asp:Label>
                         </strong>
                      
                         
                         <br />
                     </td>
                 </tr>
                 <caption>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT GENDETCON.GDECODIGO AS Regimen, GENTERCER.TERNUMDOC AS Nit, GENDETCON.GDENOMBRE AS Entidad, SLNFACTUR.SFANUMFAC AS NumFactura, CRNDOCUME.CDCONSEC AS Radicacion, SLNFACTUR.SFAFECFAC AS Fecha_Factura, SLNFACTUR.SFATOTFAC AS Total_Factura, SLNFACTUR.SFATOTFAC - CRNCXC.CRNSALDO AS Abonado, CRNCXC.CRNSALDO AS Saldo FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN CRNCXC ON SLNFACTUR.OID = CRNCXC.SLNFACTUR INNER JOIN GENDETCON ON CRNCXC.GENDETCON = GENDETCON.OID INNER JOIN GENTERCER ON CRNCXC.GENTERCER = GENTERCER.OID INNER JOIN CRNRADFACD ON CRNCXC.CRNRADFACD = CRNRADFACD.OID INNER JOIN CRNRADFACC ON CRNRADFACC.OID = CRNRADFACD.CRNRADFACC INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID WHERE (GENDETCON.GDENOMBRE LIKE @Entidad) AND (SLNFACTUR.SFAFECFAC BETWEEN @res AND @res2) ORDER BY Regimen, Radicacion, Fecha_Factura">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="Label1" Name="Entidad" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="res" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="res2" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataEntidad" runat="server" ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" SelectCommand="SELECT  [GDENOMBRE] FROM [GENDETCON] ORDER BY [GDENOMBRE]"></asp:SqlDataSource>
                     &nbsp;</caption>



 
    

</asp:Content>