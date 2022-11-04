<%@ Page Title="Morbilidad y Mortalidad AAT" Language="vb" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="MorbilidadAAT.aspx.vb" Inherits="Facturacion_ResumenFacturacion" %>

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
            
            <td colspan="5" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Mortalidad y Morbilidad AAT</td>
            <tr>
                <td style="width: 20%">
                    Fecha de Inicio:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                        UserDateFormat="DayMonthYear" />
                    <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                        TargetControlID="TextFechaIni" />
                </td>
                <td style="width: 20%">
                    Fecha Fin :<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                        UserDateFormat="DayMonthYear" />
                    <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                        TargetControlID="TextFechaFin" />
                    <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
                </td>
                <td style="width: 25%">
                </td>
                <td style="width: 25%">
                </td>
                <td style="width: 10%; font-size: 12pt; font-weight: bold; text-align: right;">
                    <asp:Button ID="Button1" runat="server" Text="Actualizar" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 40%">
                    <asp:Label ID="LabelMsg" runat="server" style="font-weight: 700"></asp:Label>
                </td>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 10%; font-size: 12pt; font-weight: bold; text-align: right;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:DataList ID="ListTriage" runat="server" DataSourceID="DataListTriage" 
                        RepeatDirection="Horizontal" Width="500px" BorderColor="#CCCCCC" 
                        BorderStyle="Solid" BorderWidth="1px">
                        <HeaderStyle BackColor="#5CACE9" Font-Bold="True" Font-Size="12pt" 
                            ForeColor="White" />
                        <HeaderTemplate>
                            INFORMACION DE TRIAGE
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 100%; border-right-style: solid; border-right-width: 1px; border-right-color: #999999;">
                                <tr>
                                    <td colspan="2" style="width: 100%">
                                        <asp:Label ID="ComoIngresoLabel" runat="server" style="font-weight: 700" 
                                            Text='<%# Eval("ComoIngreso") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        Total pacientes:</td>
                                    <td style="width: 50%">
                                        <asp:Label ID="HCTPACSINSVLabel" runat="server" 
                                            Text='<%# Eval("HCTPACSINSV") %>' Visible="False" 
                                            />
                                        <asp:Label ID="CantLabel" runat="server" Text='<%# Eval("Cant") %>' 
                                            style="font-size: 14pt; font-weight: 700" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        Valor Facturado:</td>
                                    <td style="width: 50%">$
                                        <asp:Label ID="TotalFacturadoLabel" runat="server" 
                                            Text='<%# Eval("TotalFacturado", "{0:N0}") %>' style="font-weight: 700" />
                                    </td>
                                </tr>
                            </table>
                            
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="DataListTriage" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                        
                        SelectCommand="SELECT COUNT(HCNTRIAGE.HCTPACSINSV) AS Cant, CASE WHEN HCTPACSINSV = 1 THEN 'Ingresó Sin Signos Vitales' ELSE 'Ingresó Con Signos Vitales' END AS ComoIngreso, SUM(SLNFACTUR.SFATOTFAC) AS TotalFacturado, HCNTRIAGE.HCTPACSINSV FROM ADNINGRESO INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.OID = HCNTRIAGE.ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINFECING BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFADOCANU = 0) GROUP BY CONVERT (char(3), GENDETCON.GDECODIGO), CASE WHEN HCTPACSINSV = 1 THEN 'Ingreso Sin Signos Vitales' ELSE 'Ingreso Sin Signos Vitales' END, HCNTRIAGE.HCTPACSINSV HAVING (CONVERT (char(3), GENDETCON.GDECODIGO) = 'aat') ORDER BY HCNTRIAGE.HCTPACSINSV">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:DataList ID="ListTriage0" runat="server" BorderColor="#CCCCCC" 
                        BorderStyle="Solid" BorderWidth="1px" DataSourceID="DataListEgreso" 
                        RepeatDirection="Horizontal" Width="700px">
                        <HeaderStyle BackColor="#5CACE9" Font-Bold="True" Font-Size="12pt" 
                            ForeColor="White" />
                        <HeaderTemplate>
                            INFORMACION DE EGRESOS
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 100%; border-right-style: solid; border-right-width: 1px; border-right-color: #999999;">
                                <tr>
                                    <td colspan="2" style="width: 100%">
                                        <asp:Label ID="EstadoPacienteLabel" runat="server" style="font-weight: 700" 
                                            Text='<%# Eval("EstadoPaciente") %>' />
                                        <asp:Label ID="ADEESTPACLabel" runat="server" Text='<%# Eval("ADEESTPAC") %>' 
                                            Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        Total Pacientes:</td>
                                    <td style="width: 50%">
                                        <asp:Label ID="CantLabel" runat="server" 
                                            style="font-size: 14pt; font-weight: 700" Text='<%# Eval("Cant") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        Valor Facturado:</td>
                                    <td style="width: 50%">
                                        $<asp:Label ID="TotalFacturadoLabel" runat="server" style="font-weight: 700" 
                                            Text='<%# Eval("TotalFacturado", "{0:N0}") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="DataListEgreso" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                        SelectCommand="SELECT ADNEGRESO.ADEESTPAC, CASE WHEN ADEESTPAC = 1 THEN 'Mejor' ELSE CASE WHEN ADEESTPAC = 2 THEN 'Igual o Peor' ELSE CASE WHEN ADEESTPAC = 3 THEN 'Muerto Antes de 48 Horas' ELSE CASE WHEN ADEESTPAC = 4 THEN 'Muerto Despues de 48 horas' ELSE 'Ninguno' END END END END AS EstadoPaciente, COUNT(CONVERT (char(3), GENDETCON.GDECODIGO)) AS Cant, SUM(SLNFACTUR.SFATOTFAC) AS TotalFacturado FROM ADNINGRESO INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN ADNEGRESO ON ADNINGRESO.OID = ADNEGRESO.ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO WHERE (ADNINGRESO.AINURGCON = 0) AND (ADNINGRESO.AINFECING BETWEEN @FechaInicio AND @FechaFin) AND (SLNFACTUR.SFADOCANU = 0) GROUP BY CONVERT (char(3), GENDETCON.GDECODIGO), CASE WHEN ADEESTPAC = 1 THEN 'Mejor' ELSE CASE WHEN ADEESTPAC = 2 THEN 'Igual o Peor' ELSE CASE WHEN ADEESTPAC = 3 THEN 'Muerto Antes de 48 Horas then CASE' WHEN ADEESTPAC = 4 THEN 'Muerto Despues de 48 horas' ELSE 'Ninguno' END END END, ADNEGRESO.ADEESTPAC HAVING (CONVERT (char(3), GENDETCON.GDECODIGO) = 'aat')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
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
            
        </tr>
    </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

