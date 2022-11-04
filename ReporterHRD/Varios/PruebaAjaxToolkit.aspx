<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="PruebaAjaxToolkit.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
      


    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                E</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                 <ajaxToolkit:BubbleChart ID="BubbleChart1" runat="server">

            <BubbleChartValues>
    <%--<ajaxToolkit:BubbleChartValue Category="Software" 
    X="25" Y="90000" Data="7" BubbleColor="#6C1E83" />
    <ajaxToolkit:BubbleChartValue Category="Foods" 
    X="35" Y="150000" Data="5" BubbleColor="#D08AD9" />
    <ajaxToolkit:BubbleChartValue Category="Health" 
    X="32" Y="140000" Data="6" BubbleColor="#990033" />
    <ajaxToolkit:BubbleChartValue Category="Manufacuring" 
    X="22" Y="84000" Data="4" BubbleColor="#6586A7" />
    <ajaxToolkit:BubbleChartValue Category="Travel" 
    X="8" Y="26000" Data="7" BubbleColor="#0E426C" />
    <ajaxToolkit:BubbleChartValue Category="Entertainment" 
    X="28" Y="97000" Data="9" BubbleColor="#A156AB" />
    <ajaxToolkit:BubbleChartValue Category="Construction" 
    X="15" Y="58000" Data="5" BubbleColor="#A156AB" />--%>
</BubbleChartValues>
                </ajaxToolkit:BubbleChart></td>
            <td style="width: 25%" >
                &nbsp;
                <ajaxToolkit:AreaChart ID="AreaChart1" runat="server">
                </ajaxToolkit:AreaChart>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
    </table>

    <br />
   
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

