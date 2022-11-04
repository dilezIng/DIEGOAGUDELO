<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Mantenimiento.ascx.vb" Inherits="Sistemas_Bitacora_PMP_Mantenimiento" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


 <script language="javascript">

     function ShowModalPopup() {

         $find("Panel1_ModalPopupExtender").show();

     }

     function HideModalPopup() {

         $find("Panel1_ModalPopupExtender").hide();

     }

</script>
  

<style type="text/css">
   
    .style2
        {
            width: 100%;
            border: 1px solid #7AC2FC;
            background-color: #FF0000;
        }
        
    .style4
    {
        width: 10%;
        height: 26px;
    }
    .style6
    {
        width: 7%;
        height: 63px;
    }
    .style7
    {
        height: 63px;
    }
    .style8
    {
        height: 19px;
    }
    .style9
    {
        width: 23%;
    }
    .style10
    {
        width: 7%;
    }
    .auto-style1 {
        height: 63px;
        width: 684px;
        text-align: center;
    }
    .auto-style2 {
        height: 23px;
    }
    .auto-style3 {
        text-align: center;
    }
    .auto-style4 {
        width: 100%;
    }
    .auto-style5 {
        width: 141px;
    }
    .auto-style6 {
        text-align: right;
    }
    .auto-style8 {
        color: #0000FF;
        background-color: #FFFFFF;
    }
    .auto-style9 {
        color: #FF0000;
        font-weight: bold;
    }
    .auto-style10 {
        text-align: left;
    }
    .auto-style11 {
        text-align: left;
        width: 334px;
    }
    .auto-style12 {
        text-align: right;
        width: 334px;
    }
</style>
   

            <asp:Panel ID="Panelmantenimiento" runat="server">
                    <table style="width: 87%">
                    <tr>
                        <td colspan="3" 
                            
                            style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;" 
                            class="style8">
                            MANTENIMIENTO A EQUIPOS
                            <asp:Label ID="LabelEstadoForm" runat="server"></asp:Label>
                       
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="style6">
                            <asp:Label ID="Label1" runat="server" Text="Solicitud: "></asp:Label>
<asp:Label id="Labelevent" runat="server" ></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            
                            <asp:TextBox ID="Codigo" runat="server" ReadOnly="true" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>
                            
                        </td>
                        <td class="auto-style1">
                            <table class="auto-style4">
                                <tr>
                                    <td class="auto-style5">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="auto-style6">
                                        &nbsp;</td>
                                    <td class="auto-style12">
                                        <strong>
                                        <asp:Label ID="Label12" runat="server" CssClass="auto-style8" Text="Cerrar solicitud "></asp:Label>
                                        </strong>
                                    </td>
                                    <td class="auto-style10"><strong>
                                        <asp:DropDownList ID="ListEstado" runat="server" CssClass="auto-style9">
                                            <asp:ListItem Value="1">No</asp:ListItem>
                                            <asp:ListItem Value="2">Si</asp:ListItem>
                                        </asp:DropDownList>
                                        </strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                      <td class="style7">
                      
                      <asp:TextBox ID="User" runat="server" Visible="false"></asp:TextBox>
                          <asp:Button ID="Btnguardar" runat="server" Text="Guardar" UseSubmitBehavior="false" />
                      </td>
                    </tr>
                    <tr>
                    <td colspan="3" class="auto-style2">
                     <asp:Label ID="LabelMsg1" runat="server" Visible="false"></asp:Label> 
                    
                        <asp:Label ID="notavalida" runat="server"  ForeColor="Red" Font-Bold="true" ></asp:Label>
                    
                    </td>
                    </tr>

                    <tr>
                        <td class="style4" style="text-align: LEFT;" colspan="3">
                            <asp:Label ID="Label9" runat="server" Text="Mantenimiento:  "></asp:Label>  
                      
                            <asp:TextBox ID="Nota" TextMode="MultiLine" Wrap="true" runat="server" Height="100px" Width="1000px" ValidationGroup="true"></asp:TextBox>
                        </td>
                   </tr>
                   <tr>
                        
                      
                   <td colspan="3">
                        <asp:GridView ID="GridEventos" runat="server" DataSourceID="DataGridView" 
                         AutoGenerateColumns="False" 
                         AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                         EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                          <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                            <asp:BoundField DataField="Id_Evento" HeaderText="Id_Evento" 
                                     SortExpression="Id_Evento"  ItemStyle-Width="50px">
                                 </asp:BoundField>
                                <asp:BoundField DataField="Id_Equipo" HeaderText="Id_Equipo" 
                                     SortExpression="Id_Equipo"  ItemStyle-Width="50px">
                                 </asp:BoundField>
                                  <asp:BoundField DataField="Actividad" HeaderText="Actividad" 
                                    SortExpression="Actividad" >
                                 </asp:BoundField>
                                 <asp:BoundField DataField="Id_Job" HeaderText="Id_Job" 
                                      SortExpression="Id_Job"  ItemStyle-Width="50px">
                                 </asp:BoundField>
                                 <asp:BoundField DataField="Estado" HeaderText="Estado" 
                                      SortExpression="Estado"  ItemStyle-Width="100px">
                                 </asp:BoundField>
                              </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                   </asp:GridView>
               <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                     
                            
                            
                            SelectCommand="SELECT [Id_Evento], [Id_Equipo], [Actividad], [Id_Job], CASE WHEN Estado = 4 THEN 'Aprobado' ELSE 'Pendiente' END AS Estado FROM [Sis_HV_Historial] WHERE ([Id_Equipo] = @Codigo) order by Id_Evento">  
             
             
                <SelectParameters>
                        
                         <asp:ControlParameter ControlID="Codigo" Name="Codigo" />
                     </SelectParameters>
                     </asp:SqlDataSource>
                    </td>
                  </tr>
                  <tr>
                     <td class="style10">

                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" BorderColor="White" 
                                BorderStyle="None" Font-Bold="True" ForeColor="Blue" ReadOnly="True"></asp:TextBox>
                     </td>
                     <td class="style9" colspan="2">
                   
                        
                   <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Fosyga.aspx" style="font-family: Tahoma; font-size: 8pt; color:White " />  
                     <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
 <asp:SqlDataSource ID="DataTime" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="Dataevent0" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
                         <asp:SqlDataSource ID="Dataevent" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
                 </tr>
                </table>
                <br />
            </asp:Panel>
        
<asp:panel  ID="Panel_evento" runat="server">

<Table tyle="width: 100%">
    <tr ><td>

  

         <div class="auto-style3">
             <asp:Chart ID="Chart1" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource3" EnableViewState="True" SuppressExceptions="True" ViewStateContent="Default, Appearance" Width="426px" IsMapAreaAttributesEncoded="True">
                 <series>
                     <asp:Series ChartType="Pie" Legend="Legend1" Name="Mantenimientos" XValueMember="Estado" YValueMembers="Cantidad" Font="Tahoma, 20.25pt, style=Bold" IsValueShownAsLabel="True" IsXValueIndexed="True">
                         <EmptyPointStyle CustomProperties="DrawingStyle=LightToDark, LabelStyle=Bottom" />
                     </asp:Series>
                 </series>
                 <chartareas>
                     <asp:ChartArea Name="ChartArea1">
                         <axisx textorientation="Stacked">
                         </axisx>
                         <Area3DStyle Enable3D="True" Inclination="20" Rotation="20" />
                     </asp:ChartArea>
                 </chartareas>
                 <legends>
                     <asp:Legend Alignment="Far" LegendStyle="Column" Name="Legend1" Title="Mantenimientos">
                     </asp:Legend>
                 </legends>
                 <titles>
                     <asp:Title Alignment="TopCenter" Font="Microsoft Sans Serif, 12pt" Name="Total Mantenimientos" Text="Total Mantenimientos">
                     </asp:Title>
                 </titles>
             </asp:Chart>
         </div>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN Estado = 1 THEN 'Pendiente' ELSE (CASE WHEN Estado = 2 THEN 'En Curso ' ELSE 'Reabierto' END) END AS Estado, COUNT(*) AS Cantidad FROM Sis_HV_Historial WHERE (Estado < 4) AND (Id_Job = @User0)GROUP BY Estado">
               <SelectParameters>
                                       
                                          
                                        <asp:ControlParameter ControlID="User0" Name="User0" />
                                  
                                    </SelectParameters>

         </asp:SqlDataSource>

  

         </td></tr>
<tr>
<td style="text-align:left; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;" class="style8">
 <asp:TextBox ID="TextBoxev" runat="server" BorderColor="#7AC2FC" 
                                BorderStyle="None" Font-Bold="True" ForeColor="White" ReadOnly="True" 
                                BackColor="#7AC2FC" Wrap="False"></asp:TextBox>

</td>

</tr>

<tr>
<td    style="text-align: center; color: #FFFFFF; font-weight: bold; font-size: 25px;" class="style2">
                            Mantenimientos Solicitados excedidos de tiempo&nbsp;
                            <asp:Label ID="LabelEstadoForm4" runat="server"></asp:Label>
                      
                        </td>

</tr>
<tr>
<td>
</asp:Table>
<asp:GridView ID="GridEvento" runat="server" AutoGenerateColumns="False" class="style2" DataKeyNames="Evento"
                DataSourceID="DataListevent" EmptyDataText="No hay Eventos Pendientes con +4 dìas ." AllowSorting="True" >
                                                                    <Columns>
                                                                           <asp:CommandField ShowSelectButton="True" />
                                                   <asp:BoundField DataField="Evento" HeaderText="Evento" 
                                                       SortExpression="Evento" />
                                                   <asp:BoundField DataField="Equipo" HeaderText="Equipo" 
                                                       SortExpression="Equipo" />
                                                   <asp:BoundField DataField="Solicita" HeaderText="Solicita" 
                                                       SortExpression="Solicita" />
                                                   <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" 
                                                       SortExpression="Solicitud" />
                                                   <asp:BoundField DataField="Dias" HeaderText="Dias" 
                                                       SortExpression="Dias" ReadOnly="True" />

                                                       <asp:BoundField DataField="Horas" HeaderText="Horas" 
                                                       SortExpression="Horas" ReadOnly="True" />
                                                        <asp:BoundField DataField="Min" HeaderText="Min" 
                                                       SortExpression="Min" ReadOnly="True" />
                                                                        <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable" />
                                                                           <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                                                                           <asp:BoundField DataField="Prioridad_Horas" HeaderText="Prioridad_Horas" SortExpression="Prioridad_Horas" />
                                                                           <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                                               </Columns>
                                           </asp:GridView>
                                <asp:SqlDataSource ID="DataListevent" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                                
                                               
        
        SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, DATEDIFF(day, Sis_HV_Novedad.Fech_Sol, GETDATE()) AS Dias, DATEDIFF(Minute, Sis_HV_Novedad.Fech_Sol, GETDATE()) / 60 % 24 AS Horas, DATEDIFF(Minute, Sis_HV_Novedad.Fech_Sol, GETDATE()) % 60 AS Min, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Area, Sis_HV_Historial.Prioridad AS Prioridad_Horas, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 1 THEN 'En curso' END AS Estado FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) &gt; Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1) AND (Sis_HV_Novedad.Id_Job = @User0) ORDER BY Dias DESC">
                                    <SelectParameters>
                                       
                                          <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />
                                        <asp:ControlParameter ControlID="User0" Name="User0" />
                                  
                                    </SelectParameters>
                                </asp:SqlDataSource>

</td>
</tr>
<tr>
<td   style="text-align: center; background-image: url('../../Images/Fondo04.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;" class="style8">
                            Mantenimientos solicitados
                            <asp:Label ID="LabelEstadoForm1" runat="server"></asp:Label>
                      
                        </td>

</tr>

<tr>
<td>
<asp:GridView ID="GridEvento2" runat="server" AutoGenerateColumns="False" DataKeyNames="Evento"
                DataSourceID="DataListevent2" EmptyDataText="No hay Eventos Pendientes." AllowSorting="True"
                                              BackColor="#F0F0F0" >
                                                                    <Columns>
                                                                           <asp:CommandField ShowSelectButton="True" />
                                                   <asp:BoundField DataField="Evento" HeaderText="Evento" 
                                                       SortExpression="Evento" />
                                                   <asp:BoundField DataField="Equipo" HeaderText="Equipo" 
                                                       SortExpression="Equipo" />
                                                   <asp:BoundField DataField="Solicita" HeaderText="Solicita" 
                                                       SortExpression="Solicita" />
                                                   <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" 
                                                       SortExpression="Solicitud" />
                                                   <asp:BoundField DataField="Dias" HeaderText="Dias" 
                                                       SortExpression="Dias" ReadOnly="True" />

                                                       <asp:BoundField DataField="Horas" HeaderText="Horas" 
                                                       SortExpression="Horas" ReadOnly="True" />

                                                        <asp:BoundField DataField="Min" HeaderText="Min" 
                                                       SortExpression="Min" ReadOnly="True" />
                                                   <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable" />
                                                     <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />                      
                                                                           <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad" />
                                                                           <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                                               </Columns>
                                           </asp:GridView>
                                <asp:SqlDataSource ID="DataListevent2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                                                
                                               
        
        SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, DATEDIFF(day, Sis_HV_Novedad.Fech_Sol, GETDATE()) AS Dias, DATEDIFF(Minute, Sis_HV_Novedad.Fech_Sol, GETDATE()) / 60 % 24 AS Horas, DATEDIFF(Minute, Sis_HV_Novedad.Fech_Sol, GETDATE()) % 60 AS Min, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Area, Sis_HV_Historial.Prioridad, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 1 THEN 'En Proceso'  END AS Estado FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) &lt;= Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1) AND (Sis_HV_Novedad.Id_Job = @User0) ORDER BY Dias DESC">
                                    <SelectParameters>
                                       
                                          <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />
                                   <asp:ControlParameter ControlID="User0" Name="User0" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

</td>
</tr>

<tr>
<td>

    <asp:TextBox ID="User0" runat="server" Visible="false"></asp:TextBox>

</td>
</tr>
<tr>
<td>
    <asp:Label ID="LabelMsg" runat="server" BackColor="LightSeaGreen" Font-Size="Large"></asp:Label>
  </td>
</tr>
<tr>
<td  class="style8" style="text-align: center; color: #FFFFFF; font-weight: bold; font-size: 25px; background-image:url('../../Images/Fondo03.jpg')" >

    Mantenimientos Reabiertos
    <asp:Label ID="Label3" runat="server"></asp:Label>


</td>
    <tr>
        <td class="style1">
            <asp:GridView ID="Gridopen" runat="server" AllowSorting="True" DataKeyNames="evento" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  EmptyDataText="No hay Eventos Pendientes.">
                <AlternatingRowStyle BackColor="#f1f1f1" />
                <Columns>
                
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="evento" HeaderText="evento" SortExpression="evento" />
                    <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
                    <asp:BoundField DataField="fecha_Solicitud" HeaderText="fecha_Solicitud" SortExpression="fecha_Solicitud" />
                    <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                    <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita" />
                    <asp:BoundField DataField="Dias" HeaderText="Dias" SortExpression="Dias" ReadOnly="True" />
                    <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable" />
                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Fech_Sol AS fecha_Solicitud, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Novedad.Id_Sol AS Solicita, DATEDIFF(day, Sis_HV_Novedad.Fech_Sol, GETDATE()) AS Dias, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Area FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado = 3) AND (Sis_HV_Novedad.Id_Job = @User0) ORDER BY Dias DESC">


                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" PropertyName="Text" />
                    <asp:ControlParameter ControlID="User0" Name="User0" PropertyName="Text" />
                </SelectParameters>


            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style8" style="text-align: center; background-image: url('../../Images/Fondo02.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;">Mantenimientos Terminados
            <asp:Label ID="LabelEstadoForm3" runat="server"></asp:Label>
        </td>
        <tr>
            <td>
                <asp:GridView ID="pendiente" runat="server" AllowSorting="True" DataKeyNames="Evento" AutoGenerateColumns="False" DataSourceID="DataListeventp" EmptyDataText="No hay Eventos Pendientes.">
                    <AlternatingRowStyle BackColor="#f1f1f1" />
                    <Columns>
                        <%-- <asp:CommandField ShowSelectButton="True" /> --%>
                        <asp:CommandField SelectText="Revisar" ShowSelectButton="True" />
                        <asp:BoundField DataField="evento" HeaderText="Evento" SortExpression="evento" />
                        <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
                        <asp:BoundField DataField="fecha_Solicitud" HeaderText="Fecha_Solicitud" SortExpression="fecha_Solicitud" />
                        <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                        <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita" />
                        <asp:BoundField DataField="Dias" HeaderText="Dias" SortExpression="Dias" ReadOnly="True" />
                        <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable" />
                        <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        <asp:BoundField DataField="Estados" HeaderText="Estados" ReadOnly="True" SortExpression="Estados" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataListeventp" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Fech_Sol AS fecha_Solicitud, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Novedad.Id_Sol AS Solicita, DATEDIFF(day, Sis_HV_Novedad.Fech_Sol, Sis_HV_Historial.Fech_En) AS Dias, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 2 THEN 'PENDIENTE' ELSE 'Aprobado' END AS Estados FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado=2) or (Sis_HV_Novedad.Estado=4) AND (Sis_HV_Novedad.Id_Job = @User0) ORDER BY Sis_HV_Novedad.Estado DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="User0" DefaultValue="" Name="User0" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </tr>
</tr>




</Table>

</asp:panel>
<asp:Panel ID="History" runat="server">
    <asp:SqlDataSource ID="History0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Date AS Fecha, CASE WHEN Solicita IS NULL THEN ' ' ELSE Solicita END AS Solicito, CASE WHEN NotaSolicita IS NULL THEN ' ' ELSE NotaSolicita END AS Nota, CASE WHEN Realiza IS NULL THEN ' ' ELSE Realiza END AS Responsable, CASE WHEN NotaRealiza IS NULL THEN ' ' ELSE NotaRealiza END AS Actividad FROM Sis_HV_NOVHIST WHERE (Evento = @TextBox2) ORDER BY Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="TextBox2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

        <div class="auto-style3">
            <br />
            <strong>
            <asp:Label ID="Label10" runat="server" Text="Evento : "> </asp:Label>
            </strong>
            <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="Blue" ReadOnly="True" Width="288px"></asp:TextBox>
            <br />
            <br />
    </div>
    <asp:GridView ID="GridView2" runat="server" AlternatingRowStyle-BackColor="#cccccc" AutoGenerateColumns="False" DataSourceID="History0" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Solicito" HeaderText="Solicito" ReadOnly="True" SortExpression="Solicito" />
            <asp:BoundField DataField="Nota" HeaderText="Nota" ReadOnly="True" SortExpression="Nota" />
            <asp:BoundField DataField="Responsable" HeaderText="Responsable" ReadOnly="True" SortExpression="Responsable" />
            <asp:BoundField DataField="Actividad" HeaderText="Actividad" ReadOnly="True" SortExpression="Actividad" />
        </Columns>
    </asp:GridView>

        <br />
        <asp:Button ID="Button1" runat="server" Text="Regresar" OnClick="Page_Load" />
  





</asp:Panel>
