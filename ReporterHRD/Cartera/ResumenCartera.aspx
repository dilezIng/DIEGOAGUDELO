<%@ Page Title="Resumen Cartera - Objeciones" Language="vb" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="ResumenCartera.aspx.vb" Inherits="Facturacion_ResumenFacturacion" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 

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
    <table style="width: 100%; font-size: 10pt; font-family: Tahoma;">
        <tr>
            <td colspan="5" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Resumen Cartera - Objeciones</td>
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
                <asp:CheckBox ID="CheckAnuladas" runat="server" Text="Anuladas" 
                    Enabled="False" />
                &nbsp; Tipo:
                <asp:DropDownList ID="ListTipoFacts" runat="server" Enabled="False">
                    <asp:ListItem Value="0">Factura Paciente</asp:ListItem>
                    <asp:ListItem Selected="True" Value="1">Factura Entidad</asp:ListItem>
                    <asp:ListItem Value="10">Cuenta Entidades</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 25%">
                Tipo Ingreso
                <asp:DropDownList ID="ListTipIngreso" runat="server" Width="90px" 
                    Enabled="False">
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
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 75%; font-size: 12pt; font-weight: bold; text-align: right;" 
                colspan="4">
                <asp:Label ID="LabelTotRango0" runat="server" 
                    ToolTip="Total del rango seleccionado"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:DataList ID="ListObjeciones" runat="server" 
                    DataSourceID="DataListObjeciones" Width="1009px">
                    <AlternatingItemStyle BackColor="#F0F0F0" />
                    <ItemTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 18%">
                                    &nbsp;</td>
                                <td style="width: 19%; text-align: center;">
                                    Total Facturado</td>
                                <td style="width: 16%; text-align: center;">
                                    Valor del Servicio</td>
                                <td style="width: 16%; text-align: center;">
                                    Valor Objetado</td>
                                
                                <td style="width: 16%; text-align: center;">
                                    Valor Aceptado</td>
                                <td style="width: 15%; text-align: center;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 18%">
                                    <asp:Label ID="LabelNomEstado" runat="server" 
                                        style="font-weight: 700; font-size: 12pt; color: #0000FF" 
                                        Text='<%# Eval("Estado") %>'></asp:Label>
                                </td>
                                <td style="width: 19%; text-align: right;">
                                    $<asp:Label ID="TotalFacturadoLabel" runat="server" style="font-weight: 700" />
                                </td>
                                <td style="width: 16%; text-align: right;">
                                    $<asp:Label ID="ValorServicioLabel" runat="server" style="font-weight: 700" 
                                        Text='<%# Eval("ValorServicio", "{0:N0}") %>' />
                                </td>
                                <td style="width: 16%; text-align: right;">
                                    &nbsp;$<asp:Label ID="ValorObjetadoLabel" runat="server" style="font-weight: 700" 
                                        Text='<%# Eval("ValorObjetado", "{0:N0}") %>' />
                                </td>
                                <td style="width: 16%; text-align: right;">
                                    $<asp:Label ID="ValorAceptadoLabel" runat="server" style="font-weight: 700" 
                                        Text='<%# Eval("ValorAceptado", "{0:N0}") %>' />
                                    <br />
                                </td>
                                <td style="width: 15%; text-align: center;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="TiposContrato">Tipos de Contrato</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="CXCESTCARLabel" runat="server" Text='<%# Eval("IdEstado") %>' />
                        <asp:DataList ID="ListPlanBeneficio" runat="server" 
                            DataSourceID="DataListPlanBeneficio" Visible="False" Width="100%" 
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                            onitemdatabound="ListPlanBeneficio_ItemDataBound" 
                            onitemcommand="ListPlanBeneficio_ItemCommand">
                            <ItemTemplate >
                                <table style="width: 1000px">
                                    <tr>
                                        <td style="width: 20%">
                                            &nbsp;<asp:Label ID="NomContratoLabel" runat="server" 
                                                style="font-weight: 700" />
                                            <asp:Label ID="CodContratoLabel" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("CodContrato") %>' />
                                        </td>
                                        <td style="width: 20%; text-align: right;">
                                            $<asp:Label ID="ValorServicioLabel" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("ValorServicio", "{0:N0}") %>' />
                                            <br />
                                        </td>
                                        <td style="width: 20%; text-align: right;">
                                            $<asp:Label ID="ValorObjetadoLabel" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("ValorObjetado", "{0:N0}") %>' />
                                        </td>
                                        <td style="width: 20%; text-align: right;">
                                            $<asp:Label ID="ValorAceptadoLabel" runat="server" style="font-weight: 700" 
                                                Text='<%# Eval("ValorAceptado", "{0:N0}") %>' />
                                        </td>
                                        <td style="width: 20%; text-align: center;">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Entidades">Ver Entidades</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <asp:DataList ID="ListEntidades" runat="server" BorderColor="Gray" 
                                    BorderStyle="Solid" BorderWidth="1px" DataSourceID="DataListEntidades" 
                                    Visible="False">
                                    <ItemTemplate>
                                        <table style="width: 1000px">
                                            <tr>
                                                <td style="width: 20%">
                                                    <asp:Label ID="GDENOMBRELabel" runat="server" Text='<%# Eval("GDENOMBRE") %>' />
                                                </td>
                                                <td style="width: 20%; text-align: right;">
                                                    $<asp:Label ID="ValorServicioLabel" runat="server" 
                                                        Text='<%# Eval("ValorServicio", "{0:N0}") %>' />
                                                </td>
                                                <td style="width: 20%; text-align: right;">
                                                    $<asp:Label ID="ValorObjetadoLabel" runat="server" 
                                                        Text='<%# Eval("ValorObjetado", "{0:N0}") %>' />
                                                </td>
                                                <td style="width: 20%; text-align: right;">
                                                    $<asp:Label ID="ValorAceptadoLabel" runat="server" 
                                                        Text='<%# Eval("ValorAceptado", "{0:N0}") %>' />
                                                </td>
                                                <td style="width: 20%">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="DataListEntidades" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="CXCESTCARLabel" Name="Estado" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="CodContratoLabel" Name="Contrato" 
                                            PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="DataListPlanBeneficio" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="CXCESTCARLabel" Name="Estado" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:DataList><br />
                <asp:SqlDataSource ID="DataListObjeciones" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT SUM(SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorServicio, SUM(CRNRECOBJD.CROVALOBJ) AS ValorObjetado, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValorAceptado, CASE WHEN CXCESTCAR = 0 THEN 'Sin Radicar' ELSE CASE WHEN CXCESTCAR = 1 THEN 'Radicada' ELSE CASE WHEN CXCESTCAR = 2 THEN 'Radicada Entidad' ELSE CASE WHEN CXCESTCAR = 3 THEN 'Objetada' ELSE CASE WHEN CXCESTCAR = 4 THEN 'Contestada Radicada' ELSE CASE WHEN CXCESTCAR = 5 THEN 'Aceptada' ELSE CASE WHEN CXCESTCAR = 6 THEN 'Cerificada Parcial' ELSE CASE WHEN CXCESTCAR = 7 THEN 'Certificada_Parcial' ELSE CASE WHEN CXCESTCAR = 8 THEN 'No Subsanable' ELSE CASE WHEN CXCESTCAR = 9 THEN 'Dificil Recaudo' ELSE 'Devolucion Factura' END END END END END END END END END END AS Estado, CRNCXC_1.CXCESTCAR AS IdEstado FROM SLNFACTUR AS SLNFACTUR_1 INNER JOIN ADNINGRESO AS ADNINGRESO_1 ON SLNFACTUR_1.ADNINGRESO = ADNINGRESO_1.OID INNER JOIN CRNCXC AS CRNCXC_1 ON SLNFACTUR_1.OID = CRNCXC_1.SLNFACTUR INNER JOIN CRNRECOBJC ON CRNCXC_1.OID = CRNRECOBJC.CRNCXC INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC INNER JOIN SLNSERPRO ON CRNRECOBJD.SLNSERPRO = SLNSERPRO.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN CRNTRAOBJD ON CRNRECOBJD.OID = CRNTRAOBJD.CRNRECOBJD WHERE (SLNFACTUR_1.SFADOCANU = 0) AND (SLNFACTUR_1.SFATIPDOC = 1) AND (CONVERT (char(2), CRNCXC_1.CXCDOCUME) &lt;&gt; 'LT') AND (CRNRECOBJC.CROFECOBJ BETWEEN @FechaInicial AND @FechaFinal) GROUP BY CRNCXC_1.CXCESTCAR">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                
                </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: right; font-size: 12pt; font-weight: bold">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <br />
                <br />
            </td>
        </tr>
    </table>

<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

