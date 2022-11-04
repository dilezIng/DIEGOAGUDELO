<%@ Page Title="Resumen de Citas Médicas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="CitMedPacs.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


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
           
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                
                RESUMEN DE CITAS MEDICAS</td>
        </tr>
        <tr >
            <td style="width: 15%; font-size: 9pt;" >
                <asp:RadioButtonList ID="ListIngsFacts" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True" Enabled="False" 
                    Visible="False">
                    <asp:ListItem Selected="True" Value="0">Facturas</asp:ListItem>
                    <asp:ListItem Value="1">Ingresos</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RadioButtonList ID="ListAnuBloq" runat="server" 
                    RepeatDirection="Horizontal" Visible="False">
                    <asp:ListItem Value="3" Selected="True">Bloqueados</asp:ListItem>
                    <asp:ListItem Value="2">Anulados</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="border: 1px solid #C0C0C0; width: 30%; font-size: 9pt; text-align: left;" >
                Ingreso:
                <asp:TextBox ID="TextNumIngreso" runat="server" MaxLength="7" 
                    style="font-weight: 700; font-size: 14pt" Width="90px" Enabled="False"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="TextNumIngreso_FilteredTextBoxExtender" 
                    runat="server" BehaviorID="TextNumIngreso_FilteredTextBoxExtender" 
                    FilterType="Numbers" TargetControlID="TextNumIngreso" />
                <asp:Button ID="BtnActualizar0" runat="server" Text="Buscar por Ingreso" 
                    Enabled="False" />
            </td>
            <td style="width: 20%; text-align: right;" >
                Fecha Inicial:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            <td style="width: 35%; text-align: right;" >
                Fecha Final:
                <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:Button ID="BtnActualizar" runat="server" Text="Buscar por Fecha" />
            </td>
        </tr>
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 16pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" >
                <asp:Label ID="LabelSubTitulo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                <asp:GridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="OID" DataSourceID="DataGridPrincipal" AllowSorting="True" 
                    EmptyDataText="No existen registros para el filtro seleccionado.">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="GEECODIGO" HeaderText="Cod" 
                            SortExpression="GEECODIGO" />
                        <asp:BoundField DataField="GEEDESCRI" HeaderText="Especialidad" 
                            SortExpression="GEEDESCRI" />
                        <asp:BoundField DataField="Asignada" HeaderText="Asignada" ReadOnly="True" 
                            SortExpression="Asignada" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cancelada" HeaderText="Cancelada" ReadOnly="True" 
                            SortExpression="Cancelada" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cumplida" HeaderText="Cumplida" ReadOnly="True" 
                            SortExpression="Cumplida" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Incumplida" HeaderText="Incumplida" ReadOnly="True" 
                            SortExpression="Incumplida" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Total">
                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="%">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridPrincipal" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    SelectCommand="SELECT DISTINCT GENESPECI.OID, GENESPECI.GEECODIGO, GENESPECI.GEEDESCRI, (SELECT COUNT(GENESPECI) AS Expr1 FROM CMNCITMED WHERE (CCMFECCIT BETWEEN @FechaInicial AND @FechaFinal) AND (GENESPECI = GENESPECI.OID) AND (CCMESTADO = 0)) AS Asignada, (SELECT COUNT(GENESPECI) AS Expr1 FROM CMNCITMED AS CMNCITMED_3 WHERE (CCMFECCIT BETWEEN @FechaInicial AND @FechaFinal) AND (GENESPECI = GENESPECI.OID) AND (CCMESTADO = 1)) AS Cancelada, (SELECT COUNT(GENESPECI) AS Expr1 FROM CMNCITMED AS CMNCITMED_2 WHERE (CCMFECCIT BETWEEN @FechaInicial AND @FechaFinal) AND (GENESPECI = GENESPECI.OID) AND (CCMESTADO = 2)) AS Cumplida, (SELECT COUNT(GENESPECI) AS Expr1 FROM CMNCITMED AS CMNCITMED_3 WHERE (CCMFECCIT BETWEEN @FechaInicial AND @FechaFinal) AND (GENESPECI = GENESPECI.OID) AND (CCMESTADO = 3)) AS Incumplida FROM CMNCITMED AS CMNCITMED_1 INNER JOIN GENESPECI ON CMNCITMED_1.GENESPECI = GENESPECI.OID WHERE (CMNCITMED_1.CCMFECCIT BETWEEN @FechaInicial AND @FechaFinal) ORDER BY GENESPECI.GEEDESCRI" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
            <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    Height="600px" ScrollBars="Vertical" Width="900px" GroupingText="Oxigeno">
                    
                    <table style="width: 100%; font-family: tahoma;">
                        
                        </tr>
                            <tr>
                                <td style="width: 90%; font-size: 10pt;">
                                    <asp:GridView ID="GridDetRegEnf" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="DataGridDetRegEnf" PageSize="20">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="HCRHORREG" HeaderText="Hora Registro" 
                                                SortExpression="HCRHORREG" />
                                            <asp:BoundField DataField="NomActividad" HeaderText="Actividad" 
                                                SortExpression="NomActividad" />
                                            <asp:BoundField DataField="HCAOBSERV" HeaderText="Observaciones" 
                                                SortExpression="HCAOBSERV" />
                                            <asp:BoundField DataField="USUDESCRI" HeaderText="Usuario" 
                                                SortExpression="USUDESCRI" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataGridDetRegEnf" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                                        
                                        
                                        SelectCommand="SELECT ADNINGRESO.AINCONSEC, HCNACTENFD.OID, HCNACTENFD.GENMEDICO, HCNACTENFD.HCRHORREG, HCNACTENFD.HCNACTENF, HCNACTENFD.HCAOBSERV, HCNACTENFD.OptimisticLockField, HCNACTENFD.HCAHORFIN, HCNACTENFD.HCALITXMIN, GENMEDICO.GMETARPRO, GENUSUARIO.USUDESCRI, ADNINGRESO.OID AS Expr1, CASE WHEN HCTIPACT = 38 THEN 'Canula nasal' WHEN HCTIPACT = 39 THEN 'Ventury' WHEN HCTIPACT = 40 THEN 'Hood' WHEN HCTIPACT = 41 THEN 'Traqueostomia' WHEN HCTIPACT = 42 THEN 'Aspiración Secreciؚón' WHEN HCTIPACT = 43 THEN 'Tubo Orotraqueal' WHEN HCTIPACT = 44 THEN 'Ventilación Mecánica' WHEN HCTIPACT = 45 THEN 'Otros' WHEN HCTIPACT = 67 THEN 'CPAP' END AS NomActividad FROM ADNINGRESO INNER JOIN HCNREGENF ON ADNINGRESO.OID = HCNREGENF.ADNINGRESO INNER JOIN HCNACTENF ON HCNREGENF.OID = HCNACTENF.HCNREGENF INNER JOIN HCNACTENFD ON HCNACTENF.OID = HCNACTENFD.HCNACTENF INNER JOIN GENMEDICO ON HCNACTENFD.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE (ADNINGRESO.OID = @IdIngreso) AND (HCNACTENF.HCTIPACT = 67 OR HCNACTENF.HCTIPACT = 38 OR HCNACTENF.HCTIPACT = 39 OR HCNACTENF.HCTIPACT = 40 OR HCNACTENF.HCTIPACT = 41 OR HCNACTENF.HCTIPACT = 42 OR HCNACTENF.HCTIPACT = 43 OR HCNACTENF.HCTIPACT = 44 OR HCNACTENF.HCTIPACT = 45) ORDER BY HCNACTENFD.HCRHORREG">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="IdIngreso" />
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
            <td colspan="4" >
                
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

