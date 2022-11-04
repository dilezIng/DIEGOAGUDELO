<%@ Page Title="Resumen de Objeciones" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="SegRadicacionporfac.aspx.vb" Inherits="PaginaBase" %>

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
                
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                RESUMEN DE OBJECIONES</td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                <asp:RadioButtonList ID="ListIngsFacts" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True" Enabled="False" 
                    Visible="False">
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
            <td style="font-size: 9pt;" colspan="4" >
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" 
                    DataKeyNames="IdConcepto">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="CodConcepto" HeaderText="Cod." 
                            SortExpression="CodConcepto" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Concepto" HeaderText="Concepto" 
                            SortExpression="Concepto" />
                        <asp:BoundField DataField="CanFacts" HeaderText="Cant. Facts" 
                            SortExpression="CanFacts" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValFactura" HeaderText="Val. Factura" 
                            SortExpression="ValFactura" DataFormatString="{0:c}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValAceptado" HeaderText="Val. Aceptado" 
                            SortExpression="ValAceptado" DataFormatString="{0:c}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValObjetado" HeaderText="Val. Objetado" 
                            SortExpression="ValObjetado" DataFormatString="{0:c}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValSoportado" DataFormatString="{0:c}" HeaderText="Val. Soportado" 
                            SortExpression="ValSoportado"  >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CommandField SelectText="Ver Facturas" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT CRNCONOBJ.OID as IdConcepto ,CRNCONOBJ.CCOCODIGO AS CodConcepto, RTRIM(CRNCONOBJ.CCONOMBRE) AS Concepto, SUM(CRNTRAOBJD.CTDVALOBJ) AS ValAceptado, SUM(CRNRECOBJD.CROVALOBJ) AS ValObjetado, SUM(CRNRECOBJD.CROVALOBJ - CRNTRAOBJD.CTDVALOBJ) AS ValSoportado, SUM(CRNCXC.CRNVALOR) AS ValFactura, COUNT(CRNCXC.SLNFACTUR) AS CanFacts, CRNCONOBJ.OID AS IdConcepto FROM CRNTRAOBJC INNER JOIN CRNTRAOBJD ON CRNTRAOBJC.OID = CRNTRAOBJD.CRNTRAOBJC INNER JOIN CRNRECOBJC ON CRNTRAOBJC.CRNRECOBJC = CRNRECOBJC.OID INNER JOIN CRNCXC ON CRNRECOBJC.CRNCXC = CRNCXC.OID INNER JOIN CRNDOCUME ON CRNTRAOBJC.OID = CRNDOCUME.OID INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC AND CRNTRAOBJD.CRNRECOBJD = CRNRECOBJD.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN SLNFACTUR ON CRNCXC.SLNFACTUR = SLNFACTUR.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @Fechain) GROUP BY CRNCONOBJ.CCOCODIGO, RTRIM(CRNCONOBJ.CCONOMBRE), CRNCONOBJ.OID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="Fechain" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                &nbsp;</td>
            <td style="width: 25%; font-size: 9pt;" >
                &nbsp;</td>
            <td style="width: 20%" >
                &nbsp;</td>
            <td style="width: 30%; text-align: right;" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 16pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" >
                <asp:Label ID="LabelSubTitulo" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                &nbsp;</td>
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
                    Height="600px" ScrollBars="Vertical" Width="1000px" GroupingText="Oxigeno">
                    
                    <table style="width: 100%; font-family: tahoma;">
                            <tr>
                                <td style="width: 90%; font-size: 10pt;">
                                    <asp:Label ID="LabelDetalle" runat="server"></asp:Label>
                                </td>
                                <td style="width: 10%; text-align: center; vertical-align: top;">
                                    &nbsp;</td>
                        </tr>
                            <tr>
                                <td style="width: 90%; font-size: 10pt;">
                                    <asp:GridView ID="GridDetRegEnf" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="IdConcepto" DataSourceID="DataGridDetRegEnf" PageSize="20" 
                                        AllowSorting="True">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="FechaFactura" HeaderText="Fecha Factura" 
                                                SortExpression="FechaFactura" >
                                            <ItemStyle Font-Size="8pt" />
                                            </asp:BoundField>
                                            
                                            <asp:BoundField DataField="NumFactura" HeaderText="No. Factura" 
                                                SortExpression="NumFactura" >
                                            <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
											
											<asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                                                SortExpression="Entidad">
												
                                            <ItemStyle Font-Size="8pt" />
                                            </asp:BoundField>
												 <asp:BoundField DataField="Bloque" HeaderText="Bloque" 
                                                SortExpression="Bloque">
                                            <ItemStyle Font-Size="8pt" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ValFactura" DataFormatString="{0:c}" 
                                                HeaderText="Val.Factura" SortExpression="ValFactura">
                                            <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ValAceptado" DataFormatString="{0:c}" 
                                                HeaderText="Val.Acept." SortExpression="ValAceptado" />
                                            <asp:BoundField DataField="ValObjetado" DataFormatString="{0:c}" 
                                                HeaderText="Val.Obj." SortExpression="ValObjetado">
                                            <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ValSoportado" DataFormatString="{0:c}" 
                                                HeaderText="Val.Sopor" ReadOnly="True" SortExpression="ValSoportado">
                                            <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ValorEntidad" DataFormatString="{0:c}" 
                                                HeaderText="Val.Entidad" SortExpression="ValorEntidad">
                                            <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ValorPaciente" DataFormatString="{0:c}" 
                                                HeaderText="Val.Paciente" SortExpression="ValorPaciente">
                                            <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataGridDetRegEnf" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT CRNCONOBJ.CCOCODIGO AS CodConcepto, RTRIM(CRNCONOBJ.CCONOMBRE) AS Concepto, CRNTRAOBJD.CTDVALOBJ AS ValAceptado, CRNRECOBJD.CROVALOBJ AS ValObjetado, CRNRECOBJD.CROVALOBJ - CRNTRAOBJD.CTDVALOBJ AS ValSoportado, CRNCXC.CRNVALOR AS ValFactura, CRNCONOBJ.OID AS IdConcepto, SLNFACTUR.SFANUMFAC AS NumFactura, SLNFACTUR.SFATOTFAC AS ValorEntidad, SLNFACTUR.SFAVALPAC AS ValorPaciente, SLNFACTUR.SFAFECFAC AS FechaFactura, '(' + GENDETCON.GDECODIGO + ') ' + GENDETCON.GDENOMBRE AS Entidad, CASE WHEN ADNINGRESO.AINFECHOS IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNSUBGRU.HSUCODIGO  FROM HPNESTANC INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM=HPNDEFCAM.OID INNER JOIN HPNSUBGRU ON HPNDEFCAM.HPNSUBGRU=HPNSUBGRU.OID where HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM ) END  as Bloque  FROM CRNTRAOBJC INNER JOIN CRNTRAOBJD ON CRNTRAOBJC.OID = CRNTRAOBJD.CRNTRAOBJC INNER JOIN CRNRECOBJC ON CRNTRAOBJC.CRNRECOBJC = CRNRECOBJC.OID INNER JOIN CRNCXC ON CRNRECOBJC.CRNCXC = CRNCXC.OID INNER JOIN CRNDOCUME ON CRNTRAOBJC.OID = CRNDOCUME.OID INNER JOIN CRNRECOBJD ON CRNRECOBJC.OID = CRNRECOBJD.CRNRECOBJC AND CRNTRAOBJD.CRNRECOBJD = CRNRECOBJD.OID INNER JOIN CRNCONOBJ ON CRNRECOBJD.CRNCONOBJ = CRNCONOBJ.OID INNER JOIN SLNFACTUR ON CRNCXC.SLNFACTUR = SLNFACTUR.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN  ADNINGRESO on SLNFACTUR.ADNINGRESO=ADNINGRESO.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicio AND @FechaFin) AND (CRNCONOBJ.OID = @IdConcepto)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFin" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="GridView1" Name="IdConcepto" 
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
                            </tr>
                        </table>
                   
                    
                </asp:Panel>
              </td></tr>
       
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

