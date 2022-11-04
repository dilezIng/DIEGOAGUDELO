<%@ Page Title="Resumen Laboratorio Clínico" Language="vb" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="ExamenesLaboratorio.aspx.vb" Inherits="Facturacion_ResumenFacturacion" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  <script language="javascript"> 



  
function ShowModalPopup()

{

    $find("Panel1_ModalPopupExtender").show();

}

function HideModalPopup()

{

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
    <table style="width: 100%; font-size: 10pt; font-family: Tahoma;">
        <tr>
            
            <td colspan="5" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Laboratorio Clínico</td>
            <tr>
                <td style="width: 20%">
                    Fecha Inicial: <asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                        UserDateFormat="DayMonthYear" />
                    <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                        TargetControlID="TextFechaIni" />
                </td>
                <td style="width: 20%">
                    Fecha Final :<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                        UserDateFormat="DayMonthYear" />
                    <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                        TargetControlID="TextFechaFin" />
                    <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
                </td>
                <td style="width: 25%">
                    Formato de Hisotria Clínica:
                    <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False">
                        <asp:ListItem>HCCLAP</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 25%">
                </td>
                <td style="width: 10%; font-size: 12pt; font-weight: bold; text-align: right;">
                    <asp:Button ID="Button1" runat="server" Text="Actualizar" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 40%">
                    <asp:Label ID="LabelMsg" runat="server" style="font-weight: 700"></asp:Label>
                </td>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 25%">
                    &nbsp;</td>
                <td style="width: 10%; font-size: 12pt; font-weight: bold; text-align: right;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" DataSourceID="DataListLabs">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="NomProcedimiento" HeaderText="NomProcedimiento" 
                                ReadOnly="True" SortExpression="NomProcedimiento" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                                SortExpression="Cantidad" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataListLabs" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        
                        SelectCommand="SELECT RTRIM(GENSERIPS.SIPNOMBRE) AS NomProcedimiento, COUNT(GENSERIPS.OID) AS Cantidad FROM HCMHCCLAP INNER JOIN HCNFOLIO ON HCMHCCLAP.HCNFOLIO = HCNFOLIO.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN SLNSERHOJ ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID WHERE (ADNINGRESO.AINFECING BETWEEN @FechaInicio AND @FechaFin) AND (CONVERT (char(2), GENSERIPS.SIPCODIGO) = '19') GROUP BY RTRIM(GENSERIPS.SIPNOMBRE) ORDER BY NomProcedimiento">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicio" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextFechaFin" Name="FechaFin" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: right; font-size: 12pt; font-weight: bold">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="5">
                    <br />
                    <br />
                </td>
            </tr>
            
        </tr>
    </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

