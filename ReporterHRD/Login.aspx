<%@ Page Title="Validación ed Usuario" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="PaginaBase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 12%;
            height: 49px;
        }
        .style2
        {
            width: 38%;
            height: 49px;
        }
        .style3
        {
            width: 25%;
            height: 49px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('Images/Fondo01.jpg');" 
                >
                INICIAR SESIÓN</td>
        </tr>
        <tr >
        <td class="style1" >
                </td>
            <td class="style2" >
            </td>
            
            <td class="style3" >
                </td>
            <td class="style3" >
                </td>
        </tr>
        <tr >
        <td style="width: 12%" >
                </td>
            <td style="width: 38%; " >
                <asp:Login ID="Login1" runat="server" 
                    style="text-align: center; font-size: 10pt" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" BorderWidth="1px" TitleText="">
                    <TitleTextStyle BackColor="#6FBDFB" Font-Bold="True" ForeColor="White" />
                </asp:Login>
            </td>
            
            <td style="width: 25%" >
                <img alt="" src="Images/Candado.jpg" /></td>
            <td style="width: 25%" >
                </td>
        </tr>
        <tr >
        <td style="width: 12%" >
                </td>
            <td style="text-align: center;" colspan="2" >
                <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
            </td>
            <td style="width: 25%" >
                </td>
        </tr>
        </table>
</asp:Content>

