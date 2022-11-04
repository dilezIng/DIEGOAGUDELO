<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="CxC.aspx.vb" Inherits="Facturacion_Ciruguia" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
    <script language="javascript">

        function ShowModalPopup() {

            $find("Panel1_ModalPopupExtender").show();

        }

        function HideModalPopup() {

            $find("Panel1_ModalPopupExtender").hide();

        }

</script>
  
    
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
        text-align: center;
    }
               
</style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"  EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1000px;
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
        <tr >
            <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Cuenta de Cobro</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:Label ID="Label1" runat="server" Text="Label">Digite Nº Cuenta:</asp:Label>
                <asp:TextBox ID="NCuenta" runat="server" Rows="10" Width="80px"></asp:TextBox>
              
            </td>
            <td style="width: 25%" >
                <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" />
                <asp:Button ID="BtnRegresar" runat="server" Text="Regresar" />
            <asp:Label ID="LabelCant" runat="server" 
                    style="color: #006600; font-weight: 700"></asp:Label>
            </td>
            <td style="width: 25%" >
                
              
                <asp:Label ID="LabelInfo" runat="server" ></asp:Label>
            </td>
            <td style="width: 25%" >
         

                 <asp:Button ID="BtnExport" runat="server" 
                    Text="Exportar a Excel" Enabled="true" />
            </td>
        </tr>
        <tr >
            <td colspan="4" style="width: 100%; font-size: 10pt;" >
                <div class="auto-style1">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataCirugia" Width="100%" PageSize="300" EmptyDataText="No existen registros para el filtro seleccionado." AllowSorting="True">
        <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField DataField="IPS" HeaderText="IPS" SortExpression="IPS" ReadOnly="True" />
                <asp:BoundField DataField="NumRadicacion" HeaderText="NumRadicacion" SortExpression="NumRadicacion" />
                <asp:BoundField DataField="FechaRadicacion" HeaderText="FechaRadicacion" SortExpression="FechaRadicacion" />
                <asp:BoundField DataField="NumFactura" HeaderText="NumFactura" SortExpression="NumFactura" />
                <asp:BoundField DataField="FechaFactura" HeaderText="FechaFactura" SortExpression="FechaFactura" />
                <asp:BoundField DataField="FechaAtencion" HeaderText="FechaAtencion" SortExpression="FechaAtencion" />
                <asp:BoundField DataField="NomPaciente" HeaderText="NomPaciente" ReadOnly="True" SortExpression="NomPaciente" />
                <asp:BoundField DataField="NumDocPaciente" HeaderText="NumDocPaciente" SortExpression="NumDocPaciente" />
                <asp:BoundField DataField="CIE10" HeaderText="CIE10" SortExpression="CIE10" ReadOnly="True" />
                <asp:BoundField DataField="DxCie10" HeaderText="DxCie10" SortExpression="DxCie10" ReadOnly="True" />
                <asp:BoundField DataField="Dx2" HeaderText="Dx2" SortExpression="Dx2" ReadOnly="True" />
                <asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" SortExpression="Diagnostico" ReadOnly="True" />
                <asp:BoundField DataField="Tipo_Ingreso" HeaderText="Tipo_Ingreso" SortExpression="Tipo_Ingreso" ReadOnly="True" />
                <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" ReadOnly="True" />
                <asp:BoundField DataField="TotalFactura" HeaderText="TotalFactura" SortExpression="TotalFactura" />
                <asp:BoundField DataField="ValorGlosa" HeaderText="ValorGlosa" ReadOnly="True" SortExpression="ValorGlosa" />
                <asp:BoundField DataField="ValorAceptadoIPS" HeaderText="ValorAceptadoIPS" ReadOnly="True" SortExpression="ValorAceptadoIPS" />
                <asp:BoundField DataField="ValorAceptadoPonal" HeaderText="ValorAceptadoPonal" ReadOnly="True" SortExpression="ValorAceptadoPonal" />
                <asp:BoundField DataField="Valorpagar" HeaderText="Valorpagar" ReadOnly="True" SortExpression="Valorpagar" />
                <asp:BoundField DataField="Conciliada" HeaderText="Conciliada" ReadOnly="True" SortExpression="Conciliada" />
                <asp:BoundField DataField="Observacion" HeaderText="Observacion" ReadOnly="True" SortExpression="Observacion" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                <asp:BoundField DataField="Contrato" HeaderText="Contrato" SortExpression="Contrato" />
                <asp:BoundField DataField="AltoCosto" HeaderText="AltoCosto" ReadOnly="True" SortExpression="AltoCosto" />
                <asp:BoundField DataField="ResUrg" HeaderText="ResUrg" ReadOnly="True" SortExpression="ResUrg" />
                <asp:BoundField DataField="Contingencia" HeaderText="Contingencia" ReadOnly="True" SortExpression="Contingencia" />
                <asp:BoundField DataField="Inclusion" HeaderText="Inclusion" ReadOnly="True" SortExpression="Inclusion" />
                <asp:BoundField DataField="Recursos" HeaderText="Recursos" ReadOnly="True" SortExpression="Recursos" />
            </Columns>
        </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataCirugia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT 'HOSPITAL REGIONAL DUITAMA PRIMER NIVEL ' AS IPS, CRNDOCUME.CDCONSEC AS NumRadicacion, CRNDOCUME.CDFECDOC AS FechaRadicacion, SLNFACTUR.SFANUMFAC AS NumFactura, SLNFACTUR.SFAFECFAC AS FechaFactura, ADNINGRESO.AINFECING AS FechaAtencion, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, GENPACIEN.PACNUMDOC AS NumDocPaciente, CASE WHEN (SELECT TOP (1) GENDIAGNO.DIACODIGO FROM HCNDIAPAC INNER JOIN HCNFOLIO ON HCNDIAPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.HCNUMFOL DESC) IS NULL THEN (SELECT TOP (1) GENSERIPS.SIPCODCUP FROM GENSERIPS INNER JOIN SLNSERHOJ ON GENSERIPS.OID = SLNSERHOJ.GENSERIPS1 INNER JOIN SLNSERPRO ON SLNSERHOJ.OID = SLNSERPRO.OID WHERE (SLNSERPRO.ADNINGRES1 = ADNINGRESO.OID)) ELSE (SELECT TOP (1) GENDIAGNO.DIACODIGO FROM HCNDIAPAC INNER JOIN HCNFOLIO ON HCNDIAPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.HCNUMFOL DESC) END AS CIE10, CASE WHEN (SELECT TOP (1) RTRIM(GENDIAGNO.DIANOMBRE) AS Expr1 FROM ADNDIAEGR INNER JOIN GENDIAGNO ON ADNDIAEGR.DIACODIGO = GENDIAGNO.OID WHERE (ADNDIAEGR.ADNEGRESO = ADNINGRESO.ADNEGRESO) ORDER BY ADNDIAEGR.Tipo) IS NULL THEN (SELECT TOP (1) GENSERIPS.SIPDESCUP FROM GENSERIPS INNER JOIN SLNSERHOJ ON GENSERIPS.OID = SLNSERHOJ.GENSERIPS1 INNER JOIN SLNSERPRO ON SLNSERHOJ.OID = SLNSERPRO.OID WHERE (SLNSERPRO.ADNINGRES1 = ADNINGRESO.OID)) ELSE (SELECT TOP (1) RTRIM(GENDIAGNO.DIANOMBRE) FROM HCNDIAPAC INNER JOIN HCNFOLIO ON HCNDIAPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.HCNUMFOL DESC) END AS DxCie10, CASE WHEN (SELECT TOP (1) GENDIAGNO.DIACODIGO FROM HCNDIAPAC INNER JOIN HCNFOLIO ON HCNDIAPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.HCNUMFOL DESC) IS NULL THEN (SELECT TOP (1) RTRIM(GENESPECI.GEEDESCRI) FROM HCNDIAPAC INNER JOIN HCNFOLIO ON HCNDIAPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENESPECI ON HCNFOLIO.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.HCNUMFOL DESC) ELSE (SELECT TOP (1) RTRIM(GENESPECI.GEEDESCRI) FROM HCNDIAPAC INNER JOIN HCNFOLIO ON HCNDIAPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENESPECI ON HCNFOLIO.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.HCNUMFOL DESC) END AS Dx2, (SELECT TOP (1) G.DIANOMBRE FROM HCNFOLIO AS H INNER JOIN HCNDIAPAC AS HC ON H.OID = HC.HCNFOLIO INNER JOIN GENDIAGNO AS G ON HC.GENDIAGNO = G.OID WHERE (H.ADNINGRESO = ADNINGRESO.OID) ORDER BY H.OID DESC) AS Diagnostico, CASE WHEN [ADNINGRESO].AINFECHOS IS NULL THEN 'NO HOSPITALIZADO' ELSE 'CAUSAS DE MORBILIDAD DESCONOCIDAS Y NO ESPECIFICADAS' END AS Tipo_Ingreso, CASE WHEN GPASEXPAC = 2 THEN 'F' ELSE 'M' END AS Genero, SLNFACTUR.SFATOTFAC AS TotalFactura, '' AS ValorGlosa, '' AS ValorAceptadoIPS, '' AS ValorAceptadoPonal, '' AS Valorpagar, '' AS Conciliada, '' AS Observacion, STR(DATEDIFF(month, GENPACIEN.GPAFECNAC, GETDATE()) / 12.0, 4, 1) AS Edad, GENCONTRA.GECCONTRA AS Contrato, '' AS AltoCosto, '' AS ResUrg, '' AS Contingencia, '' AS Inclusion, '' AS Recursos FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENCONTRA.OID = GENDETCON.GENCONTRA1 INNER JOIN CRNRADFACD ON SLNFACTUR.OID = CRNRADFACD.SLNFACTUR INNER JOIN CRNRADFACC ON CRNRADFACC.OID = CRNRADFACD.CRNRADFACC INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID LEFT OUTER JOIN ADNEGRESO AS ADNEGRESO_1 ON ADNEGRESO_1.ADNINGRESO = ADNINGRESO.OID WHERE (CRNDOCUME.CDCONSEC = @NCuenta) ORDER BY NumRadicacion, NumFactura">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="NCuenta" Name="NCuenta" PropertyName="Text"  />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>

        </tr>
        <tr>
            <td colspan="4">
               
            </td>
        </tr>
    </table>

        
     


</asp:Content>

