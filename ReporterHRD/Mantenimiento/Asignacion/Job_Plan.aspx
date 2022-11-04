﻿<%@ Page Title="Solicitud Mantenimiento PC" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Job_Plan.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

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
       .auto-style1 {
           width: 153px;
           height: 8px;
       }
       .auto-style2 {
           width: 207px;
           height: 8px;
       }
       .auto-style4 {
           width: 233px;
       }
       .auto-style5 {
           text-align: right;
           height: 58px;
       }
       .auto-style6 {
           margin-bottom: 11px;
       }
       .auto-style7 {
           width: 233px;
           text-align: right;
           height: 58px;
       }
       .auto-style8 {
           text-align: left;
       }
       .auto-style9 {
           width: 243px;
           text-align: right;
           height: 58px;
       }
       .auto-style10 {
           width: 513px;
           height: 58px;
       }
       .auto-style11 {
           width: 139px;
           height: 58px;
       }
       .auto-style12 {
           text-align: left;
           height: 13px;
       }
       .auto-style13 {
           width: 233px;
           text-align: right;
           height: 13px;
       }
       .auto-style14 {
           width: 513px;
           height: 13px;
       }
       .auto-style15 {
           width: 139px;
           height: 13px;
       }
   </style>
</head>
  




    <asp:Panel ID="panelSolicitud" runat="server" Height="10px" Width="10px" >
           </asp:Panel>

        <table cellspacing="1" >
    <tr>
        <td colspan="5"
            style="text-align: center;  color: #000000; font-weight: bold; font-size: 20px;" 
                            class="style8"> CREAR SOPORTE
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
        <td class="auto-style9">
            
                        
               <div class="auto-style8">
            
                        
               <asp:Label ID="Label1" runat="server" Text="Equipo: "></asp:Label>
            &nbsp;<asp:DropDownList ID="Codigo" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSourcePc0" DataTextField="NombreEquipo" DataValueField="Serial" CssClass="auto-style6">
            </asp:DropDownList>
               </div>
            <asp:SqlDataSource ID="SqlDataSourcePc0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                SelectCommand="SELECT DISTINCT Sis_HV_Equipos.Serial, Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_Dependencias INNER JOIN Sis_HV_PuntosTrabajo ON Sis_HV_Dependencias.IdDependencia = Sis_HV_PuntosTrabajo.IdDependencia INNER JOIN Sis_HV_UbicacionesEquipos ON Sis_HV_PuntosTrabajo.IdPuntoTrabajo = Sis_HV_UbicacionesEquipos.IdPuntoTrabajo INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Dependencias.NombreDependecia = @DEPE) AND (Sis_HV_UbicacionesEquipos.NombreEquipo &gt; N'0') order by Sis_HV_UbicacionesEquipos.NombreEquipo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="List1area" Name="DEPE" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

                                
            <td class="auto-style10">
           
                Encargado:<asp:DropDownList ID="asignaList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Responsable" DataValueField="UserName">
                </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnDB_Usuarios %>" SelectCommand="SELECT DISTINCT CASE WHEN aspnet_Users.UserName = 'ASI001' THEN 'Johana Gutierrez' WHEN aspnet_Users.UserName = 'ASI002' THEN 'Sebastian Mora'  WHEN aspnet_Users.UserName = 'ASI003' THEN 'Diego Ostos' WHEN aspnet_Users.UserName = 'SUA001' THEN 'Alirio Rodriguez' WHEN aspnet_Users.UserName = 'SUA007' THEN 'Fabian Goyeneche' WHEN aspnet_Users.UserName = 'SUA009' THEN 'Diego Agudelo' WHEN aspnet_Users.UserName = 'SUA011' THEN 'Emerson González' WHEN aspnet_Users.UserName = 'SUA012' THEN 'Germán Correa'  END AS Responsable, aspnet_Users.UserName FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId WHERE (aspnet_Users.UserName LIKE '%asi%' OR aspnet_Users.UserName LIKE '%sua%') AND (aspnet_Membership.IsLockedOut = 0) ORDER BY aspnet_Users.UserName"></asp:SqlDataSource>

                                
            </td>
        <td class="auto-style11">
            
              <asp:TextBox ID="TextBox1" runat="server" BorderColor="White" ForeColor="White" BorderStyle="Double" Font-Bold="True" ReadOnly="True" style="margin-left: 0px " Visible="False"></asp:TextBox>
            
            </td>
    </tr>
    <tr>
        <td class="auto-style13">
         
            Tipo Mantenimiento:</td>
        <td class="auto-style12" colspan="2" >
            
                        
            <asp:DropDownList ID="TipoManList1" runat="server" DataSourceID="TipoMan" DataTextField="Tipo_Man" DataValueField="Id">
            </asp:DropDownList>
            
                        
        </td>

                                
            <td class="auto-style14">
           
            <asp:SqlDataSource ID="TipoMan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Tipo_Man] FROM [Sis_HV_TiposMantenimiento]"></asp:SqlDataSource>
            
                        
        </td>
        <td class="auto-style15">
            
                                
            <asp:SqlDataSource ID="SqlDataSourcePc1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                
                SelectCommand="SELECT TOP (1) Sis_HV_UbicacionesEquipos.NombreEquipo FROM Sis_HV_UbicacionesEquipos INNER JOIN Sis_HV_Equipos ON Sis_HV_UbicacionesEquipos.IdEquipo = Sis_HV_Equipos.IdEquipo WHERE (Sis_HV_Equipos.Serial = @codigo) ORDER BY Sis_HV_Equipos.Serial DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Codigo" Name="codigo" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

                                
            </td>
    </tr>
    <tr>
        <td class="style19" colspan="5">
           <asp:Label ID="LabelMsg" runat="server"></asp:Label> 
            </td>
    </tr>
    <tr>
        <td colspan="5" valign="middle">
           
              <asp:Label ID="Label9" runat="server" Text="Solicitud:  "></asp:Label>  
                      
                            <asp:TextBox ID="Nota"  TextMode="MultiLine" Wrap="true" text=" " runat="server" Height="100px" Width="1000px" BorderStyle="Double"></asp:TextBox>
                          
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
      
 
<asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
 

 

        </td>
    </tr>
  
  
 
   
</table>




 
    
              <asp:Panel ID="Paneluser" runat="server" Height="450px" Width="500px">

                  

     <asp:Label ID="Label4" runat="server" Text="Porfavor ingrese con su usuario y contraseña, si no tiene usuario "></asp:Label>
                  <br />
                  <asp:Label ID="Label10" runat="server" Text="por favor digite el usuario que utiliza en Dinamica (DGH)  "></asp:Label>
                  <br />
                  <asp:Label ID="Label3" runat="server" Text="Contraseña predefinida 1234567890+"></asp:Label>
                  <asp:Label ID="Label5" runat="server" ></asp:Label>
                  <asp:CreateUserWizard ID="FormNuevoUsuario1" runat="server" CancelDestinationPageUrl="~/UserAdmin/Index.aspx" FinishDestinationPageUrl="~/UserAdmin/Index.aspx" Width="348px">
                      <WizardSteps>
                          <asp:CreateUserWizardStep runat="server">
                              <ContentTemplate>
                                  <table border="0" style="width: 364px">
                                      <tr>
                                          <td align="right" style="width: 153px">
                                              <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" ForeColor="Black" Visible="False">Confirmar contraseña:</asp:Label>
                                          </td>
                                          <td style="width: 207px; text-align: left">
                                              <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator> 
                                              <asp:TextBox ID="Password" runat="server" BorderColor="Black" ForeColor="Black" ReadOnly="True" ViewStateMode="Enabled" Visible="False">1234567890+</asp:TextBox>
                                              <asp:TextBox ID="ConfirmPassword" runat="server" BorderColor="Black" ForeColor="Black" ReadOnly="True" Visible="False">1234567890+</asp:TextBox>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="right" bgcolor="White" class="auto-style1">
                                              <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" ForeColor="Black" Visible="False">Contraseña:</asp:Label>
                                          </td>
                                          <td style="text-align: left" class="auto-style2">
                                              <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="right" style="width: 153px">
                                              <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Bold="True" ForeColor="Red">Nombre de usuario en DGH:</asp:Label>
                                          </td>
                                          <td style="width: 207px; " class="auto-style8">
                                              <asp:TextBox ID="UserName" runat="server" AutoCompleteType="Enabled" CausesValidation="True" Text="usaer" ViewStateMode="Enabled"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirmar contraseña es obligatorio." ToolTip="Confirmar contraseña es obligatorio." ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="right" style="width: 153px">
                                              <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" Font-Bold="True" ForeColor="Red">Correo electrónico:</asp:Label>
                                          </td>
                                          <td style="width: 207px; text-align: left">
                                              <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="El correo electrónico es obligatorio." ToolTip="El correo electrónico es obligatorio." ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="right" style="width: 153px">
                                              <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Visible="False">Pregunta de seguridad:</asp:Label>
                                          </td>
                                          <td style="width: 207px; text-align: left">
                                              <asp:TextBox ID="Question" runat="server" ReadOnly="True" Visible="False">Color Favorito</asp:TextBox>
                                              <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="La pregunta de seguridad es obligatoria." ToolTip="La pregunta de seguridad es obligatoria." ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="right" style="width: 153px">
                                              <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Visible="False">Respuesta de seguridad:</asp:Label>
                                          </td>
                                          <td style="width: 207px; text-align: left">
                                              <asp:TextBox ID="Answer" runat="server" ReadOnly="True" Text="Azul" Visible="False" Wrap="False"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="La respuesta de seguridad es obligatoria." ToolTip="La respuesta de seguridad es obligatoria." ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="center" colspan="2">
                                              <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Contraseña y Confirmar contraseña deben coincidir." ValidationGroup="FormNuevoUsuario1"></asp:CompareValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td align="center" colspan="2" style="color: red">
                                              <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                          </td>
                                      </tr>
                                  </table>
                              </ContentTemplate>
                          </asp:CreateUserWizardStep>
                          <asp:CompleteWizardStep runat="server">
                          </asp:CompleteWizardStep>
                      </WizardSteps>
                      <TitleTextStyle BackColor="#FFE0C0" />
                  </asp:CreateUserWizard>
                     <table border="0" style="width: 364px">
            <tr>
                <td align="right" style="width: 153px; height: 40px;">



                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles] where RoleName ='user'"></asp:SqlDataSource>



                    </td>
                <td style="width: 207px; text-align: left; height: 40px;">
                    <asp:DropDownList ID="ListRoles" runat="server"
                        Width="196px" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName" Visible="False" >
                        <asp:ListItem>v</asp:ListItem>
                        <asp:ListItem>b</asp:ListItem>
                    </asp:DropDownList><br />
                    <span style="font-size: 8pt; color: dimgray; font-family: Verdana">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></span></td>
            </tr>
        </table>
            </asp:Panel>
</asp:Content>