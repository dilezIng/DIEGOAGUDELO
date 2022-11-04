<%@ Page Title="Desbloquear Usuario de DGH" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="DesbloquearUsuario.aspx.vb" Inherits="PaginaBase" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript">

    function ShowModalPopup() {

        $find("Panel1_ModalPopupExtender").show();

    }

    function HideModalPopup() {

        $find("Panel1_ModalPopupExtender").hide();

    }

</script>
  
    
<style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
</style>

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
<%--                </ContentTemplate>
    </asp:UpdatePanel>--%>



    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                Desbloquear Usuario de DGH</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:TextBox ID="TextNomUsuario" runat="server" MaxLength="8" 
                    style="font-size: large; font-weight: 700" AutoCompleteType="Disabled"></asp:TextBox>
            </td>
            <td style="width: 25%" >
                <asp:Button ID="BtnConsultar" runat="server" 
                    Text="Consultar Estado del Usuario" />
            </td>
            <td style="width: 25%" >
                <asp:Button ID="BtnDesbloq" runat="server" Text="Desbloquear Usuario" 
                    Enabled="False" />
                <asp:SqlDataSource ID="DataConsultas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionUpdate %>" 
                    SelectCommand="SELECT * FROM [ACNDEPEN]"></asp:SqlDataSource>
            </td>
            <td style="width: 25%" >
                <asp:Label ID="LabelIdUsuario" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" >
                <asp:Label ID="LabelNomUsuario" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

