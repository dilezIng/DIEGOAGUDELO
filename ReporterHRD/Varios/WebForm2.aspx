<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master"  CodeFile="WebForm2.aspx.vb" Inherits="WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_UbicacionesEquipos.NombreEquipo, Sis_HV_Equipos.CodigoEquipo, Sis_HV_Equipos.Serial, Sis_HV_Equipos.Modelo, Sis_HV_Equipos.Descripcion, Sis_HV_Marcas.NombreMarca, Sis_HV_Equipos.Tecnico, Sis_HV_Dependencias.NombreDependecia FROM Sis_HV_UbicacionesEquipos INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo INNER JOIN Sis_HV_Marcas ON Sis_HV_Equipos.Marca = Sis_HV_Marcas.IdMarca INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_UbicacionesEquipos.IdPuntoTrabajo = Sis_HV_PuntosTrabajo.IdPuntoTrabajo INNER JOIN Sis_HV_Dependencias ON Sis_HV_PuntosTrabajo.IdDependencia = Sis_HV_Dependencias.IdDependencia WHERE (Sis_HV_UbicacionesEquipos.UbicacionActual = 1) ORDER BY Sis_HV_Equipos.Serial"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Sis_HV_Historial.Estado, Sis_HV_Historial.Id_Evento, Sis_HV_Historial.Fech_En, Sis_HV_Novedad.FechLimt, Sis_HV_Novedad.Limt, Sis_HV_Novedad.Aud_Nov, Sis_HV_Historial.Aud_Time_Act, Sis_HV_Novedad.Prioridad FROM Sis_HV_Historial INNER JOIN Sis_HV_Novedad ON Sis_HV_Historial.Id_Evento = Sis_HV_Novedad.Id_Evento WHERE (Sis_HV_Historial.Estado % 2 &lt;&gt; 0)"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Solicitud) AS Expr1, Solicitud FROM O2_Sum_Paciente GROUP BY Solicitud ORDER BY Expr1 DESC"></asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowSorting="True">
        <Columns>
              <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
              <asp:BoundField DataField="Id_Evento" HeaderText="Id_Evento" SortExpression="Id_Evento" />
              <asp:BoundField DataField="Fech_En" HeaderText="Fech_En" SortExpression="Fech_En" />
              <asp:BoundField DataField="FechLimt" HeaderText="FechLimt" SortExpression="FechLimt" />
              <asp:BoundField DataField="Limt" HeaderText="Limt" SortExpression="Limt" />
              <asp:BoundField DataField="Aud_Nov" HeaderText="Aud_Nov" SortExpression="Aud_Nov" />
              <asp:BoundField DataField="Aud_Time_Act" HeaderText="Aud_Time_Act" SortExpression="Aud_Time_Act" />
              <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad" />
        </Columns>
    </asp:GridView>
</asp:Content>