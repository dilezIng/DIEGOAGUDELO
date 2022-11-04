<%@ Page Title="Estadisticas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="DiagnoProced.aspx.vb" Inherits="Indicadores_DiagnoProced" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
             <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1400px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                       


    <table style="width: 100%; font-family: tahoma;">
        <tr>
            <td colspan="4" 
                
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Estadisticas
                <asp:Label ID="LabelAño" runat="server"></asp:Label>

            </td>
        </tr>
        <tr>
            <td style="width: 25%">
                Seleccione un año:<asp:DropDownList ID="ListaAños" runat="server" AutoPostBack="True" 
                    DataSourceID="DataAño" DataTextField="Año" DataValueField="Año">
                </asp:DropDownList>
            </td>
            <td style="width: 25%">
        <asp:SqlDataSource ID="DataAño" runat="server" 
            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
            ProviderName="System.Data.SqlClient" 
            
                    
                    SelectCommand="SELECT CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111) HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) &gt; '2011') ORDER BY Año">
        </asp:SqlDataSource>
            </td>
            <td style="width: 25%">
                &nbsp;</td>
            <td style="width: 25%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:DataList ID="ListAños" runat="server" DataSourceID="DataAños" Width="100%" 
                    Visible="False">
                    <AlternatingItemStyle BackColor="#F0F0F0" />
                    <ItemTemplate>
                        <table style="border: 1px solid #CCCCCC; width: 100%">
                            <tr>
                                <td colspan="2" 
                                    
                                    style="vertical-align: top; color: #FFFFFF; font-weight: bold; background-image: url('../Images/Fondo03.jpg');">
                                    Año:
                                    <asp:Label ID="AñoLabel" runat="server" Text='<%# Eval("Año") %>' />
                                    &nbsp;&nbsp;&nbsp;&nbsp; Total pacientes atendidos en urgencias:
                                    <asp:Label ID="CantLabel" runat="server" Text='<%# Eval("Cant") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%; vertical-align: top;">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        BorderColor="#0033CC" BorderStyle="Solid" BorderWidth="2px" 
                                        DataSourceID="DataDiagnoAño" EmptyDataText="NO HAY DATOS PARA ESTE AÑO" 
                                        style="font-size: 10pt" Width="100%">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                                SortExpression="Cant" />
                                            <asp:BoundField DataField="DIACODIGO" HeaderText="Cod" 
                                                SortExpression="DIACODIGO" />
                                            <asp:BoundField DataField="DIANOMBRE" HeaderText="Diagnostico" 
                                                SortExpression="DIANOMBRE" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataDiagnoAño" runat="server" 
                                        ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                        ProviderName="System.Data.SqlClient" 
                                        SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año, GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN ADNDIAEGR ON ADNINGRESO.ADNEGRESO = ADNDIAEGR.ADNEGRESO INNER JOIN GENDIAGNO ON ADNDIAEGR.DIACODIGO = GENDIAGNO.OID WHERE (ADNDIAEGR.Tipo = 5) GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) AND (GENDIAGNO.DIACODIGO = N'I460' OR GENDIAGNO.DIACODIGO = N'I461' OR GENDIAGNO.DIACODIGO = N'I469' OR GENDIAGNO.DIACODIGO = N'I490' OR GENDIAGNO.DIACODIGO = N'R092' OR GENDIAGNO.DIACODIGO = N'R960' OR GENDIAGNO.DIACODIGO = N'R961') ORDER BY GENDIAGNO.DIACODIGO">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="AñoLabel" DefaultValue="" Name="Año" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 50%; vertical-align: top;">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                        BorderColor="#0033CC" BorderStyle="Solid" BorderWidth="2px" 
                                        DataSourceID="DataProcedAño" EmptyDataText="NO HAY DATOS PARA ESTE AÑO" 
                                        style="font-size: 10pt" Width="100%">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                                SortExpression="Cant" />
                                            <asp:BoundField DataField="SIPCODIGO" HeaderText="Cod" 
                                                SortExpression="SIPCODIGO" />
                                            <asp:BoundField DataField="SIPNOMBRE" HeaderText="Procedimiento" 
                                                SortExpression="SIPNOMBRE" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataProcedAño" runat="server" 
                                        ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                        ProviderName="System.Data.SqlClient" 
                                        SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año, GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNSERHOJ ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) AND (GENSERIPS.SIPCODIGO = N'25124' OR GENSERIPS.SIPCODIGO = N'38525' OR GENSERIPS.SIPCODIGO = N'38825' OR GENSERIPS.SIPCODIGO = N'39155' OR GENSERIPS.SIPCODIGO = N'37507')">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="AñoLabel" DefaultValue="" Name="Año" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" 
                                    style="vertical-align: top; background-color: #F0F0F0; font-weight: bold;">
                                    Cruce de variables precedentes</td>
                            </tr>
                            <tr>
                                <td style="width: 50%; vertical-align: top;">
                                    Pacientes egresaron vivos<asp:GridView ID="GridCruceVivos" runat="server" 
                                        AutoGenerateColumns="False" BorderColor="#339933" BorderStyle="Solid" 
                                        BorderWidth="2px" DataSourceID="DataCruceVivos" 
                                        EmptyDataText="NO HAY DATOS PARA ESTE AÑO" style="font-size: 10pt" Width="100%">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                                SortExpression="Cant" />
                                            <asp:BoundField DataField="DIACODIGO" HeaderText="Cod Diag" 
                                                SortExpression="DIACODIGO" />
                                            <asp:BoundField DataField="DIANOMBRE" HeaderText="Diagnostico" 
                                                SortExpression="DIANOMBRE" />
                                            <asp:BoundField DataField="SIPCODIGO" HeaderText="Cod Proc" 
                                                SortExpression="SIPCODIGO" />
                                            <asp:BoundField DataField="SIPNOMBRE" HeaderText="Nombre Procedimiento" 
                                                SortExpression="SIPNOMBRE" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataCruceVivos" runat="server" 
                                        ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                        ProviderName="System.Data.SqlClient" 
                                        SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año, GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE, GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN ADNDIAEGR ON ADNINGRESO.ADNEGRESO = ADNDIAEGR.ADNEGRESO INNER JOIN GENDIAGNO ON ADNDIAEGR.DIACODIGO = GENDIAGNO.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNSERHOJ ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID INNER JOIN ADNEGRESO ON ADNINGRESO.ADNEGRESO = ADNEGRESO.OID WHERE (ADNDIAEGR.Tipo = 5) AND (ADNEGRESO.ADEMANMUE = 0) GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE, GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) AND (GENDIAGNO.DIACODIGO = N'I460' OR GENDIAGNO.DIACODIGO = N'I461' OR GENDIAGNO.DIACODIGO = N'I469' OR GENDIAGNO.DIACODIGO = N'I490' OR GENDIAGNO.DIACODIGO = N'R092' OR GENDIAGNO.DIACODIGO = N'R960' OR GENDIAGNO.DIACODIGO = N'R961') AND (GENSERIPS.SIPCODIGO = N'25124' OR GENSERIPS.SIPCODIGO = N'38525' OR GENSERIPS.SIPCODIGO = N'38825' OR GENSERIPS.SIPCODIGO = N'39155' OR GENSERIPS.SIPCODIGO = N'37507') ORDER BY GENDIAGNO.DIACODIGO">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="AñoLabel" DefaultValue="" Name="Año" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 50%; vertical-align: top;">
                                    Pacientes egresaron muertos<asp:GridView ID="GridCruceMuertos" runat="server" 
                                        AutoGenerateColumns="False" BorderColor="Red" BorderStyle="Solid" 
                                        BorderWidth="2px" DataSourceID="DataCruceMuertos" 
                                        EmptyDataText="NO HAY DATOS PARA ESTE AÑO" style="font-size: 10pt" 
                                        Width="100%">
                                        <AlternatingRowStyle BackColor="#F0F0F0" />
                                        <Columns>
                                            <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                                SortExpression="Cant" />
                                            <asp:BoundField DataField="DIACODIGO" HeaderText="Cod Diag" 
                                                SortExpression="DIACODIGO" />
                                            <asp:BoundField DataField="DIANOMBRE" HeaderText="Diagnostico" 
                                                SortExpression="DIANOMBRE" />
                                            <asp:BoundField DataField="SIPCODIGO" HeaderText="Cod Proc" 
                                                SortExpression="SIPCODIGO" />
                                            <asp:BoundField DataField="SIPNOMBRE" HeaderText="Nombre Procedimiento" 
                                                SortExpression="SIPNOMBRE" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="DataCruceMuertos" runat="server" 
                                        ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                        ProviderName="System.Data.SqlClient" 
                                        SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año, GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE, GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN ADNDIAEGR ON ADNINGRESO.ADNEGRESO = ADNDIAEGR.ADNEGRESO INNER JOIN GENDIAGNO ON ADNDIAEGR.DIACODIGO = GENDIAGNO.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNSERHOJ ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID INNER JOIN ADNEGRESO ON ADNINGRESO.ADNEGRESO = ADNEGRESO.OID WHERE (ADNDIAEGR.Tipo = 5) AND (ADNEGRESO.ADEMANMUE &lt;&gt; 0) GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE, GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) AND (GENDIAGNO.DIACODIGO = N'I460' OR GENDIAGNO.DIACODIGO = N'I461' OR GENDIAGNO.DIACODIGO = N'I469' OR GENDIAGNO.DIACODIGO = N'I490' OR GENDIAGNO.DIACODIGO = N'R092' OR GENDIAGNO.DIACODIGO = N'R960' OR GENDIAGNO.DIACODIGO = N'R961') AND (GENSERIPS.SIPCODIGO = N'25124' OR GENSERIPS.SIPCODIGO = N'38525' OR GENSERIPS.SIPCODIGO = N'38825' OR GENSERIPS.SIPCODIGO = N'39155' OR GENSERIPS.SIPCODIGO = N'37507') ORDER BY GENDIAGNO.DIACODIGO">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="AñoLabel" DefaultValue="" Name="Año" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" 
                                    
                                    style="vertical-align: top; color: #FFFFFF; font-weight: bold; background-image: url('../Images/Fondo02.jpg');">
                                    Discriminación Mensual</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border: thin solid #003300; vertical-align: top;">
                                    <asp:DataList ID="DataList1" runat="server" DataSourceID="DataMeses" 
                                        Width="100%">
                                        <AlternatingItemStyle BackColor="#FFFFCC" />
                                        <ItemTemplate>
                                            <table class="style1" style="border: 1px solid #CCCCCC; width: 100%">
                                                <tr>
                                                    <td colspan="2" style="vertical-align: top; font-weight: 700;">
                                                        Mes:
                                                        <asp:Label ID="MesLabel" runat="server" Text='<%# Eval("Mes") %>' />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total pacientes atendidos en urgencias:
                                                        <asp:Label ID="CantLabel" runat="server" Text='<%# Eval("Cant") %>' />
                                                        <asp:Label ID="MesNumLabel" runat="server" Text='<%# Eval("MesNum") %>' 
                                                            Visible="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%; vertical-align: top;">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                            DataSourceID="DataDiagno" EmptyDataText="NO HAY DATOS PARA ESTE MES" 
                                                            style="font-size: 10pt" Width="100%">
                                                            <AlternatingRowStyle BackColor="#F0F0F0" />
                                                            <Columns>
                                                                <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                                                    SortExpression="Cant" />
                                                                <asp:BoundField DataField="DIACODIGO" HeaderText="Cod" 
                                                                    SortExpression="DIACODIGO" />
                                                                <asp:BoundField DataField="DIANOMBRE" HeaderText="Diagnostico" 
                                                                    SortExpression="DIANOMBRE" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="DataDiagno" runat="server" 
                                                            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                                            ProviderName="System.Data.SqlClient" 
                                                            SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año, GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE, CONVERT (char(2), ADNINGRESO.AINFECING, 101) AS Mes FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN ADNDIAEGR ON ADNINGRESO.ADNEGRESO = ADNDIAEGR.ADNEGRESO INNER JOIN GENDIAGNO ON ADNDIAEGR.DIACODIGO = GENDIAGNO.OID WHERE (ADNDIAEGR.Tipo = 5) GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), GENDIAGNO.DIACODIGO, GENDIAGNO.DIANOMBRE, CONVERT (char(2), ADNINGRESO.AINFECING, 101) HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) AND (GENDIAGNO.DIACODIGO = N'I460' OR GENDIAGNO.DIACODIGO = N'I461' OR GENDIAGNO.DIACODIGO = N'I469' OR GENDIAGNO.DIACODIGO = N'I490' OR GENDIAGNO.DIACODIGO = N'R092' OR GENDIAGNO.DIACODIGO = N'R960' OR GENDIAGNO.DIACODIGO = N'R961') AND (CONVERT (char(2), ADNINGRESO.AINFECING, 101) = @Mes) ORDER BY GENDIAGNO.DIACODIGO">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="AñoLabel" DefaultValue="" Name="Año" 
                                                                    PropertyName="Text" />
                                                                <asp:ControlParameter ControlID="MesNumLabel" DefaultValue="" Name="Mes" 
                                                                    PropertyName="Text" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td style="width: 50%; vertical-align: top;">
                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                            DataSourceID="DataProcedMes" EmptyDataText="NO HAY DATOS PARA ESTE MES" 
                                                            style="font-size: 10pt" Width="100%">
                                                            <AlternatingRowStyle BackColor="#F0F0F0" />
                                                            <Columns>
                                                                <asp:BoundField DataField="Cant" HeaderText="Cant" ReadOnly="True" 
                                                                    SortExpression="Cant" />
                                                                <asp:BoundField DataField="SIPCODIGO" HeaderText="Cod" 
                                                                    SortExpression="SIPCODIGO" />
                                                                <asp:BoundField DataField="SIPNOMBRE" HeaderText="Procedimiento" 
                                                                    SortExpression="SIPNOMBRE" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="DataProcedMes" runat="server" 
                                                            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                                                            ProviderName="System.Data.SqlClient" 
                                                            SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año, GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNSERHOJ ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID WHERE (CONVERT (char(2), ADNINGRESO.AINFECING, 101) = @Mes) GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), GENSERIPS.SIPCODIGO, GENSERIPS.SIPNOMBRE HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) AND (GENSERIPS.SIPCODIGO = N'25124' OR GENSERIPS.SIPCODIGO = N'38525' OR GENSERIPS.SIPCODIGO = N'38825' OR GENSERIPS.SIPCODIGO = N'39155' OR GENSERIPS.SIPCODIGO = N'37507')">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="AñoLabel" DefaultValue="" Name="Año" 
                                                                    PropertyName="Text" />
                                                                <asp:ControlParameter ControlID="MesNumLabel" Name="Mes" PropertyName="Text" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="DataMeses" runat="server" 
                            ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT CASE WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '01') THEN 'Enero' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '02') THEN 'Febrero' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '03') THEN 'Marzo' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '04') THEN 'Abril' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '05') THEN 'Mayo' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '06') THEN 'Junio' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '07') THEN 'Julio' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '08') THEN 'Agosto' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '09') THEN 'Septiembre' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '10') THEN 'Octubre' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '11') THEN 'Noviembre' ELSE ('Diciembre') END AS Mes, COUNT(CONVERT (char(7), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(2), ADNINGRESO.AINFECING, 101) AS MesNum FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), CASE WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '01') THEN 'Enero' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '02') THEN 'Febrero' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '03') THEN 'Marzo' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '04') THEN 'Abril' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '05') THEN 'Mayo' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '06') THEN 'Junio' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '07') THEN 'Julio' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '08') THEN 'Agosto' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '09') THEN 'Septiembre' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '10') THEN 'Octubre' WHEN (CONVERT (char(2) , ADNINGRESO.AINFECING , 101) = '11') THEN 'Noviembre' ELSE ('Diciembre') END, CONVERT (char(2), ADNINGRESO.AINFECING, 101) HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) ORDER BY CONVERT (char(4), ADNINGRESO.AINFECING, 111), CONVERT (char(2), ADNINGRESO.AINFECING, 101)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="AñoLabel" Name="Año" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="DataAños" runat="server" 
                    ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=Reporteador;Password=reporteador2" 
                    ProviderName="System.Data.SqlClient" 
                    
                    SelectCommand="SELECT COUNT(CONVERT (char(4), ADNINGRESO.AINFECING, 111)) AS Cant, CONVERT (char(4), ADNINGRESO.AINFECING, 111) AS Año FROM ADNINGRESO INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID GROUP BY CONVERT (char(4), ADNINGRESO.AINFECING, 111) HAVING (CONVERT (char(4), ADNINGRESO.AINFECING, 111) = @Año) ORDER BY Año">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListaAños" Name="Año" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">
                &nbsp;</td>
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

