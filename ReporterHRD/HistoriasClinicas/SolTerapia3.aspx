<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="SolTerapia.aspx.vb" Inherits="SolTerapia" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            font-size: large;
        }
        .auto-style3 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <asp:Panel runat="server" HeaderText="Pasillo" ToolTip="Tablero Urgencias" Width="100%" ID="TabPanel">

    <table style="width: 100%;">
        <tr>
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" colspan="6" class="auto-style1" > *** Solicitud Terapias ***</td>
        </tr>
        <tr>
             <td style="width: 20%; text-align: right;" >
                Fecha Inicial:
                </td>
            <td colspan="2">
                <asp:TextBox ID="TextFechaIni0" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni0_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni0" UserDateFormat="DayMonthYear" />
                <asp:CalendarExtender ID="TextFechaIni0_CalendarExtender" runat="server" TargetControlID="TextFechaIni0" />
                Fecha Final:
                <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" TargetControlID="TextFechaFin" />
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
                &nbsp;<asp:Button ID="BtnActualizar" runat="server" Text="Buscar" />
             </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Solicitud:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Solicitud" DataValueField="Codigo">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style2"><strong>Solicitudes de Terapia </strong>
                <asp:Label ID="LbPediatria" runat="server" CssClass="auto-style8"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT SIPCODIGO AS Codigo, SIPNOMBRE AS Solicitud FROM GENSERIPS WHERE (SIPCODIGO IN ('29112', '29113', '29114', '29115', '29116', '29117', '29118', '931000', '938300', '937000', '939400', '933600', '954800', '19482', '24115', '903839')) ORDER BY Solicitud"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE + ' ' + GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM AS Paciente, HCNSOLPNQX.HCSFECSOL AS 'Fecha Solicitud', HCNFOLIO.HCNUMFOL AS 'N Fol', CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNGRUPOS.HGRCODIGO FROM HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNGRUPOS.OID = HPNDEFCAM.HPNGRUPOS WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Bloque, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Sitio, GENSERIPS.SIPNOMBRE AS Solicitud, GENSERIPS.SIPCODIGO FROM ULTIMA_TERAPIA INNER JOIN HCNSOLPNQX ON HCNSOLPNQX.HCNFOLIO = ULTIMA_TERAPIA.Ult_Ter INNER JOIN ADNINGRESO ON ADNINGRESO.OID = HCNSOLPNQX.ADNINGRESO INNER JOIN GENPACIEN ON GENPACIEN.OID = ADNINGRESO.GENPACIEN INNER JOIN GENSERIPS ON GENSERIPS.OID = HCNSOLPNQX.GENSERIPS INNER JOIN HCNFOLIO ON HCNSOLPNQX.HCNFOLIO = HCNFOLIO.OID WHERE (ADNINGRESO.AINESTADO = 0) AND ((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR WHERE (SLNFACTUR = HCNSOLPNQX.OID)) IS NULL) AND ((SELECT TOP (1) SFANUMFAC FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) IS NULL) AND (HCNSOLPNQX.HCSFECSOL BETWEEN @p0 AND @p1 + ' 23:59:59') AND (GENSERIPS.SIPCODIGO = @codigo) ORDER BY 'Fecha Solicitud' DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni0" Name="p0" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="codigo" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridViewPed" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="auto-style10" style="font-size: small">
                    <AlternatingRowStyle BackColor="#fffccc" />
                    <Columns>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" ReadOnly="True" />
                        <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                        <asp:BoundField DataField="N Fol" HeaderText="N Fol" SortExpression="N Fol" />
                        <asp:BoundField DataField="Bloque" HeaderText="Bloque" ReadOnly="True" SortExpression="Bloque" />
                        <asp:BoundField DataField="Sitio" HeaderText="Sitio" ReadOnly="True" SortExpression="Sitio" />
                        <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">
                &nbsp;</td>
        </tr>
    </table>



        <asp:Label ID="Label1" runat="server" Text="Ing Diego A." Font-Size="XX-Small"></asp:Label>
        </asp:Panel>










</asp:Content>
