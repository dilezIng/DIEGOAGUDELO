<%@ Page Title="Gestionar" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Tablero.aspx.vb" Inherits="Mantenimiento_Asignacion_Asignacion" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 949px;
    }
        .style2
        {
            width: 100%;
            border: 1px solid #7AC2FC;
            background-color: #FF0000;
        }
        
         .style3
        {
            width: 949px;
            text-align: center;
       Border-color:Black;
        }
        .style4
        {
            height: 23px;
            font:medium ;
            font-family:Tahoma;
        }
        .auto-style8 {
            width: 1022px;
        }
        .auto-style9 {
            width: 1022px;
            border: 1px solid #7AC2FC;
            background-color: #FF0000;
        }
        .auto-style11 {
            width: 1022px;
            height: 23px;
        }
        .auto-style12 {
            width: 1022px;
            border: 1px solid #7AC2FC;
            background-color: #FF0000;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    


     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    

<asp:panel  ID="Panel_Info" runat="server">

<Table tyle="width: 100%">

<tr>
<td style="text-align:left; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" 
        class="auto-style8">
 <asp:TextBox ID="TextBoxev" runat="server" BorderColor="#7AC2FC" 
                                BorderStyle="None" Font-Bold="True" ForeColor="White" ReadOnly="True" 
                                BackColor="#7AC2FC" Wrap="False"></asp:TextBox>

</td>

    <tr>
        <td align="center" class="auto-style8">
            <asp:Chart ID="Chart1" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource3" EnableViewState="True" SuppressExceptions="True" ViewStateContent="Default, Appearance" Width="426px"><series>
<asp:Series ChartArea="ChartArea1" ChartType="Pie" Font="Perpetua Titling MT, 20.25pt, style=Bold" IsValueShownAsLabel="True" IsXValueIndexed="True" Legend="Legend1" Name="Mantenimientos" XValueMember="Estado" YValueMembers="Cantidad">
<emptypointstyle customproperties="DrawingStyle=LightToDark, LabelStyle=Bottom" />
</asp:Series>
</series>
<chartareas>
<asp:ChartArea Name="ChartArea1">
<area3dstyle enable3d="True" inclination="20" rotation="20" />
</asp:ChartArea>
</chartareas>
<legends>
<asp:Legend Alignment="Far" LegendStyle="Column" Name="Legend1" Title="Mantenimientos"></asp:Legend>
</legends>
<titles>
<asp:Title Alignment="TopCenter" Font="Microsoft Sans Serif, 12pt" Name="Total Mantenimientos" Text="Total Mantenimientos"></asp:Title>
</titles>
</asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN Sis_HV_Historial.Id_Job = 'Pendiente' THEN 'Sin Asignar ' ELSE 'Asigando' END AS Estado, COUNT(*) AS Cantidad FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) &gt; Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado &lt; 4) GROUP BY Sis_HV_Novedad.Estado, Sis_HV_Historial.Id_Job">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style9" style="text-align: center; font-weight: bold; font-size: 25px;">Solicitudes Excedidas de Tiempo
            <asp:Label ID="LabelEstadoForm4" runat="server"></asp:Label>
        </td>
        <tr>
            <td class="auto-style8">
                </asp:table>
                <asp:GridView ID="GridEvento" AlternatingRowStyle-HorizontalAlign="Center"  RowStyle-HorizontalAlign="Center" runat="server" BackColor="White" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DataListevent" EmptyDataText="Sin Solicitudes Fuera de Tiempo de Limite ."  Height="5px">
                    <AlternatingRowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:ImageField ControlStyle-Height="100%" ControlStyle-Width="80%" DataImageUrlField="Semaforo" HeaderText="!¡" ItemStyle-HorizontalAlign="Center">
                            <controlstyle height="100%" width="80%" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
                        <asp:BoundField DataField="Equipo" HeaderText="Tipo/Equipo" SortExpression="Equipo"></asp:BoundField>
                        <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
                        <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
                        <asp:BoundField DataField="Utilizados" HeaderText="Utilizados" ReadOnly="True" SortExpression="Utilizados" ControlStyle-Font-Bold="true"   >
                           
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" ReadOnly="True" SortExpression="FechaEntrega" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataListevent" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT CASE WHEN Sis_HV_Historial.Id_Job = 'Pendiente' THEN '~/Images/Rojo3.png' else '~/Images/Rojo2.png'  END AS Semaforo, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' WHEN Sis_HV_Novedad.Estado = 1 THEN (CASE WHEN Sis_HV_Historial.Actividad = 'Pendiente' THEN 'En Espera' ELSE 'En Proceso' END) END AS Estado, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) / 24 AS Utilizados, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) &gt; Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1) ORDER BY Sis_HV_Novedad.Fech_Sol">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" style="font-weight: bold; font-size: 25px;">Solicitudes Reabiertas
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <tr>
                <td class="auto-style8">
                    <asp:GridView ID="Gridopen" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento" DataSourceID="SqlDataSource1" EmptyDataText="No hay solicitudes Reabiertas." >
                        <AlternatingRowStyle BackColor="#F1F1F1" />
                        <Columns>
                            <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
                            <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo"></asp:BoundField>
                            <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
                          
                            <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
                           
                            <asp:BoundField DataField="Utilizados" HeaderText="Utilizados" ReadOnly="True" SortExpression="Utilizados"></asp:BoundField>
                            <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" ReadOnly="True" SortExpression="FechaEntrega"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' WHEN Sis_HV_Novedad.Estado = 1 THEN (CASE WHEN Sis_HV_Historial.Actividad = 'Pendiente' THEN 'En Espera' ELSE 'En Proceso' END) END AS Estado, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) / 24 AS Utilizados, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado = 3) ORDER BY Sis_HV_Novedad.Fech_Sol">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td ></td>    </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
            </tr>
        </tr>
    </tr>

</tr>

</Table>

</asp:panel>



    


</asp:Content>

