<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="UESI_Inf_QX.aspx.vb" Inherits="Varios_UESI_Inf_QX" UICulture="es" Culture="es-CO"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%; font-family: Tahoma; font-size: 10pt">
        <tr>
            <td style="width: 25%">
                Fecha de Inicio:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            <td style="width: 25%">
                Fecha Fin:
                <asp:TextBox ID="TextFechaFin" runat="server" Rows="10"></asp:TextBox>
                <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
            </td>
            <td style="width: 25%">
                <asp:Button ID="Button1" runat="server" 
                    Text="Generar" />
            </td>
            <td style="width: 25%">
                <asp:Label ID="LabelFechaInicio" runat="server"></asp:Label>
                &nbsp;
                <asp:Label ID="LabelFechaFin" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdHCFolio" DataSourceID="SqlDataSource1" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                            SortExpression="AINCONSEC" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="Doc Paciente" 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="SIPNOMBRE" HeaderText="Procedimiento" 
                            SortExpression="SIPNOMBRE" />
                        <asp:BoundField DataField="HCFECFOL" 
                            HeaderText="Fecha Procedimiento" SortExpression="HCFECFOL" />
                        <asp:BoundField DataField="HCCM09N19" HeaderText="Tipo" 
                            SortExpression="HCCM09N19" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT GENPACIEN.PACNUMDOC, HCNFOLIO.OID AS IdHCFolio, HCNFOLIO.HCNUMFOL, RTRIM(GENSERIPS.SIPNOMBRE) AS SIPNOMBRE, HCNFOLIO.HCFECFOL, HCMHCINQX.HCCM09N19, ADNINGRESO.AINCONSEC, HCNFOLIO.HCNTIPHIS FROM HCNTIPHIS INNER JOIN HCNFOLIO ON HCNTIPHIS.OID = HCNFOLIO.HCNTIPHIS INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNQXEPAC ON HCNFOLIO.OID = HCNQXEPAC.HCNFOLIO INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID INNER JOIN HCMHCINQX ON HCNFOLIO.OID = HCMHCINQX.HCNFOLIO WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicio AND @FechaFin) ORDER BY HCNFOLIO.HCFECFOL" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelFechaInicio" Name="FechaInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
        </tr>
    </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />
    
</asp:Content>

