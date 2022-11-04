<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NuevoUsuario.aspx.vb" Inherits="UserAdmin_Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Crear Nuevo Usuario</title>
</head>
<body  bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" style="text-align: center">
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <table style="width: 1000px; height: 1px">
                <tr>
                    <td style="width: 1000px; border-bottom: blue thin inset; background-color: #eeeae3;
                        text-align: right">
                        <a href="javascript:history.back();"><span style="font-size: 8pt; font-family: Verdana">
                            Volver a la Página Anterior</span></a> -&nbsp;
                        <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Names="Verdana" Font-Size="8pt" />
                    </td>
                </tr>
            </table>
        </div>
        <table bgcolor="#663366" border="0" cellpadding="0" cellspacing="0" style="width: 663px;
            height: 1px; background-color: #1b608b; text-align: center">
            <tr>
                <td align="left" style="height: 29px" valign="top">
                    <img height="11" src="../AppImages/sup-izq.gif" width="11" /></td>
                <td rowspan="2" style="width: 827px; text-align: center">
                    <font color="#ffffff" face="verdana,arial,helvetica" size="6"><b><span style="font-size: 16pt;
                        color: #eaeeeb">CREAR NUEVO USUARIO Y/O CUENTA</span></b></font></td>
                <td align="right" style="height: 29px" valign="top" width="11">
                    <img height="11" src="../AppImages/sup-der.gif" width="11" /></td>
            </tr>
            <tr>
                <td align="left" style="height: 11px" valign="bottom">
                    <img height="11" src="../AppImages/inf-izq.gif" width="11" /></td>
                <td align="right" style="height: 11px" valign="bottom" width="11">
                    <img height="11" src="../AppImages/inf-der.gif" width="11" /></td>
            </tr>
        </table>
    
    </div>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=pach\SQLEXPRESS;Database=ASPNETDB;User ID=sa;Password=Hrd2021Gi"
            ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]">
        </asp:SqlDataSource>
        <asp:Panel ID="Panel1" runat="server" Height="45px" Width="448px">
        <table border="0" style="width: 364px">
            <tr>
                <td align="right" style="width: 153px; height: 40px;">
                    Role:</td>
                <td style="width: 207px; text-align: left; height: 40px;">
                    <asp:DropDownList ID="ListRoles" runat="server"
                        Width="196px" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName">
                        <asp:ListItem>v</asp:ListItem>
                        <asp:ListItem>b</asp:ListItem>
                    </asp:DropDownList><br />
                    <span style="font-size: 8pt; color: dimgray; font-family: Verdana">
                        <asp:Label ID="Label1" runat="server" Text="Luego podrá asignarle más Roles."></asp:Label></span></td>
            </tr>
        </table>
        </asp:Panel>
        <asp:CreateUserWizard ID="FormNuevoUsuario1" runat="server" Width="348px" CancelDestinationPageUrl="~/UserAdmin/Index.aspx" FinishDestinationPageUrl="~/UserAdmin/Index.aspx">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server">
                    <ContentTemplate>
                        <table border="0" style="width: 364px">
                            <tr>
                                <td align="right" style="width: 153px">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label></td>
                                <td style="width: 207px; text-align: left">
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 153px">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label></td>
                                <td style="width: 207px; text-align: left">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 153px">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirmar contraseña:</asp:Label></td>
                                <td style="width: 207px; text-align: left">
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="Confirmar contraseña es obligatorio." ToolTip="Confirmar contraseña es obligatorio."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 153px">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Correo electrónico:</asp:Label></td>
                                <td style="width: 207px; text-align: left">
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="El correo electrónico es obligatorio." ToolTip="El correo electrónico es obligatorio."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 153px">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Pregunta de seguridad:</asp:Label></td>
                                <td style="width: 207px; text-align: left">
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                        ErrorMessage="La pregunta de seguridad es obligatoria." ToolTip="La pregunta de seguridad es obligatoria."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 153px">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Respuesta de seguridad:</asp:Label></td>
                                <td style="width: 207px; text-align: left">
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="La respuesta de seguridad es obligatoria." ToolTip="La respuesta de seguridad es obligatoria."
                                        ValidationGroup="FormNuevoUsuario1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Contraseña y Confirmar contraseña deben coincidir."
                                        ValidationGroup="FormNuevoUsuario1"></asp:CompareValidator>
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
        &nbsp;
        <br />
        <br />
        <br />
        <hr />
        <span style="font-size: 8pt; font-family: Arial">©2006-2007 Gonwil DU</span>
    </form>
</body>
</html>
