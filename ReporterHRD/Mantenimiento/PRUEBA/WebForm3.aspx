<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="WebForm3.aspx.vb" Inherits="WebForm3" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <table class="style1">
      <table class="style1">
        <tr>
            <td style="font-weight: bold; font-size: 20pt; color: #FFFFFF;  font-family: TAHoma;">
                CONSULTA BDUA - ADRES</td>
        </tr>
    </table>




<iframe id="iframe1" runat="server" height="500px" 
        src="file://servidordatos2/compilacion/" 
        width="100px" clientidmode="AutoID" />

        
<iframe id="iframe2" runat="server" height="500px" 
        src="file://servidordatos2/carpetaasistencial-subgerenciacientifica/" 
        width="100px" />

    </asp:Content>
