<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="VariosOCpCP.aspx.vb" Inherits="PaginaBase"  %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            text-align: center;
        }
       .auto-style6 {
           margin-bottom: 11px;
       }
        .auto-style7 {
            width: 246px;
        }
        .auto-style46 {
            font-size: medium;
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <asp:Panel ID="panelSolicitud" runat="server" Height="10px" Width="10px" >
          

    <table style="width: 10%;">
        <tr>
            <td>
                <asp:Button ID="Btn1" runat="server" Text="Pc_Tec" UseSubmitBehavior="false"  />
            </td>
            <td>
                <asp:Button ID="Btn2" runat="server" Text="Tipo_Sop" UseSubmitBehavior="false"  />
            </td>
            <td>
                <asp:Button ID="Btn3" runat="server" Text="Varios" UseSubmitBehavior="false"  />
            </td>
           
            <td>
                <asp:Button ID="Btn4" runat="server" Text="Arreglar Soportes" />
 </td>
        </tr>

    
    </table>

          </asp:Panel>

       <br />
        <br />

    <asp:Panel ID="edit_even" runat="server">

        
        <table style="width: 100%;">
            <tr>
                <td colspan="2">Buscar Evento&nbsp;<br />
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>


    </asp:Panel>



    <asp:Panel ID="Panasi" runat="server">
        <table style="width:50%;">
            <tr >
                <td class="auto-style1" colspan="4">  ASIGNAR TECNICO A EQUIPO</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Lugar</strong></td>
                <td class="auto-style2"><strong>Equipo</strong></td>
                <td class="auto-style2"><strong>Tecnico</strong></td>
                <td rowspan="2">
                    <asp:Button ID="Btng1" runat="server" Text="Actualizar" UseSubmitBehavior="false" />
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:DropDownList ID="List1area" runat="server" AutoPostBack="True" DataSourceID="SqlDataArea" DataTextField="NombreDependecia" DataValueField="NombreDependecia">
                        <asp:ListItem>_</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataArea" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString2 %>" SelectCommand="SELECT NombreDependecia FROM Sis_HV_Dependencias WHERE (NombreDependecia NOT LIKE N'%BODEGA%') OR (NombreDependecia NOT LIKE N'%_%') ORDER BY NombreDependecia"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="Serial" runat="server" AutoPostBack="True" CssClass="auto-style6" DataSourceID="SqlDataSourcePc0" DataTextField="NombreEquipo" DataValueField="Serial">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePc0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString2 %>" SelectCommand="SELECT DISTINCT Sis_HV_Equipos.Serial, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_Dependencias INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_Dependencias.IdDependencia = Sis_HV_PuntosTrabajo.IdDependencia INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Dependencias.NombreDependecia = @DEPE) AND (Sis_HV_UbicacionesEquipos.NombreEquipo &gt; N'0') order by Sis_HV_UbicacionesEquipos.NombreEquipo">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="List1area" Name="DEPE" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="asignaList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Responsable" DataValueField="UserName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnDB_Usuarios %>" SelectCommand="SELECT DISTINCT CASE WHEN aspnet_Users.UserName = 'ASI001' THEN 'Johana Gutierrez' WHEN aspnet_Users.UserName = 'ASI002' THEN 'Sebastian Mora' WHEN aspnet_Users.UserName = 'SUA001' THEN 'Alirio Rodriguez' WHEN aspnet_Users.UserName = 'SUA007' THEN 'Fabian Goyeneche' WHEN aspnet_Users.UserName = 'SUA009' THEN 'Diego Agudelo' WHEN aspnet_Users.UserName = 'SUA011' THEN ' Emerson González ' END AS Responsable, aspnet_Users.UserName FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId WHERE (aspnet_Users.UserName LIKE '%asi%') AND (aspnet_Membership.IsLockedOut = 0) ORDER BY aspnet_Users.UserName"></asp:SqlDataSource>
                </td>
            </tr>
            
        </table>
    </asp:Panel>
      <asp:Panel ID="Pantisop" runat="server">
        Crear Tipos de Soporte<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Crear" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataTisop">
            <Columns>
                <asp:BoundField DataField="Tipo_Man" HeaderText="Tipo_Man" SortExpression="Tipo_Man" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataTisop" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString2 %>" SelectCommand="SELECT [Tipo_Man] FROM [Sis_HV_TiposMantenimiento]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Sis_HV_Novedad WHERE (Estado = 5) AND (Fech_Sol &gt; '07/31/2020 23:00:00')" UpdateCommand="UPDATE Sis_HV_Novedad SET Id_Job='ASI002',Estado= 1 where Estado= 5 and (Fech_Sol &gt;'07/31/2020 23:00:00')"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, Id_Evento, Id_Equipo, NomEquipo, Actividad, Fech_En, Area, Id_Job, Aud_Time_Act, Estado, Id_Cierre, Obs_Cierre, Aud_Time_cierre, Tipo_Man, Prioridad FROM Sis_HV_Historial WHERE (Estado = 5) AND (Fech_En &gt; '07/31/2020 23:00:00')" UpdateCommand="UPDATE Sis_HV_Historial SET Id_Job = 'ASI002', Estado = 1 WHERE (Estado = 5) AND (Fech_En &gt; '07/31/2020 23:00:00')"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, Id_Evento, Id_Equipo, Fech_Sol, Nota, Id_Sol, Id_Job, Aud_Nov, Estado, Prioridad, Reabierto, Reasignado, Limt, FechLimt FROM Sis_HV_Novedad WHERE ( (Estado = 5) AND (Fech_Sol &gt; '07/31/2020 23:00:00')" UpdateCommand="UPDATE Sis_HV_Novedad SET Nota = 'Por motivo de contigencia COVID-19 se suspende el mantenimiento preventivo de este equipo que se tenia programado para esta fecha', Estado = 4, Aud_Nov = '01/08/2020 10:00:00' WHERE (Estado = 5) AND (Fech_Sol &lt; '08/01/2020 23:00:00')"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FROM" UpdateCommand="UPDATE Sis_HV_Historial SET Id_Cierre = 'Oficina Gestión de la Información', Obs_Cierre = 'Por motivo de contigencia COVID-19 se suspende el mantenimiento preventivo de este equipo que se tenia programado para esta fecha', Aud_Time_cierre = '01/08/2020 10:00:00', Estado = 4 WHERE (Estado = 5) AND (Fech_En &lt; '07/31/2020 23:00:00')"></asp:SqlDataSource>
        <br />
     </asp:Panel>
    <asp:Panel ID="PanVarios" runat="server">
        <asp:Button ID="Button2" runat="server" Text="Asignar Plan a ASI001" />
        <asp:Button ID="Button3" runat="server" Text="Button" Enabled="False" Visible="False" />
       
        <asp:Button ID="Button5" runat="server" Text="Button OK" />
       
     </asp:Panel>
    <asp:Panel ID="Panel4" runat="server">
        1<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" Text="Impresoras" />
&nbsp;<strong><asp:Label ID="Lbsalario" runat="server" CssClass="auto-style46"></asp:Label>
        &nbsp;</strong>1
        <asp:Label ID="Label1" runat="server" ></asp:Label>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataVarios" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT * FROM [Aud_HMLGCASV4]"></asp:SqlDataSource>




    <asp:SqlDataSource ID="SqlDataVarios2" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnDB_Usuarios %>" SelectCommand="SELECT * FROM [vw_aspnet_Applications]"></asp:SqlDataSource>




</asp:Content>
