<%@ Page Title="Informes" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="PyP.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


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
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="2" 
                >Formato 4505</td>
        <td colspan="2" 
                >&nbsp;</td>
        </tr>

        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                Sede:
                <asp:RadioButtonList ID="ListSedes" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" 
                    Enabled="False">
                    <asp:ListItem Value="0">Duitama</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">Santarosa</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%" >
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> </td>
            <td style="width: 25%" >
                Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label> </td>
            <td style="width: 25%; text-align: right;" >
                <asp:Button ID="BtnExportar" runat="server" Enabled="False" 
                    Text="Exportar a Excel" />
&nbsp;<asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" />
            </td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                Informe:
                <asp:DropDownList ID="ListInforme" runat="server">
                    <asp:ListItem Value="0">4505</asp:ListItem>
                    <asp:ListItem Value="1">Planilla PoNal</asp:ListItem>
                    <asp:ListItem Value="2">Oportunidad</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 25%; font-size: 9pt;" >
                Entidad:
                <asp:DropDownList ID="ListEntidades" runat="server" 
                    DataSourceID="DataListEntidades" DataTextField="GECNOMENT" DataValueField="OID" 
                    Width="200px" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="0">Todos</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataListEntidades" runat="server" 
                    
                    
                    
                    SelectCommand="SELECT DISTINCT GENCONTRA.GECNOMENT, GENCONTRA.OID FROM GENDATRIP INNER JOIN SLNFACTUR ON GENDATRIP.SLNFACTUR = SLNFACTUR.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID WHERE (SLNFACTUR.SFAFECFAC &gt; CONVERT (DATETIME, '2017-07-01 00:00:00', 102)) ORDER BY GENCONTRA.GECNOMENT" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES03ConnectionString %>">
                </asp:SqlDataSource>
            </td>
            <td style="text-align: right; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" DataKeyNames="OID,RIPCEFINAl" 
                    AllowSorting="True" Width="100%" Visible="False">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:TemplateField HeaderText="Procedimiento PyP">
                            <ItemTemplate>
                                <asp:Label ID="LabelTipo" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NumDocPaciente" HeaderText="D.I. Paciente" 
                            SortExpression="NumDocPaciente" />
                        <asp:BoundField DataField="PrimApelPaciente" HeaderText="Primer Apellido" 
                            SortExpression="PrimApelPaciente" />
                        <asp:BoundField DataField="SegApelPaciente" HeaderText="Segundo Apellido" 
                            SortExpression="SegApelPaciente" />
                        <asp:BoundField DataField="PrimNomPaciente" HeaderText="Primer Nombre" 
                            SortExpression="PrimNomPaciente" />
                        <asp:BoundField DataField="SegNomPaciente" HeaderText="Segundo Nombre" 
                            SortExpression="SegNomPaciente" />
                        <asp:BoundField DataField="FacNacPaciente" DataFormatString="{0:d}" 
                            HeaderText="Fecha Nacim" SortExpression="FacNacPaciente" />
                        <asp:BoundField DataField="Genero" HeaderText="Genero" 
                            SortExpression="Genero" />
                        <asp:BoundField DataField="GECNOMENT" HeaderText="Entidad" 
                            SortExpression="GECNOMENT" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT GENDATRIP.OID, GENDATRIP.RIPCEFINAl, GENPACIEN.PACNUMDOC AS NumDocPaciente, GENPACIEN.PACPRIAPE AS PrimApelPaciente, GENPACIEN.PACSEGAPE AS SegApelPaciente, GENPACIEN.PACPRINOM AS PrimNomPaciente, GENPACIEN.PACSEGNOM AS SegNomPaciente, GENPACIEN.GPAFECNAC AS FacNacPaciente, CASE WHEN GPASEXPAC = 2 THEN 'F' ELSE 'M' END AS Genero, GENCONTRA.GECNOMENT FROM GENDATRIP INNER JOIN SLNFACTUR ON GENDATRIP.SLNFACTUR = SLNFACTUR.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (GENCONTRA.OID = COALESCE (NULLIF (@Entidad, 0), GENCONTRA.OID)) ORDER BY PrimApelPaciente, SegApelPaciente, PrimNomPaciente, SegNomPaciente">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListEntidades" Name="Entidad" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:GridView ID="GridOportuPolicia" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="OID" 
                    DataSourceID="DataGridOportuPolicia" Width="100%" Visible="False">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="IPS" HeaderText="IPS" 
                            SortExpression="IPS" ReadOnly="True" />
                        <asp:BoundField DataField="NumRadicacion" HeaderText="NumRadicacion" 
                            SortExpression="NumRadicacion" DataFormatString="{0:d}" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaRadicacion" DataFormatString="{0:d}" 
                            HeaderText="FechaRadicacion" SortExpression="FechaRadicacion" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="NumFactura" HeaderText="NumFactura" 
                            SortExpression="NumFactura" />
                        <asp:BoundField DataField="FechaFactura" HeaderText="FechaFactura" 
                            SortExpression="FechaFactura" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="FechaAtencion" HeaderText="FechaAtencion" 
                            SortExpression="FechaAtencion" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="NomPaciente" 
                            SortExpression="NomPaciente" ReadOnly="True" />
                        <asp:BoundField DataField="NumDocPaciente" HeaderText="NumDocPaciente" 
                            SortExpression="NumDocPaciente" />
                        <asp:BoundField DataField="Cups" HeaderText="Cups" ReadOnly="True" 
                            SortExpression="Cups" />
                        <asp:BoundField DataField="DxCie10" HeaderText="DxCie10" 
                            SortExpression="DxCie10" />
                        <asp:BoundField DataField="SFATOTFAC" DataFormatString="{0:N0}" 
                            HeaderText="TotalFactura" SortExpression="SFATOTFAC" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorGlosa" HeaderText="ValorGlosa" ReadOnly="True" 
                            SortExpression="ValorGlosa" />
                        <asp:BoundField DataField="ValorAceptadoIPS" HeaderText="ValorAceptadoIPS" 
                            ReadOnly="True" SortExpression="ValorAceptadoIPS" />
                        <asp:BoundField DataField="ValorAceptadoPonal" HeaderText="ValorAceptadoPonal" 
                            ReadOnly="True" SortExpression="ValorAceptadoPonal" />
                        <asp:BoundField DataField="Valorpagar" HeaderText="Valorpagar" ReadOnly="True" 
                            SortExpression="Valorpagar" />
                        <asp:BoundField DataField="Conciliada" HeaderText="Conciliada" ReadOnly="True" 
                            SortExpression="Conciliada" />
                        <asp:BoundField DataField="Observacion" HeaderText="Observacion" 
                            ReadOnly="True" SortExpression="Observacion" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" 
                            SortExpression="Edad" />
                        <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" 
                            SortExpression="Contrato" />
                        <asp:BoundField DataField="AltoCosto" HeaderText="AltoCosto" ReadOnly="True" 
                            SortExpression="AltoCosto" />
                        <asp:BoundField DataField="ResUrg" HeaderText="ResUrg" ReadOnly="True" 
                            SortExpression="ResUrg" />
                        <asp:BoundField DataField="Contingencia" HeaderText="Contingencia" 
                            ReadOnly="True" SortExpression="Contingencia" />
                        <asp:BoundField DataField="Inclusion" HeaderText="Inclusion" ReadOnly="True" 
                            SortExpression="Inclusion" />
                        <asp:BoundField DataField="Recursos" HeaderText="Recursos" ReadOnly="True" 
                            SortExpression="Recursos" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridOportuPolicia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT 'HOSPITAL REGIONAL DUITAMA PRIMER NIVEL ' AS IPS, CRNDOCUME.CDCONSEC AS NumRadicacion, CRNDOCUME.CDFECDOC AS FechaRadicacion, SLNFACTUR.SFANUMFAC AS NumFactura, SLNFACTUR.SFAFECFAC AS FechaFactura, ADNINGRESO.AINFECING AS FechaAtencion, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, GENPACIEN.PACNUMDOC AS NumDocPaciente, CASE WHEN GPASEXPAC = 2 THEN 'F' ELSE 'M' END AS Genero, GENSERIPS.SIPCODCUP AS Cups, GENDIAGNO.DIANOMBRE AS DxCie10, SLNFACTUR.SFATOTFAC, '' AS ValorGlosa, GENDATRIP.OID, '' AS ValorAceptadoIPS, '' AS ValorAceptadoPonal, '' AS Valorpagar, '' AS Conciliada, '' AS Observacion, STR(DATEDIFF(month, GENPACIEN.GPAFECNAC, GETDATE()) / 12.0, 4, 1) AS Edad, GENCONTRA.GECCONTRA AS Contrato, '' AS AltoCosto, '' AS ResUrg, '' AS Contingencia, '' AS Inclusion, '' AS Recursos FROM GENDATRIP INNER JOIN SLNFACTUR ON GENDATRIP.SLNFACTUR = SLNFACTUR.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENDIAGNO ON GENDATRIP.DGNDIAGNO = GENDIAGNO.OID INNER JOIN CRNRADFACD ON SLNFACTUR.OID = CRNRADFACD.SLNFACTUR INNER JOIN CRNRADFACC ON CRNRADFACD.CRNRADFACC = CRNRADFACC.OID INNER JOIN CRNDOCUME ON CRNRADFACC.OID = CRNDOCUME.OID INNER JOIN SLNSERHOJ ON GENDATRIP.SLNSERHOJ = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (GENCONTRA.OID = COALESCE (NULLIF (@Entidad, 0), GENCONTRA.OID)) AND (CRNRADFACC.CRFESTADO = 1)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListEntidades" Name="Entidad" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridPolicia" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="DataGridPolicia" 
                    Width="100%" Visible="False">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="TipDoc" HeaderText="TipDoc" 
                            SortExpression="TipDoc" ReadOnly="True" />
                        <asp:BoundField DataField="NumDocPaciente" HeaderText="Num Doc" 
                            SortExpression="NumDocPaciente" />
                        <asp:BoundField DataField="FacNacPaciente" DataFormatString="{0:d}" 
                            HeaderText="Facha Nac" SortExpression="FacNacPaciente" />
                        <asp:BoundField DataField="Genero" HeaderText="Gen" 
                            SortExpression="Genero" ReadOnly="True" />
                        <asp:BoundField DataField="PrimApelPaciente" HeaderText="Primer Apellido" 
                            SortExpression="PrimApelPaciente" />
                        <asp:BoundField DataField="SegApelPaciente" HeaderText="Segundo Apellido" 
                            SortExpression="SegApelPaciente" />
                        <asp:BoundField DataField="PrimNomPaciente" HeaderText="Primer Nombre" 
                            SortExpression="PrimNomPaciente" />
                        <asp:BoundField DataField="SegNomPaciente" HeaderText="Segundo Nombre" 
                            SortExpression="SegNomPaciente" />
                        <asp:BoundField DataField="EAPB" HeaderText="EAPB" 
                            SortExpression="EAPB" />
                        <asp:BoundField DataField="TipoCita" HeaderText="TipoCita" ReadOnly="True" 
                            SortExpression="TipoCita" />
                        <asp:BoundField DataField="FechaSolCita" HeaderText="FechaSolCita" 
                            ReadOnly="True" SortExpression="FechaSolCita" />
                        <asp:BoundField DataField="CitaAsignada" HeaderText="CitaAsignada" 
                            ReadOnly="True" SortExpression="CitaAsignada" />
                        <asp:BoundField DataField="FechaAsigna" HeaderText="FechaAsigna" 
                            ReadOnly="True" SortExpression="FechaAsigna" />
                        <asp:BoundField DataField="FechaDeseadaUs" HeaderText="FechaDeseadaUs" 
                            ReadOnly="True" SortExpression="FechaDeseadaUs" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridPolicia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>" 
                    
                    
                    SelectCommand="SELECT CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipDoc, GENPACIEN.PACNUMDOC AS NumDocPaciente, GENPACIEN.GPAFECNAC AS FacNacPaciente, CASE WHEN GPASEXPAC = 2 THEN 'F' ELSE 'M' END AS Genero, GENPACIEN.PACPRIAPE AS PrimApelPaciente, GENPACIEN.PACSEGAPE AS SegApelPaciente, GENPACIEN.PACPRINOM AS PrimNomPaciente, GENPACIEN.PACSEGNOM AS SegNomPaciente, GENCONTRA.GECNOMENT, GEENENTADM.ENTCODIGO AS EAPB, GENSERIPS.SIPCODCUP AS TipoCita, '' AS FechaSolCita, '' AS CitaAsignada, '' AS FechaAsigna, '' AS FechaDeseadaUs FROM GENDATRIP INNER JOIN SLNFACTUR ON GENDATRIP.SLNFACTUR = SLNFACTUR.OID INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN SLNSERHOJ ON GENDATRIP.SLNSERHOJ = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID WHERE (SLNFACTUR.SFAFECFAC BETWEEN @FechaInicial AND @FechaFinal) AND (GENCONTRA.OID = COALESCE (NULLIF (@Entidad, 0), GENCONTRA.OID)) ORDER BY PrimApelPaciente, SegApelPaciente, PrimNomPaciente, SegNomPaciente">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListEntidades" Name="Entidad" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

                
            </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </td>
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

