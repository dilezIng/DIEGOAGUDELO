<%@ Page Title="Resumen Facturación" Language="vb" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="ResumenFacturacion.aspx.vb" Inherits="Facturacion_ResumenFacturacion" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  <script language="javascript"> 



  
function ShowModalPopup()

{

    $find("Panel1_ModalPopupExtender").show();

}

function HideModalPopup()

{

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
           <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <table style="width: 100%; font-size: 10pt; font-family: Tahoma;">
        <tr>
            <td colspan="5" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Resumen Facturación</td>
        </tr>
        <tr>
            <td style="width: 20%">
                Fecha de Inicio:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            <td style="width: 20%">
                Fecha Fin :<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
            <td style="width: 25%">
                <asp:CheckBox ID="CheckAnuladas" runat="server" Text="Anuladas" />
                &nbsp; Tipo:
                <asp:DropDownList ID="ListTipoFacts" runat="server">
                    <asp:ListItem Value="0">Factura Paciente</asp:ListItem>
                    <asp:ListItem Selected="True" Value="1">Factura Entidad</asp:ListItem>
                    <asp:ListItem Value="10">Cuenta Entidades</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:CheckBox ID="CheckFechaFiltroAnul" runat="server" 
                    Text="Filtrar por fecha Anulación" />
            </td>
            <td style="width: 25%">
                Tipo Ingreso
                <asp:DropDownList ID="ListTipIngreso" runat="server" Width="90px">
                    <asp:ListItem Value="99">Todos</asp:ListItem>
                    <asp:ListItem Value="0">Urgencias</asp:ListItem>
                    <asp:ListItem Value="1">Consulta Externa</asp:ListItem>
                    <asp:ListItem Value="2">Nacido en el Hospital</asp:ListItem>
                    <asp:ListItem Value="3">Remitido</asp:ListItem>
                    <asp:ListItem Value="4">Hospitalización de Urgencias</asp:ListItem>
                    <asp:ListItem Value="5">Hospitalización</asp:ListItem>
                    <asp:ListItem Value="10">Cirugía Ambulatoria</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 10%; font-size: 12pt; font-weight: bold; text-align: right;">
                <asp:Button ID="Button1" runat="server" Text="Actualizar" />
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #808080; width: 40%; font-size: 10pt; font-weight: normal; text-align: right;" 
                colspan="2">
                <asp:Label ID="LabelTxtBuscar" runat="server" Visible="False"></asp:Label>
                Buscar por:
                <asp:DropDownList ID="ListTipoBusqueda" runat="server">
                    <asp:ListItem Value="0">Factura</asp:ListItem>
                    <asp:ListItem Value="1">Paciente</asp:ListItem>
                </asp:DropDownList>
                &nbsp; No.&nbsp;
                <asp:TextBox ID="TextBuscar" runat="server" Width="120px"></asp:TextBox>
                &nbsp;
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" />
            </td>
            <td colspan="3" 
                style="width: 60%; font-size: 12pt; font-weight: bold; text-align: right;">
                <asp:Label ID="LabelTotRango0" runat="server" 
                    ToolTip="Total del rango seleccionado"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:DataList ID="ListaTipPlanesBeneficio" runat="server" DataKeyField="TipoPlan" 
                    DataSourceID="DataListTipPlanesBeneficio" Width="100%">
                    <AlternatingItemStyle BackColor="#F0F0F0" />
                    <ItemTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 35%; left: 100px;">
                                    <asp:Label ID="LabelNomTipoPlan" runat="server" style="font-weight: 700"></asp:Label>
                                    &nbsp;(<asp:Label ID="TipoPlanLabel" runat="server" style="font-weight: 700" 
                                        Text='<%# Eval("TipoPlan") %>' />
                                    )</td>
                                <td style="width: 15%; text-align: right;">
                                    $<asp:Label ID="LabelValpac" runat="server" style="font-weight: 700" 
                                        Text='<%# Eval("ValPac", "{0:N0}") %>' />
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    $<asp:Label ID="TotalFactsLabel" runat="server" 
                                        style="font-weight: 700; " Text='<%# Eval("TotalFacts", "{0:N0}") %>'></asp:Label>
                                    <asp:Label ID="FechaIniLabel" runat="server" Text='<%# Eval("FechaIni") %>' 
                                        Visible="False" />
                                    <asp:Label ID="FechaFinLabel" runat="server" Text='<%# Eval("FechaFin") %>' 
                                        Visible="False" />
                                    <asp:Label ID="SFADOCANULabel" runat="server" Text='<%# Eval("SFADOCANU") %>' 
                                        Visible="False" />
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    <asp:Label ID="LabelPorc" runat="server" 
                                        style="font-weight: 700; color: #006600;" />
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    <asp:LinkButton ID="LinkVerPlanBeneficio" runat="server" 
                                        CommandName="VerPlanes" >Ver Planes de Beneficio</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        
                       
                        <asp:DataList ID="DataList1" runat="server" 
                            DataSourceID="DataListPlanesBeneficio" onitemcommand="DataList1_ItemCommand" 
                            style="text-align: right" Visible="False" Width="100%" 
                            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            onitemdatabound="DataList1_ItemDataBound">
                            <AlternatingItemStyle BackColor="#F0F0F0" />
                            <ItemTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 35%; text-align: left;">
                                            &nbsp;<asp:Label ID="NomPlanLabel" runat="server" 
                                                Text='<%# Eval("NomPlan") %>' />
                                        </td>
                                        <td style="width: 10%; text-align: left;">
                                            <asp:Label ID="NomPlanLabel0" runat="server" Text='<%# Eval("GDECODIGO") %>' />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            <asp:Label ID="LabelValGrupo" runat="server" Text='<%# Eval("ValorGrupo") %>' 
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LabelIdContrato" runat="server" Text='<%# Eval("GENDETCON") %>' 
                                                Visible="False"></asp:Label>
                                            &nbsp;&nbsp; <strong>$<asp:Label ID="LabelValPac" runat="server" 
                                                style="font-weight: 700" Text='<%# Eval("ValPac", "{0:N0}") %>' />
                                            </strong>
                                        </td>
                                        <td style="width: 10%; font-weight: bold;">
                                            $<asp:Label ID="TotalFactsLabel0" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("TotalFacts", "{0:N0}") %>' />
                                        </td>
                                        <td style="width: 5%">
                                            <asp:Label ID="LabelPorcPB" runat="server" 
                                                style="font-weight: 700; color: #006600;"></asp:Label>
                                        </td>
                                        <td style="width: 30%">
                                            <asp:LinkButton ID="BtnVerCenCos" runat="server" CommandName="VerCenCos" 
                                                onclick="BtnVerCenCos_Click">Ver Centros de Costos</asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="BtnVerFacturas" runat="server" CommandName="VerFacturas">Ver Facturas</asp:LinkButton>
                                            <asp:Label ID="lblText" runat="server" />
                                            <asp:Label ID="LabelFechaIniA" runat="server" Text='<%# Eval("FechaIni") %>' 
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LabelFechaFinA" runat="server" Text='<%# Eval("FechaFin") %>' 
                                                Visible="False"></asp:Label>
                                            <asp:CheckBox ID="CheckAnuladasGrid" runat="server" 
                                                Checked='<%# Eval("SFADOCANU") %>' Visible="False" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="Panel2" runat="server" Visible="False">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="IdFactura" DataSourceID="DataGridView" 
                                         
                                        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:CommandField SelectText="Ver Detalle" ShowSelectButton="True" />
                                            <asp:BoundField DataField="SFANUMFAC" HeaderText="Número" 
                                                SortExpression="SFANUMFAC">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PACNUMDOC" HeaderText="D.I. Paciente" 
                                                SortExpression="PACNUMDOC">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="SFAFECFAC" HeaderText="Fecha" 
                                                SortExpression="SFAFECFAC">
                                            <FooterStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FechaAnulacion" HeaderText="Fecha Anulación" 
                                                SortExpression="FechaAnulacion">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ValPac" DataFormatString="${0:N0}" 
                                                HeaderText="Paciente" SortExpression="ValPac" />
                                            <asp:BoundField DataField="SFATOTFAC" DataFormatString="${0:N0}" 
                                                HeaderText="Valor" SortExpression="SFATOTFAC">
                                            <ItemStyle HorizontalAlign="Right" Font-Bold="True" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataGridView" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="LabelFechaIniA" Name="FechaInicio" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="LabelFechaFinA" Name="FechaFin" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="LabelIdContrato" Name="PlanBeneficios" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="CheckAnuladasGrid" Name="Anuladas" 
                                                PropertyName="Checked" />
                                            <asp:ControlParameter ControlID="ListTipoFacts" Name="Tipo" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ListTipIngreso" Name="ClaseIngreso" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    Total Facturas: <strong>$</strong><asp:Label ID="TotalFactsLabel1" 
                                        runat="server" style="font-weight: 700" 
                                        Text='<%# Eval("TotalFacts", "{0:N0}") %>' />
                                </asp:Panel>
                                <asp:Panel ID="Panel3" runat="server" Visible="False">
                                    <asp:GridView ID="GridCenCos" runat="server" AutoGenerateColumns="False" DataSourceID="DataGridCenCos" 
                                       
                                        onselectedindexchanged="GridCenCos_SelectedIndexChanged" Width="100%" 
                                        EmptyDataText="SIN DATOS" DataKeyNames="IdCenCos">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:CommandField SelectText="Ver Detalle" ShowSelectButton="True" />
                                            <asp:BoundField DataField="CCCODIGO" HeaderText="Código" 
                                                SortExpression="CCCODIGO">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CCNOMBRE" HeaderText="Centro de Costo" 
                                                SortExpression="CCNOMBRE">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" 
                                                DataFormatString="${0:N0}" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataGridCenCos" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                                        SelectCommand="">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="LabelFechaIniA" Name="FechaInicio" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="LabelFechaFinA" Name="FechaFin" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="LabelIdContrato" Name="PlanBeneficios" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="CheckAnuladasGrid" Name="Anuladas" 
                                                PropertyName="Checked" />
                                            <asp:ControlParameter ControlID="ListTipoFacts" Name="Tipo" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ListTipIngreso" Name="ClaseIngreso" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </asp:Panel>
                                
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="DataListPlanesBeneficio" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="CheckAnuladas" Name="Anuladas" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="ListTipoFacts" Name="Tipo" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TipoPlanLabel" Name="TipoPlan" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="TotalFactsLabel" Name="ValGrupo" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="ListTipIngreso" Name="ClaseIngreso" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="DataListTipPlanesBeneficio" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    
                    SelectCommand="SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) AS TipoPlan, SUM(SLNFACTUR.SFAVALPAC) AS ValPac FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY SLNFACTUR.SFADOCANU, CONVERT (char(3), GENDETCON.GDECODIGO) HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TipoPlan">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="CheckAnuladas" Name="Anuladas" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="ListTipoFacts" Name="Tipo" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListTipIngreso" Name="ClaseIngreso" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                
                <asp:Label ID="LblIdFactSelec" runat="server" Visible="False"></asp:Label>
                
                <asp:Label ID="LblTotRangoNum" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: right; font-size: 12pt; font-weight: bold">
                <asp:Label ID="LabelTotRango" runat="server" 
                    ToolTip="Total del rango seleccionado"></asp:Label>
            
                </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    ScrollBars="Vertical" Width="1100px" Height="700px">
                    <asp:Panel ID="PanelInfoAnuladas" runat="server" 
                        GroupingText="Detalle de la Anulación" Width="98%">
                        <asp:Label ID="LabelDetAnulacion" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="LabelUsAnulo" runat="server"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoFact" runat="server" GroupingText="Resumen Facturas" 
                        Width="98%">
                        <asp:DataList ID="ListBuscFactura" runat="server" DataKeyField="IdFactura" 
                            DataSourceID="DataListBuscFactura" Width="100%">
                            <AlternatingItemStyle BackColor="#F0F0F0" BorderColor="Blue" 
                                BorderStyle="Outset" BorderWidth="1px" />
                            <ItemTemplate>
                                <table style="width: 880px">
                                    <tr>
                                        <td style="border: 1px solid #006600; text-align: center;" colspan="2">
                                            <asp:Label ID="SFANUMFACLabel" runat="server" Text='<%# Eval("SFANUMFAC") %>' 
                                                style="font-size: 12pt; font-weight: 700" />
                                        </td>
                                        <td style="width: 10%; font-size: 8pt; text-align: center;">
                                            <asp:Label ID="FechaFacturaLabel" runat="server" 
                                                Text='<%# Eval("SFAFECFAC", "{0:d}") %>' />
                                        </td>
                                        <td colspan="3" style="width: 30%; text-align: center;">
                                            <asp:Label ID="LabelNomPaciente" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("NomPaciente") %>'></asp:Label>
                                        </td>
                                        <td colspan="2" style="width: 20%">
                                            <asp:Label ID="LabelTipoDocPac" runat="server" Text='<%# Eval("TipoDocPac") %>'></asp:Label>
                                            <asp:Label ID="LabelNumDocPac" runat="server" Text='<%# Eval("NumDocPac") %>'></asp:Label>
                                        </td>
                                        <td colspan="2" style="width: 20%">
                                            <asp:Label ID="IdFacturaLabel" runat="server" Text='<%# Eval("IdFactura") %>' 
                                                Visible="False" />
                                            <asp:Label ID="LabelEntidadPaciente" runat="server" 
                                                Text='<%# Eval("PlanBenefPaciente") %>'></asp:Label>
                                        </td>
                                        
                                    </tr>
                                    <tr style="border-top-style: solid; border-top-width: 1px; border-top-color: #808080;">
                                        <td style="width: 10%; text-align: center; font-size: 8pt; border-top-style: solid; border-top-width: 1px; border-top-color: #808080;">
                                            Total Entidad</td>
                                        <td style="width: 10%; text-align: center; font-size: 8pt; width: 10%; border-top-style: solid; border-top-width: 1px; border-top-color: #808080;">
                                            Total Paciente 5</td>
                                        <td style="width: 10%; text-align: center; font-size: 8pt; border-top-style: solid; border-top-width: 1px; border-top-color: #808080;">
                                            Fecha Rad.</td>
                                        <td style="width: 10%; border-top-style: solid; border-top-width: 1px; border-top-color: #808080; text-align: center; font-size: 8pt;">
                                            Valor Radicado</td>
                                        <td style="width: 10%; border-top-style: solid; border-top-width: 1px; border-top-color: #808080; text-align: center; font-size: 8pt;">
                                            Saldo</td>
                                            <td style="width: 10%; border-top-style: solid; border-top-width: 1px; 
                                            border-top-color: #808080; text-align: center; font-size: 8pt;" >
                                                Estado</td>
                                        <td style="width: 10%; border-top-style: solid; border-top-width: 1px; border-top-color: #808080; text-align: center; font-size: 8pt;">
                                            Val. Servicio</td>
                                        <td style="width: 10%; border-top-style: solid; border-top-width: 1px; border-top-color: #808080; text-align: center; font-size: 8pt;">
                                            Val. Objetado</td>
                                        <td style="width: 10%; border-top-style: solid; border-top-width: 1px; border-top-color: #808080; text-align: center; font-size: 8pt;">
                                            Val. Aceptado</td>
                                        
                                        
                                       <td style="width: 10%; border-top-style: solid; border-top-width: 1px; 
                                            border-top-color: #808080;" >
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #0000CC; width: 10%; text-align: right;">
                                            $<asp:Label ID="SFATOTFACLabel" runat="server" style="font-weight: 700; font-size: 12pt;" 
                                                Text='<%# Eval("ValorEntidad", "{0:N0}") %>' />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            $<asp:Label ID="SFAVALPACLabel" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("ValorPaciente", "{0:N0}") %>' />
                                        </td>
                                        <td style="width: 10%; text-align: center; font-size: 8pt;">
                                            <asp:Label ID="FechaRadicacionLabel" runat="server" style="font-size: 8pt" />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            $<asp:Label ID="ValorRadicadoLabel" runat="server" 
                                                style="font-size: 8pt; font-weight: 700" />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            $<asp:Label ID="SaldoLabel" runat="server" 
                                                style="font-size: 8pt; font-weight: 700" />
                                        </td>
                                        <td style="width: 10%; text-align: center;">
                                            <asp:Label ID="EstadoLabel" runat="server" 
                                                style="font-size: 8pt; font-weight: 700" />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            $<asp:Label ID="ValServLabel" runat="server" 
                                                style="font-size: 8pt; font-weight: 700" />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            $<asp:Label ID="ValObjetadoLabel" runat="server" 
                                                style="font-size: 8pt; font-weight: 700" />
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            $<asp:Label ID="ValAceptadoLabel" runat="server" 
                                                style="font-size: 8pt; font-weight: 700" />
                                        </td>
                                        
                                        <td style="width: 10%">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; text-align: right;">
                                            Ingreso por
                                            <asp:Label ID="LabelIngresoPor" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="LabelIdIngresoPor" runat="server" 
                                                Text='<%# Eval("AINURGCON") %>' Visible="False"></asp:Label>
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 10%; text-align: center; font-size: 8pt;">
                                            &nbsp;</td>
                                        <td style="width: 10%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 10%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 10%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 10%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 10%; text-align: right;">
                                            &nbsp;</td>
                                        <td style="width: 10%">
                                            &nbsp;</td>
                                        <td style="width: 10%">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="LabelDetAnulacion0" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="LabelUsAnulo1" runat="server"></asp:Label>
                    </asp:Panel>
                    <asp:GridView ID="GridDetalle" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="OID" DataSourceID="DataGridDetalle" 
                        Width="100%" PageSize="15">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="TipoPrestacion" HeaderText="Tipo" ReadOnly="True" 
                                SortExpression="TipoPrestacion" />
                            <asp:BoundField DataField="CodPresPrincipal" HeaderText="Cod" ReadOnly="True" 
                                SortExpression="CodPresPrincipal" />
                            <asp:BoundField DataField="FechaProced" HeaderText="Fecha Proced" 
                                ReadOnly="True" SortExpression="FechaProced" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="DescrpProced" HeaderText="Descripción" 
                                ReadOnly="True" SortExpression="DescrpProced" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                                SortExpression="Cantidad" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CostoProducto" DataFormatString="{0:0.00}" 
                                HeaderText="Costo Unit" SortExpression="CostoProducto">
                            <ItemStyle Font-Size="8pt" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ValorUnitario" HeaderText="V Unit" ReadOnly="True" 
                                SortExpression="ValorUnitario" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ValCopago" HeaderText="Copago" ReadOnly="True" 
                                SortExpression="ValCopago" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ValorTotServicio" HeaderText="Total Serv" 
                                ReadOnly="True" SortExpression="ValorTotServicio" >
                            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataGridDetalle" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        
                        
                        
                        SelectCommand="SELECT CASE WHEN IPRTIPPRO = 1 THEN 'I' ELSE CASE WHEN IPRTIPPRO = 2 THEN 'M' ELSE 'P' END END AS TipoPrestacion, CASE WHEN SIPCODCUP IS NULL THEN IPRCODALT ELSE SIPCODCUP END AS CodPresPrincipal, RTRIM(SLNSERPRO.SERDESSER) AS DescrpProced, SLNSERPRO.SERFECSER AS FechaProced, CONVERT (decimal(11 , 0), SLNSERPRO.SERCANTID) AS Cantidad, CONVERT (decimal(11 , 0), SLNSERPRO.SERVALPRO) AS ValorUnitario, '0' AS ValorCompartido, CASE WHEN SLNSERPRO.SERCOPCTA = 2 THEN CONVERT (decimal(11 , 0) , SLNSERPRO.SERVALPAC) ELSE 0 END AS ValModeradora, CASE WHEN SLNSERPRO.SERCOPCTA = 1 THEN ROUND((CONVERT (decimal(11 , 0) , SLNSERPRO.SERVALPAC * SLNSERPRO.SERCANTID)) , 0 , 1) ELSE 0 END AS ValCopago, CONVERT (decimal(11 , 0), SLNSERPRO.SERVALENT * SLNSERPRO.SERCANTID) AS ValorTotServicio, SLNFACTUR.OID, INNMSUMPA.ISMCOSPRO AS CostoProducto FROM INNCSUMPA INNER JOIN INNMSUMPA ON INNCSUMPA.OID = INNMSUMPA.INNCSUMPA RIGHT OUTER JOIN INNPRODUC INNER JOIN SLNPROHOJ ON INNPRODUC.OID = SLNPROHOJ.INNPRODUC1 ON INNMSUMPA.INNPRODUC = INNPRODUC.OID RIGHT OUTER JOIN SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNORDSER ON SLNSERPRO.SLNORDSER1 = SLNORDSER.OID ON INNCSUMPA.SLNORDSER = SLNORDSER.OID AND SLNPROHOJ.OID = SLNSERPRO.OID LEFT OUTER JOIN SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON SLNSERPRO.OID = SLNSERHOJ.OID WHERE (SLNFACTUR.OID = @IdFactura) ORDER BY DescrpProced">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="LblIdFactSelec" Name="IdFactura" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="DataListBuscFactura" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        
                        SelectCommand="SELECT SLNFACTUR.OID AS IdFactura, SLNFACTUR.SFANUMFAC, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, GENCONTRA.GECNOMENT AS PlanBenefPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, SLNFACTUR.SFAFECFAC, ADNINGRESO.AINURGCON FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (SLNFACTUR.SFANUMFAC = @NumFactura)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="LabelTxtBuscar" Name="NumFactura" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                </asp:Panel>
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
                <asp:Panel ID="Panel4" runat="server">
                    <br />
                    <br />
                    <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="DataListInfEPS" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="TotalFacts" HeaderText="TotalFacts" ReadOnly="True" 
                                SortExpression="TotalFacts" />
                            <asp:BoundField DataField="FechaIni" HeaderText="FechaIni" ReadOnly="True" 
                                SortExpression="FechaIni" />
                            <asp:BoundField DataField="FechaFin" HeaderText="FechaFin" ReadOnly="True" 
                                SortExpression="FechaFin" />
                            <asp:CheckBoxField DataField="SFADOCANU" HeaderText="SFADOCANU" 
                                SortExpression="SFADOCANU" />
                            <asp:BoundField DataField="TipoPlan" HeaderText="TipoPlan" 
                                SortExpression="TipoPlan" />
                            <asp:BoundField DataField="GDENOMBRE" HeaderText="GDENOMBRE" 
                                SortExpression="GDENOMBRE" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataListInfEPS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT SUM(SLNFACTUR.SFATOTFAC) AS TotalFacts, @FechaInicio AS FechaIni, @FechaFin AS FechaFin, SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO AS TipoPlan, GENDETCON.GDENOMBRE FROM SLNFACTUR INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFATIPDOC = @Tipo) AND (ADNINGRESO.AINURGCON = COALESCE (NULLIF (@ClaseIngreso, 99), ADNINGRESO.AINURGCON)) GROUP BY SLNFACTUR.SFADOCANU, GENDETCON.GDECODIGO, GENDETCON.GDENOMBRE HAVING (SLNFACTUR.SFADOCANU = @Anuladas) ORDER BY TotalFacts DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="CheckAnuladas" Name="Anuladas" 
                                PropertyName="Checked" />
                            <asp:ControlParameter ControlID="ListTipoFacts" Name="Tipo" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ListTipIngreso" Name="ClaseIngreso" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

