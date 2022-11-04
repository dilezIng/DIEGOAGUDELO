<%@ Page Title="Diagnósticos de Consulta Externa" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="ProcedimientosDia.aspx.vb" Inherits="PaginaBase"  UICulture="es" Culture="es-CO" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

    <asp:ScriptManager ID="ScriptManager1" runat="server"  EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1000px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Diagnósticos de Consulta Externa (Diarios)</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                Seleccione un dia:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            <td style="width: 25%" >
                <asp:Button ID="Button1" runat="server" Text="Actualizar" />
            </td>
            <td style="width: 25%" >
                <asp:Label ID="LabelCantPacs" runat="server" 
                    style="color: #006600; font-weight: 700"></asp:Label>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="3" style="width: 75%; font-size: 10pt;" >
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    DataKeyNames="IdDiagnostico,DIACODIGO,NomDiagnostico" Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Pacientes" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Expr1" HeaderText="Cant" 
                            SortExpression="Expr1" ReadOnly="True" />
                        <asp:BoundField DataField="NomDiagnostico" HeaderText="Diagnóstico" 
                            SortExpression="NomDiagnostico" ReadOnly="True" />
                        <asp:BoundField DataField="DIACODIGO" HeaderText="Cod" 
                            SortExpression="DIACODIGO" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    SelectCommand="SELECT GENDIAGNO.DIACODIGO, RTRIM(GENDIAGNO.DIANOMBRE) AS NomDiagnostico, COUNT(GENDIAGNO.OID) AS Expr1, GENDIAGNO.OID AS IdDiagnostico FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (ADNINGRESO.AINURGCON = 1) AND (HCNDIAPAC.HCPDIAPRIN = 1) AND (SLNFACTUR.SFADOCANU = 0) AND (HCNFOLIO.HCNUMFOL = (SELECT TOP (1) HCNUMFOL FROM HCNFOLIO AS HCNFOLIO_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY ADNINGRESO)) AND (CONVERT (char(10), ADNINGRESO.AINFECING, 103) = @Dia) GROUP BY GENDIAGNO.DIACODIGO, RTRIM(GENDIAGNO.DIANOMBRE), GENDIAGNO.OID ORDER BY GENDIAGNO.DIACODIGO, NomDiagnostico">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="Dia" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    ScrollBars="Vertical" Width="900px">
                    <asp:Label ID="LabelDiagnostico" runat="server" 
                        style="font-weight: 700; color: #0000CC;"></asp:Label>
                    <asp:GridView ID="GridDetalle" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="DataGridDetalle" 
                        Width="100%">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="PACNUMDOC" HeaderText="No. D.I." 
                                SortExpression="PACNUMDOC" />
                            <asp:BoundField DataField="PACPRINOM" HeaderText="Primer Nombre" 
                                SortExpression="PACPRINOM" />
                            <asp:BoundField DataField="PACSEGNOM" HeaderText="Segundo Nombre" 
                                SortExpression="PACSEGNOM" />
                            <asp:BoundField DataField="PACPRIAPE" HeaderText="Primer Apellido" 
                                SortExpression="PACPRIAPE" />
                            <asp:BoundField DataField="PACSEGAPE" HeaderText="Segundo Apellido" 
                                SortExpression="PACSEGAPE" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataGridDetalle" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        
                        
                        SelectCommand="SELECT GENPACIEN.PACNUMDOC, GENPACIEN.PACPRINOM, GENPACIEN.PACSEGNOM, GENPACIEN.PACPRIAPE, GENPACIEN.PACSEGAPE FROM ADNINGRESO INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.AINURGCON = 1) AND (HCNDIAPAC.HCPDIAPRIN = 1) AND (SLNFACTUR.SFADOCANU = 0) AND (HCNFOLIO.HCNUMFOL = (SELECT TOP (1) HCNUMFOL FROM HCNFOLIO AS HCNFOLIO_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY ADNINGRESO)) AND (CONVERT (char(10), ADNINGRESO.AINFECING, 103) = @Dia) AND (HCNDIAPAC.GENDIAGNO = @IdDiagno)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextFechaIni" Name="Dia" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="GridView1" Name="IdDiagno" 
                                PropertyName="SelectedValue" />
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
            </td>
        </tr>
    </table>

        
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

