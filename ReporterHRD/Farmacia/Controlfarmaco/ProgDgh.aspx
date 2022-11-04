<%@ Page Title="Informe Diario de Cirugias
" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="ProgDgh.aspx.vb" Inherits="Cirugia_ProgDgh" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>


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

    <asp:ScriptManager ID="ScriptManager1" runat="server"  EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1000px;
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
        <tr >
            <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
                Informe Diario de Cirugias</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                Seleccione un dia:
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            
                Medicamento:<asp:DropDownList ID="ListMedicamentos" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="OID">
                </asp:DropDownList>
                &nbsp;</td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" /></td>
		   <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
            
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
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    DataKeyNames="IdFolio" Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Resumen" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaHoraCirugia" HeaderText="Fecha/Hora Folio" 
                            SortExpression="FechaHoraCirugia" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="D.I. Paciente" 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="Nombre Paciente" 
                            SortExpression="NomPaciente" />
                        <asp:BoundField DataField="Procedimiento" HeaderText="Procedimiento" 
                            SortExpression="Procedimiento" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                            SortExpression="Entidad" />
                       
                        
                        <asp:BoundField DataField="Medico55" HeaderText="Medico" SortExpression="Medico" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ANESTESIOLOGO" HeaderText="ANESTESIOLOGO" SortExpression="ANESTESIOLOGO" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT    ADNINGRESO.AINCONSEC AS Ingreso, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GENPACIEN.PACNUMDOC AS Identificacion, GENPACIEN.PACPRINOM + '  ' + GENPACIEN.PACSEGNOM + '  ' + GENPACIEN.PACPRIAPE + '  ' + GENPACIEN.PACSEGAPE AS Paciente, HCNFOLIO.HCNUMFOL AS Folio,  INNPRODUC.IPRDESCOR AS Nombre,  HCNMEDPAC.HCSOBSERV AS Observacion, HCNMEDPAC.HCSFECSOL AS Fecha, HCNMEDPAC.HCSCANTI AS Cantidad, GENMEDICO_1.GMENOMCOM AS Medico,  (SELECT GEEDESCRI FROM GENESPECI WHERE (OID = GENESPMED.ESPECIALIDADES)) AS Especialidad, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNGRUPOS.HGRCODIGO FROM HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNGRUPOS.OID = HPNDEFCAM.HPNGRUPOS WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Bloque, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Sitio,  CAST(ROUND(HCNMEDPAC.HCSCANRES, 0, 0) AS INT) AS Suministrado FROM            HCNMEDPAC INNER JOIN                          HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN  ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN INNPRODUC ON HCNMEDPAC.INNPRODUC = INNPRODUC.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENESPMED ON GENMEDICO_1.OID = GENESPMED.MEDICOS WHERE (OID = GENESPMED.ESPECIALIDADES)) <> 'EST' ORDER BY Ingreso DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="Dia" PropertyName="Text" />
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

