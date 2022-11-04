<%@ Page Title="Perinatal" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Perinatal.aspx.vb" Inherits="Actividad" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  

    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
        .auto-style2 {
            width: 231px;
        }
        .auto-style3 {
            width: 100%;
        }
    .auto-style4 {
        text-align: center;
    }
    </style>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="Label1" runat="server"></asp:Label>
<asp:Panel ID="Panelmantenimiento" runat="server" Width="1334px">

    <table class="auto-style3">
        <tr>
            <td colspan="3" class="auto-style4"><strong>HC PERINATAL - BASE</strong></td>
        </tr>
        <tr>
            <td class="auto-style1">Inicio
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  <asp:MaskedEditExtender ID="TextBox1_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox1" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                    TargetControlID="TextBox1">
                </asp:CalendarExtender>



            </td>
            <td class="auto-style2">Fin
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>


                    <asp:MaskedEditExtender ID="extBox2_MaskedEditExtender1" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox2" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextBox2_CalendarExtender1" runat="server" 
                    TargetControlID="TextBox2">
                </asp:CalendarExtender>

            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Consultar" />    
				<asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT HCCM03N99 AS CAUSA,HCNFOLIO.OID,HCNFOLIO.HCFECFOL AS Fecha_Folio,HCNFOLIO.HCNUMFOL AS Folio,ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Paciente,GENPACIENT.PACTELEFONO as Telefono, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, (SELECT MUNNOMMUN FROM GENMUNICI WHERE (OID = GENPACIEN.DGNMUNICIPIO)) AS Municipio , GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS REGIMEN , HCCM06N202 AS 'FECHA Y HORA DE NACIMIENTO'  ,HCCM01N23 AS G       ,HCCM01N25 AS P       ,HCCM01N33 AS C      ,HCCM01N24 AS A      ,HCCM01N32 AS M      	  ,HCCM01N36 AS MU	  ,HCCM01N35 AS V,HCCM10N97 AS TERMINACION  ,HCCM10N203 AS 'GENERO', HCCM01N207 AS 'PESO'   ,GENMEDICO.GMENOMCOM AS Medico_Realiza FROM ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HCNTRIAGE ON ADNINGRESO.HCENTRIAGE = HCNTRIAGE.OID INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO  INNER JOIN HCNTIPHIS ON HCNFOLIO.HCNTIPHIS = HCNTIPHIS.OID  INNER JOIN GENPACIENT ON GENPACIEN.GENPACIENT=GENPACIENT.OID INNER JOIN HCMHCCLAP ON HCNFOLIO.OID=HCMHCCLAP.HCNFOLIO INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO.GENESPECI = GENESPECI_1.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HCNINDMED ON HCNFOLIO.HCNINDMED = HCNINDMED.OID AND HCNFOLIO.OID = HCNINDMED.HCNFOLIO INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICOA = GENMEDICO.OID WHERE  (HCNTIPHIS.OID = 18) AND (HCNFOLIO.HCFECFOL BETWEEN CONVERT (DATETIME, @res, 102) AND CONVERT (DATETIME, @res2 + ' 23:59:00', 102)) ORDER BY Ingreso DESC"> 
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="res" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" Name="res2" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" Width="1286px" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Fecha_Folio" HeaderText="Fecha_Folio" SortExpression="Fecha_Folio" />
					<asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
						<asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
						<asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                        <asp:BoundField DataField="REGIMEN" HeaderText="REGIMEN" SortExpression="REGIMEN" />
						<asp:BoundField DataField="Municipio" HeaderText="Municipio" ReadOnly="True" SortExpression="Municipio" />
						<asp:BoundField DataField="FECHA Y HORA DE NACIMIENTO" HeaderText="FECHA Y HORA DE NACIMIENTO" SortExpression="FECHA Y HORA DE NACIMIENTO" />
                        <asp:BoundField DataField="G" HeaderText="G" SortExpression="G" />
						<asp:BoundField DataField="P" HeaderText="P" SortExpression="P" />
                        <asp:BoundField DataField="C" HeaderText="C" SortExpression="C" />
						<asp:BoundField DataField="A" HeaderText="A" SortExpression="A" />
						
                        
						<asp:BoundField DataField="V" HeaderText="V" SortExpression="V" />
					
						<asp:BoundField DataField="TERMINACION" HeaderText="TERMINACION" SortExpression="TERMINACION" />
						<asp:BoundField DataField="CAUSA" HeaderText="CAUSA" SortExpression="CAUSA" />
						<asp:BoundField DataField="GENERO" HeaderText="GENERO" SortExpression="GENERO" />
						<asp:BoundField DataField="PESO" HeaderText="PESO" SortExpression="PESO" />
				
                        <asp:BoundField DataField="Medico_Realiza" HeaderText="Medico_Realiza" SortExpression="Medico_Realiza" />
                        
                    </Columns>
                </asp:GridView>
                <br />
            </td>
        </tr>
    </table>                           


</asp:Panel>




</asp:Content>
