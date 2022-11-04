<%@ Page Title="Solicitud Mantenimiento PC" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Job_PC.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/EnEspera.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
  <script language="javascript">

      function ShowModalPopup() {

          $find("Panel1_ModalPopupExtender").show();

      }

      function HideModalPopup() {

          $find("Panel1_ModalPopupExtender").hide();

      }

</script>
   <style type="text/css">
    .style8
    {
        height: 19px;
    }
       .style13
       {
           width: 243px;
           text-align: right;
       }
       .style14
       {
           width: 359px;
       }
       .style15
       {
           width: 513px;
       }
       .style16
       {
           width: 323px;
       }
       .style17
       {
           width: 139px;
       }
       .style18
       {
           height: 34px;
       }
       .style19
       {
           height: 33px;
       }
       .auto-style4 {
           width: 233px;
       }
       .auto-style5 {
           text-align: right;
       }
       .auto-style7 {
           width: 233px;
           text-align: right;
       }
       </style>
</head>
     <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
                </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
       <ProgressTemplate>
             <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 15000px; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1500px;
                     position: absolute; text-align: center;">
                     <uc1:Cargando ID="Cargando2" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>




    <asp:Panel ID="panelSolicitud" runat="server" Height="10px" Width="10px" >
           </asp:Panel>

        <table cellspacing="1" >
    <tr>
        <td colspan="5"
            style="text-align: center; background-image: url('../Images/Fondo01.jpg'); color: #FFFFFF; font-weight: bold; font-size: 20px;" 
                            class="style8">
                            SOLICITUD ELEMENTOS DE PROTECCION PERSONAL
                            <asp:Label ID="LabelEstadoFom" runat="server"></asp:Label>
                            </td>
    </tr>
    <tr>
    <td colspan ="5" class="style18">
     <asp:Label ID="LabelError" runat="server"></asp:Label>
    </td></tr>
    <tr>
        <td class="auto-style7">
         
          <asp:Label id="q" runat="server" Text="Lugar: " ></asp:Label>
         
        </td>
        <td class="auto-style5" >
            
                        
            <asp:DropDownList ID="List1area" runat="server" DataSourceID="SqlDataArea" DataTextField="NombreDependecia" DataValueField="NombreDependecia" AutoPostBack="True">
                <asp:ListItem>_</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataArea" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT NombreDependecia FROM Sis_HV_Dependencias WHERE (NombreDependecia NOT LIKE N'%BODEGA%') OR (NombreDependecia NOT LIKE N'%_%') ORDER BY NombreDependecia"></asp:SqlDataSource>
            
                        
        </td></td>
        <td class="style13">
            
                        
               <asp:Label ID="Label1" runat="server" Text="Equipo: "></asp:Label>
            <asp:SqlDataSource ID="SqlDataSourcePc0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                SelectCommand="SELECT DISTINCT Sis_HV_Equipos.Serial, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_Dependencias INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_Dependencias.IdDependencia = Sis_HV_PuntosTrabajo.IdDependencia INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Dependencias.NombreDependecia = @DEPE) AND (Sis_HV_UbicacionesEquipos.NombreEquipo &gt; N'0') order by Sis_HV_UbicacionesEquipos.NombreEquipo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="List1area" Name="DEPE" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

                                
        <td class="style15">
           
            <asp:SqlDataSource ID="SqlDataSourcePc1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                SelectCommand="SELECT TOP (1) Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_UbicacionesEquipos INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Equipos.Serial = @codigo) ORDER BY Sis_HV_Equipos.Serial DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Codigo" Name="codigo" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

                                
            <asp:TextBox ID="Codigo" runat="server"></asp:TextBox>

                                
            </td>
        <td class="style17">
            
              <asp:TextBox ID="TextBox1" runat="server" BorderColor="White" ForeColor="White" BorderStyle="Double" Font-Bold="True" ReadOnly="True" style="margin-left: 0px " Visible="False"></asp:TextBox>
            
            </td>
    </tr>
    <tr>
        <td class="style19" colspan="5">
           <asp:Label ID="LabelMsg" runat="server"></asp:Label> 
            <asp:TextBox ID="Nota" runat="server" AutoCompleteType="Disabled" AutoPostBack="True"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Height="22px"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
    </tr>
    <tr>
        <td colspan="5" valign="middle">
           
              <asp:Label ID="Label9" runat="server" Text="Solicitud:  "></asp:Label>  
                      
        </td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;<asp:Label ID="notavalida" runat="server" ForeColor="Red"></asp:Label></td>
        <td class="style15">
            &nbsp;</td>
        <td class="style17">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">
            
            <asp:Button ID="Btnguardar" runat="server" Text="Guardar" UseSubmitBehavior="false" />
            </td>
        <td>
            
             <asp:SqlDataSource ID="DataTime" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
            
            </td>
        <td class="style13">
                  <asp:SqlDataSource ID="DataConsultas" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
              <asp:SqlDataSource ID="DataH" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
              <asp:SqlDataSource ID="DataH0" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>">
                            </asp:SqlDataSource>
            <asp:SqlDataSource ID="datauser" runat="server" 
                                
                ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString%>">
                            </asp:SqlDataSource>
            </td>
        <td class="style15">
            
                  
                   <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Fosyga.aspx" style="font-family: Tahoma; font-size: 8pt; color:White " /> 
            </td>
        <td 
      


 

        </td>
    </tr>
  
  
 
   
</table>



            </panel>
 
    
              
</ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>