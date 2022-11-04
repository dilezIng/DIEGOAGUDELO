<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Control_Triage.aspx.vb" Inherits="Control_Triage" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-family:Tahoma;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 172px;
            height: 23px;
            text-align: right;
        }
        .auto-style5 {
            width: 172px;
            text-align: right;
        }
        .auto-style6 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

<table><tr><td>
</td>
</tr>
*** Tablero Control Pretriage ***  <asp:Label ID="LbPediatria2" runat="server" CssClass="auto-style8"></asp:Label>
<tr><td>
<asp:GridView ID="GridViewdig" runat="server" AllowSorting="True" DataSourceID="SqlDataSource3DIGI" EmptyDataText="Sin turno en espera" AutoGenerateColumns="False"  style="font-size: small" >
<AlternatingRowStyle BackColor="#CCCC" /><Columns>
<asp:BoundField DataField="TURNO" HeaderText="TURNO" SortExpression="TURNO" />
<asp:BoundField DataField="CARACTERIZACION" HeaderText="CARACTERIZACION" SortExpression="CARACTERIZACION" />
<asp:BoundField DataField="FECHA Y HORA LLEGADA" HeaderText="FECHA Y HORA LLEGADA" SortExpression="FECHA Y HORA LLEGADA" />
<asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" />
<asp:BoundField DataField="Minutos" HeaderText="Minutos" SortExpression="Minutos" />
<asp:BoundField DataField="min_total" HeaderText="min_total" SortExpression="min_total" />
<asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo"></asp:ImageField></Columns></asp:GridView>
</td>
</tr>




    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<table style="width: 100%;"><tr><td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; " colspan="6" class="auto-style1" >*** Tablero Control Triage ***</td></tr>
<tr><td></td><td></td><td class="auto-style5"><asp:Image ID="Image6" runat="server" Height="15px" ImageUrl="~/Images/Rojo.jpg" /></td><td>1 Hora +</td><td></td><td>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT HCNTRIAGE.HCNCLAURGTR AS Clasificacion, HCNTRIAGE.HCTFECTRI AS Fech_Triage, ADNINGRESO.AINCONSEC AS Ingreso, ADNINGRESO.AINFECING AS Fech_Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, CASE WHEN (SELECT TOP 1 HCNFOLIO.ADNINGRESO FROM HCNFOLIO WHERE HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) IS NULL THEN 'SIN FOLIO' ELSE 'HC' END AS Historia, HCNTRIAGE.HCFMODTRI AS Fech_Modificado, CASE WHEN HCTCONFIR = 1 THEN 'Ok' ELSE ' ' END AS Confirmado,ABS(DATEDIFF(d, HCNTRIAGE.HCFMODTRI, GETDATE())) AS dias, ABS(DATEDIFF(mi, HCNTRIAGE.HCFMODTRI, GETDATE())) / 60 % 24 AS Horas, ABS(DATEDIFF(MI, HCNTRIAGE.HCFMODTRI, GETDATE())) % 60 AS Minutos, CASE WHEN ((ABS(DATEDIFF(MI , HCNTRIAGE.HCFMODTRI , GETDATE()))) &lt; 45) AND HCTCONFIR = 1 THEN '~/Images/Verde.png' WHEN ((ABS(DATEDIFF(MI , HCNTRIAGE.HCFMODTRI , GETDATE()))) &lt; 59) AND HCTCONFIR = 1 THEN '~/Images/Amarillo.png' WHEN ((ABS(DATEDIFF(MI , HCNTRIAGE.HCFMODTRI , GETDATE()))) &gt; 59) AND HCTCONFIR = 1 THEN '~/Images/Rojo.png' ELSE '~/Images/Verde.png' END AS SEMAFORO FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.OID = ADNINGRESO.HCENTRIAGE INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINTIPING = 1) AND (ADNINGRESO.AINESTADO = 0) AND ((SELECT ADNINGRESO FROM ADNEGRESO WHERE (ADNINGRESO.OID = ADNINGRESO)) IS NULL) AND ((SELECT TOP (1) ADNINGRESO FROM HCNFOLIO WHERE (ADNINGRESO = ADNINGRESO.OID)) IS NULL) and ADNINGRESO.ADNCENATE = 1 AND ((SELECT TOP (1) ADNINGRESO FROM HCNREGENF WHERE (ADNINGRESO = ADNINGRESO.OID)) IS NULL) ORDER BY Confirmado DESC, Ingreso"></asp:SqlDataSource></td></tr>
	<tr><td></td><td></td><td class="auto-style5"><asp:Image ID="Image4" runat="server" Height="15px" ImageUrl="~/Images/Amarillo.jpg" /></td><td>45 a 59 Minutos</td><td></td><td>
	
	<asp:SqlDataSource ID="SqlDataSource3DIGI" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT  HCNCONCOTRI.HCPREFIJO+' '+CONVERT(Varchar(20), HCNCONTRDT.HCCTTURNO) AS TURNO,     HCNCONCOTRI.HCDESCRIP as 'CARACTERIZACION'       ,HCNCONTRDT.HCCFECTUR AS 'FECHA Y HORA LLEGADA' 	  ,ABS(DATEDIFF(hh, HCNCONTRDT.HCCFECTUR, GETDATE()))/24  as 'Horas'   ,ABS(DATEDIFF(mi, HCNCONTRDT.HCCFECTUR, GETDATE()))%60  as 'Minutos' ,ABS(DATEDIFF(mi, HCNCONTRDT.HCCFECTUR, GETDATE())) as min_total, CASE WHEN ABS(DATEDIFF(mi, HCNCONTRDT.HCCFECTUR, GETDATE())) <5  THEN '~/Images/VerdePRETRI.png' WHEN ((ABS(DATEDIFF(MI , HCNCONTRDT.HCCFECTUR , GETDATE()))) in( 5,6,7,8,9))  THEN '~/Images/AmarilloPRETRI.png' WHEN ((ABS(DATEDIFF(mi , HCNCONTRDT.HCCFECTUR , GETDATE()))) in( 10,11,12,13,14))  THEN '~/Images/NaranjaPRETRI.png' WHEN ((ABS(DATEDIFF(mi , HCNCONTRDT.HCCFECTUR , GETDATE()))) > 15)  THEN '~/Images/RojoPRETRI.png'  END AS SEMAFORO    FROM HCNCONTRDT   INNER JOIN HCNCONCOTRI ON HCNCONTRDT.HCNCONCOTRI=HCNCONCOTRI.OID  where HCCFECSAL is null and HCNCONTRDT.HCLLFECHA is null  and hcarea=1  order by HCNCONCOTRI.HCPRIORIDAD,HCNCONCOTRI.HCCODIGO desc"></asp:SqlDataSource>
	</td></tr><tr><td class="auto-style3"></td><td class="auto-style3"></td><td class="auto-style4"><asp:Image ID="Image8" runat="server" Height="15px" ImageUrl="~/Images/Verde.jpg" /></td><td class="auto-style3">0 a 44 Minutos</td><td class="auto-style3"></td><td class="auto-style3"></td></tr>
	
	<tr><td colspan="6">*** Tablero Control de Triage ***  <asp:Label ID="LbPediatria" runat="server" CssClass="auto-style8"></asp:Label></td></tr><tr>
    <td colspan="6" class="auto-style6">
    <asp:GridView ID="GridViewPed" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" EmptyDataText="Sin turno en espera" AutoGenerateColumns="False" CssClass="auto-style10" style="font-size: small" Width="1049px">
	<AlternatingRowStyle BackColor="#CCFFCC" />
	<Columns><asp:BoundField DataField="Clasificacion" HeaderText="Clasificacion" SortExpression="Clasificacion" />
	<asp:BoundField DataField="Fech_Triage" HeaderText="Fech_Triage" SortExpression="Fech_Triage" />
	<asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
	<asp:BoundField DataField="Fech_Ingreso" HeaderText="Fech_Ingreso" SortExpression="Fech_Ingreso" />
	<asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
	<asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
	<asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" ReadOnly="True" />
	<asp:BoundField DataField="Historia" HeaderText="Historia" SortExpression="Historia" ReadOnly="True" />
	<asp:BoundField DataField="Fech_Modificado" HeaderText="Fech_Modificado" SortExpression="Fech_Modificado" />
	<asp:BoundField DataField="Confirmado" HeaderText="Confirmado" ReadOnly="True" SortExpression="Confirmado" />
	<asp:BoundField DataField="dias" HeaderText="dias" ReadOnly="True" SortExpression="dias" />
	<asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
	<asp:BoundField DataField="Minutos" HeaderText="Minutos" ReadOnly="True" SortExpression="Minutos" />
        <asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo"><ControlStyle Height="50%" Width="100%"/></asp:ImageField></Columns></asp:GridView></td></tr></table><asp:Label ID="Label1" runat="server" Text="Ing Diego A." Font-Size="XX-Small"></asp:Label></asp:Panel></ContentTemplate>
                            
</asp:TabPanel>


</asp:Content>
