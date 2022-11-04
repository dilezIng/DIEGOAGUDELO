<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Eps_Porcentaje.aspx.vb" Inherits="Eps_Porcentaje" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
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
        color: #4952C1;
        text-align: center;
    }
           
    .auto-style2 {
        width: 32%;
    }
           
    .auto-style3 {
        font-size: large;
        color: #FF0000;
    }
    .auto-style4 {
        font-size: large;
    }
           
    .auto-style5 {
        width: 491px;
    }
           
</style>

    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
                </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                </ContentTemplate>
    </asp:UpdatePanel>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF;">
            <td colspan="4" class="auto-style1" >Resumen Ingresos <asp:Label ID="LabelFolio" runat="server" ></asp:Label></td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
                
                Fecha Inicial:&nbsp;<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
               
              
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" >
 Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>

            </td>
            <td  style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; style="width: 30%; text-align: right;" >
                
                Total Eps en el mes :
                <asp:Label ID="Labeltmes" runat="server" ></asp:Label>
            </td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" style="height: 26px" /></td>
            
        </tr>
        <tr >
            <td colspan="2" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                
            </td>
        </tr>
        <tr >
		
            <td colspan="4" style="font-size: 9pt" >
                
				<asp:Button ID="BtnExportar2" runat="server" Text="Exportar a Excel" style="height: 26px" />
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataEpsmes" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="ENTIDAD" HeaderText="ENTIDAD" SortExpression="ENTIDAD" />
                        <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" SortExpression="CANTIDAD" ReadOnly="True" />
                        <asp:BoundField DataField="PORCENTAJE" HeaderText="PORCENTAJE" SortExpression="PORCENTAJE" ReadOnly="True" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataEpsmes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT GEENENTADM_1.ENTNOMBRE AS ENTIDAD, COUNT(*) AS CANTIDAD, CONVERT (DECIMAL(16 , 2), CONVERT (DECIMAL(16 , 4), COUNT(*) * 100) / CONVERT (DECIMAL(16 , 4), (SELECT COUNT(*) AS RESGISTROS FROM ADNINGRESO INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID WHERE (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59')))) AS PORCENTAJE FROM ADNINGRESO AS ADNINGRESO_1 INNER JOIN GEENENTADM AS GEENENTADM_1 ON ADNINGRESO_1.EntidadAdministradora = GEENENTADM_1.OID WHERE (ADNINGRESO_1.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59') GROUP BY GEENENTADM_1.ENTNOMBRE ORDER BY CANTIDAD DESC"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" 
                            PropertyName="Text" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style5">
                            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Usuario_Ingreso" HeaderText="Usuario_Ingreso" SortExpression="Usuario_Ingreso" />
                                    <asp:BoundField DataField="CodUsuario" HeaderText="CodUsuario" SortExpression="CodUsuario" />
                                    <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                                    <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" ReadOnly="True" SortExpression="CANTIDAD" />
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                                    <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" ReadOnly="True" SortExpression="CANTIDAD" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
&nbsp;
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT 

CASE WHEN ADNINGRESO.AINESTADO =0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO =1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO =2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO =3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO =4 THEN 'Cerrado' END AS Estado
,COUNT(ADNINGRESO.AINESTADO) AS CANTIDAD				
			
				
FROM            ADNINGRESO 
INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID 
INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID
INNER JOIN GENUSUARIO ON ADNINGRESO.GEENUSUARIO = GENUSUARIO.OID 
WHERE         (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59')

GROUP BY ADNINGRESO.AINESTADO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="DataTodos" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente, GENDETCON.GDECODIGO AS Contrato, GENDETCON.GDENOMBRE AS NombreContrato, CASE WHEN ADNINGRESO.AINESTADO = 0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO = 1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO = 2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO = 3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO = 4 THEN 'Cerrado' END AS Estado, CASE WHEN ADNINGRESO.AINURGCON &lt; 0 THEN 'Ninguno' WHEN ADNINGRESO.AINURGCON = 0 THEN 'Urgencias' WHEN ADNINGRESO.AINURGCON = 1 THEN 'Cons Externa' WHEN ADNINGRESO.AINURGCON = 2 THEN 'Nacido HRD' WHEN ADNINGRESO.AINURGCON = 3 THEN 'Remitido' WHEN ADNINGRESO.AINURGCON = 4 THEN 'Hosp Urg' WHEN ADNINGRESO.AINURGCON = 5 THEN 'Hospitalización' WHEN ADNINGRESO.AINURGCON &gt; 9 THEN 'Cirugia' END AS IngresoPor, CASE WHEN ADNINGRESO.AINTIPING = 1 THEN 'Ambulatorio' WHEN ADNINGRESO.AINTIPING = 2 THEN 'Hospitalario' END AS Tipo_Ingreso, ADNINGRESO.AINFECING AS Fech_Ingreso, GENUSUARIO.USUNOMBRE AS CodUsuario, GENUSUARIO.USUDESCRI AS Usuario_Ingreso, CASE WHEN ADNINGRESO.AINTIPRIE = 0 THEN 'Ninguna' WHEN ADNINGRESO.AINTIPRIE = 1 THEN 'Accidente de transito' WHEN ADNINGRESO.AINTIPRIE = 2 THEN 'Catastrofe' WHEN ADNINGRESO.AINTIPRIE = 3 THEN 'Enfermedad general y maternidad' WHEN ADNINGRESO.AINTIPRIE = 4 THEN 'Accidente de trabajo' WHEN ADNINGRESO.AINTIPRIE = 5 THEN 'Enfermedad profesional' WHEN ADNINGRESO.AINTIPRIE = 6 THEN 'Atencion inicial de urgencias' WHEN ADNINGRESO.AINTIPRIE = 7 THEN 'Otro tipo de accidente' WHEN ADNINGRESO.AINTIPRIE = 8 THEN 'Lesion por agresion' WHEN ADNINGRESO.AINTIPRIE = 9 THEN 'lesion autoinfligida' WHEN ADNINGRESO.AINTIPRIE = 10 THEN 'Maltrato fisico' WHEN ADNINGRESO.AINTIPRIE = 11 THEN 'Promocion y prevencion' WHEN ADNINGRESO.AINTIPRIE = 12 THEN 'Otro' WHEN ADNINGRESO.AINTIPRIE = 13 THEN 'Accidente rabico' WHEN ADNINGRESO.AINTIPRIE = 14 THEN 'Accidente Ofidico' WHEN ADNINGRESO.AINTIPRIE = 15 THEN 'Sospecha de abuso sexual' WHEN ADNINGRESO.AINTIPRIE = 15 THEN 'Sospecha de violencia sexual' WHEN ADNINGRESO.AINTIPRIE = 15 THEN 'Sospecha de maltrato Emocional' END AS TipoRiesgo FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENUSUARIO ON ADNINGRESO.GEENUSUARIO = GENUSUARIO.OID WHERE (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59') ORDER BY IngresoPor, NombreContrato, CodUsuario">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <strong><span class="auto-style4">Total Pacientes</span>
                <asp:Label ID="Lbtodos" runat="server" CssClass="auto-style3" ></asp:Label>
                </strong>
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" DataSourceID="DataTodos" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                      
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" ReadOnly="True" />
                        <asp:BoundField DataField="Contrato" HeaderText="Contrato" SortExpression="Contrato" />  
                        <asp:BoundField DataField="NombreContrato" HeaderText="NombreContrato" SortExpression="NombreContrato" />
                          <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                        <asp:BoundField DataField="IngresoPor" HeaderText="IngresoPor" SortExpression="IngresoPor" ReadOnly="True" />
                        <asp:BoundField DataField="Tipo_Ingreso" HeaderText="Tipo_Ingreso" SortExpression="Tipo_Ingreso" ReadOnly="True" />
                        <asp:BoundField DataField="Fech_Ingreso" HeaderText="Fech_Ingreso" SortExpression="Fech_Ingreso" />
                        <asp:BoundField DataField="CodUsuario" HeaderText="CodUsuario" SortExpression="CodUsuario" />
                      
                        <asp:BoundField DataField="Usuario_Ingreso" HeaderText="Usuario_Ingreso" SortExpression="Usuario_Ingreso" />
                        <asp:BoundField DataField="TipoRiesgo" HeaderText="TipoRiesgo" ReadOnly="True" SortExpression="TipoRiesgo" />
                      
                    </Columns>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT GENUSUARIO.USUDESCRI AS Usuario_Ingreso, GENUSUARIO.USUNOMBRE AS CodUsuario, CASE WHEN ADNINGRESO.AINESTADO = 0 THEN 'Registrado' WHEN ADNINGRESO.AINESTADO = 1 THEN 'Facturado' WHEN ADNINGRESO.AINESTADO = 2 THEN 'Anulado' WHEN ADNINGRESO.AINESTADO = 3 THEN 'Bloqueado' WHEN ADNINGRESO.AINESTADO = 4 THEN 'Cerrado' END AS Estado, COUNT(ADNINGRESO.AINESTADO) AS CANTIDAD FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENUSUARIO ON ADNINGRESO.GEENUSUARIO = GENUSUARIO.OID WHERE (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59') GROUP BY ADNINGRESO.AINESTADO, GENUSUARIO.USUDESCRI, GENUSUARIO.USUNOMBRE ORDER BY CodUsuario">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                </td>
        </tr>
                    <tr>
                        <td class="auto-style2">
                          
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            

</asp:Content>


