<%@ Page Title="Inventario Documental" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="PacientesArchivoHC.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


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
                </ContentTemplate>
    </asp:UpdatePanel>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Inventario Documental</td>

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
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" PageSize="300">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="NumDocPersona" HeaderText="NumDocPersona" 
                            SortExpression="NumDocPersona" />
                        <asp:BoundField DataField="PrimApelPersona" HeaderText="PrimApelPersona" 
                            SortExpression="PrimApelPersona" />
                        <asp:BoundField DataField="SegApelPersona" HeaderText="SegApelPersona" 
                            SortExpression="SegApelPersona" />
                        <asp:BoundField DataField="PrimNomPersona" HeaderText="PrimNomPersona" 
                            SortExpression="PrimNomPersona" />
                        <asp:BoundField DataField="SegNomPersona" HeaderText="SegNomPersona" 
                            SortExpression="SegNomPersona" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:DbBridgeConnectionString.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT NumDocPersona, PrimApelPersona, SegApelPersona, PrimNomPersona, SegNomPersona FROM Dat_Personas">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaIniTras" Name="FechaInicioTr" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFinTraslado" Name="FechaFinTr" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
                    
    </table>

            
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

