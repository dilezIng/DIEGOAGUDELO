<%@ Page Title="Indicador de Urgencias" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="GenerarReporte.aspx.vb" Inherits="Indicadores_Triage_GenerarReporte" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma; font-size: 10pt;">
        <tr>
            <td style="width: 25%; text-align: right;">
                Seleccione un mes para generar informe:
            </td>
            <td style="width: 25%">
                <asp:DropDownList ID="ListMeses" runat="server" AutoPostBack="True" 
                    DataSourceID="DataListMeses" DataTextField="Mes" DataValueField="IdMes">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataListMeses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT CONVERT (char(7), HCTFECTRI, 102) AS IdMes, CASE WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '01') THEN 'Enero ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '02') THEN 'Febrero ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '03') THEN 'Marzo ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '04') THEN 'Abril ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '05') THEN 'Mayo ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '06') THEN 'Junio ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '07') THEN 'Julio ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '08') THEN 'Agosto ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '09') THEN 'Septiembre ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '10') THEN 'Octubre ' + CONVERT (char(4) , HCTFECTRI , 111) WHEN (CONVERT (char(2) , HCTFECTRI , 101) = '11') THEN 'Noviembre ' + CONVERT (char(4) , HCTFECTRI , 111) ELSE ('Diciembre ' + CONVERT (char(4) , HCTFECTRI , 111)) END AS Mes FROM HCNTRIAGE ORDER BY IdMes DESC" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                </asp:SqlDataSource>
            </td>
            <td style="width: 25%">
                <asp:Label ID="LabelTextMes" runat="server" Visible="False"></asp:Label></td>
            <td style="width: 25%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                    Font-Size="8pt" Height="600px" InteractiveDeviceInfos="(Colección)" 
                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="99%">
                    <LocalReport ReportPath="Indicadores\Triage\Triage.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="PacFugados" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="OporTriage" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" 
                                Name="OportuTotTraige" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" 
                                Name="TriageUsuarios" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" 
                                Name="TriageEspecialidad" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="ResumenDiario" />
                            
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="ResHorasDia" />
                            
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource9" 
                                Name="SolictudInterconsultas" />
                            
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource10" 
                                Name="InterconsUsuarios" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource11" 
                                Name="PacientesReingresos" />
                            
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource12" 
                                Name="TotalRespIntercEspec" />
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource13" 
                                Name="PromTriageApertura" />
                            
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource14" Name="PacRemitidos" />
                            
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.PacientesRemitidosTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.PromsTriageAperturaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.TotalRespInterConsEspecTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.ReingresosTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_OID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HCTNUMERO" Type="Int32" />
                        <asp:Parameter Name="HCTFECTRI" Type="DateTime" />
                        <asp:Parameter Name="GPADOCUME" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HCTNUMERO" Type="Int32" />
                        <asp:Parameter Name="HCTFECTRI" Type="DateTime" />
                        <asp:Parameter Name="GPADOCUME" Type="String" />
                        <asp:Parameter Name="Original_OID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.SolicInterconsultasUsuariosTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.SolicInterconsultasTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_OID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="GEEDESCRI" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="GEEDESCRI" Type="String" />
                        <asp:Parameter Name="Original_OID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.ResumenDiarioTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.ResumenMesTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.TriageEspecialidadTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.TriageUsuarioTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.OprAtencionTriageTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.OportuTriageTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.PacientesFugadosTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" DefaultValue="" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IndiTraigeTableAdapters.TotalIngresosTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelTextMes" Name="Mes" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ListMeses" DefaultValue="" Name="IdMes" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

