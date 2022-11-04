<%@ Page Title="Suministro a Paciente por Almacén" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Medica_control.aspx.vb" Inherits="PaginaBase" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>


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
                >Solicitud Medicamentos Paciente + EPS</td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
                &nbsp;
               
			   
			    <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
              
				
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
            <td style="width: 30%; text-align: right;" >
                
             
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
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="false" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                         <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" > </asp:BoundField>
							 <asp:BoundField DataField="Edad" HeaderText="Edad"  SortExpression="Edad" ></asp:BoundField>
                        <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" 
                            SortExpression="Identificacion" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" ReadOnly="True" >
                        </asp:BoundField>
						<asp:BoundField DataField="Folio" HeaderText="Folio"  SortExpression="Folio" ></asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre"  SortExpression="Nombre" >  </asp:BoundField>
						<asp:BoundField DataField="Observacion" HeaderText="Observacion"  SortExpression="Observacion" >  </asp:BoundField>
                      

                         <asp:BoundField DataField="Fecha" HeaderText="Fecha" 
                            SortExpression="Fecha" >
                        </asp:BoundField>
                         
                         <asp:BoundField DataField="Cantidad" HeaderText="Cantidad"  SortExpression="Cantidad" > </asp:BoundField>
               
                         <asp:BoundField DataField="Medico" HeaderText="Medico" SortExpression="Medico" />
                         <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />
                         <asp:BoundField DataField="Bloque" HeaderText="Bloque" ReadOnly="True" SortExpression="Bloque" />
                         <asp:BoundField DataField="Sitio" HeaderText="Sitio" ReadOnly="True" SortExpression="Sitio" />
                         <asp:BoundField DataField="Suministrado" HeaderText="Suministrado" SortExpression="Suministrado" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
               
			   <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT    ADNINGRESO.AINCONSEC AS Ingreso, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GENPACIEN.PACNUMDOC AS Identificacion, GENPACIEN.PACPRINOM + '  ' + GENPACIEN.PACSEGNOM + '  ' + GENPACIEN.PACPRIAPE + '  ' + GENPACIEN.PACSEGAPE AS Paciente, HCNFOLIO.HCNUMFOL AS Folio,  INNPRODUC.IPRDESCOR AS Nombre,  HCNMEDPAC.HCSOBSERV AS Observacion, HCNMEDPAC.HCSFECSOL AS Fecha, HCNMEDPAC.HCSCANTI AS Cantidad, GENMEDICO_1.GMENOMCOM AS Medico,  (SELECT GEEDESCRI FROM GENESPECI WHERE (OID = GENESPMED.ESPECIALIDADES)) AS Especialidad, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNGRUPOS.HGRCODIGO FROM HPNDEFCAM INNER JOIN HPNGRUPOS ON HPNGRUPOS.OID = HPNDEFCAM.HPNGRUPOS WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Bloque, CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urg' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM) END AS Sitio,  CAST(ROUND(HCNMEDPAC.HCSCANRES, 0, 0) AS INT) AS Suministrado FROM            HCNMEDPAC INNER JOIN                          HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN  ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN INNPRODUC ON HCNMEDPAC.INNPRODUC = INNPRODUC.OID INNER JOIN GENPACIEN ON HCNFOLIO.GENPACIEN = GENPACIEN.OID INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO.GENMEDICOA = GENMEDICO_1.OID INNER JOIN GENESPMED ON GENMEDICO_1.OID = GENESPMED.MEDICOS where  (HCNMEDPAC.HCSFECSOL BETWEEN @p0 AND @p1) and (SELECT GEEDESCRI FROM GENESPECI WHERE (OID = GENESPMED.ESPECIALIDADES)) <> 'EST' ORDER BY Ingreso DESC"                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="p1" 
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

