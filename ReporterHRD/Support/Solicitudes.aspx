<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Solicitudes.aspx.vb" Inherits="Mantenimiento_Solicitudes" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
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
        }
        .auto-style6 {
            width: 255px;
        }
        .auto-style9 {
            height: 23px;
            width: 47px;
        }
        .auto-style10 {
            margin-left: 0px;
        }
        .auto-style12 {
            height: 23px;
            width: 130px;
            font-family:Tahoma;
            font-size:medium
        }
        .auto-style13 {
            width: 1123px;
            text-align: center;
            Border-color: Black;
        }
        .auto-style18 {
            width: 100%;
        }
        .auto-style19 {
            width: 144px;
        }
        .auto-style20 {
            color: #0066FF;
            font-size: xx-large;
            text-align: center;
        }
        .auto-style21 {
            width: 144px;
            color: #0066FF;
            font-size: xx-large;
            text-align: center;
        }
        .auto-style22 {
            width: 220px;
        }
        .auto-style23 {
            text-align: center;
        }
        .auto-style24 {
            font-size: xx-large;
            color: #0066FF;
        }
        .auto-style25 {
            height: 131px;
        }
        .auto-style27 {
            width: 949px;
            height: 170px;
        }
        .auto-style28 {
            font-size: x-large;
        }
        .auto-style29 {
            width: 949px;
            height: 28px;
        }
        .auto-style31 {
            height: 37px;
        }
        .auto-style32 {
            height: 98px;
            width: 130px;
            font-family: Tahoma;
            font-size: medium;
            text-align: justify;
        }
        .auto-style33 {
            width: 255px;
            height: 98px;
        }
        .auto-style35 {
            height: 98px;
            width: 47px;
        }
        .auto-style36 {
            height: 98px;
            width: 130px;
            font-family: Tahoma;
            font-size: medium;
        }
        .auto-style38 {
            height: 98px;
            width: 131px;
            font-family: Tahoma;
            font-size: medium;
        }
        .auto-style39 {
            width: 128px;
        }
        .auto-style40 {
            height: 23px;
            width: 128px;
            font-family: Tahoma;
            font-size: medium;
        }
        .auto-style41 {
            width: 137px;
        }
        .auto-style42 {
            height: 23px;
            width: 137px;
            font-family: Tahoma;
            font-size: medium;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" ></asp:Label> 
    <asp:Label ID="LabelMsg1" runat="server" ></asp:Label>
    <asp:Label ID="LabelError" runat="server" ></asp:Label>
<asp:Panel ID="Panel_Asignar" runat="server">

    <br />
    <br />
    <br />
    <table id="TabAsigna" align="center" class="auto-style13" border="1" >
        <tr>
            <td colspan="6"style="background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" bgcolor="#7AC2FC">
                &nbsp;<asp:Label ID="Alarma" runat="server" ></asp:Label>
        </td>
        </tr>
        <tr align="center">
            <td class="auto-style40" >
                Solicitud Nº</td>
            <td class="auto-style42">
                Encargado</td>
            <td >
                Trabajo Realizado</td>
            <td class="style4">
                Fecha y hora entrega</td>
            <td class="auto-style12">
                Aprobar</td>
          <td >
               Observación</td>
        </tr>
        <tr>
            <td class="auto-style39" >
                <asp:TextBox ID="Codigo" runat="server" Readonly="True" BorderColor="White" BorderStyle="None" Height="63px" TextMode="MultiLine" Width="160px"></asp:TextBox>
            </td>
            <td class="auto-style41" >
                <asp:TextBox ID="Encargado" runat="server" Readonly="True" BorderColor="White" BorderStyle="None" Height="60px" TextMode="MultiLine" Width="156px"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="Nota" runat="server" Readonly="True" BorderColor="White"  BorderStyle="None" Height="87px"  Width="395px" TextMode="MultiLine"  ></asp:TextBox>
            </td>
              <td class="auto-style12">
                <asp:TextBox ID="fentrega" runat="server" Readonly="True" BorderColor="White"  BorderStyle="None" Height="16px" Width="189px" ></asp:TextBox>
            </td>
            <td class="auto-style9">
                <asp:DropDownList ID="Estado" runat="server">
                 
                    <asp:ListItem Value="1">Contestar</asp:ListItem>
                    
                </asp:DropDownList>
            </td>
          <td class="auto-style6">
              <asp:TextBox ID="Observacion" Wrap="TRUE"  runat="server" Height="74px" TextMode="MultiLine" CssClass="auto-style10" Width="277px"></asp:TextBox>

          </td>

        </tr>
        <tr>
            <td colspan="6" class="auto-style25">
                <strong>Adjuntar Archivos: </strong>
                <asp:FileUpload ID="FileUpload0" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnAsignar" runat="server" Text="Guardar" UseSubmitBehavior="false" />
                <br />
                <br />
                <asp:SqlDataSource ID="DataNov" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataNov0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
             <asp:SqlDataSource ID="DataHis" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataH0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
              <asp:SqlDataSource ID="DataEncuesta" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                </asp:SqlDataSource>
                <br />
            </td> 
             </tr>
       </table>
    <br />
    <br />
</asp:Panel>

    <asp:Panel ID="Panel_Asignar2" runat="server">

    <br />
    <br />
    <br />
    <table id="TabAsigna" align="center" class="auto-style13" border="1" >
        <tr>
            <td colspan="6"style="background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" bgcolor="#7AC2FC">
                &nbsp;<asp:Label ID="Alarma1" runat="server" ></asp:Label>
        </td>
        </tr>
        <tr align="center">
            <td class="auto-style12" >
                Solicitud Nº</td>
            <td class="auto-style12">
                Encargado</td>
            <td class="auto-style12">
                Trabajo Realizado</td>
            <td >
                Fecha y hora entrega</td>
            <td class="auto-style12">
                Aprobar</td>
          <td class="auto-style12">
               Observación</td>
        </tr>
        <tr>
            <td class="auto-style36">
                <asp:TextBox ID="Codigo1" runat="server" Readonly="True" BorderColor="White" BorderStyle="None" Height="114px" TextMode="MultiLine" Wrap="true" Width="100px"></asp:TextBox>
            </td>
            <td class="auto-style32">
                <asp:TextBox ID="Encargado1" runat="server" Readonly="True" BorderColor="White" BorderStyle="None" Height="124px" Width="175px" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td class="auto-style36">
                <asp:TextBox ID="Nota1" runat="server" Readonly="True" BorderColor="White"  BorderStyle="None" Height="140px"  Width="395px" TextMode="MultiLine"  ></asp:TextBox>
            </td>
              <td class="auto-style38">
                <asp:TextBox ID="fentrega1" runat="server" Readonly="True" BorderColor="White"  BorderStyle="None" Height="16px" Width="227px" ></asp:TextBox>
            </td>
            <td class="auto-style35">
                <asp:DropDownList ID="Estado1" runat="server">
                    <asp:ListItem Value="4">Cerrar</asp:ListItem>
                    <asp:ListItem Value="1">Contestar</asp:ListItem>
                    <asp:ListItem Value="3">Reabrir</asp:ListItem>
                </asp:DropDownList>
            </td>
          <td class="auto-style33">
              <asp:TextBox ID="Observacion1" Wrap="true"  runat="server" Height="74px" TextMode="MultiLine" CssClass="auto-style10" Width="277px"></asp:TextBox>

          </td>

        </tr>
        <tr>
            <td colspan="6" class="auto-style25">
                <strong>Adjuntar Archivos: </strong>
                <asp:FileUpload ID="FileUpload" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Guardar"  UseSubmitBehavior="false"/>
                <br />
                <br />
                <asp:SqlDataSource ID="DataNov1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataNov01" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>"></asp:SqlDataSource>
             <asp:SqlDataSource ID="DataHis1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                </asp:SqlDataSource>
              <asp:SqlDataSource ID="DataEncuesta1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>">
                </asp:SqlDataSource>
                <br />
            </td> 
             </tr>
       </table>
    <br />
    <br />
</asp:Panel>



    <asp:panel ID="histor" runat="server">
        <div class="auto-style23">
            <br />
            <br />
            <strong>
            <asp:Label ID="Label4" runat="server" Text="Evento : "> </asp:Label>
            </strong>
            <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="Blue" ReadOnly="True" Width="288px"></asp:TextBox>
            <br />
            <br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource22" AlternatingRowStyle-BackColor="#cccccc" EmptyDataText="Sin Datos" Font-Names="Tahoma" ShowHeaderWhenEmpty="True">
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
        <asp:Button ID="Button1" runat="server" OnClick="Page_Load" Text="Regresar" />






    </asp:panel>

<asp:panel  ID="Panel_Info" runat="server">

<Table tyle="width: 100%">
<tr><td class="auto-style31">

    

    <asp:SqlDataSource ID="History" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Date AS Fecha, CASE WHEN Solicita IS NULL THEN ' ' ELSE Solicita END AS Solicito, CASE WHEN NotaSolicita IS NULL THEN ' ' ELSE NotaSolicita END AS Nota, CASE WHEN Solicita IS NOT NULL THEN CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Support/Documentos/' + Archivo END ELSE '' END AS Adjuntos, CASE WHEN Realiza IS NULL THEN ' ' ELSE Realiza END AS Responsable, CASE WHEN NotaRealiza IS NULL THEN ' ' ELSE NotaRealiza END AS Actividad, CASE WHEN Realiza IS NOT NULL THEN CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Support/Documentos/' + Archivo END ELSE '' END AS Adjuntos FROM Sis_HV_NOVHIST WHERE (Evento = @Codigo) ORDER BY Fecha ">
    
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Codigo" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    

    <strong>
    <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT Date AS Fecha, (SELECT CASE WHEN Solicita IS NOT NULL THEN Solicita ELSE CASE WHEN Realiza IS NOT NULL THEN Realiza END END AS Expr1) AS Dice, (SELECT CASE WHEN NotaSolicita IS NOT NULL THEN NotaSolicita ELSE CASE WHEN NotaRealiza IS NOT NULL THEN NotaRealiza END END AS Expr1) AS Mensaje, CASE WHEN Archivo IS NULL THEN ' ' ELSE '~/Support/Documentos/' + Archivo END AS Adjuntos FROM Sis_HV_NOVHIST WHERE (Evento = @res) order by Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="res" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    </strong>

    

    </td></tr>
<tr><asp:TextBox ID="User" runat="server" Visible="false"></asp:TextBox>
<td style="background-image: url('../../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" 
        class="auto-style23" bgcolor="#79C2FC"> Infraestructura y Mantenimiento
 <asp:TextBox ID="TextBoxev" runat="server" BorderColor="#72BEFA" 
                                BorderStyle="None" Font-Bold="True" ForeColor="White" ReadOnly="True" 
                                BackColor="#72BEFA" Wrap="False" CssClass="auto-style28" Visible="False"></asp:TextBox>

</td>

</tr>

<tr>
<td    style="text-align: center;   font-weight: bold; font-size: 20px;" 
        >
                      
                        </td>

</tr>
<tr>
<td class="style1">
</asp:Table>
                                <asp:SqlDataSource ID="DataListevent" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                       SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Nota AS Solicitud, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' ELSE (CASE WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' ELSE 'En Espera' END) END AS Estado, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias,  CASE WHEN Sis_HV_Novedad.Id_Job = 'ASI001' THEN 'Johana Gutierrez' WHEN Sis_HV_Novedad.Id_Job = 'ASI002' THEN 'Sebastian Mora' WHEN Sis_HV_Novedad.Id_Job = 'SUA001' THEN 'Alirio Rodriguez' WHEN Sis_HV_Novedad.Id_Job = 'SUA007' THEN 'Fabian Goyeneche' WHEN Sis_HV_Novedad.Id_Job = 'SUA009' THEN 'Diego Agudelo' ELSE 'Por asignar' END AS Responsable, Sis_HV_Historial.Actividad AS Trabajo_Realizado FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado &lt; 4) AND (DATEDIFF(day, Sis_HV_Novedad.Fech_Sol, @TextBoxev) &gt; 4) AND (Sis_HV_Novedad.Id_Sol = @User ) ORDER BY Dias DESC">
                                    <SelectParameters>
                                          <asp:ControlParameter ControlID="TextBoxev" Name="TextBoxev" />
                                          <asp:ControlParameter ControlID="User" Name="User" PropertyName="Text" />
                                     </SelectParameters>
                                </asp:SqlDataSource>

</td>
</tr>
<tr>
<td   style="text-align: center; background-image: url('../../Images/Fondo04.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" bgcolor="#EFE3AF">
                            Solicitudes Realizadas
                            <asp:Label ID="LabelEstadoForm1" runat="server"></asp:Label>
                      
                        </td>

</tr>

<tr>
<td class="auto-style27">
<asp:GridView ID="GridEvento2" runat="server" AutoGenerateColumns="False"  
                DataSourceID="DataListevent2" EmptyDataText="No hay Eventos Pendientes." AllowSorting="True" DataKeyNames="Evento" Width="1250px">
                                               <AlternatingRowStyle BackColor="#F0F0F0" />
                                               <Columns>
                                                   <asp:CommandField ShowSelectButton="True" SelectText="Ver" />
                                                   <asp:BoundField DataField="Evento" HeaderText="Evento" 
                                                       SortExpression="Evento" />
                                                   <asp:BoundField DataField="Equipo" HeaderText="Tema/Equipo" 
                                                       SortExpression="Equipo" />
                                                 
                                                 
                                                   <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" 
                                                       SortExpression="Solicitud" />

                                                       <asp:BoundField DataField="Estado" HeaderText="Estado" 
                                                       SortExpression="Estado" ReadOnly="True" />
                                                        <asp:BoundField DataField="Dias" HeaderText="Dias" 
                                                       SortExpression="Dias" ReadOnly="True" />
                                                   <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable" ReadOnly="True" />
                                                   <asp:BoundField DataField="Trabajo_Realizado" HeaderText="Trabajo_Realizado" SortExpression="Trabajo_Realizado" />
                                               </Columns>
                                           </asp:GridView>
                                <asp:SqlDataSource ID="DataListevent2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                
                                               
        
        SelectCommand="SELECT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Fech_Sol AS Fecha_sol, Sis_HV_Novedad.Nota AS Solicitud, CASE WHEN Sis_HV_Novedad.Estado = 3 THEN 'Reabierto' WHEN Sis_HV_Novedad.Estado = 2 THEN 'Terminado' WHEN Sis_HV_Novedad.Estado = 1 THEN (CASE WHEN Sis_HV_Historial.Actividad = 'Pendiente' THEN 'En Espera' ELSE 'En Proceso' END) END AS Estado, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias,  Sis_HV_Novedad.Id_Job AS Responsable, Sis_HV_Historial.Actividad AS Trabajo_Realizado FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado % 2 &gt; 0) AND (Sis_HV_Novedad.Id_Sol = @User ) ORDER BY Estado DESC">
                                    <SelectParameters>
                                       
                                       <asp:ControlParameter ControlID="User" Name="User" PropertyName="Text" />
                                  
                                    </SelectParameters>
                                </asp:SqlDataSource>

</td>
</tr>

<tr>
<td class="style1">

</td>
</tr>
    <tr>
        <td    style="text-align: center; color: #FFFFFF; font-weight: bold; font-size: 20px;" bgcolor="#84CF94">
                            Solicitudes Por Aprobar
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                       
                        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:GridView ID="pendiente0" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Evento" DataSourceID="DataListeventp0" EmptyDataText="No hay Eventos Pendientes." Width="1250px">
                <AlternatingRowStyle BackColor="#f1f1f1" />
                <Columns>
                    <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                    <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" />
                    <asp:BoundField DataField="TemaEquipo" HeaderText="Tema/Equipo" SortExpression="TemaEquipo" />
                    <asp:BoundField DataField="Fech_Sol" HeaderText="Fech_Sol" SortExpression="Fech_Sol" />
                    <asp:BoundField DataField="Novedad" HeaderText="Novedad" SortExpression="Novedad" />
                    <asp:BoundField DataField="Realizo" HeaderText="Realizo" SortExpression="Realizo" />
                    <asp:BoundField DataField="Trabajo_Realizado" HeaderText="Trabajo_Realizado" SortExpression="Trabajo_Realizado" />
                    <asp:BoundField DataField="Dias" HeaderText="Dias" ReadOnly="True" SortExpression="Dias" />
                    <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
                    <asp:BoundField DataField="Min" HeaderText="Min" ReadOnly="True" SortExpression="Min" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DataListeventp0" runat="server" ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" SelectCommand="SELECT DISTINCT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS TemaEquipo, Sis_HV_Novedad.Fech_Sol, Sis_HV_Novedad.Nota AS Novedad, CASE WHEN Sis_HV_Novedad.Id_Job = 'AMA001' THEN 'Alexander Puerto' WHEN Sis_HV_Novedad.Id_Job = 'AMA004' THEN 'Brayan León' WHEN Sis_HV_Novedad.Id_Job = 'AMA008' THEN 'Alejandro Barrera' WHEN Sis_HV_Novedad.Id_Job = 'AMA003' THEN 'Sergio Baez' WHEN Sis_HV_Novedad.Id_Job = 'MAN003' THEN 'Jefferson Niño' WHEN Sis_HV_Novedad.Id_Job = 'MAN004' THEN 'Edna Cuta' ELSE 'Por asignar' END AS Realizo, Sis_HV_Historial.Actividad AS Trabajo_Realizado, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias,  ' '  AS Horas, ' '  AS Min, Sis_HV_Novedad.Estado, Sis_HV_Novedad.Id_Sol FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento WHERE (Sis_HV_Novedad.Estado = 2) AND (Sis_HV_Novedad.Id_Sol = @User ) ORDER BY Sis_HV_Novedad.Fech_Sol">
                <SelectParameters>
                    <asp:ControlParameter ControlID="User" Name="User" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style1">&nbsp;</td>
    </tr>
<tr>
<td class="auto-style29">
     <asp:TextBox ID="TextBox1" runat="server" BorderColor="White" ForeColor="White" BorderStyle="Double" Font-Bold="True" ReadOnly="True" style="margin-left: 0px"></asp:TextBox>
     
</td>
</tr>

<tr>

<td    style="text-align: center; background-image: url('../../Images/Fondo02.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" bgcolor="#84CF94">
                            Solicitudes Aprobadas
                            <asp:Label ID="LabelEstadoForm3" runat="server"></asp:Label>
                       
                        </td>
<tr>
<td class="style1" >

<asp:GridView ID="pendiente" runat="server" AutoGenerateColumns="False"  DataKeyNames="Evento" DataSourceID="DataListeventp" EmptyDataText="No hay Eventos Pendientes." AllowSorting="True">
                                               <AlternatingRowStyle  BackColor="#f1f1f1" />
                                               <Columns>
                                        
                                                   <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                                                   <asp:BoundField DataField="Evento" HeaderText="Evento" 
                                                       SortExpression="Evento" />
                                                   <asp:BoundField DataField="Equipo" HeaderText="Equipo" 
                                                       SortExpression="Equipo" />
                                                   <asp:BoundField DataField="Fech_Sol" HeaderText="Fech_Sol" 
                                                       SortExpression="Fech_Sol" />
                                                   <asp:BoundField DataField="Novedad" HeaderText="Novedad" 
                                                       SortExpression="Novedad" />
                                                   <asp:BoundField DataField="Realizo" HeaderText="Realizo" 
                                                       SortExpression="Realizo" ReadOnly="True" />
                                               <asp:BoundField DataField="Trabajo_Realizado" HeaderText="Trabajo_Realizado" 
                                                       SortExpression="Trabajo_Realizado" />
                                                                                           
                                                   <asp:BoundField DataField="Dias" HeaderText="Dias" ReadOnly="True" SortExpression="Dias" />
                                                   <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
                                                   <asp:BoundField DataField="Min" HeaderText="Min" ReadOnly="True" SortExpression="Min" />
                                                                                           
                                                   <asp:BoundField DataField="Satisfacción" HeaderText="Satisfacción" SortExpression="Satisfacción" />
                                                                                           
                                               </Columns>
                                           </asp:GridView>
                                <asp:SqlDataSource ID="DataListeventp" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:DBSUPPORTConnectionString %>" 
                                                
                                               
        
        SelectCommand="SELECT DISTINCT Sis_HV_Novedad.Id_Evento AS Evento, Sis_HV_Historial.NomEquipo AS Equipo, Sis_HV_Novedad.Fech_Sol, Sis_HV_Novedad.Nota AS Novedad, CASE WHEN Sis_HV_Novedad.Id_Job = 'AMA001' THEN 'Alexander Puerto' WHEN Sis_HV_Novedad.Id_Job = 'AMA004' THEN 'Brayan León' WHEN Sis_HV_Novedad.Id_Job = 'AMA003' THEN 'Sergio Baez' WHEN Sis_HV_Novedad.Id_Job = 'MAN003' THEN 'Jefferson Niño' WHEN Sis_HV_Novedad.Id_Job = 'MAN004' THEN 'Edna Cuta' WHEN Sis_HV_Novedad.Id_Job = 'AMA008' THEN 'Alejandro Barrera' ELSE 'Por asignar' END AS Realizo, Sis_HV_Historial.Actividad AS Trabajo_Realizado, CASE WHEN DATEDIFF(hour , Sis_HV_Novedad.Fech_Sol , (CONVERT (datetime , Sis_HV_Historial.Aud_Time_Act , 103))) > 24 THEN DATEDIFF(DAY , Sis_HV_Novedad.Fech_Sol , CONVERT (datetime , Sis_HV_Historial.Fech_En , 103)) ELSE '0' END AS Dias,  ' '  AS Horas, ' '  AS Min, Encuesta.Resultado AS Satisfacción FROM Sis_HV_Novedad INNER JOIN Sis_HV_Historial ON Sis_HV_Novedad.Id_Evento = Sis_HV_Historial.Id_Evento INNER JOIN Encuesta ON Sis_HV_Novedad.Id_Evento = Encuesta.Evento WHERE (Sis_HV_Novedad.Estado = 4) AND (Sis_HV_Novedad.Id_Sol = @User ) ORDER BY Sis_HV_Novedad.Fech_Sol">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="User" Name="User" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>


</td>
</tr>




</Table>

</asp:panel>

 
    
    
      <asp:Panel ID="Encuesta" runat="server" Height="75px">
          <table align="center" class="auto-style18">

              <tr>
                  <td class="auto-style23" colspan="5">
                           <strong><span class="auto-style24">Por favor regalenos unos segundos de su tiempo y diganos para usted como es la satisfaccion del evento que acabo de cerrar</span></strong>
                  &nbsp;
                           <asp:Label ID="Label5" runat="server" ForeColor="White" ></asp:Label>
                           </td>
              </tr>
              <tr>
                  <td class="auto-style19">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td class="auto-style22">&nbsp;</td>
              </tr>
              <tr>
                  <td class="auto-style19">
                      <asp:ImageButton ID="ImageButton1" runat="server" Height="91px" ImageUrl="~/Images/1.jpg" Width="102px" />
                  </td>
                  <td>
                      <asp:ImageButton ID="ImageButton2" runat="server" Height="110px" ImageUrl="~/Images/2.jpg" Width="127px" />
                  </td>
                  <td>
                      <asp:ImageButton ID="ImageButton3" runat="server" Height="150px" ImageUrl="~/Images/3.jpg" Width="156px" />
                  </td>
                  <td>
                      <asp:ImageButton ID="ImageButton4" runat="server" Height="134px" ImageUrl="~/Images/4.jpg" Width="167px" />
                  </td>
                  <td class="auto-style22">
                      <asp:ImageButton ID="ImageButton5" runat="server" Height="140px" ImageUrl="~/Images/5.jpg" Width="149px" />
                  </td>
              </tr>
              <tr>
                  <td class="auto-style21"><strong>Malo</strong></td>
                  <td class="auto-style20"><strong>Regular</strong></td>
                  <td class="auto-style20"><strong>Bueno</strong></td>
                  <td class="auto-style20"><strong>Muy Bueno</strong></td>
                  <td class="auto-style20"><strong>Excelente</strong></td>
              </tr>
          </table>

      


      </asp:Panel>


</asp:Content>

