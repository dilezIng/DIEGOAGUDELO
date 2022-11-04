<%@ Page Title="Traza de Ordenes de Servicio" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Seguimiento.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    </style>
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
        font-weight: bold;
        font-size: 20pt;
        color: #FFFFFF;
    }
           
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>
                &nbsp;<asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
                <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="5" 
                style="background-image: url('../Images/Fondo01.jpg');" class="auto-style1" 
                >
                
                SEGUIMIENTO INGRESOS</td>
        </tr>
        <tr >
         <td style="width: 20%" >
             Fecha Inicial:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender></td>
            <td style="width: 20%" >
                Hora Inicial: 
                <ew:timepicker id="HoraInicial" runat="server" width="70px" 
                    MinuteInterval="OneHour">
                    <TimeStyle Font-Names="Tahoma" Font-Size="8pt" />
                </ew:timepicker></td>
            <td style="width: 20%" >
             Fecha Final:
                <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
             </td>
            <td style="width: 20%" >
                Hora Final:
                <ew:timepicker id="HoraFinal" runat="server" width="70px" 
                    MinuteInterval="OneHour">
                    <TimeStyle Font-Names="Tahoma" Font-Size="8pt" />
                </ew:timepicker>
            </td>
             
            <td style="width: 20%; text-align: right;" rowspan="2" >
               
            <asp:Button ID="BtnActualizar" runat="server" Text="Buscar" 
                    style="font-weight: 700; font-size: 12pt" />
            </td>
        </tr>
        <tr >
         <td style="width: 20%" >
                
                <asp:Label ID="LabelFechaIni" runat="server" Visible="False"></asp:Label>
                
             <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td style="width: 20%" >
                
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
                
            &nbsp;<asp:Label ID="LabelDocPaciente" runat="server" Visible="False"></asp:Label>
                
            </td>
            <td style="width: 20%; text-align: right;" >
                
                No. de Ingreso:</td>
             <td style="width: 20%" >
                 
                 <asp:TextBox ID="TextDocPaciente" runat="server" MaxLength="7"></asp:TextBox>
                 
             </td>
        </tr>
        <tr >
            <td colspan="5" 
                style="font-weight: bold; font-size: 16pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" >
                <asp:Label ID="LabelSubTitulo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="5" >
                <asp:GridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" DataSourceID="DataPrincipal" 
                    Visible="False" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Contrato" HeaderText="Contrato" SortExpression="Contrato" />
                        <asp:BoundField DataField="NombreContrato" HeaderText="NombreContrato" SortExpression="NombreContrato" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                        <asp:BoundField DataField="IngresoPor" HeaderText="IngresoPor" ReadOnly="True" SortExpression="IngresoPor" />
                        <asp:BoundField DataField="Tipo_Ingreso" HeaderText="Tipo_Ingreso" ReadOnly="True" SortExpression="Tipo_Ingreso" />
                        <asp:BoundField DataField="Fech_Ingreso" HeaderText="Fech_Ingreso" SortExpression="Fech_Ingreso" />
                        <asp:BoundField DataField="CodUsuario" HeaderText="CodUsuario" SortExpression="CodUsuario" />
                        <asp:BoundField DataField="Usuario_Ingreso" HeaderText="Usuario_Ingreso" SortExpression="Usuario_Ingreso" />
                        <asp:BoundField DataField="TipoRiesgo" HeaderText="TipoRiesgo" ReadOnly="True" SortExpression="TipoRiesgo" />
                    </Columns>
                    <HeaderStyle Font-Size="10pt" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataPrincipal" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, GENDETCON.GDECODIGO AS Contrato, GENDETCON.GDENOMBRE AS NombreContrato, CASE WHEN ADNINGRESO.AINESTADO = 0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO = 1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO = 2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO = 3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO = 4 THEN 'Cerrado' END AS Estado, CASE WHEN ADNINGRESO.AINURGCON &lt; 0 THEN 'Ninguno' WHEN ADNINGRESO.AINURGCON = 0 THEN 'Urgencias' WHEN ADNINGRESO.AINURGCON = 1 THEN 'Cons Externa' WHEN ADNINGRESO.AINURGCON = 2 THEN 'Nacido HRD' WHEN ADNINGRESO.AINURGCON = 3 THEN 'Remitido' WHEN ADNINGRESO.AINURGCON = 4 THEN 'Hosp Urg' WHEN ADNINGRESO.AINURGCON = 5 THEN 'Hospitalización' WHEN ADNINGRESO.AINURGCON = 6 THEN 'Imagenes' WHEN ADNINGRESO.AINURGCON = 7 THEN 'Laboratorio' WHEN ADNINGRESO.AINURGCON = 8 THEN 'Urg_Gineco' WHEN ADNINGRESO.AINURGCON = 9 THEN 'Quirofano' WHEN ADNINGRESO.AINURGCON = 10 THEN 'Cirugia_Ambulatoria' WHEN ADNINGRESO.AINURGCON = 11 THEN 'Cirugia_Programada' WHEN ADNINGRESO.AINURGCON = 12 THEN 'Uci_Neonatal' WHEN ADNINGRESO.AINURGCON = 13 THEN 'Uci_Adulto' END AS IngresoPor, CASE WHEN ADNINGRESO.AINTIPING = 1 THEN 'Ambulatorio' WHEN ADNINGRESO.AINTIPING = 2 THEN 'Hospitalario' END AS Tipo_Ingreso, ADNINGRESO.AINFECING AS Fech_Ingreso, GENUSUARIO.USUNOMBRE AS CodUsuario, GENUSUARIO.USUDESCRI AS Usuario_Ingreso, CASE WHEN ADNINGRESO.AINTIPRIE = 0 THEN 'Ninguna' WHEN ADNINGRESO.AINTIPRIE = 1 THEN 'Accidente de transito' WHEN ADNINGRESO.AINTIPRIE = 2 THEN 'Catastrofe' WHEN ADNINGRESO.AINTIPRIE = 3 THEN 'Enfermedad general y maternidad' WHEN ADNINGRESO.AINTIPRIE = 4 THEN 'Accidente de trabajo' WHEN ADNINGRESO.AINTIPRIE = 5 THEN 'Enfermedad profesional' WHEN ADNINGRESO.AINTIPRIE = 6 THEN 'Atencion inicial de urgencias' WHEN ADNINGRESO.AINTIPRIE = 7 THEN 'Otro tipo de accidente' WHEN ADNINGRESO.AINTIPRIE = 8 THEN 'Lesion por agresion' WHEN ADNINGRESO.AINTIPRIE = 9 THEN 'lesion autoinfligida' WHEN ADNINGRESO.AINTIPRIE = 10 THEN 'Maltrato fisico' WHEN ADNINGRESO.AINTIPRIE = 11 THEN 'Promocion y prevencion' WHEN ADNINGRESO.AINTIPRIE = 12 THEN 'Otro' WHEN ADNINGRESO.AINTIPRIE = 13 THEN 'Accidente rabico' WHEN ADNINGRESO.AINTIPRIE = 14 THEN 'Accidente Ofidico' WHEN ADNINGRESO.AINTIPRIE = 15 THEN 'Sospecha de abuso sexual' WHEN ADNINGRESO.AINTIPRIE = 15 THEN 'Sospecha de violencia sexual' WHEN ADNINGRESO.AINTIPRIE = 15 THEN 'Sospecha de maltrato Emocional' END AS TipoRiesgo FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENUSUARIO ON ADNINGRESO.GEENUSUARIO = GENUSUARIO.OID WHERE (ADNINGRESO.AINFECING BETWEEN @FechaInicial AND @FechaFinal) ORDER BY IngresoPor, NombreContrato, CodUsuario">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelFechaIni" Name="FechaInicial" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr >
            <td colspan="5" >
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
            <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    Height="600px" ScrollBars="Vertical" Width="900px" GroupingText="123">
                    
                    <table style="width: 100%; font-family: tahoma;">
                        
                        </tr>
                            <tr>
                                <td style="width: 90%; font-size: 10pt;">
                                    <asp:SqlDataSource ID="DataGridResFactAnu" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                        SelectCommand="SELECT SLNFACTUR.SFAFECANU, SLNFACTUR.GENUSUARIO1 AS IdUsFact, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAVALPAC, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINCONSEC, GENDETCON.GDENOMBRE, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAJUSANU, SLNFACTUR.SFANUMFAC, ADNINGRESO.OID AS IdIngreso FROM GENDETCON INNER JOIN ADNINGRESO ON GENDETCON.OID = ADNINGRESO.GENDETCON INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicial AND @FechaFinal) AND (SLNFACTUR.SFADOCANU = 1) AND (SLNFACTUR.GENUSUARIO1 = @IdUsuario) ORDER BY SLNFACTUR.SFAFECANU">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                                                PropertyName="Text" />
                                            <asp:Parameter Name="IdUsuario" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="DataGridTraza" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                        SelectCommand="SELECT SLNFACTUR.SFAFECANU, SLNFACTUR.GENUSUARIO2 AS IdUsAnu, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAVALPAC, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINCONSEC, GENDETCON.GDENOMBRE, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAJUSANU, SLNFACTUR.SFANUMFAC, ADNINGRESO.OID AS IdIngreso, GENUSUARIO.USUDESCRI AS UsFacturo FROM GENDETCON INNER JOIN ADNINGRESO ON GENDETCON.OID = ADNINGRESO.GENDETCON INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO1 = GENUSUARIO.OID LEFT OUTER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.OID = @IdIngreso) ORDER BY SLNFACTUR.SFAFECANU">
                                        <SelectParameters>
                                            <asp:Parameter Name="IdIngreso" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 10%; text-align: center; vertical-align: top;">
                                    <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                                    <br />
                                    <asp:Button ID="BtnCerrarTraza" runat="server" Text="Cerrar Traza" 
                                        Visible="False" />
                                    <br />
                                </td>
                        </tr>
                    </table>
                    
                </asp:Panel>
            </td>
        </tr>
        <tr >
            <td colspan="5" >
                
                &nbsp;</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 20%" >
                &nbsp;</td>
           <td style="width: 20%" >
                &nbsp;</td>
                <td style="width: 20%" >
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

