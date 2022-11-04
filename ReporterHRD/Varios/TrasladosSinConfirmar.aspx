<%@ Page Title="Relacionar Traslados" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="TrasladosSinConfirmar.aspx.vb" Inherits="PaginaBase" %>

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
                <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Relacionar Traslados Pendientes por Confirmar</td>
        <tr >
            <td style="width: 35%">
                Tercero: 
                <asp:TextBox ID="TextBoxTercero" runat="server" MaxLength="15" 
                    Width="110px" Enabled="False"></asp:TextBox>
                <asp:Button ID="BotonConsTercero" runat="server" Text="Consultar Tercero" 
                    Width="128px" Enabled="False" />
            </td>
            <td style="width: 25%; text-align: left;">
                Vigencia: <asp:DropDownList ID="ListVigencias" runat="server" 
                    DataSourceID="DataVigencias" DataTextField="VIGANO" DataValueField="OID" 
                    Enabled="False">
                </asp:DropDownList>
                
                            <asp:SqlDataSource ID="DataVigencias" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                                SelectCommand="SELECT OID, VIGANO, PSNENTIDAD FROM PSNVIGENCIA WHERE (PSNENTIDAD = 1) ORDER BY VIGANO DESC">
                            </asp:SqlDataSource>

            </td>
            
            <td style="width: 25%;" >
                
                Consecutivo:
                <asp:TextBox ID="TextBoxConsecutivo" runat="server" MaxLength="5" 
                    AutoCompleteType="Disabled"></asp:TextBox>     
            </td>
            <td style="width: 15%">
                <asp:Button ID="BotonConsConsec" runat="server" Text="Consultar Consecutivo" />
            </td>
            
        </tr>
                    <tr>
                        <td style="width: 35%; vertical-align: top;">
                            <asp:Label ID="LblMsgTercero" runat="server"></asp:Label>
                        </td>
                        <td style="width: 25%; vertical-align: top;">
                            
                            <asp:Label ID="LblIdDocumento" runat="server" style="font-size: 7pt"></asp:Label>
                            &nbsp;<asp:Label ID="LblIdTercero" runat="server" style="font-size: 7pt"></asp:Label>
                            &nbsp;<asp:Label ID="LblIdTraslado" runat="server" style="font-size: 7pt"></asp:Label>
                            
                        </td>
                        <td style="width: 25%; vertical-align: top;">
                            <asp:Label ID="LblMsgConsecutivo" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="LblMsgRelacion" runat="server" 
                                style="font-weight: 700; color: #006600" Visible="False"><hr />Se hizo la Relación con éxito<hr /></asp:Label>
                        </td>
                        <td style="width: 15%; vertical-align: top; text-align: center;">
                            <asp:Button ID="BotonRelacionar" runat="server" Enabled="False" 
                                style="color: #FF0000; font-weight: 700" Text="Relacionar" />
                        </td>
            </tr>
            <tr>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 25%">
                    &nbsp;</td>
            </tr>
    </table>

            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

