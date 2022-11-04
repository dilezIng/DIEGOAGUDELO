<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="OServiceBloqueLAB.aspx.vb" Inherits="OServiceBloque" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

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
        text-align: center;
         background-color: #71BDF9;
    }
           
    .auto-style2 {
        width: 32%;
    }
           
    .auto-style4 {
        width: 5%;
    }
           
    .auto-style8 {
        text-align: left;
    }
           
    .auto-style9 {
        width: 32%;
        font-size: xx-small;
    }
           
    .auto-style11 {
        text-align: center;

    }
           
    .auto-style12 {
        color: #FF0000;
    }
               
    .auto-style13 {
        font-size: x-large;
        color: #FFFFFF;
        background-color: #71BDF9;
    }
               
    .auto-style14 {
        color: #FFFFFF;
    }
               
    .auto-style16 {
        text-align: center;
        width: 107px;
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

    <asp:Panel ID="Panel1" runat="server">
	
	
	<table class="auto-style3">
        <tr>
          <td colspan="4" class="auto-style1" >CONTROL LABORATORIO</td>
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
            <td class="auto-style1">Fin
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>


                    <asp:MaskedEditExtender ID="extBox2_MaskedEditExtender1" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox2" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextBox2_CalendarExtender1" runat="server" 
                    TargetControlID="TextBox2">
                </asp:CalendarExtender>

            </td> </tr>
			</table>
			
			
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
<td></td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
                
                COMPLETO:<asp:Image ID="Image9" runat="server" Height="15px" ImageUrl="~/Images/Verde.jpg" />
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style8" rowspan="2" colspan="3" >

                 </td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" style="height: 26px" />
		<asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
		</td>
            
        </tr>
        <tr >
            <td 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
              
                PENDIENTES:<asp:Image ID="Image11" runat="server" Height="15px" ImageUrl="~/Images/Rojo.jpg" />
            </td>
          
        </tr>
        <tr >
            <td colspan="4" 
              
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridEstancia" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="105%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                       
                         <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Documento" HeaderText="Documento" ReadOnly="True" SortExpression="Documento" />
						  <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Orden" HeaderText="Orden" 
                            SortExpression="Orden" >
                        </asp:BoundField>
                       

                         <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                            SortExpression="Codigo" >
                        </asp:BoundField>
                         <asp:BoundField DataField="Examen" HeaderText="Examen" 
                            SortExpression="Examen" >
                        </asp:BoundField>
                       
                         <asp:BoundField DataField="Fecha_Solicitud"   HeaderText="Fecha_Solicitud" SortExpression="Fecha_Solicitud" />
                             <asp:BoundField DataField="Fec_Llega_Lab" HeaderText="Fec_Llega_Lab" SortExpression="Fec_Llega_Lab" ReadOnly="True" />
							                              <asp:BoundField DataField="SOL-LAB" HeaderText="SOL-LAB Min" SortExpression="SOL-LAB" ReadOnly="True" />
                        <asp:BoundField DataField="User Valida" HeaderText="Bacteriologo Valida" SortExpression="User Valida" ReadOnly="True" /> 
                 
                        
                         <asp:BoundField DataField="Fecha_Bacteriologo"  HeaderText="Fecha_Bacteriologo" ReadOnly="True" SortExpression="Fecha_Bacteriologo" />
                            <asp:BoundField DataField="LAB-BAC" HeaderText="LAB-BAC Min" SortExpression="LAB-BAC" ReadOnly="True" />
                        <asp:BoundField DataField="Fecha_Interpretacion"  HeaderText="Fecha_Interpretacion" ReadOnly="True" SortExpression="Fecha_Interpretacion" /> 
                       <asp:BoundField DataField="BAC-INTERPRETACION" HeaderText="BAC-INTER Min" SortExpression="BAC-INTERPRETACION" ReadOnly="True" />
                          <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                     
                        
                          <asp:BoundField DataField="Cama" HeaderText="Cama" ReadOnly="True" SortExpression="Cama" />
                          <asp:BoundField DataField="Grupo" HeaderText="Grupo" ReadOnly="True" SortExpression="Grupo" />
						
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
 SelectCommand="select distinct HCNSOLEXA.oid,
ADNINGRESO.AINCONSEC AS Ingreso,
CONVERT(varchar,HCNSOLEXA.HCSFECSOL,121)  AS Fecha_Solicitud, 
GENSERIPS.SIPCODIGO as Codigo,
GENSERIPS.SIPNOMBRE As Examen,
LBNORDCAB.ORDCONSEC AS Orden,
EXAFECING as 'FECHA EN LA QUE SE INGRESO EL EXAMEN',
CONVERT(varchar,LBNORDMUE.MUEFECTOM,121)  AS Fec_Llega_Lab, 
 DATEDIFF(MINUTE, HCNSOLEXA.HCSFECSOL, LBNORDMUE.MUEFECTOM) as 'SOL-LAB',
GENUSUARIO.USUNOMBRE AS 'User Valida',
CONVERT(varchar,LBNORDDET.FECVALIDA,121)   AS Fecha_Bacteriologo,
 DATEDIFF(MINUTE, LBNORDMUE.MUEFECTOM,LBNORDDET.FECVALIDA) as 'LAB-BAC',
HCNRESEXA.HCRDESCRIP AS Examen_DESCRIPCIÓN,
CONVERT(varchar,HCNRESEXA.HCRFECINT,121)   AS Fecha_Interpretacion, 
DATEDIFF(MINUTE,LBNORDDET.FECVALIDA,HCNRESEXA.HCRFECINT) as 'BAC-INTERPRETACION',
GENPACIEN.PACNUMDOC AS Documento,
GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente,
case when LBNORDDET.EXAESTADO=0 then 'Proceso' when LBNORDDET.EXAESTADO=1 then 'Pendiente' when LBNORDDET.EXAESTADO=2 then 'Validado' when LBNORDDET.EXAESTADO=3 then 'Anulado' end Estado,
CASE WHEN HCACODIGO IS NULL THEN 'Urgencias' ELSE HCACODIGO END AS Cama,
RIGHT (HPNDEFCAM.HCACODIGO, 2) AS Grupo 
 FROM         HCNSOLEXA INNER JOIN ADNINGRESO ON  HCNSOLEXA.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS=GENSERIPS.OID left JOIN LBNORDDET ON  HCNSOLEXA.OID =LBNORDDET.HCNSOLEXA1 INNER JOIN LBNEXAMEN ON LBNORDDET.LBNEXAMEN=LBNEXAMEN.OID left JOIN LBNORDMUE ON LBNORDDET.OID = LBNORDMUE.LBNORDDET left JOIN   LBNORDCAB ON LBNORDDET.LBNORDCAB=LBNORDCAB.OID left JOIN HCNRESEXA ON LBNORDDET.OID=HCNRESEXA.LBNORDDET INNER JOIN GENPACIEN  ON ADNINGRESO.GENPACIEN=GENPACIEN.OID inner join HCNFOLIO on HCNSOLEXA.HCNFOLIO=HCNFOLIO.OID LEFT OUTER JOIN HPNDEFCAM ON HCNFOLIO.HPNDEFCAM = HPNDEFCAM.OID LEFT OUTER JOIN HPNGRUPOS ON HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID LEFT OUTER JOIN GENUSUARIO ON LBNORDDET.USUVALIDA=GENUSUARIO.OID where  (HCNSOLEXA.HCSFECSOL BETWEEN @res AND @res2 + ' 23:59:59') AND adningreso.ADNCENATE=1 order by HCNSOLEXA.OID desc ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="res" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" Name="res2" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td class="auto-style9">
                          
                            Ing Diego A.</td>
                        <td>
                            &nbsp;</td>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">

        <strong>
        Ingreso Actual: <asp:Label ID="Ingreso1" runat="server" CssClass="auto-style12"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        </strong>
        <asp:SqlDataSource ID="Folmedi" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT HCNFOLIO.OID AS Folio, HCNFOLIO.HCNUMFOL AS Folios, HCNFOLIO.HCFECFOL AS Fecha, ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Nombre FROM HCNMEDPAC INNER JOIN HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.AINCONSEC = @ingreso) ORDER BY Folio DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Ingreso1" Name="ingreso" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button2" runat="server" Text="Regresar" Enabled="true" />
        <br />
        <br />
       <strong><asp:Label ID="Folio1" runat="server" Visible="true" CssClass="auto-style14"></asp:Label>
        </strong><br />
        <div>
           
            <br />
            <asp:SqlDataSource ID="Medicamento" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT HCNFOLIO.HCNUMFOL AS Folio, INNPRODUC.IPRDESCOR AS Nombre, HCNMEDPAC.HCSOBSERV AS Observacion, HCNMEDPAC.HCSFECSOL AS Fecha, HCNMEDPAC.HCSCANTI AS Cantidad, CAST(ROUND(HCNMEDPAC.HCSCANRES, 0, 0) AS INT) AS Suministrado FROM HCNMEDPAC INNER JOIN HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN INNPRODUC ON HCNMEDPAC.INNPRODUC = INNPRODUC.OID WHERE (HCNFOLIO.OID = @idfolio) ORDER BY Folio desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Folio1" Name="idfolio" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Medicamento" BorderColor="Black" BorderStyle="Solid" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cant" />
                    <asp:BoundField DataField="Suministrado" HeaderText="Sumi" ReadOnly="True" SortExpression="Suministrado" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Folio" DataSourceID="Folmedi" BorderColor="Black" BorderStyle="Solid" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" BorderColor="Black" />
                <Columns>
                    <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                    <asp:BoundField DataField="Folios" HeaderText="Folios" SortExpression="Folios" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                  
                    <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                </Columns>
            </asp:GridView>
            <div class="auto-style8">
                Ing Diego A<br />
            </div>
        </div>
        <div class="auto-style11">
            <br />
            <br />
        </div>





    </asp:Panel>

</asp:Content>


