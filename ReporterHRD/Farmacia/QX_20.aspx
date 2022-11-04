<%@ Page Title="Suministro a Paciente por Almacén" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="QX_20.aspx.vb" Inherits="PaginaBase" %>

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
                </ContentTemplate>
    </asp:UpdatePanel>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >Procedimientos Qx Grupo 20+</td>

        </tr>

        <tr >
            
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
        &nbsp;
        </td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridView" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                         <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Grupo" HeaderText="Grupo" 
                            SortExpression="Grupo" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                            SortExpression="Codigo" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Servicio" HeaderText="Servicio" 
                            SortExpression="Servicio" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha Servicio" HeaderText="Fecha Servicio" 
                            SortExpression="Fecha Servicio" >
                        </asp:BoundField>

                         <asp:BoundField DataField="DocPaciente" HeaderText="DocPaciente" 
                            SortExpression="DocPaciente" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Reg" HeaderText="Reg" 
                            SortExpression="Reg" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                         <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                         <asp:BoundField DataField="TipoIngreso" HeaderText="TipoIngreso" ReadOnly="True" SortExpression="TipoIngreso" />
                         <asp:BoundField DataField="IngresoPor" HeaderText="IngresoPor" ReadOnly="True" SortExpression="IngresoPor" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT OID, N'' + IPRCODIGO + ' ' + IPRDESCOR AS Nombre FROM INNPRODUC WHERE (IPRDESCOR LIKE '%CASPOFUNGINA%') OR (IPRDESCOR LIKE '%CEFTRIAZONA POLVO PARA RECONSTITUIR 1g %') OR (IPRDESCOR LIKE '%CEFEPIME POLVO PARA RECONSTITUIR 1 G%') OR (IPRDESCOR LIKE '%CIPROFLOXACINA  100 mg/10ml CLORHIDRATO  SOLUCION INYECTABLE DE BASE%') OR (IPRDESCOR LIKE '%CIPROFLOXACINA CLORHIDRATO TABLETA  500mg DE BASE%') OR (IPRDESCOR LIKE '%ERTAPEN%') OR (IPRDESCOR LIKE '%LINEZOLID%') OR (IPRDESCOR LIKE '%MEROPENEM  1G POLVO PARA RECONSTITUIR%') OR (IPRDESCOR LIKE '%MEROPENEM 500 mg POLVO ESTÉRIL PARA INYECCIÓN%') OR (IPRDESCOR LIKE '%TIGECICLINA%') OR (IPRDESCOR LIKE '%PIPERACILINA TAZOBACTAM%') OR (IPRDESCOR LIKE '%VANCOMICINA CLORHIDRATO POLVO PARA  RECONSTITUIR 500mg DE BASE%') OR (IPRDESCOR LIKE '%GENTAMICINA (SULFATO)  SOLUCION INYECTABLE 80mg/2ml %') OR (IPRDESCOR LIKE '%AMPICILINA+SULBACTAM 250mg/5ml SUSPENSION ORAL%') OR (IPRDESCOR LIKE '%AMPICILINA SODICA +SULBACTAM SODICO POLVO PARA RECONSTITUIR 1g + 0.5g%') ORDER BY IPRDESCOR"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, GENGRUQUI.SGQCODIGO AS Grupo, CASE WHEN GENSERIPS.SIPCODIGO IS NOT NULL THEN GENSERIPS.SIPCODIGO ELSE ' ' END AS Codigo, CASE WHEN GENSERIPS.SIPNOMBRE IS NOT NULL THEN GENSERIPS.SIPNOMBRE ELSE ' ' END AS Servicio, SLNSERPRO.SERFECSER AS 'Fecha Servicio', GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, SUBSTRING(GENDETCON.GDECODIGO, 1, 3) AS Reg, GENDETCON.GDECODIGO AS Regimen, GENDETCON.GDENOMBRE AS Entidad, CASE WHEN AINTIPING = 1 THEN 'Ambulatorio' ELSE 'Hospitalario' END AS TipoIngreso, CASE WHEN AINURGCON = 0 THEN 'Urgencias' ELSE 'Consulta Externa' END AS IngresoPor FROM SLNSERPRO INNER JOIN ADNINGRESO ON SLNSERPRO.ADNINGRES1 = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID LEFT OUTER JOIN SLNSERHOJ RIGHT OUTER JOIN GENSERIPS ON SLNSERHOJ.GENSERIPS1 = GENSERIPS.OID ON SLNSERPRO.OID = SLNSERHOJ.OID INNER JOIN GENMANSER ON GENSERIPS.OID = GENMANSER.GENSERIPS1 INNER JOIN GENGRUQUI ON GENMANSER.GENGRUQUI1 = GENGRUQUI.OID WHERE (GENGRUQUI.SGQCODIGO &gt;= 20) AND (ADNINGRESO.AINESTADO IN (0, 3)) ORDER BY Ingreso"
                    
                    
                    
                    >
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

