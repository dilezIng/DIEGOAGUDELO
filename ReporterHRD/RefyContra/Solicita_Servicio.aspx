<%@ Page Title="Servicio Hc Heridas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Solicita_Servicio.aspx.vb" Inherits="PaginaBase" %>

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
           
    .auto-style1 {
        text-align: left;
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
                >Solicitud Paquete Clinica de Heridas Paciente + EPS</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                &nbsp;
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
                Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
            <td style="width: 30%; " class="auto-style1" >
                
                &lt;-- Fechas de Solicitudes</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                         <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Cant" HeaderText="Cant" 
                            SortExpression="Cant" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Cod" HeaderText="Cod" 
                            SortExpression="Cod" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre_Servicio" HeaderText="Nombre_Servicio" 
                            SortExpression="Nombre_Servicio" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha_Solicitud" HeaderText="Fecha_Solicitud" 
                            SortExpression="Fecha_Solicitud" >
                        </asp:BoundField>

                         <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" 
                            SortExpression="Identificacion" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                            SortExpression="Entidad" >
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, HCNSOLPNQX.HCSCANTI AS Cant, GENSERIPS.SIPCODIGO AS Cod, GENSERIPS.SIPNOMBRE AS Nombre_Servicio, HCNSOLPNQX.HCSFECSOL AS Fecha_Solicitud, GENPACIEN.PACNUMDOC AS Identificacion, GENPACIEN.PACPRINOM + '  ' + GENPACIEN.PACSEGNOM + '  ' + GENPACIEN.PACPRIAPE + '  ' + GENPACIEN.PACSEGAPE AS Paciente, GEENENTADM.ENTNOMBRE AS Entidad FROM HCNSOLPNQX INNER JOIN HCNFOLIO ON HCNSOLPNQX.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN ADNINGRESO ON ADNINGRESO.OID = HCNSOLPNQX.ADNINGRESO INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENSERIPS ON HCNSOLPNQX.GENSERIPS = GENSERIPS.OID WHERE (GENSERIPS.SIPCODIGO LIKE '%PAQCU%') AND (HCNSOLPNQX.HCSFECSOL BETWEEN @FechaInicial AND @FechaFinal) ORDER BY Identificacion, Fecha_Solicitud"
                    
                    
                    
                    ><SelectParameters>
                        
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
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

