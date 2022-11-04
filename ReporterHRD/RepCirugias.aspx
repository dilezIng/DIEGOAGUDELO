<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="RepCirugias.aspx.vb" Inherits="RepCirugias" %>



<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

      <table style="width: 100%; font-family: tahoma; font-size: 12px;">
                <tr>
            <td colspan="4" 
                
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('Images/Fondo01.jpg');">
                Informe Quirúrgico
                <asp:Label ID="LabelAño" runat="server"></asp:Label>

            </td>
        </tr>

        <tr>
            <td style="width: 25%">
                Seleccione el rango:
                <asp:DropDownList ID="ListMeses" runat="server" AutoPostBack="True" 
                    DataSourceID="DataListMeses" DataTextField="Mes" DataValueField="IdMes">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataListMeses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT CONVERT (char(7), HCNFOLIO.HCFECFOL, 102) AS IdMes, CASE WHEN (CONVERT (char(2) , HCFECFOL , 101) = '01') THEN 'Enero ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '02') THEN 'Febrero ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '03') THEN 'Marzo ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '04') THEN 'Abril ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '05') THEN 'Mayo ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '06') THEN 'Junio ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '07') THEN 'Julio ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '08') THEN 'Agosto ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '09') THEN 'Septiembre ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '10') THEN 'Octubre ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '11') THEN 'Noviembre ' + CONVERT (char(4) , HCFECFOL , 111) ELSE ('Diciembre ' + CONVERT (char(4) , HCFECFOL , 111)) END AS Mes FROM HCNQXEPAC INNER JOIN HCNFOLIO ON HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID ORDER BY IdMes DESC" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                </asp:SqlDataSource>
            </td>


            <td style="width: 50%" colspan="2">
                Buscar:
                <asp:TextBox ID="TextQx" runat="server" Width="90%" AutoPostBack="True"></asp:TextBox>
                <asp:AutoCompleteExtender ID="TextQx_AutoCompleteExtender" runat="server" 
                    ServiceMethod="BusqCirugia" 
                    TargetControlID="TextQx">
                </asp:AutoCompleteExtender>
            </td>
            <td style="width: 25%">
                <asp:Label ID="LblIdQx" runat="server" Font-Bold="True" ForeColor="Red" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
              <tr>
            <td style="width: 25%">
                Fecha de Inicio:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="70px"></asp:TextBox>
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
                <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="70px"></asp:TextBox>
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
            <td colspan="4" style="text-align: center; width: 100%">
                <asp:Label ID="LblTipoRes" runat="server" 
                    style="font-weight: 700; font-size: 15px"></asp:Label>
                
            </td>
        </tr> 
                <tr>
                    <td colspan="4" style="text-align: center; width: 100%">
                        <br />
                        <asp:DataList ID="ListAreasServicio" runat="server" 
                            DataSourceID="DataListAreasServicio">
                            <ItemTemplate>
                                SFANUMFAC:
                                <asp:Label ID="SFANUMFACLabel" runat="server" Text='<%# Eval("SFANUMFAC") %>' />
                                <br />
                                HCFECFOL:
                                <asp:Label ID="HCFECFOLLabel" runat="server" Text='<%# Eval("HCFECFOL") %>' />
                                <br />
                                PACNUMDOC:
                                <asp:Label ID="PACNUMDOCLabel" runat="server" Text='<%# Eval("PACNUMDOC") %>' />
                                <br />
                                Procedimiento:
                                <asp:Label ID="ProcedimientoLabel" runat="server" 
                                    Text='<%# Eval("Procedimiento") %>' />
                                <br />
                                HCCM09N19:
                                <asp:Label ID="HCCM09N19Label" runat="server" Text='<%# Eval("HCCM09N19") %>' />
                                <br />
                                ValorProcedimiento:
                                <asp:Label ID="ValorProcedimientoLabel" runat="server" 
                                    Text='<%# Eval("ValorProcedimiento") %>' />
                                <br />
                                NomServicio:
                                <asp:Label ID="NomServicioLabel" runat="server" 
                                    Text='<%# Eval("NomServicio") %>' />
                                <br />
                                ValorServicio:
                                <asp:Label ID="ValorServicioLabel" runat="server" 
                                    Text='<%# Eval("ValorServicio") %>' />
                                <br />
                                SERTIPCAP:
                                <asp:Label ID="SERTIPCAPLabel" runat="server" Text='<%# Eval("SERTIPCAP") %>' />
                                <br />
                                GENESPECI:
                                <asp:Label ID="GENESPECILabel" runat="server" Text='<%# Eval("GENESPECI") %>' />
                                <br />
                                GEEDESCRI:
                                <asp:Label ID="GEEDESCRILabel" runat="server" Text='<%# Eval("GEEDESCRI") %>' />
                                <br />
                                GEECODIGO:
                                <asp:Label ID="GEECODIGOLabel" runat="server" Text='<%# Eval("GEECODIGO") %>' />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="DataListAreasServicio" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                            SelectCommand="SELECT SLNFACTUR.SFANUMFAC, HCNFOLIO.HCFECFOL, GENPACIEN.PACNUMDOC, RTRIM(GENSERIPS.SIPNOMBRE) AS Procedimiento, HCMHCINQX.HCCM09N19, SLNSERPRO.SERVALPRO AS ValorProcedimiento, RTRIM(GENMANSER.SMSNOMSEE) AS NomServicio, SLNPAQHOJ.SPHTOTENT AS ValorServicio, SLNSERPRO.SERTIPCAP, HCNFOLIO.GENESPECI, GENESPECI.GEEDESCRI, GENESPECI.GEECODIGO FROM HCNTIPHIS INNER JOIN HCNFOLIO ON HCNTIPHIS.OID = HCNFOLIO.HCNTIPHIS INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNQXEPAC ON HCNFOLIO.OID = HCNQXEPAC.HCNFOLIO INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID INNER JOIN HCMHCINQX ON HCNFOLIO.OID = HCMHCINQX.HCNFOLIO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPLACUB ON SLNPAQHOJ.GENPLACUB = GENPLACUB.OID INNER JOIN GENMANSER ON GENPLACUB.GENMANSER1 = GENMANSER.OID INNER JOIN GENGRUQUI ON GENMANSER.GENGRUQUI1 = GENGRUQUI.OID INNER JOIN GENESPECI ON HCNFOLIO.GENESPECI = GENESPECI.OID WHERE (SLNSERPRO.SERTIPCAP &lt;&gt; 1) AND (HCNFOLIO.HCFECFOL BETWEEN @FechaInicio AND @FechaFin) ORDER BY SLNFACTUR.SFANUMFAC, HCNFOLIO.HCFECFOL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="LabelFechaInicio" Name="FechaInicio" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 50%; vertical-align: top;">
                        <asp:GridView ID="GridResultados" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" DataSourceID="DataGridResultados">
                            <AlternatingRowStyle BackColor="#E4E4E4" />
                            <Columns>
                                <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                    SortExpression="Cant" />
                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                                    SortExpression="Codigo" />
                                <asp:BoundField DataField="Procedimiento" HeaderText="Procedimiento" SortExpression="Procedimiento" />
                                <asp:BoundField DataField="GrupoQX" HeaderText="GrupoQX" SortExpression="GrupoQX" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="DataGridResultados" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                            SelectCommand="SELECT COUNT(GENSERIPS.SIPNOMBRE) AS Cant, GENSERIPS.SIPCODIGO AS Codigo, GENSERIPS.SIPNOMBRE AS Procedimiento, GENGRUQUI.SGQCODIGO AS GrupoQX FROM HCNQXEPAC INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID INNER JOIN HCNFOLIO ON HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENMANSER ON GENSERIPS.OID = GENMANSER.GENSERIPS1 INNER JOIN GENGRUQUI ON GENMANSER.GENGRUQUI1 = GENGRUQUI.OID GROUP BY CONVERT (char(7), HCNFOLIO.HCFECFOL, 102), GENSERIPS.SIPNOMBRE, GENGRUQUI.SGQCODIGO, GENSERIPS.SIPCODIGO HAVING (CONVERT (char(7), HCNFOLIO.HCFECFOL, 102) = @IdMes) ORDER BY Cant DESC, Procedimiento">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridResultMeses" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" DataSourceID="DataGridResultMeses" Visible="False">
                            <AlternatingRowStyle BackColor="#E4E4E4" />
                            <Columns>
                                <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                    SortExpression="Cant" />
                                <asp:BoundField DataField="Mes" HeaderText="Mes" ReadOnly="True" 
                                    SortExpression="Mes" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="DataGridResultMeses" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                            SelectCommand="SELECT COUNT(HCNQXEPAC.GENSERIPS) AS Cant, CASE WHEN (CONVERT (char(2) , HCFECFOL , 101) = '01') THEN 'Enero ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '02') THEN 'Febrero ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '03') THEN 'Marzo ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '04') THEN 'Abril ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '05') THEN 'Mayo ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '06') THEN 'Junio ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '07') THEN 'Julio ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '08') THEN 'Agosto ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '09') THEN 'Septiembre ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '10') THEN 'Octubre ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '11') THEN 'Noviembre ' + CONVERT (char(4) , HCFECFOL , 111) ELSE ('Diciembre ' + CONVERT (char(4) , HCFECFOL , 111)) END AS Mes, CONVERT (char(7), HCNFOLIO.HCFECFOL, 102) AS Expr1 FROM HCNQXEPAC INNER JOIN HCNFOLIO ON HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID WHERE (HCNQXEPAC.GENSERIPS = @IdRips) GROUP BY CASE WHEN (CONVERT (char(2) , HCFECFOL , 101) = '01') THEN 'Enero ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '02') THEN 'Febrero ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '03') THEN 'Marzo ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '04') THEN 'Abril ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '05') THEN 'Mayo ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '06') THEN 'Junio ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '07') THEN 'Julio ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '08') THEN 'Agosto ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '09') THEN 'Septiembre ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '10') THEN 'Octubre ' + CONVERT (char(4) , HCFECFOL , 111) WHEN (CONVERT (char(2) , HCFECFOL , 101) = '11') THEN 'Noviembre ' + CONVERT (char(4) , HCFECFOL , 111) ELSE ('Diciembre ' + CONVERT (char(4) , HCFECFOL , 111)) END, CONVERT (char(7), HCNFOLIO.HCFECFOL, 102) ORDER BY CONVERT (char(7), HCNFOLIO.HCFECFOL, 102) DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="LblIdQx" Name="IdRips" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td colspan="2" style="width: 50%; text-align: center; vertical-align: top;">
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="DataGridResultMeses" 
                            Width="500px" BorderlineColor="Black" BorderlineDashStyle="Solid" 
                            Visible="False">
                            <Series>
                                <asp:Series ChartType="Line" Name="Series1" XValueMember="Expr1" 
                                    YValueMembers="Cant">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
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
</asp:Content>

