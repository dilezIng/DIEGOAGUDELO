<%@ Page Title="Actividad" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Actividad.aspx.vb" Inherits="Mantenimiento_Actividad" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
         .auto-style13 {
             height: 19px;
             color: #000000;
         }
         .auto-style14 {
             width: 100%;
             border: 1px solid #7AC2FC;
             background-color: #FF0000;
             color: #000000;
         }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" ToolTip="Mantenimientos y Soportes" ID="TabPanel5">
                            <HeaderTemplate> En Proceso
</HeaderTemplate>
                <ContentTemplate>
          <asp:Panel ID="Panelmantenimiento" runat="server">
                      <table style="width: 87%"><tr><td colspan="3" 
               style="text-align: center; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;" 
                            class="style8">MANTENIMIENTO A EQUIPOS <asp:Label ID="LabelEstadoForm" runat="server"></asp:Label>
      </td>
 </tr>  <tr>
 <td style="text-align: left;" class="style6">
 <asp:Label ID="Label1" runat="server" Text="Solicitud: "></asp:Label>
         <asp:Label id="Labelevent" runat="server" ></asp:Label>
 <br />
 <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
 <asp:TextBox ID="Codigo" runat="server" ReadOnly="True" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>  <br />
         <asp:Label ID="LabelMsg1" runat="server" Visible="False"></asp:Label>        <asp:Label ID="notavalida" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>        </td>
 <td class="auto-style1">
 <table class="auto-style4">
 <tr>
 <td class="auto-style5"></td>
 <td></td>
 <td class="auto-style11">
                    <asp:TextBox ID="User" runat="server" Visible="False"></asp:TextBox>   </td>
 <td></td>
 </tr>
 <tr>
 <td class="auto-style6"><strong>
       <asp:Label ID="Label14" runat="server" CssClass="auto-style8" Text="Cerrar solicitud "></asp:Label>                 </strong></td>
 
                 <td class="auto-style10"><strong>
   <asp:DropDownList ID="ListEstado" runat="server" CssClass="auto-style9">
 <asp:ListItem Value="1">No</asp:ListItem>
   <asp:ListItem Value="2">Si</asp:ListItem>
   </asp:DropDownList>    <asp:Button ID="BtnExportar" runat="server" BackColor="#7DC5FF" Text="Exportar" UseSubmitBehavior="False" />                       <asp:Button ID="Btnguardar" runat="server" BackColor="#7DC5FF" Text="Guardar" UseSubmitBehavior="False" /> </strong></td>
 
                 <td class="auto-style12"></td>
 <td class="auto-style10"></td>
 </tr>
 <tr>
 <td class="auto-style5"></td>
 <td>
                    </td>
 <td class="auto-style11"></td>
 <td></td>
 </tr>
 </table>
 </td>
 <td class="style7"></td>
 </tr>
 <tr>
 <td colspan="3" class="auto-style2">
            <asp:Label ID="Label13" runat="server" Text="Mantenimiento:  "></asp:Label>          </td>
 </tr>
 <tr>
 <td class="style4" style="text-align: LEFT;" colspan="3">
 <asp:TextBox ID="Nota" TextMode="MultiLine" runat="server" Height="100px" Width="1000px" ValidationGroup="true"></asp:TextBox>
         </td>
 </tr>
 <tr>
 <td class="style4" colspan="3" style="text-align: LEFT;"><strong>Adjuntar Archivos: </strong>
 <asp:FileUpload ID="FileUpload" runat="server" Width="234px" >
                   </asp:FileUpload>
                 </td>
 </tr>
 <tr>
 <td colspan="3"></td>
 </tr>
 <tr>
 <td class="style10">
 <br />
 <asp:TextBox ID="TextBox1" runat="server" BorderColor="White" 
   BorderStyle="None" Font-Bold="True" ForeColor="Blue" ReadOnly="True"></asp:TextBox>
 
</td>
 <td class="style9" colspan="2">
 <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Fosyga.aspx" style="font-family: Tahoma; font-size: 8pt; color:White " >
                    </asp:LoginStatus>
      <asp:SqlDataSource ID="DataConsultas" runat="server" 
       ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
                   <asp:SqlDataSource ID="DataTime" runat="server" 
       ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
 <asp:SqlDataSource ID="Dataevent0" runat="server" 
       ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
     <asp:SqlDataSource ID="Dataevent" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
 <asp:SqlDataSource ID="DataNov" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
     <asp:SqlDataSource ID="DataHis" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>"></asp:SqlDataSource>
 
</tr>
 </table> 
 <br />  </asp:Panel>

                      <asp:panel  ID="Panel_evento" runat="server">
 <Table tyle="width: 100%">
 <tr >
 <td>
 <div class="auto-style3">
 <asp:Chart ID="Chart1" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource3" EnableViewState="True" SuppressExceptions="True" ViewStateContent="Default, Appearance" Width="426px" IsMapAreaAttributesEncoded="True"><series>
<asp:Series ChartType="Pie" Legend="Legend1" Name="Mantenimientos" XValueMember="Estado" YValueMembers="Cantidad" Font="Tahoma, 20.25pt, style=Bold" IsValueShownAsLabel="True" IsXValueIndexed="True" ChartArea="ChartArea1">
<EmptyPointStyle CustomProperties="DrawingStyle=LightToDark, LabelStyle=Bottom" ></emptypointstyle>
</asp:Series>
</series>
<chartareas>
<asp:ChartArea Name="ChartArea1">
<axisx textorientation="Stacked"></axisx><Area3DStyle Enable3D="True" Inclination="20" Rotation="20" ></area3dstyle>
</asp:ChartArea>
</chartareas>
<legends>
<asp:Legend Alignment="Far" LegendStyle="Column" Name="Legend1" Title="Mantenimientos"></asp:Legend>
</legends>
<titles>
<asp:Title Alignment="TopCenter" Font="Microsoft Sans Serif, 12pt" Name="Total Mantenimientos" Text="Total Mantenimientos"></asp:Title>
</titles>
</asp:Chart>
    </div>
 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN Estado = 1 THEN 'Pendiente' ELSE (CASE WHEN Estado = 2 THEN 'En Curso ' ELSE 'Reabierto' END) END AS Estado, COUNT(*) AS Cantidad FROM Sis_HV_Historial WHERE (Estado < 4) AND (Id_Job = @User0)GROUP BY Estado">
 <SelectParameters>
 
                         
                     <asp:ControlParameter ControlID="User0" Name="User0" />
 
                         
                     </SelectParameters>
 
                     
                     </asp:SqlDataSource>
                
               
       </td>
 </tr>
 <tr>
 <td style="text-align:left; background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 12px;" class="style8">
 <asp:TextBox ID="TextBoxev" runat="server" BorderColor="#7AC2FC" 
   BorderStyle="None" Font-Bold="True" ForeColor="White" ReadOnly="True" 
   BackColor="#7AC2FC" Wrap="False"></asp:TextBox>
                         
                     
                   </td>
 </tr>
 <tr>
 <td    style="text-align: center; font-weight: bold; font-size: 25px;" class="auto-style14">Mantenimientos Solicitados excedidos de tiempo&#160;
 <asp:Label ID="LabelEstadoForm4" runat="server"></asp:Label>
                         
                     
                   </td>
 </tr>
 <tr>
 <td>
 </asp:Table>
 <asp:GridView ID="GridEvento" runat="server" AutoGenerateColumns="False" class="style2" DataKeyNames="Evento"
                DataSourceID="DataListevent" EmptyDataText="No hay Eventos Excedidos de tiempo." AllowSorting="True" Width="1266px" >
 <Columns>
   <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Images/Ok.png" />
    <asp:BoundField DataField="Evento" HeaderText="Evento" 
 SortExpression="Evento" />
    <asp:BoundField DataField="Equipo" HeaderText="Equipo" 
 SortExpression="Equipo" />
  <asp:BoundField DataField="Solicita" HeaderText="Solicita" 
 SortExpression="Solicita" />
    <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" 
 SortExpression="Solicitud" />
            <asp:BoundField DataField="Area" HeaderText="Area" 
 SortExpression="Area" />
    <asp:BoundField DataField="Estado" HeaderText="Estado" 
 SortExpression="Estado" ReadOnly="True" />
     <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" 
 SortExpression="Prioridad" ReadOnly="True" />
         <asp:BoundField DataField="Utilizadas" HeaderText="Utilizadas" SortExpression="Utilizadas" ReadOnly="True" />
           <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" SortExpression="FechaEntrega" ReadOnly="True" />
         </Columns>
    </asp:GridView>   <asp:SqlDataSource ID="DataListevent" runat="server" 
       ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
             SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 1 THEN 'En Proceso' END AS Estado, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) / 24 AS Utilizadas, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) &gt; Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1 OR Sis_HV_Novedad.Estado = 3)  ORDER BY Sis_HV_Novedad.Fech_Sol">
               <SelectParameters>
        <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />
       <asp:ControlParameter ControlID="User0" Name="User0" />
 </SelectParameters>
                         </asp:SqlDataSource>
       </td>
 </tr>
 <tr>
 <td   style="text-align: center; background-image: url('../../Images/Fondo04.jpg'); font-weight: bold; font-size: 25px;" class="auto-style13">Mantenimientos solicitados
 <asp:Label ID="LabelEstadoForm1" runat="server"></asp:Label>
        </td>
 </tr>
 <tr>
 <td>
             <asp:GridView ID="GridEvento2" runat="server" AutoGenerateColumns="False" DataKeyNames="Evento"
                DataSourceID="DataListevent2" EmptyDataText="No hay Eventos Pendientes." AllowSorting="True" 
     BackColor="#F0F0F0" Width="1257px" >
       <AlternatingRowStyle BackColor="White" />
 <Columns>
          
             <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Ok.png" SelectText="" ShowSelectButton="True" />
          
             <asp:BoundField DataField="Evento" HeaderText="Evento" 
 SortExpression="Evento" />
          
             <asp:BoundField DataField="Equipo" HeaderText="Equipo" 
 SortExpression="Equipo" />
          
             <asp:BoundField DataField="Solicita" HeaderText="Solicita" 
 SortExpression="Solicita" />
          
             <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" 
 SortExpression="Solicitud" />
          
             <asp:BoundField DataField="Area" HeaderText="Area" 
 SortExpression="Area" />
          
             <asp:BoundField DataField="Estado" HeaderText="Estado" 
 SortExpression="Estado" ReadOnly="True" />
          
             <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" 
 SortExpression="Prioridad" ReadOnly="True" />
          
             <asp:BoundField DataField="Utilizadas" HeaderText="Utilizadas" SortExpression="Utilizadas" ReadOnly="True" />
          
             <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" SortExpression="FechaEntrega" ReadOnly="True" />
          
             </Columns>
        
          <HeaderStyle BackColor="White" />
        
                          </asp:GridView>                       <asp:SqlDataSource ID="DataListevent2" runat="server" 
       ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
       SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 1 THEN 'En Proceso' END AS Estado, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) / 24 AS Utilizadas, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) &lt;= Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1) AND (convert(datetime,(CONVERT (VARCHAR(10), Sis_HV_Novedad.Fech_Sol, 101) + ' ' + CONVERT (VARCHAR(8),Sis_HV_Novedad.Fech_Sol, 108)),102) < GETDATE()) ORDER BY FechaEntrega">
 <SelectParameters>
          
             <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />                        <asp:ControlParameter ControlID="User0" Name="User0" />
</SelectParameters>
</asp:SqlDataSource>
</td>
 </tr>
 <tr>
 <td>
 <asp:TextBox ID="User0" runat="server" Visible="False"></asp:TextBox>
                         
                     
                   </td>
 </tr>
 <tr>
 <td>
 <asp:Label ID="LabelMsg" runat="server" BackColor="LightSeaGreen" Font-Size="Large"></asp:Label>
                         
                     
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
                         
                     
                   <br />
 <asp:Label ID="LabelError" runat="server" ></asp:Label>
                         
                     
                   </td>
 </tr>
 <tr>
 <td  class="auto-style13" style="text-align: center; font-weight: bold; font-size: 25px; background-image:url('../../Images/Fondo03.jpg')" >Mantenimientos Reabiertos
 <asp:Label ID="Label3" runat="server"></asp:Label>
                         
                     
                   </td>
 <tr>
 <td class="style1">







         





          <asp:GridView ID="Gridopen" runat="server" AllowSorting="True" DataKeyNames="Evento" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  EmptyDataText="No hay Eventos Pendientes." Width="1259px">
        
                          <AlternatingRowStyle BackColor="#F1F1F1" />
        
                          <Columns>
          <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Ok.png" ShowSelectButton="True" />
          <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" />
          <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
          <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita" />
          <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
          <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
          <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" ReadOnly="True" />
          <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad" ReadOnly="True" />
          <asp:BoundField DataField="Utilizadas" HeaderText="Utilizadas" SortExpression="Utilizadas" ReadOnly="True" />
          <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" ReadOnly="True" SortExpression="FechaEntrega" />
          </Columns>
        
                          </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 1 THEN 'En Proceso' END AS Estado, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) / 24 AS Utilizadas, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, GETDATE()) &lt;= Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 3)  ORDER BY FechaEntrega">
 <SelectParameters>
              
                     
         <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" PropertyName="Text" />
              
                     
         <asp:ControlParameter ControlID="User0" Name="User0" PropertyName="Text" />
              
                     
         </SelectParameters>
          </asp:SqlDataSource>
     </td>
 </tr>
 </Table>
   </asp:panel>                   
   
                     
   
   
   
   
   
                      
   
                            </ContentTemplate>
   </ajaxToolkit:TabPanel>
          <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" ToolTip="Mantenimientos y Soportes" ID="TabPanel1">
                            <HeaderTemplate> 
       Terminados
</HeaderTemplate>
                   <ContentTemplate>                           <asp:Panel ID="oo" runat="server">
                         <Table tyle="width: 100%"><tr><td class="style8" style="text-align: center; background-image: url('../../Images/Fondo02.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;">Mantenimientos por Aprobar <asp:Label ID="LabelEstadoForm3" runat="server"></asp:Label>
               </td>
                  <tr><td>
                     <asp:GridView ID="pendiente" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento"
            DataSourceID="DataListeventp" EmptyDataText="No hay Eventos Pendientes.">
              <AlternatingRowStyle BackColor="#F1F1F1" />
  <Columns>               <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                      <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita" />
     <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" />
                      <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
                 <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                     <asp:BoundField DataField="Fecha_Entrega" HeaderText="Fecha_Entrega" SortExpression="Fecha_Entrega" />
             <asp:BoundField DataField="Dias" HeaderText="Dias" ReadOnly="True" SortExpression="Dias" /> 
                <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />                          </Columns>
                       </asp:GridView>
 <asp:TextBox ID="User2" runat="server" Visible="False"></asp:TextBox>
                         <asp:SqlDataSource ID="DataListeventp" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Aud_Time_Act AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas, CASE WHEN Sis_HV_Novedad.Estado = 2 THEN 'PENDIENTE' ELSE 'Aprobado' END AS Estados FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado=2) ORDER BY Sis_HV_Novedad.Estado, Fecha_Entrega">       <SelectParameters>
                        <asp:ControlParameter ControlID="User2" Name="User2" PropertyName="Text" />
   </SelectParameters>           </asp:SqlDataSource>
                     <asp:GridView ID="pendiente0" runat="server" DataKeyNames="Evento" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DataListeventp0" EmptyDataText="No hay Eventos Pendientes.">                   <AlternatingRowStyle BackColor="#F1F1F1" />                   <Columns>
       <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
       <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita" />
       <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" />
       <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
       <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" >
<ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
</asp:BoundField>
       <asp:BoundField DataField="Fecha_Entrega" HeaderText="Fecha_Entrega" SortExpression="Fecha_Entrega" />
                      <asp:BoundField DataField="Dias" HeaderText="Dias" ReadOnly="True" SortExpression="Dias" /> 
                <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />        <asp:BoundField DataField="Estados" HeaderText="Estados" ReadOnly="True" SortExpression="Estados" >
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
       <asp:BoundField DataField="Calificación" HeaderText="Calificación" SortExpression="Calificación" >
<FooterStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
   </Columns>               </asp:GridView>
             <br />
             <asp:SqlDataSource ID="DataListeventp0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Aud_Time_Act AS Fecha_Entrega, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) < 24 THEN DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) % 24 ELSE DATEDIFF(HOUR , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) END AS Horas,  CASE WHEN Sis_HV_Novedad.Estado = 2 THEN 'PENDIENTE' ELSE 'Aprobado' END AS Estados, Encuesta.Resultado AS Calificación FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento WHERE (Sis_HV_Novedad.Estado = 4)  ORDER BY Sis_HV_Novedad.Estado, Fecha_Entrega">
                <SelectParameters>
       <asp:ControlParameter ControlID="User2" Name="User2" PropertyName="Text" />
   </SelectParameters>               </asp:SqlDataSource>
                     </td></tr></tr>                   <caption>
                          </caption></Table>                      </asp:panel>                            
                 
       
      </ContentTemplate>
   </ajaxToolkit:TabPanel>
        </asp:TabContainer>   <asp:Panel ID="History" runat="server" Width="1400" ScrollBars="Both">
    <asp:Button ID="Button1" runat="server" Text="Regresar" OnClick="Page_Load" />
    <asp:SqlDataSource ID="History0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Date AS Fecha, CASE WHEN Solicita IS NULL THEN ' ' ELSE Solicita END AS Solicito, CASE WHEN NotaSolicita IS NULL THEN ' ' ELSE NotaSolicita END AS Nota, CASE WHEN Solicita IS NOT NULL THEN CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Mantenimiento/Documentos/' + Archivo END ELSE '' END AS Adjuntos, CASE WHEN Realiza IS NULL THEN ' ' ELSE Realiza END AS Responsable, CASE WHEN NotaRealiza IS NULL THEN ' ' ELSE NotaRealiza END AS Actividad, CASE WHEN Realiza IS NOT NULL THEN CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Mantenimiento/Documentos/' + Archivo END ELSE '' END AS Adjuntos FROM Sis_HV_NOVHIST WHERE (Evento = @TextBox2) ORDER BY Fecha">
            <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="TextBox2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>        <div class="auto-style3">
            <div class="auto-style10">
                <br />
                <strong>
                <asp:Label ID="Label10" runat="server" Text="Historial de este Evento"> </asp:Label>
                </strong>
                <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="Blue" ReadOnly="True" Visible="False" Width="100%"></asp:TextBox>
                <br />
                <br />
            </div>
    </div>        <div class="auto-style3">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AlternatingRowStyle-BackColor="#cccccc" EmptyDataText="Sin Datos" Font-Names="Tahoma" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Fecha" HeaderStyle-Width="10%" HeaderText="Fecha" SortExpression="Fecha">
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Dice" HeaderStyle-Width="20%" HeaderText="Dice" ReadOnly="True" SortExpression="Dice">
                    <HeaderStyle Width="20%" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Mensaje" HeaderText="Mensaje" ReadOnly="True" SortExpression="Mensaje" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:HyperLinkField ControlStyle-Font-Size="XX-Small" DataNavigateUrlFields="Adjuntos" DataNavigateUrlFormatString="" DataTextField="Adjuntos"  HeaderStyle-Font-Size="XX-Small" HeaderText="Adjuntos" ItemStyle-Width="3%" NavigateUrl="~/Documentos/"  ShowHeader="true" Target="_blank" Text="Ver">
                    <ControlStyle Font-Size="XX-Small" />
                    <HeaderStyle Font-Size="XX-Small" />
                    <ItemStyle Width="1%" HorizontalAlign="Left" />
                    </asp:HyperLinkField>                           <asp:ImageField DataAlternateTextFormatString="~/Images/Inf.png" DataImageUrlFormatString="~/Images/Inf.png">
                    </asp:ImageField>                       </Columns>
            </asp:GridView>
            <br />
            <strong>SOLICITUDES ANTERIORES<br />
            <br />
            <br />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Date AS Fecha, (SELECT CASE WHEN Solicita IS NOT NULL THEN Solicita ELSE CASE WHEN Realiza IS NOT NULL THEN Realiza END END AS Expr1) AS Dice, (SELECT CASE WHEN NotaSolicita IS NOT NULL THEN NotaSolicita ELSE CASE WHEN NotaRealiza IS NOT NULL THEN NotaRealiza END END AS Expr1) AS Mensaje, CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Mantenimiento/Documentos/' + Archivo END AS Adjuntos FROM Sis_HV_NOVHIST WHERE (Evento = @res) order by Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="res" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>                     <asp:Label ID="Label2" runat="server" BackColor="LightSeaGreen" Font-Size="Large" Visible="false"></asp:Label>                     <br />
            <br />
            </strong><br />
            <br />
             </div>
    <asp:GridView ID="GridEventos" runat="server" AlternatingRowStyle-Wrap="true" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DataGridView" EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" PageSize="300" Width="60%">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
            <asp:BoundField DataField="Id_Evento" HeaderText="Id_Evento" ItemStyle-Width="50px" SortExpression="Id_Evento" />
            <asp:BoundField DataField="Id_Equipo" HeaderText="Id_Equipo" ItemStyle-Width="50px" SortExpression="Id_Equipo" />
            <asp:BoundField DataField="Actividad" HeaderText="Actividad" SortExpression="Actividad" />
            <asp:BoundField DataField="Id_Job" HeaderText="Id_Job" ItemStyle-Width="50px" SortExpression="Id_Job" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" ItemStyle-Width="100px" SortExpression="Estado" ReadOnly="True" />
        </Columns>
        <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
    </asp:GridView>
    <asp:SqlDataSource ID="DataGridView" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT [Id_Evento], [Id_Equipo], [Actividad], [Id_Job], CASE WHEN Estado = 4 THEN 'Aprobado' ELSE 'Pendiente' END AS Estado FROM [Sis_HV_Historial] WHERE ([Id_Equipo] = @Codigo) order by Id_Evento">
        <SelectParameters>
            <asp:ControlParameter ControlID="Codigo2" Name="Codigo" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />        <asp:TextBox ID="Codigo2" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>        <br />
        </asp:Panel>
</asp:Content>
