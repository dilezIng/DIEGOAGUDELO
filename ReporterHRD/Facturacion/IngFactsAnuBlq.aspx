<%@ Page Title="Facturas o Ingresos Anulados o Bloqueados" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="IngFactsAnuBlq.aspx.vb" Inherits="PaginaBase" %>

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
                
                FACTURAS O INGRESOS ANULADOS O BLOQUEADOS</td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                <asp:RadioButtonList ID="ListIngsFacts" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="0">Facturas</asp:ListItem>
                    <asp:ListItem Value="1">Ingresos</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%; font-size: 9pt;" >
                <asp:RadioButtonList ID="ListAnuBloq" runat="server" 
                    RepeatDirection="Horizontal" Visible="False">
                    <asp:ListItem Value="3" Selected="True">Bloqueados</asp:ListItem>
                    <asp:ListItem Value="2">Anulados</asp:ListItem>
                </asp:RadioButtonList>
                <asp:CheckBox ID="CheckFactAnu" runat="server" Checked="True" Text="Anulados" />
            </td>
            <td style="width: 20%" >
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
            <td style="width: 30%; text-align: right;" >
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
&nbsp;<asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" />
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
                <asp:GridView ID="GridFacturas" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdUsuario,NomUsFacturo" DataSourceID="DataGridFacturas" 
                    Visible="False">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="UsFacturo" HeaderText="Usuario Facturo" 
                            SortExpression="UsFacturo" />
                        <asp:BoundField DataField="NomUsFacturo" HeaderText="Nombre Usuario Facturo" 
                            SortExpression="NomUsFacturo" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                            SortExpression="Cantidad" />
                        <asp:CommandField SelectText="Ver Resumen" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridFacturas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT GENUSUARIO.USUNOMBRE AS UsFacturo, GENUSUARIO.USUDESCRI AS NomUsFacturo, COUNT(GENUSUARIO.OID) AS Cantidad, GENUSUARIO.OID AS IdUsuario FROM GENUSUARIO INNER JOIN SLNFACTUR ON GENUSUARIO.OID = SLNFACTUR.GENUSUARIO1 WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicial AND @FechaFinal) AND (SLNFACTUR.SFATIPDOC &lt;&gt; 5) GROUP BY GENUSUARIO.USUNOMBRE, GENUSUARIO.USUDESCRI, GENUSUARIO.OID ORDER BY Cantidad DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridIngresosBloq" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdIngreso" DataSourceID="DataGridIngresosBloq" 
                    Visible="False" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="NumIngreso" HeaderText="Ingreso" 
                            SortExpression="NumIngreso" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="D.I. Paciente" 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="Paciente" ReadOnly="True" 
                            SortExpression="NomPaciente" />
                        <asp:BoundField DataField="FechaIngreso" HeaderText="Fecha Ingreso" 
                            SortExpression="FechaIngreso" />
                        <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" 
                            SortExpression="Contrato">
                        <ItemStyle Font-Size="9pt" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridIngresosBloq" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT ADNINGRESO.OID AS IdIngreso, ADNINGRESO.AINCONSEC AS NumIngreso, GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE + ' ' + GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM AS NomPaciente, ADNINGRESO.AINFECING AS FechaIngreso, GENPACIEN.PACNUMDOC, GENDETCON.GDECODIGO + N' - ' + GENDETCON.GDENOMBRE AS Contrato FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (ADNINGRESO.AINESTADO = @Estado) AND (ADNINGRESO.AINFECING BETWEEN @FechaInicial AND @FechaFinal)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListAnuBloq" Name="Estado" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
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
                    Height="600px" ScrollBars="Vertical" Width="900px" GroupingText="123">
                    
                    <table style="width: 100%; font-family: tahoma;">
                        
                        </tr>
                            <td style="width: 90%; font-size: 10pt;">
                                <asp:GridView ID="GridResFactAnu" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="IdIngreso" DataSourceID="DataGridResFactAnu" PageSize="20">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="SFANUMFAC" HeaderText="No. Fact" 
                                            SortExpression="SFANUMFAC" />
                                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                                            SortExpression="AINCONSEC" />
                                        <asp:BoundField DataField="SFAFECFAC" HeaderText="Fecha Factura" 
                                            SortExpression="SFAFECFAC" />
                                        <asp:BoundField DataField="SFAFECANU" HeaderText="Fecha Anulación" 
                                            SortExpression="SFAFECANU" />
                                        <asp:BoundField DataField="SFATOTFAC" DataFormatString="${0:0}" 
                                            HeaderText="Total" SortExpression="SFATOTFAC">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFAVALPAC" DataFormatString="${0:0}" 
                                            HeaderText="Valor Paciente" SortExpression="SFAVALPAC">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GDENOMBRE" HeaderText="Entidad" 
                                            SortExpression="GDENOMBRE" />
                                        <asp:BoundField DataField="PACNUMDOC" HeaderText="DI. Paciente" 
                                            SortExpression="PACNUMDOC" />
                                        <asp:BoundField DataField="SFAJUSANU" HeaderText="Justificación" 
                                            SortExpression="SFAJUSANU" />
                                        <asp:CommandField SelectText="Ver Traza" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DataGridResFactAnu" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                    SelectCommand="SELECT SLNFACTUR.SFAFECANU, SLNFACTUR.GENUSUARIO1 AS IdUsFact, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAVALPAC, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINCONSEC, GENDETCON.GDENOMBRE, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAJUSANU, SLNFACTUR.SFANUMFAC, ADNINGRESO.OID AS IdIngreso, SLNFACTUR.SFADOCANU FROM GENDETCON INNER JOIN ADNINGRESO ON GENDETCON.OID = ADNINGRESO.GENDETCON INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO WHERE (SLNFACTUR.SFAFECANU BETWEEN @FechaInicial AND @FechaFinal) AND (SLNFACTUR.GENUSUARIO1 = @IdUsuario) ORDER BY SLNFACTUR.SFAFECANU">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="GridFacturas" Name="IdUsuario" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="CheckFactAnu" Name="Anulada" 
                                            PropertyName="Checked" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridTraza" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" 
                                    DataKeyNames="IdIngreso" DataSourceID="DataGridTraza" PageSize="20" 
                                    style="font-size: 9pt" Visible="False">
                                    <AlternatingRowStyle BackColor="#F0F0F0" />
                                    <Columns>
                                        <asp:BoundField DataField="SFANUMFAC" HeaderText="No. Fact" 
                                            SortExpression="SFANUMFAC" />
                                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                                            SortExpression="AINCONSEC" />
                                        <asp:BoundField DataField="UsFacturo" HeaderText="Us Facturo" 
                                            SortExpression="UsFacturo">
                                        <ItemStyle Font-Size="8pt" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFAFECFAC" HeaderText="Fecha Factura" 
                                            SortExpression="SFAFECFAC" />
                                        <asp:BoundField DataField="SFAFECANU" HeaderText="Fecha Anulación" 
                                            SortExpression="SFAFECANU">
                                        <ItemStyle Font-Bold="True" ForeColor="#CC0000" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFATOTFAC" DataFormatString="${0:0}" 
                                            HeaderText="Total" SortExpression="SFATOTFAC">
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SFAVALPAC" DataFormatString="${0:0}" 
                                            HeaderText="Valor Paciente" SortExpression="SFAVALPAC">
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GDENOMBRE" HeaderText="Entidad" 
                                            SortExpression="GDENOMBRE" />
                                        <asp:BoundField DataField="PACNUMDOC" HeaderText="DI. Paciente" 
                                            SortExpression="PACNUMDOC" />
                                        <asp:BoundField DataField="SFAJUSANU" HeaderText="Motivo Anulación" 
                                            SortExpression="SFAJUSANU" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DataGridTraza" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                    SelectCommand="SELECT SLNFACTUR.SFAFECANU, SLNFACTUR.GENUSUARIO2 AS IdUsAnu, SLNFACTUR.SFATOTFAC, SLNFACTUR.SFAVALPAC, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINCONSEC, GENDETCON.GDENOMBRE, GENPACIEN.PACNUMDOC, SLNFACTUR.SFAJUSANU, SLNFACTUR.SFANUMFAC, ADNINGRESO.OID AS IdIngreso, GENUSUARIO.USUDESCRI AS UsFacturo FROM GENDETCON INNER JOIN ADNINGRESO ON GENDETCON.OID = ADNINGRESO.GENDETCON INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN GENUSUARIO ON SLNFACTUR.GENUSUARIO1 = GENUSUARIO.OID LEFT OUTER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.OID = @IdIngreso) ORDER BY SLNFACTUR.SFAFECANU">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridResFactAnu" Name="IdIngreso" 
                                            PropertyName="SelectedValue" />
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
                    </table>
                    
                </asp:Panel>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                
                &nbsp;</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 20%" >
                &nbsp;</td>
            <td style="width: 30%" >
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

