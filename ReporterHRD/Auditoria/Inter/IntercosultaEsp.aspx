<%@ Page Title="Interconsulta" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="IntercosultaEsp.aspx.vb" Inherits="HistoriasClinicas_Auditoria_IntercosultaEsp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
        width: 7px;
    }
           
    .auto-style2 {
        height: 21px;
    }
    .auto-style3 {
        width: 7px;
        height: 21px;
    }
           
</style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>

    <table style="width:100%;">
            <tr>
                <td colspan="3" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg'); text-align: center;">
                    Respuesta Interconsulta</td>
            </tr>
        </table>
       <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel" ToolTip="Respuesta Interconsulta" ID="TabPanel">
                            <HeaderTemplate>Todas</HeaderTemplate>
                            <ContentTemplate>
                                <asp:Panel ID="PanelALL" runat="server">

    <table cellspacing="0" class="auto-style3" width="60%">
            <tr>
                <td> </td>
                <td> </td>
                <td> </td>
          
            </tr>
            <tr>
                <td class="auto-style4">Fecha Inicial</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextFechaIni2" runat="server" Rows="10" Width="80px"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" BehaviorID="_content_MaskedEditExtender1" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni2" UserDateFormat="DayMonthYear" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="_content_CalendarExtender1" TargetControlID="TextFechaIni2" />
                </td>
                <td>Fecha Final&nbsp;
                    <asp:TextBox ID="TextFechaFin2" runat="server" Rows="10" Width="80px"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server" BehaviorID="_content_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin2" UserDateFormat="DayMonthYear" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="_content_CalendarExtender2" TargetControlID="TextFechaFin2" />
                </td>
                <td>
                    <asp:Button ID="BtnTODO" runat="server" Text="Todo" />
                </td>
            </tr>
           
           
           
          
            <tr>
                <td class="auto-style4" colspan="4">
                    <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
                </td>
            </tr>
           
           
           
          
        </table>

                                    &nbsp;<asp:Label ID="LabelProfesional1" runat="server" ForeColor="#0066FF" style="font-weight: 700; font-size: 14pt"></asp:Label>
&nbsp;<asp:Label ID="LabelProfesional2" runat="server" ForeColor="#0066FF" style="font-weight: 700; font-size: 14pt"></asp:Label>
                                    &nbsp;<asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DataGridTodos">
                                        <Columns>
                                            <asp:BoundField DataField="Cama" HeaderText="Cama" ReadOnly="True" SortExpression="Cama" />
                                            <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                                            <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                                            <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                                            <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                                            <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                                            <asp:BoundField DataField="Fol_Sol" HeaderText="Fol_Sol" SortExpression="Fol_Sol" />
                                            <asp:BoundField DataField="Medico Solicita" HeaderText="Medico Solicita" SortExpression="Medico Solicita" />
                                            <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                                            <asp:BoundField DataField="Fol_Rta" HeaderText="Fol_Rta" SortExpression="Fol_Rta" />
                                            <asp:BoundField DataField="Especialista Responde" HeaderText="Especialista Responde" SortExpression="Especialista Responde" />
                                            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                                            <asp:BoundField DataField="Fecha Respuesta" HeaderText="Fecha Respuesta" SortExpression="Fecha Respuesta" />
                                            <asp:BoundField DataField="Días" HeaderText="Días" ReadOnly="True" SortExpression="Días" />
                                            <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
                                            <asp:BoundField DataField="Minutos" HeaderText="Minutos" ReadOnly="True" SortExpression="Minutos" />
                                            <asp:BoundField DataField="Minutos_Total" HeaderText="Minutos_Total" ReadOnly="True" SortExpression="Minutos_Total" />
                                            <asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" SortExpression="Diagnostico" />
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <asp:SqlDataSource ID="DataGridTodos" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>"
									SelectCommand="SELECT DISTINCT (SELECT TOP (1) B.HCACODIGO FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID WHERE (A.ADNINGRES = ADNINGRESO.OID) ORDER BY B.OID) AS Cama, GENPACIEN_1.PACNUMDOC AS Documento, GENPACIEN_1.PACPRINOM + N' ' + GENPACIEN_1.PACSEGNOM + N' ' + GENPACIEN_1.PACPRIAPE + N' ' + GENPACIEN_1.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN_1.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, HC.HCNUMFOL AS 'Fol_Sol', GU.USUDESCRI AS 'Medico Solicita',  CONVERT(varchar,HC.HCNFECCONF,121)  AS 'Fecha Solicitud', HCNFOLIO_1.HCNUMFOL AS 'Fol_Rta', GENUSUARIO.USUDESCRI AS 'Especialista Responde', GENESPECI.GEEDESCRI AS Especialidad,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121)  AS 'Fecha Respuesta', ABS(DATEDIFF(mi,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) / 1440 AS Días, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) / 60 % 24 AS Horas, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) % 60 AS Minutos, ABS(DATEDIFF(MI, CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) AS Minutos_Total, GENDIAGNO.DIANOMBRE AS Diagnostico FROM HCNINTERR INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCNINTERR.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN ADNINGRESO ON HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID LEFT OUTER JOIN HPNESTANC AS A ON ADNINGRESO.OID = A.ADNINGRES LEFT OUTER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN GENMEDICO ON HCNFOLIO_1.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HCNFOLIO_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERR.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO = GENDIAGNO.OID INNER JOIN HCNINTERC AS HCNINTERC_1 ON HCNINTERR.OID = HCNINTERC_1.HCNINTERR INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID INNER JOIN GENMEDICO AS GM ON HC.GENMEDICO = GM.OID INNER JOIN GENUSUARIO AS GU ON GM.GENUSUARIO = GU.OID WHERE (HCNFOLIO_1.HCFECFOL BETWEEN @TextFechaIni2 AND @TextFechaFin2 + ' 23:59:00') ORDER BY 'Fecha Respuesta'">
                                        <SelectParameters>
                                           
                                            <asp:ControlParameter ControlID="TextFechaIni2" Name="TextFechaIni2" />
                                            <asp:ControlParameter ControlID="TextFechaFin2" Name="TextFechaFin2" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />







                                </asp:Panel>


                            </ContentTemplate>
                            </ajaxToolkit:TabPanel>
   

          <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ToolTip="Respuesta Interconsulta" ID="TabPanel1">
                            <HeaderTemplate> Resumen </HeaderTemplate>
                            <ContentTemplate>
     
                                <asp:Panel ID="PanelRESU" runat="server">


                                     <table cellspacing="0" class="auto-style3" width="60%">
            <tr>
                <td> </td>
                <td> </td>
                <td> </td>
          
            </tr>
            <tr>
                <td class="auto-style4">Fecha Inicial</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" BehaviorID="_content_TextFechaIni_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" UserDateFormat="DayMonthYear" />
                    <ajaxToolkit:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" BehaviorID="_content_TextFechaIni_CalendarExtender" TargetControlID="TextFechaIni" />
                </td>
                <td>Fecha Final&nbsp;
                    <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" BehaviorID="_content_TextFechaFin_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear" />
                    <ajaxToolkit:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" BehaviorID="_content_TextFechaFin_CalendarExtender" TargetControlID="TextFechaFin" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Seleccionar Profecional</td>
                <td colspan="4">
                    <asp:DropDownList ID="MEDICO" runat="server" DataSourceID="SqlDataMedico" DataTextField="NomUsuario" DataValueField="OID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataMedico" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT GENMEDICO.OID, GENUSUARIO.USUDESCRI + N' (' + GENUSUARIO.USUNOMBRE + N')' AS NomUsuario, GENUSUARIO.USUNOMBRE FROM GENUSUARIO INNER JOIN GENMEDICO ON GENUSUARIO.OID = GENMEDICO.GENUSUARIO WHERE (GENUSUARIO.USUNOMBRE LIKE 'MDE%') AND (GENUSUARIO.USUESTADO = 1) ORDER BY GENUSUARIO.USUDESCRI"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="BtnConsulta" runat="server" Text="Medico" />
                </td>
                <td>
                    <asp:Button ID="BtnExportar2" runat="server" Text="Exportar" />
                </td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
           
           
           
          
            <tr>
                <td class="auto-style4">Especialidad: </td>
                <td colspan="4">
                    <asp:DropDownList ID="ListEspeci" runat="server" DataSourceID="Sqlespeci" DataTextField="GEEDESCRI" DataValueField="OID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Sqlespeci" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT GEEDESCRI, OID FROM GENESPECI order by GEEDESCRI"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="BtnEspeci" runat="server" Text="Especialidad" />
                </td>
                <td colspan="3">
                    <asp:Button ID="BtnExportar1" runat="server" Text="Exportar" />
                </td>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
           
           
           
          
            <tr>
                <td class="auto-style2" colspan="12">
                    <asp:Label ID="LabelProfesional" runat="server" ForeColor="#0066FF" style="font-weight: 700; font-size: 14pt"></asp:Label>
                    <asp:Label ID="LabelProfesional0" runat="server" ForeColor="#0066FF" style="font-weight: 700; font-size: 14pt"></asp:Label>
                    &nbsp;</td>
            </tr>
           
           
           
          
        </table>








                                     <br />
                                     <asp:GridView ID="GridFoliosMedico" runat="server" AllowSorting="True" AutoGenerateColumns="False" CaptionAlign="Top" DataSourceID="DataGridFoliosMedico" EmptyDataText="No existen registros para el filtro seleccionado." ShowHeaderWhenEmpty="True">
                                         <AlternatingRowStyle BackColor="#F0F0F0" />
                                         <Columns>
                                             <asp:BoundField DataField="Cama" HeaderText="Cama" ReadOnly="True" SortExpression="Cama" />
                                             <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                                             <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                                             <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                                             <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                                             <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                                             <asp:BoundField DataField="Fol_Sol" HeaderText="Fol_Sol" SortExpression="Fol_Sol" />
                                             <asp:BoundField DataField="Medico Solicita" HeaderText="Medico Solicita" SortExpression="Medico Solicita" />
                                             <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                                             <asp:BoundField DataField="Fol_Rta" HeaderText="Fol_Rta" SortExpression="Fol_Rta" />
                                             <asp:BoundField DataField="Especialista Responde" HeaderText="Especialista Responde" SortExpression="Especialista Responde" />
                                             <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                                             <asp:BoundField DataField="Fecha Respuesta" HeaderText="Fecha Respuesta" SortExpression="Fecha Respuesta" />
                                             <asp:BoundField DataField="Días" HeaderText="Días" ReadOnly="True" SortExpression="Días" />
                                             <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
                                             <asp:BoundField DataField="Minutos" HeaderText="Minutos" ReadOnly="True" SortExpression="Minutos" />
                                             <asp:BoundField DataField="Minutos_Total" HeaderText="Minutos_Total" ReadOnly="True" SortExpression="Minutos_Total" />
                                             <asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" SortExpression="Diagnostico" />
                                         </Columns>
                                     </asp:GridView>
                                     <br />
                                     <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DataGridFoliosMedico0">
                                         <Columns>
                                             <asp:BoundField DataField="Cama" HeaderText="Cama" ReadOnly="True" SortExpression="Cama" />
                                             <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                                             <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                                             <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                                             <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                                             <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                                             <asp:BoundField DataField="Fol_Sol" HeaderText="Fol_Sol" SortExpression="Fol_Sol" />
                                             <asp:BoundField DataField="Medico Solicita" HeaderText="Medico Solicita" SortExpression="Medico Solicita" />
                                             <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                                             <asp:BoundField DataField="Fol_Rta" HeaderText="Fol_Rta" SortExpression="Fol_Rta" />
                                             <asp:BoundField DataField="Especialista Responde" HeaderText="Especialista Responde" SortExpression="Especialista Responde" />
                                             <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                                             <asp:BoundField DataField="Fecha Respuesta" HeaderText="Fecha Respuesta" SortExpression="Fecha Respuesta" />
                                             <asp:BoundField DataField="Días" HeaderText="Días" ReadOnly="True" SortExpression="Días" />
                                             <asp:BoundField DataField="Horas" HeaderText="Horas" ReadOnly="True" SortExpression="Horas" />
                                             <asp:BoundField DataField="Minutos" HeaderText="Minutos" ReadOnly="True" SortExpression="Minutos" />
                                             <asp:BoundField DataField="Minutos_Total" HeaderText="Minutos_Total" ReadOnly="True" SortExpression="Minutos_Total" />
                                             <asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" SortExpression="Diagnostico" />
                                         </Columns>
                                     </asp:GridView>
                                     <asp:SqlDataSource ID="DataGridFoliosMedico" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT (SELECT TOP (1) B.HCACODIGO FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID WHERE (A.ADNINGRES = ADNINGRESO.OID) ORDER BY B.OID) AS Cama, GENPACIEN_1.PACNUMDOC AS Documento, GENPACIEN_1.PACPRINOM + N' ' + GENPACIEN_1.PACSEGNOM + N' ' + GENPACIEN_1.PACPRIAPE + N' ' + GENPACIEN_1.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN_1.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, HC.HCNUMFOL AS 'Fol_Sol', GU.USUDESCRI AS 'Medico Solicita',  CONVERT(varchar,HC.HCNFECCONF,121)  AS 'Fecha Solicitud', HCNFOLIO_1.HCNUMFOL AS 'Fol_Rta', GENUSUARIO.USUDESCRI AS 'Especialista Responde', GENESPECI.GEEDESCRI AS Especialidad,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121)  AS 'Fecha Respuesta', ABS(DATEDIFF(mi,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) / 1440 AS Días, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) / 60 % 24 AS Horas, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) % 60 AS Minutos, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) AS Minutos_Total, GENDIAGNO.DIANOMBRE AS Diagnostico FROM HCNINTERR INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCNINTERR.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN ADNINGRESO ON HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HPNESTANC AS A ON ADNINGRESO.OID = A.ADNINGRES INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN GENMEDICO ON HCNFOLIO_1.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HCNFOLIO_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERR.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO = GENDIAGNO.OID INNER JOIN HCNINTERC AS HCNINTERC_1 ON HCNINTERR.OID = HCNINTERC_1.HCNINTERR INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID INNER JOIN GENMEDICO AS GM ON HC.GENMEDICO = GM.OID INNER JOIN GENUSUARIO AS GU ON GM.GENUSUARIO = GU.OID WHERE (HCNFOLIO_1.GENMEDICO = @MEDICO) AND (HCNFOLIO_1.HCFECFOL BETWEEN @TextFechaIni AND @TextFechaFin + ' 23:59:00') ORDER BY 'Fecha Respuesta'">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="MEDICO" Name="MEDICO" />
                                             <asp:ControlParameter ControlID="TextFechaIni" Name="TextFechaIni" />
                                             <asp:ControlParameter ControlID="TextFechaFin" Name="TextFechaFin" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <asp:SqlDataSource ID="DataGridFoliosMedico0" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT (SELECT TOP (1) B.HCACODIGO FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID WHERE (A.ADNINGRES = ADNINGRESO.OID) ORDER BY B.OID) AS Cama, GENPACIEN_1.PACNUMDOC AS Documento, GENPACIEN_1.PACPRINOM + N' ' + GENPACIEN_1.PACSEGNOM + N' ' + GENPACIEN_1.PACPRIAPE + N' ' + GENPACIEN_1.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN_1.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, HC.HCNUMFOL AS 'Fol_Sol', GU.USUDESCRI AS 'Medico Solicita',  CONVERT(varchar,HC.HCNFECCONF,121)  AS 'Fecha Solicitud', HCNFOLIO_1.HCNUMFOL AS 'Fol_Rta', GENUSUARIO.USUDESCRI AS 'Especialista Responde', GENESPECI.GEEDESCRI AS Especialidad,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121)  AS 'Fecha Respuesta', ABS(DATEDIFF(mi,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) / 1440 AS Días, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) / 60 % 24 AS Horas, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) % 60 AS Minutos, ABS(DATEDIFF(MI,  CONVERT(varchar,HC.HCNFECCONF,121) ,  CONVERT(varchar,HCNFOLIO_1.HCNFECCONF,121) )) AS Minutos_Total, GENDIAGNO.DIANOMBRE AS Diagnostico FROM HCNINTERR INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCNINTERR.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN ADNINGRESO ON HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HPNESTANC AS A ON ADNINGRESO.OID = A.ADNINGRES INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN GENMEDICO ON HCNFOLIO_1.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HCNFOLIO_1.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERR.GENESPECI = GENESPECI.OID INNER JOIN GENDIAGNO ON HCNINTERR.GENDIAGNO = GENDIAGNO.OID INNER JOIN HCNINTERC AS HCNINTERC_1 ON HCNINTERR.OID = HCNINTERC_1.HCNINTERR INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID INNER JOIN GENMEDICO AS GM ON HC.GENMEDICO = GM.OID INNER JOIN GENUSUARIO AS GU ON GM.GENUSUARIO = GU.OID WHERE (HCNFOLIO_1.HCFECFOL BETWEEN @F1 AND @F2 + ' 23:59:00') AND (GENESPECI.OID = @Especi) ORDER BY 'Fecha Respuesta'">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="TextFechaIni" Name="F1" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="TextFechaFin" Name="F2" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="ListEspeci" Name="Especi" PropertyName="SelectedValue" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <br />








                                </asp:Panel>
                            </ContentTemplate>
                            </ajaxToolkit:TabPanel>

            <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel2" ToolTip="Respuesta Interconsulta" ID="TabPanel2">
                            <HeaderTemplate> Sin Contestar </HeaderTemplate>
                            <ContentTemplate>
                                <asp:Panel ID="PanelSINRTA" runat="server">

                                         <table cellspacing="0" class="auto-style3" width="60%">
            <tr>
                <td> </td>
                <td> </td>
                <td> </td>
          
            </tr>
            <tr>
                <td class="auto-style4">Fecha Inicial</td>
                <td class="auto-style2">
 <asp:TextBox ID="TextFechaIni3" runat="server" Rows="10" Width="80px"></asp:TextBox>
 <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" BehaviorID="_content_TextFechaIni3_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni3" UserDateFormat="DayMonthYear" />
<ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" BehaviorID="_content_TextFechaIni3_CalendarExtender" TargetControlID="TextFechaIni3" />
                </td>
                <td>Fecha Final&nbsp;
                    <asp:TextBox ID="TextFechaFin3" runat="server" Rows="10" Width="80px"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server" BehaviorID="_content_TextFechaFin3_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin3" UserDateFormat="DayMonthYear" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" BehaviorID="_content_TextFechaFin3_CalendarExtender" TargetControlID="TextFechaFin3" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
<asp:Button ID="btnNORTA" runat="server" Text="Buscar" />
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="BtnExportar0" runat="server" Text="Export_SinRespuesta" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
           
           
           
           
          
        </table>



                                      <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1null" runat="server" AutoGenerateColumns="False" DataSourceID="DataGridsinrta" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="Cama" HeaderText="Cama" ReadOnly="True" SortExpression="Cama" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                        <asp:BoundField DataField="Fol_Sol" HeaderText="Fol_Sol" SortExpression="Fol_Sol" />
                        <asp:BoundField DataField="Medico Solicita" HeaderText="Medico Solicita" SortExpression="Medico Solicita" />
                        <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" SortExpression="Fecha Solicitud" />
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />





    <br />
    <asp:SqlDataSource ID="DataGridsinrta" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT (SELECT TOP (1) B.HCACODIGO FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID WHERE (A.ADNINGRES = ADNINGRESO.OID) ORDER BY B.OID) AS Cama, GENPACIEN_1.PACNUMDOC AS Documento, GENPACIEN_1.PACPRINOM + N' ' + GENPACIEN_1.PACSEGNOM + N' ' + GENPACIEN_1.PACPRIAPE + N' ' + GENPACIEN_1.PACSEGAPE AS Paciente, ABS(DATEDIFF(yy, GENPACIEN_1.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, HC.HCNUMFOL AS 'Fol_Sol', GU.USUDESCRI AS 'Medico Solicita',  CONVERT(varchar,HC.HCNFECCONF,121)  AS 'Fecha Solicitud', GENESPECI.GEEDESCRI AS Especialidad, CASE WHEN HCIREGSUS = 0 THEN 'Pendiente' WHEN HCIREGSUS = 1 THEN 'Suspendida' END AS Estado FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID INNER JOIN GENMEDICO AS GM ON HC.GENMEDICO = GM.OID INNER JOIN GENUSUARIO AS GU ON GM.GENUSUARIO = GU.OID INNER JOIN ADNINGRESO ON HC.ADNINGRESO = ADNINGRESO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HPNESTANC AS A ON ADNINGRESO.OID = A.ADNINGRES INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN GENMEDICO ON HC.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID INNER JOIN GENPACIEN AS GENPACIEN_1 ON HC.GENPACIEN = GENPACIEN_1.OID INNER JOIN GENESPECI ON HCNINTERC_1.GENESPECI = GENESPECI.OID WHERE (HC.HCFECFOL BETWEEN @TextFechaIni3 AND @TextFechaFin3 + ' 23:59:59:000') AND (HCNINTERC_1.HCNINTERR IS NULL)  ORDER BY 'Fecha Solicitud'">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextFechaIni3" Name="TextFechaIni3" />
            <asp:ControlParameter ControlID="TextFechaFin3" Name="TextFechaFin3" />
        </SelectParameters>
    </asp:SqlDataSource>







                                </asp:Panel>
                            </ContentTemplate>
                            </ajaxToolkit:TabPanel>
           </asp:TabContainer>

                   


<asp:Panel id="Panel_Intercon" runat="server">
    <br />
    <br />
    <asp:Button ID="BtnFinalizar" runat="server" Text="Regresar" />
    <br />
    <br />
  

</asp:Panel>







</asp:Content>

