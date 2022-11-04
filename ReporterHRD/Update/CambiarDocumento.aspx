<%@ Page Title="Actualizar Datos Paciente" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="CambiarDocumento.aspx.vb" Inherits="Update_DescoEpicri" %>

<%@ Register src="../MenuAdmins.ascx" tagname="MenuAdmins" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;">
        <tr>
            <td colspan="2" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                <table class="style1">
                    <tr>
                        <td style="width: 70%">
                ACTUALIZAR DATOS A PACIENTES</td>
                        <td style="width: 30%; text-align: right;">
                            <asp:DropDownList ID="ListSedes" runat="server">
                                <asp:ListItem Value="2">Sede Duitama</asp:ListItem>
                                <asp:ListItem Value="3">Sede Santarosa</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #C0C0C0; width: 50%; vertical-align: top; font-family: tahoma; font-size: 12pt; background-color: #F0F0F0;">
                Número de Documento:&nbsp;
                <asp:TextBox ID="TextNumDoc" runat="server" MaxLength="25" 
                    AutoCompleteType="Disabled"></asp:TextBox>
  
    &nbsp;<asp:Label ID="LabelIdPaciente" runat="server" style="font-size: 7pt"></asp:Label>
&nbsp;<asp:Label ID="LabelIdTercero" runat="server" style="font-size: 7pt"></asp:Label>
  
    <asp:SqlDataSource ID="DataUpdate" runat="server" 
        ConnectionString="Data Source=PRINCIPALNET;Initial Catalog=DGEMPRES02;Persist Security Info=True;User ID=dghnet;Password=netdinamica" 
        ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            </td>
            <td style="width: 50%">
                <asp:Button ID="ButtonConsultar" runat="server" Text="Consultar" />
                <br />
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #C0C0C0; width: 50%; vertical-align: top; font-family: tahoma; font-size: 12pt; background-color: #F0F0F0;">
                <asp:Label ID="LabelDatpaciente" runat="server"></asp:Label>
                <asp:Panel ID="PanelCambioDatos" runat="server" 
                    GroupingText="Nueva Información" style="text-align: right" 
                    BorderColor="#FF3399" BorderStyle="Solid" BorderWidth="1px" Visible="False">
                    Tipo Documento:
                    <asp:DropDownList ID="ListTpoDoc" runat="server">
                    </asp:DropDownList>
                    <br />
                    Número de Documento:
                    <asp:TextBox ID="TextNueNumDoc" runat="server" MaxLength="15" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <br />
                    Primer Nombre:
                    <asp:TextBox ID="TextNuePrimNombre" runat="server" MaxLength="30" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <br />
                    Segundo Nombre:
                    <asp:TextBox ID="TextNueSegNombre" runat="server" MaxLength="30" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <br />
                    Primer Apellido:
                    <asp:TextBox ID="TextNuePrimApel" runat="server" MaxLength="30" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <br />
                    Segundo Apellido:
                    <asp:TextBox ID="TextNueSegApel" runat="server" MaxLength="30" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <br />
                    <hr />
                    Nombre del Padre:
                    <asp:TextBox ID="TextNueNomPadre" runat="server" MaxLength="120" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <br />
                    Nombre de la Madre:
                    <asp:TextBox ID="TextNueNomMadre" runat="server" MaxLength="120" 
                        AutoCompleteType="Disabled"></asp:TextBox>
                    <hr />
                    Descripción Cambio:

                    <asp:TextBox ID="TextObservacion" runat="server" MaxLength="1000" Width="340px"></asp:TextBox>
                    <br />
                    <asp:Button ID="BtnGrabar" runat="server" Text="Guardar" />
                    </asp:Panel>
            </td>
            <td style="width: 50%; vertical-align: top;">
                <asp:Label ID="LabelInfo" runat="server" 
                    style="font-weight: 700; color: #FF0000" Visible="False"></asp:Label>
            </td>
        </tr>
        </table>
  
    <br />
</asp:Content>

