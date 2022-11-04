<%@ Page Title="Resumen Consulta Externa" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ResumenPorEspecialidades.aspx.vb" Inherits="Indicadores_Triage_GenerarReporte" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="True">
                </asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
             <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1440px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>
            
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                             Activar para generacion de archivos de res 266
                             
                             </ContentTemplate>
                    
                </asp:UpdatePanel>
    <table style="width: 100%; font-family: tahoma; font-size: 10pt;">
    <tr>
            <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
                Resumen Consulta Externa</td>
        </tr>

        <tr>
            <td style="width: 25%; text-align: right; vertical-align: top;">
               
                <asp:Panel ID="Panel3" runat="server" Font-Size="8pt" 
                    GroupingText="Seleccione los meses" Height="100px" 
                    ScrollBars="Vertical" Width="100%">
                <asp:CheckBoxList ID="BoxListMeses" runat="server" 
                        TextAlign="Left">
                </asp:CheckBoxList>
                </asp:Panel>
                <%--<asp:SqlDataSource ID="DataListMeses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT CONVERT (char(7), CCMFECCIT, 102) AS IdMes, CASE WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '01') THEN 'Enero ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '02') THEN 'Febrero ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '03') THEN 'Marzo ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '04') THEN 'Abril ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '05') THEN 'Mayo ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '06') THEN 'Junio ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '07') THEN 'Julio ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '08') THEN 'Agosto ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '09') THEN 'Septiembre ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '10') THEN 'Octubre ' + CONVERT (char(4) , CCMFECCIT , 111) WHEN (CONVERT (char(2) , CCMFECCIT , 101) = '11') THEN 'Noviembre ' + CONVERT (char(4) , CCMFECCIT , 111) ELSE ('Diciembre ' + CONVERT (char(4) , CCMFECCIT , 111)) END AS Mes FROM CMNCITMED ORDER BY IdMes DESC" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                </asp:SqlDataSource>--%>
                
            </td>
            <td style="border: 1px solid #999999; width: 25%; vertical-align: top; text-align: right;">
                Seleccione municipio:&nbsp;
                <asp:DropDownList ID="ListMunicipios" runat="server" AutoPostBack="True" 
                    DataSourceID="DataListMunicipios" DataTextField="NomMunicipio" 
                    DataValueField="OID" Width="100px" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Todos</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataListMunicipios" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT DISTINCT GENMUNICI.OID, GENMUNICI.MUNNOMMUN + N' (' + GENDEPTO.DEPNOMDEP + N')' AS NomMunicipio FROM CMNCITMED INNER JOIN GENPACIEN ON CMNCITMED.GENPACIEN = GENPACIEN.OID INNER JOIN GENMUNICI ON GENPACIEN.DGNMUNICIPIO = GENMUNICI.OID INNER JOIN GENDEPTO ON GENMUNICI.GENDEPTO = GENDEPTO.OID ORDER BY GENMUNICI.MUNNOMMUN + N' (' + GENDEPTO.DEPNOMDEP + N')'">
                </asp:SqlDataSource><br />
                Estilo Cita:
                <asp:DropDownList ID="ListEstilosCitas" runat="server">
                    <asp:ListItem Selected="True" Value="9">Todos</asp:ListItem>
                    <asp:ListItem Value="0">Primera Vez</asp:ListItem>
                    <asp:ListItem Value="1">Control</asp:ListItem>
                    <asp:ListItem Value="2">Remisión</asp:ListItem>
                </asp:DropDownList>
                <br />
                Regimen:
                <asp:DropDownList ID="ListRegimen" runat="server">
                    <asp:ListItem Selected="True" Value="SUB">Subsidiado</asp:ListItem>
                    <asp:ListItem Value="000">Todos</asp:ListItem>
                </asp:DropDownList><br />Entidad: 
                <asp:DropDownList ID="ListTerceros" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="DataListEntidades" DataTextField="NomTercero" 
                    DataValueField="IdTercero" Width="200px">
                    <asp:ListItem Value="0">Todos</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataConsultas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataListEntidades" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                    
                    
                    
                    SelectCommand="SELECT DISTINCT GENTERCER.TERPRINOM + CASE WHEN GENTERCER.TERSEGNOM IS NULL THEN '' ELSE ' ' + GENTERCER.TERSEGNOM END + CASE WHEN GENTERCER.TERPRIAPE IS NULL THEN '' ELSE ' ' + GENTERCER.TERPRIAPE END + CASE WHEN GENTERCER.TERSEGAPE IS NULL THEN '' ELSE ' ' + GENTERCER.TERSEGAPE END AS NomTercero, GENTERCER.OID AS IdTercero FROM GENDETCON INNER JOIN GENPACIEN ON GENDETCON.OID = GENPACIEN.GENDETCON INNER JOIN CMNCITMED ON GENPACIEN.OID = CMNCITMED.GENPACIEN INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID ORDER BY NomTercero">
                </asp:SqlDataSource>
            </td>

            <td style="vertical-align: top;">
                <asp:Panel ID="Panel1" runat="server" Font-Size="8pt" 
                    GroupingText="Seleccione las especilidades" Height="100px" 
                    ScrollBars="Vertical" Width="100%">
                    <asp:CheckBoxList ID="ListEspecialidades" runat="server" 
                        DataSourceID="DataListEspecialidades" DataTextField="GEEDESCRI" 
                        DataValueField="OID">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="DataListEspecialidades" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                        
                        
                        
                        SelectCommand="SELECT DISTINCT GENESPECI.OID, GENESPECI.GEEDESCRI FROM CMNCITMED INNER JOIN GENESPECI ON CMNCITMED.GENESPECI = GENESPECI.OID INNER JOIN GENPACIEN ON CMNCITMED.GENPACIEN = GENPACIEN.OID WHERE (GENPACIEN.DGNMUNICIPIO = COALESCE (NULLIF (@IdMunicpio, 0), GENPACIEN.DGNMUNICIPIO)) ORDER BY GENESPECI.GEEDESCRI">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListMunicipios" Name="IdMunicpio" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
            
            <td style="width: 25%; vertical-align: top;">
                <asp:Label ID="LabelTextMes" runat="server" Visible="False"></asp:Label>
                <asp:Panel ID="Panel2" runat="server" Font-Size="8pt" 
                    GroupingText="Seleccione los estados de la cita" Height="100px" 
                    ScrollBars="Vertical" Width="100%">
                    <asp:CheckBoxList ID="ListEstados" runat="server">
                        <asp:ListItem Value="0">Asignada</asp:ListItem>
<asp:ListItem Value="1">Cancelada</asp:ListItem>
<asp:ListItem Value="2">Cumplida</asp:ListItem>
<asp:ListItem Value="3">Incumplida</asp:ListItem>
<asp:ListItem Value="4">Facturada</asp:ListItem>
<asp:ListItem Value="5">Inatención</asp:ListItem>
                    </asp:CheckBoxList>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #999999; width: 25%; text-align: left;">
                
                <asp:Label ID="LabelInfo" runat="server" 
                    style="font-size: 10pt; font-weight: 700; color: #006600"></asp:Label>
                
            </td>
            <td style="border: 1px solid #999999; width: 25%; text-align: left;">
                <asp:Label ID="LabelInfo0" runat="server" 
                    style="font-size: 10pt; font-weight: 700; color: #0000FF"></asp:Label>
                <asp:Label ID="LabelAño" runat="server" Visible="False"></asp:Label>
            </td>
            <td style="border: 1px solid #999999; width: 25%">
                <asp:Label ID="Label2" runat="server" style="font-size: 10pt; color: #0000FF" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 25%">
                <asp:Button ID="Button2" runat="server" 
                    Text="Actualizar Primera Vez" />
                &nbsp;<asp:Button ID="Button1" runat="server" Text="Actualizar" />
                <br />
                <asp:Button ID="Button3" runat="server" Text="Generar 266" />
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Enabled="False">Descargar archivo</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DataGrid" Visible="False" 
                    DataKeyNames="IdCita,PrimeraVez,Expr1">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="TipoDocAf" HeaderText="TipoDocAf" ReadOnly="True" 
                            SortExpression="TipoDocAf" />
                        <asp:BoundField DataField="NumDocAf" HeaderText="NumDocAf" 
                            SortExpression="NumDocAf" />
                        <asp:BoundField DataField="FechaNacAf" HeaderText="FechaNacAf" ReadOnly="True" 
                            SortExpression="FechaNacAf" />
                        <asp:BoundField DataField="SexoAf" HeaderText="Gen" ReadOnly="True" 
                            SortExpression="SexoAf" />
                        <asp:BoundField DataField="PACPRIAPE" HeaderText="Prim Apel" 
                            SortExpression="PACPRIAPE" />
                        <asp:BoundField DataField="PACSEGAPE" HeaderText="Seg Apel" 
                            SortExpression="PACSEGAPE" />
                        <asp:BoundField DataField="PACPRINOM" HeaderText="Prim Nom" 
                            SortExpression="PACPRINOM" />
                        <asp:BoundField DataField="PACSEGNOM" HeaderText="Seg Apel" 
                            SortExpression="PACSEGNOM" />
                        <asp:BoundField DataField="GDECODIGO" HeaderText="CodEps" 
                            SortExpression="GDECODIGO" />
                        <asp:BoundField DataField="EpsAf" HeaderText="EpsAf" SortExpression="EpsAf" />
                        <asp:BoundField DataField="GEEDESCRI" HeaderText="Especialidad" 
                            SortExpression="GEEDESCRI" />
                        <asp:BoundField DataField="MUNNOMMUN" HeaderText="Municipio" 
                            SortExpression="MUNNOMMUN" />
                        <asp:BoundField DataField="EstadoCita" HeaderText="Estado" ReadOnly="True" 
                            SortExpression="EstadoCita" />
                        <asp:BoundField DataField="FechaSolAf" HeaderText="Fecha Sol" ReadOnly="True" 
                            SortExpression="FechaSolAf" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        <asp:BoundField DataField="FechaDeseadaAf" HeaderText="Fecha Deseada" 
                            ReadOnly="True" SortExpression="FechaDeseadaAf" 
                            DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        <asp:BoundField DataField="FechaCitamedica" HeaderText="Fecha Cita" 
                            ReadOnly="True" SortExpression="FechaCitamedica" 
                            DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        <asp:BoundField DataField="Expr1" HeaderText="Op" SortExpression="Expr1" />
                        <asp:BoundField DataField="PVezDigitador" HeaderText="P.V.Us" 
                            SortExpression="PVezDigitador" />
                        <asp:BoundField DataField="PrimeraVez" HeaderText="P.V.Sist" 
                            SortExpression="PrimeraVez" />
                        <asp:BoundField DataField="UsAsigno" HeaderText="Us Asigno" 
                            SortExpression="UsAsigno" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGrid" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>" 
                    
                    
                  
                    SelectCommand="SELECT CMNCITMED_1.OID AS IdCita, CASE WHEN GENPACIEN_1.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN_1.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocAf, GENPACIEN_1.PACNUMDOC AS NumDocAf, CONVERT (char(10), GENPACIEN_1.GPAFECNAC, 103) AS FechaNacAf, CASE WHEN GENPACIEN_1.GPASEXPAC = 1 THEN 'M' ELSE CASE WHEN GENPACIEN_1.GPASEXPAC = 2 THEN 'F' ELSE 'X' END END AS SexoAf, GENPACIEN_1.PACPRIAPE, GENPACIEN_1.PACSEGAPE, GENPACIEN_1.PACPRINOM, GENPACIEN_1.PACSEGNOM, GENDETCON.GDENOMBRE AS EpsAf, GENESPECI.GEEDESCRI, CASE WHEN CMNCITMED_1.CCMESTADO = 0 THEN 'Asignada' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 1 THEN 'Cancelada' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 2 THEN 'Cumplida' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 3 THEN 'Incumplida' ELSE CASE WHEN CMNCITMED_1.CCMESTADO = 4 THEN 'Facturada' ELSE 'Inatención' END END END END END AS EstadoCita, CMNCITMED_1.CCMFECASI AS FechaSolAf, CMNCITMED_1.CCMFECPAC AS FechaDeseadaAf, CMNCITMED_1.CCMFECCUM AS FechaCitamedica, GENDETCON.GDECODIGO, GENMUNICI.MUNNOMMUN, DATEDIFF(DAY, CMNCITMED_1.CCMFECPAC, CMNCITMED_1.CCMFECCIT) AS Expr1, CMNCITMED_1.CCMESTCIT, CONVERT (char(3), GENDETCON.GDECODIGO) AS Expr2, CASE WHEN (SELECT COUNT(CMNCITMED.GENESPECI) AS Expr2 FROM CMNCITMED INNER JOIN GENPACIEN ON CMNCITMED.GENPACIEN = GENPACIEN.OID WHERE (CMNCITMED.CCMESTADO = 2) AND (CMNCITMED.OID &lt; CMNCITMED_1.OID) AND (CONVERT (char(4) , CMNCITMED.CCMFECCUM , 102) = '2017') AND (GENPACIEN.PACNUMDOC = GENPACIEN_1.PACNUMDOC) AND (CMNCITMED.GENESPECI = CMNCITMED_1.GENESPECI)) = 0 THEN 'Si' ELSE 'No' END AS PrimeraVez, CASE WHEN CCMESTCIT = 0 THEN 'Si' ELSE 'No' END AS PVezDigitador, GENUSUARIO.USUNOMBRE AS UsAsigno, DATEDIFF(DAY, CMNCITMED_1.CCMFECASI, CMNCITMED_1.CCMFECCUM) AS Prueba FROM GENCONTRA INNER JOIN GENDETCON ON GENCONTRA.OID = GENDETCON.GENCONTRA1 RIGHT OUTER JOIN CMNCITMED AS CMNCITMED_1 INNER JOIN GENPACIEN AS GENPACIEN_1 ON CMNCITMED_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON CMNCITMED_1.GENESPECI = GENESPECI.OID INNER JOIN GENMUNICI ON GENPACIEN_1.DGNMUNICIPIO = GENMUNICI.OID INNER JOIN GENUSUARIO ON CMNCITMED_1.GENUSUARIO1 = GENUSUARIO.OID ON GENDETCON.OID = GENPACIEN_1.GENDETCON WHERE (GENPACIEN_1.DGNMUNICIPIO = COALESCE (NULLIF (@IdMunicpio, 0), GENPACIEN_1.DGNMUNICIPIO)) AND (CONVERT (char(3), GENDETCON.GDECODIGO) = COALESCE (NULLIF (@Subsidiado, N'000'), CONVERT (char(3), GENDETCON.GDECODIGO))) AND (GENCONTRA.GENTERCER1 = COALESCE (NULLIF (@IdTercero, 0), GENCONTRA.GENTERCER1))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMunicipios" Name="IdMunicpio" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListRegimen" Name="Subsidiado" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListTerceros" Name="IdTercero" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" 
                    style="font-size: 12pt; font-weight: 700; color: #FF0000" Visible="False"></asp:Label>
                
                <asp:Label ID="LabelConsulta" runat="server" 
                     Visible="False"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
    </table>

<%--    </ContentTemplate>
                    
                </asp:UpdatePanel>--%>
    <%--
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>--%>

</asp:Content>

