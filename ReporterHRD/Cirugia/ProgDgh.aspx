<%@ Page Title="Informe Diario de Cirugias
" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ProgDgh.aspx.vb" Inherits="Cirugia_ProgDgh" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>


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
                Informe Diario de Cirugias</td>
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
                <asp:Button ID="Button2" runat="server" Text="Actualizar" />
            </td>
            <td style="width: 25%" >
                <asp:Label ID="LabelCantPacs" runat="server" 
                    style="color: #006600; font-weight: 700"></asp:Label>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" style="width: 100%; font-size: 10pt;" >
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    DataKeyNames="IdFolio" Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Resumen" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaHoraCirugia" HeaderText="Fecha/Hora Folio" 
                            SortExpression="FechaHoraCirugia" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="D.I. Paciente" 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="Nombre Paciente" 
                            SortExpression="NomPaciente" />
                        <asp:BoundField DataField="Procedimiento" HeaderText="Procedimiento" 
                            SortExpression="Procedimiento" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                            SortExpression="Entidad" />
                       
                        
                        <asp:BoundField DataField="Medico" HeaderText="Medico" SortExpression="Medico" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ANESTESIOLOGO" HeaderText="ANESTESIOLOGO" SortExpression="ANESTESIOLOGO" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT HCNFOLIO.HCFECFOL AS FechaHoraCirugia, CONVERT (char(10), HCNFOLIO.HCFECFOL, 103) AS FechaFolio, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC, (SELECT TOP (1) GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) AS CodServPracticado FROM HCNQXEPAC INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID WHERE (HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID)) AS Procedimiento, GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' AS Entidad, GENMEDICO_1.GMENOMCOM AS Medico, (SELECT GEEDESCRI FROM GENESPECI WHERE (OID = GENESPMED.ESPECIALIDADES)) AS Especialidad, (SELECT TOP (1) CASE WHEN GENMEDICO.GMENOMCOM IS NULL THEN ' NO' ELSE GENMEDICO.GMENOMCOM END AS Expr1 FROM HCNFOLIO AS HCNFOLIO2 INNER JOIN GENMEDICO ON HCNFOLIO2.GENMEDICO = GENMEDICO.OID WHERE (HCNFOLIO2.HCNTIPHIS = 7 OR HCNFOLIO2.HCNTIPHIS = 81) AND (CONVERT (char(10), HCNFOLIO2.HCFECFOL, 103) = @Dia) AND (HCNFOLIO2.ADNINGRESO = ADNINGRESO.OID)) AS ANESTESIOLOGO, HCNFOLIO.OID AS IdFolio FROM GENPACIEN INNER JOIN HCNFOLIO INNER JOIN HCMHCINQX ON HCNFOLIO.OID = HCMHCINQX.HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENESPMED ON GENMEDICO_1.OID = GENESPMED.MEDICOS WHERE (CONVERT (char(10), HCNFOLIO.HCFECFOL, 103) = @Dia) AND (HCNFOLIO.HCNTIPHIS = 15) AND (GENESPMED.GEMPRINCIPAL = 1) ORDER BY FechaHoraCirugia DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="Dia" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>

        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <br />
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    ScrollBars="Vertical" Width="900px">
                    <asp:Label ID="LblDetalles" runat="server" ></asp:Label>
                    <hr />
                    Procedimientos Realizados:<asp:GridView ID="GridDetalle" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="DataGridDetalle" 
                        Width="100%">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="CodServPracticado" HeaderText="Cod." 
                                SortExpression="CodServPracticado" >
                            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ServPracticado" HeaderText="Servicio" 
                                SortExpression="ServPracticado" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataGridDetalle" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        
                        
                        
                        SelectCommand="SELECT GENSERIPS.SIPCODIGO AS CodServPracticado, GENSERIPS.SIPNOMBRE AS ServPracticado, GENSERIPS.OID AS IdServicio, HCNQXEPAC.OID AS IdSeguimiento FROM HCNQXEPAC INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID WHERE (HCNQXEPAC.HCNFOLIO = @IdFolio)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="IdFolio" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    Diagnosticos:<asp:GridView ID="GridDiagno" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="DataGridDiagno" Width="100%">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="DIACODIGO" HeaderText="Cod." 
                                SortExpression="DIACODIGO" >
                            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DIANOMBRE" HeaderText="Diagnostico" 
                                SortExpression="DIANOMBRE" />
                            <asp:CheckBoxField DataField="HCPDIAPRIN" HeaderText="Principal" 
                                SortExpression="HCPDIAPRIN" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataGridDiagno" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT HCNDIAPAC.HCNFOLIO, HCNDIAPAC.HCPDIAPRIN, GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE FROM HCNDIAPAC INNER JOIN GENDIAGNO ON HCNDIAPAC.GENDIAGNO = GENDIAGNO.OID WHERE (HCNDIAPAC.HCNFOLIO = @IdFolio) ORDER BY HCNDIAPAC.HCPDIAPRIN desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="IdFolio" 
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

