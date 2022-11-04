<%@ Page Title="Material" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Material.aspx.vb" Inherits="Cirugia_Material"  %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
<style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    .auto-style1 {
        font-weight: bold;
        font-size: 20pt;
    }
           
    .auto-style2 {
        width: 32%;
    }
           
    .auto-style3 {
        text-align: center;
        font-size: large;
        height: 26px;
    }
           
</style>

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
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
            <td colspan="4" class="auto-style1" >MATERIAL QX<asp:Label ID="LabelFolio" runat="server" ></asp:Label></td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
                
                Fecha Inicial:&nbsp;<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
               
              
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
 Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>

            </td>
            <td  style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; style="width: 30%; text-align: right;" >
                
                &nbsp;</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" style="height: 26px" /></td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                
            </td>
        </tr>
        <tr >
            <td colspan="4" class="auto-style3" >
                
                PENDIENTES POR FACTURAR
                <asp:Label ID="LabelPen" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SOLICITUDMATERIAL" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="NomPaciente" ReadOnly="True" SortExpression="NomPaciente" />
						         <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" ReadOnly="True" SortExpression="TELEFONO" />
                        <asp:BoundField DataField="FechaHoraCirugia" HeaderText="FechaHoraCirugia" SortExpression="FechaHoraCirugia" />
                        <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" SortExpression="DIAS" />
                        <asp:BoundField DataField="Fol" HeaderText="Fol" SortExpression="Fol" />
                        <asp:BoundField DataField="MATERIAL" HeaderText="MATERIAL" SortExpression="MATERIAL" />
                        <asp:BoundField DataField="HRD" HeaderText="HRD" ReadOnly="True" SortExpression="HRD" />
                        <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" SortExpression="OBSERVACION" />
                        <asp:BoundField DataField="Almacen" HeaderText="Almacen" ReadOnly="True" SortExpression="Almacen" />
                        <asp:BoundField DataField="Fech Proveedor" HeaderText="Fech Proveedor" ReadOnly="True" SortExpression="Fech Proveedor" />
                        <asp:BoundField DataField="Fecha Comprobante" HeaderText="Fecha Comprobante" ReadOnly="True" SortExpression="Fecha Comprobante" />
                        <asp:BoundField DataField="Prov Alm" HeaderText="Prov Alm" ReadOnly="True" SortExpression="Prov Alm" />
                        <asp:BoundField DataField="Qx Alm" HeaderText="Qx Alm" ReadOnly="True" SortExpression="Qx Alm" />
                        <asp:BoundField DataField="FARMACIA" HeaderText="FARMACIA" ReadOnly="True" SortExpression="FARMACIA" />
                        <asp:BoundField DataField="Fecha Suministro" HeaderText="Fecha Suministro" ReadOnly="True" SortExpression="Fecha Suministro" />
                        <asp:BoundField DataField="Alm Far" HeaderText="Alm Far" ReadOnly="True" SortExpression="Alm Far" />
                        <asp:BoundField DataField="Qx Far" HeaderText="Qx Far" ReadOnly="True" SortExpression="Qx Far" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SOLICITUDMATERIAL" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, LTRIM(RTRIM(N'' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, GENPACIENT.PACTELEFONO AS TELEFONO, HCNFOLIO.HCFECFOL AS FechaHoraCirugia, DATEDIFF(D, HCNFOLIO.HCFECFOL, GETDATE()) AS DIAS, HCNFOLIO.HCNUMFOL AS Fol, HCMHCINTQ.HCCM09N37 AS MATERIAL, CASE WHEN HCMHCINTQ.HCCM10N54 = 'SI' THEN 'HRD' ELSE 'NO' END AS HRD, HCMHCINTQ.HCCM02N38 AS OBSERVACION, CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN (SELECT TOP 1 IDCONSEC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) ELSE '' END AS Almacen, CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (SELECT TOP 1 INNCCOMPR.ICCFECFAC FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) , 101) ELSE '' END AS 'Fech Proveedor', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) , 121) ELSE '' END AS 'Fecha Comprobante', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (SELECT TOP 1 INNCCOMPR.ICCFECFAC FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Prov Alm', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (HCNFOLIO.HCFECFOL) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Qx Alm', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN (SELECT TOP 1 IDCONSEC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) ELSE '' END AS FARMACIA, CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) , 121) ELSE '' END AS 'Fecha Suministro', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Alm Far', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (HCNFOLIO.HCFECFOL) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Qx Far' FROM HCMHCINTQ INNER JOIN HCNFOLIO ON HCMHCINTQ.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID       INNER JOIN GENPACIENT ON GENPACIEN.GENPACIENT=GENPACIENT.OID  WHERE (ADNINGRESO.AINESTADO &lt;&gt; 2) AND ((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) IS NULL) AND (HCMHCINTQ.HCCM09N37 = 'SI')"
                    
                    
                    
                    >
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="HISTORICO" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT HCNFOLIO.HCFECFOL AS FechaHoraCirugia, GENPACIENT.PACTELEFONO AS TELEFONO, DATEDIFF(D, HCNFOLIO.HCFECFOL, GETDATE()) AS DIAS, HCNFOLIO.HCNUMFOL AS Fol, ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, HCMHCINTQ.HCCM09N37 AS MATERIAL, CASE WHEN (HCMHCINTQ.HCCM10N54 = 'SI') THEN 'SI' ELSE 'NO' END AS HRD, HCMHCINTQ.HCCM02N38 AS OBSERVACION, CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN (SELECT TOP 1 IDCONSEC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) ELSE '' END AS Almacen, CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (SELECT TOP 1 INNCCOMPR.ICCFECFAC FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) , 101) ELSE '' END AS 'Fech Proveedor', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) , 121) ELSE '' END AS 'Fecha Comprobante', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (SELECT TOP 1 INNCCOMPR.ICCFECFAC FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Prov Alm', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (HCNFOLIO.HCFECFOL) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Qx Alm', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN (SELECT TOP 1 IDCONSEC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) ELSE '' END AS FARMACIA, CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) , 121) ELSE '' END AS 'Fecha Suministro', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 OID FROM INNCCOMPR WHERE INNCCOMPR.ICCDETALL LIKE '%' + GENPACIEN.PACNUMDOC + '%' ORDER BY oid DESC) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Alm Far', CASE WHEN (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC) IS NOT NULL THEN CONVERT (VARCHAR , (DATEDIFF(D , (HCNFOLIO.HCFECFOL) , (SELECT TOP 1 IDFECDOC FROM INNDOCUME WHERE OID = (SELECT TOP 1 INNCSUMPA.OID FROM INNCSUMPA WHERE INNCSUMPA.adningreso = ADNINGRESO.OID AND INNALMACE = 20) AND IDFECDOC &gt; HCNFOLIO.HCFECFOL ORDER BY OID DESC))) , 121) ELSE ' ' END AS 'Qx Far', ISNULL((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC), '') AS FACTURA, ISNULL(CONVERT (VARCHAR, (SELECT TOP (1) SFAFECFAC FROM SLNFACTUR AS SLNFACTUR_3 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC), 121), '') AS Fecha_FACTURA, ISNULL((SELECT TOP (1) CASE WHEN SLNFACTUR_2.SFADOCANU = 0 THEN 'Ok' ELSE 'Anulada' END AS Expr1 FROM SLNFACTUR AS SLNFACTUR_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC), '') AS ESTADO, ISNULL(CONVERT (VARCHAR, DATEDIFF(D, HCNFOLIO.HCFECFOL, (SELECT TOP (1) SFAFECFAC FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC)), 121), '') AS 'Qx Fac' FROM HCMHCINTQ INNER JOIN HCNFOLIO ON HCMHCINTQ.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID    INNER JOIN GENPACIENT ON GENPACIEN.GENPACIENT=GENPACIENT.OID  WHERE (HCMHCINTQ.HCCM09N37 = 'SI') AND (HCNFOLIO.HCFECFOL BETWEEN @po AND @p1 + ' 23:59:59') AND (HCMHCINTQ.HCCM02N38 &lt;&gt; ' ') ORDER BY ADNINGRESO.OID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="po" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td colspan="4" class="auto-style3" >
                
                            HISTORICO</td>
                    </tr>
                    <tr>
                        <td colspan="4"style="font-size: 9pt" >
                            <asp:GridView ID="GridView2" runat="server"  DataSourceID="HISTORICO" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                                    <asp:BoundField DataField="FechaHoraCirugia" HeaderText="FechaHoraCirugia" SortExpression="FechaHoraCirugia" />
                                    <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" ReadOnly="True" />
                                    <asp:BoundField DataField="Fol" HeaderText="Fol" SortExpression="Fol" />
                                    <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                                    <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
										         <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" ReadOnly="True" SortExpression="TELEFONO" />
                                    <asp:BoundField DataField="NomPaciente" HeaderText="NomPaciente" SortExpression="NomPaciente" ReadOnly="True" />
                                    <asp:BoundField DataField="MATERIAL" HeaderText="MATERIAL" SortExpression="MATERIAL" />
                                    <asp:BoundField DataField="HRD" HeaderText="HRD" ReadOnly="True" SortExpression="HRD" />
                                    <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" SortExpression="OBSERVACION" />
                                    <asp:BoundField DataField="Almacen" HeaderText="Almacen" ReadOnly="True" SortExpression="Almacen" />
                                    <asp:BoundField DataField="Fech Proveedor" HeaderText="Fech Proveedor" ReadOnly="True" SortExpression="Fech Proveedor" />
                                    <asp:BoundField DataField="Fecha Comprobante" HeaderText="Fecha Comprobante" ReadOnly="True" SortExpression="Fecha Comprobante" />
                                    <asp:BoundField DataField="Prov Alm" HeaderText="Prov Alm" ReadOnly="True" SortExpression="Prov Alm" />
                                    <asp:BoundField DataField="Qx Alm" HeaderText="Qx Alm" ReadOnly="True" SortExpression="Qx Alm" />
                                    <asp:BoundField DataField="FARMACIA" HeaderText="FARMACIA" ReadOnly="True" SortExpression="FARMACIA" />
                                    <asp:BoundField DataField="Fecha Suministro" HeaderText="Fecha Suministro" ReadOnly="True" SortExpression="Fecha Suministro" />
                                    <asp:BoundField DataField="Alm Far" HeaderText="Alm Far" ReadOnly="True" SortExpression="Alm Far" />
                                    <asp:BoundField DataField="Qx Far" HeaderText="Qx Far" ReadOnly="True" SortExpression="Qx Far" />
                                    <asp:BoundField DataField="FACTURA" HeaderText="FACTURA" ReadOnly="True" SortExpression="FACTURA" />
                                    <asp:BoundField DataField="Fecha_FACTURA" HeaderText="Fecha_FACTURA" ReadOnly="True" SortExpression="Fecha_FACTURA" />
                                    <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" ReadOnly="True" SortExpression="ESTADO" />
                                    <asp:BoundField DataField="Qx Fac" HeaderText="Qx Fac" ReadOnly="True" SortExpression="Qx Fac" />
                                  </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                          
                        </td>
                    </tr>
    </table>

            

</asp:Content>



