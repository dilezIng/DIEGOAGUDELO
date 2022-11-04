<%@ Page Title="Gestionar" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Asignar.aspx.vb" Inherits="Mantenimiento_Asignacion_Asignacion" %>


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
        .auto-style1 {
            text-align: center;
        }
        .auto-style8 {
            width: 1022px;
        }
        .auto-style9 {
            width: 1022px;
            border: 1px solid #7AC2FC;
            background-color: #FF0000;
        }
        .auto-style10 {
            width: 1022px;
            height: 170px;
        }
        .auto-style16 {
            margin-left: 0px;
        }
        .auto-style23 {
            text-align: center;
            width: 206px;
        }
        .auto-style27 {
            text-align: center;
            width: 472px;
        }
        .auto-style28 {
            text-align: center;
            width: 161px;
        }
        .auto-style29 {
            text-align: center;
            width: 184px;
        }
        .auto-style30 {
            text-align: center;
            width: 180px;
        }
        .auto-style31 {
            width: 1022px;
            height: 33px;
        }
        .auto-style32 {
            text-align: left;
        }
        .auto-style64 {
            height: 26px;
            text-align: left;
        }
        .auto-style65 {
            font-size: medium;
        }
        .auto-style36 {
            height: 23px;
        }
        .auto-style59 {
            height: 23px;
            width: 105px;
        }
        .auto-style62 {
            height: 23px;
            width: 87px;
        }
        .auto-style53 {
            height: 23px;
            width: 91px;
        }
        .auto-style56 {
            height: 23px;
            width: 178px;
        }
        .auto-style44 {
            height: 23px;
            width: 57px;
        }
        .auto-style38 {
            height: 23px;
            width: 113px;
        }
        .auto-style40 {
            height: 23px;
            width: 10px;
        }
        .auto-style68 {
            width: 178px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    


     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="129%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" ToolTip="Mantenimientos y Soportes" ID="TabPanel5">
                            <HeaderTemplate>
                                Solicitadas
                            
</HeaderTemplate>
                            
<ContentTemplate>
                                
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
            

            <asp:Chart ID="Chart1" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource3" EnableViewState="True" SuppressExceptions="True" ViewStateContent="Default, Appearance" Width="426px"><series><asp:Series ChartArea="ChartArea1" ChartType="Pie" Font="Microsoft Sans Serif, 20.25pt, style=Bold" IsValueShownAsLabel="True" IsXValueIndexed="True" Legend="Legend1" Name="Mantenimientos" XValueMember="Estado" YValueMembers="Cantidad"><emptypointstyle customproperties="DrawingStyle=LightToDark, LabelStyle=Bottom" ></emptypointstyle></asp:Series></series><chartareas><asp:ChartArea Name="ChartArea1"><area3dstyle enable3d="True" inclination="20" rotation="20" ></area3dstyle></asp:ChartArea></chartareas><legends><asp:Legend Alignment="Far" LegendStyle="Column" Name="Legend1" Title="Mantenimientos"></asp:Legend></legends><titles><asp:Title Alignment="TopCenter" Font="Microsoft Sans Serif, 12pt" Name="Total Mantenimientos" Text="Total Mantenimientos"></asp:Title></titles></asp:Chart>

            


            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT DISTINCT CASE WHEN Estado = 1 THEN 'Pendiente' ELSE (CASE WHEN Estado = 2 THEN 'Por Aprobar ' ELSE 'Reabierto' END) END AS Estado, COUNT(*) AS Cantidad FROM Sis_HV_Historial WHERE (Estado &lt; 4) GROUP BY Estado"></asp:SqlDataSource>

            


        </td>
        

    </tr>
    

    <tr>
        

        <td class="auto-style9" style="text-align: center; font-weight: bold; font-size: 25px;">Mantenimientos Solicitados excedidos de tiempo

            <asp:Label ID="LabelEstadoForm4" runat="server"></asp:Label>

            


        </td>
        

        <tr>
            

            <td class="auto-style8">
                

                </asp:table>
                

                <asp:GridView ID="GridEvento" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento" DataSourceID="DataListevent" EmptyDataText="No hay Eventos Pendientes con +4 dìas ." Width="1357px"><Columns>
<asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Ok.png" ShowSelectButton="True"></asp:CommandField>
<asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
<asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo"></asp:BoundField>
<asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
<asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud"></asp:BoundField>
<asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>
<asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado"></asp:BoundField>
<asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
<asp:BoundField DataField="Prioridad" HeaderText="Prioridad" ReadOnly="True" SortExpression="Prioridad"></asp:BoundField>
<asp:BoundField DataField="Utilizados" HeaderText="Utilizados" ReadOnly="True" SortExpression="Utilizados"></asp:BoundField>
<asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" ReadOnly="True" SortExpression="FechaEntrega"></asp:BoundField>
</Columns>
</asp:GridView>

                


                <asp:SqlDataSource ID="DataListevent" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' WHEN Sis_HV_Novedad.Estado = 1 THEN (CASE WHEN Sis_HV_Historial.Actividad = 'Pendiente' THEN 'En Espera' ELSE 'En Proceso' END) END AS Estado, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) / 24 AS Utilizados, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) &gt; Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1) ORDER BY Sis_HV_Novedad.Fech_Sol">
                    <SelectParameters>
<asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />
</SelectParameters>
</asp:SqlDataSource>

                


            </td>
            

        </tr>
        

        <tr>
            

            <td auto-style1"="" class="auto-style8" style="text-align: center; color: #FFFFFF; font-weight: bold; font-size: 25px; background-image: url('https://localhost:44353/Images/Fondo03.jpg');">Mantenimientos Reabiertos

                <asp:Label ID="Label1" runat="server"></asp:Label>

                


            </td>
            

            <tr>
                

                <td class="auto-style8">
                    

                    <asp:GridView ID="Gridopen" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento" DataSourceID="SqlDataSource1" EmptyDataText="No hay Eventos Pendientes." Width="1354px">
<AlternatingRowStyle BackColor="#F1F1F1" />
<Columns>
<asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Ok.png" ShowSelectButton="True"></asp:CommandField>
<asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
<asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo"></asp:BoundField>
<asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
<asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud"></asp:BoundField>
<asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>
<asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado"></asp:BoundField>
<asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
<asp:BoundField DataField="Prioridad" HeaderText="Prioridad" ReadOnly="True" SortExpression="Prioridad"></asp:BoundField>
<asp:BoundField DataField="Utilizados" HeaderText="Utilizados" ReadOnly="True" SortExpression="Utilizados"></asp:BoundField>
<asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" ReadOnly="True" SortExpression="FechaEntrega"></asp:BoundField>
</Columns>
</asp:GridView>

                    


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' WHEN Sis_HV_Novedad.Estado = 1 THEN (CASE WHEN Sis_HV_Historial.Actividad = 'Pendiente' THEN 'En Espera' ELSE 'En Proceso' END) END AS Estado, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) / 24 AS Utilizados, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado = 3) ORDER BY Sis_HV_Novedad.Fech_Sol">
                        <SelectParameters>
<asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" PropertyName="Text" />
</SelectParameters>
</asp:SqlDataSource>

                    


                </td>
                

            </tr>
            

            <tr>
                

                <td class="auto-style8"></td>
                

            </tr>
            

            <tr>
                

                <td class="auto-style8" style="text-align: center; background-image: url('../../Images/Fondo04.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;">Mantenimientos Solicitados

                    <asp:Label ID="LabelEstadoForm1" runat="server"></asp:Label>

                    


                </td>
                

            </tr>
            

            <tr>
                

                <td class="auto-style8">
                    

                    <asp:GridView ID="GridEvento2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento" DataSourceID="DataListevent2" EmptyDataText="No hay Eventos Pendientes." Width="1362px">
<AlternatingRowStyle BackColor="#F0F0F0" />
<Columns>
<asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Ok.png" ShowSelectButton="True"></asp:CommandField>
<asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
<asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo"></asp:BoundField>
<asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
<asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud"></asp:BoundField>
<asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>
<asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado"></asp:BoundField>
<asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
<asp:BoundField DataField="Prioridad" HeaderText="Prioridad" ReadOnly="True" SortExpression="Prioridad"></asp:BoundField>
<asp:BoundField DataField="Utilizadas" HeaderText="Utilizadas" ReadOnly="True" SortExpression="Utilizadas"></asp:BoundField>
<asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" ReadOnly="True" SortExpression="FechaEntrega"></asp:BoundField>
</Columns>
</asp:GridView>

                    


                    <asp:SqlDataSource ID="DataListevent2" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Area, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' WHEN Sis_HV_Novedad.Estado = 1 THEN (CASE WHEN Sis_HV_Historial.Actividad = 'Pendiente' THEN 'En Espera' ELSE 'En Proceso' END) END AS Estado, Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Prioridad / 24 AS Prioridad, DATEDIFF(hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) / 24 AS Utilizadas, DATEADD(hour, Sis_HV_Historial.Prioridad, Sis_HV_Novedad.Fech_Sol) AS FechaEntrega FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento AND DATEDIFF(Hour, Sis_HV_Novedad.Fech_Sol, @TextBoxev) &lt;= Sis_HV_Historial.Prioridad WHERE (Sis_HV_Novedad.Estado = 1) ORDER BY Sis_HV_Novedad.Fech_Sol">
                        <SelectParameters>
<asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" PropertyName="Text" />
</SelectParameters>
</asp:SqlDataSource>

                    


                </td>
                

            </tr>
            

            <tr>
                

                <td class="auto-style8"></td>
                

            </tr>
            

            <tr>
                

                <td class="auto-style8"></td>
                

            </tr>
            

        </tr>
        

    </tr>

    

</tr>

    

</Table>

    

</asp:panel>


                                


</ContentTemplate>

                
                            

</ajaxToolkit:TabPanel>

       <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" ToolTip="Mantenimientos y Soportes" ID="TabPanel1"><HeaderTemplate>
           Por Aprobar
           
</HeaderTemplate>
           
<ContentTemplate>
     
          
               
 
 

     
          
           <asp:Panel ID="Paprobar" runat="server">
               

           <Table ID="Table1" >              


 


<tr>
    
<td class="auto-style8" style="text-align: center; background-image: url('../../Images/Fondo02.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;" >

    



    Mantenimientos por Aprobar

    <asp:Label ID="LabelEstadoForm3" runat="server"></asp:Label>


    


</td>
    

    <tr>
        

        <td class="auto-style10">
            

            <asp:GridView ID="pendiente" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento" DataSourceID="DataListeventp" EmptyDataText="No hay Eventos Pendientes." Width="1387px">
                

                <AlternatingRowStyle BackColor="#F1F1F1" />
                

                <Columns>
                    

                    <asp:CommandField ButtonType="Image" HeaderImageUrl="~/Images/Ok.png" SelectImageUrl="~/Images/Ok.png" ShowSelectButton="True" />
                    

                    <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
                    

                    <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
                    

                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>
                    

                    <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo"></asp:BoundField>
                    

                    <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud"></asp:BoundField>
                    

                    <asp:BoundField DataField="Fecha_Entrega" HeaderText="Fecha_Entrega" SortExpression="Fecha_Entrega"></asp:BoundField>
                    

                    <asp:BoundField DataField="Tiempo_Usado" HeaderText="Tiempo_Usado" SortExpression="Tiempo_Usado" ReadOnly="True"></asp:BoundField>
                    

                    <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
                    

                    <asp:BoundField DataField="Estados" HeaderText="Estados" ReadOnly="True" SortExpression="Estados"></asp:BoundField>
                    

                </Columns>
                

            </asp:GridView>
            

            <asp:SqlDataSource ID="DataListeventp" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, Sis_HV_Historial.Aud_Time_Act AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) &lt; 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, CASE WHEN Sis_HV_Novedad.Estado = 2 THEN 'PENDIENTE' ELSE 'Aprobado' END AS Estados FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado = 2) ORDER BY Sis_HV_Novedad.Estado, Fecha_Entrega"></asp:SqlDataSource>
            

        </td>
        

    </tr>
    

    </table>
               
</asp:Panel>
               
 
           
</ContentTemplate>

                
           

</ajaxToolkit:TabPanel>

 <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel5" ToolTip="Mantenimientos y Soportes" ID="TabPanel2">
     <HeaderTemplate>
         Aprobados
     
</HeaderTemplate>
     
<ContentTemplate>
          
         
         
 
 

          
         
     <asp:Panel ID="Paprobados" runat="server">
         

         <br />
         <table width="1200PX">
             <tr>
                 <td class="auto-style1" colspan="11" style="background-image: url('../../Images/Fondo02.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;">Mantenimientos Aprobados
                     <asp:Label ID="Label2" runat="server"></asp:Label>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style64" colspan="11"><strong>
                     <asp:Label ID="Label5" runat="server" CssClass="auto-style65" Text="Seleccione un tipo de filtro"></asp:Label>
                     </strong></td>
             </tr>
             <tr>
                 <td class="auto-style36" colspan="3">&nbsp;</td>
                 <td class="auto-style59"></td>
                 <td class="auto-style62" colspan="3">&nbsp;</td>
                 <td class="auto-style53">&nbsp;&nbsp;</td>
                 <td class="auto-style56"></td>
                 <td class="auto-style36"></td>
                 <td class="auto-style36"></td>
             </tr>
             <tr>
                 <td class="auto-style44">Solicita:</td>
                 <td class="auto-style38">
                     <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDatasolicita0" DataTextField="Solicita" DataValueField="Solicita">
                     </asp:DropDownList>
                 </td>
                 <td class="auto-style40">Area:</td>
                 <td class="auto-style59">
                     <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataArea" DataTextField="Area" DataValueField="Area">
                     </asp:DropDownList>
                 </td>
                 <td class="auto-style62" colspan="3">Responsable:</td>
                 <td class="auto-style53">
                     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataRespon" DataTextField="UserName" DataValueField="UserName">
                     </asp:DropDownList>
                 </td>
                 <td class="auto-style56">Tipo Mantenimiento:</td>
                 <td class="auto-style36">
                     <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" CssClass="auto-style16" DataSourceID="SqlDataTIPMAN" DataTextField="Tipo_Man" DataValueField="Id">
                     </asp:DropDownList>
                 </td>
                 <td class="auto-style36">&nbsp;</td>
             </tr>
             <tr>
                 <td class="auto-style36" colspan="5"><strong>
                     <asp:Label ID="Label6" runat="server" CssClass="auto-style65" Text="Responsable + Tipo Mantenimiento"></asp:Label>
                     <asp:Button ID="restman" runat="server" Text="Buscar" />
                     </strong></td>
                 <td class="auto-style36" colspan="6"><strong>
                     <asp:Label ID="Label7" runat="server" CssClass="auto-style65" Text="Solicita + Responsable"></asp:Label>
                     <asp:Button ID="solres" runat="server" Text="Buscar" />
                     </strong></td>
             </tr>
             <tr>
                 <td colspan="6"><strong>
                     <asp:Label ID="Label8" runat="server" CssClass="auto-style65" Text="Fecha Inicial"></asp:Label>

<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
<ajaxToolkit:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" BehaviorID="_content_TextFechaIni_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" UserDateFormat="DayMonthYear" />
<ajaxToolkit:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" BehaviorID="_content_TextFechaIni_CalendarExtender" TargetControlID="TextFechaIni" />

                     <asp:Label ID="Label9" runat="server" CssClass="auto-style65" Text="Fecha final"></asp:Label>
                    
                     <asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" BehaviorID="_content_TextFechaFin_MaskedEditExtender"
                   Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                   CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear"
                     ClipboardEnabled="False" ClipboardText="La configuración de seguridad de su navegador no permite la ejecución automática de operaciones de pegado. Utilice el método abreviado de teclado Ctrl + V en su lugar." />
                   <ajaxToolkit:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" BehaviorID="_content_TextFechaFin_CalendarExtender" TargetControlID="TextFechaFin" />    
                    
                     
                     <asp:Button ID="Button4" runat="server" Text="X Fechas" />
                 </strong></td>
                 <td colspan="2">&nbsp; </td>
                 <td class="auto-style68"><strong>
                     <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
                     </strong></td> 
                 <td>
                     <asp:Label ID="LabelInfo" runat="server"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
             </tr>
             <tr>
                 <td colspan="8">
                     <asp:SqlDataSource ID="SqlDataRespon" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnDB_Usuarios %>" SelectCommand="SELECT aspnet_Users.UserName, aspnet_Membership.IsLockedOut FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId WHERE (aspnet_Users.UserName LIKE '%ama%' OR aspnet_Users.UserName LIKE '%man%') AND (aspnet_Membership.IsLockedOut = 0) ORDER BY aspnet_Users.UserName"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDatasolicita0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT DISTINCT Solicita FROM Sis_HV_NOVHIST ORDER BY Solicita"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataArea" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT DISTINCT Area FROM Sis_HV_Historial ORDER BY Area"></asp:SqlDataSource>
                 </td>
                 <td class="auto-style68"></td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
             </tr>
         </table>
         <br />
         

         <table class="auto-style42">
             

    <tr>
        

        <td class="auto-style31" style="text-align: center; background-image: url('../../Images/Fondo02.jpg'); color: #FFFFFF; font-weight: bold; font-size: 25px;">&nbsp;</td>
        

    </tr>
             

    <tr>
        

        <td class="auto-style8">
            

            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="No hay Eventos Pendientes." Width="1209px" DataKeyNames="Evento">
                

                <AlternatingRowStyle BackColor="#F1F1F1" />
                

                <Columns>
                    

                    <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                    

                    <asp:BoundField DataField="Solicita" HeaderText="Solicita" SortExpression="Solicita"></asp:BoundField>
                    

                    <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento"></asp:BoundField>
                    

                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"></asp:BoundField>
                    

                    <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo"></asp:BoundField>
                    

                    <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud"></asp:BoundField>
                    

                    <asp:BoundField DataField="Fecha_Entrega" HeaderText="Fecha_Entrega" SortExpression="Fecha_Entrega"></asp:BoundField>
                    

                    <asp:BoundField DataField="Tiempo_Usado" HeaderText="Tiempo_Usado" SortExpression="Tiempo_Usado" ReadOnly="True"></asp:BoundField>
                    

                    <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"></asp:BoundField>
                    

                    <asp:BoundField DataField="Calificación" HeaderText="Calificación" SortExpression="Calificación" />
                     <asp:BoundField DataField="TIPO_MAN" HeaderText="Tipo_Man" SortExpression="Tipo_Man" />

                </Columns>
                

            </asp:GridView>
            

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Sis_HV_Novedad.Id_Sol AS Solicita, Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.Area, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CONVERT (date, Sis_HV_Historial.Aud_Time_Act, 103) AS Fecha_Entrega, CASE WHEN DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En) &lt; 24 THEN ' ' + CONVERT (varchar(10) , (DATEDIFF(Hour , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Horas' ELSE ' ' + CONVERT (varchar(10) , (DATEDIFF(Day , Sis_HV_Novedad.Fech_Sol , Sis_HV_Historial.Fech_En))) + ' Días' END AS Tiempo_Usado, Sis_HV_Historial.Id_Job AS Responsable, Encuesta.Resultado AS Calificación, Sis_HV_TiposMantenimiento.Tipo_Man AS TIPO_MAN FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Historial.Id_Evento = Encuesta.Evento INNER JOIN Sis_HV_TiposMantenimiento ON Sis_HV_Historial.Tipo_Man = Sis_HV_TiposMantenimiento.Id WHERE (Sis_HV_Novedad.Estado = 4) ORDER BY Fecha_Entrega DESC"></asp:SqlDataSource>
            

        </td>
        

    </tr>
             
</tr>



             



</Table>

         

</asp:panel>

         

</ContentTemplate>

                
     

</ajaxToolkit:TabPanel>

                    
                </asp:TabContainer>


    
<asp:Panel ID="Panel_Asignar" runat="server" Width="111%">

    <div class="auto-style32">
        <br />
        <br />
        <br />
    </div>
    <table id="TabAsigna" align="left" border="1" width="90%">
        <tr>
            <td colspan="6" style="background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;">Asignar responsable a solicitud<br /> Solicita:
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style30"><strong>Solicitud Nº</strong></td>
            <td class="auto-style23"><strong>Solicita</strong></td>
            <td class="auto-style27"><strong>Novedad</strong></td>
            <td class="auto-style1"><strong>Asignar</strong></td>
            <td class="auto-style28"><strong>Tipo Solicitud</strong></td>
            <td class="auto-style29"><strong>Prioridad</strong></td>
        </tr>
        <tr>
            <td class="auto-style30">
                <asp:TextBox ID="Codigo" runat="server" BorderColor="White" BorderStyle="None" Height="57px" Readonly="True" TextMode="MultiLine" Width="155px"></asp:TextBox>
            </td>
            <td class="auto-style23">
                <asp:TextBox ID="Solicita" runat="server" BorderColor="White" BorderStyle="None" CssClass="auto-style16" Height="80px" Readonly="True" TextMode="MultiLine" Width="196px"></asp:TextBox>
            </td>
            <td class="auto-style27">
                <asp:TextBox ID="Nota" runat="server" BorderColor="White" BorderStyle="None" Height="102px" Readonly="True" TextMode="MultiLine" Width="430px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="Id_Job" runat="server" DataSourceID="SqlDataId_Job" DataTextField="Responsable" DataValueField="UserName">
                </asp:DropDownList>
            </td>
            <td class="auto-style28">
                <asp:DropDownList ID="Tip_Man" runat="server" DataSourceID="SqlDataTIPMAN" DataTextField="Tipo_Man" DataValueField="Id">
                </asp:DropDownList>
            </td>
            <td class="auto-style29">
                <asp:DropDownList ID="Prioridad" runat="server" DataSourceID="SqlDataPrioridad" DataTextField="Nombre" DataValueField="Tiempo">
                    <asp:ListItem Value="1">Gerencia</asp:ListItem>
                    <asp:ListItem Value="2">SubGerencia</asp:ListItem>
                    <asp:ListItem Value="2">Comite</asp:ListItem>
                    <asp:ListItem Value="3">Servicios</asp:ListItem>
                    <asp:ListItem Value="4">General</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataPrioridad" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT CASE WHEN Tiempo &gt; 24 THEN RTRIM(Nombre) + ' (' + RTRIM(Tiempo / 24) + ' Días) ' ELSE RTRIM(Nombre) + ' (' + RTRIM(Tiempo) + ' Hrs) ' END AS Nombre, Tiempo FROM Sis_HV_Prioridades ORDER BY Tiempo desc"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Button ID="BtnAsignar" runat="server" Text="Asignar" UseSubmitBehavior="False" />
                <asp:SqlDataSource ID="DataNov" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
                <asp:TextBox ID="Reasignado" runat="server" Visible="False"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataTIPMAN" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT * FROM [Sis_HV_TiposMantenimiento]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataId_Job" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnDB_Usuarios %>" SelectCommand="SELECT CASE WHEN aspnet_Users.UserName = 'MAN003' THEN 'Jefferson Niño' WHEN aspnet_Users.UserName = 'MAN005' THEN 'Camilo Araque' WHEN aspnet_Users.UserName = 'MAN004' THEN 'Edna Cuta' WHEN aspnet_Users.UserName = 'AMA001' THEN 'Alexander Puerto' WHEN aspnet_Users.UserName = 'AMA003' THEN 'Sergio Baez' END AS Responsable, aspnet_Users.UserName FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId WHERE (aspnet_Roles.RoleName = N'CoorMAN') OR (aspnet_Roles.RoleName = N'TecMAN') ORDER BY aspnet_Users.UserName"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DataHis" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DataHis0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DataH0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
            </td>
        </tr>
    </table>

    <br />
    <br />
</asp:Panel>
    <asp:Panel ID="NOVHIS" runat="server" Width="100%">
        <asp:SqlDataSource ID="History" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Date AS Fecha, CASE WHEN Solicita IS NULL THEN ' ' ELSE Solicita END AS Solicito, CASE WHEN NotaSolicita IS NULL THEN ' ' ELSE NotaSolicita END AS Nota, CASE WHEN Solicita IS NOT NULL THEN CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Support/Documentos/' + Archivo END ELSE '' END AS Adjuntos, CASE WHEN Realiza IS NULL THEN ' ' ELSE Realiza END AS Responsable, CASE WHEN NotaRealiza IS NULL THEN ' ' ELSE NotaRealiza END AS Actividad, CASE WHEN Realiza IS NOT NULL THEN CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Support/Documentos/' + Archivo END ELSE '' END AS Adjuntos FROM Sis_HV_NOVHIST WHERE (Evento = @Codigo) ORDER BY Fecha">
            <SelectParameters>
                <asp:ControlParameter ControlID="Codigo" Name="Codigo" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="auto-style1">
            <strong>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Date AS Fecha, (SELECT CASE WHEN Solicita IS NOT NULL THEN Solicita ELSE CASE WHEN Realiza IS NOT NULL THEN Realiza END END AS Expr1) AS Dice, (SELECT CASE WHEN NotaSolicita IS NOT NULL THEN NotaSolicita ELSE CASE WHEN NotaRealiza IS NOT NULL THEN NotaRealiza END END AS Expr1) AS Mensaje, CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Mantenimiento/Documentos/' + Archivo END AS Adjuntos FROM Sis_HV_NOVHIST WHERE (Evento = @res) order by Date">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Codigo" Name="res" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="Label4" runat="server" Text="Evento : "></asp:Label>
            </strong><asp:TextBox ID="TextBox1" runat="server" BorderColor="White" BackColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="Blue" ReadOnly="True" Width="288px" ></asp:TextBox>
            <br />
            <asp:GridView ID="GridView3" 
            <asp:GridView ID="GridView3"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource22" AlternatingRowStyle-BackColor="#cccccc" EmptyDataText="Sin Datos" Font-Names="Tahoma" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Fecha" HeaderStyle-Width="10%" HeaderText="Fecha" SortExpression="Fecha">
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Dice" HeaderStyle-Width="20%" HeaderText="Dice" ReadOnly="True" SortExpression="Dice">
                    <HeaderStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Mensaje" HeaderText="Mensaje" ReadOnly="True" SortExpression="Mensaje" />
                    <asp:HyperLinkField ControlStyle-Font-Size="XX-Small" DataNavigateUrlFields="Adjuntos" DataNavigateUrlFormatString="" DataTextField="Adjuntos"  HeaderStyle-Font-Size="XX-Small" HeaderText="Adjuntos" ItemStyle-Width="3%" NavigateUrl="~/Documentos/"  ShowHeader="true" Target="_blank">
                    <ControlStyle Font-Size="XX-Small" />
                    <HeaderStyle Font-Size="XX-Small" />
                    <ItemStyle Width="1%" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            <br />

            <asp:Button ID="Button1" runat="server" Text="Regresar" OnClick="Page_Load" />
        </div>




    </asp:Panel>



</asp:Content>

