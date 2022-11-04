<%@ Page Title="Oxigeno_solicitado_diferente" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="O2_Ko.aspx.vb" Inherits="PaginaBase" %>

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
        font-weight: bold;
        font-size: 20pt;
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
            <td colspan="4" class="auto-style1" 
                >OXIGENO POR SOLICITUD DE PROCEDIMIENTOS NO QUIRÚRGICOS</td>

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
                        <asp:BoundField DataField="Folio" HeaderText="Folio" 
                            SortExpression="Folio" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Medico Solicita" HeaderText="Medico Solicita" 
                            SortExpression="Medico Solicita" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha Solicitud" HeaderText="Fecha Solicitud" 
                            SortExpression="Fecha Solicitud" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Documento" HeaderText="Documento" 
                            SortExpression="Documento" >
                        </asp:BoundField>

                         <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Edad" HeaderText="Edad" 
                            SortExpression="Edad" ReadOnly="True" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                            SortExpression="Codigo" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                         <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                         <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT OID, N'' + IPRCODIGO + ' ' + IPRDESCOR AS Nombre FROM INNPRODUC WHERE (IPRDESCOR LIKE '%CASPOFUNGINA%') OR (IPRDESCOR LIKE '%CEFTRIAZONA POLVO PARA RECONSTITUIR 1g %') OR (IPRDESCOR LIKE '%CEFEPIME POLVO PARA RECONSTITUIR 1 G%') OR (IPRDESCOR LIKE '%CIPROFLOXACINA  100 mg/10ml CLORHIDRATO  SOLUCION INYECTABLE DE BASE%') OR (IPRDESCOR LIKE '%CIPROFLOXACINA CLORHIDRATO TABLETA  500mg DE BASE%') OR (IPRDESCOR LIKE '%ERTAPEN%') OR (IPRDESCOR LIKE '%LINEZOLID%') OR (IPRDESCOR LIKE '%MEROPENEM  1G POLVO PARA RECONSTITUIR%') OR (IPRDESCOR LIKE '%MEROPENEM 500 mg POLVO ESTÉRIL PARA INYECCIÓN%') OR (IPRDESCOR LIKE '%TIGECICLINA%') OR (IPRDESCOR LIKE '%PIPERACILINA TAZOBACTAM%') OR (IPRDESCOR LIKE '%VANCOMICINA CLORHIDRATO POLVO PARA  RECONSTITUIR 500mg DE BASE%') OR (IPRDESCOR LIKE '%GENTAMICINA (SULFATO)  SOLUCION INYECTABLE 80mg/2ml %') OR (IPRDESCOR LIKE '%AMPICILINA+SULBACTAM 250mg/5ml SUSPENSION ORAL%') OR (IPRDESCOR LIKE '%AMPICILINA SODICA +SULBACTAM SODICO POLVO PARA RECONSTITUIR 1g + 0.5g%') ORDER BY IPRDESCOR"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DataGridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, HCNFOLIO.HCNUMFOL AS Folio, '(' + GENUSUARIO_1.USUNOMBRE + ') ' + GENMEDICO.GMENOMCOM AS 'Medico Solicita', HCNSOLPNQX.HCSFECSOL AS 'Fecha Solicitud', GENPACIEN.PACNUMDOC AS 'Documento', GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, CAST(DATEDIFF(dd, GENPACIEN.GPAFECNAC, GETDATE()) / 365.25 AS int) AS 'Edad', GENSERIPS.SIPCODIGO AS Codigo, GENSERIPS.SIPNOMBRE AS 'Nombre', GENDETCON.GDECODIGO AS Regimen, GENDETCON.GDENOMBRE AS Entidad FROM HCNSOLPNQX INNER JOIN HCNFOLIO ON HCNSOLPNQX.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENSERIPS ON HCNSOLPNQX.GENSERIPS = GENSERIPS.OID INNER JOIN ADNINGRESO ON HCNSOLPNQX.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICOA = GENMEDICO.OID INNER JOIN GENUSUARIO AS GENUSUARIO_1 ON GENMEDICO.GENUSUARIO = GENUSUARIO_1.OID WHERE (ADNINGRESO.AINESTADO IN (0, 3)) AND (GENSERIPS.SIPCODIGO LIKE 'S5%' OR GENSERIPS.SIPCODIGO LIKE 'VEN%') ORDER BY Ingreso"
                    
                    
                    
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

