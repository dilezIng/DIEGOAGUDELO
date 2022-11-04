<%@ Page Title="Servicios" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Servicios.aspx.vb" Inherits="PaginaBase" %>

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
                     <td bgcolor="#7EC5FD"  class="auto-style1" colspan="2"><strong>Servicios Realizados
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
                      <asp:BoundField DataField="Reg" HeaderText="Reg" SortExpression="Reg" ReadOnly="True" />
                      <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                      <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                      <asp:BoundField DataField="CodAreaSol" HeaderText="CodAreaSol" ReadOnly="True" SortExpression="CodAreaSol" />
                      <asp:BoundField DataField="Area Solicita" HeaderText="Area Solicita" SortExpression="Area Solicita" ReadOnly="True" />
                      <asp:BoundField DataField="Cod Examen" HeaderText="Cod Examen" SortExpression="Cod Examen" />
                      <asp:BoundField DataField="Nom Examen" HeaderText="Nom Examen" SortExpression="Nom Examen" ReadOnly="True" />
                      <asp:BoundField DataField="Procedimiento" HeaderText="Procedimiento" SortExpression="Procedimiento" ReadOnly="True" />
                      <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" SortExpression="Cantidad" />
                      <asp:BoundField DataField="Val Unitario" HeaderText="Val Unitario" SortExpression="Val Unitario" ReadOnly="True" />
                      <asp:BoundField DataField="Val Total" HeaderText="Val Total" SortExpression="Val Total" ReadOnly="True" />
                      <asp:BoundField DataField="Val Entidad" HeaderText="Val Entidad" SortExpression="Val Entidad" ReadOnly="True" />
                      <asp:BoundField DataField="Val Paciente" HeaderText="Val Paciente" ReadOnly="True" SortExpression="Val Paciente" />
                      <asp:BoundField DataField="Fecha solicitud" HeaderText="Fecha solicitud" SortExpression="Fecha solicitud" />
                      <asp:BoundField DataField="Solicita" HeaderText="Solicita" ReadOnly="True" SortExpression="Solicita" />
                      <asp:BoundField DataField="Especialidad_Solicita" HeaderText="Especialidad_Solicita" SortExpression="Especialidad_Solicita" ReadOnly="True" />
                      <asp:BoundField DataField="Confirma" HeaderText="Confirma" ReadOnly="True" SortExpression="Confirma" />
                      <asp:BoundField DataField="Fecha Respuesta" HeaderText="Fecha Respuesta" SortExpression="Fecha Respuesta" />
                      <asp:BoundField DataField="CodigoCentro" HeaderText="CodigoCentro" SortExpression="CodigoCentro" />
                      <asp:BoundField DataField="Centro" HeaderText="Centro" SortExpression="Centro" />
                      <asp:BoundField DataField="DocPaciente" HeaderText="DocPaciente" SortExpression="DocPaciente" />
                      <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                      <asp:BoundField DataField="TipoIngreso" HeaderText="TipoIngreso" ReadOnly="True" SortExpression="TipoIngreso" />
                      <asp:BoundField DataField="IngresoPor" HeaderText="IngresoPor" ReadOnly="True" SortExpression="IngresoPor" />
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
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT SUBSTRING(GENDETCON.GDECODIGO, 1, 3) AS 'Reg', GENDETCON.GDECODIGO AS Codigo, GENDETCON.GDENOMBRE AS Entidad, (SELECT CASE WHEN (SELECT G.GASCODIGO FROM GENARESER AS g WHERE G.OID = (SELECT TOP 1 HCNFOLIO.GENARESER FROM HCNFOLIO INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID = HCNFOLORDSRV.HCNFOLIO WHERE HCNFOLORDSRV.SLNORDSER = SLNORDSER.OID ORDER BY HCNFOLORDSRV.HCNFOLIO DESC)) IS NULL THEN (SELECT G.GASCODIGO FROM GENARESER AS g WHERE G.OID = SLNORDSER.GENARESER1) ELSE (SELECT G.GASCODIGO FROM GENARESER AS g WHERE G.OID = (SELECT TOP 1 HCNFOLIO.GENARESER FROM HCNFOLIO INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID = HCNFOLORDSRV.HCNFOLIO WHERE HCNFOLORDSRV.SLNORDSER = SLNORDSER.OID ORDER BY HCNFOLORDSRV.HCNFOLIO DESC)) END AS Expr1) AS 'CodAreaSol', (SELECT CASE WHEN (SELECT G.GASCODIGO FROM GENARESER AS g WHERE G.OID = (SELECT TOP 1 HCNFOLIO.GENARESER FROM HCNFOLIO INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID = HCNFOLORDSRV.HCNFOLIO WHERE HCNFOLORDSRV.SLNORDSER = SLNORDSER.OID ORDER BY HCNFOLORDSRV.HCNFOLIO DESC)) IS NULL THEN (SELECT G.GASNOMBRE FROM GENARESER AS g WHERE G.OID = SLNORDSER.GENARESER1) ELSE (SELECT G.GASNOMBRE FROM GENARESER AS g WHERE G.OID = (SELECT TOP 1 HCNFOLIO.GENARESER FROM HCNFOLIO INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID = HCNFOLORDSRV.HCNFOLIO WHERE HCNFOLORDSRV.SLNORDSER = SLNORDSER.OID ORDER BY HCNFOLORDSRV.HCNFOLIO DESC)) END AS Expr1) AS 'Area Solicita', GENSERIPS.SIPCODIGO AS 'Cod Examen', RTRIM(GENSERIPS.SIPNOMBRE) AS 'Nom Examen', CASE WHEN SLNSERPRO.SERAPLPRO = 1 THEN 'Si' ELSE 'No' END AS 'Procedimiento', CAST(SLNSERPRO.SERCANTID AS DECIMAL(10 , 0)) AS Cantidad, CONVERT (decimal(11 , 0), SLNSERPRO.SERVALPRO) AS 'Val Unitario', CONVERT (decimal(11 , 0), SLNSERPRO.SERVALENT * SLNSERPRO.SERCANTID) AS 'Val Total', CAST(SLNSERPRO.SERVALENT AS DECIMAL(10 , 0)) AS 'Val Entidad', CAST(SLNSERPRO.SERVALPAC AS DECIMAL(10 , 0)) AS 'Val Paciente', SLNORDSER.SOSFECORD AS 'Fecha solicitud', (SELECT DISTINCT GMENOMCOM FROM GENMEDICO WHERE (OID = SLNSERPRO.GENMEDICO1)) AS Solicita, (SELECT DISTINCT GENESPECI.GEEDESCRI FROM GENMEDICO AS GENMEDICO_1 INNER JOIN GENESPMED ON GENMEDICO_1.OID = GENESPMED.MEDICOS INNER JOIN GENESPECI ON GENESPMED.ESPECIALIDADES = GENESPECI.OID WHERE (GENMEDICO_1.OID = SLNSERPRO.GENMEDICO1) AND (GENESPMED.GEMPRINCIPAL = 1)) AS Especialidad_Solicita, (SELECT USUDESCRI FROM GENUSUARIO WHERE (OID = SLNORDSER.GENUSUARIO1)) AS Confirma, SLNORDSER.SOSFECCON AS 'Fecha Respuesta', GENARESER.GASCODIGO AS CodigoCentro, GENARESER.GASNOMBRE AS Centro, GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, CASE WHEN AINTIPING = 1 THEN 'Ambulatorio' ELSE 'Hospitalario' END AS TipoIngreso, CASE WHEN AINURGCON = 0 THEN 'Urgencias' ELSE 'Consulta Externa' END AS IngresoPor FROM INNCSUMPA INNER JOIN INNMSUMPA ON INNCSUMPA.OID = INNMSUMPA.INNCSUMPA RIGHT OUTER JOIN INNPRODUC INNER JOIN SLNPROHOJ ON INNPRODUC.OID = SLNPROHOJ.INNPRODUC1 ON INNMSUMPA.INNPRODUC = INNPRODUC.OID RIGHT OUTER JOIN SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNORDSER ON SLNSERPRO.SLNORDSER1 = SLNORDSER.OID ON INNCSUMPA.SLNORDSER = SLNORDSER.OID AND SLNPROHOJ.OID = SLNSERPRO.OID LEFT OUTER JOIN SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENARESER ON GENSERIPS.GENARESER1 = GENARESER.OID WHERE (SLNSERPRO.SERFECSER BETWEEN @fech1 AND @fech2 + ' 23:59:59') AND (GENDETCON.GDENOMBRE LIKE  @Entidad ) AND (SLNORDSER.SOSFECCON IS NOT NULL) ORDER BY 'Reg', 'CodAreaSol', 'Cod Examen'">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextFechaIni0" Name="fech1" PropertyName="Text" />
                             <asp:ControlParameter ControlID="TextFechaFin" Name="fech2" PropertyName="Text" />
                             <asp:ControlParameter ControlID="Label1" Name="Entidad" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataEntidad" runat="server" ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" SelectCommand="SELECT  [GDENOMBRE] FROM [GENDETCON] ORDER BY [GDENOMBRE]"></asp:SqlDataSource>
                     &nbsp;</caption>



 
    

</asp:Content>