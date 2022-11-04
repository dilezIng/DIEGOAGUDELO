<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="UserAdmin_Index" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administración de Seguridad por Usuarios y Roles del Portal</title>
</head>
<body  bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" style="text-align: center">
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <table style="width: 1000px; height: 1px">
                <tr>
                    <td style="width: 1000px; border-bottom: blue thin inset; background-color: #eeeae3;
                        text-align: right">
                        <a href=""><span style="font-size: 8pt; font-family: Verdana">
                            Volver a la Página Anterior</span></a> -
                        <asp:LoginName ID="LoginName1" runat="server" Visible="False" Width="131px" />
                        <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Names="Verdana" Font-Size="8pt" />
                    </td>
                </tr>
            </table>
        </div>
        <table bgcolor="#663366" border="0" cellpadding="0" cellspacing="0" style="width: 663px;
            height: 1px; background-color: #1b608b; text-align: center">
            <tr>
                <td rowspan="2" style="width: 827px; text-align: center">
                    <font color="#ffffff" face="verdana,arial,helvetica" size="6"><b><span style="font-size: 16pt;
                        color: #eaeeeb">GESTION DE USUARIOS</span></b></font></td>
            </tr>
            <tr>
            </tr>
        </table>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UserAdmin/NuevoUsuario.aspx">Crear Nuevo Usuario</asp:HyperLink><br />
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            DataKeyNames="UserId" DataSourceID="SqlDataSource1" AllowPaging="True" 
        PageSize="50">
            <Columns>
                <asp:CommandField SelectText="Ver Datos" ShowSelectButton="True" />
                <asp:BoundField DataField="UserName" HeaderText="Nombre" SortExpression="UserName">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="LastActivityDate" HeaderText="Ultima Actividad" SortExpression="LastActivityDate">
                    <ItemStyle Font-Names="Verdana" Font-Size="7pt" />
                </asp:BoundField>
                <asp:BoundField DataField="LastLoginDate" HeaderText="Ultima Conexi&#243;n" SortExpression="LastLoginDate">
                    <ItemStyle Font-Names="Verdana" Font-Size="7pt" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="IsAnonymous" HeaderText="An&#243;nimo" SortExpression="IsAnonymous" />
                <asp:CheckBoxField DataField="IsApproved" HeaderText="Activo" SortExpression="IsApproved" />
                <asp:CheckBoxField DataField="IsLockedOut" HeaderText="Bloqueado" SortExpression="IsLockedOut" />
                <asp:BoundField DataField="FailedPasswordAttemptCount" HeaderText="Conexiones Fallidas"
                    SortExpression="FailedPasswordAttemptCount" />
            </Columns>
            <SelectedRowStyle BackColor="#FFFF80" />
            <AlternatingRowStyle BackColor="Azure" />
            <PagerStyle BackColor="#FFE0C0" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt" />
            <HeaderStyle BackColor="#FFE0C0" Font-Names="Verdana" Font-Size="9pt" Font-Strikeout="False" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True"
            ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT vw_aspnet_Users.UserName, vw_aspnet_Users.LastActivityDate, aspnet_Membership.LastLoginDate, aspnet_Membership.IsLockedOut, aspnet_Membership.IsApproved, aspnet_Membership.FailedPasswordAttemptCount, vw_aspnet_Users.UserId, vw_aspnet_Users.IsAnonymous FROM vw_aspnet_Users INNER JOIN aspnet_Membership ON vw_aspnet_Users.UserId = aspnet_Membership.UserId ORDER BY vw_aspnet_Users.UserName">
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server"
            DataSourceID="SqlDataSource2" DefaultMode="Edit" BackColor="#DCF0FF" BorderStyle="Ridge" Width="898px" Visible="False" DataKeyNames="UserId" DataMember="DefaultView">
            <EditItemTemplate>
                <asp:Label ID="LabelEliminarUser" runat="server" BackColor="Red" BorderColor="#C04000"
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="14pt"
                    ForeColor="Gainsboro" Height="21px" Text="Label" Visible="False"></asp:Label><asp:Button
                        ID="Button2" runat="server" OnClick="Button2_Click" Text="Si estoy seguro" Visible="False" /><table style="font-weight: bold; font-size: 12pt; width: 100%; color: #ffffff">
                    <tr>
                        <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                            <table style="border-right: steelblue thin double; border-top: steelblue thin double;
                                font-weight: bold; font-size: 12pt; border-left: steelblue thin double; width: 100%;
                                color: #ffffff; border-bottom: steelblue thin double">
                                <tr>
                                    <td colspan="2" style="font-weight: bold; margin: 40px; height: 4px; text-align: center">
                                        <asp:Label ID="Label4" runat="server" BackColor="#00C0C0" BorderColor="#E0E0E0" BorderStyle="Ridge"
                                            Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="DATOS PERSONALES"
                                            Width="379px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        <span style="color: #333399; font-family: Arial">Id:</span></td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="IdUsuario" runat="server" ForeColor="Black" Text='<%# Eval("UserId") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Nombre</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' Width="264px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Alias:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                <asp:TextBox ID="MobileAliasTextBox" runat="server" Text='<%# Bind("MobileAlias") %>' Width="264px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        PIN:
                                    </td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MobilePIN") %>' Width="264px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: center; font-variant: normal">
                                        Anonimo:<asp:CheckBox ID="IsAnonymousCheckBox" runat="server" Checked='<%# Bind("IsAnonymous") %>' />&nbsp;
                                        Activo:<asp:CheckBox ID="IsApprovedCheckBox" runat="server" Checked='<%# Bind("IsApproved") %>' />&nbsp;
                                        Bloqueado:<asp:CheckBox ID="IsLockedOutCheckBox" runat="server" Checked='<%# Bind("IsLockedOut") %>' /></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        E-Mail:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="Mail" runat="server" ForeColor="Black" Text='<%# Eval("Email") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        <span style="font-size: 9pt">Pregunta de Seguridad:</span></td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="Pregunta" runat="server" ForeColor="Black" Text='<%# Eval("PasswordQuestion") %>'></asp:Label>
                                        <asp:Label ID="LabelIdUsDg" runat="server" 
                                            style="font-size: 8pt; color: #000000" Text='<%# Eval("IdUsDgh") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Última Actividad:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="UltimaActividad" runat="server" ForeColor="Black" Text='<%# Eval("LastActivityDate") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Fecha de Creación:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="Creacion" runat="server" ForeColor="Black" Text='<%# Eval("CreateDate") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Última Conexión:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="UltimaConexion" runat="server" ForeColor="Black" Text='<%# Eval("LastLoginDate") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        <span style="font-size: 9pt">Último Cambio de Clave:</span></td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="UltCambioClave" runat="server" ForeColor="Black" Text='<%# Eval("LastPasswordChangedDate") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Último Bloqueo:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="UltimoBloqueo" runat="server" ForeColor="Black" Text='<%# Eval("LastLockoutDate") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        <span style="font-size: 9pt">Número de &nbsp;Intentos de conexión fallidos:</span></td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <asp:Label ID="IntentosFallidos" runat="server" ForeColor="Black" Text='<%# Eval("FailedPasswordAttemptCount") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        <span style="font-size: 9pt">Número de &nbsp;Intentos de conexión fallidos con pregunta
                                            de seguridad:</span></td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                                        <span style="font-size: 9pt">
                                            <asp:Label ID="AnswerFallidos" runat="server" Font-Size="12pt" ForeColor="Black"
                                                Text='<%# Eval("FailedPasswordAnswerAttemptCount") %>'></asp:Label></span></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                        text-transform: none; width: 25%; color: royalblue; font-style: normal; font-family: Arial;
                                        height: 4px; text-align: right; font-variant: normal">
                                        Comentarios:</td>
                                    <td style="font-weight: bold; margin: 40px; width: 49%; height: 4px; text-align: justify">
                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' Height="34px" TextMode="MultiLine" Width="262px"></asp:TextBox></td>
                                </tr>
                            </table>
                        </td>
                        <td style="font-weight: bold; margin: 40px; vertical-align: top; width: 49%; height: 4px;
                            text-align: justify">
                            <span style="font-size: 10pt; vertical-align: top; color: #434343; font-family: Arial">
                                <table style="font-weight: bold; font-size: 12pt; width: 100%; color: #ffffff">
                                    <tr>
                                        <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                            text-transform: none; color: royalblue; font-style: normal; font-family: Arial;
                                            height: 4px; text-align: center; font-variant: normal; width: 382px;">
                                            <asp:Label ID="Label3" runat="server" BackColor="#00C0C0" BorderColor="#E0E0E0" BorderStyle="Ridge"
                                                Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="ROLES A LOS QUE PERTENECE"
                                                Width="305px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold; font-size: 11pt; margin: 40px; vertical-align: middle;
                                            text-transform: none; color: royalblue; font-style: normal; font-family: Arial;
                                            height: 4px; text-align: center; font-variant: normal; width: 382px;">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="RolesUsuario"
                    ShowHeader="False" Width="376px">
                    <Columns>
                        <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                    </Columns>
                    <EmptyDataTemplate>
                        <span style="color: red">Este usuario no pertenece a un Role.</span>
                    </EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="LightCyan" />
                </asp:GridView>
                <asp:SqlDataSource ID="RolesUsuario" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True"
                    ProviderName="System.Data.SqlClient" 
                                                SelectCommand="SELECT aspnet_Roles.RoleName FROM vw_aspnet_UsersInRoles INNER JOIN aspnet_Roles ON vw_aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (vw_aspnet_UsersInRoles.UserId = @NomUser)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="NomUser" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                                            <asp:Label ID="LabelRoleEx" runat="server" BackColor="#C0FFFF" BorderColor="#E0E0E0"
                                                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                                Font-Strikeout="False" ForeColor="Red" Visible="False"></asp:Label><br />
                                            <asp:SqlDataSource ID="Roles" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True"
                                                ProviderName="System.Data.SqlClient" 
                                                SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]" 
                                                UpdateCommand="UPDATE aspnet_Membership SET UserId =, IsApproved = @Aprobado, IsLockedOut = @Bloqueado WHERE (UserId = @UserID)">
                                                <UpdateParameters>
                                                    <asp:ControlParameter ControlID="IsApprovedCheckBox" Name="Aprobado" PropertyName="Checked" />
                                                    <asp:ControlParameter ControlID="IsLockedOutCheckBox" Name="Bloqueado" PropertyName="Checked" />
                                                    <asp:ControlParameter ControlID="IdUsuario" Name="UserID" PropertyName="Text" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            &nbsp;
                                            <asp:DropDownList ID="ListRoles" runat="server" DataSourceID="Roles" DataTextField="RoleName"
                                                DataValueField="RoleName" Width="208px">
                                                <asp:ListItem>v</asp:ListItem>
                                                <asp:ListItem>b</asp:ListItem>
                                            </asp:DropDownList><br />
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                                Text="Añadir a Role" Width="101px" />
                                            <asp:Button ID="ButtonQuitar" runat="server" OnClick="ButtonQuitar_Click"
                                                Text="Quitar de Role" Width="114px" /></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold; font-size: 11pt; margin: 0px; vertical-align: top;
                                            text-transform: none; color: royalblue; font-style: normal; font-family: Arial;
                                            height: 4px; text-align: center; font-variant: normal; width: 382px;">
                                            Usuario Asociado en DGH:
                                            <asp:TextBox ID="TextUsEntrego" runat="server" Width="175px"></asp:TextBox>
                                            <ajaxToolkit:AutoCompleteExtender ID="TextUsEntrego_AutoCompleteExtender" 
                                                runat="server" ServiceMethod="BusqUsuarioDGH" 
                                                TargetControlID="TextUsEntrego">
                                            </ajaxToolkit:AutoCompleteExtender>
                                            <asp:Button ID="BtnAsociar" runat="server" onclick="BtnAsociar_Click" 
                                                style="font-size: 8pt" Text="Asociar" />
                                            <asp:Label ID="LabelIdUsDgh" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </td>
                    </tr>
                </table>
                <div style="text-align: center">
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Actualizar" OnClick="UpdateButton_Click"></asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancelar" OnClick="UpdateCancelButton_Click"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Eliminar</asp:LinkButton></div>
            </EditItemTemplate>
            <InsertItemTemplate>
                UserId:
                <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>'>
                </asp:TextBox><br />
                UserName:
                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>'>
                </asp:TextBox><br />
                MobileAlias:
                <asp:TextBox ID="MobileAliasTextBox" runat="server" Text='<%# Bind("MobileAlias") %>'>
                </asp:TextBox><br />
                IsAnonymous:
                <asp:CheckBox ID="IsAnonymousCheckBox" runat="server" Checked='<%# Bind("IsAnonymous") %>' /><br />
                LastActivityDate:
                <asp:TextBox ID="LastActivityDateTextBox" runat="server" Text='<%# Bind("LastActivityDate") %>'>
                </asp:TextBox><br />
                PasswordSalt:
                <asp:TextBox ID="PasswordSaltTextBox" runat="server" Text='<%# Bind("PasswordSalt") %>'>
                </asp:TextBox><br />
                MobilePIN:
                <asp:TextBox ID="MobilePINTextBox" runat="server" Text='<%# Bind("MobilePIN") %>'>
                </asp:TextBox><br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'>
                </asp:TextBox><br />
                LoweredEmail:
                <asp:TextBox ID="LoweredEmailTextBox" runat="server" Text='<%# Bind("LoweredEmail") %>'>
                </asp:TextBox><br />
                PasswordQuestion:
                <asp:TextBox ID="PasswordQuestionTextBox" runat="server" Text='<%# Bind("PasswordQuestion") %>'>
                </asp:TextBox><br />
                PasswordAnswer:
                <asp:TextBox ID="PasswordAnswerTextBox" runat="server" Text='<%# Bind("PasswordAnswer") %>'>
                </asp:TextBox><br />
                IsApproved:
                <asp:CheckBox ID="IsApprovedCheckBox" runat="server" Checked='<%# Bind("IsApproved") %>' /><br />
                IsLockedOut:
                <asp:CheckBox ID="IsLockedOutCheckBox" runat="server" Checked='<%# Bind("IsLockedOut") %>' /><br />
                CreateDate:
                <asp:TextBox ID="CreateDateTextBox" runat="server" Text='<%# Bind("CreateDate") %>'>
                </asp:TextBox><br />
                LastLoginDate:
                <asp:TextBox ID="LastLoginDateTextBox" runat="server" Text='<%# Bind("LastLoginDate") %>'>
                </asp:TextBox><br />
                LastPasswordChangedDate:
                <asp:TextBox ID="LastPasswordChangedDateTextBox" runat="server" Text='<%# Bind("LastPasswordChangedDate") %>'>
                </asp:TextBox><br />
                LastLockoutDate:
                <asp:TextBox ID="LastLockoutDateTextBox" runat="server" Text='<%# Bind("LastLockoutDate") %>'>
                </asp:TextBox><br />
                FailedPasswordAttemptCount:
                <asp:TextBox ID="FailedPasswordAttemptCountTextBox" runat="server" Text='<%# Bind("FailedPasswordAttemptCount") %>'>
                </asp:TextBox><br />
                FailedPasswordAnswerAttemptCount:
                <asp:TextBox ID="FailedPasswordAnswerAttemptCountTextBox" runat="server" Text='<%# Bind("FailedPasswordAnswerAttemptCount") %>'>
                </asp:TextBox><br />
                Comment:
                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insertar">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancelar">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                UserId:
                <asp:Label ID="UserIdLabel" runat="server" Text='<%# Bind("UserId") %>'></asp:Label><br />
                UserName:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>'></asp:Label><br />
                MobileAlias:
                <asp:Label ID="MobileAliasLabel" runat="server" Text='<%# Bind("MobileAlias") %>'>
                </asp:Label><br />
                IsAnonymous:
                <asp:CheckBox ID="IsAnonymousCheckBox" runat="server" Checked='<%# Bind("IsAnonymous") %>'
                    Enabled="false" /><br />
                LastActivityDate:
                <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Bind("LastActivityDate") %>'>
                </asp:Label><br />
                PasswordSalt:
                <asp:Label ID="PasswordSaltLabel" runat="server" Text='<%# Bind("PasswordSalt") %>'>
                </asp:Label><br />
                MobilePIN:
                <asp:Label ID="MobilePINLabel" runat="server" Text='<%# Bind("MobilePIN") %>'></asp:Label><br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>'></asp:Label><br />
                LoweredEmail:
                <asp:Label ID="LoweredEmailLabel" runat="server" Text='<%# Bind("LoweredEmail") %>'>
                </asp:Label><br />
                PasswordQuestion:
                <asp:Label ID="PasswordQuestionLabel" runat="server" Text='<%# Bind("PasswordQuestion") %>'>
                </asp:Label><br />
                PasswordAnswer:
                <asp:Label ID="PasswordAnswerLabel" runat="server" Text='<%# Bind("PasswordAnswer") %>'>
                </asp:Label><br />
                IsApproved:
                <asp:CheckBox ID="IsApprovedCheckBox" runat="server" Checked='<%# Bind("IsApproved") %>'
                    Enabled="false" /><br />
                IsLockedOut:
                <asp:CheckBox ID="IsLockedOutCheckBox" runat="server" Checked='<%# Bind("IsLockedOut") %>'
                    Enabled="false" /><br />
                CreateDate:
                <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Bind("CreateDate") %>'>
                </asp:Label><br />
                LastLoginDate:
                <asp:Label ID="LastLoginDateLabel" runat="server" Text='<%# Bind("LastLoginDate") %>'>
                </asp:Label><br />
                LastPasswordChangedDate:
                <asp:Label ID="LastPasswordChangedDateLabel" runat="server" Text='<%# Bind("LastPasswordChangedDate") %>'>
                </asp:Label><br />
                LastLockoutDate:
                <asp:Label ID="LastLockoutDateLabel" runat="server" Text='<%# Bind("LastLockoutDate") %>'>
                </asp:Label><br />
                FailedPasswordAttemptCount:
                <asp:Label ID="FailedPasswordAttemptCountLabel" runat="server" Text='<%# Bind("FailedPasswordAttemptCount") %>'>
                </asp:Label><br />
                FailedPasswordAnswerAttemptCount:
                <asp:Label ID="FailedPasswordAnswerAttemptCountLabel" runat="server" Text='<%# Bind("FailedPasswordAnswerAttemptCount") %>'>
                </asp:Label><br />
                Comment:
                <asp:Label ID="CommentLabel" runat="server" Text='<%# Bind("Comment") %>'></asp:Label><br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Editar">
                </asp:LinkButton>
            </ItemTemplate>
            <HeaderTemplate>
                <span style="font-family: Verdana"><strong>
                    <asp:Label ID="Label2" runat="server" BackColor="Blue" Font-Bold="True" Font-Names="Arial"
                        Font-Size="15pt" ForeColor="#FFE0C0" Height="20px" Text="INFORMACION GENERAL DEL USUARIO Y/O DE LA CUENTA"
                        Width="920px"></asp:Label></strong></span>
            </HeaderTemplate>
        </asp:FormView><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Users.MobileAlias, aspnet_Users.IsAnonymous, aspnet_Users.LastActivityDate, aspnet_Membership.PasswordSalt, aspnet_Membership.MobilePIN, aspnet_Membership.Email, aspnet_Membership.LoweredEmail, aspnet_Membership.PasswordQuestion, aspnet_Membership.PasswordAnswer, aspnet_Membership.IsApproved, aspnet_Membership.IsLockedOut, aspnet_Membership.CreateDate, aspnet_Membership.LastLoginDate, aspnet_Membership.LastPasswordChangedDate, aspnet_Membership.LastLockoutDate, aspnet_Membership.FailedPasswordAttemptCount, aspnet_Membership.FailedPasswordAnswerAttemptCount, aspnet_Membership.Comment, aspnet_Users.IdUsDgh FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId WHERE (aspnet_Users.UserId = @UserID)"
            
        
        UpdateCommand="UPDATE aspnet_Membership SET IsApproved = @IsApproved, IsLockedOut = @IsLockedOut, Comment = @Comment, MobilePIN = @MobilePIN WHERE (UserId = @UserId)">
            <UpdateParameters>
                <asp:Parameter Name="IsApproved" />
                <asp:Parameter Name="IsLockedOut" />
                <asp:ControlParameter ControlID="FormView1" Name="UserId" PropertyName="SelectedValue" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="UserID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True"
            ProviderName="System.Data.SqlClient" 
        UpdateCommand="UPDATE aspnet_Users SET UserName = @UserName, IsAnonymous = @EsAnonimo, UserId = WHERE (UserId = @IdUser)">
            <UpdateParameters>
                <asp:Parameter Name="UserName" />
                <asp:Parameter Name="EsAnonimo" />
                <asp:ControlParameter ControlID="FormView1" Name="IdUser" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DataConsultas" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True"
            ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
        &nbsp;
        <hr />
        <span style="font-size: 8pt; font-family: Arial">©2006-2013 Gonwil Sistemas</span>
    </form>
</body>
</html>