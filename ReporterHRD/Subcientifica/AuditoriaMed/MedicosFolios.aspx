<%@ Page Title="Auditoria de Historias Clinicas" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="MedicosFolios.aspx.vb" Inherits="PaginaBase" %>

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
           
</style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"   EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
                AUDITORIA DE HISTORIAS CLINICAS (Por Fechas)</td>
        </tr>
      
 
           
 <td style="width: 15%">
 Fecha Inicial:
 <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
 <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
 Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
 UserDateFormat="DayMonthYear">
 </asp:MaskedEditExtender>
 <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
 TargetControlID="TextFechaIni">
 </asp:CalendarExtender>
 </td>
 <td style="width: 15%" >
 Fecha Final:
 <asp:TextBox ID="TextFechaFin" runat="server" Rows="10" Width="80px"></asp:TextBox>
 <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
 Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
&nbsp;</td> 

<td style="width: 10%"><asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /> </td> 
			
	<td "width: 10%"><asp:Button ID="BtnExportar" runat="server" Text="Exportar" /> </td>
		<td "width: 50%"> </td>
        </tr>
		
        <tr>
 
 <td style="font-size: 10pt; vertical-align: top; width: 100%;" colspan="4" >
 <asp:Label ID="LabelProfesional" runat="server" ForeColor="#0066FF" 
 style="font-weight: 700; font-size: 14pt"></asp:Label>
 <br />
 <asp:GridView ID="GridFoliosMedico" runat="server" AutoGenerateColumns="False" 
 DataSourceID="DataGridFoliosMedico" AllowSorting="True" 
 EmptyDataText="No existen registros para el filtro seleccionado.">
 <AlternatingRowStyle BackColor="#F0F0F0" />
 <Columns>
 <asp:BoundField DataField="CodTipoFolio" HeaderText="Tipo Folio" SortExpression="CodTipoFolio">  </asp:BoundField>
 <asp:BoundField DataField="IdUsuario" HeaderText="User Dgh" SortExpression="IdUsuario" > <ItemStyle HorizontalAlign="Right" /> </asp:BoundField>
 <asp:BoundField DataField="Nombre" HeaderText="Nombre Medico" SortExpression="Nombre" >  </asp:BoundField>
 <asp:BoundField DataField="HCNUMFOL" HeaderText="No. Folio" SortExpression="HCNUMFOL" > <ItemStyle HorizontalAlign="Right" /> </asp:BoundField>
 <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha Creación"   SortExpression="FechaCreacion" />
 <asp:BoundField DataField="FechaGrabacion" HeaderText="Fecha Grabación"  SortExpression="FechaGrabacion" />
 <asp:BoundField DataField="FechaConfirmacion" HeaderText="Fecha Confirmación"  SortExpression="FechaConfirmacion" />
 <asp:BoundField DataField="Minutos" HeaderText="Min" SortExpression="Minutos">
 <ItemStyle Font-Bold="True" HorizontalAlign="Right" />    </asp:BoundField>
 <asp:BoundField DataField="HCACODIGO" HeaderText="Lugar" SortExpression="HCACODIGO" />
 <asp:BoundField DataField="DocPaciente" HeaderText="D.I. Paciente"   SortExpression="DocPaciente" />
<asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
</Columns>
</asp:GridView>
<asp:SqlDataSource ID="DataGridFoliosMedico" runat="server" 
ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
SelectCommand="SELECT HCNFOLIO.OID, HCNTIPHIS.HCCODIGO AS CodTipoFolio, GENUSUARIO_1.USUDESCRI  as Nombre, GENUSUARIO_1.USUNOMBRE AS IdUsuario, HCNFOLIO.HCFECFOLI AS FechaCreacion, HCNFOLIO.HCFECFOL AS FechaGrabacion, HCNFOLIO.HCNFECCONF AS FechaConfirmacion, CASE WHEN HCACODIGO IS NULL THEN CASE WHEN AINURGCON = 1 THEN 'Consulta Externa' ELSE 'Urgencias' END ELSE HCACODIGO END AS HCACODIGO, GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM + N' ' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE AS Paciente, HCNFOLIO.HCNUMFOL, HPNGRUPOS.HGRCODIGO AS NomServicio, HCNTIPHIS.HCNOMBRE AS NomTipoFolio, DATEDIFF(minute, HCNFOLIO.HCFECFOLI, HCNFOLIO.HCNFECCONF) AS Minutos FROM HCNTIPHIS INNER JOIN HCNFOLIO ON HCNTIPHIS.OID = HCNFOLIO.HCNTIPHIS INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON GENMEDICO_1.GENUSUARIO = GENUSUARIO_1.OID INNER JOIN GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID LEFT OUTER JOIN HPNDEFCAM INNER JOIN HPNESTANC ON HPNDEFCAM.OID = HPNESTANC.HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID INNER JOIN HPNTIPOCA ON HPNDEFCAM.HPNTIPOCA = HPNTIPOCA.OID ON ADNINGRESO.OID = HPNESTANC.ADNINGRES AND HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicial AND @FechaFinal)  ORDER BY FechaCreacion" 

ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
<SelectParameters>
<asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" PropertyName="Text" />
<asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" PropertyName="Text" />
</SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="DataGridFoliosMedico0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                    SelectCommand="SELECT HCNFOLIO.OID, HCNTIPHIS.HCCODIGO AS CodTipoFolio, GENUSUARIO_1.USUNOMBRE as Nombre, GENUSUARIO_1.USUDESCRI AS IdUsuario, HCNFOLIO.HCFECFOLI AS FechaCreacion, HCNFOLIO.HCFECFOL AS FechaGrabacion, HCNFOLIO.HCNFECCONF AS FechaConfirmacion, CASE WHEN HCACODIGO IS NULL THEN CASE WHEN AINURGCON = 1 THEN 'Consulta Externa' ELSE 'Urgencias' END ELSE HCACODIGO END AS HCACODIGO, GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM + N' ' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE AS Paciente, HCNFOLIO.HCNUMFOL, HPNGRUPOS.HGRCODIGO AS NomServicio, HCNTIPHIS.HCNOMBRE AS NomTipoFolio, DATEDIFF(minute, HCNFOLIO.HCFECFOLI, HCNFOLIO.HCNFECCONF) AS Minutos FROM HCNTIPHIS INNER JOIN HCNFOLIO ON HCNTIPHIS.OID = HCNFOLIO.HCNTIPHIS INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON GENMEDICO_1.GENUSUARIO = GENUSUARIO_1.OID INNER JOIN GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID LEFT OUTER JOIN HPNDEFCAM INNER JOIN HPNESTANC ON HPNDEFCAM.OID = HPNESTANC.HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID INNER JOIN HPNTIPOCA ON HPNDEFCAM.HPNTIPOCA = HPNTIPOCA.OID ON ADNINGRESO.OID = HPNESTANC.ADNINGRES AND HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID WHERE (HCNFOLIO.HCFECFOL BETWEEN @FechaInicial AND @FechaFinal) AND (GENUSUARIO_1.OID = @IdUsuario) ORDER BY FechaCreacion" 
                    
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:DGEMPRES02ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                       
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
   
       
       
       
    </table>
</asp:Content>

