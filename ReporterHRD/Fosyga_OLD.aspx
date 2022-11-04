<%@ Page Title="BDUA - ADRES" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Fosyga.aspx.vb" Inherits="Fosyga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #iframe1
        {
            height: 251px;
            width: 933px;
        }
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <table class="style1">
        <tr>
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('Images/Fondo01.jpg'); font-family: TAHoma;">
                CONSULTA BDUA - ADRES</td>
        </tr>
    </table>




<iframe id="iframe1" runat="server" height="1000px" 
        src="http://20.20.20.180/v/1.html" 
        width="1000px" />
</asp:Content>

