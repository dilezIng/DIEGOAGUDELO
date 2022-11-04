<%@ Page Title="Medicamentos Asignados por Nota Médica" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ConsultaNotasMedicas.aspx.vb" Inherits="PaginaBase" %>

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
           
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="5" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                
                CONSULTA DE MEDICAMENTOS ASIGNADOS POR NOTA MEDICA</td>
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
               
            <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" />
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
            <td style="width: 20%" >
                
                No. Documento Paciente:</td>
             <td style="width: 20%" >
                 
                 <asp:TextBox ID="TextDocPaciente" runat="server" MaxLength="20"></asp:TextBox>
                 
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
                <asp:GridView ID="GridPrincipal" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IdFolio" DataSourceID="DataPrincipal" 
                    Visible="False" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="AINCONSEC" HeaderText="Ingreso" 
                            SortExpression="AINCONSEC">
                        </asp:BoundField>
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="D.I. Paciente" 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="HCFECFOL" HeaderText="Fecha/Hora Folio" 
                            SortExpression="HCFECFOL" />
                        <asp:BoundField DataField="HCNUMFOL" HeaderText="No. Folio" 
                            SortExpression="HCNUMFOL" >
                        </asp:BoundField>
                        <asp:BoundField DataField="HCCM03N02" 
                            HeaderText="Nota Consignada" SortExpression="HCCM03N02">
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataPrincipal" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT HCNFOLIO.OID AS IdFolio, HCNFOLIO.HCFECFOL, HCNFOLIO.HCNUMFOL, GENPACIEN.PACNUMDOC, ADNINGRESO.AINCONSEC, HCMHCNOME.HCCM03N02 FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCMHCNOME ON HCNFOLIO.OID = HCMHCNOME.HCNFOLIO WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicial AND @FechaFinal) AND (GENPACIEN.PACNUMDOC = COALESCE (NULLIF (@NumDocPac, N'@'), GENPACIEN.PACNUMDOC))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelFechaIni" Name="FechaInicial" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="LabelDocPaciente" Name="NumDocPac" 
                            PropertyName="Text" />
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

