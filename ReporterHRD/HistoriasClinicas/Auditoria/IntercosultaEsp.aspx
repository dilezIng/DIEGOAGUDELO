<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="IntercosultaEsp.aspx.vb" Inherits="HistoriasClinicas_Auditoria_IntercosultaEsp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel id="Panel1" runat="server">
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td colspan="7" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg'); text-align: center;">
                InterConsulta por Profesional</td>
          
            </tr>
            <tr>
                <td class="auto-style3">Seleccionar Profecional</td>
                <td>
                    <asp:DropDownList ID="MEDICO" runat="server" AutoPostBack="True" DataSourceID="SqlDataMedico" DataTextField="NomUsuario" DataValueField="OID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataMedico" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT  GENMEDICO.OID, GENUSUARIO.USUDESCRI + N' (' +GENUSUARIO.USUNOMBRE+ N')' AS NomUsuario  FROM GENUSUARIO INNER JOIN GENMEDICO ON GENUSUARIO.OID = GENMEDICO.GENUSUARIO 
                        where  GENUSUARIO.GENROL = 46 or GENUSUARIO.GENROL = 47 or GENUSUARIO.GENROL = 48 or  GENUSUARIO.GENROL = 60 or GENUSUARIO.GENROL = 61  or GENUSUARIO.GENROL = 62 or GENUSUARIO.GENROL = 63  order by GENUSUARIO.USUDESCRI"></asp:SqlDataSource>
                </td>
                <td>Fecha Inicial</td>
                <td>
                    <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" UserDateFormat="DayMonthYear" />
                    <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" TargetControlID="TextFechaIni" />
                </td>
                <td>Fecha Final</td>
                <td>
                 <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" />
                </td>
                <td>&nbsp;</td>
            </tr>
           
           
           
          
        </table>







    </asp:Panel>


<asp:Panel id="Panel_Intercon" runat="server">
    <asp:Label ID="LabelProfesional" runat="server" ForeColor="#0066FF" 
                    style="font-weight: 700; font-size: 14pt"></asp:Label>
    <asp:Button ID="BtnFinalizar" runat="server" 
                                Text="Regresar"/>
    <br />
    <asp:GridView ID="GridFoliosMedico" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DataGridFoliosMedico" AllowSorting="True" 
                    EmptyDataText="No existen registros para el filtro seleccionado.">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
           
            <asp:BoundField DataField="USUDESCRI" HeaderText="Medico" 
                            SortExpression="USUDESCRI" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="USUNOMBRE" HeaderText="User_Esp" 
                            SortExpression="USUNOMBRE" />
              <asp:BoundField DataField="Fecha" HeaderText="Fecha" 
                            SortExpression="Fecha" />
            <asp:BoundField DataField="PACNUMDOC" HeaderText="Documento" 
                            SortExpression="PACNUMDOC" />
            <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" />
            <asp:BoundField DataField="GEEDESCRI" HeaderText="Especialidad"
                SortExpression="GEEDESCRI">
            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DIANOMBRE" HeaderText="Diagnostico" 
                            SortExpression="DIANOMBRE" />
           
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="DataGridFoliosMedico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    SelectCommand="SELECT GENUSUARIO.USUDESCRI as USUDESCRI,GENUSUARIO.USUNOMBRE as USUNOMBRE , HCNFOLIO.HCFECFOL as Fecha,GENPACIEN.PACNUMDOC as PACNUMDOC, GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM + N' ' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE AS Paciente 
    ,GENESPECI.GEEDESCRI as GEEDESCRI, GENDIAGNO.DIANOMBRE as DIANOMBRE
  FROM HCNINTERR  
  
  INNER JOIN HCNFOLIO ON HCNINTERR.HCNFOLIO = HCNFOLIO.OID
  INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICOA = GENMEDICO.OID
  INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID 
  INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID
  INNER JOIN GENESPECI ON HCNINTERR.GENESPECI= GENESPECI.OID
  INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO=GENDIAGNO.OID
   WHERE HCNFOLIO.GENMEDICOA=@MEDICO  AND (HCNFOLIO.HCFECFOL BETWEEN @TextFechaIni AND @TextFechaFin)
 ORDER BY HCNFOLIO.HCFECFOL"
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
               <SelectParameters>
                        
                         <asp:ControlParameter ControlID="TextFechaIni" Name="TextFechaIni" />
                   <asp:ControlParameter ControlID="TextFechaFin" Name="TextFechaFin" />
                   <asp:ControlParameter ControlID="MEDICO" Name="MEDICO" />

                     </SelectParameters>
    </asp:SqlDataSource>





</asp:Panel>







</asp:Content>

