<%@ Page Title="TSH" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="TSH.aspx.vb" Inherits="TSH" %>

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
            <td colspan="3" class="auto-style4"><strong>LABORATORIO TSH</strong></td>
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
                <asp:Button ID="Button1" runat="server" Text="Buscar" />  
				   <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso,CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad,	GENPACIEN.GPAFECNAC AS Fecha_Nacimiento,  GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' AS Entidad , GENMUNICI.MUNNOMMUN AS CODIGOMUNI,LBNORDCAB.ORDCONSEC AS Orden, GENSERIPS.SIPCODIGO as Codigo, GENSERIPS.SIPNOMBRE As Examen, HCNSOLEXA.HCSFECSOL AS Fecha_Solicitud, HCNRESEXA.HCRDESCRIP AS Examen_DESCRIPCIÓN, HCNRESEXA.HCRFECINT AS Fecha_Interpretacion,case when LBNORDDET.EXAESTADO=0 then 'Proceso' when LBNORDDET.EXAESTADO=1 then 'Pendiente' when LBNORDDET.EXAESTADO=2 then 'Validado' when LBNORDDET.EXAESTADO=3 then 'Anulado' end Estado FROM LBNORDDET INNER JOIN LBNORDMUE ON LBNORDDET.OID = LBNORDMUE.LBNORDDET INNER JOIN LBNORDCAB ON LBNORDDET.LBNORDCAB=LBNORDCAB.OID INNER JOIN HCNRESEXA ON LBNORDDET.OID = HCNRESEXA.LBNORDDET INNER JOIN HCNSOLEXA ON HCNRESEXA.HCNSOLEXA = HCNSOLEXA.OID AND HCNRESEXA.OID = HCNSOLEXA.HCNRESEXA INNER JOIN ADNINGRESO ON LBNORDDET.ADNINGRESO = ADNINGRESO.OID AND HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID INNER JOIN LBNEXAMEN ON LBNORDDET.LBNEXAMEN=LBNEXAMEN.OID INNER JOIN GENSERIPS ON LBNEXAMEN.GENSERIPS=GENSERIPS.OID LEFT OUTER JOIN GENUSUARIO ON LBNORDDET.USUVALIDA=GENUSUARIO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN =GENPACIEN.oid INNER JOIN GENDETCON  ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENMUNICI ON GENPACIEN.DGNMUNICIPIO = GENMUNICI.OID WHERE  (HCNSOLEXA.HCSFECSOL BETWEEN CONVERT (DATETIME, @res, 102) AND CONVERT (DATETIME, @res2 + ' 23:59:00', 102))  and GENSERIPS.SIPNOMBRE like '%tsh%' ORDER BY HCNSOLEXA.HCSFECSOL desc">
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
					
<asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
<asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
<asp:BoundField DataField="TipoDocPac" HeaderText="D.I." ReadOnly="True" SortExpression="TipoDocPac" />
 <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
<asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
<asp:BoundField DataField="Fecha_Nacimiento" HeaderText="Fecha_Nacimiento" ReadOnly="True" SortExpression="Fecha_Nacimiento" /> 
<asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
<asp:BoundField DataField="CODIGOMUNI" HeaderText="Municipio" SortExpression="Municipio" />
<asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
<asp:BoundField DataField="Examen" HeaderText="Examen" SortExpression="Examen" />
<asp:BoundField DataField="Fecha_Solicitud" HeaderText="Fecha_Solicitud" SortExpression="Fecha_Solicitud" />
<asp:BoundField DataField="Examen_DESCRIPCIÓN" HeaderText="Examen_DESCRIPCIÓN" SortExpression="Examen_DESCRIPCIÓN" />
<asp:BoundField DataField="Fecha_Interpretacion" HeaderText="Fecha_Interpretacion" SortExpression="Fecha_Interpretacion" />
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                        
                    </Columns>
                </asp:GridView>
                <br />
            </td>
        </tr>
    </table>                           


</asp:Panel>




</asp:Content>
